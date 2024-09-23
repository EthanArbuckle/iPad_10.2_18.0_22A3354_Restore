@implementation SBContinuousExposeAutoLayoutController

- (id)spaceByPerformingAutoLayoutWithSpace:(id)a3 previousSpace:(id)a4 configuration:(id)a5 options:(unint64_t)a6
{
  char v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  SBMutableContinuousExposeAutoLayoutSpace *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  double v43;
  int v44;
  uint64_t j;
  void *v46;
  void *v47;
  BOOL v48;
  double v49;
  id v50;
  int v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t k;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  SBContinuousExposeAutoLayoutController *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t n;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t kk;
  void *v108;
  void *v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  _BOOL8 v119;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  uint64_t ii;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  uint64_t jj;
  void *v141;
  double v142;
  id v143;
  id v144;
  void *v145;
  SBContinuousExposeAutoLayoutController *v146;
  double v147;
  id v148;
  void *v149;
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
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
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  uint64_t v191;

  v6 = a6;
  v191 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    goto LABEL_91;
  objc_msgSend(v12, "chamoisLayoutAttributes");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (double *)MEMORY[0x1E0CEB4B0];
  v148 = v11;
  v150 = v12;
  if (v11 && (v6 & 1) != 0)
  {
    v146 = self;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    objc_msgSend(v11, "items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v179, v190, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v180;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v180 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * i), "displayItem");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "containsDisplayItem:", v23))
          {
            objc_msgSend(v13, "autoLayoutItemForDisplayItem:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v24);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v179, v190, 16);
      }
      while (v20);
    }
    v144 = v10;

    v25 = -[SBContinuousExposeAutoLayoutSpace initWithItems:]([SBMutableContinuousExposeAutoLayoutSpace alloc], "initWithItems:", v17);
    v12 = v150;
    -[SBContinuousExposeAutoLayoutController _performAutoLayoutWithSpace:configuration:stageInset:](v146, "_performAutoLayoutWithSpace:configuration:stageInset:", v25, v150, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[SBContinuousExposeAutoLayoutController boundingBoxForSpace:configuration:](v146, "boundingBoxForSpace:configuration:", v25, v150);
    v35 = v34;
    v37 = v36;
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    v145 = v13;
    objc_msgSend(v13, "items");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v175, v189, 16);
    if (v39)
    {
      v40 = v39;
      v143 = v17;
      v41 = 0;
      v42 = *(_QWORD *)v176;
      v43 = v29 + v33 * 0.5;
      LOBYTE(v44) = 1;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v176 != v42)
            objc_enumerationMutation(v38);
          v46 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * j);
          objc_msgSend(v46, "displayItem");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[SBContinuousExposeAutoLayoutSpace containsDisplayItem:](v25, "containsDisplayItem:", v47);

          if (!v48)
          {
            objc_msgSend(v46, "setInDefaultPosition:", 1);
            objc_msgSend(v46, "size");
            objc_msgSend(v46, "setPosition:", v27 + v49 * 0.5, v43);
            v50 = v46;

            v41 = v50;
          }
          if ((v44 & 1) != 0)
            v44 = objc_msgSend(v46, "isInDefaultPosition");
          else
            v44 = 0;
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v175, v189, 16);
      }
      while (v40);

      if (v41)
        v51 = v44;
      else
        v51 = 0;
      if (v51 != 1)
      {
        v17 = v143;
        v10 = v144;
        v12 = v150;
        v16 = (double *)MEMORY[0x1E0CEB4B0];
        goto LABEL_72;
      }
      v52 = v35 + v37;
      v53 = v27 + v31;
      v12 = v150;
      v16 = (double *)MEMORY[0x1E0CEB4B0];
      v17 = v143;
      if (v35 + v37 >= v27 + v31)
      {
LABEL_69:
        v10 = v144;
LABEL_72:

        v13 = v145;
        self = v146;
        goto LABEL_73;
      }
      objc_msgSend(v41, "size");
      v55 = v54;
      objc_msgSend(v149, "stageInterItemSpacing");
      v57 = v27 + v31 * 0.5;
      v58 = (v37 + v55 + v56) * 0.5;
      if (v27 < v57 - v58)
        v27 = v57 - v58;
      objc_msgSend(v41, "size");
      v60 = v59 * 0.5 + v27;
      objc_msgSend(v41, "position");
      objc_msgSend(v41, "setPosition:", v60);
      v173 = 0u;
      v174 = 0u;
      v171 = 0u;
      v172 = 0u;
      objc_msgSend(v145, "items");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v171, v188, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v172;
        v64 = v57 + v58;
        if (v53 < v57 + v58)
          v64 = v53;
        v65 = v64 - v52;
        do
        {
          for (k = 0; k != v62; ++k)
          {
            if (*(_QWORD *)v172 != v63)
              objc_enumerationMutation(v38);
            v67 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * k);
            if ((objc_msgSend(v67, "isEqual:", v41) & 1) == 0)
            {
              objc_msgSend(v67, "position");
              objc_msgSend(v67, "setPosition:", v65 + v68);
            }
          }
          v62 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v171, v188, 16);
        }
        while (v62);
        v12 = v150;
      }
    }
    else
    {
      v41 = 0;
      v16 = (double *)MEMORY[0x1E0CEB4B0];
    }

    goto LABEL_69;
  }
  if (v11)
  {
    objc_msgSend(v11, "items");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v69, "count") > 2)
    {
      objc_msgSend(v11, "items");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "count");
      objc_msgSend(v13, "items");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "count") + 1;

      v74 = v71 == v73;
      v12 = v150;
      if (!v74)
        goto LABEL_73;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = v11;
      v77 = (void *)v75;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      objc_msgSend(v76, "items");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v167, v187, 16);
      if (v79)
      {
        v80 = v79;
        v81 = *(_QWORD *)v168;
        do
        {
          for (m = 0; m != v80; ++m)
          {
            if (*(_QWORD *)v168 != v81)
              objc_enumerationMutation(v78);
            objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * m), "displayItem");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addObject:", v83);

          }
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v167, v187, 16);
        }
        while (v80);
      }
      v84 = self;

      v165 = 0u;
      v166 = 0u;
      v163 = 0u;
      v164 = 0u;
      objc_msgSend(v13, "items");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v163, v186, 16);
      if (v86)
      {
        v87 = v86;
        v88 = *(_QWORD *)v164;
        v89 = 1;
        do
        {
          for (n = 0; n != v87; ++n)
          {
            if (*(_QWORD *)v164 != v88)
              objc_enumerationMutation(v85);
            if ((v89 & 1) != 0)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * n), "displayItem");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = objc_msgSend(v77, "containsObject:", v91);

            }
            else
            {
              v89 = 0;
            }
          }
          v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v163, v186, 16);
        }
        while (v87);

        v12 = v150;
        if ((v89 & 1) == 0)
          goto LABEL_114;
      }
      else
      {

        v12 = v150;
      }
      v161 = 0u;
      v162 = 0u;
      v159 = 0u;
      v160 = 0u;
      objc_msgSend(v13, "items");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v159, v185, 16);
      if (v122)
      {
        v123 = v122;
        v124 = *(_QWORD *)v160;
        v125 = 1;
        do
        {
          for (ii = 0; ii != v123; ++ii)
          {
            if (*(_QWORD *)v160 != v124)
              objc_enumerationMutation(v121);
            if ((v125 & 1) != 0)
              v125 = objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * ii), "isInDefaultPosition");
            else
              v125 = 0;
          }
          v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v159, v185, 16);
        }
        while (v123);

        v12 = v150;
        if ((v125 & 1) == 0)
          goto LABEL_114;
      }
      else
      {

      }
      -[SBContinuousExposeAutoLayoutController _compactSpacingBetweenItemsInSpace:configuration:](v84, "_compactSpacingBetweenItemsInSpace:configuration:", v13, v12);
      -[SBContinuousExposeAutoLayoutController dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:configuration:](v84, "dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:configuration:", v13, v12);
      -[SBContinuousExposeAutoLayoutController boundingBoxForSpace:configuration:](v84, "boundingBoxForSpace:configuration:", v13, v12);
      v128 = v127;
      v130 = v129;
      -[SBContinuousExposeAutoLayoutController stageAreaForSpace:configuration:](v84, "stageAreaForSpace:configuration:", v13, v12);
      v132 = v131;
      v134 = v133;
      v155 = 0u;
      v156 = 0u;
      v157 = 0u;
      v158 = 0u;
      objc_msgSend(v13, "items");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v155, v184, 16);
      if (v136)
      {
        v137 = v136;
        v138 = *(_QWORD *)v156;
        v139 = v132 + v134 * 0.5 - (v128 + v130 * 0.5);
        do
        {
          for (jj = 0; jj != v137; ++jj)
          {
            if (*(_QWORD *)v156 != v138)
              objc_enumerationMutation(v135);
            v141 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * jj);
            objc_msgSend(v141, "position");
            objc_msgSend(v141, "setPosition:", v139 + v142);
          }
          v137 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v155, v184, 16);
        }
        while (v137);
      }

      v12 = v150;
