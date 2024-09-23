@implementation MOEventData

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken_1 != -1)
    dispatch_once(&defineClassCollections_onceToken_1, &__block_literal_global_14);
}

void __37__MOEventData_defineClassCollections__block_invoke(id a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)videoBundleIds;
  videoBundleIds = (uint64_t)&off_1002DC650;

  v2 = (void *)mixedAudioBundleIds;
  mixedAudioBundleIds = (uint64_t)&off_1002DC668;

  v3 = (void *)poiCategoryDictionary;
  poiCategoryDictionary = (uint64_t)&off_1002DD258;

}

- (MOEventData)initWithEvent:(id)a3 islandID:(id)a4 subDate:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  MOEventData *v14;
  MOEventData *v15;
  id os_log;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  SEL v28;
  MOEventData *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MOEventData initWithEvent:islandID:subDate:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: event");
    v28 = a2;
    v29 = self;
    v30 = 97;
    goto LABEL_16;
  }
  if (!v11)
  {
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MOEventData initWithEvent:islandID:subDate:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: islandID != nil");
    v28 = a2;
    v29 = self;
    v30 = 98;
    goto LABEL_16;
  }
  if (!v12)
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[MOEventData initWithEvent:islandID:subDate:].cold.3(v41, v42, v43, v44, v45, v46, v47, v48);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v26 = v25;
    v27 = CFSTR("Invalid parameter not satisfying: subDate");
    v28 = a2;
    v29 = self;
    v30 = 99;
LABEL_16:
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("MOEventData.m"), v30, v27);

    v15 = 0;
    goto LABEL_17;
  }
  v14 = -[MOEventData initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 1);
  if (v14)
  {
    v14->_provider = (unint64_t)objc_msgSend(v10, "provider");
    objc_storeStrong((id *)&v14->_event, a3);
    objc_storeStrong((id *)&v14->_islandID, a4);
    objc_storeStrong((id *)&v14->_subDate, a5);
  }
  self = v14;
  v15 = self;
LABEL_17:

  return v15;
}

- (MOEventData)initWithLoggingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  MOEventData *v5;
  uint64_t v6;
  MOEventData *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];

  v3 = a3;
  +[MOEventData defineClassCollections](MOEventData, "defineClassCollections");
  v47.receiver = self;
  v47.super_class = (Class)MOEventData;
  v5 = -[MOMetric initWithLoggingEnabled:](&v47, "initWithLoggingEnabled:", v3);
  v7 = v5;
  if (v5)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v8 = objc_msgSend((id)objc_opt_class(v5, v6), "BOOLeanKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v7, "metrics"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v11);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = objc_msgSend((id)objc_opt_class(v7, v16), "integerKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v7, "metrics"));
          objc_msgSend(v24, "setObject:forKeyedSubscript:", &off_1002D8AC8, v23);

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v20);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = objc_msgSend((id)objc_opt_class(v7, v25), "bucketedKeys", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v36;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v7, "metrics"));
          objc_msgSend(v33, "setObject:forKeyedSubscript:", &off_1002D8AC8, v32);

          v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      }
      while (v29);
    }

  }
  return v7;
}

+ (id)BOOLeanKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("cooccurrenceCheck"), CFSTR("visitLOI"), CFSTR("photoInferenceMade"), CFSTR("isShared"), CFSTR("isFavorited"), 0);
}

+ (id)integerKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("islandID"), CFSTR("eventID"), CFSTR("sigContactPersonID"), CFSTR("interactionContactScore"), CFSTR("numSigContacts"), CFSTR("numTexts"), CFSTR("numAudioCalls"), CFSTR("numVideoCalls"), CFSTR("numOtherContactType"), CFSTR("numMusic"), CFSTR("numPodcast"), CFSTR("numAudioBook"), CFSTR("numAudio"), CFSTR("numITunesRadio"), CFSTR("numITunesU"), CFSTR("numVideo"), CFSTR("numOther"),
           CFSTR("mediaRepetitions"),
           CFSTR("visitMode"),
           CFSTR("visitPOI"),
           0);
}

+ (id)bucketedKeys
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("provider"), CFSTR("category"), CFSTR("startTimeID"), CFSTR("endTimeID"), CFSTR("visitCategory"), CFSTR("photoInference"), CFSTR("workoutType"), CFSTR("workoutTypeIHA"), CFSTR("sourceApp"), CFSTR("mediaType"), CFSTR("mediaGenre"), CFSTR("sensedLatencyBucketed"), CFSTR("realLatencyBucketed"), CFSTR("DayIDSubDate"), CFSTR("HourIDSubDate"), CFSTR("SubDateYear"), CFSTR("SubDateMonth"),
           CFSTR("SubDateDay"),
           CFSTR("SubDateMinute"),
           CFSTR("durationAudioCalls"),
           CFSTR("durationVideoCalls"),
           CFSTR("durationLeisureMedia"),
           CFSTR("durationMediaOnRepeat"),
           CFSTR("durationMusic"),
           CFSTR("durationPodcast"),
           CFSTR("durationAudioBook"),
           CFSTR("durationAudio"),
           CFSTR("durationITunesRadio"),
           CFSTR("durationITunesU"),
           CFSTR("durationVideo"),
           CFSTR("durationOther"),
           CFSTR("startTimeIDlongestDurationVideo"),
           CFSTR("endTimeIDlongestDurationVideo"),
           CFSTR("startTimeIDlongestDurationCall"),
           CFSTR("endTimeIDlongestDurationCall"),
           0);
}

