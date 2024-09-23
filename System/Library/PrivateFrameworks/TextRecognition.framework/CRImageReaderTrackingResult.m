@implementation CRImageReaderTrackingResult

- (CRImageReaderTrackingResult)initWithTrackingLevel:(unint64_t)a3
{
  CRImageReaderTrackingResult *v4;
  CRImageReaderTrackingResult *v5;
  NSArray *trackedRegions;
  NSArray *v7;
  NSArray *addedRegionIDs;
  NSArray *removedRegionIDs;
  NSArray *updatedRegionIDs;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRImageReaderTrackingResult;
  v4 = -[CRImageReaderTrackingResult init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    trackedRegions = v4->_trackedRegions;
    v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    v4->_trackedRegions = (NSArray *)MEMORY[0x1E0C9AA60];

    addedRegionIDs = v5->_addedRegionIDs;
    v5->_addedRegionIDs = v7;

    removedRegionIDs = v5->_removedRegionIDs;
    v5->_removedRegionIDs = v7;

    updatedRegionIDs = v5->_updatedRegionIDs;
    v5->_updatedRegionIDs = v7;

    objc_opt_self();
    if (a3 > 2)
      v11 = 0;
    else
      v11 = qword_1D513B240[a3];
    v5->_trackedRegionType = v11;
  }
  return v5;
}