LABEL_114:

      self = v84;
      v16 = (double *)MEMORY[0x1E0CEB4B0];
      goto LABEL_73;
    }

  }
LABEL_73:
  -[SBContinuousExposeAutoLayoutController _performAutoLayoutWithSpace:configuration:stageInset:](self, "_performAutoLayoutWithSpace:configuration:stageInset:", v13, v12, *v16, v16[1], v16[2], v16[3]);
  v147 = v92;
  v94 = v93;
  v96 = v95;
  v98 = v97;
  objc_msgSend(v12, "containerBounds");
  v100 = v99;
  v102 = v101;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  objc_msgSend(v13, "items");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v151, v183, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v152;
    do
    {
      for (kk = 0; kk != v105; ++kk)
      {
        if (*(_QWORD *)v152 != v106)
          objc_enumerationMutation(v103);
        v108 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * kk);
        if ((objc_msgSend(v108, "isInDefaultPosition") & 1) == 0)
        {
          objc_msgSend(v13, "items");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v109, "count");

          if (v110 == 1)
          {
            objc_msgSend(v108, "position");
            if (BSFloatLessThanOrEqualToFloat())
            {
              if (BSFloatLessThanOrEqualToFloat())
                objc_msgSend(v108, "setInDefaultPosition:", 1);
            }
          }
        }
      }
      v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v151, v183, 16);
    }
    while (v105);
  }

  v12 = v150;
  objc_msgSend(v13, "setConfiguration:", v150);
  objc_msgSend(v13, "setStageArea:", v147, v94, v96, v98);
  -[SBContinuousExposeAutoLayoutController boundingBoxForSpace:configuration:](self, "boundingBoxForSpace:configuration:", v13, v150);
  v112 = v111;
  v114 = v113;
  objc_msgSend(v13, "setBoundingBox:");
  objc_msgSend(v149, "stripWidth");
  v116 = v115;
  objc_msgSend(v149, "minimumDefaultWindowSize");
  v118 = (v102 - v117) * 0.5;
  if (v116 >= v118)
    v116 = v118;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v119 = v112 + v114 <= v100 + v102 - v116;
  else
    v119 = v112 >= v116;
  objc_msgSend(v13, "setStripVisible:", v119, v112 + v114);
  -[SBContinuousExposeAutoLayoutController _updateCompactedFramesForSpace:configuration:](self, "_updateCompactedFramesForSpace:configuration:", v13, v150);
  -[SBContinuousExposeAutoLayoutController _updateItemsCoveredByFullyOccludedPeekingItemsInSpace:configuration:](self, "_updateItemsCoveredByFullyOccludedPeekingItemsInSpace:configuration:", v13, v150);

  v11 = v148;
LABEL_91:

  return v13;
}

