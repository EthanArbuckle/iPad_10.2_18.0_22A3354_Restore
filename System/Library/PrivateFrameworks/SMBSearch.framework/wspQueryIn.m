@implementation wspQueryIn

- (wspQueryIn)initWithCtx:(id)a3
{
  id v5;
  char *v6;
  wspQueryIn *v7;
  uint64_t v8;
  cNodeRestriction *primaryCnodeRestriction;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)wspQueryIn;
  v6 = -[wspQueryIn init](&v19, sel_init);
  v7 = (wspQueryIn *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_227C48C70;
    objc_storeStrong((id *)v6 + 3, a3);
    -[wspQueryIn makePrimaryCnodeRestriction](v7, "makePrimaryCnodeRestriction");
    v8 = objc_claimAutoreleasedReturnValue();
    primaryCnodeRestriction = v7->_primaryCnodeRestriction;
    v7->_primaryCnodeRestriction = (cNodeRestriction *)v8;

    if (!v7->_primaryCnodeRestriction)
    {
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v10)
        -[wspQueryIn initWithCtx:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

      v7 = 0;
    }
  }

  return v7;
}

- (id)makePrimaryCnodeRestriction
{
  cPropertyRestriction *v2;
  fullPropSpec *v3;
  cbaseVariant *v4;
  cRestriction *v5;
  cPropertyRestriction *v6;
  fullPropSpec *v7;
  cbaseVariant *v8;
  cNodeRestriction *v9;
  cNodeRestriction *v10;
  fullPropSpec *v11;
  void *v12;
  cbaseVariant *v13;
  fullPropSpec *v14;
  fullPropSpec *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  cbaseVariant *v22;
  id v23;
  cbaseVariant *v24;
  void *v25;
  uint64_t v26;
  cNodeRestriction *v27;
  cNodeRestriction *v28;
  cbaseVariant *v29;
  void *v30;
  fullPropSpec *v31;
  cPropertyRestriction *v32;
  void *v34;
  cbaseVariant *v35;
  fullPropSpec *v36;
  uint64_t v37;
  fullPropSpec *v38;

  v2 = -[cPropertyRestriction initWithRelop:Weight:]([cPropertyRestriction alloc], "initWithRelop:Weight:", 516, 1000);
  v3 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 17);
  v4 = objc_alloc_init(cbaseVariant);
  v37 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("superhidden"), 0);
  -[cbaseVariant setVectorWithType:ValueArray:](v4, "setVectorWithType:ValueArray:", 31);
  v38 = v3;
  -[cPropertyRestriction setPropSpec:](v2, "setPropSpec:", v3);
  v35 = v4;
  -[cPropertyRestriction setPrVal:](v2, "setPrVal:", v4);
  v5 = -[cRestriction initWithType:Weight:]([cRestriction alloc], "initWithType:Weight:", 3, 1000);
  -[cRestriction setRestriction:](v5, "setRestriction:", v2);
  v6 = -[cPropertyRestriction initWithRelop:Weight:]([cPropertyRestriction alloc], "initWithRelop:Weight:", 5, 1000);
  v7 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 18);
  v8 = objc_alloc_init(cbaseVariant);
  -[cbaseVariant setStringType:UTF8Str:](v8, "setStringType:UTF8Str:", 31, CFSTR("true"));
  v36 = v7;
  -[cPropertyRestriction setPropSpec:](v6, "setPropSpec:", v7);
  -[cPropertyRestriction setPrVal:](v6, "setPrVal:", v8);
  v9 = -[cNodeRestriction initWithType:Weight:]([cNodeRestriction alloc], "initWithType:Weight:", 1, 1000);
  if (!-[cNodeRestriction appendRestriction:](v9, "appendRestriction:", v5))
  {
    if (-[cNodeRestriction appendRestriction:](v9, "appendRestriction:", v6))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryIn makePrimaryCnodeRestriction].cold.4();
      goto LABEL_7;
    }
    v32 = -[cPropertyRestriction initWithRelop:Weight:]([cPropertyRestriction alloc], "initWithRelop:Weight:", 4, 1000);
    v16 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 19);
    -[wspQueryIn wctx](self, "wctx");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serverAddress");
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v18;
    v31 = v16;
    if (!v18)
    {
      -[wspQueryIn wctx](self, "wctx");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serverName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "hasSuffix:", CFSTR(".local")))
      {
        objc_msgSend(v19, "substringToIndex:", objc_msgSend(v19, "length") - 6);
        v21 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v21;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        -[wspQueryIn makePrimaryCnodeRestriction].cold.3();
    }
    v22 = objc_alloc_init(cbaseVariant);
    v23 = objc_alloc(MEMORY[0x24BDD17C8]);
    v24 = v22;
    -[wspContext searchPath](self->_wctx, "searchPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v19;
    v26 = objc_msgSend(v23, "initWithFormat:", CFSTR("file://%@/%@/"), v19, v25);

    v34 = (void *)v26;
    -[cbaseVariant setStringType:UTF8Str:](v24, "setStringType:UTF8Str:", 31, v26);
    -[cPropertyRestriction setPropSpec:](v32, "setPropSpec:", v16);
    -[cPropertyRestriction setPrVal:](v32, "setPrVal:", v24);
    v27 = -[cNodeRestriction initWithType:Weight:]([cNodeRestriction alloc], "initWithType:Weight:", 1, 1000);
    v28 = v27;
    v29 = v24;
    if (-[cNodeRestriction appendRestriction:](v27, "appendRestriction:", v9))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryIn makePrimaryCnodeRestriction].cold.2();
      v10 = 0;
    }
    else
    {
      if (-[cNodeRestriction appendRestriction:](v27, "appendRestriction:", v32))
      {
        v12 = (void *)v37;
        v11 = v38;
        v13 = v35;
        v14 = v36;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspQueryIn makePrimaryCnodeRestriction].cold.1();
        v10 = 0;
        goto LABEL_23;
      }
      v10 = v27;
    }
    v12 = (void *)v37;
    v11 = v38;
    v13 = v35;
    v14 = v36;
LABEL_23:

    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[wspQueryIn makePrimaryCnodeRestriction].cold.5();
LABEL_7:
  v10 = 0;
  v12 = (void *)v37;
  v11 = v38;
  v13 = v35;
  v14 = v36;
LABEL_8:

  return v10;
}

