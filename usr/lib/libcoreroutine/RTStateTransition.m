@implementation RTStateTransition

- (RTStateTransition)init
{
  RTStateTransition *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTStateTransition;
  v2 = -[RTStateTransition init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[RTStateTransition setListTransitions:](v2, "setListTransitions:", v3);

  }
  return v2;
}

- (void)addStateTransitionOneTimeTransFromStateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RTStateTransition listTransitions](self, "listTransitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listTransitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v6);
  -[RTStateTransition listTransitions](self, "listTransitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_190);

  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[RTStateTransition listTransitions](self, "listTransitions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &__block_literal_global_191);

  }
}

uint64_t __71__RTStateTransition_addStateTransitionOneTimeTransFromStateTransition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "start_s");
  v6 = v5;
  objc_msgSend(v4, "start_s");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

void __71__RTStateTransition_addStateTransitionOneTimeTransFromStateTransition___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "start_s");
    objc_msgSend(v4, "stringFromTimestamp:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v2, "stop_s");
    objc_msgSend(v6, "stringFromTimestamp:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stop_s");
    v9 = v8;
    objc_msgSend(v2, "start_s");
    v11 = (v9 - v10) / 60.0;
    objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", objc_msgSend(v2, "motionActivityType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413059;
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    v17 = 2049;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "Redirecting transitions: Start, %@, Stop, %@, Commute time, %{private}.2f [min], motionActivityType, %@", (uint8_t *)&v13, 0x2Au);

  }
}

- (void)submitTransition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTStateTransition listTransitions](self, "listTransitions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)showTransition
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[RTStateTransition listTransitions](self, "listTransitions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      -[RTStateTransition listTransitions](self, "listTransitions");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_192);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "No Transition Data ", buf, 2u);
      }

    }
  }
}

void __35__RTStateTransition_showTransition__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = a3 + 1;
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "start_s");
    objc_msgSend(v7, "stringFromTimestamp:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "stop_s");
    objc_msgSend(v9, "stringFromTimestamp:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop_s");
    v12 = v11;
    objc_msgSend(v4, "start_s");
    v14 = (v12 - v13) / 60.0;
    objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", objc_msgSend(v4, "motionActivityType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134219010;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    v22 = 2048;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "transition %lu, start, %@, stop, %@, duration, %.2f [min], motionActivityType, %@", (uint8_t *)&v16, 0x34u);

  }
}

- (void)cleanTransition:(double)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  double v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[RTStateTransition listTransitions](self, "listTransitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__RTStateTransition_cleanTransition___block_invoke;
  v8[3] = &unk_1E92A23D8;
  v10 = a3;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  -[RTStateTransition setListTransitions:](self, "setListTransitions:", v7);
}

