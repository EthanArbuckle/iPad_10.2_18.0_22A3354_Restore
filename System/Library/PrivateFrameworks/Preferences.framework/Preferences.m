id __SpecifiersFromPlist(void *a1, void *a2, void *a3, void *a4, void *a5, id *a6, void **a7, void *a8, void **a9, char a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char isKindOfClass;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  int HasCapabilities;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  char v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  BOOL v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t m;
  uint64_t v108;
  void *v109;
  NSString *v110;
  NSString *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSString *v118;
  NSString *v119;
  NSString *v120;
  NSString *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSString *v128;
  uint64_t v129;
  NSString *v130;
  NSString *v131;
  SEL v132;
  SEL v133;
  NSString *v134;
  char v135;
  NSString *v136;
  NSString *v137;
  Class v138;
  void *v139;
  SEL v140;
  id v141;
  id v142;
  id v143;
  void *v144;
  uint64_t v145;
  void *v146;
  _QWORD *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t n;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  char v162;
  void *v163;
  char v164;
  void *v165;
  char v166;
  void *v167;
  char v168;
  void *v169;
  char v170;
  void *v171;
  int v172;
  void *v173;
  void *v174;
  void *v175;
  NSString *v176;
  SEL v177;
  NSString *v178;
  NSString *v179;
  SEL v180;
  void *v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  __CFString *v186;
  void *v187;
  void *v188;
  NSString *v189;
  NSString *v190;
  SEL v191;
  NSString *v192;
  NSString *v193;
  SEL v194;
  NSString *v195;
  NSString *v196;
  SEL v197;
  NSString *v198;
  NSString *v199;
  SEL v200;
  uint64_t v201;
  id v202;
  void *v204;
  void *v205;
  __CFString *v206;
  id v207;
  id v208;
  id v209;
  id obj;
  void *v211;
  id v212;
  unint64_t v213;
  id v214;
  id v215;
  NSString *v216;
  NSString *v217;
  NSString *v218;
  void *v219;
  void *v220;
  void *v221;
  uint64_t v222;
  id v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  uint64_t v235;
  NSString *v236;
  NSString *aSelectorName;
  id v238;
  void *v239;
  uint64_t v240;
  void *v241;
  void *v242;
  _QWORD *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
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
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  _BYTE v272[128];
  uint64_t v273;

  v273 = *MEMORY[0x1E0C80C00];
  v17 = a1;
  v208 = a2;
  v212 = a3;
  v209 = a4;
  v18 = a5;
  v207 = a8;
  objc_msgSend(v17, "objectForKey:", CFSTR("title"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    if (v18)
    {
      objc_msgSend(v18, "localizedStringForKey:value:table:", v205, &stru_1E4A69238, v209);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(a6, v19);
    }
    else
    {
      v20 = v205;
      v19 = *a6;
      *a6 = v20;
    }

  }
  if (a7)
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("id"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *a7;
    *a7 = (void *)v21;

  }
  objc_msgSend(v17, "objectForKey:", CFSTR("specifierAttributes"));
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = v17;
  objc_msgSend(v17, "objectForKey:", CFSTR("items"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  v223 = (id)objc_claimAutoreleasedReturnValue();
  v260 = 0u;
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  obj = v23;
  v225 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v271, 16);
  if (v225)
  {
    v222 = *(_QWORD *)v261;
    v247 = v18;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v261 != v222)
          objc_enumerationMutation(obj);
        v240 = v24;
        v25 = *(id *)(*((_QWORD *)&v260 + 1) + 8 * v24);
        v26 = (void *)objc_msgSend(v25, "mutableCopy");

        v258 = 0u;
        v259 = 0u;
        v256 = 0u;
        v257 = 0u;
        v27 = v224;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v256, v270, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v257;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v257 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v256 + 1) + 8 * i);
              objc_msgSend(v26, "objectForKeyedSubscript:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v26, "objectForKeyedSubscript:", v32);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();

                  if ((isKindOfClass & 1) != 0)
                  {
                    objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "objectForKeyedSubscript:", v32);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = (void *)objc_msgSend(v38, "mutableCopy");

                    objc_msgSend(v39, "addObjectsFromArray:", v37);
LABEL_27:
                    objc_msgSend(v26, "setObject:forKeyedSubscript:", v39, v32);

                    goto LABEL_28;
                  }
                }
                else
                {

                }
                objc_msgSend(v26, "objectForKeyedSubscript:", v32);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v41 = objc_opt_isKindOfClass();

                  if ((v41 & 1) == 0)
                    continue;
                  objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "objectForKeyedSubscript:", v32);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = (void *)objc_msgSend(v42, "mutableCopy");

                  objc_msgSend(v39, "addEntriesFromDictionary:", v37);
                  goto LABEL_27;
                }
              }
              else
              {
                objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, v32);
              }
LABEL_28:

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v256, v270, 16);
          }
          while (v29);
        }

        v43 = objc_opt_class();
        v44 = v26;
        objc_msgSend(v44, "objectForKey:", CFSTR("requiredCapabilities"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v45)
          HasCapabilities = SystemHasCapabilities(v45);
        else
          HasCapabilities = 1;
        objc_msgSend(v44, "objectForKey:", CFSTR("requiredCapabilitiesOr"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v48)
        {
          v267 = 0u;
          v266 = 0u;
          v265 = 0u;
          v264 = 0u;
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v264, v272, 16);
          if (v50)
          {
            v51 = v50;
            LOBYTE(v52) = 0;
            v53 = *(_QWORD *)v265;
            do
            {
              for (j = 0; j != v51; ++j)
              {
                if (*(_QWORD *)v265 != v53)
                  objc_enumerationMutation(v49);
                if ((v52 & 1) != 0)
                  v52 = 1;
                else
                  v52 = SystemHasCapabilities(*(void **)(*((_QWORD *)&v264 + 1) + 8 * j));
              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v264, v272, 16);
            }
            while (v51);
          }
          else
          {
            v52 = 0;
          }
          HasCapabilities &= v52;
        }
        v18 = v247;
        if (_CustomCapabilityCheck)
          HasCapabilities = (*(uint64_t (**)(void))(_CustomCapabilityCheck + 16))();
        objc_msgSend(v44, "objectForKey:", CFSTR("skippedInEduMode"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v55, "BOOLValue"))
          v56 = PSIsInEDUMode();
        else
          v56 = 0;

        if (((v56 & 1) != 0
           || ((HasCapabilities ^ 1) & 1) != 0
           || ProcessedSpecifierBundle(v44, v207, v208, a9, v223))
          && (a10 & 1) != 0)
        {
          v57 = v240;
          goto LABEL_274;
        }
        v58 = v209;
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("strings"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v244 = (void *)v43;
        if (v59)
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("strings"));
          v60 = objc_claimAutoreleasedReturnValue();

          v58 = (id)v60;
        }
        v61 = v247;
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("stringsBundlePath"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          v63 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("stringsBundlePath"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          SFRuntimeAbsoluteFilePathForPath();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "bundleWithPath:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("stringsBundleID"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = v61;
          if (!v67)
            goto LABEL_66;
          v68 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("stringsBundleID"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "bundleWithIdentifier:", v64);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v61;
        }

LABEL_66:
        v228 = v61;
        objc_msgSend(v44, "objectForKey:", CFSTR("cell"));
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = +[PSTableCell cellTypeFromString:](PSTableCell, "cellTypeFromString:");
        objc_msgSend(v44, "objectForKey:", CFSTR("label"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = v70;
        if (v70)
        {
          if (v66)
          {
            objc_msgSend(v66, "localizedStringForKey:value:table:", v70, &stru_1E4A69238, v58);
            v238 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v238 = v70;
          }
          objc_msgSend(v44, "objectForKey:", CFSTR("id"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v71)
            objc_msgSend(v44, "setObject:forKey:", v227, CFSTR("id"));
        }
        else
        {
          v238 = 0;
        }
        objc_msgSend(v44, "objectForKey:", CFSTR("footerText"));
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        if (v234)
        {
          if (v66)
          {
            objc_msgSend(v66, "localizedStringForKey:value:table:", v234, &stru_1E4A69238, v58);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v72, CFSTR("footerText"));

          }
          else
          {
            objc_msgSend(v44, "setObject:forKey:", v234, CFSTR("footerText"));
          }
        }
        objc_msgSend(v44, "objectForKey:", CFSTR("headerDetailText"));
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        if (v233)
        {
          if (v66)
          {
            objc_msgSend(v66, "localizedStringForKey:value:table:", v233, &stru_1E4A69238, v58);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v73, CFSTR("headerDetailText"));

          }
          else
          {
            objc_msgSend(v44, "setObject:forKey:", v233, CFSTR("headerDetailText"));
          }
        }
        objc_msgSend(v44, "objectForKey:", CFSTR("keywords"));
        v74 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v232 = (void *)v74;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v66)
          {
            objc_msgSend(v66, "localizedStringForKey:value:table:", v74, &stru_1E4A69238, v58);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v75, CFSTR("keywords"));

          }
          else
          {
            objc_msgSend(v44, "setObject:forKey:", v74, CFSTR("keywords"));
          }
        }
        objc_msgSend(v44, "objectForKey:", CFSTR("contentDescription"));
        v76 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v231 = (void *)v76;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v66)
          {
            objc_msgSend(v66, "localizedStringForKey:value:table:", v76, &stru_1E4A69238, v58);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v77, CFSTR("contentDescription"));

          }
          else
          {
            objc_msgSend(v44, "setObject:forKey:", v76, CFSTR("contentDescription"));
          }
        }
        objc_msgSend(v44, "objectForKey:", CFSTR("alignment"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (v78)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            AlignmentFromString(v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v79, CFSTR("alignment"));

          }
          objc_msgSend(v44, "objectForKey:", CFSTR("footerAlignment"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v219 = v80;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            AlignmentFromString(v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKey:", v81, CFSTR("footerAlignment"));

          }
        }
        else
        {
          objc_msgSend(v44, "objectForKey:", CFSTR("footerAlignment"));
          v219 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v220 = v78;
        v213 = v69;
        if (v69 > 8)
        {
          if (v69 != 13)
          {
            if (v69 == 9)
            {
LABEL_101:
              objc_msgSend(v44, "objectForKey:", CFSTR("validValues"));
              v241 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "objectForKey:", CFSTR("validTitles"));
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v242 = v82;
              if (v82)
              {
                v83 = v82;
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v82, "count"));
                v246 = (void *)objc_claimAutoreleasedReturnValue();
                v252 = 0u;
                v253 = 0u;
                v254 = 0u;
                v255 = 0u;
                v84 = v83;
                v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v252, v269, 16);
                if (v85)
                {
                  v86 = v85;
                  v87 = *(_QWORD *)v253;
                  do
                  {
                    for (k = 0; k != v86; ++k)
                    {
                      if (*(_QWORD *)v253 != v87)
                        objc_enumerationMutation(v84);
                      v89 = *(_QWORD *)(*((_QWORD *)&v252 + 1) + 8 * k);
                      if (v66)
                      {
                        objc_msgSend(v66, "localizedStringForKey:value:table:", v89, &stru_1E4A69238, v58);
                        v90 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v246, "addObject:", v90);

                      }
                      else
                      {
                        objc_msgSend(v246, "addObject:", v89);
                      }
                    }
                    v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v252, v269, 16);
                  }
                  while (v86);
                }

              }
              else
              {
                v246 = 0;
              }
              objc_msgSend(v44, "objectForKey:", CFSTR("shortTitles"));
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = v100;
              if (v100)
              {
                v214 = v44;
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v100, "count"));
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v248 = 0u;
                v249 = 0u;
                v250 = 0u;
                v251 = 0u;
                v103 = v101;
                v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v248, v268, 16);
                if (v104)
                {
                  v105 = v104;
                  v106 = *(_QWORD *)v249;
                  do
                  {
                    for (m = 0; m != v105; ++m)
                    {
                      if (*(_QWORD *)v249 != v106)
                        objc_enumerationMutation(v103);
                      v108 = *(_QWORD *)(*((_QWORD *)&v248 + 1) + 8 * m);
                      if (v66)
                      {
                        objc_msgSend(v66, "localizedStringForKey:value:table:", v108, &stru_1E4A69238, v58);
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v102, "addObject:", v109);

                      }
                      else
                      {
                        objc_msgSend(v102, "addObject:", v108);
                      }
                    }
                    v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v248, v268, 16);
                  }
                  while (v105);
                }
                v239 = v102;

                v44 = v214;
                v69 = v213;
              }
              else
              {
                v239 = 0;
              }
              if (!v241)
              {
                objc_msgSend(v44, "objectForKey:", CFSTR("valuesDataSource"));
                v110 = (NSString *)objc_claimAutoreleasedReturnValue();
                v111 = v110;
                if (v110)
                {
                  NSSelectorFromString(v110);
                  SFPerformSelector();
                  v241 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v241 = 0;
                }

              }
              if (!v246)
              {
                objc_msgSend(v44, "objectForKey:", CFSTR("titlesDataSource"));
                v118 = (NSString *)objc_claimAutoreleasedReturnValue();
                v119 = v118;
                if (v118)
                {
                  NSSelectorFromString(v118);
                  SFPerformSelector();
                  v246 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v246 = 0;
                }

              }
              if (!v239)
              {
                objc_msgSend(v44, "objectForKey:", CFSTR("shortTitlesDataSource"));
                v120 = (NSString *)objc_claimAutoreleasedReturnValue();
                v121 = v120;
                if (v120)
                {
                  NSSelectorFromString(v120);
                  SFPerformSelector();
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v239 = 0;
                }

              }
              if (v69 == 2)
              {
                objc_msgSend(v44, "objectForKey:", CFSTR("staticTextMessage"));
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                if (v122)
                {
                  if (v66)
                  {
                    objc_msgSend(v66, "localizedStringForKey:value:table:", v122, &stru_1E4A69238, v58);
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "setObject:forKey:", v123, CFSTR("staticTextMessage"));

                  }
                  else
                  {
                    objc_msgSend(v44, "setObject:forKey:", v122, CFSTR("staticTextMessage"));
                  }
                }

              }
LABEL_174:
              if (v69 == 5)
              {
                objc_msgSend(v44, "objectForKey:", CFSTR("rightImage"));
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "objectForKey:", CFSTR("leftImage"));
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                if (v124)
                {
                  +[PSLazyImagePromise imagePromiseWithImageNamed:inBundle:](PSLazyImagePromise, "imagePromiseWithImageNamed:inBundle:", v124, v228);
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "setObject:forKeyedSubscript:", v126, CFSTR("rightImagePromise"));
                  objc_msgSend(v44, "removeObjectForKey:", CFSTR("rightImage"));

                }
                if (v125)
                {
                  +[PSLazyImagePromise imagePromiseWithImageNamed:inBundle:](PSLazyImagePromise, "imagePromiseWithImageNamed:inBundle:", v125, v228);
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "setObject:forKeyedSubscript:", v127, CFSTR("leftImagePromise"));
                  objc_msgSend(v44, "removeObjectForKey:", CFSTR("leftImage"));

                }
              }
LABEL_180:
              v93 = 0;
              v226 = 0;
            }
            else
            {
LABEL_117:
              if ((v69 & 0xFFFFFFFFFFFFFFFBLL) != 8)
              {
                v241 = 0;
                v239 = 0;
                v246 = 0;
                goto LABEL_174;
              }
              v244 = (void *)objc_opt_class();
              objc_msgSend(v44, "objectForKey:", CFSTR("placeholder"));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v97)
              {
                v246 = 0;
                v239 = 0;
                v241 = 0;
                goto LABEL_180;
              }
              v98 = v97;
              if (v66)
              {
                objc_msgSend(v66, "localizedStringForKey:value:table:", v97, &stru_1E4A69238, v58);
                v99 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v99 = v97;
              }

              v226 = v99;
              objc_msgSend(v44, "setObject:forKey:", v99, CFSTR("placeholder"));
              v246 = 0;
              v239 = 0;
              v241 = 0;
              v93 = 0;
            }
            v94 = 0;
            goto LABEL_182;
          }
        }
        else
        {
          if (v69 == 2)
            goto LABEL_101;
          if (v69 != 6)
            goto LABEL_117;
        }
        objc_msgSend(v44, "objectForKey:", CFSTR("confirmation"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v91;
        v93 = v91 != 0;
        if (v91)
        {
          v94 = (void *)objc_msgSend(v91, "mutableCopy");
          objc_msgSend(v94, "objectForKey:", CFSTR("cancelTitle"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          if (v95)
          {
            if (v66)
            {
              objc_msgSend(v66, "localizedStringForKey:value:table:", v95, &stru_1E4A69238, v58);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "setObject:forKey:", v96, CFSTR("cancelTitle"));

            }
            else
            {
              objc_msgSend(v94, "setObject:forKey:", v95, CFSTR("cancelTitle"));
            }
          }
          objc_msgSend(v94, "objectForKey:", CFSTR("okTitle"));
          v112 = (void *)objc_claimAutoreleasedReturnValue();

          if (v112)
          {
            if (v66)
            {
              objc_msgSend(v66, "localizedStringForKey:value:table:", v112, &stru_1E4A69238, v58);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "setObject:forKey:", v113, CFSTR("okTitle"));

            }
            else
            {
              objc_msgSend(v94, "setObject:forKey:", v112, CFSTR("okTitle"));
            }
          }
          objc_msgSend(v94, "objectForKey:", CFSTR("prompt"));
          v114 = (void *)objc_claimAutoreleasedReturnValue();

          if (v114)
          {
            if (v66)
            {
              objc_msgSend(v66, "localizedStringForKey:value:table:", v114, &stru_1E4A69238, v58);
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "setObject:forKey:", v115, CFSTR("prompt"));

            }
            else
            {
              objc_msgSend(v94, "setObject:forKey:", v114, CFSTR("prompt"));
            }
          }
          objc_msgSend(v94, "objectForKey:", CFSTR("title"));
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          if (v116)
          {
            if (v66)
            {
              objc_msgSend(v66, "localizedStringForKey:value:table:", v116, &stru_1E4A69238, v58);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "setObject:forKey:", v117, CFSTR("title"));

            }
            else
            {
              objc_msgSend(v94, "setObject:forKey:", v116, CFSTR("title"));
            }
          }
          objc_msgSend(v44, "setObject:forKey:", v94, CFSTR("confirmation"));
          v244 = (void *)objc_opt_class();

        }
        else
        {
          v94 = 0;
        }

        v246 = 0;
        v239 = 0;
        v241 = 0;
        v226 = 0;
LABEL_182:
        objc_msgSend(v44, "objectForKey:", CFSTR("detail"));
        v128 = (NSString *)objc_claimAutoreleasedReturnValue();
        v218 = v128;
        if (v128)
        {
          v129 = (uint64_t)NSClassFromString(v128);
LABEL_186:
          v235 = v129;
          goto LABEL_187;
        }
        if ((unint64_t)(v69 - 1) <= 1)
        {
          v129 = objc_opt_class();
          goto LABEL_186;
        }
        v235 = 0;
LABEL_187:
        objc_msgSend(v44, "objectForKey:", CFSTR("get"));
        aSelectorName = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKey:", CFSTR("set"));
        v130 = (NSString *)objc_claimAutoreleasedReturnValue();
        v131 = v130;
        v132 = sel_setPreferenceValue_specifier_;
        if (v130)
          v132 = NSSelectorFromString(v130);
        v217 = v131;
        v230 = v94;
        v133 = sel_readPreferenceValue_;
        if (aSelectorName)
          v133 = NSSelectorFromString(aSelectorName);
        objc_msgSend(v44, "objectForKey:", CFSTR("pane"));
        v134 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v244, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v238, v212, v132, v133, v235, v69, NSClassFromString(v134));
        v243 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        if (v241 && v246)
        {
          objc_msgSend(v243, "setValues:titles:shortTitles:", v241, v246, v239);
LABEL_198:
          v18 = v247;
          goto LABEL_199;
        }
        v135 = !v93;
        if (!v230)
          v135 = 1;
        if ((v135 & 1) == 0)
        {
          objc_msgSend(v243, "setupWithDictionary:");
          goto LABEL_198;
        }
        v18 = v247;
        if ((v69 & 0xFFFFFFFFFFFFFFFBLL) == 8)
        {
          if (v226)
            objc_msgSend(v243, "setPlaceholder:");
          objc_msgSend(v44, "objectForKey:", CFSTR("bestGuess"));
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = (SEL)objc_msgSend(v139, "length");
          if (v140)
            v140 = NSSelectorFromString((NSString *)v139);
          v243[26] = v140;

        }
LABEL_199:
        objc_msgSend(v44, "objectForKey:", CFSTR("cellClass"));
        v136 = (NSString *)objc_claimAutoreleasedReturnValue();
        v137 = v136;
        if (v136)
        {
          v138 = NSClassFromString(v136);
          if (v138)
            objc_msgSend(v44, "setObject:forKey:", v138, CFSTR("cellClass"));
          else
            objc_msgSend(v44, "removeObjectForKey:", CFSTR("cellClass"));
        }
        v216 = v137;
        v141 = v44;
        v142 = v228;
        v143 = v58;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("keywords"));
        v145 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v245 = v141;
        v229 = (void *)v145;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("keywords"));
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "addObjectsFromArray:", v146);
          v147 = v243;
        }
        else
        {
          objc_opt_class();
          v147 = v243;
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_214;
          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("keywords"));
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v146, "componentsSeparatedByString:", CFSTR(","));
          v148 = v144;
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "addObjectsFromArray:", v149);

          v144 = v148;
        }

LABEL_214:
        v150 = v245;
        objc_msgSend(v245, "objectForKeyedSubscript:", CFSTR("validTitles"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "addObjectsFromArray:", v151);

        if (objc_msgSend(v144, "count"))
        {
          v215 = v44;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v144, "count"));
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          v264 = 0u;
          v265 = 0u;
          v266 = 0u;
          v267 = 0u;
          v211 = v144;
          v153 = v144;
          v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v264, v272, 16);
          if (v154)
          {
            v155 = v154;
            v156 = *(_QWORD *)v265;
            do
            {
              for (n = 0; n != v155; ++n)
              {
                if (*(_QWORD *)v265 != v156)
                  objc_enumerationMutation(v153);
                v158 = *(_QWORD *)(*((_QWORD *)&v264 + 1) + 8 * n);
                if (v18)
                {
                  objc_msgSend(v142, "localizedStringForKey:value:table:", v158, &stru_1E4A69238, v143);
                  v159 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v152, "addObject:", v159);

                  v18 = v247;
                }
                else
                {
                  objc_msgSend(v152, "addObject:", v158);
                }
              }
              v155 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v264, v272, 16);
            }
            while (v155);
          }

          v150 = v245;
          objc_msgSend(v245, "setObject:forKeyedSubscript:", v152, CFSTR("keywords"));

          v44 = v215;
          v147 = v243;
          v144 = v211;
        }

        objc_msgSend(v147, "setProperties:", v150);
        v160 = v235;
        if (v235 || v213 <= 8 && ((1 << v213) & 0x106) != 0)
        {
          objc_msgSend(v150, "objectForKey:", CFSTR("isIP"));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = objc_msgSend(v161, "BOOLValue");

          if ((v162 & 1) != 0)
          {
            v160 = 3;
          }
          else
          {
            objc_msgSend(v150, "objectForKey:", CFSTR("isURL"));
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            v164 = objc_msgSend(v163, "BOOLValue");

            if ((v164 & 1) != 0)
            {
              v160 = 1;
            }
            else
            {
              objc_msgSend(v150, "objectForKey:", CFSTR("isNumeric"));
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              v166 = objc_msgSend(v165, "BOOLValue");

              if ((v166 & 1) != 0)
              {
                v160 = 2;
              }
              else
              {
                objc_msgSend(v150, "objectForKey:", CFSTR("isEmail"));
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v168 = objc_msgSend(v167, "BOOLValue");

                if ((v168 & 1) != 0)
                {
                  v160 = 4;
                }
                else
                {
                  objc_msgSend(v150, "objectForKey:", CFSTR("isEmailAddressing"));
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  v170 = objc_msgSend(v169, "BOOLValue");

                  if ((v170 & 1) != 0)
                  {
                    v160 = 5;
                  }
                  else
                  {
                    objc_msgSend(v150, "objectForKey:", CFSTR("isDecimalPad"));
                    v171 = (void *)objc_claimAutoreleasedReturnValue();
                    v172 = objc_msgSend(v171, "BOOLValue");

                    v160 = 6;
                    if (!v172)
                      v160 = 0;
                  }
                }
              }
            }
          }
        }
        v147[12] = v160;
        objc_msgSend(v245, "objectForKey:", CFSTR("autoCaps"));
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        v147[10] = +[PSSpecifier autoCapsTypeForString:](PSSpecifier, "autoCapsTypeForString:", v173);

        objc_msgSend(v245, "objectForKey:", CFSTR("autoCorrection"));
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        v147[11] = +[PSSpecifier autoCorrectionTypeForNumber:](PSSpecifier, "autoCorrectionTypeForNumber:", v174);

        objc_msgSend(v245, "objectForKey:", CFSTR("keyboard"));
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v147[9] = +[PSSpecifier keyboardTypeForString:](PSSpecifier, "keyboardTypeForString:", v175);

        if (CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
          goto LABEL_261;
        objc_msgSend(v245, "objectForKey:", CFSTR("action"));
        v176 = (NSString *)objc_claimAutoreleasedReturnValue();
        v236 = v176;
        if (v176)
          v177 = NSSelectorFromString(v176);
        else
          v177 = 0;
        objc_msgSend(v147, "setLegacyAction:", v177);
        objc_msgSend(v245, "objectForKey:", CFSTR("cancel"));
        v178 = (NSString *)objc_claimAutoreleasedReturnValue();
        v179 = v178;
        if (v178)
          v180 = NSSelectorFromString(v178);
        else
          v180 = 0;
        objc_msgSend(v147, "setLegacyCancel:", v180);
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v181, "sf_isInternalInstall"))
          goto LABEL_259;
        v182 = objc_msgSend(v147, "legacyAction");

        if (v182)
        {
          v183 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(CFSTR("/AppleInternal/Library/PreferenceBundles/"), "stringByAppendingPathComponent:", CFSTR("Internal Settings"));
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "stringByAppendingPathExtension:", CFSTR("bundle"));
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "bundleWithPath:", v185);
          v181 = (void *)objc_claimAutoreleasedReturnValue();

          if (v181)
          {
            objc_msgSend(v181, "localizedStringForKey:value:table:", CFSTR("SPECIFIER_ACTION_DESCRIPTION"), &stru_1E4A69238, CFSTR("SpecifierActions"));
            v186 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v206 = v186;
          }
          else
          {
            v186 = CFSTR("SPECIFIER_ACTION_DESCRIPTION");
          }
          NSStringFromSelector((SEL)objc_msgSend(v243, "legacyAction"));
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector((SEL)objc_msgSend(v243, "legacyCancel"));
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(&v186->isa, v243, v187, v188);

          if (v181)
          v18 = v247;
          v147 = v243;
LABEL_259:

          goto LABEL_260;
        }
        v18 = v247;
LABEL_260:

LABEL_261:
        objc_msgSend(v245, "objectForKey:", CFSTR("confirmationAction"));
        v189 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (v189)
        {
          v190 = v189;
          v191 = NSSelectorFromString(v189);
        }
        else
        {
          v190 = 0;
          v191 = 0;
        }
        objc_msgSend(v147, "setConfirmationAction:", v191);
        objc_msgSend(v245, "objectForKey:", CFSTR("cancel"));
        v192 = (NSString *)objc_claimAutoreleasedReturnValue();
        v193 = v192;
        if (v192)
          v194 = NSSelectorFromString(v192);
        else
          v194 = 0;
        objc_msgSend(v147, "setConfirmationCancelAction:", v194);
        objc_msgSend(v245, "objectForKey:", CFSTR("loadAction"));
        v195 = (NSString *)objc_claimAutoreleasedReturnValue();
        v196 = v195;
        if (v195)
          v197 = NSSelectorFromString(v195);
        else
          v197 = 0;
        objc_msgSend(v243, "setControllerLoadAction:", v197);
        objc_msgSend(v245, "objectForKey:", CFSTR("buttonAction"));
        v198 = (NSString *)objc_claimAutoreleasedReturnValue();
        v199 = v198;
        if (v198)
          v200 = NSSelectorFromString(v198);
        else
          v200 = 0;
        objc_msgSend(v243, "setButtonAction:", v200);
        objc_msgSend(v243, "setupIconImageWithBundle:", v142);
        objc_msgSend(v223, "addObject:", v243);

        v57 = v240;