- (CGRect)_performAutoLayoutWithSpace:(id)a3 configuration:(id)a4 stageInset:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t j;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  _BOOL4 v82;
  _BOOL4 v83;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t m;
  void *v102;
  double v103;
  double v104;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  SBContinuousExposeAutoLayoutController *v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  double v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect result;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v149 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeAutoLayoutController.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("space"));

  }
  objc_msgSend(v12, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v114 = left;
    v115 = top;
    v117 = right;
    v118 = bottom;
    v16 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v13, "chamoisLayoutAttributes");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerBounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v13, "chamoisLayoutAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "screenEdgePadding");

    v111 = v22;
    v112 = v18;
    UIRectInset();
    v125 = v25;
    v127 = v24;
    v121 = v27;
    v123 = v26;
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    objc_msgSend(v12, "items");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v141, v148, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v142;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v142 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
          objc_msgSend(v33, "position");
          v35 = v34;
          v37 = v36;
          objc_msgSend(v33, "size");
          v39 = v38;
          v41 = v40;
          v150.origin.x = v127;
          v150.origin.y = v125;
          v150.size.width = v123;
          v150.size.height = v121;
          v42 = v39 * 0.5;
          v43 = CGRectGetMinX(v150) + v42;
          if (v35 < v43)
            v35 = v43;
          v151.origin.x = v127;
          v151.origin.y = v125;
          v151.size.width = v123;
          v151.size.height = v121;
          v44 = CGRectGetMaxX(v151) - v42;
          if (v35 >= v44)
            v45 = v44;
          else
            v45 = v35;
          v152.origin.x = v127;
          v152.origin.y = v125;
          v152.size.width = v123;
          v152.size.height = v121;
          v46 = v41 * 0.5;
          v47 = v46 + CGRectGetMinY(v152);
          if (v37 < v47)
            v37 = v47;
          v153.origin.x = v127;
          v153.origin.y = v125;
          v153.size.width = v123;
          v153.size.height = v121;
          v48 = CGRectGetMaxY(v153) - v46;
          if (v37 >= v48)
            v49 = v48;
          else
            v49 = v37;
          objc_msgSend(v33, "setPosition:", v45, v49);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v141, v148, 16);
      }
      while (v30);
    }

    v124 = self;
    -[SBContinuousExposeAutoLayoutController stageAreaForSpace:configuration:](self, "stageAreaForSpace:configuration:", v12, v13);
    v128 = v50;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    objc_msgSend(v12, "items");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v138;
      v61 = *MEMORY[0x1E0C9D538];
      v62 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v138 != v60)
            objc_enumerationMutation(v57);
          v64 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
          objc_msgSend(v64, "displayItem");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "autoLayoutItemForDisplayItemIfExists:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            objc_msgSend(v66, "position");
            if (v68 == v61 && v67 == v62)
              objc_msgSend(v64, "setPosition:", v112 + v20 * 0.5, v52 + v56 * 0.5);
          }

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
      }
      while (v59);
    }

    objc_msgSend(v12, "items");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "count");

    if (v71 == 1)
    {
      objc_msgSend(v12, "items");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "firstObject");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v73, "isInDefaultPosition"))
      {
        v74 = v52 + v56 * 0.5;
LABEL_42:
        objc_msgSend(v73, "setPosition:", v20 * 0.5, v74);
        goto LABEL_66;
      }
      objc_msgSend(v73, "size");
      if (v80 == v20 && v79 == v111)
      {
        v74 = v111 * 0.5;
        goto LABEL_42;
      }

    }
    v81 = *MEMORY[0x1E0CEB4B0];
    v120 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v122 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v82 = v114 == v120;
    if (v115 != *MEMORY[0x1E0CEB4B0])
      v82 = 0;
    v113 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    v83 = v117 == v113 && v82;
    if (!v83 || v118 != *(double *)(MEMORY[0x1E0CEB4B0] + 16))
    {
      v128 = v114 + v128;
      v52 = v115 + v52;
      v54 = v54 - (v114 + v117);
      v56 = v56 - (v115 + v118);
    }
    -[SBContinuousExposeAutoLayoutController snapPositionToNearestEdgesIfNecessaryForSpace:stageArea:configuration:](v124, "snapPositionToNearestEdgesIfNecessaryForSpace:stageArea:configuration:", v12, v13, v128, v52, v54, v56);
    -[SBContinuousExposeAutoLayoutController dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:configuration:](v124, "dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:configuration:", v12, v13);
    -[SBContinuousExposeAutoLayoutController updateOverlappingScaleAnchorPositionsForSpace:configuration:](v124, "updateOverlappingScaleAnchorPositionsForSpace:configuration:", v12, v13);
    v85 = !v83;
    if (v124->_reentrancyGuard)
      v85 = 1;
    if ((v85 & 1) != 0 || v118 != v122)
      goto LABEL_67;
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    objc_msgSend(v12, "items");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v134;
      while (2)
      {
        for (k = 0; k != v87; ++k)
        {
          if (*(_QWORD *)v134 != v88)
            objc_enumerationMutation(v73);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * k), "isFullyOccluded") & 1) != 0)
          {
            v116 = v56;

            objc_msgSend(v119, "stageOcclusionDodgingPeekScale");
            objc_msgSend(v119, "stageOcclusionDodgingPeekLength");
            v95 = v94;
            v129 = 0u;
            v130 = 0u;
            v131 = 0u;
            v132 = 0u;
            objc_msgSend(v12, "items");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
            v126 = v120;
            v98 = v113;
            if (v97)
            {
              v99 = v97;
              v100 = *(_QWORD *)v130;
              v126 = v120;
              v98 = v113;
              do
              {
                for (m = 0; m != v99; ++m)
                {
                  if (*(_QWORD *)v130 != v100)
                    objc_enumerationMutation(v96);
                  v102 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * m);
                  if (objc_msgSend(v102, "isFullyOccluded"))
                  {
                    objc_msgSend(v102, "unoccludedPeekingPosition");
                    if (v104 != 1.79769313e308 || v103 != 1.79769313e308)
                    {
                      objc_msgSend(v102, "size");
                      if ((BSFloatLessThanFloat() & 1) != 0)
                      {
                        v126 = v95;
                      }
                      else if (BSFloatGreaterThanFloat())
                      {
                        v98 = v95;
                      }
                    }
                  }
                }
                v99 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v129, v145, 16);
              }
              while (v99);
            }

            v56 = v116;
            if (v126 != v120 || v98 != v113)
            {
              v124->_reentrancyGuard = 1;
              -[SBContinuousExposeAutoLayoutController _performAutoLayoutWithSpace:configuration:stageInset:](v124, "_performAutoLayoutWithSpace:configuration:stageInset:", v12, v13, v81, v126, v122, v98);
              v128 = v106;
              v52 = v107;
              v54 = v108;
              v56 = v109;
              v124->_reentrancyGuard = 0;
            }
            goto LABEL_67;
          }
        }
        v87 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v133, v146, 16);
        if (v87)
          continue;
        break;
      }
    }
LABEL_66:

LABEL_67:
    goto LABEL_68;
  }
  objc_msgSend(v13, "containerBounds");
  v128 = v75;
  v52 = v76;
  v54 = v77;
  v56 = v78;
LABEL_68:

  v90 = v128;
  v91 = v52;
  v92 = v54;
  v93 = v56;
  result.size.height = v93;
  result.size.width = v92;
  result.origin.y = v91;
  result.origin.x = v90;
  return result;
}

