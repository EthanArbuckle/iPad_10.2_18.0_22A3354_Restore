@implementation MOBiomeDonationUtility

- (MOBiomeDonationUtility)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MOBiomeDonationUtility;
  v2 = -[MOBiomeDonationUtility init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC758));
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC770));
    v6 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC788));
    v8 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC7A0));
    v10 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v9;

    *(_OWORD *)(v2 + 8) = xmmword_10029F0C0;
    *(_OWORD *)(v2 + 72) = xmmword_10029F0D0;
    *((_QWORD *)v2 + 3) = 0x4248000041200000;
    *((_DWORD *)v2 + 8) = 1133903872;
  }
  return (MOBiomeDonationUtility *)v2;
}

- (id)convertEventBundle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  int v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  void *k;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  void *m;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  void *n;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  void *ii;
  void *v114;
  void *v115;
  NSMutableArray *v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  uint64_t v122;
  void *jj;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  id v129;
  uint64_t v130;
  void *kk;
  void *v132;
  void *v133;
  id v134;
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
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  _BOOL8 v157;
  _BOOL8 v158;
  _BOOL8 v159;
  uint64_t v160;
  void *v161;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  unsigned int v180;
  void *v181;
  unsigned int v182;
  _BOOL4 v183;
  void *v184;
  unsigned int v185;
  unsigned int v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  void *v193;
  void *v194;
  id v195;
  void *v196;
  unsigned int v197;
  unsigned int v198;
  unsigned int v199;
  uint64_t v200;
  int v201;
  unsigned int v202;
  unsigned int v203;
  id v204;
  _BOOL4 v205;
  void *v206;
  _BOOL4 v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  id v212;
  void *v213;
  id v214;
  void *v215;
  id v216;
  void *v217;
  id v218;
  void *v219;
  void *v220;
  id v221;
  void *v222;
  id v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  id v231;
  void *v232;
  NSMutableArray *v233;
  NSMutableArray *v234;
  NSMutableArray *v235;
  NSMutableArray *v236;
  NSMutableArray *v237;
  NSMutableArray *v238;
  NSMutableArray *v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  _BYTE v272[128];
  _BYTE v273[128];
  _BYTE v274[128];
  _BYTE v275[128];
  _BYTE v276[128];
  _BYTE v277[128];
  _BYTE v278[128];
  _BYTE v279[128];

  v4 = a3;
  v223 = objc_msgSend(v4, "source");
  v221 = objc_msgSend(v4, "source");
  v218 = objc_msgSend(v4, "source");
  v216 = objc_msgSend(v4, "source");
  v214 = objc_msgSend(v4, "source");
  v212 = objc_msgSend(v4, "source");
  v210 = objc_msgSend(v4, "source");
  v239 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
  v6 = objc_msgSend(v5, "count");

  v231 = v4;
  if (v6)
  {
    v271 = 0u;
    v270 = 0u;
    v269 = 0u;
    v268 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v268, v279, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v269;
      v11 = 2;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v269 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v268 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventIdentifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
          -[NSMutableArray addObject:](v239, "addObject:", v15);

          if (objc_msgSend(v13, "provider") == (id)5)
            v11 = 1;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v268, v279, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 2;
    }

    v4 = v231;
  }
  else
  {
    v11 = 2;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  v230 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertAction:](self, "convertAction:", v16));

  v238 = objc_opt_new(NSMutableArray);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundActions"));
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v267 = 0u;
    v266 = 0u;
    v265 = 0u;
    v264 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundActions"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v264, v278, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v265;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v265 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertAction:](self, "convertAction:", *(_QWORD *)(*((_QWORD *)&v264 + 1) + 8 * (_QWORD)j)));
          -[NSMutableArray addObject:](v238, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v264, v278, 16);
      }
      while (v21);
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));

  if (!v25)
  {
    v202 = 0;
    v203 = 0;
    goto LABEL_38;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("LabelConfidence")));
  if (!v27)
  {
    v203 = 0;
    goto LABEL_30;
  }
  v28 = (void *)v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("LabelConfidence")));
  v32 = objc_opt_class(NSNumber, v31);
  v33 = v4;
  isKindOfClass = objc_opt_isKindOfClass(v30, v32);

  if ((isKindOfClass & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "metaDataForRank"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("LabelConfidence")));
    objc_msgSend(v35, "floatValue");
    v203 = -[MOBiomeDonationUtility mapLabelConfidenceScore:](self, "mapLabelConfidenceScore:");

    v4 = v33;
LABEL_30:

    goto LABEL_32;
  }
  v203 = 0;
  v4 = v33;
LABEL_32:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("TimeCorrelationScore")));
  if (!v37)
  {
    v202 = 0;
    goto LABEL_36;
  }
  v38 = (void *)v37;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("TimeCorrelationScore")));
  v42 = objc_opt_class(NSNumber, v41);
  v43 = v4;
  v44 = objc_opt_isKindOfClass(v40, v42);

  if ((v44 & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "metaDataForRank"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("TimeCorrelationScore")));
    objc_msgSend(v45, "floatValue");
    v202 = -[MOBiomeDonationUtility mapTimeCorrelationScore:](self, "mapTimeCorrelationScore:");

    v4 = v43;
LABEL_36:

    goto LABEL_38;
  }
  v202 = 0;
  v4 = v43;
