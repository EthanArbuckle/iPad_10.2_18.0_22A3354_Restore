@implementation MesaCoreAnalyticsWeeklyEvent

- (MesaCoreAnalyticsWeeklyEvent)initWithName:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  MesaCoreAnalyticsWeeklyEvent *v11;
  MesaCoreAnalyticsWeeklyEvent *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *dailyEvents;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSNumber *dailyEventIndex;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("dailyEvents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("dailyEvents"));
  }
  else
  {
    v10 = 0;
  }
  v37.receiver = self;
  v37.super_class = (Class)MesaCoreAnalyticsWeeklyEvent;
  v11 = -[MesaCoreAnalyticsDailyEvent initWithName:dictionary:](&v37, sel_initWithName_dictionary_, v6, v8);
  v12 = v11;
  if (v11)
  {
    v13 = (int)*MEMORY[0x24BE0CF50];
    objc_msgSend(*(id *)((char *)&v11->super.super.super.super.isa + v13), "arrayByAddingObjectsFromArray:", &unk_251CB3C40);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(Class *)((char *)&v12->super.super.super.super.isa + v13);
    *(Class *)((char *)&v12->super.super.super.super.isa + v13) = (Class)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 7);
    v16 = objc_claimAutoreleasedReturnValue();
    dailyEvents = v12->_dailyEvents;
    v12->_dailyEvents = (NSMutableArray *)v16;

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v10, "count") < 8)
      {
        v30 = v9;
        v31 = v8;
        v32 = v6;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v18 = v10;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v34;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v34 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v22);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[NSMutableArray addObject:](v12->_dailyEvents, "addObject:", v23);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (__osLog)
                    v24 = __osLog;
                  else
                    v24 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v40 = "[dailyEvent isKindOfClass: [NSDictionary class]]";
                    v41 = 2048;
                    v42 = 0;
                    v43 = 2080;
                    v44 = "";
                    v45 = 2080;
                    v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/Mesa"
                          "CoreAnalyticsEvent.m";
                    v47 = 1024;
                    v48 = 2669;
                    _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                  }
                }
              }
              ++v22;
            }
            while (v20 != v22);
            v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            v20 = v25;
          }
          while (v25);
        }

        v8 = v31;
        v6 = v32;
        v9 = v30;
        goto LABEL_31;
      }
      if (__osLog)
        v26 = __osLog;
      else
        v26 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = "[dailyEvents isKindOfClass: [NSArray class]] && [dailyEvents count] <= 7";
        v41 = 2048;
        v42 = 0;
        v43 = 2080;
        v44 = "";
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
        v47 = 1024;
        v48 = 2664;
        _os_log_impl(&dword_24B74E000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    dailyEventIndex = v12->_dailyEventIndex;
    v12->_dailyEventIndex = (NSNumber *)&unk_251CB3428;

    goto LABEL_31;
  }
  if (__osLog)
    v29 = __osLog;
  else
    v29 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v40 = "self = [super initWithName:eventName dictionary:mutableDict]";
    v41 = 2048;
    v42 = 0;
    v43 = 2080;
    v44 = "";
    v45 = 2080;
    v46 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
    v47 = 1024;
    v48 = 2648;
    _os_log_impl(&dword_24B74E000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_31:

  return v12;
}

- (MesaCoreAnalyticsWeeklyEvent)initWithDictionary:(id)a3
{
  return -[MesaCoreAnalyticsWeeklyEvent initWithName:dictionary:](self, "initWithName:dictionary:", CFSTR("com.apple.biometrickit.mesa.weeklyUpdate"), a3);
}

- (BOOL)postEvent
{
  objc_super v4;

  if (-[NSMutableArray count](self->_dailyEvents, "count") != 7)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MesaCoreAnalyticsWeeklyEvent;
  return -[MesaCoreAnalyticsEvent postEvent](&v4, sel_postEvent);
}

- (id)dictionaryRepresentationArchiving:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[16];

  v3 = a3;
  if (__osLog)
    v5 = __osLog;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v5, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsWeeklyEvent dictionaryRepresentation\n", buf, 2u);
  }
  -[MesaCoreAnalyticsWeeklyEvent calculateWeeklyValues](self, "calculateWeeklyValues");
  v6 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = self;
  v10.super_class = (Class)MesaCoreAnalyticsWeeklyEvent;
  -[MesaCoreAnalyticsDailyEvent dictionaryRepresentationArchiving:](&v10, sel_dictionaryRepresentationArchiving_, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)reset
{
  NSMutableArray *v3;
  NSNumber *v4;
  NSMutableArray *dailyEvents;
  NSMutableArray *v6;
  NSNumber *dailyEventIndex;
  NSNumber *v8;
  NSNumber *badDaysCount;
  NSNumber *validDaysCount;
  objc_super v11;

  v3 = self->_dailyEvents;
  v4 = self->_dailyEventIndex;
  v11.receiver = self;
  v11.super_class = (Class)MesaCoreAnalyticsWeeklyEvent;
  -[MesaCoreAnalyticsDailyEvent reset](&v11, sel_reset);
  dailyEvents = self->_dailyEvents;
  self->_dailyEvents = v3;
  v6 = v3;

  dailyEventIndex = self->_dailyEventIndex;
  self->_dailyEventIndex = v4;
  v8 = v4;

  badDaysCount = self->_badDaysCount;
  self->_badDaysCount = (NSNumber *)&unk_251CB3428;

  validDaysCount = self->_validDaysCount;
  self->_validDaysCount = (NSNumber *)&unk_251CB3428;

}

- (void)calculateDailyValues
{
  NSObject *v3;
  uint8_t v4[16];

  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsWeeklyEvent calculateDailyValues\n", v4, 2u);
  }
  -[MesaCoreAnalyticsDailyEvent setBadDay:](self, "setBadDay:", 0);
}

