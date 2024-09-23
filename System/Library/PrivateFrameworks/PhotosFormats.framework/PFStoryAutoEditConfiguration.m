@implementation PFStoryAutoEditConfiguration

- (PFStoryAutoEditConfiguration)init
{
  char *v2;
  PFStoryConcreteTransitionTable *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PFStoryConcreteTransitionTable *v7;
  void *v8;
  PFStoryConcreteTransitionTable *v9;
  void *v10;
  PFStoryConcreteTransitionTable *v11;
  void *v12;
  PFStoryConcreteTransitionTable *v13;
  void *v14;
  PFStoryConcreteMotionStyleTable *v15;
  void *v16;
  PFStoryConcreteMotionStyleTable *v17;
  void *v18;
  PFStoryConcreteMotionStyleTable *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[5];

  v61[3] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PFStoryAutoEditConfiguration;
  v2 = -[PFStoryAutoEditConfiguration init](&v49, sel_init);
  if (v2)
  {
    v3 = [PFStoryConcreteTransitionTable alloc];
    v4 = MEMORY[0x1E0C9AA70];
    v5 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:](v3, "initWithTransitionsByColorGrade:defaultFrequencies:", MEMORY[0x1E0C9AA70], 0);
    v6 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v5;

    v7 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v4, 0);
    v8 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v7;

    v9 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v4, 0);
    v10 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v9;

    v11 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v4, 0);
    v12 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v11;

    v13 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v4, 0);
    v14 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v13;

    v15 = -[PFStoryConcreteMotionStyleTable initWithMotionStylesByColorGrade:defaultFrequencies:]([PFStoryConcreteMotionStyleTable alloc], "initWithMotionStylesByColorGrade:defaultFrequencies:", v4, 0);
    v16 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v15;

    v17 = -[PFStoryConcreteMotionStyleTable initWithMotionStylesByColorGrade:defaultFrequencies:]([PFStoryConcreteMotionStyleTable alloc], "initWithMotionStylesByColorGrade:defaultFrequencies:", v4, 0);
    v18 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v17;

    v19 = -[PFStoryConcreteMotionStyleTable initWithMotionStylesByColorGrade:defaultFrequencies:]([PFStoryConcreteMotionStyleTable alloc], "initWithMotionStylesByColorGrade:defaultFrequencies:", v4, 0);
    v20 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v19;

    v60[0] = &unk_1E45CA040;
    v58[0] = &unk_1E45CA058;
    v48 = (void *)objc_msgSend(&unk_1E45CB060, "mutableCopy");
    v59[0] = v48;
    v58[1] = &unk_1E45CA088;
    v47 = (void *)objc_msgSend(&unk_1E45CB078, "mutableCopy");
    v59[1] = v47;
    v58[2] = &unk_1E45CA0A0;
    v46 = (void *)objc_msgSend(&unk_1E45CB090, "mutableCopy");
    v59[2] = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v45;
    v60[1] = &unk_1E45CA088;
    v56[0] = &unk_1E45CA058;
    v21 = (void *)objc_msgSend(&unk_1E45CB0A8, "mutableCopy");
    v57[0] = v21;
    v56[1] = &unk_1E45CA088;
    v22 = (void *)objc_msgSend(&unk_1E45CB0C0, "mutableCopy");
    v57[1] = v22;
    v56[2] = &unk_1E45CA0A0;
    v23 = (void *)objc_msgSend(&unk_1E45CB0D8, "mutableCopy");
    v57[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v24;
    v60[2] = &unk_1E45CA058;
    v54[0] = &unk_1E45CA058;
    v25 = (void *)objc_msgSend(&unk_1E45CB0F0, "mutableCopy");
    v55[0] = v25;
    v54[1] = &unk_1E45CA088;
    v26 = (void *)objc_msgSend(&unk_1E45CB108, "mutableCopy");
    v55[1] = v26;
    v54[2] = &unk_1E45CA0A0;
    v27 = (void *)objc_msgSend(&unk_1E45CB120, "mutableCopy");
    v55[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v29;

    v31 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = MEMORY[0x1E0C9AA70];

    *(_OWORD *)(v2 + 120) = xmmword_1A17B6C10;
    __asm { FMOV            V0.2D, #1.5 }
    *(_OWORD *)(v2 + 136) = _Q0;
    *((_QWORD *)v2 + 19) = 0x4000000000000000;
    v52[0] = &unk_1E45CA0A0;
    v37 = (void *)objc_msgSend(&unk_1E45CB138, "mutableCopy");
    v53[0] = v37;
    v52[1] = &unk_1E45CA0B8;
    v38 = (void *)objc_msgSend(&unk_1E45CB150, "mutableCopy");
    v53[1] = v38;
    v52[2] = &unk_1E45CA0D0;
    v39 = (void *)objc_msgSend(&unk_1E45CB168, "mutableCopy");
    v53[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v40;

    v50[0] = &unk_1E45CA058;
    v50[1] = &unk_1E45CA088;
    v51[0] = &unk_1E45CB3D0;
    v51[1] = &unk_1E45CB3E0;
    v50[2] = &unk_1E45CA0A0;
    v51[2] = &unk_1E45CB3F0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v42;

    *((_OWORD *)v2 + 10) = xmmword_1A17B6C20;
    *((_OWORD *)v2 + 11) = xmmword_1A17B6C30;
    *((int64x2_t *)v2 + 12) = vdupq_n_s64(2uLL);
    *((_QWORD *)v2 + 26) = 2;
    *((_QWORD *)v2 + 27) = 0;
  }
  return (PFStoryAutoEditConfiguration *)v2;
}

- (PFStoryAutoEditConfiguration)initWithConfigurationFileAtURL:(id)a3
{
  id v5;
  void *v6;
  PFStoryAutoEditConfiguration *v7;
  PFStoryAutoEditConfiguration *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PFStoryAutoEditConfiguration initWithConfigurationData:](self, "initWithConfigurationData:", v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_url, a3);

  return v8;
}

- (PFStoryAutoEditConfiguration)initWithConfigurationData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PFStoryAutoEditConfiguration *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v5)
    {
      self = -[PFStoryAutoEditConfiguration initWithConfigurationDictionary:](self, "initWithConfigurationDictionary:", v5);
      v7 = self;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFStoryAutoEditConfiguration failed to load property list from data: %@", buf, 0xCu);
      }
      v7 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFStoryAutoEditConfiguration cannot load nil data.", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (PFStoryAutoEditConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4;
  PFStoryAutoEditConfiguration *v5;
  PFStoryAutoEditConfiguration *v6;

  v4 = a3;
  v5 = -[PFStoryAutoEditConfiguration init](self, "init");
  -[PFStoryAutoEditConfiguration _loadData:](v5, "_loadData:", v4);
  v6 = (PFStoryAutoEditConfiguration *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_loadData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PFStoryAutoEditConfiguration *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  PFStoryAutoEditConfiguration *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  PFStoryConcreteTransitionTable *v62;
  PFStoryAutoEditConfiguration *v63;
  PFStoryTransitionTable *defaultTransitionTable;
  PFStoryConcreteTransitionTable *v65;
  PFStoryTransitionTable *interMomentTransitionTable;
  PFStoryConcreteTransitionTable *v67;
  PFStoryTransitionTable *portraitTransitionTable;
  PFStoryConcreteTransitionTable *v69;
  PFStoryTransitionTable *nUpTransitionTable;
  PFStoryConcreteTransitionTable *v71;
  PFStoryTransitionTable *interModuleTransitionTable;
  PFStoryConcreteMotionStyleTable *v73;
  PFStoryMotionStyleTable *motionStyleTable;
  PFStoryConcreteMotionStyleTable *v75;
  PFStoryMotionStyleTable *diptychMotionStyleTable;
  PFStoryConcreteMotionStyleTable *v77;
  PFStoryMotionStyleTable *triptychMotionStyleTable;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  void *v93;
  uint64_t v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  NSDictionary *transitionDurationsByKind;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  double v106;
  void *v107;
  double v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  PFStoryAutoEditConfiguration *v125;
  void *v126;
  uint64_t v127;
  NSDictionary *outroDurations;
  void *context;
  id v131;
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
  id obj;
  PFStoryAutoEditConfiguration *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  id v164;
  _QWORD v165[4];
  id v166;
  id v167;
  _QWORD v168[4];
  id v169;
  PFStoryAutoEditConfiguration *v170;
  _QWORD v171[4];
  id v172;
  PFStoryAutoEditConfiguration *v173;
  _QWORD v174[4];
  id v175;
  PFStoryAutoEditConfiguration *v176;
  NSObject *v177;
  uint64_t v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  uint8_t v190[128];
  uint8_t buf[4];
  _BYTE v192[10];
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 > 4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorGradeCategories"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA70];
    if (v8)
      v11 = (void *)v8;
    else
      v11 = (void *)MEMORY[0x1E0C9AA70];
    v152 = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("memoryCategories"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = v10;
    v131 = v14;

    if (_loadData__onceToken[0] != -1)
      dispatch_once(_loadData__onceToken, &__block_literal_global_87);
    context = (void *)MEMORY[0x1A1B0CDDC]();
    PFStoryColorGradeSupportedCategories();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v146 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    objc_msgSend(v152, "objectForKeyedSubscript:", CFSTR("default"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("transitions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v18 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default transition table", buf, 2u);
      }

    }
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](self, "_arrayFromTable:count:nameToValueMap:", v17, 9, _loadData__transitionsByName);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("interMomentTransitions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v21 = MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default inter-moment transition table", buf, 2u);
      }

    }
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](self, "_arrayFromTable:count:nameToValueMap:", v20, 9, _loadData__transitionsByName);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("portraitTransitions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v24 = MEMORY[0x1E0C81028];
      v25 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default portrait transition table", buf, 2u);
      }

    }
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](self, "_arrayFromTable:count:nameToValueMap:", v23, 9, _loadData__transitionsByName);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("nUpTransitions"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v27 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default N-up transition table", buf, 2u);
      }

    }
    v140 = v4;
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](self, "_arrayFromTable:count:nameToValueMap:", v26, 9, _loadData__transitionsByName);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("interModuleTransitions"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      v30 = MEMORY[0x1E0C81028];
      v31 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default inter-module transition table", buf, 2u);
      }

    }
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](self, "_arrayFromTable:count:nameToValueMap:", v29, 9, _loadData__transitionsByName);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("motionStyles"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v33 = MEMORY[0x1E0C81028];
      v34 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default motion style table", buf, 2u);
      }

    }
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](self, "_arrayFromTable:count:nameToValueMap:", v32, 4, _loadData__motionStylesByName);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("diptychMotionStyles"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = self;
    if (!v35)
    {
      v36 = MEMORY[0x1E0C81028];
      v37 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default diptych motion style table", buf, 2u);
      }

      self = v150;
    }
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](self, "_arrayFromTable:count:nameToValueMap:", v35, 4, _loadData__motionStylesByName);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("triptychMotionStyles"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = self;
    v40 = (void *)v38;
    if (!v38)
    {
      v159 = v23;
      v41 = v20;
      v42 = v17;
      v43 = v15;
      v44 = MEMORY[0x1E0C81028];
      v45 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit configuration is missing default triptych motion style table", buf, 2u);
      }

      v39 = v150;
      v15 = v43;
      v17 = v42;
      v20 = v41;
      v23 = v159;
    }
    -[PFStoryAutoEditConfiguration _arrayFromTable:count:nameToValueMap:](v39, "_arrayFromTable:count:nameToValueMap:", v40, 4, _loadData__motionStylesByName);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    obj = v15;
    v153 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v190, 16);
    if (v153)
    {
      v151 = *(_QWORD *)v187;
      do
      {
        for (i = 0; i != v153; ++i)
        {
          if (*(_QWORD *)v187 != v151)
            objc_enumerationMutation(obj);
          v47 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * i);
          objc_msgSend(v152, "objectForKeyedSubscript:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v160 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v155 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
            v54 = (void *)_loadData__songPacesByName;
            v174[0] = MEMORY[0x1E0C809B0];
            v174[1] = 3221225472;
            v174[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_161;
            v174[3] = &unk_1E45A19B8;
            v163 = v48;
            v175 = v48;
            v176 = v150;
            v55 = v49;
            v177 = v55;
            v178 = v47;
            v56 = v50;
            v179 = v56;
            v157 = v160;
            v180 = v157;
            v161 = v155;
            v181 = v161;
            v57 = v154;
            v182 = v57;
            v58 = v51;
            v183 = v58;
            v59 = v52;
            v184 = v59;
            v60 = v53;
            v185 = v60;
            objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v174);
            if (-[NSObject count](v55, "count"))
              objc_msgSend(v148, "setObject:forKeyedSubscript:", v55, v47);
            if (objc_msgSend(v56, "count"))
              objc_msgSend(v147, "setObject:forKeyedSubscript:", v56, v47);
            if (objc_msgSend(v157, "count"))
              objc_msgSend(v146, "setObject:forKeyedSubscript:", v157, v47);
            if (objc_msgSend(v161, "count"))
              objc_msgSend(v145, "setObject:forKeyedSubscript:", v161, v47);
            if (objc_msgSend(v57, "count"))
              objc_msgSend(v144, "setObject:forKeyedSubscript:", v57, v47);
            if (objc_msgSend(v58, "count"))
              objc_msgSend(v143, "setObject:forKeyedSubscript:", v58, v47);
            if (objc_msgSend(v59, "count"))
              objc_msgSend(v142, "setObject:forKeyedSubscript:", v59, v47);
            if (objc_msgSend(v60, "count"))
              objc_msgSend(v141, "setObject:forKeyedSubscript:", v60, v47);

            v48 = v163;
          }
          else
          {
            v55 = MEMORY[0x1E0C81028];
            v61 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v192 = v47;
              _os_log_impl(&dword_1A16EE000, v55, OS_LOG_TYPE_INFO, "AutoEdit configuration missing color grade (%@)", buf, 0xCu);
            }
          }

        }
        v153 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v190, 16);
      }
      while (v153);
    }

    v62 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v148, v139);
    v63 = v150;
    defaultTransitionTable = v150->_defaultTransitionTable;
    v150->_defaultTransitionTable = (PFStoryTransitionTable *)v62;

    v65 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v147, v138);
    interMomentTransitionTable = v150->_interMomentTransitionTable;
    v150->_interMomentTransitionTable = (PFStoryTransitionTable *)v65;

    v67 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v146, v137);
    portraitTransitionTable = v150->_portraitTransitionTable;
    v150->_portraitTransitionTable = (PFStoryTransitionTable *)v67;

    v69 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v145, v136);
    nUpTransitionTable = v150->_nUpTransitionTable;
    v150->_nUpTransitionTable = (PFStoryTransitionTable *)v69;

    v71 = -[PFStoryConcreteTransitionTable initWithTransitionsByColorGrade:defaultFrequencies:]([PFStoryConcreteTransitionTable alloc], "initWithTransitionsByColorGrade:defaultFrequencies:", v144, v135);
    interModuleTransitionTable = v150->_interModuleTransitionTable;
    v150->_interModuleTransitionTable = (PFStoryTransitionTable *)v71;

    v73 = -[PFStoryConcreteMotionStyleTable initWithMotionStylesByColorGrade:defaultFrequencies:]([PFStoryConcreteMotionStyleTable alloc], "initWithMotionStylesByColorGrade:defaultFrequencies:", v143, v134);
    motionStyleTable = v150->_motionStyleTable;
    v150->_motionStyleTable = (PFStoryMotionStyleTable *)v73;

    v75 = -[PFStoryConcreteMotionStyleTable initWithMotionStylesByColorGrade:defaultFrequencies:]([PFStoryConcreteMotionStyleTable alloc], "initWithMotionStylesByColorGrade:defaultFrequencies:", v142, v133);
    diptychMotionStyleTable = v150->_diptychMotionStyleTable;
    v150->_diptychMotionStyleTable = (PFStoryMotionStyleTable *)v75;

    v77 = -[PFStoryConcreteMotionStyleTable initWithMotionStylesByColorGrade:defaultFrequencies:]([PFStoryConcreteMotionStyleTable alloc], "initWithMotionStylesByColorGrade:defaultFrequencies:", v141, v132);
    triptychMotionStyleTable = v150->_triptychMotionStyleTable;
    v150->_triptychMotionStyleTable = (PFStoryMotionStyleTable *)v77;

    v4 = v140;
    objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("durations"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)_loadData__playbackStyleMap;
    v171[0] = MEMORY[0x1E0C809B0];
    v171[1] = 3221225472;
    v171[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_165;
    v171[3] = &unk_1E45A1A08;
    v81 = v79;
    v172 = v81;
    v173 = v150;
    objc_msgSend(v80, "enumerateKeysAndObjectsUsingBlock:", v171);
    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("multipliers"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("diptych"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v83, "doubleValue");
        v150->_diptychDurationMultiplier = v84;
      }
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("triptych"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v85, "doubleValue");
        v150->_triptychDurationMultiplier = v86;
      }
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("initial"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v87, "doubleValue");
        v150->_initialDurationMultiplier = v88;
      }
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("chapterBegin"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v89, "doubleValue");
        v150->_chapterBeginDurationMultiplier = v90;
      }
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("final"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v91, "doubleValue");
        v150->_finalDurationMultiplier = v92;
      }

      v4 = v140;
      v63 = v150;
    }
    v93 = (void *)_loadData__overallDurationKindMap;
    v94 = MEMORY[0x1E0C809B0];
    v168[0] = MEMORY[0x1E0C809B0];
    v168[1] = 3221225472;
    v168[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_3;
    v168[3] = &unk_1E45A1A08;
    v95 = v81;
    v169 = v95;
    v170 = v63;
    objc_msgSend(v93, "enumerateKeysAndObjectsUsingBlock:", v168);
    v96 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("transitions"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = (void *)_loadData__transitionsByName;
    v165[0] = v94;
    v165[1] = 3221225472;
    v165[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_4;
    v165[3] = &unk_1E45A1A08;
    v164 = v97;
    v166 = v164;
    v99 = v96;
    v167 = v99;
    objc_msgSend(v98, "enumerateKeysAndObjectsUsingBlock:", v165);
    v162 = v99;
    v100 = objc_msgSend(v99, "copy");
    transitionDurationsByKind = v63->_transitionDurationsByKind;
    v63->_transitionDurationsByKind = (NSDictionary *)v100;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("songPaceTargets"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("slowVisualTempo"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v103, "doubleValue");
        v63->_slowVisualTempoTarget = v104;
      }
      objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("mediumVisualTempo"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v105, "doubleValue");
        v63->_mediumVisualTempoTarget = v106;
      }
      objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("fastVisualTempo"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v107, "doubleValue");
        v150->_fastVisualTempoTarget = v108;
      }

      v63 = v150;
    }
    v158 = v102;
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("composability"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("duration"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v110, "doubleValue");
        v63->_composabilityTargetDurationMultiplier = v111;
      }
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("minimumNUpCount"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v63->_composabilityMinimumNUpCount = objc_msgSend(v112, "integerValue");
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("minimum1UpRunCount"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v150->_composabilityMinimum1UpRunCount = objc_msgSend(v113, "integerValue");
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("maximumNUpRunCount"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v150->_composabilityMaximumNUpRunCount = objc_msgSend(v114, "integerValue");
      objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("threshold"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v115, "doubleValue");
        v150->_composabilityScoreThreshold = v116;
      }

      v4 = v140;
      v63 = v150;
    }
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("outro"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("slow"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v118, "setObject:forKeyedSubscript:", v119, &unk_1E45CA058);
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](v150->_outroDurations, "objectForKeyedSubscript:", &unk_1E45CA058);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setObject:forKeyedSubscript:", v120, &unk_1E45CA058);

      }
      v156 = v82;
      objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("medium"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v122 = v95;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v118, "setObject:forKeyedSubscript:", v121, &unk_1E45CA088);
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](v150->_outroDurations, "objectForKeyedSubscript:", &unk_1E45CA088);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setObject:forKeyedSubscript:", v123, &unk_1E45CA088);

      }
      objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("fast"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v118, "setObject:forKeyedSubscript:", v124, &unk_1E45CA0A0);
        v125 = v150;
      }
      else
      {
        v125 = v150;
        -[NSDictionary objectForKeyedSubscript:](v150->_outroDurations, "objectForKeyedSubscript:", &unk_1E45CA0A0);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setObject:forKeyedSubscript:", v126, &unk_1E45CA0A0);

      }
      v95 = v122;
      v127 = objc_msgSend(v118, "copy");
      outroDurations = v125->_outroDurations;
      v125->_outroDurations = (NSDictionary *)v127;

      v4 = v140;
      v63 = v125;
      v82 = v156;
    }
    -[PFStoryAutoEditConfiguration _loadClusteringPropertiesFromMemoryCategories:](v63, "_loadClusteringPropertiesFromMemoryCategories:", v131);

    objc_autoreleasePoolPop(context);
    v7 = v63;

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v192 = v6;
      *(_WORD *)&v192[4] = 1024;
      *(_DWORD *)&v192[6] = 5;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Configuration data version (%d) is below the minimum version (%d)", buf, 0xEu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_arrayFromTable:(id)a3 count:(unint64_t)a4 nameToValueMap:(id)a5
{
  id v7;
  id v8;
  void *i;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a5;
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4); a4; --a4)
    objc_msgSend(i, "addObject:", &unk_1E45CA070);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__PFStoryAutoEditConfiguration__arrayFromTable_count_nameToValueMap___block_invoke;
  v17 = &unk_1E45A1A08;
  v18 = v7;
  v19 = i;
  v10 = i;
  v11 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v14);
  v12 = (void *)objc_msgSend(v10, "copy", v14, v15, v16, v17);

  return v12;
}

