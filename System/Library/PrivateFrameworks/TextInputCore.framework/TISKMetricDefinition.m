@implementation TISKMetricDefinition

- (id)init:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6 isPointMetric:(BOOL)a7
{
  id v13;
  TISKMetricDefinition *v14;
  TISKMetricDefinition *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TISKMetricDefinition;
  v14 = -[TISKMetricDefinition init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_metricName, a3);
    v15->_metricType = a4;
    v15->_isPointMetric = a7;
    v15->_positionalSize = a6;
    v15->_metricDefinition = a5;
  }

  return v15;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (int)metricType
{
  return self->_metricType;
}

- (unint64_t)positionalSize
{
  return self->_positionalSize;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)metricDefinition
{
  return self->_metricDefinition;
}

- (BOOL)isPointMetric
{
  return self->_isPointMetric;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricName, 0);
}

+ (double)pointsToMM:(double)a3
{
  unint64_t v4;
  float v5;

  v4 = (int)MGGetSInt32Answer();
  MGGetFloat32Answer();
  return a3 * 25.3999996 * v5 / (double)v4;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6 isPointMetric:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v10;
  id v11;
  id v12;

  v7 = a7;
  v10 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = -[TISKMetricDefinition init:type:metricDef:size:isPointMetric:]([TISKMetricDefinition alloc], "init:type:metricDef:size:isPointMetric:", v11, v10, a5, a6, v7);

  return v12;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 size:(unint64_t)a6
{
  uint64_t v8;
  id v9;
  id v10;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = -[TISKMetricDefinition init:type:metricDef:size:isPointMetric:]([TISKMetricDefinition alloc], "init:type:metricDef:size:isPointMetric:", v9, v8, a5, a6, 0);

  return v10;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = -[TISKMetricDefinition init:type:metricDef:size:isPointMetric:]([TISKMetricDefinition alloc], "init:type:metricDef:size:isPointMetric:", v7, v6, a5, 0, 0);

  return v8;
}

+ (id)_makeMetric:(id)a3 type:(int)a4 metricDef:(id *)a5 isPointMetric:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v9;
  id v10;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = -[TISKMetricDefinition init:type:metricDef:size:isPointMetric:]([TISKMetricDefinition alloc], "init:type:metricDef:size:isPointMetric:", v9, v8, a5, 0, v6);

  return v10;
}

+ (id)_makeMetric:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[TISKMetricDefinition init:type:metricDef:size:isPointMetric:]([TISKMetricDefinition alloc], "init:type:metricDef:size:isPointMetric:", v5, v4, 0, 0, 0);

  return v6;
}

+ (id)metricDefinitions
{
  if (metricDefinitions_onceToken != -1)
    dispatch_once(&metricDefinitions_onceToken, &__block_literal_global_16262);
  return (id)metricDefinitions_defs;
}

