@implementation VFXWorld

+ (VFXWorld)worldWithMDLAsset:(id)a3
{
  return (VFXWorld *)MEMORY[0x1E0DE7D20](a1, sel_worldWithMDLAsset_options_, a3, 0);
}

- (void)loadMDLAsset:(id)a3 options:(id)a4 context:(id)a5
{
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  float v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  int v99;
  int v100;
  int v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  double v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  double v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  double v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  double v157;
  double v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  double v177;
  double v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  double v202;
  double v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  double v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  double v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  double v263;
  double v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  double v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  double v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  char *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  int v294;
  const char *v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  double *v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  void *v311;
  void *v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  void *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  double v330;
  double v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  double v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  double v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  const char *v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  double v379;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  double v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t k;
  const char *v398;
  uint64_t *v399;
  void *v400;
  uint64_t *v401;
  uint64_t *v402;
  BOOL v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  void *v416;
  id v417;
  VFXWorld *v418;
  unsigned int v419;
  char *v421;
  id obj;
  id v423;
  uint64_t v424;
  uint64_t v425;
  int v426;
  uint64_t v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  uint64_t *v445;
  _QWORD *v446[2];
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  void *v451;
  void *v452;
  void *memptr;
  _BYTE v454[128];
  _BYTE v455[128];
  _BYTE v456[128];
  _BYTE v457[128];
  uint64_t v458;

  v458 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v421 = (char *)objc_opt_new();
  obj = (id)objc_opt_new();
  v446[0] = 0;
  v446[1] = 0;
  v445 = (uint64_t *)v446;
  v441 = 0u;
  v442 = 0u;
  v443 = 0u;
  v444 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v441, (uint64_t)v456, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v442;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v442 != v12)
          objc_enumerationMutation(a3);
        v14 = objc_msgSend_nodeWithMDLObject_masterObjects_worldNodes_skinnedMeshes_skelNodesMap_asset_options_context_(VFXNode, v10, *(_QWORD *)(*((_QWORD *)&v441 + 1) + 8 * i), (uint64_t)v8, v421, obj, &v445, a3, a4, a5);
        v18 = (void *)objc_msgSend_rootNode(self, v15, v16, v17);
        objc_msgSend_addChildNode_(v18, v19, v14, v20);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v10, (uint64_t)&v441, (uint64_t)v456, 16);
    }
    while (v11);
  }

  v439 = 0u;
  v440 = 0u;
  v437 = 0u;
  v438 = 0u;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v437, (uint64_t)v455, 16);
  v26 = v421;
  if (v25)
  {
    v27 = *(_QWORD *)v438;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v438 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v437 + 1) + 8 * j);
        v30 = objc_msgSend_path(v29, v22, v23, v24);
        v33 = (void *)objc_msgSend_objectForKeyedSubscript_(v421, v31, v30, v32);
        if (v33)
          objc_msgSend__addSkinnerWithMDLMesh_worldNodes_(v33, v22, (uint64_t)v29, (uint64_t)v421);
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v437, (uint64_t)v455, 16);
    }
    while (v25);
  }
  v34 = (void *)objc_msgSend_animations(a3, v22, v23, v24);
  if (objc_msgSend_count(v34, v35, v36, v37))
  {
    v42 = (void *)objc_opt_new();
    v43 = 0;
    v418 = self;
    v416 = v42;
    v427 = *MEMORY[0x1E0CD2B58];
    v417 = a3;
    while (1)
    {
      v44 = (void *)objc_msgSend_animations(a3, v39, v40, v41);
      if (v43 >= objc_msgSend_count(v44, v45, v46, v47))
        break;
      v50 = (void *)objc_msgSend_animations(a3, v38, v48, v49);
      v53 = (void *)objc_msgSend_objectAtIndexedSubscript_(v50, v51, v43, v52);
      if (v53)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v432 = v53;
          v54 = (void *)objc_msgSend_jointPaths(v53, v39, v40, v41);
          v426 = objc_msgSend_count(v54, v55, v56, v57);
          if (v426)
          {
            v58 = (void *)objc_msgSend_valueForKey_(a4, v39, (uint64_t)CFSTR("kSceneSourceAnimationLoadingMode"), v41);
            v62 = v58;
            if (v58)
            {
              if ((objc_msgSend_isEqualToString_(v58, v59, (uint64_t)CFSTR("playOnce"), v61) & 1) != 0)
              {
                v419 = 1;
                v63 = 0.0;
              }
              else
              {
                v419 = 0;
                if (objc_msgSend_isEqualToString_(v62, v59, (uint64_t)CFSTR("keepSeparate"), v61))
                  v63 = 0.0;
                else
                  v63 = INFINITY;
              }
            }
            else
            {
              v419 = 0;
              v63 = INFINITY;
            }
            v452 = 0;
            memptr = 0;
            v451 = 0;
            v64 = (void *)objc_msgSend_translations(v432, v59, v60, v61);
            v429 = (void *)objc_msgSend_keyTimes(v64, v65, v66, v67);
            v71 = (void *)objc_msgSend_rotations(v432, v68, v69, v70);
            v431 = (void *)objc_msgSend_keyTimes(v71, v72, v73, v74);
            v78 = (void *)objc_msgSend_scales(v432, v75, v76, v77);
            v430 = (void *)objc_msgSend_keyTimes(v78, v79, v80, v81);
            v85 = v431 != 0;
            if (v429)
              ++v85;
            if (v430)
              v86 = v85 + 1;
            else
              v86 = v85;
            v87 = objc_msgSend_count(v429, v82, v83, v84);
            v91 = objc_msgSend_count(v431, v88, v89, v90);
            v98 = objc_msgSend_count(v430, v92, v93, v94);
            v99 = v87 * v426;
            if (v429)
              malloc_type_posix_memalign(&memptr, 0x10uLL, 16 * v99, 0x1000040451B5BE8uLL);
            v100 = v91 * v426;
            if (v431)
              malloc_type_posix_memalign(&v452, 0x10uLL, 16 * v100, 0x1000040451B5BE8uLL);
            v101 = v98 * v426;
            if (v430)
              malloc_type_posix_memalign(&v451, 0x10uLL, 16 * v101, 0x1000040451B5BE8uLL);
            if (memptr)
            {
              v102 = (void *)objc_msgSend_translations(v432, v95, v96, v97);
              objc_msgSend_getFloat3Array_maxCount_(v102, v103, (uint64_t)memptr, v99);
            }
            if (v452)
            {
              v104 = (void *)objc_msgSend_rotations(v432, v95, v96, v97);
              objc_msgSend_getFloatQuaternionArray_maxCount_(v104, v105, (uint64_t)v452, v100);
            }
            if (v451)
            {
              v106 = (void *)objc_msgSend_scales(v432, v95, v96, v97);
              objc_msgSend_getFloat3Array_maxCount_(v106, v107, (uint64_t)v451, v101);
            }
            v108 = (void *)objc_msgSend_translations(v432, v95, v96, v97);
            objc_msgSend_maximumTime(v108, v109, v110, v111);
            v113 = v112;
            v117 = (void *)objc_msgSend_translations(v432, v114, v115, v116);
            objc_msgSend_minimumTime(v117, v118, v119, v120);
            v122 = v121;
            v126 = (void *)objc_msgSend_rotations(v432, v123, v124, v125);
            objc_msgSend_maximumTime(v126, v127, v128, v129);
            v131 = v130;
            v135 = (void *)objc_msgSend_rotations(v432, v132, v133, v134);
            objc_msgSend_minimumTime(v135, v136, v137, v138);
            v140 = v139;
            v144 = (void *)objc_msgSend_scales(v432, v141, v142, v143);
            objc_msgSend_maximumTime(v144, v145, v146, v147);
            v149 = v148;
            v153 = (void *)objc_msgSend_scales(v432, v150, v151, v152);
            objc_msgSend_minimumTime(v153, v154, v155, v156);
            v158 = v157;
            v159 = (void *)MEMORY[0x1E0C99DE8];
            v163 = (void *)objc_msgSend_jointPaths(v432, v160, v161, v162);
            v167 = objc_msgSend_count(v163, v164, v165, v166);
            v428 = (void *)objc_msgSend_arrayWithCapacity_(v159, v168, v167 * v86, v169);
            v449 = 0u;
            v450 = 0u;
            v447 = 0u;
            v448 = 0u;
            v173 = (void *)objc_msgSend_jointPaths(v432, v170, v171, v172);
            v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v174, (uint64_t)&v447, (uint64_t)v457, 16);
            v177 = v113 - v122;
            v178 = v131 - v140;
            if (v175)
            {
              LODWORD(v179) = 0;
              v423 = v173;
              v424 = *(_QWORD *)v448;
              do
              {
                v180 = 0;
                v179 = (int)v179;
                v181 = 16 * (int)v179;
                v425 = v175;
                do
                {
                  if (*(_QWORD *)v448 != v424)
                    objc_enumerationMutation(v423);
                  v182 = *(void **)(*((_QWORD *)&v447 + 1) + 8 * v180);
                  if (v429)
                  {
                    v183 = (void *)MEMORY[0x1E0CB3940];
                    v186 = objc_msgSend_rangeOfString_options_(*(void **)(*((_QWORD *)&v447 + 1) + 8 * v180), v176, (uint64_t)CFSTR("/"), 4);
                    v187 = (uint64_t)v182;
                    if (v186 != 0x7FFFFFFFFFFFFFFFLL)
                      v187 = objc_msgSend_substringFromIndex_(v182, v184, v186 + 1, v185);
                    v188 = objc_msgSend_stringWithFormat_(v183, v184, (uint64_t)CFSTR("/%@.position"), v185, v187);
                    v191 = (void *)objc_msgSend_animationWithKeyPath_(MEMORY[0x1E0CD2798], v189, v188, v190);
                    objc_msgSend_setDuration_(v191, v192, v193, v194, v177);
                    v198 = (void *)objc_msgSend_translations(v432, v195, v196, v197);
                    objc_msgSend_minimumTime(v198, v199, v200, v201);
                    v203 = v202;
                    v207 = (void *)objc_msgSend_translations(v432, v204, v205, v206);
                    objc_msgSend_minimumTime(v207, v208, v209, v210);
                    objc_msgSend_setBeginTime_(v191, v212, v213, v214, v203 - v211);
                    v218 = (void *)objc_msgSend_translations(v432, v215, v216, v217);
                    objc_msgSend_minimumTime(v218, v219, v220, v221);
                    v226 = sub_1B183C120(v429, v222, v223, v224, v225, v177);
                    objc_msgSend_setKeyTimes_(v191, v227, (uint64_t)v226, v228);
                    v229 = memptr;
                    v233 = (const char *)objc_msgSend_count(v429, v230, v231, v232);
                    v234 = sub_1B183C28C((uint64_t)v229, v233, v426, v179);
                    objc_msgSend_setValues_(v191, v235, (uint64_t)v234, v236);
                    objc_msgSend_setFillMode_(v191, v237, v427, v238);
                    objc_msgSend_setRemovedOnCompletion_(v191, v239, 0, v240);
                    objc_msgSend_addObject_(v428, v241, (uint64_t)v191, v242);
                  }
                  if (v431)
                  {
                    v243 = (void *)MEMORY[0x1E0CD2798];
                    v244 = (void *)MEMORY[0x1E0CB3940];
                    v247 = objc_msgSend_rangeOfString_options_(v182, v176, (uint64_t)CFSTR("/"), 4);
                    v248 = (uint64_t)v182;
                    if (v247 != 0x7FFFFFFFFFFFFFFFLL)
                      v248 = objc_msgSend_substringFromIndex_(v182, v245, v247 + 1, v246);
                    v249 = objc_msgSend_stringWithFormat_(v244, v245, (uint64_t)CFSTR("/%@.orientation"), v246, v248);
                    v252 = (void *)objc_msgSend_animationWithKeyPath_(v243, v250, v249, v251);
                    objc_msgSend_setDuration_(v252, v253, v254, v255, v178);
                    v259 = (void *)objc_msgSend_rotations(v432, v256, v257, v258);
                    objc_msgSend_minimumTime(v259, v260, v261, v262);
                    v264 = v263;
                    v268 = (void *)objc_msgSend_rotations(v432, v265, v266, v267);
                    objc_msgSend_minimumTime(v268, v269, v270, v271);
                    objc_msgSend_setBeginTime_(v252, v273, v274, v275, v264 - v272);
                    v279 = (void *)objc_msgSend_rotations(v432, v276, v277, v278);
                    objc_msgSend_minimumTime(v279, v280, v281, v282);
                    v287 = sub_1B183C120(v431, v283, v284, v285, v286, v178);
                    objc_msgSend_setKeyTimes_(v252, v288, (uint64_t)v287, v289);
                    v290 = (char *)v452;
                    v294 = objc_msgSend_count(v431, v291, v292, v293);
                    v300 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v295, v294, v296);
                    if (v294 >= 1)
                    {
                      v301 = (double *)&v290[v181];
                      do
                      {
                        v302 = objc_msgSend_valueWithVFXFloat4_(MEMORY[0x1E0CB3B18], v297, v298, v299, *v301);
                        objc_msgSend_addObject_(v300, v303, v302, v304);
                        v301 += 2 * v426;
                        --v294;
                      }
                      while (v294);
                    }
                    objc_msgSend_setValues_(v252, v297, (uint64_t)v300, v299);
                    objc_msgSend_setFillMode_(v252, v305, v427, v306);
                    objc_msgSend_setRemovedOnCompletion_(v252, v307, 0, v308);
                    objc_msgSend_addObject_(v428, v309, (uint64_t)v252, v310);
                  }
                  if (v430)
                  {
                    v311 = (void *)MEMORY[0x1E0CD2798];
                    v312 = (void *)MEMORY[0x1E0CB3940];
                    v313 = objc_msgSend_rangeOfString_options_(v182, v176, (uint64_t)CFSTR("/"), 4);
                    if (v313 != 0x7FFFFFFFFFFFFFFFLL)
                      v182 = (void *)objc_msgSend_substringFromIndex_(v182, v314, v313 + 1, v315);
                    v316 = objc_msgSend_stringWithFormat_(v312, v314, (uint64_t)CFSTR("/%@.scale"), v315, v182);
                    v319 = (void *)objc_msgSend_animationWithKeyPath_(v311, v317, v316, v318);
                    objc_msgSend_setDuration_(v319, v320, v321, v322, v149 - v158);
                    v326 = (void *)objc_msgSend_scales(v432, v323, v324, v325);
                    objc_msgSend_minimumTime(v326, v327, v328, v329);
                    v331 = v330;
                    v335 = (void *)objc_msgSend_scales(v432, v332, v333, v334);
                    objc_msgSend_minimumTime(v335, v336, v337, v338);
                    objc_msgSend_setBeginTime_(v319, v340, v341, v342, v331 - v339);
                    v346 = (void *)objc_msgSend_scales(v432, v343, v344, v345);
                    objc_msgSend_minimumTime(v346, v347, v348, v349);
                    v354 = sub_1B183C120(v430, v350, v351, v352, v353, v149 - v158);
                    objc_msgSend_setKeyTimes_(v319, v355, (uint64_t)v354, v356);
                    v357 = v451;
                    v361 = (const char *)objc_msgSend_count(v430, v358, v359, v360);
                    v362 = sub_1B183C28C((uint64_t)v357, v361, v426, v179);
                    objc_msgSend_setValues_(v319, v363, (uint64_t)v362, v364);
                    objc_msgSend_setFillMode_(v319, v365, v427, v366);
                    objc_msgSend_setRemovedOnCompletion_(v319, v367, 0, v368);
                    objc_msgSend_addObject_(v428, v369, (uint64_t)v319, v370);
                  }
                  ++v179;
                  ++v180;
                  v181 += 16;
                }
                while (v180 != v425);
                v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(v423, v176, (uint64_t)&v447, (uint64_t)v457, 16);
              }
              while (v175);
            }
            free(memptr);
            free(v452);
            free(v451);
            a3 = v417;
            self = v418;
            v26 = v421;
            v42 = v416;
            v374 = (void *)objc_msgSend_animation(MEMORY[0x1E0CD2700], v371, v372, v373);
            objc_msgSend_setAnimations_(v374, v375, (uint64_t)v428, v376);
            objc_msgSend_setFillMode_(v374, v377, v427, v378);
            *(float *)&v379 = v63;
            objc_msgSend_setRepeatCount_(v374, v380, v381, v382, v379);
            objc_msgSend_setRemovedOnCompletion_(v374, v383, v419, v384);
            if (v177 >= v178)
              v388 = v177;
            else
              v388 = v178;
            if (v388 < v149 - v158)
              v388 = v149 - v158;
            objc_msgSend_setDuration_(v374, v385, v386, v387, v388);
            if (v374)
            {
              v389 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v39, (uint64_t)v374, v41);
              v393 = objc_msgSend_name(v432, v390, v391, v392);
              objc_msgSend_setObject_forKeyedSubscript_(v416, v394, v389, v393);
            }
          }
        }
      }
      ++v43;
    }
  }
  else
  {
    v42 = 0;
  }
  v435 = 0u;
  v436 = 0u;
  v433 = 0u;
  v434 = 0u;
  v395 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v38, (uint64_t)&v433, (uint64_t)v454, 16);
  if (v395)
  {
    v396 = *(_QWORD *)v434;
    do
    {
      for (k = 0; k != v395; ++k)
      {
        if (*(_QWORD *)v434 != v396)
          objc_enumerationMutation(a3);
        sub_1B1833180(*(void **)(*((_QWORD *)&v433 + 1) + 8 * k), v26, (uint64_t)a3, v42, &v445);
      }
      v395 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v398, (uint64_t)&v433, (uint64_t)v454, 16);
    }
    while (v395);
  }
  v399 = v445;
  if (v445 != (uint64_t *)v446)
  {
    do
    {
      v400 = (void *)v399[5];
      if (v400)

      v401 = (uint64_t *)v399[1];
      if (v401)
      {
        do
        {
          v402 = v401;
          v401 = (uint64_t *)*v401;
        }
        while (v401);
      }
      else
      {
        do
        {
          v402 = (uint64_t *)v399[2];
          v403 = *v402 == (_QWORD)v399;
          v399 = v402;
        }
        while (!v403);
      }
      v399 = v402;
    }
    while (v402 != (uint64_t *)v446);
  }
  if (v42)

  objc_msgSend_startTime(a3, v404, v405, v406);
  objc_msgSend_setStartTime_(self, v407, v408, v409);
  objc_msgSend_endTime(a3, v410, v411, v412);
  objc_msgSend_setEndTime_(self, v413, v414, v415);
  sub_1B183C9F4(v446[0]);
}

