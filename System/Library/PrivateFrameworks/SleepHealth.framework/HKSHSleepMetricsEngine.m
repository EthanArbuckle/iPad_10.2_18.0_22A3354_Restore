@implementation HKSHSleepMetricsEngine

- (HKSHSleepMetricsEngine)initWithHealthStore:(id)a3
{
  id v5;
  HKSHSleepMetricsEngine *v6;
  HKSHSleepMetricsEngine *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSHSleepMetricsEngine;
  v6 = -[HKSHSleepMetricsEngine init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_healthStore, a3);

  return v7;
}

- (void)fetchSleepMetricsForMorningIndexRange:(id)a3 completion:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *, uint64_t, void *, uint64_t);
  void *v16;
  HKSHSleepMetricsEngine *v17;
  id v18;
  int64_t v19;
  int64_t v20;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BDD3F98]);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __75__HKSHSleepMetricsEngine_fetchSleepMetricsForMorningIndexRange_completion___block_invoke;
  v16 = &unk_24C3023B8;
  v17 = self;
  v18 = v7;
  v19 = var0;
  v20 = var1;
  v9 = v7;
  v10 = (void *)objc_msgSend(v8, "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", var0, var1, 1, 0, 1, &v13);
  v11 = objc_alloc(MEMORY[0x24BDD3F90]);
  v12 = (void *)objc_msgSend(v11, "initWithIdentifier:mode:", CFSTR("SleepMetricsEngine"), 0, v13, v14, v15, v16, v17);
  objc_msgSend(v10, "setCacheSettings:", v12);

  objc_msgSend(v10, "setDebugIdentifier:", CFSTR("SleepMetricsEngine"));
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v10);

}

void __75__HKSHSleepMetricsEngine_fetchSleepMetricsForMorningIndexRange_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a1[5];
  v9 = v6;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "sleepMetricsForDaySummaries:inMorningIndexRange:", v6, a1[6], a1[7]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, 0, a4);
  }

}

+ (id)sleepMetricsForDaySummaries:(id)a3
{
  return (id)objc_msgSend(a1, "sleepMetricsForDaySummaries:inMorningIndexRange:", a3, *MEMORY[0x24BDD2B60], *(_QWORD *)(MEMORY[0x24BDD2B60] + 8));
}

