@implementation SSWorldClockUtilities

+ (void)getWorldClockResultsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E6E53298;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "parseQueryForWorldClock:completionHandler:", v10, v11);

}

void __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke(id *a1, uint64_t a2, char a3)
{
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  if (a2)
  {
    v6 = a1[6];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke_2;
    v7[3] = &unk_1E6E53270;
    v10 = v6;
    v8 = a1[4];
    v11 = a3;
    v9 = a1[5];
    objc_msgSend(v6, "timeZoneMatchesForLocation:completionHandler:", a2, v7);

  }
  else
  {
    objc_msgSend(a1[6], "sendResultsForQuery:detectedLocations:shouldEmphasizeTimeZone:completionHandler:", a1[4], 0, 0, a1[5]);
  }
}

uint64_t __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "sendResultsForQuery:detectedLocations:shouldEmphasizeTimeZone:completionHandler:", *(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

+ (void)timeZoneMatchesForLocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke;
  v10[3] = &unk_1E6E532C0;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "getLocationAndTimeZoneForQuery:completionHandler:", v9, v10);

}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  objc_msgSend(*(id *)(a1 + 48), "onDeviceResultsForLocationQuery:", *(_QWORD *)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WorldClockDebugLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_3((uint64_t *)(a1 + 32), v15, v16);

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToTimeZone:", v17))
    v18 = objc_msgSend(v14, "count") != 0;
  else
    v18 = 0;

  if (!v11 || !v12)
    goto LABEL_11;
  objc_msgSend(v15, "countryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v19))
  {

LABEL_11:
    WorldClockDebugLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_1(a1 + 32, v22, v23, v24, v25, v26, v27, v28);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  objc_msgSend(v15, "timeZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToTimeZone:", v12) | v18;

  if (v21 == 1)
    goto LABEL_11;
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setLocation:", v11);
  objc_msgSend(v29, "setTimeZone:", v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLatitude:", v30);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLongitude:", v31);

  WorldClockDebugLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_2(a1 + 32, v32, v33, v34, v35, v36, v37, v38);

  v39 = *(_QWORD *)(a1 + 40);
  if (v29)
  {
    v41[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v40);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v39 + 16))(v39, 0);
  }

LABEL_14:
}

+ (id)onDeviceResultsForLocationQuery:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t j;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *k;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id obj;
  uint64_t v100;
  uint64_t v101;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[4];
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _QWORD v135[3];

  v135[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v103 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v3;
  objc_msgSend(v93, "citiesMatchingName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WorldClockDebugLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[SSWorldClockUtilities onDeviceResultsForLocationQuery:].cold.1((uint64_t)v104, (uint64_t)v7, v8);

  v96 = (void *)objc_opt_new();
  v91 = (void *)objc_opt_new();
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v134, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v127;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v127 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
        objc_msgSend(v13, "countryName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "commonPrefixWithString:options:", v104, 129);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");
        v17 = objc_msgSend(v104, "length");

        if (v16 == v17)
        {
          objc_msgSend(v13, "timeZone");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v96, "objectForKeyedSubscript:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              v21 = (void *)objc_opt_new();
              objc_msgSend(v96, "setObject:forKeyedSubscript:", v21, v18);

            }
            objc_msgSend(v96, "objectForKeyedSubscript:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v13);

          }
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v134, 16);
    }
    while (v10);
  }

  if (!objc_msgSend(v96, "count"))
  {
    v63 = 0;
    v107 = 0;
    v62 = v91;
    goto LABEL_55;
  }
  objc_msgSend(v96, "keyEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = MEMORY[0x1E0C809B0];
  v124[1] = 3221225472;
  v124[2] = __57__SSWorldClockUtilities_onDeviceResultsForLocationQuery___block_invoke;
  v124[3] = &unk_1E6E532E8;
  v25 = v96;
  v125 = v25;
  objc_msgSend(v24, "sortedArrayUsingComparator:", v124);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v25;
  objc_msgSend(v25, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = v29;
  objc_msgSend(v29, "unlocalizedCountryName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "countryCodeForUnlocalizedCountryName:", v30);
  v31 = objc_claimAutoreleasedReturnValue();

  v90 = (void *)v31;
  objc_msgSend(a1, "capitalCityInMultiTimeZoneCountryWithCountryCode:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0C99E80];
  v107 = v32;
  objc_msgSend(v32, "timeZone");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeZoneWithName:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = (void *)objc_opt_new();
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v97 = v26;
  v36 = v93;
  v92 = v35;
  v101 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
  if (!v101)
    goto LABEL_46;
  v100 = *(_QWORD *)v121;
  do
  {
    for (j = 0; j != v101; ++j)
    {
      if (*(_QWORD *)v121 != v100)
        objc_enumerationMutation(v97);
      v38 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "secondsFromGMT");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        if (v107 && objc_msgSend(v35, "secondsFromGMT") == v40)
        {
          v43 = v107;
LABEL_43:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "setObject:forKeyedSubscript:", v43, v57);

          goto LABEL_44;
        }
        objc_msgSend(v105, "timeZone");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v38, "isEqualToString:", v44);

        if (v107 || v45)
        {
          objc_msgSend(v36, "defaultCityForTimeZone:", v39);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "unlocalizedCountryName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "unlocalizedCountryName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v47, "isEqualToString:", v48);

          if (v49)
          {
            v43 = v46;
          }
          else
          {
            v95 = v46;
            objc_msgSend(v94, "objectForKeyedSubscript:", v38);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = 0u;
            v117 = 0u;
            v118 = 0u;
            v119 = 0u;
            v98 = v50;
            v43 = (id)objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
            if (v43)
            {
              v51 = *(_QWORD *)v117;
              while (2)
              {
                for (k = 0; k != v43; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v117 != v51)
                    objc_enumerationMutation(v98);
                  v53 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)k);
                  objc_msgSend(v53, "unlocalizedCountryName");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "unlocalizedCountryName");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = objc_msgSend(v54, "isEqualToString:", v55);

                  if (v56)
                  {
                    v43 = v53;
                    goto LABEL_40;
                  }
                }
                v43 = (id)objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
                if (v43)
                  continue;
                break;
              }
LABEL_40:
              v35 = v92;
              v36 = v93;
            }

            v46 = v95;
          }

          if (v43)
            goto LABEL_43;
        }
      }
