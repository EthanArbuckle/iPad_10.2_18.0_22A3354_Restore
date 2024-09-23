@implementation RTEntitlementProvider

- (Protocol)protocol
{
  return self->_protocol;
}

- (BOOL)clientConnection:(id)a3 satisfiesEntitlementRequirementsForInvocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  uint8_t *v18;
  NSDictionary *entitlementsDictionary;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  BOOL v27;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[16];
  _BYTE buf[12];
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: connection";
LABEL_13:
      v18 = buf;
LABEL_14:
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    }
LABEL_28:

LABEL_29:
    v27 = 0;
    goto LABEL_30;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: invocation";
      goto LABEL_13;
    }
    goto LABEL_28;
  }
  if (!sel_isEqual((SEL)objc_msgSend(v7, "selector"), sel_fetchEnumerableObjectsWithOptions_offset_reply_))
  {
    entitlementsDictionary = self->_entitlementsDictionary;
    NSStringFromSelector((SEL)objc_msgSend(v8, "selector"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](entitlementsDictionary, "objectForKey:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_7:
      _rt_log_facility_get_os_log(RTLogFacilityClient);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        NSStringFromSelector((SEL)objc_msgSend(v8, "selector"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v16;
        _os_log_fault_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_FAULT, "\"%@\" requires no entitlements.", buf, 0xCu);

      }
      goto LABEL_28;
    }
    goto LABEL_16;
  }
  *(_QWORD *)buf = 0;
  objc_msgSend(v8, "getArgument:atIndex:", buf, 2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)v39 = 0;
    v17 = "Invalid parameter not satisfying: [options isKindOfClass:[RTEnumerationOptions class]]";
    v18 = v39;
    goto LABEL_14;
  }
  v9 = self->_entitlementsDictionary;
  NSStringFromSelector((SEL)objc_msgSend(v8, "selector"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v39 = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [optionsEntitlements isKindOfClass:[NSDictionary class]]", v39, 2u);
    }

    goto LABEL_29;
  }
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_7;
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [requiredEntitlements isKindOfClass:[NSArray class]]", buf, 2u);
    }

    goto LABEL_29;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v14;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (!v22)
  {
    v27 = 1;
    goto LABEL_42;
  }
  v23 = v22;
  v24 = *(_QWORD *)v36;
  while (2)
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v36 != v24)
        objc_enumerationMutation(v21);
      v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
LABEL_41:

          v27 = 0;
          goto LABEL_42;
        }
        *(_WORD *)buf = 0;
        v32 = "Invalid parameter not satisfying: [entitlement isKindOfClass:[NSString class]]";
        v33 = v31;
        v34 = 2;
LABEL_45:
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
        goto LABEL_41;
      }
      if (!-[RTEntitlementProvider clientConnection:hasEntitlement:](self, "clientConnection:hasEntitlement:", v6, v26, (_QWORD)v35))
      {
        _rt_log_facility_get_os_log(RTLogFacilityClient);
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_41;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        v41 = 2112;
        v42 = v26;
        v32 = "%@, does not have entitlement, %@";
        v33 = v31;
        v34 = 22;
        goto LABEL_45;
      }
    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    v27 = 1;
    if (v23)
      continue;
    break;
  }
LABEL_42:

LABEL_30:
  return v27;
}

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v14;
  __int16 v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      v9 = 0;
      goto LABEL_11;
    }
    v15 = 0;
    v11 = "Invalid parameter not satisfying: connection";
    v12 = (uint8_t *)&v15;
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_8;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v14 = 0;
    v11 = "Invalid parameter not satisfying: entitlement";
    v12 = (uint8_t *)&v14;
    goto LABEL_13;
  }
  objc_msgSend(v5, "valueForEntitlement:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = objc_msgSend(v8, "BOOLValue");
  else
    v9 = 0;

LABEL_11:
  return v9;
}

