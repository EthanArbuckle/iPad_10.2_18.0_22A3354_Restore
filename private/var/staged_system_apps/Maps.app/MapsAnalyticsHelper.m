@implementation MapsAnalyticsHelper

+ (id)analyticsResultsInfoArrayFromAutoCompleteResultsArray:(id)a3 selectedIndex:(unint64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void **p_vtable;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  void **v23;
  void *v24;
  uint64_t v25;
  char isKindOfClass;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v5 = a3;
  v6 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v51 = CRRecentContactMetadataFrom;
    v50 = CRRecentContactMetadataFromAddressKind;
    p_vtable = &OBJC_METACLASS___RouteStepLabelListView.vtable;
    v9 = CPLaneGuidance_ptr;
    v10 = CPLaneGuidance_ptr;
    v48 = CRAddressKindPhoneNumber;
    v49 = CRAddressKindEmail;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v7, v48));
      v12 = objc_opt_class(p_vtable + 112);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "autocompleteObject"));

        v11 = (void *)v13;
      }
      v14 = objc_alloc_init((Class)v9[68]);
      objc_msgSend(v14, "setSuggestionsAcType:", 0);
      v15 = objc_opt_class(v10[482]);
      if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
        break;
      objc_msgSend(v14, "setSuggestionsAcType:", 10);
      if (a4 == v7)
        goto LABEL_23;
      v18 = objc_opt_class(HistoryEntryRecentsItem);
      if ((objc_opt_isKindOfClass(v11, v18) & 1) != 0)
      {
        objc_msgSend(v14, "setSuggestionsAcType:", 4);
        v19 = v11;
        v20 = v5;
        v21 = v6;
        v22 = a4;
        v23 = p_vtable;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry"));
        v25 = objc_opt_class(MSPMutableHistoryEntrySearch);
        isKindOfClass = objc_opt_isKindOfClass(v24, v25);

        v27 = 4;
        p_vtable = v23;
        a4 = v22;
        v6 = v21;
        v5 = v20;
        if ((isKindOfClass & 1) != 0)
          goto LABEL_20;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry", 4));
        v29 = objc_opt_class(MSPMutableHistoryEntryPlaceDisplay);
        v30 = objc_opt_isKindOfClass(v28, v29);

        if ((v30 & 1) != 0)
        {
          v27 = 6;
          goto LABEL_20;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry"));
        v35 = objc_opt_class(MSPMutableHistoryEntryRoute);
        v36 = objc_opt_isKindOfClass(v34, v35);

        if ((v36 & 1) != 0)
        {
          v27 = 5;
LABEL_20:
          objc_msgSend(v14, "setSuggestionsAcType:", v27);
        }

        v9 = CPLaneGuidance_ptr;
        goto LABEL_22;
      }
      v31 = objc_opt_class(AddressBookAddress);
      if ((objc_opt_isKindOfClass(v11, v31) & 1) != 0)
      {
        v16 = v14;
        v17 = 7;
        goto LABEL_7;
      }
      v32 = objc_opt_class(0x101464000);
      if ((objc_opt_isKindOfClass(v11, v32) & 1) != 0
        || (v33 = objc_opt_class(DirectionsWorkHistoryItem), (objc_opt_isKindOfClass(v11, v33) & 1) != 0))
      {
        v16 = v14;
        v17 = 1;
        goto LABEL_7;
      }
      v37 = objc_opt_class(CRRecentContact);
      if ((objc_opt_isKindOfClass(v11, v37) & 1) != 0)
      {
        objc_msgSend(v14, "setSuggestionsAcType:", 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v51));

        v9 = CPLaneGuidance_ptr;
        v40 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v50));
          if ((objc_msgSend(v41, "isEqual:", v49) & 1) != 0)
          {
            v42 = 3;
            goto LABEL_39;
          }
          if (objc_msgSend(v41, "isEqual:", v48))
          {
            v42 = 2;
LABEL_39:
            objc_msgSend(v14, "setSuggestionsAcType:", v42);
          }

        }
LABEL_22:
        v10 = CPLaneGuidance_ptr;
        goto LABEL_23;
      }
      v43 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v11, v43) & 1) != 0)
      {
        v44 = v11;
        if (objc_msgSend(v44, "type") != 4 && objc_msgSend(v44, "type") != 3)
          objc_msgSend(v14, "setSuggestionsAcType:", 8);

        goto LABEL_23;
      }
      v45 = objc_opt_class(MapsSuggestionsEntry);
      if ((objc_opt_isKindOfClass(v11, v45) & 1) != 0)
      {
        v46 = (unint64_t)objc_msgSend(v11, "type") - 1;
        if (v46 > 5)
          v17 = 10;
        else
          v17 = dword_100E3BE88[v46];
        v16 = v14;
        goto LABEL_7;
      }
LABEL_23:
      objc_msgSend(v6, "addObject:", v14);

      if (++v7 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_44;
    }
    v16 = v14;
    v17 = 9;
LABEL_7:
    objc_msgSend(v16, "setSuggestionsAcType:", v17);
    goto LABEL_23;
  }
LABEL_44:

  return v6;
}

+ (id)acSuggestionEntriesFromAutoCompleteObjects:(id)a3 context:(id)a4 mapsSuggestionsInsights:(id)a5 skipReportASearchItems:(BOOL)a6 traits:(id)a7
{
  uint64_t v8;

  LOWORD(v8) = 1;
  return objc_msgSend(a1, "acSuggestionEntriesFromAutoCompleteObjects:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:traits:usedForLogging:shouldUseDistanceFeatureServerResults:", a3, 0, a4, a5, a6, a7, v8);
}

+ (id)acSuggestionEntriesFromAutoCompleteObjects:(id)a3 personalizedItems:(id)a4 context:(id)a5 mapsSuggestionsInsights:(id)a6 skipReportASearchItems:(BOOL)a7 traits:(id)a8 usedForLogging:(BOOL)a9 shouldUseDistanceFeatureServerResults:(BOOL)a10
{
  _BOOL8 v11;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;

  v11 = a7;
  v16 = a9;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  if (objc_msgSend(v17, "count"))
  {
    v29 = objc_claimAutoreleasedReturnValue(+[AutocompleteSection sectionWithTitle:items:isQuerySuggestionsSection:](AutocompleteSection, "sectionWithTitle:items:isQuerySuggestionsSection:", 0, v17, 0));
    v22 = a1;
    v23 = v11;
    v24 = (void *)v29;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));

    v11 = v23;
    a1 = v22;
    v16 = a9;
  }
  else
  {
    v25 = &__NSArray0__struct;
  }
  BYTE1(v28) = a10;
  LOBYTE(v28) = v16;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "acSuggestionEntriesFromSections:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:traits:usedForLogging:shouldUseDistanceFeatureServerResults:placeSummaryMetadata:", v25, v18, v19, v20, v11, 0, 0, v21, v28, 0));

  return v26;
}