+ (id)supportedMetricKeys
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v3 = objc_msgSend((id)objc_opt_class(a1, a2), "integerKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v4));

  v7 = objc_msgSend((id)objc_opt_class(a1, v6), "BOOLeanKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  v11 = objc_msgSend((id)objc_opt_class(a1, v10), "bucketedKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v13);

  return v5;
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)0;
}

- (BOOL)submitMetricsWithError:(id *)a3
{
  char *v5;
  objc_super v7;

  switch(self->_provider)
  {
    case 1uLL:
      v5 = MOAnalyticsEventMOEventDataWorkout;
      break;
    case 2uLL:
      v5 = MOAnalyticsEventMOEventDataStorytelling;
      break;
    case 3uLL:
      v5 = MOAnalyticsEventMOEventDataProactive;
      break;
    case 4uLL:
      v5 = MOAnalyticsEventMOEventDataRoutine;
      break;
    default:
      v5 = (char *)objc_msgSend((id)objc_opt_class(self, a2), "event");
      break;
  }
  -[MOEventData setValues](self, "setValues");
  v7.receiver = self;
  v7.super_class = (Class)MOEventData;
  return -[MOMetric submitMetricsWithError:forEvent:](&v7, "submitMetricsWithError:forEvent:", a3, v5);
}

