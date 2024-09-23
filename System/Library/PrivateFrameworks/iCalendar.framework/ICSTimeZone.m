@implementation ICSTimeZone

- (id)propertiesToExcludeForChecksum
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ICSTimeZone_propertiesToExcludeForChecksum__block_invoke;
  block[3] = &unk_1E953A7C0;
  block[4] = self;
  if (propertiesToExcludeForChecksum_onceToken_0 != -1)
    dispatch_once(&propertiesToExcludeForChecksum_onceToken_0, block);
  return (id)propertiesToExcludeForChecksum_propertiesToExcludeForChecksum;
}

void __45__ICSTimeZone_propertiesToExcludeForChecksum__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)ICSTimeZone;
  objc_msgSendSuper2(&v5, sel_propertiesToExcludeForChecksum);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)propertiesToExcludeForChecksum_propertiesToExcludeForChecksum;
  propertiesToExcludeForChecksum_propertiesToExcludeForChecksum = v3;

}

+ (id)name
{
  return CFSTR("VTIMEZONE");
}

- (ICSTimeZone)initWithSystemTimeZone:(id)a3 fromDate:(id)a4 options:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  ICSTimeZone *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  objc_msgSend(a3, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSTimeZone timeZoneWithSystemTimeZoneName:](ICSTimeZone, "timeZoneWithSystemTimeZoneName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICSTimeZone initWithTimeZone:fromDate:options:](self, "initWithTimeZone:fromDate:options:", v10, v8, v5);

  return v11;
}

- (NSString)tzid
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TZID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setTzid:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("TZID"));
}

- (id)systemTimeZoneForDate:(id)a3
{
  id v4;
  id systemTimeZone;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  systemTimeZone = self->_systemTimeZone;
  if (!systemTimeZone)
  {
    -[ICSTimeZone getNSTimeZone:](self, "getNSTimeZone:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_systemTimeZone;
    self->_systemTimeZone = v6;

    systemTimeZone = self->_systemTimeZone;
    if (!systemTimeZone)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_systemTimeZone;
      self->_systemTimeZone = v8;

      systemTimeZone = self->_systemTimeZone;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (systemTimeZone == v10)
    v11 = 0;
  else
    v11 = self->_systemTimeZone;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_systemTimeZone, 0);
}

+ (id)blocksAfterDate:(id)a3 untilDate:(id)a4 forTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  void *v58;
  uint64_t v59;
  ICSRecurrenceRule *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  ICSByDayValue *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  ICSDate *v71;
  uint64_t v72;
  __objc2_class **v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  ICSDate *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  ICSDateTimeUTCValue *v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t i;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  char isKindOfClass;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  id v136;
  void *v137;
  uint64_t v138;
  ICSDate *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  __objc2_class **v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  ICSDate *v154;
  ICSTimeZoneStandardBlock *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  void *v161;
  void *v162;
  id v163;
  uint64_t v164;
  ICSByDayValue *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  char v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  char v191;
  void *v192;
  id obj;
  id objb;
  id objc;
  id obja;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  void *v201;
  _BYTE v202[128];
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v8;
  objc_msgSend(v10, "nextDaylightSavingTimeTransitionAfterDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = *MEMORY[0x1E0C996C8];
  v171 = v9;
  v170 = v10;
  v189 = v11;
  if (objc_msgSend(v12, "compare:", v9) == -1)
  {
    v163 = a1;
    v179 = 0;
    v180 = 0;
    v172 = 0;
    v173 = 0;
    v16 = 0;
    v174 = 0;
    v17 = 0;
    v18 = 0;
    v175 = 0;
    v176 = 0;
    v19 = v12;
    while (1)
    {
      obj = v19;
      objc_msgSend(v19, "dateByAddingTimeInterval:", 1.0);
      v20 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isDaylightSavingTimeForDate:", v20) & 1) != 0)
      {
        v177 = 0;
        v21 = 1;
      }
      else
      {
        v21 = objc_msgSend(v163, "_isTimeZone:pseudoDSTForDate:", v10, v20);
        v177 = v21;
      }
      objc_msgSend(v10, "abbreviationForDate:", v20);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "dateByAddingTimeInterval:", -1.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v10, "secondsFromGMTForDate:", v22);

      v24 = objc_msgSend(v10, "secondsFromGMTForDate:", v20);
      v182 = (void *)v20;
      if (objc_msgSend(v11, "count") && v23 == v24)
      {
        v186 = v18;
        v14 = v17;
        v15 = v16;
        v25 = obj;
        goto LABEL_59;
      }
      v184 = v23;
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v166);
      v27 = v180;
      if ((_DWORD)v21)
        v27 = v179;
      v28 = v27;
      v186 = v24;
      if (!v28)
        break;
      v29 = v28;
      objc_msgSend(v28, "dtstart");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "value");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "setTimeZone:", v10);
      objc_msgSend(v31, "components");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dateFromComponents:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v176;
      if (!(_DWORD)v21)
        v34 = v175;
      v164 = v34;
      if (!v33)
      {
        v28 = v29;
LABEL_22:
        v29 = v28;
        objc_msgSend(0, "day");
        v33 = 0;
        v169 = 0;
        goto LABEL_23;
      }
      v35 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v33, "dateByAddingTimeInterval:", -1.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeZoneForSecondsFromGMT:", objc_msgSend(v10, "secondsFromGMTForDate:", v36));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTimeZone:", v37);

      objc_msgSend(v26, "components:fromDate:", 1788, v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "rangeOfUnit:inUnit:forDate:", 16, 8, v33);
      v169 = v38;
      if (objc_msgSend(v38, "day") + 7 > v39)
        objc_msgSend(v38, "setWeekdayOrdinal:", -1);