LABEL_44:

    }
    v101 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
  }
  while (v101);
LABEL_46:

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  objc_msgSend(v106, "keyEnumerator");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "allObjects");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sortedArrayUsingSelector:", sel_compare_);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
  v63 = v90;
  v62 = v91;
  if (v61)
  {
    v64 = v61;
    v65 = *(_QWORD *)v113;
    do
    {
      for (m = 0; m != v64; ++m)
      {
        if (*(_QWORD *)v113 != v65)
          objc_enumerationMutation(v60);
        objc_msgSend(v106, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * m));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "addObject:", v67);

      }
      v64 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
    }
    while (v64);
  }

LABEL_55:
  if (!objc_msgSend(v62, "count"))
  {
    objc_msgSend(obj, "firstObject");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(obj, "firstObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addObject:", v69);

    }
  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v70 = v62;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v109;
    do
    {
      for (n = 0; n != v72; ++n)
      {
        if (*(_QWORD *)v109 != v73)
          objc_enumerationMutation(v70);
        v75 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * n);
        v76 = (void *)objc_opt_new();
        if (objc_msgSend(v63, "length") && objc_msgSend(v70, "count") == 1)
        {
          objc_msgSend(v75, "countryName");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setLocation:", v77);
        }
        else
        {
          objc_msgSend(v75, "name");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "countryName");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "formattedLocationForCity:country:", v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setLocation:", v79);

        }
        v80 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v75, "latitude");
        objc_msgSend(v80, "numberWithFloat:");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setLatitude:", v81);

        v82 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v75, "longitude");
        objc_msgSend(v82, "numberWithFloat:");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setLongitude:", v83);

        objc_msgSend(v75, "countryName");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setCountryName:", v84);

        v85 = (void *)MEMORY[0x1E0C99E80];
        objc_msgSend(v75, "timeZone");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "timeZoneWithName:", v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setTimeZone:", v87);

        objc_msgSend(v76, "setCountryCode:", v63);
        objc_msgSend(v76, "setIsCapital:", v75 == v107);
        objc_msgSend(v103, "addObject:", v76);

      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
    }
    while (v72);
  }

  v88 = (void *)objc_msgSend(v103, "copy");
  return v88;
}

uint64_t __57__SSWorldClockUtilities_onDeviceResultsForLocationQuery___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v8 - objc_msgSend(v9, "count");
  return v10;
}

+ (void)getLocationAndTimeZoneForQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForSearchQuery:filters:maxResults:traits:", v6, 0, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__SSWorldClockUtilities_getLocationAndTimeZoneForQuery_completionHandler___block_invoke;
  v12[3] = &unk_1E6E53310;
  v14 = v7;
  v15 = a1;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "submitWithRefinedHandler:networkActivity:", v12, 0);

}

void __74__SSWorldClockUtilities_getLocationAndTimeZoneForQuery_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
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
  uint64_t v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a2, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)a1[6];
    objc_msgSend(v7, "addressObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cityDisplayNameWithFallback:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addressObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "countryName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formattedLocationForCity:country:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v8, "addressDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Street"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {

LABEL_7:
    v19 = 0;
    v20 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SubLocality"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
    goto LABEL_7;
  v20 = 0;
  v19 = v14;
LABEL_8:
  v21 = v19;

  objc_msgSend(v8, "timezone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_bestAvailableCountryCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  WorldClockDebugLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v28 = a1[4];
    v29 = 138413826;
    v30 = v28;
    v31 = 2112;
    v32 = v15;
    v33 = 1024;
    v34 = v20;
    v35 = 2112;
    v36 = v21;
    v37 = 2112;
    v38 = v22;
    v39 = 2112;
    v40 = v23;
    v41 = 2112;
    v42 = v6;
    _os_log_debug_impl(&dword_1B86C5000, v24, OS_LOG_TYPE_DEBUG, "Result from GeoServices query “%@“: %@ (isAddress: %d, parsed location: %@, time zone: %@, country code: %@, error: %@)", (uint8_t *)&v29, 0x44u);
  }

  v25 = a1[5];
  objc_msgSend(v8, "coordinate");
  v27 = v26;
  objc_msgSend(v8, "coordinate");
  (*(void (**)(uint64_t, id, void *, void *, double))(v25 + 16))(v25, v21, v22, v23, v27);

}

+ (id)formattedLocationForCity:(id)a3 country:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length")
    && objc_msgSend(v6, "length")
    && !objc_msgSend(v5, "isEqualToString:", v6))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TIME_ZONE_LOCATION_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "length"))
      v7 = v5;
    else
      v7 = v6;
    v8 = v7;
  }

  return v8;
}

+ (void)getFormattedWorldClockResultsFromTimeZoneLocations:(id)a3 shouldEmphasizeTimeZone:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void (**v45)(id, void *, void *, void *);
  id obj;
  _BOOL4 v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[3];
  _QWORD v63[3];
  _BYTE v64[128];
  uint64_t v65;

  v47 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v45 = (void (**)(id, void *, void *, void *))a5;
  v49 = (void *)objc_opt_new();
  v48 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v6;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  v7 = 0;
  if (v51)
  {
    v50 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v59 != v50)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v9, "timeZone");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(a1, "formattedTimeForDate:timeZone:", v54, v10);
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_opt_new();
          objc_msgSend(v9, "location");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setLocation:", v14);

          objc_msgSend(v9, "countryName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCountryName:", v15);

          v55 = (void *)v11;
          objc_msgSend(v13, "setTime:", v11);
          objc_msgSend(a1, "timeZoneOffsetDescriptionForDate:timeZone:", v54, v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTimeZoneOffsetDescription:", v16);

          if (objc_msgSend(v10, "isDaylightSavingTime"))
            v17 = 2;
          else
            v17 = 0;
          v52 = (void *)v12;
          objc_msgSend(v10, "localizedName:locale:", v17, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTimeZoneDescription:", v18);

          objc_msgSend(v10, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTimeZoneName:", v19);

          objc_msgSend(v10, "abbreviation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTimeZoneAbbreviation:", v20);

          objc_msgSend(v13, "timeZoneOffsetDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TIME_AND_TIME_ZONE_OFFSET_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "timeZoneOffsetDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", v24, v55, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setTimeAndTimeZoneOffsetDescription:", v26);

          }
          else
          {
            objc_msgSend(v13, "setTimeAndTimeZoneOffsetDescription:", v11);
          }

          objc_msgSend(v13, "setShouldEmphasizeTimeZone:", v47);
          objc_msgSend(v9, "latitude");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          v29 = v28;
          objc_msgSend(v9, "longitude");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          objc_msgSend(a1, "clockImageForDate:timeZone:latitude:longitude:", v54, v10, v29, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setClockImage:", v32);

          v33 = objc_msgSend(v9, "isCapital");
          if (v7)
            v34 = v33;
          else
            v34 = 1;
          if (v34)
            v35 = v13;
          else
            v35 = v7;
          v36 = v35;

          v37 = (void *)objc_opt_new();
          objc_msgSend(v37, "setApplicationBundleIdentifier:", CFSTR("com.apple.mobiletimer"));
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.clock.worldclock"));
          v62[0] = CFSTR("TimeZone");
          objc_msgSend(v10, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v63[0] = v39;
          v62[1] = CFSTR("Latitude");
          objc_msgSend(v9, "latitude");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v63[1] = v40;
          v62[2] = CFSTR("Longitude");
          objc_msgSend(v9, "longitude");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v63[2] = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setUserInfo:", v42);

          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __118__SSWorldClockUtilities_getFormattedWorldClockResultsFromTimeZoneLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke;
          v56[3] = &unk_1E6E53338;
          v57 = v37;
          v43 = v37;
          objc_msgSend(v38, "_createUserActivityStringsWithOptions:completionHandler:", 0, v56);
          objc_msgSend(v13, "setPunchoutCommand:", v43);
          objc_msgSend(v49, "addObject:", v13);
          objc_msgSend(v13, "location");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v44);

          v7 = v36;
        }

      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v51);
  }

  v45[2](v45, v49, v7, v48);
}

