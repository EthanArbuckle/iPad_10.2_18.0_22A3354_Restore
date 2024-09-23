@implementation PGMoodUtilities

+ (id)moodGraphNodeIdentifiersForMomentNodes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke;
  v8[3] = &unk_1E8436408;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v8);

  return v6;
}

+ (id)moodGraphNodeIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_momentNodesForAssetCollection:inGraph:moodOptions:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "moodGraphNodeIdentifiersForMomentNodes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)moodMeaningIdentifiersForMomentNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meaningNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meaningLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

  }
  objc_msgSend(v3, "celebratedHolidayNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PGMoodUtilities_moodMeaningIdentifiersForMomentNodes___block_invoke;
  v11[3] = &unk_1E8433B30;
  v9 = v4;
  v12 = v9;
  objc_msgSend(v8, "enumerateNodesUsingBlock:", v11);

  return v9;
}

+ (id)moodMeaningIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_momentNodesForAssetCollection:inGraph:moodOptions:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "moodMeaningIdentifiersForMomentNodes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)moodSceneIdentifiersByMomentForMomentNodes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke;
  v8[3] = &unk_1E8436408;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v8);

  return v6;
}

+ (id)moodSceneIdentifiersByMomentForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_momentNodesForAssetCollection:inGraph:moodOptions:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "moodSceneIdentifiersByMomentForMomentNodes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)moodGraphContextIdentifiersForMomentNodes:(id)a3 inGraph:(id)a4 moodOptions:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PGMoodGenerationContext *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  _BOOL4 v37;
  id v38;
  uint64_t v39;
  id v40;
  int v41;
  uint64_t v42;
  id v43;
  uint64_t k;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  PGMoodGenerationContext *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _QWORD v101[5];
  _QWORD v102[5];
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  char v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  char v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  char v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  char v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  char v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v7 = a4;
  v54 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_claimAutoreleasedReturnValue();
  v159 = 0;
  v160 = &v159;
  v161 = 0x2020000000;
  v162 = 1;
  v155 = 0;
  v156 = &v155;
  v157 = 0x2020000000;
  v158 = 1;
  v151 = 0;
  v152 = &v151;
  v153 = 0x2020000000;
  v154 = 1;
  v147 = 0;
  v148 = &v147;
  v149 = 0x2020000000;
  v150 = 1;
  v143 = 0;
  v144 = &v143;
  v145 = 0x2020000000;
  v146 = 1;
  v139 = 0;
  v140 = &v139;
  v141 = 0x2020000000;
  v142 = 1;
  v135 = 0;
  v136 = &v135;
  v137 = 0x2020000000;
  v138 = 1;
  v131 = 0;
  v132 = &v131;
  v133 = 0x2020000000;
  v134 = 1;
  v127 = 0;
  v128 = &v127;
  v129 = 0x2020000000;
  v130 = 1;
  v123 = 0;
  v124 = &v123;
  v125 = 0x2020000000;
  v126 = 1;
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 1;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 1;
  objc_msgSend(v54, "moodGenerationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v49 = v9;
  }
  else
  {
    v11 = [PGMoodGenerationContext alloc];
    objc_msgSend(v54, "referenceDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[PGMoodGenerationContext initWithReferenceDate:](v11, "initWithReferenceDate:", v12);

  }
  objc_msgSend(v7, "meNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__60107;
  v113 = __Block_byref_object_dispose__60108;
  v114 = 0;
  v15 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v103 = 0;
    v104 = &v103;
    v105 = 0x3032000000;
    v106 = __Block_byref_object_copy__60107;
    v107 = __Block_byref_object_dispose__60108;
    v108 = 0;
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke;
    v102[3] = &unk_1E8433BE0;
    v102[4] = &v103;
    objc_msgSend(v13, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", 13, 3, v102, v49);
    v16 = (void *)v104[5];
    if (v16)
    {
      objc_msgSend(v16, "collection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "socialGroupNodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v15;
      v101[1] = 3221225472;
      v101[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_2;
      v101[3] = &unk_1E8433C10;
      v101[4] = &v109;
      objc_msgSend(v18, "enumerateNodesUsingBlock:", v101);

    }
    _Block_object_dispose(&v103, 8);

  }
  else
  {
    *((_BYTE *)v160 + 24) = 0;
    *((_BYTE *)v156 + 24) = 0;
  }
  objc_msgSend(v7, "supersetCityNodes", v49);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "count"))
  {
    *((_BYTE *)v152 + 24) = 0;
    *((_BYTE *)v148 + 24) = 0;
    *((_BYTE *)v144 + 24) = 0;
  }
  v20 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "bestSocialGroupNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)v8;
  if (!objc_msgSend(v22, "count"))
  {
    if (!v110[5])
      *((_BYTE *)v132 + 24) = 0;
    *((_BYTE *)v128 + 24) = 0;
    *((_BYTE *)v124 + 24) = 0;
  }
  v103 = 0;
  v104 = &v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__60107;
  v107 = __Block_byref_object_dispose__60108;
  v108 = 0;
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__60107;
  v99 = __Block_byref_object_dispose__60108;
  v100 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__60107;
  v93 = __Block_byref_object_dispose__60108;
  v94 = 0;
  v67[0] = v15;
  v67[1] = 3221225472;
  v67[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_3;
  v67[3] = &unk_1E8433C90;
  v73 = &v119;
  v23 = v50;
  v68 = v23;
  v74 = &v115;
  v75 = &v159;
  v76 = &v155;
  v77 = &v151;
  v78 = &v147;
  v79 = &v143;
  v24 = v14;
  v69 = v24;
  v51 = v19;
  v70 = v51;
  v80 = &v89;
  v81 = &v139;
  v82 = &v135;
  v25 = v22;
  v71 = v25;
  v83 = &v109;
  v84 = &v131;
  v85 = &v127;
  v86 = &v123;
  v26 = v7;
  v72 = v26;
  v87 = &v95;
  v88 = &v103;
  objc_msgSend(v52, "enumerateNodesUsingBlock:", v67);
  v27 = (void *)v8;
  if (*((_BYTE *)v120 + 24))
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v28 = (id)v96[5];
    v29 = 0;
    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v165, 16, v51);
    if (v30)
    {
      v31 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v64 != v31)
            objc_enumerationMutation(v28);
          if ((_BYTE)v29)
          {
            v29 = 1;
            goto LABEL_26;
          }
          v29 = objc_msgSend(v23, "socialGroupIsLongTimeNoSeeWithSocialGroupNode:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v165, 16);
        if (v30)
          continue;
        break;
      }
    }
LABEL_26:

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v33 = (id)v104[5];
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v164, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v60;
      while (2)
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v60 != v35)
            objc_enumerationMutation(v33);
          if ((_BYTE)v29)
          {

            v27 = v53;
            v37 = 1;
            goto LABEL_37;
          }
          v29 = objc_msgSend(v23, "personIsLongTimeNoSeeWithPersonNode:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v164, 16);
        if (v34)
          continue;
        break;
      }
    }

    v27 = v53;
    v37 = v29 != 0;
  }
  else
  {
    v37 = 0;
  }