LABEL_38:
  if (objc_msgSend(v4, "interfaceType") == (id)4)
  {
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
    if (v46)
    {
      v47 = (void *)v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
      v49 = objc_msgSend(v48, "placeUserType") == (id)1;

    }
    else
    {
      v49 = 0;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("callDuration")));
      objc_msgSend(v52, "doubleValue");
      v54 = v53;

      HIDWORD(v200) = -[MOBiomeDonationUtility mapCallDurationType:](self, "mapCallDurationType:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("burstyInteractionCount")));

      if (v56)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("burstyInteractionCount")));
        LODWORD(v200) = -[MOBiomeDonationUtility mapBurstyInteractionCount:](self, "mapBurstyInteractionCount:", (int)objc_msgSend(v58, "intValue"));

      }
      else
      {
        LODWORD(v200) = 0;
      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("contactLocationWork")));
      v61 = objc_msgSend(v60, "BOOLValue");

      if (v61)
        v49 = 2;
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("SigConType")));
      v199 = objc_msgSend(v63, "intValue");

    }
    else
    {
      v199 = 0;
      v200 = 0;
    }
  }
  else
  {
    v199 = 0;
    v200 = 0;
    v49 = 0;
  }
  v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
  v201 = v49;
  if (!v64
    || (v65 = (void *)v64,
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place")),
        objc_msgSend(v66, "distanceToHomeInMiles"),
        v68 = v67,
        v66,
        v65,
        v68 == 0.0))
  {
    v197 = 0;
    v198 = 0;
  }
  else
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
    objc_msgSend(v69, "distanceToHomeInMiles");
    v71 = v70;

    if (v71 > 0.0)
      v72 = 1;
    else
      v72 = 2;
    v198 = v72;
    v197 = -[MOBiomeDonationUtility mapDistanceToHomeInMiles:](self, "mapDistanceToHomeInMiles:", v71);
  }
  v235 = objc_opt_new(NSMutableArray);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subBundleIDs"));
  v74 = objc_msgSend(v73, "count");

  if (v74)
  {
    v263 = 0u;
    v262 = 0u;
    v261 = 0u;
    v260 = 0u;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subBundleIDs"));
    v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v260, v277, 16);
    if (v76)
    {
      v78 = v76;
      v79 = *(_QWORD *)v261;
      do
      {
        for (k = 0; k != v78; k = (char *)k + 1)
        {
          if (*(_QWORD *)v261 != v79)
            objc_enumerationMutation(v75);
          v81 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * (_QWORD)k);
          v82 = objc_opt_class(NSString, v77);
          if ((objc_opt_isKindOfClass(v81, v82) & 1) != 0)
          {
            -[NSMutableArray addObject:](v235, "addObject:", v81);
          }
          else
          {
            v84 = objc_opt_class(NSUUID, v83);
            if ((objc_opt_isKindOfClass(v81, v84) & 1) != 0)
            {
              v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "UUIDString"));
              -[NSMutableArray addObject:](v235, "addObject:", v85);

            }
          }
        }
        v78 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v260, v277, 16);
      }
      while (v78);
    }

    v4 = v231;
  }
  v234 = objc_opt_new(NSMutableArray);
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subSuggestionIDs"));
  v87 = objc_msgSend(v86, "count");

  if (v87)
  {
    v259 = 0u;
    v258 = 0u;
    v257 = 0u;
    v256 = 0u;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subSuggestionIDs"));
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v256, v276, 16);
    if (v89)
    {
      v91 = v89;
      v92 = *(_QWORD *)v257;
      do
      {
        for (m = 0; m != v91; m = (char *)m + 1)
        {
          if (*(_QWORD *)v257 != v92)
            objc_enumerationMutation(v88);
          v94 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * (_QWORD)m);
          v95 = objc_opt_class(NSString, v90);
          if ((objc_opt_isKindOfClass(v94, v95) & 1) != 0)
          {
            -[NSMutableArray addObject:](v234, "addObject:", v94);
          }
          else
          {
            v97 = objc_opt_class(NSUUID, v96);
            if ((objc_opt_isKindOfClass(v94, v97) & 1) != 0)
            {
              v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "UUIDString"));
              -[NSMutableArray addObject:](v234, "addObject:", v98);

            }
          }
        }
        v91 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v256, v276, 16);
      }
      while (v91);
    }

    v4 = v231;
  }
  v237 = objc_opt_new(NSMutableArray);
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
  v100 = objc_msgSend(v99, "count");

  if (v100)
  {
    v255 = 0u;
    v254 = 0u;
    v253 = 0u;
    v252 = 0u;
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v252, v275, 16);
    if (v102)
    {
      v103 = v102;
      v104 = *(_QWORD *)v253;
      do
      {
        for (n = 0; n != v103; n = (char *)n + 1)
        {
          if (*(_QWORD *)v253 != v104)
            objc_enumerationMutation(v101);
          v106 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertResource:](self, "convertResource:", *(_QWORD *)(*((_QWORD *)&v252 + 1) + 8 * (_QWORD)n)));
          -[NSMutableArray addObject:](v237, "addObject:", v106);

        }
        v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v252, v275, 16);
      }
      while (v103);
    }

  }
  v236 = objc_opt_new(NSMutableArray);
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
  v108 = objc_msgSend(v107, "count");

  if (v108)
  {
    v251 = 0u;
    v250 = 0u;
    v249 = 0u;
    v248 = 0u;
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
    v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v248, v274, 16);
    if (v110)
    {
      v111 = v110;
      v112 = *(_QWORD *)v249;
      do
      {
        for (ii = 0; ii != v111; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v249 != v112)
            objc_enumerationMutation(v109);
          v114 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertPerson:](self, "convertPerson:", *(_QWORD *)(*((_QWORD *)&v248 + 1) + 8 * (_QWORD)ii)));
          -[NSMutableArray addObject:](v236, "addObject:", v114);

        }
        v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v248, v274, 16);
      }
      while (v111);
    }

  }
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
  v229 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertPlace:](self, "convertPlace:", v115));

  v116 = objc_opt_new(NSMutableArray);
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "places"));
  v118 = objc_msgSend(v117, "count");

  if (v118)
  {
    v247 = 0u;
    v246 = 0u;
    v245 = 0u;
    v244 = 0u;
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "places"));
    v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v244, v273, 16);
    if (v120)
    {
      v121 = v120;
      v122 = *(_QWORD *)v245;
      do
      {
        for (jj = 0; jj != v121; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v245 != v122)
            objc_enumerationMutation(v119);
          v124 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertPlace:](self, "convertPlace:", *(_QWORD *)(*((_QWORD *)&v244 + 1) + 8 * (_QWORD)jj)));
          -[NSMutableArray addObject:](v116, "addObject:", v124);

        }
        v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v244, v273, 16);
      }
      while (v121);
    }

    v4 = v231;
  }
  v233 = objc_opt_new(NSMutableArray);
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photoTraits"));
  v126 = objc_msgSend(v125, "count");

  if (v126)
  {
    v243 = 0u;
    v242 = 0u;
    v241 = 0u;
    v240 = 0u;
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photoTraits"));
    v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v240, v272, 16);
    if (v128)
    {
      v129 = v128;
      v130 = *(_QWORD *)v241;
      do
      {
        for (kk = 0; kk != v129; kk = (char *)kk + 1)
        {
          if (*(_QWORD *)v241 != v130)
            objc_enumerationMutation(v127);
          v132 = *(void **)(*((_QWORD *)&v240 + 1) + 8 * (_QWORD)kk);
          v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "name"));
          v134 = objc_msgSend(v133, "length");

          if (v134)
          {
            v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "name"));
            -[NSMutableArray addObject:](v233, "addObject:", v135);

          }
        }
        v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v240, v272, 16);
      }
      while (v129);
    }

    v4 = v231;
  }
  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
  v228 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertClusterMetadata:](self, "convertClusterMetadata:", v136));

  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
  v232 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertOutlierMetadata:](self, "convertOutlierMetadata:", v137));

  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
  if (!v138)
  {
    v227 = 0;
    v226 = 0;
    v209 = 0;
    v220 = 0;
LABEL_138:
    v225 = 0;
    goto LABEL_139;
  }
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));

  if (v140)
  {
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
    v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));

  }
  else
  {
    v227 = 0;
  }
  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("distinctnessScore")));

  if (v143)
  {
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
    v145 = objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "objectForKeyedSubscript:", CFSTR("distinctnessScore")));

  }
  else
  {
    v145 = 0;
  }
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("richnessScore")));

  if (v147)
  {
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
    v149 = objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("richnessScore")));

  }
  else
  {
    v149 = 0;
  }
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("engagementScore")));

  if (v151)
  {
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
    v153 = objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "objectForKeyedSubscript:", CFSTR("engagementScore")));

  }
  else
  {
    v153 = 0;
  }
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "objectForKeyedSubscript:", CFSTR("heuristicsScore")));

  v226 = (void *)v145;
  v220 = (void *)v153;
  v209 = (void *)v149;
  if (!v155)
    goto LABEL_138;
  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
  v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "objectForKeyedSubscript:", CFSTR("heuristicsScore")));