- (void)_loadClusteringPropertiesFromMemoryCategories:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *clusteringPropertiesByCategory;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PFStoryAutoEditConfiguration__loadClusteringPropertiesFromMemoryCategories___block_invoke;
  v10[3] = &unk_1E45A1A30;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = (NSDictionary *)objc_msgSend(v9, "copy");
  clusteringPropertiesByCategory = self->_clusteringPropertiesByCategory;
  self->_clusteringPropertiesByCategory = v7;

}

- ($3DBB98C272AC9B04202267094881960A)durationInfoForPlaybackStyle:(SEL)a3 songPace:(int64_t)a4
{
  uint64_t v8;
  NSDictionary *durationTablesByPlaybackStyle;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  Float64 v16;
  void *v17;
  double v18;
  Float64 v19;
  void *v20;
  double v21;
  Float64 v22;
  $3DBB98C272AC9B04202267094881960A *result;
  __CFString *v24;
  PFStoryAutoEditConfiguration *v25;
  SEL v26;
  int64_t v27;
  int64_t v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;

  v8 = 0;
  if ((unint64_t)a4 > 6)
    goto LABEL_7;
  if (((1 << a4) & 0x2C) != 0)
  {
    v8 = 2;
LABEL_7:
    durationTablesByPlaybackStyle = self->_durationTablesByPlaybackStyle;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](durationTablesByPlaybackStyle, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = v21;

    retstr->var2.var3 = 0;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var2.var0 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var3 = 0u;
    CMTimeMakeWithSeconds(&v31, v16, 600);
    CMTimeMakeWithSeconds(&v30, v19, 600);
    CMTimeMakeWithSeconds(&v29, v22, 600);
    retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v31;
    retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v30;
    retstr->var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v29;

    return result;
  }
  if (a4 == 4)
  {
    v8 = 1;
    goto LABEL_7;
  }
  if (((1 << a4) & 0x41) == 0)
    goto LABEL_7;
  if ((unint64_t)(a4 - 1) > 5)
    v24 = CFSTR("unsupported");
  else
    v24 = off_1E45A22D0[a4 - 1];
  v24;
  v25 = (PFStoryAutoEditConfiguration *)_PFAssertFailHandler();
  -[PFStoryAutoEditConfiguration durationForTransitionKind:songPace:](v25, v26, v27, v28);
  return result;
}