LABEL_37:
  if (*((_BYTE *)v116 + 24))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v38 = (id)v90[5];
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v163, 16);
    v40 = v24;
    v41 = 0;
    if (v39)
    {
      v42 = *(_QWORD *)v56;
      while (2)
      {
        v43 = v26;
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v56 != v42)
            objc_enumerationMutation(v38);
          if ((v41 & 1) != 0)
          {
            v41 = 1;
            v26 = v43;
            goto LABEL_48;
          }
          v41 = objc_msgSend(v23, "locationIsLongTimeNoSeeWithLocationNode:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k));
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v163, 16);
        v26 = v43;
        if (v39)
          continue;
        break;
      }
    }
LABEL_48:

    v27 = v53;
    v24 = v40;
  }
  else
  {
    v41 = 0;
  }
  if (*((_BYTE *)v160 + 24))
  {
    v45 = CFSTR("AtHome");
  }
  else if (*((_BYTE *)v156 + 24))
  {
    v45 = CFSTR("AtWork");
  }
  else if (*((_BYTE *)v152 + 24))
  {
    v45 = CFSTR("CurrentSuperset");
  }
  else if (*((_BYTE *)v148 + 24))
  {
    v45 = CFSTR("OtherSuperset");
  }
  else
  {
    if (!*((_BYTE *)v144 + 24))
      goto LABEL_61;
    v45 = CFSTR("NoSuperset");
  }
  objc_msgSend(v27, "addObject:", v45, v51);
LABEL_61:
  if (*((_BYTE *)v140 + 24))
  {
    v46 = CFSTR("NoPeople");
  }
  else
  {
    if (!*((_BYTE *)v136 + 24))
      goto LABEL_66;
    v46 = CFSTR("Crowd");
  }
  objc_msgSend(v27, "addObject:", v46, v51);
