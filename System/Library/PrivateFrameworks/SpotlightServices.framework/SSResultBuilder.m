@implementation SSResultBuilder

+ (id)resultBuilderForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SFSearchResult_SpotlightExtras *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSResultBuilder fetchAttributes](SSResultBuilder, "fetchAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v3, "attributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "customAttributeDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v12);

  v13 = -[SFSearchResult_SpotlightExtras initWithIdentifier:bundleIdentifier:protectionClass:attributes:type:completion:]([SFSearchResult_SpotlightExtras alloc], "initWithIdentifier:bundleIdentifier:protectionClass:attributes:type:completion:", v6, v4, v7, v10, 2, 0);
  +[SSResultBuilder resultBuilderWithResult:](SSResultBuilder, "resultBuilderWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (Class)resultBuilderClassForResult:(id)a3 preferAppVendedView:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  _BYTE v30[128];
  _QWORD v31[34];

  v4 = a4;
  v31[33] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v31[3] = objc_opt_class();
  v31[4] = objc_opt_class();
  v31[5] = objc_opt_class();
  v31[6] = objc_opt_class();
  v31[7] = objc_opt_class();
  v31[8] = objc_opt_class();
  v31[9] = objc_opt_class();
  v31[10] = objc_opt_class();
  v31[11] = objc_opt_class();
  v31[12] = objc_opt_class();
  v31[13] = objc_opt_class();
  v31[14] = objc_opt_class();
  v31[15] = objc_opt_class();
  v31[16] = objc_opt_class();
  v31[17] = objc_opt_class();
  v31[18] = objc_opt_class();
  v31[19] = objc_opt_class();
  v31[20] = objc_opt_class();
  v31[21] = objc_opt_class();
  v31[22] = objc_opt_class();
  v31[23] = objc_opt_class();
  v31[24] = objc_opt_class();
  v31[25] = objc_opt_class();
  v31[26] = objc_opt_class();
  v31[27] = objc_opt_class();
  v31[28] = objc_opt_class();
  v31[29] = objc_opt_class();
  v31[30] = objc_opt_class();
  v31[31] = objc_opt_class();
  v31[32] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 33);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(v11, "supportsResult:", v5, (_QWORD)v18))
      {
        if (v11 != (void *)objc_opt_class() || v4)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_11;
      }
    }

    if (v11)
      goto LABEL_14;
  }
  else
  {
LABEL_11:

  }
  v11 = (void *)objc_opt_class();
LABEL_14:
  SSGeneralLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "contentType");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("NO");
    *(_DWORD *)buf = 138478595;
    v23 = v5;
    v24 = 2112;
    if (v4)
      v17 = CFSTR("YES");
    v25 = v15;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v17;
    _os_log_debug_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_DEBUG, "SSResultBuilder result: %{private}@ withContentType: %@ resolved to class: %@ preferringAppVendedView: %@", buf, 0x2Au);

  }
  v13 = v11;

  return v13;
}

+ (id)resultBuilderWithResult:(id)a3
{
  return (id)objc_msgSend(a1, "resultBuilderWithResult:preferAppVendedView:", a3, 1);
}

+ (id)resultBuilderWithResult:(id)a3 preferAppVendedView:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "resultBuilderClassForResult:preferAppVendedView:", v6, v4)), "initWithResult:", v6);

  return v7;
}

