@implementation REMExporting

+ (id)exportICSCalendarFromReminders:(id)a3
{
  return (id)objc_msgSend(a1, "exportICSCalendarFromReminders:exportingOption:", a3, 0);
}

+ (id)exportICSCalendarFromReminders:(id)a3 exportingOption:(int64_t)a4
{
  void *v4;
  id v5;

  objc_msgSend(a1, "_icsCalendarItemsFromReminders:exportingOption:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DDB7D8]);
  objc_msgSend(v5, "setComponents:options:", v4, 2);

  return v5;
}

+ (id)_icsCalendarItemsFromReminders:(id)a3 exportingOption:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[16];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v7;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(a1, "icsTodoFromReminder:exportingOption:", v13, a4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14
            && (objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14),
                (v15 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v16 = v15;
            objc_msgSend(v19, "addObjectsFromArray:", v15);
          }
          else
          {
            +[REMLogStore read](REMLogStore, "read");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              +[REMExporting(ICSExport) _icsCalendarItemsFromReminders:exportingOption:].cold.1((uint64_t)v24, v13);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    v7 = v18;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)icsTodoFromReminder:(id)a3
{
  return (id)objc_msgSend(a1, "icsTodoFromReminder:exportingOption:", a3, 0);
}

+ (id)icsTodoFromReminder:(id)a3 exportingOption:(int64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v4 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "importedICSData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_21;
  objc_msgSend(v6, "importedICSData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithData:options:error:", v8, 0, &v56);
  v10 = v56;
  if (v10 || !v9)
  {
    +[REMLogStore read](REMLogStore, "read");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[REMExporting(ICSExport) icsTodoFromReminder:exportingOption:].cold.3((uint64_t)v10, v13);
    v21 = 0;
  }
  else
  {
    objc_msgSend(v9, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v13 = v12;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v14)
    {
      v15 = v14;
      v51 = v4;
      v16 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v53 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          v19 = objc_opt_class();
          REMDynamicCast(v19, v18);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (id)v20;
            goto LABEL_17;
          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        if (v15)
          continue;
        break;
      }
      v21 = 0;
LABEL_17:
      v4 = v51;
    }
    else
    {
      v21 = 0;
    }

  }
  if (!v21)
LABEL_21:
    v21 = objc_alloc_init(MEMORY[0x1E0DDB868]);
  objc_msgSend(v6, "dueDateComponents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (objc_msgSend(v6, "allDay"))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithYear:month:day:", objc_msgSend(v22, "year"), objc_msgSend(v22, "month"), objc_msgSend(v22, "day"));
      objc_msgSend(v21, "setDue:", v23);

    }
    else if ((v4 & 1) != 0
           || (objc_msgSend(v6, "timeZone"), v24 = (void *)objc_claimAutoreleasedReturnValue(), v24, v24))
    {
      v25 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v6, "timeZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeZoneWithName:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        if ((v4 & 1) == 0)
        {
          +[REMLogStore read](REMLogStore, "read");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            +[REMExporting(ICSExport) icsTodoFromReminder:exportingOption:].cold.2(v6, v28);

        }
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v22, "year"), objc_msgSend(v22, "month"), objc_msgSend(v22, "day"), objc_msgSend(v22, "hour"), objc_msgSend(v22, "minute"), objc_msgSend(v22, "second"), v27);
      objc_msgSend(v21, "setDue:", v29);

    }
    else
    {
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithYear:month:day:hour:minute:second:", objc_msgSend(v22, "year"), objc_msgSend(v22, "month"), objc_msgSend(v22, "day"), objc_msgSend(v22, "hour"), objc_msgSend(v22, "minute"), objc_msgSend(v22, "second"));
      objc_msgSend(v21, "setDue:", v50);

    }
  }
  else
  {
    objc_msgSend(v21, "setDue:", 0);
  }
  objc_msgSend(v21, "due");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v21, "due");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDtstart:", v31);

  }
  else
  {
    objc_msgSend(v21, "setDtstart:", 0);
  }
  if ((objc_msgSend(a1, "_updateICSComponentWithReminder:icsCalendarItem:", v6, v21) & 1) != 0)
  {
    objc_msgSend(v6, "daCalendarItemUniqueIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_msgSend(v21, "setUid:", v32);
    objc_msgSend(v6, "userActivity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
      goto LABEL_51;
    v35 = objc_msgSend(v33, "type");
    if (v35 == 2)
    {
      objc_msgSend(v34, "userActivityData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(v21, "setX_apple_appLinkData:", v36);
    }
    else
    {
      if (v35 != 1)
      {
LABEL_51:
        objc_msgSend(v6, "completionDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          rem_ICSDateFromNSDate(v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setCompleted:", v43);

          v44 = 4;
          v45 = 100;
        }
        else
        {
          objc_msgSend(v21, "setCompleted:", 0);
          v45 = 0;
          v44 = 3;
        }
        objc_msgSend(v21, "setPercentComplete:", v45);
        objc_msgSend(v21, "setStatus:", v44);
        objc_msgSend(v21, "setX_apple_sort_order:", objc_msgSend(v6, "icsDisplayOrder"));
        objc_msgSend(v6, "alternativeDisplayDateDate_forCalendar");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          rem_ICSDateFromNSDate(v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "setX_apple_alternative_due_date_for_calendar:", v48);
        }
        else
        {
          objc_msgSend(v21, "setX_apple_alternative_due_date_for_calendar:", 0);
        }

        goto LABEL_58;
      }
      objc_msgSend(v34, "universalLink");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB848]), "initWithValue:type:", v36, 5013);
        v57 = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setX_apple_activity:", v38);

      }
    }

    goto LABEL_51;
  }
  +[REMLogStore read](REMLogStore, "read");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    +[REMExporting(ICSExport) icsTodoFromReminder:exportingOption:].cold.1(v32, v39, v40);