- (void)setValues
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MOEventData *v15;
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
  NSDate *subDate;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSDate *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSNumber *islandID;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  unsigned int v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  unsigned __int8 v83;
  void *v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  NSDate *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NSDate *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  id v108;
  void *v109;
  void *v110;
  int v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  uint64_t v119;
  void *i;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  _UNKNOWN **v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  unsigned int v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _UNKNOWN **v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  unint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  float v175;
  double v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  int v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  _UNKNOWN **v192;
  unsigned int v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  _UNKNOWN **v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  id v210;
  uint64_t v211;
  uint64_t v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  double v229;
  double v230;
  void *v231;
  void *v232;
  double v233;
  double v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  double v240;
  double v241;
  void *v242;
  void *v243;
  double v244;
  double v245;
  void *v246;
  void *v247;
  double v248;
  double v249;
  void *v250;
  void *v251;
  double v252;
  double v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  double v258;
  double v259;
  NSDate *v260;
  void *v261;
  void *v262;
  void *v263;
  NSDate *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  double v270;
  double v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  unsigned int v311;
  unsigned int v312;
  double v313;
  unsigned int v314;
  unsigned int v315;
  void *v316;
  void *v317;
  unsigned int v318;
  double v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  MOEventData *v326;
  MOEventData *v327;
  uint64_t v328;
  uint64_t v329;
  id v330;
  id v331;
  uint64_t v332;
  unsigned int v333;
  id obj;
  id obja;
  unsigned int objb;
  void *v337;
  int v338;
  unint64_t v339;
  unsigned int v340;
  id v341;
  unsigned int v342;
  void *v343;
  unsigned int v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  _BYTE v361[128];
  _BYTE v362[128];
  _BYTE v363[128];
  _BYTE v364[128];

  v337 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D86A8, &off_1002DCF68, &off_1002DCF78));
  v325 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D86A8, &off_1002DCF88, &off_1002DCF98));
  v3 = objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D86A8, &off_1002DCFA8, &off_1002DCFB8));
  v323 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D86A8, &off_1002DCFA8, &off_1002DCFC8));
  v324 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binsFromStart:toEnd:gap:](MOMetric, "binsFromStart:toEnd:gap:", &off_1002D86A8, &off_1002DCFA8, &off_1002DCFD8));
  v321 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v321, "components:fromDate:", 764, self->_subDate));
  v5 = objc_msgSend(v4, "year");
  v6 = objc_msgSend(v4, "month");
  v341 = objc_msgSend(v4, "day");
  v7 = objc_msgSend(v4, "weekday");
  v8 = objc_msgSend(v4, "hour");
  v9 = objc_msgSend(v4, "minute");
  v320 = v4;
  v10 = (uint64_t)((double)(uint64_t)v9 * 60.0 + (double)(uint64_t)v8 * 3600.0 + (double)(uint64_t)objc_msgSend(v4, "second"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("DayIDSubDate"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v10));
  v322 = (void *)v3;
  v14 = v3;
  v15 = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v13, v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("HourIDSubDate"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("SubDateYear"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("SubDateMonth"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v341));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("SubDateDay"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("SubDateMinute"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEvent provider](self->_event, "provider")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("provider"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEvent category](self->_event, "category")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("category"));

  subDate = self->_subDate;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](self->_event, "startDate"));
  -[NSDate timeIntervalSinceDate:](subDate, "timeIntervalSinceDate:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v32, v337));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("startTimeID"));

  v35 = self->_subDate;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self->_event, "endDate"));
  -[NSDate timeIntervalSinceDate:](v35, "timeIntervalSinceDate:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v37, v337));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("endTimeID"));

  islandID = self->_islandID;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v41, "setObject:forKeyedSubscript:", islandID, CFSTR("islandID"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEvent hash](self->_event, "hash") % 0x2710));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("eventID"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSNumber intValue](self->_islandID, "intValue") > 0));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("cooccurrenceCheck"));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self->_event, "endDate"));
  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent creationDate](self->_event, "creationDate"));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent creationDate](self->_event, "creationDate"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self->_event, "endDate"));
      objc_msgSend(v48, "timeIntervalSinceDate:", v49);
      v51 = v50;

      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v51));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v52, v325));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
      objc_msgSend(v54, "setObject:forKeyedSubscript:", v53, CFSTR("sensedLatencyBucketed"));

    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent sourceCreationDate](self->_event, "sourceCreationDate"));

    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent sourceCreationDate](self->_event, "sourceCreationDate"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self->_event, "endDate"));
      objc_msgSend(v56, "timeIntervalSinceDate:", v57);
      v59 = v58;

      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v59));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v60, v325));
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("realLatencyBucketed"));

    }
  }
  switch(self->_provider)
  {
    case 1uLL:
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent workoutType](self->_event, "workoutType"));
      v64 = +[HKWorkout _workoutActivityTypeFromString:](HKWorkout, "_workoutActivityTypeFromString:", v63);

      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v64));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, CFSTR("workoutType"));

      if (objc_opt_class(MCProfileConnection, v67))
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
        v69 = objc_msgSend(v68, "isHealthDataSubmissionAllowed");

        if (v69)
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v64));
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v70, CFSTR("workoutTypeIHA"));

        }
      }
      goto LABEL_177;
    case 2uLL:
      v343 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotoMomentTags getInferenceTagMap](MOPhotoMomentTags, "getInferenceTagMap"));
      v349 = 0u;
      v350 = 0u;
      v351 = 0u;
      v352 = 0u;
      v326 = self;
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent extendedAttributes](self->_event, "extendedAttributes"));
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "photoMomentInferences"));

      obja = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v349, v362, 16);
      if (obja)
      {
        v111 = 0;
        v330 = v110;
        v332 = *(_QWORD *)v350;
        while (1)
        {
          v112 = 0;
          if (v111 <= 1)
            v113 = 1;
          else
            v113 = v111;
          v339 = (v113 - v111);
          do
          {
            if (*(_QWORD *)v350 != v332)
              objc_enumerationMutation(v330);
            v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v349 + 1)
                                                                                + 8 * (_QWORD)v112), "lowercaseString"));
            v115 = v114;
            if (v112 == (void *)v339)
            {

              goto LABEL_74;
            }
            v347 = 0u;
            v348 = 0u;
            v345 = 0u;
            v346 = 0u;
            v116 = v343;
            v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v345, v361, 16);
            if (v117)
            {
              v118 = v117;
              v119 = *(_QWORD *)v346;
              while (2)
              {
                for (i = 0; i != v118; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v346 != v119)
                    objc_enumerationMutation(v116);
                  v121 = *(_QWORD *)(*((_QWORD *)&v345 + 1) + 8 * (_QWORD)i);
                  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "objectForKeyedSubscript:", v121));
                  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "lowercaseString"));
                  if (objc_msgSend(v115, "containsString:", v123))
                  {
                    v124 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v326, "metrics"));
                    objc_msgSend(v124, "setObject:forKeyedSubscript:", v121, CFSTR("photoInference"));

                    goto LABEL_67;
                  }

                }
                v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v345, v361, 16);
                if (v118)
                  continue;
                break;
              }
            }
LABEL_67:
            ++v111;

            v112 = (char *)v112 + 1;
          }
          while (v112 != obja);
          obja = objc_msgSend(v330, "countByEnumeratingWithState:objects:count:", &v349, v362, 16);
          if (!obja)
          {

            if (!v111)
              goto LABEL_81;
LABEL_74:
            v130 = &__kCFBooleanTrue;
            goto LABEL_82;
          }
        }
      }

LABEL_81:
      v130 = &__kCFBooleanFalse;