+ (id)daemonProtocolEntitlementProvider
{
  uint64_t v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RTEntitlementProvider *v16;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
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
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  const __CFString *v190;
  const __CFString *v191;
  const __CFString *v192;
  const __CFString *v193;
  const __CFString *v194;
  const __CFString *v195;
  const __CFString *v196;
  const __CFString *v197;
  const __CFString *v198;
  const __CFString *v199;
  const __CFString *v200;
  const __CFString *v201;
  const __CFString *v202;
  const __CFString *v203;
  _QWORD v204[3];
  _QWORD v205[3];
  const __CFString *v206;
  const __CFString *v207;
  const __CFString *v208;
  const __CFString *v209;
  const __CFString *v210;
  const __CFString *v211;
  const __CFString *v212;
  const __CFString *v213;
  const __CFString *v214;
  const __CFString *v215;
  const __CFString *v216;
  const __CFString *v217;
  const __CFString *v218;
  const __CFString *v219;
  const __CFString *v220;
  const __CFString *v221;
  const __CFString *v222;
  const __CFString *v223;
  const __CFString *v224;
  const __CFString *v225;
  const __CFString *v226;
  const __CFString *v227;
  const __CFString *v228;
  const __CFString *v229;
  const __CFString *v230;
  const __CFString *v231;
  const __CFString *v232;
  const __CFString *v233;
  const __CFString *v234;
  const __CFString *v235;
  const __CFString *v236;
  const __CFString *v237;
  const __CFString *v238;
  const __CFString *v239;
  const __CFString *v240;
  const __CFString *v241;
  const __CFString *v242;
  const __CFString *v243;
  const __CFString *v244;
  const __CFString *v245;
  const __CFString *v246;
  const __CFString *v247;
  const __CFString *v248;
  const __CFString *v249;
  const __CFString *v250;
  const __CFString *v251;
  const __CFString *v252;
  const __CFString *v253;
  const __CFString *v254;
  const __CFString *v255;
  const __CFString *v256;
  const __CFString *v257;
  const __CFString *v258;
  const __CFString *v259;
  const __CFString *v260;
  const __CFString *v261;
  const __CFString *v262;
  const __CFString *v263;
  const __CFString *v264;
  const __CFString *v265;
  const __CFString *v266;
  const __CFString *v267;
  const __CFString *v268;
  const __CFString *v269;
  _QWORD v270[2];
  const __CFString *v271;
  const __CFString *v272;
  const __CFString *v273;
  const __CFString *v274;
  const __CFString *v275;
  const __CFString *v276;
  const __CFString *v277;
  const __CFString *v278;
  const __CFString *v279;
  _QWORD v280[88];
  _QWORD v281[90];

  v281[88] = *MEMORY[0x1E0C80C00];
  v189 = &unk_1EFC794E0;
  NSStringFromSelector(sel_setRoutineEnabled_reply_);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v280[0] = v188;
  v279 = CFSTR("com.apple.CoreRoutine.preferences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v279, 1);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v281[0] = v187;
  NSStringFromSelector(sel_clearRoutineWithReply_);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v280[1] = v186;
  v278 = CFSTR("com.apple.CoreRoutine.preferences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v278, 1);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v281[1] = v185;
  NSStringFromSelector(sel_fetchPathToDiagnosticFilesWithOptions_reply_);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v280[2] = v184;
  v277 = CFSTR("com.apple.CoreRoutine.preferences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v277, 1);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v281[2] = v183;
  NSStringFromSelector(sel_fetchRoutineEnabledWithReply_);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v280[3] = v182;
  v2 = MEMORY[0x1E0C9AA60];
  v281[3] = MEMORY[0x1E0C9AA60];
  NSStringFromSelector(sel_setRestorationIdentifier_);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v280[4] = v181;
  v281[4] = v2;
  NSStringFromSelector(sel_setTargetUserSession_);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v280[5] = v180;
  v276 = CFSTR("com.apple.private.xpc.launchd.per-user-lookup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v276, 1);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v281[5] = v179;
  NSStringFromSelector(sel_startMonitoringPlaceInferencesWithOptions_reply_);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v280[6] = v178;
  v275 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v275, 1);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v281[6] = v177;
  NSStringFromSelector(sel_stopMonitoringPlaceInferencesWithReply_);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v280[7] = v176;
  v274 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v274, 1);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v281[7] = v175;
  NSStringFromSelector(sel_fetchFamiliarityIndexResultsWithOptions_reply_);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v280[8] = v174;
  v273 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v273, 1);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v281[8] = v173;
  NSStringFromSelector(sel_fetchLocationsOfInterestWithinDistance_ofLocation_reply_);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v280[9] = v172;
  v272 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v272, 1);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v281[9] = v171;
  NSStringFromSelector(sel_fetchLocationsOfInterestOfType_reply_);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v280[10] = v170;
  v271 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v271, 1);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v281[10] = v169;
  NSStringFromSelector(sel_fetchAllLocationsOfInterestForSettingsWithReply_);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v280[11] = v168;
  v270[0] = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  v270[1] = CFSTR("com.apple.CoreRoutine.preferences");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v270, 2);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v281[11] = v167;
  NSStringFromSelector(sel_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_reply_);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v280[12] = v166;
  v269 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v269, 1);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v281[12] = v165;
  NSStringFromSelector(sel_fetchPlaceInferencesWithOptions_reply_);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v280[13] = v164;
  v268 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v268, 1);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v281[13] = v163;
  NSStringFromSelector(sel_fetchFormattedPostalAddressesFromMeCard_);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v280[14] = v162;
  v267 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v267, 1);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v281[14] = v161;
  NSStringFromSelector(sel_fetchRoutineModeFromLocation_reply_);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v280[15] = v160;
  v266 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v266, 1);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v281[15] = v159;
  NSStringFromSelector(sel_fetchLocationsOfInterestAssociatedToIdentifier_reply_);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v280[16] = v158;
  v265 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v265, 1);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v281[16] = v157;
  NSStringFromSelector(sel_fetchPredictedLocationsOfInterestAssociatedToTitle_location_calendarIdentifier_reply_);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v280[17] = v156;
  v264 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v264, 1);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v281[17] = v155;
  NSStringFromSelector(sel_fetchPredictedLocationsOfInterestOnDate_reply_);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v280[18] = v154;
  v263 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v263, 1);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v281[18] = v153;
  NSStringFromSelector(sel_fetchCurrentPredictedLocationsOfInterestLookingBack_lookingAhead_reply_);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v280[19] = v152;
  v262 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v262, 1);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v281[19] = v151;
  NSStringFromSelector(sel_performBluePOIQueryLookingBack_lookingAhead_reply_);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v280[20] = v150;
  v261 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v261, 1);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v281[20] = v149;
  NSStringFromSelector(sel_fetchLocationOfInterestWithIdentifier_reply_);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v280[21] = v148;
  v260 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v260, 1);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v281[21] = v147;
  NSStringFromSelector(sel_fetchLocationsOfInterestVisitedBetweenStartDate_endDate_reply_);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v280[22] = v146;
  v259 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v259, 1);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v281[22] = v145;
  NSStringFromSelector(sel_fetchLocationOfInterestAtLocation_reply_);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v280[23] = v144;
  v258 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v258, 1);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v281[23] = v143;
  NSStringFromSelector(sel_fetchLocationOfInterestForRegion_reply_);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v280[24] = v142;
  v257 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v257, 1);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v281[24] = v141;
  NSStringFromSelector(sel_addLocationOfInterestOfType_mapItemStorage_customLabel_reply_);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v280[25] = v140;
  v256 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v256, 1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v281[25] = v139;
  NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_type_reply_);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v280[26] = v138;
  v255 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v255, 1);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v281[26] = v137;
  NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_customLabel_reply_);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v280[27] = v136;
  v254 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v254, 1);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v281[27] = v135;
  NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_mapItemStorage_reply_);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v280[28] = v134;
  v253 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v253, 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v281[28] = v133;
  NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_type_customLabel_reply_);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v280[29] = v132;
  v252 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v252, 1);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v281[29] = v131;
  NSStringFromSelector(sel_updateLocationOfInterestWithIdentifier_type_mapItemStorage_customLabel_reply_);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v280[30] = v130;
  v251 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v251, 1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v281[30] = v129;
  NSStringFromSelector(sel_fetchTransitionsBetweenStartDate_endDate_reply_);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v280[31] = v128;
  v250 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v250, 1);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v281[31] = v127;
  NSStringFromSelector(sel_fetchDedupedLocationOfInterestIdentifiersWithIdentifier_reply_);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v280[32] = v126;
  v249 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v249, 1);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v281[32] = v125;
  NSStringFromSelector(sel_fetchAuthorizedLocationStatus_);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v280[33] = v124;
  v248 = CFSTR("com.apple.CoreRoutine.AuthorizedLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v248, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v281[33] = v123;
  NSStringFromSelector(sel_setHintForRegionState_significantRegion_reply_);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v280[34] = v122;
  v247 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v247, 1);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v281[34] = v121;
  NSStringFromSelector(sel_fetchPredictedExitDatesFromLocation_onDate_reply_);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v280[35] = v120;
  v246 = CFSTR("com.apple.CoreRoutine.Prediction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v246, 1);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v281[35] = v119;
  NSStringFromSelector(sel_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_reply_);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v280[36] = v118;
  v245 = CFSTR("com.apple.CoreRoutine.Prediction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v245, 1);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v281[36] = v117;
  NSStringFromSelector(sel_userInteractionWithPredictedLocationOfInterest_interaction_feedback_geoMapItem_reply_);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v280[37] = v116;
  v244 = CFSTR("com.apple.CoreRoutine.Prediction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v244, 1);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v281[37] = v115;
  NSStringFromSelector(sel_startMonitoringVehicleEventsWithReply_);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v280[38] = v114;
  v243 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v243, 1);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v281[38] = v113;
  NSStringFromSelector(sel_stopMonitoringVehicleEventsWithReply_);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v280[39] = v112;
  v242 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v242, 1);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v281[39] = v111;
  NSStringFromSelector(sel_fetchLastVehicleEventsWithReply_);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v280[40] = v110;
  v241 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v241, 1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v281[40] = v109;
  NSStringFromSelector(sel_vehicleEventAtLocation_notes_reply_);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v280[41] = v108;
  v240 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v240, 1);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v281[41] = v107;
  NSStringFromSelector(sel_clearAllVehicleEventsWithReply_);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v280[42] = v106;
  v239 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v239, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v281[42] = v105;
  NSStringFromSelector(sel_updateVehicleEventWithIdentifier_notes_reply_);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v280[43] = v104;
  v238 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v238, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v281[43] = v103;
  NSStringFromSelector(sel_updateVehicleEventWithIdentifier_photo_reply_);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v280[44] = v102;
  v237 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v237, 1);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v281[44] = v101;
  NSStringFromSelector(sel_updateVehicleEventWithIdentifier_geoMapItem_reply_);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v280[45] = v100;
  v236 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v236, 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v281[45] = v99;
  NSStringFromSelector(sel_updateVehicleEventWithIdentifier_location_reply_);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v280[46] = v98;
  v235 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v235, 1);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v281[46] = v97;
  NSStringFromSelector(sel_engageInVehicleEventWithIdentifier_reply_);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v280[47] = v96;
  v234 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v234, 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v281[47] = v95;
  NSStringFromSelector(sel_fetchAutomaticVehicleEventDetectionSupportedWithReply_);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v280[48] = v94;
  v233 = CFSTR("com.apple.CoreRoutine.VehicleLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v233, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v281[48] = v93;
  NSStringFromSelector(sel_removeLocationOfInterestWithIdentifier_reply_);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v280[49] = v92;
  v232 = CFSTR("com.apple.CoreRoutine.LocationOfInterest.Delete");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v232, 1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v281[49] = v91;
  NSStringFromSelector(sel_removeVisitWithIdentifier_reply_);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v280[50] = v90;
  v231 = CFSTR("com.apple.CoreRoutine.LocationOfInterest.Delete");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v231, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v281[50] = v89;
  NSStringFromSelector(sel_extendLifetimeOfVisitsWithIdentifiers_reply_);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v280[51] = v88;
  v230 = CFSTR("com.apple.CoreRoutine.LocationOfInterest.ExtendLifetime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v230, 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v281[51] = v87;
  NSStringFromSelector(sel_fetchCloudSyncAuthorizationStateWithReply_);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v280[52] = v86;
  v229 = CFSTR("com.apple.CoreRoutine.CloudSync");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v229, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v281[52] = v85;
  NSStringFromSelector(sel_updateCloudSyncProvisionedForAccount_reply_);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v280[53] = v84;
  v228 = CFSTR("com.apple.CoreRoutine.CloudSync");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v228, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v281[53] = v83;
  NSStringFromSelector(sel_fetchLookbackWindowStartDateWithLocation_reply_);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v280[54] = v82;
  v227 = CFSTR("com.apple.CoreRoutine.StoredLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v227, 1);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v281[54] = v81;
  NSStringFromSelector(sel_fetchStoredLocationsWithContext_reply_);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v280[55] = v80;
  v226 = CFSTR("com.apple.CoreRoutine.StoredLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v226, 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v281[55] = v79;
  NSStringFromSelector(sel_fetchEstimatedLocationAtDate_options_reply_);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v280[56] = v78;
  v225 = CFSTR("com.apple.CoreRoutine.StoredLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v225, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v281[56] = v77;
  NSStringFromSelector(sel_startMonitoringVisitsWithReply_);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v280[57] = v76;
  v224 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v224, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v281[57] = v75;
  NSStringFromSelector(sel_stopMonitoringVisitsWithReply_);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v280[58] = v74;
  v223 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v223, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v281[58] = v73;
  NSStringFromSelector(sel_startLeechingVisitsWithReply_);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v280[59] = v72;
  v222 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v222, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v281[59] = v71;
  NSStringFromSelector(sel_stopLeechingVisitsWithReply_);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v280[60] = v70;
  v221 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v221, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v281[60] = v69;
  NSStringFromSelector(sel_startLeechingLowConfidenceVisitsWithReply_);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v280[61] = v68;
  v220 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v220, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v281[61] = v67;
  NSStringFromSelector(sel_stopLeechingLowConfidenceVisitsWithReply_);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v280[62] = v66;
  v219 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v219, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v281[62] = v65;
  NSStringFromSelector(sel_fetchStoredVisitsWithOptions_reply_);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v280[63] = v64;
  v218 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v218, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v281[63] = v63;
  NSStringFromSelector(sel_processHindsightVisitsWithReply_);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v280[64] = v62;
  v217 = CFSTR("com.apple.CoreRoutine.Visit");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v217, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v281[64] = v61;
  NSStringFromSelector(sel_fetchTripSegmentsWithOptions_reply_);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v280[65] = v60;
  v216 = CFSTR("com.apple.CoreRoutine.TripSegment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v216, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v281[65] = v58;
  NSStringFromSelector(sel_fetchLocationsCountForTripSegmentWithOptions_reply_);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v280[66] = v57;
  v215 = CFSTR("com.apple.CoreRoutine.TripSegment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v215, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v281[66] = v56;
  NSStringFromSelector(sel_fetchLocationsForTripSegmentWithOptions_reply_);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v280[67] = v55;
  v214 = CFSTR("com.apple.CoreRoutine.TripSegment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v214, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v281[67] = v54;
  NSStringFromSelector(sel_deleteTripSegmentWithUUID_reply_);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v280[68] = v53;
  v213 = CFSTR("com.apple.CoreRoutine.TripSegment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v213, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v281[68] = v52;
  NSStringFromSelector(sel_fetchVehiclesWithOptions_reply_);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v280[69] = v51;
  v212 = CFSTR("com.apple.CoreRoutine.TripSegment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v212, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v281[69] = v50;
  NSStringFromSelector(sel_fetchTripSegmentMetadataWithOptions_reply_);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v280[70] = v49;
  v211 = CFSTR("com.apple.CoreRoutine.TripSegment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v211, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v281[70] = v48;
  NSStringFromSelector(sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v280[71] = v47;
  v210 = CFSTR("com.apple.CoreRoutine.BackgroundInertialOdometry");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v210, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v281[71] = v46;
  NSStringFromSelector(sel_addBackgroundInertialOdometrySamples_reply_);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v280[72] = v45;
  v209 = CFSTR("com.apple.CoreRoutine.BackgroundInertialOdometry");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v209, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v281[72] = v44;
  NSStringFromSelector(sel_startMonitoringScenarioTriggerOfType_reply_);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v280[73] = v43;
  v208 = CFSTR("com.apple.CoreRoutine.ScenarioTrigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v208, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v281[73] = v42;
  NSStringFromSelector(sel_stopMonitoringScenarioTriggerOfType_reply_);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v280[74] = v41;
  v207 = CFSTR("com.apple.CoreRoutine.ScenarioTrigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v207, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v281[74] = v40;
  NSStringFromSelector(sel_fetchMonitoredScenarioTriggerTypesWithReply_);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v280[75] = v39;
  v206 = CFSTR("com.apple.CoreRoutine.ScenarioTrigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v206, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v281[75] = v38;
  NSStringFromSelector(sel_fetchEnumerableObjectsWithOptions_offset_reply_);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v280[76] = v37;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v204[0] = v36;
  v203 = CFSTR("com.apple.CoreRoutine.LocationOfInterest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v203, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v205[0] = v35;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v204[1] = v34;
  v202 = CFSTR("com.apple.CoreRoutine.Hint");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v202, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v205[1] = v33;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v204[2] = v32;
  v201 = CFSTR("com.apple.CoreRoutine.StoredLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v201, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v205[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v205, v204, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v281[76] = v30;
  NSStringFromSelector(sel_startMonitoringForPeopleDiscovery_configuration_reply_);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v280[77] = v29;
  v200 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v200, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v281[77] = v28;
  NSStringFromSelector(sel_stopMonitoringForPeopleDiscoveryWithReply_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v280[78] = v27;
  v199 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v199, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v281[78] = v26;
  NSStringFromSelector(sel_fetchProximityHistoryFromStartDate_endDate_completionHandler_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v280[79] = v25;
  v198 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v198, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v281[79] = v24;
  NSStringFromSelector(sel_fetchProximityHistoryFromEventIDs_completionHandler_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v280[80] = v23;
  v197 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v197, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v281[80] = v22;
  NSStringFromSelector(sel_fetchPeopleCountEventsHistory_completionHandler_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v280[81] = v21;
  v196 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v196, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v281[81] = v20;
  NSStringFromSelector(sel_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v280[82] = v19;
  v195 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v195, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v281[82] = v18;
  NSStringFromSelector(sel_fetchOngoingPeopleDensity_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v280[83] = v6;
  v194 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v194, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v281[83] = v7;
  NSStringFromSelector(sel_fetchContactScoresFromContactIDs_completionHandler_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v280[84] = v8;
  v193 = CFSTR("com.apple.CoreRoutine.PeopleDiscovery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v193, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v281[84] = v9;
  NSStringFromSelector(sel_fetchElevationsWithOptions_reply_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v280[85] = v10;
  v192 = CFSTR("com.apple.CoreRoutine.StoredElevation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v192, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v281[85] = v11;
  NSStringFromSelector(sel_addElevations_handler_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v280[86] = v12;
  v191 = CFSTR("com.apple.CoreRoutine.StoredElevation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v281[86] = v13;
  NSStringFromSelector(sel_fetchRemoteStatusWithReply_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v280[87] = v14;
  v190 = CFSTR("com.apple.CoreRoutine.RemoteStatus");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v190, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v281[87] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v281, v280, 88);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]([RTEntitlementProvider alloc], "initWithProtocol:entitlementsDictionary:", v189, v59);
  return v16;
}

- (RTEntitlementProvider)initWithProtocol:(id)a3 entitlementsDictionary:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTEntitlementProvider *v10;
  RTEntitlementProvider *v11;
  uint64_t v12;
  NSDictionary *entitlementsDictionary;
  RTEntitlementProvider *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: protocol";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: entitlementsDictionary";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTEntitlementProvider;
  v10 = -[RTEntitlementProvider init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_protocol, a3);
    v12 = objc_msgSend(v9, "copy");
    entitlementsDictionary = v11->_entitlementsDictionary;
    v11->_entitlementsDictionary = (NSDictionary *)v12;

  }
  self = v11;
  v14 = self;
LABEL_10:

  return v14;
}

- (RTEntitlementProvider)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithProtocol_entitlementsDictionary_);
}

+ (id)internalDaemonProtocolEntitlementProvider
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  RTEntitlementProvider *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = &unk_1EFC9E7B8;
  objc_msgSend((id)objc_opt_class(), "selectorsForProtocol:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v18 = CFSTR("com.apple.CoreRoutine.Internal");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  v12 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]([RTEntitlementProvider alloc], "initWithProtocol:entitlementsDictionary:", v2, v4);
  return v12;
}

+ (id)helperServiceProtocolEntitlementProvider
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  RTEntitlementProvider *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = &unk_1EFCBEE70;
  objc_msgSend((id)objc_opt_class(), "selectorsForProtocol:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v18 = CFSTR("com.apple.CoreRoutine.MapItemService");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  v12 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]([RTEntitlementProvider alloc], "initWithProtocol:entitlementsDictionary:", v2, v4);
  return v12;
}

+ (id)safetyMonitorDaemonProtocolEntitlementProvider
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t v12;
  void *v13;
  void *v14;
  RTEntitlementProvider *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const __CFString *v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _QWORD v31[23];

  v31[21] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = &unk_1EFCA6A40;
  v31[1] = &unk_1EFCA6368;
  v31[2] = &unk_1EFCA6430;
  v31[3] = &unk_1EFC755C8;
  v31[4] = &unk_1EFC9F1D8;
  v31[5] = &unk_1EFCA69E0;
  v31[6] = &unk_1EFC9F730;
  v31[7] = &unk_1EFC9F268;
  v31[8] = &unk_1EFCA61F8;
  v31[9] = &unk_1EFC9F640;
  v31[10] = &unk_1EFCA6308;
  v31[11] = &unk_1EFC7C670;
  v31[12] = &unk_1EFC7C7D0;
  v31[13] = &unk_1EFCA68D0;
  v31[14] = &unk_1EFC73538;
  v31[15] = &unk_1EFC7FC28;
  v31[16] = &unk_1EFCA66A0;
  v31[17] = &unk_1EFC918B0;
  v31[18] = &unk_1EFCA6798;
  v31[19] = &unk_1EFC9F848;
  v31[20] = &unk_1EFC9F8D0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend((id)objc_opt_class(), "selectorsForProtocol:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v5, "objectForKeyedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v13)
              {
                v28 = CFSTR("com.apple.CoreRoutine.SafetyMonitor");
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKey:", v14, v12);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
          }
          while (v9);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v19);
  }

  v15 = -[RTEntitlementProvider initWithProtocol:entitlementsDictionary:]([RTEntitlementProvider alloc], "initWithProtocol:entitlementsDictionary:", &unk_1EFCA6A40, v5);
  return v15;
}

+ (id)selectorsForProtocol:(id)a3
{
  Protocol *v3;
  Protocol *v4;
  objc_method_description *v5;
  objc_method_description *v6;
  id v7;
  void *v8;
  unint64_t v9;
  const char **p_name;
  const char *v11;
  void *v12;
  unint64_t v13;
  const char **v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  unsigned int outCount[2];
  uint8_t buf[16];

  v3 = (Protocol *)a3;
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)outCount = 0;
    v5 = protocol_copyMethodDescriptionList(v3, 1, 1, &outCount[1]);
    v6 = protocol_copyMethodDescriptionList(v4, 0, 1, outCount);
    v7 = objc_alloc(MEMORY[0x1E0C99E20]);
    v8 = (void *)objc_msgSend(v7, "initWithCapacity:", outCount[1]);
    if (outCount[1])
    {
      v9 = 0;
      p_name = &v5->name;
      do
      {
        v11 = *p_name;
        p_name += 2;
        NSStringFromSelector(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

        ++v9;
      }
      while (v9 < outCount[1]);
    }
    if (outCount[0])
    {
      v13 = 0;
      v14 = &v6->name;
      do
      {
        v15 = *v14;
        v14 += 2;
        NSStringFromSelector(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v13 < outCount[0]);
    }
    free(v5);
    free(v6);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: protocol", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (NSDictionary)entitlementsDictionary
{
  return self->_entitlementsDictionary;
}

- (void)setEntitlementsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementsDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementsDictionary, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