LABEL_58:

  return v21;
}

+ (BOOL)_updateICSComponentWithReminder:(id)a3 icsCalendarItem:(id)a4
{
  void *v4;
  id v6;
  id v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  double v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  id *v98;
  uint64_t v99;
  id *v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  double v105;
  _BOOL4 v106;
  double v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  const char *v125;
  id v126;
  NSObject *v127;
  id v128;
  void *v129;
  double v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  char v147;
  NSObject *v148;
  uint64_t v149;
  id v150;
  id v151;
  void *v152;
  void *v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  id v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  NSObject *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  double v176;
  void *v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  NSObject *v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t m;
  void *v195;
  uint64_t v196;
  NSObject *v197;
  id v198;
  void *v199;
  void *v200;
  NSObject *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  NSObject *v213;
  uint64_t v214;
  id v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v221;
  void *v222;
  void *v223;
  BOOL v224;
  id v225;
  void *v226;
  id v227;
  id v228;
  id obj;
  id obja;
  id v231;
  id v232;
  void *v233;
  uint64_t v234;
  void *v235;
  id v236;
  uint64_t v237;
  void *v238;
  void *v239;
  id v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  id v246;
  uint64_t v247;
  void *v248;
  id v249;
  void *v250;
  void *v251;
  uint64_t v252;
  id v253;
  void *v254;
  uint64_t v255;
  id v256;
  void *v257;
  void *v258;
  id v259;
  char v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  uint8_t v265;
  _BYTE v266[15];
  uint8_t v267;
  _BYTE v268[15];
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
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  uint8_t v285[32];
  __int128 v286;
  __int128 v287;
  _BYTE v288[16];
  _BYTE v289[16];
  uint8_t v290[128];
  uint8_t buf[4];
  void *v292;
  __int16 v293;
  uint64_t v294;
  uint64_t v295;

  v295 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (v8)
    goto LABEL_221;
  v228 = v7;
  objc_msgSend(v6, "titleAsString");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v228, "setSummary:", v10);
  v224 = v9;
  objc_msgSend(v6, "notesAsString");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v228, "setDescription:", v11);
  v223 = (void *)v11;
  v245 = (void *)v10;
  objc_msgSend(v6, "icsUrl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "icsUrl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setUrl:", v13);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  rem_ICSDateFromNSDateInTimezone(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "setDtstamp:", v16);

  objc_msgSend(v6, "lastModifiedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    rem_ICSDateFromNSDateInTimezone(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setLast_modified:", v19);

  }
  v222 = v17;
  objc_msgSend(v6, "creationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    rem_ICSDateFromNSDateInTimezone(v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "setCreated:", v22);

  }
  v221 = v20;
  objc_msgSend(v228, "setPriority:", objc_msgSend(v6, "priority"));
  v227 = v6;
  v246 = v228;
  v23 = v245;
  if (_setSubcomponentsOnICSComponent_onceToken != -1)
    dispatch_once(&_setSubcomponentsOnICSComponent_onceToken, &__block_literal_global_41);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v227, "alarms");
  v225 = v6;
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  if (v226)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v285, 0, sizeof(v285));
    v286 = 0u;
    v287 = 0u;
    objc_msgSend(v246, "components");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v285, buf, 16);
    if (v25)
    {
      v26 = v25;
      v27 = **(_QWORD **)&v285[16];
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (**(_QWORD **)&v285[16] != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*(_QWORD *)&v285[8] + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v248, "addObject:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v285, buf, 16);
      }
      while (v26);
    }

    v283 = 0u;
    v284 = 0u;
    v281 = 0u;
    v282 = 0u;
    obj = v226;
    v23 = v245;
    v237 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v281, v290, 16);
    if (v237)
    {
      v234 = *(_QWORD *)v282;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v282 != v234)
            objc_enumerationMutation(obj);
          v255 = v30;
          v257 = v4;
          v31 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * v30);
          v277 = 0u;
          v278 = 0u;
          v279 = 0u;
          v280 = 0u;
          v259 = v248;
          v32 = objc_msgSend(v259, "countByEnumeratingWithState:objects:count:", &v277, &v273, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v278;
            while (2)
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v278 != v34)
                  objc_enumerationMutation(v259);
                v36 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * j);
                objc_msgSend(v36, "uid");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "alarmUID");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v37, "isEqual:", v38))
                {

LABEL_47:
                  v42 = v36;
                  goto LABEL_48;
                }
                objc_msgSend(v36, "x_wr_alarmuid");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "alarmUID");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v39, "isEqual:", v40);

                if (v41)
                  goto LABEL_47;
              }
              v33 = objc_msgSend(v259, "countByEnumeratingWithState:objects:count:", &v277, &v273, 16);
              v42 = 0;
              if (v33)
                continue;
              break;
            }
          }
          else
          {
            v42 = 0;
          }