LABEL_23:
      v167 = v33;
      v41 = (void *)MEMORY[0x1E0C99E80];
      v25 = obj;
      objc_msgSend(obj, "dateByAddingTimeInterval:", -1.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeZoneForSecondsFromGMT:", objc_msgSend(v10, "secondsFromGMTForDate:", v42));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTimeZone:", v43);

      v168 = v26;
      v44 = v21;
      if (obj)
      {
        objc_msgSend(v26, "components:fromDate:", 1788, obj);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "rangeOfUnit:inUnit:forDate:", 16, 8, obj);
        v46 = v184;
        v48 = v45;
        if (objc_msgSend(v45, "day") + 7 > v47)
          objc_msgSend(v45, "setWeekdayOrdinal:", -1);
      }
      else
      {
        objc_msgSend(0, "day");
        v48 = 0;
        v46 = v184;
      }
      if (v46 == objc_msgSend(v29, "tzoffsetfrom")
        && v186 == objc_msgSend(v29, "tzoffsetto")
        && ((v177 ^ 1 | v174) & 1) != 0)
      {
        v161 = v29;
        objc_msgSend(v29, "tzname");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "lastObject");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v190, "isEqualToString:", v50)
          && objc_msgSend(v48, "year") == v164 + 1
          && (v51 = objc_msgSend(v48, "month"), v51 == objc_msgSend(v169, "month"))
          && (v52 = objc_msgSend(v48, "weekday"), v52 == objc_msgSend(v169, "weekday"))
          && (v53 = objc_msgSend(v48, "weekdayOrdinal"), v53 == objc_msgSend(v169, "weekdayOrdinal"))
          && (v54 = objc_msgSend(v48, "hour"), v54 == objc_msgSend(v169, "hour")))
        {
          v55 = objc_msgSend(v48, "minute");
          v56 = objc_msgSend(v169, "minute");

          v57 = v55 == v56;
          v29 = v161;
          if (v57)
          {
            objc_msgSend(v161, "rrule");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "count");

            if (!v59)
            {
              v60 = -[ICSRecurrenceRule initWithFrequency:]([ICSRecurrenceRule alloc], "initWithFrequency:", 7);
              v61 = (void *)MEMORY[0x1E0C99D20];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v48, "month"));
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "arrayWithObject:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICSRecurrenceRule setBymonth:](v60, "setBymonth:", v63);

              objb = (id)MEMORY[0x1E0C99D20];
              v165 = [ICSByDayValue alloc];
              v64 = objc_msgSend(v48, "weekday");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v48, "weekdayOrdinal"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = -[ICSByDayValue initWithWeekday:number:](v165, "initWithWeekday:number:", v64, v65);
              objc_msgSend(objb, "arrayWithObject:", v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICSRecurrenceRule setByday:](v60, "setByday:", v67);

              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v60, 0);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "setRrule:", v68);

              objc_msgSend(v161, "setRdate:", 0);
            }
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "setTimeZone:", v69);

            v70 = v173;
            v15 = v44;
            if (v25)
            {
              objc_msgSend(v168, "components:fromDate:", 764, v25);
              v71 = (ICSDate *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v71 = 0;
            }
            v88 = v190;
            v90 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeUTCValue alloc], "initWithYear:month:day:hour:minute:second:", -[ICSDate year](v71, "year"), -[ICSDate month](v71, "month"), -[ICSDate day](v71, "day"), -[ICSDate hour](v71, "hour"), -[ICSDate minute](v71, "minute"), -[ICSDate second](v71, "second"));
            v86 = v161;
            objc_msgSend(v161, "rrule");
            objc = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(objc, "objectAtIndex:", 0);
            v98 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v98, "setUntil:", v90);
            goto LABEL_51;
          }
        }
        else
        {

        }
      }
      v72 = v44;
      v73 = off_1E953A068;
      if (!(_DWORD)v44)
        v73 = off_1E953A070;
      v74 = objc_alloc_init(*v73);
      if ((_DWORD)v44)
        v75 = v180;
      else
        v75 = v74;
      v76 = v179;
      if ((_DWORD)v44)
        v76 = v74;
      v179 = v76;
      v180 = v75;
      v77 = v29;
      v78 = [ICSDate alloc];
      v79 = objc_msgSend(v48, "year");
      v80 = objc_msgSend(v48, "month");
      v81 = objc_msgSend(v48, "day");
      v82 = objc_msgSend(v48, "hour");
      v83 = objc_msgSend(v48, "minute");
      v84 = objc_msgSend(v48, "second");
      v85 = v81;
      v86 = v77;
      v87 = v83;
      v10 = v170;
      v71 = -[ICSDate initWithYear:month:day:hour:minute:second:](v78, "initWithYear:month:day:hour:minute:second:", v79, v80, v85, v82, v87, v84);
      objc_msgSend(v74, "setDtstart:", v71);
      v88 = v190;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v190);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setTzname:", v89);

      objc_msgSend(v74, "setTzoffsetfrom:", v184);
      v15 = v72;
      v25 = obj;
      objc_msgSend(v74, "setTzoffsetto:", v186);
      objc_msgSend(v74, "addRecurrenceDate:", v71);
      v90 = (ICSDateTimeUTCValue *)v74;

      objc_msgSend(v189, "addObject:", v90);
      v70 = v173;