+ (id)fetchAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  uint64_t v88;
  const __CFString *v89;
  const __CFString *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const __CFString *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA6898];
  v35[0] = *MEMORY[0x1E0CA5F48];
  v35[1] = v2;
  v3 = *MEMORY[0x1E0CA6588];
  v35[2] = *MEMORY[0x1E0CA6970];
  v35[3] = v3;
  v4 = *MEMORY[0x1E0CA65D8];
  v35[4] = *MEMORY[0x1E0CA6598];
  v35[5] = v4;
  v5 = *MEMORY[0x1E0CA6630];
  v36 = *MEMORY[0x1E0CA6620];
  v37 = v5;
  v6 = *MEMORY[0x1E0CA6678];
  v38 = *MEMORY[0x1E0CA6648];
  v39 = v6;
  v7 = *MEMORY[0x1E0CA6558];
  v40 = *MEMORY[0x1E0CA66A8];
  v41 = v7;
  v8 = *MEMORY[0x1E0CA6560];
  v42 = *MEMORY[0x1E0CA6568];
  v43 = v8;
  v9 = *MEMORY[0x1E0CA5F80];
  v44 = *MEMORY[0x1E0CA5F58];
  v45 = v9;
  v10 = *MEMORY[0x1E0CA5FC0];
  v46 = *MEMORY[0x1E0CA5F90];
  v47 = v10;
  v11 = *MEMORY[0x1E0CA5FD8];
  v48 = *MEMORY[0x1E0CA5FC8];
  v49 = v11;
  v12 = *MEMORY[0x1E0CA5FE0];
  v50 = *MEMORY[0x1E0CA5FB8];
  v51 = v12;
  v13 = *MEMORY[0x1E0CA5FE8];
  v52 = *MEMORY[0x1E0CA5FD0];
  v53 = v13;
  v14 = *MEMORY[0x1E0CA5FF8];
  v54 = *MEMORY[0x1E0CA5FF0];
  v55 = v14;
  v15 = *MEMORY[0x1E0CA6008];
  v56 = *MEMORY[0x1E0CA6000];
  v57 = v15;
  v16 = *MEMORY[0x1E0CA6028];
  v58 = *MEMORY[0x1E0CA6018];
  v59 = v16;
  v17 = *MEMORY[0x1E0CA6048];
  v60 = *MEMORY[0x1E0CA6030];
  v61 = v17;
  v18 = *MEMORY[0x1E0CA6078];
  v62 = *MEMORY[0x1E0CA6058];
  v63 = v18;
  v19 = *MEMORY[0x1E0CA60B0];
  v64 = *MEMORY[0x1E0CA60A0];
  v65 = v19;
  v20 = *MEMORY[0x1E0CA60D0];
  v66 = *MEMORY[0x1E0CA60C0];
  v67 = v20;
  v21 = *MEMORY[0x1E0CA60E0];
  v68 = *MEMORY[0x1E0CA62E8];
  v69 = v21;
  v22 = *MEMORY[0x1E0CA6100];
  v70 = *MEMORY[0x1E0CA60F8];
  v71 = v22;
  v23 = *MEMORY[0x1E0CA6110];
  v72 = *MEMORY[0x1E0CA6108];
  v73 = v23;
  v24 = *MEMORY[0x1E0CA6150];
  v74 = CFSTR("SSAttributeDefinitions");
  v75 = v24;
  v25 = *MEMORY[0x1E0CA61A0];
  v76 = *MEMORY[0x1E0CA6158];
  v77 = v25;
  v26 = *MEMORY[0x1E0CA61C8];
  v78 = *MEMORY[0x1E0CA61A8];
  v79 = v26;
  v27 = *MEMORY[0x1E0CA6310];
  v80 = *MEMORY[0x1E0CA62F0];
  v81 = v27;
  v28 = *MEMORY[0x1E0CA6318];
  v82 = *MEMORY[0x1E0CA6308];
  v83 = v28;
  v29 = *MEMORY[0x1E0CA6380];
  v84 = *MEMORY[0x1E0CA6330];
  v85 = v29;
  v30 = *MEMORY[0x1E0CA63C0];
  v86 = CFSTR("SSAttributeCalculatorInput");
  v87 = v30;
  v88 = *MEMORY[0x1E0CA63D8];
  v89 = CFSTR("SSAttributeIsCalculation");
  v31 = *MEMORY[0x1E0CA6430];
  v90 = CFSTR("SSAttributeIsCurrencyConversion");
  v91 = v31;
  v32 = *MEMORY[0x1E0CA6458];
  v92 = *MEMORY[0x1E0CA6450];
  v93 = v32;
  v94 = *MEMORY[0x1E0CA6468];
  v95 = *MEMORY[0x1E0CA6470];
  v96 = *MEMORY[0x1E0CA64A0];
  v97 = *MEMORY[0x1E0CA64C8];
  v98 = CFSTR("SSAttributeCalculatorOutput");
  v99 = *MEMORY[0x1E0CA6A58];
  v100 = *MEMORY[0x1E0CA6540];
  v101 = *MEMORY[0x1E0CA6570];
  v102 = *MEMORY[0x1E0CA61B8];
  v103 = *MEMORY[0x1E0CA6730];
  v104 = *MEMORY[0x1E0CA6770];
  v105 = *MEMORY[0x1E0CA67D8];
  v106 = *MEMORY[0x1E0CA67C8];
  v107 = *MEMORY[0x1E0CA67D0];
  v108 = *MEMORY[0x1E0CA67F8];
  v109 = *MEMORY[0x1E0CA67F0];
  v110 = *MEMORY[0x1E0CA6848];
  v111 = *MEMORY[0x1E0CA6828];
  v112 = *MEMORY[0x1E0CA6850];
  v113 = *MEMORY[0x1E0CA6868];
  v114 = *MEMORY[0x1E0CA6880];
  v115 = *MEMORY[0x1E0CA6888];
  v116 = *MEMORY[0x1E0CA6858];
  v117 = *MEMORY[0x1E0CA6830];
  v118 = *MEMORY[0x1E0CA6878];
  v119 = *MEMORY[0x1E0CA6840];
  v120 = *MEMORY[0x1E0CA6020];
  v121 = *MEMORY[0x1E0CA66F8];
  v122 = *MEMORY[0x1E0CA68B8];
  v123 = *MEMORY[0x1E0CA68C0];
  v124 = *MEMORY[0x1E0CA68C8];
  v125 = *MEMORY[0x1E0CA68D8];
  v33 = *MEMORY[0x1E0CA6900];
  v127 = CFSTR("SSAttributeTopMatchedStrings");
  v128 = *MEMORY[0x1E0CA6948];
  v129 = *MEMORY[0x1E0CA6950];
  v130 = *MEMORY[0x1E0CA6958];
  v131 = *MEMORY[0x1E0CA6960];
  v132 = *MEMORY[0x1E0CA6138];
  v133 = *MEMORY[0x1E0CA6968];
  v134 = *MEMORY[0x1E0CA6978];
  v135 = *MEMORY[0x1E0CA69A8];
  v136 = *MEMORY[0x1E0CA69B0];
  v126 = v33;
  v137 = *MEMORY[0x1E0CA6348];
  v138 = *MEMORY[0x1E0CA6438];
  v139 = *MEMORY[0x1E0CA6338];
  v140 = v33;
  v141 = *MEMORY[0x1E0CA68F8];
  v142 = *MEMORY[0x1E0CA6990];
  v143 = *MEMORY[0x1E0CA6198];
  v144 = *MEMORY[0x1E0CA5F70];
  v145 = *MEMORY[0x1E0CA6088];
  v146 = *MEMORY[0x1E0CA6118];
  v147 = *MEMORY[0x1E0CA6120];
  v148 = *MEMORY[0x1E0CA6068];
  v149 = v80;
  v150 = *MEMORY[0x1E0CA6328];
  v151 = *MEMORY[0x1E0CA6340];
  v152 = *MEMORY[0x1E0CA63C8];
  v153 = v36;
  v154 = *MEMORY[0x1E0CA66F0];
  v155 = *MEMORY[0x1E0CA6710];
  v156 = *MEMORY[0x1E0CA67C0];
  v157 = v107;
  v158 = v155;
  v159 = v122;
  v160 = *MEMORY[0x1E0CA68D0];
  v161 = v155;
  v162 = *MEMORY[0x1E0CA6910];
  v163 = *MEMORY[0x1E0CA6490];
  v164 = *MEMORY[0x1E0CA63D0];
  v165 = *MEMORY[0x1E0CA6530];
  v166 = *MEMORY[0x1E0CA6538];
  v167 = *MEMORY[0x1E0CA6A60];
  v168 = *MEMORY[0x1E0CA6A38];
  v169 = *MEMORY[0x1E0CA6A68];
  v170 = *MEMORY[0x1E0CA62E0];
  v171 = *MEMORY[0x1E0CA6240];
  v172 = *MEMORY[0x1E0CA6248];
  v173 = *MEMORY[0x1E0CA6210];
  v174 = *MEMORY[0x1E0CA61F8];
  v175 = *MEMORY[0x1E0CA6200];
  v176 = *MEMORY[0x1E0CA6208];
  v177 = *MEMORY[0x1E0CA61F0];
  v178 = *MEMORY[0x1E0CA6238];
  v179 = *MEMORY[0x1E0CA61D8];
  v180 = *MEMORY[0x1E0CA61E0];
  v181 = *MEMORY[0x1E0CA6220];
  v182 = *MEMORY[0x1E0CA6228];
  v183 = *MEMORY[0x1E0CA6218];
  v184 = *MEMORY[0x1E0CA6250];
  v185 = *MEMORY[0x1E0CA6258];
  v186 = *MEMORY[0x1E0CA61E8];
  v187 = *MEMORY[0x1E0CA6230];
  v188 = *MEMORY[0x1E0CA6288];
  v189 = *MEMORY[0x1E0CA6298];
  v190 = *MEMORY[0x1E0CA6290];
  v191 = *MEMORY[0x1E0CA6268];
  v192 = *MEMORY[0x1E0CA6278];
  v193 = *MEMORY[0x1E0CA6280];
  v194 = *MEMORY[0x1E0CA62C8];
  v195 = *MEMORY[0x1E0CA62D8];
  v196 = *MEMORY[0x1E0CA62D0];
  v197 = *MEMORY[0x1E0CA62A8];
  v198 = *MEMORY[0x1E0CA62B8];
  v199 = *MEMORY[0x1E0CA62C0];
  v200 = *MEMORY[0x1E0CA62B0];
  v201 = *MEMORY[0x1E0CA6478];
  v202 = *MEMORY[0x1E0CA5FA0];
  v203 = *MEMORY[0x1E0CA5FA8];
  v204 = *MEMORY[0x1E0CA62A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 175);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsResult:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "sectionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