LABEL_82:
      v136 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v326, "metrics"));
      objc_msgSend(v136, "setObject:forKeyedSubscript:", v130, CFSTR("photoInferenceMade"));

      v137 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v326, "metrics"));
      objc_msgSend(v137, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("isShared"));

      v138 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v326, "metrics"));
      objc_msgSend(v138, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("isFavorited"));

      goto LABEL_177;
    case 3uLL:
      if ((id)-[MOEvent category](self->_event, "category") == (id)10)
      {
        v359 = 0u;
        v360 = 0u;
        v357 = 0u;
        v358 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(-[MOEvent interactions](self->_event, "interactions"));
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v364, 16);
        if (v72)
        {
          v73 = v72;
          v315 = 0;
          v318 = 0;
          v328 = 0;
          v74 = 0;
          v75 = 0;
          v76 = *(_QWORD *)v358;
          v77 = 0.0;
          v78 = 0.0;
          v79 = 0.0;
          do
          {
            v80 = 0;
            v331 = v73;
            do
            {
              if (*(_QWORD *)v358 != v76)
                objc_enumerationMutation(obj);
              v81 = *(void **)(*((_QWORD *)&v357 + 1) + 8 * (_QWORD)v80);
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "bundleId"));
              v83 = objc_msgSend(v82, "containsString:", CFSTR("com.apple."));

              if ((v83 & 1) != 0)
              {
                HIDWORD(v328) = 1;
              }
              else
              {
                v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "bundleId"));
                v85 = v84 != 0;

                v75 |= v85;
              }
              if (!objc_msgSend(v81, "mechanism")
                || objc_msgSend(v81, "mechanism") == (id)8
                || objc_msgSend(v81, "mechanism") == (id)9
                || objc_msgSend(v81, "mechanism") == (id)11
                || objc_msgSend(v81, "mechanism") == (id)16)
              {
                v74 = (v74 + 1);
                v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "endDate"));
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "startDate"));
                objc_msgSend(v86, "timeIntervalSinceDate:", v87);
                v89 = v88;

                v79 = v79 + v89;
              }
              else if (objc_msgSend(v81, "mechanism") == (id)12 || objc_msgSend(v81, "mechanism") == (id)17)
              {
                LODWORD(v328) = v328 + 1;
                v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "endDate"));
                v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "startDate"));
                objc_msgSend(v104, "timeIntervalSinceDate:", v105);
                v107 = v106;

                v78 = v78 + v107;
              }
              else if (objc_msgSend(v81, "mechanism") == (id)1
                     || objc_msgSend(v81, "mechanism") == (id)2
                     || objc_msgSend(v81, "mechanism") == (id)3
                     || objc_msgSend(v81, "mechanism") == (id)4
                     || objc_msgSend(v81, "mechanism") == (id)13)
              {
                ++v318;
              }
              else
              {
                ++v315;
              }
              if (!objc_msgSend(v81, "mechanism")
                || objc_msgSend(v81, "mechanism") == (id)8
                || objc_msgSend(v81, "mechanism") == (id)9
                || objc_msgSend(v81, "mechanism") == (id)11
                || objc_msgSend(v81, "mechanism") == (id)16
                || objc_msgSend(v81, "mechanism") == (id)12
                || objc_msgSend(v81, "mechanism") == (id)17)
              {
                v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "endDate"));
                v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "startDate"));
                objc_msgSend(v90, "timeIntervalSinceDate:", v91);
                v93 = v92;

                if (v93 > v77)
                {
                  v338 = v75;
                  v94 = v15->_subDate;
                  v342 = v74;
                  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "startDate"));
                  -[NSDate timeIntervalSinceDate:](v94, "timeIntervalSinceDate:", v95);
                  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                  v97 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v96, v337));
                  v98 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
                  objc_msgSend(v98, "setObject:forKeyedSubscript:", v97, CFSTR("startTimeIDlongestDurationCall"));

                  v75 = v338;
                  v99 = v15->_subDate;
                  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "endDate"));
                  -[NSDate timeIntervalSinceDate:](v99, "timeIntervalSinceDate:", v100);
                  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                  v73 = v331;
                  v102 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v101, v337));
                  v103 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
                  objc_msgSend(v103, "setObject:forKeyedSubscript:", v102, CFSTR("endTimeIDlongestDurationCall"));

                  v74 = v342;
                  v77 = v93;
                }
              }
              v80 = (char *)v80 + 1;
            }
            while (v73 != v80);
            v108 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v364, 16);
            v73 = v108;
          }
          while (v108);
        }
        else
        {
          v315 = 0;
          v318 = 0;
          v328 = 0;
          v74 = 0;
          v75 = 0;
          v78 = 0.0;
          v79 = 0.0;
        }

        v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v74));
        v155 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v155, "setObject:forKeyedSubscript:", v154, CFSTR("numAudioCalls"));

        v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v79));
        v157 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v156, v323));
        v158 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v158, "setObject:forKeyedSubscript:", v157, CFSTR("durationAudioCalls"));

        v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v328));
        v160 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v160, "setObject:forKeyedSubscript:", v159, CFSTR("numVideoCalls"));

        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v78));
        v162 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v161, v323));
        v163 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v163, "setObject:forKeyedSubscript:", v162, CFSTR("durationVideoCalls"));

        v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v318));
        v165 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v165, "setObject:forKeyedSubscript:", v164, CFSTR("numTexts"));

        v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v315));
        v167 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v167, "setObject:forKeyedSubscript:", v166, CFSTR("numOtherContactType"));

        v168 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent interactionScoredContact](v15->_event, "interactionScoredContact"));
        v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "contact"));
        v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "identifier"));
        v171 = (unint64_t)objc_msgSend(v170, "hash") % 0x2710;

        v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v171));
        v173 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v173, "setObject:forKeyedSubscript:", v172, CFSTR("sigContactPersonID"));

        v174 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent interactionContactScore](v15->_event, "interactionContactScore"));
        objc_msgSend(v174, "floatValue");
        *(float *)&v176 = v175 * 100.0;
        v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v176));

        v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v141, "intValue")));
        v178 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v178, "setObject:forKeyedSubscript:", v177, CFSTR("interactionContactScore"));

        v179 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent interactionContacts](v15->_event, "interactionContacts"));
        v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v179, "count")));
        v181 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v181, "setObject:forKeyedSubscript:", v180, CFSTR("numSigContacts"));

        v182 = v75 ^ 1;
        if (((HIDWORD(v328) ^ 1) & 1) == 0 && (v182 & 1) == 0)
        {
          v183 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          objc_msgSend(v183, "setObject:forKeyedSubscript:", &off_1002D8B28, CFSTR("sourceApp"));

        }
        if (((HIDWORD(v328) | v182) & 1) == 0)
        {
          v184 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          objc_msgSend(v184, "setObject:forKeyedSubscript:", &off_1002D8B10, CFSTR("sourceApp"));

        }
        if (((HIDWORD(v328) ^ 1 | v75) & 1) == 0)
        {
          v185 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          objc_msgSend(v185, "setObject:forKeyedSubscript:", &off_1002D8AE0, CFSTR("sourceApp"));

        }
        if (((HIDWORD(v328) | v75) & 1) == 0)
        {
          v186 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          objc_msgSend(v186, "setObject:forKeyedSubscript:", &off_1002D8B58, CFSTR("sourceApp"));

        }
      }
      else
      {
        v131 = objc_claimAutoreleasedReturnValue(-[MOEvent mediaPlayerBundleId](self->_event, "mediaPlayerBundleId"));
        if (v131)
        {
          v132 = (void *)v131;
          v133 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaPlayerBundleId](self->_event, "mediaPlayerBundleId"));
          v134 = objc_msgSend(v133, "containsString:", CFSTR("com.apple."));

          if (v134)
          {
            v135 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
            objc_msgSend(v135, "setObject:forKeyedSubscript:", &off_1002D8AE0, CFSTR("sourceApp"));

            goto LABEL_103;
          }
        }
        v139 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaPlayerBundleId](self->_event, "mediaPlayerBundleId"));

        v140 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
        v141 = v140;
        if (v139)
          v142 = &off_1002D8B10;
        else
          v142 = &off_1002D8B58;
        objc_msgSend(v140, "setObject:forKeyedSubscript:", v142, CFSTR("sourceApp"));
      }