LABEL_139:
  v157 = v210 == (id)1;
  v158 = v212 == (id)7;
  v183 = v214 == (id)16;
  v205 = v216 == (id)8;
  v207 = v218 == (id)4;
  v159 = v221 == (id)2;
  v160 = v223 == (id)1;
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
  v224 = (void *)objc_claimAutoreleasedReturnValue(-[MOBiomeDonationUtility convertMetadataForRankgDictionary:](self, "convertMetadataForRankgDictionary:", v161));

  v195 = objc_alloc((Class)BMMomentsEventDataEventBundle);
  v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "UUIDString"));
  v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));
  v192 = objc_msgSend(v4, "interfaceType");
  v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v160));
  v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v159));
  v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v207));
  v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v205));
  v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "promptLanguage"));
  v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
  v186 = objc_msgSend(v194, "placeType");
  v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
  v185 = objc_msgSend(v193, "placeUserType");
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
  v182 = objc_msgSend(v191, "timeTag");
  v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "UUIDString"));
  v180 = objc_msgSend(v4, "photoSource");
  v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v183));
  v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v158));
  v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v157));
  v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
  v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v184, "count")));
  v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
  LODWORD(v160) = objc_msgSend(v181, "placeType");
  v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "filtered")));
  objc_msgSend(v4, "bundleSuperType");
  objc_msgSend(v4, "bundleSubType");
  v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isAggregatedAndSuppressed")));
  objc_msgSend(v4, "summarizationGranularity");
  v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "includedInSummaryBundleOnly")));
  HIDWORD(v171) = v11;
  HIDWORD(v170) = v160;
  HIDWORD(v169) = v203;
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstCreationDate"));
  LODWORD(v171) = 0;
  LODWORD(v169) = 0;
  LODWORD(v168) = 0;
  LODWORD(v167) = 0;
  LODWORD(v166) = 0;
  LODWORD(v165) = 0;
  LODWORD(v164) = v182;
  LODWORD(v163) = 0;
  LODWORD(v170) = 0;
  v204 = objc_msgSend(v195, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:",
           v222,
           v219,
           v217,
           v215,
           v213,
           v192,
           v211,
           v189,
           v208,
           v188,
           v187,
           0,
           0,
           __PAIR64__(v185, v186),
           v163,
           v239,
           v230,
           v238,
           0,
           v164,
           0,
           0,
           0,
           0,
           0,
           0,
           v165,
           0,
           0,
           v166,
           0,
           0,
           0,
           0,
           v167,
           0,
           0,
           0,
           0,
           0,
           0,
           v168,
           0,
           0,
           v206,
           v180,
           v179,
           v178,
           v177,
           &__kCFBooleanFalse,
           &__kCFBooleanFalse,
           &__NSArray0__struct,
           v176,
           v169,
           __PAIR64__(HIDWORD(v200), v202),
           __PAIR64__(v199, v200),
           __PAIR64__(v197, v201),
           v198,
           v170,
           v171,
           v174);

  return v204;
}

- (id)convertEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  void *v32;
  id v33;
  void *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  unsigned int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
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
  NSMutableArray *v104;
  double v105;
  double v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __int16 v111;
  double v112;
  double v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  _QWORD v119[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v7 = objc_msgSend(v6, "placeUserType");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      v62 = objc_msgSend(v8, "placeUserType");

    }
    else
    {
      v62 = 0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v10 = objc_msgSend(v9, "placeType");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      LODWORD(v61) = -[MOBiomeDonationUtility mapVisitPlaceType:](self, "mapVisitPlaceType:", objc_msgSend(v11, "placeType"));

    }
    else
    {
      LODWORD(v61) = 0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "poiCategory"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "poiCategory"));
      HIDWORD(v61) = -[MOBiomeDonationUtility mapGEOPOICategory:](self, "mapGEOPOICategory:", v15);

    }
    else
    {
      HIDWORD(v61) = 0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v17 = objc_msgSend(v16, "placeDiscovery");

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      v60 = objc_msgSend(v18, "placeDiscovery");

    }
    else
    {
      v60 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v20 = objc_msgSend(v19, "mode");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      v59 = objc_msgSend(v21, "mode");

    }
    else
    {
      v59 = 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v23 = objc_msgSend(v22, "placeSource");

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      v58 = objc_msgSend(v24, "placeSource");

    }
    else
    {
      v58 = 0;
    }
  }
  else
  {
    v60 = 0;
    v61 = 0;
    v58 = 0;
    v59 = 0;
    v62 = 0;
  }
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workoutEvent"));
  if (v25
    && (v26 = (void *)v25,
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workoutEvent")),
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "workoutType")),
        v28,
        v27,
        v26,
        v28))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workoutEvent"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "workoutType"));

  }
  else
  {
    LODWORD(v57) = 0;
  }
  v119[0] = 0;
  v118 = 0;
  v116 = 0;
  v117 = 0;
  v114 = 0;
  v115 = 0;
  v112 = 0.0;
  v113 = 0.0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaEvent"));
  -[MOBiomeDonationUtility convertMediaEvent:toMediaType:mediaGenre:mediaSourceAppType:numAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:](self, "convertMediaEvent:toMediaType:mediaGenre:mediaSourceAppType:numAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:", v30, (char *)v119 + 4, v119, &v118, &v117, &v116, &v115, &v114, &v113, &v112);

  v31 = objc_opt_new(NSMutableArray);
  v111 = 0;
  v109 = 0;
  v110 = 0;
  v107 = 0.0;
  v108 = 0;
  v105 = 1.79769313e308;
  v106 = 0.0;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "significantContactEvent"));
  v104 = v31;
  -[MOBiomeDonationUtility convertSignificantContactEvent:toContactIDsInConversation:callLikeMechanismIncluded:textLikeMechanismIncluded:numAudioLikeInteractions:numVideoLikeInteractions:numTextLikeInteractions:totalDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:](self, "convertSignificantContactEvent:toContactIDsInConversation:callLikeMechanismIncluded:textLikeMechanismIncluded:numAudioLikeInteractions:numVideoLikeInteractions:numTextLikeInteractions:totalDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:", v32, v31, (char *)&v111 + 1, &v111, &v110, &v109, &v108, &v107, &v106, &v105);

  v33 = objc_alloc((Class)BMMomentsEventDataEvent);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventIdentifier"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceCreationDate"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));
  v35 = objc_msgSend(v4, "provider");
  v36 = objc_msgSend(v4, "category");
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appBundle"));
  v37 = v119[0];
  v75 = HIDWORD(v119[0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaEvent"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "mediaRepetitions"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaEvent"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mediaSumTimePlayed"));
  v73 = v118;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaEvent"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "mediaPlayerBundleId"));
  v80 = v117;
  if (v117)
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  else
    v90 = 0;
  v41 = v113;
  if (v113 <= 0.0)
    v86 = 0;
  else
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v113));
  v78 = v116;
  if (v116)
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  else
    v89 = 0;
  v42 = v112;
  if (v112 <= 0.0)
    v85 = 0;
  else
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v112));
  v74 = v115;
  if (v115)
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  else
    v88 = 0;
  v84 = v34;
  v83 = v38;
  v82 = v39;
  v81 = v40;
  v77 = v36;
  v76 = v37;
  v72 = v114;
  if (v114)
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v114));
  else
    v87 = 0;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "significantContactEvent"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "interactionContacts"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v70, "count")));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "significantContactEvent"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "interactionScoredContact"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "contact"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "identifier"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "significantContactEvent"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "interactionContactScore"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v111));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", HIBYTE(v111)));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v108));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v110));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v109));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v107));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v105));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v106));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peopleDiscoveryEvent"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "pCount"));
  LODWORD(v52) = v73;
  LODWORD(v51) = (_DWORD)v57;
  LODWORD(v56) = 0;
  LODWORD(v55) = 0;
  LODWORD(v54) = 0;
  LODWORD(v53) = 0;
  v79 = objc_msgSend(v33, "initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:", v103, v102, v101, v100, v99, v98,
          __PAIR64__(v77, v35),
          __PAIR64__(HIDWORD(v61), v62),
          __PAIR64__(v59, v60),
          v51,
          v97,
          __PAIR64__(v75, v76),
          v96,
          v95,
          v52,
          v94,
          v90,
          v86,
          v89,
          v85,
          v88,
          v87,
          v65,
          v104,
          v93,
          v92,
          v91,
          v63,
          v43,
          v64,
          v44,
          v45,
          v46,
          v47,
          v53,
          &__NSArray0__struct,
          &__NSArray0__struct,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          v54,
          0,
          0,
          v55,
          0,
          0,
          0,
          0,
          0,
          v49,
          __PAIR64__(v61, v58),
          v56);

  if (v72)
  if (v74)

  if (v42 > 0.0)
  if (v78)

  if (v41 > 0.0)
  if (v80)

  return v79;
}

