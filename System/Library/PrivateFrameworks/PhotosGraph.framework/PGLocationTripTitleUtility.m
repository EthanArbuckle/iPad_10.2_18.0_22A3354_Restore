@implementation PGLocationTripTitleUtility

- (PGLocationTripTitleUtility)initWithMomentNodes:(id)a3 filterMomentsAndCities:(BOOL)a4 locationHelper:(id)a5
{
  return -[PGLocationTripTitleUtility initWithMomentNodes:filterMomentsAndCities:allowLongAOI:locationHelper:](self, "initWithMomentNodes:filterMomentsAndCities:allowLongAOI:locationHelper:", a3, a4, 0, a5);
}

- (PGLocationTripTitleUtility)initWithMomentNodes:(id)a3 filterMomentsAndCities:(BOOL)a4 allowLongAOI:(BOOL)a5 locationHelper:(id)a6
{
  id v11;
  id v12;
  PGLocationTripTitleUtility *v13;
  PGLocationTripTitleUtility *v14;
  void *v15;
  PGIncompleteLocationResolver *v16;
  PGIncompleteLocationResolver *incompleteLocationResolver;
  objc_super v19;

  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PGLocationTripTitleUtility;
  v13 = -[PGLocationTripTitleUtility init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_momentNodes, a3);
    v14->_filterMomentsAndCities = a4;
    v14->_allowLongAOI = a5;
    +[PGCommonTitleUtility addressNodesFromMomentNodes:](PGCommonTitleUtility, "addressNodesFromMomentNodes:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PGIncompleteLocationResolver initWithAddressNodes:locationHelper:]([PGIncompleteLocationResolver alloc], "initWithAddressNodes:locationHelper:", v15, v12);
    incompleteLocationResolver = v14->_incompleteLocationResolver;
    v14->_incompleteLocationResolver = v16;

    objc_storeStrong((id *)&v14->_locationHelper, a6);
    -[PGLocationTripTitleUtility _generateLocationTitle](v14, "_generateLocationTitle");

  }
  return v14;
}

- (void)_generateLocationTitle
{
  NSSet *momentNodes;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  momentNodes = self->_momentNodes;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestampUTCStart"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet sortedArrayUsingDescriptors:](momentNodes, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PGLocationTripTitleUtility__generateLocationTitle__block_invoke;
  v8[3] = &unk_1E842F178;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PGLocationTripTitleUtility _resolveMomentNodes:withResult:](self, "_resolveMomentNodes:withResult:", v7, v8);

}