void __37__RTStateTransition_cleanTransition___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "stop_s");
  if (v3 >= *(double *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)getPredTrans:(double)a3 duration:(double)a4 numOfWeeks:(int)a5 uniqueID:(id)a6
{
  RTStateTransitionMotionActivityTypeHistogram *v10;
  RTStateTransitionMotionActivityTypeHistogram *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  RTStateTransitionMotionActivityTypeHistogram *v29;
  RTStateTransitionMotionActivityTypeHistogram *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
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
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  RTStateTransitionMotionActivityTypeHistogram *v90;
  RTStateTransitionMotionActivityTypeHistogram *v91;
  id v92;
  id v93;
  id v94;
  RTStateTransitionOneTransPred *v95;
  _QWORD v96[8];
  _QWORD v97[3];
  int v98;
  _QWORD v99[4];
  _QWORD v100[6];
  _QWORD v101[6];
  _QWORD v102[6];
  uint64_t v103;
  int *v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  int *v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[6];
  uint64_t v112;
  double *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double *v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD v120[6];
  uint64_t v121;
  double *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  double *v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD v129[4];
  id v130;
  id v131;
  id v132;
  RTStateTransitionMotionActivityTypeHistogram *v133;
  RTStateTransitionMotionActivityTypeHistogram *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t *v137;
  uint64_t *v138;
  uint64_t *v139;
  uint64_t *v140;
  uint64_t *v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146;
  double v147;
  double v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  uint64_t v161;
  double *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  double *v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  double *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  double *v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t (*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  id v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t (*v186)(uint64_t, uint64_t);
  void (*v187)(uint64_t);
  id v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t (*v192)(uint64_t, uint64_t);
  void (*v193)(uint64_t);
  id v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t (*v198)(uint64_t, uint64_t);
  void (*v199)(uint64_t);
  id v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t v203;
  uint64_t (*v204)(uint64_t, uint64_t);
  void (*v205)(uint64_t);
  id v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  uint64_t (*v210)(uint64_t, uint64_t);
  void (*v211)(uint64_t);
  id v212;

  v94 = a6;
  v207 = 0;
  v208 = &v207;
  v209 = 0x3032000000;
  v210 = __Block_byref_object_copy__112;
  v211 = __Block_byref_object_dispose__112;
  v212 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v201 = 0;
  v202 = &v201;
  v203 = 0x3032000000;
  v204 = __Block_byref_object_copy__112;
  v205 = __Block_byref_object_dispose__112;
  v206 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v195 = 0;
  v196 = &v195;
  v197 = 0x3032000000;
  v198 = __Block_byref_object_copy__112;
  v199 = __Block_byref_object_dispose__112;
  v200 = (id)objc_opt_new();
  v189 = 0;
  v190 = &v189;
  v191 = 0x3032000000;
  v192 = __Block_byref_object_copy__112;
  v193 = __Block_byref_object_dispose__112;
  v194 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v183 = 0;
  v184 = &v183;
  v185 = 0x3032000000;
  v186 = __Block_byref_object_copy__112;
  v187 = __Block_byref_object_dispose__112;
  v188 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v177 = 0;
  v178 = &v177;
  v179 = 0x3032000000;
  v180 = __Block_byref_object_copy__112;
  v181 = __Block_byref_object_dispose__112;
  v182 = (id)objc_opt_new();
  v10 = objc_alloc_init(RTStateTransitionMotionActivityTypeHistogram);
  v11 = objc_alloc_init(RTStateTransitionMotionActivityTypeHistogram);
  v95 = objc_alloc_init(RTStateTransitionOneTransPred);
  v91 = v10;
  v173 = 0;
  v174 = (double *)&v173;
  v175 = 0x2020000000;
  v176 = 0xC26D1A94A2000000;
  v169 = 0;
  v170 = (double *)&v169;
  v171 = 0x2020000000;
  v172 = 0x426D1A94A2000000;
  v165 = 0;
  v166 = (double *)&v165;
  v167 = 0x2020000000;
  v168 = 0xC26D1A94A2000000;
  v161 = 0;
  v162 = (double *)&v161;
  v163 = 0x2020000000;
  v164 = 0x426D1A94A2000000;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3 + -7200.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3 + a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = 0;
  v156 = &v155;
  v157 = 0x3032000000;
  v158 = __Block_byref_object_copy__112;
  v159 = __Block_byref_object_dispose__112;
  v160 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v149 = 0;
  v150 = &v149;
  v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__112;
  v153 = __Block_byref_object_dispose__112;
  v154 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5 >= 1)
  {
    v15 = 0;
    do
    {
      v16 = (void *)v156[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      v18 = 7;
      do
      {
        v19 = (void *)v150[5];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v20);

        --v18;
      }
      while (v18);
      ++v15;
    }
    while (v15 != a5);
  }
  -[RTStateTransition listTransitions](self, "listTransitions");
  v21 = v94;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (double)a5;
  v24 = a3 + -7200.0 + (double)a5 * -604800.0;
  v25 = MEMORY[0x1E0C809B0];
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke;
  v129[3] = &unk_1E92A2400;
  v147 = v24;
  v148 = a3;
  v26 = v12;
  v130 = v26;
  v27 = v13;
  v131 = v27;
  v135 = &v189;
  v136 = &v183;
  v137 = &v173;
  v138 = &v169;
  v28 = v14;
  v132 = v28;
  v139 = &v177;
  v29 = v91;
  v133 = v29;
  v140 = &v155;
  v141 = &v207;
  v142 = &v201;
  v143 = &v165;
  v144 = &v161;
  v145 = &v195;
  v30 = v90;
  v134 = v30;
  v146 = &v149;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v129);

  if (objc_msgSend((id)v190[5], "count") && objc_msgSend((id)v184[5], "count"))
  {
    v92 = v26;
    v125 = 0;
    v126 = (double *)&v125;
    v127 = 0x2020000000;
    v128 = 0;
    v121 = 0;
    v122 = (double *)&v121;
    v123 = 0x2020000000;
    v124 = 0;
    v31 = (void *)v190[5];
    v120[0] = v25;
    v120[1] = 3221225472;
    v120[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_197;
    v120[3] = &unk_1E92A2428;
    v120[4] = &v125;
    v120[5] = &v121;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v120);
    v116 = 0;
    v117 = (double *)&v116;
    v118 = 0x2020000000;
    v119 = 0;
    v112 = 0;
    v113 = (double *)&v112;
    v114 = 0x2020000000;
    v115 = 0;
    v32 = (void *)v184[5];
    v111[0] = v25;
    v111[1] = 3221225472;
    v111[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2;
    v111[3] = &unk_1E92A2428;
    v111[4] = &v116;
    v111[5] = &v112;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v111);
    v107 = 0;
    v108 = (int *)&v107;
    v109 = 0x2020000000;
    LODWORD(v110) = 0;
    v103 = 0;
    v104 = (int *)&v103;
    v105 = 0x2020000000;
    v106 = 0;
    v33 = (void *)v156[5];
    v102[0] = v25;
    v102[1] = 3221225472;
    v102[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3;
    v102[3] = &unk_1E92A2428;
    v102[4] = &v107;
    v102[5] = &v103;
    objc_msgSend(v33, "enumerateObjectsUsingBlock:", v102);
    -[RTStateTransitionOneTransPred weekly](v95, "weekly");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setYield:", (double)(unint64_t)objc_msgSend((id)v190[5], "count") / v23);

    v35 = v126[3];
    v36 = v35 / (double)(unint64_t)objc_msgSend((id)v190[5], "count");
    if (v36 + -7200.0 >= 0.0)
      v37 = v36 + -7200.0;
    else
      v37 = 0.0;
    if ((unint64_t)objc_msgSend((id)v190[5], "count") >= 3)
    {
      v38 = sqrt(v122[3] / (double)(unint64_t)objc_msgSend((id)v190[5], "count") - v36 * v36);
      if (v38 < 2700.0)
      {
        -[RTStateTransitionOneTransPred weekly](v95, "weekly");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setPredResidualStart_s:", v37);

        -[RTStateTransitionOneTransPred weekly](v95, "weekly");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setResUncStart_s:", v38);

      }
    }
    v41 = v117[3];
    v42 = v41 / (double)(unint64_t)objc_msgSend((id)v184[5], "count");
    if (v42 + -7200.0 >= 0.0)
      v43 = v42 + -7200.0;
    else
      v43 = 0.0;
    if ((unint64_t)objc_msgSend((id)v184[5], "count") >= 3)
    {
      v44 = sqrt(v113[3] / (double)(unint64_t)objc_msgSend((id)v184[5], "count") - v42 * v42);
      if (v44 < 2700.0)
      {
        -[RTStateTransitionOneTransPred weekly](v95, "weekly");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setPredResidualStop_s:", v43);

        -[RTStateTransitionOneTransPred weekly](v95, "weekly");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setResUncStop_s:", v44);

      }
    }
    -[RTStateTransitionOneTransPred weekly](v95, "weekly");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setNumOfTrans:", objc_msgSend((id)v190[5], "count"));

    -[RTStateTransitionOneTransPred weekly](v95, "weekly");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setEarliestTransTimeStart_s:", v170[3]);

    -[RTStateTransitionOneTransPred weekly](v95, "weekly");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setLatestTransTimeStart_s:", v174[3]);

    -[RTStateTransitionOneTransPred weekly](v95, "weekly");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setDensity:", (double)v108[6] / (double)v104[6]);

    -[RTStateTransitionOneTransPred weekly](v95, "weekly");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setMotionActivityType:", -[RTStateTransitionMotionActivityTypeHistogram getDominantMotionActivityType](v29, "getDominantMotionActivityType"));
    v52 = v27;

    objc_msgSend((id)v178[5], "valueForKeyPath:", CFSTR("@max.self"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTStateModelAlgorithms bucketizeDates:bucketInterval:latestDate:](RTStateModelAlgorithms, "bucketizeDates:bucketInterval:latestDate:", v178[5], v53, 7200.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "allValues");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("numOfDates"), &unk_1E9328C10);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "filteredArrayUsingPredicate:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "valueForKeyPath:", CFSTR("@min.averageDate"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStateTransitionOneTransPred weekly](v95, "weekly");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setPrimaryStopDate:", v58);

    _Block_object_dispose(&v103, 8);
    _Block_object_dispose(&v107, 8);
    _Block_object_dispose(&v112, 8);
    _Block_object_dispose(&v116, 8);
    _Block_object_dispose(&v121, 8);
    _Block_object_dispose(&v125, 8);
    v26 = v92;
    v27 = v52;
    v21 = v94;
    v25 = MEMORY[0x1E0C809B0];
  }
  if (objc_msgSend((id)v208[5], "count") && objc_msgSend((id)v202[5], "count"))
  {
    v93 = v26;
    v125 = 0;
    v126 = (double *)&v125;
    v127 = 0x2020000000;
    v128 = 0;
    v121 = 0;
    v122 = (double *)&v121;
    v123 = 0x2020000000;
    v124 = 0;
    v60 = (void *)v208[5];
    v101[0] = v25;
    v101[1] = 3221225472;
    v101[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_208;
    v101[3] = &unk_1E92A2428;
    v101[4] = &v125;
    v101[5] = &v121;
    objc_msgSend(v60, "enumerateObjectsUsingBlock:", v101);
    v116 = 0;
    v117 = (double *)&v116;
    v118 = 0x2020000000;
    v119 = 0;
    v112 = 0;
    v113 = (double *)&v112;
    v114 = 0x2020000000;
    v115 = 0;
    v61 = (void *)v202[5];
    v100[0] = v25;
    v100[1] = 3221225472;
    v100[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2_209;
    v100[3] = &unk_1E92A2428;
    v100[4] = &v116;
    v100[5] = &v112;
    objc_msgSend(v61, "enumerateObjectsUsingBlock:", v100);
    v107 = 0;
    v108 = (int *)&v107;
    v109 = 0x2020000000;
    v110 = 0;
    v103 = 0;
    v104 = (int *)&v103;
    v105 = 0x2020000000;
    v106 = 0;
    v99[0] = 0;
    v99[1] = v99;
    v99[2] = 0x2020000000;
    v99[3] = 1;
    v97[0] = 0;
    v97[1] = v97;
    v97[2] = 0x2020000000;
    v98 = 0;
    v62 = (void *)v150[5];
    v96[0] = v25;
    v96[1] = 3221225472;
    v96[2] = __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3_210;
    v96[3] = &unk_1E929CBA8;
    v96[4] = v97;
    v96[5] = v99;
    v96[6] = &v107;
    v96[7] = &v103;
    objc_msgSend(v62, "enumerateObjectsUsingBlock:", v96);
    -[RTStateTransitionOneTransPred daily](v95, "daily");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setYield:", (double)(unint64_t)objc_msgSend((id)v208[5], "count") / v23 * 7.0);

    v64 = v126[3];
    v65 = v64 / (double)(unint64_t)objc_msgSend((id)v208[5], "count");
    if (v65 + -7200.0 >= 0.0)
      v66 = v65 + -7200.0;
    else
      v66 = 0.0;
    if ((unint64_t)objc_msgSend((id)v208[5], "count") >= 3)
    {
      v67 = sqrt(v122[3] / (double)(unint64_t)objc_msgSend((id)v208[5], "count") - v65 * v65);
      if (v67 < 2700.0)
      {
        -[RTStateTransitionOneTransPred daily](v95, "daily");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setPredResidualStart_s:", v66);

        -[RTStateTransitionOneTransPred daily](v95, "daily");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setResUncStart_s:", v67);

      }
    }
    v70 = v117[3];
    v71 = v70 / (double)(unint64_t)objc_msgSend((id)v202[5], "count");
    if (v71 + -7200.0 >= 0.0)
      v72 = v71 + -7200.0;
    else
      v72 = 0.0;
    if ((unint64_t)objc_msgSend((id)v202[5], "count") >= 3)
    {
      v73 = sqrt(v113[3] / (double)(unint64_t)objc_msgSend((id)v202[5], "count") - v71 * v71);
      if (v73 < 2700.0)
      {
        -[RTStateTransitionOneTransPred daily](v95, "daily");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setPredResidualStop_s:", v72);

        -[RTStateTransitionOneTransPred daily](v95, "daily");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setResUncStop_s:", v73);

      }
    }
    -[RTStateTransitionOneTransPred daily](v95, "daily");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setNumOfTrans:", objc_msgSend((id)v208[5], "count"));

    -[RTStateTransitionOneTransPred daily](v95, "daily");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setEarliestTransTimeStart_s:", v162[3]);

    -[RTStateTransitionOneTransPred daily](v95, "daily");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setLatestTransTimeStart_s:", v166[3]);

    -[RTStateTransitionOneTransPred daily](v95, "daily");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setDensity:", *((double *)v108 + 3) / (double)v104[6]);

    -[RTStateTransitionOneTransPred daily](v95, "daily");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setMotionActivityType:", -[RTStateTransitionMotionActivityTypeHistogram getDominantMotionActivityType](v30, "getDominantMotionActivityType"));
    v81 = v27;

    objc_msgSend((id)v196[5], "valueForKeyPath:", CFSTR("@max.self"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTStateModelAlgorithms bucketizeDates:bucketInterval:latestDate:](RTStateModelAlgorithms, "bucketizeDates:bucketInterval:latestDate:", v196[5], v82, 7200.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "allValues");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("numOfDates"), &unk_1E9328C10);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "filteredArrayUsingPredicate:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v86, "valueForKeyPath:", CFSTR("@min.averageDate"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStateTransitionOneTransPred daily](v95, "daily");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setPrimaryStopDate:", v87);

    _Block_object_dispose(v97, 8);
    _Block_object_dispose(v99, 8);
    _Block_object_dispose(&v103, 8);
    _Block_object_dispose(&v107, 8);
    _Block_object_dispose(&v112, 8);
    _Block_object_dispose(&v116, 8);
    _Block_object_dispose(&v121, 8);
    _Block_object_dispose(&v125, 8);
    v26 = v93;
    v27 = v81;
  }
  -[RTStateTransitionOneTransPred setStateUUID:](v95, "setStateUUID:", v21);

  _Block_object_dispose(&v149, 8);
  _Block_object_dispose(&v155, 8);

  _Block_object_dispose(&v161, 8);
  _Block_object_dispose(&v165, 8);
  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v173, 8);

  _Block_object_dispose(&v177, 8);
  _Block_object_dispose(&v183, 8);

  _Block_object_dispose(&v189, 8);
  _Block_object_dispose(&v195, 8);

  _Block_object_dispose(&v201, 8);
  _Block_object_dispose(&v207, 8);

  return v95;
}