LABEL_51:

      v91 = objc_msgSend(v48, "year");
      v92 = v174;
      if ((_DWORD)v15)
        v92 = v177;
      v174 = v92;
      if ((_DWORD)v15)
        v93 = v175;
      else
        v93 = v91;
      v94 = v176;
      if ((_DWORD)v15)
        v94 = v91;
      v175 = v93;
      v176 = v94;
      v95 = v48;

      v96 = v88;
      v172 = v95;
      v173 = v96;
      v14 = v184;
      v11 = v189;
LABEL_59:
      objc_msgSend(v10, "nextDaylightSavingTimeTransitionAfterDate:", v182);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "compare:", v25) != 1)
      {

        v12 = v25;
        v13 = v186;
        goto LABEL_65;
      }

      v97 = objc_msgSend(v12, "compare:", v171);
      v19 = v12;
      v16 = v15;
      v17 = v14;
      v13 = v186;
      v18 = v186;
      if (v97 != -1)
        goto LABEL_65;
    }
    v40 = v176;
    if (!(_DWORD)v21)
      v40 = v175;
    v164 = v40;
    goto LABEL_22;
  }
  v13 = 0;
  v14 = 0;
  LOBYTE(v174) = 0;
  LOBYTE(v15) = 0;
  v172 = 0;
  v173 = 0;
  v179 = 0;
  v180 = 0;
LABEL_65:
  v187 = v13;
  if ((v174 & 1) != 0 && (v15 & 1) == 0)
    objc_msgSend(v11, "removeAllObjects");
  v183 = v12;
  v185 = v14;
  v178 = v15;

  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  obja = (id)objc_msgSend(v11, "copy");
  v99 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v197, v202, 16);
  if (!v99)
  {
    v101 = 0;
    v102 = 0;
    goto LABEL_93;
  }
  v100 = v99;
  v101 = 0;
  v102 = 0;
  v103 = *(_QWORD *)v198;
  do
  {
    for (i = 0; i != v100; ++i)
    {
      if (*(_QWORD *)v198 != v103)
        objc_enumerationMutation(obja);
      v105 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * i);
      objc_msgSend(v105, "rrule");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v106, "count");

      if (!v107)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v108 = v102;
        else
          v108 = v101;
        v109 = v108;
        objc_msgSend(v109, "rrule");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "count");

        if (!v111)
        {
          v112 = objc_msgSend(v109, "tzoffsetfrom");
          if (v112 == objc_msgSend(v105, "tzoffsetfrom"))
          {
            v113 = objc_msgSend(v109, "tzoffsetto");
            if (v113 == objc_msgSend(v105, "tzoffsetto"))
            {
              objc_msgSend(v109, "tzname");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "tzname");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              v191 = objc_msgSend(v114, "isEqualToArray:", v115);

              if ((v191 & 1) != 0)
              {
                objc_msgSend(v105, "dtstart");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "addRecurrenceDate:", v116);

                objc_msgSend(v189, "removeObjectIdenticalTo:", v105);
                goto LABEL_89;
              }
            }
          }
        }

      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v118 = v105;
      if ((isKindOfClass & 1) != 0)
        v109 = v102;
      else
        v109 = v101;
      if ((isKindOfClass & 1) != 0)
        v102 = v118;
      else
        v101 = v118;
LABEL_89:

    }
    v100 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v197, v202, 16);
  }
  while (v100);
LABEL_93:

  v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v166);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v119;
  objc_msgSend(v119, "components:fromDate:", 4, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v102, "rrule");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = objc_msgSend(v122, "count");

  v124 = v170;
  v125 = v183;
  if (v123)
  {
    objc_msgSend(v102, "rrule");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "objectAtIndex:", 0);
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v127, "until");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "year");
    if (v129 > objc_msgSend(v121, "year") + 10)
    {
      objc_msgSend(v127, "setCount:", 0);
      objc_msgSend(v127, "setUntil:", 0);
    }

  }
  objc_msgSend(v101, "rrule");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "count");

  if (v131)
  {
    objc_msgSend(v101, "rrule");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectAtIndex:", 0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v133, "until");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v134, "year");
    if (v135 > objc_msgSend(v121, "year") + 10)
    {
      objc_msgSend(v133, "setCount:", 0);
      objc_msgSend(v133, "setUntil:", 0);
    }

  }
  v181 = v121;
  objc_msgSend(v102, "rrule");
  v136 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v136, "count"))
    goto LABEL_111;
  objc_msgSend(v101, "rrule");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v137, "count");

  if (v138)
  {
    objc_msgSend(v102, "rrule");
    v136 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "objectAtIndex:", 0);
    v139 = (ICSDate *)objc_claimAutoreleasedReturnValue();
    -[ICSDate until](v139, "until");
    v140 = objc_claimAutoreleasedReturnValue();
    if (!v140)
      goto LABEL_110;
    v141 = (void *)v140;
    objc_msgSend(v101, "rrule");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "objectAtIndex:", 0);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "until");
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    v125 = v183;
    if (v144)
    {
      v145 = off_1E953A068;
      if ((v178 & 1) == 0)
        v145 = off_1E953A070;
      v136 = objc_alloc_init(*v145);
      v139 = -[ICSDate initWithYear:month:day:hour:minute:second:]([ICSDate alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v172, "year"), objc_msgSend(v172, "month"), objc_msgSend(v172, "day"), objc_msgSend(v172, "hour"), objc_msgSend(v172, "minute"), objc_msgSend(v172, "second"));
      objc_msgSend(v136, "setDtstart:", v139);
      if (v173)
      {
        v201 = v173;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v201, 1);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "setTzname:", v146);

      }
      objc_msgSend(v136, "setTzoffsetfrom:", v185);
      objc_msgSend(v136, "setTzoffsetto:", v187);
      objc_msgSend(v189, "addObject:", v136);