+ (id)sleepMetricsForDaySummaries:(id)a3 inMorningIndexRange:(id)a4
{
  id v4;
  BOOL v6;
  void *v7;
  int64_t v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v25;
  double v26;
  void *v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  int v53;
  id v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  BOOL v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
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
  uint64_t v158;
  void *v159;
  id v161;
  id v162;
  id v163;
  double v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  double v168;
  uint64_t v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  id obj;
  double v183;
  double v184;
  void *v185;
  uint64_t v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  double v193;
  void *v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  BOOL v206;
  void *v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint64_t i;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  _QWORD v225[5];
  $0AC6E346AE4835514AAA8AC86D8F4844 v226;
  uint64_t v227;
  uint64_t *v228;
  uint64_t v229;
  uint64_t v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  _BYTE v239[128];
  _BYTE v240[128];
  uint64_t v241;

  v241 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v161 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v167 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v163 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v162 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v235 = 0u;
  v236 = 0u;
  v237 = 0u;
  v238 = 0u;
  obj = v4;
  v210 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v235, v240, 16);
  if (!v210)
  {
    v205 = 0;
    v207 = 0;
    v177 = 0;
    v178 = 0;
    v179 = 0;
    v180 = 0;
    v166 = 0;
    v185 = 0;
    v186 = 0;
    v195 = 0;
    v197 = 0;
    v201 = 0;
    v203 = 0;
    v199 = 0;
    v170 = 0.0;
    v171 = 0.0;
    v172 = 0.0;
    v173 = 0.0;
    v174 = 0.0;
    v175 = 0.0;
    v187 = 0.0;
    v188 = 0.0;
    v131 = obj;
    v191 = 0.0;
    v193 = 0.0;
    v189 = 0.0;
    v190 = 0.0;
    v176 = 0.0;
    goto LABEL_103;
  }
  v177 = 0;
  v178 = 0;
  v179 = 0;
  v180 = 0;
  v169 = 0;
  v165 = 0;
  v166 = 0;
  v186 = 0;
  v195 = 0;
  v197 = 0;
  v201 = 0;
  v203 = 0;
  v199 = 0;
  v205 = 0;
  v208 = *(_QWORD *)v236;
  v170 = 0.0;
  v171 = 0.0;
  v172 = 0.0;
  v173 = 0.0;
  v174 = 0.0;
  v175 = 0.0;
  v6 = a4.var0 == *MEMORY[0x24BDD2B60] && a4.var1 == *(_QWORD *)(MEMORY[0x24BDD2B60] + 8);
  v206 = v6;
  v168 = 0.0;
  v164 = 0.0;
  v187 = 0.0;
  v188 = 0.0;
  v191 = 0.0;
  v193 = 0.0;
  v189 = 0.0;
  v190 = 0.0;
  v176 = 0.0;
  do
  {
    for (i = 0; i != v210; ++i)
    {
      if (*(_QWORD *)v236 != v208)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * i);
      v223 = v7;
      if (!v206)
      {
        v8 = objc_msgSend(v7, "morningIndex");
        v9 = v8 >= a4.var0 && v8 - a4.var0 < a4.var1;
        v7 = v223;
        if (!v9)
          continue;
      }
      objc_msgSend(v7, "sleepDuration");
      v11 = v10;
      objc_msgSend(v223, "inBedDuration");
      v13 = v12;
      objc_msgSend(v223, "remSleepDuration");
      v15 = v14;
      objc_msgSend(v223, "coreSleepDuration");
      v17 = v16;
      objc_msgSend(v223, "deepSleepDuration");
      v19 = v18;
      objc_msgSend(v223, "unspecifiedSleepDuration");
      v21 = v20;
      objc_msgSend(v223, "awakeDuration");
      v23 = v22;
      if (v11 >= 2.22044605e-16 || v13 >= 2.22044605e-16)
      {
        if (v11 > 2.22044605e-16)
        {
          v25 = (void *)MEMORY[0x24BDD16E0];
          v26 = __exp10(3.0);
          objc_msgSend(v25, "numberWithDouble:", round(v11 * v26) / v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "addObject:", v27);

          ++v180;
          v176 = v176 + v11;
        }
        if (v13 <= 2.22044605e-16)
          v28 = -0.0;
        else
          v28 = v13;
        v29 = v205;
        if (v13 > 2.22044605e-16)
          v29 = v205 + 1;
        v205 = v29;
        if (v15 <= 2.22044605e-16)
          v30 = -0.0;
        else
          v30 = v15;
        v183 = v30;
        v184 = v28;
        if (v15 <= 2.22044605e-16)
          v31 = v197;
        else
          v31 = v197 + 1;
        if (v17 <= 2.22044605e-16)
          v32 = -0.0;
        else
          v32 = v17;
        v33 = v199;
        if (v17 > 2.22044605e-16)
          v33 = v199 + 1;
        v197 = v31;
        v199 = v33;
        if (v19 > 2.22044605e-16)
        {
          v34 = v201 + 1;
        }
        else
        {
          v19 = -0.0;
          v34 = v201;
        }
        v35 = v21 <= 2.22044605e-16;
        if (v21 <= 2.22044605e-16)
          v21 = -0.0;
        v36 = v203;
        if (!v35)
          v36 = v203 + 1;
        v201 = v34;
        v203 = v36;
        v37 = v23 <= 2.22044605e-16;
        if (v23 <= 2.22044605e-16)
          v23 = -0.0;
        v38 = v195;
        if (!v37)
          v38 = v195 + 1;
        v195 = v38;
        objc_msgSend(v223, "primarySchedule");
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        if (v215)
        {
          v39 = objc_msgSend(v223, "morningIndex");
          objc_msgSend(v223, "calendar");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "bedtimeDateIntervalForMorningIndex:calendar:", v39, v40);
          v212 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v212, "startDate");
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          if (v220)
          {
            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v220, 900.0);
            v234 = 0u;
            v232 = 0u;
            v233 = 0u;
            v231 = 0u;
            objc_msgSend(v223, "periods");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v231, v239, 16);
            if (v43)
            {
              v44 = 0;
              v45 = *(_QWORD *)v232;
              while (2)
              {
                for (j = 0; j != v43; ++j)
                {
                  if (*(_QWORD *)v232 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * j);
                  objc_msgSend(v47, "dateInterval");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v48, "intersectsDateInterval:", v41);

                  if (v49)
                  {
                    v54 = v47;

                    ++v166;
                    v44 = v54;
                    goto LABEL_68;
                  }
                  objc_msgSend(v47, "dateInterval");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "startDate");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = objc_msgSend(v51, "hk_isAfterOrEqualToDate:", v220);
                  if (v44)
                    v53 = 0;
                  else
                    v53 = v52;

                  if (v53)
                    v44 = v47;
                }
                v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v231, v239, 16);
                if (v43)
                  continue;
                break;
              }