- (void)calculateWeeklyValues
{
  void *v2;
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  id v13;
  NSObject *v14;
  NSNumber *v15;
  NSNumber *badDaysCount;
  NSNumber *v17;
  NSNumber *validDaysCount;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSNumber *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  unsigned int v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  int v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  void *v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  int v141;
  void *v142;
  void *v143;
  int v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  void *v149;
  void *v150;
  unsigned int v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  void *v157;
  unsigned int v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  void *v163;
  void *v164;
  float v165;
  float v166;
  void *v167;
  double v168;
  void *v169;
  void *v170;
  int v171;
  void *v172;
  void *v173;
  float v174;
  float v175;
  void *v176;
  double v177;
  void *v178;
  void *v179;
  int v180;
  void *v181;
  void *v182;
  float v183;
  float v184;
  void *v185;
  double v186;
  void *v187;
  void *v188;
  int v189;
  void *v190;
  void *v191;
  unsigned int v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  void *v197;
  void *v198;
  unsigned int v199;
  void *v200;
  void *v201;
  void *v202;
  int v203;
  void *v204;
  void *v205;
  unsigned int v206;
  void *v207;
  void *v208;
  void *v209;
  int v210;
  void *v211;
  void *v212;
  int v213;
  void *v214;
  void *v215;
  void *v216;
  int v217;
  void *v218;
  void *v219;
  float v220;
  float v221;
  void *v222;
  double v223;
  void *v224;
  void *v225;
  BOOL v226;
  void *v227;
  void *v228;
  float v229;
  double v230;
  void *v231;
  void *v232;
  _BOOL4 v233;
  void *v234;
  void *v235;
  float v236;
  float v237;
  void *v238;
  float v239;
  float v240;
  void *v241;
  float v242;
  float v243;
  void *v244;
  int v245;
  void *v246;
  double v247;
  void *v248;
  void *v249;
  BOOL v250;
  void *v251;
  void *v252;
  float v253;
  double v254;
  void *v255;
  void *v256;
  _BOOL4 v257;
  void *v258;
  void *v259;
  float v260;
  float v261;
  void *v262;
  float v263;
  float v264;
  void *v265;
  float v266;
  float v267;
  void *v268;
  int v269;
  void *v270;
  double v271;
  void *v272;
  void *v273;
  BOOL v274;
  void *v275;
  void *v276;
  float v277;
  double v278;
  void *v279;
  void *v280;
  _BOOL4 v281;
  void *v282;
  void *v283;
  float v284;
  float v285;
  void *v286;
  float v287;
  float v288;
  void *v289;
  float v290;
  float v291;
  void *v292;
  int v293;
  void *v294;
  double v295;
  void *v296;
  void *v297;
  int v298;
  void *v299;
  void *v300;
  int v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  int v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  int v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  int v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  int v321;
  void *v322;
  void *v323;
  __int128 v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  NSMutableArray *obj;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  uint64_t v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  _QWORD v370[2];
  int v371;
  _QWORD v372[2];
  int v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  _BYTE v382[128];
  uint8_t v383[128];
  uint8_t buf[4];
  const char *v385;
  __int16 v386;
  uint64_t v387;
  __int16 v388;
  const char *v389;
  __int16 v390;
  const char *v391;
  __int16 v392;
  int v393;
  _BYTE v394[128];
  uint64_t v395;

  v395 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)__osLog;
  if (!__osLog)
    v2 = (void *)MEMORY[0x24BDACB70];
  v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B74E000, v3, OS_LOG_TYPE_DEBUG, "MesaCoreAnalyticsWeeklyEvent calculateWeeklyValues\n", buf, 2u);
  }

  -[MesaCoreAnalyticsDailyEvent unlockEnabled](self, "unlockEnabled");
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent applePayEnabled](self, "applePayEnabled");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent enrolledIdentityCount](self, "enrolledIdentityCount");
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent enrolledUserCount](self, "enrolledUserCount");
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent templateEnrollmentsCount](self, "templateEnrollmentsCount");
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsEvent builtinSensorType](self, "builtinSensorType");
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitCoreAnalyticsEvent timeSinceLastEnrollment](self, "timeSinceLastEnrollment");
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2Bin](self, "drxStrengthPctCol2Bin");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7Bin](self, "drxStrengthPctCol7Bin");
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent temperatureBin](self, "temperatureBin");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent FMRBin](self, "FMRBin");
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent BSRBin](self, "BSRBin");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent fitDiffBin](self, "fitDiffBin");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent carrierAttenBin](self, "carrierAttenBin");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent DRXAmpMinBin](self, "DRXAmpMinBin");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent DRXAmpMaxBin](self, "DRXAmpMaxBin");
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent fitResEdge6SigmaBin](self, "fitResEdge6SigmaBin");
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2Raw](self, "drxStrengthPctCol2Raw");
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7Raw](self, "drxStrengthPctCol7Raw");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent temperatureRaw](self, "temperatureRaw");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent FMRRaw](self, "FMRRaw");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent BSRRaw](self, "BSRRaw");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent fitDiffRaw](self, "fitDiffRaw");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent carrierAttenRaw](self, "carrierAttenRaw");
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent DRXAmpMinRaw](self, "DRXAmpMinRaw");
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent DRXAmpMaxRaw](self, "DRXAmpMaxRaw");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent fitResEdge6SigmaRaw](self, "fitResEdge6SigmaRaw");
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent timeSinceSecondLastEnrollment](self, "timeSinceSecondLastEnrollment");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent lastEnrollmentTouchesCount](self, "lastEnrollmentTouchesCount");
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent lastEnrollmentDeviceOrientation](self, "lastEnrollmentDeviceOrientation");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent totalScanCount](self, "totalScanCount");
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent totalScanGroupCount](self, "totalScanGroupCount");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent lastEnrollmentScanCount](self, "lastEnrollmentScanCount");
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsDailyEvent lastEnrollmentScanGroupCount](self, "lastEnrollmentScanGroupCount");
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCoreAnalyticsWeeklyEvent reset](self, "reset");
  v380 = 0u;
  v381 = 0u;
  v378 = 0u;
  v379 = 0u;
  obj = self->_dailyEvents;
  v361 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v378, v394, 16);
  if (v361)
  {
    v360 = *(_QWORD *)v379;
    *(_QWORD *)&v4 = 138413058;
    v324 = v4;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v379 != v360)
        {
          v6 = v5;
          objc_enumerationMutation(obj);
          v5 = v6;
        }
        v362 = v5;
        v7 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v376 = 0u;
          v377 = 0u;
          v374 = 0u;
          v375 = 0u;
          v8 = v7;
          v9 = 0;
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v374, v383, 16, v324);
          if (v10)
          {
            v11 = 0;
            v365 = *(_QWORD *)v375;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v375 != v365)
                  objc_enumerationMutation(v8);
                v13 = *(id *)(*((_QWORD *)&v374 + 1) + 8 * i);

                v11 = v13;
                objc_msgSend(v8, "objectForKey:", v13);
                v14 = objc_claimAutoreleasedReturnValue();

                v9 = v14;
                if (objc_msgSend(v11, "isEqualToString:", CFSTR("badDay"))
                  && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                  && -[NSObject BOOLValue](v14, "BOOLValue"))
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSNumber intValue](self->_badDaysCount, "intValue") + 1);
                  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  badDaysCount = self->_badDaysCount;
                  self->_badDaysCount = v15;

                }
                else if (objc_msgSend(v11, "isEqualToString:", CFSTR("totalMatchOperationsFingerDetected"))&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& (unint64_t)-[NSObject unsignedIntegerValue](v14, "unsignedIntegerValue") >= 0xB)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSNumber unsignedIntegerValue](self->_validDaysCount, "unsignedIntegerValue") + 1);
                  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  validDaysCount = self->_validDaysCount;
                  self->_validDaysCount = v17;

                }
                else if (objc_msgSend(v11, "isEqualToString:", CFSTR("deviceType"))
                       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(v363, "addObject:", v14);
                }
                else if (((objc_msgSend(v11, "isEqualToString:", CFSTR("maxFingerToProbeAttenuationMax")) & 1) != 0
                        || objc_msgSend(v11, "isEqualToString:", CFSTR("maxFingerToProbeAttenuationMin")))
                       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  -[MesaCoreAnalyticsDailyEvent setMaxFingerToProbeAttenuation:calculateAvg:](self, "setMaxFingerToProbeAttenuation:calculateAvg:", v14, 0);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[MesaCoreAnalyticsWeeklyEvent valueForKey:](self, "valueForKey:", v11);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = v19;
                    v21 = (void *)MEMORY[0x24BDD1518];
                    if (v19)
                    {
                      objc_msgSend(v19, "decimalValue");
                    }
                    else
                    {
                      v372[0] = 0;
                      v372[1] = 0;
                      v373 = 0;
                    }
                    objc_msgSend(v21, "decimalNumberWithDecimal:", v372);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = (void *)MEMORY[0x24BDD1518];
                    if (v9)
                    {
                      -[NSObject decimalValue](v9, "decimalValue");
                    }
                    else
                    {
                      v370[0] = 0;
                      v370[1] = 0;
                      v371 = 0;
                    }
                    objc_msgSend(v23, "decimalNumberWithDecimal:", v370);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "decimalNumberByAdding:", v22);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MesaCoreAnalyticsWeeklyEvent setValue:forKey:](self, "setValue:forKey:", v25, v11);

                  }
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v374, v383, 16);
            }
            while (v10);

          }