- (CRImageReaderTrackingResult)resultByUpdatingWithDocument:(__n128)a3 sceneHomography:(__n128)a4 usesGroupedRegions:(uint64_t)a5
{
  CRImageReaderTrackingResult *v8;
  unint64_t v9;
  _QWORD *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  double v63;
  double v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  uint64_t j;
  void *v72;
  void *v73;
  double v74;
  double v75;
  NSObject *v76;
  const __CFString *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  NSObject *v81;
  NSArray *v82;
  NSArray *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t k;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSArray *trackedRegions;
  void *v103;
  uint64_t v104;
  NSArray *regionTrackingGroups;
  uint64_t v106;
  NSArray *addedRegionIDs;
  uint64_t v108;
  NSArray *removedRegionIDs;
  uint64_t v110;
  NSArray *updatedRegionIDs;
  id v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t m;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  char v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t n;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  double v148;
  double v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  char v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  NSArray *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t ii;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t jj;
  void *v175;
  NSArray *v176;
  NSArray *v177;
  uint64_t v178;
  NSArray *v179;
  void *v180;
  uint64_t v181;
  NSArray *v182;
  void *v183;
  uint64_t v184;
  NSArray *v185;
  NSObject *v186;
  uint64_t v187;
  uint64_t v188;
  NSObject *v189;
  NSObject *v190;
  _QWORD *v192;
  id v193;
  void *v194;
  id v195;
  id v196;
  void *v197;
  os_signpost_id_t spid;
  id v199;
  id v200;
  id v201;
  void *v202;
  void *v203;
  _QWORD *v205;
  void *v206;
  CRImageReaderTrackingResult *v207;
  id obj;
  uint64_t v209;
  void *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  uint64_t v215;
  void *v216;
  id v217;
  uint64_t v219;
  uint64_t v220;
  void *v222;
  void *v223;
  void *v225;
  NSArray *v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
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
  _QWORD v263[4];
  id v264;
  id v265;
  _QWORD v266[5];
  char v267;
  _QWORD v268[4];
  __n128 v269;
  __n128 v270;
  __n128 v271;
  id v272;
  id v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  _BYTE v278[128];
  _BYTE v279[128];
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  uint8_t v286[128];
  uint8_t buf[4];
  uint64_t v288;
  __int16 v289;
  double v290;
  __int16 v291;
  uint64_t v292;
  __int16 v293;
  uint64_t v294;
  __int16 v295;
  uint64_t v296;
  _BYTE v297[128];
  uint64_t v298;

  v298 = *MEMORY[0x1E0C80C00];
  v201 = a6;
  v8 = objc_alloc_init(CRImageReaderTrackingResult);
  if (a1)
    v9 = a1[6];
  else
    v9 = 0;
  v207 = v8;
  v194 = a1;
  if (!v8)
  {
    v192 = a1;
    v193 = v201;
    goto LABEL_150;
  }
  v8->_trackedRegionType = v9;
  v10 = a1;
  v11 = v201;
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v12 = (id)CRSignpostLog_signPostOSLog;
  spid = os_signpost_id_generate(v12);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v13 = (id)CRSignpostLog_signPostOSLog;
  v14 = v13;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, spid, "OCRTrackingPerformAssociationTime", ", buf, 2u);
  }

  objc_msgSend(v10, "trackedRegions");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "regionTrackingGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 0.75;
  objc_msgSend(v10, "markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:ransacReprojError:markedQuadArea:", 1, v16, 0.0);
  if (v207->_trackedRegionType == 4)
  {
    objc_msgSend(v11, "contentsWithTypes:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_new();
    v274 = 0u;
    v275 = 0u;
    v276 = 0u;
    v277 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v274, v297, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v275;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v275 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v274 + 1) + 8 * i), "contentsWithTypes:", 4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObjectsFromArray:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v274, v297, 16);
      }
      while (v21);
    }

    v25 = v18;
  }
  else
  {
    objc_msgSend(v11, "contentsWithTypes:");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v197 = v25;
  v26 = objc_msgSend(v25, "mutableCopy");
  +[CRTrackingFilter filterLowQualityTranscriptRegions:](CRTrackingFilter, "filterLowQualityTranscriptRegions:", v26);
  CROSLogForCategory(1);
  v27 = objc_claimAutoreleasedReturnValue();
  v212 = (void *)v26;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v203, "count");
    v29 = objc_msgSend(v197, "count");
    v30 = objc_msgSend(v212, "count");
    v31 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134218752;
    v288 = v28;
    v26 = (uint64_t)v212;
    v289 = 2048;
    v290 = *(double *)&v29;
    v291 = 2048;
    v292 = v30;
    v293 = 2048;
    v294 = v31;
    _os_log_impl(&dword_1D4FB8000, v27, OS_LOG_TYPE_DEFAULT, "Association: START existingR=%ld candidatesR=%ld,%ld existingG=%ld", buf, 0x2Au);
  }

  v32 = MEMORY[0x1E0C809B0];
  v268[0] = MEMORY[0x1E0C809B0];
  v268[1] = 3221225472;
  v268[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke;
  v268[3] = &unk_1E98DB700;
  v200 = v15;
  v272 = v200;
  v205 = v10;
  v273 = v205;
  v269 = a2;
  v270 = a3;
  v271 = a4;
  v266[0] = v32;
  v266[1] = 3221225472;
  v266[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_18;
  v266[3] = &unk_1E98DB728;
  v266[4] = v207;
  v267 = a7;
  +[CRTrackingAssociator performAssociationOnCandidates:useRegionsAtOCRDispatchTime:existingRegions:newRegionHandler:matchedRegionHandler:](CRHungarianTrackingAssociator, "performAssociationOnCandidates:useRegionsAtOCRDispatchTime:existingRegions:newRegionHandler:matchedRegionHandler:", v26, 1, v203, v268, v266);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  CROSLogForCategory(1);
  v34 = objc_claimAutoreleasedReturnValue();
  v206 = v33;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v33, "tracked");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    objc_msgSend(v33, "updatedRegionIDs");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");
    objc_msgSend(v33, "removedRegionIDs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");
    objc_msgSend(v33, "addedRegionIDs");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");
    objc_msgSend(v206, "totalError");
    *(_DWORD *)buf = 134219008;
    v288 = v36;
    v289 = 2048;
    v290 = *(double *)&v38;
    v291 = 2048;
    v292 = v40;
    v293 = 2048;
    v294 = v42;
    v295 = 2048;
    v296 = v43;
    _os_log_impl(&dword_1D4FB8000, v34, OS_LOG_TYPE_DEFAULT, "Association: - REGION tracked=%ld updated=%ld removed=%ld added=%ld error=%f", buf, 0x34u);

    v33 = v206;
  }

  objc_msgSend(v33, "tracked");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  if (v45)
  {
    objc_msgSend(v33, "tracked");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRTrackedRegionGroup groupsFromOutputRegions:](CRTrackedRegionGroup, "groupsFromOutputRegions:", v46);
    v202 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v202 = (void *)MEMORY[0x1E0C9AA60];
  }
  CROSLogForCategory(1);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = objc_msgSend(v202, "count");
    *(_DWORD *)buf = 134217984;
    v288 = v48;
    _os_log_impl(&dword_1D4FB8000, v47, OS_LOG_TYPE_DEFAULT, "Association: - candidateG=%ld", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v263[0] = v32;
  v263[1] = 3221225472;
  v263[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_25;
  v263[3] = &unk_1E98DB750;
  v51 = v49;
  v264 = v51;
  v217 = v50;
  v265 = v217;
  +[CRHungarianTrackingAssociator performAssociationOnCandidates:useRegionsAtOCRDispatchTime:existingRegions:fineGrainedResults:newRegionHandler:matchedRegionHandler:](CRHungarianTrackingAssociator, "performAssociationOnCandidates:useRegionsAtOCRDispatchTime:existingRegions:fineGrainedResults:newRegionHandler:matchedRegionHandler:", v202, 0, v200, v33, &__block_literal_global_24_0, v263);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  CROSLogForCategory(1);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v52, "tracked");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v225, "count");
    objc_msgSend(v52, "updatedRegionIDs");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");
    objc_msgSend(v52, "removedRegionIDs");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");
    objc_msgSend(v52, "addedRegionIDs");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");
    objc_msgSend(v52, "totalError");
    *(_DWORD *)buf = 134219008;
    v288 = v54;
    v289 = 2048;
    v290 = *(double *)&v56;
    v33 = v206;
    v291 = 2048;
    v292 = v58;
    v293 = 2048;
    v294 = v60;
    v295 = 2048;
    v296 = v61;
    _os_log_impl(&dword_1D4FB8000, v53, OS_LOG_TYPE_DEFAULT, "Association: - GROUP tracked=%ld updated=%ld removed=%ld added=%ld error=%f", buf, 0x34u);

  }
  if (a7)
    v62 = v52;
  else
    v62 = v33;
  objc_msgSend(v62, "updatedRegionIDs");
  v196 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "removedRegionIDs");
  v195 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "addedRegionIDs");
  v199 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "totalError");
  v64 = v63;
  v259 = 0u;
  v260 = 0u;
  v261 = 0u;
  v262 = 0u;
  objc_msgSend(v62, "tracked");
  v65 = (id)objc_claimAutoreleasedReturnValue();

  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v259, v286, 16);
  v67 = v52;
  if (v66)
  {
    v68 = v66;
    v69 = *(_QWORD *)v260;
    v70 = 0.0;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v260 != v69)
          objc_enumerationMutation(v65);
        objc_msgSend(*(id *)(*((_QWORD *)&v259 + 1) + 8 * j), "boundingQuad");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "denormalizedQuad");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "area");
        v70 = v70 + v74;

      }
      v68 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v259, v286, 16);
    }
    while (v68);
  }
  else
  {
    v70 = 0.0;
  }
  v211 = v67;

  v75 = v64 / v70;
  CROSLogForCategory(1);
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    v77 = &stru_1E98DC948;
    if (v70 == 0.0)
      v77 = CFSTR("FIRST_RUN");
    *(_DWORD *)buf = 138412546;
    v288 = (uint64_t)v77;
    v289 = 2048;
    v290 = v75;
    _os_log_impl(&dword_1D4FB8000, v76, OS_LOG_TYPE_DEFAULT, "Association: END %@ normalizedTotalError=%f", buf, 0x16u);
  }

  v257 = 0u;
  v258 = 0u;
  v255 = 0u;
  v256 = 0u;
  obj = v51;
  v78 = v212;
  v213 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v255, v285, 16);
  if (v213)
  {
    v209 = *(_QWORD *)v256;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v256 != v209)
          objc_enumerationMutation(obj);
        v80 = *(void **)(*((_QWORD *)&v255 + 1) + 8 * v79);
        CROSLogForCategory(1);
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v288 = (uint64_t)v80;
          _os_log_impl(&dword_1D4FB8000, v81, OS_LOG_TYPE_DEFAULT, "Association: - replace homography group %@", buf, 0xCu);
        }

        v215 = v79;
        if (v75 < 0.300000012)
        {
          v82 = v207->_regionTrackingGroups;
        }
        else
        {
          objc_msgSend(v211, "tracked");
          v82 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();

        }
        v253 = 0u;
        v254 = 0u;
        v251 = 0u;
        v252 = 0u;
        v83 = v82;
        v84 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v251, v284, 16);
        if (v84)
        {
          v85 = v84;
          v86 = *(_QWORD *)v252;
          do
          {
            for (k = 0; k != v85; ++k)
            {
              if (*(_QWORD *)v252 != v86)
                objc_enumerationMutation(v83);
              if (v80)
              {
                v88 = *(void **)(*((_QWORD *)&v251 + 1) + 8 * k);
                objc_msgSend(v88, "homographyGroupID");
                v89 = objc_claimAutoreleasedReturnValue();
                if (v89)
                {
                  v90 = (void *)v89;
                  objc_msgSend(v88, "homographyGroupID");
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  v92 = objc_msgSend(v91, "integerValue");
                  v93 = objc_msgSend(v80, "integerValue");

                  if (v92 == v93)
                  {
                    objc_msgSend(v88, "trackingID");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v217, "objectForKeyedSubscript:", v94);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v95)
                    {
                      objc_msgSend(v95, "originalBoundingQuad");
                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "setOriginalBoundingQuad:", v96);

                      objc_msgSend(v95, "boundingQuad");
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "setBoundingQuad:", v97);

                      objc_msgSend(v95, "boundingQuadHomography");
                      objc_msgSend(v88, "setBoundingQuadHomography:", v98);
                    }

                  }
                }
              }
            }
            v85 = -[NSArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v251, v284, 16);
          }
          while (v85);
        }

        v79 = v215 + 1;
        v78 = v212;
      }
      while (v215 + 1 != v213);
      v213 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v255, v285, 16);
    }
    while (v213);
  }

  if (v75 >= 0.300000012)
  {
    v99 = v206;
    objc_msgSend(v206, "tracked");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "copy");
    trackedRegions = v207->_trackedRegions;
    v207->_trackedRegions = (NSArray *)v101;

    objc_msgSend(v211, "tracked");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "copy");
    regionTrackingGroups = v207->_regionTrackingGroups;
    v207->_regionTrackingGroups = (NSArray *)v104;

    v106 = objc_msgSend(v199, "copy");
    addedRegionIDs = v207->_addedRegionIDs;
    v207->_addedRegionIDs = (NSArray *)v106;

    v108 = objc_msgSend(v195, "copy");
    removedRegionIDs = v207->_removedRegionIDs;
    v207->_removedRegionIDs = (NSArray *)v108;

    v110 = objc_msgSend(v196, "copy");
    updatedRegionIDs = v207->_updatedRegionIDs;
    v207->_updatedRegionIDs = (NSArray *)v110;
    goto LABEL_144;
  }
  v226 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v199, "count"));
  v216 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v199, "count"));
  v112 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v211, "addedRegionIDs");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = (void *)objc_msgSend(v112, "initWithCapacity:", objc_msgSend(v113, "count"));

  v114 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v99 = v206;
  objc_msgSend(v206, "addedRegionIDs");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = (void *)objc_msgSend(v114, "initWithCapacity:", objc_msgSend(v115, "count"));

  v249 = 0u;
  v250 = 0u;
  v247 = 0u;
  v248 = 0u;
  objc_msgSend(v211, "tracked");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v247, v283, 16);
  if (v117)
  {
    v118 = v117;
    v119 = *(_QWORD *)v248;
    v222 = v116;
    v219 = *(_QWORD *)v248;
    do
    {
      for (m = 0; m != v118; ++m)
      {
        if (*(_QWORD *)v248 != v119)
          objc_enumerationMutation(v116);
        v121 = *(void **)(*((_QWORD *)&v247 + 1) + 8 * m);
        objc_msgSend(v211, "addedRegionIDs");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "trackingID");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v122, "containsObject:", v123) & 1) != 0)
        {
          objc_msgSend(v121, "boundingQuad");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "denormalizedQuad");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "area");
          v127 = v126;

          if (v127 <= 900.0)
            continue;
          v245 = 0u;
          v246 = 0u;
          v243 = 0u;
          v244 = 0u;
          objc_msgSend(v205, "regionTrackingGroups");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v243, v282, 16);
          if (v128)
          {
            v129 = v128;
            v130 = *(_QWORD *)v244;
LABEL_84:
            v131 = 0;
            while (1)
            {
              if (*(_QWORD *)v244 != v130)
                objc_enumerationMutation(v122);
              v132 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * v131);
              objc_msgSend(v121, "boundingQuad");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v132, "boundingQuad");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              v135 = objc_msgSend(v133, "overlapsNormalizedQuad:", v134);

              if ((v135 & 1) != 0)
                break;
              if (v129 == ++v131)
              {
                v129 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v243, v282, 16);
                if (v129)
                  goto LABEL_84;
                goto LABEL_90;
              }
            }
          }
          else
          {
LABEL_90:

            objc_msgSend(v121, "trackingID");
            v136 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v136)
            {
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "setTrackingID:", v137);

            }
            -[NSArray addObject:](v226, "addObject:", v121);
            objc_msgSend(v121, "trackingID");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v214, "addObject:", v122);
          }
          v99 = v206;
          v116 = v222;
          v119 = v219;
        }
        else
        {

        }
      }
      v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v247, v283, 16);
    }
    while (v118);
  }

  v241 = 0u;
  v242 = 0u;
  v239 = 0u;
  v240 = 0u;
  objc_msgSend(v99, "tracked");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v239, v281, 16);
  if (!v139)
    goto LABEL_121;
  v140 = v139;
  v141 = *(_QWORD *)v240;
  v223 = v138;
  v220 = *(_QWORD *)v240;
  do
  {
    for (n = 0; n != v140; ++n)
    {
      if (*(_QWORD *)v240 != v141)
        objc_enumerationMutation(v138);
      v143 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * n);
      objc_msgSend(v99, "addedRegionIDs");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "trackingID");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v144, "containsObject:", v145) & 1) != 0)
      {
        objc_msgSend(v143, "boundingQuad");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "denormalizedQuad");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "area");
        v149 = v148;

        v99 = v206;
        if (v149 <= 900.0)
          continue;
        v237 = 0u;
        v238 = 0u;
        v235 = 0u;
        v236 = 0u;
        objc_msgSend(v205, "trackedRegions");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v235, v280, 16);
        if (v150)
        {
          v151 = v150;
          v152 = *(_QWORD *)v236;
LABEL_107:
          v153 = 0;
          while (1)
          {
            if (*(_QWORD *)v236 != v152)
              objc_enumerationMutation(v144);
            v154 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * v153);
            objc_msgSend(v143, "boundingQuad");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "boundingQuad");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v157 = objc_msgSend(v155, "overlapsNormalizedQuad:", v156);

            if ((v157 & 1) != 0)
              break;
            if (v151 == ++v153)
            {
              v151 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v235, v280, 16);
              if (v151)
                goto LABEL_107;
              goto LABEL_113;
            }
          }
        }
        else
        {
LABEL_113:

          objc_msgSend(v143, "trackingID");
          v158 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v158)
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "setTrackingID:", v159);

          }
          objc_msgSend(v216, "addObject:", v143);
          objc_msgSend(v143, "trackingID");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v210, "addObject:", v144);
        }
        v99 = v206;
        v138 = v223;
        v141 = v220;
      }
      else
      {

      }
    }
    v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v239, v281, 16);
  }
  while (v140);