LABEL_110:

      v125 = v183;
LABEL_111:

    }
  }
  v147 = v189;
  if (!objc_msgSend(v189, "count"))
  {
    v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v166);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = v148;
    objc_msgSend(v148, "setTimeZone:", v149);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v150 = objc_claimAutoreleasedReturnValue();
    v151 = v148;
    v152 = (void *)v150;
    objc_msgSend(v151, "components:fromDate:", 252);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = -[ICSDate initWithYear:month:day:hour:minute:second:]([ICSDate alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v153, "year"), objc_msgSend(v153, "month"), objc_msgSend(v153, "day"), objc_msgSend(v153, "hour"), objc_msgSend(v153, "minute"), objc_msgSend(v153, "second"));
    v155 = objc_alloc_init(ICSTimeZoneStandardBlock);
    -[ICSTimeZoneBlock setDtstart:](v155, "setDtstart:", v154);
    v156 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v170, "abbreviationForDate:", v152);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "arrayWithObject:", v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSTimeZoneBlock setTzname:](v155, "setTzname:", v158);

    v125 = v183;
    -[ICSTimeZoneBlock setTzoffsetfrom:](v155, "setTzoffsetfrom:", objc_msgSend(v170, "secondsFromGMTForDate:", v162));
    -[ICSTimeZoneBlock setTzoffsetto:](v155, "setTzoffsetto:", objc_msgSend(v170, "secondsFromGMTForDate:", v162));
    objc_msgSend(v189, "addObject:", v155);

    v147 = v189;
    v124 = v170;
  }
  v159 = v147;

  return v159;
}