+ (VFXWorld)worldWithMDLAsset:(id)a3 options:(id)a4
{
  VFXWorld *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  v6 = (VFXWorld *)objc_alloc_init((Class)a1);
  v10 = objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
  objc_msgSend_loadMDLAsset_options_context_(v6, v11, (uint64_t)a3, (uint64_t)a4, v10);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  __CFDictionary *Mutable;
  VFXBidirectionalRemapTable *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const void *v127;
  const void *Value;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const void *v140;
  const void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  double v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  int v168;
  int v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  double v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  double v185;
  double v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  double v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  _QWORD v305[5];
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  const __CFString *v317;
  _QWORD v318[2];

  v318[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, (uint64_t)a3, v3);
  v11 = sub_1B187B004((uint64_t)self->_world, 2, v5, v6, v7, v8, v9, v10);
  v12 = objc_alloc((Class)objc_opt_class());
  v317 = CFSTR("kWorldInitOptionForAuthoring");
  v318[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v13, v11, v14);
  v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v318, (uint64_t)&v317, 1);
  v19 = (void *)objc_msgSend_initWithOptions_(v12, v17, v16, v18);
  objc_msgSend_lock(v19, v20, v21, v22);
  v26 = objc_msgSend_assetPathResolver(self, v23, v24, v25);
  objc_msgSend_setAssetPathResolver_(v19, v27, v26, v28);
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  v30 = objc_alloc_init(VFXBidirectionalRemapTable);
  v34 = (void *)objc_msgSend_assetRegistry(self, v31, v32, v33);
  v38 = (void *)objc_msgSend_rootNode(v34, v35, v36, v37);
  v42 = (void *)objc_msgSend_childNodes(v38, v39, v40, v41);
  v46 = (void *)objc_msgSend_assetRegistry(v19, v43, v44, v45);
  v50 = (char *)objc_msgSend_rootNode(v46, v47, v48, v49);
  v310 = 0u;
  v311 = 0u;
  v312 = 0u;
  v313 = 0u;
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v51, (uint64_t)&v310, (uint64_t)v316, 16);
  if (v52)
  {
    v56 = v52;
    v57 = *(_QWORD *)v311;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v311 != v57)
          objc_enumerationMutation(v42);
        sub_1B189F100(*(void **)(*((_QWORD *)&v310 + 1) + 8 * v58++), v50, Mutable, v30);
      }
      while (v56 != v58);
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v59, (uint64_t)&v310, (uint64_t)v316, 16);
    }
    while (v56);
  }
  v60 = (void *)objc_msgSend_rootNode(self, v53, v54, v55);
  v63 = objc_msgSend__deepCloneWithRemapTableOut_(v60, v61, (uint64_t)Mutable, v62);
  objc_msgSend_setRootNode_(v19, v64, v63, v65);
  v69 = (void *)objc_msgSend_physicsWorld(self, v66, v67, v68);
  v73 = (void *)objc_msgSend_physicsJoints(v69, v70, v71, v72);
  v306 = 0u;
  v307 = 0u;
  v308 = 0u;
  v309 = 0u;
  v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v306, (uint64_t)v315, 16);
  if (v75)
  {
    v79 = v75;
    v80 = *(_QWORD *)v307;
    do
    {
      v81 = 0;
      do
      {
        if (*(_QWORD *)v307 != v80)
          objc_enumerationMutation(v73);
        v82 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v306 + 1) + 8 * v81), v76, v77, v78);
        objc_msgSend_retargetWithRemapTable_(v82, v83, (uint64_t)Mutable, v84);
        v88 = (void *)objc_msgSend_physicsWorld(v19, v85, v86, v87);
        objc_msgSend_addPhysicsJoint_(v88, v89, (uint64_t)v82, v90);

        ++v81;
      }
      while (v79 != v81);
      v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v76, (uint64_t)&v306, (uint64_t)v315, 16);
    }
    while (v79);
  }
  v91 = (void *)objc_msgSend_background(v19, v76, v77, v78);
  v95 = objc_msgSend_background(self, v92, v93, v94);
  objc_msgSend_copyPropertiesFrom_(v91, v96, v95, v97);
  v101 = (void *)objc_msgSend_lightingEnvironment(v19, v98, v99, v100);
  v105 = objc_msgSend_lightingEnvironment(self, v102, v103, v104);
  objc_msgSend_copyPropertiesFrom_(v101, v106, v105, v107);
  v111 = (void *)objc_msgSend_rootNode(v19, v108, v109, v110);
  v305[0] = MEMORY[0x1E0C809B0];
  v305[1] = 3221225472;
  v305[2] = sub_1B189F2A0;
  v305[3] = &unk_1E63D7E58;
  v305[4] = Mutable;
  objc_msgSend_enumerateHierarchyUsingBlock_(v111, v112, (uint64_t)v305, v113);
  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)sub_1B189F480, v30);
  v117 = (void *)objc_msgSend_scene(v19, v114, v115, v116);
  objc_msgSend_remapEntityReferences_(v117, v118, (uint64_t)v30, v119);
  v123 = (void *)objc_msgSend_background(v19, v120, v121, v122);
  v127 = (const void *)objc_msgSend_contents(v123, v124, v125, v126);
  Value = CFDictionaryGetValue(Mutable, v127);
  if (Value)
  {
    v132 = (uint64_t)Value;
    v133 = (void *)objc_msgSend_background(v19, v129, v130, v131);
    objc_msgSend_setContents_(v133, v134, v132, v135);
  }
  v136 = (void *)objc_msgSend_lightingEnvironment(v19, v129, v130, v131);
  v140 = (const void *)objc_msgSend_contents(v136, v137, v138, v139);
  v141 = CFDictionaryGetValue(Mutable, v140);
  if (v141)
  {
    v145 = (uint64_t)v141;
    v146 = (void *)objc_msgSend_lightingEnvironment(v19, v142, v143, v144);
    objc_msgSend_setContents_(v146, v147, v145, v148);
  }
  v149 = (void *)objc_msgSend_physicsWorld(self, v142, v143, v144);
  objc_msgSend_gravity(v149, v150, v151, v152);
  v300 = v153;
  v157 = (void *)objc_msgSend_physicsWorld(v19, v154, v155, v156);
  objc_msgSend_setGravity_(v157, v158, v159, v160, v300);
  v164 = (void *)objc_msgSend_physicsWorld(self, v161, v162, v163);
  objc_msgSend_speed(v164, v165, v166, v167);
  v169 = v168;
  v173 = (void *)objc_msgSend_physicsWorld(v19, v170, v171, v172);
  LODWORD(v174) = v169;
  objc_msgSend_setSpeed_(v173, v175, v176, v177, v174);
  v181 = (void *)objc_msgSend_physicsWorld(self, v178, v179, v180);
  objc_msgSend_timeStep(v181, v182, v183, v184);
  v186 = v185;
  v190 = (void *)objc_msgSend_physicsWorld(v19, v187, v188, v189);
  objc_msgSend_setTimeStep_(v190, v191, v192, v193, v186);
  objc_msgSend_endTime(self, v194, v195, v196);
  objc_msgSend_setEndTime_(v19, v197, v198, v199);
  objc_msgSend_startTime(self, v200, v201, v202);
  objc_msgSend_setStartTime_(v19, v203, v204, v205);
  objc_msgSend_fogStartDistance(self, v206, v207, v208);
  objc_msgSend_setFogStartDistance_(v19, v209, v210, v211);
  objc_msgSend_fogEndDistance(self, v212, v213, v214);
  objc_msgSend_setFogEndDistance_(v19, v215, v216, v217);
  objc_msgSend_fogDensityExponent(self, v218, v219, v220);
  objc_msgSend_setFogDensityExponent_(v19, v221, v222, v223);
  v227 = objc_msgSend_fogColor(self, v224, v225, v226);
  objc_msgSend_setFogColor_(v19, v228, v227, v229);
  v233 = objc_msgSend_wantsScreenSpaceReflection(self, v230, v231, v232);
  objc_msgSend_setWantsScreenSpaceReflection_(v19, v234, v233, v235);
  v239 = objc_msgSend_screenSpaceReflectionSampleCount(self, v236, v237, v238);
  objc_msgSend_setScreenSpaceReflectionSampleCount_(v19, v240, v239, v241);
  objc_msgSend_screenSpaceReflectionMaximumDistance(self, v242, v243, v244);
  objc_msgSend_setScreenSpaceReflectionMaximumDistance_(v19, v245, v246, v247);
  objc_msgSend_screenSpaceReflectionStride(self, v248, v249, v250);
  objc_msgSend_setScreenSpaceReflectionStride_(v19, v251, v252, v253);
  v303 = 0u;
  v304 = 0u;
  v301 = 0u;
  v302 = 0u;
  v257 = (void *)objc_msgSend_stateManager(self, v254, v255, v256);
  v261 = (void *)objc_msgSend_states(v257, v258, v259, v260);
  v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v262, (uint64_t)&v301, (uint64_t)v314, 16);
  if (v263)
  {
    v267 = v263;
    v268 = *(_QWORD *)v302;
    do
    {
      v269 = 0;
      do
      {
        if (*(_QWORD *)v302 != v268)
          objc_enumerationMutation(v261);
        v270 = *(_QWORD *)(*((_QWORD *)&v301 + 1) + 8 * v269);
        v271 = (void *)objc_msgSend_stateManager(v19, v264, v265, v266);
        objc_msgSend_addState_(v271, v272, v270, v273);
        ++v269;
      }
      while (v267 != v269);
      v267 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v264, (uint64_t)&v301, (uint64_t)v314, 16);
    }
    while (v267);
  }
  v274 = objc_msgSend_defaultRenderGraph(self, v264, v265, v266);
  objc_msgSend_setDefaultRenderGraph_(v19, v275, v274, v276);
  v280 = objc_msgSend_behaviorGraph(self, v277, v278, v279);
  objc_msgSend_setBehaviorGraph_(v19, v281, v280, v282);
  objc_msgSend_unlock(v19, v283, v284, v285);
  objc_msgSend_unlock(self, v286, v287, v288);
  objc_msgSend_flush(VFXTransaction, v289, v290, v291);
  v295 = (void *)objc_msgSend_presentationScene(v19, v292, v293, v294);
  objc_msgSend_prepare(v295, v296, v297, v298);
  CFRelease(Mutable);

  return v19;
}