LABEL_121:

  v160 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v207->_trackedRegions, "count"));
  v161 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v207->_regionTrackingGroups, "count"));
  if (a7)
  {
    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    v162 = v207->_regionTrackingGroups;
    v163 = -[NSArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v231, v279, 16);
    if (v163)
    {
      v164 = v163;
      v165 = *(_QWORD *)v232;
      do
      {
        for (ii = 0; ii != v164; ++ii)
        {
          if (*(_QWORD *)v232 != v165)
            objc_enumerationMutation(v162);
          v167 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * ii);
          if (objc_msgSend(v167, "trackNeedsReplacement"))
          {
            objc_msgSend(v167, "trackingID");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v169 = v161;
          }
          else
          {
            -[NSArray addObject:](v226, "addObject:", v167);
            objc_msgSend(v167, "trackingID");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v169 = v160;
          }
          objc_msgSend(v169, "addObject:", v168);

        }
        v164 = -[NSArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v231, v279, 16);
      }
      while (v164);
    }
    v170 = v214;
  }
  else
  {
    v229 = 0u;
    v230 = 0u;
    v227 = 0u;
    v228 = 0u;
    objc_msgSend(v205, "trackedRegions");
    v162 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v171 = -[NSArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v227, v278, 16);
    if (v171)
    {
      v172 = v171;
      v173 = *(_QWORD *)v228;
      do
      {
        for (jj = 0; jj != v172; ++jj)
        {
          if (*(_QWORD *)v228 != v173)
            objc_enumerationMutation(v162);
          objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * jj), "trackingID");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "addObject:", v175);

        }
        v172 = -[NSArray countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v227, v278, 16);
      }
      while (v172);
    }
    v170 = v210;
  }

  objc_storeStrong((id *)&v207->_updatedRegionIDs, v160);
  v176 = (NSArray *)(id)objc_msgSend(v170, "copy");
  v177 = v207->_addedRegionIDs;
  v207->_addedRegionIDs = v176;

  v178 = objc_msgSend(v161, "copy");
  v179 = v207->_removedRegionIDs;
  v207->_removedRegionIDs = (NSArray *)v178;

  objc_msgSend(v205, "trackedRegions");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "arrayByAddingObjectsFromArray:", v180);
  v181 = objc_claimAutoreleasedReturnValue();
  v182 = v207->_trackedRegions;
  v207->_trackedRegions = (NSArray *)v181;

  objc_msgSend(v205, "regionTrackingGroups");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](v226, "arrayByAddingObjectsFromArray:", v183);
  v184 = objc_claimAutoreleasedReturnValue();
  v185 = v207->_regionTrackingGroups;
  v207->_regionTrackingGroups = (NSArray *)v184;

  CROSLogForCategory(1);
  v186 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
  {
    v187 = -[NSArray count](v207->_removedRegionIDs, "count");
    v188 = -[NSArray count](v207->_addedRegionIDs, "count");
    *(_DWORD *)buf = 134218240;
    v288 = v187;
    v289 = 2048;
    v290 = *(double *)&v188;
    _os_log_impl(&dword_1D4FB8000, v186, OS_LOG_TYPE_DEFAULT, "Association: Removed %lu regions that were marked for replacement and added %lu new regions despite being below the error threshold", buf, 0x16u);
  }

  v78 = v212;
  updatedRegionIDs = v226;