- (id)makeSecondaryCnodeRestriction
{
  reuseWhereRestriction *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  cnodeBuilder *v7;
  cnodeBuilder *v8;
  void *v9;
  char v10;
  cCoercionRestriction *v11;
  cPropertyRestriction *v12;
  fullPropSpec *v13;
  cnodeBuilder *v14;
  void *v15;
  char v16;
  cnodeBuilder *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  cPropertyRestriction *v22;
  void *v23;
  fullPropSpec *v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  cContentRestriction *v41;
  cbaseVariant *v42;
  void *v43;
  id v44;
  cnodeBuilder *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  cbaseVariant *v51;
  void *v52;
  id v53;
  char *v54;
  cCoercionRestriction *v55;
  cbaseVariant *v56;
  cPropertyRestriction *v57;
  void *v58;
  char *v59;
  char *v60;
  fullPropSpec *v61;
  cCoercionRestriction *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  cCoercionRestriction *v66;
  char *v67;
  cContentRestriction *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  cContentRestriction *v72;
  fullPropSpec *v73;
  void *v74;
  fullPropSpec *v75;
  cCoercionRestriction *v76;
  _BOOL8 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  fullPropSpec *v85;
  wspQueryIn *v86;
  cContentRestriction *v87;
  void *v88;
  void *v89;
  int v90;
  _BOOL8 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _BOOL8 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  fullPropSpec *v107;
  void *v108;
  uint64_t v109;
  id v110;
  cbaseVariant *v111;
  _BOOL8 v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _BOOL8 v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _BOOL8 v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _BOOL8 v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _BOOL8 v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  _BOOL8 v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _BOOL8 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  _BOOL8 v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  _BOOL8 v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _BOOL8 v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  cCoercionRestriction *v192;
  _BOOL8 v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  _BOOL8 v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  _BOOL8 v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  char *v225;
  wspQueryIn *v226;
  wspQueryIn *v227;
  uint64_t v228;
  cPropertyRestriction *v229;
  cPropertyRestriction *v230;
  cnodeBuilder *v231;
  cnodeBuilder *v232;
  cnodeBuilder *v233;
  cContentRestriction *obj;
  id obja;
  char *objb;
  char *v237;
  id v238;
  void *v239;
  uint64_t v240;
  cnodeBuilder *v241;
  cnodeBuilder *v242;
  cbaseVariant *v243;
  id v244;
  fullPropSpec *v245;
  cCoercionRestriction *v246;
  fullPropSpec *v247;
  id v248;
  id v249;
  id v250;
  void *v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  _BYTE v263[128];
  _BYTE v264[128];
  uint64_t v265;

  v265 = *MEMORY[0x24BDAC8D0];
  v261 = 0;
  v262 = 0;
  v260 = 0;
  v3 = [reuseWhereRestriction alloc];
  -[wspQueryIn wctx](self, "wctx");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[reuseWhereRestriction initWithReuseWhereID:Weight:](v3, "initWithReuseWhereID:Weight:", objc_msgSend(v4, "whereID"), 1000);

  v251 = (void *)v5;
  if (!v5)
  {
    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v25)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_15;
  }
  v6 = 0x24F061000uLL;
  v7 = -[cnodeBuilder initWithType:Weight:]([cnodeBuilder alloc], "initWithType:Weight:", 1, 1000);
  if (!v7)
  {
    v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v33)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);