- (double)durationForTransitionKind:(int64_t)a3 songPace:(int64_t)a4
{
  NSDictionary *transitionDurationsByKind;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  transitionDurationsByKind = self->_transitionDurationsByKind;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](transitionDurationsByKind, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
    }
    else
    {
      v11 = 0.0;
    }

  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (double)outroDurationForSongPace:(int64_t)a3
{
  int64_t v3;
  NSDictionary *outroDurations;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint8_t v11[16];

  v3 = a3;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      v3 = 2;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Unknown song pace, falling back to medium", v11, 2u);
    }
    else
    {
      v3 = 2;
    }
  }
  outroDurations = self->_outroDurations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](outroDurations, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- ($3DBB98C272AC9B04202267094881960A)minimumDurations
{
  $3DBB98C272AC9B04202267094881960A *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  $3DBB98C272AC9B04202267094881960A *v14;
  uint64_t v15;
  void *v17;
  CMTime time2;
  CMTime time1;
  __int128 v20;
  _BYTE v21[64];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  result = ($3DBB98C272AC9B04202267094881960A *)objc_msgSend(&unk_1E45CB1B0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  v14 = result;
  if (result)
  {
    p_var1 = &retstr->var1;
    v13 = *(_QWORD *)v27;
    p_var2 = &retstr->var2;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(&unk_1E45CB1B0);
        v15 = v7;
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = objc_msgSend(&unk_1E45CB1C8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v23;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(&unk_1E45CB1C8);
              v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
              v20 = 0u;
              memset(v21, 0, 56);
              -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](self, "durationInfoForPlaybackStyle:songPace:", objc_msgSend(v17, "integerValue"), objc_msgSend(v12, "integerValue"));
              if ((retstr->var0.var2 & 1) == 0
                || (*(_OWORD *)&time1.value = v20,
                    time1.epoch = *(_QWORD *)v21,
                    time2 = (CMTime)retstr->var0,
                    CMTimeCompare(&time1, &time2) < 0))
              {
                *(_OWORD *)&retstr->var0.var0 = v20;
                retstr->var0.var3 = *(_QWORD *)v21;
              }
              if ((retstr->var1.var2 & 1) == 0
                || (time1 = *(CMTime *)&v21[8],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var1->var0,
                    time2.epoch = retstr->var1.var3,
                    CMTimeCompare(&time1, &time2) < 0))
              {
                *(_OWORD *)&p_var1->var0 = *(_OWORD *)&v21[8];
                retstr->var1.var3 = *(_QWORD *)&v21[24];
              }
              if ((retstr->var2.var2 & 1) == 0
                || (time1 = *(CMTime *)&v21[32],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var2->var0,
                    time2.epoch = retstr->var2.var3,
                    CMTimeCompare(&time1, &time2) < 0))
              {
                *(_OWORD *)&p_var2->var0 = *(_OWORD *)&v21[32];
                retstr->var2.var3 = *(_QWORD *)&v21[48];
              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(&unk_1E45CB1C8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v9);
        }
        v7 = v15 + 1;
      }
      while (($3DBB98C272AC9B04202267094881960A *)(v15 + 1) != v14);
      result = ($3DBB98C272AC9B04202267094881960A *)objc_msgSend(&unk_1E45CB1B0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v14 = result;
    }
    while (result);
  }
  return result;
}

- ($3DBB98C272AC9B04202267094881960A)maximumDurations
{
  $3DBB98C272AC9B04202267094881960A *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var2;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  $3DBB98C272AC9B04202267094881960A *v14;
  uint64_t v15;
  void *v17;
  CMTime time2;
  CMTime time1;
  __int128 v20;
  _BYTE v21[64];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  result = ($3DBB98C272AC9B04202267094881960A *)objc_msgSend(&unk_1E45CB1E0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  v14 = result;
  if (result)
  {
    p_var1 = &retstr->var1;
    v13 = *(_QWORD *)v27;
    p_var2 = &retstr->var2;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(&unk_1E45CB1E0);
        v15 = v7;
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = objc_msgSend(&unk_1E45CB1F8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v23;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(&unk_1E45CB1F8);
              v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
              v20 = 0u;
              memset(v21, 0, 56);
              -[PFStoryAutoEditConfiguration durationInfoForPlaybackStyle:songPace:](self, "durationInfoForPlaybackStyle:songPace:", objc_msgSend(v17, "integerValue"), objc_msgSend(v12, "integerValue"));
              if ((retstr->var0.var2 & 1) == 0
                || (*(_OWORD *)&time1.value = v20,
                    time1.epoch = *(_QWORD *)v21,
                    time2 = (CMTime)retstr->var0,
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(_OWORD *)&retstr->var0.var0 = v20;
                retstr->var0.var3 = *(_QWORD *)v21;
              }
              if ((retstr->var1.var2 & 1) == 0
                || (time1 = *(CMTime *)&v21[8],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var1->var0,
                    time2.epoch = retstr->var1.var3,
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(_OWORD *)&p_var1->var0 = *(_OWORD *)&v21[8];
                retstr->var1.var3 = *(_QWORD *)&v21[24];
              }
              if ((retstr->var2.var2 & 1) == 0
                || (time1 = *(CMTime *)&v21[32],
                    *(_OWORD *)&time2.value = *(_OWORD *)&p_var2->var0,
                    time2.epoch = retstr->var2.var3,
                    CMTimeCompare(&time1, &time2) >= 1))
              {
                *(_OWORD *)&p_var2->var0 = *(_OWORD *)&v21[32];
                retstr->var2.var3 = *(_QWORD *)&v21[48];
              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(&unk_1E45CB1F8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v9);
        }
        v7 = v15 + 1;
      }
      while (($3DBB98C272AC9B04202267094881960A *)(v15 + 1) != v14);
      result = ($3DBB98C272AC9B04202267094881960A *)objc_msgSend(&unk_1E45CB1E0, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v14 = result;
    }
    while (result);
  }
  return result;
}

- (id)clusteringPropertiesForMemoryCategoryName:(id)a3
{
  id v4;
  PFStoryClusteringProperties *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_clusteringPropertiesByCategory, "objectForKeyedSubscript:", v4);
  v5 = (PFStoryClusteringProperties *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Falling back to default clustering for '%@'", (uint8_t *)&v7, 0xCu);
    }
    -[NSDictionary objectForKeyedSubscript:](self->_clusteringPropertiesByCategory, "objectForKeyedSubscript:", CFSTR("default"));
    v5 = (PFStoryClusteringProperties *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Configuration file missing default clustering properties", (uint8_t *)&v7, 2u);
      }
      v5 = -[PFStoryClusteringProperties initWithAlgorithmName:algorithmProperties:distanceWeights:]([PFStoryClusteringProperties alloc], "initWithAlgorithmName:algorithmProperties:distanceWeights:", CFSTR("PLDBSCANClustering"), &unk_1E45CB5F0, &unk_1E45CB618);
    }
  }

  return v5;
}

- ($3DBB98C272AC9B04202267094881960A)_overallDurationInfoForDurationKind:(SEL)a3
{
  NSDictionary *overallDurationTable;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  Float64 v10;
  void *v11;
  double v12;
  Float64 v13;
  void *v14;
  double v15;
  Float64 v16;
  $3DBB98C272AC9B04202267094881960A *result;
  CMTime v18;
  CMTime v19;
  CMTime v20;

  overallDurationTable = self->_overallDurationTable;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](overallDurationTable, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  retstr->var2.var3 = 0;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  CMTimeMakeWithSeconds(&v20, v10, 600);
  CMTimeMakeWithSeconds(&v19, v13, 600);
  CMTimeMakeWithSeconds(&v18, v16, 600);
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v20;
  retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v19;
  retstr->var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;

  return result;
}

- ($3DBB98C272AC9B04202267094881960A)shortOverallDuration
{
  return -[PFStoryAutoEditConfiguration _overallDurationInfoForDurationKind:](self, "_overallDurationInfoForDurationKind:", 3);
}

- ($3DBB98C272AC9B04202267094881960A)mediumOverallDuration
{
  return -[PFStoryAutoEditConfiguration _overallDurationInfoForDurationKind:](self, "_overallDurationInfoForDurationKind:", 4);
}

- ($3DBB98C272AC9B04202267094881960A)longOverallDuration
{
  return -[PFStoryAutoEditConfiguration _overallDurationInfoForDurationKind:](self, "_overallDurationInfoForDurationKind:", 5);
}

- (NSURL)url
{
  return self->_url;
}

- (PFStoryTransitionTable)defaultTransitionTable
{
  return self->_defaultTransitionTable;
}

- (PFStoryTransitionTable)interMomentTransitionTable
{
  return self->_interMomentTransitionTable;
}

- (PFStoryTransitionTable)portraitTransitionTable
{
  return self->_portraitTransitionTable;
}

- (PFStoryTransitionTable)nUpTransitionTable
{
  return self->_nUpTransitionTable;
}

- (PFStoryTransitionTable)interModuleTransitionTable
{
  return self->_interModuleTransitionTable;
}

- (PFStoryMotionStyleTable)motionStyleTable
{
  return self->_motionStyleTable;
}

- (PFStoryMotionStyleTable)diptychMotionStyleTable
{
  return self->_diptychMotionStyleTable;
}

- (PFStoryMotionStyleTable)triptychMotionStyleTable
{
  return self->_triptychMotionStyleTable;
}

- (double)diptychDurationMultiplier
{
  return self->_diptychDurationMultiplier;
}

- (double)triptychDurationMultiplier
{
  return self->_triptychDurationMultiplier;
}

- (double)initialDurationMultiplier
{
  return self->_initialDurationMultiplier;
}

- (double)chapterBeginDurationMultiplier
{
  return self->_chapterBeginDurationMultiplier;
}

- (double)finalDurationMultiplier
{
  return self->_finalDurationMultiplier;
}

- (double)slowVisualTempoTarget
{
  return self->_slowVisualTempoTarget;
}

- (double)mediumVisualTempoTarget
{
  return self->_mediumVisualTempoTarget;
}

- (double)fastVisualTempoTarget
{
  return self->_fastVisualTempoTarget;
}

- (double)composabilityTargetDurationMultiplier
{
  return self->_composabilityTargetDurationMultiplier;
}

- (int64_t)composabilityMinimum1UpRunCount
{
  return self->_composabilityMinimum1UpRunCount;
}

- (int64_t)composabilityMinimumNUpCount
{
  return self->_composabilityMinimumNUpCount;
}

- (int64_t)composabilityMaximumNUpRunCount
{
  return self->_composabilityMaximumNUpRunCount;
}

- (double)composabilityScoreThreshold
{
  return self->_composabilityScoreThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triptychMotionStyleTable, 0);
  objc_storeStrong((id *)&self->_diptychMotionStyleTable, 0);
  objc_storeStrong((id *)&self->_motionStyleTable, 0);
  objc_storeStrong((id *)&self->_interModuleTransitionTable, 0);
  objc_storeStrong((id *)&self->_nUpTransitionTable, 0);
  objc_storeStrong((id *)&self->_portraitTransitionTable, 0);
  objc_storeStrong((id *)&self->_interMomentTransitionTable, 0);
  objc_storeStrong((id *)&self->_defaultTransitionTable, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_outroDurations, 0);
  objc_storeStrong((id *)&self->_overallDurationTable, 0);
  objc_storeStrong((id *)&self->_clusteringPropertiesByCategory, 0);
  objc_storeStrong((id *)&self->_transitionDurationsByKind, 0);
  objc_storeStrong((id *)&self->_durationTablesByPlaybackStyle, 0);
}