LABEL_66:
  if (*((_BYTE *)v132 + 24))
  {
    v47 = CFSTR("BestPairSocialGroup");
  }
  else if (*((_BYTE *)v128 + 24))
  {
    v47 = CFSTR("BestSocialGroups");
  }
  else
  {
    if (!*((_BYTE *)v124 + 24))
      goto LABEL_73;
    v47 = CFSTR("OtherSocialGroups");
  }
  objc_msgSend(v27, "addObject:", v47, v51);
LABEL_73:
  if (v37)
    objc_msgSend(v27, "addObject:", CFSTR("LongTimeNoSeePeople"));
  if (v41)
    objc_msgSend(v27, "addObject:", CFSTR("LongTimeNoSeeLocation"));

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v109, 8);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);
  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v143, 8);
  _Block_object_dispose(&v147, 8);
  _Block_object_dispose(&v151, 8);
  _Block_object_dispose(&v155, 8);
  _Block_object_dispose(&v159, 8);

  return v27;
}

+ (id)moodGraphContextIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "_momentNodesForAssetCollection:inGraph:moodOptions:", a3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "moodGraphContextIdentifiersForMomentNodes:inGraph:moodOptions:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_momentNodesForAssetCollection:(id)a3 inGraph:(id)a4 moodOptions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "momentIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "assetCollectionType") == 6)
  {
    objc_msgSend(v7, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightNodeCollection, "highlightNodeForUUID:inGraph:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "assetCollectionType") == 3)
  {
    objc_msgSend(v7, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMomentNodeCollection momentNodeForUUID:inGraph:](PGGraphMomentNodeCollection, "momentNodeForUUID:inGraph:", v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  PGMomentsForAssetCollection((uint64_t)v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "uuid", (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v14, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v10;
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "countOfEdgesWithLabel:domain:", CFSTR("BELONGSTO"), 302) == 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  uint64_t v46;
  int8x16_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "momentIsLongTimeNoSeeForPeopleWithMomentNode:", v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  }
  else
  {
    v5 = 0;
  }
  *(_BYTE *)(v4 + 24) = v5;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "momentIsLongTimeNoSeeForLocationWithMomentNode:", v3);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(v6 + 24) = v7;
  if ((objc_msgSend(v3, "hasAddressNodes") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addressNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_4;
  v40[3] = &unk_1E8433C60;
  v41 = *(id *)(a1 + 40);
  v45 = *(_OWORD *)(a1 + 88);
  v42 = *(id *)(a1 + 48);
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 120);
  v43 = v11;
  v46 = v12;
  v13 = v3;
  v44 = v13;
  v47 = vextq_s8(*(int8x16_t *)(a1 + 104), *(int8x16_t *)(a1 + 104), 8uLL);
  objc_msgSend(v10, "enumerateNodesUsingBlock:", v40);

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
  v17 = *(void **)(v14 + 40);
  v15 = (id *)(v14 + 40);
  v16 = v17;
  if (v17)
    objc_msgSend(v16, "intersectSet:", v11);
  else
    objc_storeStrong(v15, v8);
  v18 = objc_msgSend(v13, "totalNumberOfPersons");
  if (v18)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = 0;
    if (v18 <= 9)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count") || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40))
  {
    if ((objc_msgSend(v13, "hasEdgeWithLabel:domain:", CFSTR("SOCIALGROUP"), 302) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24) = 0;
    }
    objc_msgSend(v13, "socialGroupNodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((objc_msgSend(v24, "isSameNodeAsNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 40)) & 1) == 0)
          {
            if ((objc_msgSend(*(id *)(a1 + 56), "containsObject:", v24) & 1) == 0)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 24) = 0;
              v26 = a1 + 168;
LABEL_29:
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v26 + 8) + 24) = 0;
              continue;
            }
            v25 = objc_msgSend(*(id *)(a1 + 64), "isBestPairSocialGroup:", v24);
            v26 = a1 + 160;
            if ((v25 & 1) == 0)
              goto LABEL_29;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v21);
    }
    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 40);
    if (v27)
    {
      objc_msgSend(v27, "intersectSet:", v19);
    }
    else
    {
      v28 = objc_msgSend(v19, "mutableCopy");
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

    }
  }
  objc_msgSend(v13, "personNodes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 40);
  if (v32)
  {
    objc_msgSend(v32, "intersectSet:", v31);
  }
  else
  {
    v33 = objc_msgSend(v31, "mutableCopy");
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 192) + 8);
    v35 = *(void **)(v34 + 40);
    *(_QWORD *)(v34 + 40) = v33;

  }
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  __int128 v16;

  v9 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v3 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    v11 = v3;
    v12 = 3221225472;
    v13 = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_5;
    v14 = &unk_1E8433C38;
    v15 = *(id *)(a1 + 32);
    v16 = *(_OWORD *)(a1 + 64);
    objc_msgSend(v9, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_HOME_WORK"), 202, &v11);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count", v9, v11, v12, v13, v14))
  {
    objc_msgSend(v10, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cityNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "containsNode:", v6))
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        v7 = objc_msgSend(*(id *)(a1 + 56), "happensAtFrequentLocation");
        v8 = a1 + 96;
        if (v7)
          v8 = a1 + 88;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
        v8 = a1 + 88;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) = 0;
    }

  }
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_5(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "hasEdgeTowardNode:", *(_QWORD *)(a1 + 32));
  v4 = v7;
  if (v3)
  {
    objc_msgSend(v7, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Home")))
    {
      v6 = a1 + 40;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Work")))
      {
LABEL_7:

        v4 = v7;
        goto LABEL_8;
      }
      v6 = a1 + 48;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24) = 1;
    goto LABEL_7;
  }
LABEL_8:

}