- (id)convertResource:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  void *v12;
  id v13;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc((Class)BMMomentsEventDataEventBundleResource);
    v5 = objc_msgSend(v3, "type");
    v6 = objc_msgSend(v3, "photoAssetMediaType");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "photoFaceCount")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "photoCurationScore"));
    objc_msgSend(v3, "photoOverallAestheticScore");
    v10 = v9;

    LODWORD(v11) = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    v13 = objc_msgSend(v4, "initWithType:photoAssetMediaType:photoFaceCount:photoCurationScore:photoOverallAestheticScore:", v5, v6, v7, v8, v12);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)convertPerson:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new(NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personRelationships"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = v4;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personRelationships"));
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
            v13 = -[MOBiomeDonationUtility mapPersonRelationshipTag:](self, "mapPersonRelationshipTag:", objc_msgSend(v12, "relationship"));
            v14 = objc_alloc((Class)BMMomentsEventDataEventBundlePersonPersonRelationship);
            objc_msgSend(v12, "score");
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            v16 = objc_msgSend(v14, "initWithPersonRelationshipTag:score:", v13, v15);

            -[NSMutableArray addObject:](v5, "addObject:", v16);
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v9);
      }

      v4 = v22;
    }
    v17 = objc_alloc((Class)BMMomentsEventDataEventBundlePerson);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isMePerson")));
    objc_msgSend(v4, "significanceScore");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v20 = objc_msgSend(v17, "initWithPersonRelationships:isMEPerson:significanceScore:", v5, v18, v19);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)convertAction:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc((Class)BMMomentsEventDataAction);
    v5 = objc_msgSend(v3, "actionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionName"));
    objc_msgSend(v3, "actionNameConfidence");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v10 = objc_msgSend(v4, "initWithType:actionName:actionNameConfidence:", v5, v6, v9);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)convertPlace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "poiCategory"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "poiCategory"));
      v8 = -[MOBiomeDonationUtility mapGEOPOICategory:](self, "mapGEOPOICategory:", v7);

    }
    else
    {
      v8 = 0;
    }
    v10 = objc_alloc((Class)BMMomentsEventDataEventBundlePlace);
    v11 = objc_msgSend(v5, "placeType");
    v12 = objc_msgSend(v5, "placeUserType");
    objc_msgSend(v5, "placeNameConfidence");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v5, "familiarityIndexLOI");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v5, "distanceToHomeInMiles");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v9 = objc_msgSend(v10, "initWithPlaceInferencePlaceType:placeInferenceUserSpecificPlaceType:geoPOICategoryType:placeNameConfidence:familiarityIndexLOI:distanceToHomeInMiles:", v11, v12, v8, v13, v14, v15);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)convertClusterMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  _BOOL8 v16;
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
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  id v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  _BOOL4 v49;
  _BOOL4 v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phenotype")), v5, v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "phenotype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
    v8 = v7 != 0;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));
    v10 = v9 != 0;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isWeekend")));
    v12 = v11 != 0;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeTag")));
    v14 = v13 != 0;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
    v16 = v15 != 0;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placeName")));
    v52 = v17 != 0;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
    v50 = v18 != 0;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enclosingAreaName")));
    v49 = v19 != 0;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("persons")));
    v47 = v20 != 0;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));
    v45 = v21 != 0;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityTypeFromPhotoTraits")));
    v43 = v22 != 0;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));
    v42 = v23 != 0;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));
    v41 = v24 != 0;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));
    v40 = v25 != 0;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherSubjectFromPhotoTraits")));
    v38 = v26 != 0;

    v39 = objc_alloc((Class)BMMomentsEventDataEventBundleClusterMetadata);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isFiltered")));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v52));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v50));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v49));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v47));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v45));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v43));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v42));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v41));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v40));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v38));
    v31 = objc_msgSend(v39, "initWithIsFiltered:isTopLevelActivityTypePhenotypeDetected:isSecondLevelActivityTypePhenotypeDetected:isWeekendPhenotypeDetected:isTimeTagPhenotypeDetected:isDayOfWeekPhenotypeDetected:isPlaceNamePhenotypeDetected:isCombinedPlacePhenotypeDetected:isEnclosingAreaNamePhenotypeDetected:isPersonsPhenotypeDetected:isPersonRelationshipPhenotypeDetected:isActivityTypeFromPhotoTraitsPhenotypeDetected:isTimeContextFromPhotoTraitsPhenotypeDetected:isLocationContextFromPhotoTraitsPhenotypeDetected:isSocialContextFromPhotoTraitsPhenotypeDetected:isExtraContextFromPhotoTraitsPhenotypeDetected:isOtherSubjectFromPhotoTraitsPhenotypeDetected:", v54, v55, v37, v36, v35, v34, v53, v51, v33, v48, v46, v44,
            v27,
            v28,
            v29,
            v30,
            0);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)convertOutlierMetadata:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc((Class)BMMomentsEventDataEventBundleOutlierMetadata);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isSignificant")));
    objc_msgSend(v3, "outlierScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updatedDate"));

    v8 = objc_msgSend(v4, "initWithIsSignificant:outlierScore:updatedDate:", v5, v6, v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)convertMetadataForRankgDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
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

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PoiCategory")));
    if (v5
      && (v6 = (void *)v5,
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PoiCategory"))),
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          v6,
          (v9 & 1) == 0))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PoiCategory")));
    }
    else
    {
      v53 = 0;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindDomains")));

    v12 = &__NSArray0__struct;
    if (v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindDomains")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindLabels")));

    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindLabels")));

      v12 = (void *)v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindReflectiveInterval")));

    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindReflectiveInterval")));

      v12 = (void *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindValenceClassification")));

    if (v17)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindValenceClassification")));

      v12 = (void *)v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindValence")));

    if (v19)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindValence")));

      v52 = (void *)v20;
    }
    else
    {
      v52 = v12;
    }
    v34 = objc_alloc((Class)BMMomentsEventDataEventBundleMetadataForRank);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dailyAggregateCallDuration")));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callDuration")));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("burstyInteractionCount")));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("burstyOutgoingInteractionCount")));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multipleInteractionTypes")));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactLocationWork")));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFamilyContact")));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCoworkerContact")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRepetitiveContact")));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isGroupConversation")));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleCountWeightedSum")));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleCountWeightedAverage")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleCountMax")));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleDensityWeightedSum")));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleDensityWeightedAverage")));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleDensityMax")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleDensityWeightedConfidenceSum")));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PeopleDensityWeightedConfidenceAverage")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MediaTotalPlayTime")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MediaLength")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MediaActionIsRepeat")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeAtHomeDuration")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PhotosAtHomeCurationScore")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WorkoutDuration")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MotionActivityWalkSpan")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VisitDuration")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FamiliarityIndex")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindLoggedIn3pApp")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StateOfMindLoggedInJournalApp")));
    v10 = objc_msgSend(v34, "initWithDailyAggregateCallDuration:callDuration:burstyInteractionCount:burstyOutgoingInteractionCount:multipleInteractionTypes:contactLocationWork:isFamilyContact:isCoworkerContact:isRepetitiveContact:isGroupConversation:peopleCountWeightedSum:peopleCountWeightedAverage:peopleCountMax:peopleDensityWeightedSum:peopleDensityWeightedAverage:peopleDensityMax:peopleDensityWeightedConfidenceSum:peopleDensityWeightedConfidenceAverage:mediaTotalPlayTime:mediaLength:mediaActionIsRepeat:timeAtHomeDuration:photosAtHomeCurationScore:workoutDuration:motionActivityWalkSpan:visitDuration:poiCategoryInterestingness:familiarityIndex:stateOfMindDomains:stateOfMindLabels:stateOfMindReflectiveIntervals:stateOfMindValenceClassifications:stateOfMindValenceValues:stateOfMindLoggedIn3pApp:stateOfMindLoggedInJournalApp:", v50, v51, v49, v47, v46, v44, v48, v45, v43, v40,
            v42,
            v33,
            v41,
            v39,
            v38,
            v37,
            v32,
            v36,
            v31,
            v35,
            v30,
            v29,
            v28,
            v21,
            v27,
            v22,
            v53,
            v23,
            v52,
            &__NSArray0__struct,
            &__NSArray0__struct,
            &__NSArray0__struct,
            &__NSArray0__struct,
            v24,
            v25);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)convertMediaEvent:(id)a3 toMediaType:(int *)a4 mediaGenre:(int *)a5 mediaSourceAppType:(int *)a6 numAudioMediaPlaySessionsPerDay:(unint64_t *)a7 numVideoMediaPlaySessionsPerDay:(unint64_t *)a8 numFirstPartyMediaPlaySessionsPerDay:(unint64_t *)a9 numThirdPartyMediaPlaySessionsPerDay:(unint64_t *)a10 durationAudioMediaPlaySessionsPerDay:(double *)a11 durationVideoMediaPlaySessionsPerDay:(double *)a12
{
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  double *v38;
  unint64_t *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  unint64_t *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];

  v16 = a3;
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mediaType"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaType"));
      *a4 = -[MOBiomeDonationUtility mapMediaType:](self, "mapMediaType:", v19);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaGenre"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaGenre"));
      *a5 = -[MOBiomeDonationUtility mapMediaGenre:](self, "mapMediaGenre:", v21);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaPlayerBundleId"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaPlayerBundleId"));
      *a6 = -[MOBiomeDonationUtility mapSourceBundleID:](self, "mapSourceBundleID:", v23);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaPlaySessions"));
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v49 = v17;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mediaPlaySessions"));
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v54 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "endDate"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "startDate"));
            objc_msgSend(v31, "timeIntervalSinceDate:", v32);
            v34 = v33;

            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "mediaType"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lowercaseString"));

            v37 = objc_msgSend(v36, "containsString:", CFSTR("audio"));
            v38 = a11;
            v39 = a7;
            if ((v37 & 1) != 0
              || (v40 = objc_msgSend(v36, "containsString:", CFSTR("video")), v38 = a12, v39 = a8, v40))
            {
              *v38 = v34 + *v38;
              ++*v39;
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleId"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lowercaseString"));

            v43 = objc_msgSend(v42, "containsString:", CFSTR("com.apple."));
            v44 = a9;
            if ((v43 & 1) != 0
              || (v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleId"))) != 0
              && (v46 = (void *)v45,
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleId")),
                  v48 = objc_msgSend(v47, "length"),
                  v47,
                  v46,
                  v44 = a10,
                  v48))
            {
              ++*v44;
            }

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        }
        while (v27);
      }

      v17 = v49;
    }
  }

}