void __78__PFStoryAutoEditConfiguration__loadClusteringPropertiesFromMemoryCategories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PFStoryClusteringProperties *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("clustering"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("algorithm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("algorithmProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("distanceWeights"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PFStoryClusteringProperties initWithAlgorithmName:algorithmProperties:distanceWeights:]([PFStoryClusteringProperties alloc], "initWithAlgorithmName:algorithmProperties:distanceWeights:", v8, v9, v10);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v5);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Memory category '%@' does not contain clustering properties.", (uint8_t *)&v12, 0xCu);
  }

}

void __69__PFStoryAutoEditConfiguration__arrayFromTable_count_nameToValueMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v7, objc_msgSend(v5, "integerValue"));

  }
}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("transitions"));
  v8 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v8;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v8, 9, _loadData__transitionsByName);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v10;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("interMomentTransitions"));
  v11 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v11, 9, _loadData__transitionsByName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v12, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v13;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit inter-moment transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("portraitTransitions"));
  v14 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v14;
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v14, 9, _loadData__transitionsByName);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v15, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v16;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit portrait transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("nUpTransitions"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v17, 9, _loadData__transitionsByName);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v18, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v19 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v19;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit N-up transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("interModuleTransitions"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v20, 9, _loadData__transitionsByName);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
      objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v21, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v22 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v22;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit inter-module transitions missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("motionStyles"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v23, 4, _loadData__motionStylesByName);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
      objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", v24, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v25 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v25;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit motionStyles missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("diptychMotionStyles"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v26, 4, _loadData__motionStylesByName);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "count"))
      objc_msgSend(*(id *)(a1 + 104), "setObject:forKeyedSubscript:", v27, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v28 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v28;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit diptych motionStyles missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("triptychMotionStyles"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 40), "_arrayFromTable:count:nameToValueMap:", v29, 4, _loadData__motionStylesByName);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "count"))
      objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v30, v6);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v31 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v36 = v31;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AutoEdit triptych motionStyles missing for color grade (%@) song pace (%@)", buf, 0x16u);
  }

}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (void *)_loadData__paceMap;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_2;
  v10[3] = &unk_1E45A19E0;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(&unk_1E45CB198, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(&unk_1E45CB198);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v16);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, v8 + i);

          }
        }
        v8 += i;
        v7 = objc_msgSend(&unk_1E45CB198, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
  }

}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)_loadData__paceMap;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__PFStoryAutoEditConfiguration__loadData___block_invoke_5;
    v11[3] = &unk_1E45A1A08;
    v12 = v5;
    v8 = v6;
    v13 = v8;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);

    }
  }

}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(&unk_1E45CB180, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(&unk_1E45CB180);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:atIndexedSubscript:", v15, v10 + i);

        }
      }
      v10 += i;
      v9 = objc_msgSend(&unk_1E45CB180, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

void __42__PFStoryAutoEditConfiguration__loadData___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)_loadData__songPacesByName;
  _loadData__songPacesByName = (uint64_t)&unk_1E45CB500;

  v1 = (void *)_loadData__transitionsByName;
  _loadData__transitionsByName = (uint64_t)&unk_1E45CB528;

  v2 = (void *)_loadData__motionStylesByName;
  _loadData__motionStylesByName = (uint64_t)&unk_1E45CB550;

  v3 = (void *)_loadData__playbackStyleMap;
  _loadData__playbackStyleMap = (uint64_t)&unk_1E45CB578;

  v4 = (void *)_loadData__paceMap;
  _loadData__paceMap = (uint64_t)&unk_1E45CB5A0;

  v5 = (void *)_loadData__overallDurationKindMap;
  _loadData__overallDurationKindMap = (uint64_t)&unk_1E45CB5C8;

}

+ (NSNumber)currentVersion
{
  return (NSNumber *)&unk_1E45CA0E8;
}

+ (id)standardConfiguration
{
  if (standardConfiguration_onceToken != -1)
    dispatch_once(&standardConfiguration_onceToken, &__block_literal_global_54);
  return (id)standardConfiguration_instance;
}

void __53__PFStoryAutoEditConfiguration_standardConfiguration__block_invoke()
{
  void *v0;
  PFStoryAutoEditConfiguration *v1;
  void *v2;
  PFRWSampleBufferChannel *v3;
  SEL v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("PFStoryAutoEditDefaultConfig"), CFSTR("plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[PFStoryAutoEditConfiguration initWithConfigurationFileAtURL:]([PFStoryAutoEditConfiguration alloc], "initWithConfigurationFileAtURL:", v0);
  v2 = (void *)standardConfiguration_instance;
  standardConfiguration_instance = (uint64_t)v1;

  if (standardConfiguration_instance)
  {

  }
  else
  {
    v3 = (PFRWSampleBufferChannel *)_PFAssertFailHandler();
    -[PFRWSampleBufferChannel init](v3, v4);
  }
}

@end