+ (id)acSuggestionEntriesFromSections:(id)a3 personalizedItems:(id)a4 context:(id)a5 mapsSuggestionsInsights:(id)a6 skipReportASearchItems:(BOOL)a7 selectedChildItemIndexPath:(id)a8 indexOfResultWithSelectedChildItem:(id)a9 traits:(id)a10 usedForLogging:(BOOL)a11 shouldUseDistanceFeatureServerResults:(BOOL)a12 placeSummaryMetadata:(id)a13
{
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  void *v55;
  BOOL v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  void *v77;
  char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  _BOOL8 v84;
  void *v85;
  BOOL v86;
  void *v87;
  void *v88;
  BOOL v89;
  void *v90;
  void *v91;
  BOOL v92;
  void *v93;
  void *v94;
  BOOL v95;
  void *v96;
  void *v97;
  BOOL v98;
  void *v99;
  double v100;
  double v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  void *j;
  void *v121;
  void *v122;
  unsigned int v123;
  void *v124;
  unsigned int v125;
  void *v126;
  unsigned int v127;
  char *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  uint64_t v138;
  void *i;
  void *v140;
  void *v141;
  _BOOL4 v142;
  void *v143;
  void *v144;
  unsigned __int8 v145;
  id v146;
  id v147;
  uint64_t v148;
  id v149;
  void *v150;
  BOOL v151;
  void *v152;
  id v153;
  uint64_t v154;
  void *k;
  void *v156;
  void *v157;
  unsigned int v158;
  void *v159;
  unsigned int v160;
  void *v161;
  unsigned int v162;
  void *v163;
  id v164;
  double *v165;
  double v166;
  double v167;
  _BOOL4 v168;
  double v169;
  double v170;
  void *v171;
  double v172;
  double v173;
  id v174;
  double v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const __CFString *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  void *v191;
  uint64_t v192;
  void *v193;
  double v194;
  double v195;
  double v196;
  double v197;
  unsigned int v198;
  uint64_t v199;
  id v200;
  id v201;
  uint64_t v202;
  void *v203;
  uint64_t *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  id v209;
  uint64_t v210;
  void *v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  BOOL v216;
  void *v217;
  uint64_t v218;
  double *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  _BOOL4 v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  BOOL v232;
  uint64_t v233;
  id v234;
  uint64_t v235;
  void *v236;
  void *v237;
  uint64_t v238;
  id v239;
  unint64_t v240;
  char v241;
  void *v242;
  void *v243;
  void *v244;
  unsigned __int8 v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  void *v251;
  BOOL v252;
  id v253;
  uint64_t v254;
  void *m;
  uint64_t v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  id v261;
  unint64_t v262;
  uint64_t Log;
  NSObject *v264;
  void *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  double v271;
  double v272;
  double v273;
  void *v274;
  void *v275;
  double v276;
  double v277;
  void *v278;
  double v279;
  _BOOL4 v280;
  void *v281;
  void *v282;
  double v283;
  void *v284;
  id v285;
  void *v286;
  void *v287;
  unint64_t v288;
  uint64_t v289;
  NSObject *v290;
  void *v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  void *v295;
  void *v296;
  double v297;
  double v298;
  void *v299;
  double v300;
  void *v301;
  void *v302;
  double v303;
  double v304;
  void *v305;
  double v306;
  _BOOL4 v307;
  void *v308;
  void *v309;
  double v310;
  void *v311;
  id v312;
  uint64_t v313;
  void *n;
  void *v315;
  double v316;
  double v317;
  id v318;
  void *v320;
  id v321;
  void *v322;
  uint64_t v323;
  id v324;
  id v325;
  uint64_t v326;
  id v327;
  double v328;
  void *v330;
  id v331;
  _BOOL4 v332;
  id v334;
  void *v335;
  void *v336;
  id v337;
  id v338;
  uint64_t v339;
  uint64_t v340;
  id v341;
  void *v342;
  void *v343;
  id v344;
  void *v345;
  id v346;
  void *v347;
  uint64_t v348;
  id v349;
  uint64_t v350;
  void *v351;
  void *v352;
  char *v353;
  void *v354;
  id v355;
  void *v356;
  id v357;
  void *v358;
  id v359;
  void *v360;
  void *v361;
  void *v362;
  id obj;
  id obja;
  id objb;
  uint64_t v366;
  void *v367;
  void *v368;
  id v369;
  void *v370;
  uint64_t v371;
  void *v372;
  void *v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  _QWORD v394[4];
  id v395;
  uint64_t *v396;
  _BYTE *v397;
  _QWORD v398[4];
  id v399;
  _BYTE *v400;
  uint64_t *v401;
  _QWORD v402[4];
  id v403;
  uint64_t *v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  uint64_t v410;
  uint64_t *v411;
  uint64_t v412;
  const char *v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  _BYTE v427[128];
  void *v428;
  void *v429;
  _BYTE v430[128];
  _BYTE v431[128];
  _BYTE v432[128];
  _BYTE v433[128];
  uint8_t v434[128];
  _BYTE buf[24];
  uint64_t (*v436)(uint64_t, uint64_t);
  void (*v437)(uint64_t);
  id v438;
  _BYTE v439[128];
  _BYTE v440[128];
  _BYTE v441[128];

  v357 = a3;
  v17 = a4;
  v334 = a5;
  v321 = a6;
  v325 = a8;
  v331 = a9;
  v18 = a10;
  v338 = a13;
  v320 = v18;
  v341 = objc_msgSend(v18, "copy");
  v373 = v17;
  if (v17)
  {
    v426 = 0u;
    v425 = 0u;
    v424 = 0u;
    v423 = 0u;
    obj = v357;
    v369 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v423, v441, 16);
    if (v369)
    {
      v366 = *(_QWORD *)v424;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v424 != v366)
          {
            v20 = v19;
            objc_enumerationMutation(obj);
            v19 = v20;
          }
          v371 = v19;
          v21 = *(void **)(*((_QWORD *)&v423 + 1) + 8 * v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "items"));
          v23 = objc_msgSend(v22, "count") == 0;

          if (!v23)
          {
            v24 = 0;
            do
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v373, "objectAtIndexedSubscript:", v24));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "items"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", v24));
              v28 = v25 == v27;

              if (!v28)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "items"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v24));

                v31 = objc_opt_class(PersonalizedCompoundItem);
                if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
                  v32 = v30;
                else
                  v32 = 0;
                v33 = v32;

                v422 = 0u;
                v420 = 0u;
                v421 = 0u;
                v419 = 0u;
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "items"));
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v419, v440, 16);
                if (v35)
                {
                  v36 = *(_QWORD *)v420;
LABEL_15:
                  v37 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v420 != v36)
                      objc_enumerationMutation(v34);
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v419 + 1) + 8 * v37), "autocompleteObject"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v373, "objectAtIndexedSubscript:", v24));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "autocompleteObject"));
                    v41 = v38 == v40;

                    if (v41)
                      break;
                    if (v35 == (id)++v37)
                    {
                      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v419, v440, 16);
                      if (v35)
                        goto LABEL_15;
                      break;
                    }
                  }
                }

              }
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "items"));
              v43 = objc_msgSend(v42, "count");

              ++v24;
            }
            while (v24 < (unint64_t)v43);
          }
          v19 = v371 + 1;
        }
        while ((id)(v371 + 1) != v369);
        v369 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v423, v441, 16);
      }
      while (v369);
    }

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v322 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "currentLocation"));

  if (v322)
  {
    objc_msgSend(v322, "coordinate");
    v328 = v45;
    v47 = v46;
  }
  else
  {
    v47 = -180.0;
    v328 = -180.0;
  }
  v344 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v342 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v343 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v417 = 0u;
  v418 = 0u;
  v415 = 0u;
  v416 = 0u;
  v327 = v357;
  v324 = objc_msgSend(v327, "countByEnumeratingWithState:objects:count:", &v415, v439, 16);
  if (v324)
  {
    v48 = v328 < -180.0;
    if (v328 > 180.0)
      v48 = 1;
    v332 = v48;
    v323 = *(_QWORD *)v416;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v416 != v323)
        {
          v50 = v49;
          objc_enumerationMutation(v327);
          v49 = v50;
        }
        v326 = v49;
        v345 = *(void **)(*((_QWORD *)&v415 + 1) + 8 * v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v345, "items"));
        v52 = objc_msgSend(v51, "count") == 0;

        if (!v52)
        {
          v353 = 0;
          while (1)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v345, "items"));
            v367 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectAtIndexedSubscript:", v353));

            v54 = objc_opt_class(PersonalizedCompoundItem);
            if ((objc_opt_isKindOfClass(v367, v54) & 1) == 0
              || (v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v367, "autocompleteObject")),
                  v56 = v55 == 0,
                  v55,
                  v56))
            {
              v355 = 0;
            }
            else
            {
              v355 = v367;
              v367 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v355, "autocompleteObject"));

            }
            v57 = objc_alloc_init((Class)GEOClientACSuggestionEntry);
            v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v373, "objectAtIndexedSubscript:", v353));
            v59 = (void *)v58;
            v60 = v355;
            if (v58)
              v60 = (void *)v58;
            v349 = v60;

            v61 = v355;
            if ((objc_msgSend(v355, "hasServerItemIndex") & 1) != 0
              || (v61 = v349, objc_msgSend(v349, "hasServerItemIndex")))
            {
              objc_msgSend(v57, "setServerSectionIndex:", objc_msgSend(v61, "serverSectionIndex"));
              objc_msgSend(v57, "setServerItemIndexInSection:", objc_msgSend(v61, "serverItemIndexInSection"));
            }
            v62 = objc_opt_class(ReportASearchAutocompleteResult);
            if ((objc_opt_isKindOfClass(v367, v62) & 1) == 0)
              break;
            if (!a7)
            {
              objc_msgSend(v344, "addObject:", v57);
              v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              objc_msgSend(v342, "addObject:", v63);

              v358 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              objc_msgSend(v343, "addObject:", v358);

            }