- (void)_generateTitleForMomentNodes:(id)a3 resolvedMomentNodes:(id)a4 resolvedLocations:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  PGLocationTripTitleUtility *v28;
  PGGraphLocationCountryNodeCollection *v29;
  PGGraphLocationCountryNodeCollection *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t *v34;
  PGGraphLocationStateNodeCollection *v35;
  PGGraphLocationStateNodeCollection *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  id v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t m;
  void *v48;
  int v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  _BOOL4 v58;
  uint64_t v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  BOOL v64;
  PGGraphLocationHelper *v65;
  uint64_t v66;
  int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  int v92;
  int v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  int v98;
  char v99;
  PGGraphLocationHelper *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  int v115;
  int v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  _BOOL8 allowLongAOI;
  void *v132;
  void *v133;
  NSString *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  NSObject *v141;
  void *v142;
  void *v143;
  NSString *title;
  NSString *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  int v150;
  int v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  int v163;
  int v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  int v175;
  unsigned int v176;
  int v177;
  unint64_t v178;
  int v179;
  int v180;
  PGGraphMomentNodeCollection *v181;
  id v182;
  void *v183;
  id v184;
  void *v185;
  void *v187;
  id obj;
  id obja;
  uint8_t v190[16];
  _QWORD v191[8];
  _QWORD aBlock[4];
  id v193;
  PGGraphLocationHelper *v194;
  PGLocationTripTitleUtility *v195;
  uint64_t *v196;
  _QWORD v197[8];
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
  _QWORD v210[4];
  id v211;
  id v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _QWORD v217[7];
  uint64_t v218;
  uint64_t *v219;
  uint64_t v220;
  uint64_t (*v221)(uint64_t, uint64_t);
  void (*v222)(uint64_t);
  id v223;
  uint64_t v224;
  uint64_t *v225;
  uint64_t v226;
  uint64_t (*v227)(uint64_t, uint64_t);
  void (*v228)(uint64_t);
  id v229;
  uint64_t v230;
  uint64_t *v231;
  uint64_t v232;
  uint64_t (*v233)(uint64_t, uint64_t);
  void (*v234)(uint64_t);
  id v235;
  uint64_t v236;
  uint64_t *v237;
  uint64_t v238;
  uint64_t (*v239)(uint64_t, uint64_t);
  void (*v240)(uint64_t);
  id v241;
  uint64_t v242;
  uint64_t *v243;
  uint64_t v244;
  uint64_t (*v245)(uint64_t, uint64_t);
  void (*v246)(uint64_t);
  id v247;
  uint8_t buf[8];
  uint8_t *v249;
  uint64_t v250;
  uint64_t (*v251)(uint64_t, uint64_t);
  void (*v252)(uint64_t);
  id v253;
  _QWORD v254[2];
  void *v255;
  _QWORD v256[2];
  void *v257;
  _QWORD v258[2];
  void *v259;
  _QWORD v260[2];
  void *v261;
  _QWORD v262[2];
  void *v263;
  _QWORD v264[2];
  void *v265;
  uint64_t v266;
  uint64_t v267;
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  uint64_t v272;

  v272 = *MEMORY[0x1E0C80C00];
  v184 = a3;
  v7 = a4;
  v182 = a5;
  v183 = v7;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "graph");
  v185 = (void *)objc_claimAutoreleasedReturnValue();

  if (v185)
  {
    *(_QWORD *)buf = 0;
    v249 = buf;
    v250 = 0x3032000000;
    v251 = __Block_byref_object_copy__45384;
    v252 = __Block_byref_object_dispose__45385;
    v253 = 0;
    v242 = 0;
    v243 = &v242;
    v244 = 0x3032000000;
    v245 = __Block_byref_object_copy__45384;
    v246 = __Block_byref_object_dispose__45385;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v247 = (id)objc_claimAutoreleasedReturnValue();
    v236 = 0;
    v237 = &v236;
    v238 = 0x3032000000;
    v239 = __Block_byref_object_copy__45384;
    v240 = __Block_byref_object_dispose__45385;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v241 = (id)objc_claimAutoreleasedReturnValue();
    v230 = 0;
    v231 = &v230;
    v232 = 0x3032000000;
    v233 = __Block_byref_object_copy__45384;
    v234 = __Block_byref_object_dispose__45385;
    v235 = 0;
    v224 = 0;
    v225 = &v224;
    v226 = 0x3032000000;
    v227 = __Block_byref_object_copy__45384;
    v228 = __Block_byref_object_dispose__45385;
    v229 = 0;
    v218 = 0;
    v219 = &v218;
    v220 = 0x3032000000;
    v221 = __Block_byref_object_copy__45384;
    v222 = __Block_byref_object_dispose__45385;
    v223 = 0;
    v9 = (void *)objc_opt_class();
    v217[0] = MEMORY[0x1E0C809B0];
    v217[1] = 3221225472;
    v217[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke;
    v217[3] = &unk_1E842F1A0;
    v217[4] = &v230;
    v217[5] = &v224;
    v217[6] = &v218;
    objc_msgSend(v9, "_cityStateAndCountryNodesForLocationNodes:result:", v182, v217);
    if (!objc_msgSend((id)v219[5], "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v215 = 0u;
      v216 = 0u;
      v213 = 0u;
      v214 = 0u;
      obj = v184;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v213, v271, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v214;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v214 != v13)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v213 + 1) + 8 * i), "collection");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addressNodes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stateNodes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v210[0] = MEMORY[0x1E0C809B0];
            v210[1] = 3221225472;
            v210[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_2;
            v210[3] = &unk_1E842F1F0;
            v211 = v11;
            v212 = v10;
            objc_msgSend(v17, "enumerateNodesUsingBlock:", v210);

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v213, v271, 16);
        }
        while (v12);
      }

      v18 = (void *)v219[5];
      v219[5] = (uint64_t)v10;
      v19 = v10;

      v20 = (void *)v225[5];
      v225[5] = (uint64_t)v11;

    }
    if (objc_msgSend((id)v219[5], "count") == 1
      && (objc_msgSend((id)v219[5], "firstObject"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v21, "name"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = +[PGCountrySize isLargeCountry:](PGCountrySize, "isLargeCountry:", v22),
          v22,
          v21,
          v23))
    {
      v178 = objc_msgSend((id)v225[5], "count");
      v179 = 1;
    }
    else
    {
      v178 = objc_msgSend((id)v219[5], "count");
      v179 = 0;
    }
    objc_msgSend(v185, "supersetCountryNodes");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "supersetStateNodes");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = 0u;
    v209 = 0u;
    v206 = 0u;
    v207 = 0u;
    v24 = (id)v219[5];
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v206, v270, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v207;
      while (2)
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v207 != v26)
            objc_enumerationMutation(v24);
          if ((objc_msgSend(obja, "containsNode:", *(_QWORD *)(*((_QWORD *)&v206 + 1) + 8 * j)) & 1) == 0)
          {
            v180 = 0;
            goto LABEL_25;
          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v206, v270, 16);
        if (v25)
          continue;
        break;
      }
    }
    v180 = 1;
LABEL_25:

    v28 = self;
    v181 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", self->_momentNodes, v185);
    if (v219[5])
    {
      v29 = [PGGraphLocationCountryNodeCollection alloc];
      v30 = -[MAElementCollection initWithArray:graph:](v29, "initWithArray:graph:", v219[5], v185);
      -[PGGraphLocationHelper addressNodesFromLocationNodes:](self->_locationHelper, "addressNodesFromLocationNodes:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = objc_msgSend((id)objc_opt_class(), "visitedLocations:onlyDuringMoments:locationHelper:", v31, v181, self->_locationHelper);

      v28 = self;
    }
    else
    {
      v176 = 0;
    }
    v34 = v225;
    if (v225[5])
    {
      v35 = [PGGraphLocationStateNodeCollection alloc];
      v36 = -[MAElementCollection initWithArray:graph:](v35, "initWithArray:graph:", v225[5], v185);
      -[PGGraphLocationHelper addressNodesFromLocationNodes:](v28->_locationHelper, "addressNodesFromLocationNodes:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = objc_msgSend((id)objc_opt_class(), "visitedLocations:onlyDuringMoments:locationHelper:", v37, v181, v28->_locationHelper);

      v34 = v225;
    }
    else
    {
      v177 = 0;
    }
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v38 = (id)v34[5];
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v202, v269, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v203;
      while (2)
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v203 != v40)
            objc_enumerationMutation(v38);
          if ((objc_msgSend(v187, "containsNode:", *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * k)) & 1) != 0)
          {
            v175 = 1;
            goto LABEL_44;
          }
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v202, v269, 16);
        if (v39)
          continue;
        break;
      }
    }
    v175 = 0;