LABEL_68:

              if (v44)
              {
                objc_msgSend(v44, "dateInterval");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "startDate");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "timeIntervalSinceDate:", v220);
                v58 = v57;

                ++v165;
                v164 = v164 + v58;
                goto LABEL_71;
              }
            }
            else
            {
              v44 = v42;
LABEL_71:

            }
          }
          if (v212)
          {
            objc_msgSend(v212, "duration");
            if (v59 > 2.22044605e-16)
            {
              objc_msgSend(v212, "duration");
              v61 = v60;
              v62 = __exp10(3.0);
              v63 = 0.0;
              if (v11 > 2.22044605e-16)
              {
                v64 = __exp10(3.0);
                v63 = round(v11 * v64) / v64;
              }
              v65 = round(v61 * v62) / v62;
              v66 = __exp10(3.0);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v65);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v163, "addObject:", v67);

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round((v63 - v65) * v66) / v66);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v162, "addObject:", v68);

            }
          }

        }
        v69 = v223;
        if (v11 > 2.22044605e-16)
        {
          objc_msgSend(v223, "sleepDurationGoal");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v70 == 0;

          if (!v71)
          {
            objc_msgSend(v223, "sleepDurationGoal");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "doubleValueForUnit:", v73);
            v75 = v74;

            v76 = v75 - v11;
            if (v76 < *(double *)&HKSHSleepDurationGoalLeeway)
              objc_msgSend(v161, "hk_addDayIndex:", objc_msgSend(v223, "morningIndex"));
            ++v169;
            v168 = v168 + v76;
          }
          v69 = v223;
        }
        objc_msgSend(v69, "periods");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "firstObject");
        v221 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v223, "periods");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "lastObject");
        v213 = (void *)objc_claimAutoreleasedReturnValue();

        if (v221 && v213)
        {
          objc_msgSend(v221, "dateInterval");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "startDate");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "dateInterval");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "startDate");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "calendar");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_timeIntervalForDate:sinceDate:calendar:", v80, v82, v83);
          v85 = v84;

          objc_msgSend(v213, "dateInterval");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "endDate");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "dateInterval");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "startDate");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "calendar");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_timeIntervalForDate:sinceDate:calendar:", v87, v89, v90);
          v92 = v91;

          v174 = v174 + v85;
          v175 = v175 + v92;
          ++v179;
        }
        objc_msgSend(v223, "periods");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_firstInBedSegment:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v223, "periods");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_lastInBedSegment:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (v94 && v96)
        {
          objc_msgSend(v94, "dateInterval");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "startDate");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "dateInterval");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "startDate");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "calendar");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_timeIntervalForDate:sinceDate:calendar:", v98, v100, v101);
          v103 = v102;

          objc_msgSend(v96, "dateInterval");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "endDate");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "dateInterval");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "startDate");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "calendar");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_timeIntervalForDate:sinceDate:calendar:", v105, v107, v108);
          v110 = v109;

          v172 = v172 + v103;
          v173 = v173 + v110;
          ++v178;
        }
        objc_msgSend(v223, "periods");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_firstAsleepSegment:", v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v223, "periods");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_lastAsleepSegment:", v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();

        if (v112 && v114)
        {
          objc_msgSend(v112, "dateInterval");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "startDate");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "dateInterval");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "startDate");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "calendar");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_timeIntervalForDate:sinceDate:calendar:", v116, v118, v119);
          v121 = v120;

          objc_msgSend(v114, "dateInterval");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "endDate");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "dateInterval");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "startDate");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "calendar");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_timeIntervalForDate:sinceDate:calendar:", v123, v125, v126);
          v128 = v127;

          v170 = v170 + v121;
          v171 = v171 + v128;
          ++v177;
        }

        ++v186;
        v188 = v188 + v184;
        v189 = v189 + v183;
        v190 = v190 + v32;
        v191 = v191 + v19;
        v193 = v193 + v21;
        v187 = v187 + v23;
        continue;
      }
    }
    v210 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v235, v240, 16);
  }
  while (v210);

  if (v165 < 1)
  {
    v207 = 0;
  }
  else
  {
    v129 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v164 / (double)v165);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "hk_quantityWithSeconds:", v130);
    v207 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v169 < 1)
  {
    v185 = 0;
  }
  else
  {
    v132 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v168 / (double)v169);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "hk_quantityWithSeconds:", v131);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_103:

  }
  _HKSHSafeAverageDurationRoundedToNearestMinute(v180, v176);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  _HKSHSafeAverageDurationRoundedToNearestMinute(v205, v188);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  _HKSHSafeAverageDurationRoundedToNearestMinute(v197, v189);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  _HKSHSafeAverageDurationRoundedToNearestMinute(v199, v190);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  _HKSHSafeAverageDurationRoundedToNearestMinute(v201, v191);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  _HKSHSafeAverageDurationRoundedToNearestMinute(v203, v193);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  _HKSHSafeAverageDurationRoundedToNearestMinute(v195, v187);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "hk_quantityWithSeconds:", v224);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "hk_quantityWithSeconds:", v222);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "hk_quantityWithSeconds:", v219);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "hk_quantityWithSeconds:", v216);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "hk_quantityWithSeconds:", v214);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "hk_quantityWithSeconds:", v211);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "hk_quantityWithSeconds:", v209);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = 0;
  v228 = &v227;
  v229 = 0x2020000000;
  v230 = 0;
  v225[0] = MEMORY[0x24BDAC760];
  v225[1] = 3221225472;
  v225[2] = __74__HKSHSleepMetricsEngine_sleepMetricsForDaySummaries_inMorningIndexRange___block_invoke;
  v225[3] = &unk_24C3023E0;
  v226 = a4;
  v225[4] = &v227;
  objc_msgSend(v161, "hk_enumerateDayIndexRangesWithOptions:usingBlock:", 2, v225);
  v133 = a1;
  if (v179 < 1)
  {
    v139 = 0;
    v140 = 0;
  }
  else
  {
    objc_msgSend(obj, "lastObject");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "calendar");
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(obj, "lastObject");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "dateInterval");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "startDate");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_dateComponentsForInterval:sinceDate:calendar:", v138, v135, v174 / (double)v179);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dateComponentsForInterval:sinceDate:calendar:", v138, v135, v175 / (double)v179);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    v133 = a1;
  }
  if (v178 < 1)
  {
    v146 = 0;
    v147 = 0;
  }
  else
  {
    objc_msgSend(obj, "lastObject");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "calendar");
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(obj, "lastObject");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "dateInterval");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "startDate");
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_dateComponentsForInterval:sinceDate:calendar:", v145, v142, v172 / (double)v178);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dateComponentsForInterval:sinceDate:calendar:", v145, v142, v173 / (double)v178);
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    v133 = a1;
  }
  if (v177 < 1)
  {
    v153 = 0;
    v154 = 0;
  }
  else
  {
    objc_msgSend(obj, "lastObject");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "calendar");
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(obj, "lastObject");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "dateInterval");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "startDate");
    v152 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_dateComponentsForInterval:sinceDate:calendar:", v152, v149, v170 / (double)v177);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_dateComponentsForInterval:sinceDate:calendar:", v152, v149, v171 / (double)v177);
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    v133 = a1;
  }
  objc_msgSend(v133, "_computeStandardDeviationFor:", v167);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "_computeStandardDeviationFor:", v163);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "_computeStandardDeviationFor:", v162);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v161, "count");
  +[HKSHSleepMetrics sleepMetricsWithMorningIndexRange:sleepAnalysisAsleepCount:sleepAnalysisInBedCount:sleepAnalysisCount:averageSleepDuration:averageInBedDuration:averageREMSleepDuration:averageCoreSleepDuration:averageDeepSleepDuration:averageUnspecifiedSleepDuration:averageAwakeDuration:bedtimeAchievedCount:sleepDurationGoalAchievedCount:sleepDurationGoalStreakCount:averageBedtimeMiss:averageSleepDurationGoalMiss:averageBedtime:averageWakeTime:averageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:standardDeviationActualTimeAsleep:standardDeviationScheduledTimeAsleep:standardDeviationActualVsScheduledTimeAsleep:](HKSHSleepMetrics, "sleepMetricsWithMorningIndexRange:sleepAnalysisAsleepCount:sleepAnalysisInBedCount:sleepAnalysisCount:averageSleepDuration:averageInBedDuration:averageREMSleepDuration:averageCoreSleepDuration:averageDeepSleepDuration:averageUnspecifiedSleepDuration:averageAwakeDuration:bedtimeAchievedCount:sleepDurationGoalAchievedCount:sleepDurationGoalStreakCount:averageBedtimeMiss:averageSleepDurationGoalMiss:averageBedtime:averageWakeTime:averageInBedStartTime:averageInBedEndTime:averageSleepStartTime:averageSleepEndTime:standardDeviationActualTimeAsleep:standardDeviationScheduledTimeAsleep:standardDeviationActualVsScheduledTimeAsleep:", a4.var0, a4.var1, v180, v205, v186, v204, v202, v200, v198, v196, v194, v192,
    v166,
    v158,
    v228[3],
    v207,
    v185,
    v139,
    v140,
    v146,
    v147,
    v153,
    v154,
    v155,
    v156,
    v157);
  v159 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v227, 8);
  return v159;
}

