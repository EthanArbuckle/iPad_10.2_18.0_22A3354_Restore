@implementation NCNotificationRequest(Bulletin)

- (id)bulletin
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sourceInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("BBBulletin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)observer
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sourceInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("BBObserver"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(a1, "notificationRequestForBulletin:observer:sectionInfo:feed:uuid:", v12, v11, v10, a6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (uint64_t)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:uuid:
{
  return objc_msgSend(a1, "_notificationRequestForBulletin:observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:", a3, a4, a5, a6, 0, 0, a7);
}

+ (uint64_t)notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:uuid:
{
  return objc_msgSend(a1, "_notificationRequestForBulletin:observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:", a3, a4, a5, a6, a7, 1, a8);
}

+ (id)_notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
  int v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  NSObject *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t j;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  _BOOL8 v137;
  uint64_t v138;
  _BOOL8 v140;
  uint64_t v141;
  _BOOL8 v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  id v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  id v181;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v190;
  id v192;
  void *v193;
  id v194;
  void (**v195)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v197;
  void *v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _QWORD aBlock[4];
  id v204;
  id v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _BYTE v210[128];
  _QWORD v211[2];
  _BYTE buf[22];
  __int16 v213;
  void *v214;
  _BYTE v215[128];
  _QWORD v216[5];

  v216[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v192 = a4;
  v194 = a5;
  v12 = a9;
  objc_msgSend(v11, "sectionID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v188 = v12;
  objc_msgSend(v14, "setUuid:", v12);
  objc_msgSend(v14, "setSectionIdentifier:", v13);
  objc_msgSend(v11, "subsectionIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSubSectionIdentifiers:", v15);

  objc_msgSend(v11, "publisherMatchID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNotificationIdentifier:", v16);

  objc_msgSend(v11, "categoryID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCategoryIdentifier:", v17);

  objc_msgSend(v11, "intentIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIntentIdentifiers:", v18);

  objc_msgSend(v11, "parentSectionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setParentSectionIdentifier:", v19);

  objc_msgSend(v11, "eventBehavior");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEventBehavior:");
  objc_msgSend(v14, "setIsHighlight:", objc_msgSend(v11, "isHighlight"));
  objc_msgSend(v11, "threadID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  v198 = v14;
  if (v21)
  {
    objc_msgSend(v11, "threadID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setThreadIdentifier:", v22);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "sectionIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("req-%@"), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setThreadIdentifier:", v24);

  }
  v193 = (void *)v13;

  objc_msgSend(v14, "setThreadIdentifierUnique:", v21 != 0);
  objc_msgSend(v14, "setCriticalAlert:", objc_msgSend(v11, "hasCriticalIcon"));
  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  objc_msgSend(v194, "subsections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v206, v215, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v29 = *(_QWORD *)v207;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v207 != v29)
          objc_enumerationMutation(v25);
        v31 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * i);
        objc_msgSend(v11, "subsectionIDs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "subsectionID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "containsObject:", v33);

        if (v34)
        {
          if (!v28 || (v35 = objc_msgSend(v28, "subsectionPriority"), v35 < objc_msgSend(v31, "subsectionPriority")))
          {
            v36 = v31;

            v28 = v36;
          }
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v206, v215, 16);
    }
    while (v27);
  }
  else
  {
    v28 = 0;
  }

  objc_msgSend(v28, "subsectionID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setHighestPrioritySubSectionIdentifier:", v37);

  objc_msgSend(v11, "recencyDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v198, "setTimestamp:", v38);
  }
  else
  {
    objc_msgSend(v11, "date");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v198, "setTimestamp:", v39);
    }
    else
    {
      objc_msgSend(v11, "publicationDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "setTimestamp:", v40);

    }
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if ((a6 & 1) != 0)
  {
    objc_msgSend(v41, "addObject:", CFSTR("BulletinDestinationNotificationCenter"));
    objc_msgSend(v42, "addObject:", CFSTR("BulletinDestinationCoverSheet"));
  }
  v43 = (a8 ^ 1 | a7) ^ 1;
  if ((a6 & 6) == 0)
    v43 = 1;
  if ((v43 & 1) == 0)
    objc_msgSend(v42, "addObject:", CFSTR("BulletinDestinationBanner"));
  v44 = v193;
  if ((a6 & 0x2000) != 0)
  {
    objc_msgSend(v42, "addObject:", CFSTR("BulletinDestinationDigest"));
    objc_msgSend(v42, "addObject:", CFSTR("BulletinDestinationCoverSheet"));
  }
  if ((a6 & 8) != 0)
  {
    objc_msgSend(v42, "addObject:", CFSTR("BulletinDestinationLockScreen"));
    objc_msgSend(v42, "addObject:", CFSTR("BulletinDestinationCoverSheet"));
  }
  if ((a6 & 0x80) != 0)
  {
    objc_msgSend(v42, "addObject:", CFSTR("BulletinDestinationCar"));
  }
  else if (!a6)
  {
    goto LABEL_40;
  }
  if (!objc_msgSend(v42, "count"))
  {
    v45 = *MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a6;
      _os_log_impl(&dword_1CFC3D000, v45, OS_LOG_TYPE_DEFAULT, "Unhandled BBObserver feed: %lu", buf, 0xCu);
    }
  }
LABEL_40:
  objc_msgSend(v198, "setRequestDestinations:", v42);

  objc_msgSend(v11, "context");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setContext:", v46);

  objc_msgSend(v11, "subsectionIDs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setSettingsSections:", v47);

  v48 = (void *)objc_opt_new();
  objc_msgSend(v11, "contentType");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D03638]) & 1) != 0)
  {
    v50 = (id *)MEMORY[0x1E0CEC868];
  }
  else if ((objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D03640]) & 1) != 0)
  {
    v50 = (id *)MEMORY[0x1E0CEC878];
  }
  else if ((objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D03628]) & 1) != 0)
  {
    v50 = (id *)MEMORY[0x1E0CEC860];
  }
  else if ((objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D03650]) & 1) != 0)
  {
    v50 = (id *)MEMORY[0x1E0CEC890];
  }
  else if ((objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D03618]) & 1) != 0)
  {
    v50 = (id *)MEMORY[0x1E0CEC850];
  }
  else if ((objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D03660]) & 1) != 0)
  {
    v50 = (id *)MEMORY[0x1E0CEC8A0];
  }
  else
  {
    v51 = objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0D03608]);
    v50 = (id *)MEMORY[0x1E0CEC840];
    if (v51)
      v50 = (id *)MEMORY[0x1E0CEC838];
  }
  v52 = *v50;

  objc_msgSend(v48, "setContentType:", v52);
  objc_msgSend(v11, "header");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "length"))
  {
    objc_msgSend(v11, "header");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCustomHeader:", v54);

  }
  else
  {
    objc_msgSend(v48, "setCustomHeader:", 0);
  }

  objc_msgSend(v194, "displayName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "length"))
    objc_msgSend(v194, "displayName");
  else
    objc_msgSend(v194, "appName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDefaultHeader:", v56);

  objc_msgSend(v11, "title");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setTitle:", v57);

  objc_msgSend(v11, "subtitle");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSubtitle:", v58);

  objc_msgSend(v11, "attributedMessage");
  v59 = objc_claimAutoreleasedReturnValue();
  if (!v59)
  {
    objc_msgSend(v11, "message");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "nc_safeAttributedStringWithString:", v60);
    v59 = objc_claimAutoreleasedReturnValue();

  }
  v186 = (void *)v59;
  objc_msgSend(v48, "setAttributedMessage:", v59);
  v61 = a6;
  if (UNCCatchMe())
  {
    objc_msgSend(v11, "summary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSummary:", v62);

    objc_msgSend(v11, "threadSummary");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setThreadSummary:", v63);

    objc_msgSend(v11, "spotlightIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSpotlightIdentifier:", v64);

    v65 = (id *)MEMORY[0x1E0DC5FA8];
    v66 = (id)*MEMORY[0x1E0DC5FA8];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v48, "spotlightIdentifier");
      v67 = (id)objc_claimAutoreleasedReturnValue();
      v68 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v48, "threadSummary");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "numberWithInt:", objc_msgSend(v69, "length") != 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v48, "summary");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "numberWithInt:", objc_msgSend(v72, "length") != 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v70;
      v213 = 2112;
      v214 = v73;
      _os_log_impl(&dword_1CFC3D000, v66, OS_LOG_TYPE_DEFAULT, "notification request for bulletin with spotlightID: %@ hasThreadSummary: %@ hasSummary: %@", buf, 0x20u);

      v65 = (id *)MEMORY[0x1E0DC5FA8];
      v44 = v193;

      v61 = a6;
    }

    v74 = *v65;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      +[NCNotificationRequest(Bulletin) _notificationRequestForBulletin:observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:].cold.1(v48, v74);

  }
  objc_msgSend(v11, "footer");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFooter:", v75);

  objc_msgSend(v11, "date");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDate:", v76);

  objc_msgSend(v48, "setDateAllDay:", objc_msgSend(v11, "dateIsAllDay"));
  objc_msgSend(v11, "timeZone");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setTimeZone:", v77);

  objc_msgSend(v11, "hiddenPreviewsBodyPlaceholder");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHiddenPreviewsBodyPlaceholder:", v78);

  objc_msgSend(v11, "subtypeSummaryFormat");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setCategorySummaryFormat:", v79);

  objc_msgSend(v11, "summaryArgument");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSummaryArgument:", v80);

  objc_msgSend(v48, "setSummaryArgumentCount:", objc_msgSend(v11, "summaryArgumentCount"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__NCNotificationRequest_Bulletin___notificationRequestForBulletin_observer_sectionInfo_feed_playLightsAndSirens_hasPlayLightsAndSirens_uuid___block_invoke;
  aBlock[3] = &unk_1E8D1DD30;
  v81 = v11;
  v204 = v81;
  v82 = v194;
  v205 = v82;
  v83 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = objc_claimAutoreleasedReturnValue();
  v195 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v83;
  (*((void (**)(void *, uint64_t, _QWORD, uint64_t))v83 + 2))(v83, v84, 0, 26);
  v184 = (void *)v84;
  objc_msgSend(v48, "setIcons:", v84);
  if (_NCIsFullScreenBannerPresentationPossible())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t, uint64_t))v195)[2](v195, v85, 33, 34);
    objc_msgSend(v48, "setFullScreenIcons:", v85);

  }
  v185 = v82;
  _iconImagesForBulletinAndSectionInfo(v81, v82, 14);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "firstObject");
  v87 = objc_claimAutoreleasedReturnValue();

  v183 = (void *)v87;
  if (v87)
  {
    v211[0] = v87;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v211[1] = v88;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 2);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCarPlayIcons:", v89);

  }
  else
  {
    objc_msgSend(v48, "setCarPlayIcons:", 0);
  }
  objc_msgSend(v81, "communicationContext");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = v90;
  if (v90)
  {
    v91 = v90;
    objc_msgSend(v90, "recipients");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v199 = 0u;
    v200 = 0u;
    v201 = 0u;
    v202 = 0u;
    v94 = v92;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v199, v210, 16);
    v96 = v91;
    if (v95)
    {
      v97 = v95;
      v98 = *(_QWORD *)v200;
      do
      {
        for (j = 0; j != v97; ++j)
        {
          if (*(_QWORD *)v200 != v98)
            objc_enumerationMutation(v94);
          _unContactFromBBContact(*(void **)(*((_QWORD *)&v199 + 1) + 8 * j));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObject:", v100);

        }
        v97 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v199, v210, 16);
      }
      while (v97);
    }

    v101 = objc_alloc_init(MEMORY[0x1E0CEC7A8]);
    objc_msgSend(v96, "identifier");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setIdentifier:", v102);

    objc_msgSend(v96, "associatedObjectUri");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setAssociatedObjectUri:", v103);

    objc_msgSend(v96, "bundleIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setBundleIdentifier:", v104);

    objc_msgSend(v96, "displayName");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setDisplayName:", v105);

    objc_msgSend(v96, "sender");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      objc_msgSend(v96, "sender");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      _unContactFromBBContact(v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v101, "setSender:", v108);
      objc_msgSend(MEMORY[0x1E0DC6038], "sharedInstance");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "topLevelSectionIdentifier");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = (id)objc_msgSend(v109, "updateServiceWithContact:bundleIdentifier:", v108, v110);

      v96 = v190;
    }
    objc_msgSend(v101, "setRecipients:", v93);
    objc_msgSend(v96, "contentURL");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setContentURL:", v112);

    objc_msgSend(v96, "imageName");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setImageName:", v113);

    objc_msgSend(v101, "setSystemImage:", objc_msgSend(v96, "systemImage"));
    objc_msgSend(v101, "setMentionsCurrentUser:", objc_msgSend(v96, "mentionsCurrentUser"));
    objc_msgSend(v101, "setNotifyRecipientAnyway:", objc_msgSend(v96, "notifyRecipientAnyway"));
    objc_msgSend(v101, "setReplyToCurrentUser:", objc_msgSend(v96, "isReplyToCurrentUser"));
    objc_msgSend(v101, "setRecipientCount:", objc_msgSend(v96, "recipientCount"));
    objc_msgSend(v81, "communicationContext");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v114, "capabilities") & 1;

    objc_msgSend(v101, "setCapabilities:", v115);
    objc_msgSend(v101, "setBusinessCorrespondence:", objc_msgSend(v96, "isBusinessCorrespondence"));
    objc_msgSend(v48, "setCommunicationContext:", v101);

    v44 = v193;
    v61 = a6;
  }
  _attachmentImageForBulletin(v81, 35.0);
  v116 = objc_claimAutoreleasedReturnValue();
  if (v116)
    objc_msgSend(v48, "setAttachmentImage:", v116);
  v197 = (void *)v116;
  objc_msgSend(v198, "setContent:", v48);
  v117 = (void *)objc_opt_new();
  objc_msgSend(v81, "alertSuppressionContexts");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setAlertSuppressionContexts:", v118);

  objc_msgSend(v81, "fullAlternateActionLabel");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "length");

  if (v120)
  {
    objc_msgSend(v81, "fullAlternateActionLabel");
    v121 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v81, "fullUnlockActionLabel");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "length");

    if (v123)
    {
      objc_msgSend(v81, "fullUnlockActionLabel");
      v121 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v81, "alternateActionLabel");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "length");

      if (v125)
      {
        objc_msgSend(v81, "alternateActionLabel");
        v121 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v81, "unlockActionLabel");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v126, "length");

        if (!v127)
          goto LABEL_95;
        objc_msgSend(v81, "unlockActionLabel");
        v121 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v128 = (void *)v121;
  objc_msgSend(v117, "setAlternateActionLabel:", v121);