LABEL_44:

    v200 = 0u;
    v201 = 0u;
    v198 = 0u;
    v199 = 0u;
    v42 = (id)v219[5];
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v198, v268, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v199;
      v45 = 1;
      v46 = 1;
      do
      {
        for (m = 0; m != v43; ++m)
        {
          if (*(_QWORD *)v199 != v44)
            objc_enumerationMutation(v42);
          v48 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * m);
          v49 = objc_msgSend(obja, "containsNode:", v48);
          objc_msgSend(v48, "name");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = +[PGCountrySize isLargeCountry:](PGCountrySize, "isLargeCountry:", v50);

          v46 &= v49 ^ 1;
          v45 &= !v51;
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v198, v268, 16);
      }
      while (v43);
    }
    else
    {
      v45 = 1;
      v46 = 1;
    }

    objc_msgSend(v184, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "lastObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "universalEndDate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "universalStartDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "timeIntervalSinceDate:", v55);
    v57 = v56;

    v58 = v57 >= 1209600.0 && (unint64_t)objc_msgSend((id)v219[5], "count") > 4;
    objc_msgSend((id)objc_opt_class(), "_filteredCityNodesByNameForCityNodes:", v231[5]);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v231[5];
    v231[5] = v59;

    v61 = objc_msgSend((id)v231[5], "count");
    v62 = v61;
    v64 = (float)((float)v178 * 1.2) > (float)v61 && v61 != 0;
    v65 = self->_locationHelper;
    v66 = objc_msgSend((id)v225[5], "count");
    v67 = v179 | v180;
    if (v66 != 1)
      v67 = 0;
    if ((v67 & v177) == 1)
    {
      objc_msgSend((id)v225[5], "firstObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v68, v65);
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = (void *)v69;
      if (v69)
      {
        v267 = v69;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v267, 1);
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = (void *)*((_QWORD *)v249 + 5);
        *((_QWORD *)v249 + 5) = v71;

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v68);
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v243[5];
        v243[5] = v73;

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v68);
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = (void *)v237[5];
        v237[5] = v75;

        self->_tripTitleLocationType = 2;
        if (v180)
          self->_tripTitleType = 2;
      }
    }
    else
    {
      v77 = objc_msgSend((id)v219[5], "count");
      v78 = v179;
      if (v77 != 1)
        v78 = 1;
      if (((v180 | v78) & 1) != 0 || ((v176 ^ 1) & 1) != 0)
      {
        if (v62 == 1)
        {
          objc_msgSend((id)v231[5], "firstObject");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v219[5], "firstObject");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v197[0] = MEMORY[0x1E0C809B0];
          v197[1] = 3221225472;
          v197[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_4;
          v197[3] = &unk_1E842F218;
          v197[6] = &v242;
          v197[7] = &v236;
          v197[4] = self;
          v197[5] = buf;
          -[PGLocationTripTitleUtility _cityTitleWithCityNode:countryNode:visitedCountryOnlyOnce:momentNodes:result:](self, "_cityTitleWithCityNode:countryNode:visitedCountryOnlyOnce:momentNodes:result:", v68, v86, v176, v183, v197);

        }
        else
        {
          if (((v175 | v179 ^ 1) & 1) != 0 || v62 < 3)
          {
            v98 = v45 ^ 1;
            if (v62 < 3)
              v98 = 1;
            if (((v98 | v46 ^ 1 | v58) & 1) != 0)
            {
              if (v64)
                goto LABEL_93;
              v99 = v180 ^ 1;
              if (v62 - 1 > 3)
                v99 = 1;
              if ((v99 & 1) == 0)
              {
LABEL_93:
                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                aBlock[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_5;
                aBlock[3] = &unk_1E842F268;
                v193 = v183;
                v100 = v65;
                v194 = v100;
                v195 = self;
                v196 = &v230;
                v101 = _Block_copy(aBlock);
                (*((void (**)(void *, _QWORD, _QWORD))v101 + 2))(v101, 0, 0);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(void *, uint64_t, void *))v101 + 2))(v101, 1, v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v102, v103, 0);
                v104 = objc_claimAutoreleasedReturnValue();
                v105 = (void *)v243[5];
                v243[5] = v104;

                objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v231[5]);
                v106 = objc_claimAutoreleasedReturnValue();
                v107 = (void *)v237[5];
                v237[5] = v106;

                self->_tripTitleLocationType = 1;
                +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v102, v100);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v103, v100);
                v109 = objc_claimAutoreleasedReturnValue();
                v110 = (void *)v109;
                if (v108)
                {
                  if (v109 && !objc_msgSend(v102, "isSameNodeAsNode:", v103))
                  {
                    v260[0] = v108;
                    v260[1] = v110;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v260, 2);
                    v154 = objc_claimAutoreleasedReturnValue();
                    v155 = (void *)*((_QWORD *)v249 + 5);
                    *((_QWORD *)v249 + 5) = v154;

                    if ((unint64_t)objc_msgSend((id)v231[5], "count") >= 3)
                      self->_tripTitleType = 4;
                  }
                  else
                  {
                    v261 = v108;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v261, 1);
                    v111 = objc_claimAutoreleasedReturnValue();
                    v112 = (void *)*((_QWORD *)v249 + 5);
                    *((_QWORD *)v249 + 5) = v111;

                  }
                }

                v68 = v193;
                goto LABEL_110;
              }
              if (!v179
                || !objc_msgSend((id)v225[5], "count")
                || (unint64_t)objc_msgSend((id)v225[5], "count") >= 5)
              {
                if (!v180)
                {
                  if (!objc_msgSend((id)v219[5], "count"))
                    goto LABEL_111;
                  objc_msgSend((id)v219[5], "firstObject");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v219[5], "lastObject");
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v68, v65);
                  v157 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v156, v65);
                  v158 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v68, v156, 0);
                  v159 = objc_claimAutoreleasedReturnValue();
                  v160 = (void *)v243[5];
                  v243[5] = v159;

                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v219[5]);
                  v161 = objc_claimAutoreleasedReturnValue();
                  v162 = (void *)v237[5];
                  v237[5] = v161;

                  self->_tripTitleLocationType = 3;
                  if (v157)
                  {
                    v163 = objc_msgSend(v68, "isSameNodeAsNode:", v156);
                    if (v158)
                      v164 = v163;
                    else
                      v164 = 1;
                    if (v164 == 1)
                    {
                      v257 = v157;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v257, 1);
                      v165 = objc_claimAutoreleasedReturnValue();
                      v166 = (void *)*((_QWORD *)v249 + 5);
                      *((_QWORD *)v249 + 5) = v165;

                    }
                    else if (v58)
                    {
                      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                      v169 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v169, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTripWorldTrip"), CFSTR("PGLocationTitleFormatTripWorldTrip"), CFSTR("Localizable"));
                      v170 = (void *)objc_claimAutoreleasedReturnValue();
                      v255 = v170;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v255, 1);
                      v171 = objc_claimAutoreleasedReturnValue();
                      v172 = (void *)*((_QWORD *)v249 + 5);
                      *((_QWORD *)v249 + 5) = v171;

                    }
                    else
                    {
                      v256[0] = v157;
                      v256[1] = v158;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v256, 2);
                      v173 = objc_claimAutoreleasedReturnValue();
                      v174 = (void *)*((_QWORD *)v249 + 5);
                      *((_QWORD *)v249 + 5) = v173;

                      if ((unint64_t)objc_msgSend((id)v219[5], "count") >= 3)
                        self->_tripTitleType = 4;
                    }
                  }

                  goto LABEL_110;
                }
                if (!objc_msgSend((id)v225[5], "count"))
                  goto LABEL_111;
              }
              objc_msgSend((id)v225[5], "firstObject");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v225[5], "lastObject");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v68, v65);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v87, v65);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v68, v87, 0);
              v146 = objc_claimAutoreleasedReturnValue();
              v147 = (void *)v243[5];
              v243[5] = v146;

              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v225[5]);
              v148 = objc_claimAutoreleasedReturnValue();
              v149 = (void *)v237[5];
              v237[5] = v148;

              self->_tripTitleLocationType = 2;
              if (v88)
              {
                v150 = objc_msgSend(v68, "isSameNodeAsNode:", v87);
                if (v89)
                  v151 = v150;
                else
                  v151 = 1;
                if (v151 == 1)
                {
                  v259 = v88;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v259, 1);
                  v152 = objc_claimAutoreleasedReturnValue();
                  v153 = (void *)*((_QWORD *)v249 + 5);
                  *((_QWORD *)v249 + 5) = v152;

                }
                else
                {
                  v258[0] = v88;
                  v258[1] = v89;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v258, 2);
                  v167 = objc_claimAutoreleasedReturnValue();
                  v168 = (void *)*((_QWORD *)v249 + 5);
                  *((_QWORD *)v249 + 5) = v167;

                  if ((unint64_t)objc_msgSend((id)v225[5], "count") >= 3)
                    self->_tripTitleType = 4;
                }
              }
            }
            else
            {
              objc_msgSend((id)v219[5], "firstObject");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v219[5], "lastObject");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v68, v65);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v87, v65);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v219[5]);
              v113 = objc_claimAutoreleasedReturnValue();
              v114 = (void *)v237[5];
              v237[5] = v113;

              self->_tripTitleLocationType = 3;
              if (v88)
              {
                v115 = objc_msgSend(v68, "isSameNodeAsNode:", v87);
                if (v89)
                  v116 = v115;
                else
                  v116 = 1;
                if (v116 == 1)
                {
                  v263 = v88;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v263, 1);
                  v117 = objc_claimAutoreleasedReturnValue();
                  v118 = (void *)*((_QWORD *)v249 + 5);
                  *((_QWORD *)v249 + 5) = v117;

                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v68);
                  v119 = objc_claimAutoreleasedReturnValue();
                  v120 = (void *)v243[5];
                  v243[5] = v119;

                }
                else
                {
                  v262[0] = v88;
                  v262[1] = v89;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v262, 2);
                  v125 = objc_claimAutoreleasedReturnValue();
                  v126 = (void *)*((_QWORD *)v249 + 5);
                  *((_QWORD *)v249 + 5) = v125;

                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v68, v87, 0);
                  v127 = objc_claimAutoreleasedReturnValue();
                  v128 = (void *)v243[5];
                  v243[5] = v127;

                  if ((unint64_t)objc_msgSend((id)v219[5], "count") >= 3)
                    self->_tripTitleType = 4;
                }
              }
            }
          }
          else
          {
            objc_msgSend((id)v225[5], "firstObject");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v225[5], "lastObject");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v68, v65);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v87, v65);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v225[5]);
            v90 = objc_claimAutoreleasedReturnValue();
            v91 = (void *)v237[5];
            v237[5] = v90;

            self->_tripTitleLocationType = 2;
            if (v88)
            {
              v92 = objc_msgSend(v68, "isSameNodeAsNode:", v87);
              if (v89)
                v93 = v92;
              else
                v93 = 1;
              if (v93 == 1)
              {
                v265 = v88;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v265, 1);
                v94 = objc_claimAutoreleasedReturnValue();
                v95 = (void *)*((_QWORD *)v249 + 5);
                *((_QWORD *)v249 + 5) = v94;

                objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v68);
                v96 = objc_claimAutoreleasedReturnValue();
                v97 = (void *)v243[5];
                v243[5] = v96;

              }
              else
              {
                v264[0] = v88;
                v264[1] = v89;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v264, 2);
                v121 = objc_claimAutoreleasedReturnValue();
                v122 = (void *)*((_QWORD *)v249 + 5);
                *((_QWORD *)v249 + 5) = v121;

                objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v68, v87, 0);
                v123 = objc_claimAutoreleasedReturnValue();
                v124 = (void *)v243[5];
                v243[5] = v123;

                if ((unint64_t)objc_msgSend((id)v225[5], "count") >= 3)
                  self->_tripTitleType = 4;
              }
            }
          }

        }