uint64_t __118__SSWorldClockUtilities_getFormattedWorldClockResultsFromTimeZoneLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserActivityRequiredString:", a2);
}

+ (void)sendResultsForQuery:(id)a3 detectedLocations:(id)a4 shouldEmphasizeTimeZone:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a5;
  v9 = a6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __105__SSWorldClockUtilities_sendResultsForQuery_detectedLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke;
  v11[3] = &unk_1E6E53380;
  v12 = v9;
  v13 = a1;
  v10 = v9;
  objc_msgSend(a1, "getFormattedWorldClockResultsFromTimeZoneLocations:shouldEmphasizeTimeZone:completionHandler:", a4, v6, v11);

}

void __105__SSWorldClockUtilities_sendResultsForQuery_detectedLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
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
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setSectionBundleIdentifier:", CFSTR("com.apple.worldclock"));
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("/"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("com.apple.worldclock"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", v13);

    objc_msgSend(v10, "setTopHit:", SSSetTopHitWithReasonString(2, v10, CFSTR("SSWorldClock direct"), 1));
    objc_msgSend(v10, "setType:", 2);
    objc_msgSend(v10, "setResultBundleId:", CFSTR("com.apple.worldclock"));
    v14 = (void *)objc_opt_new();
    objc_msgSend(v10, "setInlineCard:", v14);

    objc_msgSend(*(id *)(a1 + 40), "inlineCardSectionForFormattedData:primaryCityFormattedData:", v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inlineCard");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCardSections:", v16);

    if (NavdRecentLocationsEntitlment_block_invoke_onceToken != -1)
      dispatch_once(&NavdRecentLocationsEntitlment_block_invoke_onceToken, &__block_literal_global_54);
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setBundleIdentifier:", CFSTR("com.apple.worldclock"));
    v21 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setResults:", v19);

    objc_msgSend(v18, "setGroupName:", NavdRecentLocationsEntitlment_block_invoke_clockAppName);
    objc_msgSend(v18, "groupName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v20);

  }
  else
  {
    v18 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __105__SSWorldClockUtilities_sendResultsForQuery_detectedLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobiletimer"), 1, 0);
  objc_msgSend(v2, "localizedName");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NavdRecentLocationsEntitlment_block_invoke_clockAppName;
  NavdRecentLocationsEntitlment_block_invoke_clockAppName = v0;

}

+ (id)countryCodeForUnlocalizedCountryName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = countryCodeForUnlocalizedCountryName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&countryCodeForUnlocalizedCountryName__onceToken, &__block_literal_global_170);
  objc_msgSend((id)countryCodeForUnlocalizedCountryName__countryCodesForUnlocalizedCountryNames, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

void __62__SSWorldClockUtilities_countryCodeForUnlocalizedCountryName___block_invoke()
{
  void *v0;

  v0 = (void *)countryCodeForUnlocalizedCountryName__countryCodesForUnlocalizedCountryNames;
  countryCodeForUnlocalizedCountryName__countryCodesForUnlocalizedCountryNames = (uint64_t)&unk_1E6E9B948;

}

+ (id)capitalCityInMultiTimeZoneCountryWithCountryCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (capitalCityInMultiTimeZoneCountryWithCountryCode__onceToken != -1)
    dispatch_once(&capitalCityInMultiTimeZoneCountryWithCountryCode__onceToken, &__block_literal_global_212);
  objc_msgSend((id)capitalCityInMultiTimeZoneCountryWithCountryCode__capitalCityIdentifiersForCountryCodes, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "citiesWithIdentifiers:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __74__SSWorldClockUtilities_capitalCityInMultiTimeZoneCountryWithCountryCode___block_invoke()
{
  void *v0;

  v0 = (void *)capitalCityInMultiTimeZoneCountryWithCountryCode__capitalCityIdentifiersForCountryCodes;
  capitalCityInMultiTimeZoneCountryWithCountryCode__capitalCityIdentifiersForCountryCodes = (uint64_t)&unk_1E6E9B970;

}

+ (id)inlineCardSectionForFormattedData:(id)a3 primaryCityFormattedData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v25;
  void *v26;
  void *v27;
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
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D8C660];
  objc_msgSend(v7, "timeZoneDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textWithString:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D8C660];
  objc_msgSend(v7, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v7, "clockImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setThumbnail:", v15);

  if (objc_msgSend(v7, "shouldEmphasizeTimeZone"))
  {
    objc_msgSend(v14, "setTitle:", v10, v10);
    v16 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v7, "timeAndTimeZoneOffsetDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v18;
    v19 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v7, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDescriptions:", v22);

  }
  else
  {
    objc_msgSend(v14, "setTitle:", v13, v10);
    objc_msgSend(v7, "timeZoneOffsetDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v7, "timeZoneAbbreviation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v24;
      objc_msgSend(v7, "timeZoneOffsetDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "timeZoneDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v26 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(" · "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "textWithString:", v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDescriptions:", v28);

    v29 = (void *)MEMORY[0x1E0D8C3D0];
    objc_msgSend(v7, "time");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTrailingMiddleText:", v21);
  }

  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v30 = (void *)MEMORY[0x1E0D8C3D0];
    objc_msgSend(a1, "additionalTimeZonesStringForFormattedData:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "textWithString:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTrailingBottomText:", v32);

  }
  objc_msgSend(a1, "commandForFormattedData:", v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCommand:", v33);

  objc_msgSend(a1, "clockColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v34);

  return v14;
}

+ (id)clockColor
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setApplicationBundleIdentifier:", CFSTR("com.apple.mobiletimer"));
  return v2;
}

+ (id)compactCardSectionForFormattedData:(id)a3 primaryCityFormattedData:(id)a4
{
  id v6;
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
  void **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D8C660];
  objc_msgSend(v7, "timeAndTimeZoneOffsetDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D8C660];
  objc_msgSend(v7, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v7, "clockImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setThumbnail:", v15);

  if (objc_msgSend(v7, "shouldEmphasizeTimeZone"))
  {
    v16 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v7, "timeZoneDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v18);

    v30 = v10;
    v31 = v13;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v30;
    v21 = 2;
  }
  else
  {
    objc_msgSend(v14, "setTitle:", v10);
    v29 = v13;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v29;
    v21 = 1;
  }
  objc_msgSend(v19, "arrayWithObjects:count:", v20, v21, v29, v30, v31, v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v23 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(a1, "additionalTimeZonesStringForFormattedData:", v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textWithString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayByAddingObject:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v26;
  }
  objc_msgSend(v14, "setDescriptions:", v22);
  objc_msgSend(v14, "setShouldUseCompactDisplay:", 1);
  objc_msgSend(a1, "commandForFormattedData:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCommand:", v27);

  return v14;
}

+ (id)additionalTimeZonesStringForFormattedData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADDITIONAL_TIME_ZONES_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v5, "count");

  objc_msgSend(v8, "numberWithUnsignedInteger:", v9 - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)commandForFormattedData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id obj;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v4, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "punchoutCommand");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = a1;
    v41 = (void *)objc_opt_new();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v5)
    {
      v6 = v5;
      v40 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v43 != v40)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v9 = (void *)objc_opt_new();
          objc_msgSend(v8, "clockImage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setThumbnail:", v10);

          v11 = (void *)MEMORY[0x1E0D8C660];
          objc_msgSend(v8, "timeZoneDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textWithString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTitle:", v13);

          v14 = (void *)MEMORY[0x1E0D8C660];
          objc_msgSend(v8, "location");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "textWithString:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = v16;
          v17 = (void *)MEMORY[0x1E0D8C660];
          objc_msgSend(v8, "timeZoneOffsetDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "textWithString:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46[1] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setDescriptions:", v20);

          v21 = (void *)MEMORY[0x1E0D8C3D0];
          objc_msgSend(v8, "time");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "textWithString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTrailingMiddleText:", v23);

          objc_msgSend(v8, "punchoutCommand");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCommand:", v24);

          objc_msgSend(v41, "addObject:", v9);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v6);
    }

    if (commandForFormattedData__onceToken != -1)
      dispatch_once(&commandForFormattedData__onceToken, &__block_literal_global_242);
    v25 = (void *)objc_opt_new();
    v26 = v25;
    if (commandForFormattedData__isiPhone)
    {
      objc_msgSend(v38, "clockColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBackgroundColor:", v27);

    }
    else
    {
      objc_msgSend(v25, "setBackgroundColor:", 0);
    }
    objc_msgSend(v26, "setCardSections:", v41);
    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("COUNTRY_TIME_ZONE_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "countryName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:", v35);

    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "setSymbolName:", CFSTR("clock.fill"));
    objc_msgSend(v36, "setIsTemplate:", 1);
    objc_msgSend(v26, "setTitleImage:", v36);
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "setCard:", v26);

  }
  return v29;
}