+ (BOOL)_isTimeZone:(id)a3 pseudoDSTForDate:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v5 = a4;
  objc_msgSend(a3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Europe/Moscow"));

  if (v7)
  {
    if (_isTimeZone_pseudoDSTForDate__onceToken != -1)
      dispatch_once(&_isTimeZone_pseudoDSTForDate__onceToken, &__block_literal_global_1);
    objc_msgSend((id)_isTimeZone_pseudoDSTForDate__beginEffectiveDST, "laterDate:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 == v5)
    {
      objc_msgSend((id)_isTimeZone_pseudoDSTForDate__endEffectiveDST, "earlierDate:", v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = v9 == v5;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

void __64__ICSTimeZone_TimeZoneGeneration___isTimeZone_pseudoDSTForDate___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1301180400.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isTimeZone_pseudoDSTForDate__beginEffectiveDST;
  _isTimeZone_pseudoDSTForDate__beginEffectiveDST = v0;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1414274400.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_isTimeZone_pseudoDSTForDate__endEffectiveDST;
  _isTimeZone_pseudoDSTForDate__endEffectiveDST = v2;

}

- (ICSTimeZone)initWithSystemTimeZone:(id)a3
{
  id v4;
  ICSTimeZone *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ICSComponent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSTimeZone setTzid:](v5, "setTzid:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    v8 = objc_alloc(MEMORY[0x1E0C99D48]);
    v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    objc_msgSend(v7, "setYear:", 1900);
    objc_msgSend(v9, "dateFromComponents:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setYear:", 2050);
    objc_msgSend(v9, "dateFromComponents:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICSTimeZone blocksAfterDate:untilDate:forTimeZone:](ICSTimeZone, "blocksAfterDate:untilDate:forTimeZone:", v11, v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          -[ICSComponent addComponent:withUIDGenerator:](v5, "addComponent:withUIDGenerator:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), 0);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
  return v5;
}

- (ICSTimeZone)initWithTimeZone:(id)a3 fromDate:(id)a4 options:(int)a5
{
  id v8;
  ICSTimeZone *v9;
  void *v10;
  id v11;
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
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  id v46;
  void *v47;
  unint64_t v48;
  id v49;
  int v50;
  void *v51;
  void *v52;
  unint64_t v53;
  id v54;
  unint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v49 = a4;
  v9 = -[ICSComponent init](self, "init");
  if (v9)
  {
    objc_msgSend(v8, "tzid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSTimeZone setTzid:](v9, "setTzid:", v10);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = a5;
    v46 = v8;
    if (a5 == 1)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99D48]);
      v12 = (void *)objc_msgSend(v11, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimeZone:", v13);

      v54 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v54, "setYear:", 2050);
      v14 = v12;
      objc_msgSend(v12, "dateFromComponents:", v54);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v8, "tzid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeZoneWithName:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      a5 = 1;
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setYear:", objc_msgSend(v49, "year"));
      objc_msgSend(v18, "setMonth:", objc_msgSend(v49, "month"));
      objc_msgSend(v18, "setDay:", objc_msgSend(v49, "day"));
      objc_msgSend(v18, "setHour:", objc_msgSend(v49, "hour"));
      objc_msgSend(v18, "setMinute:", objc_msgSend(v49, "minute"));
      objc_msgSend(v18, "setSecond:", objc_msgSend(v49, "second"));
      objc_msgSend(v18, "setTimeZone:", v17);
      v19 = v14;
      objc_msgSend(v14, "dateFromComponents:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSTimeZone _previousDSTTransitionForDate:timezone:](v9, "_previousDSTTransitionForDate:timezone:", v20, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateByAddingTimeInterval:", -1.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICSTimeZone blocksAfterDate:untilDate:forTimeZone:](ICSTimeZone, "blocksAfterDate:untilDate:forTimeZone:", v22, v52, v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 1;
    }
    else
    {
      objc_msgSend(v8, "components");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -1;
    }
    if (objc_msgSend(v23, "count", v46))
    {
      v25 = 0;
      v53 = 0;
      v55 = 0;
      v26 = 0x1E9539000;
      v48 = v24;
      while (1)
      {
        objc_msgSend(v23, "objectAtIndex:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (++v25 >= objc_msgSend(v23, "count"))
        {
          v32 = 0;
        }
        else
        {
          v28 = v25;
          while (1)
          {
            v29 = objc_opt_class();
            objc_msgSend(v23, "objectAtIndex:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_opt_class();

            if (v29 == v31)
              break;
            if (++v28 >= objc_msgSend(v23, "count"))
            {
              v32 = 0;
              goto LABEL_14;
            }
          }
          objc_msgSend(v23, "objectAtIndex:", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "dtstart");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "value");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
          v26 = 0x1E9539000uLL;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = (void *)objc_msgSend(objc_alloc(*(Class *)(v26 + 3936)), "initWithYear:month:day:hour:minute:second:", objc_msgSend(v32, "year"), objc_msgSend(v32, "month"), objc_msgSend(v32, "day"), objc_msgSend(v32, "hour"), objc_msgSend(v32, "minute"), objc_msgSend(v32, "second"));
          v36 = v35;
          if (v35)
          {
            a5 = v50;
            v24 = v48;
            v26 = 0x1E9539000;
            if (objc_msgSend(v35, "compare:", v49) != 1)
              goto LABEL_35;
          }
          else
          {
            a5 = v50;
            v24 = v48;
            v26 = 0x1E9539000;
          }
        }
        else
        {
          v36 = 0;
        }
        if (a5 == 2)
        {
          objc_msgSend(v51, "addObject:", v27);
          goto LABEL_35;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_30;
        v38 = v55;
        if (v55 < v24)
        {
          ++v55;
LABEL_29:
          objc_msgSend(v51, "addObject:", v27);
LABEL_30:
          v38 = v55;
        }
        v37 = v53;
LABEL_33:
        v53 = v37;
        v55 = v38;
        if (v37 == v24 && v38 == v24)
        {

          goto LABEL_38;
        }
LABEL_35:

        if (v25 >= objc_msgSend(v23, "count"))
          goto LABEL_38;
      }
      v37 = v53;
      if (v53 >= v24)
      {
        v38 = v55;
        goto LABEL_33;
      }
      ++v53;
      goto LABEL_29;
    }
LABEL_38:
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v51, "allObjects");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "sortedArrayUsingSelector:", sel_compare_);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v57 != v43)
            objc_enumerationMutation(v40);
          -[ICSComponent addComponent:withUIDGenerator:](v9, "addComponent:withUIDGenerator:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i), 0);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v42);
    }

    v8 = v47;
  }

  return v9;
}

- (id)_previousDSTTransitionForDate:(id)a3 timezone:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99D48]);
  v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v8, "setTimeZone:", v6);
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 4, -1, v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextDaylightSavingTimeTransitionAfterDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  objc_msgSend(v12, "earlierDate:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToDate:", v12);

  v15 = v12;
  if (!v14)
    goto LABEL_4;
  do
  {
    v16 = v12;
    v12 = v15;

    objc_msgSend(v8, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nextDaylightSavingTimeTransitionAfterDate:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "earlierDate:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToDate:", v15);

  }
  while ((v19 & 1) != 0);
  if ((v14 & 1) == 0)
  {
LABEL_4:
    objc_msgSend(v8, "components:fromDate:", 252, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMonth:", 1);
    objc_msgSend(v20, "setDay:", 1);
    objc_msgSend(v8, "dateFromComponents:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "nextDaylightSavingTimeTransitionAfterDate:", v21);
    v23 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v23;
  }

  return v12;
}

+ (id)timeZoneWithSystemTimeZoneName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  ICSTimeZone *v9;
  ICSTimeZone *v10;
  void *v11;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)_sCache;
  if (!_sCache)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)_sCache;
    _sCache = (uint64_t)v7;

    v6 = (void *)_sCache;
  }
  objc_msgSend(v6, "objectForKey:", v4);
  v9 = (ICSTimeZone *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = [ICSTimeZone alloc];
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICSTimeZone initWithSystemTimeZone:](v10, "initWithSystemTimeZone:", v11);

    objc_msgSend((id)_sCache, "setObject:forKey:", v9, v4);
  }
  objc_sync_exit(v5);

  return v9;
}