LABEL_15:
    v248 = 0;
    v11 = 0;
    v41 = 0;
    v42 = 0;
    v22 = 0;
    v24 = 0;
    v43 = 0;
    v44 = 0;
    v23 = 0;
    v17 = 0;
    v8 = 0;
    goto LABEL_16;
  }
  v8 = v7;
  -[wspQueryIn wctx](self, "wctx");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "queryType");

  if ((v10 & 2) == 0)
  {
    v11 = 0;
    v243 = 0;
    v12 = 0;
    v13 = 0;
    v239 = 0;
    v14 = 0;
    goto LABEL_5;
  }
  v46 = -[cnodeBuilder initWithType:Weight:]([cnodeBuilder alloc], "initWithType:Weight:", 2, 1000);
  if (!v46)
  {
    v77 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v77)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.15(v77, v78, v79, v80, v81, v82, v83, v84);
    v248 = 0;
    v11 = 0;
    v41 = 0;
    v42 = 0;
    v22 = 0;
    v24 = 0;
    v43 = 0;
    v44 = 0;
    v23 = 0;
    v17 = 0;
    goto LABEL_16;
  }
  v17 = v46;
  v258 = 0u;
  v259 = 0u;
  v256 = 0u;
  v257 = 0u;
  -[wspQueryIn wctx](self, "wctx");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "fnamePatterns");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v256, v264, 16);
  if (!v49)
  {

    v43 = 0;
    v24 = 0;
    v22 = 0;
    v51 = 0;
    v11 = 0;
    goto LABEL_57;
  }
  v232 = v8;
  obja = v48;
  v226 = self;
  v50 = 0;
  v11 = 0;
  v51 = 0;
  v12 = 0;
  v13 = 0;
  v52 = 0;
  v53 = 0;
  v240 = *(_QWORD *)v257;
  v241 = v17;
  do
  {
    v54 = 0;
    v237 = (char *)v49;
    v224 = v50;
    v228 = v50 + v49;
    v55 = v11;
    v56 = v51;
    v57 = v12;
    v24 = v13;
    v249 = v52;
    v58 = v53;
    do
    {
      v246 = v55;
      if (*(_QWORD *)v257 != v240)
      {
        v59 = v54;
        objc_enumerationMutation(obja);
        v54 = v59;
      }
      v60 = v54;
      v244 = *(id *)(*((_QWORD *)&v256 + 1) + 8 * (_QWORD)v54);

      v61 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 23);
      v24 = v61;
      if (!v61)
      {
        v112 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v112)
          -[wspQueryIn makeSecondaryCnodeRestriction].cold.17(v112, v113, v114, v115, v116, v117, v118, v119);
LABEL_71:
        v8 = v232;
        v43 = v249;
LABEL_75:

        v248 = 0;
        v41 = 0;
        v23 = 0;
        v44 = v244;
        v11 = v246;
        v42 = v56;
        v22 = v57;
        v17 = v241;
        goto LABEL_16;
      }
      v12 = -[cPropertyRestriction initWithRelop:Weight:]([cPropertyRestriction alloc], "initWithRelop:Weight:", 6, 1000);

      if (!v12)
      {
        v120 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v120)
          -[wspQueryIn makeSecondaryCnodeRestriction].cold.18(v120, v121, v122, v123, v124, v125, v126, v127);
        v57 = 0;
        goto LABEL_71;
      }
      v53 = v244;
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("*%@*"), v244);

      v51 = objc_alloc_init(cbaseVariant);
      -[cbaseVariant setStringType:UTF8Str:](v51, "setStringType:UTF8Str:", 31, v43);
      v13 = v24;
      -[cPropertyRestriction setPropSpec:](v12, "setPropSpec:", v24);
      -[cPropertyRestriction setPrVal:](v12, "setPrVal:", v51);
      v62 = -[cCoercionRestriction initWithOp:FValue:Weight:]([cCoercionRestriction alloc], "initWithOp:FValue:Weight:", 12, 1148846080, 1000);

      if (!v62)
      {
        v128 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v128)
          -[wspQueryIn makeSecondaryCnodeRestriction].cold.19(v128, v129, v130, v131, v132, v133, v134, v135);
        v246 = 0;
        v56 = v51;
        v57 = v12;
        v8 = v232;
        goto LABEL_75;
      }
      -[cCoercionRestriction setRestriction:](v62, "setRestriction:", v12);
      -[cnodeBuilder appendRestriction:](v241, "appendRestriction:", v62);
      v54 = v60 + 1;
      v55 = v62;
      v56 = v51;
      v11 = v62;
      v57 = v12;
      v249 = v43;
      v52 = v43;
      v58 = v244;
    }
    while (v237 != v54);
    v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v256, v264, 16);
    v50 = v228;
  }
  while (v49);
  v239 = v52;

  if (&v237[v224] == (char *)1)
  {
    v243 = v51;
    v17 = v241;
    -[cnodeBuilder rootNode](v241, "rootNode");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "restrictArray");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "objectAtIndex:", 0);
    v203 = objc_claimAutoreleasedReturnValue();

    v8 = v232;
    self = v226;
    if (v203)
    {
      -[cnodeBuilder appendRestriction:](v232, "appendRestriction:", v203);
      v11 = (cCoercionRestriction *)v203;
      goto LABEL_113;
    }
    v24 = v13;
    v22 = v12;
    v205 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v205)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.20(v205, v206, v207, v208, v209, v210, v211, v212);
    v248 = 0;
    v11 = 0;
    v41 = 0;
    goto LABEL_83;
  }
  v8 = v232;
  v17 = v241;
  self = v226;
  if (!&v237[v224])
  {
    v24 = v13;
    v22 = v12;
    v43 = v52;
LABEL_57:
    v42 = v51;
    v91 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v91)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.16(v91, v92, v93, v94, v95, v96, v97, v98);
    v248 = 0;
    v41 = 0;
    v44 = 0;
    v23 = 0;
    goto LABEL_16;
  }
  v243 = v51;
  -[cnodeBuilder rootNode](v241, "rootNode");
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  -[cnodeBuilder appendRestriction:](v232, "appendRestriction:", v204);

LABEL_113:
  v14 = v17;
  v6 = 0x24F061000;
LABEL_5:
  -[wspQueryIn wctx](self, "wctx");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "queryType");

  if ((v16 & 4) == 0)
  {
    obj = 0;
    v17 = v14;
    goto LABEL_7;
  }
  v17 = (cnodeBuilder *)objc_msgSend(objc_alloc(*(Class *)(v6 + 2128)), "initWithType:Weight:", 2, 1000);

  if (!v17)
  {
    v24 = v13;
    v22 = v12;
    v99 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v99)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.8(v99, v100, v101, v102, v103, v104, v105, v106);
    v248 = 0;
    v41 = 0;
    v44 = 0;
    v23 = 0;
    v17 = 0;
    goto LABEL_84;
  }
  v254 = 0u;
  v255 = 0u;
  v252 = 0u;
  v253 = 0u;
  -[wspQueryIn wctx](self, "wctx");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "fextPatterns");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v252, v263, 16);
  if (!v65)
  {
    v24 = v13;

    v41 = 0;
    v43 = v239;
LABEL_77:
    v22 = v12;
    v136 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v136)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.9(v136, v137, v138, v139, v140, v141, v142, v143);
    v248 = 0;
    v44 = 0;
    v23 = 0;
    goto LABEL_85;
  }
  v238 = v64;
  v227 = self;
  v229 = v12;
  v66 = v11;
  v242 = v17;
  v233 = v8;
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v247 = v13;
  v250 = *(id *)v253;
  while (2)
  {
    v70 = 0;
    v71 = v65;
    v225 = v67;
    objb = &v67[v65];
    v11 = v66;
    v72 = v68;
    v73 = v247;
    v74 = v69;
    while (2)
    {
      if (*(id *)v253 != v250)
        objc_enumerationMutation(v238);
      v44 = *(id *)(*((_QWORD *)&v252 + 1) + 8 * v70);

      v75 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 24);
      v247 = v75;
      if (!v75)
      {
        v168 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v43 = v239;
        if (v168)
          -[wspQueryIn makeSecondaryCnodeRestriction].cold.10(v168, v169, v170, v171, v172, v173, v174, v175);
        goto LABEL_104;
      }
      v68 = -[cContentRestriction initWithMethod:Weight:]([cContentRestriction alloc], "initWithMethod:Weight:", 1, 1000);

      v43 = v239;
      if (!v68)
      {
        v176 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v176)
          -[wspQueryIn makeSecondaryCnodeRestriction].cold.11(v176, v177, v178, v179, v180, v181, v182, v183);
        v72 = 0;
        goto LABEL_104;
      }
      if (-[cContentRestriction setPhrase:](v68, "setPhrase:", v44))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspQueryIn makeSecondaryCnodeRestriction].cold.14();
        goto LABEL_103;
      }
      v73 = v247;
      -[cContentRestriction setPropSpec:](v68, "setPropSpec:", v247);
      v76 = -[cCoercionRestriction initWithOp:FValue:Weight:]([cCoercionRestriction alloc], "initWithOp:FValue:Weight:", 12, 1148846080, 1000);

      if (!v76)
      {
        v184 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v184)
          -[wspQueryIn makeSecondaryCnodeRestriction].cold.12(v184, v185, v186, v187, v188, v189, v190, v191);
        v11 = 0;