- (void)setBehaviorGraph:(id)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[6];

  v6 = (id)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    objc_msgSend_willBeRemovedFromWorld_(v6, v7, (uint64_t)self, v8);

    self->_behaviorGraph = (VFXBehaviorGraph *)a3;
    objc_msgSend_wasAddedToWorld_(a3, v9, (uint64_t)self, v10);
    v14 = objc_msgSend_worldRef(self, v11, v12, v13);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B189F5B4;
    v16[3] = &unk_1E63D53C8;
    v16[4] = self;
    v16[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  return self->_behaviorGraph;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);
  sub_1B193E6E0(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (id)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  return sub_1B193E67C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)stopReplication
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  _QWORD v27[5];

  if (!sub_1B187B004((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled"), v10, v11, v12, v13, v14, v15, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  v16 = objc_msgSend_scene(self, v9, v10, v11);
  v20 = objc_msgSend_presentationScene(self, v17, v18, v19);
  objc_msgSend_stopReplicationWithModel_runtime_(_TtC3VFX8VFXScene, v21, v16, v20);
  v25 = objc_msgSend_worldRef(self, v22, v23, v24);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1B189F704;
  v27[3] = &unk_1E63D5378;
  v27[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v26, v25, (uint64_t)self, v27);

  self->_modelToPresentationRemapTable = 0;
}

- (void)cloneModelToPresentationAndStartReplicationStream
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
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
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  if (!sub_1B187B004((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled"), v9, v10, v11, v12, v13, v14, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  prof_beginFlame((uint64_t)"-[VFXWorld cloneModelToPresentationAndStartReplicationStream]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXWorld.m", 332);
  v18 = objc_msgSend_worldRef(self, v15, v16, v17);
  if (v18)
  {
    v26 = v18;
    sub_1B187973C(v18, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
    self->_modelToPresentationRemapTable = (VFXBidirectionalRemapTable *)(id)objc_msgSend_cloneAndSetupReplicationWithModelWorld_(_TtC3VFX8VFXScene, v27, (uint64_t)self, v28);
    v32 = objc_msgSend_worldRef(self, v29, v30, v31);
    sub_1B187C1A8(v32, self->_modelToPresentationRemapTable, v33, v34, v35, v36, v37, v38);
    sub_1B18797B4(v26, v39, v40, v41, v42, v43, v44, v45);
  }
  else
  {
    self->_modelToPresentationRemapTable = (VFXBidirectionalRemapTable *)(id)objc_msgSend_cloneAndSetupReplicationWithModelWorld_(_TtC3VFX8VFXScene, v19, (uint64_t)self, v21);
    v49 = objc_msgSend_worldRef(self, v46, v47, v48);
    sub_1B187C1A8(v49, self->_modelToPresentationRemapTable, v50, v51, v52, v53, v54, v55);
  }
  prof_endFlame();
}

- (void)startRuntimeThread
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = objc_msgSend_worldRef(self, a2, v2, v3);
  v12 = (void *)sub_1B187A9C4(v4, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_startRuntimeThread(v12, v13, v14, v15);
}

- (id)remapTable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!sub_1B187B004((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled"), v9, v10, v11, v12, v13, v14, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  return self->_modelToPresentationRemapTable;
}

- (VFXWorld)initWithOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const void *v19;
  VFXClock *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  VFXTriggerManager *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
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
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  objc_super v81;

  v81.receiver = self;
  v81.super_class = (Class)VFXWorld;
  v6 = -[VFXWorld init](&v81, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v4, (uint64_t)CFSTR("VFXWorldLoaderDisableVFXCoreSupport"), v5);
    if (v7)
    {
      v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);
      v12 = v11 ^ 1;
    }
    else
    {
      v11 = 0;
      v12 = 1;
    }
    v13 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v8, (uint64_t)CFSTR("kWorldInitOptionForAuthoring"), v10);
    if (objc_msgSend_BOOLValue(v13, v14, v15, v16))
      v12 |= 2u;
    v19 = (const void *)objc_msgSend_objectForKeyedSubscript_(a3, v17, (uint64_t)CFSTR("VFXWorldLoaderOptionMetalLibraryURL"), v18);
    *((_QWORD *)v6 + 1) = sub_1B187A598(v12, v19);
    v20 = objc_alloc_init(VFXClock);
    *((_QWORD *)v6 + 22) = v20;
    objc_msgSend_setWorld_(v20, v21, *((_QWORD *)v6 + 1), v22);
    v30 = *((_QWORD *)v6 + 1);
    if ((v11 & 1) != 0)
    {
      if (v30)
        sub_1B193E768(v30, v6, v24, v25, v26, v27, v28, v29);
      objc_msgSend__syncObjCModel(v6, v23, v24, v25);
    }
    else
    {
      *((_QWORD *)v6 + 26) = sub_1B18D2A54(v30, (uint64_t)v23, v24, v25, v26, v27, v28, v29);
      v38 = *((_QWORD *)v6 + 1);
      if (v38)
        sub_1B193E768(v38, v6, v32, v33, v34, v35, v36, v37);
      objc_msgSend__syncObjCModel(v6, v31, v32, v33);
      objc_msgSend_cloneModelToPresentationAndStartReplicationStream(v6, v39, v40, v41);
    }
    v42 = objc_alloc_init(VFXTriggerManager);
    *((_QWORD *)v6 + 30) = v42;
    objc_msgSend_setWorld_(v42, v43, (uint64_t)v6, v44);
    if (!*((_QWORD *)v6 + 8))
    {
      v48 = objc_msgSend_worldRef(v6, v45, v46, v47);
      v56 = v48;
      if (v48)
        sub_1B187973C(v48, v49, v50, v51, v52, v53, v54, v55);
      if (!*((_QWORD *)v6 + 8))
      {
        v57 = *((_QWORD *)v6 + 1);
        if (v57)
        {
          sub_1B187973C(v57, v49, v50, v51, v52, v53, v54, v55);
          v66 = sub_1B187A934(*((_QWORD *)v6 + 1), v58, v59, v60, v61, v62, v63, v64);
          if (v66)
          {
            v68 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v65, v66, v67);
            *((_QWORD *)v6 + 8) = v68;
            objc_msgSend_setWorld_(v68, v69, (uint64_t)v6, v70);
          }
          else
          {
            v78 = objc_msgSend_node(VFXNode, v65, 0, v67);
            objc_msgSend__setRootNode_immediate_(v6, v79, v78, 1);
          }
          sub_1B18797B4(*((_QWORD *)v6 + 1), v71, v72, v73, v74, v75, v76, v77);
        }
      }
      if (v56)
        sub_1B18797B4(v56, v49, v50, v51, v52, v53, v54, v55);
    }
  }
  return (VFXWorld *)v6;
}

- (VFXWorld)init
{
  uint64_t v2;

  return (VFXWorld *)objc_msgSend_initWithOptions_(self, a2, 0, v2);
}

- (VFXWorld)initWithWorldRef:(__CFXWorld *)a3
{
  id v4;
  CFTypeRef v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)VFXWorld;
  v4 = -[VFXWorld init](&v44, sel_init);
  if (v4)
  {
    v5 = CFRetain(a3);
    *((_QWORD *)v4 + 1) = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    if (!*((_QWORD *)v4 + 8))
    {
      v20 = *((_QWORD *)v4 + 1);
      if (v20)
      {
        sub_1B187973C(v20, v13, v14, v15, v16, v17, v18, v19);
        v29 = sub_1B187A934(*((_QWORD *)v4 + 1), v21, v22, v23, v24, v25, v26, v27);
        if (v29)
        {
          v31 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v28, v29, v30);
          *((_QWORD *)v4 + 8) = v31;
          objc_msgSend_setWorld_(v31, v32, (uint64_t)v4, v33);
        }
        else
        {
          v41 = objc_msgSend_node(VFXNode, v28, 0, v30);
          objc_msgSend__setRootNode_immediate_(v4, v42, v41, 1);
        }
        sub_1B18797B4(*((_QWORD *)v4 + 1), v34, v35, v36, v37, v38, v39, v40);
      }
    }
  }
  return (VFXWorld *)v4;
}

- (void)_syncObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
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
  const char *v70;
  uint64_t v71;

  if (sub_1B187B004((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7))
  {
    v16 = (void *)sub_1B181FEE0((uint64_t)self->_coreEntityManager);
    self->_assetPathResolver = (VFXAssetPathResolver *)(id)objc_msgSend_assetManager(v16, v17, v18, v19);
  }
  self->_fogStartDistance = sub_1B187B428((uint64_t)self->_world, v9, v10, v11, v12, v13, v14, v15);
  self->_fogEndDistance = sub_1B187B38C((uint64_t)self->_world, v20, v21, v22, v23, v24, v25, v26);
  self->_fogDensityExponent = sub_1B187B2F0((uint64_t)self->_world, v27, v28, v29, v30, v31, v32, v33);
  self->_wantsScreenSpaceReflection = sub_1B187B5FC((uint64_t)self->_world, v34, v35, v36, v37, v38, v39, v40);
  self->_screenSpaceReflectionSampleCount = sub_1B187B6C4((uint64_t)self->_world, v41, v42, v43, v44, v45, v46, v47);
  self->_screenSpaceReflectionMaxRayDistance = sub_1B187B758((uint64_t)self->_world, v48, v49, v50, v51, v52, v53, v54);
  self->_screenSpaceReflectionStride = sub_1B187B7F4((uint64_t)self->_world, v55, v56, v57, v58, v59, v60, v61);
  v69 = sub_1B187B514((uint64_t)self->_world, v62, v63, v64, v65, v66, v67, v68);

  self->_fogColor = (id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v70, v69, v71);
}

+ (id)world
{
  return objc_alloc_init((Class)a1);
}

+ (id)worldNamed:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_worldNamed_inDirectory_options_, a3, 0);
}

+ (id)worldNamed:(id)a3 inDirectory:(id)a4 options:(id)a5
{
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  id result;
  const char *v24;

  v9 = (__CFString *)objc_msgSend_pathExtension(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v13 = objc_msgSend_length(v9, v10, v11, v12);
  if (!v13)
    v9 = CFSTR("vfx");
  v17 = (void *)VFXGetResourceBundle(v13, v14, v15, v16);
  v21 = objc_msgSend_stringByDeletingPathExtension(a3, v18, v19, v20);
  result = (id)objc_msgSend_URLForResource_withExtension_subdirectory_(v17, v22, v21, (uint64_t)v9, a4);
  if (result)
    return (id)objc_msgSend_worldWithURL_options_error_(a1, v24, (uint64_t)result, (uint64_t)a5, 0);
  return result;
}

+ (id)worldNamed:(id)a3 options:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_worldNamed_inDirectory_options_, a3, 0);
}

- (BOOL)load:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v8 = objc_msgSend_URLByResolvingSymlinksInPath(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v18 = CFSTR("url");
  v19[0] = v8;
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v19, (uint64_t)&v18, 1);
  objc_msgSend_setValue_forKey_(VFXTransaction, v11, v10, (uint64_t)CFSTR("VFXWorldLoadingContextKey"));
  v15 = (void *)objc_msgSend_loader(VFXWorldLoader, v12, v13, v14);
  return objc_msgSend_loadURL_into_options_statusHandler_error_(v15, v16, v8, (uint64_t)self, a4, 0, a5);
}

- (BOOL)reloadFromURL:(id)a3 error:(id *)a4
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  if (!a3)
    return 0;
  if (self->_remotePreviewDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_reloadWorld_withUpdatedWorldAtURL_(self->_remotePreviewDelegate, a2, (uint64_t)self, (uint64_t)a3);
    return 1;
  }
  else
  {
    v8 = (void *)objc_msgSend_rootNode(self, a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_removeAllChilds(v8, v9, v10, v11);
    v15 = (void *)objc_msgSend_loader(VFXWorldLoader, v12, v13, v14);
    return objc_msgSend_loadURL_into_options_statusHandler_error_(v15, v16, (uint64_t)a3, (uint64_t)self, 0, 0, a4);
  }
}

+ (VFXWorld)worldWithURL:(id)a3 options:(id)a4 transferringConfigurationFrom:(id)a5 error:(id *)a6
{
  VFXWorld *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v7 = (VFXWorld *)objc_msgSend_worldWithURL_options_error_(VFXWorld, a2, (uint64_t)a3, (uint64_t)a4, a6);
  v11 = objc_msgSend_remoteEditionEndpoint(a5, v8, v9, v10);
  objc_msgSend_setRemoteEditionEndpoint_(v7, v12, v11, v13);
  v17 = objc_msgSend_allowRemoteEdition(a5, v14, v15, v16);
  objc_msgSend_setAllowRemoteEdition_(v7, v18, v17, v19);
  return v7;
}