- (BOOL)isEqualToNSTimeZone:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  ICSDateTimeValue *v8;
  ICSDateTimeValue *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ICSDateTimeValue *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v22;
  void *v23;
  ICSTimeZone *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ICSDateTimeValue *v28;
  __int16 v29;
  ICSDateTimeValue *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = a4;
    v24 = self;
    v8 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v7, "year") - 1, objc_msgSend(v7, "month"), objc_msgSend(v7, "day"), objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"), objc_msgSend(v7, "second"));
    v9 = [ICSDateTimeValue alloc];
    v10 = objc_msgSend(v7, "year") + 1;
    v11 = objc_msgSend(v7, "month");
    v12 = objc_msgSend(v7, "day");
    v13 = objc_msgSend(v7, "hour");
    v14 = objc_msgSend(v7, "minute");
    v15 = objc_msgSend(v7, "second");

    v16 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:](v9, "initWithYear:month:day:hour:minute:second:", v10, v11, v12, v13, v14, v15);
    -[ICSTimeZone computeTimeZoneChangeListFromDate:toDate:](v24, "computeTimeZoneChangeListFromDate:toDate:", v8, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ICSComputeTimeZoneChangeListFromDate:toDate:", v8, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "ICSContainsArray:", v17);
    if ((v19 & 1) == 0)
    {
      logHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSComponent ICSStringWithOptions:](v24, "ICSStringWithOptions:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v26 = v22;
        v27 = 2112;
        v28 = v8;
        v29 = 2112;
        v30 = v16;
        v31 = 2112;
        v32 = v17;
        v33 = 2112;
        v34 = v18;
        v35 = 2112;
        v36 = v23;
        _os_log_error_impl(&dword_1D3456000, v20, OS_LOG_TYPE_ERROR, "VTIMEZONE does not match System Time Zone (%@) for %@ to %@: %@ != %@\n\n%@", buf, 0x3Eu);

      }
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)getNSTimeZoneFromDate:(id)a3 toDate:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unsigned int (**v11)(_QWORD, _QWORD);
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  id obj;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  id v68;
  ICSTimeZone *v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  id v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v53 = a4;
  -[ICSTimeZone tzid](self, "tzid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || objc_msgSend(v6, "rangeOfString:", CFSTR("/")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICSTimeZone computeTimeZoneChangeListFromDate:toDate:](self, "computeTimeZoneChangeListFromDate:toDate:", v52, v53);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy_;
    v76 = __Block_byref_object_dispose_;
    v77 = 0;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __54__ICSTimeZone_Internal__getNSTimeZoneFromDate_toDate___block_invoke;
    v66[3] = &unk_1E953B188;
    v9 = v52;
    v67 = v9;
    v10 = v53;
    v68 = v10;
    v69 = self;
    v51 = v8;
    v70 = v51;
    v71 = &v72;
    v11 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1D824FE38](v66);
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (((unsigned int (**)(_QWORD, id))v11)[2](v11, v12))
    {
      v13 = v12;
      v12 = v13;
      v14 = v6;
LABEL_5:
      v15 = v13;
LABEL_39:

      _Block_object_dispose(&v72, 8);
      v6 = v14;
      goto LABEL_40;
    }
    -[ICSTimeZone tzid](self, "tzid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      v14 = v6;
    }
    else
    {
      -[ICSTimeZone tzid](self, "tzid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICSTimeZoneTranslator timeZoneNameForNonstandardTimeZone:](ICSTimeZoneTranslator, "timeZoneNameForNonstandardTimeZone:", v18);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          if ((((uint64_t (*)(_QWORD, void *))v11[2])(v11, v19) & 1) == 0)
          {
            logHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              -[ICSComponent ICSStringWithOptions:](self, "ICSStringWithOptions:", 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v82 = v14;
              v83 = 2112;
              v84 = v9;
              v85 = 2112;
              v86 = v10;
              v87 = 2112;
              v88 = v51;
              v89 = 2112;
              v90 = v48;
              _os_log_error_impl(&dword_1D3456000, v20, OS_LOG_TYPE_ERROR, "VTIMEZONE does not match System Time Zone (%@) for %@ to %@: %@\n\n%@", buf, 0x34u);

            }
          }
          v13 = v19;
          v12 = v13;
          goto LABEL_5;
        }
        v12 = 0;
      }
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend((id)objc_opt_class(), "quickTimeZoneNames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v63;
      while (2)
      {
        v24 = 0;
        v25 = v12;
        v26 = v14;
        do
        {
          if (*(_QWORD *)v63 != v23)
            objc_enumerationMutation(v21);
          v14 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * v24);

          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v14);
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if ((((uint64_t (*)(_QWORD, id))v11[2])(v11, v12) & 1) != 0)
          {
            v12 = v12;

            goto LABEL_38;
          }
          ++v24;
          v25 = v12;
          v26 = v14;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v80, 16);
        if (v22)
          continue;
        break;
      }
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend((id)objc_opt_class(), "slowTimeZoneNames");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
    if (v28)
    {
      v14 = 0;
      v29 = *(_QWORD *)v59;
      while (2)
      {
        v30 = 0;
        v31 = v12;
        v32 = v14;
        do
        {
          if (*(_QWORD *)v59 != v29)
            objc_enumerationMutation(v27);
          v14 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * v30);

          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v14);
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if ((((uint64_t (*)(_QWORD, id))v11[2])(v11, v12) & 1) != 0)
          {
            v12 = v12;

            goto LABEL_38;
          }
          ++v30;
          v31 = v12;
          v32 = v14;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v79, 16);
        if (v28)
          continue;
        break;
      }

    }
    v33 = (void *)v73[5];
    if (v33)
    {
      v15 = v33;
      v14 = 0;
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend((id)objc_opt_class(), "quickTimeZoneNames");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "slowTimeZoneNames");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v36);
      obj = (id)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
      if (v37)
      {
        v14 = 0;
        v50 = *(_QWORD *)v55;
        while (2)
        {
          v38 = v37;
          v39 = 0;
          v40 = v12;
          v41 = v14;
          do
          {
            if (*(_QWORD *)v55 != v50)
              objc_enumerationMutation(obj);
            v14 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v39);

            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v14);
            v12 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "localizedName:locale:", 0, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICSTimeZone tzid](self, "tzid");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v43, "isEqualToString:", v44);

            if ((v45 & 1) != 0)
            {
              v12 = v12;

              goto LABEL_38;
            }
            ++v39;
            v40 = v12;
            v41 = v14;
          }
          while (v38 != v39);
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
          if (v37)
            continue;
          break;
        }

      }
      if (objc_msgSend(v51, "count") == 1)
      {
        objc_msgSend(v51, "objectAtIndex:", 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", objc_msgSend(v46, "tzOffsetTo"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v47;
        v14 = 0;
LABEL_38:
        v15 = v12;
      }
      else
      {
        v14 = 0;
        v15 = 0;
      }
    }
    goto LABEL_39;
  }
  v12 = v7;
  v15 = v12;