LABEL_110:

LABEL_111:
        v129 = (void *)objc_opt_class();
        v130 = v243[5];
        allowLongAOI = self->_allowLongAOI;
        v191[0] = MEMORY[0x1E0C809B0];
        v191[1] = 3221225472;
        v191[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_7;
        v191[3] = &unk_1E842F290;
        v191[6] = &v242;
        v191[7] = &v236;
        v191[4] = self;
        v191[5] = buf;
        objc_msgSend(v129, "_aoiTitleWithLocationNodes:momentNodes:allowLongAOI:graph:locationHelper:result:", v130, v183, allowLongAOI, v185, v65, v191);
        objc_msgSend(*((id *)v249 + 5), "firstObject");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v249 + 5), "lastObject");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*((id *)v249 + 5), "count") == 1 && objc_msgSend(v132, "length"))
        {
          if (self->_tripTitleType != 2)
            self->_tripTitleType = 1;
          v134 = v132;
        }
        else
        {
          if ((unint64_t)objc_msgSend(*((id *)v249 + 5), "count") < 2
            || !objc_msgSend(v132, "length")
            || !objc_msgSend(v133, "length"))
          {
            goto LABEL_124;
          }
          if (self->_tripTitleType == 4)
          {
            v135 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleTitleFormatTripMultipleLocationsWithLocation %@ otherLocation %@"), CFSTR("PGLocationTitleTitleFormatTripMultipleLocationsWithLocation %@ otherLocation %@"), CFSTR("Localizable"));
          }
          else
          {
            self->_tripTitleType = 3;
            v135 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "localizedStringForKey:value:table:", CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@"), CFSTR("PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@"), CFSTR("Localizable"));
          }
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "localizedStringWithFormat:", v137, v132, v133);
          v138 = (void *)objc_claimAutoreleasedReturnValue();

          v254[0] = v132;
          v254[1] = v133;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v254, 2);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v138, v139);
          v134 = (NSString *)objc_claimAutoreleasedReturnValue();

        }
        if (v134)
        {
LABEL_127:
          title = self->_title;
          self->_title = v134;
          v145 = v134;

          objc_storeStrong((id *)&self->_usedLocationNodes, (id)v243[5]);
          objc_storeStrong((id *)&self->_filteredLocationNodes, (id)v237[5]);
          objc_storeStrong((id *)&self->_usedTitleComponents, *((id *)v249 + 5));

          _Block_object_dispose(&v218, 8);
          _Block_object_dispose(&v224, 8);

          _Block_object_dispose(&v230, 8);
          _Block_object_dispose(&v236, 8);

          _Block_object_dispose(&v242, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_128;
        }
LABEL_124:
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "loggingConnection");
        v141 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v190 = 0;
          _os_log_impl(&dword_1CA237000, v141, OS_LOG_TYPE_INFO, "Falling back to normal title generation", v190, 2u);
        }

        v142 = (void *)v243[5];
        v243[5] = 0;

        v143 = (void *)v237[5];
        v237[5] = 0;

        v134 = 0;
        goto LABEL_127;
      }
      objc_msgSend((id)v219[5], "firstObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v68, v65);
      v79 = objc_claimAutoreleasedReturnValue();
      v70 = (void *)v79;
      if (v79)
      {
        v266 = v79;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v266, 1);
        v80 = objc_claimAutoreleasedReturnValue();
        v81 = (void *)*((_QWORD *)v249 + 5);
        *((_QWORD *)v249 + 5) = v80;

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v68);
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = (void *)v243[5];
        v243[5] = v82;

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v68);
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = (void *)v237[5];
        v237[5] = v84;

        self->_tripTitleLocationType = 3;
      }
    }

    goto LABEL_110;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "loggingConnection");
  v33 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "No filtered moment nodes, falling back to normal title generation", buf, 2u);
  }