+ (VFXWorld)worldWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  VFXWorld *v8;
  const char *v9;
  uint64_t v10;
  VFXWorld *v11;
  const char *v12;
  VFXWorld *v13;

  v8 = [VFXWorld alloc];
  v11 = (VFXWorld *)(id)objc_msgSend_initWithOptions_(v8, v9, (uint64_t)a4, v10);
  v13 = v11;
  if (a3 && !objc_msgSend_load_options_error_(v11, v12, (uint64_t)a3, (uint64_t)a4, a5))
    return 0;
  return v13;
}

+ (VFXWorld)worldWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  VFXWorld *v8;
  const char *v9;
  uint64_t v10;
  VFXWorld *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v8 = [VFXWorld alloc];
  v11 = (VFXWorld *)(id)objc_msgSend_initWithOptions_(v8, v9, (uint64_t)a4, v10);
  v15 = (void *)objc_msgSend_loader(VFXWorldLoader, v12, v13, v14);
  objc_msgSend_loadData_into_options_statusHandler_error_(v15, v16, (uint64_t)a3, (uint64_t)v11, a4, 0, a5);
  return v11;
}

+ (VFXWorld)worldWithWorldRef:(__CFXWorld *)a3
{
  VFXWorld *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXWorld *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXWorld *)(id)objc_msgSend_initWithWorldRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

- (void)_clearWorldRef
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXWorld *world;
  __CFXWorld *v10;

  world = self->_world;
  if (world)
  {
    sub_1B193E768((uint64_t)world, 0, v2, v3, v4, v5, v6, v7);
    v10 = self->_world;
    if (v10)
      CFRelease(v10);
    self->_world = 0;
  }
}

- (double)upAxis
{
  return 0.0078125;
}

- (void)setUpAxis:(VFXWorld *)self
{
  NSLog(CFSTR("setting up axis is unsupported"), a2);
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFXWorld *world;
  __CFXWorld *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t i;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  __CFXCoreEntityManager *coreEntityManager;
  objc_super v29;
  _QWORD v30[5];

  objc_msgSend_setWorld_(self->_rootNode, a2, 0, v2);
  objc_msgSend_worldWillDie(self->_physicsWorld, v4, v5, v6);
  world = self->_world;
  if (world)
  {
    sub_1B193E768((uint64_t)world, 0, v8, v9, v10, v11, v12, v13);
    v15 = self->_world;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B18A0198;
    v30[3] = &unk_1E63D4AB0;
    v30[4] = v15;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v16, 0, 0, v30);
  }
  objc_msgSend_setWorld_(self->_assetRegistry, v7, 0, v9);

  self->_assetRegistry = 0;
  for (i = 72; i != 104; i += 8)
  {
    objc_msgSend_setWorld_(*(void **)((char *)&self->super.isa + i), v17, 0, v18);

  }
  objc_msgSend_parentWillDie_(self->_background, v20, (uint64_t)self, v21);

  objc_msgSend_parentWillDie_(self->_environment, v22, (uint64_t)self, v23);
  objc_msgSend_setWorld_(self->_clock, v24, 0, v25);

  objc_msgSend_setWorld_(self->_stateManager, v26, 0, v27);
  coreEntityManager = self->_coreEntityManager;
  if (coreEntityManager)
  {
    CFRelease(coreEntityManager);
    self->_coreEntityManager = 0;
  }

  v29.receiver = self;
  v29.super_class = (Class)VFXWorld;
  -[VFXWorld dealloc](&v29, sel_dealloc);
}

- (id)assetPathResolver
{
  return self->_assetPathResolver;
}

- (void)setAssetPathResolver:(id)a3
{
  VFXAssetPathResolver *assetPathResolver;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  assetPathResolver = self->_assetPathResolver;
  if (assetPathResolver != a3)
  {

    self->_assetPathResolver = (VFXAssetPathResolver *)a3;
    v6 = (void *)sub_1B181FEE0((uint64_t)self->_coreEntityManager);
    objc_msgSend_setAssetManager_(v6, v7, (uint64_t)a3, v8);
    v16 = sub_1B187AA20((uint64_t)self->_world, v9, v10, v11, v12, v13, v14, v15);
    v17 = (void *)sub_1B181FEE0(v16);
    objc_msgSend_setAssetManager_(v17, v18, (uint64_t)a3, v19);
  }
}

- (id)_worlds
{
  uint64_t v2;

  return (id)objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], a2, (uint64_t)self, v2);
}

- (__CFXWorld)worldRef
{
  return self->_world;
}

- (id)root
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  if ((byte_1EEF65F38 & 1) == 0)
  {
    byte_1EEF65F38 = 1;
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: [VFXWorld root] is deprecated, use rootNode instead"), v2, v3, v4, v5, v6, v7, v10);
  }
  return (id)objc_msgSend_rootNode(self, a2, v2, v3);
}

- (VFXNode)rootNode
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFXWorld *world;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  VFXNode *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;

  if (!self->_rootNode)
  {
    v5 = objc_msgSend_worldRef(self, a2, v2, v3);
    v13 = v5;
    if (v5)
      sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
    if (!self->_rootNode)
    {
      world = self->_world;
      if (world)
      {
        sub_1B187973C((uint64_t)world, v6, v7, v8, v9, v10, v11, v12);
        v23 = sub_1B187A934((uint64_t)self->_world, v15, v16, v17, v18, v19, v20, v21);
        if (v23)
        {
          v25 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v22, v23, v24);
          self->_rootNode = v25;
          objc_msgSend_setWorld_(v25, v26, (uint64_t)self, v27);
        }
        else
        {
          v35 = objc_msgSend_node(VFXNode, v22, 0, v24);
          objc_msgSend__setRootNode_immediate_(self, v36, v35, 1);
        }
        sub_1B18797B4((uint64_t)self->_world, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    if (v13)
      sub_1B18797B4(v13, v6, v7, v8, v9, v10, v11, v12);
  }
  return self->_rootNode;
}

- (void)_setRootNode:(id)a3 immediate:(BOOL)a4
{
  VFXNode *rootNode;
  _BOOL4 v6;
  VFXNode *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFXWorld *world;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
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
  const char *v42;
  __CFXWorld *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[6];

  rootNode = self->_rootNode;
  if (rootNode != a3)
  {
    v6 = a4;
    objc_msgSend_setWorld_(rootNode, a2, 0, a4);

    v8 = (VFXNode *)a3;
    self->_rootNode = v8;
    objc_msgSend_setWorld_(v8, v9, (uint64_t)self, v10);

    self->_layerRootNode[0] = (VFXNode *)a3;
    if (v6)
    {
      v14 = objc_msgSend_worldRef(self, v11, v12, v13);
      if (v14)
      {
        v22 = v14;
        sub_1B187973C(v14, (uint64_t)v15, v16, v17, v18, v19, v20, v21);
        world = self->_world;
        v27 = (uint64_t *)objc_msgSend_nodeRef(a3, v24, v25, v26);
        sub_1B187A780((uint64_t)world, v27, v28, v29, v30, v31, v32, v33);
        sub_1B18797B4(v22, v34, v35, v36, v37, v38, v39, v40);
      }
      else
      {
        v43 = self->_world;
        v44 = (uint64_t *)objc_msgSend_nodeRef(a3, v15, v16, v17);
        sub_1B187A780((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
    else
    {
      v41 = objc_msgSend_worldRef(self, v11, v12, v13);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = sub_1B18A0454;
      v51[3] = &unk_1E63D53C8;
      v51[4] = self;
      v51[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v42, v41, 0, v51);
    }
  }
}

- (void)setRootNode:(id)a3
{
  objc_msgSend__setRootNode_immediate_(self, a2, (uint64_t)a3, 0);
}

- (void)setRootNode:(id)a3 forLayer:(int)a4
{
  VFXNode **layerRootNode;
  VFXNode *v6;
  VFXNode *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFXWorld *world;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
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
  __CFXWorld *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  layerRootNode = self->_layerRootNode;
  v6 = self->_layerRootNode[a4];
  if (v6 != a3)
  {
    if (a4)
    {
      objc_msgSend_setWorld_(v6, a2, 0, *(uint64_t *)&a4);

      v9 = (VFXNode *)a3;
      layerRootNode[a4] = v9;
      objc_msgSend_setWorld_(v9, v10, (uint64_t)self, v11);
      v15 = objc_msgSend_worldRef(self, v12, v13, v14);
      if (v15)
      {
        v23 = v15;
        sub_1B187973C(v15, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
        world = self->_world;
        v28 = (void *)objc_msgSend_nodeRef(a3, v25, v26, v27);
        sub_1B187BE64((uint64_t)world, a4, v28, v29, v30, v31, v32, v33);
        sub_1B18797B4(v23, v34, v35, v36, v37, v38, v39, v40);
      }
      else
      {
        v41 = self->_world;
        v42 = (void *)objc_msgSend_nodeRef(a3, v16, v17, v18);
        sub_1B187BE64((uint64_t)v41, a4, v42, v43, v44, v45, v46, v47);
      }
    }
    else
    {
      objc_msgSend__setRootNode_immediate_(self, a2, (uint64_t)a3, 0);
    }
  }
}

- (id)rootNodeForLayer:(int)a3
{
  return self->_layerRootNode[a3];
}

- (id)assetRegistry
{
  id result;
  VFXAssetRegistry *v4;
  const char *v5;
  uint64_t v6;

  result = self->_assetRegistry;
  if (!result)
  {
    v4 = objc_alloc_init(VFXAssetRegistry);
    self->_assetRegistry = v4;
    objc_msgSend_setWorld_(v4, v5, (uint64_t)self, v6);
    return self->_assetRegistry;
  }
  return result;
}

- (_opaque_pthread_mutex_t)mutex
{
  return (_opaque_pthread_mutex_t *)sub_1B187ADB8((uint64_t)self->_world);
}

- (id)defaultRenderGraph
{
  return self->_defaultRenderGraph;
}

- (void)setDefaultRenderGraph:(id)a3
{
  VFXRenderGraph *defaultRenderGraph;

  defaultRenderGraph = self->_defaultRenderGraph;
  if (defaultRenderGraph != a3)
  {

    self->_defaultRenderGraph = (VFXRenderGraph *)a3;
  }
}

- (void)_scaleWorldBy:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B18A06A0;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
}

+ (BOOL)canImportFileUTI:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("org.khronos.collada.digital-asset-exchange"), v3) & 1) != 0)
    return 1;
  else
    return objc_msgSend_hasPrefix_(a3, v5, (uint64_t)CFSTR("com.apple.vfx"), v6);
}

+ (BOOL)canImportFileExtension:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v4 = (void *)objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3, v3);
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("dae"), v6) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v7, (uint64_t)CFSTR("vfx-world"), v8) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v9, (uint64_t)CFSTR("vfxz-world"), v10) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v11, (uint64_t)CFSTR("scn"), v12) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v13, (uint64_t)CFSTR("scnz"), v14) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v15, (uint64_t)CFSTR("c3d"), v16) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend_canImportFileExtension_(MEMORY[0x1E0CC7780], v17, (uint64_t)v4, v18);
  }
}

+ (id)supportedFileUTIsForImport
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  objc_msgSend_addObjectsFromArray_(v4, v5, (uint64_t)&unk_1E6478B50, v6);
  return v4;
}

+ (id)supportedFileUTIsForExport
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  objc_msgSend_addObjectsFromArray_(v4, v5, (uint64_t)&unk_1E6478B68, v6);
  return v4;
}

- (VFXPhysicsWorld)physicsWorld
{
  uint64_t v2;

  return (VFXPhysicsWorld *)objc_msgSend__physicsWorldCreateIfNeeded_(self, a2, 1, v2);
}

- (id)_physicsWorldCreateIfNeeded:(BOOL)a3
{
  id result;
  BOOL v5;
  VFXPhysicsWorld *v6;
  const char *v7;
  uint64_t v8;

  result = self->_physicsWorld;
  if (result)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = [VFXPhysicsWorld alloc];
    result = (id)objc_msgSend_initWithWorld_(v6, v7, (uint64_t)self, v8);
    self->_physicsWorld = (VFXPhysicsWorld *)result;
  }
  return result;
}