LABEL_40:

  return v15;
}

uint64_t __54__ICSTimeZone_Internal__getNSTimeZoneFromDate_toDate___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ICSComputeTimeZoneChangeListFromDate:toDate:", a1[4], a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)objc_opt_class(), "matchTypeForSubarray:inTZChangeArray:", a1[7], v6);
    if (v7 == 2)
    {
      v11 = 1;
    }
    else
    {
      if (v7 == 1)
      {
        v8 = *(_QWORD *)(a1[8] + 8);
        v10 = *(_QWORD *)(v8 + 40);
        v9 = (id *)(v8 + 40);
        if (!v10)
          objc_storeStrong(v9, a2);
      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)quickTimeZoneNames
{
  if (quickTimeZoneNames_onceToken != -1)
    dispatch_once(&quickTimeZoneNames_onceToken, &__block_literal_global_13);
  return (id)quickTimeZoneNames__quickTimeZoneNames;
}

void __43__ICSTimeZone_Internal__quickTimeZoneNames__block_invoke()
{
  void *v0;

  v0 = (void *)quickTimeZoneNames__quickTimeZoneNames;
  quickTimeZoneNames__quickTimeZoneNames = (uint64_t)&unk_1E95494A0;

}

+ (id)slowTimeZoneNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (slowTimeZoneNames_onceToken != -1)
    dispatch_once(&slowTimeZoneNames_onceToken, block);
  return (id)slowTimeZoneNames__slowTimeZones;
}

void __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "quickTimeZoneNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E80], "knownTimeZoneNames");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke_2;
  v9[3] = &unk_1E953B1D0;
  v10 = v3;
  v4 = v3;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)slowTimeZoneNames__slowTimeZones;
  slowTimeZoneNames__slowTimeZones = v6;

}