LABEL_95:
  objc_msgSend(v117, "setDismissAutomatically:", (v61 & 4) == 0);
  if ((v61 & 4) != 0)
    v129 = objc_msgSend(v81, "allowsPersistentBannersInCarPlay") ^ 1;
  else
    v129 = 1;
  objc_msgSend(v117, "setDismissAutomaticallyForCarPlay:", v129);
  objc_msgSend(v117, "setOverridesQuietMode:", objc_msgSend(v81, "ignoresQuietMode"));
  objc_msgSend(v117, "setOverridesDowntime:", objc_msgSend(v81, "ignoresDowntime"));
  objc_msgSend(v117, "setAlertsWhenLocked:", objc_msgSend(v81, "inertWhenLocked") ^ 1);
  objc_msgSend(v117, "setAddToLockScreenWhenUnlocked:", 1);
  if (objc_msgSend(v81, "allowsAutomaticRemovalFromLockScreen"))
  {
    if (objc_msgSend(v81, "preventAutomaticRemovalFromLockScreen"))
      v130 = 2;
    else
      v130 = 0;
  }
  else
  {
    v130 = 2;
  }
  objc_msgSend(v117, "setLockScreenPersistence:", v130);
  if (objc_msgSend(v81, "lockScreenPriority") == 2)
  {
    if ((objc_msgSend(CFSTR("com.apple.ScreenTimeDowntimeNotifications"), "isEqualToString:", v44) & 1) != 0)
    {
      v131 = 304;
    }
    else if ((objc_msgSend(CFSTR("com.apple.donotdisturb"), "isEqualToString:", v44) & 1) != 0)
    {
      v131 = 303;
    }
    else if ((objc_msgSend(CFSTR("com.apple.powerui.smartcharging"), "isEqualToString:", v44) & 1) != 0)
    {
      v131 = 302;
    }
    else if ((objc_msgSend(CFSTR("com.apple.Siri.ActionPredictionNotifications"), "isEqualToString:", v44) & 1) != 0)
    {
      v131 = 301;
    }
    else if (objc_msgSend(CFSTR("com.apple.shortcuts"), "isEqualToString:", v44))
    {
      v131 = 301;
    }
    else
    {
      v131 = 300;
    }
  }
  else if (objc_msgSend(v81, "lockScreenPriority") == 1
         || objc_msgSend(v81, "prioritizeAtTopOfLockScreen"))
  {
    v131 = 200;
  }
  else
  {
    v131 = 100;
  }
  objc_msgSend(v117, "setLockScreenPriority:", v131);
  objc_msgSend(v117, "setSilencedByMenuButtonPress:", objc_msgSend(v81, "canBeSilencedByMenuButtonPress"));
  objc_msgSend(v117, "setOverridesPocketMode:", objc_msgSend(v81, "ignoresQuietMode"));
  objc_msgSend(v117, "setRealertCount:", objc_msgSend(v81, "realertCount"));
  objc_msgSend(v117, "setSuppressesAlertsWhenAppIsActive:", objc_msgSend(v81, "suppressesAlertsWhenAppIsActive"));
  objc_msgSend(v117, "setCanPlaySound:", a7);
  if (a7)
  {
    if (objc_msgSend(v81, "turnsOnDisplay"))
      v132 = (v61 >> 11) & 1;
    else
      v132 = 0;
  }
  else
  {
    v132 = 0;
  }
  objc_msgSend(v117, "setCanTurnOnDisplay:", v132);
  objc_msgSend(v117, "setRequestsFullScreenPresentation:", objc_msgSend(v81, "wantsFullscreenPresentation") & (v61 >> 3));
  objc_msgSend(v117, "setHideClearActionInList:", 0);
  if (objc_msgSend(v81, "messageNumberOfLines") == -1)
    v133 = 1;
  else
    v133 = objc_msgSend(v81, "displaysActionsInline");
  objc_msgSend(v117, "setNumberOfLinesInfinite:", v133);
  objc_msgSend(v117, "setPreemptsPresentedNotification:", objc_msgSend(v81, "preemptsPresentedAlert"));
  objc_msgSend(v117, "setDisplaysActionsInline:", objc_msgSend(v81, "displaysActionsInline"));
  objc_msgSend(v117, "setRevealsAdditionalContentOnPresentation:", objc_msgSend(v81, "revealsAdditionalContentOnPresentation"));
  v134 = objc_msgSend(v81, "privacySettings");
  v135 = objc_msgSend(v81, "contentPreviewSetting");
  v137 = (v134 & 1) == 0 && v135 != 1;
  objc_msgSend(v117, "setSuppressesTitleWhenLocked:", v137);
  v138 = objc_msgSend(v81, "contentPreviewSetting");
  v140 = (v134 & 2) == 0 && v138 != 1;
  objc_msgSend(v117, "setSuppressesSubtitleWhenLocked:", v140);
  v141 = objc_msgSend(v81, "contentPreviewSetting");
  v143 = (v134 & 4) == 0 && v141 != 1;
  objc_msgSend(v117, "setSuppressesBodyWhenLocked:", v143);
  v144 = objc_msgSend(v81, "contentPreviewSetting");
  if (v144 == 3)
    v145 = 2;
  else
    v145 = v144 == 2;
  objc_msgSend(v117, "setContentPreviewSetting:", v145);
  objc_msgSend(v117, "setCoalescesWhenLocked:", objc_msgSend(v81, "coalescesWhenLocked"));
  objc_msgSend(v117, "setPreventsAutomaticLock:", objc_msgSend(v81, "preventLock"));
  v146 = 1;
  objc_msgSend(v117, "setRevealsAdditionalContentIfNoDefaultAction:", 1);
  objc_msgSend(v81, "defaultAction");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  if (v147)
    v146 = objc_msgSend(v81, "hasCriticalIcon");
  objc_msgSend(v117, "setLauchUsingSiriForCarPlayDefaultAction:", v146);

  objc_msgSend(v117, "setAllowActionsForCarPlay:", objc_msgSend(v81, "allowsSupplementaryActionsInCarPlay"));
  objc_msgSend(v117, "setPlayMediaWhenRaised:", objc_msgSend(v81, "playsMediaWhenRaised"));
  objc_msgSend(v117, "setHideCloseActionForCarPlay:", objc_msgSend(v81, "hideDismissActionInCarPlay"));
  objc_msgSend(v117, "setShouldAnnounceForCarPlay:", (v61 >> 12) & 1);
  objc_msgSend(v117, "setSuppressPresentationInAmbient:", objc_msgSend(v81, "suppressPresentationInAmbient"));
  objc_msgSend(v117, "setScreenCaptureProhibited:", objc_msgSend(v81, "screenCaptureProhibited"));
  objc_msgSend(v81, "speechLanguage");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setSpeechLanguage:", v148);

  objc_msgSend(v198, "setOptions:", v117);
  if ((v61 & 0x10) != 0)
  {
    objc_msgSend(v81, "sound");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = v149;
    if (v149)
    {
      v151 = v149;
      v152 = (void *)objc_opt_new();
      objc_msgSend(v152, "setSoundType:", 2);
      objc_msgSend(v151, "alertConfiguration");
      v153 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v152, "setAlertConfiguration:", v153);
    }
    else
    {
      v152 = 0;
    }

    objc_msgSend(v198, "setSound:", v152);
  }
  v154 = (void *)MEMORY[0x1E0DC5FF0];
  objc_msgSend(v81, "dismissAction");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "notificationActionForDismissAction:bulletin:observer:", v155, v81, v192);
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v81, "wantsFullscreenPresentation"))
  {
    if (objc_msgSend(v44, "isEqualToString:", CFSTR("com.apple.mobiletimer")))
      v157 = v156;
    else
      v157 = 0;
  }
  else
  {
    v157 = 0;
  }
  objc_msgSend(v198, "setCancelAction:", v157);
  objc_msgSend(v198, "setClearAction:", v156);
  if (objc_msgSend(v81, "shouldDismissBulletinWhenClosed"))
    v158 = v156;
  else
    v158 = 0;
  objc_msgSend(v198, "setCloseAction:", v158);
  v159 = (void *)MEMORY[0x1E0DC5FF0];
  objc_msgSend(v81, "defaultAction");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "notificationActionForDefaultAction:bulletin:observer:", v160, v81, v192);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setDefaultAction:", v161);

  v162 = (void *)MEMORY[0x1E0DC5FF0];
  objc_msgSend(v81, "silenceAction");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "notificationActionForSilenceAction:bulletin:observer:", v163, v81, v192);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setSilenceAction:", v164);

  v165 = (void *)MEMORY[0x1E0DC5FF0];
  objc_msgSend(v81, "followActivityAction");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "notificationActionForFollowActivityAction:bulletin:observer:", v166, v81, v192);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setInlineAction:", v167);

  v168 = v192;
  v169 = v81;
  _actionsForLayout(v169, v168, 0);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  _actionsForLayout(v169, v168, 1);
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v171, "count"))
  {
    if ((unint64_t)objc_msgSend(v170, "count") < 3)
    {
      v172 = v170;
    }
    else
    {
      objc_msgSend(v170, "subarrayWithRange:", 0, 2);
      v172 = (id)objc_claimAutoreleasedReturnValue();
    }
    v173 = v172;

    v171 = v173;
  }
  v174 = *MEMORY[0x1E0DC5F60];
  v216[0] = *MEMORY[0x1E0DC5F58];
  v216[1] = v174;
  *(_QWORD *)buf = v170;
  *(_QWORD *)&buf[8] = v171;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v216, 2);
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v198, "setSupplementaryActions:", v175);
  objc_msgSend(MEMORY[0x1E0CEC6F8], "notificationForBulletin:", v169);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setUserNotification:", v176);

  objc_msgSend(v198, "setIsCollapsedNotification:", 0);
  objc_msgSend(v198, "setCollapsedNotificationsCount:", 0);
  v177 = (void *)objc_opt_new();
  objc_msgSend(v177, "setObject:forKey:", v169, CFSTR("BBBulletin"));
  objc_msgSend(v177, "setObject:forKey:", v168, CFSTR("BBObserver"));
  objc_msgSend(v198, "setSourceInfo:", v177);
  v178 = objc_msgSend(v169, "interruptionLevel");
  if ((unint64_t)(v178 - 1) >= 3)
    v179 = 0;
  else
    v179 = v178;
  objc_msgSend(v198, "setInterruptionLevel:", v179);
  objc_msgSend(v169, "relevanceScore");
  objc_msgSend(v198, "setRelevanceScore:");
  objc_msgSend(v169, "filterCriteria");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "setFilterCriteria:", v180);

  v181 = (id)objc_msgSend(v198, "copy");
  return v181;
}