LABEL_144:

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v189 = (id)CRSignpostLog_signPostOSLog;
  v190 = v189;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v189))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v190, OS_SIGNPOST_INTERVAL_END, spid, "OCRTrackingPerformAssociationTime", ", buf, 2u);
  }

LABEL_150:
  return v207;
}

- (void)markTracksNotConformingSameHomographyUsingGroupsAtOCRDispatch:(BOOL)a3 ransacReprojError:(float)a4 markedQuadArea:(double)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  CRVCQuad *v14;
  void *v15;
  CRVCQuad *v16;
  void *v17;
  void *v18;
  CRVCQuad *v19;
  void *v20;
  CRVCQuad *v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSArray *obj;
  _BOOL4 v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v38 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_regionTrackingGroups, "count"));
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_regionTrackingGroups, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = self->_regionTrackingGroups;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if (v38)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "boundingQuadAtOCRDispatch");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "denormalizedQuad");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v11, "boundingQuadAfterOCR");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v14 = [CRVCQuad alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[CRVCQuad initWithImageSpaceQuad:uuid:](v14, "initWithImageSpaceQuad:uuid:", v13, v15);

          objc_msgSend(v40, "addObject:", v16);
          objc_msgSend(v11, "boundingQuad");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "denormalizedQuad");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = [CRVCQuad alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[CRVCQuad initWithImageSpaceQuad:uuid:](v19, "initWithImageSpaceQuad:uuid:", v18, v20);

          objc_msgSend(v39, "addObject:", v21);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v8);
    }

    *(float *)&v22 = a4;
    objc_msgSend(MEMORY[0x1E0DC6CE8], "quadsConformHomographySrcQuads:destQuads:reprojError:", v40, v39, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_regionTrackingGroups, "count"))
    {
      v24 = 0;
      while (1)
      {
        objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "isEqual:", &unk_1E9926B20))
          break;
        objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqual:", &unk_1E9926B38);

        if ((v27 & 1) != 0)
          goto LABEL_17;
        -[NSArray objectAtIndexedSubscript:](self->_regionTrackingGroups, "objectAtIndexedSubscript:", v24);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTrackNeedsReplacement:", 1);

        -[NSArray objectAtIndexedSubscript:](self->_regionTrackingGroups, "objectAtIndexedSubscript:", v24);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "boundingQuad");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "denormalizedQuad");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "area");