- (void)convertSignificantContactEvent:(id)a3 toContactIDsInConversation:(id)a4 callLikeMechanismIncluded:(BOOL *)a5 textLikeMechanismIncluded:(BOOL *)a6 numAudioLikeInteractions:(unint64_t *)a7 numVideoLikeInteractions:(unint64_t *)a8 numTextLikeInteractions:(unint64_t *)a9 totalDurationOfCallLikeInteractions:(double *)a10 maxDurationOfCallLikeInteractions:(double *)a11 minDurationOfCallLikeInteractions:(double *)a12
{
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  NSSet *callLikeMechanismsSet;
  void *v37;
  NSSet *textLikeMechanismsSet;
  void *v39;
  NSSet *audioMechanismsSet;
  void *v41;
  NSSet *videoMechanismsSet;
  void *v43;
  id v44;
  id v45;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v14 = a3;
  v15 = a4;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactionContacts"));
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactionContacts"));
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v56 != v21)
              objc_enumerationMutation(v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i), "contact"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
            objc_msgSend(v15, "addObject:", v24);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v20);
      }

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactions"));
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      v44 = v15;
      v45 = v14;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactions"));
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(_QWORD *)v52 != v29)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
            objc_msgSend(v32, "timeIntervalSinceDate:", v33);
            v35 = v34;

            callLikeMechanismsSet = self->_callLikeMechanismsSet;
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v31, "mechanism")));
            LODWORD(callLikeMechanismsSet) = -[NSSet containsObject:](callLikeMechanismsSet, "containsObject:", v37);

            if ((_DWORD)callLikeMechanismsSet)
            {
              *a5 = 1;
              *a10 = v35 + *a10;
              if (v35 > *a11)
                *a11 = v35;
              if (v35 < *a12)
                *a12 = v35;
            }
            textLikeMechanismsSet = self->_textLikeMechanismsSet;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v31, "mechanism")));
            LODWORD(textLikeMechanismsSet) = -[NSSet containsObject:](textLikeMechanismsSet, "containsObject:", v39);

            if ((_DWORD)textLikeMechanismsSet)
              *a6 = 1;
            audioMechanismsSet = self->_audioMechanismsSet;
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v31, "mechanism")));
            LODWORD(audioMechanismsSet) = -[NSSet containsObject:](audioMechanismsSet, "containsObject:", v41);

            if ((_DWORD)audioMechanismsSet)
              ++*a7;
            videoMechanismsSet = self->_videoMechanismsSet;
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v31, "mechanism")));
            LODWORD(videoMechanismsSet) = -[NSSet containsObject:](videoMechanismsSet, "containsObject:", v43);

            if ((_DWORD)videoMechanismsSet)
              ++*a8;
          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        }
        while (v28);
      }

      v15 = v44;
      v14 = v45;
    }
  }

}

