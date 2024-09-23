@implementation PGGraphMemoryNode

+ (id)fullMemoryTypeStringWithMemoryCategorySubcategory:(unint64_t)a3 featureNodes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a4;
  PGStringForMemoryCategorySubcategory(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 11001 < 9)
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "meaningLabels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v8;
    objc_msgSend(v8, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", v6, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
    goto LABEL_6;
  }
  if (a3 - 16001 < 6)
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphSceneFeatureNodeCollection, "subsetInCollection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labels");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

+ (id)allMemoryTypeStrings
{
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  __CFString *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  __CFString *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  __CFString *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  __CFString *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  __CFString *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  __CFString *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  __CFString *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  __CFString *v106;
  __CFString *v107;
  __CFString *v108;
  __CFString *v109;
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  __CFString *v113;
  __CFString *v114;
  __CFString *v115;
  __CFString *v116;
  __CFString *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  __CFString *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  __CFString *v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  __CFString *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  __CFString *v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  __CFString *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  __CFString *v159;
  __CFString *v160;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTrendsMemoryGenerator allTrendSceneFeatureLabels](PGTrendsMemoryGenerator, "allTrendSceneFeatureLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("None");
  objc_msgSend(v2, "addObject:", CFSTR("None"));

  v6 = CFSTR("MomentsSingleMoment");
  objc_msgSend(v2, "addObject:", CFSTR("MomentsSingleMoment"));

  v7 = CFSTR("PersonYear");
  objc_msgSend(v2, "addObject:", CFSTR("PersonYear"));

  v8 = CFSTR("PersonSeason");
  objc_msgSend(v2, "addObject:", CFSTR("PersonSeason"));

  v9 = CFSTR("PersonOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("PersonOverTheYears"));

  v10 = CFSTR("PersonEarlyMoments");
  objc_msgSend(v2, "addObject:", CFSTR("PersonEarlyMoments"));

  v11 = CFSTR("PersonExcitingMomentsYear");
  objc_msgSend(v2, "addObject:", CFSTR("PersonExcitingMomentsYear"));

  v12 = CFSTR("PersonExcitingMomentsOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("PersonExcitingMomentsOverTheYears"));

  v13 = CFSTR("SocialGroupYear");
  objc_msgSend(v2, "addObject:", CFSTR("SocialGroupYear"));

  v14 = CFSTR("SocialGroupOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("SocialGroupOverTheYears"));

  v15 = CFSTR("HomeLastMonth");
  objc_msgSend(v2, "addObject:", CFSTR("HomeLastMonth"));

  v16 = CFSTR("InReviewYear");
  objc_msgSend(v2, "addObject:", CFSTR("InReviewYear"));

  v17 = CFSTR("InReviewRecents");
  objc_msgSend(v2, "addObject:", CFSTR("InReviewRecents"));

  v18 = CFSTR("FoodieGenericYear");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieGenericYear"));

  v19 = CFSTR("FoodieGenericOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieGenericOverTheYears"));

  v20 = CFSTR("FoodiePersonYear");
  objc_msgSend(v2, "addObject:", CFSTR("FoodiePersonYear"));

  v21 = CFSTR("FoodiePersonOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("FoodiePersonOverTheYears"));

  v22 = CFSTR("FoodieCityYear");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieCityYear"));

  v23 = CFSTR("FoodieCityOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieCityOverTheYears"));

  v24 = CFSTR("FoodieRestaurantYear");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieRestaurantYear"));

  v25 = CFSTR("FoodieRestaurantOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieRestaurantOverTheYears"));

  v26 = CFSTR("FoodieHomeYear");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieHomeYear"));

  v27 = CFSTR("FoodieHomeOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieHomeOverTheYears"));

  v28 = CFSTR("FoodieTrip");
  objc_msgSend(v2, "addObject:", CFSTR("FoodieTrip"));

  v29 = CFSTR("PetYear");
  objc_msgSend(v2, "addObject:", CFSTR("PetYear"));

  v30 = CFSTR("PetSeason");
  objc_msgSend(v2, "addObject:", CFSTR("PetSeason"));

  v31 = CFSTR("PetOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("PetOverTheYears"));

  v32 = CFSTR("PetWithPersonOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("PetWithPersonOverTheYears"));

  v33 = CFSTR("PetOutdoorYear");
  objc_msgSend(v2, "addObject:", CFSTR("PetOutdoorYear"));

  v34 = CFSTR("PetOutdoorOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("PetOutdoorOverTheYears"));

  v35 = CFSTR("BabyYear");
  objc_msgSend(v2, "addObject:", CFSTR("BabyYear"));

  v36 = CFSTR("BabyOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("BabyOverTheYears"));

  v37 = CFSTR("LocationCityYear");
  objc_msgSend(v2, "addObject:", CFSTR("LocationCityYear"));

  v38 = CFSTR("LocationCityOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("LocationCityOverTheYears"));

  v39 = CFSTR("LocationAreaYear");
  objc_msgSend(v2, "addObject:", CFSTR("LocationAreaYear"));

  v40 = CFSTR("LocationAreaOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("LocationAreaOverTheYears"));

  v41 = CFSTR("ROIYear");
  objc_msgSend(v2, "addObject:", CFSTR("ROIYear"));

  v42 = CFSTR("ROIOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("ROIOverTheYears"));

  v43 = CFSTR("MeaningfulEventSingleEvent");
  v218 = 0u;
  v219 = 0u;
  v220 = 0u;
  v221 = 0u;
  v44 = v3;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v218, v236, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v219;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v219 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventSingleEvent"), *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * v48));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v49);

        ++v48;
      }
      while (v46 != v48);
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v218, v236, 16);
    }
    while (v46);
  }

  v50 = CFSTR("MeaningfulEventGenericYear");
  v214 = 0u;
  v215 = 0u;
  v216 = 0u;
  v217 = 0u;
  v51 = v44;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v214, v235, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v215;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v215 != v54)
          objc_enumerationMutation(v51);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventGenericYear"), *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * v55));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v56);

        ++v55;
      }
      while (v53 != v55);
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v214, v235, 16);
    }
    while (v53);
  }

  v57 = CFSTR("MeaningfulEventGenericOverTheYears");
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  v58 = v51;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v210, v234, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v211;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v211 != v61)
          objc_enumerationMutation(v58);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventGenericOverTheYears"), *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * v62));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v63);

        ++v62;
      }
      while (v60 != v62);
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v210, v234, 16);
    }
    while (v60);
  }

  v64 = CFSTR("MeaningfulEventSocialGroupYear");
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v65 = v58;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v206, v233, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v207;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v207 != v68)
          objc_enumerationMutation(v65);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventSocialGroupYear"), *(_QWORD *)(*((_QWORD *)&v206 + 1) + 8 * v69));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v70);

        ++v69;
      }
      while (v67 != v69);
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v206, v233, 16);
    }
    while (v67);
  }

  v71 = CFSTR("MeaningfulEventSocialGroupOverTheYears");
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v205 = 0u;
  v72 = v65;
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v202, v232, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v203;
    do
    {
      v76 = 0;
      do
      {
        if (*(_QWORD *)v203 != v75)
          objc_enumerationMutation(v72);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventSocialGroupOverTheYears"), *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * v76));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v77);

        ++v76;
      }
      while (v74 != v76);
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v202, v232, 16);
    }
    while (v74);
  }

  v78 = CFSTR("MeaningfulEventAreaYear");
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v79 = v72;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v198, v231, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v199;
    do
    {
      v83 = 0;
      do
      {
        if (*(_QWORD *)v199 != v82)
          objc_enumerationMutation(v79);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventAreaYear"), *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * v83));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v84);

        ++v83;
      }
      while (v81 != v83);
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v198, v231, 16);
    }
    while (v81);
  }

  v85 = CFSTR("MeaningfulEventAreaOverTheYears");
  v194 = 0u;
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v86 = v79;
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v194, v230, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v195;
    do
    {
      v90 = 0;
      do
      {
        if (*(_QWORD *)v195 != v89)
          objc_enumerationMutation(v86);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventAreaOverTheYears"), *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * v90));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v91);

        ++v90;
      }
      while (v88 != v90);
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v194, v230, 16);
    }
    while (v88);
  }

  v92 = CFSTR("MeaningfulEventCityYear");
  v190 = 0u;
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  v93 = v86;
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v190, v229, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v191;
    do
    {
      v97 = 0;
      do
      {
        if (*(_QWORD *)v191 != v96)
          objc_enumerationMutation(v93);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventCityYear"), *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * v97));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v98);

        ++v97;
      }
      while (v95 != v97);
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v190, v229, 16);
    }
    while (v95);
  }

  v99 = CFSTR("MeaningfulEventCityOverTheYears");
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v100 = v93;
  v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v186, v228, 16);
  if (v101)
  {
    v102 = v101;
    v103 = *(_QWORD *)v187;
    do
    {
      v104 = 0;
      do
      {
        if (*(_QWORD *)v187 != v103)
          objc_enumerationMutation(v100);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("MeaningfulEventCityOverTheYears"), *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * v104));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v105);

        ++v104;
      }
      while (v102 != v104);
      v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v186, v228, 16);
    }
    while (v102);
  }

  v106 = CFSTR("TripTrip");
  objc_msgSend(v2, "addObject:", CFSTR("TripTrip"));

  v107 = CFSTR("TripRecurrent");
  objc_msgSend(v2, "addObject:", CFSTR("TripRecurrent"));

  v108 = CFSTR("TripOngoingTrip");
  objc_msgSend(v2, "addObject:", CFSTR("TripOngoingTrip"));

  v109 = CFSTR("SupersetPast");
  objc_msgSend(v2, "addObject:", CFSTR("SupersetPast"));

  v110 = CFSTR("SeasonSingleSeason");
  objc_msgSend(v2, "addObject:", CFSTR("SeasonSingleSeason"));

  v111 = CFSTR("ChildActivityYear");
  objc_msgSend(v2, "addObject:", CFSTR("ChildActivityYear"));

  v112 = CFSTR("ChildActivityOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("ChildActivityOverTheYears"));

  v113 = CFSTR("ChildWithPersonYear");
  objc_msgSend(v2, "addObject:", CFSTR("ChildWithPersonYear"));

  v114 = CFSTR("ChildWithPersonOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("ChildWithPersonOverTheYears"));

  v115 = CFSTR("ChildOutdoorYear");
  objc_msgSend(v2, "addObject:", CFSTR("ChildOutdoorYear"));

  v116 = CFSTR("ChildOutdoorOverTheYears");
  objc_msgSend(v2, "addObject:", CFSTR("ChildOutdoorOverTheYears"));

  v117 = CFSTR("TrendsGenericYear");
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v118 = v4;
  v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v182, v227, 16);
  if (v119)
  {
    v120 = v119;
    v121 = *(_QWORD *)v183;
    do
    {
      v122 = 0;
      do
      {
        if (*(_QWORD *)v183 != v121)
          objc_enumerationMutation(v118);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("TrendsGenericYear"), *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * v122));
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v123);

        ++v122;
      }
      while (v120 != v122);
      v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v182, v227, 16);
    }
    while (v120);
  }

  v124 = CFSTR("TrendsGenericOverTheYears");
  v178 = 0u;
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v125 = v118;
  v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v178, v226, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v179;
    do
    {
      v129 = 0;
      do
      {
        if (*(_QWORD *)v179 != v128)
          objc_enumerationMutation(v125);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("TrendsGenericOverTheYears"), *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * v129));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v130);

        ++v129;
      }
      while (v127 != v129);
      v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v178, v226, 16);
    }
    while (v127);
  }

  v131 = CFSTR("TrendsPersonYear");
  v174 = 0u;
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v132 = v125;
  v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v174, v225, 16);
  if (v133)
  {
    v134 = v133;
    v135 = *(_QWORD *)v175;
    do
    {
      v136 = 0;
      do
      {
        if (*(_QWORD *)v175 != v135)
          objc_enumerationMutation(v132);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("TrendsPersonYear"), *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * v136));
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v137);

        ++v136;
      }
      while (v134 != v136);
      v134 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v174, v225, 16);
    }
    while (v134);
  }

  v138 = CFSTR("TrendsPersonOverTheYears");
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v139 = v132;
  v140 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v170, v224, 16);
  if (v140)
  {
    v141 = v140;
    v142 = *(_QWORD *)v171;
    do
    {
      v143 = 0;
      do
      {
        if (*(_QWORD *)v171 != v142)
          objc_enumerationMutation(v139);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("TrendsPersonOverTheYears"), *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * v143));
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v144);

        ++v143;
      }
      while (v141 != v143);
      v141 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v170, v224, 16);
    }
    while (v141);
  }

  v145 = CFSTR("TrendsCityYear");
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v146 = v139;
  v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v166, v223, 16);
  if (v147)
  {
    v148 = v147;
    v149 = *(_QWORD *)v167;
    do
    {
      v150 = 0;
      do
      {
        if (*(_QWORD *)v167 != v149)
          objc_enumerationMutation(v146);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("TrendsCityYear"), *(_QWORD *)(*((_QWORD *)&v166 + 1) + 8 * v150));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v151);

        ++v150;
      }
      while (v148 != v150);
      v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v166, v223, 16);
    }
    while (v148);
  }

  v152 = CFSTR("TrendsCityOverTheYears");
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v153 = v146;
  v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v162, v222, 16);
  if (v154)
  {
    v155 = v154;
    v156 = *(_QWORD *)v163;
    do
    {
      v157 = 0;
      do
      {
        if (*(_QWORD *)v163 != v156)
          objc_enumerationMutation(v153);
        objc_msgSend((id)objc_opt_class(), "fullyQualifiedMemoryTypeForMemoryType:withPrefix:", CFSTR("TrendsCityOverTheYears"), *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * v157), (_QWORD)v162);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v158);

        ++v157;
      }
      while (v155 != v157);
      v155 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v162, v222, 16);
    }
    while (v155);
  }

  v159 = CFSTR("MomentsDayInHistoryAggregation");
  objc_msgSend(v2, "addObject:", CFSTR("MomentsDayInHistoryAggregation"));

  v160 = CFSTR("ContentCreationToolOverTime");
  objc_msgSend(v2, "addObject:", CFSTR("ContentCreationToolOverTime"));

  return v2;
}