LABEL_128:
}

- (void)_resolveMomentNodes:(id)a3 withResult:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  PGLocationsResolver *v8;
  void *v9;
  void *v10;
  PGGraphMomentNodeCollection *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  PGLocationsFilterer *v22;
  uint64_t v23;
  uint8_t v24[16];

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = -[PGLocationsResolver initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:]([PGLocationsResolver alloc], "initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:", v6, self->_incompleteLocationResolver, self->_locationHelper);
  if (self->_filterMomentsAndCities)
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v6, v10);
    -[PGGraphMomentNodeCollection frequentLocationNodes](v11, "frequentLocationNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addressNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cityNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "temporarySet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGLocationsResolver setIgnoredLocationNodes:](v8, "setIgnoredLocationNodes:", v15);

  }
  -[PGLocationsResolver resolvedMomentNodes](v8, "resolvedMomentNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGLocationsResolver resolvedLocationNodes](v8, "resolvedLocationNodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "Filtered out all moments. Resetting to all moments.", v24, 2u);
    }

    v20 = v6;
    v16 = v20;
  }
  if (!objc_msgSend(v17, "count"))
  {
    -[PGLocationTripTitleUtility _cityNodesFromMomentNodes:](self, "_cityNodesFromMomentNodes:", v16);
    v21 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v21;
  }
  if (self->_filterMomentsAndCities)
  {
    v22 = -[PGLocationsFilterer initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:]([PGLocationsFilterer alloc], "initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:", v6, v17, self->_incompleteLocationResolver);
    -[PGLocationsFilterer filteredLocationNodes](v22, "filteredLocationNodes");
    v23 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v23;
  }
  if (v7)
    v7[2](v7, v16, v17);

}