- (int)mapGEOPOICategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryAirport) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryAmusementPark) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryAnimalService) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryAquarium) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryATM) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryAutomotiveRepair) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBakery) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBank) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBaseball) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBasketball) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBeach) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBeauty) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBowling) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryBrewery) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryCafe) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryCampground) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryCarRental) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryCastle) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryConventionCenter) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryDistillery) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryEVCharger) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryFairground) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryFireStation) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryFishing) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryFitnessCenter) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryFoodMarket) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryFortress) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryGasStation) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryGolf) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryGoKart) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryHiking) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryHospital) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryHotel) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryKayaking) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryLandmark) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryLaundry) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryLibrary) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryMailbox) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryMarina) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryMiniGolf) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryMovieTheater) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryMuseum) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryMusicVenue) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryNationalMonument) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryNationalPark) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryNightlife) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryPark) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryParking) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryPharmacy) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryPlanetarium) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryPolice) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryPostOffice) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryPublicTransport) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryRestaurant) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryRestroom) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryRockClimbing) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryRVPark) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySchool) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySkatePark) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySkating) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySkiing) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySoccer) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySpa) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryStadium) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryStore) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySurfing) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategorySwimming) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryTennis) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryTheater) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryUniversity) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryVolleyball) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryWinery) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryZoo) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryAirportGate) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryAirportTerminal) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", GEOPOICategoryPlayground) & 1) != 0)
  {
    v4 = 29;
  }
  else if (objc_msgSend(v3, "isEqualToString:", GEOPOICategoryReligiousSite))
  {
    v4 = 33;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mapPersonRelationshipTag:(unint64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 0;
  else
    v3 = a3;
  if (a3)
    return v3;
  else
    return 1;
}

+ (int)mapOnboardingFlowCompletion:(unint64_t)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return 0;
}