LABEL_103:
        v72 = v68;
LABEL_104:
        v22 = v229;

        v248 = 0;
        v23 = 0;
        v41 = v72;
        v8 = v233;
        v17 = v242;
        v42 = v243;
        v24 = v247;
        goto LABEL_16;
      }
      -[cCoercionRestriction setRestriction:](v76, "setRestriction:", v68);
      -[cnodeBuilder appendRestriction:](v242, "appendRestriction:", v76);
      ++v70;
      v11 = v76;
      v69 = v44;
      v72 = v68;
      v74 = v44;
      if (v71 != v70)
        continue;
      break;
    }
    v66 = v76;
    v65 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v252, v263, 16);
    v67 = objb;
    if (v65)
      continue;
    break;
  }
  obj = v68;

  if (&v225[v71] == (char *)1)
  {
    v17 = v242;
    -[cnodeBuilder rootNode](v242, "rootNode");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "restrictArray");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "objectAtIndex:", 0);
    v11 = (cCoercionRestriction *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v8 = v233;
      -[cnodeBuilder appendRestriction:](v233, "appendRestriction:", v11);
      v12 = v229;
      v13 = v247;
      goto LABEL_120;
    }
    v216 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v216)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.13(v216, v217, v218, v219, v220, v221, v222, v223);
    v248 = 0;
    v11 = 0;
    v44 = 0;
    v23 = 0;
    v22 = v229;
    v8 = v233;
    v43 = v239;
    v17 = v242;
    v42 = v243;
    v24 = v247;
    v41 = obj;
    goto LABEL_16;
  }
  v12 = v229;
  v8 = v233;
  if (!&v225[v71])
  {
    v43 = v239;
    v17 = v242;
    v24 = v247;
    v11 = v76;
    v41 = obj;
    goto LABEL_77;
  }
  v17 = v242;
  -[cnodeBuilder rootNode](v242, "rootNode");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  -[cnodeBuilder appendRestriction:](v233, "appendRestriction:", v215);

  v13 = v247;
  v11 = v76;
LABEL_120:
  self = v227;
LABEL_7:
  -[wspQueryIn wctx](self, "wctx");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "queryType");

  if ((v19 & 1) == 0)
  {
    v231 = v8;
    v245 = v13;
    goto LABEL_9;
  }
  v85 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 9);

  if (!v85)
  {
    v22 = v12;
    v144 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v41 = obj;
    if (v144)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.4(v144, v145, v146, v147, v148, v149, v150, v151);
    v248 = 0;
    v24 = 0;
LABEL_83:
    v44 = 0;
    v23 = 0;
LABEL_84:
    v43 = v239;
    goto LABEL_85;
  }
  v230 = v12;
  v231 = v8;
  v86 = self;
  v42 = v243;
  v87 = -[cContentRestriction initWithMethod:Weight:]([cContentRestriction alloc], "initWithMethod:Weight:", 1, 1000);

  if (!v87)
  {
    v152 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v152)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.5(v152, v153, v154, v155, v156, v157, v158, v159);
    v248 = 0;
    v41 = 0;
    v44 = 0;
    v23 = 0;
    v24 = v85;
LABEL_89:
    v43 = v239;
    v22 = v230;
    goto LABEL_16;
  }
  v245 = v85;
  -[wspQueryIn wctx](v86, "wctx");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "contentPattern");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = -[cContentRestriction setPhrase:](v87, "setPhrase:", v89);

  if (v90)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.7();
    v248 = 0;
    goto LABEL_55;
  }
  -[cContentRestriction setPropSpec:](v87, "setPropSpec:", v245);
  v192 = -[cCoercionRestriction initWithOp:FValue:Weight:]([cCoercionRestriction alloc], "initWithOp:FValue:Weight:", 12, 1148846080, 1000);

  if (!v192)
  {
    v193 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v193)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.6(v193, v194, v195, v196, v197, v198, v199, v200);
    v248 = 0;
    v11 = 0;
LABEL_55:
    v44 = 0;
    v23 = 0;
    v41 = v87;
    v24 = v245;
    goto LABEL_89;
  }
  -[cCoercionRestriction setRestriction:](v192, "setRestriction:", v87);
  -[cnodeBuilder appendRestriction:](v8, "appendRestriction:", v192);
  v11 = v192;
  obj = v87;
  v12 = v230;
  self = v86;
LABEL_9:
  -[wspQueryIn wctx](self, "wctx");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "queryType");

  if ((v21 & 8) == 0)
  {
    v22 = v12;
    v23 = 0;
    v8 = v231;
    v24 = v245;
    goto LABEL_65;
  }
  v107 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 1);

  if (v107)
  {
    v22 = -[cPropertyRestriction initWithRelop:Weight:]([cPropertyRestriction alloc], "initWithRelop:Weight:", 3, 1000);

    -[wspQueryIn wctx](self, "wctx");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = objc_msgSend(v108, "modDateSpec");
    v262 = v109;

    smb_time_local2NT(&v261, &v260, 0);
    v110 = objc_alloc(MEMORY[0x24BDD16E0]);
    v23 = (void *)objc_msgSend(v110, "initWithUnsignedLongLong:", v260);
    v111 = objc_alloc_init(cbaseVariant);

    -[cbaseVariant setScalarType:ScalarValue:](v111, "setScalarType:ScalarValue:", 64, v23);
    -[cPropertyRestriction setPropSpec:](v22, "setPropSpec:", v107);
    -[cPropertyRestriction setPrVal:](v22, "setPrVal:", v111);
    v8 = v231;
    -[cnodeBuilder appendRestriction:](v231, "appendRestriction:", v22);
    v243 = v111;
    v24 = v107;
LABEL_65:
    -[cnodeBuilder appendRestriction:](v8, "appendRestriction:", v251);
    -[cnodeBuilder rootNode](v8, "rootNode");
    v248 = (id)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v43 = v239;
    v41 = obj;
LABEL_85:
    v42 = v243;
  }
  else
  {
    v22 = v12;
    v160 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v43 = v239;
    v41 = obj;
    if (v160)
      -[wspQueryIn makeSecondaryCnodeRestriction].cold.3(v160, v161, v162, v163, v164, v165, v166, v167);
    v248 = 0;
    v24 = 0;
    v44 = 0;
    v23 = 0;
    v42 = v243;
    v8 = v231;
  }