LABEL_274:

        v24 = v57 + 1;
      }
      while (v24 != v225);
      v201 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v271, 16);
      v225 = v201;
    }
    while (v201);
  }

  v202 = v223;
  return v202;
}

double ScreenScale()
{
  double result;
  void *v1;
  uint64_t v2;

  result = *(double *)&_screenScale;
  if (*(double *)&_screenScale == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", *(double *)&_screenScale);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "scale");
    _screenScale = v2;

    return *(double *)&_screenScale;
  }
  return result;
}

uint64_t ProcessedSpecifierBundle(void *a1, void *a2, void *a3, void **a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  objc_class *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  void **v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v71;
  int v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  _BOOL4 v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  id v86;
  void *v87;
  void *v88;
  int v89;
  id v90;
  id v91;
  void **v92;
  void **v93;
  os_signpost_id_t spid;
  void *v95;
  unint64_t v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  uint8_t v107[128];
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("bundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v23 = 0;
    goto LABEL_54;
  }
  PKLogForCategory(6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, "PSSpecifierLoading.ProcessedSpecifierBundle");

  PKLogForCategory(6);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v96 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 138543618;
    v109 = v13;
    v110 = 2114;
    v111 = (id)objc_opt_class();
    v18 = v111;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PSSpecifierLoading.ProcessedSpecifierBundle", "%{public}@ loaded from controller %{public}@", buf, 0x16u);

  }
  objc_msgSend(v9, "objectForKey:", CFSTR("internal"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  spid = v15;
  if (v20)
  {
    v21 = CFSTR("/AppleInternal/Library/PreferenceBundles/");
LABEL_7:
    -[__CFString stringByAppendingPathComponent:](v21, "stringByAppendingPathComponent:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathExtension:", CFSTR("bundle"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("developer"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v25)
  {
    SFDeveloperSettingsBundlesDirectoryPath();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByAppendingPathExtension:", CFSTR("bundle"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("nanoBundlePath"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "BOOLValue");

  if (v47)
  {
    v21 = CFSTR("/System/Library/NanoPreferenceBundles/General/");
    goto LABEL_7;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("nanoInternalBundlePath"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "BOOLValue");

  if (v72)
  {
    v21 = CFSTR("/AppleInternal/Library/NanoPreferenceBundles/General/");
    goto LABEL_7;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("nanoAppsBundlePath"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "BOOLValue");

  if (v79)
  {
    v21 = CFSTR("/System/Library/NanoPreferenceBundles/Applications/");
    goto LABEL_7;
  }
  PSBundlePathForPreferenceBundle((uint64_t)v13);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  objc_msgSend(v9, "objectForKey:", CFSTR("isController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLValue");

  if ((v28 & 1) == 0)
  {
    v95 = v12;
    v32 = (void *)MEMORY[0x1E0CB34D0];
    SFRuntimeAbsoluteFilePathForPath();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bundleWithPath:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (objc_class *)objc_msgSend(v34, "principalClass");
    if (!v35 || !-[objc_class isSubclassOfClass:](v35, "isSubclassOfClass:", objc_opt_class()))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(v35);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("incorrect plugin class (expected: %@, actual: %@) from %@"), v44, v45, v97);

LABEL_31:
      goto LABEL_32;
    }
    v91 = v11;
    v92 = a4;
    if (a4)
    {
      v36 = *a4;
      if (*a4)
      {
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        v37 = v36;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v103;
          v90 = v10;
LABEL_23:
          v41 = 0;
          while (1)
          {
            if (*(_QWORD *)v103 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v41);
            if ((objc_msgSend(v42, "isMemberOfClass:", v35) & 1) != 0)
              break;
            if (v39 == ++v41)
            {
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v102, v107, 16);
              v10 = v90;
              if (v39)
                goto LABEL_23;
              goto LABEL_29;
            }
          }
          v44 = v42;

          v10 = v90;
          v11 = v91;
          a4 = v92;
          if (!v44)
            goto LABEL_63;
          v89 = 0;
          goto LABEL_65;
        }
LABEL_29:

        v11 = v91;
        a4 = v92;
      }
    }
LABEL_63:
    v44 = (id)objc_msgSend([v35 alloc], "initWithParentListController:properties:", v10, v9);
    v80 = v44 != 0;
    if (!v44)
    {
LABEL_73:
      if (a4 && v80)
      {
        v86 = *a4;
        v11 = v91;
        if (!*a4)
        {
          v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          *a4 = v86;
        }
        objc_msgSend(v86, "addObject:", v44);
      }
      else
      {
        v11 = v91;
      }
      goto LABEL_31;
    }
    v89 = 1;
    v90 = v10;
LABEL_65:
    objc_msgSend(v44, "specifiersWithSpecifier:", v11);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v99;
      do
      {
        for (i = 0; i != v83; ++i)
        {
          if (*(_QWORD *)v99 != v84)
            objc_enumerationMutation(v81);
          objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i), "setProperty:forKey:", v13, CFSTR("searchBundle"));
        }
        v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v98, v106, 16);
      }
      while (v83);
    }
    objc_msgSend(v95, "addObjectsFromArray:", v81);

    v10 = v90;
    a4 = v92;
    v80 = v89;
    goto LABEL_73;
  }
  SFRuntimeAbsoluteFilePathForPath();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v29, CFSTR("lazy-bundle"));

  objc_msgSend(v9, "objectForKey:", CFSTR("loadAction"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    if (!CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0))
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("action"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("loadAction"));
    }
  }
  else
  {
    objc_msgSend(v9, "setObject:forKey:", CFSTR("lazyLoadBundle:"), CFSTR("loadAction"));
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("hasIcon"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "BOOLValue");

  if (!v49)
    goto LABEL_40;
  v95 = v12;
  v50 = (void *)MEMORY[0x1E0CB34D0];
  SFRuntimeAbsoluteFilePathForPath();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bundleWithPath:", v51);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("hasBundleIcon"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "BOOLValue");

    if (v53)
    {
      v54 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "traitCollection");
      v56 = v10;
      v57 = a4;
      v58 = v11;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("icon.png"), v34, v59);
      v44 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v58;
      a4 = v57;
      v10 = v56;

      objc_msgSend(v9, "setObject:forKey:", v44, CFSTR("iconImage"));
    }
    else
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("icon"));
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "stringByAppendingPathComponent:", CFSTR("icon.png"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v87 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v93 = a4;
        v74 = v11;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "traitCollection");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "imageNamed:inBundle:compatibleWithTraitCollection:", v44, v34, v76);
        v88 = v73;
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v74;
        a4 = v93;
        objc_msgSend(v9, "setObject:forKey:", v77, CFSTR("iconImage"));
        objc_msgSend(v9, "setObject:forKey:", v88, CFSTR("icon2"));

        v73 = v88;
      }
      else
      {
        objc_msgSend(v9, "setObject:forKey:", v73, CFSTR("icon"));
      }

    }
    goto LABEL_31;
  }
LABEL_32:

  v12 = v95;
LABEL_40:
  if (a4)
    v60 = *a4;
  else
    v60 = 0;
  v23 = v28 ^ 1u;
  v61 = v60;
  v62 = objc_msgSend(v61, "count");
  PKLogForCategory(6);
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v62 == 1)
  {
    if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v109 = v66;
      v67 = v11;
      v68 = v66;
      _os_signpost_emit_with_name_impl(&dword_1A3819000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PSSpecifierLoading.ProcessedSpecifierBundle", "Bundle Controller: %{public}@", buf, 0xCu);

      v11 = v67;
    }
  }
  else if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    if (objc_msgSend(v61, "count"))
      v69 = v61;
    else
      v69 = 0;
    *(_DWORD *)buf = 138543362;
    v109 = v69;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PSSpecifierLoading.ProcessedSpecifierBundle", "Bundle Controllers: %{public}@", buf, 0xCu);
  }

LABEL_54:
  return v23;
}

id PKLogForCategory(uint64_t a1)
{
  if (PKLogForCategory_loggingToken != -1)
    dispatch_once(&PKLogForCategory_loggingToken, &__block_literal_global_3);
  return (id)PKLogForCategory_logObjects[a1];
}

void *__getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SetupAssistantLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary_0;
  }
  else
  {
    SetupAssistantLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary_0;
    if (!SetupAssistantLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BYSetupAssistantBundleIdentifier");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantBundleIdentifierSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL ShouldIndexSpecifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unint64_t v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (objc_msgSend(v1, "name"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4 <= 0x3C))
  {
    objc_msgSend(v1, "propertyForKey:", CFSTR("searchable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v5 = (!v6 || objc_msgSend(v6, "BOOLValue")) && !PSIsSpecifierHiddenDueToRestrictions(v1);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _copyIconForPathFromSpecifier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v8 = (void *)objc_msgSend(v7, "initWithCapacity:", gScale);
    if (objc_msgSend(v6, "rangeOfString:", CFSTR(".png")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".png"));
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    objc_msgSend(v8, "addObject:", v6);
    if (gScale >= 2)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(".png"), CFSTR("@2x.png"), 13, objc_msgSend(v6, "length") - objc_msgSend(CFSTR(".png"), "length"), objc_msgSend(CFSTR(".png"), "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

      if (gScale >= 3)
      {
        objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(".png"), CFSTR("@3x.png"), 13, objc_msgSend(v6, "length") - objc_msgSend(CFSTR(".png"), "length"), objc_msgSend(CFSTR(".png"), "length"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v11);

      }
    }
    if ((unint64_t)objc_msgSend(v5, "length") < 2)
    {
      v13 = v4;
    }
    else
    {
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("~/")))
        objc_msgSend(v5, "stringByExpandingTildeInPath");
      else
        SFRuntimeAbsoluteFilePathForPath();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByResolvingSymlinksInPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v5 = v14;
    }

    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    v25 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___copyIconForPathFromSpecifier_block_invoke;
    v17[3] = &unk_1E4A66158;
    v15 = v13;
    v18 = v15;
    v19 = &v20;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v17);
    v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void sub_1A3821AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PSIsSpecifierHiddenDueToRestrictions(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "propertyForKey:", CFSTR("restrictByID"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (PSIsBundleIDHiddenDueToRestrictions(v2))
  {
    _PSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v1, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v4;
      v11 = 2114;
      v12 = v2;
      _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "Specifier %{public}@ is hidden because identifier is restricted: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    v5 = 1;
  }
  else
  {
    objc_msgSend(v1, "propertyForKey:", CFSTR("restrictByMCFeature"));
    v3 = objc_claimAutoreleasedReturnValue();
    v5 = _PSIsValueRestrictedByMCFeature(v3);
    if (v5)
    {
      _PSLoggingFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v1, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v7;
        v11 = 2114;
        v12 = v3;
        _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Specifier %{public}@ is hidden because feature is restricted: %{public}@", (uint8_t *)&v9, 0x16u);

      }
    }
  }

  return v5;
}

BOOL _PSIsValueRestrictedByMCFeature(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", v1) == 2;

  }
  else
  {
    objc_opt_class();
    v3 = (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v1, "indexOfObjectPassingTest:", &__block_literal_global_208) != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v3;
}

BOOL PSIsBundleIDHiddenDueToRestrictions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "effectiveWhitelistedAppBundleIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 && !objc_msgSend(v3, "containsObject:", v1))
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "effectiveBlacklistedAppBundleIDs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 1;
      if ((objc_msgSend(v5, "containsObject:", v1) & 1) == 0)
      {
        if (!objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.podcasts"))
          || (objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"),
              v6 = (void *)objc_claimAutoreleasedReturnValue(),
              v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47110]),
              v6,
              v7 != 2))
        {
          v8 = 0;
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

id SearchSpecifiersFromPlistWithCapabilities(void *a1, void *a2, void *a3, void *a4, char a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  __SpecifiersFromPlist(a1, a2, 0, a3, a4, 0, 0, 0, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "propertyForKey:", CFSTR("searchLabel"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v10, "setName:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v5;
}

void sub_1A3822400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void PSGreenTeaAppListLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  if (PSGreenTeaLoggerForAppListing_onceToken != -1)
    dispatch_once(&PSGreenTeaLoggerForAppListing_onceToken, &__block_literal_global_12);
  if (PSGreenTeaLoggerForAppListing_appListLogger)
  {
    getCTGreenTeaOsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v9, &a9);
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@", buf, 0x16u);

    }
  }

}

void sub_1A3822C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void ___copyIconForPathFromSpecifier_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithContentsOfFile:", v7);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      *a4 = 1;
      _PSLoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v17 = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v14;
        v15 = " Found  %@ in bundle %@";
LABEL_7:
        _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 0x16u);
      }
    }
    else
    {
      _PSLoggingFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = 138412546;
        v18 = v6;
        v19 = 2112;
        v20 = v16;
        v15 = "Missing %@ in bundle %@";
        goto LABEL_7;
      }
    }

  }
}