- (id)_cityNodesFromMomentNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke;
        v17[3] = &unk_1E842F2B8;
        v17[4] = self;
        v18 = v6;
        v19 = v5;
        objc_msgSend(v12, "enumerateAddressEdgesAndNodesUsingBlock:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke_2;
  v15[3] = &unk_1E842F2E0;
  v16 = v6;
  v13 = v6;
  objc_msgSend(v5, "sortUsingComparator:", v15);

  return v5;
}

- (void)_cityTitleWithCityNode:(id)a3 countryNode:(id)a4 visitedCountryOnlyOnce:(BOOL)a5 momentNodes:(id)a6 result:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void (**)(id, void *, void *))a7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    v16 = MEMORY[0x1E0C809B0];
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v15)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v17);
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __107__PGLocationTripTitleUtility__cityTitleWithCityNode_countryNode_visitedCountryOnlyOnce_momentNodes_result___block_invoke;
      v30[3] = &unk_1E842F308;
      v30[4] = &v35;
      objc_msgSend(v18, "enumerateROINodesUsingBlock:", v30);
      if (*((_BYTE *)v36 + 24))
        break;
      if (v14 == ++v17)
      {
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

  v19 = v10;
  v20 = *((unsigned __int8 *)v36 + 24);
  v21 = v29;
  v22 = v21;
  if (v20 || !a5)
  {
    objc_msgSend(v21, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGLocationTripTitleUtility _bestAddressNodeForCityNodes:inMomentNodes:](self, "_bestAddressNodeForCityNodes:inMomentNodes:", v23, v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGLocationTripTitleUtility _locationTitleWithLocationNode:addressNode:countryNode:allowSecondPart:](self, "_locationTitleWithLocationNode:addressNode:countryNode:allowSecondPart:", v22, v24, v19, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v22)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v22);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v12[2](v12, v25, v26);

  _Block_object_dispose(&v35, 8);
}

- (id)_bestAddressNodeForCityNodes:(id)a3 inMomentNodes:(id)a4
{
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[8];
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v6;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v29)
  {
    v7 = 0;
    v27 = *(_QWORD *)v51;
    v8 = -1.79769313e308;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v51 != v27)
        {
          v10 = v9;
          objc_enumerationMutation(obj);
          v9 = v10;
        }
        v30 = v9;
        v11 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v9);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v12 = v28;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v47 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              v42 = 0;
              v43 = (double *)&v42;
              v44 = 0x2020000000;
              v45 = 0;
              *(_QWORD *)buf = 0;
              v37 = buf;
              v38 = 0x3032000000;
              v39 = __Block_byref_object_copy__45384;
              v40 = __Block_byref_object_dispose__45385;
              v41 = 0;
              v35[0] = MEMORY[0x1E0C809B0];
              v35[1] = 3221225472;
              v35[2] = __73__PGLocationTripTitleUtility__bestAddressNodeForCityNodes_inMomentNodes___block_invoke;
              v35[3] = &unk_1E842F330;
              v35[4] = self;
              v35[5] = v11;
              v35[6] = &v42;
              v35[7] = buf;
              objc_msgSend(v16, "enumerateAddressEdgesAndNodesUsingBlock:", v35);
              v17 = v43[3];
              if (v17 > v8)
              {
                v18 = *((id *)v37 + 5);

                v7 = v18;
                v8 = v17;
              }
              _Block_object_dispose(buf, 8);

              _Block_object_dispose(&v42, 8);
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v13);
        }

        v9 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v29);

    if (v7)
      goto LABEL_32;
  }
  else
  {

  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loggingConnection");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "Could not find best address for city in moments. Using any address", buf, 2u);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v28;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v54, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v32;
LABEL_24:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v23)
        objc_enumerationMutation(v21);
      objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v24), "bestAddressNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        break;
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v54, 16);
        if (v22)
          goto LABEL_24;
        goto LABEL_30;
      }
    }
  }
  else
  {
LABEL_30:
    v7 = 0;
  }