LABEL_103:
      v187 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaGenre](v15->_event, "mediaGenre"));

      if (v187)
      {
        v188 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaGenre](v15->_event, "mediaGenre"));
        v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "lowercaseString"));

        if (objc_msgSend(v189, "containsString:", CFSTR("alternative")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8AE0;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("blues")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8AF8;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("children")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8B10;
        }
        else if ((objc_msgSend(v189, "containsString:", CFSTR("christian")) & 1) != 0
               || objc_msgSend(v189, "containsString:", CFSTR("gospel")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8B28;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("classical")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8B40;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("comedy")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8B70;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("country")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8B88;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("dance")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8BA0;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("electronic")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8BB8;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("hip"))
               && objc_msgSend(v189, "containsString:", CFSTR("hop")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8BD0;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("rap")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8BE8;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("jazz")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8C00;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("pop")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8C18;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("latin")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8C30;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("classic"))
               && objc_msgSend(v189, "containsString:", CFSTR("rock")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8C48;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("rock")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8C60;
        }
        else if ((objc_msgSend(v189, "containsString:", CFSTR("r&b")) & 1) != 0
               || objc_msgSend(v189, "containsString:", CFSTR("rb")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8C78;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("soul")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8C90;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("reggae")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8CA8;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("singer")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8CC0;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("songwriter")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8CD8;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("sound"))
               && objc_msgSend(v189, "containsString:", CFSTR("track")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8CF0;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("worldwide")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8D08;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("hits")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8D20;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("oldie")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8D38;
        }
        else if (objc_msgSend(v189, "containsString:", CFSTR("indie")))
        {
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          v192 = &off_1002D8D50;
        }
        else
        {
          v312 = objc_msgSend(v189, "containsString:", CFSTR("metal"));
          v190 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v191 = v190;
          if (v312)
            v192 = &off_1002D8D68;
          else
            v192 = &off_1002D8D80;
        }
        objc_msgSend(v190, "setObject:forKeyedSubscript:", v192, CFSTR("mediaGenre"));

      }
      else
      {
        v189 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v189, "setObject:forKeyedSubscript:", &off_1002D8B58, CFSTR("mediaGenre"));
      }

      v194 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaType](v15->_event, "mediaType"));
      if (v194)
      {
        v195 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaType](v15->_event, "mediaType"));
        v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "lowercaseString"));

        if (objc_msgSend(v196, "containsString:", CFSTR("music")))
        {
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v198 = v197;
          v199 = &off_1002D8AE0;
        }
        else if (objc_msgSend(v196, "containsString:", CFSTR("podcast")))
        {
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v198 = v197;
          v199 = &off_1002D8AF8;
        }
        else if (objc_msgSend(v196, "containsString:", CFSTR("audio"))
               && objc_msgSend(v196, "containsString:", CFSTR("book")))
        {
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v198 = v197;
          v199 = &off_1002D8B10;
        }
        else if (objc_msgSend(v196, "containsString:", CFSTR("audio")))
        {
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v198 = v197;
          v199 = &off_1002D8B70;
        }
        else if (objc_msgSend(v196, "containsString:", CFSTR("itune"))
               && objc_msgSend(v196, "containsString:", CFSTR("radio")))
        {
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v198 = v197;
          v199 = &off_1002D8B40;
        }
        else if (objc_msgSend(v196, "containsString:", CFSTR("itune")))
        {
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v198 = v197;
          v199 = &off_1002D8B28;
        }
        else
        {
          v311 = objc_msgSend(v196, "containsString:", CFSTR("video"));
          v197 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
          v198 = v197;
          if (v311)
            v199 = &off_1002D8B88;
          else
            v199 = &off_1002D8BA0;
        }
        objc_msgSend(v197, "setObject:forKeyedSubscript:", v199, CFSTR("mediaType"));

      }
      else
      {
        v196 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v196, "setObject:forKeyedSubscript:", &off_1002D8B58, CFSTR("mediaType"));
      }

      if ((id)-[MOEvent category](v15->_event, "category") == (id)4)
      {
        v200 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaSumTimePlayed](v15->_event, "mediaSumTimePlayed"));
        v201 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v200, v324));
        v202 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v202, "setObject:forKeyedSubscript:", v201, CFSTR("durationLeisureMedia"));

      }
      if ((id)-[MOEvent category](v15->_event, "category") == (id)3)
      {
        v203 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaSumTimePlayed](v15->_event, "mediaSumTimePlayed"));
        v204 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v203, v324));
        v205 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v205, "setObject:forKeyedSubscript:", v204, CFSTR("durationMediaOnRepeat"));

        v206 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaRepetitions](v15->_event, "mediaRepetitions"));
        v207 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v15, "metrics"));
        objc_msgSend(v207, "setObject:forKeyedSubscript:", v206, CFSTR("mediaRepetitions"));

      }
      if ((id)-[MOEvent category](v15->_event, "category") != (id)6)
        goto LABEL_177;
      v355 = 0u;
      v356 = 0u;
      v353 = 0u;
      v354 = 0u;
      v327 = v15;
      v208 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent mediaPlaySessions](v15->_event, "mediaPlaySessions"));
      v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v353, v363, 16);
      if (!v209)
      {
        objb = 0;
        v333 = 0;
        v329 = 0;
        v340 = 0;
        v314 = 0;
        v344 = 0;
        v211 = 0;
        v214 = 0.0;
        v215 = 0.0;
        v216 = 0.0;
        v217 = 0.0;
        v319 = 0.0;
        v218 = 0.0;
        v219 = 0.0;
        v313 = 0.0;
LABEL_175:

        v272 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v211));
        v273 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v273, "setObject:forKeyedSubscript:", v272, CFSTR("numMusic"));

        v274 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v214));
        v275 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v274, v324));
        v276 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v276, "setObject:forKeyedSubscript:", v275, CFSTR("durationMusic"));

        v277 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v344));
        v278 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v278, "setObject:forKeyedSubscript:", v277, CFSTR("numPodcast"));

        v279 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v215));
        v280 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v279, v324));
        v281 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v281, "setObject:forKeyedSubscript:", v280, CFSTR("durationPodcast"));

        v282 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objb));
        v283 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v283, "setObject:forKeyedSubscript:", v282, CFSTR("numAudioBook"));

        v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v216));
        v285 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v284, v324));
        v286 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v286, "setObject:forKeyedSubscript:", v285, CFSTR("durationAudioBook"));

        v287 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v340));
        v288 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v288, "setObject:forKeyedSubscript:", v287, CFSTR("numAudio"));

        v289 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v218));
        v290 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v289, v324));
        v291 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v291, "setObject:forKeyedSubscript:", v290, CFSTR("durationAudio"));

        v292 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v329));
        v293 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v293, "setObject:forKeyedSubscript:", v292, CFSTR("numITunesRadio"));

        v294 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v319));
        v295 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v294, v324));
        v296 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v296, "setObject:forKeyedSubscript:", v295, CFSTR("durationITunesRadio"));

        v297 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v333));
        v298 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v298, "setObject:forKeyedSubscript:", v297, CFSTR("numITunesU"));

        v299 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v217));
        v300 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v299, v324));
        v301 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v301, "setObject:forKeyedSubscript:", v300, CFSTR("durationITunesU"));

        v302 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", HIDWORD(v329)));
        v303 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v303, "setObject:forKeyedSubscript:", v302, CFSTR("numVideo"));

        v304 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v219));
        v305 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v304, v324));
        v306 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v306, "setObject:forKeyedSubscript:", v305, CFSTR("durationVideo"));

        v307 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v314));
        v308 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v308, "setObject:forKeyedSubscript:", v307, CFSTR("numOther"));

        v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v313));
        v309 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v126, v324));
        v310 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
        objc_msgSend(v310, "setObject:forKeyedSubscript:", v309, CFSTR("durationOther"));

        goto LABEL_176;
      }
      v210 = v209;
      objb = 0;
      v333 = 0;
      v329 = 0;
      v340 = 0;
      v314 = 0;
      v344 = 0;
      v211 = 0;
      v212 = *(_QWORD *)v354;
      v213 = 0.0;
      v214 = 0.0;
      v215 = 0.0;
      v216 = 0.0;
      v217 = 0.0;
      v319 = 0.0;
      v218 = 0.0;
      v219 = 0.0;
      v313 = 0.0;