+ (id)bundleId
{
  return 0;
}

+ (BOOL)isCoreSpotlightResult
{
  return 0;
}

+ (id)richTextsFromStrings:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (CGSize)defaultThumbnailSizeIsCompact:(BOOL)a3
{
  _BOOL4 v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  CGSize result;

  v3 = a3;
  if (isMacOS())
  {
    v4 = 20.0;
    if (v3)
      goto LABEL_7;
    v5 = SSSnippetModernizationEnabled() == 0;
    v4 = 48.0;
    v6 = 32.0;
  }
  else
  {
    v5 = !v3;
    v4 = 60.0;
    v6 = 29.0;
  }
  if (!v5)
    v4 = v6;
LABEL_7:
  v7 = v4;
  result.height = v7;
  result.width = v4;
  return result;
}

+ (void)setDefaultSizeForThumbnail:(id)a3 isCompact:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(v8, "size");
  if (v7 == 0.0 && v6 == 0.0)
  {
    objc_msgSend(a1, "defaultThumbnailSizeIsCompact:", v4);
    objc_msgSend(v8, "setSize:");
  }

}

+ (id)getCharacterIfWhitespaceAtIndex:(unint64_t)a3 ofString:(id)a4
{
  uint64_t v4;
  void *v5;
  __CFString *v6;

  v4 = objc_msgSend(a4, "characterAtIndex:", a3);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "characterIsMember:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E6E549F0;
  }

  return v6;
}

+ (id)whiteSpaceCondensedStringForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_41);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "getCharacterIfWhitespaceAtIndex:ofString:", 0, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getCharacterIfWhitespaceAtIndex:ofString:", objc_msgSend(v4, "length") - 1, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@%@"), v9, v12, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v4;
  }

  return v13;
}

BOOL __54__SSResultBuilder_whiteSpaceCondensedStringForString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

+ (void)condenseWhiteSpaceForRichText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "formattedTextPieces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "formattedTextPieces", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v11 = (void *)objc_opt_class();
          objc_msgSend(v10, "text");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "whiteSpaceCondensedStringForString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setText:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    goto LABEL_12;
  }
  objc_msgSend(v3, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = (void *)objc_opt_class();
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "whiteSpaceCondensedStringForString:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v17);

LABEL_12:
  }

}

+ (void)condenseWhiteSpaceForDescriptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "condenseWhiteSpaceForRichText:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (SSResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSResultBuilder *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
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
  int v25;
  void *v26;
  int v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SSResultBuilder;
  v5 = -[SSResultBuilder init](&v30, sel_init);
  if (!v5)
    goto LABEL_26;
  v6 = isMacOS();
  v7 = (__CFString *)*MEMORY[0x1E0CA6AB0];
  if (!v6)
    v7 = CFSTR("SSAttributeTopMatchedStrings");
  v8 = v7;
  objc_msgSend(v4, "valueForAttribute:withType:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder setResult:](v5, "setResult:", v4);
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  -[SSResultBuilder setMatchedStrings:](v5, "setMatchedStrings:", v11);

  if ((objc_msgSend((id)objc_opt_class(), "isCoreSpotlightResult") & 1) != 0)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA62F0], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setCoreSpotlightId:](v5, "setCoreSpotlightId:", v12);

  }
  else
  {
    -[SSResultBuilder setCoreSpotlightId:](v5, "setCoreSpotlightId:", 0);
  }
  if (objc_msgSend(v4, "hasTextContentMatch"))
  {
    -[SSResultBuilder setHasTextContentMatch:](v5, "setHasTextContentMatch:", 1);
  }
  else
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6AA8], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setHasTextContentMatch:](v5, "setHasTextContentMatch:", objc_msgSend(v13, "BOOLValue"));

  }
  -[SSResultBuilder result](v5, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "relatedAppIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[SSResultBuilder setRelatedAppBundleIdentifier:](v5, "setRelatedAppBundleIdentifier:", v15);
  }
  else
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA67F0], objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setRelatedAppBundleIdentifier:](v5, "setRelatedAppBundleIdentifier:", v16);

  }
  -[SSResultBuilder result](v5, "result");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CEC3F8];
    -[SSResultBuilder result](v5, "result");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "typeWithIdentifier:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setUniformType:](v5, "setUniformType:", v22);

  }
  if (_os_feature_enabled_impl())
  {
    -[SSResultBuilder uniformType](v5, "uniformType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v4, "sectionBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.spotlight.events"));

    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.spotlight.events"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSResultBuilder setUniformType:](v5, "setUniformType:", v23);
      goto LABEL_22;
    }
  }
LABEL_23:
  objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6050], objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedIntValue");

  if (v27)
  {
    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setBlueComponent:", (double)v27 / 255.0);
    objc_msgSend(v28, "setGreenComponent:", (double)BYTE1(v27) / 255.0);
    objc_msgSend(v28, "setRedComponent:", (double)BYTE2(v27) / 255.0);
    -[SSResultBuilder setBackgroundColor:](v5, "setBackgroundColor:", v28);

  }
LABEL_26:

  return v5;
}

- (unint64_t)numberOfLinesForDescriptions
{
  if (isMacOS())
    return 1;
  else
    return 2;
}

- (void)setMaxLinesForDescriptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "maxLines");
        if (!v10)
          v10 = -[SSResultBuilder numberOfLinesForDescriptions](self, "numberOfLinesForDescriptions");
        objc_msgSend(v9, "setMaxLines:", v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)resultAppBundleId
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "bundleId");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
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

  -[SSResultBuilder buildPreviewButtonItems](self, "buildPreviewButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder buildAppEntityAnnotation](self, "buildAppEntityAnnotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  -[SSResultBuilder buildCompactCard](self, "buildCompactCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompactCard:", v9);

  -[SSResultBuilder buildInlineCard](self, "buildInlineCard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInlineCard:", v10);

  objc_msgSend(v8, "inlineCard");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cardSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreviewButtonItems:", v3);

  objc_msgSend(v8, "compactCard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cardSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPreviewButtonItems:", v3);

  objc_msgSend(v8, "inlineCard");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cardSections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAppEntityAnnotation:", v4);

  objc_msgSend(v8, "compactCard");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cardSections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAppEntityAnnotation:", v4);

  return v8;
}