LABEL_217:

            v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v345, "items"));
            v184 = (char *)objc_msgSend(v183, "count");

            if (++v353 >= v184)
              goto LABEL_260;
          }
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v334, "matchInfoForObject:", v367));
          if (v64)
          {
            v359 = v64;

          }
          else
          {
            v359 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v355, "matchInfo"));

            if (!v359)
            {
              if (objc_msgSend(v367, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteItemWithMatchInfo))v359 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v367, "matchInfo"));
              else
                v359 = 0;
            }
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v436 = sub_1007DEB24;
          v437 = sub_1007DEB34;
          v438 = 0;
          objc_msgSend(v57, "setSuggestionType:", 0);
          objc_msgSend(v57, "setShownToUser:", objc_msgSend(v359, "shownToUser"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v355, "autocompleteAnalytics"));
          v66 = objc_msgSend(v65, "hasDiscreteFeatureValuesContributedToLatestClientRankingScore");

          if (v66)
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v355, "autocompleteAnalytics"));
            objc_msgSend(v57, "setDiscreteFeatureValuesAvailable:", objc_msgSend(v67, "discreteFeatureValuesContributedToLatestClientRankingScore"));

          }
          v410 = 0;
          v411 = &v410;
          v412 = 0x3010000000;
          v413 = "";
          v414 = xmmword_100E3BEA0;
          v68 = objc_opt_class(MKLocalSearchCompletion);
          if ((objc_opt_isKindOfClass(v367, v68) & 1) != 0)
          {
            objc_msgSend(v57, "setSuggestionType:", 9);
            v69 = v367;
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "mapItem"));
            v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "_geoMapItem"));
            v72 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v71;

            v409 = 0uLL;
            if (objc_msgSend(v69, "getCoordinate:", &v409))
            {
              *((_OWORD *)v411 + 2) = v409;
              if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
              {
                v73 = objc_alloc((Class)CLLocation);
                v74 = objc_msgSend(v73, "initWithLatitude:longitude:", v409);
                v75 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithCLLocation:placeType:", v74, objc_msgSend(v69, "_placeType"));
                v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "_geoMapItem"));
                v77 = *(void **)(*(_QWORD *)&buf[8] + 40);
                *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v76;

              }
            }
            v78 = (char *)objc_msgSend(v69, "_type") - 1;
            if ((unint64_t)v78 < 3)
              v79 = ((_DWORD)v78 + 1);
            else
              v79 = 0;
            objc_msgSend(v57, "setServerEntryType:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "mapItem"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "_geoMapItem"));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "_childItems"));
            v83 = objc_msgSend(v82, "count");
            if (v83)
            {
              v84 = 1;
            }
            else
            {
              v330 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "childItems"));
              v84 = v330 != 0;
            }
            objc_msgSend(v57, "setIsProminentResult:", v84);
            if (!v83)

            v128 = (char *)objc_msgSend(v69, "autocompleteCellType") - 1;
            if ((unint64_t)v128 < 4)
              v129 = ((_DWORD)v128 + 1);
            else
              v129 = 0;
            objc_msgSend(v57, "setAutocompleteResultCellType:", v129);
            objc_msgSend(v57, "setTapBehavior:", objc_msgSend(v69, "entryTapBehavior") == (id)1);
            if (v338)
            {
              v130 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTemplateFactory autocompleteTemplateWithCompletion:metadata:](_TtC4Maps27PlaceSummaryTemplateFactory, "autocompleteTemplateWithCompletion:metadata:", v69, v338));
              v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "mapItem"));
              v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hyperlinkMetadataWithTemplate:mapItem:metadata:", v130, v131, v338));
              objc_msgSend(v57, "setHyperlinkMetadata:", v132);

            }
            v133 = objc_alloc((Class)NSMutableArray);
            v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "childItems"));
            v135 = objc_msgSend(v133, "initWithCapacity:", objc_msgSend(v134, "count"));

            v407 = 0u;
            v408 = 0u;
            v405 = 0u;
            v406 = 0u;
            v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "childItems"));
            v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v405, v434, 16);
            if (v137)
            {
              v138 = *(_QWORD *)v406;
              do
              {
                for (i = 0; i != v137; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v406 != v138)
                    objc_enumerationMutation(v136);
                  v140 = *(void **)(*((_QWORD *)&v405 + 1) + 8 * (_QWORD)i);
                  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "childItemAction"));
                  v142 = objc_msgSend(v141, "childActionType") == (id)8;

                  if (v142)
                  {
                    v143 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
                    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "offlineDownloadRegion"));
                    v145 = objc_msgSend(v143, "isRegionDownloaded:requireFullyDownloaded:", v144, 0);

                    if ((v145 & 1) != 0)
                      continue;
                  }
                  objc_msgSend(v135, "addObject:", v140);
                }
                v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v405, v434, 16);
              }
              while (v137);
            }

            if (objc_msgSend(v135, "count"))
            {
              if (!v331)
                goto LABEL_154;
              v146 = objc_msgSend(v327, "indexOfObject:", v345);
              if (v146 == objc_msgSend(v331, "section"))
              {
                if (v353 != objc_msgSend(v331, "row"))
                {
                  v147 = 0;
                  goto LABEL_156;
                }
LABEL_154:
                v147 = v325;
              }
              else
              {
                v147 = 0;
              }
LABEL_156:
              v163 = (void *)objc_claimAutoreleasedReturnValue(+[GEOSubactionMetaData subactionMetaDataWithChildItems:selectedChildItemIndexPath:](GEOSubactionMetaData, "subactionMetaDataWithChildItems:selectedChildItemIndexPath:", v135, v147));
              objc_msgSend(v57, "setSubactionMetaData:", v163);

            }
LABEL_157:

LABEL_158:
            v106 = 0;
LABEL_159:

LABEL_160:
            v165 = (double *)v411;
            v166 = *((double *)v411 + 4);
            v167 = *((double *)v411 + 5);
            v168 = v167 < -180.0;
            if (v167 > 180.0)
              v168 = 1;
            if (v166 < -90.0)
              v168 = 1;
            if (v166 > 90.0)
              v168 = 1;
            if (!v168 && !v332 && v47 >= -90.0 && v47 <= 90.0)
            {
              if (a12 && !a11)
                goto LABEL_173;
              if (a11)
              {
                v164 = objc_msgSend(v57, "suggestionType");
                v165 = (double *)v411;
                if ((_DWORD)v164 != 9)
                {
                  v166 = *((double *)v411 + 4);
                  v167 = *((double *)v411 + 5);
LABEL_173:
                  objc_msgSend(v57, "setDistanceToSuggestion:", (int)GEOCalculateDistance(v164, v166, v167, v47, v328));
                  v165 = (double *)v411;
                }
              }
            }
            v169 = v165[5];
            if (v169 >= -180.0 && v169 <= 180.0)
            {
              v170 = v165[4];
              if (v170 >= -90.0
                && v170 <= 90.0
                && objc_msgSend(v341, "hasMapRegion")
                && (!a11 || objc_msgSend(v57, "suggestionType") == 9))
              {
                v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v341, "mapRegion"));
                objc_msgSend(v57, "setIsContainedInViewport:", objc_msgSend(v171, "containsCoordinate:", *((double *)v411 + 4), *((double *)v411 + 5)));
                objc_msgSend(v171, "centerLat");
                v173 = v172;
                v174 = objc_msgSend(v171, "centerLng");
                if (v175 >= -180.0 && v175 <= 180.0 && v173 >= -90.0 && v173 <= 90.0)
                  objc_msgSend(v57, "setDistanceToSuggestionFromViewportCenter:", GEOCalculateDistance(v174, *((double *)v411 + 4), *((double *)v411 + 5), v173, v175));

              }
            }
            if (objc_msgSend(v341, "hasTimeSinceMapViewportChanged") && !a11)
              objc_msgSend(v57, "setTimeSinceMapViewportChangedSeconds:", (double)objc_msgSend(v341, "timeSinceMapViewportChanged"));
            if (v355 && objc_msgSend(v355, "containsPossiblePersonalizedItemSourceSubtype:", 1))
              objc_msgSend(v57, "setIsFavorite:", 1);
            if (!objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_hasBusinessHours"))
              goto LABEL_205;
            if ((objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_openingHoursOptions") & 0x20) != 0)
            {
              v176 = 3;
            }
            else if ((objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_openingHoursOptions") & 0x40) != 0)
            {
              v176 = 4;
            }
            else
            {
              if ((objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_openingHoursOptions") & 4) == 0
                && (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_openingHoursOptions") & 8) == 0)
              {
                if ((objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_openingHoursOptions") & 2) != 0
                  || (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_openingHoursOptions") & 0x10) != 0)
                {
                  v176 = 2;
                  goto LABEL_204;
                }
LABEL_205:
                v177 = objc_claimAutoreleasedReturnValue(objc_msgSend(v345, "title"));
                v178 = (void *)v177;
                if (v177)
                  v179 = (const __CFString *)v177;
                else
                  v179 = &stru_1011EB268;
                objc_msgSend(v57, "setSuggestionSectionType:", v179);

                objc_msgSend(v344, "addObject:", v57);
                v180 = v106;
                if (!v106)
                {
                  v336 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                  v180 = v336;
                }
                objc_msgSend(v342, "addObject:", v180);
                if (!v106)

                v181 = *(void **)(*(_QWORD *)&buf[8] + 40);
                v182 = v181;
                if (!v181)
                {
                  v335 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                  v182 = v335;
                }
                objc_msgSend(v343, "addObject:", v182);
                if (!v181)

                _Block_object_dispose(&v410, 8);
                _Block_object_dispose(buf, 8);

                goto LABEL_217;
              }
              v176 = 0;
            }
LABEL_204:
            objc_msgSend(v57, "setPoiOpenState:", v176);
            goto LABEL_205;
          }
          objc_msgSend(v57, "setSuggestionType:", 10);
          objc_msgSend(v359, "fractionOfMatch");
          objc_msgSend(v57, "setFractionOfMatch:");
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "prefixLastTokenMatchCover"));
          v86 = v85 == 0;

          if (!v86)
          {
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "prefixLastTokenMatchCover"));
            objc_msgSend(v87, "floatValue");
            objc_msgSend(v57, "setPrefixLastTokenMatchCover:");

          }
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "prefixMatchCover"));
          v89 = v88 == 0;

          if (!v89)
          {
            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "prefixMatchCover"));
            objc_msgSend(v90, "floatValue");
            objc_msgSend(v57, "setPrefixMatchCover:");

          }
          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "prefixMatchPosition"));
          v92 = v91 == 0;

          if (!v92)
          {
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "prefixMatchPosition"));
            objc_msgSend(v57, "setPrefixMatchPosition:", objc_msgSend(v93, "intValue"));

          }
          objc_msgSend(v57, "setPrefixMatchWordBoundary:", objc_msgSend(v359, "prefixMatchesWordBoundary"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "firstPrefixToken"));
          v95 = v94 == 0;

          if (!v95)
          {
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "firstPrefixToken"));
            objc_msgSend(v57, "setPrefixTokenMatchLengthFirstQueryToken:", objc_msgSend(v96, "matchLength"));
            objc_msgSend(v57, "setPrefixTokenMatchPositionFirstQueryToken:", objc_msgSend(v96, "matchPostion"));
            objc_msgSend(v57, "setPrefixTokenIsNumberFirstQueryToken:", objc_msgSend(v96, "isNumber"));
            objc_msgSend(v57, "setPrefixTokenMatchLocationFirstQueryToken:", objc_msgSend(v96, "matchLocation"));

          }
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "secondPrefixToken"));
          v98 = v97 == 0;

          if (!v98)
          {
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v359, "secondPrefixToken"));
            objc_msgSend(v57, "setPrefixTokenMatchLengthSecondQueryToken:", objc_msgSend(v99, "matchLength"));
            objc_msgSend(v57, "setPrefixTokenMatchPositionSecondQueryToken:", objc_msgSend(v99, "matchPostion"));
            objc_msgSend(v57, "setPrefixTokenIsNumberSecondQueryToken:", objc_msgSend(v99, "isNumber"));
            objc_msgSend(v57, "setPrefixTokenMatchLocationSecondQueryToken:", objc_msgSend(v99, "matchLocation"));

          }
          if ((objc_msgSend(v359, "matchType") & 4) != 0)
            objc_msgSend(v57, "setMatchedUsingAddress:", 1);
          if ((objc_msgSend(v359, "matchType") & 0x10) != 0)
            objc_msgSend(v57, "setMatchedUsingEventName:", 1);
          if ((objc_msgSend(v359, "matchType") & 8) != 0)
            objc_msgSend(v57, "setMatchedUsingLabel:", 1);
          if ((objc_msgSend(v359, "matchType") & 1) != 0)
            objc_msgSend(v57, "setMatchedUsingName:", 1);
          if ((objc_msgSend(v359, "matchType") & 2) != 0)
            objc_msgSend(v57, "setMatchedUsingOrganization:", 1);
          objc_msgSend(v359, "peopleSuggesterRank");
          if (v100 != 0.0)
          {
            objc_msgSend(v359, "peopleSuggesterRank");
            objc_msgSend(v57, "setPeopleSuggesterRank:", (int)v101);
          }
          if ((objc_msgSend(v359, "ageInSeconds") & 0x80000000) == 0)
            objc_msgSend(v57, "setAge:", objc_msgSend(v359, "ageInSeconds"));
          v102 = objc_opt_class(HistoryEntryRecentsItem);
          if ((objc_opt_isKindOfClass(v367, v102) & 1) != 0)
          {
            objc_msgSend(v57, "setSuggestionType:", 4);
            v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v367, "historyEntry"));
            v402[0] = _NSConcreteStackBlock;
            v402[1] = 3221225472;
            v402[2] = sub_1007DEB3C;
            v402[3] = &unk_1011B8468;
            v403 = v57;
            v404 = &v410;
            v398[0] = _NSConcreteStackBlock;
            v398[1] = 3221225472;
            v398[2] = sub_1007DEBC8;
            v398[3] = &unk_1011C8E10;
            v399 = v403;
            v400 = buf;
            v401 = &v410;
            v394[0] = _NSConcreteStackBlock;
            v394[1] = 3221225472;
            v394[2] = sub_1007DECB8;
            v394[3] = &unk_1011C8E38;
            v395 = v399;
            v396 = &v410;
            v397 = buf;
            objc_msgSend(v103, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v402, v398, v394, &stru_1011C8E58);

            goto LABEL_158;
          }
          v104 = objc_opt_class(AddressBookAddress);
          if ((objc_opt_isKindOfClass(v367, v104) & 1) != 0)
          {
            objc_msgSend(v57, "setSuggestionType:", 7);
            v105 = v367;
            v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "contact"));
            v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "geocodedMapItem"));

            if (v107)
            {
              v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "geocodedMapItem"));
              objc_msgSend(v108, "_coordinate");
              v110 = v109;
              v112 = v111;

              v113 = v411;
              v411[4] = v110;
              v113[5] = v112;
              v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "geocodedMapItem"));
              v115 = objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "_geoMapItem"));
              v116 = *(void **)(*(_QWORD *)&buf[8] + 40);
              *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v115;

            }
            if (a11)
              goto LABEL_159;
            v392 = 0u;
            v393 = 0u;
            v390 = 0u;
            v391 = 0u;
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "postalAddresses"));
            v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v390, v433, 16);
            if (v118)
            {
              v119 = *(_QWORD *)v391;
              do
              {
                for (j = 0; j != v118; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v391 != v119)
                    objc_enumerationMutation(v117);
                  v121 = *(void **)(*((_QWORD *)&v390 + 1) + 8 * (_QWORD)j);
                  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "label"));
                  v123 = objc_msgSend(v122, "isEqualToString:", CNLabelHome);

                  if (v123)
                  {
                    objc_msgSend(v57, "setIsContactWithHomeLocation:", 1);
                  }
                  else
                  {
                    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "label"));
                    v125 = objc_msgSend(v124, "isEqualToString:", CNLabelWork);

                    if (v125)
                    {
                      objc_msgSend(v57, "setIsContactWithWorkLocation:", 1);
                    }
                    else
                    {
                      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "label"));
                      v127 = objc_msgSend(v126, "isEqualToString:", CNLabelSchool);

                      if (v127)
                        objc_msgSend(v57, "setIsContactWithSchoolLocation:", 1);
                      else
                        objc_msgSend(v57, "setIsContactWithOtherLocation:", 1);
                    }
                  }
                }
                v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v390, v433, 16);
              }
              while (v118);
            }
            goto LABEL_255;
          }
          v148 = objc_opt_class(_TtC4Maps22MapsAutocompletePerson);
          if ((objc_opt_isKindOfClass(v367, v148) & 1) != 0)
          {
            objc_msgSend(v57, "setSuggestionType:", 7);
            v149 = v367;
            v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "handle"));
            v151 = v150 == 0;

            if (!v151)
              objc_msgSend(v57, "setIsContactWithLiveLocation:", 1);
            v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "contact"));
            v106 = v152;
            if (a11)
              goto LABEL_159;
            v388 = 0u;
            v389 = 0u;
            v386 = 0u;
            v387 = 0u;
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "postalAddresses"));
            v153 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v386, v432, 16);
            if (v153)
            {
              v154 = *(_QWORD *)v387;
              do
              {
                for (k = 0; k != v153; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v387 != v154)
                    objc_enumerationMutation(v117);
                  v156 = *(void **)(*((_QWORD *)&v386 + 1) + 8 * (_QWORD)k);
                  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "label"));
                  v158 = objc_msgSend(v157, "isEqualToString:", CNLabelHome);

                  if (v158)
                  {
                    objc_msgSend(v57, "setIsContactWithHomeLocation:", 1);
                  }
                  else
                  {
                    v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "label"));
                    v160 = objc_msgSend(v159, "isEqualToString:", CNLabelWork);

                    if (v160)
                    {
                      objc_msgSend(v57, "setIsContactWithWorkLocation:", 1);
                    }
                    else
                    {
                      v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "label"));
                      v162 = objc_msgSend(v161, "isEqualToString:", CNLabelSchool);

                      if (v162)
                        objc_msgSend(v57, "setIsContactWithSchoolLocation:", 1);
                      else
                        objc_msgSend(v57, "setIsContactWithOtherLocation:", 1);
                    }
                  }
                }
                v153 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v386, v432, 16);
              }
              while (v153);
            }