LABEL_142:
      v220 = 0;
      while (1)
      {
        if (*(_QWORD *)v354 != v212)
          objc_enumerationMutation(v208);
        v221 = *(void **)(*((_QWORD *)&v353 + 1) + 8 * v220);
        v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "mediaType"));
        v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "lowercaseString"));

        if ((objc_msgSend(v223, "containsString:", CFSTR("music")) & 1) != 0)
          break;
        v224 = (void *)mixedAudioBundleIds;
        v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "bundleId"));
        if ((objc_msgSend(v224, "containsObject:", v225) & 1) != 0)
        {
          v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "artist"));

          if (v226)
            break;
        }
        else
        {

        }
        if ((objc_msgSend(v223, "containsString:", CFSTR("podcast")) & 1) == 0)
        {
          v235 = (void *)mixedAudioBundleIds;
          v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "bundleId"));
          if ((objc_msgSend(v235, "containsObject:", v236) & 1) == 0)
          {

LABEL_156:
            if (objc_msgSend(v223, "containsString:", CFSTR("audio"))
              && objc_msgSend(v223, "containsString:", CFSTR("book")))
            {
              ++objb;
              v238 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
              v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
              objc_msgSend(v238, "timeIntervalSinceDate:", v239);
              v241 = v240;

              v216 = v216 + v241;
            }
            else if (objc_msgSend(v223, "containsString:", CFSTR("audio")))
            {
              ++v340;
              v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
              v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
              objc_msgSend(v242, "timeIntervalSinceDate:", v243);
              v245 = v244;

              v218 = v218 + v245;
            }
            else if (objc_msgSend(v223, "containsString:", CFSTR("itune"))
                   && objc_msgSend(v223, "containsString:", CFSTR("radio")))
            {
              LODWORD(v329) = v329 + 1;
              v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
              v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
              objc_msgSend(v246, "timeIntervalSinceDate:", v247);
              v249 = v248;

              v319 = v319 + v249;
            }
            else if (objc_msgSend(v223, "containsString:", CFSTR("itune")))
            {
              ++v333;
              v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
              v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
              objc_msgSend(v250, "timeIntervalSinceDate:", v251);
              v253 = v252;

              v217 = v217 + v253;
            }
            else if ((objc_msgSend(v223, "containsString:", CFSTR("video")) & 1) != 0
                   || (v254 = (void *)videoBundleIds,
                       v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "bundleId")),
                       LODWORD(v254) = objc_msgSend(v254, "containsObject:", v255),
                       v255,
                       (_DWORD)v254))
            {
              ++HIDWORD(v329);
              v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
              v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
              objc_msgSend(v256, "timeIntervalSinceDate:", v257);
              v259 = v258;

              v219 = v219 + v259;
              if (v259 > v213)
              {
                v260 = v327->_subDate;
                v316 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
                -[NSDate timeIntervalSinceDate:](v260, "timeIntervalSinceDate:", v316);
                v261 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v262 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v261, v337));
                v263 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
                objc_msgSend(v263, "setObject:forKeyedSubscript:", v262, CFSTR("startTimeIDlongestDurationVideo"));

                v264 = v327->_subDate;
                v317 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
                -[NSDate timeIntervalSinceDate:](v264, "timeIntervalSinceDate:", v317);
                v265 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                v266 = (void *)objc_claimAutoreleasedReturnValue(+[MOMetric binForNumber:bins:](MOMetric, "binForNumber:bins:", v265, v337));
                v267 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](v327, "metrics"));
                objc_msgSend(v267, "setObject:forKeyedSubscript:", v266, CFSTR("endTimeIDlongestDurationVideo"));

                v213 = v259;
              }
            }
            else
            {
              ++v314;
              v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
              v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
              objc_msgSend(v268, "timeIntervalSinceDate:", v269);
              v271 = v270;

              v313 = v313 + v271;
            }
            goto LABEL_171;
          }
          v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "artist"));

          if (v237)
            goto LABEL_156;
        }
        ++v344;
        v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
        v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
        objc_msgSend(v231, "timeIntervalSinceDate:", v232);
        v234 = v233;

        v215 = v215 + v234;