- (CGRect)stageAreaForSpace:(id)a3 configuration:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  id obj;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  _BYTE v85[128];
  _QWORD v86[4];
  _QWORD v87[6];
  CGRect result;

  v87[4] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SBContinuousExposeAutoLayoutController boundingBoxForSpace:configuration:](self, "boundingBoxForSpace:configuration:", a3, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "containerBounds");
  v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v72 = v17;
  v73 = v16;
  v65 = v16 + v15;
  v66 = *MEMORY[0x1E0CEB4B0] + v17;
  v78 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v79 = v15;
  v77 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  v70 = v19;
  v71 = v18;
  v75 = *MEMORY[0x1E0CEB4B0];
  v67 = v18 - (v15 + v77);
  v68 = v19 - (*MEMORY[0x1E0CEB4B0] + v78);
  -[SBContinuousExposeAutoLayoutController validTopStageAreaInsetsWithConfiguration:](self, "validTopStageAreaInsetsWithConfiguration:", v6);
  v20 = objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeAutoLayoutController validLeadingStageAreaInsetsWithConfiguration:](self, "validLeadingStageAreaInsetsWithConfiguration:", v6);
  v21 = objc_claimAutoreleasedReturnValue();
  -[SBContinuousExposeAutoLayoutController validBottomStageAreaInsetsWithConfiguration:](self, "validBottomStageAreaInsetsWithConfiguration:", v6);
  v22 = objc_claimAutoreleasedReturnValue();
  v62 = v6;
  -[SBContinuousExposeAutoLayoutController validTrailingStageAreaInsetsWithConfiguration:](self, "validTrailingStageAreaInsetsWithConfiguration:", v6);
  v23 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v20;
  v87[0] = v20;
  v24 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v25 = v23;
  else
    v25 = v21;
  v87[1] = v25;
  v87[2] = v22;
  v59 = (void *)v22;
  v60 = (void *)v21;
  v58 = (void *)v23;
  if (objc_msgSend(*v24, "userInterfaceLayoutDirection") == 1)
    v26 = v21;
  else
    v26 = v23;
  v87[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 + v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 + v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "count"))
  {
    v32 = 0;
    v63 = v27;
    do
    {
      objc_msgSend(v27, "objectAtIndex:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectAtIndex:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v74 = v35;

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      obj = v33;
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v81;
        v76 = 1.79769313e308;
LABEL_11:
        v39 = 0;
        while (2)
        {
          if (*(_QWORD *)v81 != v38)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v39), "doubleValue");
          v41 = v40;
          v43 = v78;
          v42 = v79;
          v44 = v77;
          switch(v32)
          {
            case 0uLL:
              goto LABEL_21;
            case 1uLL:
              v41 = v75;
              v42 = v40;
              goto LABEL_19;
            case 2uLL:
              v41 = v75;
              v42 = v79;
              v43 = v40;
              goto LABEL_20;
            case 3uLL:
              v41 = v75;
              v43 = v78;
              v42 = v79;
              v44 = v40;
              goto LABEL_21;
            default:
              v41 = v75;
              v42 = v79;
LABEL_19:
              v43 = v78;
LABEL_20:
              v44 = v77;
LABEL_21:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v72 + v41);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v84[0] = v45;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v73 + v42);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v84[1] = v46;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v72 + v41 + v70 - (v41 + v43));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v84[2] = v47;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v73 + v42 + v71 - (v42 + v44));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v84[3] = v48;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v49, "objectAtIndex:", v32);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "doubleValue");
              v52 = v51;

              v53 = vabdd_f64(v74, v52);
              if (v53 <= v76)
              {
                v75 = v41;
                v78 = v43;
                v79 = v42;
                v76 = v53;
                v77 = v44;
                v67 = v71 - (v42 + v44);
                v68 = v70 - (v41 + v43);
                v65 = v73 + v42;
                v66 = v72 + v41;
              }

              if (v37 != ++v39)
                continue;
              v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
              if (!v37)
                goto LABEL_25;
              goto LABEL_11;
          }
        }
      }
LABEL_25:

      ++v32;
      v27 = v63;
    }
    while (v32 < objc_msgSend(v63, "count"));
  }

  v54 = v65;
  v55 = v66;
  v56 = v67;
  v57 = v68;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (id)validTopStageAreaInsetsWithConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "chamoisLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenEdgePadding");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)validBottomStageAreaInsetsWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "chamoisLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenEdgePadding");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "dockHeightWithBottomEdgePadding");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v6 + v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_196);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __86__SBContinuousExposeAutoLayoutController_validBottomStageAreaInsetsWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)validLeadingStageAreaInsetsWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "chamoisLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stripWidth");
  v6 = v5;
  objc_msgSend(v4, "screenEdgePadding");
  v8 = v7;
  objc_msgSend(v4, "minimumDefaultWindowSize");
  if (v9 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * 0.5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_11_2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v9;
    objc_msgSend(v3, "containerBounds");
    v17 = (v16 - v15) * 0.5;
    if (v6 < v17)
      v17 = v6;
    v18 = round(v17);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_12_2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

uint64_t __87__SBContinuousExposeAutoLayoutController_validLeadingStageAreaInsetsWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __87__SBContinuousExposeAutoLayoutController_validLeadingStageAreaInsetsWithConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)validTrailingStageAreaInsetsWithConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "chamoisLayoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenEdgePadding");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)snapPositionToNearestEdgesIfNecessaryForSpace:(id)a3 stageArea:(CGRect)a4 configuration:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  objc_msgSend(v12, "chamoisLayoutAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "snapPaddingSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "edgePadding");
  v18 = v17;
  v38 = v16;
  v39 = v11;
  if (v14 == 1)
    objc_msgSend(v16, "singleAppCenterPadding");
  else
    objc_msgSend(v16, "multiAppCenterPadding");
  v40 = v19;
  objc_msgSend(v12, "chamoisLayoutAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "screenEdgePadding");
  v37 = v21;

  objc_msgSend(v12, "containerBounds");
  v36 = v22;
  objc_msgSend(v13, "objectAtIndex:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v13, "reverseObjectEnumerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[SBContinuousExposeAutoLayoutController _snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:](self, "_snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:", v29, v14 == 1, v12, x, y, width, height, 0.0, v18);
        if (v29 != v23)
        {
          objc_msgSend(v29, "position");
          v31 = v30;
          v33 = v32;
          objc_msgSend(v29, "size");
          -[SBContinuousExposeAutoLayoutController _snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:](self, "_snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:", v23, 0, v12, v31 - v34 * 0.5, v33 - v35 * 0.5, v34, v35, v40, v18);
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v26);
  }

  if (v14 == 1)
  {
    -[SBContinuousExposeAutoLayoutController stageAreaForSpace:configuration:](self, "stageAreaForSpace:configuration:", v39, v12);
    -[SBContinuousExposeAutoLayoutController _snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:](self, "_snapPositionForAppToEdgesAndCenterOfRectForItem:rect:centerSnapPadding:edgeSnapPadding:requireBothAxesToSnap:configuration:", v23, 1, v12, v37 + v36);
  }

}