LABEL_255:

            goto LABEL_159;
          }
          v185 = objc_opt_class(0x101464000);
          if ((objc_opt_isKindOfClass(v367, v185) & 1) != 0
            || (v186 = objc_opt_class(DirectionsWorkHistoryItem),
                (objc_opt_isKindOfClass(v367, v186) & 1) != 0))
          {
            v187 = 1;
            goto LABEL_222;
          }
          v188 = objc_opt_class(CRRecentContact);
          if ((objc_opt_isKindOfClass(v367, v188) & 1) != 0)
          {
            if (objc_msgSend(v349, "sourceType") == (id)5 && objc_msgSend(v349, "sourceSubtype") == (id)4
              || objc_msgSend(v349, "sourceType") != (id)5
              || objc_msgSend(v349, "sourceSubtype") != (id)5)
            {
              v187 = 3;
            }
            else
            {
              v187 = 2;
            }
LABEL_222:
            v164 = objc_msgSend(v57, "setSuggestionType:", v187);
LABEL_223:
            v106 = 0;
            goto LABEL_160;
          }
          v189 = objc_opt_class(SearchResult);
          if ((objc_opt_isKindOfClass(v367, v189) & 1) == 0)
          {
            v199 = objc_opt_class(MapsSuggestionsEntry);
            if ((objc_opt_isKindOfClass(v367, v199) & 1) != 0)
            {
              v200 = v367;
              v201 = objc_msgSend(v200, "type");
              v202 = 1;
              switch((unint64_t)v201)
              {
                case 1uLL:
                case 2uLL:
                case 3uLL:
                case 4uLL:
                  goto LABEL_237;
                case 5uLL:
                  v202 = 4;
                  goto LABEL_237;
                case 6uLL:
                  objc_msgSend(v57, "setSuggestionType:", 8);
                  objc_msgSend(v57, "setIsFavorite:", 1);
                  goto LABEL_238;
                case 7uLL:
                  v202 = 12;
                  goto LABEL_237;
                default:
                  v202 = 10;
LABEL_237:
                  objc_msgSend(v57, "setSuggestionType:", v202);
LABEL_238:
                  v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "MKMapItem"));
                  v135 = v203;
                  if (v203)
                  {
                    objc_msgSend(v203, "_coordinate");
                    v204 = v411;
                    v411[4] = v205;
                    v204[5] = v206;
                    v207 = objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "_geoMapItem"));
                    v208 = *(void **)(*(_QWORD *)&buf[8] + 40);
                    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v207;

                  }
                  break;
              }
              goto LABEL_157;
            }
            v164 = objc_msgSend(v367, "conformsToProtocol:", &OBJC_PROTOCOL___PersonalizedItem);
            if ((_DWORD)v164)
            {
              v209 = v367;
              v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "mapItem"));
              v210 = objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "_geoMapItem"));
              v211 = *(void **)(*(_QWORD *)&buf[8] + 40);
              *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v210;

              if (v117)
              {
                objc_msgSend(v117, "_coordinate");
                v212 = v411;
                v411[4] = v213;
                v212[5] = v214;
              }
              v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "address"));
              v216 = v215 == 0;

              if (v216)
              {
                v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "locationOfInterest"));
                v227 = v226 == 0;

                if (v227)
                  v228 = 10;
                else
                  v228 = 1;
                objc_msgSend(v57, "setSuggestionType:", v228);
                v106 = 0;
              }
              else
              {
                objc_msgSend(v57, "setSuggestionType:", 7);
                v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v209, "address"));
                v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "contact"));

              }
              goto LABEL_255;
            }
            goto LABEL_223;
          }
          v190 = v367;
          v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "mapItem"));
          v192 = objc_claimAutoreleasedReturnValue(objc_msgSend(v191, "_geoMapItem"));
          v193 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v192;

          objc_msgSend(v190, "coordinate");
          v195 = v194;
          v197 = v196;
          v198 = objc_msgSend(v190, "type");
          if (v198 == 3)
          {
            v218 = 13;
          }
          else
          {
            if (v198 == 4)
            {
              objc_msgSend(v57, "setSuggestionType:", 11);
              v195 = v47;
              v197 = v328;
              goto LABEL_249;
            }
            v218 = 8;
          }
          objc_msgSend(v57, "setSuggestionType:", v218);