- (double)startTime
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B187AAB0((uint64_t)self->_world, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B187AAB0((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setStartTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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

  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    v15 = v7;
    sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
    sub_1B187AB40((uint64_t)self->_world, a3, v16, v17, v18, v19, v20, v21, v22);
    sub_1B18797B4(v15, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    sub_1B187AB40((uint64_t)self->_world, a3, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (double)endTime
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B187AAF8((uint64_t)self->_world, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B187AAF8((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setEndTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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

  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    v15 = v7;
    sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
    sub_1B187AB94((uint64_t)self->_world, a3, v16, v17, v18, v19, v20, v21, v22);
    sub_1B18797B4(v15, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    sub_1B187AB94((uint64_t)self->_world, a3, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (double)frameRate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    v13 = v5;
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
    v21 = sub_1B187ABE8((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    return sub_1B187ABE8((uint64_t)self->_world, v6, v7, v8, v9, v10, v11, v12);
  }
  return v21;
}

- (void)setFrameRate:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
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
  float v31;

  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    v15 = v7;
    sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
    v16 = a3;
    sub_1B187AC30((uint64_t)self->_world, v16, v17, v18, v19, v20, v21, v22, v23);
    sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    v31 = a3;
    sub_1B187AC30((uint64_t)self->_world, v31, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (float)playbackSpeed
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v5)
    return sub_1B187AC84((uint64_t)self->_world, v6, v7, v8, v9, v10, v11, v12);
  v13 = v5;
  sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v21 = sub_1B187AC84((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
  sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v21;
}

- (void)setPlaybackSpeed:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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

  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    v15 = v7;
    sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
    sub_1B187ACCC((uint64_t)self->_world, a3, v16, v17, v18, v19, v20, v21, v22);
    sub_1B18797B4(v15, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    sub_1B187ACCC((uint64_t)self->_world, a3, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (VFXMaterialProperty)background
{
  VFXMaterialProperty *result;
  VFXMaterialProperty *v4;
  const char *v5;

  result = self->_background;
  if (!result)
  {
    v4 = [VFXMaterialProperty alloc];
    result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v4, v5, (uint64_t)self, 23);
    self->_background = result;
  }
  return result;
}

- (VFXMaterialProperty)lightingEnvironment
{
  VFXMaterialProperty *result;
  VFXMaterialProperty *v4;
  const char *v5;

  result = self->_environment;
  if (!result)
  {
    v4 = [VFXMaterialProperty alloc];
    result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v4, v5, (uint64_t)self, 24);
    self->_environment = result;
  }
  return result;
}

- (BOOL)_allowsDefaultLightingEnvironmentFallback
{
  return self->_allowsDefaultLightingEnvironmentFallback;
}

- (void)set_allowsDefaultLightingEnvironmentFallback:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_allowsDefaultLightingEnvironmentFallback != a3)
  {
    self->_allowsDefaultLightingEnvironmentFallback = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18A0C9C;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, 0, v8);
  }
}

- (id)authoringEnvironment2
{
  return self->_authoringEnvironment2;
}

- (void)setAuthoringEnvironment2:(id)a3
{
  VFXAuthoringEnvironment2 *authoringEnvironment2;

  authoringEnvironment2 = self->_authoringEnvironment2;
  if (authoringEnvironment2 != a3)
  {

    self->_authoringEnvironment2 = (VFXAuthoringEnvironment2 *)a3;
  }
}

- (id)fogColor
{
  return self->_fogColor;
}

- (void)setFogColor:(id)a3
{
  uint64_t v3;
  id fogColor;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  fogColor = self->_fogColor;
  if (fogColor != a3 && (objc_msgSend_isEqual_(a3, a2, (uint64_t)fogColor, v3) & 1) == 0)
  {

    self->_fogColor = a3;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B18A0DAC;
    v12[3] = &unk_1E63D53C8;
    v12[4] = a3;
    v12[5] = self;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("fogColor"), v12);
  }
}

- (double)fogColor_linearExtendedSRGB
{
  const void *v4;

  v4 = (const void *)objc_msgSend_fogColor(a1, a2, a3, a4);
  return sub_1B18BCF48(v4);
}

- (void)setFogColor_linearExtendedSRGB:(VFXWorld *)self
{
  float32x4_t v2;
  CGColorRef v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v4 = sub_1B179D614(v2);
  v7 = objc_msgSend_colorWithCGColor_(MEMORY[0x1E0DC3658], v5, (uint64_t)v4, v6);
  objc_msgSend_setFogColor_(self, v8, v7, v9);
  if (v4)
    CFRelease(v4);
}

- (float)fogEndDistance
{
  return self->_fogEndDistance;
}

- (void)setFogEndDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (a3 >= 1.0e-35)
    v5 = a3;
  else
    v5 = 0.0;
  if (v5 != self->_fogEndDistance)
  {
    self->_fogEndDistance = v5;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18A0F10;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("fogEndDistance"), v9);
  }
}

- (float)fogDensityExponent
{
  return self->_fogDensityExponent;
}

- (void)setFogDensityExponent:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_fogDensityExponent != a3)
  {
    self->_fogDensityExponent = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18A0FC8;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("fogDensityExponent"), v9);
  }
}

- (float)fogStartDistance
{
  return self->_fogStartDistance;
}

- (void)setFogStartDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_fogStartDistance != a3)
  {
    self->_fogStartDistance = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18A1080;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("fogStartDistance"), v9);
  }
}

- (BOOL)wantsScreenSpaceReflection
{
  return self->_wantsScreenSpaceReflection;
}

- (void)setWantsScreenSpaceReflection:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_wantsScreenSpaceReflection != a3)
  {
    self->_wantsScreenSpaceReflection = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18A1130;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)screenSpaceReflectionSampleCount
{
  return self->_screenSpaceReflectionSampleCount;
}

- (void)setScreenSpaceReflectionSampleCount:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_screenSpaceReflectionSampleCount != a3)
  {
    self->_screenSpaceReflectionSampleCount = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18A11DC;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)screenSpaceReflectionDepthThreshold
{
  return 0.0;
}

- (float)screenSpaceReflectionMaximumDistance
{
  return self->_screenSpaceReflectionMaxRayDistance;
}

- (void)setScreenSpaceReflectionMaximumDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_screenSpaceReflectionMaxRayDistance != a3)
  {
    self->_screenSpaceReflectionMaxRayDistance = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18A1298;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (float)screenSpaceReflectionStride
{
  return self->_screenSpaceReflectionStride;
}

- (void)setScreenSpaceReflectionStride:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_screenSpaceReflectionStride != a3)
  {
    self->_screenSpaceReflectionStride = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18A1348;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (id)dataRepresentationWithOptions:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t active;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int isEqualToString;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  id result;

  v6 = (void *)objc_msgSend_stateManager(self, a2, (uint64_t)a3, v3);
  active = objc_msgSend_activeState(v6, v7, v8, v9);
  if (active)
  {
    v14 = (void *)objc_msgSend_stateManager(self, v10, v11, v12);
    objc_msgSend_setActiveState_(v14, v15, 0, v16);
  }
  v17 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v10, (uint64_t)CFSTR("VFXWorldExportPresentationTree"), v12);
  v21 = objc_msgSend_BOOLValue(v17, v18, v19, v20);
  v24 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, v22, (uint64_t)CFSTR("kWorldSourceFormat"), v23);
  isEqualToString = objc_msgSend_isEqualToString_(v24, v25, (uint64_t)CFSTR("vfxz-world"), v26);
  if (v21)
  {
    v31 = objc_msgSend_worldRef(self, v27, v28, v29);
    v38 = v31;
    if (v31)
      sub_1B187973C(v31, (uint64_t)v27, v32, v33, v34, v35, v36, v37);
  }
  else
  {
    v38 = 0;
  }
  v46 = (void *)objc_msgSend_archivedDataWithRootObject_options_(VFXKeyedArchiver, v27, (uint64_t)self, (uint64_t)a3);
  v47 = v21 ^ 1;
  if (!v38)
    v47 = 1;
  if ((v47 & 1) == 0)
    sub_1B18797B4(v38, (uint64_t)v39, v40, v41, v42, v43, v44, v45);
  if (active)
  {
    v48 = (void *)objc_msgSend_stateManager(self, v39, v40, v41);
    objc_msgSend_setActiveState_(v48, v49, active, v50);
  }
  result = v46;
  if (isEqualToString)
    return (id)objc_msgSend_vfx_compressedDataUsingCompressionAlgorithm_(v46, v39, 517, v41);
  return result;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 progressHandler:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  __CFString **v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  char v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  const char *v44;
  _QWORD *v45;
  BOOL v46;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[6];
  char v51[15];
  char v52;

  if (a4)
    v8 = (id)objc_msgSend_mutableCopy(a4, a2, (uint64_t)a3, (uint64_t)a4);
  else
    v8 = (id)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, (uint64_t)a3, 0);
  v11 = v8;
  v15 = (void *)objc_msgSend_valueForKey_(v8, v9, (uint64_t)CFSTR("kWorldSourceFormat"), v10);
  if (!v15)
  {
    v16 = (void *)objc_msgSend_pathExtension(a3, v12, v13, v14);
    v20 = (void *)objc_msgSend_lowercaseString(v16, v17, v18, v19);
    if ((objc_msgSend_isEqualToString_(v20, v21, (uint64_t)CFSTR("plist"), v22) & 1) != 0
      || (objc_msgSend_isEqualToString_(v20, v12, (uint64_t)CFSTR("vfx-world"), v14) & 1) != 0)
    {
      v23 = VFXWorldLoaderFormatVFX;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v20, v12, (uint64_t)CFSTR("vfxz-world"), v14))
      {
        v15 = 0;
        goto LABEL_10;
      }
      v23 = VFXWorldLoaderFormatVFXZ;
    }
    v15 = *v23;
    if (*v23)
      objc_msgSend_setValue_forKey_(v11, v12, (uint64_t)*v23, (uint64_t)CFSTR("kWorldSourceFormat"));
  }
LABEL_10:
  v52 = 0;
  if ((objc_msgSend_isEqualToString_(v15, v12, (uint64_t)CFSTR("vfx-world"), v14) & 1) != 0
    || objc_msgSend_isEqualToString_(v15, v24, (uint64_t)CFSTR("vfxz-world"), v25))
  {
    v27 = (void *)objc_msgSend_dataRepresentationWithOptions_(self, v24, (uint64_t)v11, v25);
    *(_QWORD *)v51 = 0;
    v29 = objc_msgSend_writeToURL_options_error_(v27, v28, (uint64_t)a3, 1, v51);
    goto LABEL_27;
  }
  v30 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = sub_1B18A1758;
  v50[3] = &unk_1E63D8000;
  v50[4] = v15;
  v50[5] = a3;
  if (v15)
  {
    if ((objc_msgSend_isEqualToString_(v15, v24, (uint64_t)CFSTR("usd"), v25) & 1) == 0
      && (objc_msgSend_isEqualToString_(v15, v31, (uint64_t)CFSTR("usda"), v32) & 1) == 0
      && (objc_msgSend_isEqualToString_(v15, v33, (uint64_t)CFSTR("usdc"), v32) & 1) == 0
      && (objc_msgSend_isEqualToString_(v15, v34, (uint64_t)CFSTR("usdz"), v32) & 1) == 0)
    {
LABEL_31:
      if (!NSClassFromString(CFSTR("MDLAsset")))
        return 0;
      *(_QWORD *)v51 = 0;
      v48[0] = v30;
      v48[1] = 3221225472;
      v48[2] = sub_1B18A1880;
      v48[3] = &unk_1E63D8028;
      v48[4] = self;
      v45 = v48;
      goto LABEL_26;
    }
  }
  else
  {
    v35 = (void *)objc_msgSend_pathExtension(a3, v24, v26, v25);
    v39 = (void *)objc_msgSend_lowercaseString(v35, v36, v37, v38);
    if ((objc_msgSend_isEqualToString_(v39, v40, (uint64_t)CFSTR("usd"), v41) & 1) == 0
      && (objc_msgSend_isEqualToString_(v39, v42, (uint64_t)CFSTR("usda"), v32) & 1) == 0
      && (objc_msgSend_isEqualToString_(v39, v43, (uint64_t)CFSTR("usdc"), v32) & 1) == 0
      && !objc_msgSend_isEqualToString_(v39, v44, (uint64_t)CFSTR("usdz"), v32))
    {
      goto LABEL_31;
    }
  }
  *(_QWORD *)v51 = 0;
  v49[0] = v30;
  v49[1] = 3221225472;
  v49[2] = sub_1B18A1874;
  v49[3] = &unk_1E63D8028;
  v49[4] = self;
  v45 = v49;
LABEL_26:
  v29 = sub_1B18A1758((uint64_t)v50, v51, (uint64_t)v45, v32);
LABEL_27:
  v46 = v29;
  if (a5)
    (*((void (**)(id, _QWORD, char *, float))a5 + 2))(a5, *(_QWORD *)v51, &v52, 1.0);
  return v46;
}

- (void)_dumpToDisk
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2, v3);
  v9 = (void *)objc_msgSend_temporaryDirectory(v5, v6, v7, v8);
  v15 = (void *)objc_msgSend_path(v9, v10, v11, v12);
  v16 = 0;
  do
  {
    v17 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("worldDump%d.vfx"), v14, v16);
    v20 = objc_msgSend_stringByAppendingPathComponent_(v15, v18, v17, v19);
    v16 = (v16 + 1);
    v24 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v21, v22, v23);
  }
  while ((objc_msgSend_fileExistsAtPath_(v24, v25, v20, v26) & 1) != 0);
  NSLog(CFSTR("dumping world to %@"), v20);
  v29 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v27, v20, v28);
  MEMORY[0x1E0DE7D20](self, sel_writeToURL_options_progressHandler_, v29, 0);
}

