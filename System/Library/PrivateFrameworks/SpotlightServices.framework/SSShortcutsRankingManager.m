@implementation SSShortcutsRankingManager

+ (id)moveShortcutsToRelatedAppSectionsForAllSections:(id)a3 isAsYouTypeTopHitSearch:(BOOL)a4 sectionBuilderBlock:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  int v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
  void *v91;
  unsigned int v92;
  char v93;
  unint64_t v94;
  void *v95;
  int v96;
  void *v97;
  unsigned int v98;
  void *v99;
  unsigned int v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  unint64_t v106;
  void *v107;
  uint64_t v108;
  BOOL v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t i;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  void (**v132)(id, void *);
  void *v133;
  _BOOL4 v134;
  void *v135;
  void *v136;
  unint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  id obj;
  id obja;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  char v153;
  unint64_t v154;
  unint64_t v155;
  int v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;

  v134 = a4;
  v172 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v132 = (void (**)(id, void *))a5;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = (void *)objc_opt_new();
  v131 = v6;
  if (!objc_msgSend(v6, "count"))
    goto LABEL_38;
  v9 = 0;
  v10 = CFSTR("com.apple.shortcuts");
  v11 = -1;
  do
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v13);

    objc_msgSend(v12, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.shortcuts"));

    if (v15)
      v11 = v9;

    ++v9;
  }
  while (v9 < objc_msgSend(v6, "count"));
  if (v11 == -1)
  {
LABEL_38:
    SSShortcutsAppSectionEnabled();
    v16 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (SSShortcutsAppSectionEnabled() && v16)
    {
      v144 = v8;
      v124 = v7;
      v138 = (void *)objc_opt_new();
      v140 = (void *)objc_opt_new();
      objc_msgSend(v16, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = (void *)objc_msgSend(v17, "mutableCopy");

      v167 = 0u;
      v168 = 0u;
      v165 = 0u;
      v166 = 0u;
      v126 = v16;
      objc_msgSend(v16, "results");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v165, v171, 16);
      if (!v19)
        goto LABEL_42;
      v20 = v19;
      v21 = *(_QWORD *)v166;
      v153 = 1;
      v136 = v18;
      v146 = *(_QWORD *)v166;
LABEL_11:
      v22 = 0;
      v149 = v20;
LABEL_12:
      if (*(_QWORD *)v166 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v22);
      objc_msgSend(v23, "relatedAppIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "length") || (objc_msgSend(v24, "isEqualToString:", v10) & 1) != 0)
      {
        v153 = 0;
        goto LABEL_35;
      }
      objc_msgSend(v144, "objectForKey:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend(v6, "indexOfObject:", v25);
      if (v25)
      {
        v151 = v25;
        objc_msgSend(v25, "results");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        v28 = objc_msgSend(v27, "count");
        if (!objc_msgSend(v27, "count"))
          goto LABEL_33;
        obj = (id)v28;
        v29 = v10;
        v28 = 0;
        while (1)
        {
          objc_msgSend(v27, "objectAtIndexedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "resultBundleId");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqualToString:", v29);

          if (v32)
          {
            objc_msgSend(v23, "rankingItem");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "likelihood");
            v35 = v34;
            objc_msgSend(v30, "rankingItem");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "likelihood");
            v38 = v37;

            if (v35 > v38)
              goto LABEL_31;
          }
          else if (v11 < v155)
          {
LABEL_31:

LABEL_32:
            v6 = v131;
            v10 = v29;
            v18 = v136;
LABEL_33:
            objc_msgSend(v27, "insertObject:atIndex:", v23, v28);
            v25 = v151;
            objc_msgSend(v151, "setResults:", v27);
            v21 = v146;
LABEL_34:

            objc_msgSend(v148, "removeObject:", v23);
            v20 = v149;
LABEL_35:

            if (++v22 == v20)
            {
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v165, v171, 16);
              if (!v20)
                goto LABEL_42;
              goto LABEL_11;
            }
            goto LABEL_12;
          }

          if (++v28 >= (unint64_t)objc_msgSend(v27, "count"))
          {
            v28 = (uint64_t)obj;
            goto LABEL_32;
          }
        }
      }
      v132[2](v132, v24);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v27 = v39;
        objc_msgSend(v39, "addResults:", v23);
        if ((v153 & 1) != 0)
          v40 = v138;
        else
          v40 = v140;
        objc_msgSend(v40, "addObject:", v27);
        objc_msgSend(v144, "setObject:forKey:", v27, v24);
        goto LABEL_34;
      }
      SSGeneralLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[SSShortcutsRankingManager moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);