uint64_t __49__SSWorldClockUtilities_commandForFormattedData___block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  commandForFormattedData__isiPhone = (_DWORD)result == 1;
  return result;
}

+ (void)parseQueryForWorldClock:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "parseQueryForWorldClock:forceLoad:completionHandler:", a3, 0, a4);
}

+ (void)parseQueryForWorldClock:(id)a3 forceLoad:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  _BYTE v48[128];
  _QWORD v49[3];
  _QWORD v50[6];

  v6 = a4;
  v50[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (v6)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v9, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    objc_msgSend(v9, "dateFromString:", CFSTR("9/30/2020"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = CFSTR("date");
    v49[1] = CFSTR("kMDQueryOptionContextIdentifier");
    v50[0] = v10;
    v50[1] = CFSTR("com.apple.Spotlight");
    v49[2] = CFSTR("waitForLoad");
    v50[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  SSQueryParseResultsForQueryString(v7, v11, 0, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("attributedParses"));
  v23 = v12;
  v24 = v11;
  v25 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  v26 = v7;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__10;
  v40 = __Block_byref_object_dispose__10;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "length", v23, v24, v25, v26);
        v27[0] = v16;
        v27[1] = 3221225472;
        v27[2] = __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke;
        v27[3] = &unk_1E6E53430;
        v27[4] = &v36;
        v27[5] = &v32;
        objc_msgSend(v18, "enumerateAttributesInRange:options:usingBlock:", 0, v19, 0, v27);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v48, 16);
    }
    while (v14);
  }

  WorldClockDebugLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = v37[5];
    v22 = *((unsigned __int8 *)v33 + 24);
    *(_DWORD *)buf = 138412802;
    v43 = v26;
    v44 = 2112;
    v45 = v21;
    v46 = 1024;
    v47 = v22;
    _os_log_debug_impl(&dword_1B86C5000, v20, OS_LOG_TYPE_DEBUG, "Parsing query “%@“ for World Clock: location string parsed: %@, isTimeZoneQuery: %d", buf, 0x1Cu);
  }

  v25[2](v25, v37[5], *((unsigned __int8 *)v33 + 24));
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

}