+ (id)fullyQualifiedMemoryTypeForMemoryType:(id)a3 withPrefix:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  if (-[__CFString length](v6, "length"))
  {
    v7 = v6;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "[PGGraphMemoryNode] qualifier prefix for MemoryTypeString: %@ is nil", (uint8_t *)&v12, 0xCu);
    }

    v7 = CFSTR("Unknown");
  }
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PGGraphMemoryNode)initWithLabel:(id)a3 memoryCategorySubcategory:(unint64_t)a4 uniqueMemoryIdentifier:(id)a5 generatedWithFallbackRequirements:(BOOL)a6
{
  id v10;
  id v11;
  PGGraphMemoryNode *v12;
  uint64_t v13;
  NSString *label;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphMemoryNode;
  v12 = -[PGGraphNode init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    label = v12->_label;
    v12->_label = (NSString *)v13;

    objc_storeStrong((id *)&v12->_uniqueMemoryIdentifier, a5);
    v12->_memoryCategorySubcategory = a4;
    v12->_generatedWithFallbackRequirements = a6;
  }

  return v12;
}

- (PGGraphMemoryNode)initWithLabel:(id)a3 memoryCategorySubcategory:(unint64_t)a4 uniqueMemoryIdentifier:(id)a5
{
  return -[PGGraphMemoryNode initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:](self, "initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:", a3, a4, a5, 0);
}