_QWORD *__74__HKSHSleepMetricsEngine_sleepMetricsForDaySummaries_inMorningIndexRange___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a4 = 1;
  v5 = result[5];
  v4 = result[6];
  if (v5 == *MEMORY[0x24BDD2B60] && v4 == *(_QWORD *)(MEMORY[0x24BDD2B60] + 8))
    goto LABEL_11;
  v7 = a3 + a2 - 1;
  if (a3 <= 0)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = v5 + v4 - 1;
  v9 = v4 <= 0 ? 0x7FFFFFFFFFFFFFFFLL : v8;
  if (v7 == v9)
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = a3;
  return result;
}

+ (double)_timeIntervalForDate:(id)a3 sinceDate:(id)a4 calendar:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v10 = v9;

  return v8 - v10;
}

+ (id)_dateComponentsForInterval:(double)a3 sinceDate:(id)a4 calendar:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (uint64_t)a3;
  v7 = a5;
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 128, v6, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 224, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_firstInBedSegment:(id)a3
{
  return (id)objc_msgSend(a1, "_firstSegmentMatchingSleepValues:inPeriods:", &unk_24C3043B8, a3);
}

+ (id)_lastInBedSegment:(id)a3
{
  return (id)objc_msgSend(a1, "_lastSegmentMatchingSleepValues:inPeriods:", &unk_24C3043D0, a3);
}