LABEL_32:
  return v7;
}

- (id)_locationTitleWithLocationNode:(id)a3 addressNode:(id)a4 countryNode:(id)a5 allowSecondPart:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  id v19;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v10, self->_locationHelper);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_8;
  objc_msgSend(v12, "graph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "supersetCountryNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "containsNode:", v12))
  {

LABEL_8:
    v19 = v13;
    goto LABEL_9;
  }
  objc_msgSend(v12, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[PGCountrySize isLargeCountry:](PGCountrySize, "isLargeCountry:", v16);

  if (v17)
    v18 = 8;
  else
    v18 = 9;
  +[PGLocationTitleUtility _twoPartLocationTitleWithFirstPartTitle:withDimension:usedFirstPartLocationNode:addressNode:locationHelper:](PGLocationTitleUtility, "_twoPartLocationTitleWithFirstPartTitle:withDimension:usedFirstPartLocationNode:addressNode:locationHelper:", v13, v18, v10, v11, self->_locationHelper);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_8;
LABEL_9:

  return v19;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSSet)usedLocationNodes
{
  return self->_usedLocationNodes;
}

- (void)setUsedLocationNodes:(id)a3
{
  objc_storeStrong((id *)&self->_usedLocationNodes, a3);
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_momentNodes, a3);
}

- (BOOL)filterMomentsAndCities
{
  return self->_filterMomentsAndCities;
}

- (void)setFilterMomentsAndCities:(BOOL)a3
{
  self->_filterMomentsAndCities = a3;
}

- (BOOL)allowLongAOI
{
  return self->_allowLongAOI;
}

- (void)setAllowLongAOI:(BOOL)a3
{
  self->_allowLongAOI = a3;
}

- (PGIncompleteLocationResolver)incompleteLocationResolver
{
  return self->_incompleteLocationResolver;
}

- (void)setIncompleteLocationResolver:(id)a3
{
  objc_storeStrong((id *)&self->_incompleteLocationResolver, a3);
}

- (NSArray)usedTitleComponents
{
  return self->_usedTitleComponents;
}

- (void)setUsedTitleComponents:(id)a3
{
  objc_storeStrong((id *)&self->_usedTitleComponents, a3);
}

- (unint64_t)tripTitleType
{
  return self->_tripTitleType;
}

- (unint64_t)tripTitleLocationType
{
  return self->_tripTitleLocationType;
}

- (NSSet)filteredLocationNodes
{
  return self->_filteredLocationNodes;
}

- (void)setFilteredLocationNodes:(id)a3
{
  objc_storeStrong((id *)&self->_filteredLocationNodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredLocationNodes, 0);
  objc_storeStrong((id *)&self->_usedTitleComponents, 0);
  objc_storeStrong((id *)&self->_incompleteLocationResolver, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_usedLocationNodes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

void __73__PGLocationTripTitleUtility__bestAddressNodeForCityNodes_inMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cityNodeFromAddressNode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:", v5, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isSameNodeAsNode:", v7))
  {
    objc_msgSend(v10, "relevance");
    if (v8 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(v10, "relevance");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    }
  }

}

void __107__PGLocationTripTitleUtility__cityTitleWithCityNode_countryNode_visitedCountryOnlyOnce_momentNodes_result___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;

  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Urban"));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "closestLocationNodeFromLocationNode:withDimension:reverse:", v5, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v7);

  if (v8 >= 7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:", v5, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;

      v8 = 6;
      v6 = v11;
    }

  }
  if (v6)
  {
    objc_msgSend(v15, "universalStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 && (!v13 || objc_msgSend(v12, "compare:", v13) == -1))
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v12, v6);
    if (v8 == 6 && (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v6) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

  }
}

uint64_t __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
      v9 = objc_msgSend(v7, "compare:", v8);
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_msgSend(v5, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_3;
  v6[3] = &unk_1E842F1C8;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v6);

}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a2)
  {
    v12[0] = a2;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a2;
    objc_msgSend(v7, "arrayWithObjects:count:", v12, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
    *(_QWORD *)(a1[4] + 72) = 1;

  }
}