- (void)_snapPositionForAppToEdgesAndCenterOfRectForItem:(id)a3 rect:(CGRect)a4 centerSnapPadding:(double)a5 edgeSnapPadding:(double)a6 requireBothAxesToSnap:(BOOL)a7 configuration:(id)a8
{
  _BOOL4 v9;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (**v39)(_QWORD, _QWORD, _QWORD);
  double v40;
  int v41;
  int v42;
  uint64_t v43;
  double v44;
  double v45;
  double MinY;
  double MidX;
  uint64_t v48;
  double v49;
  double MidY;
  double v52;
  double v53;
  double MinX;
  double MaxX;
  double MaxY;
  double v58;
  double v59;
  double v60;
  _QWORD v61[5];
  __int128 v62;
  _QWORD v63[4];
  __int128 v64;
  double v65;
  _QWORD v66[5];
  __int128 v67;
  _QWORD v68[4];
  __int128 v69;
  double v70;
  uint64_t v71;
  CGFloat v72;
  CGFloat v73;
  _QWORD v74[4];
  __int128 v75;
  double v76;
  uint64_t v77;
  CGFloat v78;
  CGFloat v79;
  _QWORD v80[8];
  __int128 v81;
  _QWORD v82[8];
  __int128 v83;
  _QWORD v84[4];
  __int128 v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  _QWORD v89[4];
  __int128 v90;
  double v91;
  CGFloat v92;
  CGFloat v93;
  _QWORD v94[7];
  __int128 v95;
  _QWORD v96[7];
  __int128 v97;
  _QWORD v98[10];
  __int128 v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;

  v9 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a8;
  objc_msgSend(v15, "chamoisLayoutAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stageInterItemSpacing");
  v48 = v17;

  objc_msgSend(v14, "position");
  v19 = v18;
  v21 = v20;
  *(double *)&v99 = v18;
  *((double *)&v99 + 1) = v20;
  objc_msgSend(v14, "size");
  v23 = v22;
  v25 = v24;
  v52 = v21;
  v53 = v19;
  v26 = v19 - v22 * 0.5;
  v27 = v21 - v24 * 0.5;
  v100.origin.x = x;
  v100.origin.y = y;
  v100.size.width = width;
  v100.size.height = height;
  MinX = CGRectGetMinX(v100);
  v101.origin.x = x;
  v101.origin.y = y;
  v101.size.width = width;
  v101.size.height = height;
  MaxX = CGRectGetMaxX(v101);
  v102.origin.x = x;
  v102.origin.y = y;
  v102.size.width = width;
  v102.size.height = height;
  MinY = CGRectGetMinY(v102);
  v103.origin.x = x;
  v103.origin.y = y;
  v103.size.width = width;
  v103.size.height = height;
  MaxY = CGRectGetMaxY(v103);
  v104.origin.x = x;
  v104.origin.y = y;
  v104.size.width = width;
  v104.size.height = height;
  MidX = CGRectGetMidX(v104);
  v105.origin.x = x;
  v105.origin.y = y;
  v105.size.width = width;
  v105.size.height = height;
  MidY = CGRectGetMidY(v105);
  v106.origin.x = v26;
  v106.origin.y = v27;
  v106.size.width = v23;
  v106.size.height = v25;
  v28 = CGRectGetMinX(v106);
  v107.origin.x = v26;
  v107.origin.y = v27;
  v107.size.width = v23;
  v107.size.height = v25;
  v58 = CGRectGetMaxX(v107);
  v108.origin.x = v26;
  v108.origin.y = v27;
  v108.size.width = v23;
  v108.size.height = v25;
  v59 = CGRectGetMinY(v108);
  v109.origin.x = v26;
  v109.origin.y = v27;
  v109.size.width = v23;
  v109.size.height = v25;
  v60 = CGRectGetMaxY(v109);
  v110.origin.x = v26;
  v110.origin.y = v27;
  v110.size.width = v23;
  v110.size.height = v25;
  CGRectGetMidX(v110);
  objc_msgSend(v15, "containerBounds");
  v49 = CGRectGetMidX(v111);
  objc_msgSend(v15, "containerBounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v37 = MEMORY[0x1E0C809B0];
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke;
  v98[3] = &__block_descriptor_80_e40_B24__0__CGPoint_dd_8____CGPoint_dd____16l;
  v98[4] = v30;
  v98[5] = v32;
  v98[6] = v34;
  v98[7] = v36;
  *(CGFloat *)&v98[8] = v23;
  *(CGFloat *)&v98[9] = v25;
  v38 = MEMORY[0x1D17E5550](v98);
  v39 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v38;
  if (vabdd_f64(MinX, v28) >= a6)
  {
    v40 = MinX;
    v41 = 0;
  }
  else
  {
    v96[0] = v37;
    v96[1] = 3221225472;
    v96[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_2;
    v96[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    v40 = MinX;
    *(double *)&v96[4] = MinX;
    *(CGFloat *)&v96[5] = v23;
    *(CGFloat *)&v96[6] = v25;
    v97 = v99;
    v41 = (*(uint64_t (**)(uint64_t, __int128 *, _QWORD *))(v38 + 16))(v38, &v99, v96);
  }
  if (vabdd_f64(MaxX, v58) < a6)
  {
    v94[0] = v37;
    v94[1] = 3221225472;
    v94[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_3;
    v94[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    *(double *)&v94[4] = MaxX;
    *(CGFloat *)&v94[5] = v23;
    *(CGFloat *)&v94[6] = v25;
    v95 = v99;
    v41 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v94);
  }
  if (vabdd_f64(MinY, v59) >= a6)
  {
    v42 = 0;
  }
  else
  {
    v89[0] = v37;
    v89[1] = 3221225472;
    v89[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_4;
    v89[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    v90 = v99;
    v91 = MinY;
    v92 = v23;
    v93 = v25;
    v42 = ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v89);
  }
  if (vabdd_f64(MaxY, v60) < a6)
  {
    v84[0] = v37;
    v84[1] = 3221225472;
    v84[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_5;
    v84[3] = &__block_descriptor_72_e16__CGPoint_dd_8__0l;
    v85 = v99;
    v86 = MaxY;
    v87 = v23;
    v88 = v25;
    v42 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v84);
  }
  if (vabdd_f64(MaxX, v28) >= a6)
  {
    v43 = v48;
  }
  else
  {
    v82[0] = v37;
    v82[1] = 3221225472;
    v82[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_6;
    v82[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    *(double *)&v82[4] = MaxX;
    v43 = v48;
    v82[5] = v48;
    *(CGFloat *)&v82[6] = v23;
    *(CGFloat *)&v82[7] = v25;
    v83 = v99;
    v41 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v82);
  }
  if (vabdd_f64(v40, v58) < a6)
  {
    v80[0] = v37;
    v80[1] = 3221225472;
    v80[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_7;
    v80[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    *(double *)&v80[4] = v40;
    v80[5] = v43;
    *(CGFloat *)&v80[6] = v23;
    *(CGFloat *)&v80[7] = v25;
    v81 = v99;
    v41 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v80);
  }
  v44 = v53;
  if (vabdd_f64(MaxY, v59) < a6)
  {
    v74[0] = v37;
    v74[1] = 3221225472;
    v74[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_8;
    v74[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    v75 = v99;
    v76 = MaxY;
    v77 = v43;
    v78 = v23;
    v79 = v25;
    v42 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v74);
  }
  if (vabdd_f64(MinY, v60) < a6)
  {
    v68[0] = v37;
    v68[1] = 3221225472;
    v68[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_9;
    v68[3] = &__block_descriptor_80_e16__CGPoint_dd_8__0l;
    v69 = v99;
    v70 = MinY;
    v71 = v43;
    v72 = v23;
    v73 = v25;
    v42 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v68);
  }
  v45 = v52;
  if (vabdd_f64(*(double *)&v99, MidX) < a5)
  {
    if (v41 && vabdd_f64(v53, MidX) > vabdd_f64(*(double *)&v99, v53))
    {
      v41 = 1;
    }
    else
    {
      v66[0] = v37;
      v66[1] = 3221225472;
      v66[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_10;
      v66[3] = &__block_descriptor_56_e16__CGPoint_dd_8__0l;
      *(double *)&v66[4] = MidX;
      v67 = v99;
      v41 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v66);
    }
  }
  if (vabdd_f64(*((double *)&v99 + 1), MidY) < a5)
  {
    if (v42 && vabdd_f64(v52, MidY) > vabdd_f64(*((double *)&v99 + 1), v52))
    {
      v42 = 1;
    }
    else
    {
      v63[0] = v37;
      v63[1] = 3221225472;
      v63[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_11;
      v63[3] = &__block_descriptor_56_e16__CGPoint_dd_8__0l;
      v64 = v99;
      v65 = MidY;
      v42 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v63);
    }
  }
  if (BSFloatEqualToFloat())
  {
    if (v41 && vabdd_f64(v53, v49) > vabdd_f64(*(double *)&v99, v53))
    {
      v41 = 1;
    }
    else
    {
      v61[0] = v37;
      v61[1] = 3221225472;
      v61[2] = __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_12;
      v61[3] = &__block_descriptor_56_e16__CGPoint_dd_8__0l;
      *(double *)&v61[4] = v49;
      v62 = v99;
      v41 |= ((uint64_t (**)(_QWORD, __int128 *, _QWORD *))v39)[2](v39, &v99, v61);
    }
  }
  if (v9 && ((v42 ^ v41) & 1) != 0)
  {
    *(double *)&v99 = v53;
    *((double *)&v99 + 1) = v52;
  }
  else
  {
    v45 = *((double *)&v99 + 1);
    v44 = *(double *)&v99;
  }
  objc_msgSend(v14, "setPosition:", v44, v45);

}

BOOL __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke(CGRect *a1, double *a2, uint64_t a3)
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _BOOL8 result;
  CGRect v13;

  v5 = (*(double (**)(uint64_t))(a3 + 16))(a3);
  v7 = v6;
  SBRectWithSize();
  UIRectCenteredAboutPoint();
  v13.origin.x = v8;
  v13.origin.y = v9;
  v13.size.width = v10;
  v13.size.height = v11;
  result = CGRectContainsRect(a1[1], v13);
  if (result)
  {
    *a2 = v5;
    *((_QWORD *)a2 + 1) = v7;
  }
  return result;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32) + *(double *)(a1 + 40) * 0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_3(uint64_t a1)
{
  return *(double *)(a1 + 32) + *(double *)(a1 + 40) * -0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_5(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_6(double *a1)
{
  return a1[4] + a1[5] + a1[6] * 0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_7(double *a1)
{
  return a1[4] - a1[5] + a1[6] * -0.5;
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_8(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_9(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_10(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_11(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __166__SBContinuousExposeAutoLayoutController__snapPositionForAppToEdgesAndCenterOfRectForItem_rect_centerSnapPadding_edgeSnapPadding_requireBothAxesToSnap_configuration___block_invoke_12(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)_compactSpacingBetweenItemsInSpace:(id)a3 configuration:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v26 = a4;
  -[SBContinuousExposeAutoLayoutController _itemsSortedByXInSpace:configuration:](self, "_itemsSortedByXInSpace:configuration:", a3, v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "chamoisLayoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stageInterItemSpacing");
  v9 = v8;

  v10 = objc_msgSend(v6, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = -1.79769313e308;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "position");
      v16 = v15;
      objc_msgSend(v14, "size");
      v18 = v17;
      objc_msgSend(v14, "position");
      v20 = v19;
      objc_msgSend(v14, "size");
      v22 = v21;
      if (v12 && v16 + v18 * -0.5 > v9 + v13)
      {
        objc_msgSend(v14, "position");
        v24 = v23;
        objc_msgSend(v14, "size");
        objc_msgSend(v14, "setPosition:", v9 + v13 + v25 * 0.5, v24);
      }
      if (v13 < v20 + v22 * 0.5)
        v13 = v20 + v22 * 0.5;

      ++v12;
    }
    while (v11 != v12);
  }

}

- (id)_itemsSortedByXInSpace:(id)a3 configuration:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
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
  char v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v4, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 != 1)
  {
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_19_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_20_3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_21_1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v14);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v9, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "position");
      objc_msgSend(v18, "size");
      v19 = v14;
      objc_msgSend(v19, "position");
      objc_msgSend(v19, "size");
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        objc_msgSend(v9, "sb_arrayByInsertingOrMovingObject:toIndex:", v19, 0);
        v20 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v20;
      }

    }
    objc_msgSend(v9, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqual:", v15) & 1) == 0)
    {
      v22 = objc_msgSend(v14, "isEqual:", v15);

      if ((v22 & 1) != 0)
      {
LABEL_12:

        v8 = v9;
        goto LABEL_13;
      }
      objc_msgSend(v9, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "position");
      objc_msgSend(v21, "size");
      v23 = v15;
      objc_msgSend(v23, "position");
      objc_msgSend(v23, "size");
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        objc_msgSend(v9, "sb_arrayByAddingOrMovingObject:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v24;
      }

    }
    goto LABEL_12;
  }
LABEL_13:

  return v8;
}

uint64_t __79__SBContinuousExposeAutoLayoutController__itemsSortedByXInSpace_configuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "position");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "position");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __79__SBContinuousExposeAutoLayoutController__itemsSortedByXInSpace_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "position");
  v8 = v7;
  objc_msgSend(v6, "size");
  v10 = v9;

  objc_msgSend(v4, "numberWithDouble:", v8 - v10 * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "position");
  v14 = v13;
  objc_msgSend(v5, "size");
  v16 = v15;

  objc_msgSend(v12, "numberWithDouble:", v14 - v16 * 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v11, "compare:", v17);

  return v18;
}

uint64_t __79__SBContinuousExposeAutoLayoutController__itemsSortedByXInSpace_configuration___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "position");
  v8 = v7;
  objc_msgSend(v6, "size");
  v10 = v9;

  objc_msgSend(v4, "numberWithDouble:", v8 + v10 * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "position");
  v14 = v13;
  objc_msgSend(v5, "size");
  v16 = v15;

  objc_msgSend(v12, "numberWithDouble:", v14 + v16 * 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "compare:", v11);

  return v18;
}

- (void)dodgeFullyOccludedWindowsToNearestVisibleEdgeForSpace:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  CFTypeRef v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v35;
  double v36;
  double v37;
  double v38;
  const void *DifferenceWithRegion;
  CFTypeRef v40;
  const void *UnionWithRegion;
  double v42;
  double v43;
  double v44;
  const void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  char v50;
  char v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  SBContinuousExposeAutoLayoutController *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v57 = self;
  -[SBContinuousExposeAutoLayoutController _fullyOccludedItemsForSpace:configuration:](self, "_fullyOccludedItemsForSpace:configuration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chamoisLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stageInterItemSpacing");
  v60 = v10;
  objc_msgSend(v9, "stageOcclusionDodgingPeekLength");
  v12 = v11;
  objc_msgSend(v9, "screenEdgePadding");
  v14 = v13;
  v53 = v9;
  objc_msgSend(v9, "stageOcclusionDodgingPeekScale");
  v59 = v15;
  v61 = v7;
  objc_msgSend(v7, "containerBounds");
  v58 = v16;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v17 = v6;
  objc_msgSend(v6, "items");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v64;
    v56 = 1.0 - v59;
    v55 = v14 * 0.5;
    v54 = v58 - v14 * 0.5;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v64 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        v25 = objc_msgSend(v8, "containsObject:", v24);
        objc_msgSend(v24, "position");
        v27 = v26;
        v29 = v28;
        objc_msgSend(v24, "size");
        v31 = v30;
        objc_msgSend(v24, "unoccludedPeekingPosition");
        if (v33 != 1.79769313e308 || v32 != 1.79769313e308)
        {
          objc_msgSend(v24, "unoccludedPeekingPosition");
          v27 = v35;
          v29 = v36;
        }
        if (v25)
        {
          v37 = v31 * 0.5;
          v38 = v27;
          while (1)
          {
            do
            {
              v38 = v38 - v12;
              SBSafeAutoreleasedRegionFromCGRect();
              DifferenceWithRegion = (const void *)CGRegionCreateDifferenceWithRegion();
            }
            while (!CFAutorelease(DifferenceWithRegion));
            if ((CGRegionIsEmpty() & 1) == 0)
            {
              CGRegionGetBoundingBox();
              if (!BSFloatLessThanFloat())
                break;
            }
          }
          v62 = v29;
          CGRegionGetBoundingBox();
          v43 = v38 + v42 - v12;
          v44 = v27;
          while (1)
          {
            do
            {
              v44 = v12 + v44;
              SBSafeAutoreleasedRegionFromCGRect();
              v45 = (const void *)CGRegionCreateDifferenceWithRegion();
            }
            while (!CFAutorelease(v45));
            if ((CGRegionIsEmpty() & 1) == 0)
            {
              CGRegionGetBoundingBox();
              if (!BSFloatLessThanFloat())
                break;
            }
          }
          CGRegionGetBoundingBox();
          v47 = v12 + v44 - v46 - v60 + v37 * v56;
          if (v60 + v43 - v37 * v56 >= v55 + v37 * v59)
            v48 = v60 + v43 - v37 * v56;
          else
            v48 = v55 + v37 * v59;
          if (v47 >= v54 - v37 * v59)
            v49 = v54 - v37 * v59;
          else
            v49 = v47;
          v50 = BSFloatLessThanFloat();
          v51 = BSFloatGreaterThanFloat();
          -[SBContinuousExposeAutoLayoutController boundingBoxForSpace:configuration:](v57, "boundingBoxForSpace:configuration:", v17, v61);
          if ((v51 & 1) == 0 && BSFloatGreaterThanFloat() && (BSFloatLessThanOrEqualToFloat() & 1) != 0)
          {
            v52 = v62;
          }
          else
          {
            v52 = v62;
            if ((v50 & 1) == 0 && BSFloatLessThanFloat() && (BSFloatLessThanOrEqualToFloat() & 1) != 0
              || (v51 & 1) != 0
              || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
            {
              v49 = v48;
            }
          }
          objc_msgSend(v24, "setFullyOccluded:", 1);
          objc_msgSend(v24, "setOverlapped:", 1);
          objc_msgSend(v24, "setUnoccludedPeekingPosition:", v49, v52);
        }
        else
        {
          objc_msgSend(v24, "setFullyOccluded:", 0);
          objc_msgSend(v24, "setUnoccludedPeekingPosition:", 1.79769313e308, 1.79769313e308);
          SBSafeAutoreleasedRegionFromCGRect();
          v40 = SBSafeAutoreleasedRegionFromCGRect();
          if (v21)
          {
            objc_msgSend(v24, "setOverlapped:", CGRegionIntersectsRegion());
            UnionWithRegion = (const void *)CGRegionCreateUnionWithRegion();
            v21 = CFAutorelease(UnionWithRegion);
          }
          else
          {
            objc_msgSend(v24, "setOverlapped:", 0);
            v21 = v40;
          }
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v20);
  }

}