- (id)buildCompactCard
{
  void *v2;
  void *v3;

  -[SSResultBuilder buildCompactCardSections](self, "buildCompactCardSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setCardSections:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)buildInlineCard
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder buildInlineCardSections](self, "buildInlineCardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setCardSections:", v3);
    if (-[SSResultBuilder isTopHit](self, "isTopHit"))
      v5 = SSSnippetModernizationEnabled();
    else
      v5 = 0;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((v5 & 1) != 0)
            -[SSResultBuilder buildBackgroundColor](self, "buildBackgroundColor");
          else
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "backgroundColor", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setBackgroundColor:", v12, (_QWORD)v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)buildCompactCardSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder buildCompactCardSection](self, "buildCompactCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder setMaxLinesForDescriptions:](self, "setMaxLinesForDescriptions:", v4);

  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "descriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "condenseWhiteSpaceForDescriptions:", v6);

  objc_msgSend(v3, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBadgingImage:", 0);

  if (v3)
  {
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildInlineCardSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder buildInlineCardSection](self, "buildInlineCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder setMaxLinesForDescriptions:](self, "setMaxLinesForDescriptions:", v4);

  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "descriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "condenseWhiteSpaceForDescriptions:", v6);

  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildCompactCardSection
{
  void *v2;
  void *v3;
  void *v4;

  -[SSResultBuilder buildDetailedRowCardSection](self, "buildDetailedRowCardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldUseCompactDisplay:", 1);
  v3 = (void *)objc_opt_class();
  objc_msgSend(v2, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultSizeForThumbnail:isCompact:", v4, 1);

  return v2;
}

- (id)buildInlineCardSection
{
  void *v2;
  void *v3;
  void *v4;

  -[SSResultBuilder buildDetailedRowCardSection](self, "buildDetailedRowCardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  objc_msgSend(v2, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultSizeForThumbnail:isCompact:", v4, 0);

  return v2;
}

- (id)buildHorizontallyScrollingCardSection
{
  void *v3;
  void *v4;
  void *v5;

  -[SSResultBuilder subclassBuildHorizontallyScrollingCardSection](self, "subclassBuildHorizontallyScrollingCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    objc_msgSend(v3, "thumbnail");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDefaultSizeForThumbnail:isCompact:", v5, 0);

  }
  -[SSResultBuilder buildDefaultPropertiesForCardSection:](self, "buildDefaultPropertiesForCardSection:", v3);
  return v3;
}

- (id)buildAppTopHitEntityCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  -[SSResultBuilder buildTitle](self, "buildTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaxLines:", 2);

  -[SSResultBuilder buildThumbnail](self, "buildThumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setThumbnail:", v6);

  objc_msgSend(v3, "thumbnail");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBadgingImage:", 0);

  -[SSResultBuilder buildFootnote](self, "buildFootnote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFootnote:", v8);

  objc_msgSend(v3, "footnote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaxLines:", 1);

  -[SSResultBuilder buildCommand](self, "buildCommand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCommand:", v10);

  objc_msgSend(v3, "setUseAppIconMetrics:", 1);
  -[SSResultBuilder buildAppEntityAnnotation](self, "buildAppEntityAnnotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppEntityAnnotation:", v11);

  return v3;
}

- (void)buildDefaultPropertiesForCardSection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v8, "setCommand:", v4);
  }
  else
  {
    -[SSResultBuilder buildCommand](self, "buildCommand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCommand:", v5);

  }
  objc_msgSend(v8, "previewCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v8, "setPreviewCommand:", v6);
  }
  else
  {
    -[SSResultBuilder buildPreviewCommand](self, "buildPreviewCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreviewCommand:", v7);

  }
}

- (id)buildDetailedRowCardSection
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  SSResultBuilder *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  -[SSResultBuilder buildPunchouts](self, "buildPunchouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPunchoutOptions:", v5);

  -[SSResultBuilder buildThumbnail](self, "buildThumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumbnail:", v6);

  v7 = SSSnippetModernizationEnabled();
  if (v7)
  {
    objc_msgSend(v4, "thumbnail");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder buildBadgingImageWithThumbnail:](self, "buildBadgingImageWithThumbnail:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBadgingImage:", v8);

  if (v7)
  {

  }
  -[SSResultBuilder buildTrailingThumbnail](self, "buildTrailingThumbnail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingThumbnail:", v10);

  -[SSResultBuilder buildTitle](self, "buildTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v11);

  -[SSResultBuilder buildSecondaryTitle](self, "buildSecondaryTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryTitle:", v12);

  objc_msgSend(v4, "secondaryTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "maxLines");
  if (v14 <= 1)
    v15 = 1;
  else
    v15 = v14;
  objc_msgSend(v4, "secondaryTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMaxLines:", v15);

  -[SSResultBuilder buildSecondaryTitleImage](self, "buildSecondaryTitleImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryTitleImage:", v17);

  objc_msgSend(v4, "setIsSecondaryTitleDetached:", -[SSResultBuilder buildSecondaryTitleIsDetached](self, "buildSecondaryTitleIsDetached"));
  v58 = self;
  -[SSResultBuilder buildDescriptions](self, "buildDescriptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v61 != v22)
          objc_enumerationMutation(v19);
        v9 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v9, "text");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "title");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "text");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "isEqualToString:", v26);

        if ((v27 & 1) == 0)
          objc_msgSend(v59, "addObject:", v9);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v59, "count"))
    v28 = v59;
  else
    v28 = 0;
  objc_msgSend(v4, "setDescriptions:", v28);
  objc_msgSend(v4, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "maxLines");
  if (v30)
  {
    v31 = v30;
    v32 = 0;
  }
  else if (SSSnippetModernizationEnabled())
  {
    objc_msgSend(v4, "descriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 1;
    if (v9)
      v31 = 1;
    else
      v31 = 2;
  }
  else
  {
    v32 = 0;
    v31 = 2;
  }
  objc_msgSend(v4, "title");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMaxLines:", v31);

  if (v32)
  -[SSResultBuilder buildFootnote](v58, "buildFootnote");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFootnote:", v34);

  objc_msgSend(v4, "footnote");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "maxLines");
  if (v36)
    v37 = v36;
  else
    v37 = 2;
  objc_msgSend(v4, "footnote");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setMaxLines:", v37);

  -[SSResultBuilder buildTrailingTopText](v58, "buildTrailingTopText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingTopText:", v39);

  objc_msgSend(v4, "trailingTopText");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "maxLines");
  if (v41 <= 1)
    v42 = 1;
  else
    v42 = v41;
  objc_msgSend(v4, "trailingTopText");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setMaxLines:", v42);

  -[SSResultBuilder buildTrailingMiddleText](v58, "buildTrailingMiddleText");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingMiddleText:", v44);

  objc_msgSend(v4, "trailingMiddleText");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "maxLines");
  if (v46 <= 1)
    v47 = 1;
  else
    v47 = v46;
  objc_msgSend(v4, "trailingMiddleText");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setMaxLines:", v47);

  -[SSResultBuilder buildTrailingBottomText](v58, "buildTrailingBottomText");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingBottomText:", v49);

  objc_msgSend(v4, "trailingBottomText");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "maxLines");
  if (v51 <= 1)
    v52 = 1;
  else
    v52 = v51;
  objc_msgSend(v4, "trailingBottomText");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setMaxLines:", v52);

  -[SSResultBuilder buildAction](v58, "buildAction");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAction:", v54);

  -[SSResultBuilder buildButtonItems](v58, "buildButtonItems");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonItems:", v55);

  objc_msgSend(v4, "setPreventThumbnailImageScaling:", -[SSResultBuilder buildPreventThumbnailImageScaling](v58, "buildPreventThumbnailImageScaling"));
  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[SSResultBuilder buildButtonItemsAreTrailing](v58, "buildButtonItemsAreTrailing"));
  objc_msgSend(v4, "descriptions");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder setMaxLinesForDescriptions:](v58, "setMaxLinesForDescriptions:", v56);

  -[SSResultBuilder buildDefaultPropertiesForCardSection:](v58, "buildDefaultPropertiesForCardSection:", v4);
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  -[SSResultBuilder bundleIdentifierForAppIconBadgeImage](self, "bundleIdentifierForAppIconBadgeImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v4, "bundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", v6),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setBundleIdentifier:", v6);
  }

  return v9;
}