LABEL_21:
        if (-[NSArray count](self->_regionTrackingGroups, "count") <= ++v24)
          goto LABEL_22;
      }

LABEL_17:
      -[NSArray objectAtIndexedSubscript:](self->_regionTrackingGroups, "objectAtIndexedSubscript:", v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "trackNeedsReplacement");

      if (v29)
      {
        -[NSArray objectAtIndexedSubscript:](self->_regionTrackingGroups, "objectAtIndexedSubscript:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "boundingQuad");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "denormalizedQuad");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "area");

      }
      -[NSArray objectAtIndexedSubscript:](self->_regionTrackingGroups, "objectAtIndexedSubscript:", v24);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTrackNeedsReplacement:", 0);
      goto LABEL_21;
    }
LABEL_22:

  }
}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  unint64_t v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  float v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  __int128 v28;
  double v29;
  __int128 v30;
  double v31;
  __int128 v32;
  double v33;
  uint8_t buf[16];
  _QWORD v35[4];
  id v36;
  __int128 *v37;
  __int128 v38;
  uint64_t v39;
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "setSignificantTranscriptChange:", 1);
  if (+[CRTrackingFilter shouldStartTrackingRegion:](CRTrackingFilter, "shouldStartTrackingRegion:", v5))
  {
    if (!objc_msgSend(*(id *)(a1 + 80), "count"))
      goto LABEL_8;
    v6 = 0;
    v30 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v32 = *MEMORY[0x1E0C83FE8];
    v28 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
    v7 = 3.4028e38;
    do
    {
      objc_msgSend(v5, "boundingQuad", v28, v30, v32);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "denormalizedQuad");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 88), "regionTrackingGroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "boundingQuadAtOCRDispatch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "denormalizedQuad");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortestDistanceFromCornersOfQuad:", v13);
      v15 = v14;

      if (v7 > v15)
      {
        objc_msgSend(*(id *)(a1 + 88), "regionTrackingGroups");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "boundingQuadHomographySinceOCRDispatch");
        v30 = v19;
        v32 = v18;
        v28 = v20;

        v7 = v15;
        if (v15 == 0.0)
          break;
      }
      ++v6;
      v15 = v7;
    }
    while (objc_msgSend(*(id *)(a1 + 80), "count", v28, v30, v32) > v6);
    if (v15 == 3.4028e38)
    {
LABEL_8:
      v30 = *(_OWORD *)(a1 + 48);
      v32 = *(_OWORD *)(a1 + 32);
      v28 = *(_OWORD *)(a1 + 64);
    }
    *(_QWORD *)&v38 = 0;
    *((_QWORD *)&v38 + 1) = &v38;
    v39 = 0x2020000000;
    v40 = 0;
    objc_msgSend(v5, "boundingQuad", v28, v30, v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "denormalizedQuad");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_17;
    v35[3] = &unk_1E98DB6B8;
    v37 = &v38;
    v23 = v22;
    v36 = v23;
    LODWORD(v24) = 4.0;
    objc_msgSend(v5, "applyHomographyTransform:downscaleRate:shouldApply:", v35, v33, v31, v29, v24);
    if (*(_BYTE *)(*((_QWORD *)&v38 + 1) + 24))
    {
      CROSLogForCategory(1);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4FB8000, v25, OS_LOG_TYPE_DEFAULT, "Association: - filterNewR HG", buf, 2u);
      }

      *a3 = 0;
    }

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    CROSLogForCategory(1);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "activationProbability");
      LODWORD(v38) = 134217984;
      *(_QWORD *)((char *)&v38 + 4) = v27;
      _os_log_impl(&dword_1D4FB8000, v26, OS_LOG_TYPE_DEFAULT, "Association: - filterNewR activationProb=%f", (uint8_t *)&v38, 0xCu);
    }

    *a3 = 0;
  }

}