id PSBundlePathForPreferenceBundle(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(CFSTR("/System/Library/PreferenceBundles/"), "stringByAppendingPathComponent:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathExtension:", CFSTR("bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1A3823CB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3824070(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3825358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PSBlankIconImage()
{
  if (PSBlankIconImage_onceToken != -1)
    dispatch_once(&PSBlankIconImage_onceToken, &__block_literal_global_122);
  return (id)PSBlankIconImage_result;
}

void sub_1A3826D18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _PSLoggingFacility()
{
  if (_PSLoggingFacility_onceToken != -1)
    dispatch_once(&_PSLoggingFacility_onceToken, &__block_literal_global_14);
  return (id)_PSLoggingFacility_oslog;
}

void sub_1A3827CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSShouldInsetListView(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  double Width;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  _BOOL4 v10;
  int v11;
  CGRect v14;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
    goto LABEL_2;
  if (!_os_feature_enabled_impl())
    goto LABEL_15;
  objc_msgSend(v1, "frame");
  Width = CGRectGetWidth(v14);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CEB400], *MEMORY[0x1E0CEB3F8], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  v9 = objc_msgSend(v3, "horizontalSizeClass");
  if (Width <= 320.0 && (v8 & 1) != 0)
    goto LABEL_15;
  v10 = Width <= 320.0;
  if (Width <= 320.0)
    v11 = 1;
  else
    v11 = v8;
  if (v9 != 2)
    v10 = 1;
  if ((v10 | v8 ^ 1) != 1 || v11 == 0)
LABEL_2:
    v4 = 1;
  else
LABEL_15:
    v4 = 0;

  return v4;
}

void sub_1A3828600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSIsRunningInAssistant()
{
  if (PSIsRunningInAssistant_onceToken != -1)
    dispatch_once(&PSIsRunningInAssistant_onceToken, &__block_literal_global_138);
  return PSIsRunningInAssistant_isRunningInAssistant;
}

void sub_1A3828E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A3829264(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3829F78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PSSupportsMesa()
{
  return MGGetBoolAnswer();
}

id PSPreferencesUIFrameworkBundle()
{
  if (PSPreferencesUIFrameworkBundle_onceToken != -1)
    dispatch_once(&PSPreferencesUIFrameworkBundle_onceToken, &__block_literal_global_56_0);
  return (id)PSPreferencesUIFrameworkBundle_preferencesUI;
}

id PSLocalizablePearlStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E4A69238, CFSTR("Pearl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSPreferencesFrameworkBundle()
{
  if (PSPreferencesFrameworkBundle_onceToken != -1)
    dispatch_once(&PSPreferencesFrameworkBundle_onceToken, &__block_literal_global_15);
  return (id)PSPreferencesFrameworkBundle_preferences;
}

void sub_1A382BB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t PSIsInEDUMode()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getUMUserManagerClass_softClass;
  v9 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getUMUserManagerClass_block_invoke;
    v5[3] = &unk_1E4A65650;
    v5[4] = &v6;
    __getUMUserManagerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  return v3;
}

void sub_1A382C1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SystemHasCapabilities(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[PSCapabilityManager sharedManager](PSCapabilityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCapabilities:", v1);

  return v3;
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UserManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UMUserManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUMUserManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A382C874(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PSIsPearlAvailable()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v7;

  v0 = (void *)MEMORY[0x1E0D027E8];
  objc_msgSend(MEMORY[0x1E0D027F8], "deviceDescriptorForType:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v0, "deviceWithDescriptor:error:", v1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;

  if (v2)
    v4 = v3 == 0;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

void sub_1A382D2F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A382DD08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A382DFD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PSSupportedOrientations()
{
  void *v0;
  char v1;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "sf_isiPad");

  if ((v1 & 1) != 0)
    return 30;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixedCoordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13.origin.x = v6;
  v13.origin.y = v8;
  v13.size.width = v10;
  v13.size.height = v12;
  CGRectGetHeight(v13);
  if (_UIUserInterfaceSizeClassForWidth() == 2)
    return 26;
  else
    return 2;
}

uint64_t __ensureDefaultAppearanceProviderAndNavigationRegistration_block_invoke()
{
  uint64_t result;

  defaultAppearanceProviderClass = objc_opt_class();
  result = objc_opt_class();
  defaultNavigationCoordinatorClass = result;
  return result;
}

id SpecifiersFromPlist(void *a1, void *a2, void *a3, void *a4, void *a5, id *a6, void **a7, void *a8, void **a9)
{
  return SpecifiersFromPlistWithCapabilities(a1, a2, a3, a4, a5, a6, a7, a8, a9, 1);
}

id SpecifiersFromPlistWithCapabilities(void *a1, void *a2, void *a3, void *a4, void *a5, id *a6, void **a7, void *a8, void **a9, char a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  v17 = a1;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a8;
  if (a9 && !*a9)
    *a9 = (id)objc_opt_new();
  __SpecifiersFromPlist(v17, v18, v19, v20, v21, a6, a7, v22, a9, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void sub_1A3832B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke();
  _Unwind_Resume(a1);
}

void sub_1A3832EC0(_Unwind_Exception *a1)
{
  __27__PSAccountEnumerator_init__block_invoke();
  _Unwind_Resume(a1);
}

void sub_1A3833098(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A3833270(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getAXCapabilityManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXCapabilityManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAXCapabilityManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getAXCapabilityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PSIsTelephonyDead()
{
  uint64_t result;
  const void *v1;

  result = _CTServerConnectionCreate();
  if (result)
  {
    v1 = (const void *)result;
    _CTServerConnectionGetRadioModuleIsDead();
    CFRelease(v1);
    return 0;
  }
  return result;
}

uint64_t PSIsNanoMirroringDomain(void *a1)
{
  id v1;
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v2 = (void *)getNPSDomainAccessorClass_softClass_0;
  v13 = getNPSDomainAccessorClass_softClass_0;
  if (!getNPSDomainAccessorClass_softClass_0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getNPSDomainAccessorClass_block_invoke_0;
    v9[3] = &unk_1E4A65650;
    v9[4] = &v10;
    __getNPSDomainAccessorClass_block_invoke_0((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v10, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithDomain:", CFSTR("com.apple.bulletinboard.apps"));
  objc_msgSend(v4, "objectForKey:", v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinShowsCustomSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue") ^ 1;

  return v7;
}

void sub_1A383408C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  NanoPreferencesSyncLibrary();
  result = objc_getClass("NPSDomainAccessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNPSDomainAccessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getNPSDomainAccessorClass_block_invoke_cold_1();
    return (Class)__getNPSDomainAccessorClass_block_invoke_0(v3);
  }
  return result;
}

Class __getNPSDomainAccessorClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary_0)
  {
    NanoPreferencesSyncLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!NanoPreferencesSyncLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NPSDomainAccessor");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNPSDomainAccessorClass_block_invoke_cold_1();
    free(v3);
  }
  getNPSDomainAccessorClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PSSimIsRequired()
{
  uint64_t v0;
  const void *v1;
  unint64_t IsUserIdentityModuleRequired;

  if (MGGetBoolAnswer())
  {
    v0 = _CTServerConnectionCreate();
    if (v0)
    {
      v1 = (const void *)v0;
      IsUserIdentityModuleRequired = _CTServerConnectionIsUserIdentityModuleRequired();
      if (HIDWORD(IsUserIdentityModuleRequired))
        NSLog(CFSTR("CTError domain %i code %i"), IsUserIdentityModuleRequired, HIDWORD(IsUserIdentityModuleRequired));
      CFRelease(v1);
    }
  }
  return 1;
}

void PSSetCustomWatchCapabilityCheck(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "copy");
  v2 = (void *)_CustomCapabilityCheck;
  _CustomCapabilityCheck = v1;

}

id getPKPassLibraryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPKPassLibraryClass_softClass;
  v7 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPKPassLibraryClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getPKPassLibraryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3834DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKPassLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPKPassLibraryClass_block_invoke_cold_1();
    free(v3);
  }
  getPKPassLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBBSettingsGatewayClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!BulletinBoardLibraryCore_frameworkLibrary)
  {
    BulletinBoardLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!BulletinBoardLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BBSettingsGateway");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBBSettingsGatewayClass_block_invoke_cold_1();
    free(v3);
  }
  getBBSettingsGatewayClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL PSHasStockholmPass()
{
  id PKPassLibraryClass;
  id v1;
  void *v2;
  _BOOL8 v3;

  PKPassLibraryClass = getPKPassLibraryClass();
  if (!objc_msgSend(PKPassLibraryClass, "isPassLibraryAvailable"))
    return 0;
  v1 = objc_alloc_init((Class)PKPassLibraryClass);
  objc_msgSend(v1, "passesOfType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

void sub_1A3835778(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t PSPNCreateFormattedStringWithCountry(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getPNCreateFormattedStringWithCountrySymbolLoc_ptr;
  v11 = getPNCreateFormattedStringWithCountrySymbolLoc_ptr;
  if (!getPNCreateFormattedStringWithCountrySymbolLoc_ptr)
  {
    v5 = (void *)PhoneNumbersLibrary();
    v4 = dlsym(v5, "PNCreateFormattedStringWithCountry");
    v9[3] = (uint64_t)v4;
    getPNCreateFormattedStringWithCountrySymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v7 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))v4)(a1, a2, 2, 0);
}

void sub_1A38383A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

id getkSecureBackupCountryCodeKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupCountryCodeKeySymbolLoc_ptr;
  v7 = getkSecureBackupCountryCodeKeySymbolLoc_ptr;
  if (!getkSecureBackupCountryCodeKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary();
    v0 = (id *)dlsym(v1, "kSecureBackupCountryCodeKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupCountryCodeKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t PhoneNumbersLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhoneNumbersLibraryCore_frameworkLibrary)
    PhoneNumbersLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhoneNumbersLibraryCore_frameworkLibrary;
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t CloudServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CloudServicesLibraryCore_frameworkLibrary)
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CloudServicesLibraryCore_frameworkLibrary;
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t PhoneNumbersLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!PhoneNumbersLibraryCore_frameworkLibrary_0)
    PhoneNumbersLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = PhoneNumbersLibraryCore_frameworkLibrary_0;
  if (!PhoneNumbersLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t TopToBottomLeftToRightViewCompare(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "convertRect:fromView:", v4);
  if (v6 < v7)
  {
LABEL_5:
    v11 = -1;
    goto LABEL_6;
  }
  objc_msgSend(v3, "frame");
  v9 = v8;
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "convertRect:fromView:", v4);
  if (v9 <= v10)
  {
    objc_msgSend(v3, "frame");
    v13 = v12;
    objc_msgSend(v4, "frame");
    objc_msgSend(v3, "convertRect:fromView:", v4);
    if (v13 >= v14)
    {
      objc_msgSend(v3, "frame");
      v17 = v16;
      objc_msgSend(v4, "frame");
      objc_msgSend(v3, "convertRect:fromView:", v4);
      v11 = v17 > v18;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v11 = 1;
LABEL_6:

  return v11;
}

void sub_1A383A5FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A383E2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A383F2D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A383F520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SetupAssistantUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BFFStyle");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBFFStyleClass_block_invoke_cold_1();
    free(v3);
  }
  getBFFStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A3845F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3846118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  _Block_object_dispose((const void *)(v6 - 96), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1A3846230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3846470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A384675C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3846F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAnalyticsWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  if (!SymptomAnalyticsLibrary_frameworkLibrary)
    SymptomAnalyticsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomAnalytics.framework/SymptomAnalytics", 2);
  result = objc_getClass("AnalyticsWorkspace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAnalyticsWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAnalyticsWorkspaceClass_block_invoke_cold_1();
    return __getProcessAnalyticsClass_block_invoke(v3);
  }
  return result;
}

Class __getProcessAnalyticsClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  if (!SymptomAnalyticsLibrary_frameworkLibrary)
    SymptomAnalyticsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomAnalytics.framework/SymptomAnalytics", 2);
  result = objc_getClass("ProcessAnalytics");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getProcessAnalyticsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getProcessAnalyticsClass_block_invoke_cold_1();
    return (Class)__getPRSettingsProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getPRSettingsProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ProximityReaderLibraryCore_frameworkLibrary)
  {
    ProximityReaderLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ProximityReaderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PRSettingsProvider");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPRSettingsProviderClass_block_invoke_cold_1();
    free(v3);
  }
  getPRSettingsProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFOAuthorizationCenterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FamilyControlsObjCLibraryCore_frameworkLibrary)
  {
    FamilyControlsObjCLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FamilyControlsObjCLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FOAuthorizationCenter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFOAuthorizationCenterClass_block_invoke_cold_1();
    free(v3);
  }
  getFOAuthorizationCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3847388(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1A384867C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getOBPrivacyAppleIDIdentifier()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getOBPrivacyAppleIDIdentifierSymbolLoc_ptr;
  v7 = getOBPrivacyAppleIDIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyAppleIDIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)OnBoardingKitLibrary();
    v0 = (id *)dlsym(v1, "OBPrivacyAppleIDIdentifier");
    v5[3] = (uint64_t)v0;
    getOBPrivacyAppleIDIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_1A3848988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAppleIDAuthenticationInAppContextClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
  v7 = getAKAppleIDAuthenticationInAppContextClass_softClass;
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationInAppContextClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3849260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAuthenticationNewAppleIDSetupInfoKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr;
  v7 = getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr;
  if (!getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr)
  {
    v1 = (void *)AuthKitLibrary();
    v0 = (id *)dlsym(v1, "AKAuthenticationNewAppleIDSetupInfoKey");
    v5[3] = (uint64_t)v0;
    getAKAuthenticationNewAppleIDSetupInfoKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getAKAppleIDAuthenticationErrorDomain()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  v7 = getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr;
  if (!getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)AuthKitLibrary();
    v0 = (id *)dlsym(v1, "AKAppleIDAuthenticationErrorDomain");
    v5[3] = (uint64_t)v0;
    getAKAppleIDAuthenticationErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_1A3849EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A384A4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A384AC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A384B0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBBundleClass_block_invoke(uint64_t a1)
{
  Class result;

  OnBoardingKitLibrary();
  result = objc_getClass("OBBundle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBBundleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBBundleClass_block_invoke_cold_1();
    return (Class)OnBoardingKitLibrary();
  }
  return result;
}

uint64_t OnBoardingKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = OnBoardingKitLibraryCore_frameworkLibrary;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  OnBoardingKitLibrary();
  result = objc_getClass("OBPrivacyPresenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyPresenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getOBPrivacyPresenterClass_block_invoke_cold_1();
    return (Class)__getAKAppleIDAuthenticationInAppContextClass_block_invoke(v3);
  }
  return result;
}

Class __getAKAppleIDAuthenticationInAppContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AuthKitUILibraryCore_frameworkLibrary)
  {
    AuthKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AuthKitUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AKAppleIDAuthenticationInAppContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1();
    free(v3);
  }
  getAKAppleIDAuthenticationInAppContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AuthKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AuthKitLibraryCore_frameworkLibrary)
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AuthKitLibraryCore_frameworkLibrary;
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getAADeviceInfoClass_block_invoke(uint64_t a1)
{
  AppleAccountLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AADeviceInfo");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAADeviceInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAADeviceInfoClass_block_invoke_cold_1();
    AppleAccountLibrary();
  }
}

void AppleAccountLibrary()
{
  void *v0;

  if (!AppleAccountLibraryCore_frameworkLibrary)
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAAURLConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppleAccountLibrary();
  result = objc_getClass("AAURLConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAAURLConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAAURLConfigurationClass_block_invoke_cold_1();
    return (Class)__getRemoteUIControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RemoteUILibraryCore_frameworkLibrary)
  {
    RemoteUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RemoteUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RemoteUIController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRemoteUIControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getRemoteUIControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getiCloudMailAccountProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!iCloudMailAccountUILibraryCore_frameworkLibrary)
  {
    iCloudMailAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!iCloudMailAccountUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("iCloudMailAccountProvider");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getiCloudMailAccountProviderClass_block_invoke_cold_1();
    free(v3);
  }
  getiCloudMailAccountProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

PSThirdPartyApp *__getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  PSThirdPartyApp *result;
  PSThirdPartyApp *v3;
  SEL v4;
  id v5;

  AuthKitLibrary();
  result = (PSThirdPartyApp *)objc_getClass("AKAppleIDAuthenticationController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return -[PSThirdPartyApp initWithApplicationProxy:](v3, v4, v5);
  }
  return result;
}

void *__getkSecureBackupIsEnabledKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CloudServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)CloudServicesLibraryCore_frameworkLibrary_0;
  }
  else
  {
    CloudServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)CloudServicesLibraryCore_frameworkLibrary_0;
    if (!CloudServicesLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "kSecureBackupIsEnabledKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getkSecureBackupIsEnabledKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  }
  else
  {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (!SetupAssistantLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id PS_LocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForDocumentsPolicy(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("PSDocumentsPolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForSystemPolicy(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("PSSystemPolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForDriverPolicy(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("PSDriverPolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForAppleID(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("AppleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_RebrandedKeyForAppleID(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("REBRAND")) & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "stringByAppendingString:", CFSTR("_REBRAND"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

id PS_LocalizedStringForKeychainSync(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("KeychainSync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForInternational(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("PSInternational"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForSoftwareUpdate(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Software Update"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForPINEntry(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("PIN Entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PS_LocalizedStringForAccessories(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Accessories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1A385230C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPXTCCPhotoGridViewClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotosUICoreLibrary();
  result = objc_getClass("PXTCCPhotoGridView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPXTCCPhotoGridViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPXTCCPhotoGridViewClass_block_invoke_cold_1();
    return (Class)PhotosUICoreLibrary();
  }
  return result;
}

uint64_t PhotosUICoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhotosUICoreLibraryCore_frameworkLibrary)
    PhotosUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhotosUICoreLibraryCore_frameworkLibrary;
  if (!PhotosUICoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getPXTCCSettingsGridTitleSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getPXTCCSettingsGridTitleSymbolLoc_ptr;
  v6 = getPXTCCSettingsGridTitleSymbolLoc_ptr;
  if (!getPXTCCSettingsGridTitleSymbolLoc_ptr)
  {
    v1 = (void *)PhotosUICoreLibrary();
    v0 = dlsym(v1, "PXTCCSettingsGridTitle");
    v4[3] = (uint64_t)v0;
    getPXTCCSettingsGridTitleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A38524A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *getPXTCCSettingsGridSubtitleSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getPXTCCSettingsGridSubtitleSymbolLoc_ptr;
  v6 = getPXTCCSettingsGridSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsGridSubtitleSymbolLoc_ptr)
  {
    v1 = (void *)PhotosUICoreLibrary();
    v0 = dlsym(v1, "PXTCCSettingsGridSubtitle");
    v4[3] = (uint64_t)v0;
    getPXTCCSettingsGridSubtitleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A3852538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PSGetCapabilityBoolAnswer(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[PSCapabilityManager sharedManager](PSCapabilityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "capabilityBoolAnswer:", a1);

  return v3;
}

void sub_1A3852BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPSUICellularPlanManagerCacheClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPSUICellularPlanManagerCacheClass_softClass;
  v7 = getPSUICellularPlanManagerCacheClass_softClass;
  if (!getPSUICellularPlanManagerCacheClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPSUICellularPlanManagerCacheClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getPSUICellularPlanManagerCacheClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3853154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCBClientClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCBClientClass_softClass;
  v7 = getCBClientClass_softClass;
  if (!getCBClientClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCBClientClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCBClientClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38533C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTTTelephonyUtilitiesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRTTTelephonyUtilitiesClass_softClass;
  v7 = getRTTTelephonyUtilitiesClass_softClass;
  if (!getRTTTelephonyUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTTTelephonyUtilitiesClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getRTTTelephonyUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38535C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCAMCaptureCapabilitiesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCAMCaptureCapabilitiesClass_softClass;
  v7 = getCAMCaptureCapabilitiesClass_softClass;
  if (!getCAMCaptureCapabilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCAMCaptureCapabilitiesClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCAMCaptureCapabilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3853724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPGPictureInPictureProxyClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PegasusLibraryCore_frameworkLibrary)
  {
    PegasusLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PegasusLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PGPictureInPictureProxy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPGPictureInPictureProxyClass_block_invoke_cold_1();
    free(v3);
  }
  getPGPictureInPictureProxyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getADASManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  AudioDataAnalysisLibrary();
  result = objc_getClass("ADASManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getADASManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getADASManagerClass_block_invoke_cold_1();
    return (Class)AudioDataAnalysisLibrary();
  }
  return result;
}

uint64_t AudioDataAnalysisLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
    AudioDataAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AudioDataAnalysisLibraryCore_frameworkLibrary;
  if (!AudioDataAnalysisLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getPSUICellularPlanManagerCacheClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SettingsCellularUILibraryCore_frameworkLibrary)
  {
    SettingsCellularUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SettingsCellularUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PSUICellularPlanManagerCache");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPSUICellularPlanManagerCacheClass_block_invoke_cold_1();
    free(v3);
  }
  getPSUICellularPlanManagerCacheClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCBClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreBrightnessLibraryCore_frameworkLibrary)
  {
    CoreBrightnessLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreBrightnessLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CBClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCBClientClass_block_invoke_cold_1();
    free(v3);
  }
  getCBClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRTTTelephonyUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!RTTUtilitiesLibraryCore_frameworkLibrary)
  {
    RTTUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RTTUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RTTTelephonyUtilities");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getRTTTelephonyUtilitiesClass_block_invoke_cold_1();
    free(v3);
  }
  getRTTTelephonyUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCAMCaptureCapabilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CameraUILibraryCore_frameworkLibrary)
  {
    CameraUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CameraUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CAMCaptureCapabilities");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCAMCaptureCapabilitiesClass_block_invoke_cold_1();
    free(v3);
  }
  getCAMCaptureCapabilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3856578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1A385925C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNPSDomainAccessorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getNPSDomainAccessorClass_softClass;
  v7 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getNPSDomainAccessorClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A385931C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void NanoPreferencesSyncLibrary()
{
  void *v0;

  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

PSSetupController *__getNPSManagerClass_block_invoke(uint64_t a1)
{
  PSSetupController *result;
  PSSetupController *v3;
  SEL v4;

  NanoPreferencesSyncLibrary();
  result = (PSSetupController *)objc_getClass("NPSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (PSSetupController *)__getNPSManagerClass_block_invoke_cold_1();
    return -[PSSetupController init](v3, v4);
  }
  return result;
}

id GetImage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = a1;
  v4 = a2;
  +[PSListController appearance](PSListController, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesDarkTheme");

  if (v6)
    v7 = v4;
  else
    v7 = v3;
  v8 = (void *)MEMORY[0x1E0CEA638];
  v9 = v7;
  PSPreferencesFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) == 0)
  {
    +[PSListController appearance](PSListController, "appearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v13, "_flatImageWithColor:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }

  }
  return v13;
}

id GetImageTemplate(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CEA638];
  v5 = a1;
  PSPreferencesFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v9, "_flatImageWithColor:", v3);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }

  return v9;
}

void sub_1A3860604()
{
  objc_end_catch();
  JUMPOUT(0x1A386060CLL);
}

void sub_1A3861794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void WifiStateChanged()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.Preferences.wifiChanges"), 0);

}

void __SCDynamicStoreCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  v4 = (void *)MEMORY[0x1A8594B48]();
  objc_msgSend(a3, "sendStateUpdate");
  objc_autoreleasePoolPop(v4);
}

uint64_t __registerForEthernetAdapterNotificationsCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "ethernetDynamicStoreDidChange");
}

void sub_1A38682CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PSCalendarAuthorizationStates(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = (void *)tcc_server_create();
  tcc_service_singleton_for_CF_name();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  _PSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service kTCCServiceCalendar", buf, 2u);
  }

  v12 = v8;
  v13 = v9;
  v14 = v10;
  tcc_server_message_get_authorization_records_by_service();
  if (a1)
    *a1 = (id)objc_msgSend(v12, "copy");
  if (a2)
    *a2 = (id)objc_msgSend(v13, "copy");
  if (a3)
    *a3 = (id)objc_msgSend(v14, "copy");

}

uint64_t PSGreenTeaLoggerForAppListing()
{
  if (PSGreenTeaLoggerForAppListing_onceToken != -1)
    dispatch_once(&PSGreenTeaLoggerForAppListing_onceToken, &__block_literal_global_12);
  return PSGreenTeaLoggerForAppListing_appListLogger;
}

BOOL PSLocaleUses24HourClock(CFLocaleRef locale)
{
  _BOOL8 v1;
  __CFDateFormatter *v2;
  void *v3;

  if (!locale)
    return 0;
  v1 = 1;
  v2 = CFDateFormatterCreate(0, locale, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  CFDateFormatterGetFormat(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "rangeOfString:", CFSTR("H")) == 0x7FFFFFFFFFFFFFFFLL)
    v1 = objc_msgSend(v3, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;
  CFRelease(v2);

  return v1;
}

PSDetailController *CreateDetailControllerInstanceWithClass(objc_class *a1)
{
  id v1;
  void *v2;
  PSDetailController *v3;

  v1 = [a1 alloc];
  if (v1)
  {
    v2 = v1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (PSDetailController *)objc_msgSend(v2, "initForContentSize:", 100.0, 100.0);
    else
      v3 = (PSDetailController *)objc_msgSend(v2, "init");
  }
  else
  {
    v3 = objc_alloc_init(PSDetailController);
  }
  return v3;
}

id PSCityForSpecifier(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a1;
  v4 = v3;
  if (!a2
    || (objc_msgSend(v3, "propertyForKey:", CFSTR("value")), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[PSRootController readPreferenceValue:](PSRootController, "readPreferenceValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "citiesWithTimeZone:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_msgSend(v5, "rangeOfString:", CFSTR(","));
      objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v11, "cityForClassicIdentifier:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v11, "citiesMatchingName:localized:", v5, 0);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v8;

    if (v12 && objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestCityForLegacyCity:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFA970]), "initWithProperties:", v5);
  else
    v9 = 0;
LABEL_21:

  return v9;
}

id PSCityForTimeZone(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultCityForTimeZone:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t PSLegacyCityFromCity(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CFA978], "legacyCityForCity:", a1);
}

void LocalizeWeeAppName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB34D0];
  v9 = v1;
  objc_msgSend(v1, "objectForKey:", CFSTR("PATH"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CFBundleDisplayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedInfoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("NAME"));

}

id PSDisplayNameForBBSection(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  objc_msgSend(v1, "sectionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "displayName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(v1, "sectionType") == 1 && !v4)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v1, "pathToWeeAppPluginBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, CFSTR("PATH"), 0);

    LocalizeWeeAppName(v8);
    objc_msgSend(v8, "objectForKey:", CFSTR("NAME"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v9, "copy");

  }
  if (!v4)
    v4 = v2;

  return v4;
}

id PSApplicationSpecifierForBBSection(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  PSDisplayNameForBBSection(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, 0, 0, 0, a4, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "suppressedSettings"))
    goto LABEL_4;
  objc_msgSend(v7, "subsectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {

LABEL_4:
    v11 = objc_msgSend(v7, "showsInNotificationCenter");
    goto LABEL_5;
  }
  if ((objc_msgSend(v7, "suppressedSettings") & 1) != 0)
  {
    objc_msgSend(v7, "subsections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (!v20)
      goto LABEL_4;
  }
  else
  {

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v7, "subsections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v22 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v21);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "showsInNotificationCenter") & 1) != 0)
        {
          v11 = 1;
          goto LABEL_21;
        }
      }
      v11 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_21:

LABEL_5:
  objc_msgSend(v7, "sectionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v13, ShowInNotificationsState);

  objc_msgSend(v9, "setProperty:forKey:", v7, CFSTR("BBSECTION_INFO_KEY"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v14, kWantsIcon);

  objc_msgSend(v9, "setProperty:forKey:", a3, CFSTR("cellClass"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "defaultCellHeight");
    *(float *)&v16 = v16;
    objc_msgSend(v15, "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v17, CFSTR("height"));

  }
  return v9;
}

id PSApplicationSpecifierForAssistantSectionForBundleId(uint64_t a1, int a2, int a3, int a4)
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PSApplicationSpecifierForAssistantSection(v7, a2, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PSApplicationSpecifierForAssistantSection(void *a1, int a2, int a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a1;
  if (PSApplicationSpecifierForAssistantSection_onceToken != -1)
    dispatch_once(&PSApplicationSpecifierForAssistantSection_onceToken, &__block_literal_global_76);
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_10;
  objc_msgSend(v7, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(v7, "localizedShortName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      v9 = v10;
      goto LABEL_8;
    }
    objc_msgSend(v7, "itemName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_8;
LABEL_10:
    v12 = 0;
    goto LABEL_17;
  }
LABEL_8:
  if (a4)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ASSISTANT"), &stru_1E4A69238, CFSTR("AssistantShared"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, 0, 0, 0, PSApplicationSpecifierForAssistantSection_sDetailClass, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v9, CFSTR("APP_NAME"));
  objc_msgSend(v7, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("BUNDLE_ID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PSApplicationSpecifierForAssistantSection_sDetailClass != 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v15, CFSTR("enabled"));

  objc_msgSend(v7, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v16, CFSTR("id"));

  objc_msgSend(v12, "setProperty:forKey:", PSApplicationSpecifierForAssistantSection_sAssistantCellClass, CFSTR("cellClass"));
  if (a2)
  {
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    if (a3)
    {
      objc_msgSend(v7, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setProperty:forKey:", v17, CFSTR("appIDForLazyIcon"));

    }
    else
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("com.apple.siri"), CFSTR("appIDForLazyIcon"));
    }
  }

LABEL_17:
  return v12;
}

id PSApplicationSpecifierForSearchSectionForBundleId(void *a1, int a2, int a3, int a4)
{
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x1E0CA5870];
  v8 = a1;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, 0);

  PSApplicationSpecifierForSearchSection(v9, a2, a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id PSApplicationSpecifierForSearchSection(void *a1, int a2, int a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a1;
  if (PSApplicationSpecifierForSearchSection_onceToken != -1)
    dispatch_once(&PSApplicationSpecifierForSearchSection_onceToken, &__block_literal_global_97);
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v11 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(v7, "localizedShortName");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
    if (a4)
      goto LABEL_6;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SEARCH"), &stru_1E4A69238, CFSTR("AssistantShared"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
LABEL_6:
  v10 = v9;
LABEL_10:
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, 0, 0, 0, PSApplicationSpecifierForSearchSection_sDetailClass, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v9, CFSTR("APP_NAME"));
  objc_msgSend(v7, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v14, CFSTR("BUNDLE_ID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PSApplicationSpecifierForSearchSection_sDetailClass != 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v15, CFSTR("enabled"));

  objc_msgSend(v7, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v16, CFSTR("id"));

  objc_msgSend(v11, "setProperty:forKey:", PSApplicationSpecifierForSearchSection_sSearchCellClass, CFSTR("cellClass"));
  if (a2)
  {
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
    if (a3)
    {
      objc_msgSend(v7, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProperty:forKey:", v17, CFSTR("appIDForLazyIcon"));

    }
    else
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("com.apple.graphic-icon.search"), CFSTR("iconUTTypeIdentifier"));
    }
  }

LABEL_15:
  return v11;
}

PSAccountsLinkSpecifier *PSApplicationSpecifierForAccountsSection()
{
  PSAccountsLinkSpecifier *v0;
  PSAccountsLinkSpecifier *v1;

  if (_initAccountsUI_onceToken != -1)
    dispatch_once(&_initAccountsUI_onceToken, &__block_literal_global_219);
  v0 = [PSAccountsLinkSpecifier alloc];
  v1 = -[PSAccountsLinkSpecifier initWithDetailClass:](v0, "initWithDetailClass:", sAccountsUISettingsControllerClass);
  -[PSSpecifier setIdentifier:](v1, "setIdentifier:", CFSTR("ACCOUNTS"));
  return v1;
}

id PSApplicationSpecifierForAddAccountButton()
{
  void *v0;
  void *v1;
  void *v2;

  if (_initAccountsUI_onceToken != -1)
    dispatch_once(&_initAccountsUI_onceToken, &__block_literal_global_219);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ADD_ACCOUNT"), &stru_1E4A69238, CFSTR("PSSystemPolicy"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v1, 0, 0, 0, sAccountsUIAddAccountControllerClass, 13, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setIdentifier:", CFSTR("ADD_ACCOUNT"));
  return v2;
}

void __init_sirikit_enabled_lock()
{
  if (__init_sirikit_enabled_lock_onceToken != -1)
    dispatch_once(&__init_sirikit_enabled_lock_onceToken, &__block_literal_global_115);
}

uint64_t ____init_sirikit_enabled_lock_block_invoke()
{
  return pthread_mutex_init(&s_sirikit_enabled_lock, 0);
}

uint64_t PSResetCachedSiriKitTCCEnabledAppIds()
{
  if (__init_sirikit_enabled_lock_onceToken != -1)
    dispatch_once(&__init_sirikit_enabled_lock_onceToken, &__block_literal_global_115);
  pthread_mutex_lock(&s_sirikit_enabled_lock);
  return pthread_mutex_unlock(&s_sirikit_enabled_lock);
}

double PSSizeForMessagesIcon()
{
  if (PSSizeForMessagesIcon_onceToken != -1)
    dispatch_once(&PSSizeForMessagesIcon_onceToken, &__block_literal_global_120);
  return *(double *)&PSSizeForMessagesIcon_result_0;
}

id PSBlankMessageAppIconImage()
{
  if (PSBlankMessageAppIconImage_onceToken != -1)
    dispatch_once(&PSBlankMessageAppIconImage_onceToken, &__block_literal_global_126);
  return (id)PSBlankMessageAppIconImage_result;
}

id DeviceName()
{
  return (id)MGCopyAnswer();
}

uint64_t SetDeviceName(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v1 = a1;
  if (!objc_msgSend(v1, "length"))
  {
LABEL_7:
    v2 = 0xFFFFFFFFLL;
    goto LABEL_8;
  }
  if (!lockdown_connect())
  {
    _PSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "failed to connect to lockdown", v5, 2u);
    }

    goto LABEL_7;
  }
  lockdown_set_value();
  lockdown_disconnect();
  v2 = 0;
LABEL_8:

  return v2;
}

uint64_t ShouldShowWeibo()
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (CFPreferencesGetAppBooleanValue(CFSTR("AlwaysShowWeibo"), CFSTR("com.apple.Preferences"), 0))
    return 1;
  CPGetDeviceRegionCode();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("CH"));
  else
    v3 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __ShouldShowWeibo_block_invoke;
  v15[3] = &unk_1E4A65650;
  v15[4] = &v16;
  objc_msgSend(v4, "performWithoutExtensionInputModes:", v15);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)v17[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        MEMORY[0x1A85946D4](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("zh"), (_QWORD)v11);

        if ((v10 & 1) != 0)
        {
          LODWORD(v6) = 1;
          goto LABEL_16;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_16:

  _Block_object_dispose(&v16, 8);
  return v3 | v6;
}

void sub_1A386B048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t UserInterfaceIdiom()
{
  if (UserInterfaceIdiom_onceToken != -1)
    dispatch_once(&UserInterfaceIdiom_onceToken, &__block_literal_global_139);
  return UserInterfaceIdiom_idiom;
}

uint64_t PSToolbarLabelsTextColor()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
}

objc_class *PSStorageClass()
{
  return _usageBundleClassWithName(CFSTR("CloudStorageController"));
}

objc_class *_usageBundleClassWithName(void *a1)
{
  NSString *v1;
  Class v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;

  v1 = a1;
  v2 = NSClassFromString(v1);
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(CFSTR("/System/Library/PreferenceBundles/"), "stringByAppendingPathComponent:", CFSTR("UsageSettings"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("bundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "load");
    v2 = NSClassFromString(v1);

  }
  v7 = v2;

  return v7;
}

objc_class *PSBackupClass()
{
  return _usageBundleClassWithName(CFSTR("BackupController"));
}

uint64_t PSIsInternalInstall()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "sf_isInternalInstall");

  return v1;
}

uint64_t PSUsedByManagedAccount()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "aa_primaryAppleAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  getACAccountStoreClass();
  if (objc_opt_class())
  {
    objc_msgSend(getACAccountStoreClass(), "ams_sharedAccountStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ams_activeiTunesAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "ams_isManagedAppleID");

  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v1, "aa_isManagedAppleID") | v4;

  return v5;
}

id getACAccountStoreClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getACAccountStoreClass_softClass;
  v7 = getACAccountStoreClass_softClass;
  if (!getACAccountStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getACAccountStoreClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getACAccountStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386B3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSUsedByHSA2Account()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "aa_primaryAppleAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && (objc_msgSend(v1, "aa_altDSID"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    objc_msgSend(getAKAccountManagerClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "aa_altDSID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authKitAccountWithAltDSID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "aa_altDSID");
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(getAKAccountManagerClass(), "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "securityLevelForAccount:", v6) == 4;

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id getAKAccountManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAKAccountManagerClass_softClass;
  v7 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAKAccountManagerClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getAKAccountManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386B57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSJoinedCDPCircleAccount()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  char v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE buf[24];
  void *v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v0 = (void *)getCDPStateControllerClass_softClass;
  v14 = getCDPStateControllerClass_softClass;
  if (!getCDPStateControllerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getCDPStateControllerClass_block_invoke;
    v16 = &unk_1E4A65650;
    v17 = &v11;
    __getCDPStateControllerClass_block_invoke((uint64_t)buf);
    v0 = (void *)v12[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v11, 8);
  v2 = (void *)objc_opt_new();
  v10 = 0;
  v3 = objc_msgSend(v2, "isManateeAvailable:", &v10);
  v4 = v10;

  if (v4)
    v5 = 0;
  else
    v5 = v3;
  if ((v5 & 1) == 0)
  {
    _PSLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Has joined CDP Circle: %@ Error: %@", buf, 0x16u);

    }
  }

  return v3;
}

void sub_1A386B738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSIsWebAppPlaceholder(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isWebAppPlaceholder") & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(v1, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.WebKit.PushBundle"));

  }
  return v2;
}

__CFString *PSDeviceClass()
{
  __CFString *v0;

  v0 = (__CFString *)MGCopyAnswer();
  if (!v0)
    v0 = CFSTR("iPhone");
  return v0;
}

uint64_t PSUsePadStylePIN()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "sf_isiPad");

  return v1;
}

void resetLocale()
{
  __textDirection = 0;
}

uint64_t PSLocaleLanguageDirection()
{
  uint64_t result;
  void *v1;
  void *v2;
  void *v3;

  result = __textDirection;
  if (!__textDirection)
  {
    v1 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __textDirection = objc_msgSend(v1, "characterDirectionForLanguage:", v3);

    return __textDirection;
  }
  return result;
}

void PSSetBatteryMonitoringEnabled(char a1)
{
  uint64_t v1;
  id v2;

  if ((a1 & 1) != 0)
  {
    v1 = 1;
LABEL_5:
    PSSetBatteryMonitoringEnabled_refCount += v1;
    goto LABEL_6;
  }
  if (PSSetBatteryMonitoringEnabled_refCount)
  {
    v1 = -1;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBatteryMonitoringEnabled:", PSSetBatteryMonitoringEnabled_refCount != 0);

}

id PSAboutDeviceSupervision()
{
  void *v0;
  const __CFString *v1;
  void *v2;

  PSPreferencesFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (MGGetBoolAnswer())
    v1 = CFSTR("DEVICE_SUPERVISION_INFO_WLAN");
  else
    v1 = CFSTR("DEVICE_SUPERVISION_INFO");
  objc_msgSend(v0, "localizedStringForKey:value:table:", v1, &stru_1E4A69238, CFSTR("DeviceSupervisionInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t PSIsiPad()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "sf_isiPad");

  return v1;
}

uint64_t PSIsiPhone()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "sf_isiPhone");

  return v1;
}

BOOL PSIsN56()
{
  void *v0;
  double v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v2 = v1 == 736.0;

  return v2;
}

BOOL PSIsJ99()
{
  void *v0;
  double v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v2 = v1 == 1366.0;

  return v2;
}

BOOL PSIsD22ScreenSize()
{
  void *v0;
  double v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v2 = v1 == 812.0;

  return v2;
}

const __CFArray *PSIsHostingPersonalHotspot()
{
  uint64_t v0;
  CFAllocatorRef *v1;
  const __CFString *v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  const __CFAllocator *v6;
  const __SCDynamicStore *v7;
  const __SCDynamicStore *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  CFTypeID v11;
  const __CFArray *Value;
  const __CFArray *v13;
  const __CFString *v14;
  const __CFString *ValueAtIndex;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  uint8_t v25[16];
  char cStr[32];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v0 = _NETRBClientCreate();
  v1 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (v0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    memset(cStr, 0, sizeof(cStr));
    if ((_NETRBClientGetDynamicStoreKey() & 1) != 0)
    {
      v2 = CFStringCreateWithCString(*v1, cStr, 0x8000100u);
      if (v2)
      {
LABEL_13:
        _NETRBClientDestroy();
        goto LABEL_14;
      }
      _PSLoggingFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        v4 = "CFStringCreateWithCString failed";
LABEL_11:
        _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, v4, v25, 2u);
      }
    }
    else
    {
      _PSLoggingFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        v4 = "_NETRBClientGetDynamicStoreKey failed.";
        goto LABEL_11;
      }
    }

    v2 = 0;
    goto LABEL_13;
  }
  _PSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)cStr = 0;
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "_NETRBClientCreate failed.", (uint8_t *)cStr, 2u);
  }

  v2 = 0;
LABEL_14:
  v6 = *v1;
  v7 = SCDynamicStoreCreate(*v1, CFSTR("com.apple.Preferences"), 0, 0);
  if (v7)
  {
    v8 = v7;
    if (!v2 || (v9 = (const __CFDictionary *)SCDynamicStoreCopyValue(v7, v2)) == 0)
    {
      LODWORD(v19) = 0;
      v13 = 0;
      goto LABEL_38;
    }
    v10 = v9;
    v11 = CFGetTypeID(v9);
    if (v11 == CFDictionaryGetTypeID())
    {
      Value = (const __CFArray *)CFDictionaryGetValue(v10, CFSTR("ExternalInterfaces"));
      v13 = Value;
      if (!Value)
      {
        LODWORD(v19) = 0;
        goto LABEL_37;
      }
      if (CFArrayGetCount(Value))
      {
        v14 = (const __CFString *)*MEMORY[0x1E0CE8B30];
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v13, 0);
        NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v6, v14, ValueAtIndex, (CFStringRef)*MEMORY[0x1E0CE8B78]);
        if (NetworkInterfaceEntity)
        {
          v17 = NetworkInterfaceEntity;
          v13 = (const __CFArray *)SCDynamicStoreCopyValue(v8, NetworkInterfaceEntity);
          if (v13)
          {
            v18 = (const __CFDictionary *)CFDictionaryGetValue(v10, CFSTR("Hosts"));
            v19 = v18;
            if (v18)
            {
              if (CFDictionaryGetCount(v18))
              {
                CFDictionaryGetValue(v19, CFSTR("Current"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v20;
                if (v20)
                  v19 = (const __CFDictionary *)objc_msgSend(v20, "integerValue");
                else
                  v19 = 0;

              }
              else
              {
                v19 = 0;
              }
            }
            CFRelease(v13);
            v13 = (const __CFArray *)((uint64_t)v19 > 0);
          }
          else
          {
            LODWORD(v19) = 0;
          }
          CFRelease(v17);
          goto LABEL_37;
        }
      }
    }
    LODWORD(v19) = 0;
    v13 = 0;
LABEL_37:
    CFRelease(v10);
LABEL_38:
    CFRelease(v8);
    if (!v2)
      goto LABEL_40;
    goto LABEL_39;
  }
  LODWORD(v19) = 0;
  v13 = 0;
  if (v2)
LABEL_39:
    CFRelease(v2);
LABEL_40:
  _PSLoggingFacility();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("OFF");
    if ((_DWORD)v13)
      v23 = CFSTR("ON");
    *(_DWORD *)cStr = 138412546;
    *(_QWORD *)&cStr[4] = v23;
    *(_WORD *)&cStr[12] = 1024;
    *(_DWORD *)&cStr[14] = (_DWORD)v19;
    _os_log_impl(&dword_1A3819000, v22, OS_LOG_TYPE_DEFAULT, "Tethering is currently %@ with %d devices connected.", (uint8_t *)cStr, 0x12u);
  }

  return v13;
}