LABEL_16:

  return v248;
}

- (int)encodePrimaryQuery:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  unsigned int v16;
  size_t v17;
  size_t v18;
  unint64_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  cRestrictionArray *v35;
  void *v36;
  cRestrictionArray *v37;
  int v38;
  unint64_t v39;
  unsigned int v40;
  unsigned int v41;
  size_t v42;
  size_t v43;
  unint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  unsigned int v57;
  uint64_t v58;
  int v59;
  _BOOL8 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unsigned int v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  fullPropSpec *v82;
  uint64_t v83;
  uint64_t v84;
  fullPropSpec *v85;
  int v86;
  fullPropSpec *v87;
  int v88;
  _BOOL8 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  fullPropSpec *v98;
  int v99;
  int v100;
  _BOOL8 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  fullPropSpec *v110;
  int v111;
  int v112;
  _BOOL8 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  int v122;
  void *v123;
  void *v124;
  void *v125;
  unsigned int v126;
  wspQueryIn *v127;
  cRestrictionArray *v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  unsigned int *v132;
  unsigned int *v133;
  id v134;
  id v135;
  id objc;
  id obj;
  id obja;
  cRowsetProperties *objb;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  int __src;
  unsigned int v149;
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v149 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.32();
    goto LABEL_7;
  }
  v10 = v9 - a4;
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.1();
LABEL_7:
    v13 = 12;
    goto LABEL_8;
  }
  v15 = v12;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v12 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_7;
  }
  if (v10 == 20)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_7;
  }
  *(_BYTE *)(v12 + a4 + 20) = 1;
  v16 = a4 + 21;
  v17 = v10 - 21;
  v18 = align4Pad(a4 + 21);
  if (v17 < v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_7;
  }
  bzero((void *)(v15 + v16), v18);
  v19 = v17 - v18;
  if (v19 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.5();
    goto LABEL_7;
  }
  v134 = v11;
  v20 = v18 + v16;
  -[wspQueryIn wctx](self, "wctx");
  objc = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc, "pidMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "columnSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __src = objc_msgSend(v22, "count");

  *(_DWORD *)(v15 + v20) = __src;
  v23 = v20 + 4;
  v24 = v19 - 4;
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  -[wspQueryIn wctx](self, "wctx");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "pidMap");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "columnSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v27;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
  if (v28)
  {
    v29 = v28;
    v135 = v8;
    v30 = v15;
    v132 = a5;
    v31 = 0;
    v32 = *(_QWORD *)v145;
    while (2)
    {
      v33 = 0;
      v34 = v31;
      do
      {
        if (*(_QWORD *)v145 != v32)
          objc_enumerationMutation(obj);
        v31 = *(id *)(*((_QWORD *)&v144 + 1) + 8 * v33);

        __src = objc_msgSend(v31, "unsignedIntegerValue");
        if (v24 <= 3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.31();

LABEL_38:
          v13 = 12;
LABEL_39:
          v8 = v135;
          goto LABEL_8;
        }
        *(_DWORD *)(v30 + v23) = __src;
        v23 += 4;
        v24 -= 4;
        ++v33;
        v34 = v31;
      }
      while (v29 != v33);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
      if (v29)
        continue;
      break;
    }

    a5 = v132;
    v15 = v30;
    v8 = v135;
  }

  if (!v24)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.6();
    goto LABEL_7;
  }
  *(_BYTE *)(v15 + v23) = 1;
  v35 = [cRestrictionArray alloc];
  -[wspQueryIn primaryCnodeRestriction](self, "primaryCnodeRestriction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[cRestrictionArray initWithRestriction:](v35, "initWithRestriction:", v36);

  v38 = -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:](v37, "encodeBuffer:BufferOffset:BytesWritten:", v134, v23 + 1, &v149);
  if (!v38)
  {
    v39 = v24 + ~(unint64_t)v149;
    if (v39)
    {
      v131 = v149;
      v40 = v149 + v23 + 1;
      *(_BYTE *)(v15 + v40) = 1;
      v41 = v40 + 1;
      v42 = v39 - 1;
      v43 = align4Pad(v40 + 1);
      if (v42 >= v43)
      {
        obja = (id)v43;
        bzero((void *)(v15 + v41), v43);
        v44 = v42 - (_QWORD)obja;
        if (v44 > 3)
        {
          v45 = (_DWORD)obja + v41;
          __src = 1;
          *(_DWORD *)(v15 + obja + v41) = 1;
          if (v44 - 4 > 3)
          {
            v135 = v8;
            v133 = a5;
            v127 = self;
            v128 = v37;
            __src = 0;
            *(_DWORD *)(v15 + v45 + 4) = 0;
            if (v44 - 8 <= 3)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.11();
              goto LABEL_58;
            }
            v46 = 0;
            v47 = 0;
            v48 = 0;
            v126 = a4 + 16;
            v49 = 3;
            *(_DWORD *)(v15 + v45 + 8) = 3;
            __src = 3;
            v129 = (_DWORD)obja + v23 + v131;
            v50 = v24 - (_QWORD)obja - v131;
            while (1)
            {
              if ((unint64_t)(v50 + v46 - 14) <= 3)
              {
                __src = v49;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.12();
                goto LABEL_58;
              }
              *(_DWORD *)(v15 + (v129 + v47 + 14)) = v48;
              if ((unint64_t)(v50 + v46 - 18) <= 3)
              {
                __src = v48;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.13();
                goto LABEL_58;
              }
              *(_DWORD *)(v15 + (v129 + v47 + 18)) = v47 != 32;
              if ((unint64_t)(v50 + v46 - 22) <= 3)
              {
                __src = v47 != 32;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.14();
                goto LABEL_58;
              }
              v51 = v46;
              *(_DWORD *)(v15 + (v129 + v47 + 22)) = 0;
              if ((unint64_t)(v50 + v46 - 26) <= 3)
                break;
              v52 = (void *)MEMORY[0x24BDBCEA0];
              objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "localeIdentifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v52, "windowsLocaleCodeFromLocaleIdentifier:", v54);

              *(_DWORD *)(v15 + (v129 + v47 + 26)) = v49;
              ++v48;
              v47 += 16;
              v46 = v51 - 16;
              if ((_DWORD)v47 == 48)
              {
                v130 = v15;
                __src = v49;
                if (v50 - 14 == v47)
                {
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.16();
                  goto LABEL_58;
                }
                *(_BYTE *)(v15 + obja + v23 + v131 + 62) = 0;
                v55 = obja + v23 + v131 + v47 + 15;
                v56 = v50 - v47 - 15;
                v57 = align4Pad(obja + v23 + v131 + 63);
                if (v57)
                {
                  v58 = v57;
                  if (v56 < v57)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.29();
                    goto LABEL_58;
                  }
                  __src = 0;
                  memcpy((void *)(v15 + v55), &__src, v57);
                  v55 = v58 + (_DWORD)obja + v23 + (_DWORD)v131 + 48 + 15;
                  v56 = v50 - v58 - v47 - 15;
                }
                objb = objc_alloc_init(cRowsetProperties);
                if (objb)
                {
                  -[cRowsetProperties setBooleanOptions:](objb, "setBooleanOptions:", 4194307);
                  v59 = -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:](objb, "encodeBuffer:BufferOffset:BytesWritten:", v134, v55, &v149);
                  if (v59)
                  {
                    v13 = v59;
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.28();
LABEL_85:

                    goto LABEL_39;
                  }
                  v68 = v56 - v149;
                  if (v68 <= 3)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.18();
                    goto LABEL_91;
                  }
                  v69 = v149 + v55;
                  -[wspQueryIn wctx](v127, "wctx");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "pidMap");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "pidMap");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = objc_msgSend(v72, "count");

                  __src = v73 + 3;
                  *(_DWORD *)(v15 + v69) = v73 + 3;
                  v74 = v69 + 4;
                  v75 = v68 - 4;
                  v140 = 0u;
                  v141 = 0u;
                  v142 = 0u;
                  v143 = 0u;
                  -[wspQueryIn wctx](v127, "wctx");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "pidMap");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "pidMap");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();

                  v79 = v78;
                  v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
                  if (v80)
                  {
                    v81 = v80;
                    v82 = 0;
                    v83 = *(_QWORD *)v141;
                    while (2)
                    {
                      v84 = 0;
                      v85 = v82;
                      do
                      {
                        if (*(_QWORD *)v141 != v83)
                          objc_enumerationMutation(v79);
                        v82 = (fullPropSpec *)*(id *)(*((_QWORD *)&v140 + 1) + 8 * v84);

                        v86 = -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:](v82, "encodeBuffer:BufferOffset:BytesWritten:", v134, v74, &v149);
                        if (v86)
                        {
                          v13 = v86;
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.27();

                          goto LABEL_108;
                        }
                        v74 = v149 + v74;
                        v75 -= v149;
                        ++v84;
                        v85 = v82;
                      }
                      while (v81 != v84);
                      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
                      if (v81)
                        continue;
                      break;
                    }

                  }
                  v87 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 17);
                  if (!v87)
                  {
                    v89 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                    if (v89)
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.19(v89, v90, v91, v92, v93, v94, v95, v96);
                    goto LABEL_91;
                  }
                  v82 = v87;
                  v88 = -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:](v87, "encodeBuffer:BufferOffset:BytesWritten:", v134, v74, &v149);
                  if (v88)
                  {
                    v13 = v88;
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.26();
LABEL_108:

                    goto LABEL_85;
                  }
                  v97 = v149;
                  v98 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 18);

                  if (!v98)
                  {
                    v101 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                    if (v101)
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.20(v101, v102, v103, v104, v105, v106, v107, v108);
                    goto LABEL_91;
                  }
                  v99 = v97 + v74;
                  v100 = -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:](v98, "encodeBuffer:BufferOffset:BytesWritten:", v134, (v97 + v74), &v149);
                  if (v100)
                  {
                    v13 = v100;
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.25();

                    goto LABEL_85;
                  }
                  v109 = v149;
                  v110 = -[fullPropSpec initWithPropertyNumber:]([fullPropSpec alloc], "initWithPropertyNumber:", 19);

                  if (!v110)
                  {
                    v113 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                    if (v113)
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.21(v113, v114, v115, v116, v117, v118, v119, v120);
                    goto LABEL_91;
                  }
                  v111 = v109 + v99;
                  v112 = -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:](v110, "encodeBuffer:BufferOffset:BytesWritten:", v134, (v109 + v99), &v149);
                  if (v112)
                  {
                    v13 = v112;
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.24();

                    goto LABEL_85;
                  }
                  v121 = v75 - v149 - (v97 + v109);
                  if (v121 <= 3)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.22();