LABEL_249:
          v219 = (double *)v411;
          *((double *)v411 + 4) = v195;
          v219[5] = v197;
          v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "mapItem"));
          v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v220, "_geoMapItem"));
          v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v221, "_childItems"));
          objc_msgSend(v57, "setIsProminentResult:", objc_msgSend(v222, "count") != 0);

          if (v338)
          {
            v223 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTemplateFactory autocompleteTemplateWithSearchResult:](_TtC4Maps27PlaceSummaryTemplateFactory, "autocompleteTemplateWithSearchResult:", v190));
            v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "mapItem"));
            v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "hyperlinkMetadataWithTemplate:mapItem:metadata:", v223, v224, v338));
            objc_msgSend(v57, "setHyperlinkMetadata:", v225);

          }
          goto LABEL_158;
        }
LABEL_260:
        v49 = v326 + 1;
      }
      while ((id)(v326 + 1) != v324);
      v324 = objc_msgSend(v327, "countByEnumeratingWithState:objects:count:", &v415, v439, 16);
    }
    while (v324);
  }

  if (!v321)
    goto LABEL_358;
  v356 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v354 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v372 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v368 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v370 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v384 = 0u;
  v385 = 0u;
  v382 = 0u;
  v383 = 0u;
  v337 = v327;
  v346 = objc_msgSend(v337, "countByEnumeratingWithState:objects:count:", &v382, v431, 16);
  if (!v346)
    goto LABEL_303;
  v339 = *(_QWORD *)v383;
  do
  {
    v229 = 0;
    do
    {
      if (*(_QWORD *)v383 != v339)
      {
        v230 = v229;
        objc_enumerationMutation(v337);
        v229 = v230;
      }
      v350 = v229;
      v360 = *(void **)(*((_QWORD *)&v382 + 1) + 8 * v229);
      v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v360, "items"));
      v232 = objc_msgSend(v231, "count") == 0;

      if (!v232)
      {
        v233 = 0;
        while (1)
        {
          v234 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v343, "objectAtIndexedSubscript:", v233));
          v235 = objc_opt_class(NSNull);
          if ((objc_opt_isKindOfClass(v234, v235) & 1) != 0)
            break;
          obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v343, "objectAtIndexedSubscript:", v233));

          if (obja)
          {
            v234 = (id)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:"));

            if (!v234)
              goto LABEL_277;
            objc_msgSend(v356, "addObject:", v234);
            v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v233));
            objc_msgSend(v354, "addObject:", v236);

            goto LABEL_275;
          }
          obja = 0;
LABEL_277:
          v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "objectAtIndexedSubscript:", v233));
          v238 = objc_opt_class(NSNull);
          if ((objc_opt_isKindOfClass(v237, v238) & 1) != 0)
          {
            v239 = 0;
          }
          else
          {
            v239 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "objectAtIndexedSubscript:", v233));

            if (!v239)
              goto LABEL_289;
            if (objc_msgSend(v372, "count"))
            {
              v240 = 0;
              v241 = 0;
              do
              {
                while (1)
                {
                  v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v372, "objectAtIndexedSubscript:", v240));
                  v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v242, "identifier"));
                  v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "identifier"));
                  v245 = objc_msgSend(v243, "isEqualToString:", v244);

                  if ((v245 & 1) == 0)
                    break;
                  v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v370, "objectAtIndexedSubscript:", v240));
                  v247 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v233));
                  v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v246, "arrayByAddingObject:", v247));
                  objc_msgSend(v370, "setObject:atIndexedSubscript:", v248, v240);

                  ++v240;
                  v241 = 1;
                  if (v240 >= (unint64_t)objc_msgSend(v372, "count"))
                    goto LABEL_289;
                }
                ++v240;
              }
              while (v240 < (unint64_t)objc_msgSend(v372, "count"));
              if ((v241 & 1) != 0)
                goto LABEL_289;
            }
            v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "postalAddresses"));
            v252 = objc_msgSend(v251, "count") == 0;

            if (v252)
            {
              objc_msgSend(v372, "addObject:", v239);
              v259 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              objc_msgSend(v368, "addObject:", v259);

              v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v233));
              v428 = v237;
              v260 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v428, 1));
              objc_msgSend(v370, "addObject:", v260);

            }
            else
            {
              v380 = 0u;
              v381 = 0u;
              v378 = 0u;
              v379 = 0u;
              v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "postalAddresses"));
              v253 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v378, v430, 16);
              if (v253)
              {
                v254 = *(_QWORD *)v379;
                do
                {
                  for (m = 0; m != v253; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v379 != v254)
                      objc_enumerationMutation(v237);
                    v256 = *(_QWORD *)(*((_QWORD *)&v378 + 1) + 8 * (_QWORD)m);
                    objc_msgSend(v372, "addObject:", v239);
                    objc_msgSend(v368, "addObject:", v256);
                    v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v233));
                    v429 = v257;
                    v258 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v429, 1));
                    objc_msgSend(v370, "addObject:", v258);

                  }
                  v253 = objc_msgSend(v237, "countByEnumeratingWithState:objects:count:", &v378, v430, 16);
                }
                while (v253);
              }
            }
          }

LABEL_289:
          v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v360, "items"));
          v250 = objc_msgSend(v249, "count");

          if (++v233 >= (unint64_t)v250)
            goto LABEL_301;
        }
        obja = 0;
LABEL_275:

        goto LABEL_277;
      }
LABEL_301:
      v229 = v350 + 1;
    }
    while ((id)(v350 + 1) != v346);
    v346 = objc_msgSend(v337, "countByEnumeratingWithState:objects:count:", &v382, v431, 16);
  }
  while (v346);