LABEL_42:
      objc_msgSend(v126, "setResults:", v148);
      v7 = v124;
      v49 = v140;
      if (v11 > objc_msgSend(v124, "count"))
      {
        v11 = objc_msgSend(v124, "count");
        SSGeneralLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          +[SSShortcutsRankingManager moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:].cold.1(v50, v51, v52, v53, v54, v55, v56, v57);

      }
      v8 = v144;
      if (objc_msgSend(v140, "count"))
      {
        v49 = v140;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11 + 1, objc_msgSend(v140, "count"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "insertObjects:atIndexes:", v140, v58);

      }
      if (objc_msgSend(v138, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11, objc_msgSend(v138, "count"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "insertObjects:atIndexes:", v138, v59);

      }
      v6 = v131;
      v16 = v126;
    }
  }
  if (objc_msgSend(v16, "resultsCount"))
  {
    v127 = v16;
  }
  else
  {
    objc_msgSend(v7, "removeObject:", v16);
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("com.apple.shortcuts"));

    v127 = 0;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("com.apple.spotlight.tophits"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (v60)
  {
    objc_msgSend(v60, "results");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "firstObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "sectionBundleIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v61;
    v66 = objc_msgSend(v64, "isEqualToString:", CFSTR("com.apple.application"));

    if (v66)
    {
      objc_msgSend(v65, "results");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "firstObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "resultBundleId");
      v133 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v133 = 0;
    }
    v6 = v131;
    v61 = v65;
  }
  else
  {
    v133 = 0;
  }
  if (SSShortcutsAppSectionEnabled())
  {
    v69 = v133;
    if (objc_msgSend(v133, "length"))
    {
      objc_msgSend(v8, "objectForKey:", v133);
      v70 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = 0;
    }
  }
  else
  {
    v70 = v127;
    v69 = v133;
  }
  v71 = isIpad();
  v72 = 3;
  if (v71)
    v72 = 5;
  v137 = v72;
  if (v134
    && SSAppTopHitWithShortcutsEnabled()
    && objc_msgSend(v61, "resultsCount") == 1
    && objc_msgSend(v69, "length")
    && v70
    && !+[SSTopHitAppWithEntitiesSectionBuilder supportsAppTopHitWithoutIndexFor:](SSTopHitAppWithEntitiesSectionBuilder, "supportsAppTopHitWithoutIndexFor:", v69))
  {
    v145 = v8;
    v125 = v7;
    objc_msgSend(v70, "results");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = (void *)objc_msgSend(v73, "mutableCopy");

    v74 = (void *)objc_opt_new();
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    objc_msgSend(v70, "results");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v161, v170, 16);
    v122 = v70;
    v123 = v61;
    if (!v75)
    {
      v135 = &unk_1E6E98100;
      goto LABEL_121;
    }
    v76 = v75;
    v77 = 0;
    v78 = *(_QWORD *)v162;
    v130 = *MEMORY[0x1E0CA6868];
    v129 = *MEMORY[0x1E0CA6198];
    v128 = *MEMORY[0x1E0DC8018];
    v135 = &unk_1E6E98100;
    v139 = *(_QWORD *)v162;
    v147 = v74;
    while (1)
    {
      v79 = 0;
      v141 = v76;
      do
      {
        if (*(_QWORD *)v162 != v78)
          objc_enumerationMutation(obja);
        v80 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v79);
        objc_msgSend(v80, "resultBundleId", v122);
        v81 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v81, "isEqualToString:", CFSTR("com.apple.shortcuts")))
          goto LABEL_116;
        objc_msgSend(v80, "relatedAppIdentifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v80;
        v84 = objc_msgSend(v82, "isEqualToString:", v69);

        if (!v84)
        {
          v78 = v139;
          v76 = v141;
          goto LABEL_117;
        }
        objc_msgSend(v83, "valueForAttribute:withType:", v130, objc_opt_class());
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v85, "BOOLValue");

        objc_msgSend(v83, "valueForAttribute:withType:", v129, objc_opt_class());
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "isEqualToString:", v128);

        v152 = v83;
        objc_msgSend(v83, "displayOrder");
        v89 = objc_claimAutoreleasedReturnValue();
        v90 = (void *)v89;
        v91 = &unk_1E6E98100;
        if (v89)
          v91 = (void *)v89;
        v81 = v91;

        v156 = v88;
        if ((v88 & 1) != 0)
        {
LABEL_91:
          objc_msgSend(v74, "count");
          v94 = 0;
          v154 = v77 + 1;
          v95 = v83;
          while (v94 != objc_msgSend(v74, "count"))
          {
            if (v154 == v94)
              v96 = v156;
            else
              v96 = 0;
            if (v96 == 1)
            {
              v77 = v154;
              objc_msgSend(v74, "insertObject:atIndex:", v95, v154);
              goto LABEL_108;
            }
            objc_msgSend(v74, "objectAtIndexedSubscript:", v94);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            if (v94 <= v77)
            {
              objc_msgSend(v95, "title");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "text");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "title");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "text");
              v104 = v79;
              v105 = v81;
              v106 = v77;
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = objc_msgSend(v102, "localizedCompare:", v107);

              v77 = v106;
              v81 = v105;
              v79 = v104;
              v95 = v152;

              v109 = v108 == -1;
              v74 = v147;
              if (v109)
              {
LABEL_107:
                objc_msgSend(v74, "insertObject:atIndex:", v95, v94);

                goto LABEL_108;
              }
            }
            else
            {
              v98 = objc_msgSend(v81, "unsignedIntValue");
              objc_msgSend(v97, "displayOrder");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_msgSend(v99, "unsignedIntValue");

              if (v98 < v100)
                goto LABEL_107;
            }

            if (++v94 > objc_msgSend(v74, "count"))
              goto LABEL_108;
          }
          objc_msgSend(v74, "addObject:", v95);
          if (v156)
            v77 = v94;