LABEL_131:

LABEL_91:
                    goto LABEL_58;
                  }
                  v122 = v149 + v111;
                  __src = 0;
                  *(_DWORD *)(v130 + v149 + v111) = 0;
                  if (v121 - 4 <= 3)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.23();
                    goto LABEL_131;
                  }
                  v123 = (void *)MEMORY[0x24BDBCEA0];
                  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v124, "localeIdentifier");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v123) = objc_msgSend(v123, "windowsLocaleCodeFromLocaleIdentifier:", v125);
                  __src = (int)v123;

                  *(_DWORD *)(v130 + (v122 + 4)) = (_DWORD)v123;
                  __src = v122 - 8;
                  *(_DWORD *)(v130 + v126) = v122 - 8;
                  *(_DWORD *)(v130 + 8) = getChecksum32(202, (int *)(v130 + 16), v122 - 8);
                  *v133 = v122 + 8;

                  v13 = 0;
                  goto LABEL_39;
                }
                v60 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v60)
                  -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.17(v60, v61, v62, v63, v64, v65, v66, v67);
LABEL_58:

                goto LABEL_38;
              }
            }
            __src = 0;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.15();
            goto LABEL_58;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.10();
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.9();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.8();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.7();
    }

    goto LABEL_7;
  }
  v13 = v38;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.30();

LABEL_8:
  return v13;
}