id __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_5(uint64_t a1, unsigned int a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  id obj;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[4];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v5 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v5, "reverseObjectEnumerator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;
  objc_msgSend(v24, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v42;
LABEL_6:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v40[3] = a2 - 1;
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__45384;
      v38 = __Block_byref_object_dispose__45385;
      v39 = 0;
      objc_msgSend(v12, "collection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addressNodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_6;
      v25[3] = &unk_1E842F240;
      v15 = *(id *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v26 = v15;
      v27 = v16;
      v17 = v24;
      v18 = *(_QWORD *)(a1 + 56);
      v28 = v17;
      v30 = v18;
      v19 = v8;
      v33 = a2;
      v29 = v19;
      v31 = v40;
      v32 = &v34;
      objc_msgSend(v14, "enumerateNodesUsingBlock:", v25);

      v20 = (void *)v35[5];
      if (v20)
        v23 = v20;

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(v40, 8);
      if (v20)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v9)
          goto LABEL_6;
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    v23 = 0;
  }

  return v23;
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_7(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
    *(_QWORD *)(a1[4] + 72) = 4;
  }

}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cityNodeFromAddressNode:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "resolvedLocationNodeForIncompleteAddressNode:withTargetDimension:", v11, 6), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((objc_msgSend(v4, "isSameNodeAsNode:", *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "containsObject:", v4))
      {
        v5 = *(void **)(a1 + 56);
        if (!v5
          || (objc_msgSend(v4, "name"),
              v6 = (void *)objc_claimAutoreleasedReturnValue(),
              v7 = objc_msgSend(v5, "isEqualToString:", v6),
              v6,
              (v7 & 1) == 0))
        {
          v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "indexOfObject:", v4);
          v9 = v8;
          v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          if (!*(_BYTE *)(a1 + 88))
          {
            if (v8 >= v10)
              goto LABEL_10;
            goto LABEL_9;
          }
          if (v8 >= v10)
          {
LABEL_9:
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v4);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v9;
          }
        }
      }
    }
  }
LABEL_10:

}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __52__PGLocationTripTitleUtility__generateLocationTitle__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateTitleForMomentNodes:resolvedMomentNodes:resolvedLocations:", *(_QWORD *)(a1 + 40), a2, a3);
}

+ (id)_filteredCityNodesByNameForCityNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
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
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
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
        objc_msgSend(v11, "name", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v4, "addObject:", v11);
          objc_msgSend(v5, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

+ (void)_aoiTitleWithLocationNodes:(id)a3 momentNodes:(id)a4 allowLongAOI:(BOOL)a5 graph:(id)a6 locationHelper:(id)a7 result:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  PGGraphMomentNodeCollection *v21;
  PGGraphLocationNodeCollection *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PGGraphLocationNodeCollection *v42;
  PGGraphMomentNodeCollection *v43;
  void *v44;
  void *context;
  void (**v46)(id, void *, void *);
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _QWORD v55[4];

  v11 = a5;
  v55[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v46 = (void (**)(id, void *, void *))a8;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = +[PGLocationTitleUtility containsAmusementParkPOIFromMomentNodes:](PGLocationTitleUtility, "containsAmusementParkPOIFromMomentNodes:", v19);
  v48 = v14;
  v21 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v14, v15);
  v49 = v13;
  v47 = v15;
  v22 = -[MAElementCollection initWithSet:graph:]([PGGraphLocationNodeCollection alloc], "initWithSet:graph:", v13, v15);
  v43 = v21;
  -[PGGraphMomentNodeCollection addressNodes](v21, "addressNodes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v22;
  -[PGGraphLocationNodeCollection addressNodes](v22, "addressNodes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "collectionByIntersecting:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v26 = 2;
  else
    v26 = 1;
  v41 = v25;
  objc_msgSend(v25, "temporarySet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v19;
  +[PGLocationTitleUtility commonAOIComponentsForMomentNodes:addressNodes:aoiDisplayType:containsAmusementParkPOI:locationHelper:](PGLocationTitleUtility, "commonAOIComponentsForMomentNodes:addressNodes:aoiDisplayType:containsAmusementParkPOI:locationHelper:", v19, v27, v26, v20, v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestampStart"), 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v29;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("node.name"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v28;
  objc_msgSend(v28, "sortedArrayUsingDescriptors:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "node");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v38, v16);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "length"))
        {
          objc_msgSend(v18, "addObject:", v39);
          objc_msgSend(v17, "addObject:", v38);
        }

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v35);
  }

  objc_autoreleasePoolPop(context);
  if (v46)
    v46[2](v46, v18, v17);

}

+ (BOOL)visitedLocations:(id)a3 onlyDuringMoments:(id)a4 locationHelper:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  objc_msgSend(a5, "momentNodesByAddressNodeIntersectingAddressNodes:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtractingTargetsWith:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v9, "sourcesCount") == 0;
  return (char)v8;
}

+ (void)_cityStateAndCountryNodesForLocationNodes:(id)a3 result:(id)a4
{
  id v5;
  void (**v6)(id, id, id, id);
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void (**v24)(id, id, id, id);
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id, id, id))a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isEqualToString:", CFSTR("City")))
    {
      v9 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("State")))
      {
        v10 = v5;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("Country")))
          v11 = v5;
        else
          v11 = 0;
        v10 = 0;
      }
      v9 = 0;
    }
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Country")) & 1) == 0)
    {
      v23 = v9;
      v24 = v6;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = v5;
      obj = v5;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
            if (v10 && (objc_msgSend(v8, "isEqualToString:", CFSTR("State")) & 1) == 0)
            {
              objc_msgSend(v16, "locationNodeCollection");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "nearestDeepParentLocationNodesWithLabel:", CFSTR("State"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "anyNode");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19 && (objc_msgSend(v10, "containsObject:", v19) & 1) == 0)
                objc_msgSend(v10, "addObject:", v19);

            }
            objc_msgSend(v16, "locationNodeCollection", v23, v24, v25);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "nearestDeepParentLocationNodesWithLabel:", CFSTR("Country"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "anyNode");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22 && (objc_msgSend(v11, "containsObject:", v22) & 1) == 0)
              objc_msgSend(v11, "addObject:", v22);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v13);
      }

      v6 = v24;
      v5 = v25;
      v9 = v23;
    }
    if (v6)
      v6[2](v6, v9, v10, v11);

  }
}

@end