LABEL_43:

          goto LABEL_45;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = (void *)__osLog;
          if (!__osLog)
            v26 = (void *)MEMORY[0x24BDACB70];
          v9 = v26;
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v385 = "[dailyEvent isKindOfClass: [NSDictionary class]]";
            v386 = 2048;
            v387 = 0;
            v388 = 2080;
            v389 = "";
            v390 = 2080;
            v391 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
            v392 = 1024;
            v393 = 2790;
            _os_log_impl(&dword_24B74E000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          goto LABEL_43;
        }
LABEL_45:
        v5 = v362 + 1;
      }
      while (v362 + 1 != v361);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v378, v394, 16);
      v361 = v27;
    }
    while (v27);
  }

  if (-[NSNumber unsignedIntegerValue](self->_validDaysCount, "unsignedIntegerValue") <= 4)
  {
    v28 = self->_badDaysCount;
    self->_badDaysCount = 0;

  }
  -[MesaCoreAnalyticsEvent setBuiltinSensorType:](self, "setBuiltinSensorType:", v358, v324);
  v368 = 0u;
  v369 = 0u;
  v366 = 0u;
  v367 = 0u;
  v29 = v363;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v366, v382, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v367;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v367 != v31)
          objc_enumerationMutation(v29);
        -[MesaCoreAnalyticsEvent setDeviceType:](self, "setDeviceType:", *(_QWORD *)(*((_QWORD *)&v366 + 1) + 8 * j));
      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v366, v382, 16);
    }
    while (v30);
  }

  -[MesaCoreAnalyticsDailyEvent operationCount](self, "operationCount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "unsignedIntValue");

  if (v34)
  {
    v35 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent operationTimeSum](self, "operationTimeSum");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent operationCount](self, "operationCount");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberWithUnsignedInt:", v37 / objc_msgSend(v38, "unsignedIntValue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setOperationTimeAverage:](self, "setOperationTimeAverage:", v39);

  }
  -[MesaCoreAnalyticsDailyEvent matcherTimeCount](self, "matcherTimeCount");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "unsignedIntValue");

  if (v41)
  {
    v42 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent matcherTimeSum](self, "matcherTimeSum");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent matcherTimeCount](self, "matcherTimeCount");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithUnsignedInt:", v44 / objc_msgSend(v45, "unsignedIntValue"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setMatcherTimeAverage:](self, "setMatcherTimeAverage:", v46);

  }
  -[MesaCoreAnalyticsDailyEvent matcherTimeMatchCount](self, "matcherTimeMatchCount");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "unsignedIntValue");

  if (v48)
  {
    v49 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent matcherTimeMatchSum](self, "matcherTimeMatchSum");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent matcherTimeMatchCount](self, "matcherTimeMatchCount");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "numberWithUnsignedInt:", v51 / objc_msgSend(v52, "unsignedIntValue"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setMatcherTimeMatchAverage:](self, "setMatcherTimeMatchAverage:", v53);

  }
  -[MesaCoreAnalyticsDailyEvent matcherTimeNoMatchCount](self, "matcherTimeNoMatchCount");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "unsignedIntValue");

  if (v55)
  {
    v56 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent matcherTimeNoMatchSum](self, "matcherTimeNoMatchSum");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent matcherTimeNoMatchCount](self, "matcherTimeNoMatchCount");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "numberWithUnsignedInt:", v58 / objc_msgSend(v59, "unsignedIntValue"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setMatcherTimeNoMatchAverage:](self, "setMatcherTimeNoMatchAverage:", v60);

  }
  -[MesaCoreAnalyticsDailyEvent captureTimeCount](self, "captureTimeCount");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "unsignedIntValue");

  if (v62)
  {
    v63 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent captureTimeSum](self, "captureTimeSum");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent captureTimeCount](self, "captureTimeCount");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "numberWithUnsignedInt:", v65 / objc_msgSend(v66, "unsignedIntValue"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setCaptureTimeAverage:](self, "setCaptureTimeAverage:", v67);

  }
  -[MesaCoreAnalyticsDailyEvent totalMatchAttemptsFingerDetected](self, "totalMatchAttemptsFingerDetected");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "unsignedIntValue");

  if (v69)
  {
    v70 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent totalMatchAttemptsFailedFingerDetected](self, "totalMatchAttemptsFailedFingerDetected");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent totalMatchAttemptsFingerDetected](self, "totalMatchAttemptsFingerDetected");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "numberWithUnsignedInt:", 1000 * v72 / objc_msgSend(v73, "unsignedIntValue"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setTotalFRR:](self, "setTotalFRR:", v74);

  }
  -[MesaCoreAnalyticsDailyEvent unlockMatchAttemptsFingerDetected](self, "unlockMatchAttemptsFingerDetected");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "unsignedIntValue");

  if (v76)
  {
    v77 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent unlockMatchAttemptsFailedFingerDetected](self, "unlockMatchAttemptsFailedFingerDetected");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent unlockMatchAttemptsFingerDetected](self, "unlockMatchAttemptsFingerDetected");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "numberWithUnsignedInt:", 1000 * v79 / objc_msgSend(v80, "unsignedIntValue"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setUnlockFRR:](self, "setUnlockFRR:", v81);

  }
  -[MesaCoreAnalyticsDailyEvent preArmMatchAttemptsFingerDetected](self, "preArmMatchAttemptsFingerDetected");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "unsignedIntValue");

  if (v83)
  {
    v84 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent preArmMatchAttemptsFailedFingerDetected](self, "preArmMatchAttemptsFailedFingerDetected");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent preArmMatchAttemptsFingerDetected](self, "preArmMatchAttemptsFingerDetected");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "numberWithUnsignedInt:", 1000 * v86 / objc_msgSend(v87, "unsignedIntValue"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setPrearmFRR:](self, "setPrearmFRR:", v88);

  }
  -[MesaCoreAnalyticsDailyEvent localAuthMatchAttemptsFingerDetected](self, "localAuthMatchAttemptsFingerDetected");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "unsignedIntValue");

  if (v90)
  {
    v91 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent localAuthMatchAttemptsFailedFingerDetected](self, "localAuthMatchAttemptsFailedFingerDetected");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent localAuthMatchAttemptsFingerDetected](self, "localAuthMatchAttemptsFingerDetected");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "numberWithUnsignedInt:", 1000 * v93 / objc_msgSend(v94, "unsignedIntValue"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setLocalAuthFRR:](self, "setLocalAuthFRR:", v95);

  }
  -[MesaCoreAnalyticsDailyEvent totalMatchOperationsFingerDetected](self, "totalMatchOperationsFingerDetected");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "unsignedIntValue");

  if (v97)
  {
    v98 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent totalMatchOperationsFailedRetry](self, "totalMatchOperationsFailedRetry");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent totalMatchOperationsFingerDetected](self, "totalMatchOperationsFingerDetected");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "numberWithUnsignedInt:", 1000 * v100 / objc_msgSend(v101, "unsignedIntValue"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setBadDayFRR:](self, "setBadDayFRR:", v102);

  }
  -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFingerDetected](self, "subsetMatchAttemptsFingerDetected");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "unsignedIntValue");

  if (v104)
  {
    v105 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFailedFingerDetected](self, "subsetMatchAttemptsFailedFingerDetected");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFailedTarget](self, "subsetMatchAttemptsFailedTarget");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFingerDetected](self, "subsetMatchAttemptsFingerDetected");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "numberWithUnsignedInt:", 1000 * (v109 + v107) / objc_msgSend(v110, "unsignedIntValue"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setSubsetFRR:](self, "setSubsetFRR:", v111);

  }
  -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFingerDetected](self, "subsetMatchAttemptsFingerDetected");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "unsignedIntValue");

  if (v113)
  {
    v114 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFailedTarget](self, "subsetMatchAttemptsFailedTarget");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v115, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFingerDetected](self, "subsetMatchAttemptsFingerDetected");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "numberWithUnsignedInt:", 1000 * v116 / objc_msgSend(v117, "unsignedIntValue"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setSubsetTargetFRR:](self, "setSubsetTargetFRR:", v118);

  }
  -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFingerDetected](self, "subsetMatchAttemptsFingerDetected");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "unsignedIntValue");

  if (v120)
  {
    v121 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFailedFingerDetected](self, "subsetMatchAttemptsFailedFingerDetected");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent subsetMatchAttemptsFingerDetected](self, "subsetMatchAttemptsFingerDetected");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "numberWithUnsignedInt:", 1000 * v123 / objc_msgSend(v124, "unsignedIntValue"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setSubsetMatchFRR:](self, "setSubsetMatchFRR:", v125);

  }
  -[MesaCoreAnalyticsDailyEvent nonArtefactMatchAttemptsFingerDetected](self, "nonArtefactMatchAttemptsFingerDetected");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v126, "unsignedIntValue");

  if (v127)
  {
    v128 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent nonArtefactMatchAttemptsFailedFingerDetected](self, "nonArtefactMatchAttemptsFailedFingerDetected");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v129, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent nonArtefactMatchAttemptsFingerDetected](self, "nonArtefactMatchAttemptsFingerDetected");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "numberWithUnsignedInt:", 1000 * v130 / objc_msgSend(v131, "unsignedIntValue"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setNonArtefactFRR:](self, "setNonArtefactFRR:", v132);

  }
  -[MesaCoreAnalyticsDailyEvent artefactMatchAttemptsFingerDetected](self, "artefactMatchAttemptsFingerDetected");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v133, "unsignedIntValue");

  if (v134)
  {
    v135 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent artefactMatchAttemptsFailedFingerDetected](self, "artefactMatchAttemptsFailedFingerDetected");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v136, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent artefactMatchAttemptsFingerDetected](self, "artefactMatchAttemptsFingerDetected");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "numberWithUnsignedInt:", 1000 * v137 / objc_msgSend(v138, "unsignedIntValue"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setArtefactFRR:](self, "setArtefactFRR:", v139);

  }
  -[MesaCoreAnalyticsDailyEvent totalMatchAttemptsFingerDetected](self, "totalMatchAttemptsFingerDetected");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = objc_msgSend(v140, "unsignedIntValue");

  if (v141)
  {
    v142 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent artefactMatchAttemptsFingerDetected](self, "artefactMatchAttemptsFingerDetected");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v143, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent totalMatchAttemptsFingerDetected](self, "totalMatchAttemptsFingerDetected");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "numberWithUnsignedInt:", 1000 * v144 / objc_msgSend(v145, "unsignedIntValue"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setArtefactPrevalence:](self, "setArtefactPrevalence:", v146);

  }
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2BinCount](self, "drxStrengthPctCol2BinCount");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend(v147, "unsignedIntValue");

  if (v148)
  {
    v149 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2BinSum](self, "drxStrengthPctCol2BinSum");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2BinCount](self, "drxStrengthPctCol2BinCount");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "numberWithUnsignedInt:", v151 / objc_msgSend(v152, "unsignedIntValue"));
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol2BinAverage:](self, "setDrxStrengthPctCol2BinAverage:", v153);

  }
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7BinCount](self, "drxStrengthPctCol7BinCount");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_msgSend(v154, "unsignedIntValue");

  if (v155)
  {
    v156 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7BinSum](self, "drxStrengthPctCol7BinSum");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend(v157, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7BinCount](self, "drxStrengthPctCol7BinCount");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "numberWithUnsignedInt:", v158 / objc_msgSend(v159, "unsignedIntValue"));
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol7BinAverage:](self, "setDrxStrengthPctCol7BinAverage:", v160);

  }
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2RawCount](self, "drxStrengthPctCol2RawCount");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v161, "unsignedIntValue");

  if (v162)
  {
    v163 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2RawSum](self, "drxStrengthPctCol2RawSum");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "floatValue");
    v166 = v165;
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol2RawCount](self, "drxStrengthPctCol2RawCount");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v168 = v166 / (float)objc_msgSend(v167, "unsignedIntValue");
    objc_msgSend(v163, "numberWithFloat:", v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol2RawAverage:](self, "setDrxStrengthPctCol2RawAverage:", v169);

  }
  -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7RawCount](self, "drxStrengthPctCol7RawCount");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = objc_msgSend(v170, "unsignedIntValue");

  if (v171)
  {
    v172 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7RawSum](self, "drxStrengthPctCol7RawSum");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "floatValue");
    v175 = v174;
    -[MesaCoreAnalyticsDailyEvent drxStrengthPctCol7RawCount](self, "drxStrengthPctCol7RawCount");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v177 = v175 / (float)objc_msgSend(v176, "unsignedIntValue");
    objc_msgSend(v172, "numberWithFloat:", v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol7RawAverage:](self, "setDrxStrengthPctCol7RawAverage:", v178);

  }
  -[MesaCoreAnalyticsDailyEvent maxFingerToProbeAttenuationCount](self, "maxFingerToProbeAttenuationCount");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = objc_msgSend(v179, "unsignedIntValue");

  if (v180)
  {
    v181 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent maxFingerToProbeAttenuationSum](self, "maxFingerToProbeAttenuationSum");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "floatValue");
    v184 = v183;
    -[MesaCoreAnalyticsDailyEvent maxFingerToProbeAttenuationCount](self, "maxFingerToProbeAttenuationCount");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v186 = v184 / (float)objc_msgSend(v185, "unsignedIntValue");
    objc_msgSend(v181, "numberWithFloat:", v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setMaxFingerToProbeAttenuationAverage:](self, "setMaxFingerToProbeAttenuationAverage:", v187);

  }
  -[MesaCoreAnalyticsDailyEvent imagePixelOutlierCountCount](self, "imagePixelOutlierCountCount");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = objc_msgSend(v188, "unsignedIntValue");

  if (v189)
  {
    v190 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent imagePixelOutlierCountSum](self, "imagePixelOutlierCountSum");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v191, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent imagePixelOutlierCountCount](self, "imagePixelOutlierCountCount");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "numberWithUnsignedInt:", v192 / objc_msgSend(v193, "unsignedIntValue"));
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setImagePixelOutlierCountAverage:](self, "setImagePixelOutlierCountAverage:", v194);

  }
  -[MesaCoreAnalyticsDailyEvent numPxOutliersPhase1Count](self, "numPxOutliersPhase1Count");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = objc_msgSend(v195, "unsignedIntValue");

  if (v196)
  {
    v197 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent numPxOutliersPhase1Sum](self, "numPxOutliersPhase1Sum");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = objc_msgSend(v198, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent numPxOutliersPhase1Count](self, "numPxOutliersPhase1Count");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "numberWithUnsignedInt:", v199 / objc_msgSend(v200, "unsignedIntValue"));
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setNumPxOutliersPhase1Average:](self, "setNumPxOutliersPhase1Average:", v201);

  }
  -[MesaCoreAnalyticsDailyEvent numPxOutliersPhase2Count](self, "numPxOutliersPhase2Count");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = objc_msgSend(v202, "unsignedIntValue");

  if (v203)
  {
    v204 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent numPxOutliersPhase2Sum](self, "numPxOutliersPhase2Sum");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v206 = objc_msgSend(v205, "unsignedIntValue");
    -[MesaCoreAnalyticsDailyEvent numPxOutliersPhase2Count](self, "numPxOutliersPhase2Count");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "numberWithUnsignedInt:", v206 / objc_msgSend(v207, "unsignedIntValue"));
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setNumPxOutliersPhase2Average:](self, "setNumPxOutliersPhase2Average:", v208);

  }
  -[MesaCoreAnalyticsDailyEvent artefactScoreCount](self, "artefactScoreCount");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = objc_msgSend(v209, "intValue");

  if (v210)
  {
    v211 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent artefactScoreSum](self, "artefactScoreSum");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = objc_msgSend(v212, "intValue");
    -[MesaCoreAnalyticsDailyEvent artefactScoreCount](self, "artefactScoreCount");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "numberWithInt:", (v213 / (int)objc_msgSend(v214, "intValue")));
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setArtefactScoreAverage:](self, "setArtefactScoreAverage:", v215);

  }
  -[MesaCoreAnalyticsDailyEvent artefactStrengthCount](self, "artefactStrengthCount");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = objc_msgSend(v216, "intValue");

  if (v217)
  {
    v218 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent artefactStrengthSum](self, "artefactStrengthSum");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "floatValue");
    v221 = v220;
    -[MesaCoreAnalyticsDailyEvent artefactStrengthCount](self, "artefactStrengthCount");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v223 = v221 / (float)(int)objc_msgSend(v222, "intValue");
    objc_msgSend(v218, "numberWithFloat:", v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setArtefactStrengthAverage:](self, "setArtefactStrengthAverage:", v224);

  }
  -[MesaCoreAnalyticsDailyEvent artefactNonlinearityAverage](self, "artefactNonlinearityAverage");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  if (v225)
  {
    v226 = -[NSMutableArray count](self->_dailyEvents, "count") == 0;

    if (!v226)
    {
      v227 = (void *)MEMORY[0x24BDD16E0];
      -[MesaCoreAnalyticsDailyEvent artefactNonlinearityAverage](self, "artefactNonlinearityAverage");
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "floatValue");
      *(float *)&v230 = v229 / (float)(unint64_t)-[NSMutableArray count](self->_dailyEvents, "count");
      objc_msgSend(v227, "numberWithFloat:", v230);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setArtefactNonlinearityAverage:](self, "setArtefactNonlinearityAverage:", v231);

    }
  }
  -[MesaCoreAnalyticsDailyEvent artefactNonlinearityCount](self, "artefactNonlinearityCount");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = (int)objc_msgSend(v232, "intValue") > 1;

  if (v233)
  {
    v234 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent artefactNonlinearitySumSq](self, "artefactNonlinearitySumSq");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "floatValue");
    v237 = v236;
    -[MesaCoreAnalyticsDailyEvent artefactNonlinearitySum](self, "artefactNonlinearitySum");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "floatValue");
    v240 = v239;
    -[MesaCoreAnalyticsDailyEvent artefactNonlinearitySum](self, "artefactNonlinearitySum");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v241, "floatValue");
    v243 = v242;
    -[MesaCoreAnalyticsDailyEvent artefactNonlinearityCount](self, "artefactNonlinearityCount");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = objc_msgSend(v244, "intValue");
    -[MesaCoreAnalyticsDailyEvent artefactNonlinearityCount](self, "artefactNonlinearityCount");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v247 = sqrtf((float)(v237 - (float)((float)(v240 * v243) / (float)v245))/ (float)(int)objc_msgSend(v246, "intValue"));
    objc_msgSend(v234, "numberWithFloat:", v247);
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setArtefactNonlinearitySTD:](self, "setArtefactNonlinearitySTD:", v248);

  }
  -[MesaCoreAnalyticsDailyEvent artefactAnchorXAverage](self, "artefactAnchorXAverage");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  if (v249)
  {
    v250 = -[NSMutableArray count](self->_dailyEvents, "count") == 0;

    if (!v250)
    {
      v251 = (void *)MEMORY[0x24BDD16E0];
      -[MesaCoreAnalyticsDailyEvent artefactAnchorXAverage](self, "artefactAnchorXAverage");
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v252, "floatValue");
      *(float *)&v254 = v253 / (float)(unint64_t)-[NSMutableArray count](self->_dailyEvents, "count");
      objc_msgSend(v251, "numberWithFloat:", v254);
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setArtefactAnchorXAverage:](self, "setArtefactAnchorXAverage:", v255);

    }
  }
  -[MesaCoreAnalyticsDailyEvent artefactAnchorXCount](self, "artefactAnchorXCount");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v257 = (int)objc_msgSend(v256, "intValue") > 1;

  if (v257)
  {
    v258 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent artefactAnchorXSumSq](self, "artefactAnchorXSumSq");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v259, "floatValue");
    v261 = v260;
    -[MesaCoreAnalyticsDailyEvent artefactAnchorXSum](self, "artefactAnchorXSum");
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v262, "floatValue");
    v264 = v263;
    -[MesaCoreAnalyticsDailyEvent artefactAnchorXSum](self, "artefactAnchorXSum");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v265, "floatValue");
    v267 = v266;
    -[MesaCoreAnalyticsDailyEvent artefactAnchorXCount](self, "artefactAnchorXCount");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = objc_msgSend(v268, "intValue");
    -[MesaCoreAnalyticsDailyEvent artefactAnchorXCount](self, "artefactAnchorXCount");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v271 = sqrtf((float)(v261 - (float)((float)(v264 * v267) / (float)v269))/ (float)(int)objc_msgSend(v270, "intValue"));
    objc_msgSend(v258, "numberWithFloat:", v271);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setArtefactAnchorXSTD:](self, "setArtefactAnchorXSTD:", v272);

  }
  -[MesaCoreAnalyticsDailyEvent artefactAnchorYAverage](self, "artefactAnchorYAverage");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  if (v273)
  {
    v274 = -[NSMutableArray count](self->_dailyEvents, "count") == 0;

    if (!v274)
    {
      v275 = (void *)MEMORY[0x24BDD16E0];
      -[MesaCoreAnalyticsDailyEvent artefactAnchorYAverage](self, "artefactAnchorYAverage");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v276, "floatValue");
      *(float *)&v278 = v277 / (float)(unint64_t)-[NSMutableArray count](self->_dailyEvents, "count");
      objc_msgSend(v275, "numberWithFloat:", v278);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      -[MesaCoreAnalyticsDailyEvent setArtefactAnchorYAverage:](self, "setArtefactAnchorYAverage:", v279);

    }
  }
  -[MesaCoreAnalyticsDailyEvent artefactAnchorYCount](self, "artefactAnchorYCount");
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  v281 = (int)objc_msgSend(v280, "intValue") > 1;

  if (v281)
  {
    v282 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsDailyEvent artefactAnchorYSumSq](self, "artefactAnchorYSumSq");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "floatValue");
    v285 = v284;
    -[MesaCoreAnalyticsDailyEvent artefactAnchorYSum](self, "artefactAnchorYSum");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v286, "floatValue");
    v288 = v287;
    -[MesaCoreAnalyticsDailyEvent artefactAnchorYSum](self, "artefactAnchorYSum");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "floatValue");
    v291 = v290;
    -[MesaCoreAnalyticsDailyEvent artefactAnchorYCount](self, "artefactAnchorYCount");
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    v293 = objc_msgSend(v292, "intValue");
    -[MesaCoreAnalyticsDailyEvent artefactAnchorYCount](self, "artefactAnchorYCount");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v295 = sqrtf((float)(v285 - (float)((float)(v288 * v291) / (float)v293))/ (float)(int)objc_msgSend(v294, "intValue"));
    objc_msgSend(v282, "numberWithFloat:", v295);
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setArtefactAnchorYSTD:](self, "setArtefactAnchorYSTD:", v296);

  }
  -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v298 = objc_msgSend(v297, "unsignedIntValue");

  if (v298)
  {
    v299 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsEvent template1MatchCount](self, "template1MatchCount");
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    v301 = objc_msgSend(v300, "unsignedIntValue");
    -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v299, "numberWithUnsignedInt:", 100 * v301 / objc_msgSend(v302, "unsignedIntValue"));
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setTemplate1Usage:](self, "setTemplate1Usage:", v303);

    v304 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsEvent template2MatchCount](self, "template2MatchCount");
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = objc_msgSend(v305, "unsignedIntValue");
    -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v304, "numberWithUnsignedInt:", 100 * v306 / objc_msgSend(v307, "unsignedIntValue"));
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setTemplate2Usage:](self, "setTemplate2Usage:", v308);

    v309 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsEvent template3MatchCount](self, "template3MatchCount");
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    v311 = objc_msgSend(v310, "unsignedIntValue");
    -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v309, "numberWithUnsignedInt:", 100 * v311 / objc_msgSend(v312, "unsignedIntValue"));
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setTemplate3Usage:](self, "setTemplate3Usage:", v313);

    v314 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsEvent template4MatchCount](self, "template4MatchCount");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    v316 = objc_msgSend(v315, "unsignedIntValue");
    -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v314, "numberWithUnsignedInt:", 100 * v316 / objc_msgSend(v317, "unsignedIntValue"));
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setTemplate4Usage:](self, "setTemplate4Usage:", v318);

    v319 = (void *)MEMORY[0x24BDD16E0];
    -[MesaCoreAnalyticsEvent template5MatchCount](self, "template5MatchCount");
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    v321 = objc_msgSend(v320, "unsignedIntValue");
    -[MesaCoreAnalyticsEvent totalTemplateMatchCount](self, "totalTemplateMatchCount");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v319, "numberWithUnsignedInt:", 100 * v321 / objc_msgSend(v322, "unsignedIntValue"));
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsEvent setTemplate5Usage:](self, "setTemplate5Usage:", v323);

  }
  -[MesaCoreAnalyticsDailyEvent setUnlockEnabled:](self, "setUnlockEnabled:", v357);
  -[MesaCoreAnalyticsDailyEvent setApplePayEnabled:](self, "setApplePayEnabled:", v356);
  -[MesaCoreAnalyticsDailyEvent setEnrolledIdentityCount:](self, "setEnrolledIdentityCount:", v355);
  -[MesaCoreAnalyticsDailyEvent setEnrolledUserCount:](self, "setEnrolledUserCount:", v354);
  -[MesaCoreAnalyticsDailyEvent setTemplateEnrollmentsCount:](self, "setTemplateEnrollmentsCount:", v353);
  -[BiometricKitCoreAnalyticsEvent setTimeSinceLastEnrollment:](self, "setTimeSinceLastEnrollment:", v352);
  -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol2Bin:](self, "setDrxStrengthPctCol2Bin:", v351);
  -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol7Bin:](self, "setDrxStrengthPctCol7Bin:", v350);
  -[MesaCoreAnalyticsDailyEvent setTemperatureBin:](self, "setTemperatureBin:", v349);
  -[MesaCoreAnalyticsDailyEvent setFMRBin:](self, "setFMRBin:", v348);
  -[MesaCoreAnalyticsDailyEvent setBSRBin:](self, "setBSRBin:", v347);
  -[MesaCoreAnalyticsDailyEvent setFitDiffBin:](self, "setFitDiffBin:", v346);
  -[MesaCoreAnalyticsDailyEvent setCarrierAttenBin:](self, "setCarrierAttenBin:", v345);
  -[MesaCoreAnalyticsDailyEvent setDRXAmpMinBin:](self, "setDRXAmpMinBin:", v344);
  -[MesaCoreAnalyticsDailyEvent setDRXAmpMaxBin:](self, "setDRXAmpMaxBin:", v343);
  -[MesaCoreAnalyticsDailyEvent setFitResEdge6SigmaBin:](self, "setFitResEdge6SigmaBin:", v342);
  -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol2Raw:](self, "setDrxStrengthPctCol2Raw:", v341);
  -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol7Raw:](self, "setDrxStrengthPctCol7Raw:", v340);
  -[MesaCoreAnalyticsDailyEvent setTemperatureRaw:](self, "setTemperatureRaw:", v339);
  -[MesaCoreAnalyticsDailyEvent setFMRRaw:](self, "setFMRRaw:", v338);
  -[MesaCoreAnalyticsDailyEvent setBSRRaw:](self, "setBSRRaw:", v337);
  -[MesaCoreAnalyticsDailyEvent setFitDiffRaw:](self, "setFitDiffRaw:", v336);
  -[MesaCoreAnalyticsDailyEvent setCarrierAttenRaw:](self, "setCarrierAttenRaw:", v335);
  -[MesaCoreAnalyticsDailyEvent setDRXAmpMinRaw:](self, "setDRXAmpMinRaw:", v334);
  -[MesaCoreAnalyticsDailyEvent setDRXAmpMaxRaw:](self, "setDRXAmpMaxRaw:", v333);
  -[MesaCoreAnalyticsDailyEvent setFitResEdge6SigmaRaw:](self, "setFitResEdge6SigmaRaw:", v332);
  -[MesaCoreAnalyticsDailyEvent setTimeSinceSecondLastEnrollment:](self, "setTimeSinceSecondLastEnrollment:", v331);
  -[MesaCoreAnalyticsDailyEvent setLastEnrollmentTouchesCount:](self, "setLastEnrollmentTouchesCount:", v330);
  -[MesaCoreAnalyticsDailyEvent setLastEnrollmentDeviceOrientation:](self, "setLastEnrollmentDeviceOrientation:", v329);
  -[MesaCoreAnalyticsDailyEvent setTotalScanCount:](self, "setTotalScanCount:", v328);
  -[MesaCoreAnalyticsDailyEvent setTotalScanGroupCount:](self, "setTotalScanGroupCount:", v327);
  -[MesaCoreAnalyticsDailyEvent setLastEnrollmentScanCount:](self, "setLastEnrollmentScanCount:", v326);
  -[MesaCoreAnalyticsDailyEvent setLastEnrollmentScanGroupCount:](self, "setLastEnrollmentScanGroupCount:", v325);
  -[BiometricKitCoreAnalyticsEvent updateBoundedFieldValue](self, "updateBoundedFieldValue");

}