LABEL_48:

          v263 = 0u;
          v264 = 0u;
          v261 = 0u;
          v262 = 0u;
          v43 = v235;
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v261, &v269, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v262;
            v4 = v257;
            while (2)
            {
              for (k = 0; k != v45; ++k)
              {
                if (*(_QWORD *)v262 != v46)
                  objc_enumerationMutation(v43);
                if (*(id *)(*((_QWORD *)&v261 + 1) + 8 * k) == v42)
                {
                  v260 = 1;
                  goto LABEL_59;
                }
              }
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v261, &v269, 16);
              if (v45)
                continue;
              break;
            }
            v260 = 0;
          }
          else
          {
            v260 = 0;
            v4 = v257;
          }
LABEL_59:

          if (!v42)
            v42 = objc_alloc_init(MEMORY[0x1E0DDB7A0]);
          v48 = v31;
          v49 = v42;
          if (!v48)
          {
            v60 = 0;
            v23 = v245;
            goto LABEL_130;
          }
          objc_msgSend(v48, "trigger");
          v50 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v251 = (void *)v50;
          v253 = v48;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v51 = objc_opt_class();
            REMDynamicCast(v51, v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "dateComponents");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = REMIsInvalidICSAlarmDateComponents(v53);

            if (v54)
            {
              +[REMLogStore read](REMLogStore, "read");
              v148 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v148, OS_LOG_TYPE_FAULT))
                +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.5(&v265, v266, v148);

            }
            objc_msgSend(v52, "dateComponents");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "timeZone");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v56;
            v58 = v49;
            if (v56)
            {
              v59 = v56;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
              v59 = (id)objc_claimAutoreleasedReturnValue();
            }
            v64 = v59;

            v67 = (void *)MEMORY[0x1E0C99D78];
            objc_msgSend(v52, "dateComponents");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "rem_dateWithDateComponents:timeZone:", v68, v64);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            rem_ICSDateFromNSDateInTimezone(v69, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            v72 = objc_alloc(MEMORY[0x1E0DDB880]);
            objc_msgSend(v71, "value");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (void *)objc_msgSend(v72, "initWithDate:", v73);

            v49 = v58;
            v50 = (uint64_t)v251;
            v48 = v253;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  +[REMLogStore read](REMLogStore, "read");
                  v66 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
                    +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.6((uint64_t)v289, v50);

                }
              }
              goto LABEL_77;
            }
            v61 = objc_opt_class();
            REMDynamicCast(v61, v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_alloc(MEMORY[0x1E0DDB828]);
            objc_msgSend(v52, "timeInterval");
            v64 = (void *)objc_msgSend(v62, "initWithWeeks:days:hours:minutes:seconds:", 0, 0, 0, 0, (uint64_t)v63);
            v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB880]), "initWithDuration:", v64);
          }

          if (v65)
            goto LABEL_79;