uint64_t __42__ICSTimeZone_Internal__slowTimeZoneNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)getNSTimeZone:(id)a3
{
  id v4;
  ICSDateTimeValue *v5;
  ICSDateTimeValue *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ICSDateTimeValue *v13;
  void *v14;

  v4 = a3;
  v5 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v4, "year") - 1, objc_msgSend(v4, "month"), objc_msgSend(v4, "day"), objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), objc_msgSend(v4, "second"));
  v6 = [ICSDateTimeValue alloc];
  v7 = objc_msgSend(v4, "year") + 1;
  v8 = objc_msgSend(v4, "month");
  v9 = objc_msgSend(v4, "day");
  v10 = objc_msgSend(v4, "hour");
  v11 = objc_msgSend(v4, "minute");
  v12 = objc_msgSend(v4, "second");

  v13 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:](v6, "initWithYear:month:day:hour:minute:second:", v7, v8, v9, v10, v11, v12);
  -[ICSTimeZone getNSTimeZoneFromDate:toDate:](self, "getNSTimeZoneFromDate:toDate:", v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)perfectMatchForSubarray:(id)a3 inTZChangeArray:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count")
    && (v7 = objc_msgSend(v5, "count"), v7 <= objc_msgSend(v6, "count"))
    && (objc_msgSend(v5, "objectAtIndex:", 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v6, "indexOfObject:", v8),
        v8,
        v9 != 0x7FFFFFFFFFFFFFFFLL)
    && (v10 = objc_msgSend(v5, "count") + v9, v10 <= objc_msgSend(v6, "count")))
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v13 = 1;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", v9 + v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v14, "isEqual:", v15);

        if ((v11 & 1) == 0)
          break;
        ++v13;
      }
      while (v13 < objc_msgSend(v5, "count"));
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (int64_t)matchTypeForSubarray:(id)a3 inTZChangeArray:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "perfectMatchForSubarray:inTZChangeArray:", v6, v7) & 1) != 0)
  {
    v8 = 2;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "tzOffsetTo");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "tzOffsetTo");

    if (objc_msgSend(v7, "count"))
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      LOBYTE(v16) = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v16 = v16 || objc_msgSend(v17, "tzOffsetTo") != v10;
        if (v14 < objc_msgSend(v6, "count"))
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isCloseTo:", v19))
          {
            ++v14;
            v15 = v15 || objc_msgSend(v19, "tzOffsetTo") != v12;
          }
          else if (v14)
          {

            v8 = 0;
            goto LABEL_20;
          }

        }
        ++v13;
      }
      while (v13 < objc_msgSend(v7, "count"));
      v20 = v16 ^ v15;
    }
    else
    {
      v14 = 0;
      v20 = 0;
    }
    v8 = (v14 != 0) & (v20 ^ 1u);
  }
LABEL_20:

  return v8;
}

- (id)computeTimeZoneChangeListFromDate:(id)a3 toDate:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  ICSTimeZoneChange *v46;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  ICSTimeZone *v52;
  uint64_t v53;
  id v54;
  id v55;
  id obj;
  id obja;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v55 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v52 = self;
  -[ICSComponent components](self, "components");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v75 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "computeTimeZoneChangeListFromDate:toDate:", v54, v55);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v71;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v71 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
                if ((objc_msgSend(v6, "containsObject:", v17) & 1) == 0)
                  objc_msgSend(v6, "addObject:", v17);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
            }
            while (v14);
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v6, "count"))
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[ICSComponent components](v52, "components");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    if (v19)
    {
      v20 = v19;
      obja = 0;
      v21 = 0;
      v22 = *(_QWORD *)v67;
      v48 = *(_QWORD *)v67;
      v49 = v18;
      do
      {
        v23 = 0;
        v50 = v20;
        do
        {
          if (*(_QWORD *)v67 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v24, "dtstart");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "value");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v26, "compare:", v55) == -1)
            {
              v51 = v26;
              v53 = v23;
              if (!v21 || objc_msgSend(v26, "compare:", v21) == 1)
              {
                v27 = v26;

                obja = (id)objc_msgSend(v24, "tzoffsetto");
                v21 = v27;
              }
              v64 = 0u;
              v65 = 0u;
              v62 = 0u;
              v63 = 0u;
              objc_msgSend(v24, "rrule", v48, v49);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v63;
                do
                {
                  for (k = 0; k != v30; ++k)
                  {
                    if (*(_QWORD *)v63 != v31)
                      objc_enumerationMutation(v28);
                    v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
                    objc_msgSend(v33, "until");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = objc_msgSend(v34, "compare:", v21);

                    if (v35 == 1)
                    {
                      objc_msgSend(v33, "until");
                      v36 = objc_claimAutoreleasedReturnValue();

                      obja = (id)objc_msgSend(v24, "tzoffsetto");
                      v21 = (void *)v36;
                    }
                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
                }
                while (v30);
              }

              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              objc_msgSend(v24, "rdate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
              if (v38)
              {
                v39 = v38;
                v40 = *(_QWORD *)v59;
                do
                {
                  for (m = 0; m != v39; ++m)
                  {
                    if (*(_QWORD *)v59 != v40)
                      objc_enumerationMutation(v37);
                    v42 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * m);
                    objc_msgSend(v42, "value");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = objc_msgSend(v43, "compare:", v21);

                    if (v44 == 1)
                    {
                      objc_msgSend(v42, "value");
                      v45 = objc_claimAutoreleasedReturnValue();

                      obja = (id)objc_msgSend(v24, "tzoffsetto");
                      v21 = (void *)v45;
                    }
                  }
                  v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
                }
                while (v39);
              }

              v22 = v48;
              v18 = v49;
              v20 = v50;
              v26 = v51;
              v23 = v53;
            }

          }
          ++v23;
        }
        while (v23 != v20);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      }
      while (v20);
    }
    else
    {
      obja = 0;
      v21 = 0;
    }

    v46 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:]([ICSTimeZoneChange alloc], "initWithTimeInterval:tzOffsetTo:", obja, 0.0);
    objc_msgSend(v6, "addObject:", v46);

  }
  objc_msgSend(v6, "sortUsingSelector:", sel_compare_, v48, v49);

  return v6;
}

@end