LABEL_171:

        if (v210 == (id)++v220)
        {
          v210 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v353, v363, 16);
          if (!v210)
            goto LABEL_175;
          goto LABEL_142;
        }
      }
      v211 = (v211 + 1);
      v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "endDate"));
      v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "startDate"));
      objc_msgSend(v227, "timeIntervalSinceDate:", v228);
      v230 = v229;

      v214 = v214 + v230;
      goto LABEL_171;
    case 4uLL:
      v125 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent placeName](self->_event, "placeName"));
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "lowercaseString"));

      if (objc_msgSend(v126, "containsString:", CFSTR("home")))
      {
        v127 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
        v128 = v127;
        v129 = &off_1002D8AE0;
LABEL_87:
        objc_msgSend(v127, "setObject:forKeyedSubscript:", v129, CFSTR("visitCategory"));
        v143 = &__kCFBooleanTrue;
        goto LABEL_88;
      }
      if (objc_msgSend(v126, "containsString:", CFSTR("work")))
      {
        v127 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
        v128 = v127;
        v129 = &off_1002D8AF8;
        goto LABEL_87;
      }
      if (objc_msgSend(v126, "containsString:", CFSTR("gym")))
      {
        v127 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
        v128 = v127;
        v129 = &off_1002D8B10;
        goto LABEL_87;
      }
      v193 = objc_msgSend(v126, "containsString:", CFSTR("school"));
      v127 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
      v128 = v127;
      if (v193)
      {
        v129 = &off_1002D8B28;
        goto LABEL_87;
      }
      objc_msgSend(v127, "setObject:forKeyedSubscript:", &off_1002D8B40, CFSTR("visitCategory"));
      v143 = &__kCFBooleanFalse;