id PSCurrentCallTypes()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0CA7178];
  v11[0] = *MEMORY[0x1E0CA7160];
  v11[1] = v1;
  v2 = *MEMORY[0x1E0CA7158];
  v11[2] = *MEMORY[0x1E0CA7170];
  v11[3] = v2;
  v11[4] = *MEMORY[0x1E0CA7168];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __CFArray *)CTCopyCurrentCallsWithTypes();
  if (v4)
  {
    v5 = v4;
    if (CFArrayGetCount(v4) >= 1)
    {
      v6 = 0;
      do
      {
        CFArrayGetValueAtIndex(v5, v6);
        CTCallGetCallType();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v0, "addObject:", v7);
        }
        else
        {
          _PSLoggingFacility();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_1A3819000, v8, OS_LOG_TYPE_DEFAULT, "Unknown call type", v10, 2u);
          }

        }
        ++v6;
      }
      while (v6 < CFArrayGetCount(v5));
    }
    CFRelease(v5);
  }

  return v0;
}

void PSLog()
{
  if (PSLog_onceToken != -1)
    dispatch_once(&PSLog_onceToken, &__block_literal_global_175);
}

uint64_t PSIsDebug()
{
  return 0;
}

uint64_t PreferencesTableViewHeaderFont()
{
  return objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
}

uint64_t PreferencesTableViewHeaderColor()
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
}

uint64_t PreferencesTableViewFooterFont()
{
  return objc_msgSend(MEMORY[0x1E0CEAA78], "_defaultFontForTableViewStyle:isSectionHeader:", 1, 0);
}

id PreferencesTableViewFooterColor()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "textProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resolvedColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

float PreferencesTableViewCellRightPad()
{
  return 15.0;
}

float PreferencesTableViewCellLeftPad()
{
  return 15.0;
}

double PSTableSectionFooterTopPad()
{
  return 6.0;
}

double PSTableSectionFooterBottomPad()
{
  return 10.0;
}

double PSTableViewSideInset()
{
  void *v0;
  unint64_t v1;
  double result;
  void *v3;
  char v4;
  _BOOL4 v5;

  if (PSIsJ99())
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "statusBarOrientation") - 3;

    if (v1 < 2)
      return 90.0;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isiPad");

  result = 28.0;
  if ((v4 & 1) == 0)
  {
    v5 = PSIsN56();
    result = 0.0;
    if (v5)
      return 20.0;
  }
  return result;
}

double PSTextViewInsets()
{
  return 5.0;
}

id PSPointImageOfColor(void *a1)
{
  id v1;
  void *v2;
  CGSize v4;
  CGRect v5;

  v1 = a1;
  v4.width = 1.0;
  v4.height = 1.0;
  UIGraphicsBeginImageContext(v4);
  objc_msgSend(v1, "set");

  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 1.0;
  v5.size.height = 1.0;
  UIRectFill(v5);
  UIGraphicsGetImageFromCurrentImageContext();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v2;
}

double PSRoundToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&PSRoundToPixel_scale;
  if (*(double *)&PSRoundToPixel_scale == -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", *(double *)&PSRoundToPixel_scale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    PSRoundToPixel_scale = v4;

    v2 = *(double *)&PSRoundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

uint64_t PSSiriImage()
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithApplicationBundleIdentifier:", CFSTR("com.apple.siri"));
}

id PSPassbookImage()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceIdiom"))
    v2 = CFSTR("com.apple.PassbookStub");
  else
    v2 = CFSTR("com.apple.Passbook");
  objc_msgSend(v0, "ps_synchronousIconWithApplicationBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t PSAirDropImage()
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.airdrop"));
}

id _PSFindViewRecursively(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a1;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
      objc_msgSend(v4, "subviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
        objc_msgSend(v3, "addObjectsFromArray:", v6);
      _PSFindViewRecursively(v3, a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id PSFindViewOfClass(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  if (v3 && a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _PSFindViewRecursively(v7, a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v3;
  }

  return v4;
}

id PSAuthorizationTokenForPasscode(void *a1)
{
  id v1;
  uint64_t v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[8];
  size_t v9;

  if (!a1)
    return 0;
  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "UTF8String");
  v3 = objc_msgSend(v1, "lengthOfBytesUsingEncoding:", 4);

  v9 = 64;
  v4 = malloc_type_malloc(0x40uLL, 0x517EBC5AuLL);
  if (aks_auth_token_create(0, v2, v3, 0, v4, &v9))
  {
    _PSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create authorization token", v8, 2u);
    }

    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __memset_chk();
  free(v4);
  return v6;
}

id PSLocalizableMesaStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E4A69238, CFSTR("TouchID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t PSIsPearlInterlocked()
{
  void *v0;
  void *v1;
  char v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "sf_isInternalInstall") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("PSTestIsPearlInterlocked"));

    if ((v2 & 1) != 0)
      return 1;
  }
  else
  {

  }
  v4 = (void *)MEMORY[0x1E0D027E8];
  objc_msgSend(MEMORY[0x1E0D027F8], "deviceDescriptorForType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "deviceWithDescriptor:error:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;

  if (v6)
  {
    v15 = 0;
    v14 = 0;
    v8 = objc_msgSend(v6, "bioLockoutState:forUser:error:", &v15, getuid(), &v14);
    v9 = v14;
    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v18 = v6;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "Biolockout state for device: %@, state: %@, error: %@, success: %@", buf, 0x2Au);

    }
    v3 = v15 == 7;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t PSIsLocationRestricted()
{
  void *v0;
  void *v1;
  uint64_t v2;

  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "containsObject:", CFSTR("location"));
  else
    v2 = 0;

  return v2;
}

id PSHighLegibilityAlternateFont(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = *MEMORY[0x1E0CEB518];
  v15[0] = *MEMORY[0x1E0CEB520];
  v15[1] = v2;
  v16[0] = &unk_1E4A92E98;
  v16[1] = &unk_1E4A92EB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CEB4D0];
  v12 = v3;
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorByAddingAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(v1, "pointSize");
    objc_msgSend(v9, "fontWithDescriptor:size:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

BOOL PSDiagnosticsAreEnabled()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC0]) == 1;

  return v1;
}

uint64_t PSAnimationOptionsFromAnimationCurve(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
    return 0;
  else
    return ((a1 - 1) << 16) + 0x10000;
}

uint64_t PKIsUSBRestrictedModeDisabledByMobileAsset()
{
  int v0;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _DWORD *, uint64_t);
  void *v6;
  uint64_t *v7;
  unsigned int *v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v2 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -5;
  v9 = 7;
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __ACMTRMEnv_Get_block_invoke;
  v6 = &unk_1E4A66C70;
  v7 = &v10;
  v8 = &v2;
  v0 = ACMKernelControl(18);
  if (!v0)
    v0 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  if (v0)
    return 0;
  else
    return (v2 >> 4) & 1;
}

void sub_1A386CB40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void PSSetTCCLevelForService(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _PSLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = a1;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "Setting TCC auth for service: %@ appIdentifier:%@, accessLevel:%@", (uint8_t *)&v12, 0x20u);

  }
  tcc_server_singleton_default();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v5);
  objc_msgSend(v9, "cStringUsingEncoding:", 4);
  v10 = (void *)tcc_identity_create();
  tcc_service_singleton_for_CF_name();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_server_message_set_authorization_value();

}

void PSGetAuthorizationStatesForService(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  tcc_server_singleton_default();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_service_singleton_for_CF_name();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _PSLoggingFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = a1;
    _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  v14 = v10;
  v15 = v11;
  v16 = v12;
  tcc_server_message_get_authorization_records_by_service();
  if (a2)
    *a2 = objc_retainAutorelease(v14);
  if (a3)
    *a3 = objc_retainAutorelease(v15);
  if (a4)
    *a4 = objc_retainAutorelease(v16);

}

uint64_t PSIsUserParcElisabethEligible()
{
  int domain_answer;
  NSObject *v1;
  _BOOL4 v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  domain_answer = os_eligibility_get_domain_answer();
  _PSLoggingFacility();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (domain_answer)
  {
    if (v2)
    {
      *(_DWORD *)buf = 67109120;
      v8 = domain_answer;
      v3 = "Cannot determine eligibility due to error: %d";
      v4 = v1;
      v5 = 8;
LABEL_6:
      _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
    }
  }
  else if (v2)
  {
    *(_WORD *)buf = 0;
    v3 = "Unable to determine eligibility ";
    v4 = v1;
    v5 = 2;
    goto LABEL_6;
  }

  return 0;
}

void ___initAccountsUI_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  PSBundlePathForPreferenceBundle((uint64_t)CFSTR("AccountSettingsUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  SFRuntimeAbsoluteFilePathForPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "load");
  sAccountsUISettingsControllerClass = (uint64_t)NSClassFromString(CFSTR("ACUISettingsController"));
  sAccountsUIAddAccountControllerClass = (uint64_t)NSClassFromString(CFSTR("ACUIAddAccountViewController"));

}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ACAccountStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getACAccountStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getACAccountStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AuthKitLibraryCore_frameworkLibrary_0)
  {
    AuthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!AuthKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AKAccountManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAKAccountManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getAKAccountManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCDPStateControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreCDPLibraryCore_frameworkLibrary)
  {
    CoreCDPLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreCDPLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CDPStateController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCDPStateControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getCDPStateControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PSKeychainSyncIsUsingICDP()
{
  id CDPAccountClass;
  void *v1;
  void *v2;
  uint64_t v3;

  CDPAccountClass = getCDPAccountClass();
  objc_msgSend(getCDPAccountClass(), "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryAccountDSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(CDPAccountClass, "isICDPEnabledForDSID:", v2);

  return v3;
}

id getCDPAccountClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCDPAccountClass_softClass;
  v7 = getCDPAccountClass_softClass;
  if (!getCDPAccountClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCDPAccountClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCDPAccountClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386D62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSKeychainSyncGetStatus(_QWORD *a1)
{
  int v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;

  if (!PSKeychainSyncIsUsingICDP())
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_primaryAppleAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = SOSCCThisDeviceIsInCircle();
      if (v7 <= 3)
      {
        v4 = dword_1A38ECE30[v7];
        goto LABEL_13;
      }
    }
    else if (a1)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Preferences.KeychainSync"), 3, 0);
      v4 = 0;
      *a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      return v4;
    }
    v4 = 0;
    goto LABEL_13;
  }
  v2 = objc_msgSend(getCDPKeychainSyncClass(), "isUserVisibleKeychainSyncEnabled");
  v3 = CFSTR("DISABLED");
  if (v2)
  {
    v3 = CFSTR("ENABLED");
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }
  NSLog(CFSTR("iCDP: User-visible Keychain Sync is %@"), v3);
  return v4;
}

id getCDPKeychainSyncClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCDPKeychainSyncClass_softClass;
  v7 = getCDPKeychainSyncClass_softClass;
  if (!getCDPKeychainSyncClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCDPKeychainSyncClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCDPKeychainSyncClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386D7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSKeychainSyncGetCircleMembershipStatus(_BYTE *a1, BOOL *a2)
{
  uint64_t v4;

  v4 = SOSCCThisDeviceIsInCircle();
  if (v4 >= 4)
  {
    NSLog(CFSTR("Unexpected circle status %i"), v4);
    return 0;
  }
  else
  {
    if (a1)
      *a1 = (7u >> (v4 & 0xF)) & 1;
    if (a2)
      *a2 = (v4 & 0xF) == 0;
    return 1;
  }
}

uint64_t PSIsUsingPasscode(BOOL *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1)
    *a1 = objc_msgSend(v2, "unlockScreenType") == 0;
  v4 = objc_msgSend(v3, "isPasscodeSet");

  return v4;
}

