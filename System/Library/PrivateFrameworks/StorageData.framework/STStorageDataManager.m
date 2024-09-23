@implementation STStorageDataManager

+ (id)applicationRecords
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 64);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  return v2;
}

+ (id)sharedContainersFor:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "groupContainerURLs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "path");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "length"))
                AddToMultiDict(v4, v16, v9);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  return v4;
}

+ (id)computeCategoriesForApps:(id)a3
{
  id v3;
  STMutableSizeDict *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  char v17;
  id v18;
  void *v19;
  id obj;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(STMutableSizeDict);
  STKeyForCategory(0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  STKeyForCategory(7u);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v9, "internalSizes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "externalSizes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "userVisible");
        v13 = v24;
        if ((v12 & 1) == 0)
        {
          v14 = v23;

          v13 = v14;
        }
        -[STMutableSizeDict addSize:toKey:](v4, "addSize:toKey:", v10, v13);
        if (v11)
        {
          objc_msgSend(a1, "overridesFor:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "category");

          if (v16)
            v17 = 1;
          else
            v17 = v12;
          if ((v17 & 1) != 0)
          {
            STKeyForCategory(v16);
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = v23;
          }
          v19 = v18;
          -[STMutableSizeDict addSize:toKey:](v4, "addSize:toKey:", v11, v18);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)computeBundleRemappings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
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

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v8, "counterpartIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v4, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                objc_msgSend(v8, "bundleIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v16);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v13);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)overridesFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STAppOverrides overridesFor:](STAppOverrides, "overridesFor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "appRecord");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "appRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[STAppOverrides overridesForApplication:](STAppOverrides, "overridesForApplication:", v7);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

+ (id)getLocalAppId:(id)a3 foreignAppId:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  return v9;
}