- (id)bundleIdentifierForAppIconBadgeImage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "bundleId");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)buildPreviewButtonItems
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSResultBuilder result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSResultBuilder result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationBundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder result](self, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForAttribute:withType:", *MEMORY[0x1E0CA5F48], objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setActionItemTypes:", v9);
    objc_msgSend(v10, "setApplicationBundleIdentifier:", v5);
    objc_msgSend(v10, "setCoreSpotlightIdentifier:", v7);
    objc_msgSend(v3, "addObject:", v10);

  }
  -[SSResultBuilder result](self, "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemProviderDataTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSResultBuilder result](self, "result");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemProviderFileTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSResultBuilder result](self, "result");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForAttribute:withType:", *MEMORY[0x1E0CA6898], objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = CFSTR("com.apple.mobilemail");
  v29[1] = CFSTR("com.apple.mobilenotes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v5);

  if (v12 || v14 || v16)
  {
    if ((v18 & 1) != 0 || SSSectionIsSyndicatedPhotos(v27))
    {
      v19 = (void *)objc_opt_new();
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setApplicationBundleIdentifier:", v5);
      objc_msgSend(v20, "setCoreSpotlightIdentifier:", v7);
      objc_msgSend(v20, "setDataProviderTypeIdentifiers:", v12);
      objc_msgSend(v20, "setFileProviderTypeIdentifiers:", v14);
      if (!v14 && v16)
      {
        v28 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setFileProviderTypeIdentifiers:", v21);

      }
      objc_msgSend(v19, "setCopyableItem:", v20);
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setCommand:", v19);
      objc_msgSend(v3, "addObject:", v22);

    }
    if (v16)
    {
      v23 = (void *)objc_opt_new();
      v24 = (void *)objc_opt_new();
      objc_msgSend(v24, "setShareProviderTypeIdentifier:", v16);
      objc_msgSend(v24, "setApplicationBundleIdentifier:", v5);
      objc_msgSend(v24, "setCoreSpotlightIdentifier:", v7);
      objc_msgSend(v24, "setShareProviderTypeIdentifier:", v16);
      objc_msgSend(v23, "setShareItem:", v24);
      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "setCommand:", v23);
      objc_msgSend(v3, "addObject:", v25);

    }
  }

  return v3;
}

- (id)buildPunchouts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6730], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6058], objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6108], objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v4 && (v6 & 1) == 0 && !v7)
    goto LABEL_12;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setLabel:", v4);
  objc_msgSend(v9, "setIsRunnableInBackground:", v6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUrls:", v12);
    }
    else
    {
      SSGeneralLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[SSResultBuilder buildPunchouts].cold.1((uint64_t)self, (uint64_t)v8, v12);
    }

  }
  if (v9)
  {
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v13 = 0;
  }

  return v13;
}

- (id)buildThumbnail
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6950], objc_opt_class());
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6948], objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6938], objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6940], objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6958], objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlValueForAttribute:", *MEMORY[0x1E0CA6960]);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlValueForAttribute:", *MEMORY[0x1E0CA6138]);
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnail");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v36 = (void *)v8;
  v38 = (void *)v4;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "bundleId");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  *((_QWORD *)&v39 + 1) = v12;

  -[SSResultBuilder relatedAppBundleIdentifier](self, "relatedAppBundleIdentifier");
  *(_QWORD *)&v39 = objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder result](self, "result");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0)
  {
    -[SSResultBuilder result](self, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userActivityRequiredString");
    v17 = v7;
    v18 = v6;
    v19 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsString:", CFSTR("com.apple.calendarUIKit.userActivity.tomorrow"));

    v5 = v19;
    v6 = v18;
    v7 = v17;

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x1E0D8C200]);
      +[SSDateFormatManager tomorrow](SSDateFormatManager, "tomorrow");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v22, "initWithDate:", v23);

      v25 = v36;
      v26 = v38;
LABEL_10:
      v29 = (void *)v37;
LABEL_16:
      v30 = v35;
      goto LABEL_17;
    }
  }
  else
  {

  }
  v26 = v38;
  if (v38)
  {
    v27 = objc_alloc(MEMORY[0x1E0D8C7F8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v38, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v27, "initWithURL:", v28);

    v25 = v36;
    goto LABEL_10;
  }
  v29 = (void *)v37;
  if (v15 | v37)
  {
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C7F8]), "initWithURL:", v15);
    objc_msgSend(v24, "setDarkUrlValue:", v37);