id PSSecureBackupAccountInfo(_QWORD *a1, char a2)
{
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[6];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = PSSecureBackupAccountInfo__infoQueue;
  if (!PSSecureBackupAccountInfo__infoQueue)
  {
    v5 = dispatch_queue_create("preferences-securebackup-info", 0);
    v6 = (void *)PSSecureBackupAccountInfo__infoQueue;
    PSSecureBackupAccountInfo__infoQueue = (uint64_t)v5;

    v4 = PSSecureBackupAccountInfo__infoQueue;
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __PSSecureBackupAccountInfo_block_invoke;
  block[3] = &unk_1E4A66CA8;
  v11 = a2;
  block[4] = &v12;
  block[5] = &v18;
  dispatch_sync(v4, block);
  if (a1)
  {
    v7 = (void *)v13[5];
    if (v7)
      *a1 = objc_retainAutorelease(v7);
  }
  v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id getSecureBackupClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSecureBackupClass_softClass;
  v7 = getSecureBackupClass_softClass;
  if (!getSecureBackupClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSecureBackupClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386DC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSIsKeychainSecureBackupEnabled(_QWORD *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  PSSecureBackupAccountInfo(a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  getkSecureBackupIsEnabledKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

id getkSecureBackupIsEnabledKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupIsEnabledKeySymbolLoc_ptr_0;
  v7 = getkSecureBackupIsEnabledKeySymbolLoc_ptr_0;
  if (!getkSecureBackupIsEnabledKeySymbolLoc_ptr_0)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupIsEnabledKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupIsEnabledKeySymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void PSShowEnableKeychainSync(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id CDPKeychainSyncClass;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (PSKeychainSyncIsUsingICDP())
  {
    CDPKeychainSyncClass = getCDPKeychainSyncClass();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __PSShowEnableKeychainSync_block_invoke;
    v10[3] = &unk_1E4A66CF8;
    v13 = v7;
    v11 = v6;
    v12 = v5;
    objc_msgSend(CDPKeychainSyncClass, "setUserVisibleKeychainSyncEnabled:withCompletion:", 1, v10);

  }
  else
  {
    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showEnableSyncFlowWithSpecifier:overController:completion:", v5, v6, v7);

  }
}

id getCDPStateErrorDomain()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getCDPStateErrorDomainSymbolLoc_ptr;
  v7 = getCDPStateErrorDomainSymbolLoc_ptr;
  if (!getCDPStateErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)CoreCDPLibrary();
    v0 = (id *)dlsym(v1, "CDPStateErrorDomain");
    v5[3] = (uint64_t)v0;
    getCDPStateErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getCDPContextClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCDPContextClass_softClass;
  v7 = getCDPContextClass_softClass;
  if (!getCDPContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCDPContextClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCDPContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386E178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCDPStateControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCDPStateControllerClass_softClass_0;
  v7 = getCDPStateControllerClass_softClass_0;
  if (!getCDPStateControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCDPStateControllerClass_block_invoke_0;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCDPStateControllerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386E230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCDPUIControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCDPUIControllerClass_softClass;
  v7 = getCDPUIControllerClass_softClass;
  if (!getCDPUIControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCDPUIControllerClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCDPUIControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A386E2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PSShowKeychainSyncRecovery(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showRecoveryFlowWithSpecifier:overController:completion:", v7, v6, v5);

}

uint64_t _clearKeychainSyncCache(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cleanupAppleIDCredentials");
}

uint64_t PSKeychainSyncCircleExists()
{
  uint64_t v0;

  v0 = SOSCCThisDeviceIsInCircle();
  if ((v0 + 1) < 5)
    return (0xEu >> (v0 + 1)) & 1;
  NSLog(CFSTR("Unexpected circle status %i"), v0);
  return 0;
}

id getkSecureBackupMetadataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupMetadataKeySymbolLoc_ptr_0;
  v7 = getkSecureBackupMetadataKeySymbolLoc_ptr_0;
  if (!getkSecureBackupMetadataKeySymbolLoc_ptr_0)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupMetadataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupMetadataKeySymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUsesComplexPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupUsesComplexPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesComplexPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUsesRandomPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupUsesRandomPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesRandomPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupUsesNumericPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupUsesNumericPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupUsesNumericPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupNumericPassphraseLengthKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  v7 = getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr;
  if (!getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupNumericPassphraseLengthKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupNumericPassphraseLengthKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getAKAppleIDAuthenticationInAppContextClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass_0;
  v7 = getAKAppleIDAuthenticationInAppContextClass_softClass_0;
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationInAppContextClass_block_invoke_0;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3870814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAKAppleIDAuthenticationControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAKAppleIDAuthenticationControllerClass_softClass_0;
  v7 = getAKAppleIDAuthenticationControllerClass_softClass_0;
  if (!getAKAppleIDAuthenticationControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAKAppleIDAuthenticationControllerClass_block_invoke_0;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getAKAppleIDAuthenticationControllerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38708CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PSHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier()
{
  void *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  v7 = getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  if (!getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)HSAAuthenticationLibrary();
    v0 = dlsym(v1, "HSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifier");
    v5[3] = (uint64_t)v0;
    getHSAAuthenticationUnregisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return ((uint64_t (*)(const __CFString *))v0)(CFSTR("KeychainSyncSMSValidation"));
}

void sub_1A3871738(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id getkSecureBackupSMSTargetInfoKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0;
  v7 = getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0;
  if (!getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupSMSTargetInfoKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupSMSTargetInfoKeySymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupSMSTargetPhoneNumberKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0;
  v7 = getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0;
  if (!getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupSMSTargetPhoneNumberKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupSMSTargetPhoneNumberKeySymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupCountryDialCodeKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0;
  v7 = getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0;
  if (!getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupCountryDialCodeKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupCountryDialCodeKeySymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupCountryCodeKey_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupCountryCodeKeySymbolLoc_ptr_0;
  v7 = getkSecureBackupCountryCodeKeySymbolLoc_ptr_0;
  if (!getkSecureBackupCountryCodeKeySymbolLoc_ptr_0)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupCountryCodeKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupCountryCodeKeySymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupPassphraseKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupPassphraseKeySymbolLoc_ptr;
  v7 = getkSecureBackupPassphraseKeySymbolLoc_ptr;
  if (!getkSecureBackupPassphraseKeySymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupPassphraseKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupPassphraseKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationAppleID()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationAppleID");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationAppleIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupAuthenticationPassword()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  v7 = getkSecureBackupAuthenticationPasswordSymbolLoc_ptr;
  if (!getkSecureBackupAuthenticationPasswordSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupAuthenticationPassword");
    v5[3] = (uint64_t)v0;
    getkSecureBackupAuthenticationPasswordSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSecureBackupErrorDomain()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupErrorDomainSymbolLoc_ptr;
  v7 = getkSecureBackupErrorDomainSymbolLoc_ptr;
  if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)CloudServicesLibrary_0();
    v0 = (id *)dlsym(v1, "kSecureBackupErrorDomain");
    v5[3] = (uint64_t)v0;
    getkSecureBackupErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getFTDeviceSupportClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getFTDeviceSupportClass_softClass;
  v7 = getFTDeviceSupportClass_softClass;
  if (!getFTDeviceSupportClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFTDeviceSupportClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getFTDeviceSupportClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38771B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PSHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  v8 = getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr;
  if (!getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr)
  {
    v3 = (void *)HSAAuthenticationLibrary();
    v2 = dlsym(v3, "HSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifier");
    v6[3] = (uint64_t)v2;
    getHSAAuthenticationRegisterIncomingAuthenticationTokenBlockWithIdentifierSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  ((void (*)(id, const __CFString *))v2)(v1, CFSTR("KeychainSyncSMSValidation"));

}

Class __getCDPAccountClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreCDPLibrary();
  result = objc_getClass("CDPAccount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCDPAccountClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCDPAccountClass_block_invoke_cold_1();
    return (Class)CoreCDPLibrary();
  }
  return result;
}

uint64_t CoreCDPLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CoreCDPLibraryCore_frameworkLibrary_0)
    CoreCDPLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = CoreCDPLibraryCore_frameworkLibrary_0;
  if (!CoreCDPLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCDPKeychainSyncClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreCDPLibrary();
  result = objc_getClass("CDPKeychainSync");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCDPKeychainSyncClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCDPKeychainSyncClass_block_invoke_cold_1();
    return __getSecureBackupClass_block_invoke(v3);
  }
  return result;
}

Class __getSecureBackupClass_block_invoke(uint64_t a1)
{
  Class result;

  CloudServicesLibrary_0();
  result = objc_getClass("SecureBackup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSecureBackupClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSecureBackupClass_block_invoke_cold_1();
    return (Class)CloudServicesLibrary_0();
  }
  return result;
}

uint64_t CloudServicesLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!CloudServicesLibraryCore_frameworkLibrary_1)
    CloudServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = CloudServicesLibraryCore_frameworkLibrary_1;
  if (!CloudServicesLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCDPContextClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreCDPLibrary();
  result = objc_getClass("CDPContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCDPContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCDPContextClass_block_invoke_cold_1();
    return (Class)__getCDPStateControllerClass_block_invoke_0(v3);
  }
  return result;
}

Class __getCDPStateControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreCDPLibrary();
  result = objc_getClass("CDPStateController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCDPStateControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCDPStateControllerClass_block_invoke_cold_1();
    return (Class)__getCDPUIControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getCDPUIControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreCDPUILibraryCore_frameworkLibrary)
  {
    CoreCDPUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreCDPUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CDPUIController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCDPUIControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getCDPUIControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAppleIDAuthenticationInAppContextClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AuthKitUILibraryCore_frameworkLibrary_0)
  {
    AuthKitUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!AuthKitUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AKAppleIDAuthenticationInAppContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1();
    free(v3);
  }
  getAKAppleIDAuthenticationInAppContextClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AuthKitLibrary_0();
  result = objc_getClass("AKAppleIDAuthenticationController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return (Class)AuthKitLibrary_0();
  }
  return result;
}

uint64_t AuthKitLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!AuthKitLibraryCore_frameworkLibrary_1)
    AuthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = AuthKitLibraryCore_frameworkLibrary_1;
  if (!AuthKitLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t HSAAuthenticationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!HSAAuthenticationLibraryCore_frameworkLibrary)
    HSAAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = HSAAuthenticationLibraryCore_frameworkLibrary;
  if (!HSAAuthenticationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getFTDeviceSupportClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FTServicesLibraryCore_frameworkLibrary)
  {
    FTServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FTServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FTDeviceSupport");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFTDeviceSupportClass_block_invoke_cold_1();
    free(v3);
  }
  getFTDeviceSupportClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A387945C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCommerceRemoteUIDelegateClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UsageSettingsLibraryCore_frameworkLibrary)
  {
    UsageSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UsageSettingsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CommerceRemoteUIDelegate");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getCommerceRemoteUIDelegateClass_block_invoke_cold_1();
    free(v3);
  }
  getCommerceRemoteUIDelegateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCommerceOffersSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (iCloudQuotaUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)iCloudQuotaUILibraryCore_frameworkLibrary;
  }
  else
  {
    iCloudQuotaUILibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)iCloudQuotaUILibraryCore_frameworkLibrary;
    if (!iCloudQuotaUILibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CommerceOffers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCommerceOffersSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A387A370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A387DE28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1A387F16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A387FA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1A3880598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3882F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A38838FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A3883E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1A38861DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3887684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1A38885F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1A3889958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

id getOBPrivacyPresenterClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getOBPrivacyPresenterClass_softClass_0;
  v7 = getOBPrivacyPresenterClass_softClass_0;
  if (!getOBPrivacyPresenterClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getOBPrivacyPresenterClass_block_invoke_0;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getOBPrivacyPresenterClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A388B178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBPrivacyPresenterClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    OnBoardingKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("OBPrivacyPresenter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
    free(v3);
  }
  getOBPrivacyPresenterClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A388CF50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PSMigrateSoundsDefaults_10_0()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  _PSLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "Migrating sounds defaults if needed", v2, 2u);
  }

  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "_migrateKey:domain:toKey:toDomain:migrateCloud:", CFSTR("lock-unlock"), CFSTR("com.apple.springboard"), CFSTR("lock-audio"), CFSTR("com.apple.preferences.sounds"), 1);
  objc_msgSend(v1, "_migrateKey:domain:toKey:toDomain:migrateCloud:", CFSTR("keyboard"), CFSTR("com.apple.preferences.sounds"), CFSTR("keyboard-audio"), CFSTR("com.apple.preferences.sounds"), 0);
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.preferences.sounds"));

}

id SearchSpecifiersFromPlist(void *a1, void *a2, void *a3, void *a4)
{
  return SearchSpecifiersFromPlistWithCapabilities(a1, a2, a3, a4, 1);
}

id AlignmentFromString(void *a1)
{
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UITextAlignmentCenter")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("NSCenterTextAlignment")) & 1) != 0
    || (objc_msgSend(v1, "lowercaseString"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("center")),
        v2,
        (v3 & 1) != 0))
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UITextAlignmentLeft")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("NSLeftTextAlignment")) & 1) != 0
         || (objc_msgSend(v1, "lowercaseString"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("left")),
             v7,
             (v8 & 1) != 0))
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UITexitAlignmentRight")) & 1) != 0)
  {
    v4 = 3;
  }
  else
  {
    v4 = 3;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NSRightTextAlignment")) & 1) == 0)
    {
      objc_msgSend(v1, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("right"));

      if (v10)
        v4 = 3;
      else
        v4 = 0xFFFFFFFFLL;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1A3890F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id bundleIdentifiersWithPickerAccess()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getCNPrivateAccessAggregatorClass_softClass;
  v9 = getCNPrivateAccessAggregatorClass_softClass;
  if (!getCNPrivateAccessAggregatorClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getCNPrivateAccessAggregatorClass_block_invoke;
    v5[3] = &unk_1E4A65650;
    v5[4] = &v6;
    __getCNPrivateAccessAggregatorClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "allLoggedBundledIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1A38918C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3891E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNLimitedAccessContactPickerViewControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCNLimitedAccessContactPickerViewControllerClass_softClass;
  v7 = getCNLimitedAccessContactPickerViewControllerClass_softClass;
  if (!getCNLimitedAccessContactPickerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getCNLimitedAccessContactPickerViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A389253C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3892818(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void PSContactsAuthorizationStatesForService(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)tcc_server_create();
  tcc_service_singleton_for_CF_name();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  _PSLoggingFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = a1;
    _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "Requesting TCC auth records for service: %@", buf, 0xCu);
  }

  v17 = MEMORY[0x1E0C809B0];
  v14 = v10;
  v18 = v14;
  v15 = v11;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  tcc_server_message_get_authorization_records_by_service();
  if (a2)
    *a2 = (id)objc_msgSend(v14, "copy", v17, 3221225472, __PSContactsAuthorizationStatesForService_block_invoke, &unk_1E4A66B98, v14, v15, v16, a1);
  if (a3)
    *a3 = (id)objc_msgSend(v15, "copy");
  if (v16)
    *a4 = (id)objc_msgSend(v16, "copy");

}

uint64_t ContactsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!ContactsLibraryCore_frameworkLibrary)
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ContactsLibraryCore_frameworkLibrary;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getCNPrivateAccessAggregatorClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNPrivateAccessAggregator");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNPrivateAccessAggregatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNPrivateAccessAggregatorClass_block_invoke_cold_1();
    ContactsUILibrary();
  }
}

void ContactsUILibrary()
{
  void *v0;

  if (!ContactsUILibraryCore_frameworkLibrary)
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsLibrary();
  result = objc_getClass("CNContactStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNContactStoreClass_block_invoke_cold_1();
    return (Class)__getCNLimitedAccessContactPickerViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getCNLimitedAccessContactPickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsUILibrary();
  result = objc_getClass("CNLimitedAccessContactPickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNLimitedAccessContactPickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    v3 = __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1();
    return (Class)__PSContactsAuthorizationStatesForService_block_invoke(v3);
  }
  return result;
}

id getkSecureBackupMetadataKey_0()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSecureBackupMetadataKeySymbolLoc_ptr_1;
  v7 = getkSecureBackupMetadataKeySymbolLoc_ptr_1;
  if (!getkSecureBackupMetadataKeySymbolLoc_ptr_1)
  {
    v1 = (void *)CloudServicesLibrary_1();
    v0 = (id *)dlsym(v1, "kSecureBackupMetadataKey");
    v5[3] = (uint64_t)v0;
    getkSecureBackupMetadataKeySymbolLoc_ptr_1 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getSecureBackupClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSecureBackupClass_softClass_0;
  v7 = getSecureBackupClass_softClass_0;
  if (!getSecureBackupClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSecureBackupClass_block_invoke_0;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getSecureBackupClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A3896BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3897BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CloudServicesLibrary_1()
{
  uint64_t v0;
  void *v2;

  if (!CloudServicesLibraryCore_frameworkLibrary_2)
    CloudServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  v0 = CloudServicesLibraryCore_frameworkLibrary_2;
  if (!CloudServicesLibraryCore_frameworkLibrary_2)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

PSSpecifierController *__getSecureBackupClass_block_invoke_0(uint64_t a1)
{
  PSSpecifierController *result;
  PSSpecifierController *v3;
  SEL v4;

  CloudServicesLibrary_1();
  result = (PSSpecifierController *)objc_getClass("SecureBackup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSecureBackupClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (PSSpecifierController *)__getSecureBackupClass_block_invoke_cold_1_0();
    return -[PSSpecifierController init](v3, v4);
  }
  return result;
}

void sub_1A389856C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3898670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(v10);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A3898A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A3898B80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PSStringForMinutes(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (!PSStringForMinutes_singular)
  {
    PS_LocalizedString(CFSTR("%@ minute"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)PSStringForMinutes_singular;
    PSStringForMinutes_singular = v2;

    PS_LocalizedString(CFSTR("%@ minutes"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)PSStringForMinutes_plural;
    PSStringForMinutes_plural = v4;

    PS_LocalizedString(CFSTR("0 minutes"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)PSStringForMinutes_zero;
    PSStringForMinutes_zero = v6;

  }
  if ((_DWORD)a1 == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = PSStringForMinutes_singular;
    v10 = (void *)MEMORY[0x1E0CB37F0];
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    if ((_DWORD)a1)
    {
      v9 = PSStringForMinutes_plural;
      v10 = (void *)MEMORY[0x1E0CB37F0];
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = a1;
    }
    else
    {
      v9 = PSStringForMinutes_zero;
      v10 = (void *)MEMORY[0x1E0CB37F0];
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = 0;
    }
  }
  objc_msgSend(v11, "numberWithUnsignedInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id PSStringForMins(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = PSStringForMins_unit;
  if (!PSStringForMins_unit)
  {
    PS_LocalizedString(CFSTR("%@ min"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)PSStringForMins_unit;
    PSStringForMins_unit = v3;

    v2 = PSStringForMins_unit;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromNumber:numberStyle:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id PSStringForHours(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (!PSStringForHours_singular)
  {
    PS_LocalizedString(CFSTR("%@ hour"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)PSStringForHours_singular;
    PSStringForHours_singular = v2;

    PS_LocalizedString(CFSTR("%@ hours"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)PSStringForHours_plural;
    PSStringForHours_plural = v4;

    PS_LocalizedString(CFSTR("0 hours"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)PSStringForHours_zero;
    PSStringForHours_zero = v6;

  }
  if ((_DWORD)a1 == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = PSStringForHours_singular;
    v10 = (void *)MEMORY[0x1E0CB37F0];
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    if ((_DWORD)a1)
    {
      v9 = PSStringForHours_plural;
      v10 = (void *)MEMORY[0x1E0CB37F0];
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = a1;
    }
    else
    {
      v9 = PSStringForHours_zero;
      v10 = (void *)MEMORY[0x1E0CB37F0];
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = 0;
    }
  }
  objc_msgSend(v11, "numberWithUnsignedInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id PSStringForDays(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (!PSStringForDays_singular)
  {
    PS_LocalizedString(CFSTR("%@ day"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)PSStringForDays_singular;
    PSStringForDays_singular = v2;

    PS_LocalizedString(CFSTR("%@ days"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)PSStringForDays_plural;
    PSStringForDays_plural = v4;

    PS_LocalizedString(CFSTR("0 days"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)PSStringForDays_zero;
    PSStringForDays_zero = v6;

  }
  if ((_DWORD)a1 == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = PSStringForDays_singular;
    v10 = (void *)MEMORY[0x1E0CB37F0];
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    if ((_DWORD)a1)
    {
      v9 = PSStringForDays_plural;
      v10 = (void *)MEMORY[0x1E0CB37F0];
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = a1;
    }
    else
    {
      v9 = PSStringForDays_zero;
      v10 = (void *)MEMORY[0x1E0CB37F0];
      v11 = (void *)MEMORY[0x1E0CB37E8];
      v12 = 0;
    }
  }
  objc_msgSend(v11, "numberWithUnsignedInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id PSFormattedTimeString(int a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (a1 / 60);
  if ((a1 / 60) > 0x3B)
  {
    v4 = v2 / 0x3CuLL;
    v5 = v2 % 0x3C;
    v6 = (void *)MEMORY[0x1E0CB3940];
    PS_LocalizedString(CFSTR("%@, %@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForHours(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForMinutes(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PSStringForMinutes(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id PSAbbreviatedFormattedTimeString(int a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (a1 / 60);
  if ((a1 / 60) > 0x3B)
  {
    v4 = v2 / 0x3CuLL;
    v5 = v2 % 0x3C;
    v6 = (void *)MEMORY[0x1E0CB3940];
    PS_LocalizedString(CFSTR("%@, %@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForHours(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForMins(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PSStringForMins(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id PSFormattedTimeStringWithDays(int a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (a1 / 86400);
  v2 = a1 % 86400;
  if ((_DWORD)v1)
  {
    v3 = (v2 / 3600);
    v4 = (void *)MEMORY[0x1E0CB3940];
    PS_LocalizedString(CFSTR("%@, %@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForDays(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForHours(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PSFormattedTimeString(v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

id PSAbbreviatedFormattedTimeStringWithDays(int a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (a1 / 86400);
  v2 = a1 % 86400;
  if ((_DWORD)v1)
  {
    v3 = (v2 / 3600);
    v4 = (void *)MEMORY[0x1E0CB3940];
    PS_LocalizedString(CFSTR("%@, %@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForDays(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PSStringForHours(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PSAbbreviatedFormattedTimeString(v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

BOOL PSTimeStringIsShortened(int a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  float v12;
  void *v13;
  double v14;
  _BOOL8 v15;

  v3 = (void *)MEMORY[0x1E0CEA5E8];
  v4 = *MEMORY[0x1E0CEB538];
  v5 = a2;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8 + -20.0;

  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_legacy_sizeWithFont:", v6);
  v12 = v9 - v11 + -20.0 + -12.0;

  PSFormattedTimeString(a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_legacy_sizeWithFont:", v6);
  v15 = v14 > v12;

  return v15;
}

Class __getBFFStyleClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
  {
    SetupAssistantUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BFFStyle");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBFFStyleClass_block_invoke_cold_1();
    free(v3);
  }
  getBFFStyleClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A389A87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getDADaemonSessionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getDADaemonSessionClass_softClass;
  v7 = getDADaemonSessionClass_softClass;
  if (!getDADaemonSessionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getDADaemonSessionClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getDADaemonSessionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A389A938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A389B0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getDADaemonSessionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!DeviceAccessLibraryCore_frameworkLibrary)
  {
    DeviceAccessLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!DeviceAccessLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("DADaemonSession");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getDADaemonSessionClass_block_invoke_cold_1();
    free(v3);
  }
  getDADaemonSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A389BB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A389C418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A389DC18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1A389DD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

id PSDescriptionForHealthAnalyticsFileWithName(void *a1)
{
  id v1;
  void (*v2)(id);
  void *v3;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (void (*)(id))getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr;
  v10 = getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr;
  if (!getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getHKDescriptionForAnalyticsFileWithNameSymbolLoc_block_invoke;
    v6[3] = &unk_1E4A65650;
    v6[4] = &v7;
    __getHKDescriptionForAnalyticsFileWithNameSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v2(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void *__getHKDescriptionForAnalyticsFileWithNameSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (HealthKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
  }
  else
  {
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)HealthKitLibraryCore_frameworkLibrary;
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "HKDescriptionForAnalyticsFileWithName");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getHKDescriptionForAnalyticsFileWithNameSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A389F604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFKPrivacySettingsControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FinanceKitLibraryCore_frameworkLibrary)
  {
    FinanceKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FinanceKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FKPrivacySettingsController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFKPrivacySettingsControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getFKPrivacySettingsControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A38A096C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A38A11CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1A38A1DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getMOApprovedApplicationsManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
  {
    MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MOApprovedApplicationsManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMOApprovedApplicationsManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getMOApprovedApplicationsManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SearchEntriesFromSpecifiers(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v25 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "cellType", v24);
          if (!v15)
          {
            v16 = v14;

            v11 = v16;
          }
          SearchEntryFromSpecifier(v14, v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "setPlistName:", v25);
            if (v15)
            {
              objc_msgSend(v18, "setGroupSpecifier:", v11);
              objc_msgSend(v11, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(v11, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setGroupName:", v20);

                objc_msgSend(v18, "keywords");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "name");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "addObject:", v22);

              }
            }
            objc_msgSend(v7, "addObject:", v18);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v5 = v24;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id SearchEntriesFromManifest(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (SearchEntriesFromManifest_onceToken != -1)
    dispatch_once(&SearchEntriesFromManifest_onceToken, &__block_literal_global_61);
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("SettingsSearchManifest"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)SearchEntriesFromManifest_manifestCache, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)SearchEntriesFromManifest_manifestCache, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)SearchEntriesFromManifest_manifestCache, "setObject:forKeyedSubscript:", v7, v5);
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stringTable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v4, "bundlePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByDeletingPathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "specifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SearchSpecifiersFromPlist(v7, v16, v12, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v3;
    SearchEntriesFromSpecifiers(v17, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setManifestBundleName:", v15);
        }
        v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

    v3 = v23;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

PSSearchEntry *SearchEntryFromSpecifier(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  PSSearchEntry *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "identifier");
    v6 = (PSSearchEntry *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(v5, "cellType");

      if (v7)
      {
        objc_msgSend(v5, "propertyForKey:", CFSTR("searchable"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v8 || (objc_msgSend(v8, "BOOLValue") & 1) != 0)
        {

          v6 = -[PSSearchEntry initWithSpecifier:parent:]([PSSearchEntry alloc], "initWithSpecifier:parent:", v5, v4);
          objc_msgSend(v5, "propertyForKey:", CFSTR("searchBundle"));
          v5 = (id)objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            -[PSSearchEntry setBundleName:](v6, "setBundleName:", v5);
          }
          else
          {
            -[PSSearchEntry bundleName](v6, "bundleName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v11)
            {
              objc_msgSend(v4, "bundleName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[PSSearchEntry setBundleName:](v6, "setBundleName:", v12);

            }
          }
          goto LABEL_11;
        }

      }
      v6 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

id getDriverManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getDriverManagerClass_softClass;
  v7 = getDriverManagerClass_softClass;
  if (!getDriverManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getDriverManagerClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getDriverManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38A68CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDriverManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!DriverManagementLibraryCore_frameworkLibrary)
  {
    DriverManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!DriverManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("DriverManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getDriverManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getDriverManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A38A7D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

uint64_t PSSearchInlineTogglesEnabled()
{
  void *v0;
  int AppBooleanValue;
  BOOL v2;
  uint64_t v3;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "sf_isInternalInstall"))
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PSSearchShowToggles"), CFSTR("com.apple.Preferences"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v2 = AppBooleanValue == 0;
    else
      v2 = 1;
    v3 = !v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1A38A9B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1A38AA3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A38AA5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A38AA74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PSConnected298()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "connectedDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v5, "productId") == 8206 && objc_msgSend(v5, "vendorId") == 76)
        {
          v2 = v5;
          goto LABEL_12;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

id PSConnected698()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "connectedDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v5, "productId") == 8212 || objc_msgSend(v5, "productId") == 8228)
          && objc_msgSend(v5, "vendorId") == 76)
        {
          v2 = v5;
          goto LABEL_13;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_13:

  return v2;
}

uint64_t PSBTAccessoryListeningMode(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  int ControlCommand;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0D03410];
  v2 = a1;
  objc_msgSend(v1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessoryManager");
  objc_msgSend(v2, "device");

  ControlCommand = BTAccessoryManagerGetControlCommand();
  if (ControlCommand)
  {
    _PSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = ControlCommand;
      _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Failed to get listening mode : %d", buf, 8u);
    }

  }
  _PSLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = 0;
    _os_log_impl(&dword_1A3819000, v6, OS_LOG_TYPE_DEFAULT, "listening mode : %d", buf, 8u);
  }

  return 0;
}

void PSBTSetAccessoryListeningMode(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0D03410];
  v2 = a1;
  objc_msgSend(v1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessoryManager");
  objc_msgSend(v2, "device");

  v4 = BTAccessoryManagerSendControlCommand();
  if (v4)
  {
    _PSLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "Failed to set listening mode : %d", (uint8_t *)v6, 8u);
    }

  }
}

uint64_t PSWiFiManagerClientCreate(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getWiFiManagerClientCreateSymbolLoc_ptr;
  v9 = getWiFiManagerClientCreateSymbolLoc_ptr;
  if (!getWiFiManagerClientCreateSymbolLoc_ptr)
  {
    v3 = (void *)MobileWiFiLibrary();
    v2 = dlsym(v3, "WiFiManagerClientCreate");
    v7[3] = (uint64_t)v2;
    getWiFiManagerClientCreateSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(uint64_t, _QWORD))v2)(a1, 0);
}

uint64_t PSWiFiManagerClientScheduleWithRunLoop(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr;
  v13 = getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr;
  if (!getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr)
  {
    v7 = (void *)MobileWiFiLibrary();
    v6 = dlsym(v7, "WiFiManagerClientScheduleWithRunLoop");
    v11[3] = (uint64_t)v6;
    getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    v9 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t PSWiFiManagerClientCopyDevices(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  v9 = getWiFiManagerClientCopyDevicesSymbolLoc_ptr;
  if (!getWiFiManagerClientCopyDevicesSymbolLoc_ptr)
  {
    v3 = (void *)MobileWiFiLibrary();
    v2 = dlsym(v3, "WiFiManagerClientCopyDevices");
    v7[3] = (uint64_t)v2;
    getWiFiManagerClientCopyDevicesSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t PSWiFiDeviceClientGetPower(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getWiFiDeviceClientGetPowerSymbolLoc_ptr;
  v9 = getWiFiDeviceClientGetPowerSymbolLoc_ptr;
  if (!getWiFiDeviceClientGetPowerSymbolLoc_ptr)
  {
    v3 = (void *)MobileWiFiLibrary();
    v2 = dlsym(v3, "WiFiDeviceClientGetPower");
    v7[3] = (uint64_t)v2;
    getWiFiDeviceClientGetPowerSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t PSWiFiManagerClientUnscheduleFromRunLoop(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
  v13 = getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr;
  if (!getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr)
  {
    v7 = (void *)MobileWiFiLibrary();
    v6 = dlsym(v7, "WiFiManagerClientUnscheduleFromRunLoop");
    v11[3] = (uint64_t)v6;
    getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    v9 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t PSWiFiManagerClientSetMISDiscoveryState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr;
  v13 = getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr;
  if (!getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr)
  {
    v7 = (void *)MobileWiFiLibrary();
    v6 = dlsym(v7, "WiFiManagerClientSetMISDiscoveryState");
    v11[3] = (uint64_t)v6;
    getWiFiManagerClientSetMISDiscoveryStateSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    v9 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t PSBKSDisplayBrightnessGetCurrent()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  v8 = getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr)
  {
    v1 = (void *)BackBoardServicesLibrary();
    v0 = dlsym(v1, "BKSDisplayBrightnessGetCurrent");
    v6[3] = (uint64_t)v0;
    getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

uint64_t PSBKSDisplayBrightnessSet(float a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getBKSDisplayBrightnessSetSymbolLoc_ptr;
  v9 = getBKSDisplayBrightnessSetSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessSetSymbolLoc_ptr)
  {
    v3 = (void *)BackBoardServicesLibrary();
    v2 = dlsym(v3, "BKSDisplayBrightnessSet");
    v7[3] = (uint64_t)v2;
    getBKSDisplayBrightnessSetSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(uint64_t, float))v2)(1, a1);
}

void _BrightnessChangedExternally()
{
  uint64_t (**v0)(void);
  void (**v1)(void);
  id v2;

  +[PSBrightnessController sharedController](PSBrightnessController, "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isTracking");
  v0 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  if ((v0[2]() & 1) == 0)
  {
    objc_msgSend(v2, "brightnessChangedExternally");
    v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v1[2]();

  }
}

uint64_t PSPreferencesLaunchURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root="));
}

uint64_t MobileWiFiLibrary()
{
  uint64_t v0;
  void *v2;

  if (!MobileWiFiLibraryCore_frameworkLibrary)
    MobileWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MobileWiFiLibraryCore_frameworkLibrary;
  if (!MobileWiFiLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t NetrbLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NetrbLibraryCore_frameworkLibrary)
    NetrbLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NetrbLibraryCore_frameworkLibrary;
  if (!NetrbLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getAXGuidedAccessGetAvailabilitySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
  }
  else
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXGuidedAccessGetAvailability");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXGuidedAccessGetAvailabilitySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BackBoardServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!BackBoardServicesLibraryCore_frameworkLibrary)
    BackBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = BackBoardServicesLibraryCore_frameworkLibrary;
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1A38AE220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVSAccountStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VideoSubscriberAccountLibraryCore_frameworkLibrary)
  {
    VideoSubscriberAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!VideoSubscriberAccountLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VSAccountStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVSAccountStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getVSAccountStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id CreateRangeTitleLabel()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  double v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBackgroundColor:", v1);

  +[PSListController appearance](PSListController, "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTextColor:", v3);

  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v4) = 1144750080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  return v0;
}

id CreateRangeTimeLabel()
{
  id v0;
  void *v1;
  void *v2;
  double v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(MEMORY[0x1E0CEA478], "tableCellBlueTextColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTextColor:", v1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBackgroundColor:", v2);

  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v3) = 1144750080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 0, v3);
  return v0;
}

id PSStockholmLocallyStoredValuePassNames()
{
  void *v0;
  objc_class *PKPassLibraryClass;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassLibraryClass = (objc_class *)getPKPassLibraryClass();
  if (-[objc_class isPassLibraryAvailable](PKPassLibraryClass, "isPassLibraryAvailable"))
  {
    v2 = objc_alloc_init(PKPassLibraryClass);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v2, "paymentPassesWithLocallyStoredValue", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "localizedDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(v0, "addObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  return v0;
}

id PSLocalizableStockholmStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E4A69238, CFSTR("Payment_Prefs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1A38AF188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBTextWelcomeControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
  {
    OnBoardingKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("OBTextWelcomeController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getOBTextWelcomeControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getOBTextWelcomeControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A38AF7B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getQuotaRequestManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UsageSettingsLibraryCore_frameworkLibrary_0)
  {
    UsageSettingsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!UsageSettingsLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("QuotaRequestManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getQuotaRequestManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getQuotaRequestManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PSStorageLocStr(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSPhotosPolicyBundleIdentifiersWithRecentPickerUsage()
{
  void *v0;
  double v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
    v1 = 2592000.0;
  else
    v1 = 86400.0;
  objc_msgSend(getPLPrivacyClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosPickerPresentedLibraryLogsByClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        getPLPhotosPickerLogClientBundleIdentifierKey();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        getPLPhotosPickerLogPresentedTimestampKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "timeIntervalSinceNow");
        if (v14 <= 0.0 && v1 > -v14)
          objc_msgSend(v0, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v16 = (void *)objc_msgSend(v0, "copy");
  return v16;
}

id getPLPrivacyClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPLPrivacyClass_softClass;
  v7 = getPLPrivacyClass_softClass;
  if (!getPLPrivacyClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPLPrivacyClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getPLPrivacyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38B3038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPLPhotosPickerLogClientBundleIdentifierKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr;
  v7 = getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr;
  if (!getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr)
  {
    v1 = (void *)PhotoLibraryServicesCoreLibrary();
    v0 = (id *)dlsym(v1, "PLPhotosPickerLogClientBundleIdentifierKey");
    v5[3] = (uint64_t)v0;
    getPLPhotosPickerLogClientBundleIdentifierKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getPLPhotosPickerLogPresentedTimestampKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr;
  v7 = getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr;
  if (!getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr)
  {
    v1 = (void *)PhotoLibraryServicesCoreLibrary();
    v0 = (id *)dlsym(v1, "PLPhotosPickerLogPresentedTimestampKey");
    v5[3] = (uint64_t)v0;
    getPLPhotosPickerLogPresentedTimestampKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void PSPXTCCSettingsLimitedAccessSubtitle(void *a1)
{
  id v1;
  void (*PXTCCSettingsLimitedAccessSubtitleSymbolLoc)(id);
  void *v3;
  id v4;
  PSPhotoServicesAuthorizationLevelController *v5;
  SEL v6;
  id v7;

  v1 = a1;
  PXTCCSettingsLimitedAccessSubtitleSymbolLoc = (void (*)(id))getPXTCCSettingsLimitedAccessSubtitleSymbolLoc();
  if (PXTCCSettingsLimitedAccessSubtitleSymbolLoc)
  {
    PXTCCSettingsLimitedAccessSubtitleSymbolLoc(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v3;
  }
  else
  {
    v5 = (PSPhotoServicesAuthorizationLevelController *)PSPNCreateFormattedStringWithCountry_cold_1();
    -[PSPhotoServicesAuthorizationLevelController setSpecifier:](v5, v6, v7);
  }
}

void sub_1A38B39C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A38B4A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPLPrivacyClass_block_invoke(uint64_t a1)
{
  Class result;

  PhotoLibraryServicesCoreLibrary();
  result = objc_getClass("PLPrivacy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPLPrivacyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPLPrivacyClass_block_invoke_cold_1();
    return (Class)PhotoLibraryServicesCoreLibrary();
  }
  return result;
}

uint64_t PhotoLibraryServicesCoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
    PhotoLibraryServicesCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhotoLibraryServicesCoreLibraryCore_frameworkLibrary;
  if (!PhotoLibraryServicesCoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getPXTCCSettingsFullAccessSubtitleSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  v6 = getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr)
  {
    v1 = (void *)PhotosUICoreLibrary_0();
    v0 = dlsym(v1, "PXTCCSettingsFullAccessSubtitle");
    v4[3] = (uint64_t)v0;
    getPXTCCSettingsFullAccessSubtitleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A38B5DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PhotosUICoreLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!PhotosUICoreLibraryCore_frameworkLibrary_0)
    PhotosUICoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = PhotosUICoreLibraryCore_frameworkLibrary_0;
  if (!PhotosUICoreLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getPXTCCSettingsLimitedAccessSubtitleSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  v6 = getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr;
  if (!getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr)
  {
    v1 = (void *)PhotosUICoreLibrary_0();
    v0 = dlsym(v1, "PXTCCSettingsLimitedAccessSubtitle");
    v4[3] = (uint64_t)v0;
    getPXTCCSettingsLimitedAccessSubtitleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A38B5F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t gettcc_server_message_prompt_authorization_valueSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  v6 = gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr;
  if (!gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke;
    v2[3] = &unk_1E4A65650;
    v2[4] = &v3;
    __gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A38B5FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__gettcc_server_message_prompt_authorization_valueSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (TCCLibraryCore_frameworkLibrary)
  {
    v2 = (void *)TCCLibraryCore_frameworkLibrary;
  }
  else
  {
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)TCCLibraryCore_frameworkLibrary;
    if (!TCCLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "tcc_server_message_prompt_authorization_value");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  gettcc_server_message_prompt_authorization_valueSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void sub_1A38B8224(_Unwind_Exception *a1)
{
  __30__PSAccountEnumerator_dealloc__block_invoke();
  _Unwind_Resume(a1);
}

void sub_1A38B8520(_Unwind_Exception *a1)
{
  __39__PSAccountEnumerator_accountWasAdded___block_invoke();
  _Unwind_Resume(a1);
}

void sub_1A38B8768(_Unwind_Exception *a1)
{
  __41__PSAccountEnumerator_accountWasRemoved___block_invoke();
  _Unwind_Resume(a1);
}

void sub_1A38B89B0(_Unwind_Exception *a1)
{
  __42__PSAccountEnumerator_accountWasModified___block_invoke();
  _Unwind_Resume(a1);
}

void sub_1A38B93A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A38BA41C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1A38BAF34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a15)
    (*(void (**)(void))(a15 + 16))();
  _Unwind_Resume(exception_object);
}

void sub_1A38BAF68(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1A38BAF44);
}

id getNudityDetectionPreferencesHelperClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getNudityDetectionPreferencesHelperClass_softClass;
  v7 = getNudityDetectionPreferencesHelperClass_softClass;
  if (!getNudityDetectionPreferencesHelperClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getNudityDetectionPreferencesHelperClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getNudityDetectionPreferencesHelperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38BB47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A38BB898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACActivityAuthorizationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getACActivityAuthorizationClass_softClass;
  v7 = getACActivityAuthorizationClass_softClass;
  if (!getACActivityAuthorizationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getACActivityAuthorizationClass_block_invoke;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getACActivityAuthorizationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38BBA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A38BBF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A38BC798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFOAuthorizationCenterClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getFOAuthorizationCenterClass_softClass_0;
  v7 = getFOAuthorizationCenterClass_softClass_0;
  if (!getFOAuthorizationCenterClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getFOAuthorizationCenterClass_block_invoke_0;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getFOAuthorizationCenterClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38BCAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A38BCD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1A38BD914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A38BEFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A38BF878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_1A38BFB8C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1A38C098C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 96), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A38C1BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A38C209C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPRSettingsProviderClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPRSettingsProviderClass_softClass_0;
  v7 = getPRSettingsProviderClass_softClass_0;
  if (!getPRSettingsProviderClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPRSettingsProviderClass_block_invoke_0;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getPRSettingsProviderClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38C2738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBBObserverClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!BulletinBoardLibraryCore_frameworkLibrary_0)
  {
    BulletinBoardLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!BulletinBoardLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BBObserver");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBBObserverClass_block_invoke_cold_1();
    free(v3);
  }
  getBBObserverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNudityDetectionPreferencesHelperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
  {
    CommunicationSafetySettingsUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CommunicationSafetySettingsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NudityDetectionPreferencesHelper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNudityDetectionPreferencesHelperClass_block_invoke_cold_1();
    free(v3);
  }
  getNudityDetectionPreferencesHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getACActivityCenterClass_block_invoke(uint64_t a1)
{
  ActivityKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ACActivityCenter");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getACActivityCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getACActivityCenterClass_block_invoke_cold_1();
    ActivityKitLibrary();
  }
}

void ActivityKitLibrary()
{
  void *v0;

  if (!ActivityKitLibraryCore_frameworkLibrary)
    ActivityKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ActivityKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getACActivityAuthorizationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ActivityKitLibrary();
  result = objc_getClass("ACActivityAuthorization");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getACActivityAuthorizationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getACActivityAuthorizationClass_block_invoke_cold_1();
    return (Class)__getPSAppCellularUsageSpecifierClass_block_invoke(v3);
  }
  return result;
}

Class __getPSAppCellularUsageSpecifierClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SettingsCellularLibraryCore_frameworkLibrary)
  {
    SettingsCellularLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SettingsCellularLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PSAppCellularUsageSpecifier");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPSAppCellularUsageSpecifierClass_block_invoke_cold_1();
    free(v3);
  }
  getPSAppCellularUsageSpecifierClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getFOAuthorizationCenterClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FamilyControlsObjCLibraryCore_frameworkLibrary_0)
  {
    FamilyControlsObjCLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!FamilyControlsObjCLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FOAuthorizationCenter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFOAuthorizationCenterClass_block_invoke_cold_1_0();
    free(v3);
  }
  getFOAuthorizationCenterClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getADTrackingTransparencyClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LimitAdTrackingLibraryCore_frameworkLibrary)
  {
    LimitAdTrackingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LimitAdTrackingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ADTrackingTransparency");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getADTrackingTransparencyClass_block_invoke_cold_1();
    free(v3);
  }
  getADTrackingTransparencyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDOCDocumentSourceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  if (!DocumentManagerLibrary_frameworkLibrary)
    DocumentManagerLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DocumentManager.framework/DocumentManager", 2);
  result = objc_getClass("DOCDocumentSource");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getDOCDocumentSourceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getDOCDocumentSourceClass_block_invoke_cold_1();
    return (Class)__getPRSettingsProviderClass_block_invoke_0(v3);
  }
  return result;
}

Class __getPRSettingsProviderClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ProximityReaderLibraryCore_frameworkLibrary_0)
  {
    ProximityReaderLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!ProximityReaderLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PRSettingsProvider");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPRSettingsProviderClass_block_invoke_cold_1_0();
    free(v3);
  }
  getPRSettingsProviderClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUIKCategoryFromSearchableItem(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
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
  uint64_t v14;

  v1 = a1;
  objc_msgSend(v1, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    SFObjectAndOffsetForURLPair();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("#"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("&"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("="));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "lastObject");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("ROOT")))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offsetItem"));
      v14 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v14;
    }
    if (!v3)
      v3 = &stru_1E4A69238;

  }
  return v3;
}

void sub_1A38C8B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A38C9478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A38C9F50(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 256));
  _Unwind_Resume(a1);
}

id getOBPrivacyPresenterClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getOBPrivacyPresenterClass_softClass_1;
  v7 = getOBPrivacyPresenterClass_softClass_1;
  if (!getOBPrivacyPresenterClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getOBPrivacyPresenterClass_block_invoke_1;
    v3[3] = &unk_1E4A65650;
    v3[4] = &v4;
    __getOBPrivacyPresenterClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A38CB3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBPrivacyPresenterClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary_2)
  {
    OnBoardingKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("OBPrivacyPresenter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
    free(v3);
  }
  getOBPrivacyPresenterClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PSSearchFormattedString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend(v1, "hasSuffix:", CFSTR(":")))
  {
    objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - 1);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A38CE5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result)
    _allocatedMem_2 += size;
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n)
      v4 = 0;
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result)
    _allocatedMem_3 += size;
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n)
      v4 = 0;
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  const char *v6;
  const char *v7;
  const char *v8;

  if (a2)
    _allocatedMem_0 += a3;
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v6 = "NULL";
    if (result)
      v7 = result;
    else
      v7 = "NULL";
    if (a4)
      v8 = a4;
    else
      v8 = "NULL";
    if (a6)
      v6 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (a2)
  {
    v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3)
      v6 = 0;
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v7 = "NULL";
    if (result)
      v8 = result;
    else
      v8 = "NULL";
    if (a4)
      v9 = a4;
    else
      v9 = "NULL";
    if (a6)
      v7 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, _QWORD *a7)
{
  uint64_t result;
  size_t v12;
  size_t v13;
  unsigned int v14;

  v14 = 0;
  result = 4294967293;
  if (a1 && __s1 && a7)
  {
    v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      v13 = v12;
      result = getLengthOfParameters(a5, a6, &v14);
      if (!(_DWORD)result)
        *a7 = v13 + v14 + 26;
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  if (a3)
  {
    *a3 = 0;
    v6 = 0;
    if (a2)
    {
      v7 = a2;
      while (1)
      {
        v8 = checkParameter(a1);
        if ((_DWORD)v8)
          break;
        v9 = v6 + 8;
        v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9))
          goto LABEL_10;
        a1 += 6;
        if (!--v7)
          goto LABEL_9;
      }
      v11 = v8;
      v12 = 70;
    }
    else
    {
LABEL_9:
      v11 = 0;
      *a3 = v6;
      v12 = 10;
    }
  }
  else
  {
LABEL_10:
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  uint64_t result;
  int v15;
  size_t v17;
  size_t v18;
  char *v19;
  size_t v20;
  unint64_t v21;

  v21 = 0;
  result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            v15 = a4;
            result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!(_DWORD)result)
            {
              if (*a8 < v21)
                return 4294967293;
              *a7 = *a1;
              v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                v20 = v18 + 22;
                result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!(_DWORD)result)
                  *a8 = v20;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  size_t v14;
  void *__src[2];
  size_t __n;

  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  v8 = 70;
  v9 = 4294967293;
  if (a3 && a4)
  {
    v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    v11 = v10 + 4;
    if ((_DWORD)v6)
    {
      v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        __n = *(_QWORD *)(a1 + 16);
        v12 = checkParameter(__src);
        if ((_DWORD)v12)
          break;
        v13 = (_DWORD *)(a3 + v11);
        v14 = __n;
        *v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if ((_DWORD)v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6)
          goto LABEL_11;
      }
      v9 = v12;
      v8 = 70;
    }
    else
    {
LABEL_11:
      v9 = 0;
      *a4 = v11;
      v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, BOOL *a5, _DWORD *a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  BOOL *v20;
  BOOL v21;
  _DWORD *v22;
  int v23;
  unint64_t v25;
  _QWORD *v26;
  unsigned int v27;
  unsigned int *v28;
  unint64_t v29;

  v28 = 0;
  v27 = 0;
  v8 = 4294967293;
  v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17)
      return 4294967293;
    v26 = a4;
    v18 = v17 + 1;
    v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19)
      return 4294967292;
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    v29 = v17 + 17;
    if (v17 + 17 == a2 || (v20 = a5, v21 = *(_BYTE *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      v8 = 4294967293;
    }
    else
    {
      v25 = v17 + 1;
      v22 = a8;
      v23 = *(_DWORD *)(a1 + v17 + 18);
      v29 = v17 + 22;
      v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!(_DWORD)v8)
      {
        *v26 = v19;
        *v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *v22 = v27;
        return v8;
      }
      v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28)
      Util_SafeDeallocParameters(v28, v27);
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, _QWORD *a4, _DWORD *a5)
{
  __objc2_prop_list **p_inst_props;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v24;
  _DWORD *v25;
  unint64_t *v26;
  int v27;

  p_inst_props = &OBJC_PROTOCOL___KeychainSyncPhoneSettingsFragmentDelegate.inst_props;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  v11 = 70;
  v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5)
    goto LABEL_25;
  v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    v16 = 0;
LABEL_24:
    v12 = 0;
    *a4 = v16;
    *a5 = v14;
    v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    v11 = 70;
    v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!(_DWORD)v14)
    goto LABEL_23;
  v27 = v14;
  v15 = 24 * v14;
  v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    v11 = 70;
    v12 = 4294967292;
    goto LABEL_25;
  }
  v24 = a4;
  v25 = a5;
  v26 = a3;
  v17 = 0;
  while (1)
  {
    v18 = &v16[v17];
    *(_QWORD *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (v19 = &v16[v17],
          v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      v11 = 70;
      v12 = 4294967293;
      goto LABEL_31;
    }
    v21 = checkParameter(&v16[v17]);
    if ((_DWORD)v21)
    {
      v12 = v21;
      v11 = 70;
      goto LABEL_31;
    }
    if ((_DWORD)v20)
      break;
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___KeychainSyncPhoneSettingsFragmentDelegate + 56);
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((_QWORD *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  v11 = 70;
  v12 = 4294967292;
LABEL_31:
  p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___KeychainSyncPhoneSettingsFragmentDelegate + 56);
LABEL_25:
  if (v11 >= *((unsigned __int8 *)p_inst_props + 1680))
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  v18 = 0;
  result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        result = getLengthOfParameters(a9, a10, &v18);
        if (!(_DWORD)result)
        {
          v15 = 29;
          if (a1 == 32)
            v15 = 33;
          v16 = v15 + a4;
          if (a1 == 32)
            v17 = a6;
          else
            v17 = 0;
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, _QWORD *a12)
{
  uint64_t result;
  BOOL v14;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  uint64_t v30;
  unsigned int v31;

  if (!a3)
    return 4294967293;
  result = 4294967293;
  if (a12)
    v14 = a11 == 0;
  else
    v14 = 1;
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    v31 = 0;
    result = getLengthOfParameters(a9, a10, &v31);
    if (!(_DWORD)result)
    {
      v21 = 29;
      if (a1 == 32)
        v21 = 33;
      v22 = v21 + a4;
      if (a1 == 32)
        v23 = a6;
      else
        v23 = 0;
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(_QWORD *)a11 = 0;
          *(_QWORD *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          v24 = v25 + a6;
        }
        v26 = a11 + v24;
        *(_BYTE *)v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        v30 = v24 + 5;
        result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!(_DWORD)result)
          *a12 = v30;
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, _QWORD *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, _QWORD *a11, _DWORD *a12)
{
  uint64_t v12;
  unint64_t v16;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  void *v25;
  BOOL v26;
  int v27;
  int v28;
  unint64_t v30;
  _QWORD *v31;
  unsigned int v32;
  unsigned int *v33;
  unint64_t v34;

  v33 = 0;
  v34 = 0;
  v32 = 0;
  v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    v16 = a3;
    *a4 = *(_OWORD *)a2;
    v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      v12 = 4294967293;
    }
    else
    {
      v20 = *(unsigned int *)(a2 + 16);
      v34 = 20;
      v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20)
          goto LABEL_24;
        memcpy(v21, (const void *)(a2 + 20), v20);
        v22 = v20 + 20;
        v34 = v20 + 20;
        v31 = a5;
        if (a1 != 32)
        {
          v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          v23 = *(unsigned int *)(a2 + v22);
          v24 = v20 + 24;
          v34 = v20 + 24;
          v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            v22 = v24 + v23;
            v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              v26 = *(_BYTE *)(a2 + v22) != 0;
              v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                v30 = v20;
                v27 = v23;
                v23 = (size_t)v25;
                v28 = *(_DWORD *)(a2 + v22 + 1);
                v34 = v22 + 5;
                v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!(_DWORD)v12)
                {
                  *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                v25 = (void *)v23;
                LODWORD(v23) = v27;
                v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        v12 = 4294967293;
        goto LABEL_26;
      }
      v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33)
    Util_SafeDeallocParameters(v33, v32);
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, _QWORD *a9)
{
  uint64_t result;
  unsigned int v12;

  v12 = 0;
  result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    result = getLengthOfParameters(a7, a8, &v12);
    if (!(_DWORD)result)
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  uint64_t result;
  BOOL v15;
  int v17;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v23 = 0;
  result = 4294967293;
  if (a2 && a3)
  {
    v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      v17 = a6;
      result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!(_DWORD)result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(_QWORD *)a9 = 0;
            *(_QWORD *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          v22 = v21 + 4;
          result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!(_DWORD)result)
            *a10 = v22;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, _QWORD *a6, unsigned int *a7, _DWORD *a8, _QWORD *a9, _DWORD *a10)
{
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  _QWORD *v13;
  unsigned int *v14;
  _DWORD *v15;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  size_t v20;
  unint64_t v21;
  _QWORD *v22;
  unsigned int *v23;
  _DWORD *v24;
  size_t v25;
  void *v26;
  void *v27;
  void *v28;
  _DWORD *v29;
  int v30;
  void *v32;
  _DWORD *v33;
  _QWORD *v34;
  unint64_t v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int *v39;
  unint64_t v40;

  v39 = 0;
  v40 = 0;
  v38 = 0;
  v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v11 = a4;
      if (a4)
      {
        v12 = a5;
        if (a5)
        {
          v13 = a6;
          if (a6)
          {
            v14 = a7;
            if (a7)
            {
              v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    v10 = 4294967293;
                  }
                  else
                  {
                    v18 = *(unsigned int *)(a1 + 16);
                    v40 = 20;
                    v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        v32 = 0;
                        v37 = 0;
                        v10 = 4294967293;
                      }
                      else
                      {
                        v20 = *(unsigned int *)(a1 + v18 + 20);
                        v21 = v18 + 24;
                        v40 = v18 + 24;
                        v37 = v20;
                        if (!(_DWORD)v20)
                        {
                          v36 = 0;
                          goto LABEL_20;
                        }
                        v33 = v12;
                        v34 = v11;
                        v22 = v13;
                        v23 = v14;
                        v24 = v15;
                        v25 = v20;
                        v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          v27 = v26;
                          v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            v40 = v21;
                            v15 = v24;
                            v14 = v23;
                            v13 = v22;
                            v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              v10 = 4294967293;
                            }
                            else
                            {
                              v35 = v18;
                              v28 = v19;
                              v29 = v15;
                              v30 = *(_DWORD *)(a1 + v21);
                              v40 = v21 + 4;
                              v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!(_DWORD)v10)
                              {
                                *v11 = v28;
                                *v12 = v35;
                                *v13 = v36;
                                *v14 = v37;
                                *v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              v19 = v28;
                              v18 = v35;
                            }
                            v32 = v36;
                            goto LABEL_32;
                          }
                          v10 = 4294967293;
                          v32 = v27;
                        }
                        else
                        {
                          v32 = 0;
                          v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39)
    Util_SafeDeallocParameters(v39, v38);
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (!a1)
    return result;
  if (!a2)
    return result;
  v5 = *a1;
  if (*a1 > 0x1Cu)
    return result;
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7)
      return result;
    *a2 = 24;
    v9 = a1[5];
    if ((_DWORD)v9)
    {
      v10 = a1 + 6;
      v11 = 24;
      do
      {
        result = GetSerializedRequirementSize(*v10, &v12);
        if ((_DWORD)result)
          break;
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  v6 = a1[4];
  if (!(_DWORD)v6)
    return 0;
  v7 = a1 + 5;
  v8 = 20;
  while (1)
  {
    result = GetSerializedRequirementSize(*v7, &v12);
    if ((_DWORD)result)
      break;
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6)
      return 0;
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!(_DWORD)result)
        {
          if (v12 > *a3)
            return 4294967293;
          *a2 = *(_OWORD *)a1;
          v7 = *a1;
          result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              v8 = a1[3] + 16;
LABEL_9:
              result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                v8 = 20;
                goto LABEL_9;
              }
              v9 = 0;
              v8 = 20;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4])
                  goto LABEL_9;
              }
            }
            else if (v7 == 7)
            {
              *((_QWORD *)a2 + 2) = *((_QWORD *)a1 + 2);
              if (!a1[5])
              {
                v8 = 24;
                goto LABEL_9;
              }
              v10 = 0;
              v8 = 24;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5])
                  goto LABEL_9;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  uint64_t v4;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              v10 = a1[3] + 16;
              if (v10 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!(_DWORD)v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              v13 = a1[4];
              if (8 * v13 + 20 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, v13, &__dst);
              if ((_DWORD)v11)
                goto LABEL_35;
              v14 = __dst;
              if (!__dst)
                return 4294967292;
              if (*((_DWORD *)__dst + 3) == 84)
              {
                v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  v10 = 20;
                  goto LABEL_11;
                }
                v16 = 0;
                v10 = 20;
                while (1)
                {
                  v21 = 0;
                  v22 = 0;
                  v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if ((_DWORD)v11)
                    goto LABEL_35;
                  *(_QWORD *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4])
                    goto LABEL_11;
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!(_DWORD)v11)
                {
                  v18 = __dst;
                  if (!__dst)
                    return 4294967292;
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    v4 = 4294967291;
                    goto LABEL_36;
                  }
                  v19 = *(_OWORD *)a1;
                  *((_QWORD *)__dst + 2) = *((_QWORD *)a1 + 2);
                  *v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    v10 = 24;
                    goto LABEL_11;
                  }
                  v20 = 0;
                  v10 = 24;
                  while (1)
                  {
                    v21 = 0;
                    v22 = 0;
                    v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if ((_DWORD)v11)
                      break;
                    *((_QWORD *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5])
                      goto LABEL_11;
                  }
                }
LABEL_35:
                v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst)
    Util_DeallocRequirement((int *)__dst);
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, _QWORD *a2)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result;
  unsigned int v6;
  size_t v8;

  result = 4294967293;
  if (__src && __dst && a3)
  {
    v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, _QWORD *a4)
{
  uint64_t v4;
  unsigned int v8;
  uint64_t v10;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    v8 = *a1;
    v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if ((_DWORD)v10 == 28)
          goto LABEL_7;
        return v4;
      case 2u:
        if ((_DWORD)v10 == 136)
          goto LABEL_7;
        return v4;
      case 3u:
        if ((_DWORD)v10 == 305)
          goto LABEL_7;
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!(_DWORD)v10)
          goto LABEL_7;
        return v4;
      case 7u:
        if ((_DWORD)v10 == 56)
          goto LABEL_7;
        return v4;
      case 9u:
        if ((_DWORD)v10 == 24)
          goto LABEL_7;
        return v4;
      case 0xAu:
        if ((_DWORD)v10 == 52)
          goto LABEL_7;
        return v4;
      case 0xCu:
      case 0xFu:
        if ((_DWORD)v10 == 8)
          goto LABEL_7;
        return v4;
      case 0xDu:
      case 0x15u:
        if ((_DWORD)v10 == 132)
          goto LABEL_7;
        return v4;
      case 0x11u:
        if ((_DWORD)v10 == 81)
          goto LABEL_7;
        return v4;
      case 0x12u:
        if ((_DWORD)v10 == 20)
          goto LABEL_7;
        return v4;
      case 0x14u:
        if ((_DWORD)v10 != 32)
          return v4;
LABEL_7:
        v4 = Util_AllocCredential(*a1, &__dst);
        if ((_DWORD)v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              v4 = 4294967293;
            }
            else
            {
              v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  uint64_t v2;
  void *__dst;

  __dst = 0;
  v2 = 4294967293;
  if (a1 && a2)
  {
    v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if ((_DWORD)v2)
    {
      if (__dst)
        Util_DeallocCredential(__dst);
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(_QWORD *__s1, _QWORD *__s2, _BYTE *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  size_t v8;
  _BOOL4 isNullOrEqualMem2;
  char *v13;
  char *v14;
  size_t v21;
  uint64_t v22;

  v3 = 4294967293;
  if (__s1)
  {
    v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          v7 = *((unsigned int *)__s1 + 7);
          if ((_DWORD)v7 == *((_DWORD *)__s2 + 7))
          {
            v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 44;
                v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8))
                  break;
                v8 = *((unsigned int *)__s1 + 9);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 9))
                  break;
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 13);
                v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)(v6 + 8);
                v14 = (char *)(v4 + 8);
                v21 = 24;
                v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 5);
                v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)v6 + 52;
                v14 = (char *)v4 + 52;
LABEL_74:
                v21 = 16;
                v22 = 16;
                goto LABEL_103;
              case 0xD:
                v8 = *((unsigned int *)__s1 + 8);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 8))
                  break;
                __s2 = (_QWORD *)((char *)__s2 + 36);
                __s1 = (_QWORD *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v14 = (char *)(__s2 + 4);
                v13 = (char *)(__s1 + 4);
                v21 = 32;
                v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 36;
                v14 = (char *)__s2 + 36;
                v21 = 128;
                v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  _BOOL8 result;
  BOOL v6;
  BOOL v7;

  if (__n != a4)
    return 0;
  if (!(__s1 | __s2))
    return 1;
  result = 0;
  v6 = __s1 == 0;
  if (__s2)
  {
    v7 = 1;
  }
  else
  {
    v6 = 0;
    v7 = __s1 == 0;
  }
  if (v7 && !v6)
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, _QWORD *a5)
{
  BOOL v6;
  char v7;
  uint64_t result;
  size_t v12;
  uint64_t v13;

  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(_QWORD *)a4 = 0;
              *(_QWORD *)(a4 + 8) = 0;
            }
            v13 = *a5 - 16;
            result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!(_DWORD)result)
            {
              v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  _DWORD *v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if ((_DWORD)v10)
    {
      v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12)
    Util_DeallocCredential(v12);
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, _QWORD *a4)
{
  size_t v4;
  size_t v5;
  BOOL v6;
  unsigned int **v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t result;
  size_t v16[9];

  if (a2)
    v6 = a1 == 0;
  else
    v6 = 0;
  if (v6 || a3 == 0 || a4 == 0)
    return 4294967293;
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    v11 = a1;
    v12 = a2;
    v13 = 4;
    while (1)
    {
      v14 = *v11;
      if (!*v11)
        return 4294967293;
      v16[0] = *a4 - v13;
      result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if ((_DWORD)result)
        return result;
      v13 += v16[0];
      ++v11;
      if (!--v12)
        goto LABEL_18;
    }
  }
  else
  {
    v13 = 4;
LABEL_18:
    result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v15 = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if ((_DWORD)v8)
          {
            v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              v11 = 0;
              v12 = 4;
              while (1)
              {
                v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if ((_DWORD)v13)
                  break;
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11)
                  goto LABEL_12;
              }
              v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            v10 = 0;
LABEL_12:
            v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  uint64_t v3;
  _DWORD **v4;
  uint64_t v5;
  unint64_t v6;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1;
      v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  if (!a3)
    return 4294967293;
  result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, _QWORD *a4)
{
  __n128 result;

  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967293;
  result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, _QWORD *a3)
{
  __n128 result;

  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (!a4)
    return 4294967293;
  result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, _QWORD *a5)
{
  __n128 result;

  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  __n128 result;

  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 4294967293;
  result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (!a4)
    return 4294967293;
  result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_RemoveCredentialByType_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, _QWORD *a5)
{
  __n128 result;

  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_RemoveCredentialByType_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  __n128 result;

  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967293;
  result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_DeleteContext_Serialize(__n128 *a1, __n128 *a2, _QWORD *a3)
{
  __n128 result;

  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_DeleteContext_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3)
      *a3 = *(_OWORD *)a1;
    result = 0;
    if (a4)
      *a4 = *(_DWORD *)(a1 + 16);
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 28;
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result;
  size_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          v18 = 0;
          result = getLengthOfParameters(a5, a6, &v18);
          if (!(_DWORD)result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              v17 = a4 + 24;
              result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!(_DWORD)result)
                *a8 = v17;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14[3];

  v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if ((_DWORD)v11)
    {
      v12 = v11 + 24;
      if (v12 > a2)
        return 4294967293;
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 25;
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  unsigned int v16;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          v16 = 0;
          result = getLengthOfParameters(a4, a5, &v16);
          if (!(_DWORD)result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(_BYTE *)(a6 + 20) = a3;
              v15 = 21;
              result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!(_DWORD)result)
                *a7 = v15;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, _QWORD *a6, _DWORD *a7)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v11[3];

  v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(_BYTE *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 20;
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v11;
  unsigned int v12;

  result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        v12 = 0;
        result = getLengthOfParameters(a2, a3, &v12);
        if (!(_DWORD)result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            v11 = 16;
            result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!(_DWORD)result)
              *a5 = v11;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  unint64_t v9[3];

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, _BYTE *a4, _QWORD *a5)
{
  uint64_t result;
  size_t v9;

  result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(_BYTE *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _BYTE *a5)
{
  uint64_t result;

  result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 24;
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      v18 = 0;
      result = getLengthOfParameters(a2, a3, &v18);
      if (!(_DWORD)result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(_QWORD *)a6 = 0;
            *(_QWORD *)(a6 + 8) = 0;
          }
          v17 = 16;
          result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!(_DWORD)result)
          {
            v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, unint64_t *a6, _QWORD *a7)
{
  uint64_t result;
  unint64_t v11;
  unint64_t v12;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    v12 = 16;
    result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!(_DWORD)result)
    {
      v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;

  result = 4294967293;
  if (a3 && a4)
  {
    v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src)
        memcpy(a3 + 1, __src, __n);
      else
        v8 = 4;
      result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  _DWORD *v6;
  unsigned int v7;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    result = 0;
    v7 = *a1;
    v6 = a1 + 1;
    *a4 = v7;
    if (!v7)
      v6 = 0;
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1)
    return 4294967293;
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4])
        return 4294967293;
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4)
        return 4294967293;
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16)
        return 4294967293;
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18)
        return 4294967293;
      break;
    case 8:
    case 9:
      if (a1[4] != 1)
        return 4294967293;
      break;
    case 0xB:
      if (a1[4] > 0x400u)
        return 4294967293;
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  size_t v5;
  const void *v6;
  const void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  uint64_t v13;
  _BYTE *v14;
  unsigned int v15;
  uint64_t v17;
  _BYTE v18[8192];
  uint64_t v19;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))v1;
  v19 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  v17 = 0x2000;
  v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17)
      v14 = v18;
    else
      v14 = 0;
    (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v14);
  }
  if ((_DWORD)v13)
    v15 = 70;
  else
    v15 = 10;
  if (v15 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  return v13;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  uint64_t v16;
  _BYTE *v17;
  unsigned int v18;
  size_t v20;
  _BYTE v21[1024];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  v20 = 1024;
  v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20)
      v17 = v21;
    else
      v17 = 0;
    (*(void (**)(uint64_t, _BYTE *))(a8 + 16))(a8, v17);
  }
  if ((_DWORD)v16)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *);
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _BYTE v16[256];
  uint64_t v17;

  v9 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *))result;
  v17 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  v14 = 256;
  if (v9)
  {
    v13 = 8;
    result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if ((_DWORD)result)
    {
LABEL_7:
      v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    v10 = 4294967291;
  }
  else
  {
    v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14)
      v11 = v16;
    else
      v11 = 0;
    result = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *))(a5 + 16))(a5, v10, v11);
  }
  if ((_DWORD)v10)
    v12 = 70;
  else
    v12 = 10;
  if (v12 >= gACMLoggingLevel)
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  int *v14;
  BOOL v16;
  int *v17;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  v17 = 0;
  v16 = 0;
  v12 = 70;
  v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    v14 = v17;
    if (!(_DWORD)v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      v14 = v17;
    }
    if (v14)
      Util_DeallocRequirement(v14);
    if ((_DWORD)v13)
      v12 = 70;
    else
      v12 = 10;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  _BOOL8 v17;
  int *v18;
  uint64_t v19;
  int *result;
  BOOL v21;
  int *v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  v17 = 0;
  v18 = 0;
  v22 = 0;
  v21 = 0;
  v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    v18 = v22;
    v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a9 + 16))(a9, v19, v17, v18);
  result = v22;
  if (v22)
    result = (int *)Util_DeallocRequirement(v22);
  if (gACMLoggingLevel <= 0xAu)
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  uint64_t result;
  int v15[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  *(_QWORD *)v15 = 0;
  result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v15, 0, 1);
  if ((_DWORD)result)
  {
    if (a7)
      result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a7 + 16))(a7, result, 0, 0);
  }
  else
  {
    result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(_QWORD *)v15)
    result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v15, 1);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  v14 = 128;
  if (!a4)
  {
    v12 = 70;
    v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      v12 = 70;
      v9 = 4294967292;
      goto LABEL_17;
    }
    v14 = 2048;
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v10 = v8;
      else
        v10 = 0;
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v11 = v15;
      else
        v11 = 0;
      (*(void (**)(uint64_t, _BYTE *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v7;
  _BYTE *v8;
  unsigned int v9;
  uint64_t v11;
  _BYTE v12[8192];
  uint64_t v13;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v6 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v1;
  v13 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  v11 = 0x2000;
  if (v3)
  {
    v7 = LibCall_ACMTRMLoadState(v6, v5, (uint64_t)v12, (uint64_t)&v11);
    if ((_DWORD)v7)
    {
      v9 = 70;
    }
    else
    {
      if (v11)
        v8 = v12;
      else
        v8 = 0;
      (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v8);
      v9 = 10;
    }
  }
  else
  {
    v9 = 70;
    v7 = 4294967293;
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v7);
  return v7;
}

uint64_t LibCall_ACMContextUnloadToImage_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  _BYTE v8[4096];
  uint64_t v9;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v4 = v1;
  v9 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  if (v3)
  {
    v5 = LibCall_ACMContextUnloadToImage(v4);
    if ((_DWORD)v5)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v8);
      v6 = 10;
    }
  }
  else
  {
    v6 = 70;
    v5 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v5);
  return v5;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128);
  __n128 AclAuthMethod_Serialize;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _BYTE v13[256];
  uint64_t v14;

  v7 = (void (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128))result;
  v14 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  v11 = 256;
  if (v7 && a3 && a4)
  {
    v10 = 16;
    AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16)
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    goto LABEL_9;
  }
  if (a4)
LABEL_9:
    result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *);
  uint64_t v21;
  int *v22;
  _BOOL8 v23;
  BOOL v24;
  int *v25;

  v20 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  v25 = 0;
  v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    v22 = v25;
    v23 = v24;
  }
  else
  {
    if (!a13)
      goto LABEL_10;
    v22 = 0;
    v23 = 0;
    v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a13 + 16))(a13, v21, v23, v22);
  result = (uint64_t)v25;
  if (v25)
    result = Util_DeallocRequirement(v25);