BOOL __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_17(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[CRTrackingFilter shouldFilterHomographyWithResultQuad:originalQuad:imageSize:](CRTrackingFilter, "shouldFilterHomographyWithResultQuad:originalQuad:imageSize:", a2, *(_QWORD *)(a1 + 32));
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_18(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = a3;
  v9 = a2;
  v10 = v8;
  if (v7)
  {
    if (qword_1ED0B4850 != -1)
      dispatch_once(&qword_1ED0B4850, &__block_literal_global_31);
    objc_msgSend(v9, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_crStringByReplacingCharactersInSet:withString:", _MergedGlobals_33, &stru_1E98DC948);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_crStringByReplacingCharactersInSet:withString:", _MergedGlobals_33, &stru_1E98DC948);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v13, "isEqualToString:", v16) ^ 1;
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v10, "setSignificantTranscriptChange:", v17);
  objc_msgSend(v9, "boundingQuadHomographySinceOCRDispatch");
  v23 = v19;
  v24 = v18;
  v22 = v20;

  LODWORD(v21) = 4.0;
  objc_msgSend(v10, "applyHomographyTransform:downscaleRate:shouldApply:", &__block_literal_global_19, v24, v23, v22, v21);

  *a4 = *(_BYTE *)(a1 + 40) ^ 1;
}