- (id)_fullyOccludedItemsForSpace:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CFTypeRef v16;
  const void *DifferenceWithRegion;
  const void *UnionWithRegion;
  void *context;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v21 = v6;
  objc_msgSend(v6, "chamoisLayoutAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stageInterItemSpacing");
  context = (void *)MEMORY[0x1D17E5334](objc_msgSend(v8, "stageOcclusionDodgingPeekLength"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v5;
  objc_msgSend(v5, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "position");
        objc_msgSend(v15, "size");
        SBSafeAutoreleasedRegionFromCGRect();
        v16 = SBSafeAutoreleasedRegionFromCGRect();
        if (v12)
        {
          DifferenceWithRegion = (const void *)CGRegionCreateDifferenceWithRegion();
          CFAutorelease(DifferenceWithRegion);
          if ((CGRegionIsEmpty() & 1) != 0 || (CGRegionGetBoundingBox(), BSFloatLessThanFloat()))
            objc_msgSend(v7, "addObject:", v15);
          UnionWithRegion = (const void *)CGRegionCreateUnionWithRegion();
          v12 = CFAutorelease(UnionWithRegion);
        }
        else
        {
          v12 = v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  objc_autoreleasePoolPop(context);
  return v7;
}

- (void)updateOverlappingScaleAnchorPositionsForSpace:(id)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef v12;
  uint64_t i;
  void *v14;
  void *v15;
  CFTypeRef v16;
  void *v17;
  const void *IntersectionWithRegion;
  const void *v19;
  const void *UnionWithRegion;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double y;
  double height;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t j;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  CFTypeRef v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  CFTypeRef v50;
  const void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  void *v62;
  void *v63;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v65 = a4;
  objc_msgSend(v65, "chamoisLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stageInterItemSpacing");

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "addObject:", v8);

  v62 = v5;
  objc_msgSend(v5, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v63 = v9;
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend(v9, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "position");
      objc_msgSend(v14, "size");
      objc_msgSend(v7, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = SBSafeAutoreleasedRegionFromCGRect();
      if (v12)
      {
        objc_msgSend(v9, "objectAtIndex:", i - 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        IntersectionWithRegion = (const void *)CGRegionCreateIntersectionWithRegion();
        CFAutorelease(IntersectionWithRegion);
        if (!objc_msgSend(v14, "isOverlapped")
          || !objc_msgSend(v17, "isOverlapped")
          || (CGRegionIsEmpty() & 1) == 0)
        {
          goto LABEL_14;
        }
        SBSafeAutoreleasedRegionFromCGRect();
        v19 = (const void *)CGRegionCreateIntersectionWithRegion();
        CFAutorelease(v19);
        if ((CGRegionIsEmpty() & 1) == 0)
          CGRegionGetBoundingBox();
        if (BSFloatLessThanFloat() && (BSFloatGreaterThanFloat() & 1) != 0
          || BSFloatGreaterThanFloat() && BSFloatLessThanFloat())
        {
          UnionWithRegion = (const void *)CGRegionCreateUnionWithRegion();
          v16 = CFAutorelease(UnionWithRegion);
          objc_msgSend(v15, "addObject:", v14);
        }
        else
        {
LABEL_14:
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v14, 0);
          objc_msgSend(v7, "addObject:", v21);

        }
        v9 = v63;
      }
      else
      {
        objc_msgSend(v15, "addObject:", v14);
      }

      v12 = v16;
    }
  }
  -[SBContinuousExposeAutoLayoutController stageAreaForSpace:configuration:](self, "stageAreaForSpace:configuration:", v5, v65);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[SBContinuousExposeAutoLayoutController boundingBoxForSpace:configuration:](self, "boundingBoxForSpace:configuration:", v5, v65);
  v84.origin.x = v30;
  v84.origin.y = v31;
  v84.size.width = v32;
  v84.size.height = v33;
  v82.origin.x = v23;
  v82.origin.y = v25;
  v82.size.width = v27;
  v82.size.height = v29;
  v83 = CGRectUnion(v82, v84);
  y = v83.origin.y;
  height = v83.size.height;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v36 = v7;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v75;
    v40 = y + height * 0.5;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v75 != v39)
          objc_enumerationMutation(v36);
        v42 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v43 = v42;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        if (v44)
        {
          v45 = v44;
          v46 = 0;
          v47 = *(_QWORD *)v71;
          do
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v71 != v47)
                objc_enumerationMutation(v43);
              v49 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
              objc_msgSend(v49, "position");
              objc_msgSend(v49, "size");
              v50 = SBSafeAutoreleasedRegionFromCGRect();
              if (v46)
              {
                v51 = (const void *)CGRegionCreateUnionWithRegion();
                v46 = CFAutorelease(v51);
              }
              else
              {
                v46 = v50;
              }
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
          }
          while (v45);
        }

        CGRegionGetBoundingBox();
        v53 = v52;
        v55 = v54;
        UIRectGetCenter();
        v56 = v53 + v55 * 0.5;
        objc_msgSend(v65, "containerBounds");
        if (!BSFloatLessThanOrEqualToFloat() || (BSFloatLessThanOrEqualToFloat() & 1) == 0)
        {
          if (BSFloatLessThanOrEqualToFloat())
            v56 = v53;
          else
            v56 = v53 + v55;
        }
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v57 = v43;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v67;
          do
          {
            for (m = 0; m != v59; ++m)
            {
              if (*(_QWORD *)v67 != v60)
                objc_enumerationMutation(v57);
              objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * m), "setAnchorPosition:", v56, v40);
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
          }
          while (v59);
        }

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    }
    while (v38);
  }

}