- (int)encodeSecondaryQuery:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  _BYTE *v15;
  unsigned int v16;
  size_t v17;
  size_t v18;
  unint64_t v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  unsigned int v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  cRowsetProperties *v37;
  cRestrictionArray *v38;
  int v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unsigned int v49;
  unsigned int v50;
  size_t v51;
  size_t v52;
  unint64_t v53;
  int v54;
  cRowsetProperties *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  char *v59;
  int v60;
  char *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  unint64_t v67;
  unsigned int v68;
  int v69;
  _BOOL8 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  unint64_t v79;
  unsigned int v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  unint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  int Checksum32;
  unsigned int v101;
  int v102;
  cRowsetProperties *v103;
  cRestrictionArray *v104;
  uint64_t v105;
  uint64_t v106;
  cRowsetProperties *v107;
  size_t v108;
  int v109;
  unsigned int *v110;
  unsigned int *v111;
  id v112;
  id v113;
  int v114;
  id v115;
  wspQueryIn *v116;
  id objb;
  id objc;
  id obj;
  int *obja;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  unsigned int v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v129 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.28();
    goto LABEL_7;
  }
  v10 = v9 - a4;
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.1();
LABEL_7:
    v13 = 12;
    goto LABEL_8;
  }
  v15 = (_BYTE *)v12;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v12 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_7;
  }
  if (v10 == 20)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_7;
  }
  *(_BYTE *)(v12 + a4 + 20) = 1;
  v16 = a4 + 21;
  v17 = v10 - 21;
  v18 = align4Pad(a4 + 21);
  if (v17 < v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_7;
  }
  bzero(&v15[v16], v18);
  v19 = v17 - v18;
  if (v19 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.5();
    goto LABEL_7;
  }
  v20 = v18 + v16;
  -[wspQueryIn wctx](self, "wctx");
  objb = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objb, "pidMap");
  v116 = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "columnSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v22, "count");

  *(_DWORD *)&v15[v20] = v114;
  v23 = v18 + 25;
  v24 = v20 + 4;
  v25 = v19 - 4;
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  -[wspQueryIn wctx](v116, "wctx");
  objc = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc, "pidMap");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "columnSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v27;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v125, v131, 16);
  if (!v28)
    goto LABEL_30;
  v29 = v28;
  v112 = v11;
  v115 = v8;
  v30 = v15;
  v110 = a5;
  v31 = 0;
  v32 = *(_QWORD *)v126;
  do
  {
    v33 = 0;
    v34 = v31;
    do
    {
      if (*(_QWORD *)v126 != v32)
        objc_enumerationMutation(obj);
      v31 = *(id *)(*((_QWORD *)&v125 + 1) + 8 * v33);

      v35 = objc_msgSend(v31, "unsignedIntegerValue");
      if (v25 <= 3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.27();

        goto LABEL_39;
      }
      *(_DWORD *)&v30[v24] = v35;
      v23 += 4;
      v24 += 4;
      v25 -= 4;
      ++v33;
      v34 = v31;
    }
    while (v29 != v33);
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v131, 16);
  }
  while (v29);

  a5 = v110;
  v11 = v112;
  v15 = v30;
  v8 = v115;
LABEL_30:

  if (!v25)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.6();
    goto LABEL_7;
  }
  v113 = v11;
  v15[v24] = 1;
  -[wspQueryIn makeSecondaryCnodeRestriction](v116, "makeSecondaryCnodeRestriction");
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v40)
      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.7(v40, v41, v42, v43, v44, v45, v46, v47);
    goto LABEL_7;
  }
  v37 = (cRowsetProperties *)v36;
  obja = (int *)v15;
  v38 = -[cRestrictionArray initWithRestriction:]([cRestrictionArray alloc], "initWithRestriction:", v36);
  v39 = -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:](v38, "encodeBuffer:BufferOffset:BytesWritten:", v113, v24 + 1, &v129);
  if (!v39)
  {
    v48 = v25 + ~(unint64_t)v129;
    if (!v48)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.7();

      goto LABEL_7;
    }
    v115 = v8;
    v106 = v129;
    v49 = v129 + v24 + 1;
    *((_BYTE *)obja + v49) = 1;
    v50 = v49 + 1;
    v51 = v48 - 1;
    v52 = align4Pad(v49 + 1);
    if (v51 < v52)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.8();