LABEL_10:
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1;

  v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

BOOL Util_isNullOrZeroMemory(_BYTE *a1, uint64_t a2)
{
  if (!a1)
    return 1;
  if (*a1)
    return 0;
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  _BOOL8 result;

  if (__n != a4)
    return 0;
  result = 0;
  if (__s1)
  {
    if (__s2)
      return memcmp(__s1, __s2, __n) == 0;
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  _BYTE *v5;
  char v6;

  if (!result && a2)
    Util_hexDumpToStrHelper_cold_1();
  if (!a3 && a4)
    Util_hexDumpToStrHelper_cold_2();
  if (a2 >= a4)
    v4 = a4;
  else
    v4 = a2;
  if (v4)
  {
    v5 = (_BYTE *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd[(unint64_t)*result >> 4];
      v6 = *result++;
      *v5 = a0123456789abcd[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__src, size_t __n)
{
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  if (a3)
  {
    v10 = *a3;
    v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n)
        goto LABEL_12;
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        v12 = 0;
        *a3 = v11;
        v13 = 10;
        goto LABEL_13;
      }
    }
    v12 = 4294967291;
  }
  else
  {
    v12 = 4294967293;
  }
LABEL_19:
  v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__dst, size_t __n)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  v10 = 4294967293;
  v11 = 70;
  if (a1 && a3)
  {
    v12 = *a3;
    v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n)
        goto LABEL_11;
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        v10 = 0;
        *a3 = v13;
        v11 = 10;
        goto LABEL_12;
      }
    }
    v10 = 4294967291;