uint64_t __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  _QWORD v8[4];
  __int128 v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6E53408;
  v9 = *(_OWORD *)(a1 + 32);
  result = objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v8);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a5 = 1;
  return result;
}

void __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  char v9;
  int v10;
  id v11;

  v11 = a3;
  v8 = a2;
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("kQPTimeLocation"));
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("kQPTimezoneLocation"));

  if ((v9 & 1) != 0 || v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
    *a4 = 1;
  }

}

+ (id)formattedTimeForDate:(id)a3 timeZone:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;

  v5 = formattedTimeForDate_timeZone__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&formattedTimeForDate_timeZone__onceToken, &__block_literal_global_272_0);
  objc_msgSend((id)formattedTimeForDate_timeZone__formatter, "setTimeZone:", v6);

  objc_msgSend((id)formattedTimeForDate_timeZone__formatter, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __55__SSWorldClockUtilities_formattedTimeForDate_timeZone___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)formattedTimeForDate_timeZone__formatter;
  formattedTimeForDate_timeZone__formatter = v0;

  return objc_msgSend((id)formattedTimeForDate_timeZone__formatter, "setTimeStyle:", 1);
}

+ (id)timeZoneOffsetDescriptionForDate:(id)a3 timeZone:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v5 = a3;
  v6 = objc_msgSend(a4, "secondsFromGMT");
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "secondsFromGMT");

  v9 = v6 - v8;
  if (v6 == v8)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "dateByAddingTimeInterval:", (double)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDate:inSameDayAsDate:", v5, v11);

    if ((v13 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      if (timeZoneOffsetDescriptionForDate_timeZone__onceToken != -1)
        dispatch_once(&timeZoneOffsetDescriptionForDate_timeZone__onceToken, &__block_literal_global_274);
      objc_msgSend((id)timeZoneOffsetDescriptionForDate_timeZone__formatter, "stringFromDate:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (timeZoneOffsetDescriptionForDate_timeZone__onceToken_275 != -1)
      dispatch_once(&timeZoneOffsetDescriptionForDate_timeZone__onceToken_275, &__block_literal_global_276);
    objc_msgSend((id)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter, "stringFromTimeInterval:", (double)v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v9 & 0x8000000000000000) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("POSITIVE_TIME_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v18, v15);
      v19 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
    }
    v20 = CFSTR("TIME_ZONE_OFFSET_FORMAT_HOURS");
    if (v9 >= 0)
      v21 = v9;
    else
      v21 = -v9;
    if (v21 < 0xE10)
      v20 = CFSTR("TIME_ZONE_OFFSET_FORMAT_MINUTES");
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (void *)MEMORY[0x1E0CB34D0];
    v24 = v20;
    objc_msgSend(v23, "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", v24, &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "stringWithFormat:", v26, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("TIME_ZONE_DATE_AND_OFFSET_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", v29, v14, v10);
      v30 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v30;
    }

  }
  return v10;
}

uint64_t __67__SSWorldClockUtilities_timeZoneOffsetDescriptionForDate_timeZone___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)timeZoneOffsetDescriptionForDate_timeZone__formatter;
  timeZoneOffsetDescriptionForDate_timeZone__formatter = v0;

  objc_msgSend((id)timeZoneOffsetDescriptionForDate_timeZone__formatter, "setDateStyle:", 1);
  objc_msgSend((id)timeZoneOffsetDescriptionForDate_timeZone__formatter, "setTimeStyle:", 0);
  return objc_msgSend((id)timeZoneOffsetDescriptionForDate_timeZone__formatter, "setDoesRelativeDateFormatting:", 1);
}