- (void)lock
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v4)
    sub_1B187973C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)unlock
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v4)
    sub_1B18797B4(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFXWorld *world;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  VFXNode *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int hasPrefix;
  VFXNode *rootNode;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __CFXWorld *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  VFXNode *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id result;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;

  v80 = 0;
  v81 = 0;
  sub_1B18BCE30(a3, (char *)&v81, &v80, (uint64_t)a4);
  if (objc_msgSend_isEqual_(v81, v7, (uint64_t)CFSTR("root"), v8))
  {
    if (!self->_rootNode)
    {
      v12 = objc_msgSend_worldRef(self, v9, v10, v11);
      v19 = v12;
      if (v12)
        sub_1B187973C(v12, (uint64_t)v9, v13, v14, v15, v16, v17, v18);
      if (!self->_rootNode)
      {
        world = self->_world;
        if (world)
        {
          sub_1B187973C((uint64_t)world, (uint64_t)v9, v13, v14, v15, v16, v17, v18);
          v29 = sub_1B187A934((uint64_t)self->_world, v21, v22, v23, v24, v25, v26, v27);
          if (v29)
          {
            v31 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v28, v29, v30);
            self->_rootNode = v31;
            objc_msgSend_setWorld_(v31, v32, (uint64_t)self, v33);
          }
          else
          {
            v76 = objc_msgSend_node(VFXNode, v28, 0, v30);
            objc_msgSend__setRootNode_immediate_(self, v77, v76, 1);
          }
          sub_1B18797B4((uint64_t)self->_world, v34, v35, v36, v37, v38, v39, v40);
        }
      }
      if (v19)
        sub_1B18797B4(v19, (uint64_t)v9, v13, v14, v15, v16, v17, v18);
    }
    result = self->_rootNode;
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(result, v9, v80, (uint64_t)a4);
  }
  if (objc_msgSend_hasPrefix_(a3, v9, (uint64_t)CFSTR("/"), v11))
  {
    if (!self->_rootNode)
      goto LABEL_14;
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(self->_rootNode, v41, (uint64_t)a3, (uint64_t)a4);
  }
  hasPrefix = objc_msgSend_hasPrefix_(a3, v41, (uint64_t)CFSTR("children["), v43);
  rootNode = self->_rootNode;
  if (hasPrefix)
  {
    if (!rootNode)
    {
LABEL_14:
      v46 = objc_msgSend_worldRef(self, v41, v42, v43);
      v53 = v46;
      if (v46)
        sub_1B187973C(v46, (uint64_t)v41, v47, v48, v49, v50, v51, v52);
      if (!self->_rootNode)
      {
        v54 = self->_world;
        if (v54)
        {
          sub_1B187973C((uint64_t)v54, (uint64_t)v41, v47, v48, v49, v50, v51, v52);
          v63 = sub_1B187A934((uint64_t)self->_world, v55, v56, v57, v58, v59, v60, v61);
          if (v63)
          {
            v65 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v62, v63, v64);
            self->_rootNode = v65;
            objc_msgSend_setWorld_(v65, v66, (uint64_t)self, v67);
          }
          else
          {
            v78 = objc_msgSend_node(VFXNode, v62, 0, v64);
            objc_msgSend__setRootNode_immediate_(self, v79, v78, 1);
          }
          sub_1B18797B4((uint64_t)self->_world, v68, v69, v70, v71, v72, v73, v74);
        }
      }
      if (v53)
        sub_1B18797B4(v53, (uint64_t)v41, v47, v48, v49, v50, v51, v52);
    }
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(self->_rootNode, v41, (uint64_t)a3, (uint64_t)a4);
  }
  result = (id)objc_msgSend_childNodeWithName_recursively_(rootNode, v41, (uint64_t)v81, 1);
  if (result)
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(result, v9, v80, (uint64_t)a4);
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  _QWORD *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;

  if (self->_background == a4)
  {
    v6 = &off_1E63D5E28;
  }
  else
  {
    if (self->_environment != a4)
      return 0;
    v6 = &off_1E63D5E30;
  }
  v7 = (__CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@.%@"), (uint64_t)a4, *v6, a3);
  return sub_1B18C2DEC(self, v7, v8, v9);
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int hasPrefix;
  VFXNode *rootNode;
  void **p_rootNode;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFXWorld *world;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  VFXNode *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id result;
  uint64_t v41;
  const char *v42;

  hasPrefix = objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("/"), v3);
  p_rootNode = (void **)&self->_rootNode;
  rootNode = self->_rootNode;
  if (hasPrefix)
  {
    if (!rootNode)
    {
      v12 = objc_msgSend_worldRef(self, v6, v7, v8);
      v18 = v12;
      if (v12)
        sub_1B187973C(v12, (uint64_t)v6, v13, v8, v14, v15, v16, v17);
      if (!*p_rootNode)
      {
        world = self->_world;
        if (world)
        {
          sub_1B187973C((uint64_t)world, (uint64_t)v6, v13, v8, v14, v15, v16, v17);
          v28 = sub_1B187A934((uint64_t)self->_world, v20, v21, v22, v23, v24, v25, v26);
          if (v28)
          {
            v30 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v27, v28, v29);
            self->_rootNode = v30;
            objc_msgSend_setWorld_(v30, v31, (uint64_t)self, v32);
          }
          else
          {
            v41 = objc_msgSend_node(VFXNode, v27, 0, v29);
            objc_msgSend__setRootNode_immediate_(self, v42, v41, 1);
          }
          sub_1B18797B4((uint64_t)self->_world, v33, v34, v35, v36, v37, v38, v39);
        }
      }
      if (v18)
        sub_1B18797B4(v18, (uint64_t)v6, v13, v8, v14, v15, v16, v17);
    }
  }
  else
  {
    result = (id)objc_msgSend_childNodeWithName_recursively_(rootNode, v6, (uint64_t)a3, 1);
    if (result)
      return result;
    p_rootNode = (void **)&self->_userAttributes;
  }
  return (id)objc_msgSend_valueForKey_(*p_rootNode, v6, (uint64_t)a3, v8);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  objc_msgSend_setValue_forKey_(self->_userAttributes, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)__CFObject
{
  return self->_world;
}

- (VFXClock)clock
{
  return self->_clock;
}

- (id)_nodeWithIndexPath:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v33;

  v5 = (void *)objc_msgSend_rootNode(self, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_length(a3, v6, v7, v8);
  if (v9 >= 1)
  {
    v12 = v9;
    v13 = 0;
    while (1)
    {
      v14 = objc_msgSend_indexAtPosition_(a3, v10, v13, v11);
      v18 = (void *)objc_msgSend_childNodes(v5, v15, v16, v17);
      if (objc_msgSend_count(v18, v19, v20, v21) <= v14)
        break;
      ++v13;
      v29 = (void *)objc_msgSend_childNodes(v5, v22, v23, v24);
      v5 = (void *)objc_msgSend_objectAtIndexedSubscript_(v29, v30, v14, v31);
      if (v12 == v13)
        return v5;
    }
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: _subnodeFromIndexPath - invalid keypath"), v23, v24, v25, v26, v27, v28, v33);
    return 0;
  }
  return v5;
}

+ (id)_indexPathForNode:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  void *v31;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = -1;
  v6 = -8;
  v7 = a3;
  do
  {
    v7 = (void *)objc_msgSend_parentNode(v7, a2, (uint64_t)a3, v3);
    ++v5;
    v6 += 8;
  }
  while (v7);
  if (!v5)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: %@ is not in a world yet"), (uint64_t)a3, v3, v8, v9, v10, v11, (uint64_t)v4);
    return 0;
  }
  v12 = malloc_type_malloc(v6, 0x100004000313F17uLL);
  v16 = (void *)objc_msgSend_parentNode(v4, v13, v14, v15);
  if (!v16)
    goto LABEL_9;
  v24 = v5 + 1;
  do
  {
    v25 = v16;
    v12[v24 - 2] = objc_msgSend_indexOfChildNode_(v16, v17, (uint64_t)v4, v19);
    v16 = (void *)objc_msgSend_parentNode(v25, v26, v27, v28);
    --v24;
    v4 = v25;
  }
  while (v16);
  if (v24 != 1)
LABEL_9:
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. _subnodeIndexPath - unexpected count (hierachy was mutated?)"), v18, v19, v20, v21, v22, v23, (uint64_t)"wr == 0");
  v29 = objc_alloc(MEMORY[0x1E0CB36B0]);
  v31 = (void *)objc_msgSend_initWithIndexes_length_(v29, v30, (uint64_t)v12, v5);
  free(v12);
  return v31;
}

- (id)_subnodeFromIndexPath:(id)a3
{
  if (a3)
    return (id)((uint64_t (*)(id, char *, id))MEMORY[0x1E0DE7D20])(self, sel__nodeWithIndexPath_, a3);
  return self;
}

- (void)prepareForRenderer:(id)a3 progressHandler:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  char v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_7:
      if (!a4)
        return;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB28A8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = CFSTR("unknown renderer type");
      v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v17, (uint64_t)&v16, 1);
      v10 = objc_msgSend_errorWithDomain_code_userInfo_(v11, v14, v12, 3328, v13);
      goto LABEL_9;
    }
    a3 = (id)objc_msgSend_renderer(a3, v7, v8, v9);
  }
  if (!a3)
    goto LABEL_7;
  objc_msgSend_prepareObject_shouldAbortBlock_(a3, v7, (uint64_t)self, 0);
  v10 = 0;
  if (a4)
LABEL_9:
    (*((void (**)(id, uint64_t, char *, float))a4 + 2))(a4, v10, &v15, 1.0);
}

- (id)initForJavascript:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
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
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)VFXWorld;
  v4 = -[VFXWorld init](&v57, sel_init);
  if (v4)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v5, (uint64_t)a3, v6);
        if (!objc_msgSend_scheme(v7, v8, v9, v10))
          v7 = (void *)objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v11, (uint64_t)a3, v12);
      }
      else
      {
        v7 = a3;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend_loader(VFXWorldLoader, v13, v14, v15);
        objc_msgSend_loadURL_into_options_statusHandler_error_(v16, v17, (uint64_t)v7, (uint64_t)v4, 0, 0, 0);
      }
    }
    v18 = sub_1B187A58C();
    *((_QWORD *)v4 + 1) = v18;
    if (v18)
      sub_1B193E768(v18, v4, v20, v21, v22, v23, v24, v25);
    objc_msgSend__syncObjCModel(v4, v19, v20, v21);
    if (!*((_QWORD *)v4 + 8))
    {
      v33 = *((_QWORD *)v4 + 1);
      if (v33)
      {
        sub_1B187973C(v33, v26, v27, v28, v29, v30, v31, v32);
        v42 = sub_1B187A934(*((_QWORD *)v4 + 1), v34, v35, v36, v37, v38, v39, v40);
        if (v42)
        {
          v44 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v41, v42, v43);
          *((_QWORD *)v4 + 8) = v44;
          objc_msgSend_setWorld_(v44, v45, (uint64_t)v4, v46);
        }
        else
        {
          v54 = objc_msgSend_node(VFXNode, v41, 0, v43);
          objc_msgSend__setRootNode_immediate_(v4, v55, v54, 1);
        }
        sub_1B18797B4(*((_QWORD *)v4 + 1), v47, v48, v49, v50, v51, v52, v53);
      }
    }
  }
  return v4;
}

+ (SEL)jsConstructor
{
  return sel_initForJavascript_;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  VFXRenderGraph *defaultRenderGraph;
  VFXBehaviorGraph *behaviorGraph;
  VFXAssetRegistry *assetRegistry;
  VFXPhysicsWorld *physicsWorld;
  VFXNode *rootNode;
  VFXMaterialProperty *background;
  VFXMaterialProperty *environment;
  NSMutableDictionary *userAttributes;
  VFXStateManager *stateManager;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *fogColor;
  const char *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  VFXTriggerManager *triggerManager;

  objc_msgSend_encodeInteger_forKey_(a3, a2, 1, (uint64_t)CFSTR("version"));
  objc_msgSend_endTime(self, v5, v6, v7);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("endTime"), v9);
  objc_msgSend_startTime(self, v10, v11, v12);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("startTime"), v14);
  objc_msgSend_frameRate(self, v15, v16, v17);
  objc_msgSend_encodeDouble_forKey_(a3, v18, (uint64_t)CFSTR("frameRate"), v19);
  defaultRenderGraph = self->_defaultRenderGraph;
  if (defaultRenderGraph)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)defaultRenderGraph, (uint64_t)CFSTR("defaultRenderGraph"));
  behaviorGraph = self->_behaviorGraph;
  if (behaviorGraph)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)behaviorGraph, (uint64_t)CFSTR("behaviorGraph"));
  assetRegistry = self->_assetRegistry;
  if (assetRegistry)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)assetRegistry, (uint64_t)CFSTR("assetRegistry"));
  physicsWorld = self->_physicsWorld;
  if (physicsWorld && (objc_msgSend__isDefault(physicsWorld, v20, (uint64_t)assetRegistry, v21) & 1) == 0)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_physicsWorld, (uint64_t)CFSTR("physicsWorld"));
  rootNode = self->_rootNode;
  if (rootNode)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)rootNode, (uint64_t)CFSTR("rootNode"));
  background = self->_background;
  if (background)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)background, (uint64_t)CFSTR("background"));
  environment = self->_environment;
  if (environment)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)environment, (uint64_t)CFSTR("environment"));
  userAttributes = self->_userAttributes;
  if (userAttributes)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)userAttributes, (uint64_t)CFSTR("userAttributes"));
  stateManager = self->_stateManager;
  if (stateManager)
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)stateManager, (uint64_t)CFSTR("stateManager"));
  objc_msgSend_encodeDouble_forKey_(a3, v20, (uint64_t)CFSTR("fogStartDistance"), v21, self->_fogStartDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v31, (uint64_t)CFSTR("fogEndDistance"), v32, self->_fogEndDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v33, (uint64_t)CFSTR("fogDensityExponent"), v34, self->_fogDensityExponent);
  fogColor = (const char *)self->_fogColor;
  if (fogColor)
    sub_1B18BDAB8(a3, fogColor, (uint64_t)CFSTR("fogColor"));
  objc_msgSend_encodeBool_forKey_(a3, fogColor, self->_wantsScreenSpaceReflection, (uint64_t)CFSTR("wantsScreenSpaceReflection"));
  objc_msgSend_encodeInt_forKey_(a3, v36, LODWORD(self->_screenSpaceReflectionSampleCount), (uint64_t)CFSTR("screenSpaceReflectionSampleCount"));
  *(float *)&v37 = self->_screenSpaceReflectionMaxRayDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v38, (uint64_t)CFSTR("screenSpaceReflectionMaximumDistance"), v39, v37);
  *(float *)&v40 = self->_screenSpaceReflectionStride;
  objc_msgSend_encodeFloat_forKey_(a3, v41, (uint64_t)CFSTR("screenSpaceReflectionStride"), v42, v40);
  triggerManager = self->_triggerManager;
  if (triggerManager)
    objc_msgSend_encodeObject_forKey_(a3, v43, (uint64_t)triggerManager, (uint64_t)CFSTR("triggerManager"));
  sub_1B18BD9B8(a3, self, (uint64_t)triggerManager, v44);
}