- (CGRect)boundingBoxForSpace:(id)a3 configuration:(id)a4
{
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect result;
  CGRect v49;
  CGRect v50;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  objc_msgSend(a4, "chamoisLayoutAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stageOcclusionDodgingPeekScale");
  v34 = v11;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v5, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    v35 = height;
    v36 = width;
    v37 = y;
    v38 = x;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "isFullyOccluded");
        objc_msgSend(v17, "size");
        v20 = v19;
        v22 = v21;
        if (v18)
        {
          objc_msgSend(v17, "unoccludedPeekingPosition");
          v25 = v34;
        }
        else
        {
          objc_msgSend(v17, "position");
          v25 = 1.0;
        }
        v26 = v20 * v25;
        v27 = v22 * v25;
        v28 = v23 - v26 * 0.5;
        v29 = v24 - v27 * 0.5;
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        v49.origin.y = v37;
        v49.origin.x = v38;
        v49.size.height = v35;
        v49.size.width = v36;
        if (CGRectEqualToRect(v45, v49))
        {
          height = v27;
          width = v26;
          y = v29;
          x = v28;
        }
        else
        {
          v46.origin.x = x;
          v46.origin.y = y;
          v46.size.width = width;
          v46.size.height = height;
          v50.origin.x = v28;
          v50.origin.y = v29;
          v50.size.width = v26;
          v50.size.height = v27;
          v47 = CGRectUnion(v46, v50);
          x = v47.origin.x;
          y = v47.origin.y;
          width = v47.size.width;
          height = v47.size.height;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v14);
  }

  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)_updateCompactedFramesForSpace:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  SBContinuousExposeAutoLayoutController *v50;
  const char *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "chamoisLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "switcherPileCompactingFactor");
  v55 = v10;
  objc_msgSend(v8, "containerBounds");
  UIRectGetCenter();
  v53 = v12;
  v54 = v11;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v7, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v60;
    v17 = 1.79769313e308;
    v18 = -1.79769313e308;
    v19 = -1.79769313e308;
    v20 = 1.79769313e308;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v60 != v16)
          objc_enumerationMutation(v13);
        v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v22, "size");
        v24 = v23;
        v26 = v25;
        v58 = v17;
        if (objc_msgSend(v22, "isFullyOccluded"))
        {
          objc_msgSend(v22, "unoccludedPeekingPosition");
          v29 = v28;
          v30 = v27;
          if (v28 == 1.79769313e308 && v27 == 1.79769313e308)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v57 = v7;
            v50 = self;
            v51 = a2;
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            a2 = v51;
            self = v50;
            v7 = v57;
          }
          objc_msgSend(v9, "stageOcclusionDodgingPeekScale");
        }
        else
        {
          v56 = v24;
          v33 = v26;
          objc_msgSend(v22, "position");
          v35 = v34;
          v37 = v36;
          objc_msgSend(v22, "anchorPosition");
          v39 = v38;
          v41 = v40;
          v42 = objc_msgSend(v22, "isOverlapped");
          v32 = 1.0;
          if (v42)
            objc_msgSend(v9, "partiallyOccludedStageScaleForItemWithSize:", v56, v33);
          v29 = v35 - (v35 - v39) * (1.0 - v32);
          v30 = v37 - (v37 - v41) * (1.0 - v32);
          v26 = v33;
          v24 = v56;
        }
        v43 = v24 * v32;
        v44 = v26 * v32;
        v45 = v54 + v55 * (v29 - v54);
        v46 = v53 + v55 * (v30 - v53);
        objc_msgSend(v22, "setCompactedPosition:", v45, v46);
        v47 = v45 - v43 * 0.5;
        v48 = v46 - v44 * 0.5;
        if (v20 >= v47)
          v20 = v45 - v43 * 0.5;
        v49 = v43 + v47;
        if (v19 < v49)
          v19 = v49;
        v17 = v58;
        if (v58 >= v48)
          v17 = v46 - v44 * 0.5;
        if (v18 < v44 + v48)
          v18 = v44 + v48;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "screenScale");
  UIRectRoundToScale();
  objc_msgSend(v7, "setCompactedBoundingBox:");

}