LABEL_17:
    v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1;

  v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7)
    LOBYTE(v1) = 1;
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1 + 4;
      v5 = a2;
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        if (v6)
        {
          v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  uint64_t v2;
  unsigned int v3;
  const char *v4;
  rsize_t v5;
  const void *v6;
  unint64_t v7;
  int v8;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  if (a1)
  {
    v2 = 4294967293;
    v3 = 70;
    switch(*a1)
    {
      case 1:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        v5 = 60;
        v6 = a1;
        v7 = 60;
        v8 = 144;
        goto LABEL_6;
      case 2:
        v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        v5 = 168;
        v6 = a1;
        v7 = 168;
        v8 = 136;
        goto LABEL_6;
      case 3:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        v5 = 337;
        v6 = a1;
        v7 = 337;
        v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        v4 = "ACMCredential";
        v5 = 32;
        v6 = a1;
        v7 = 32;
        v8 = 189;
        goto LABEL_6;
      case 7:
        v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        v5 = 88;
        v6 = a1;
        v7 = 88;
        v8 = 152;
        goto LABEL_6;
      case 9:
        v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        v5 = 56;
        v6 = a1;
        v7 = 56;
        v8 = 156;
        goto LABEL_6;
      case 0xA:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        v5 = 84;
        v6 = a1;
        v7 = 84;
        v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        v5 = 40;
        v6 = a1;
        v7 = 40;
        v8 = 161;
        goto LABEL_6;
      case 0xD:
        v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 132;
        goto LABEL_6;
      case 0x11:
        v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        v5 = 113;
        v6 = a1;
        v7 = 113;
        v8 = 165;
        goto LABEL_6;
      case 0x12:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        v5 = 52;
        v6 = a1;
        v7 = 52;
        v8 = 169;
        goto LABEL_6;
      case 0x14:
        v4 = "ACMCredential - ACMCredentialDataAP";
        v5 = 64;
        v6 = a1;
        v7 = 64;
        v8 = 173;
        goto LABEL_6;
      case 0x15:
        v4 = "ACMCredential - ACMCredentialDataSignature";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        v2 = 0;
        v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    v2 = 4294967293;
    v3 = 70;
  }
  if (v3 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  return v2;
}

uint64_t Util_AllocCredential(int a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v5;
  int v6;
  const char *v7;
  const void *v8;
  int v9;

  if (!a2)
    return 4294967293;
  result = 4294967293;
  switch(a1)
  {
    case 1:
      v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      v6 = 28;
      goto LABEL_4;
    case 2:
      v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      v6 = 136;
      goto LABEL_4;
    case 3:
      v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      v6 = 0;
      goto LABEL_4;
    case 7:
      v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      v6 = 56;
      goto LABEL_4;
    case 9:
      v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      v6 = 24;
      goto LABEL_4;
    case 10:
      v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      v6 = 8;
      goto LABEL_4;
    case 13:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      v8 = v5;
      v9 = 211;
      goto LABEL_18;
    case 17:
      v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      v6 = 81;
      goto LABEL_4;
    case 18:
      v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      v6 = 20;
      goto LABEL_4;
    case 20:
      v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      v6 = 32;
      goto LABEL_4;
    case 21:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataSignature";
      v8 = v5;
      v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      v6 = 132;
LABEL_4:
      if (v5)
      {
        result = 0;
        *v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  _DWORD *v8;
  int v9;
  const char *v11;
  const void *v12;
  int v13;
  const char *v14;
  const void *v15;
  int v16;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  if (a3)
  {
    v6 = 4294967293;
    v7 = 70;
    switch(a1)
    {
      case 1:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        v12 = v8;
        v13 = 338;
        goto LABEL_49;
      case 2:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        v12 = v8;
        v13 = 343;
        goto LABEL_49;
      case 3:
        v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        v9 = 156;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataOr";
        v15 = v8;
        v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataAnd";
        v15 = v8;
        v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        v9 = 84;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        v9 = 0;
        if (v8)
          goto LABEL_6;
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        v9 = 88;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 8:
        v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        v9 = 1024;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 13:
        v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        v9 = 32;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        v12 = v8;
        v13 = 353;
        goto LABEL_49;
      case 21:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        v12 = v8;
        v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        v9 = 4;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 24:
        v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        v9 = 1060;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 25:
        v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        v9 = 43;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 26:
        v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        v9 = 28;
        if (!v8)
        {
LABEL_50:
          v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        *v8 = a1;
        *(_QWORD *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        v6 = 0;
        *a3 = v8;
        v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
              goto LABEL_53;
            v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            v9 = 120;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1001:
            v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            v9 = 168;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1002:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            v12 = v8;
            v13 = 424;
            goto LABEL_49;
          case 1003:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            v12 = v8;
            v13 = 429;
            goto LABEL_49;
          case 1004:
            v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            v9 = 16;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    v6 = 4294967293;
LABEL_54:
    v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  rsize_t v10;
  int *v11;
  unint64_t v12;
  int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  if (!a1)
  {
    v7 = 4294967293;
    v8 = 70;
    goto LABEL_28;
  }
  v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        v6 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000)
        goto LABEL_25;
      if (a1[13])
      {
        v4 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      v5 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5)
      goto LABEL_25;
    if (a1[4])
    {
      v3 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  v2 = *a1;
LABEL_25:
  v7 = 4294967293;
  v8 = 70;
  switch(v2)
  {
    case 1:
      v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 542;
      goto LABEL_27;
    case 2:
      v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 546;
      goto LABEL_27;
    case 3:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      v10 = 172;
      v11 = a1;
      v12 = 172;
      v13 = 550;
      goto LABEL_27;
    case 4:
      v9 = "ACMRequirement - ACMRequirementDataOr";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 595;
      goto LABEL_27;
    case 5:
      v9 = "ACMRequirement - ACMRequirementDataAnd";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      v9 = "ACMRequirement";
      v10 = 16;
      v11 = a1;
      v12 = 16;
      v13 = 538;
      goto LABEL_27;
    case 7:
      v9 = "ACMRequirement - ACMRequirementDataKofN";
      v10 = 104;
      v11 = a1;
      v12 = 104;
      v13 = 584;
      goto LABEL_27;
    case 8:
      v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      v10 = 1040;
      v11 = a1;
      v12 = 1040;
      v13 = 574;
      goto LABEL_27;
    case 13:
      v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      v10 = 48;
      v11 = a1;
      v12 = 48;
      v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 554;
      goto LABEL_27;
    case 21:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 558;
      goto LABEL_27;
    case 24:
      v9 = "ACMRequirement - ACMRequirementDataAP";
      v10 = 1076;
      v11 = a1;
      v12 = 1076;
      v13 = 566;
      goto LABEL_27;
    case 25:
      v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      v10 = 59;
      v11 = a1;
      v12 = 59;
      v13 = 570;
      goto LABEL_27;
    case 26:
      v9 = "ACMRequirement - ACMRequirementDataRatchet";
      v10 = 44;
      v11 = a1;
      v12 = 44;
      v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      v7 = 0;
      v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          v10 = 136;
          v11 = a1;
          v12 = 136;
          v13 = 601;
          goto LABEL_27;
        case 1001:
          v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          v10 = 184;
          v11 = a1;
          v12 = 184;
          v13 = 605;
          goto LABEL_27;
        case 1002:
          v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 609;
          goto LABEL_27;
        case 1003:
          v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 613;
          goto LABEL_27;
        case 1004:
          v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          v10 = 32;
          v11 = a1;
          v12 = 32;
          v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 32, "src || !srcLen");
}

void Util_hexDumpToStrHelper_cold_2()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 33, "dst || !dstCapacity");
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if ((_DWORD)v2)
  {
    updateLogLevelFromKext();
    v3 = 70;
  }
  else
  {
    v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v4 = *a1;
        if (*a1)
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        *(_DWORD *)buf = 136315650;
        v8 = "ACMLib";
        v9 = 2080;
        v10 = "ACMContextCreate";
        v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    v11 = 2048;
    v12 = (int)v2;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    v14 = init();
    v15 = 70;
    if ((_DWORD)v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if ((_DWORD)v16)
        v15 = 70;
      else
        v15 = 10;
    }
  }
  else
  {
    v15 = 70;
    v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = 136315650;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    v22 = 2048;
    v23 = (int)v16;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  _DWORD *v4;
  int v5;
  unsigned int v6;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _DWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v8 = 0;
  v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      v10 = "ACMLib";
      v11 = 2080;
      v12 = "ACMContextCreateWithExternalForm";
      v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    v12 = "ACMLib";
    v14 = "ACMContextDelete";
    v13 = 2080;
    if (a2)
      v6 = "destroyed";
    v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(_QWORD *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  v10 = a1;
  v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v10, a1, a2);
  if ((_DWORD)v7)
    v8 = 70;
  else
    v8 = 10;
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0))
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  else
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  unsigned int v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if ((_initialized & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    v1 = *MEMORY[0x1E0CBBAB8];
    v2 = IOServiceMatching("AppleCredentialManager");
    MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      v5 = 70;
      v0 = 4294967291;
      goto LABEL_10;
    }
    v4 = MatchingService;
    v0 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, (io_connect_t *)&_connect);
    if ((_DWORD)v0)
    {
      v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    v11 = 2048;
    v12 = (int)v0;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  _BYTE *v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  unsigned int v20;
  size_t v22;
  size_t inputStructCnt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  inputStructCnt = 0;
  v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    v15 = v14;
    if (!a6 && a7)
    {
      v18 = 4294967293;
    }
    else
    {
      if (a7)
        v16 = *a7;
      else
        v16 = 0;
      v22 = v16;
      v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      v18 = v17;
      if (a1)
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      if ((_DWORD)v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          v30 = 1024;
          v31 = v18;
          v32 = 1024;
          v33 = v18;
          _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        v18 = 0;
        if (a7)
          *a7 = v22;
      }
    }
    v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if ((_DWORD)v18)
      v20 = 70;
    else
      v20 = 10;
  }
  else
  {
    v20 = 70;
    v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    v28 = 2048;
    *(_QWORD *)v29 = (int)v18;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedAddCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedAddCredentialSize = init();
    if ((_DWORD)SerializedAddCredentialSize
      || (SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          (_DWORD)SerializedAddCredentialSize))
    {
      v9 = SerializedAddCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    v10 = init();
    if ((_DWORD)v10 || (v10 = GetSerializedRemoveCredentialSize(a1, a2, a3, &size), (_DWORD)v10))
    {
      v9 = v10;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  if (a1)
  {
    v2 = ACMContextCreate((uint64_t *)&v6);
    if (!(_DWORD)v2)
      v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    v3 = v2;
    if (v6)
      ACMContextDelete(v6, 1);
    if ((_DWORD)v3)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v4 = 70;
    v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = ACMContextCreate((uint64_t *)&v6);
  if (!(_DWORD)v2)
    v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  v3 = v2;
  if (v6)
    ACMContextDelete(v6, 1);
  if ((_DWORD)v3)
    v4 = 70;
  else
    v4 = 10;
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedReplacePassphraseCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedReplacePassphraseCredentialSize = init();
    if ((_DWORD)SerializedReplacePassphraseCredentialSize
      || (SerializedReplacePassphraseCredentialSize = GetSerializedReplacePassphraseCredentialSize(a1, a2, a3, &size),
          (_DWORD)SerializedReplacePassphraseCredentialSize))
    {
      v9 = SerializedReplacePassphraseCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        v13 = SerializeReplacePassphraseCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        v9 = v13;
        bzero(v12, size);
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v7;
  _OWORD *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  _OWORD *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v11 = a1;
  v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    v16 = 2048;
    v17 = (int)v8;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  _OWORD *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  int v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(_QWORD *)v11 = 0;
  v10 = ACMContextCreate((uint64_t *)v11);
  if ((_DWORD)v10)
  {
    if (a5)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, v10, 0, 0);
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(_QWORD *)v11)
    ACMContextDelete(*(_DWORD **)v11, 1);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  _OWORD *v9;

  v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  _OWORD *v11;

  v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t SerializedProcessAclSize;
  size_t v8;
  void *v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  size_t v15;
  size_t v16;
  unsigned int v17;
  size_t __n;
  size_t size;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  __n = 4096;
  size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 4294967293;
  if (!a1 || !a2 || !a3)
    goto LABEL_28;
  SerializedProcessAclSize = init();
  if ((_DWORD)SerializedProcessAclSize
    || (SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        (_DWORD)SerializedProcessAclSize))
  {
    v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  v8 = size;
  v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    v6 = 4294967292;
    goto LABEL_28;
  }
  v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if ((_DWORD)v10)
  {
    v6 = v10;
    v12 = 0;
    v14 = 0;
    v11 = 4096;
    goto LABEL_15;
  }
  v11 = 4096;
  v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    v14 = 0;
LABEL_31:
    v6 = 4294967292;
    goto LABEL_15;
  }
  v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  v11 = __n;
  if ((_DWORD)v13)
  {
    v6 = v13;
    v14 = 0;
    goto LABEL_15;
  }
  v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  v11 = __n;
  if (!v14)
    goto LABEL_31;
  memcpy(v14, v12, __n);
  v6 = 0;
  v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if ((_DWORD)v6)
    v17 = 70;
  else
    v17 = 10;
  if (v17 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    v25 = 2048;
    v26 = (int)v6;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        v6 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        v7 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      v5 = 0;
      do
        (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  unint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  v4 = 4294967293;
  v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    v4 = 0;
    v6 = *a1;
    v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21)
          break;
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        v4 = 0;
        v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    v12 = 2048;
    v13 = (int)v4;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  __n128 *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    v14 = 2048;
    v15 = (int)v6;
    v16 = 1024;
    v17 = a1;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = 0;
  v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    v20 = 2048;
    v21 = (int)v12;
    v22 = 1024;
    v23 = a1;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v7 = 0;
  v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if ((_DWORD)v4)
    v5 = 70;
  else
    v5 = 10;
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    v12 = 2048;
    v13 = (int)v4;
    v14 = 1024;
    v15 = a1;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  uint64_t v2;
  unsigned int v3;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v2 = LibCall_ACMKernelControl_Block((uint64_t)ioKitTransport);
  if ((_DWORD)v2)
    v3 = 70;
  else
    v3 = 10;
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    v9 = 2048;
    v10 = (int)v2;
    v11 = 1024;
    v12 = a1;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7;

  v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  uint64_t v8;
  __n128 *v9;
  uint64_t v10;
  uint8_t v11[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v10 = 256;
  if (a4)
  {
    v9 = a1;
    v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  _OWORD *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = a1;
  v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    v20 = 2048;
    v21 = (int)v12;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t Data;
  unsigned int v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if ((_DWORD)Data)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    v13 = 2048;
    v14 = (int)Data;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  rsize_t v15;
  unsigned int v16;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int size;
  int size_4;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315394;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  size = 0;
  v20 = 0;
  v21 = 4;
  v19 = a1;
  v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!(_DWORD)v10)
  {
    v11 = size;
    if (size)
    {
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        v16 = 70;
        v14 = 4294967292;
        goto LABEL_15;
      }
      v20 = size;
      v18 = a1;
      v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      v14 = v13;
      if (a5 && !(_DWORD)v13)
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if ((_DWORD)v14)
        goto LABEL_11;
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, 0, 0);
    }
    v14 = 0;
    v16 = 10;
    goto LABEL_15;
  }
  v14 = v10;
LABEL_11:
  v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315650;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    v27 = 2048;
    v28 = (int)v14;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t Data;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if ((_DWORD)Data)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    v15 = 2048;
    v16 = (int)Data;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(__int128 *a1, int a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  __int128 *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1;

  v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  unsigned __int8 v0;
  unsigned int v1;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  output = 0;
  outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt))
    goto LABEL_8;
  v0 = output;
  v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    v8 = 1024;
    v9 = v0;
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

_BYTE *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, _QWORD *a6)
{
  _BYTE *v12;
  BOOL v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  v12 = 0;
  if (a5)
    v13 = a4 == 0;
  else
    v13 = 0;
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      v12 = 0;
    }
    else
    {
      v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5)
          memcpy(v12 + 8, a4, a5);
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *), uint64_t a2, _QWORD *a3, _BYTE *a4, int a5)
{
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v18;
  _BYTE v19[21];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  v10 = 70;
  v11 = 4294967293;
  if (!a1 || !a3)
    goto LABEL_25;
  v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    v10 = 70;
    v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    v18 = 21;
    v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!(_DWORD)v13)
    {
      if (v18 != 21)
      {
        v11 = 4294967291;
        goto LABEL_23;
      }
      v11 = 0;
      goto LABEL_20;
    }
    v11 = v13;
    if ((_DWORD)v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      v10 = 70;
      goto LABEL_25;
    }
  }
  v18 = 17;
  v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17)
    v15 = 0;
  else
    v15 = -5;
  if (v14)
    v11 = v14;
  else
    v11 = v15;
  if (!v14 && v18 == 17)
  {
LABEL_20:
    v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4)
      *a4 = v19[16];
  }
  if ((_DWORD)v11)
    goto LABEL_23;
  v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, _BYTE *a5, int a6)
{
  _DWORD *v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v20;
  _QWORD v21[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  v12 = 0;
  v13 = 70;
  v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      v20 = 9;
      v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          v14 = 0;
          goto LABEL_19;
        }
        v14 = -5;
        goto LABEL_28;
      }
      v14 = v15;
      if (v15 != -3)
        goto LABEL_28;
    }
    v20 = 5;
    v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5)
      v17 = 0;
    else
      v17 = -5;
    if (v16)
      v14 = v16;
    else
      v14 = v17;
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          v13 = 70;
          v14 = -4;
          goto LABEL_31;
        }
        v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)v12 = *a3;
        v12[4] = v18;
        if (a5)
          *a5 = BYTE4(v21[0]);
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    v12 = 0;
    if (v14)
      goto LABEL_29;
LABEL_30:
    v14 = 0;
    v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD), uint64_t a2, void *a3, int a4)
{
  uint64_t v8;
  unsigned int v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  if (a1 && a3)
  {
    if (a4)
      a1(a2, 2, 0, a3, 16, 0, 0);
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    v8 = 0;
    v9 = 10;
    goto LABEL_8;
  }
  v9 = 70;
  v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t SerializedAddCredentialSize;
  size_t v15;
  void *v16;
  uint64_t v17;
  size_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if ((_DWORD)SerializedAddCredentialSize)
    {
      v13 = SerializedAddCredentialSize;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 5, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  _OWORD *v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  if (a3 || a5 == 2)
  {
    v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *v10 = *a3;
      }
      else
      {
        *(_QWORD *)v10 = 0;
        *((_QWORD *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if ((_DWORD)v11)
        v12 = 70;
      else
        v12 = 10;
    }
    else
    {
      v12 = 70;
      v11 = 4294967292;
    }
  }
  else
  {
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  size_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = (_DWORD)a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    v14 = GetSerializedRemoveCredentialSize(a3, a4, a5, &size);
    if ((_DWORD)v14)
    {
      v13 = v14;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 6, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, _QWORD *a10)
{
  unsigned int v18;
  uint64_t v19;
  uint64_t SerializedVerifyPolicySize;
  size_t v21;
  _OWORD *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  unint64_t v26;
  size_t v27;
  size_t v29;
  void *v30;
  unint64_t v31;
  size_t v32;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  v32 = 0;
  size = 0;
  v30 = 0;
  v31 = 4096;
  v18 = 70;
  v19 = 4294967293;
  v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      v18 = 70;
      v19 = 4294967293;
    }
    else
    {
      SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if ((_DWORD)SerializedVerifyPolicySize)
      {
        v19 = SerializedVerifyPolicySize;
        v18 = 70;
      }
      else
      {
        v21 = size;
        v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          v32 = size;
          v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if ((_DWORD)v23)
          {
            v19 = v23;
            v24 = 0;
          }
          else
          {
            v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if ((_DWORD)v25)
              {
                v19 = v25;
              }
              else
              {
                v26 = v31 - 4;
                if (v31 < 4)
                {
                  v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!(_DWORD)v19)
                      *a10 = v30;
                  }
                  else
                  {
                    v19 = 0;
                  }
                }
              }
            }
            else
            {
              v19 = 4294967292;
            }
          }
          v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if ((_DWORD)v19)
            v18 = 70;
          else
            v18 = 10;
        }
        else
        {
          v18 = 70;
          v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  v4 = 70;
  v5 = 4294967293;
  if (a1 && a2)
  {
    v5 = Util_DeallocRequirement(a2);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v13)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  BOOL v14;
  _DWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD v20[2];

  v13 = a1;
  v20[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  if (!v13)
    goto LABEL_16;
  v14 = a5 != 0;
  if (a4)
    v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  if (v14)
  {
LABEL_16:
    v18 = 70;
    v17 = 4294967293;
  }
  else
  {
    v20[0] = v20;
    MEMORY[0x1E0C80A78](a1);
    v15 = (_DWORD *)((char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *v15 = a3;
    v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4))
      LibCall_ACMKernelControl_cold_1();
    v17 = v13(a2, 26, 0, (char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if ((_DWORD)v17)
      v18 = 70;
    else
      v18 = 10;
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1)
    return (_DWORD *)Util_DeallocCredential(a1);
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  int v4;
  uint64_t result;
  int v7;
  _OWORD *v8;
  BOOL v9;
  _BOOL4 v10;
  __int128 v11;
  _BOOL4 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (!a1)
    return 4294967293;
  v4 = __n;
  if ((__src != 0) != (__n != 0))
    return 4294967293;
  result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13)
          return result;
LABEL_79:
        result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17)
          return result;
        result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        v11 = __src[1];
        v16 = __src[2];
        v17 = __src[3];
        *((_BYTE *)a1 + 112) = *((_BYTE *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20)
        return result;
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              result = 0;
              v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            v9 = *a1 == 12 || *a1 == 15;
            v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7)
          return result;
        result = 0;
        v11 = *__src;
        *((_QWORD *)a1 + 10) = *((_QWORD *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7)
        return result;
    }
    result = 0;
    v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3)
          goto LABEL_16;
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          result = 0;
          v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3)
          goto LABEL_102;
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          v19 = __src[1];
          v20 = __src[2];
          v21 = __src[3];
          *((_BYTE *)a1 + 184) = *((_BYTE *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18)
              goto LABEL_64;
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1)
      return result;
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18)
          return result;
        v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3)
        return result;
      v8 = a1 + 26;
      a1[25] = 16;
    }
    result = 0;
    *v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result;
  int *v8;
  int *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int *v17;
  int v18;
  _BOOL4 isNullOrZeroMemory;
  BOOL v20;
  int *v21;
  uint64_t v22;
  int *v23;

  result = 4294967293;
  if (!a1 || !a3 || !a4)
    return result;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17)
            return result;
          v11 = a1 + 12;
LABEL_87:
          v12 = 65;
          v13 = v11;
          v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21)
              return result;
            v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((_BYTE *)a1 + 36, 128))
            {
              v15 = 0;
              v10 = 0;
            }
            else
            {
              v10 = a1[8];
            }
            result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20)
            return result;
          v11 = a1 + 8;
          v12 = 32;
          v13 = v11;
          v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13)
            return result;
          result = 0;
          *a3 = a1 + 9;
          v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17)
          return result;
        v11 = a1 + 8;
        v12 = 16;
        v13 = v11;
        v14 = 16;
      }
      isNullOrZeroMemory = Util_isNullOrZeroMemory(v13, v14);
      result = 0;
      v20 = !isNullOrZeroMemory;
      if (isNullOrZeroMemory)
        v21 = 0;
      else
        v21 = (int *)v11;
      if (v20)
        v22 = v12;
      else
        v22 = 0;
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10)
          return result;
        v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_77;
        }
        if (*a1 != 10)
          return result;
        v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      result = Util_isNullOrZeroMemory(v9, 16);
      if ((_DWORD)result)
      {
        result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      *a3 = a1 + 16;
      v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10)
      return result;
LABEL_15:
    v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          result = 0;
          v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          result = 0;
          v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          result = 0;
          v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          result = 0;
          v10 = *(unsigned int *)((char *)a1 + 205);
          v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205))
            v23 = 0;
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            result = 0;
            *a3 = a1 + 10;
            v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1)
          return result;
LABEL_61:
        result = 0;
        v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0)
        return result;
LABEL_77:
      result = 0;
      v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      v10 = 4;
      goto LABEL_99;
    }
    v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3)
          return result;
        v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18)
      return result;
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      result = 0;
      *a3 = a1 + 4;
      v10 = 8;
      goto LABEL_99;
    case 2:
      result = 0;
      v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      result = 0;
      v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      result = 0;
      v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 4);
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4;
  int *v7;
  int *v8;
  int *v9;
  unint64_t v10;
  _DWORD *v11;
  BOOL v12;
  int v13;

  v4 = 4294967293;
  if (!a1 || !a3 || !a4)
    return v4;
  v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700)
          return v4;
        if (*a1 == 7)
        {
LABEL_28:
          v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26)
        return 4294967293;
      if (a1[3] < 0x1C)
        return 4294967282;
      *a3 = a1 + 4;
      v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600)
          return v4;
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25)
        return 4294967293;
      *a3 = a1 + 4;
      v10 = 43;
    }
LABEL_72:
    v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3)
          return 4294967293;
        v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3)
          return 4294967293;
        v10 = 0;
        v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24)
          return 4294967293;
        *a3 = a1 + 5;
        v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24)
          return 4294967293;
        v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21)
              goto LABEL_28;
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200)
          return v4;
        if (*a1 != 2)
          return 4294967293;
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((_BYTE *)v11 + v10, 16))
    {
      v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10)
      v11 = 0;
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      v10 = 4;
      goto LABEL_72;
    case 2:
      v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  v6 = 70;
  if (a1 && ((_DWORD)a3 == 47 || (_DWORD)a3 == 29))
  {
    v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if ((_DWORD)v7)
      v6 = 70;
    else
      v6 = 10;
  }
  else
  {
    v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  v4 = 70;
  if (a1)
  {
    v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  __n128 Property_Serialize;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  v14 = 70;
  v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          v19 = 24;
          Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if ((_DWORD)v16)
          {
            v15 = v16;
          }
          else if (v19 == 24)
          {
            v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!(_DWORD)v15)
            {
              v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            v15 = 4294967291;
          }
          v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  uint64_t Property_Serialize;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  v12 = 70;
  v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    v16 = 8;
    Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if ((_DWORD)Property_Serialize)
    {
      v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!(_DWORD)v13)
      {
        v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      v13 = 4294967291;
    }
    v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  uint64_t v18;
  uint64_t SerializedVerifyPolicySize;
  size_t v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  unsigned int v27;
  size_t v29;
  int *v30;
  unint64_t v31;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  v31 = 4096;
  size = 0;
  v29 = 0;
  v30 = 0;
  v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!(_DWORD)v18)
      goto LABEL_21;
    goto LABEL_19;
  }
  SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!(_DWORD)SerializedVerifyPolicySize)
  {
    v20 = size;
    v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if ((_DWORD)v22)
      {
        v18 = v22;
        v23 = 0;
      }
      else
      {
        v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if ((_DWORD)v24)
          {
            v18 = v24;
          }
          else
          {
            v25 = v31 - 4;
            if (v31 < 4)
            {
              v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!(_DWORD)v18)
                  *a10 = v30;
              }
              else
              {
                v18 = 0;
              }
            }
          }
        }
        else
        {
          v18 = 4294967292;
        }
      }
      v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      v18 = 4294967292;
    }
    goto LABEL_18;
  }
  v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30)
    Util_DeallocRequirement(v30);