LABEL_15:
    v25 = v36;
    goto LABEL_16;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D8C418], "imageWithData:", v5);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v30 = v35;
  v25 = v36;
  if (v7 | v6)
  {
    v24 = (id)objc_opt_new();
    objc_msgSend(v24, "setContentType:", v7);
    v33 = v24;
    v34 = v6;
  }
  else
  {
    if (v36)
    {
      v24 = (id)objc_opt_new();
      objc_msgSend(v24, "setIsTemplate:", 1);
      objc_msgSend(v24, "setSymbolName:", v36);
      objc_msgSend(v24, "setPunchThroughBackground:", 1);
      goto LABEL_17;
    }
    if (v35)
    {
      v24 = v35;
      goto LABEL_17;
    }
    v31 = (void *)v39;
    if (v39 == 0)
    {
      v24 = 0;
      goto LABEL_18;
    }
    v33 = (void *)objc_opt_new();
    v24 = v33;
    if ((_QWORD)v39)
      v34 = v39;
    else
      v34 = *((_QWORD *)&v39 + 1);
  }
  objc_msgSend(v33, "setBundleIdentifier:", v34);
LABEL_17:
  v31 = (void *)v39;
LABEL_18:

  return v24;
}

- (id)buildTrailingThumbnail
{
  return 0;
}

- (id)buildTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA68D8], objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v8 = v3;
  }
  else if (objc_msgSend(v4, "length"))
  {
    v8 = v4;
  }
  else
  {
    if (!objc_msgSend(v5, "length"))
    {
      if (v7)
      {
        v9 = v7;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NO_TITLE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_8;
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    v8 = v5;
  }
  v9 = v8;
  if (!v8)
    goto LABEL_12;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v10;
}

- (id)buildSecondaryTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D8C3D0];
    -[SSResultBuilder result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondaryTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)buildSecondaryTitleIsDetached
{
  void *v2;
  char v3;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSecondaryTitleDetached");

  return v3;
}

- (id)buildSecondaryTitleImage
{
  void *v2;
  void *v3;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTitleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buildDescriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA68B8], objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  if (v4)
    v7 = v4;
  else
    v7 = v3;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "addObjectsFromArray:", v5);
  }
  if (objc_msgSend(v6, "count"))
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (id)buildFootnote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footnote");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D8C660];
    -[SSResultBuilder result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footnote");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildTrailingTopText
{
  return 0;
}

- (id)buildTrailingMiddleText
{
  return 0;
}

- (id)buildTrailingBottomText
{
  return 0;
}

- (id)buildAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  float v30;
  float v31;
  void *v33;
  void *v34;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v2, "contentTypeTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEC458], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  if ((objc_msgSend(v6, "containsObject:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC598], "identifier", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v9);

  }
  if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.Music")) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v3, "isEqual:", CFSTR("com.apple.TV"));
  v34 = v3;
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA6978], objc_opt_class());
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if ((v8 & v10) != 0)
    v13 = (void *)v11;
  else
    v13 = 0;
  v14 = v13;
  v15 = v14;
  if (v14)
    v16 = objc_msgSend(v14, "hasPrefix:", CFSTR("x-media-library://")) ^ 1;
  else
    v16 = 1;
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA6570], objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA68F0], objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA6458], objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA6470], objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForAttribute:withType:", *MEMORY[0x1E0CA68E8], objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  objc_msgSend(v2, "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length") || (v16 & 1) != 0)
  {
    if (objc_msgSend(v18, "length", v33))
      v28 = v20;
    else
      v28 = 0;
    if (v28 == 1)
    {
      v26 = (id)objc_opt_new();
      objc_msgSend(v26, "setPhoneNumber:", v18);
    }
    else
    {
      v26 = 0;
    }
    v27 = v34;
    if (v21 && v22 && ((v24 ^ 1) & 1) == 0)
    {
      v29 = (void *)objc_opt_new();
      objc_msgSend(v21, "floatValue");
      objc_msgSend(v29, "setLat:", v30);
      objc_msgSend(v22, "floatValue");
      objc_msgSend(v29, "setLng:", v31);
      if (!v26)
        v26 = (id)objc_opt_new();
      objc_msgSend(v26, "setLocation:", v29);

    }
  }
  else
  {
    v26 = (id)objc_opt_new();
    objc_msgSend(v26, "setLocalMediaIdentifier:", v15);
    v27 = v34;
  }
  if (!v26 && v25)
    v26 = v25;

  return v26;
}

- (id)buildHighlightedMatchedTextWithTitle:(id)a3 headTruncation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SSResultBuilder queryContext](self, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "length");

  if (v9)
  {
    -[SSResultBuilder queryContext](self, "queryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "evaluator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SSResultBuilder matchedStrings](self, "matchedStrings", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          getHighlightedRichText(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v16), v11, v6, v4);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v9 = (void *)v17;
            goto LABEL_12;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v14)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_12:

  }
  return v9;
}