- (void)_updateItemsCoveredByFullyOccludedPeekingItemsInSpace:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  CFTypeRef v20;
  const void *UnionWithRegion;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "chamoisLayoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v5;
  objc_msgSend(v5, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "size");
        v16 = v15;
        v18 = v17;
        v19 = objc_msgSend(v14, "isFullyOccluded");
        if (v19)
        {
          objc_msgSend(v14, "unoccludedPeekingPosition");
          objc_msgSend(v7, "stageOcclusionDodgingPeekScale");
        }
        else
        {
          objc_msgSend(v14, "position");
          if (objc_msgSend(v14, "isOverlapped"))
            objc_msgSend(v7, "partiallyOccludedStageScaleForItemWithSize:", v16, v18);
        }
        v20 = SBSafeAutoreleasedRegionFromCGRect();
        if (v11)
        {
          objc_msgSend(v14, "setPartiallyCoveredByPeekingItem:", CGRegionIntersectsRegion());
          if (v19)
          {
            UnionWithRegion = (const void *)CGRegionCreateUnionWithRegion();
            CFAutorelease(UnionWithRegion);
          }
        }
        else
        {
          if (v19)
            v11 = v20;
          else
            v11 = 0;
          objc_msgSend(v14, "setPartiallyCoveredByPeekingItem:", 0);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

@end