void __41__TISKMetricDefinition_metricDefinitions__block_invoke()
{
  id *v0;
  void *v1;
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;
  void *v25;
  id *v26;
  void *v27;
  id *v28;
  void *v29;
  id *v30;
  void *v31;
  id *v32;
  void *v33;
  id *v34;
  void *v35;
  id *v36;
  void *v37;
  id *v38;
  void *v39;
  id *v40;
  void *v41;
  id *v42;
  void *v43;
  id *v44;
  void *v45;
  id *v46;
  void *v47;
  id *v48;
  void *v49;
  id *v50;
  void *v51;
  id *v52;
  void *v53;
  id *v54;
  void *v55;
  id *v56;
  void *v57;
  id *v58;
  void *v59;
  id *v60;
  void *v61;
  id *v62;
  void *v63;
  id *v64;
  void *v65;
  id *v66;
  void *v67;
  id *v68;
  void *v69;
  id *v70;
  void *v71;
  id *v72;
  void *v73;
  id *v74;
  void *v75;
  id *v76;
  void *v77;
  id *v78;
  void *v79;
  id *v80;
  void *v81;
  id *v82;
  void *v83;
  id *v84;
  void *v85;
  id *v86;
  void *v87;
  id *v88;
  void *v89;
  id *v90;
  void *v91;
  id *v92;
  void *v93;
  id *v94;
  void *v95;
  id *v96;
  void *v97;
  id *v98;
  void *v99;
  id *v100;
  void *v101;
  id *v102;
  void *v103;
  id *v104;
  void *v105;
  id *v106;
  void *v107;
  id *v108;
  void *v109;
  id *v110;
  void *v111;
  id *v112;
  void *v113;
  id *v114;
  void *v115;
  id *v116;
  void *v117;
  id *v118;
  void *v119;
  id *v120;
  void *v121;
  id *v122;
  void *v123;
  id *v124;
  void *v125;
  id *v126;
  void *v127;
  id *v128;
  void *v129;
  id *v130;
  void *v131;
  id *v132;
  void *v133;
  id *v134;
  void *v135;
  id *v136;
  void *v137;
  id *v138;
  void *v139;
  id *v140;
  void *v141;
  id *v142;
  void *v143;
  id *v144;
  void *v145;
  id *v146;
  void *v147;
  id *v148;
  void *v149;
  id *v150;
  void *v151;
  id *v152;
  void *v153;
  id *v154;
  void *v155;
  id *v156;
  void *v157;
  id *v158;
  void *v159;
  id *v160;
  void *v161;
  id *v162;
  void *v163;
  id *v164;
  void *v165;
  id *v166;
  void *v167;
  id *v168;
  void *v169;
  id *v170;
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
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
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
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  uint64_t v260;
  uint64_t *v261;
  uint64_t v262;
  uint64_t v263;
  _QWORD v264[88];

  v264[86] = *MEMORY[0x1E0C80C00];
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v0 = (id *)getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr)
  {
    v1 = (void *)SensorKitLibrary();
    v0 = (id *)dlsym(v1, "SRKeyboardMetricScalarTotalWordsKey");
    v261[3] = (uint64_t)v0;
    getSRKeyboardMetricScalarTotalWordsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v260, 8);
  if (!v0)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfWordsCounter, *v0);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v2 = (id *)getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr)
  {
    v3 = (void *)SensorKitLibrary();
    v2 = (id *)dlsym(v3, "SRKeyboardMetricScalarTotalAlteredWordsKey");
    v261[3] = (uint64_t)v2;
    getSRKeyboardMetricScalarTotalAlteredWordsKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v260, 8);
  if (!v2)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfAlteredWordsCounter, *v2);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v4 = (id *)getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr)
  {
    v5 = (void *)SensorKitLibrary();
    v4 = (id *)dlsym(v5, "SRKeyboardMetricScalarTotalTapsKey");
    v261[3] = (uint64_t)v4;
    getSRKeyboardMetricScalarTotalTapsKeySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v260, 8);
  if (!v4)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfTappedKeysCounter, *v4);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v6 = (id *)getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr)
  {
    v7 = (void *)SensorKitLibrary();
    v6 = (id *)dlsym(v7, "SRKeyboardMetricScalarTotalDragsKey");
    v261[3] = (uint64_t)v6;
    getSRKeyboardMetricScalarTotalDragsKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v260, 8);
  if (!v6)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfDragsCounter, *v6);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v8 = (id *)getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr)
  {
    v9 = (void *)SensorKitLibrary();
    v8 = (id *)dlsym(v9, "SRKeyboardMetricScalarTotalDeletesKey");
    v261[3] = (uint64_t)v8;
    getSRKeyboardMetricScalarTotalDeletesKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v260, 8);
  if (!v8)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfDeletesCounter, *v8);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v10 = (id *)getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr)
  {
    v11 = (void *)SensorKitLibrary();
    v10 = (id *)dlsym(v11, "SRKeyboardMetricScalarTotalEmojiKey");
    v261[3] = (uint64_t)v10;
    getSRKeyboardMetricScalarTotalEmojiKeySymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v260, 8);
  if (!v10)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfEmojiCounter, *v10);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v12 = (id *)getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr)
  {
    v13 = (void *)SensorKitLibrary();
    v12 = (id *)dlsym(v13, "SRKeyboardMetricScalarTotalPathsKey");
    v261[3] = (uint64_t)v12;
    getSRKeyboardMetricScalarTotalPathsKeySymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v260, 8);
  if (!v12)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfPaths, *v12);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v14 = (id *)getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr)
  {
    v15 = (void *)SensorKitLibrary();
    v14 = (id *)dlsym(v15, "SRKeyboardMetricScalarTotalPathTimeKey");
    v261[3] = (uint64_t)v14;
    getSRKeyboardMetricScalarTotalPathTimeKeySymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v260, 8);
  if (!v14)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTotalPathTime, *v14);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v16 = (id *)getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr)
  {
    v17 = (void *)SensorKitLibrary();
    v16 = (id *)dlsym(v17, "SRKeyboardMetricScalarTotalPathLengthKey");
    v261[3] = (uint64_t)v16;
    getSRKeyboardMetricScalarTotalPathLengthKeySymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v260, 8);
  if (!v16)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTotalPathLength, *v16);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v18 = (id *)getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr)
  {
    v19 = (void *)SensorKitLibrary();
    v18 = (id *)dlsym(v19, "SRKeyboardMetricScalarTotalSessionTypingDurationKey");
    v261[3] = (uint64_t)v18;
    getSRKeyboardMetricScalarTotalSessionTypingDurationKeySymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v260, 8);
  if (!v18)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTotalSessionTypingDuration, *v18);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v20 = (id *)getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr)
  {
    v21 = (void *)SensorKitLibrary();
    v20 = (id *)dlsym(v21, "SRKeyboardMetricScalarTypingPausesKey");
    v261[3] = (uint64_t)v20;
    getSRKeyboardMetricScalarTypingPausesKeySymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v260, 8);
  if (!v20)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTypingPauses, *v20);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v22 = (id *)getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr)
  {
    v23 = (void *)SensorKitLibrary();
    v22 = (id *)dlsym(v23, "SRKeyboardMetricScalarEpisodeCountKey");
    v261[3] = (uint64_t)v22;
    getSRKeyboardMetricScalarEpisodeCountKeySymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v260, 8);
  if (!v22)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKEpisodeCount, *v22);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v24 = (id *)getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr)
  {
    v25 = (void *)SensorKitLibrary();
    v24 = (id *)dlsym(v25, "SRKeyboardMetricScalarTapTypingSpeedKey");
    v261[3] = (uint64_t)v24;
    getSRKeyboardMetricScalarTapTypingSpeedKeySymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v260, 8);
  if (!v24)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTapTypingSpeed, *v24);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v26 = (id *)getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr)
  {
    v27 = (void *)SensorKitLibrary();
    v26 = (id *)dlsym(v27, "SRKeyboardMetricScalarPathTypingSpeed");
    v261[3] = (uint64_t)v26;
    getSRKeyboardMetricScalarPathTypingSpeedSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v260, 8);
  if (!v26)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKPathTypingSpeed, *v26);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v28 = (id *)getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr)
  {
    v29 = (void *)SensorKitLibrary();
    v28 = (id *)dlsym(v29, "SRKeyboardMetricScalarTotalAutoCorrectionsKey");
    v261[3] = (uint64_t)v28;
    getSRKeyboardMetricScalarTotalAutoCorrectionsKeySymbolLoc_ptr = (uint64_t)v28;
  }
  _Block_object_dispose(&v260, 8);
  if (!v28)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfAutoCorrections, *v28);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v30 = (id *)getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr)
  {
    v31 = (void *)SensorKitLibrary();
    v30 = (id *)dlsym(v31, "SRKeyboardMetricScalarTotalSpaceCorrectionsKey");
    v261[3] = (uint64_t)v30;
    getSRKeyboardMetricScalarTotalSpaceCorrectionsKeySymbolLoc_ptr = (uint64_t)v30;
  }
  _Block_object_dispose(&v260, 8);
  if (!v30)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfSpaceCorrections, *v30);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v32 = (id *)getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr)
  {
    v33 = (void *)SensorKitLibrary();
    v32 = (id *)dlsym(v33, "SRKeyboardMetricScalarTotalRetroCorrectionsKey");
    v261[3] = (uint64_t)v32;
    getSRKeyboardMetricScalarTotalRetroCorrectionsKeySymbolLoc_ptr = (uint64_t)v32;
  }
  _Block_object_dispose(&v260, 8);
  if (!v32)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfRetroCorrections, *v32);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v34 = (id *)getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr)
  {
    v35 = (void *)SensorKitLibrary();
    v34 = (id *)dlsym(v35, "SRKeyboardMetricScalarTotalTranspositionCorrectionsKey");
    v261[3] = (uint64_t)v34;
    getSRKeyboardMetricScalarTotalTranspositionCorrectionsKeySymbolLoc_ptr = (uint64_t)v34;
  }
  _Block_object_dispose(&v260, 8);
  if (!v34)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfTranspositionCorrections, *v34);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v36 = (id *)getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr)
  {
    v37 = (void *)SensorKitLibrary();
    v36 = (id *)dlsym(v37, "SRKeyboardMetricScalarTotalInsertKeyCorrectionsKey");
    v261[3] = (uint64_t)v36;
    getSRKeyboardMetricScalarTotalInsertKeyCorrectionsKeySymbolLoc_ptr = (uint64_t)v36;
  }
  _Block_object_dispose(&v260, 8);
  if (!v36)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfInsertKeyCorrections, *v36);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v38 = (id *)getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr)
  {
    v39 = (void *)SensorKitLibrary();
    v38 = (id *)dlsym(v39, "SRKeyboardMetricScalarTotalSkipTouchCorrectionsKey");
    v261[3] = (uint64_t)v38;
    getSRKeyboardMetricScalarTotalSkipTouchCorrectionsKeySymbolLoc_ptr = (uint64_t)v38;
  }
  _Block_object_dispose(&v260, 8);
  if (!v38)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfSkipTouchCorrections, *v38);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v40 = (id *)getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr)
  {
    v41 = (void *)SensorKitLibrary();
    v40 = (id *)dlsym(v41, "SRKeyboardMetricScalarTotalNearKeyCorrectionsKey");
    v261[3] = (uint64_t)v40;
    getSRKeyboardMetricScalarTotalNearKeyCorrectionsKeySymbolLoc_ptr = (uint64_t)v40;
  }
  _Block_object_dispose(&v260, 8);
  if (!v40)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfNearKeyCorrections, *v40);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v42 = (id *)getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr)
  {
    v43 = (void *)SensorKitLibrary();
    v42 = (id *)dlsym(v43, "SRKeyboardMetricScalarTotalSubstitutionCorrectionsKey");
    v261[3] = (uint64_t)v42;
    getSRKeyboardMetricScalarTotalSubstitutionCorrectionsKeySymbolLoc_ptr = (uint64_t)v42;
  }
  _Block_object_dispose(&v260, 8);
  if (!v42)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfSubstitutionCorrections, *v42);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v44 = (id *)getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr)
  {
    v45 = (void *)SensorKitLibrary();
    v44 = (id *)dlsym(v45, "SRKeyboardMetricScalarTotalHitTestCorrectionsKey");
    v261[3] = (uint64_t)v44;
    getSRKeyboardMetricScalarTotalHitTestCorrectionsKeySymbolLoc_ptr = (uint64_t)v44;
  }
  _Block_object_dispose(&v260, 8);
  if (!v44)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKNumberOfHitTestCorrections, *v44);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v46 = (id *)getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr)
  {
    v47 = (void *)SensorKitLibrary();
    v46 = (id *)dlsym(v47, "SRKeyboardMetricPositionalWordDownErrorDistanceKey");
    v261[3] = (uint64_t)v46;
    getSRKeyboardMetricPositionalWordDownErrorDistanceKeySymbolLoc_ptr = (uint64_t)v46;
  }
  _Block_object_dispose(&v260, 8);
  if (!v46)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKLongWordPositionalDownErrorDistance, *v46);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v48 = (id *)getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr)
  {
    v49 = (void *)SensorKitLibrary();
    v48 = (id *)dlsym(v49, "SRKeyboardMetricPositionalWordUpErrorDistanceKey");
    v261[3] = (uint64_t)v48;
    getSRKeyboardMetricPositionalWordUpErrorDistanceKeySymbolLoc_ptr = (uint64_t)v48;
  }
  _Block_object_dispose(&v260, 8);
  if (!v48)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKLongWordPositionalUpErrorDistance, *v48);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v50 = (id *)getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr)
  {
    v51 = (void *)SensorKitLibrary();
    v50 = (id *)dlsym(v51, "SRKeyboardMetricPositionalWordTouchDownUpKey");
    v261[3] = (uint64_t)v50;
    getSRKeyboardMetricPositionalWordTouchDownUpKeySymbolLoc_ptr = (uint64_t)v50;
  }
  _Block_object_dispose(&v260, 8);
  if (!v50)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKLongWordTouchDownUpPositionalMetric, *v50);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v52 = (id *)getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr)
  {
    v53 = (void *)SensorKitLibrary();
    v52 = (id *)dlsym(v53, "SRKeyboardMetricPositionalWordTouchDownDownKey");
    v261[3] = (uint64_t)v52;
    getSRKeyboardMetricPositionalWordTouchDownDownKeySymbolLoc_ptr = (uint64_t)v52;
  }
  _Block_object_dispose(&v260, 8);
  if (!v52)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKLongWordTouchDownDownPositionalMetric, *v52);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v54 = (id *)getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr)
  {
    v55 = (void *)SensorKitLibrary();
    v54 = (id *)dlsym(v55, "SRKeyboardMetricProbabilityUpErrorDistanceKey");
    v261[3] = (uint64_t)v54;
    getSRKeyboardMetricProbabilityUpErrorDistanceKeySymbolLoc_ptr = (uint64_t)v54;
  }
  _Block_object_dispose(&v260, 8);
  if (!v54)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKUpErrorDistance, *v54);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v56 = (id *)getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr)
  {
    v57 = (void *)SensorKitLibrary();
    v56 = (id *)dlsym(v57, "SRKeyboardMetricProbabilityDownErrorDistanceKey");
    v261[3] = (uint64_t)v56;
    getSRKeyboardMetricProbabilityDownErrorDistanceKeySymbolLoc_ptr = (uint64_t)v56;
  }
  _Block_object_dispose(&v260, 8);
  if (!v56)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDownErrorDistance, *v56);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v58 = (id *)getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr)
  {
    v59 = (void *)SensorKitLibrary();
    v58 = (id *)dlsym(v59, "SRKeyboardMetricProbabilitySpaceUpErrorDistanceKey");
    v261[3] = (uint64_t)v58;
    getSRKeyboardMetricProbabilitySpaceUpErrorDistanceKeySymbolLoc_ptr = (uint64_t)v58;
  }
  _Block_object_dispose(&v260, 8);
  if (!v58)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceUpErrorDistance, *v58);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v60 = (id *)getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr)
  {
    v61 = (void *)SensorKitLibrary();
    v60 = (id *)dlsym(v61, "SRKeyboardMetricProbabilitySpaceDownErrorDistanceKey");
    v261[3] = (uint64_t)v60;
    getSRKeyboardMetricProbabilitySpaceDownErrorDistanceKeySymbolLoc_ptr = (uint64_t)v60;
  }
  _Block_object_dispose(&v260, 8);
  if (!v60)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceDownErrorDistance, *v60);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v62 = (id *)getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr)
  {
    v63 = (void *)SensorKitLibrary();
    v62 = (id *)dlsym(v63, "SRKeyboardMetricProbabilityDeleteUpErrorDistanceKey");
    v261[3] = (uint64_t)v62;
    getSRKeyboardMetricProbabilityDeleteUpErrorDistanceKeySymbolLoc_ptr = (uint64_t)v62;
  }
  _Block_object_dispose(&v260, 8);
  if (!v62)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteUpErrorDistance, *v62);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v64 = (id *)getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr)
  {
    v65 = (void *)SensorKitLibrary();
    v64 = (id *)dlsym(v65, "SRKeyboardMetricProbabilityDeleteDownErrorDistanceKey");
    v261[3] = (uint64_t)v64;
    getSRKeyboardMetricProbabilityDeleteDownErrorDistanceKeySymbolLoc_ptr = (uint64_t)v64;
  }
  _Block_object_dispose(&v260, 8);
  if (!v64)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteDownErrorDistance, *v64);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v66 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr)
  {
    v67 = (void *)SensorKitLibrary();
    v66 = (id *)dlsym(v67, "SRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKey");
    v261[3] = (uint64_t)v66;
    getSRKeyboardMetricProbabilityShortWordCharKeyUpErrorDistanceKeySymbolLoc_ptr = (uint64_t)v66;
  }
  _Block_object_dispose(&v260, 8);
  if (!v66)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKShortWordCharUpErrorDistance, *v66);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v68 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr)
  {
    v69 = (void *)SensorKitLibrary();
    v68 = (id *)dlsym(v69, "SRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKey");
    v261[3] = (uint64_t)v68;
    getSRKeyboardMetricProbabilityShortWordCharKeyDownErrorDistanceKeySymbolLoc_ptr = (uint64_t)v68;
  }
  _Block_object_dispose(&v260, 8);
  if (!v68)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKShortWordCharDownErrorDistance, *v68);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v70 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr)
  {
    v71 = (void *)SensorKitLibrary();
    v70 = (id *)dlsym(v71, "SRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKey");
    v261[3] = (uint64_t)v70;
    getSRKeyboardMetricProbabilityShortWordCharKeyToCharKeyKeySymbolLoc_ptr = (uint64_t)v70;
  }
  _Block_object_dispose(&v260, 8);
  if (!v70)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKShortWordCharToCharMetric, *v70);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v72 = (id *)getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr)
  {
    v73 = (void *)SensorKitLibrary();
    v72 = (id *)dlsym(v73, "SRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKey");
    v261[3] = (uint64_t)v72;
    getSRKeyboardMetricProbabilityShortWordCharKeyTouchDownUpKeySymbolLoc_ptr = (uint64_t)v72;
  }
  _Block_object_dispose(&v260, 8);
  if (!v72)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKShortWordCharTouchDownUpMetric, *v72);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v74 = (id *)getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr)
  {
    v75 = (void *)SensorKitLibrary();
    v74 = (id *)dlsym(v75, "SRKeyboardMetricProbabilityTouchDownUpKey");
    v261[3] = (uint64_t)v74;
    getSRKeyboardMetricProbabilityTouchDownUpKeySymbolLoc_ptr = (uint64_t)v74;
  }
  _Block_object_dispose(&v260, 8);
  if (!v74)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTouchDownUpMetric, *v74);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v76 = (id *)getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr)
  {
    v77 = (void *)SensorKitLibrary();
    v76 = (id *)dlsym(v77, "SRKeyboardMetricProbabilitySpaceTouchDownUpKey");
    v261[3] = (uint64_t)v76;
    getSRKeyboardMetricProbabilitySpaceTouchDownUpKeySymbolLoc_ptr = (uint64_t)v76;
  }
  _Block_object_dispose(&v260, 8);
  if (!v76)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceTouchDownUpMetric, *v76);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v78 = (id *)getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr)
  {
    v79 = (void *)SensorKitLibrary();
    v78 = (id *)dlsym(v79, "SRKeyboardMetricProbabilityDeleteTouchDownUpKey");
    v261[3] = (uint64_t)v78;
    getSRKeyboardMetricProbabilityDeleteTouchDownUpKeySymbolLoc_ptr = (uint64_t)v78;
  }
  _Block_object_dispose(&v260, 8);
  if (!v78)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteTouchDownUpMetric, *v78);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v80 = (id *)getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr)
  {
    v81 = (void *)SensorKitLibrary();
    v80 = (id *)dlsym(v81, "SRKeyboardMetricProbabilityTouchDownDownKey");
    v261[3] = (uint64_t)v80;
    getSRKeyboardMetricProbabilityTouchDownDownKeySymbolLoc_ptr = (uint64_t)v80;
  }
  _Block_object_dispose(&v260, 8);
  if (!v80)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTouchDownDownMetric, *v80);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v82 = (id *)getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr)
  {
    v83 = (void *)SensorKitLibrary();
    v82 = (id *)dlsym(v83, "SRKeyboardMetricProbabilityTouchUpDownKey");
    v261[3] = (uint64_t)v82;
    getSRKeyboardMetricProbabilityTouchUpDownKeySymbolLoc_ptr = (uint64_t)v82;
  }
  _Block_object_dispose(&v260, 8);
  if (!v82)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKTouchUpDownMetric, *v82);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v84 = (id *)getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr)
  {
    v85 = (void *)SensorKitLibrary();
    v84 = (id *)dlsym(v85, "SRKeyboardMetricPositionalWordTouchUpDownKey");
    v261[3] = (uint64_t)v84;
    getSRKeyboardMetricPositionalWordTouchUpDownKeySymbolLoc_ptr = (uint64_t)v84;
  }
  _Block_object_dispose(&v260, 8);
  if (!v84)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKShortWordCharTouchUpDownMetric, *v84);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v86 = (id *)getSRKeyboardMetricPositionalLongWordTouchUpDownKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricPositionalLongWordTouchUpDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalLongWordTouchUpDownKeySymbolLoc_ptr)
  {
    v87 = (void *)SensorKitLibrary();
    v86 = (id *)dlsym(v87, "SRKeyboardMetricPositionalLongWordTouchUpDownKey");
    v261[3] = (uint64_t)v86;
    getSRKeyboardMetricPositionalLongWordTouchUpDownKeySymbolLoc_ptr = (uint64_t)v86;
  }
  _Block_object_dispose(&v260, 8);
  if (!v86)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKLongWordTouchUpDownPositionalMetric, *v86);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v88 = (id *)getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr)
  {
    v89 = (void *)SensorKitLibrary();
    v88 = (id *)dlsym(v89, "SRKeyboardMetricProbabilityCharKeyToPredictionKey");
    v261[3] = (uint64_t)v88;
    getSRKeyboardMetricProbabilityCharKeyToPredictionKeySymbolLoc_ptr = (uint64_t)v88;
  }
  _Block_object_dispose(&v260, 8);
  if (!v88)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKCharToPredictionMetric, *v88);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v90 = (id *)getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr)
  {
    v91 = (void *)SensorKitLibrary();
    v90 = (id *)dlsym(v91, "SRKeyboardMetricProbabilityCharKeyToAnyTapKey");
    v261[3] = (uint64_t)v90;
    getSRKeyboardMetricProbabilityCharKeyToAnyTapKeySymbolLoc_ptr = (uint64_t)v90;
  }
  _Block_object_dispose(&v260, 8);
  if (!v90)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKCharToAnyTapMetric, *v90);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v92 = (id *)getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr)
  {
    v93 = (void *)SensorKitLibrary();
    v92 = (id *)dlsym(v93, "SRKeyboardMetricProbabilityAnyTapToCharKeyKey");
    v261[3] = (uint64_t)v92;
    getSRKeyboardMetricProbabilityAnyTapToCharKeyKeySymbolLoc_ptr = (uint64_t)v92;
  }
  _Block_object_dispose(&v260, 8);
  if (!v92)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKAnyTapToCharMetric, *v92);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v94 = (id *)getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr)
  {
    v95 = (void *)SensorKitLibrary();
    v94 = (id *)dlsym(v95, "SRKeyboardMetricProbabilitySpaceToCharKeyKey");
    v261[3] = (uint64_t)v94;
    getSRKeyboardMetricProbabilitySpaceToCharKeyKeySymbolLoc_ptr = (uint64_t)v94;
  }
  _Block_object_dispose(&v260, 8);
  if (!v94)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceToCharMetric, *v94);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v96 = (id *)getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr)
  {
    v97 = (void *)SensorKitLibrary();
    v96 = (id *)dlsym(v97, "SRKeyboardMetricProbabilityCharKeyToSpaceKey");
    v261[3] = (uint64_t)v96;
    getSRKeyboardMetricProbabilityCharKeyToSpaceKeySymbolLoc_ptr = (uint64_t)v96;
  }
  _Block_object_dispose(&v260, 8);
  if (!v96)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKCharToSpaceMetric, *v96);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v98 = (id *)getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr)
  {
    v99 = (void *)SensorKitLibrary();
    v98 = (id *)dlsym(v99, "SRKeyboardMetricProbabilitySpaceToDeleteKey");
    v261[3] = (uint64_t)v98;
    getSRKeyboardMetricProbabilitySpaceToDeleteKeySymbolLoc_ptr = (uint64_t)v98;
  }
  _Block_object_dispose(&v260, 8);
  if (!v98)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceToDeleteMetric, *v98);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v100 = (id *)getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr)
  {
    v101 = (void *)SensorKitLibrary();
    v100 = (id *)dlsym(v101, "SRKeyboardMetricProbabilityDeleteToSpaceKey");
    v261[3] = (uint64_t)v100;
    getSRKeyboardMetricProbabilityDeleteToSpaceKeySymbolLoc_ptr = (uint64_t)v100;
  }
  _Block_object_dispose(&v260, 8);
  if (!v100)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteToSpaceMetric, *v100);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v102 = (id *)getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr)
  {
    v103 = (void *)SensorKitLibrary();
    v102 = (id *)dlsym(v103, "SRKeyboardMetricProbabilitySpaceToSpaceKey");
    v261[3] = (uint64_t)v102;
    getSRKeyboardMetricProbabilitySpaceToSpaceKeySymbolLoc_ptr = (uint64_t)v102;
  }
  _Block_object_dispose(&v260, 8);
  if (!v102)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceToSpaceMetric, *v102);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v104 = (id *)getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr)
  {
    v105 = (void *)SensorKitLibrary();
    v104 = (id *)dlsym(v105, "SRKeyboardMetricProbabilitySpaceToShiftKey");
    v261[3] = (uint64_t)v104;
    getSRKeyboardMetricProbabilitySpaceToShiftKeySymbolLoc_ptr = (uint64_t)v104;
  }
  _Block_object_dispose(&v260, 8);
  if (!v104)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceToShiftMetric, *v104);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v106 = (id *)getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr)
  {
    v107 = (void *)SensorKitLibrary();
    v106 = (id *)dlsym(v107, "SRKeyboardMetricProbabilitySpaceTo123KeyKey");
    v261[3] = (uint64_t)v106;
    getSRKeyboardMetricProbabilitySpaceTo123KeyKeySymbolLoc_ptr = (uint64_t)v106;
  }
  _Block_object_dispose(&v260, 8);
  if (!v106)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceTo123Metric, *v106);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v108 = (id *)getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr)
  {
    v109 = (void *)SensorKitLibrary();
    v108 = (id *)dlsym(v109, "SRKeyboardMetricProbabilitySpaceToPredictionKey");
    v261[3] = (uint64_t)v108;
    getSRKeyboardMetricProbabilitySpaceToPredictionKeySymbolLoc_ptr = (uint64_t)v108;
  }
  _Block_object_dispose(&v260, 8);
  if (!v108)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceToPredictionMetric, *v108);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v110 = (id *)getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr)
  {
    v111 = (void *)SensorKitLibrary();
    v110 = (id *)dlsym(v111, "SRKeyboardMetricProbabilityDeleteToCharKeyKey");
    v261[3] = (uint64_t)v110;
    getSRKeyboardMetricProbabilityDeleteToCharKeyKeySymbolLoc_ptr = (uint64_t)v110;
  }
  _Block_object_dispose(&v260, 8);
  if (!v110)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteToCharMetric, *v110);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v112 = (id *)getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr)
  {
    v113 = (void *)SensorKitLibrary();
    v112 = (id *)dlsym(v113, "SRKeyboardMetricProbabilityCharKeyToDeleteKey");
    v261[3] = (uint64_t)v112;
    getSRKeyboardMetricProbabilityCharKeyToDeleteKeySymbolLoc_ptr = (uint64_t)v112;
  }
  _Block_object_dispose(&v260, 8);
  if (!v112)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKKeyToDeleteMetric, *v112);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v114 = (id *)getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr)
  {
    v115 = (void *)SensorKitLibrary();
    v114 = (id *)dlsym(v115, "SRKeyboardMetricProbabilityDeleteToDeleteKey");
    v261[3] = (uint64_t)v114;
    getSRKeyboardMetricProbabilityDeleteToDeleteKeySymbolLoc_ptr = (uint64_t)v114;
  }
  _Block_object_dispose(&v260, 8);
  if (!v114)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteToDeleteMetric, *v114);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v116 = (id *)getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr)
  {
    v117 = (void *)SensorKitLibrary();
    v116 = (id *)dlsym(v117, "SRKeyboardMetricProbabilityDeleteToShiftKey");
    v261[3] = (uint64_t)v116;
    getSRKeyboardMetricProbabilityDeleteToShiftKeySymbolLoc_ptr = (uint64_t)v116;
  }
  _Block_object_dispose(&v260, 8);
  if (!v116)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteToShiftMetric, *v116);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v118 = (id *)getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr)
  {
    v119 = (void *)SensorKitLibrary();
    v118 = (id *)dlsym(v119, "SRKeyboardMetricProbabilityDeleteTo123KeyKey");
    v261[3] = (uint64_t)v118;
    getSRKeyboardMetricProbabilityDeleteTo123KeyKeySymbolLoc_ptr = (uint64_t)v118;
  }
  _Block_object_dispose(&v260, 8);
  if (!v118)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteTo123Metric, *v118);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v120 = (id *)getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr)
  {
    v121 = (void *)SensorKitLibrary();
    v120 = (id *)dlsym(v121, "SRKeyboardMetricProbabilityPathErrorDistanceKey");
    v261[3] = (uint64_t)v120;
    getSRKeyboardMetricProbabilityPathErrorDistanceKeySymbolLoc_ptr = (uint64_t)v120;
  }
  _Block_object_dispose(&v260, 8);
  if (!v120)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKPathErrorDistanceMetric, *v120);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v122 = (id *)getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr)
  {
    v123 = (void *)SensorKitLibrary();
    v122 = (id *)dlsym(v123, "SRKeyboardMetricProbabilityDeleteToPathKey");
    v261[3] = (uint64_t)v122;
    getSRKeyboardMetricProbabilityDeleteToPathKeySymbolLoc_ptr = (uint64_t)v122;
  }
  _Block_object_dispose(&v260, 8);
  if (!v122)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteToPathMetric, *v122);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v124 = (id *)getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr)
  {
    v125 = (void *)SensorKitLibrary();
    v124 = (id *)dlsym(v125, "SRKeyboardMetricProbabilityPathToDeleteKey");
    v261[3] = (uint64_t)v124;
    getSRKeyboardMetricProbabilityPathToDeleteKeySymbolLoc_ptr = (uint64_t)v124;
  }
  _Block_object_dispose(&v260, 8);
  if (!v124)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKPathToDeleteMetric, *v124);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v126 = (id *)getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr)
  {
    v127 = (void *)SensorKitLibrary();
    v126 = (id *)dlsym(v127, "SRKeyboardMetricProbabilitySpaceToPathKey");
    v261[3] = (uint64_t)v126;
    getSRKeyboardMetricProbabilitySpaceToPathKeySymbolLoc_ptr = (uint64_t)v126;
  }
  _Block_object_dispose(&v260, 8);
  if (!v126)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKSpaceToPathMetric, *v126);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v128 = (id *)getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr)
  {
    v129 = (void *)SensorKitLibrary();
    v128 = (id *)dlsym(v129, "SRKeyboardMetricProbabilityPathToSpaceKey");
    v261[3] = (uint64_t)v128;
    getSRKeyboardMetricProbabilityPathToSpaceKeySymbolLoc_ptr = (uint64_t)v128;
  }
  _Block_object_dispose(&v260, 8);
  if (!v128)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKPathSpaceMetric, *v128);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v130 = (id *)getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr)
  {
    v131 = (void *)SensorKitLibrary();
    v130 = (id *)dlsym(v131, "SRKeyboardMetricProbabilityPathToPathKey");
    v261[3] = (uint64_t)v130;
    getSRKeyboardMetricProbabilityPathToPathKeySymbolLoc_ptr = (uint64_t)v130;
  }
  _Block_object_dispose(&v260, 8);
  if (!v130)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKPathToPathMetric, *v130);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v132 = (id *)getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr)
  {
    v133 = (void *)SensorKitLibrary();
    v132 = (id *)dlsym(v133, "SRKeyboardMetricScalarMidPathPauseKey");
    v261[3] = (uint64_t)v132;
    getSRKeyboardMetricScalarMidPathPauseKeySymbolLoc_ptr = (uint64_t)v132;
  }
  _Block_object_dispose(&v260, 8);
  if (!v132)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKMidPathPause, *v132);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v134 = (id *)getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr)
  {
    v135 = (void *)SensorKitLibrary();
    v134 = (id *)dlsym(v135, "SRKeyboardMetricPositionalDeleteToDeleteKey");
    v261[3] = (uint64_t)v134;
    getSRKeyboardMetricPositionalDeleteToDeleteKeySymbolLoc_ptr = (uint64_t)v134;
  }
  _Block_object_dispose(&v260, 8);
  if (!v134)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKDeleteToDeletePositionalMetric, *v134);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v136 = (id *)getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr)
  {
    v137 = (void *)SensorKitLibrary();
    v136 = (id *)dlsym(v137, "SRKeyboardMetricProbabilityAnyTapTo123KeyKey");
    v261[3] = (uint64_t)v136;
    getSRKeyboardMetricProbabilityAnyTapTo123KeyKeySymbolLoc_ptr = (uint64_t)v136;
  }
  _Block_object_dispose(&v260, 8);
  if (!v136)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKAnyTapTo123Metric, *v136);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v138 = (id *)getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr)
  {
    v139 = (void *)SensorKitLibrary();
    v138 = (id *)dlsym(v139, "SRKeyboardMetricProbabilityCharKeyTo123KeyKey");
    v261[3] = (uint64_t)v138;
    getSRKeyboardMetricProbabilityCharKeyTo123KeyKeySymbolLoc_ptr = (uint64_t)v138;
  }
  _Block_object_dispose(&v260, 8);
  if (!v138)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKCharTo123Metric, *v138);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v140 = (id *)getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr)
  {
    v141 = (void *)SensorKitLibrary();
    v140 = (id *)dlsym(v141, "SRKeyboardMetricProbability123KeyToAnyTapKey");
    v261[3] = (uint64_t)v140;
    getSRKeyboardMetricProbability123KeyToAnyTapKeySymbolLoc_ptr = (uint64_t)v140;
  }
  _Block_object_dispose(&v260, 8);
  if (!v140)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISK123ToAnyTapMetric, *v140);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v142 = (id *)getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr)
  {
    v143 = (void *)SensorKitLibrary();
    v142 = (id *)dlsym(v143, "SRKeyboardMetricProbability123KeyToCharKeyKey");
    v261[3] = (uint64_t)v142;
    getSRKeyboardMetricProbability123KeyToCharKeyKeySymbolLoc_ptr = (uint64_t)v142;
  }
  _Block_object_dispose(&v260, 8);
  if (!v142)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISK123ToCharMetric, *v142);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v144 = (id *)getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr)
  {
    v145 = (void *)SensorKitLibrary();
    v144 = (id *)dlsym(v145, "SRKeyboardMetricScalarlWordBucketAbsolutistKey");
    v261[3] = (uint64_t)v144;
    getSRKeyboardMetricScalarlWordBucketAbsolutistKeySymbolLoc_ptr = (uint64_t)v144;
  }
  _Block_object_dispose(&v260, 8);
  if (!v144)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalAbsolutistWords, *v144);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v146 = (id *)getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr)
  {
    v147 = (void *)SensorKitLibrary();
    v146 = (id *)dlsym(v147, "SRKeyboardMetricScalarlWordBucketDownKey");
    v261[3] = (uint64_t)v146;
    getSRKeyboardMetricScalarlWordBucketDownKeySymbolLoc_ptr = (uint64_t)v146;
  }
  _Block_object_dispose(&v260, 8);
  if (!v146)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalDownWords, *v146);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v148 = (id *)getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr)
  {
    v149 = (void *)SensorKitLibrary();
    v148 = (id *)dlsym(v149, "SRKeyboardMetricScalarlWordBucketDeathKey");
    v261[3] = (uint64_t)v148;
    getSRKeyboardMetricScalarlWordBucketDeathKeySymbolLoc_ptr = (uint64_t)v148;
  }
  _Block_object_dispose(&v260, 8);
  if (!v148)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalDeathWords, *v148);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v150 = (id *)getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr)
  {
    v151 = (void *)SensorKitLibrary();
    v150 = (id *)dlsym(v151, "SRKeyboardMetricScalarlWordBucketAnxietyKey");
    v261[3] = (uint64_t)v150;
    getSRKeyboardMetricScalarlWordBucketAnxietyKeySymbolLoc_ptr = (uint64_t)v150;
  }
  _Block_object_dispose(&v260, 8);
  if (!v150)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalAnxietyWords, *v150);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v152 = (id *)getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr)
  {
    v153 = (void *)SensorKitLibrary();
    v152 = (id *)dlsym(v153, "SRKeyboardMetricScalarlWordBucketAngerKey");
    v261[3] = (uint64_t)v152;
    getSRKeyboardMetricScalarlWordBucketAngerKeySymbolLoc_ptr = (uint64_t)v152;
  }
  _Block_object_dispose(&v260, 8);
  if (!v152)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalAngerWords, *v152);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v154 = (id *)getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr)
  {
    v155 = (void *)SensorKitLibrary();
    v154 = (id *)dlsym(v155, "SRKeyboardMetricScalarlWordBucketFeelKey");
    v261[3] = (uint64_t)v154;
    getSRKeyboardMetricScalarlWordBucketFeelKeySymbolLoc_ptr = (uint64_t)v154;
  }
  _Block_object_dispose(&v260, 8);
  if (!v154)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalHealthFeelingWords, *v154);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v156 = (id *)getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr)
  {
    v157 = (void *)SensorKitLibrary();
    v156 = (id *)dlsym(v157, "SRKeyboardMetricScalarWordBucketPositiveKey");
    v261[3] = (uint64_t)v156;
    getSRKeyboardMetricScalarWordBucketPositiveKeySymbolLoc_ptr = (uint64_t)v156;
  }
  _Block_object_dispose(&v260, 8);
  if (!v156)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalPositiveWords, *v156);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v158 = (id *)getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr)
  {
    v159 = (void *)SensorKitLibrary();
    v158 = (id *)dlsym(v159, "SRKeyboardMetricScalarEmojiBucketPositiveKey");
    v261[3] = (uint64_t)v158;
    getSRKeyboardMetricScalarEmojiBucketPositiveKeySymbolLoc_ptr = (uint64_t)v158;
  }
  _Block_object_dispose(&v260, 8);
  if (!v158)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalPositiveEmoji, *v158);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v160 = (id *)getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr)
  {
    v161 = (void *)SensorKitLibrary();
    v160 = (id *)dlsym(v161, "SRKeyboardMetricScalarEmojiBucketSadKey");
    v261[3] = (uint64_t)v160;
    getSRKeyboardMetricScalarEmojiBucketSadKeySymbolLoc_ptr = (uint64_t)v160;
  }
  _Block_object_dispose(&v260, 8);
  if (!v160)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalSadEmoji, *v160);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v162 = (id *)getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr)
  {
    v163 = (void *)SensorKitLibrary();
    v162 = (id *)dlsym(v163, "SRKeyboardMetricScalarEmojiBucketAnxietyKey");
    v261[3] = (uint64_t)v162;
    getSRKeyboardMetricScalarEmojiBucketAnxietyKeySymbolLoc_ptr = (uint64_t)v162;
  }
  _Block_object_dispose(&v260, 8);
  if (!v162)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalAnxietyEmoji, *v162);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v164 = (id *)getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr)
  {
    v165 = (void *)SensorKitLibrary();
    v164 = (id *)dlsym(v165, "SRKeyboardMetricScalarEmojiBucketAngerKey");
    v261[3] = (uint64_t)v164;
    getSRKeyboardMetricScalarEmojiBucketAngerKeySymbolLoc_ptr = (uint64_t)v164;
  }
  _Block_object_dispose(&v260, 8);
  if (!v164)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalAngerEmoji, *v164);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v166 = (id *)getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr)
  {
    v167 = (void *)SensorKitLibrary();
    v166 = (id *)dlsym(v167, "SRKeyboardMetricScalarEmojiBucketFeelKey");
    v261[3] = (uint64_t)v166;
    getSRKeyboardMetricScalarEmojiBucketFeelKeySymbolLoc_ptr = (uint64_t)v166;
  }
  _Block_object_dispose(&v260, 8);
  if (!v166)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalFeelEmoji, *v166);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v168 = (id *)getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr)
  {
    v169 = (void *)SensorKitLibrary();
    v168 = (id *)dlsym(v169, "SRKeyboardMetricScalarEmojiBucketLowEnergyKey");
    v261[3] = (uint64_t)v168;
    getSRKeyboardMetricScalarEmojiBucketLowEnergyKeySymbolLoc_ptr = (uint64_t)v168;
  }
  _Block_object_dispose(&v260, 8);
  if (!v168)
    goto LABEL_260;
  objc_storeStrong((id *)&kTISKtotalLowEnergyEmoji, *v168);
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v170 = (id *)getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr;
  v263 = getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr;
  if (!getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr)
  {
    v171 = (void *)SensorKitLibrary();
    v170 = (id *)dlsym(v171, "SRKeyboardMetricScalarEmojiBucketConfusedKey");
    v261[3] = (uint64_t)v170;
    getSRKeyboardMetricScalarEmojiBucketConfusedKeySymbolLoc_ptr = (uint64_t)v170;
  }
  _Block_object_dispose(&v260, 8);
  if (!v170)
  {
LABEL_260:
    dlerror();
    abort_report_np();
  }
  objc_storeStrong((id *)&kTISKtotalConfusedEmoji, *v170);
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfWordsCounter, 0);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v264[0] = v259;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfAlteredWordsCounter, 0);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v264[1] = v258;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfTappedKeysCounter, 0);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v264[2] = v257;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfDragsCounter, 0);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v264[3] = v256;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKTotalSessionTypingDuration, 0);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v264[4] = v255;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKTypingPauses, 0);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  v264[5] = v254;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKEpisodeCount, 0);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v264[6] = v253;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKTapTypingSpeed, 2);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  v264[7] = v252;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKPathTypingSpeed, 2);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v264[8] = v251;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKUpErrorDistance, 1, &kErrorDistanceDefintion);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  v264[9] = v250;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDownErrorDistance, 1, &kErrorDistanceDefintion);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v264[10] = v249;
  +[TISKMetricDefinition _makeMetric:type:metricDef:size:](TISKMetricDefinition, "_makeMetric:type:metricDef:size:", kTISKLongWordPositionalUpErrorDistance, 3, &kErrorDistanceDefintion, 6);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v264[11] = v248;
  +[TISKMetricDefinition _makeMetric:type:metricDef:size:isPointMetric:](TISKMetricDefinition, "_makeMetric:type:metricDef:size:isPointMetric:", kTISKLongWordPositionalDownErrorDistance, 3, &kErrorDistanceDefintion, 6, 1);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  v264[12] = v247;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKShortWordCharUpErrorDistance, 1, &kErrorDistanceDefintion);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v264[13] = v246;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKShortWordCharDownErrorDistance, 1, &kErrorDistanceDefintion);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v264[14] = v245;
  +[TISKMetricDefinition _makeMetric:type:metricDef:isPointMetric:](TISKMetricDefinition, "_makeMetric:type:metricDef:isPointMetric:", kTISKSpaceUpErrorDistance, 1, &kErrorDistanceDefintion, 1);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v264[15] = v244;
  +[TISKMetricDefinition _makeMetric:type:metricDef:isPointMetric:](TISKMetricDefinition, "_makeMetric:type:metricDef:isPointMetric:", kTISKSpaceDownErrorDistance, 1, &kErrorDistanceDefintion, 1);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v264[16] = v243;
  +[TISKMetricDefinition _makeMetric:type:metricDef:isPointMetric:](TISKMetricDefinition, "_makeMetric:type:metricDef:isPointMetric:", kTISKDeleteUpErrorDistance, 1, &kErrorDistanceDefintion, 1);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v264[17] = v242;
  +[TISKMetricDefinition _makeMetric:type:metricDef:isPointMetric:](TISKMetricDefinition, "_makeMetric:type:metricDef:isPointMetric:", kTISKDeleteDownErrorDistance, 1, &kErrorDistanceDefintion, 1);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v264[18] = v241;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfAutoCorrections, 0);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v264[19] = v240;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfSpaceCorrections, 0);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v264[20] = v239;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfRetroCorrections, 0);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v264[21] = v238;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfTranspositionCorrections, 0);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v264[22] = v237;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfInsertKeyCorrections, 0);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v264[23] = v236;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfSkipTouchCorrections, 0);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v264[24] = v235;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfNearKeyCorrections, 0);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v264[25] = v234;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfSubstitutionCorrections, 0);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v264[26] = v233;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfHitTestCorrections, 0);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v264[27] = v232;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKTouchDownUpMetric, 1, &kTouchDownUpDefintion);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v264[28] = v231;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKTouchDownDownMetric, 1, &kTouchDownDownDefintion);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v264[29] = v230;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKTouchUpDownMetric, 1, &kTouchUpDownDefintion);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v264[30] = v229;
  +[TISKMetricDefinition _makeMetric:type:metricDef:size:](TISKMetricDefinition, "_makeMetric:type:metricDef:size:", kTISKLongWordTouchDownUpPositionalMetric, 3, &kTouchDownUpDefintion, 6);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v264[31] = v228;
  +[TISKMetricDefinition _makeMetric:type:metricDef:size:](TISKMetricDefinition, "_makeMetric:type:metricDef:size:", kTISKLongWordTouchDownDownPositionalMetric, 3, &kTouchDownDownDefintion, 6);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v264[32] = v227;
  +[TISKMetricDefinition _makeMetric:type:metricDef:size:](TISKMetricDefinition, "_makeMetric:type:metricDef:size:", kTISKLongWordTouchUpDownPositionalMetric, 3, &kTouchDownUpDefintion, 6);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v264[33] = v226;
  +[TISKMetricDefinition _makeMetric:type:metricDef:size:](TISKMetricDefinition, "_makeMetric:type:metricDef:size:", kTISKDeleteToDeletePositionalMetric, 3, &kTouchDownUpDefintion, 5);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v264[34] = v225;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKShortWordCharTouchDownUpMetric, 1, &kTouchDownUpDefintion);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v264[35] = v224;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKShortWordCharToCharMetric, 1, &kTouchDownDownDefintion);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v264[36] = v223;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKCharToAnyTapMetric, 1, &kTouchDownDownDefintion);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v264[37] = v222;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKAnyTapToCharMetric, 1, &kTouchDownDownDefintion);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v264[38] = v221;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKCharToPredictionMetric, 1, &kTouchDownDownDefintion);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v264[39] = v220;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKShortWordCharTouchUpDownMetric, 1, &kTouchUpDownDefintion);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v264[40] = v219;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceTouchDownUpMetric, 1, &kTouchDownUpDefintion);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v264[41] = v218;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceToCharMetric, 1, &kTouchDownDownDefintion);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v264[42] = v217;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKCharToSpaceMetric, 1, &kTouchDownDownDefintion);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v264[43] = v216;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceToDeleteMetric, 1, &kTouchDownDownDefintion);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v264[44] = v215;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDeleteToSpaceMetric, 1, &kTouchDownDownDefintion);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v264[45] = v214;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceToSpaceMetric, 1, &kTouchDownDownDefintion);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v264[46] = v213;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceToPredictionMetric, 1, &kTouchDownDownDefintion);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v264[47] = v212;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceToShiftMetric, 1, &kTouchDownDownDefintion);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v264[48] = v211;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceTo123Metric, 1, &kTouchDownDownDefintion);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v264[49] = v210;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfDeletesCounter, 0);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v264[50] = v209;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDeleteTouchDownUpMetric, 1, &kTouchDownUpDefintion);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v264[51] = v208;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDeleteToCharMetric, 1, &kTouchDownDownDefintion);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v264[52] = v207;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKKeyToDeleteMetric, 1, &kTouchDownDownDefintion);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v264[53] = v206;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDeleteToDeleteMetric, 1, &kTouchDownDownDefintion);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v264[54] = v205;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDeleteToShiftMetric, 1, &kTouchDownDownDefintion);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v264[55] = v204;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDeleteTo123Metric, 1, &kTouchDownDownDefintion);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v264[56] = v203;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfPaths, 0);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v264[57] = v202;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKTotalPathTime, 0);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v264[58] = v201;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKTotalPathLength, 0);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v264[59] = v200;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKMidPathPause, 0);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v264[60] = v199;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKNumberOfEmojiCounter, 0);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v264[61] = v198;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKPathErrorDistanceMetric, 1, &kPathErrorDistanceDefintion);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v264[62] = v197;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKPathToPathMetric, 1, &kTouchDownDownDefintion);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v264[63] = v196;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKDeleteToPathMetric, 1, &kTouchDownDownDefintion);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v264[64] = v195;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKPathToDeleteMetric, 1, &kTouchDownDownDefintion);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v264[65] = v194;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKSpaceToPathMetric, 1, &kTouchDownDownDefintion);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v264[66] = v193;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKPathSpaceMetric, 1, &kTouchDownDownDefintion);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v264[67] = v192;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKAnyTapTo123Metric, 1, &kTouchDownDownDefintion);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v264[68] = v191;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISKCharTo123Metric, 1, &kTouchDownDownDefintion);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v264[69] = v190;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISK123ToAnyTapMetric, 1, &kTouchDownDownDefintion);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v264[70] = v189;
  +[TISKMetricDefinition _makeMetric:type:metricDef:](TISKMetricDefinition, "_makeMetric:type:metricDef:", kTISK123ToCharMetric, 1, &kTouchDownDownDefintion);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v264[71] = v188;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalAbsolutistWords, 0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v264[72] = v187;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalDownWords, 0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v264[73] = v186;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalDeathWords, 0);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v264[74] = v185;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalAnxietyWords, 0);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v264[75] = v184;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalAngerWords, 0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v264[76] = v172;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalHealthFeelingWords, 0);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v264[77] = v173;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalPositiveWords, 0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v264[78] = v174;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalPositiveEmoji, 0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v264[79] = v175;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalSadEmoji, 0);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v264[80] = v176;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalAnxietyEmoji, 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v264[81] = v177;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalAngerEmoji, 0);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v264[82] = v178;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalFeelEmoji, 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v264[83] = v179;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalLowEnergyEmoji, 0);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v264[84] = v180;
  +[TISKMetricDefinition _makeMetric:type:](TISKMetricDefinition, "_makeMetric:type:", kTISKtotalConfusedEmoji, 0);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v264[85] = v181;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v264, 86);
  v182 = objc_claimAutoreleasedReturnValue();
  v183 = (void *)metricDefinitions_defs;
  metricDefinitions_defs = v182;

}

@end