- (id)buildHighlightedTextWithString:(id)a3 includeQuotes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
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
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];

  v4 = a4;
  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SSResultBuilder queryContext](self, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "precomposedStringWithCompatibilityMapping");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E6E549F0;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  -[SSResultBuilder matchedStrings](self, "matchedStrings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v6) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v6, "precomposedStringWithCompatibilityMapping");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "localizedStandardContainsString:", v12);

  }
  v16 = (void *)MEMORY[0x1E0D8C660];
  if (v4)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("QUOTED_TRANSCRIPT_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_16;
  }
  if ((unint64_t)-[__CFString length](v12, "length") >= 4)
  {
    -[SSResultBuilder queryContext](self, "queryContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "evaluator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    getHighlightedRichText(v6, v23, 0, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "formattedTextPieces");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v27 = v24;

      if (v4)
      {
        v28 = (void *)MEMORY[0x1E0D8C3D0];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("OPEN_QUOTE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "textWithString:", v39);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "formattedTextPieces");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v36);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0D8C3D0];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CLOSED_QUOTE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "textWithString:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "arrayByAddingObject:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFormattedTextPieces:", v34);

      }
    }
    else
    {
      v27 = v21;
    }

    v21 = v27;
  }
LABEL_16:

  return v21;
}

- (id)buildButtonItems
{
  return 0;
}

- (id)buildPreviewCommand
{
  return 0;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA6848], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSResultBuilder result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForAttribute:withType:", *MEMORY[0x1E0CA69A8], objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setIntentMessageData:", v4);
    objc_msgSend(v7, "setIsRunnableWorkflow:", 1);
    -[SSResultBuilder result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForAttribute:withType:", *MEMORY[0x1E0CA6830], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCommandDetail:", v9);

    -[SSResultBuilder result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForAttribute:withType:", *MEMORY[0x1E0CA6840], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBiomeStreamIdentifier:", v11);
LABEL_7:

    goto LABEL_8;
  }
  -[SSResultBuilder result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.siri.interaction"));

  if (v14)
  {
    v7 = (void *)objc_opt_new();
    -[SSResultBuilder result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForAttribute:withType:", *MEMORY[0x1E0CA62F0], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVoiceShortcutIdentifier:", v11);
    goto LABEL_7;
  }
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setUserActivityRequiredString:", v6);
    -[SSResultBuilder result](self, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setApplicationBundleIdentifier:", v11);
    goto LABEL_7;
  }
  -[SSResultBuilder relatedAppBundleIdentifier](self, "relatedAppBundleIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[SSResultBuilder resultAppBundleId](self, "resultAppBundleId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
    {
      v19 = isMacOS();

      if (!v19)
        goto LABEL_13;
    }
    else
    {

    }
    v7 = (void *)objc_opt_new();
    -[SSResultBuilder result](self, "result");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCoreSpotlightIdentifier:", v29);

    -[SSResultBuilder relatedAppBundleIdentifier](self, "relatedAppBundleIdentifier");
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_13:
  -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[SSResultBuilder resultAppBundleId](self, "resultAppBundleId");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[SSResultBuilder resultAppBundleId](self, "resultAppBundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.CalendarUI"));

      if ((v25 & 1) == 0)
      {
        v7 = (void *)objc_opt_new();
        -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCoreSpotlightIdentifier:", v26);

        -[SSResultBuilder resultAppBundleId](self, "resultAppBundleId");
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v10 = (void *)v27;
        objc_msgSend(v7, "setApplicationBundleIdentifier:", v27);
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  -[SSResultBuilder filePath](self, "filePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_9;
  v30 = (void *)MEMORY[0x1E0D8C5E0];
  v31 = (void *)MEMORY[0x1E0C99E98];
  -[SSResultBuilder filePath](self, "filePath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "fileURLWithPath:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "punchoutWithURL:", v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPunchout:", v10);
LABEL_8:

LABEL_9:
  return v7;
}

- (BOOL)buildPreventThumbnailImageScaling
{
  return 0;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 0;
}

- (id)buildAppEntityAnnotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FA8], objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSResultBuilder result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FA0], objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length") && objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setTypeIdentifer:", v4);
    objc_msgSend(v7, "setEntityIdentifer:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)supportsClearingBackendData
{
  void *v3;
  void *v4;
  char v5;
  char v6;

  -[SSResultBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SSResultBuilder queryContext](self, "queryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "retainBackendData");

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (id)stringForSFRichText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    v6 = (void *)objc_opt_new();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "formattedTextPieces", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "text");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v12, "text");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  return v6;
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (void)setIsTopHit:(BOOL)a3
{
  self->_isTopHit = a3;
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)setQueryContext:(id)a3
{
  objc_storeStrong((id *)&self->_queryContext, a3);
}

- (SFSearchResult_SpotlightExtras)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)coreSpotlightId
{
  return self->_coreSpotlightId;
}

- (void)setCoreSpotlightId:(id)a3
{
  objc_storeStrong((id *)&self->_coreSpotlightId, a3);
}

- (NSArray)matchedStrings
{
  return self->_matchedStrings;
}

- (void)setMatchedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_matchedStrings, a3);
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (BOOL)hasTextContentMatch
{
  return self->_hasTextContentMatch;
}

- (void)setHasTextContentMatch:(BOOL)a3
{
  self->_hasTextContentMatch = a3;
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NSString)relatedAppBundleIdentifier
{
  return self->_relatedAppBundleIdentifier;
}

- (void)setRelatedAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_relatedAppBundleIdentifier, a3);
}

- (UTType)uniformType
{
  return self->_uniformType;
}

- (void)setUniformType:(id)a3
{
  objc_storeStrong((id *)&self->_uniformType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformType, 0);
  objc_storeStrong((id *)&self->_relatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_matchedStrings, 0);
  objc_storeStrong((id *)&self->_coreSpotlightId, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
}

- (void)buildPunchouts
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = objc_opt_class();
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_1B86C5000, a3, OS_LOG_TYPE_FAULT, "URLString present but invalid in %@: %@", (uint8_t *)&v5, 0x16u);
}

@end