- (void)addDailyEvent:(id)a3
{
  id v4;
  NSNumber *dailyEventIndex;
  NSMutableArray *dailyEvents;
  void *v7;
  NSNumber *v8;
  NSNumber *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (-[NSNumber unsignedIntValue](self->_dailyEventIndex, "unsignedIntValue") >= 7)
    {
      dailyEventIndex = self->_dailyEventIndex;
      self->_dailyEventIndex = (NSNumber *)&unk_251CB3428;

    }
    dailyEvents = self->_dailyEvents;
    objc_msgSend(v4, "dictionaryRepresentationArchiving:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](dailyEvents, "setObject:atIndexedSubscript:", v7, -[NSNumber unsignedIntegerValue](self->_dailyEventIndex, "unsignedIntegerValue"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NSNumber unsignedIntValue](self->_dailyEventIndex, "unsignedIntValue") + 1);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_dailyEventIndex;
    self->_dailyEventIndex = v8;

    objc_msgSend(v4, "drxStrengthPctCol2Bin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drxStrengthPctCol2Raw");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol2:rawValue:](self, "setDrxStrengthPctCol2:rawValue:", v10, v11);

    objc_msgSend(v4, "drxStrengthPctCol7Bin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "drxStrengthPctCol7Raw");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDrxStrengthPctCol7:rawValue:](self, "setDrxStrengthPctCol7:rawValue:", v12, v13);

    objc_msgSend(v4, "temperatureBin");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setTemperatureBin:](self, "setTemperatureBin:", v14);

    objc_msgSend(v4, "FMRBin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setFMRBin:](self, "setFMRBin:", v15);

    objc_msgSend(v4, "BSRBin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setBSRBin:](self, "setBSRBin:", v16);

    objc_msgSend(v4, "fitDiffBin");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setFitDiffBin:](self, "setFitDiffBin:", v17);

    objc_msgSend(v4, "carrierAttenBin");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setCarrierAttenBin:](self, "setCarrierAttenBin:", v18);

    objc_msgSend(v4, "DRXAmpMinBin");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDRXAmpMinBin:](self, "setDRXAmpMinBin:", v19);

    objc_msgSend(v4, "DRXAmpMaxBin");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDRXAmpMaxBin:](self, "setDRXAmpMaxBin:", v20);

    objc_msgSend(v4, "fitResEdge6SigmaBin");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setFitResEdge6SigmaBin:](self, "setFitResEdge6SigmaBin:", v21);

    objc_msgSend(v4, "temperatureRaw");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setTemperatureRaw:](self, "setTemperatureRaw:", v22);

    objc_msgSend(v4, "FMRRaw");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setFMRRaw:](self, "setFMRRaw:", v23);

    objc_msgSend(v4, "BSRRaw");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setBSRRaw:](self, "setBSRRaw:", v24);

    objc_msgSend(v4, "fitDiffRaw");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setFitDiffRaw:](self, "setFitDiffRaw:", v25);

    objc_msgSend(v4, "carrierAttenRaw");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setCarrierAttenRaw:](self, "setCarrierAttenRaw:", v26);

    objc_msgSend(v4, "DRXAmpMinRaw");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDRXAmpMinRaw:](self, "setDRXAmpMinRaw:", v27);

    objc_msgSend(v4, "DRXAmpMaxRaw");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setDRXAmpMaxRaw:](self, "setDRXAmpMaxRaw:", v28);

    objc_msgSend(v4, "fitResEdge6SigmaRaw");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCoreAnalyticsDailyEvent setFitResEdge6SigmaRaw:](self, "setFitResEdge6SigmaRaw:", v29);

  }
  else
  {
    if (__osLog)
      v30 = __osLog;
    else
      v30 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = 136316162;
      v32 = "dailyEvent";
      v33 = 2048;
      v34 = 0;
      v35 = 2080;
      v36 = "";
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsEvent.m";
      v39 = 1024;
      v40 = 3086;
      _os_log_impl(&dword_24B74E000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v31, 0x30u);
    }
  }

}

- (NSNumber)badDaysCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1584, 1);
}

- (void)setBadDaysCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1584);
}

- (NSNumber)validDaysCount
{
  return (NSNumber *)objc_getProperty(self, a2, 1592, 1);
}

- (void)setValidDaysCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1592);
}

- (NSMutableArray)dailyEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1600, 1);
}

- (NSNumber)dailyEventIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 1608, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyEventIndex, 0);
  objc_storeStrong((id *)&self->_dailyEvents, 0);
  objc_storeStrong((id *)&self->_validDaysCount, 0);
  objc_storeStrong((id *)&self->_badDaysCount, 0);
}

@end