LABEL_303:

  if (objc_msgSend(v356, "count"))
  {
    v261 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v321, "confidenceScoresForMapItems:", v356));

  }
  else
  {
    v261 = 0;
  }
  if (+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed")
    && objc_msgSend(v372, "count"))
  {
    objb = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v321, "confidenceScoresForContacts:addresses:", v372, v368));
  }
  else
  {
    objb = 0;
  }
  if (objc_msgSend(v356, "count"))
  {
    v262 = 0;
    v340 = MapsSuggestionsLoggingSubsystem;
    do
    {
      if ((unint64_t)objc_msgSend(v261, "count") > v262)
      {
        if (MapsSuggestionsLoggingIsVerbose())
        {
          Log = GEOFindOrCreateLog(v340, "MapsAnalyticsTypes");
          v264 = (id)objc_claimAutoreleasedReturnValue(Log);
          if (os_log_type_enabled(v264, OS_LOG_TYPE_DEBUG))
          {
            v265 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "objectAtIndexedSubscript:", v262));
            objc_msgSend(v265, "confidence");
            v267 = v266;
            v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "objectAtIndexedSubscript:", v262));
            v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "lastInteractionTime"));
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v267;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v269;
            _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_DEBUG, "confidence: %f, time: %@", buf, 0x16u);

          }
        }
        v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "objectAtIndexedSubscript:", v262));
        objc_msgSend(v270, "confidence");
        v272 = v271;

        v361 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "objectAtIndexedSubscript:", v262));
        v351 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v361, "lastInteractionTime"));
        objc_msgSend(v351, "timeIntervalSinceNow");
        LODWORD(v270) = v273 >= 0.0;
        v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "objectAtIndexedSubscript:", v262));
        v275 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "lastInteractionTime"));
        objc_msgSend(v275, "timeIntervalSinceNow");
        if (!(_DWORD)v270)
          v276 = -v276;
        v277 = 0.0;
        if (v276 > 0.0)
        {
          v347 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "objectAtIndexedSubscript:", v262));
          v278 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v347, "lastInteractionTime"));
          objc_msgSend(v278, "timeIntervalSinceNow");
          v280 = v279 < 0.0;
          v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "objectAtIndexedSubscript:", v262));
          v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v281, "lastInteractionTime"));
          objc_msgSend(v282, "timeIntervalSinceNow");
          if (v280)
            v277 = -v283;
          else
            v277 = v283;

        }
        v284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v354, "objectAtIndexedSubscript:", v262));
        v285 = objc_msgSend(v284, "unsignedIntegerValue");

        v286 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v344, "objectAtIndexedSubscript:", v285));
        objc_msgSend(v286, "setMapsSuggestionsPoiRevelanceScore:", v272);

        v287 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v344, "objectAtIndexedSubscript:", v285));
        objc_msgSend(v287, "setTimeSinceLastInteractedSeconds:", v277);

      }
      ++v262;
    }
    while (v262 < (unint64_t)objc_msgSend(v356, "count"));
  }
  if (objc_msgSend(v372, "count"))
  {
    v288 = 0;
    v348 = MapsSuggestionsLoggingSubsystem;
    do
    {
      if ((unint64_t)objc_msgSend(objb, "count") > v288)
      {
        if (MapsSuggestionsLoggingIsVerbose())
        {
          v289 = GEOFindOrCreateLog(v348, "MapsAnalyticsTypes");
          v290 = (id)objc_claimAutoreleasedReturnValue(v289);
          if (os_log_type_enabled(v290, OS_LOG_TYPE_DEBUG))
          {
            v291 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "objectAtIndexedSubscript:", v288));
            objc_msgSend(v291, "confidence");
            v293 = v292;
            v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "objectAtIndexedSubscript:", v288));
            v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v294, "lastInteractionTime"));
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v293;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v295;
            _os_log_impl((void *)&_mh_execute_header, v290, OS_LOG_TYPE_DEBUG, "confidence: %f, time: %@", buf, 0x16u);

          }
        }
        v296 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "objectAtIndexedSubscript:", v288));
        objc_msgSend(v296, "confidence");
        v298 = v297;

        v299 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "objectAtIndexedSubscript:", v288));
        v362 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v299, "lastInteractionTime"));
        objc_msgSend(v362, "timeIntervalSinceNow");
        LODWORD(v296) = v300 >= 0.0;
        v301 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "objectAtIndexedSubscript:", v288));
        v302 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "lastInteractionTime"));
        objc_msgSend(v302, "timeIntervalSinceNow");
        if (!(_DWORD)v296)
          v303 = -v303;
        v304 = 0.0;
        if (v303 > 0.0)
        {
          v352 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "objectAtIndexedSubscript:", v288));
          v305 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v352, "lastInteractionTime"));
          objc_msgSend(v305, "timeIntervalSinceNow");
          v307 = v306 < 0.0;
          v308 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "objectAtIndexedSubscript:", v288));
          v309 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v308, "lastInteractionTime"));
          objc_msgSend(v309, "timeIntervalSinceNow");
          if (v307)
            v304 = -v310;
          else
            v304 = v310;

        }
        v376 = 0u;
        v377 = 0u;
        v374 = 0u;
        v375 = 0u;
        v311 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v370, "objectAtIndexedSubscript:", v288));
        v312 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v374, v427, 16);
        if (v312)
        {
          v313 = *(_QWORD *)v375;
          do
          {
            for (n = 0; n != v312; n = (char *)n + 1)
            {
              if (*(_QWORD *)v375 != v313)
                objc_enumerationMutation(v311);
              v315 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v344, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v374 + 1) + 8 * (_QWORD)n), "unsignedIntegerValue")));
              if (!objc_msgSend(v315, "hasMapsSuggestionsContactRevelanceScore")
                || objc_msgSend(v315, "hasMapsSuggestionsContactRevelanceScore")
                && (objc_msgSend(v315, "mapsSuggestionsContactRevelanceScore"), v298 > v316))
              {
                objc_msgSend(v315, "setMapsSuggestionsContactRevelanceScore:", v298);
              }
              if (!objc_msgSend(v315, "hasTimeSinceLastInteractedSeconds")
                || v304 > 0.0 && (objc_msgSend(v315, "timeSinceLastInteractedSeconds"), v304 < v317))
              {
                objc_msgSend(v315, "setTimeSinceLastInteractedSeconds:", v304);
              }

            }
            v312 = objc_msgSend(v311, "countByEnumeratingWithState:objects:count:", &v374, v427, 16);
          }
          while (v312);
        }

      }
      ++v288;
    }
    while (v288 < (unint64_t)objc_msgSend(v372, "count"));
  }

LABEL_358:
  v318 = v344;

  return v318;
}