LABEL_21:
  if ((_DWORD)v18)
    v27 = 70;
  else
    v27 = 10;
  if (v27 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v20[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  *(_QWORD *)v20 = 0;
  v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v20, 0, 1);
  if (!(_DWORD)v16)
    v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  v17 = v16;
  if (*(_QWORD *)v20)
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v20, 1);
  if ((_DWORD)v17)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v9;
  uint64_t v10;
  int v12;

  v12 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  v9 = 70;
  v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if ((_DWORD)v10)
      v9 = 70;
    else
      v9 = 10;
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t (*v15)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  _QWORD v21[2];

  v15 = a1;
  v21[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  if (!v15 || a6 != 16 * (a5 != 0))
    goto LABEL_20;
  v16 = a8 != 0;
  if (a7)
    v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80;
  if (!v16)
  {
    MEMORY[0x1E0C80A78](a1);
    v17 = (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4)
      *(_OWORD *)(v17 + 12) = *a4;
    if (a5)
      *(_OWORD *)(v17 + 28) = *a5;
    if (a8)
      memcpy(v17 + 44, a7, a8);
    v18 = v15(a2, 44, 0, (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if ((_DWORD)v18)
      v19 = 70;
    else
      v19 = 10;
  }
  else
  {
LABEL_20:
    v19 = 70;
    v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  uint64_t v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  v8 = 70;
  v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if ((_DWORD)v9)
      v8 = 70;
    else
      v8 = 10;
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  if (a1)
  {
    v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3)
      v10 = a4 != 0;
    v11 = 70;
    if (!v10)
    {
      if (a5)
        v12 = 43;
      else
        v12 = 39;
      v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if ((_DWORD)v13)
        v11 = 70;
      else
        v11 = 10;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = 70;
  }
  v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *);
  unsigned int v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  int v15;
  unint64_t v17;
  _OWORD v18[17];
  uint64_t v19;
  char v20;
  _BYTE v21[3];
  __int16 v22;
  uint64_t v23;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *))v1;
  v23 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  v11 = 70;
  v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      v20 = 1;
      *(_WORD *)&v21[1] = 6;
      v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      v19 = 0;
      v17 = 280;
      v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if ((_DWORD)v14)
      {
        v12 = v14;
      }
      else if (v17 < 0x18)
      {
        v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          v12 = 0;
          v15 = DWORD1(v18[1]);
          *(_OWORD *)v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          *v3 = v13;
          v11 = 10;
          goto LABEL_11;
        }
        v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      v11 = 70;
    }
    else
    {
      v11 = 70;
      v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *);
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16[2];
  _BYTE v17[2];
  unsigned __int16 v18;
  size_t __n;
  int v20;
  __int128 v21;
  uint64_t v22;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *))v1;
  v22 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  v11 = 70;
  v12 = 4294967293;
  if (v10 && v5 && v3)
  {
    v21 = 0uLL;
    v20 = 1310721;
    if (v7)
      v21 = *v7;
    else
      v21 = 0uLL;
    bzero(v17, 0x1106uLL);
    *(_QWORD *)v16 = 4358;
    v13 = v10(v9, 49, 0, &v20, 20, v17, v16);
    if ((_DWORD)v13)
    {
      v12 = v13;
LABEL_18:
      v11 = 70;
      goto LABEL_14;
    }
    if (*(_QWORD *)v16 < 6uLL)
    {
      v11 = 70;
      v12 = 4294967291;
    }
    else
    {
      if (v17[0])
      {
        v15 = v18;
        v12 = Util_ReadFromBuffer((uint64_t)v17, *(size_t *)v16, &v15, v5, (unsigned __int16)__n);
        if (!(_DWORD)v12)
        {
          *v3 = v15 - v18;
          v11 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      v11 = 70;
      v12 = 4294967280;
    }
  }
LABEL_14:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v12);
  return v12;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  size_t v22;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  size = 0;
  v16 = 70;
  v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      v16 = 70;
      v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      v16 = 70;
      v17 = 4294967276;
    }
    else
    {
      v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if ((_DWORD)v18)
      {
        v17 = v18;
        v16 = 70;
      }
      else
      {
        v19 = size;
        v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!(_DWORD)v21)
            v21 = a1(a2, 40, 0, v20, size, 0, 0);
          v17 = v21;
          v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if ((_DWORD)v17)
            v16 = 70;
          else
            v16 = 10;
        }
        else
        {
          v16 = 70;
          v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  uint64_t Data_Serialize;
  size_t v24;
  uint64_t v26;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
  {
    v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size = 0;
  v17 = 70;
  v18 = 4294967293;
  if (a1)
  {
    v26 = a2;
    if (a3)
    {
      v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          v19 = a8;
          v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if ((_DWORD)v20)
          {
            v18 = v20;
            v17 = 70;
          }
          else
          {
            v21 = size;
            v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!(_DWORD)Data_Serialize)
                Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              v18 = Data_Serialize;
              v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if ((_DWORD)v18)
                v17 = 70;
              else
                v17 = 10;
            }
            else
            {
              v17 = 70;
              v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD v14[2];

  v7 = a1;
  v14[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  if (v7)
  {
    if (a3)
      v8 = 1;
    else
      v8 = a4 == 0;
    v9 = !v8;
    v10 = 70;
    v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      MEMORY[0x1E0C80A78](a1);
      v12 = (_DWORD *)((char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      *v12 = 1;
      v12[1] = a4;
      if (a4)
        memcpy(v12 + 2, a3, a4);
      v11 = v7(a2, 45, 0, (char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if ((_DWORD)v11)
        v10 = 70;
      else
        v10 = 10;
    }
  }
  else
  {
    v10 = 70;
    v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, __int128 *a3, int a4, _QWORD *a5)
{
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  _OWORD v15[9];
  int v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  v10 = 70;
  v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    v16 = 1;
    v18 = a4;
    v17 = *a3;
    memset(v15, 0, 140);
    v14 = 140;
    v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if ((_DWORD)v12)
    {
      v11 = v12;
    }
    else if (v14 < 0xC)
    {
      v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        v11 = 0;
        *a5 = *(_QWORD *)((char *)v15 + 4);
        v10 = 10;
        goto LABEL_10;
      }
      v11 = 4294967281;
    }
    v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  uint64_t v20;
  uint64_t SerializedVerifyAclConstraintSize;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unint64_t v27;
  rsize_t v28;
  unsigned int v29;
  size_t v33;
  int *v34;
  unint64_t v35;
  size_t v36;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  v36 = 0;
  v34 = 0;
  v35 = 4096;
  v33 = 0;
  v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!(_DWORD)v20)
      goto LABEL_22;
    goto LABEL_20;
  }
  SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!(_DWORD)SerializedVerifyAclConstraintSize)
  {
    v22 = v36;
    v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if ((_DWORD)v24)
      {
        v20 = v24;
        v25 = 0;
      }
      else
      {
        v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if ((_DWORD)v26)
          {
            v20 = v26;
          }
          else
          {
            v27 = v35 - 4;
            if (v35 < 4)
            {
              v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!(_DWORD)v20)
                  *a14 = v34;
              }
              else
              {
                v20 = 0;
              }
            }
          }
        }
        else
        {
          v20 = 4294967292;
        }
      }
      v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      v20 = 4294967292;
    }
    goto LABEL_19;
  }
  v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34)
    Util_DeallocRequirement(v34);
LABEL_22:
  if ((_DWORD)v20)
    v29 = 70;
  else
    v29 = 10;
  if (v29 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, _QWORD *a14, unint64_t *a15)
{
  unsigned int v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  uint64_t SerializedProcessAclSize;
  uint64_t v29;
  void *v30;
  _DWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  rsize_t v36;
  unsigned int v37;
  int v39;
  unint64_t v44;
  size_t v45;

  v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    v20 = a6;
    v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        v19 = gACMLoggingLevel;
      }
    }
  }
  v39 = a3;
  if (a8)
  {
    v22 = a8;
    v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u)
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5)
      v26 = a6 == 0;
    else
      v26 = 1;
    v27 = v26;
    v24 = 70;
    v25 = 4294967293;
    if (!a7)
      goto LABEL_79;
    if (!a8)
      goto LABEL_79;
    if (v27)
      goto LABEL_79;
    v24 = 70;
    v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12)
      goto LABEL_79;
    v45 = 0;
    v44 = 4096;
    if (gACMLoggingLevel <= 0xAu)
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if ((_DWORD)SerializedProcessAclSize)
    {
      v25 = SerializedProcessAclSize;
      v37 = 70;
      goto LABEL_74;
    }
    v29 = v45;
    v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      v37 = 70;
      v25 = 4294967292;
      goto LABEL_74;
    }
    v44 = 4096;
    v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      v35 = 0;
      v34 = 0;
      v25 = 4294967292;
      goto LABEL_68;
    }
    v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if ((_DWORD)v32 || (v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), (_DWORD)v32))
    {
      v25 = v32;
      v34 = 0;
      v35 = 0;
      goto LABEL_67;
    }
    v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13)
        *a13 = v31[1] != 0;
      v25 = 0;
      v34 = 0;
      if (v39 != 30 || !a14)
      {
        v35 = 0;
        goto LABEL_67;
      }
      v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if ((_DWORD)v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          v37 = 70;
        }
        else if ((_DWORD)v25)
        {
          v37 = 70;
        }
        else
        {
          v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel)
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        v34 = v31[2];
        if ((_DWORD)v34)
        {
          if (v33 >= v34 + 12)
          {
            v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        v34 = 0;
        v35 = 0;
        v25 = 0;
        goto LABEL_67;
      }
    }
    v34 = 0;
LABEL_84:
    v35 = 0;
    v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    v24 = 70;
    v25 = 4294967293;
    goto LABEL_79;
  }
  v24 = 70;
  v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if ((_DWORD)v25)
      v24 = 70;
    else
      v24 = 10;
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, _QWORD *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  unsigned int v21;
  uint64_t v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  v21 = 70;
  v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        v21 = 70;
        v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if ((_DWORD)v22)
              v21 = 70;
            else
              v21 = 10;
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  uint64_t (*v16)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD);
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  char *v22;
  _QWORD v24[2];

  v16 = a1;
  v24[1] = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3)
    v17 = a4 != 0;
  if (v17)
  {
    v18 = 70;
    v19 = 4294967293;
  }
  else
  {
    v18 = 70;
    v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            v20 = a4 + 36;
            MEMORY[0x1E0C80A78](a1);
            v22 = (char *)v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3)
              memcpy(v22 + 36, a3, v21);
            v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if ((_DWORD)v19)
              v18 = 70;
            else
              v18 = 10;
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  char v9;

  v9 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  v6 = v5;
  if ((_DWORD)v5)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  uint64_t v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  char v13;
  unint64_t v14;
  char v15;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  v15 = 0;
  v14 = 1;
  v13 = 0;
  v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if ((_DWORD)v8)
  {
    v11 = v8;
    v9 = 70;
  }
  else
  {
    v9 = 70;
    if (v14 > 1)
    {
      v11 = 4294967291;
    }
    else
    {
      v10 = v15 & ~a3;
      if (a4)
        v10 = v15 | a3;
      v13 = v10;
      v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if ((_DWORD)v11)
        v9 = 70;
      else
        v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, _BYTE *a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t UnlockSecret_Serialize;
  size_t v19;
  char v21;
  size_t __n;
  void *__src;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[129];
  _OWORD v27[4];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  memset(v27, 0, sizeof(v27));
  v25 = 64;
  v24 = 129;
  if (!a3)
    goto LABEL_18;
  v16 = 70;
  v17 = 4294967293;
  if (!a6 || !a7 || !a8)
    goto LABEL_14;
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    v16 = 70;
    v17 = 4294967293;
    goto LABEL_14;
  }
  UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if ((_DWORD)UnlockSecret_Serialize
    || (UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), (_DWORD)UnlockSecret_Serialize)
    || (__n = 0,
        __src = 0,
        v21 = 0,
        UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        (_DWORD)UnlockSecret_Serialize))
  {
    v17 = UnlockSecret_Serialize;
  }
  else
  {
    v19 = __n;
    if (*a7 < __n)
    {
      v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        v17 = 0;
        *a7 = v19;
        *a8 = v21;
        v16 = 10;
        goto LABEL_14;
      }
      v17 = 4294967291;
    }
  }
  v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  BOOL v16;
  uint64_t Size;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  size_t v27;
  uint64_t v29;
  void *v30;
  size_t v31;
  const void *v32;
  unint64_t v33;
  uint64_t v34;
  unsigned int v35[256];
  uint64_t v36;

  v30 = a8;
  v36 = *MEMORY[0x1E0C80C00];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  v33 = 1024;
  v34 = 0;
  if (!a1)
    goto LABEL_17;
  v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3)
    v16 = a4 != 0;
  if (v16)
  {
LABEL_17:
    v25 = 70;
    v24 = 4294967293;
    goto LABEL_21;
  }
  Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if ((_DWORD)Size)
  {
LABEL_18:
    v24 = Size;
LABEL_25:
    v25 = 70;
    goto LABEL_21;
  }
  v18 = a5;
  v19 = a2;
  v20 = (_OWORD *)MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if ((_DWORD)v23)
  {
    v24 = v23;
    goto LABEL_20;
  }
  v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if ((_DWORD)v24)
  {
LABEL_20:
    v25 = 70;
    goto LABEL_21;
  }
  v25 = 10;
  v26 = v30;
  if (!v30 || !a9)
    goto LABEL_21;
  v31 = 0;
  v32 = 0;
  Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if ((_DWORD)Size)
    goto LABEL_18;
  v27 = v31;
  if (*a9 < v31)
  {
    v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32)
    memcpy(v26, v32, v31);
  v24 = 0;
  *a9 = v27;
  v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, _BYTE *a5)
{
  size_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v18 = 4;
  v10 = a4;
  v11 = a4 + 4;
  MEMORY[0x1E0C80A78](a1);
  v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  v13 = 70;
  v14 = 4294967293;
  if (a3 && a5)
  {
    *v12 = a4;
    memcpy(v12 + 1, a3, v10);
    v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if ((_DWORD)v15)
    {
      v14 = v15;
      v13 = 70;
    }
    else if (v18 == 4)
    {
      v14 = 0;
      *a5 = 1;
      v13 = 10;
    }
    else
    {
      v13 = 70;
      v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection)
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x1E0CBBAB8];
  v4 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAB8], path);
  v5 = (task_port_t *)MEMORY[0x1E0C83DA0];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x1E0C83DA0], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t aks_auth_token_create(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t v12;
  mach_port_t aks_client_connection;
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  v12 = 3758097084;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v12 = 3758097090;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      input[2] = a2;
      input[3] = a3;
      return IOConnectCallMethod(aks_client_connection, 0x26u, input, 4u, 0, 0, 0, 0, a5, a6);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_auth_token_create", ":", 1415, "", 0, "", "");
  }
  return v12;
}

uint64_t PSPNCreateFormattedStringWithCountry_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[PSListController _insertContiguousSpecifiers:atIndex:animated:].cold.1(v0);
}

uint64_t __getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke_cold_1(v0);
}

uint64_t __getAnalyticsWorkspaceClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getProcessAnalyticsClass_block_invoke_cold_1();
}

uint64_t __getProcessAnalyticsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPRSettingsProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getPRSettingsProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFOAuthorizationCenterClass_block_invoke_cold_1(v0);
}

uint64_t __getFOAuthorizationCenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBBundleClass_block_invoke_cold_1(v0);
}

uint64_t __getOBBundleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBPrivacyPresenterClass_block_invoke_cold_1(v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAADeviceInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getAADeviceInfoClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAAURLConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getAAURLConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRemoteUIControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getRemoteUIControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getiCloudMailAccountProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getiCloudMailAccountProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

void __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;

  v0 = abort_report_np();
  -[PSViewController rootController].cold.1(v0, v1);
}

uint64_t __getPXTCCPhotoGridViewClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getAXCapabilityManagerClass_block_invoke_cold_1();
}

uint64_t __getAXCapabilityManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPGPictureInPictureProxyClass_block_invoke_cold_1(v0);
}

uint64_t __getPGPictureInPictureProxyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getADASManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getADASManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPSUICellularPlanManagerCacheClass_block_invoke_cold_1(v0);
}

uint64_t __getPSUICellularPlanManagerCacheClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCBClientClass_block_invoke_cold_1(v0);
}

uint64_t __getCBClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRTTTelephonyUtilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getRTTTelephonyUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCAMCaptureCapabilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getCAMCaptureCapabilitiesClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[PSRootController showController:animate:].cold.3(v0);
}

uint64_t __getNPSDomainAccessorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNPSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPSManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PSCalendarPolicyController calendarStatus:].cold.1(v0);
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getACAccountStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getACAccountStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAccountManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCDPStateControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPStateControllerClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return __91__PSKeychainSyncManager_promptForDevicePasscodeChangeToPasscode_overController_completion___block_invoke_2_cold_1(v0);
}

uint64_t __getCDPAccountClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCDPKeychainSyncClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPKeychainSyncClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getSecureBackupClass_block_invoke_cold_1();
}

uint64_t __getSecureBackupClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCDPContextClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCDPUIControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCDPUIControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFTDeviceSupportClass_block_invoke_cold_1(v0);
}

uint64_t __getFTDeviceSupportClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCommerceRemoteUIDelegateClass_block_invoke_cold_1(v0);
}

void __getCommerceRemoteUIDelegateClass_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;

  v0 = abort_report_np();
  +[PSAppListController specifiersFromDictionary:stringsTable:parentSpecifier:target:].cold.1(v0, v1);
}

uint64_t __getCNPrivateAccessAggregatorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCNLimitedAccessContactPickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __PSContactsAuthorizationStatesForService_block_invoke_cold_1(v0);
}

uint64_t __getSecureBackupClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:].cold.1(v0);
}

uint64_t __getDADaemonSessionClass_block_invoke_cold_1()
{
  uint8_t *v0;

  v0 = (uint8_t *)abort_report_np();
  return -[PSAccountsClientListController updateAccountSpecifier].cold.1(v0);
}

uint64_t __getFKPrivacySettingsControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getMOApprovedApplicationsManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getMOApprovedApplicationsManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getBBSettingsGatewayClass_block_invoke_cold_1();
}

uint64_t __getBBSettingsGatewayClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getDriverManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getDriverManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[PSLowPowerModeSettingsDetail setEnabled:].cold.1(v0);
}

uint64_t __getVSAccountStoreClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getPKPassLibraryClass_block_invoke_cold_1();
}

uint64_t __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBTextWelcomeControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getOBTextWelcomeControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getQuotaRequestManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getQuotaRequestManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __76__PSPhotoServicesAuthorizationLevelController__currentTCCAuthorizationRight__block_invoke_2_cold_1(v0);
}

void __getPLPrivacyClass_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;

  v0 = abort_report_np();
  __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2_cold_1(v0, v1);
}

uint64_t __getBBObserverClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNudityDetectionPreferencesHelperClass_block_invoke_cold_1(v0);
}

uint64_t __getNudityDetectionPreferencesHelperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getACActivityCenterClass_block_invoke_cold_1(v0);
}

uint64_t __getACActivityCenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getACActivityAuthorizationClass_block_invoke_cold_1(v0);
}

uint64_t __getACActivityAuthorizationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPSAppCellularUsageSpecifierClass_block_invoke_cold_1(v0);
}

uint64_t __getPSAppCellularUsageSpecifierClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFOAuthorizationCenterClass_block_invoke_cold_1_0(v0);
}

uint64_t __getFOAuthorizationCenterClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getADTrackingTransparencyClass_block_invoke_cold_1(v0);
}

uint64_t __getADTrackingTransparencyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getDOCDocumentSourceClass_block_invoke_cold_1(v0);
}

uint64_t __getDOCDocumentSourceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPRSettingsProviderClass_block_invoke_cold_1_0(v0);
}

uint64_t __getPRSettingsProviderClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PKBiometrics init].cold.1(v0);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x1E0C8A6A8]();
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0C92178](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

uint64_t BTAccessoryManagerGetControlCommand()
{
  return MEMORY[0x1E0D4E128]();
}

uint64_t BTAccessoryManagerSendControlCommand()
{
  return MEMORY[0x1E0D4E188]();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x1E0C984A8](formatter);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CLCopyAppsUsingLocation()
{
  return MEMORY[0x1E0C9E2E0]();
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1E0CFA2A0]();
}

uint64_t CTCallGetCallType()
{
  return MEMORY[0x1E0CA6BD0]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x1E0CA6BF0]();
}

uint64_t CTCellularDataPlanSetIsEnabled()
{
  return MEMORY[0x1E0CA6BF8]();
}

uint64_t CTCopyCurrentCallsWithTypes()
{
  return MEMORY[0x1E0CA6C08]();
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x1E0D27C60]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB690](*(_QWORD *)&bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1E0CBB6C8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1E0CBB958](*(_QWORD *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBB990](entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x1E0D4E4D8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1E0DAB5F8]();
}

uint64_t SCDynamicStoreAddWatchedKey()
{
  return MEMORY[0x1E0CE8730]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CE8778](allocator, store, order);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions(CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8780](allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE8798](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return (CFStringRef)MEMORY[0x1E0CE87A0](allocator, domain);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x1E0CE87E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x1E0CE87E8](*(_QWORD *)&status);
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x1E0CE8838]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1E0CE8848](interface);
}

CFDictionaryRef SCNetworkInterfaceGetConfiguration(SCNetworkInterfaceRef interface)
{
  return (CFDictionaryRef)MEMORY[0x1E0CE8850](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1E0CE8870](interface);
}

Boolean SCNetworkInterfaceSetConfiguration(SCNetworkInterfaceRef interface, CFDictionaryRef config)
{
  return MEMORY[0x1E0CE8878](interface, config);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x1E0CE8888](protocol);
}

Boolean SCNetworkProtocolSetConfiguration(SCNetworkProtocolRef protocol, CFDictionaryRef config)
{
  return MEMORY[0x1E0CE8898](protocol, config);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return (SCNetworkServiceRef)MEMORY[0x1E0CE8910](prefs, serviceID);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x1E0CE8928](service, protocolType);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x1E0CE8948](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x1E0CE8958](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x1E0CE8990](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x1E0CE8998](set);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89B8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89C0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89D0](allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1E0CE89E8](prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x1E0CE8A30](prefs);
}

uint64_t SFDeveloperSettingsBundlesDirectoryPath()
{
  return MEMORY[0x1E0D8D660]();
}

uint64_t SFIsAppWithBundleIDInstalled()
{
  return MEMORY[0x1E0D8D668]();
}

uint64_t SFKillProcessNamed()
{
  return MEMORY[0x1E0D8D670]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x1E0D8D678]();
}

uint64_t SFLocalizedStringFromTableInBundleForLanguage()
{
  return MEMORY[0x1E0D8D680]();
}

uint64_t SFObjectAndOffsetForURLPair()
{
  return MEMORY[0x1E0D8D688]();
}

uint64_t SFPerformSelector()
{
  return MEMORY[0x1E0D8D690]();
}

uint64_t SFPerformSelector2()
{
  return MEMORY[0x1E0D8D698]();
}

uint64_t SFProcessIDForProcessNamed()
{
  return MEMORY[0x1E0D8D6A0]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x1E0D8D6B0]();
}

uint64_t SFTintedImageFromMask()
{
  return MEMORY[0x1E0D8D6B8]();
}

uint64_t SOSCCCanAuthenticate()
{
  return MEMORY[0x1E0CD5CB0]();
}

uint64_t SOSCCRemoveThisDeviceFromCircle()
{
  return MEMORY[0x1E0CD5CE0]();
}

uint64_t SOSCCRequestToJoinCircle()
{
  return MEMORY[0x1E0CD5CE8]();
}

uint64_t SOSCCRequestToJoinCircleAfterRestore()
{
  return MEMORY[0x1E0CD5CF0]();
}

uint64_t SOSCCResetToEmpty()
{
  return MEMORY[0x1E0CD5CF8]();
}

uint64_t SOSCCSetUserCredentials()
{
  return MEMORY[0x1E0CD5D00]();
}

uint64_t SOSCCSetUserCredentialsAndDSID()
{
  return MEMORY[0x1E0CD5D08]();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return MEMORY[0x1E0CD5D10]();
}

uint64_t SOSCCViewSet()
{
  return MEMORY[0x1E0CD5D18]();
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x1E0CD6438]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x1E0CD6448]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x1E0DB0FA0]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x1E0DB0FA8]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1E0DB0FB0]();
}

uint64_t TCCAccessCopyInformationForBundle()
{
  return MEMORY[0x1E0DB0FC0]();
}

uint64_t TCCAccessGetOverrides()
{
  return MEMORY[0x1E0DB0FE8]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x1E0DB1060]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0CEB250]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0CEB3A8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0CEB628]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0CEB638]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

uint64_t UIKeyboardAutomaticIsOffScreen()
{
  return MEMORY[0x1E0CEB7F8]();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1E0CEB800]();
}

uint64_t UIKeyboardDisableAutomaticAppearance()
{
  return MEMORY[0x1E0CEB840]();
}

uint64_t UIKeyboardEnableAutomaticAppearance()
{
  return MEMORY[0x1E0CEB848]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x1E0CEB898]();
}

uint64_t UIKeyboardOrderInAutomatic()
{
  return MEMORY[0x1E0CEB8C8]();
}

uint64_t UIKeyboardOrderInAutomaticSkippingAnimation()
{
  return MEMORY[0x1E0CEB8D8]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x1E0CEB8E8]();
}

uint64_t UIKeyboardOrderOutAutomaticSkippingAnimation()
{
  return MEMORY[0x1E0CEB8F0]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0CEBA98]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0CEBAD0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0CEBAF8]();
}

uint64_t UISystemFontForSize()
{
  return MEMORY[0x1E0CEBC00]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x1E0DDD560]();
}

uint64_t _AXSAssistiveTouchSetEnabled()
{
  return MEMORY[0x1E0DDD5A0]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x1E0DDD6A0]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x1E0DDD6A8]();
}

uint64_t _AXSGuidedAccessHasPasscode()
{
  return MEMORY[0x1E0DDD7A0]();
}

uint64_t _AXSGuidedAccessSetEnabled()
{
  return MEMORY[0x1E0DDD7A8]();
}

uint64_t _AXSGuidedAccessStartSession()
{
  return MEMORY[0x1E0DDD7B0]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x1E0DDD9A0]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x1E0DDD9C0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1E0DDDDE0]();
}

uint64_t _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage()
{
  return MEMORY[0x1E0DDDE48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x1E0C9A300]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1E0C9A308]();
}

uint64_t _CFPreferencesPostValuesChangedInDomains()
{
  return MEMORY[0x1E0C9A358]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x1E0C9A378]();
}

uint64_t _CTServerConnectionCopyCellularUsageWorkspaceInfo()
{
  return MEMORY[0x1E0CA6E88]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1E0CA6F18]();
}

uint64_t _CTServerConnectionGetRadioModuleIsDead()
{
  return MEMORY[0x1E0CA6FC8]();
}

uint64_t _CTServerConnectionIsUserIdentityModuleRequired()
{
  return MEMORY[0x1E0CA7010]();
}

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x1E0D51A28]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x1E0D51A40]();
}

uint64_t _NETRBClientGetDynamicStoreKey()
{
  return MEMORY[0x1E0D51A48]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

uint64_t _SCNetworkInterfaceGetFamilySubType()
{
  return MEMORY[0x1E0CE8AA0]();
}

uint64_t _SCNetworkInterfaceGetFamilyType()
{
  return MEMORY[0x1E0CE8AA8]();
}

uint64_t _SCNetworkInterfaceGetIOInterfaceType()
{
  return MEMORY[0x1E0CE8AB0]();
}

uint64_t _SCNetworkInterfaceGetIORegistryEntryID()
{
  return MEMORY[0x1E0CE8AC0]();
}

uint64_t _UIUserInterfaceSizeClassForWidth()
{
  return MEMORY[0x1E0CEC308]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C80C38]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t createDescriptionForMetriclogFile()
{
  return MEMORY[0x1E0DDD098]();
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1E0DDFE88]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1E0DDFEA8]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

uint64_t lockdown_connect()
{
  return MEMORY[0x1E0DE6C48]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x1E0DE6C80]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x1E0DE6CA8]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

uint64_t setupAWDConnection()
{
  return MEMORY[0x1E0DDD0A8]();
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1E0DB1208]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1E0DB1220]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1E0DB1230]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1E0DB12A0]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1E0DB1320]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x1E0DB1328]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x1E0DB1330]();
}

uint64_t tcc_server_message_prompt_authorization_value()
{
  return MEMORY[0x1E0DB1340]();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return MEMORY[0x1E0DB1360]();
}

uint64_t tcc_server_singleton_default()
{
  return MEMORY[0x1E0DB1368]();
}

uint64_t tcc_service_get_name()
{
  return MEMORY[0x1E0DB1380]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1E0DB1390]();
}

uint64_t teardownAWDConnection()
{
  return MEMORY[0x1E0DDD0C0]();
}

uint64_t tzlink()
{
  return MEMORY[0x1E0DE8BD8]();
}