LABEL_108:
          v69 = v133;
          if (objc_msgSend(v74, "count") > v137)
            objc_msgSend(v74, "removeObjectsInRange:", v137, objc_msgSend(v74, "count") - v137);
          v110 = objc_msgSend(v74, "count");
          if (v77 >= v110 - 1)
            v77 = v110 - 1;
          objc_msgSend(v74, "lastObject");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "displayOrder");
          v112 = objc_claimAutoreleasedReturnValue();
          v113 = (void *)v112;
          v114 = &unk_1E6E98100;
          if (v112)
            v114 = (void *)v112;
          v115 = v114;

          v135 = v115;
          goto LABEL_115;
        }
        if (objc_msgSend(v74, "count") >= v137)
        {
          v92 = objc_msgSend(v81, "unsignedIntValue");
          if (v92 < objc_msgSend(v135, "unsignedIntValue"))
            v93 = v86;
          else
            v93 = 0;
          if ((v93 & 1) != 0)
            goto LABEL_91;
        }
        else if ((v86 | v88) == 1)
        {
          goto LABEL_91;
        }
LABEL_115:
        v78 = v139;
        v76 = v141;
LABEL_116:

LABEL_117:
        ++v79;
      }
      while (v79 != v76);
      v76 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v161, v170, 16);
      if (!v76)
      {
LABEL_121:

        v159 = 0u;
        v160 = 0u;
        v157 = 0u;
        v158 = 0u;
        v116 = v74;
        v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v157, v169, 16);
        v7 = v125;
        v8 = v145;
        if (v117)
        {
          v118 = v117;
          v119 = *(_QWORD *)v158;
          do
          {
            for (i = 0; i != v118; ++i)
            {
              if (*(_QWORD *)v158 != v119)
                objc_enumerationMutation(v116);
              objc_msgSend(v150, "removeObject:", *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * i), v122);
            }
            v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v157, v169, 16);
          }
          while (v118);
        }

        v70 = v122;
        objc_msgSend(v122, "setResults:", v150);

        v6 = v131;
        v61 = v123;
        break;
      }
    }
  }

  return v7;
}

+ (void)moveShortcutsToRelatedAppSectionsForAllSections:(uint64_t)a3 isAsYouTypeTopHitSearch:(uint64_t)a4 sectionBuilderBlock:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B86C5000, a1, a3, "Shortcuts section index out of bounds. This should never happen and is always a bug!", a5, a6, a7, a8, 0);
}

+ (void)moveShortcutsToRelatedAppSectionsForAllSections:(uint64_t)a3 isAsYouTypeTopHitSearch:(uint64_t)a4 sectionBuilderBlock:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B86C5000, a1, a3, "SectionBuilderBlock returned with nil section. Skipping for this result.", a5, a6, a7, a8, 0);
}

@end