LABEL_77:
          objc_msgSend(v49, "trigger");
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v74)
          {
            REMInvalidICSAlarmDateComponents();
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_alloc(MEMORY[0x1E0DDB808]);
            v77 = objc_msgSend(v75, "year");
            v78 = objc_msgSend(v75, "month");
            v79 = objc_msgSend(v75, "day");
            v80 = v49;
            v81 = objc_msgSend(v75, "hour");
            v82 = objc_msgSend(v75, "minute");
            v83 = objc_msgSend(v75, "second");
            v84 = v78;
            v85 = v79;
            v50 = (uint64_t)v251;
            v48 = v253;
            v86 = v81;
            v49 = v80;
            v87 = v82;
            v4 = v257;
            v88 = (void *)objc_msgSend(v76, "initWithYear:month:day:hour:minute:second:", v77, v84, v85, v86, v87, v83);
            v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB880]), "initWithDate:", v88);

            if (v65)
            {
LABEL_79:
              objc_msgSend(v49, "setTrigger:", v65);

            }
          }
          if (!objc_msgSend(v49, "action"))
            objc_msgSend(v49, "setAction:", 1);
          objc_msgSend(v49, "description");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (v89)
          {

          }
          else if (objc_msgSend(v49, "action") != 2)
          {
            objc_msgSend(v49, "setDescription:", CFSTR("Reminder"));
          }
          objc_msgSend(v48, "alarmUID");
          v90 = objc_claimAutoreleasedReturnValue();
          if (v90)
          {
            objc_msgSend(v49, "setUid:", v90);
            objc_msgSend(v49, "setX_wr_alarmuid:", v90);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DDB7F0], "makeUID");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setUid:", v91);
            objc_msgSend(v49, "setX_wr_alarmuid:", v91);
            +[REMLogStore read](REMLogStore, "read");
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.4((uint64_t)v288, (uint64_t)v48);

          }
          v93 = objc_opt_class();
          REMDynamicCast(v93, v50);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_opt_class();
          REMDynamicCast(v95, v50);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v241 = v94;
          v243 = (void *)v90;
          v239 = v96;
          if (v94)
          {
            v97 = objc_msgSend(v94, "proximity");
            if (v97 == 1)
            {
              v98 = (id *)MEMORY[0x1E0DDBC00];
LABEL_100:
              v101 = *v98;
            }
            else
            {
              if (v97 == 2)
              {
                v98 = (id *)MEMORY[0x1E0DDBC10];
                goto LABEL_100;
              }
              v101 = 0;
            }
            objc_msgSend(v49, "setX_apple_proximity:", v101);

            v102 = v49;
            objc_msgSend(v94, "structuredLocation");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "contactLabel");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "longitude");
            if (fabs(v105) < 2.22044605e-16)
            {
              v106 = 0;
              goto LABEL_105;
            }
            objc_msgSend(v103, "latitude");
            v106 = fabs(v107) >= 2.22044605e-16;
            if (!v106)
            {
LABEL_105:
              if (!v104)
              {
                v108 = 0;
LABEL_108:
                objc_msgSend(v103, "title");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "setTitle:", v109);

                objc_msgSend(v103, "address");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "setAddress:", v110);

                objc_msgSend(v103, "routing");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "setRouting:", v111);

                if (v106)
                {
                  v112 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v103, "latitude");
                  v114 = v113;
                  objc_msgSend(v103, "longitude");
                  objc_msgSend(v112, "stringWithFormat:", CFSTR("geo:%f,%f"), v114, v115);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v116);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "setValue:type:", v117, 5013);

                  objc_msgSend(v103, "referenceFrameString");
                  v118 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v118)
                  {
                    objc_msgSend(v103, "referenceFrameString");
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "setParameterValue:forName:", v119, CFSTR("X-APPLE-REFERENCEFRAME"));

                  }
                }
                else
                {
                  objc_msgSend(v108, "setValue:type:", 0, 5013);
                  objc_msgSend(v108, "setParameterValue:forName:", 0, CFSTR("X-APPLE-REFERENCEFRAME"));
                }
                objc_msgSend(v108, "setParameterValue:forName:", v104, CFSTR("X-APPLE-ABUID"));
                v120 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v103, "radius");
                objc_msgSend(v120, "numberWithDouble:");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "stringValue");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "setParameterValue:forName:", v122, CFSTR("X-APPLE-RADIUS"));

                objc_msgSend(v103, "mapKitHandle");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                if (v123)
                {
                  objc_msgSend(v108, "setMapKitHandle:", v123);
                  objc_msgSend(v108, "ICSStringWithOptions:", 0);
                  v124 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v125 = (const char *)objc_msgSend(v124, "UTF8String");
                  if (v125 && strlen(v125) >= 0x3DF)
                  {
                    v126 = v49;
                    +[REMLogStore read](REMLogStore, "read");
                    v127 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                      +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.3(&v267, v268, v127);

                    objc_msgSend(v108, "setMapKitHandle:", 0);
                    v49 = v126;
                  }

                }
                v48 = v253;
                goto LABEL_126;
              }
            }
            v108 = objc_alloc_init(MEMORY[0x1E0DDB860]);
            objc_msgSend(v102, "setX_apple_structured_location:", v108);
            goto LABEL_108;
          }
          if (v96)
          {
            v99 = objc_msgSend(v96, "event");
            if (v99 == 1)
            {
              v100 = (id *)MEMORY[0x1E0DDBC08];
LABEL_122:
              v128 = *v100;
            }
            else
            {
              if (v99 == 2)
              {
                v100 = (id *)MEMORY[0x1E0DDBC18];
                goto LABEL_122;
              }
              v128 = 0;
            }
            objc_msgSend(v49, "setX_apple_proximity:", v128);

          }
          objc_msgSend(v49, "setX_apple_structured_location:", 0);