void __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
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
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "start_s");
  if (v4 > *(double *)(a1 + 168))
  {
    objc_msgSend(v3, "stop_s");
    if (v5 <= *(double *)(a1 + 176) + -7200.0)
    {
      objc_msgSend(v3, "start_s");
      v7 = v6 - *(double *)(a1 + 168);
      v8 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v3, "start_s");
      objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v3, "stop_s");
      objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v11);
      +[RTStateModelAlgorithms adjustedDateInterval:betweenMinDate:maxDate:strideDays:](RTStateModelAlgorithms, "adjustedDateInterval:betweenMinDate:maxDate:strideDays:", v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 0x1E0CB3000uLL;
      if (v13)
      {
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v17 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v17, "numberWithDouble:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v19);

        v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v14, "endDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v21, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v23);

        v24 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        objc_msgSend(v3, "start_s");
        if (v24 < v25)
        {
          objc_msgSend(v3, "start_s");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v26;
        }
        v27 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
        objc_msgSend(v3, "start_s");
        if (v27 > v28)
        {
          objc_msgSend(v3, "start_s");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v29;
        }
        objc_msgSend(v14, "endDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isOnOrAfter:", *(_QWORD *)(a1 + 48));

        if (v31)
        {
          v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
          objc_msgSend(v14, "endDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v33);

        }
        objc_msgSend(*(id *)(a1 + 56), "addMotionActivityType:", objc_msgSend(v3, "motionActivityType"));
        v34 = (int)(v7 / 604800.0);
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "count") <= (unint64_t)v34)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v69 = "-[RTStateTransition getPredTrans:duration:numOfWeeks:uniqueID:]_block_invoke";
            v70 = 1024;
            v71 = 587;
            _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "weekNum is out of bound - should not happen (in %s:%d)", buf, 0x12u);
          }

        }
        else
        {
          v35 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
          v36 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v35, "objectAtIndex:", v34);
          v37 = v9;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "numberWithInteger:", objc_msgSend(v38, "integerValue") + 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:atIndexedSubscript:", v39, v34);

          v9 = v37;
          v15 = 0x1E0CB3000;
        }
      }
      +[RTStateModelAlgorithms adjustedDateInterval:betweenMinDate:maxDate:strideDays:](RTStateModelAlgorithms, "adjustedDateInterval:betweenMinDate:maxDate:strideDays:", v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v67 = v9;
        v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
        v44 = *(void **)(v15 + 2024);
        objc_msgSend(v41, "startDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v44, "numberWithDouble:");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v46);

        v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
        v48 = *(void **)(v15 + 2024);
        objc_msgSend(v42, "endDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v48, "numberWithDouble:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v50);

        v51 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);
        objc_msgSend(v3, "start_s");
        if (v51 < v52)
        {
          objc_msgSend(v3, "start_s");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = v53;
        }
        v54 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
        objc_msgSend(v3, "start_s");
        if (v54 > v55)
        {
          objc_msgSend(v3, "start_s");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = v56;
        }
        v57 = v15;
        objc_msgSend(v42, "endDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "isOnOrAfter:", *(_QWORD *)(a1 + 48));

        if (v59)
        {
          v60 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40);
          objc_msgSend(v42, "endDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v61);

        }
        objc_msgSend(*(id *)(a1 + 64), "addMotionActivityType:", objc_msgSend(v3, "motionActivityType"));
        v62 = (int)(v7 / 86400.0);
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40), "count") <= (unint64_t)v62)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v69 = "-[RTStateTransition getPredTrans:duration:numOfWeeks:uniqueID:]_block_invoke";
            v70 = 1024;
            v71 = 622;
            _os_log_error_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_ERROR, "dayNum is out of bound - should not happen (in %s:%d)", buf, 0x12u);
          }
        }
        else
        {
          v63 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40);
          v64 = *(void **)(v57 + 2024);
          objc_msgSend(v63, "objectAtIndex:", v62);
          v65 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "numberWithInteger:", -[NSObject integerValue](v65, "integerValue") + 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setObject:atIndexedSubscript:", v66, v62);

        }
        v9 = v67;

      }
    }
  }

}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_197(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double result;

  v3 = a2;
  objc_msgSend(v3, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v3, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "doubleValue");
  v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double result;

  v3 = a2;
  objc_msgSend(v3, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v3, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "doubleValue");
  v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

uint64_t __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_208(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double result;

  v3 = a2;
  objc_msgSend(v3, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v3, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "doubleValue");
  v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

double __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_2_209(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double result;

  v3 = a2;
  objc_msgSend(v3, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v3, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "doubleValue");
  v8 = v7;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)(v9 + 24) + v6 * v8;
  *(double *)(v9 + 24) = result;
  return result;
}

uint64_t __63__RTStateTransition_getPredTrans_duration_numOfWeeks_uniqueID___block_invoke_3_210(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a2, "integerValue");
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += result;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * v5 + 0x1249249249249249) <= 0x2492492492492492)
  {
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = (double)*(int *)(*(_QWORD *)(a1[4] + 8) + 24) / 7.0
                                                 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    ++*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(_QWORD *)(v4 + 24);
  }
  *(_QWORD *)(v4 + 24) = v5 + 1;
  return result;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[RTStateTransition listTransitions](self, "listTransitions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTStateTransition listTransitions](self, "listTransitions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("listTransitions"));

}

- (RTStateTransition)initWithCoder:(id)a3
{
  id v4;
  RTStateTransition *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTStateTransition;
  v5 = -[RTStateTransition init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("listTransitions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTStateTransition setListTransitions:](v5, "setListTransitions:", v9);

  }
  return v5;
}

- (NSMutableArray)listTransitions
{
  return self->_listTransitions;
}

- (void)setListTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_listTransitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listTransitions, 0);
}

@end