+ (id)updateAppsWithPrevious:(id)a3 usageBundles:(id)a4 skipAppRecordBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t (**v27)(id, _QWORD);
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  STStorageApp *v40;
  STStorageApp *v41;
  STStorageApp *v42;
  void *v43;
  void *v44;
  STStorageApp *v45;
  STStorageApp *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  STStorageApp *v52;
  STStorageApp *v53;
  void *v54;
  void *v55;
  void *v56;
  STMutableSizeDict *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  STStorageApp *v86;
  STStorageApp *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  STStorageApp *v132;
  STStorageApp *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t m;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  id v156;
  __uint64_t v157;
  id v158;
  __uint64_t v159;
  __uint64_t v160;
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
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  id v223;
  id v224;
  __uint64_t v225;
  void *v226;
  void *v227;
  __uint64_t v228;
  void *v229;
  __uint64_t v230;
  id v231;
  void *v232;
  void *v233;
  __uint64_t v234;
  void *v235;
  __uint64_t v236;
  void *v237;
  void *v238;
  STStorageApp *v239;
  __uint64_t v240;
  __uint64_t v241;
  void *v242;
  void *v243;
  uint64_t (**v244)(id, _QWORD);
  id obj;
  void *v247;
  STMutableSizeDict *v248;
  void *v249;
  void *v250;
  id v251;
  _QWORD v252[4];
  id v253;
  _QWORD v254[4];
  id v255;
  id v256;
  id v257;
  id v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  _QWORD v267[4];
  id v268;
  id v269;
  _QWORD v270[4];
  id v271;
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
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  uint64_t v289;

  v289 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v244 = (uint64_t (**)(id, _QWORD))a5;
  v241 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v242 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v280 = 0u;
    v281 = 0u;
    v282 = 0u;
    v283 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v280, v288, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v281;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v281 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v280 + 1) + 8 * i);
          objc_msgSend(v14, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v250, "setObject:forKey:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v280, v288, 16);
      }
      while (v11);
    }

  }
  else
  {
    v250 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "applicationRecords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageDataManager computeBundleRemappings:](STStorageDataManager, "computeBundleRemappings:", v16);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  v240 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v276 = 0u;
  v277 = 0u;
  v278 = 0u;
  v279 = 0u;
  objc_msgSend(v8, "allAppsWithUsageBundles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v276, v287, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v277;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v277 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v276 + 1) + 8 * j);
        objc_msgSend(v8, "usageBundleForIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[STStorageDataManager getLocalAppId:foreignAppId:](STStorageDataManager, "getLocalAppId:foreignAppId:", v249, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v276, v287, 16);
    }
    while (v20);
  }
  v243 = v8;

  v274 = 0u;
  v275 = 0u;
  v272 = 0u;
  v273 = 0u;
  obj = v16;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v272, v286, 16);
  v27 = v244;
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v273;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v273 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v272 + 1) + 8 * k);
        if (!v27 || (v27[2](v27, *(_QWORD *)(*((_QWORD *)&v272 + 1) + 8 * k)) & 1) == 0)
        {
          objc_msgSend(v31, "bundleIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          STLog(1, CFSTR("Listing app : %@"), v33, v34, v35, v36, v37, v38, (uint64_t)v32);

          objc_msgSend(v31, "bundleIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v250, "objectForKey:", v39);
          v40 = (STStorageApp *)(id)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (!v40)
          {
            v42 = [STStorageApp alloc];
            objc_msgSend(v17, "objectForKey:", v39);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = -[STStorageApp initWithAppRecord:usageBundle:](v42, "initWithAppRecord:usageBundle:", v31, v43);

            v27 = v244;
            objc_msgSend(a1, "overridesFor:", v41);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[STStorageApp setForceVisible:](v41, "setForceVisible:", objc_msgSend(v44, "forceVisible"));
            -[STStorageApp setForceHidden:](v41, "setForceHidden:", objc_msgSend(v44, "forceHidden"));

          }
          objc_msgSend(v247, "setObject:forKey:", v41, v39);

        }
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v272, v286, 16);
    }
    while (v28);
  }

  objc_msgSend(v250, "objectForKey:", CFSTR("com.apple.fakeapp.System"));
  v45 = (STStorageApp *)objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
    v46 = [STStorageApp alloc];
    STNameForCategoryKey(CFSTR("CAT_SYSTEM"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[STStorageApp initWithBundleIdentifier:name:vendorName:](v46, "initWithBundleIdentifier:name:vendorName:", CFSTR("com.apple.fakeapp.System"), v47, CFSTR("Apple Inc."));

    -[STStorageApp setAppKind:](v45, "setAppKind:", 1);
    -[STStorageApp setForceHidden:](v45, "setForceHidden:", 1);
    +[STSizeVector fixed:](STSizeVector, "fixed:", STSizeOfSystemVolume());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageApp setExternalSizes:](v45, "setExternalSizes:", v48);

  }
  -[STStorageApp appIdentifier](v45, "appIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v247;
  v239 = v45;
  objc_msgSend(v247, "setObject:forKey:", v45, v49);

  v236 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  +[STStorageApp sizeOfPluginKitContainers](STStorageApp, "sizeOfPluginKitContainers");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v250, "objectForKey:", CFSTR("com.apple.fakeapp.PluginKit.hidden"));
    v52 = (STStorageApp *)objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      v53 = [STStorageApp alloc];
      STStorageDataLocStr(CFSTR("App Plugins"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[STStorageApp initWithBundleIdentifier:name:vendorName:](v53, "initWithBundleIdentifier:name:vendorName:", CFSTR("com.apple.fakeapp.PluginKit.hidden"), v54, CFSTR("Apple Inc."));

      -[STStorageApp setAppKind:](v52, "setAppKind:", 3);
      -[STStorageApp setForceHidden:](v52, "setForceHidden:", 1);
    }
    -[STStorageApp setExternalSizes:](v52, "setExternalSizes:", v51);
    -[STStorageApp appIdentifier](v52, "appIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v247, "setObject:forKey:", v52, v55);

  }
  v238 = (void *)v51;
  v234 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend(v247, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_10);
  STGetCurrentMediaUsage();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_alloc_init(STMutableSizeDict);
  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = v56;
  STSelectMediaUsage(v56, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[STMutableSizeDict plusEquals:](v57, "plusEquals:", v59);
  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  STComputeFSOverrides(v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[STMutableSizeDict plusEquals:](v57, "plusEquals:", v61);
  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  STComputeCacheDeleteOverrides(v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[STMutableSizeDict plusEquals:](v57, "plusEquals:", v63);
  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  STComputeUsageBundleData(v243, v64);
  v65 = objc_claimAutoreleasedReturnValue();

  v235 = (void *)v65;
  -[STMutableSizeDict plusEquals:](v57, "plusEquals:", v65);
  STMessagesExternalDataSize();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMutableSizeDict addSize:toKey:](v57, "addSize:toKey:", v66, CFSTR("com.apple.MobileSMS"));

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v63) = objc_msgSend(v67, "isiCloudDriveAllowed");

  if (!(_DWORD)v63)
    goto LABEL_50;
  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "cacheDeleteDict");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("com.apple.bird.cache-delete"));
  v71 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("com.apple.bird.cache-delete"));
  v72 = objc_claimAutoreleasedReturnValue();
  if (v71 | v72)
  {
    if (v71 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      STLog(3, CFSTR("'com.apple.bird.cache-delete' value must be an NSNumber.\ncacheDeleteDict value: %@"), v73, v74, v75, v76, v77, v78, (uint64_t)v69);
      v79 = 1;
      if (!v72)
        goto LABEL_44;
    }
    else
    {
      v79 = 0;
      if (!v72)
      {
LABEL_44:
        if ((v79 & 1) == 0)
        {
          v232 = v69;
          objc_msgSend(v250, "objectForKey:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
          v86 = (STStorageApp *)objc_claimAutoreleasedReturnValue();
          if (!v86)
          {
            v87 = [STStorageApp alloc];
            STStorageDataLocStr(CFSTR("ICLOUD_DRIVE"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = -[STStorageApp initWithBundleIdentifier:name:vendorName:](v87, "initWithBundleIdentifier:name:vendorName:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"), v88, 0);

            -[STStorageApp setAppKind:](v86, "setAppKind:", 3);
          }
          +[STSizeVector docsAndData:purgeable:](STSizeVector, "docsAndData:purgeable:", objc_msgSend((id)v72, "longLongValue"), objc_msgSend((id)v71, "longLongValue"));
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[STStorageApp setExternalSizes:](v86, "setExternalSizes:", v89);

          STLog(1, CFSTR("Listing app container : %@"), v90, v91, v92, v93, v94, v95, (uint64_t)CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
          objc_msgSend(v247, "setObject:forKey:", v86, CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));

          v69 = v232;
        }
        goto LABEL_49;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_44;
    STLog(3, CFSTR("'com.apple.bird.cache-delete' value must be an NSNumber.\nCACHE_DELETE_ITEMIZED_NONPURGEABLE value: %@"), v80, v81, v82, v83, v84, v85, (uint64_t)v70);
  }
LABEL_49:

  v50 = v247;
LABEL_50:
  +[STFileProviderMonitor sharedMonitor](STFileProviderMonitor, "sharedMonitor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "fpDomains");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  +[STAppOverrides overrides](STAppOverrides, "overrides");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  STFileProviderExternalDataSize(v97);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMutableSizeDict plusEquals:](v57, "plusEquals:", v99);

  v248 = v57;
  -[STSizeDict remapKeys:removeMissing:](v57, "remapKeys:removeMissing:", v249, 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = MEMORY[0x24BDAC760];
  v270[0] = MEMORY[0x24BDAC760];
  v270[1] = 3221225472;
  v270[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_2;
  v270[3] = &unk_24C75FEF0;
  v102 = v50;
  v271 = v102;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v270);
  v233 = v100;
  objc_msgSend(v100, "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v267[0] = v101;
  v267[1] = 3221225472;
  v267[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_3;
  v267[3] = &unk_24C75FF18;
  v104 = v102;
  v268 = v104;
  v231 = v17;
  v269 = v231;
  objc_msgSend(v103, "enumerateKeysAndObjectsUsingBlock:", v267);

  v230 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v263 = 0u;
  v264 = 0u;
  v265 = 0u;
  v266 = 0u;
  v105 = v97;
  v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v263, v285, 16);
  if (!v106)
    goto LABEL_69;
  v107 = v106;
  v108 = *(_QWORD *)v264;
  do
  {
    v109 = 0;
    do
    {
      if (*(_QWORD *)v264 != v108)
        objc_enumerationMutation(v105);
      v110 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * v109);
      objc_msgSend(v110, "topLevelBundleIdentifier");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = v111;
      if (v111)
      {
        v113 = v111;
      }
      else
      {
        objc_msgSend(v110, "providerID");
        v113 = (id)objc_claimAutoreleasedReturnValue();
      }
      v114 = v113;

      objc_msgSend(v104, "objectForKey:", v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = v115;
      if (v115)
      {
        objc_msgSend(v115, "setFpDomain:", v110);
        if (objc_msgSend(v114, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")))
        {
          v117 = v116;
          v118 = 5;
LABEL_61:
          objc_msgSend(v117, "setAppKind:", v118);
          goto LABEL_65;
        }
        objc_msgSend(v116, "appRecord");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if (v119)
        {

        }
        else
        {
          objc_msgSend(v116, "usageBundle");
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v120)
          {
            objc_msgSend(v110, "providerDisplayName");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "setName:", v121);

            v117 = v116;
            v118 = 4;
            goto LABEL_61;
          }
        }
      }
LABEL_65:

      ++v109;
    }
    while (v107 != v109);
    v122 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v263, v285, 16);
    v107 = v122;
  }
  while (v122);
LABEL_69:

  v228 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  +[STUpdateMonitor sharedMonitor](STUpdateMonitor, "sharedMonitor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend(v123, "currentUpdateSize");
  STLog(1, CFSTR("Current update size (%lld)"), v125, v126, v127, v128, v129, v130, v124);
  if (v124)
  {
    objc_msgSend(v123, "bundleIdentifier");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v250, "objectForKey:", v131);
    v132 = (STStorageApp *)objc_claimAutoreleasedReturnValue();
    if (!v132)
    {
      v133 = [STStorageApp alloc];
      STStorageDataLocStr(CFSTR("SOFTWARE_UPDATE"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = -[STStorageApp initWithBundleIdentifier:name:vendorName:](v133, "initWithBundleIdentifier:name:vendorName:", v131, v134, 0);

      -[STStorageApp setAppKind:](v132, "setAppKind:", 3);
      objc_msgSend(v243, "usageBundleForIdentifier:", CFSTR("com.apple.Preferences"));
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[STStorageApp setUsageBundle:](v132, "setUsageBundle:", v135);

    }
    objc_msgSend(v123, "currentUpdateName");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageApp setName:](v132, "setName:", v136);

    +[STSizeVector docsAndData:](STSizeVector, "docsAndData:", v124);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageApp setExternalSizes:](v132, "setExternalSizes:", v137);

    STLog(1, CFSTR("Listing app container : %@"), v138, v139, v140, v141, v142, v143, (uint64_t)v131);
    objc_msgSend(v104, "setObject:forKey:", v132, v131);

  }
  v229 = v123;
  v225 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend((id)objc_opt_class(), "sharedContainersFor:", obj);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  +[STMSizer containersWithClass:](STMSizer, "containersWithClass:", 7);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v226, "allValues");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v144, "count"));
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = 0u;
  v260 = 0u;
  v261 = 0u;
  v262 = 0u;
  v146 = v144;
  v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v259, v284, 16);
  if (v147)
  {
    v148 = v147;
    v149 = *(_QWORD *)v260;
    do
    {
      for (m = 0; m != v148; ++m)
      {
        if (*(_QWORD *)v260 != v149)
          objc_enumerationMutation(v146);
        v151 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * m);
        objc_msgSend(v151, "url");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "path");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "setObject:forKey:", v151, v153);

      }
      v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v259, v284, 16);
    }
    while (v148);
  }

  v154 = (void *)objc_opt_new();
  v155 = MEMORY[0x24BDAC760];
  v254[0] = MEMORY[0x24BDAC760];
  v254[1] = 3221225472;
  v254[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_4;
  v254[3] = &unk_24C75FF40;
  v255 = v145;
  v156 = v104;
  v256 = v156;
  v257 = v154;
  v258 = v250;
  v251 = v250;
  v223 = v154;
  v224 = v145;
  objc_msgSend(v227, "enumerateKeysAndObjectsUsingBlock:", v254);
  v157 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v252[0] = v155;
  v252[1] = 3221225472;
  v252[2] = __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_5;
  v252[3] = &unk_24C75FF68;
  v253 = v156;
  v158 = v156;
  objc_msgSend(v223, "enumerateKeysAndObjectsUsingBlock:", v252);
  v159 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend(a1, "fixClonesInPhotosAndMessages:", v158);
  v160 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, CFSTR("%0.3f secs: load app records"), v161, v162, v163, v164, v165, v166, COERCE__INT64((double)(uint64_t)(v240 - v241) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: build app objects"), v167, v168, v169, v170, v171, v172, COERCE__INT64((double)(uint64_t)(v236 - v240) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: add pluginkit sizes"), v173, v174, v175, v176, v177, v178, COERCE__INT64((double)(uint64_t)(v234 - v236) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: size apps"), v179, v180, v181, v182, v183, v184, COERCE__INT64((double)(uint64_t)(v230 - v234) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: size extern data"), v185, v186, v187, v188, v189, v190, COERCE__INT64((double)(uint64_t)(v228 - v230) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: add file providers"), v191, v192, v193, v194, v195, v196, COERCE__INT64((double)(uint64_t)(v225 - v228) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: add system updates"), v197, v198, v199, v200, v201, v202, COERCE__INT64((double)(uint64_t)(v157 - v225) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: add pseudo apps"), v203, v204, v205, v206, v207, v208, COERCE__INT64((double)(uint64_t)(v159 - v157) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: apply fixes"), v209, v210, v211, v212, v213, v214, COERCE__INT64((double)(uint64_t)(v160 - v159) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: load apps total"), v215, v216, v217, v218, v219, v220, COERCE__INT64((double)(uint64_t)(v160 - v241) / 1000000000.0));
  objc_msgSend(v158, "allValues");
  v221 = (void *)objc_claimAutoreleasedReturnValue();

  return v221;
}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setAssetPurgeableSize:", STMSizeOfPurgeableAssets(a2));

}