LABEL_126:

          objc_msgSend(v48, "acknowledgedDate");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          if (v129)
          {
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "timeIntervalSinceReferenceDate");
            rem_DateComponentsFromAbsoluteTime(v233, v130);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v231 = objc_alloc(MEMORY[0x1E0DDB808]);
            v132 = objc_msgSend(v131, "year");
            v133 = v49;
            v134 = objc_msgSend(v131, "month");
            v135 = objc_msgSend(v131, "day");
            v136 = objc_msgSend(v131, "hour");
            v137 = objc_msgSend(v131, "minute");
            v138 = objc_msgSend(v131, "second");
            v139 = v132;
            v48 = v253;
            v140 = v134;
            v49 = v133;
            v141 = v135;
            v4 = v257;
            v142 = (void *)objc_msgSend(v231, "initWithYear:month:day:hour:minute:second:", v139, v140, v141, v136, v137, v138);
            objc_msgSend(v133, "setAcknowledged:", v142);

          }
          else
          {
            objc_msgSend(v49, "setAcknowledged:", 0);
          }
          v23 = v245;
          objc_msgSend(v48, "originalAlarmUID");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setRelatedTo:", v143);

          v60 = v49;
LABEL_130:

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_138;
          objc_msgSend(v60, "trigger");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          if (v144)
          {
            objc_msgSend(v60, "trigger");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v4, "isDurationBased") & 1) == 0)
            {

LABEL_138:
              v146 = v255;
              goto LABEL_139;
            }
          }
          objc_msgSend(v246, "dtstart");
          v145 = (void *)objc_claimAutoreleasedReturnValue();

          if (v144)
          {

          }
          v146 = v255;
          if (!v145)
            objc_msgSend(v60, "setTrigger:", _setSubcomponentsOnICSComponent_sInvalidTrigger);