uint64_t __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_2()
{
  return 1;
}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_23(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (+[CRTrackingFilter shouldStartTrackingGroup:](CRTrackingFilter, "shouldStartTrackingGroup:", v4))
  {
    objc_msgSend(v4, "boundingQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "normalizationSize");
    v7 = v6;
    v9 = v8;

    objc_msgSend(v4, "boundingQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "denormalizedQuad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intersectsImageMargin:imageSize:", fmin(v7, v9) * 0.0399999991, v7, v9);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v4, "estimatedPerspectiveQuad");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v4, "boundingQuad");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v13, "denormalizedQuad");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "orthogonalityScore");
          objc_msgSend(v4, "setInitialOrthogonalityScore:");

          objc_msgSend(v4, "initialOrthogonalityScore");
          if (v17 < 0.300000012)
          {
            CROSLogForCategory(1);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v4, "initialOrthogonalityScore");
              v21 = 134217984;
              v22 = v19;
              _os_log_impl(&dword_1D4FB8000, v18, OS_LOG_TYPE_DEFAULT, "Association: - filterNewG orthogonalityScore=%f", (uint8_t *)&v21, 0xCu);
            }

            *a3 = 0;
          }
        }
      }

    }
  }
  else
  {
    CROSLogForCategory(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEFAULT, "Association: - filterNewG", (uint8_t *)&v21, 2u);
    }

    *a3 = 0;
  }

}