- (VFXWorld)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int isEqualToString;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t PathComponent;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  VFXTriggerManager *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  id v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  double v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  double v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  double v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  int v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  id v219;
  const char *v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  objc_super v225;

  v225.receiver = self;
  v225.super_class = (Class)VFXWorld;
  v4 = -[VFXWorld init](&v225, sel_init);
  if (!v4)
    return (VFXWorld *)v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend__allowDecodingCyclesInSecureMode(a3, v5, v6, v7);
  v8 = objc_msgSend_immediateMode(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
  v11 = sub_1B187A58C();
  *((_QWORD *)v4 + 1) = v11;
  *((_QWORD *)v4 + 26) = sub_1B18D2A54(v11, v12, v13, v14, v15, v16, v17, v18);
  v26 = *((_QWORD *)v4 + 1);
  if (v26)
    sub_1B193E768(v26, v4, v20, v21, v22, v23, v24, v25);
  objc_msgSend__syncObjCModel(v4, v19, v20, v21);
  v29 = (void *)objc_msgSend_valueForKey_(VFXTransaction, v27, (uint64_t)CFSTR("VFXWorldLoadingContextKey"), v28);
  v32 = (void *)objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)CFSTR("url"), v31);
  if (v32)
  {
    v36 = v32;
    v37 = (void *)objc_msgSend_pathExtension(v32, v33, v34, v35);
    v41 = (void *)objc_msgSend_lowercaseString(v37, v38, v39, v40);
    if (objc_msgSend_isEqualToString_(v41, v42, (uint64_t)CFSTR("vfx-world"), v43))
    {
      v50 = (void *)objc_msgSend_mutableCopy(v29, v44, v45, v46);
    }
    else
    {
      isEqualToString = objc_msgSend_isEqualToString_(v41, v44, (uint64_t)CFSTR("vfxz-world"), v46);
      v50 = (void *)objc_msgSend_mutableCopy(v29, v52, v53, v54);
      if (!isEqualToString)
      {
        v60 = (void *)sub_1B181FEE0(*((_QWORD *)v4 + 26));
        PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v36, v61, v62, v63);
        objc_msgSend_initializeAssetManagerWithBundleURL_(v60, v65, PathComponent, v66);
        v58 = objc_msgSend_assetPathResolver(v4, v67, v68, v69);
        goto LABEL_13;
      }
    }
    v55 = objc_msgSend_URLByDeletingLastPathComponent(v36, v47, v48, v49);
    v58 = objc_msgSend_resolverWithFolderURL_(VFXSimplePathResolver, v56, v55, v57);
LABEL_13:
    objc_msgSend_setObject_forKeyedSubscript_(v50, v59, v58, (uint64_t)CFSTR("VFXWorldLoaderAssetPathResolver"));
    objc_msgSend_setValue_forKey_(VFXTransaction, v70, (uint64_t)v50, (uint64_t)CFSTR("VFXWorldLoadingContextKey"));

  }
  if (objc_msgSend_containsValueForKey_(a3, v33, (uint64_t)CFSTR("behaviorGraph"), v35))
  {
    v73 = objc_opt_class();
    v75 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v74, v73, (uint64_t)CFSTR("behaviorGraph"));
    objc_msgSend_setBehaviorGraph_(v4, v76, v75, v77);
  }
  if (objc_msgSend_containsValueForKey_(a3, v71, (uint64_t)CFSTR("stateManager"), v72))
  {
    v80 = objc_opt_class();
    v82 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v81, v80, (uint64_t)CFSTR("stateManager"));
    *((_QWORD *)v4 + 25) = v82;
    objc_msgSend_setWorld_(v82, v83, (uint64_t)v4, v84);
  }
  if (objc_msgSend_containsValueForKey_(a3, v78, (uint64_t)CFSTR("triggerManager"), v79))
  {
    v85 = objc_opt_class();
    v87 = (VFXTriggerManager *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v86, v85, (uint64_t)CFSTR("triggerManager"));
  }
  else
  {
    v87 = objc_alloc_init(VFXTriggerManager);
  }
  *((_QWORD *)v4 + 30) = v87;
  objc_msgSend_setWorld_(v87, v88, (uint64_t)v4, v89);
  objc_msgSend_decodeDoubleForKey_(a3, v90, (uint64_t)CFSTR("endTime"), v91);
  objc_msgSend_setEndTime_(v4, v92, v93, v94);
  objc_msgSend_decodeDoubleForKey_(a3, v95, (uint64_t)CFSTR("startTime"), v96);
  objc_msgSend_setStartTime_(v4, v97, v98, v99);
  objc_msgSend_decodeDoubleForKey_(a3, v100, (uint64_t)CFSTR("frameRate"), v101);
  objc_msgSend_setFrameRate_(v4, v102, v103, v104);
  v105 = objc_opt_class();
  v107 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v106, v105, (uint64_t)CFSTR("defaultRenderGraph"));
  objc_msgSend_setDefaultRenderGraph_(v4, v108, v107, v109);
  v112 = objc_msgSend_decodeIntegerForKey_(a3, v110, (uint64_t)CFSTR("version"), v111);
  v113 = objc_opt_class();
  *((_QWORD *)v4 + 7) = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v114, v113, (uint64_t)CFSTR("physicsWorld"));
  v115 = objc_opt_class();
  v117 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v116, v115, (uint64_t)CFSTR("rootNode"));
  if (v117)
  {
    objc_msgSend_setRootNode_(v4, v118, v117, v120);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to unarchive VFXWorld - (secureCoding compliance issue?)"), v119, v120, v121, v122, v123, v124, (uint64_t)v225.receiver);
    if (!*((_QWORD *)v4 + 8))
    {
      v132 = *((_QWORD *)v4 + 1);
      if (v132)
      {
        sub_1B187973C(v132, (uint64_t)v125, v126, v127, v128, v129, v130, v131);
        v141 = sub_1B187A934(*((_QWORD *)v4 + 1), v133, v134, v135, v136, v137, v138, v139);
        if (v141)
        {
          v143 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v140, v141, v142);
          *((_QWORD *)v4 + 8) = v143;
          objc_msgSend_setWorld_(v143, v144, (uint64_t)v4, v145);
        }
        else
        {
          v153 = objc_msgSend_node(VFXNode, v140, 0, v142);
          objc_msgSend__setRootNode_immediate_(v4, v154, v153, 1);
        }
        sub_1B18797B4(*((_QWORD *)v4 + 1), v146, v147, v148, v149, v150, v151, v152);
      }
    }
  }
  objc_msgSend__registerPhysicsJoints(*((void **)v4 + 7), v125, v126, v127);
  v155 = objc_opt_class();
  v157 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v156, v155, (uint64_t)CFSTR("background"));
  *((_QWORD *)v4 + 13) = v157;
  if (!v112)
  {
    objc_msgSend_contents(v157, v158, v159, v160);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_setContents_(*((void **)v4 + 13), v161, 0, v162);
  }
  v163 = sub_1B18BDC88();
  *((_QWORD *)v4 + 14) = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v164, v163, (uint64_t)CFSTR("environment"));
  v165 = sub_1B18BDC88();
  *((_QWORD *)v4 + 15) = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v166, v165, (uint64_t)CFSTR("userAttributes"));
  objc_msgSend_decodeDoubleForKey_(a3, v167, (uint64_t)CFSTR("fogStartDistance"), v168);
  *(float *)&v169 = v169;
  objc_msgSend_setFogStartDistance_(v4, v170, v171, v172, v169);
  objc_msgSend_decodeDoubleForKey_(a3, v173, (uint64_t)CFSTR("fogEndDistance"), v174);
  *(float *)&v175 = v175;
  objc_msgSend_setFogEndDistance_(v4, v176, v177, v178, v175);
  objc_msgSend_decodeDoubleForKey_(a3, v179, (uint64_t)CFSTR("fogDensityExponent"), v180);
  *(float *)&v181 = v181;
  objc_msgSend_setFogDensityExponent_(v4, v182, v183, v184, v181);
  if (objc_msgSend_containsValueForKey_(a3, v185, (uint64_t)CFSTR("wantsScreenSpaceReflection"), v186))
  {
    v189 = objc_msgSend_decodeBoolForKey_(a3, v187, (uint64_t)CFSTR("wantsScreenSpaceReflection"), v188);
    objc_msgSend_setWantsScreenSpaceReflection_(v4, v190, v189, v191);
  }
  if (objc_msgSend_containsValueForKey_(a3, v187, (uint64_t)CFSTR("screenSpaceReflectionSampleCount"), v188))
  {
    v194 = objc_msgSend_decodeIntForKey_(a3, v192, (uint64_t)CFSTR("screenSpaceReflectionSampleCount"), v193);
    objc_msgSend_setScreenSpaceReflectionSampleCount_(v4, v195, v194, v196);
  }
  if (objc_msgSend_containsValueForKey_(a3, v192, (uint64_t)CFSTR("screenSpaceReflectionMaximumDistance"), v193))
  {
    objc_msgSend_decodeFloatForKey_(a3, v197, (uint64_t)CFSTR("screenSpaceReflectionMaximumDistance"), v198);
    objc_msgSend_setScreenSpaceReflectionMaximumDistance_(v4, v199, v200, v201);
  }
  if (objc_msgSend_containsValueForKey_(a3, v197, (uint64_t)CFSTR("screenSpaceReflectionStride"), v198))
  {
    objc_msgSend_decodeFloatForKey_(a3, v202, (uint64_t)CFSTR("screenSpaceReflectionStride"), v203);
    objc_msgSend_setScreenSpaceReflectionStride_(v4, v204, v205, v206);
  }
  v207 = (void *)MEMORY[0x1E0C99E60];
  v208 = objc_opt_class();
  v211 = (void *)objc_msgSend_setWithObject_(v207, v209, v208, v210);
  v212 = sub_1B18BDB20(a3, (uint64_t)CFSTR("fogColor"), v211);
  objc_msgSend_setFogColor_(v4, v213, v212, v214);
  if (objc_msgSend_containsValueForKey_(a3, v215, (uint64_t)CFSTR("assetRegistry"), v216))
  {
    v217 = objc_opt_class();
    v219 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v218, v217, (uint64_t)CFSTR("assetRegistry"));
    *((_QWORD *)v4 + 23) = v219;
    objc_msgSend_setWorld_(v219, v220, (uint64_t)v4, v221);
  }
  sub_1B18BDA00(a3, v4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v222, v8, v223);
  return (VFXWorld *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setReplicationDelegate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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

  if (!sub_1B187B004((uint64_t)self->_world, 1, (uint64_t)a3, v3, v4, v5, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled"), v11, v12, v13, v14, v15, v16, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  v17 = objc_msgSend_worldRef(self, v10, v11, v12);
  if (v17)
  {
    v25 = v17;
    sub_1B187973C(v17, v18, v19, v20, v21, v22, v23, v24);
    sub_1B18D2B5C((uint64_t)self->_coreEntityManager, (uint64_t)a3, v26, v27);
    v35 = sub_1B187AA20((uint64_t)self->_world, v28, v29, v30, v31, v32, v33, v34);
    sub_1B18D2B68(v35, (uint64_t)a3, v36, v37);
    sub_1B18797B4(v25, v38, v39, v40, v41, v42, v43, v44);
  }
  else
  {
    sub_1B18D2B5C((uint64_t)self->_coreEntityManager, (uint64_t)a3, v19, v20);
    v52 = sub_1B187AA20((uint64_t)self->_world, v45, v46, v47, v48, v49, v50, v51);
    sub_1B18D2B68(v52, (uint64_t)a3, v53, v54);
  }
}

- (id)presentationScene
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = sub_1B187AA20((uint64_t)self->_world, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return (id)sub_1B181FEE0(v8);
}

- (void)resolveVFXCoreAndTagReferences
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  char *v52;
  _QWORD v53[6];
  _QWORD v54[6];

  if (!sub_1B187B004((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled"), v10, v11, v12, v13, v14, v15, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  v16 = (void *)objc_msgSend_scene(self, v9, v10, v11);
  v20 = objc_msgSend_buildIdentifierRemapTable(self, v17, v18, v19);
  v24 = (void *)objc_msgSend_rootNode(self, v21, v22, v23);
  objc_msgSend_enumerateHierarchyUsingBlock_(v24, v25, (uint64_t)&unk_1E63D0E70, v26);
  objc_msgSend_resolveObjectReferencesWithRemapTableWithWorld_objectsByIdentifier_(v16, v27, (uint64_t)self, v20);
  v52 = (char *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = (void *)objc_msgSend_assetRegistry(self, v28, v29, v30);
  v35 = (void *)objc_msgSend_rootNode(v31, v32, v33, v34);
  v36 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = sub_1B18A2CA0;
  v54[3] = &unk_1E63D8050;
  v54[4] = v16;
  v54[5] = v52;
  objc_msgSend_enumerateHierarchyUsingBlock_(v35, v52, (uint64_t)v54, v37);
  v41 = (void *)objc_msgSend_rootNode(self, v38, v39, v40);
  v53[0] = v36;
  v53[1] = 3221225472;
  v53[2] = sub_1B18A2D3C;
  v53[3] = &unk_1E63D8078;
  v53[4] = v16;
  v53[5] = v52;
  objc_msgSend_enumerateHierarchyUsingBlock_(v41, v52, (uint64_t)v53, v42);
  v46 = (void *)objc_msgSend_behaviorGraph(self, v43, v44, v45);
  v50 = (void *)objc_msgSend_coreEntityHandle(v46, v47, v48, v49);
  objc_msgSend_resolveTag_remap_(v50, v51, (uint64_t)v16, (uint64_t)v52);

}

- (BOOL)loadCoreEntityManagerFromURL:(id)a3 options:(id)a4 infoOut:(id)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  if (!sub_1B187B004((uint64_t)self->_world, 1, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled"), v12, v13, v14, v15, v16, v17, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  v18 = objc_msgSend_scene(self, v11, v12, v13);
  objc_msgSend_stopReplication(self, v19, v20, v21);
  v24 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v22, (uint64_t)CFSTR("VFXWorldLoaderLoadForAuthoring"), v23);
  v28 = objc_msgSend_BOOLValue(v24, v25, v26, v27);
  objc_msgSend_presentationScene(self, v29, v30, v31);
  return MEMORY[0x1E0DE7D20](v18, sel_loadWithUrl_loadingForAuthoring_infoOut_presentationScene_error_, a3, v28);
}

- (void)replicateToRuntimeAndStartReplicationWithOptions:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_cloneModelToPresentationAndStartReplicationStream(self, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_objectForKeyedSubscript_(a3, v6, (uint64_t)CFSTR("VFXWorldLoaderReplicationDelegate"), v7);
  if (v8)
    MEMORY[0x1E0DE7D20](self, sel_setReplicationDelegate_, v8, v9);
}

- (id)scene
{
  return (id)sub_1B181FEE0((uint64_t)self->_coreEntityManager);
}

- (id)stateManager
{
  id result;
  VFXStateManager *v4;
  const char *v5;
  uint64_t v6;

  result = self->_stateManager;
  if (!result)
  {
    v4 = objc_alloc_init(VFXStateManager);
    self->_stateManager = v4;
    objc_msgSend_setWorld_(v4, v5, (uint64_t)self, v6);
    return self->_stateManager;
  }
  return result;
}

- (id)triggerManager
{
  id result;
  VFXTriggerManager *v4;
  const char *v5;
  uint64_t v6;

  result = self->_triggerManager;
  if (!result)
  {
    v4 = objc_alloc_init(VFXTriggerManager);
    self->_triggerManager = v4;
    objc_msgSend_setWorld_(v4, v5, (uint64_t)self, v6);
    return self->_triggerManager;
  }
  return result;
}

- (id)buildIdentifierRemapTable
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  const char *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend_rootNode(self, v4, v5, v6);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1B18A31F0;
  v39[3] = &unk_1E63D80A0;
  v39[4] = v3;
  objc_msgSend_enumerateHierarchyUsingBlock_(v7, v8, (uint64_t)v39, v9);
  v13 = objc_msgSend_identifier(self, v10, v11, v12);
  objc_msgSend_setValue_forKey_(v3, v14, (uint64_t)self, v13);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = (void *)objc_msgSend_stateManager(self, v15, v16, v17, 0);
  v22 = (void *)objc_msgSend_states(v18, v19, v20, v21);
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v35, (uint64_t)v40, 16);
  if (v24)
  {
    v28 = v24;
    v29 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(v22);
        v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v32 = objc_msgSend_identifier(v31, v25, v26, v27);
        objc_msgSend_setValue_forKey_(v3, v33, (uint64_t)v31, v32);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v35, (uint64_t)v40, 16);
    }
    while (v28);
  }
  return v3;
}

- (int64_t)presentationEntityFromModel:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!sub_1B187B004((uint64_t)self->_world, 1, a3, v3, v4, v5, v6, v7))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled"), v10, v11, v12, v13, v14, v15, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  return MEMORY[0x1E0DE7D20](self->_modelToPresentationRemapTable, sel_presentationEntityFromModel_, a3, v11);
}