LABEL_139:
          if (v60)
            v147 = v260;
          else
            v147 = 1;
          if ((v147 & 1) == 0)
            objc_msgSend(v43, "addObject:", v60);

          v30 = v146 + 1;
        }
        while (v30 != v237);
        v149 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v281, v290, 16);
        v237 = v149;
      }
      while (v149);
    }

    v6 = v225;
  }
  objc_msgSend(v246, "setComponents:", v235);

  v150 = v227;
  v151 = v246;
  objc_msgSend(v150, "recurrenceRules");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v152)
  {
    v219 = 0;
    goto LABEL_220;
  }
  v232 = v151;
  v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v152, "count"));
  v269 = 0u;
  v270 = 0u;
  v271 = 0u;
  v272 = 0u;
  obja = v152;
  v154 = v152;
  v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v269, v290, 16);
  if (!v155)
    goto LABEL_215;
  v156 = v155;
  v247 = *(_QWORD *)v270;
  v238 = v153;
  v240 = v150;
  v236 = v154;
  do
  {
    v157 = 0;
    v242 = v156;
    do
    {
      if (*(_QWORD *)v270 != v247)
        objc_enumerationMutation(v154);
      v158 = *(id *)(*((_QWORD *)&v269 + 1) + 8 * v157);
      v159 = v150;
      v254 = v159;
      if (!v158)
      {
        v163 = 0;
        goto LABEL_208;
      }
      v252 = v157;
      v160 = objc_msgSend(v158, "frequency");
      v161 = v160;
      v256 = v158;
      if (v160 >= 5)
      {
        +[REMLogStore read](REMLogStore, "read");
        v164 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.2((uint64_t)&v277, v161);

        v162 = 4;
        v158 = v256;
      }
      else
      {
        v162 = qword_1B4B746E0[v160];
      }
      v258 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB850]), "initWithFrequency:", v162);
      v165 = objc_msgSend(v158, "interval");
      if (v165 > 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v165);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setInterval:", v166);

      }
      if (objc_msgSend(v158, "firstDayOfTheWeek") >= 1 && objc_msgSend(v158, "firstDayOfTheWeek") != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v158, "firstDayOfTheWeek"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setWkst:", v167);

      }
      objc_msgSend(v158, "recurrenceEnd");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "endDate");
      v169 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v158, "recurrenceEnd");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = objc_msgSend(v170, "occurrenceCount");

      if (v171)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setCount:", v172);
      }
      else
      {
        v158 = v256;
        if (!v169)
          goto LABEL_181;
        objc_msgSend(v254, "timeZone");
        v173 = (void *)objc_claimAutoreleasedReturnValue();

        if (v173)
        {
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          rem_ICSDateFromNSDateInTimezone(v169, v174);
          v175 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v254, "allDay"))
        {
          objc_msgSend(v169, "timeIntervalSinceReferenceDate");
          rem_DateComponentsFromAbsoluteTime(0, v176);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v249 = objc_alloc(MEMORY[0x1E0DDB800]);
          v177 = v23;
          v178 = v169;
          v179 = objc_msgSend(v174, "year");
          v180 = v156;
          v181 = objc_msgSend(v174, "month");
          v182 = objc_msgSend(v174, "day");
          v183 = v179;
          v169 = v178;
          v23 = v177;
          v184 = v181;
          v156 = v180;
          v175 = objc_msgSend(v249, "initWithYear:month:day:", v183, v184, v182);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          rem_ICSFloatingDateTimeFromNSDateInTimezone(v169, v174);
          v175 = objc_claimAutoreleasedReturnValue();
        }
        v172 = (void *)v175;

        +[REMLogStore read](REMLogStore, "read");
        v185 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v172, "value");
          v217 = v169;
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v292 = v218;
          v293 = 2112;
          v294 = (uint64_t)v217;
          _os_log_debug_impl(&dword_1B4A39000, v185, OS_LOG_TYPE_DEBUG, "Setting ICS recurrence until date: untilDate=%@ remEndDate=%@)", buf, 0x16u);

          v169 = v217;
        }

        objc_msgSend(v172, "value");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setUntil:", v186);

      }
      v158 = v256;