- (uint64_t)hasSameContactAsNotificationRequest:()Bulletin
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const void *active;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a1, "bulletin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D036E0];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D036E0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL
    && (objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v12),
        v12,
        v13 == 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    active = (const void *)CPPhoneNumberCopyActiveCountryCode();
    v15 = CPPhoneNumbersEqual();
    CFRelease(active);
  }
  else
  {
    v15 = objc_msgSend(v8, "isEqualToString:", v11);
  }

  return v15;
}

- (id)contactIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "bulletin");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D036E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentImageWithDimension:()Bulletin
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2 > 0.0 && a2 != 35.0 && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(a1, "bulletin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _attachmentImageForBulletin(v6, a2);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (void)_notificationRequestForBulletin:()Bulletin observer:sectionInfo:feed:playLightsAndSirens:hasPlayLightsAndSirens:uuid:.cold.1(void *a1, NSObject *a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "spotlightIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "threadSummary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "summary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 138413059;
  v9 = v4;
  v10 = 2117;
  v11 = v5;
  v12 = 2117;
  v13 = v6;
  v14 = 2117;
  v15 = v7;
  _os_log_debug_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_DEBUG, "notification request for bulletin with spotlightID: %@ title: %{sensitive}@ threadSummary: %{sensitive}@ summary: %{sensitive}@", (uint8_t *)&v8, 0x2Au);

}

@end