LABEL_58:

      goto LABEL_39;
    }
    v108 = v52;
    bzero((char *)obja + v50, v52);
    v53 = v51 - v108;
    if (v53 <= 3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.9();
      goto LABEL_58;
    }
    v54 = v108 + v50;
    *(int *)((char *)obja + v108 + v50) = 1;
    if (v53 - 4 <= 3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.10();
      goto LABEL_58;
    }
    v111 = a5;
    v103 = v37;
    v104 = v38;
    *(int *)((char *)obja + (v54 + 4)) = 0;
    if (v53 - 8 > 3)
    {
      v56 = 0;
      v57 = 0;
      v58 = 0;
      v101 = a4 + 16;
      v59 = (char *)obja;
      *(int *)((char *)obja + (v54 + 8)) = 3;
      v102 = v108 + v23 + v106;
      v60 = v108 + v24 + v106;
      v105 = v25 - v108 - v106;
      do
      {
        if ((unint64_t)(v105 + v56 - 14) <= 3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.12();
          goto LABEL_62;
        }
        *(_DWORD *)&v59[(v60 + v57 + 14)] = v58;
        if ((unint64_t)(v105 + v56 - 18) <= 3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.13();
          goto LABEL_62;
        }
        *(_DWORD *)&v59[(v60 + v57 + 18)] = v57 != 32;
        if ((unint64_t)(v105 + v56 - 22) <= 3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.14();
          goto LABEL_62;
        }
        *(_DWORD *)&v59[(v60 + v57 + 22)] = 0;
        if ((unint64_t)(v105 + v56 - 26) <= 3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.15();
          goto LABEL_62;
        }
        v61 = v59;
        v62 = (void *)MEMORY[0x24BDBCEA0];
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "localeIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v62) = objc_msgSend(v62, "windowsLocaleCodeFromLocaleIdentifier:", v64);

        *(_DWORD *)&v61[(v60 + v57 + 26)] = (_DWORD)v62;
        ++v58;
        v57 += 16;
        v56 -= 16;
        v59 = v61;
      }
      while ((_DWORD)v57 != 48);
      if (v105 - 14 == v57)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.17();
      }
      else
      {
        *((_BYTE *)obja + v108 + v24 + v106 + 62) = 0;
        v65 = v102 + 63;
        v66 = v108 + v24 + v106 + v57 + 15;
        v67 = v105 - v57 - 15;
        v68 = align4Pad(v108 + v24 + v106 + 63);
        if (v68)
        {
          if (v67 < v68)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.25();
            goto LABEL_62;
          }
          v65 += v68;
          v66 = v68 + (_DWORD)v108 + v24 + (_DWORD)v106 + 48 + 15;
          v67 = v105 - v68 - v57 - 15;
        }
        v107 = objc_alloc_init(cRowsetProperties);
        if (v107)
        {
          -[cRowsetProperties setBooleanOptions:](v107, "setBooleanOptions:", 8404995);
          v69 = -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:](v107, "encodeBuffer:BufferOffset:BytesWritten:", v113, v66, &v129);
          if (v69)
          {
            v13 = v69;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.24();
LABEL_90:

            goto LABEL_40;
          }
          v78 = v129;
          v79 = v67 - v129;
          if (v79 > 3)
          {
            v80 = v129 + v66;
            -[wspQueryIn wctx](v116, "wctx");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "pidMap");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "pidMap");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v83, "count");

            *(int *)((char *)obja + v80) = v84;
            v109 = v65 + v78 + 4;
            v85 = v80 + 4;
            v123 = 0u;
            v124 = 0u;
            v86 = v79 - 4;
            v121 = 0u;
            v122 = 0u;
            -[wspQueryIn wctx](v116, "wctx");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "pidMap");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "pidMap");
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
            if (v90)
            {
              v91 = v90;
              v92 = 0;
              v93 = *(_QWORD *)v122;
              while (2)
              {
                v94 = 0;
                v95 = v92;
                do
                {
                  if (*(_QWORD *)v122 != v93)
                    objc_enumerationMutation(v89);
                  v92 = *(id *)(*((_QWORD *)&v121 + 1) + 8 * v94);

                  v96 = objc_msgSend(v92, "encodeBuffer:BufferOffset:BytesWritten:", v113, v85, &v129);
                  if (v96)
                  {
                    v13 = v96;
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.23();

                    goto LABEL_90;
                  }
                  v109 += v129;
                  v85 = v129 + v85;
                  v86 -= v129;
                  ++v94;
                  v95 = v92;
                }
                while (v91 != v94);
                v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
                if (v91)
                  continue;
                break;
              }

            }
            if (v86 > 3)
            {
              *(int *)((char *)obja + v85) = 0;
              if (v86 - 4 > 3)
              {
                v97 = (void *)MEMORY[0x24BDBCEA0];
                objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "localeIdentifier");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v97) = objc_msgSend(v97, "windowsLocaleCodeFromLocaleIdentifier:", v99);

                *(int *)((char *)obja + (v85 + 4)) = (int)v97;
                *(int *)((char *)obja + v101) = v109 - 8;
                Checksum32 = getChecksum32(202, obja + 4, v109 - 8);
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                  -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.22(v109, v85 + 8);
                obja[2] = Checksum32;
                *v111 = v85 + 8;

                v13 = 0;
                goto LABEL_40;
              }
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.21();
            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.20();
            }
          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.19();
          }

          v55 = v107;
          goto LABEL_63;
        }
        v70 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v70)
          -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.18(v70, v71, v72, v73, v74, v75, v76, v77);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[wspQueryIn encodePrimaryQuery:BufferOffset:BytesWritten:].cold.11();
    }
LABEL_62:
    v55 = v103;
LABEL_63:

LABEL_39:
    v13 = 12;
LABEL_40:
    v8 = v115;
    goto LABEL_8;
  }
  v13 = v39;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[wspQueryIn encodeSecondaryQuery:BufferOffset:BytesWritten:].cold.26();

LABEL_8:
  return v13;
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWctx:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (cNodeRestriction)primaryCnodeRestriction
{
  return (cNodeRestriction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrimaryCnodeRestriction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (cNodeRestriction)secondaryCnodeRestriction
{
  return (cNodeRestriction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSecondaryCnodeRestriction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCnodeRestriction, 0);
  objc_storeStrong((id *)&self->_primaryCnodeRestriction, 0);
  objc_storeStrong((id *)&self->_wctx, 0);
}

- (void)initWithCtx:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspQueryIn:initWithCtx: no memory for primaryCnodeRestriction object\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)makePrimaryCnodeRestriction
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "makeBaseRestrictionNode: cnodeInner append sfgaoRestrict error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)makeSecondaryCnodeRestriction
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "makeSecondaryCnodeRestriction: FilenameSearch, elements: 1, CoercionRestriction is nil\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for Size field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSet Count, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CRestrictionPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CSortPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for Csort align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CInGroupSortAggregSets Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CInGroupSortAggregSets reserved: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CSortSet count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort pidColumn: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort dwOrder: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort dwIndividual: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for cSort lcid: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CCategorizationSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspQueryIn:encodePrimaryQuery: no memory for cRowsetProperties obj\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for PidMapper Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspQueryIn:encodePrimaryQuery: no memory for SystemShellSFGAOFlagsStrings property\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspQueryIn:encodePrimaryQuery: no memory for SystemShellOmitFromView property\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspQueryIn:encodePrimaryQuery: no memory for Scope property\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnGroup field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for Lcid field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: Scope encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: SystemShellOmitFromView encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: SystemShellSFGAOFlagsStrings encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: fullPropSpec encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: cRowProperties encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for RowSetProperties align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: encdoe cRestrictionArray error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.31()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for CColumnSet index: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodePrimaryQuery:BufferOffset:BytesWritten:.cold.32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for Size field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSet Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CRestrictionPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspQueryIn:encodeSecondaryQuery: makeSecondaryCnodeRestriction returned nil\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CCategorizationSetPresent: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspQueryIn:encodeSecondaryQuery: no memory for cRowsetProperties obj\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for PidMapper Count: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnGroup field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for Lcid field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:(int)a1 BufferOffset:(int)a2 BytesWritten:.cold.22(int a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109632;
  v2[1] = a1 + 8;
  v3 = 1024;
  v4 = a2;
  v5 = 2048;
  v6 = 16;
  _os_log_debug_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "SECONDQUERY: nWritten: %u, bOffset: %u, sizeofhdr: %lu\n", (uint8_t *)v2, 0x18u);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: fullPropSpec encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: cRowProperties encodeBuffer error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for RowSetProperties align: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: encdoe cRestrictionArray error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space for CColumnSet index: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeSecondaryQuery:BufferOffset:BytesWritten:.cold.28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodeSecondaryQuery: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