LABEL_181:
      objc_msgSend(v158, "daysOfTheWeek");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      v250 = v187;
      if (v187)
      {
        v188 = v187;
        if (objc_msgSend(v187, "count"))
        {
          v244 = v169;
          v189 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v273 = 0u;
          v274 = 0u;
          v275 = 0u;
          v276 = 0u;
          v190 = v188;
          v191 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v273, buf, 16);
          if (v191)
          {
            v192 = v191;
            v193 = *(_QWORD *)v274;
            do
            {
              for (m = 0; m != v192; ++m)
              {
                if (*(_QWORD *)v274 != v193)
                  objc_enumerationMutation(v190);
                v195 = *(void **)(*((_QWORD *)&v273 + 1) + 8 * m);
                v196 = objc_msgSend(v195, "dayOfTheWeek");
                if ((unint64_t)(v196 - 1) >= 7)
                {
                  +[REMLogStore read](REMLogStore, "read");
                  v197 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
                    +[REMExporting(ICSExport) _updateICSComponentWithReminder:icsCalendarItem:].cold.1((uint64_t)&v281, v196);

                  v196 = 1;
                }
                v198 = objc_alloc(MEMORY[0x1E0DDB7D0]);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v195, "weekNumber"));
                v199 = (void *)objc_claimAutoreleasedReturnValue();
                v200 = (void *)objc_msgSend(v198, "initWithWeekday:number:", v196, v199);

                objc_msgSend(v189, "addObject:", v200);
              }
              v192 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v273, buf, 16);
            }
            while (v192);
          }

          +[REMLogStore read](REMLogStore, "read");
          v201 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v201, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v285 = 138412546;
            *(_QWORD *)&v285[4] = v189;
            *(_WORD *)&v285[12] = 2112;
            *(_QWORD *)&v285[14] = v190;
            _os_log_debug_impl(&dword_1B4A39000, v201, OS_LOG_TYPE_DEBUG, "Setting ICS byday days array: %@ %@", v285, 0x16u);
          }

          objc_msgSend(v258, "setByday:", v189);
          v169 = v244;
          v23 = v245;
          v153 = v238;
          v150 = v240;
          v154 = v236;
          v156 = v242;
          v158 = v256;
        }
      }
      objc_msgSend(v158, "monthsOfTheYear");
      v202 = (void *)objc_claimAutoreleasedReturnValue();

      if (v202)
      {
        objc_msgSend(v158, "monthsOfTheYear");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setBymonth:", v203);

      }
      objc_msgSend(v158, "daysOfTheMonth");
      v204 = (void *)objc_claimAutoreleasedReturnValue();

      if (v204)
      {
        objc_msgSend(v158, "daysOfTheMonth");
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setBymonthday:", v205);

      }
      objc_msgSend(v158, "weeksOfTheYear");
      v206 = (void *)objc_claimAutoreleasedReturnValue();

      if (v206)
      {
        objc_msgSend(v158, "weeksOfTheYear");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setByweekno:", v207);

      }
      objc_msgSend(v158, "daysOfTheYear");
      v208 = (void *)objc_claimAutoreleasedReturnValue();

      if (v208)
      {
        objc_msgSend(v158, "daysOfTheYear");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setByyearday:", v209);

      }
      objc_msgSend(v158, "setPositions");
      v210 = (void *)objc_claimAutoreleasedReturnValue();

      if (v210)
      {
        objc_msgSend(v158, "setPositions");
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "setBysetpos:", v211);

      }
      v157 = v252;
      v159 = v254;
      v163 = v258;
LABEL_208:

      if (v163)
      {
        objc_msgSend(v153, "addObject:", v163);
      }
      else
      {
        v212 = v157;
        +[REMLogStore read](REMLogStore, "read");
        v213 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v254, "objectID");
          v214 = objc_claimAutoreleasedReturnValue();
          v215 = v158;
          v216 = (void *)v214;
          *(_DWORD *)buf = 138412546;
          v292 = v215;
          v293 = 2112;
          v294 = v214;
          _os_log_error_impl(&dword_1B4A39000, v213, OS_LOG_TYPE_ERROR, "Couldn't create an ICSRecurrence from REMRecurrenceRule %@ {reminderID: %@}", buf, 0x16u);

        }
        v157 = v212;
      }

      ++v157;
    }
    while (v157 != v156);
    v156 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v269, v290, 16);
  }
  while (v156);
LABEL_215:

  if (objc_msgSend(v153, "count"))
    v219 = (void *)objc_msgSend(v153, "copy");
  else
    v219 = 0;
  v151 = v232;

  v152 = obja;
  v6 = v225;
LABEL_220:
  objc_msgSend(v151, "setRrule:", v219);

  v9 = v224;
  v7 = v228;
LABEL_221:

  return v9;
}

@end