- (BOOL)allowRemoteEdition
{
  return self->_remoteEditionEndpoint != 0;
}

- (void)setRemotePreviewDelegate:(id)a3
{
  self->_remotePreviewDelegate = (VFXWorldRemotePreviewDelegate *)a3;
}

- (id)remotePreviewDelegate
{
  return self->_remotePreviewDelegate;
}

- (id)snapshotWithSize:(CGSize)a3 pointOfView:(id)a4
{
  double height;
  double width;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  height = a3.height;
  width = a3.width;
  if (+[VFXView _isMetalSupported]_0())
  {
    v10 = (void *)objc_msgSend_rendererWithDevice_options_(VFXRenderer, v8, 0, 0);
    objc_msgSend_setWorld_(v10, v11, (uint64_t)self, v12);
  }
  else
  {
    v10 = 0;
    objc_msgSend_setWorld_(0, v8, (uint64_t)self, v9);
  }
  objc_msgSend_setJitteringEnabled_(v10, v13, 0, v14);
  objc_msgSend_setAutoenablesDefaultLighting_(v10, v15, 1, v16);
  objc_msgSend_setAutoAdjustCamera_(v10, v17, 1, v18);
  if (a4)
    objc_msgSend_setPointOfView_(v10, v19, (uint64_t)a4, v21);
  objc_msgSend_flush(VFXTransaction, v19, v20, v21);
  return (id)objc_msgSend_snapshotWithSize_(v10, v22, v23, v24, width, height);
}

- (id)debugQuickLookObject
{
  uint64_t v2;

  return (id)objc_msgSend_debugQuickLookObjectWithPointOfView_(self, a2, 0, v2);
}

- (id)debugQuickLookObjectWithPointOfView:(id)a3
{
  return (id)((uint64_t (*)(VFXWorld *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_snapshotWithSize_pointOfView_, a3);
}

- (BOOL)writeToURLWithUSDKit:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *error;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t PathComponent;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  int DirectoryAtURL_withIntermediateDirectories_attributes_error;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[512];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_pathExtension(a3, a2, (uint64_t)a3, v3);
  v10 = (void *)objc_msgSend_lowercaseString(v6, v7, v8, v9);
  if ((objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("usd"), v12) & 1) == 0
    && (objc_msgSend_isEqualToString_(v10, v13, (uint64_t)CFSTR("usda"), v15) & 1) == 0
    && (objc_msgSend_isEqualToString_(v10, v13, (uint64_t)CFSTR("usdc"), v15) & 1) == 0
    && !objc_msgSend_isEqualToString_(v10, v13, (uint64_t)CFSTR("usdz"), v15))
  {
    goto LABEL_16;
  }
  if (qword_1EEF66A90 != -1)
    dispatch_once(&qword_1EEF66A90, &unk_1E63D1350);
  if (byte_1EEF66A98 == 1)
  {
    v16 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v13, v14, v15);
    error = (void *)objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v16, v17, 99, 1, a3, 1, 0);
    PathComponent = objc_msgSend_lastPathComponent(a3, v19, v20, v21);
    v25 = (void *)objc_msgSend_URLByAppendingPathComponent_(error, v23, PathComponent, v24);
    if (objc_msgSend_isEqualToString_(v10, v26, (uint64_t)CFSTR("usdz"), v27))
    {
      v31 = (void *)objc_msgSend_URLByDeletingPathExtension(v25, v28, v29, v30);
      v25 = (void *)objc_msgSend_URLByAppendingPathExtension_(v31, v32, (uint64_t)CFSTR("usdc"), v33);
    }
    objc_msgSend_flush(VFXTransaction, v28, v29, v30);
    v37 = (void *)objc_msgSend_URLByDeletingPathExtension(a3, v34, v35, v36);
    v41 = (__CFString *)objc_msgSend_lastPathComponent(v37, v38, v39, v40);
    if (!v41 || (v45 = v41, objc_msgSend_isEqualToString_(v41, v42, (uint64_t)&stru_1E63FD500, v44)))
      v45 = CFSTR("root_node");
    v46 = objc_msgSend_path(error, v42, v43, v44);
    sub_1B196D2E8((uint64_t)v110, (const char *)self, v45, (uint64_t)v25, v46);
    v105 = (void *)sub_1B196C748((uint64_t)v110, (const char *)v25, v47, v48);
    v52 = objc_msgSend_URLByDeletingLastPathComponent(a3, v49, v50, v51);
    v56 = (void *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v53, v54, v55);
    DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v56, v57, v52, 1, 0, 0);
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error)
    {
      if (objc_msgSend_isEqualToString_(v10, v58, (uint64_t)CFSTR("usdz"), v59))
      {
        objc_msgSend_saveAndCreateUSDZPackageWithURL_(v105, v61, (uint64_t)a3, v63);
      }
      else
      {
        objc_msgSend_save(v105, v61, v62, v63);
        v67 = objc_msgSend_path(a3, v64, v65, v66);
        if (objc_msgSend_fileExistsAtPath_(v56, v68, v67, v69))
          objc_msgSend_removeItemAtURL_error_(v56, v70, (uint64_t)a3, 0);
        v73 = (void *)objc_msgSend_URLByDeletingLastPathComponent(a3, v70, v71, v72);
        v77 = (void *)objc_msgSend_path(v73, v74, v75, v76);
        v81 = objc_msgSend_path(error, v78, v79, v80);
        v84 = (void *)objc_msgSend_enumeratorAtPath_(v56, v82, v81, v83);
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v106, (uint64_t)v111, 16);
        if (v89)
        {
          v90 = *(_QWORD *)v107;
          do
          {
            for (i = 0; i != v89; ++i)
            {
              if (*(_QWORD *)v107 != v90)
                objc_enumerationMutation(v84);
              v92 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
              v93 = (void *)objc_msgSend_path(error, v86, v87, v88);
              v96 = objc_msgSend_stringByAppendingPathComponent_(v93, v94, v92, v95);
              v99 = objc_msgSend_stringByAppendingPathComponent_(v77, v97, v92, v98);
              if (objc_msgSend_fileExistsAtPath_(v56, v100, v99, v101))
                objc_msgSend_removeItemAtPath_error_(v56, v102, v99, 0);
              objc_msgSend_moveItemAtPath_toPath_error_(v56, v102, v96, v99, 0);
            }
            v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v86, (uint64_t)&v106, (uint64_t)v111, 16);
          }
          while (v89);
        }
      }
    }

    objc_msgSend_removeItemAtURL_error_(v56, v103, (uint64_t)error, 0);
    sub_1B197A264((uint64_t)v110);
  }
  else
  {
LABEL_16:
    LOBYTE(DirectoryAtURL_withIntermediateDirectories_attributes_error) = 0;
  }
  return DirectoryAtURL_withIntermediateDirectories_attributes_error;
}

- (void)loadSCN:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  __CFDictionary *Mutable;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t PathComponent;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = (void *)objc_msgSend_sceneWithURL_options_error_(MEMORY[0x1E0CD5A10], a2, (uint64_t)a3, (uint64_t)a4, a5);
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  objc_msgSend_begin(VFXTransaction, v10, v11, v12);
  objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
  PathComponent = objc_msgSend_URLByDeletingLastPathComponent(a3, v15, v16, v17);
  objc_msgSend_setValue_forKey_(VFXTransaction, v19, PathComponent, (uint64_t)CFSTR("VFXWorldDecodingCurrentEnclosingFolder"));
  v22 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v20, (uint64_t)CFSTR("VFXSceneKitBridgeOptionSkipLightIntensityRemapping"), v21);
  v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);
  sub_1B1987084(self, v8, Mutable, v26);
  objc_msgSend_commit(VFXTransaction, v27, v28, v29);
  CFRelease(Mutable);
}

+ (VFXWorld)worldWithSceneKitScene:(id)a3 options:(id)a4
{
  __CFDictionary *Mutable;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t PathComponent;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  objc_msgSend_begin(VFXTransaction, v8, v9, v10);
  objc_msgSend_setImmediateMode_(VFXTransaction, v11, 1, v12);
  v13 = objc_alloc_init((Class)a1);
  v16 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v14, (uint64_t)CFSTR("VFXSceneKitBridgeOptionOriginalURL"), v15);
  PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v16, v17, v18, v19);
  objc_msgSend_setValue_forKey_(VFXTransaction, v21, PathComponent, (uint64_t)CFSTR("VFXWorldDecodingCurrentEnclosingFolder"));
  v24 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v22, (uint64_t)CFSTR("VFXSceneKitBridgeOptionSkipLightIntensityRemapping"), v23);
  v28 = objc_msgSend_BOOLValue(v24, v25, v26, v27);
  sub_1B1987084(v13, a3, Mutable, v28);
  objc_msgSend_commit(VFXTransaction, v29, v30, v31);
  CFRelease(Mutable);
  return (VFXWorld *)v13;
}

+ (VFXWorld)worldWithSCNURL:(id)a3 options:(id)a4 error:(id *)a5
{
  VFXWorld *v8;
  const char *v9;

  v8 = (VFXWorld *)objc_msgSend_world(VFXWorld, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_loadSCN_options_error_(v8, v9, (uint64_t)a3, (uint64_t)a4, a5);
  return v8;
}

- (id)_exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8
{
  double height;
  double width;
  void *v16;
  const char *v17;
  uint64_t v18;
  VFXMovieExportOperation *v19;
  const char *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v16 = (void *)objc_msgSend_rendererWithDevice_options_(VFXRenderer, a2, 0, 0);
  objc_msgSend_setWorld_(v16, v17, (uint64_t)self, v18);
  v19 = [VFXMovieExportOperation alloc];
  v21 = (id)objc_msgSend_initWithRenderer_size_attributes_outputURL_(v19, v20, (uint64_t)v16, (uint64_t)a5, a3, width, height);
  objc_msgSend_setDelegate_(v21, v22, (uint64_t)a6, v23);
  objc_msgSend_setUserInfo_(v21, v24, (uint64_t)a8, v25);
  objc_msgSend_setDidEndSelector_(v21, v26, (uint64_t)a7, v27);
  return v21;
}

- (id)exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__exportAsMovieOperationWithDestinationURL_size_attributes_delegate_didEndSelector_userInfo_, a3, a5);
}

- (BOOL)migrateCoreEntityManagerWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  VFXWorld *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = self;
  VFXWorld.migrateCoreEntityManager(info:)((NSMutableDictionary)v6);

  if (v8)
  {
    if (a4)
    {
      v9 = (void *)sub_1B2227FA8();

      v10 = v9;
      *a4 = v9;
    }
    else
    {

    }
  }
  return v8 == 0;
}

- (BOOL)initializeCoreEntityManagerWithInfo:(id)a3 error:(id *)a4
{
  id v5;
  VFXWorld *v6;

  v5 = a3;
  v6 = self;
  VFXWorld.initializeCoreEntityManager(info:)((NSMutableDictionary)v5);

  return 1;
}

- (NSArray)bridgedComponentNames
{
  return (NSArray *)(id)sub_1B2228AAC();
}

@end