+ (id)hyperlinkMetadataWithTemplate:(id)a3 mapItem:(id)a4 metadata:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  id v36;
  uint64_t v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (sub_1008974F8())
  {
    if (objc_msgSend(v7, "containsUserGeneratedGuideUnit"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstUserGuideContainingMapItem:requiresOrdering:", v8, 1));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
          objc_msgSend(v14, "setHyperlinkType:", 0);
LABEL_28:

          goto LABEL_29;
        }
      }

    }
    if (objc_msgSend(v7, "containsCuratedGuideUnit"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_placeCollections"));
      v16 = objc_msgSend(v15, "count");

      if (v16 == (id)1)
      {
        v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_placeCollections"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

        objc_msgSend(v14, "setHyperlinkType:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publisherAttribution"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionTitle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v19, v20));
        objc_msgSend(v14, "setDisplayedString:", v21);

        goto LABEL_28;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_placeCollections"));
      v23 = objc_msgSend(v22, "count");

      if ((unint64_t)v23 >= 2)
      {
        v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
        objc_msgSend(v14, "setHyperlinkType:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_placeCollections"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Featured in %lu Guides"), objc_msgSend(v24, "count")));
        objc_msgSend(v14, "setDisplayedString:", v25);

        goto LABEL_29;
      }
    }
    if (objc_msgSend(v7, "containsContainmentParentUnit"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItem"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_containedPlace"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "parent"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_identifier"));

      if (v11)
      {
        v29 = objc_msgSend(v11, "muid");
        if (v29)
        {
LABEL_16:
          v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
          objc_msgSend(v14, "setHyperlinkType:", 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Location %llu"), v29));
          objc_msgSend(v14, "setDisplayedString:", v30);

          goto LABEL_28;
        }
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_venueInfo"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "parent"));
        v29 = objc_msgSend(v32, "businessID");

        if (v29)
          goto LABEL_16;
      }

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geoMapItem"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_identifier"));
    v35 = objc_msgSend(v7, "containsTappableEntityWithIdentifier:metadata:", v34, v9);

    if (v35)
    {
      v36 = objc_alloc_init((Class)GEOHyperlinkMetaData);
      v14 = v36;
      v37 = 3;
    }
    else
    {
      if (!objc_msgSend(v7, "containsTransitShieldsUnit")
        || !objc_msgSend(v8, "_hasTransitLabels"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringUnitContent"));
        if (objc_msgSend(v11, "length"))
        {
          v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
          objc_msgSend(v14, "setHyperlinkType:", 4);
          objc_msgSend(v14, "setDisplayedString:", v11);
        }
        else
        {
          v14 = 0;
        }
        goto LABEL_28;
      }
      v36 = objc_alloc_init((Class)GEOHyperlinkMetaData);
      v14 = v36;
      v37 = 4;
    }
    objc_msgSend(v36, "setHyperlinkType:", v37);
  }
  else
  {
    v14 = 0;
  }
LABEL_29:

  return v14;
}

- (MapsAnalyticsHelper)init
{
  MapsAnalyticsHelper *v2;
  MapsAnalyticsHelper *v3;
  GEOPlaceActionDetails *v4;
  GEOPlaceActionDetails *actionDetails;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsAnalyticsHelper;
  v2 = -[MapsAnalyticsHelper init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_tapAction = 0;
    v4 = (GEOPlaceActionDetails *)objc_alloc_init((Class)GEOPlaceActionDetails);
    actionDetails = v3->_actionDetails;
    v3->_actionDetails = v4;

  }
  return v3;
}

- (MapsAnalyticsHelper)initWithLabelMarker:(id)a3
{
  id v4;
  MapsAnalyticsHelper *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOPlaceActionDetails *v14;
  _QWORD *v15;
  NSString *v16;
  int v17;
  void *v18;
  GEOPlaceActionDetails *actionDetails;
  GEOPlaceActionDetails *v20;
  NSString *eventValue;
  NSString *v22;
  _QWORD *v23;
  id populateTapEvent;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  id v56;
  MapsAnalyticsHelper *v57;
  void *v58;
  id v59;
  unsigned int v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  _BYTE v70[128];

  v4 = a3;
  v5 = -[MapsAnalyticsHelper init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureAnnotation"));
    v7 = v6;
    if (!v6 || !objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
    {
      if (objc_msgSend(v4, "isFlyoverTour"))
      {
        v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithTargetID:](GEOPlaceActionDetails, "actionDetailsWithTargetID:", objc_msgSend(v4, "featureID")));
        v15 = 0;
        v16 = 0;
        v17 = 1037;
      }
      else if (objc_msgSend(v4, "isTransitLine"))
      {
        if (objc_msgSend(v4, "_maps_numLines") == (id)1)
        {
          v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithTargetID:](GEOPlaceActionDetails, "actionDetailsWithTargetID:", objc_msgSend(v4, "featureID")));
          v15 = 0;
          v16 = 0;
        }
        else
        {
          v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_analyticsEventValue"));
          v15 = 0;
          v14 = 0;
        }
        v17 = 1035;
      }
      else if ((objc_msgSend(v4, "isTrafficIncident") & 1) != 0)
      {
        v15 = 0;
        v14 = 0;
        v16 = 0;
        v17 = 1031;
      }
      else if (objc_msgSend(v4, "isCluster"))
      {
        v56 = v4;
        v57 = v5;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterFeatureAnnotations"));
        v59 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v26, "count"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v26, "count")));
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v28 = v26;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v65;
          do
          {
            v32 = 0;
            v33 = v7;
            do
            {
              if (*(_QWORD *)v65 != v31)
                objc_enumerationMutation(v28);
              v7 = *(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v32);

              if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
                if (v34)
                {
                  objc_msgSend(v59, "addObject:", v34);
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mapItem"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v35, "_muid")));
                  objc_msgSend(v27, "addObject:", v36);

                }
              }
              v32 = (char *)v32 + 1;
              v33 = v7;
            }
            while (v30 != v32);
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
          }
          while (v30);
        }

        v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", ")));
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1007DFBD4;
        v62[3] = &unk_1011AC860;
        v63 = v59;
        v37 = v59;
        v15 = objc_retainBlock(v62);

        v7 = 0;
        v14 = 0;
        v17 = 1018;
        v4 = v56;
        v5 = v57;
      }
      else
      {
        if (objc_msgSend(v4, "_mapkit_hasMUID"))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "poiSearchManager"));
          v44 = v4;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "searchResultForIdentifier:", v45));

          v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mapItem"));
          if (!v47)
            v47 = objc_msgSend(objc_alloc((Class)MKMapItem), "_initWithLabelMarker:", v44);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "_geoMapItem"));
          v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v48, 0xFFFFFFFFLL, 0.0));

          v4 = v44;
          if ((objc_msgSend(v44, "isTransitAccessPoint") & 1) != 0)
          {
            v17 = 1062;
          }
          else if ((objc_msgSend(v44, "isTransit") & 1) != 0)
          {
            v17 = 1011;
          }
          else if ((objc_msgSend(v44, "isVenueButton") & 1) != 0)
          {
            v17 = 1053;
          }
          else if (objc_msgSend(v44, "hasBusinessID"))
          {
            v17 = 1010;
          }
          else
          {
            v17 = 144;
          }

          v15 = 0;
        }
        else
        {
          v15 = 0;
          v14 = 0;
          v17 = 0;
        }
        v16 = 0;
      }
      goto LABEL_19;
    }
    v8 = v4;
    v7 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parkedCar"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    v12 = v11;
    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_geoMapItem"));
      v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v13, 0xFFFFFFFFLL, 0.0));

LABEL_6:
      v15 = 0;
      v16 = 0;
      v17 = 1010;
LABEL_16:

      v4 = v8;
LABEL_19:
      v5->_tapAction = v17;
      v5->_target = 502;
      actionDetails = v5->_actionDetails;
      v5->_actionDetails = v14;
      v20 = v14;

      eventValue = v5->_eventValue;
      v5->_eventValue = v16;
      v22 = v16;

      v23 = objc_retainBlock(v15);
      populateTapEvent = v5->_populateTapEvent;
      v5->_populateTapEvent = v23;

      goto LABEL_20;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchDotPlace"));

    if (v18)
    {
      v15 = 0;
      v14 = 0;
      v16 = 0;
      v17 = 194;
      goto LABEL_16;
    }
    if (v10)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "_geoMapItem"));
      v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v39, 0xFFFFFFFFLL, 0.0));

      if ((objc_msgSend(v10, "isHomeOrWork") & 1) != 0)
        goto LABEL_6;
      v40 = objc_msgSend(v10, "type");
      if (v40 <= 0xC)
      {
        if (((1 << v40) & 0x221) != 0)
        {
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_1007DFA30;
          v68[3] = &unk_1011AC860;
          v50 = v10;
          v69 = v50;
          v15 = objc_retainBlock(v68);
          v58 = v50;
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "mapItem"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_hikeAssociatedInfo"));
          v60 = objc_msgSend(v52, "hasEncryptedTourMuid");

          if (v60)
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "mapItem"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "_hikeAssociatedInfo"));
            v16 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v53, "encryptedTourMuid")));

          }
          else
          {
            v16 = 0;
          }

          v17 = 1017;
        }
        else
        {
          if (v40 == 4)
            v41 = 1034;
          else
            v41 = 0;
          v15 = 0;
          if (((1 << v40) & 0x1008) != 0)
            v17 = 1020;
          else
            v17 = v41;
          v16 = 0;
        }
        goto LABEL_16;
      }
      v15 = 0;
    }
    else
    {
      if (v12 && objc_msgSend(v12, "_hasMUID"))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_geoMapItem"));
        v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v49, 0xFFFFFFFFLL, 0.0));

        if ((objc_msgSend(v8, "isTransit") & 1) != 0)
        {
          v15 = 0;
          v16 = 0;
          v17 = 1011;
        }
        else
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_geoMapItem"));
          v55 = objc_msgSend(v54, "_isInLinkedPlaceRelationship");

          v15 = 0;
          v16 = 0;
          if (v55)
            v17 = 1017;
          else
            v17 = 1010;
        }
        goto LABEL_16;
      }
      v15 = 0;
      v14 = 0;
    }
    v17 = 0;
    v16 = 0;
    goto LABEL_16;
  }
LABEL_20:

  return v5;
}

- (MapsAnalyticsHelper)initWithMapItem:(id)a3
{
  id v4;
  MapsAnalyticsHelper *v5;
  void *v6;
  uint64_t v7;
  GEOPlaceActionDetails *actionDetails;

  v4 = a3;
  v5 = -[MapsAnalyticsHelper init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
    v7 = objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v6, 0xFFFFFFFFLL, 0.0));
    actionDetails = v5->_actionDetails;
    v5->_actionDetails = (GEOPlaceActionDetails *)v7;

  }
  return v5;
}

- (int)tapAction
{
  return self->_tapAction;
}

- (int)target
{
  return self->_target;
}

- (GEOPlaceActionDetails)actionDetails
{
  return self->_actionDetails;
}

- (NSString)eventValue
{
  return self->_eventValue;
}

- (id)populateTapEvent
{
  return self->_populateTapEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_populateTapEvent, 0);
  objc_storeStrong((id *)&self->_eventValue, 0);
  objc_storeStrong((id *)&self->_actionDetails, 0);
}

@end