- (int)mapTimeTagType:(unint64_t)a3
{
  int result;
  int v4;
  int v5;

  result = 0;
  if ((uint64_t)a3 > 1999)
  {
    if ((uint64_t)a3 <= 9999)
    {
      if (a3 == 2002)
        v4 = 2002;
      else
        v4 = 0;
      if (a3 == 2001)
        v5 = 2001;
      else
        v5 = v4;
      if (a3 == 2000)
        return 2000;
      else
        return v5;
    }
    else
    {
      switch(a3)
      {
        case 0x2710uLL:
          result = 12;
          break;
        case 0x2711uLL:
          result = 13;
          break;
        case 0x2712uLL:
          result = 14;
          break;
        case 0x2713uLL:
          result = 15;
          break;
        case 0x2714uLL:
          result = 16;
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        result = 100;
        break;
      case 'e':
        result = 101;
        break;
      case 'f':
        result = 102;
        break;
      case 'g':
        result = 103;
        break;
      case 'h':
        result = 104;
        break;
      case 'i':
        result = 105;
        break;
      case 'j':
        result = 106;
        break;
      case 'k':
        result = 107;
        break;
      case 'l':
        result = 108;
        break;
      case 'm':
        result = 109;
        break;
      case 'n':
        result = 110;
        break;
      case 'o':
        result = 111;
        break;
      case 'p':
        result = 112;
        break;
      case 'q':
        result = 113;
        break;
      case 'r':
        result = 114;
        break;
      default:
        switch(a3)
        {
          case 1uLL:
            result = 1;
            break;
          case 2uLL:
            result = 2;
            break;
          case 3uLL:
            result = 17;
            break;
          case 4uLL:
            result = 3;
            break;
          case 5uLL:
            result = 18;
            break;
          case 6uLL:
            result = 4;
            break;
          case 7uLL:
            result = 5;
            break;
          case 8uLL:
            result = 6;
            break;
          default:
            return result;
        }
        break;
    }
  }
  return result;
}

- (int)mapMediaGenre:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  int v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  unsigned __int8 v52;
  void *v53;
  unsigned __int8 v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  unsigned __int8 v58;
  void *v59;
  unsigned __int8 v60;
  void *v61;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
    v7 = objc_msgSend(v5, "containsString:", v6);

    if ((v7 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
      v10 = objc_msgSend(v5, "containsString:", v9);

      if ((v10 & 1) != 0)
      {
        v8 = 2;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
        v12 = objc_msgSend(v5, "containsString:", v11);

        if ((v12 & 1) != 0)
        {
          v8 = 3;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
          v14 = objc_msgSend(v5, "containsString:", v13);

          if ((v14 & 1) != 0)
          {
            v8 = 4;
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
            v16 = objc_msgSend(v5, "containsString:", v15);

            if ((v16 & 1) != 0)
            {
              v8 = 5;
            }
            else
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
              v18 = objc_msgSend(v5, "containsString:", v17);

              if ((v18 & 1) != 0)
              {
                v8 = 6;
              }
              else
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                v20 = objc_msgSend(v5, "containsString:", v19);

                if ((v20 & 1) != 0)
                {
                  v8 = 7;
                }
                else
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                  v22 = objc_msgSend(v5, "containsString:", v21);

                  if ((v22 & 1) != 0)
                  {
                    v8 = 8;
                  }
                  else
                  {
                    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                    v24 = objc_msgSend(v5, "containsString:", v23);

                    if ((v24 & 1) != 0)
                    {
                      v8 = 9;
                    }
                    else
                    {
                      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                      v26 = objc_msgSend(v5, "containsString:", v25);

                      if ((v26 & 1) != 0)
                      {
                        v8 = 10;
                      }
                      else
                      {
                        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                        v28 = objc_msgSend(v5, "containsString:", v27);

                        if ((v28 & 1) != 0)
                        {
                          v8 = 11;
                        }
                        else
                        {
                          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                          v30 = objc_msgSend(v5, "containsString:", v29);

                          if ((v30 & 1) != 0)
                          {
                            v8 = 12;
                          }
                          else
                          {
                            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                            v32 = objc_msgSend(v5, "containsString:", v31);

                            if ((v32 & 1) != 0)
                            {
                              v8 = 13;
                            }
                            else
                            {
                              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                              v34 = objc_msgSend(v5, "containsString:", v33);

                              if ((v34 & 1) != 0)
                              {
                                v8 = 14;
                              }
                              else
                              {
                                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                v36 = objc_msgSend(v5, "containsString:", v35);

                                if ((v36 & 1) != 0)
                                {
                                  v8 = 15;
                                }
                                else
                                {
                                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                  v38 = objc_msgSend(v5, "containsString:", v37);

                                  if ((v38 & 1) != 0)
                                  {
                                    v8 = 16;
                                  }
                                  else
                                  {
                                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                    v40 = objc_msgSend(v5, "containsString:", v39);

                                    if ((v40 & 1) != 0)
                                    {
                                      v8 = 17;
                                    }
                                    else
                                    {
                                      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                      v42 = objc_msgSend(v5, "containsString:", v41);

                                      if ((v42 & 1) != 0)
                                      {
                                        v8 = 18;
                                      }
                                      else
                                      {
                                        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                        v44 = objc_msgSend(v5, "containsString:", v43);

                                        if ((v44 & 1) != 0)
                                        {
                                          v8 = 19;
                                        }
                                        else
                                        {
                                          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                          v46 = objc_msgSend(v5, "containsString:", v45);

                                          if ((v46 & 1) != 0)
                                          {
                                            v8 = 20;
                                          }
                                          else
                                          {
                                            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                            v48 = objc_msgSend(v5, "containsString:", v47);

                                            if ((v48 & 1) != 0)
                                            {
                                              v8 = 21;
                                            }
                                            else
                                            {
                                              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                              v50 = objc_msgSend(v5, "containsString:", v49);

                                              if ((v50 & 1) != 0)
                                              {
                                                v8 = 22;
                                              }
                                              else
                                              {
                                                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                                v52 = objc_msgSend(v5, "containsString:", v51);

                                                if ((v52 & 1) != 0)
                                                {
                                                  v8 = 23;
                                                }
                                                else
                                                {
                                                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                                  v54 = objc_msgSend(v5, "containsString:", v53);

                                                  if ((v54 & 1) != 0)
                                                  {
                                                    v8 = 24;
                                                  }
                                                  else
                                                  {
                                                    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                                    v56 = objc_msgSend(v5, "containsString:", v55);

                                                    if ((v56 & 1) != 0)
                                                    {
                                                      v8 = 25;
                                                    }
                                                    else
                                                    {
                                                      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                                      v58 = objc_msgSend(v5, "containsString:", v57);

                                                      if ((v58 & 1) != 0)
                                                      {
                                                        v8 = 26;
                                                      }
                                                      else
                                                      {
                                                        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                                        v60 = objc_msgSend(v5, "containsString:", v59);

                                                        if ((v60 & 1) != 0)
                                                        {
                                                          v8 = 27;
                                                        }
                                                        else
                                                        {
                                                          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_GENRE"), "lowercaseString"));
                                                          objc_msgSend(v5, "containsString:", v61);

                                                          v8 = 28;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)mapMediaType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
    if ((objc_msgSend(v5, "containsString:", CFSTR("music")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "containsString:", CFSTR("podcast")) & 1) != 0)
    {
      v6 = 2;
    }
    else if (objc_msgSend(v5, "containsString:", CFSTR("audio")))
    {
      if (objc_msgSend(v5, "containsString:", CFSTR("book")))
        v6 = 3;
      else
        v6 = 6;
    }
    else if (objc_msgSend(v5, "containsString:", CFSTR("itune")))
    {
      if (objc_msgSend(v5, "containsString:", CFSTR("radio")))
        v6 = 5;
      else
        v6 = 4;
    }
    else if (objc_msgSend(v5, "containsString:", CFSTR("video")))
    {
      v6 = 7;
    }
    else
    {
      v6 = 8;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)mapSourceBundleID:(id)a3
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "containsString:", CFSTR("com.apple.")))
    return 1;
  return 3;
}

- (int)mapVisitPlaceType:(unint64_t)a3
{
  int v3;
  int v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
    v3 = 3;
  else
    v3 = 0;
  if (a3 == 3)
    v3 = 2;
  if (a3 == 2)
    v4 = 1;
  else
    v4 = v3;
  if (a3 >= 2)
    return v4;
  else
    return 0;
}

- (int)mapPhotoMomentInference:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  void *v57;
  unsigned __int8 v58;
  void *v59;
  void *v60;
  unsigned __int8 v61;
  void *v62;
  void *v63;
  unsigned __int8 v64;
  void *v65;
  void *v66;
  unsigned __int8 v67;
  void *v68;
  void *v69;
  unsigned __int8 v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  void *v74;
  void *v75;
  unsigned __int8 v76;
  void *v77;
  void *v78;
  unsigned __int8 v79;
  void *v80;
  void *v81;
  unsigned __int8 v82;
  void *v83;
  void *v84;
  unsigned __int8 v85;
  void *v86;
  void *v87;
  unsigned __int8 v88;
  void *v89;
  void *v90;
  unsigned __int8 v91;
  void *v92;
  void *v93;
  unsigned __int8 v94;
  void *v95;
  void *v96;
  unsigned int v97;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
    v6 = objc_msgSend(v4, "containsString:", v5);

    if ((v6 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
      v10 = objc_msgSend(v8, "containsString:", v9);

      if ((v10 & 1) != 0)
      {
        v7 = 2;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
        v13 = objc_msgSend(v11, "containsString:", v12);

        if ((v13 & 1) != 0)
        {
          v7 = 3;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
          v16 = objc_msgSend(v14, "containsString:", v15);

          if ((v16 & 1) != 0)
          {
            v7 = 4;
          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
            v19 = objc_msgSend(v17, "containsString:", v18);

            if ((v19 & 1) != 0)
            {
              v7 = 5;
            }
            else
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
              v22 = objc_msgSend(v20, "containsString:", v21);

              if ((v22 & 1) != 0)
              {
                v7 = 6;
              }
              else
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                v25 = objc_msgSend(v23, "containsString:", v24);

                if ((v25 & 1) != 0)
                {
                  v7 = 7;
                }
                else
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                  v28 = objc_msgSend(v26, "containsString:", v27);

                  if ((v28 & 1) != 0)
                  {
                    v7 = 8;
                  }
                  else
                  {
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                    v31 = objc_msgSend(v29, "containsString:", v30);

                    if ((v31 & 1) != 0)
                    {
                      v7 = 9;
                    }
                    else
                    {
                      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                      v34 = objc_msgSend(v32, "containsString:", v33);

                      if ((v34 & 1) != 0)
                      {
                        v7 = 10;
                      }
                      else
                      {
                        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                        v37 = objc_msgSend(v35, "containsString:", v36);

                        if ((v37 & 1) != 0)
                        {
                          v7 = 11;
                        }
                        else
                        {
                          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                          v40 = objc_msgSend(v38, "containsString:", v39);

                          if ((v40 & 1) != 0)
                          {
                            v7 = 12;
                          }
                          else
                          {
                            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                            v43 = objc_msgSend(v41, "containsString:", v42);

                            if ((v43 & 1) != 0)
                            {
                              v7 = 13;
                            }
                            else
                            {
                              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                              v46 = objc_msgSend(v44, "containsString:", v45);

                              if ((v46 & 1) != 0)
                              {
                                v7 = 14;
                              }
                              else
                              {
                                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                v49 = objc_msgSend(v47, "containsString:", v48);

                                if ((v49 & 1) != 0)
                                {
                                  v7 = 15;
                                }
                                else
                                {
                                  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                  v52 = objc_msgSend(v50, "containsString:", v51);

                                  if ((v52 & 1) != 0)
                                  {
                                    v7 = 16;
                                  }
                                  else
                                  {
                                    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                    v55 = objc_msgSend(v53, "containsString:", v54);

                                    if ((v55 & 1) != 0)
                                    {
                                      v7 = 17;
                                    }
                                    else
                                    {
                                      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                      v58 = objc_msgSend(v56, "containsString:", v57);

                                      if ((v58 & 1) != 0)
                                      {
                                        v7 = 18;
                                      }
                                      else
                                      {
                                        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                        v61 = objc_msgSend(v59, "containsString:", v60);

                                        if ((v61 & 1) != 0)
                                        {
                                          v7 = 19;
                                        }
                                        else
                                        {
                                          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                          v64 = objc_msgSend(v62, "containsString:", v63);

                                          if ((v64 & 1) != 0)
                                          {
                                            v7 = 20;
                                          }
                                          else
                                          {
                                            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                            v67 = objc_msgSend(v65, "containsString:", v66);

                                            if ((v67 & 1) != 0)
                                            {
                                              v7 = 21;
                                            }
                                            else
                                            {
                                              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                              v70 = objc_msgSend(v68, "containsString:", v69);

                                              if ((v70 & 1) != 0)
                                              {
                                                v7 = 22;
                                              }
                                              else
                                              {
                                                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                v73 = objc_msgSend(v71, "containsString:", v72);

                                                if ((v73 & 1) != 0)
                                                {
                                                  v7 = 23;
                                                }
                                                else
                                                {
                                                  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                  v76 = objc_msgSend(v74, "containsString:", v75);

                                                  if ((v76 & 1) != 0)
                                                  {
                                                    v7 = 24;
                                                  }
                                                  else
                                                  {
                                                    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                    v79 = objc_msgSend(v77, "containsString:", v78);

                                                    if ((v79 & 1) != 0)
                                                    {
                                                      v7 = 25;
                                                    }
                                                    else
                                                    {
                                                      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                      v82 = objc_msgSend(v80, "containsString:", v81);

                                                      if ((v82 & 1) != 0)
                                                      {
                                                        v7 = 26;
                                                      }
                                                      else
                                                      {
                                                        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                        v85 = objc_msgSend(v83, "containsString:", v84);

                                                        if ((v85 & 1) != 0)
                                                        {
                                                          v7 = 27;
                                                        }
                                                        else
                                                        {
                                                          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                          v88 = objc_msgSend(v86, "containsString:", v87);

                                                          if ((v88 & 1) != 0)
                                                          {
                                                            v7 = 28;
                                                          }
                                                          else
                                                          {
                                                            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                            v91 = objc_msgSend(v89, "containsString:", v90);

                                                            if ((v91 & 1) != 0)
                                                            {
                                                              v7 = 29;
                                                            }
                                                            else
                                                            {
                                                              v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                              v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                              v94 = objc_msgSend(v92, "containsString:", v93);

                                                              if ((v94 & 1) != 0)
                                                              {
                                                                v7 = 30;
                                                              }
                                                              else
                                                              {
                                                                v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
                                                                v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("##_PHOTO_INFERENCE"), "lowercaseString"));
                                                                v97 = objc_msgSend(v95, "containsString:", v96);

                                                                if (v97)
                                                                  v7 = 31;
                                                                else
                                                                  v7 = 0;
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)mapTimeCorrelationScore:(float)a3
{
  if (self->_kLowBundleQualityScoreThreshold > a3)
    return 1;
  if (self->_kHighBundleQualityScoreThreshold <= a3)
    return 3;
  return 2;
}

- (int)mapLabelConfidenceScore:(float)a3
{
  if (self->_kLowBundleQualityScoreThreshold > a3)
    return 1;
  if (self->_kHighBundleQualityScoreThreshold <= a3)
    return 3;
  return 2;
}

- (int)mapCallDurationType:(double)a3
{
  double shortCallDurationInSecondsThreshold;
  double longCallDurationInSecondsThreshold;

  shortCallDurationInSecondsThreshold = self->_shortCallDurationInSecondsThreshold;
  if (a3 > 0.0 && shortCallDurationInSecondsThreshold >= a3)
    return 1;
  longCallDurationInSecondsThreshold = self->_longCallDurationInSecondsThreshold;
  if (shortCallDurationInSecondsThreshold < a3 && longCallDurationInSecondsThreshold >= a3)
    return 2;
  if (longCallDurationInSecondsThreshold >= a3)
    return 0;
  return 3;
}

- (int)mapBurstyInteractionCount:(unint64_t)a3
{
  if (self->_lowBurstyInteractionCountThreshold >= a3)
    return 1;
  if (self->_highBurstyInteractionCountThreshold >= a3)
    return 2;
  return 3;
}

- (int)mapDistanceToHomeInMiles:(double)a3
{
  double distanceToHomeInMilesThresholdNearHome;
  double distanceToHomeInMilesThresholdMedium;
  double distanceToHomeInMilesThresholdFar;

  distanceToHomeInMilesThresholdNearHome = self->_distanceToHomeInMilesThresholdNearHome;
  if (a3 >= 0.0 && distanceToHomeInMilesThresholdNearHome > a3)
    return 1;
  distanceToHomeInMilesThresholdMedium = self->_distanceToHomeInMilesThresholdMedium;
  if (distanceToHomeInMilesThresholdNearHome <= a3 && distanceToHomeInMilesThresholdMedium > a3)
    return 2;
  distanceToHomeInMilesThresholdFar = self->_distanceToHomeInMilesThresholdFar;
  if (distanceToHomeInMilesThresholdMedium > a3 || distanceToHomeInMilesThresholdFar <= a3)
    return 4 * (distanceToHomeInMilesThresholdFar <= a3);
  else
    return 3;
}

- (NSSet)callLikeMechanismsSet
{
  return self->_callLikeMechanismsSet;
}

- (NSSet)textLikeMechanismsSet
{
  return self->_textLikeMechanismsSet;
}

- (NSSet)audioMechanismsSet
{
  return self->_audioMechanismsSet;
}

- (NSSet)videoMechanismsSet
{
  return self->_videoMechanismsSet;
}

- (float)kLowBundleQualityScoreThreshold
{
  return self->_kLowBundleQualityScoreThreshold;
}

- (float)kHighBundleQualityScoreThreshold
{
  return self->_kHighBundleQualityScoreThreshold;
}

- (float)shortCallDurationInSecondsThreshold
{
  return self->_shortCallDurationInSecondsThreshold;
}

- (float)longCallDurationInSecondsThreshold
{
  return self->_longCallDurationInSecondsThreshold;
}

- (unint64_t)lowBurstyInteractionCountThreshold
{
  return self->_lowBurstyInteractionCountThreshold;
}

- (unint64_t)highBurstyInteractionCountThreshold
{
  return self->_highBurstyInteractionCountThreshold;
}

- (float)distanceToHomeInMilesThresholdNearHome
{
  return self->_distanceToHomeInMilesThresholdNearHome;
}

- (float)distanceToHomeInMilesThresholdMedium
{
  return self->_distanceToHomeInMilesThresholdMedium;
}

- (float)distanceToHomeInMilesThresholdFar
{
  return self->_distanceToHomeInMilesThresholdFar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoMechanismsSet, 0);
  objc_storeStrong((id *)&self->_audioMechanismsSet, 0);
  objc_storeStrong((id *)&self->_textLikeMechanismsSet, 0);
  objc_storeStrong((id *)&self->_callLikeMechanismsSet, 0);
}

@end