+ (id)_firstAsleepSegment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  _HKCategoryValueSleepAnalysisAsleepValues();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_firstSegmentMatchingSleepValues:inPeriods:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_lastAsleepSegment:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  _HKCategoryValueSleepAnalysisAsleepValues();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lastSegmentMatchingSleepValues:inPeriods:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_firstSegmentMatchingSleepValues:(id)a3 inPeriods:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = a4;
  v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v7 = *(_QWORD *)v28;
    v22 = v6;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v9, "segments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "category"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v5, "containsObject:", v16);

              if ((v17 & 1) != 0)
              {
                v18 = v15;

                v6 = v22;
                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v22;
        v7 = v20;
      }
      v18 = 0;
      v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

+ (id)_lastSegmentMatchingSleepValues:(id)a3 inPeriods:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a4;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  v6 = 0;
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v22 = v7;
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "segments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "category"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v5, "containsObject:", v15);

              if (v16)
              {
                v17 = v14;

                v6 = v17;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v11);
        }

        v7 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }

  return v6;
}

+ (id)_computeStandardDeviationFor:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend(v3, "count");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    v7 = 0.0;
    v8 = 0.0;
    if (v6)
    {
      v9 = v6;
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v11), "doubleValue");
          v8 = v8 + v12;
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }
    v13 = (double)v4;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      v7 = 0.0;
      v18 = v8 / v13;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "doubleValue", (_QWORD)v23);
          v7 = v7 + (v18 - v20) * (v18 - v20);
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqrt(v7 / (v13 + -1.0)));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