LABEL_88:

      v144 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
      objc_msgSend(v144, "setObject:forKeyedSubscript:", v143, CFSTR("visitLOI"));

      v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MOEvent mode](self->_event, "mode")));
      v146 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
      objc_msgSend(v146, "setObject:forKeyedSubscript:", v145, CFSTR("visitMode"));

      v147 = (void *)poiCategoryDictionary;
      v148 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent poiCategory](self->_event, "poiCategory"));
      v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKeyedSubscript:", v148));

      if (v149)
      {
        v150 = (void *)poiCategoryDictionary;
        v151 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent poiCategory](self->_event, "poiCategory"));
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "objectForKeyedSubscript:", v151));
        v153 = (void *)objc_claimAutoreleasedReturnValue(-[MOMetric metrics](self, "metrics"));
        objc_msgSend(v153, "setObject:forKeyedSubscript:", v152, CFSTR("visitPOI"));

      }
LABEL_176:

LABEL_177:
      return;
    default:
      goto LABEL_177;
  }
}

- (MOEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (NSNumber)islandID
{
  return self->_islandID;
}

- (void)setIslandID:(id)a3
{
  objc_storeStrong((id *)&self->_islandID, a3);
}

- (NSDate)subDate
{
  return self->_subDate;
}

- (void)setSubDate:(id)a3
{
  objc_storeStrong((id *)&self->_subDate, a3);
}

- (unint64_t)provider
{
  return self->_provider;
}

- (void)setProvider:(unint64_t)a3
{
  self->_provider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subDate, 0);
  objc_storeStrong((id *)&self->_islandID, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)initWithEvent:(uint64_t)a3 islandID:(uint64_t)a4 subDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: event", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithEvent:(uint64_t)a3 islandID:(uint64_t)a4 subDate:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: islandID != nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithEvent:(uint64_t)a3 islandID:(uint64_t)a4 subDate:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Invalid parameter not satisfying: subDate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

@end