uint64_t __67__SSWorldClockUtilities_timeZoneOffsetDescriptionForDate_timeZone___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter;
  timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter = v0;

  objc_msgSend((id)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter, "setUnitsStyle:", 0);
  return objc_msgSend((id)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter, "setZeroFormattingBehavior:", 14);
}

+ (id)clockImageForDate:(id)a3 timeZone:(id)a4 latitude:(double)a5 longitude:(double)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v9 = (void *)MEMORY[0x1E0C99D48];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsInTimeZone:fromDate:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v16 = v15;

  objc_msgSend(v14, "calculateAstronomicalTimeForLocation:time:", a5, a6, v16);
  v17 = objc_msgSend(v14, "isDayLight");
  v18 = objc_msgSend(v13, "hour");
  v19 = v18 + 12;
  if (v17)
    v19 = v18;
  if (v18 > 11)
    v19 = v18;
  if (v18 < 12 || v17 == 0)
    v21 = v19;
  else
    v21 = v18 - 12;
  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHour:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "minute"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMinute:", v24);

  return v22;
}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1B86C5000, a2, a3, "Returning on-device city results for location “%@“", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1B86C5000, a2, a3, "Returning GEOServices result for location “%@“", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_3(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  objc_msgSend(a2, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413058;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  _os_log_debug_impl(&dword_1B86C5000, a3, OS_LOG_TYPE_DEBUG, "First result from on-device cities for location “%@“: %@ (time zone: %@, country code: %@)", (uint8_t *)&v9, 0x2Au);

}

+ (void)onDeviceResultsForLocationQuery:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1B86C5000, log, OS_LOG_TYPE_DEBUG, "[ALCityManager citiesMatchingName:] for location “%@“: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_8();
}

@end