void __130__CRImageReaderTrackingResult_performHungarianAssociationWithPreviousResult_candidateDocument_sceneHomography_usesGroupedRegions___block_invoke_25(uint64_t a1, void *a2, void *a3, unsigned __int8 *a4)
{
  id v7;
  id v8;
  double Current;
  double v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  BOOL v27;
  unsigned __int8 *v28;
  uint64_t v29;
  int v30;
  char v31;
  char v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  BOOL v38;
  double v39;
  char v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  double v45;
  double v46;
  NSObject *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  unsigned __int8 *v70;
  uint8_t buf[4];
  double v72;
  __int16 v73;
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v7, "lastOriginalBoundingQuadUpdateTime");
  if (Current - v10 > 120.0)
  {
    CROSLogForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v11, OS_LOG_TYPE_DEFAULT, "Association: - replaceG timeout", buf, 2u);
    }

    *a4 = 0;
  }
  objc_msgSend(v8, "boundingQuad");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "normalizationSize");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v8, "boundingQuad");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "denormalizedQuad");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intersectsImageMargin:imageSize:", fmin(v14, v16) * 0.0399999991, v14, v16);

  objc_msgSend(v7, "boundingQuadAtOCRDispatch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "denormalizedQuad");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "area");
  v23 = v22 * 0.930000007;
  objc_msgSend(v7, "boundingQuad");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "denormalizedQuad");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "area");
  v27 = v23 > v26;
  if (v23 <= v26)
  {

    v33 = 0;
  }
  else
  {
    v28 = a4;
    v29 = a1;
    v70 = v28;
    v30 = *v28;

    v31 = v19;
    if (v30)
      v32 = v19;
    else
      v32 = 1;
    if ((v32 & 1) != 0)
    {
      v33 = 0;
      v27 = 0;
LABEL_22:
      a1 = v29;
      a4 = v70;
      goto LABEL_23;
    }
    objc_msgSend(v7, "estimatedPerspectiveQuad");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "denormalizedQuad");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "orthogonalityScore");
    v36 = v35;

    v38 = v36 <= 0.899999976 || v33 == 0;
    if (v33 && v38)
    {
      v27 = 1;
      goto LABEL_22;
    }
    CROSLogForCategory(1);
    v60 = objc_claimAutoreleasedReturnValue();
    a1 = v29;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "boundingQuad");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "denormalizedQuad");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "area");
      v63 = v62;
      objc_msgSend(v7, "boundingQuadAtOCRDispatch");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "denormalizedQuad");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "area");
      *(_DWORD *)buf = 134218240;
      v72 = v36;
      v73 = 2048;
      v74 = v63 / v66;
      _os_log_impl(&dword_1D4FB8000, v60, OS_LOG_TYPE_DEFAULT, "Association: - replaceG orthogonalityScore=%f areaRatio=%f", buf, 0x16u);

    }
    a4 = v70;
    *v70 = 0;
    objc_msgSend(v7, "homographyGroupID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v31;
    if (!v67)
    {
      v27 = 1;
      goto LABEL_23;
    }
    v68 = *(void **)(a1 + 32);
    objc_msgSend(v7, "homographyGroupID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "addObject:", v20);
  }

LABEL_23:
  objc_msgSend(v7, "initialOrthogonalityScore");
  if (v39 < 0.800000012)
  {
    v40 = *a4 ? v19 : 1;
    if ((v40 & 1) == 0)
    {
      if (!v27)
      {
        objc_msgSend(v8, "estimatedPerspectiveQuad");
        v41 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)v41;
      }
      if (v33)
      {
        objc_msgSend(v8, "boundingQuad");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v33, "isEqual:", v42);

        if ((v43 & 1) == 0)
        {
          objc_msgSend(v33, "denormalizedQuad");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "orthogonalityScore");
          v46 = v45;

          if (v46 > 0.800000012)
          {
            CROSLogForCategory(1);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "initialOrthogonalityScore");
              *(_DWORD *)buf = 134218240;
              v72 = v48;
              v73 = 2048;
              v74 = v46;
              _os_log_impl(&dword_1D4FB8000, v47, OS_LOG_TYPE_DEFAULT, "Association: - replaceG initialOrthogonalityScore=%f orthogonalityScore=%f", buf, 0x16u);
            }

            objc_msgSend(v7, "setInitialOrthogonalityScore:", v46);
            *a4 = 0;
            objc_msgSend(v7, "homographyGroupID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              v50 = *(void **)(a1 + 32);
              objc_msgSend(v7, "homographyGroupID");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "addObject:", v51);

            }
          }
        }
      }
    }
  }
  if (objc_msgSend(v7, "trackNeedsReplacement"))
  {
    *a4 = 0;
    objc_msgSend(v7, "setTrackNeedsReplacement:", 0);
  }
  if (*a4)
  {
    objc_msgSend(v7, "initialOrthogonalityScore");
    objc_msgSend(v8, "setInitialOrthogonalityScore:");
  }
  objc_msgSend(v8, "setTextAlignment:", objc_msgSend(v7, "textAlignment"));
  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "vcQuad");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "numberWithInt:", objc_msgSend(v53, "homographyGroupID"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHomographyGroupID:", v54);

  objc_msgSend(v7, "vcQuad");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "homographyGroupID");
  objc_msgSend(v8, "vcQuad");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setHomographyGroupID:", v56);

  v58 = *(void **)(a1 + 40);
  objc_msgSend(v7, "trackingID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKeyedSubscript:", v8, v59);

}

void __82__CRImageReaderTrackingResult__significantTranscriptChangeBetweenRegion1_region2___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formUnionWithCharacterSet:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = v2;

}

- (unint64_t)stabilityLevel
{
  return self->_stabilityLevel;
}

- (NSArray)trackedRegions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrackedRegions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)updatedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedRegionIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)addedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)removedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRemovedRegionIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)regionTrackingGroups
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegionTrackingGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionTrackingGroups, 0);
  objc_storeStrong((id *)&self->_removedRegionIDs, 0);
  objc_storeStrong((id *)&self->_addedRegionIDs, 0);
  objc_storeStrong((id *)&self->_updatedRegionIDs, 0);
  objc_storeStrong((id *)&self->_trackedRegions, 0);
}

@end