void __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke_2;
  v11[3] = &unk_1E8433BB8;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v4, "enumerateSceneEdgesAndNodesUsingBlock:", v11);
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "identifier");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v9);

}

void __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "isReliable");
  v7 = objc_msgSend(v5, "numberOfSearchConfidenceAssets");

  if ((v6 & 1) != 0 || v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v10, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMoodIdentifier:", v9);

    objc_msgSend(v8, "setIsDistributed:", v6);
    objc_msgSend(v8, "setIsHighConfidence:", v7 != 0);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

  }
}

void __56__PGMoodUtilities_moodMeaningIdentifiersForMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Holiday.Celebrated.%d"), objc_msgSend(a2, "category"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_2;
  v8[3] = &unk_1E8434AB0;
  v9 = *(id *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "enumerateNeighborNodesUsingBlock:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_7;
  v6[3] = &unk_1E8433B90;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateSignificantPartsOfDayUsingBlock:", v6);

}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = a2;
  v4 = objc_msgSend(v3, "domain");
  if (v4 > 500)
  {
    switch(v4)
    {
      case 501:
        v20 = *(void **)(a1 + 32);
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "label");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("POI.%@"), v22);
        break;
      case 502:
        v20 = *(void **)(a1 + 32);
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "label");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("ROI.%@"), v22);
        break;
      case 600:
        goto LABEL_21;
      default:
LABEL_9:
        v5 = *(void **)(a1 + 32);
        v6 = v3;
        objc_msgSend(v6, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "label");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v7)
        {
          objc_msgSend(v6, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v5, "addObject:", v12);
        goto LABEL_21;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v24);

    goto LABEL_21;
  }
  if (v4 == 200)
  {
    v13 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_3;
    v31[3] = &unk_1E8433AD8;
    v32 = *(id *)(a1 + 32);
    v14 = v3;
    objc_msgSend(v14, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_HOME_WORK"), 202, v31);
    objc_msgSend(v14, "collection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "areaNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_4;
    v29[3] = &unk_1E8433B00;
    v30 = *(id *)(a1 + 32);
    objc_msgSend(v16, "enumerateNodesUsingBlock:", v29);

    goto LABEL_21;
  }
  if (v4 != 400)
  {
    if (v4 == 401)
      goto LABEL_21;
    goto LABEL_9;
  }
  objc_msgSend(v3, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("Date")))
  {
    v18 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_5;
    v27[3] = &unk_1E8433B30;
    v28 = *(id *)(a1 + 32);
    v19 = v3;
    objc_msgSend(v19, "enumerateHolidayNodesUsingBlock:", v27);
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_6;
    v25[3] = &unk_1E8433B60;
    v26 = *(id *)(a1 + 32);
    objc_msgSend(v19, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SEASON"), 400, v25);

  }
  else
  {
    objc_msgSend(v17, "isEqualToString:", CFSTR("PartOfDay"));
  }

LABEL_21:
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_7(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  +[PGGraphPartOfDayNode stringValueForPartOfDay:](PGGraphPartOfDayNode, "stringValueForPartOfDay:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PartOfDay.%@"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Holiday.%d"), objc_msgSend(a2, "category"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v10, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "label");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    objc_msgSend(v10, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "addObject:", v9);
}

@end