- (PGGraphMemoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  PGGraphMemoryNode *v14;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("memid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subcategory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("generatedWithFallbackRequirements"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "BOOLValue");
  v14 = -[PGGraphMemoryNode initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:](self, "initWithLabel:memoryCategorySubcategory:uniqueMemoryIdentifier:generatedWithFallbackRequirements:", v8, v11, v9, v13);

  return v14;
}

- (unsigned)domain
{
  return 1100;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("memid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_uniqueMemoryIdentifier))
      goto LABEL_11;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subcategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "unsignedIntegerValue") != self->_memoryCategorySubcategory)
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("generatedWithFallbackRequirements"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9 && self->_generatedWithFallbackRequirements != objc_msgSend(v9, "BOOLValue"))
LABEL_11:
      v10 = 0;
    else
      v10 = 1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uniqueMemoryIdentifier, CFSTR("memid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_memoryCategorySubcategory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("subcategory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_generatedWithFallbackRequirements);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("generatedWithFallbackRequirements"));

  return v3;
}

- (NSString)description
{
  void *v3;
  NSString *label;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  label = self->_label;
  PGStringForMemoryCategorySubcategory(self->_memoryCategorySubcategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PGGraphMemoryNode - (%@, %@, %@)"), label, v5, self->_uniqueMemoryIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (PGGraphMemoryNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphMemoryNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)memoryCategory
{
  return +[PGGraphBuilder memoryCategoryForLabel:](PGGraphBuilder, "memoryCategoryForLabel:", self->_label);
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  void *v2;
  void *v3;

  -[PGGraphMemoryNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v3;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  void *v3;
  void *v4;

  -[PGGraphMemoryNode collection](self, "collection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  void *v2;
  void *v3;

  -[PGGraphMemoryNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphFeatureNodeCollection *)v3;
}

- (id)label
{
  return self->_label;
}

- (NSString)uniqueMemoryIdentifier
{
  return self->_uniqueMemoryIdentifier;
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 1100);
}

+ (id)filterWithMemoryCategory:(unint64_t)a3
{
  void *v3;
  void *v4;

  +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", v3, 1100);

  return v4;
}

+ (id)filterWithMemoryCategories:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PGGraphMemoryNode_filterWithMemoryCategories___block_invoke;
  v10[3] = &unk_1E8434FA8;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v10);

  v7 = objc_alloc(MEMORY[0x1E0D42A50]);
  v8 = (void *)objc_msgSend(v7, "initWithLabels:domain:properties:", v6, 1100, MEMORY[0x1E0C9AA70]);

  return v8;
}

+ (id)filterWithUniqueMemoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("memid");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)filterWithUniqueMemoryIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("memid");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)filterWithUniqueMemoryIdentifierArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("memid");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (MARelation)featureOfMemory
{
  void *v2;
  void *v3;

  +[PGGraphMemoryFeaturesEdge filter](PGGraphMemoryFeaturesEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentOfMemory
{
  void *v2;
  void *v3;

  +[PGGraphMemoryContainsAssetsFromEdge filter](PGGraphMemoryContainsAssetsFromEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)uniqueMemoryIdentifierWithMemoryLabel:(id)a3 featureNodes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "featureIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("|"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@|%@"), v5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __48__PGGraphMemoryNode_filterWithMemoryCategories___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v2 = a2;
  v8 = *MEMORY[0x1E0C80C00];
  +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Unknown")))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v2;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "[PGGraphMemoryNode filterWithMemoryCategories:] passed an unsupported category %d", (uint8_t *)v7, 8u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

@end