id __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return getOrCreateApp(*(void **)(a1 + 32), a2, a3);
}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getOrCreateApp(v4, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setExternalSizes:", v6);
}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  void *v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v81, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("group.com.apple.FileProvider.LocalStorage"));

      if ((v8 & 1) == 0)
      {
        v78 = v5;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v77 = v6;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v87;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v87 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = a1;
                +[STAppOverrides overridesFor:](STAppOverrides, "overridesFor:", v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "includeContainers");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v81, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "containsObject:", v19);

                if ((v20 & 1) != 0)
                {
                  objc_msgSend(v81, "identifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  STLog(1, CFSTR("Overriding association between container %@ and app %@"), v32, v33, v34, v35, v36, v37, (uint64_t)v31);

                  AddToMultiDict(*(void **)(v16 + 48), v14, v81);
                  goto LABEL_21;
                }
                objc_msgSend(v80, "addObject:", v15);
                if (objc_msgSend(v15, "userVisible"))
                  objc_msgSend(v79, "addObject:", v15);

                a1 = v16;
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
            if (v11)
              continue;
            break;
          }
        }

        v21 = objc_msgSend(v79, "count");
        if (v21 == 1)
        {
          objc_msgSend(v81, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "firstObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "bundleIdentifier");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          STLog(1, CFSTR("Associating container %@ to %@"), v40, v41, v42, v43, v44, v45, (uint64_t)v38);

          v46 = *(void **)(a1 + 48);
          objc_msgSend(v79, "firstObject");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          AddToMultiDict(v46, v15, v81);
LABEL_21:
          v5 = v78;
        }
        else
        {
          if (!v21)
          {
            v6 = v77;
            v5 = v78;
            if (!objc_msgSend(v80, "count"))
            {
LABEL_24:

              goto LABEL_25;
            }
            objc_msgSend(v81, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "bundleIdentifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            STLog(1, CFSTR("No visible apps claim the container %@, associating to %@"), v24, v25, v26, v27, v28, v29, (uint64_t)v22);

            v30 = *(void **)(a1 + 48);
            objc_msgSend(v80, "firstObject");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "bundleIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            AddToMultiDict(v30, v15, v81);
LABEL_23:

            goto LABEL_24;
          }
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v47 = v79;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v83;
            while (2)
            {
              for (j = 0; j != v49; ++j)
              {
                if (*(_QWORD *)v83 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
                objc_msgSend(v81, "identifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "bundleIdentifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v53, "hasSuffix:", v54);

                if (v55)
                {
                  objc_msgSend(v81, "identifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "bundleIdentifier");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  STLog(1, CFSTR("Force associating container %@ to %@"), v58, v59, v60, v61, v62, v63, (uint64_t)v57);

                  v64 = *(void **)(a1 + 48);
                  objc_msgSend(v52, "bundleIdentifier");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  AddToMultiDict(v64, v15, v81);
                  v9 = v47;
                  goto LABEL_21;
                }
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
              if (v49)
                continue;
              break;
            }
          }

          v5 = v78;
          objc_msgSend(v78, "lastPathComponent");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v9);
          v56 = objc_claimAutoreleasedReturnValue();
          if (!v56)
          {
            if (objc_msgSend(v47, "count"))
              v65 = v47;
            else
              v65 = v80;
            MakePseudoAppForContainer(v9, v65);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v81;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v90, 1);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setSharedContainers:", v66);

            objc_msgSend(v81, "identifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v77;
            if (!objc_msgSend(v47, "count"))
              objc_msgSend(v80, "count");
            STLog(1, CFSTR("Creating fake app for group container %@, %ld owners"), v68, v69, v70, v71, v72, v73, (uint64_t)v67);

            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v15, v9);
            goto LABEL_23;
          }
          v15 = (void *)v56;
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v56, v9);
        }
        v6 = v77;
        goto LABEL_23;
      }
    }
  }
LABEL_25:

}

void __79__STStorageDataManager_updateAppsWithPrevious_usageBundles_skipAppRecordBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setSharedContainers:", v7);

}

+ (void)fixClonesInPhotosAndMessages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  STMSizesOfClones(CFSTR("/private/var/mobile/Library/SMS/Attachments/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  STMSizesOfClones(CFSTR("/private/var/mobile/Library/Photos/Libraries/Syndication.photoslibrary/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v10 += objc_msgSend(v13, "unsignedLongLongValue");
          v9 = (v9 + 1);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  STFormattedSize(v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(4, CFSTR("fix applied: message/photos: %u shared clones using %@"), v15, v16, v17, v18, v19, v20, v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.mobileslideshow"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "externalSizes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[STSizeVector purgeable:](STSizeVector, "purgeable:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "plus:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.mobileslideshow"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setExternalSizes:", v24);

}

@end
