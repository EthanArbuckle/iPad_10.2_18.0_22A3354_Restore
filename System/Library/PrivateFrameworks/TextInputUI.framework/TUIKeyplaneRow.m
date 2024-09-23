@implementation TUIKeyplaneRow

- (TUIKeyplaneRow)init
{
  TUIKeyplaneRow *v2;
  TUIKeyplaneRow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIKeyplaneRow;
  v2 = -[TUIKeyplaneRow init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TUIKeyplaneRow setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
  return v3;
}

- (void)removeFromSuperview
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TUIKeyplaneRow keyViews](self, "keyViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)TUIKeyplaneRow;
  -[TUIKeyplaneRow removeFromSuperview](&v8, sel_removeFromSuperview);
}

- (void)setRenderConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIKeyplaneRow keyViews](self, "keyViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setRenderConfig:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)toggleConstraintsForSplit:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[TUIKeyplaneRow extraSpaceBar](self, "extraSpaceBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 0);

    v7 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneRow constraintsForUnsplitRow](self, "constraintsForUnsplitRow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deactivateConstraints:", v8);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneRow constraintsForSplitRow](self, "constraintsForSplitRow");
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 1);

    v10 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneRow constraintsForSplitRow](self, "constraintsForSplitRow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateConstraints:", v11);

    v9 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneRow constraintsForUnsplitRow](self, "constraintsForUnsplitRow");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v12);

  -[TUIKeyplaneRow setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateKeysForTransition:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIKeyplaneRow keyViews](self, "keyViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (v3)
          objc_msgSend(v9, "prepareForTransition");
        else
          objc_msgSend(v9, "finishTransition");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)updateKeysInRowWithStyle:(int64_t)a3 factory:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TUIKeyplaneRow keyViews](self, "keyViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if (v6)
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "setFactory:", v6);
        objc_msgSend(v12, "updateStyle:", a3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  -[TUIKeyplaneRow middlePaddingWidthConstraint](self, "middlePaddingWidthConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "dynamicInsets");
    -[TUIKeyplaneRow middlePaddingConstantFromInsets:](self, "middlePaddingConstantFromInsets:");
    v15 = v14;
    -[TUIKeyplaneRow middlePaddingWidthConstraint](self, "middlePaddingWidthConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", v15);

  }
}

- (void)updateKeysInRowWithData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIKeyplaneRow resetRow](self, "resetRow");
  -[TUIKeyplaneRow keySizingGuide](self, "keySizingGuide");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplaneRow layoutRowWithKeys:guide:type:](self, "layoutRowWithKeys:guide:type:", v4, v5, -[TUIKeyplaneRow rowType](self, "rowType"));

}

- (void)resetRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[TUIKeyplaneRow letterKeyConstraints](self, "letterKeyConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[TUIKeyplaneRow setLetterKeyConstraints:](self, "setLetterKeyConstraints:", 0);
  -[TUIKeyplaneRow constraintsForSplitRow](self, "constraintsForSplitRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneRow constraintsForSplitRow](self, "constraintsForSplitRow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneRow constraintsForUnsplitRow](self, "constraintsForUnsplitRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deactivateConstraints:", v9);

    -[TUIKeyplaneRow setConstraintsForSplitRow:](self, "setConstraintsForSplitRow:", 0);
    -[TUIKeyplaneRow setConstraintsForUnsplitRow:](self, "setConstraintsForUnsplitRow:", 0);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[TUIKeyplaneRow keyViews](self, "keyViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14++), "removeFromSuperview");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[TUIKeyplaneRow layoutGuidesForRow](self, "layoutGuidesForRow", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
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
        -[TUIKeyplaneRow removeLayoutGuide:](self, "removeLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  -[TUIKeyplaneRow layoutGuidesForRow](self, "layoutGuidesForRow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllObjects");

  -[TUIKeyplaneRow keyViews](self, "keyViews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeAllObjects");

}

- (id)splitLayoutGuide
{
  void *v3;
  id v4;
  void *v5;

  -[TUIKeyplaneRow splitSpacingGuide](self, "splitSpacingGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    -[TUIKeyplaneRow setSplitSpacingGuide:](self, "setSplitSpacingGuide:", v4);

    -[TUIKeyplaneRow splitSpacingGuide](self, "splitSpacingGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneRow addLayoutGuide:](self, "addLayoutGuide:", v5);

  }
  return -[TUIKeyplaneRow splitSpacingGuide](self, "splitSpacingGuide");
}

- (BOOL)rowHasDoubleHeightKeys
{
  void *v2;
  BOOL v3;

  -[TUIKeyplaneRow doubleHeightKeys](self, "doubleHeightKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)doubleHeightKeysForRow
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[TUIKeyplaneRow doubleHeightKeys](self, "doubleHeightKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[TUIKeyplaneRow doubleHeightKeys](self, "doubleHeightKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)layoutRowWithKeys:(id)a3 guide:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
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
  TUIKeyplaneRow *v26;
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
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  TUIKeyplaneRow *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  TUIKeyplaneRow *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  unint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  char v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  BOOL v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  uint64_t v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  TUIKeyplaneRow *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  double v161;
  double v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  unint64_t v168;
  void *v169;
  unint64_t v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  _QWORD *v189;
  double v190;
  void *v191;
  char v192;
  uint64_t v193;
  id v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  double v202;
  double v203;
  double v204;
  double v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  double v213;
  double v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void **v220;
  double v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  id v229;
  void *v230;
  void *v231;
  void *v232;
  double v233;
  double v234;
  double v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  double v241;
  double v242;
  void *v243;
  void *v244;
  void *v245;
  uint64_t v246;
  void *v247;
  void *v248;
  double v249;
  double v250;
  double v251;
  double v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  int v257;
  uint64_t v258;
  double v259;
  void *v260;
  void *v261;
  char v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  id v271;
  unint64_t v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  int64_t v278;
  void *v279;
  void *v280;
  void *v281;
  uint64_t v282;
  void *v283;
  void *v284;
  unint64_t v285;
  unint64_t v286;
  void *v287;
  TUIKeyplaneRow *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  char v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  _QWORD v303[2];
  _QWORD v304[2];
  void *v305;
  void *v306;
  _QWORD v307[3];
  void *v308;
  _QWORD v309[2];
  _QWORD v310[3];
  _QWORD v311[3];
  _QWORD v312[2];
  id v313;
  void *v314;
  void *v315;
  _QWORD v316[2];
  _QWORD v317[2];
  _QWORD v318[2];
  _QWORD v319[6];

  v319[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v298 = v8;
  -[TUIKeyplaneRow setCurrentKeys:](self, "setCurrentKeys:", v8);
  -[TUIKeyplaneRow keyViews](self, "keyViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIKeyplaneRow setKeyViews:](self, "setKeyViews:", v11);

  }
  -[TUIKeyplaneRow layoutGuidesForRow](self, "layoutGuidesForRow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TUIKeyplaneRow setLayoutGuidesForRow:](self, "setLayoutGuidesForRow:", v13);

  }
  v280 = v9;
  if ((unint64_t)objc_msgSend(v8, "count") > 1)
  {
    -[TUIKeyplaneRow setKeySizingGuide:](self, "setKeySizingGuide:", v9);
    -[TUIKeyplaneRow setRowType:](self, "setRowType:", a5);
    -[TUIKeyplaneRow hostView](self, "hostView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "keyViewForKey:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUIKeyplaneRow hostView](self, "hostView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v298, "lastObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "keyViewForKey:", v36);
    v277 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a5)
    {
      v37 = objc_msgSend(v34, "layoutType");
      v38 = objc_msgSend(v277, "layoutType");
      if (v37 == 3)
      {
        if (v38 == 3)
          a5 = 5;
        else
          a5 = 3;
      }
      else if (v38 == 3)
      {
        a5 = 4;
      }
      else if ((objc_msgSend(v34, "layoutType") == 2 || !objc_msgSend(v34, "layoutType"))
             && (objc_msgSend(v277, "layoutType") == 2 || !objc_msgSend(v277, "layoutType")))
      {
        a5 = 6;
      }
      else
      {
        a5 = 0;
      }
    }
    v278 = a5;
    v279 = v34;
    v39 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keyplane_Row_%li"), -[TUIKeyplaneRow rowNumberInKeyplane](self, "rowNumberInKeyplane"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setIdentifier:", v40);

    -[TUIKeyplaneRow addLayoutGuide:](self, "addLayoutGuide:", v39);
    -[TUIKeyplaneRow layoutGuidesForRow](self, "layoutGuidesForRow");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v39);

    -[TUIKeyplaneRow hostView](self, "hostView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "supportsSplit");

    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneRow setConstraintsForUnsplitRow:](self, "setConstraintsForUnsplitRow:", v44);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneRow setConstraintsForSplitRow:](self, "setConstraintsForSplitRow:", v45);

    }
    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v39, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneRow topAnchor](self, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v318[0] = v49;
    -[TUIKeyplaneRow bottomAnchor](self, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = self;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v318[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v318, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v54);

    v55 = v279;
    v288 = v52;
    v290 = v39;
    v292 = v46;
    if (objc_msgSend(v279, "layoutType") == 3)
    {
      objc_msgSend(v279, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v279, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](v52, "rowNumberInKeyplane"));
      if (objc_msgSend(v279, "layoutShape") == 2)
      {
        -[TUIKeyplaneRow superview](v52, "superview");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addSubview:", v279);

        -[TUIKeyplaneRow doubleHeightKeys](v52, "doubleHeightKeys");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v57)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIKeyplaneRow setDoubleHeightKeys:](v52, "setDoubleHeightKeys:", v58);

        }
        -[TUIKeyplaneRow doubleHeightKeys](v52, "doubleHeightKeys");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObject:", v279);

        v60 = v278;
        v61 = v46;
        v62 = 0x1E0C99000;
        if (v278 == 7)
          goto LABEL_35;
        -[TUIKeyplaneRow bottomAnchor](v52, "bottomAnchor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v279, "bottomAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, 0.0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v317[0] = v65;
        objc_msgSend(v279, "topAnchor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneRow topAnchor](v52, "topAnchor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 0.0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v317[1] = v68;
        v69 = v317;
      }
      else
      {
        -[TUIKeyplaneRow addSubview:](v52, "addSubview:", v279);
        -[TUIKeyplaneRow bottomAnchor](v52, "bottomAnchor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v279, "bottomAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, 0.0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v316[0] = v65;
        objc_msgSend(v279, "topAnchor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneRow topAnchor](v52, "topAnchor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 0.0);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v316[1] = v68;
        v69 = v316;
      }
      v62 = 0x1E0C99000uLL;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v292;
      objc_msgSend(v292, "addObjectsFromArray:", v95);

      v60 = v278;
      v55 = v279;
LABEL_35:
      -[TUIKeyplaneRow keyViews](v52, "keyViews");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "addObject:", v55);

      objc_msgSend(v55, "updateLabelWeight:", 1);
      objc_msgSend(v55, "leftAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplaneRow leftAnchor](v52, "leftAnchor");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToAnchor:constant:", v98, 0.0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v315 = v99;
      objc_msgSend(*(id *)(v62 + 3360), "arrayWithObjects:count:", &v315, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObjectsFromArray:", v100);

      objc_msgSend(v298, "objectAtIndex:", 1);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v101;
      v102 = v62;
      if (v101 && (objc_msgSend(v101, "layoutType") == 2 || objc_msgSend(v70, "layoutType") == 4))
      {
        objc_msgSend(v290, "leftAnchor");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "rightAnchor");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "constraintEqualToAnchor:constant:", v104, 0.0);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v314 = v105;
        v106 = *(void **)(v62 + 3360);
        v107 = 1;
        objc_msgSend(v106, "arrayWithObjects:count:", &v314, 1);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addObjectsFromArray:", v108);

        v55 = v279;
      }
      else
      {
        v107 = 0;
      }
      objc_msgSend(v55, "multiplier");
      v110 = v109;
      objc_msgSend(v70, "backingTree");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "name");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v112, "isEqualToString:", CFSTR("Dictation-Key")))
        v113 = objc_msgSend(v70, "layoutType") == 3;
      else
        v113 = 0;

      if (v60 == 7 && !v113)
      {
        if (objc_msgSend(v55, "keyStyle") == 1)
          v110 = 1.0;
        else
          v110 = 1.5;
      }
      objc_msgSend(v55, "widthAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "widthAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "constraintEqualToAnchor:multiplier:", v116, v110);
      v117 = v55;
      v83 = (id)objc_claimAutoreleasedReturnValue();

      v313 = v83;
      v94 = 1;
      objc_msgSend(*(id *)(v102 + 3360), "arrayWithObjects:count:", &v313, 1);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObjectsFromArray:", v118);

      v119 = v117;
      goto LABEL_66;
    }
    v70 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keyplane_Row_%li_Left_Padding"), -[TUIKeyplaneRow rowNumberInKeyplane](v52, "rowNumberInKeyplane"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setIdentifier:", v71);

    -[TUIKeyplaneRow addLayoutGuide:](v52, "addLayoutGuide:", v70);
    -[TUIKeyplaneRow layoutGuidesForRow](v52, "layoutGuidesForRow");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addObject:", v70);

    objc_msgSend(v70, "leftAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneRow leftAnchor](v52, "leftAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v312[0] = v75;
    objc_msgSend(v39, "leftAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "rightAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, 0.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v312[1] = v78;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v312, 2);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v292, "addObjectsFromArray:", v79);

    v80 = v52;
    if (-[TUIKeyplaneRow edgeToEdge](v52, "edgeToEdge"))
    {
      objc_msgSend(v70, "widthAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToConstant:", 0.0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "addObject:", v82);

      v60 = v278;
      if (v278 == 6)
      {
        v83 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
        -[TUIKeyplaneRow addLayoutGuide:](v52, "addLayoutGuide:", v83);
        -[TUIKeyplaneRow layoutGuidesForRow](v52, "layoutGuidesForRow");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "addObject:", v83);

        objc_msgSend(v83, "leftAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "rightAnchor");
        v86 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "constraintEqualToAnchor:", v86);
        v294 = (void *)objc_claimAutoreleasedReturnValue();
        v311[0] = v294;
        -[TUIKeyplaneRow rightAnchor](v52, "rightAnchor");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "rightAnchor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "constraintEqualToAnchor:", v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v311[1] = v89;
        objc_msgSend(v83, "widthAnchor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "constraintEqualToConstant:", 0.0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v311[2] = v91;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v311, 3);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "addObjectsFromArray:", v92);

        v93 = (void *)v86;
        v60 = 6;

        v94 = 0;
LABEL_65:

        v119 = 0;
        v107 = 1;
LABEL_66:

        v295 = v107;
        v80 = v288;
        goto LABEL_67;
      }
    }
    else
    {
      v60 = v278;
      if (v278 == 6)
      {
        v83 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keyplane_Row_%li_Right_Padding"), -[TUIKeyplaneRow rowNumberInKeyplane](v52, "rowNumberInKeyplane"));
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setIdentifier:", v120);

        -[TUIKeyplaneRow addLayoutGuide:](v52, "addLayoutGuide:", v83);
        -[TUIKeyplaneRow layoutGuidesForRow](v52, "layoutGuidesForRow");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "addObject:", v83);

        if (objc_msgSend(v279, "layoutType"))
        {
          v122 = 0;
          v123 = 0.0;
        }
        else
        {
          objc_msgSend(v279, "multiplier");
          v123 = v127;
          objc_msgSend(v279, "key");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "name");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setIdentifier:", v129);

          v122 = 1;
        }
        v285 = v122;
        if (objc_msgSend(v277, "layoutType"))
          goto LABEL_60;
        objc_msgSend(v277, "key");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "name");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setIdentifier:", v134);

        objc_msgSend(v279, "multiplier");
        v136 = v135;
        objc_msgSend(v277, "multiplier");
        if (v136 != v137)
          goto LABEL_63;
        objc_msgSend(v277, "multiplier");
        if (v138 != 0.0)
        {
LABEL_60:
          objc_msgSend(v83, "widthAnchor");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "widthAnchor");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "constraintEqualToAnchor:", v131);
          v132 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_63:
          objc_msgSend(v83, "widthAnchor");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v280, "widthAnchor");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v277, "multiplier");
          v140 = v139;
          objc_msgSend(v277, "multiplier");
          objc_msgSend(v130, "constraintEqualToAnchor:multiplier:constant:", v131, v140, v141 * 0.0);
          v132 = objc_claimAutoreleasedReturnValue();
        }
        v142 = (void *)v132;
        objc_msgSend(v292, "addObject:", v132);

        objc_msgSend(v70, "widthAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v280, "widthAnchor");
        v282 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "constraintEqualToAnchor:multiplier:constant:", v282, v123, v123 * 0.0);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        v310[0] = v296;
        objc_msgSend(v83, "leftAnchor");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "rightAnchor");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "constraintEqualToAnchor:", v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v310[1] = v145;
        -[TUIKeyplaneRow rightAnchor](v288, "rightAnchor");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "rightAnchor");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "constraintEqualToAnchor:", v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v310[2] = v148;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v310, 3);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "addObjectsFromArray:", v149);

        v93 = (void *)v282;
        v60 = 6;
        v94 = v285;
        goto LABEL_65;
      }
      if (v278 == 4)
      {
        if (objc_msgSend(v279, "layoutType"))
        {
          v94 = 0;
          v114 = 0.0;
        }
        else
        {
          objc_msgSend(v279, "multiplier");
          v114 = v124;
          objc_msgSend(v279, "key");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "name");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setIdentifier:", v126);

          v94 = 1;
        }
        objc_msgSend(v70, "widthAnchor");
        v83 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v280, "widthAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "constraintEqualToAnchor:multiplier:constant:", v85, v114, v114 * 0.0);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "addObject:", v93);
        goto LABEL_65;
      }
    }
    v94 = 0;
    v119 = 0;
    v295 = 1;
LABEL_67:

    v286 = v94;
    if (v60 == 3)
    {
      v150 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keyplane_Row_%li_Right_Padding"), -[TUIKeyplaneRow rowNumberInKeyplane](v80, "rowNumberInKeyplane"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setIdentifier:", v151);

      -[TUIKeyplaneRow addLayoutGuide:](v80, "addLayoutGuide:", v150);
      -[TUIKeyplaneRow layoutGuidesForRow](v80, "layoutGuidesForRow");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addObject:", v150);

      objc_msgSend(v150, "leftAnchor");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "rightAnchor");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "constraintEqualToAnchor:", v154);
      v155 = v80;
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v309[0] = v156;
      -[TUIKeyplaneRow rightAnchor](v155, "rightAnchor");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "rightAnchor");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "constraintEqualToAnchor:", v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v309[1] = v159;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v309, 2);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "addObjectsFromArray:", v160);

      if (objc_msgSend(v277, "layoutType"))
      {
        -[TUIKeyplaneRow edgeToEdge](v155, "edgeToEdge");
        v161 = 0.0;
      }
      else
      {
        objc_msgSend(v277, "multiplier");
        v161 = v162;
        objc_msgSend(v277, "key");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "name");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "setIdentifier:", v164);

      }
      v80 = v155;
      objc_msgSend(v150, "widthAnchor");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "widthAnchor");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "constraintEqualToAnchor:multiplier:constant:", v166, v161, v161 * 0.0);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "addObject:", v167);

      v60 = v278;
      v94 = v286;
    }
    v168 = (unint64_t)objc_msgSend(v298, "count") >> 1;
    v272 = v168 - (v168 != objc_msgSend(v298, "count"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v283 = v169;
    if (v94 >= objc_msgSend(v298, "count"))
    {
      v273 = 0;
      v274 = 0;
      v276 = 0;
LABEL_136:
      v29 = v279;
      v255 = v276;
      if (objc_msgSend(v169, "count"))
      {
        -[TUIKeyplaneRow hostView](v80, "hostView");
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        v257 = objc_msgSend(v256, "supportsSplit");

        if (v257)
        {
          v258 = v272;
          if (v60 == 4)
          {
            objc_msgSend(v277, "multiplier");
            if (v259 > 1.5)
              v258 = v272 + 1;
          }
        }
        else
        {
          v258 = -1;
        }
        -[TUIKeyplaneRow constraintsForStringKeys:inRowGuide:matchingSizingGuide:splitIndex:](v80, "constraintsForStringKeys:inRowGuide:matchingSizingGuide:splitIndex:", v169, v290, v280, v258);
        v260 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "addObjectsFromArray:", v260);

      }
      v31 = v277;
      if (v60 <= 7 && ((1 << v60) & 0xB6) != 0)
      {
        -[TUIKeyplaneRow subviews](v80, "subviews");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        v262 = objc_msgSend(v261, "containsObject:", v277);

        if ((v262 & 1) == 0)
        {
          objc_msgSend(v277, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          if (objc_msgSend(v277, "layoutShape") == 2)
          {
            -[TUIKeyplaneRow superview](v80, "superview");
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v263, "addSubview:", v277);

            -[TUIKeyplaneRow doubleHeightKeys](v80, "doubleHeightKeys");
            v264 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v264)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v265 = (void *)objc_claimAutoreleasedReturnValue();
              -[TUIKeyplaneRow setDoubleHeightKeys:](v80, "setDoubleHeightKeys:", v265);

            }
            -[TUIKeyplaneRow doubleHeightKeys](v80, "doubleHeightKeys");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v266, "addObject:", v277);

          }
          else
          {
            -[TUIKeyplaneRow addSubview:](v80, "addSubview:", v277);
          }
        }
        -[TUIKeyplaneRow rightAnchor](v80, "rightAnchor");
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v277, "rightAnchor");
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "constraintEqualToAnchor:constant:", v268, 0.0);
        v269 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "addObject:", v269);

        v31 = v277;
        v169 = v283;
        v255 = v276;
      }
      -[TUIKeyplaneRow setLetterKeyConstraints:](v80, "setLetterKeyConstraints:", v292);
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v292);

      v9 = v280;
      goto LABEL_154;
    }
    v274 = 0;
    v276 = 0;
    v273 = 0;
    v170 = v94;
    while (1)
    {
      objc_msgSend(v298, "objectAtIndex:", v170);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v171, "layoutType") != 2
        && objc_msgSend(v171, "layoutType") != 4
        && objc_msgSend(v171, "layoutType") != 1)
      {
        break;
      }
      objc_msgSend(v169, "addObject:", v171);
      if (v170 > v94 && !((objc_msgSend(v119, "layoutType") != 3) | v295 & 1))
      {
        objc_msgSend(v290, "leftAnchor");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "rightAnchor");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "constraintEqualToAnchor:constant:", v174, 0.0);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v308 = v175;
        v295 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v308, 1);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "addObjectsFromArray:", v176);

        v169 = v283;
        v94 = v286;

        v172 = v119;
        v119 = 0;
LABEL_81:

        v80 = v288;
        goto LABEL_82;
      }
      v172 = v119;
      v119 = 0;
LABEL_82:

LABEL_83:
      if (++v170 >= objc_msgSend(v298, "count"))
        goto LABEL_136;
    }
    if (!objc_msgSend(v171, "layoutType"))
    {
      objc_msgSend(v171, "multiplier");
      if (v190 == 0.0 || !v170)
        goto LABEL_83;
      objc_msgSend(v298, "lastObject");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = objc_msgSend(v171, "isEqual:", v191);

      if ((v192 & 1) != 0)
        goto LABEL_134;
      v193 = objc_msgSend(v169, "count");
      if (!v119)
      {
        if (!v193)
        {
          v119 = 0;
LABEL_134:
          v94 = v286;
          goto LABEL_83;
        }
        v229 = objc_alloc_init(MEMORY[0x1E0DC39A0]);

        objc_msgSend(v171, "backingTree");
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v230, "name");
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v229, "setIdentifier:", v231);

        -[TUIKeyplaneRow addLayoutGuide:](v80, "addLayoutGuide:", v229);
        -[TUIKeyplaneRow layoutGuidesForRow](v80, "layoutGuidesForRow");
        v232 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v232, "addObject:", v229);

        if (v274
          && v273
          && (objc_msgSend(v171, "multiplier"), v234 = v233, objc_msgSend(v274, "multiplier"), v234 == v235))
        {
          objc_msgSend(v229, "widthAnchor");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v273, "widthAnchor");
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "constraintEqualToAnchor:", v237);
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          v239 = v292;
          objc_msgSend(v292, "addObject:", v238);

        }
        else
        {
          objc_msgSend(v229, "widthAnchor");
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v280, "widthAnchor");
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "multiplier");
          v250 = v249;
          objc_msgSend(v171, "multiplier");
          objc_msgSend(v247, "constraintEqualToAnchor:multiplier:constant:", v248, v250, v251 * 0.0);
          v236 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v252) = 1144750080;
          objc_msgSend(v236, "setPriority:", v252);
          v306 = v236;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v306, 1);
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          v239 = v292;
          objc_msgSend(v292, "addObjectsFromArray:", v237);
        }

        objc_msgSend(v229, "leftAnchor");
        v172 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "rightAnchor");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "constraintEqualToAnchor:", v173);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        v305 = v253;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v305, 1);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v239, "addObjectsFromArray:", v254);

        v119 = 0;
        v276 = v229;
        v169 = v283;
        v94 = v286;
        goto LABEL_81;
      }
      if (v193)
        goto LABEL_134;
      v194 = v171;

      v195 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      objc_msgSend(v194, "backingTree");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "name");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "setIdentifier:", v197);

      -[TUIKeyplaneRow addLayoutGuide:](v80, "addLayoutGuide:", v195);
      -[TUIKeyplaneRow layoutGuidesForRow](v80, "layoutGuidesForRow");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "addObject:", v195);

      v199 = v195;
      objc_msgSend(v195, "widthAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "widthAnchor");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v271 = v194;
      objc_msgSend(v194, "multiplier");
      v203 = v202;
      objc_msgSend(v194, "multiplier");
      objc_msgSend(v200, "constraintEqualToAnchor:multiplier:constant:", v201, v203, v204 * 0.0);
      v172 = (id)objc_claimAutoreleasedReturnValue();

      LODWORD(v205) = 1148813312;
      objc_msgSend(v172, "setPriority:", v205);
      v206 = v199;
      objc_msgSend(v199, "leftAnchor");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "rightAnchor");
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "constraintEqualToAnchor:", v297);
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      v307[0] = v275;
      v307[1] = v172;
      objc_msgSend(v290, "leftAnchor");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "rightAnchor");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v207, "constraintEqualToAnchor:", v208);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v307[2] = v209;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v307, 3);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "addObjectsFromArray:", v210);

      v169 = v283;
      v60 = v278;

      v295 = 1;
      v273 = v206;
      v274 = v271;
      goto LABEL_130;
    }
    -[TUIKeyplaneRow hostView](v80, "hostView");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "keyViewForKey:", v171);
    v172 = (id)objc_claimAutoreleasedReturnValue();

    if (!v172)
      goto LABEL_82;
    objc_msgSend(v172, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](v80, "rowNumberInKeyplane"));
    -[TUIKeyplaneRow keyViews](v80, "keyViews");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "addObject:", v172);

    objc_msgSend(v172, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (objc_msgSend(v172, "layoutShape") == 2)
    {
      -[TUIKeyplaneRow superview](v80, "superview");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "addSubview:", v172);

      -[TUIKeyplaneRow doubleHeightKeys](v80, "doubleHeightKeys");
      v180 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v180)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIKeyplaneRow setDoubleHeightKeys:](v80, "setDoubleHeightKeys:", v181);

      }
      -[TUIKeyplaneRow doubleHeightKeys](v80, "doubleHeightKeys");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "addObject:", v172);

      if (v60 == 7)
      {
LABEL_100:
        objc_msgSend(v172, "setLayoutShape:", objc_msgSend(v171, "layoutShape"));
        if (objc_msgSend(v172, "layoutType") != 3)
        {
          v172 = v172;
          v173 = v119;
          v119 = v172;
          goto LABEL_81;
        }
        if (v60 == 7 && objc_msgSend(v172, "layoutShape") != 2)
          objc_msgSend(v172, "setLayoutShape:", 0);
        objc_msgSend(v172, "multiplier");
        v214 = v213;
        objc_msgSend(v172, "widthAnchor");
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v280, "widthAnchor");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "constraintEqualToAnchor:multiplier:", v216, v214);
        v173 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v292, "addObject:", v173);
        if (v119)
        {
          if (objc_msgSend(v119, "layoutType") != 4)
          {
            if (objc_msgSend(v119, "layoutType") == 3)
            {
              objc_msgSend(v172, "leftAnchor");
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "rightAnchor");
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v222, "constraintEqualToAnchor:constant:", v223, 0.0);
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              v301 = v224;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v301, 1);
              v225 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v292, "addObjectsFromArray:", v225);

              v60 = v278;
              v169 = v283;

              if (v278 == 2)
              {
                if (objc_msgSend(v283, "count"))
                {
                  LODWORD(v221) = 1148829696;
                  objc_msgSend(v173, "setPriority:", v221);
                  objc_msgSend(v172, "widthAnchor");
                  v226 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v119, "widthAnchor");
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v226, "constraintEqualToAnchor:multiplier:", v227, 1.0);
                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v292, "addObject:", v228);

                }
                goto LABEL_123;
              }
LABEL_126:
              if (v170 < v272)
                v246 = 1;
              else
                v246 = 2;
              objc_msgSend(v172, "updateLabelWeight:", v246);
              v172 = v172;

              v119 = v172;
LABEL_130:
              v94 = v286;
              goto LABEL_81;
            }
LABEL_122:
            if (v60 == 2)
            {
LABEL_123:
              LODWORD(v221) = 1148829696;
              objc_msgSend(v173, "setPriority:", v221);
              objc_msgSend(v172, "multiplier");
              v242 = v241;
              objc_msgSend(v172, "widthAnchor");
              v243 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v280, "widthAnchor");
              v244 = (void *)objc_claimAutoreleasedReturnValue();
              if (v242 <= 1.0)
                objc_msgSend(v172, "multiplier");
              objc_msgSend(v243, "constraintGreaterThanOrEqualToAnchor:multiplier:", v244);
              v245 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v292, "addObject:", v245);

              v169 = v283;
              goto LABEL_126;
            }
            goto LABEL_126;
          }
          objc_msgSend(v172, "leftAnchor");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v290, "rightAnchor");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v217, "constraintEqualToAnchor:constant:", v218, 0.0);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          v302 = v219;
          v220 = &v302;
        }
        else if (v276)
        {
          objc_msgSend(v172, "leftAnchor");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v276, "rightAnchor");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v217, "constraintEqualToAnchor:", v218);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          v300 = v219;
          v220 = &v300;
        }
        else
        {
          if (!objc_msgSend(v169, "count"))
            goto LABEL_122;
          objc_msgSend(v172, "leftAnchor");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v290, "rightAnchor");
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v217, "constraintEqualToAnchor:constant:", v218, 0.0);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          v299 = v219;
          v220 = &v299;
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v220, 1);
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "addObjectsFromArray:", v240);

        v60 = v278;
        v169 = v283;
        goto LABEL_122;
      }
      objc_msgSend(v172, "topAnchor");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "topAnchor");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v270 = v183;
      objc_msgSend(v183, "constraintEqualToAnchor:", v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v304[0] = v185;
      objc_msgSend(v172, "bottomAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "bottomAnchor");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:", v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v304[1] = v188;
      v189 = v304;
    }
    else
    {
      -[TUIKeyplaneRow addSubview:](v80, "addSubview:", v172);
      objc_msgSend(v172, "topAnchor");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "topAnchor");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v270 = v211;
      objc_msgSend(v211, "constraintEqualToAnchor:", v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      v303[0] = v185;
      objc_msgSend(v172, "bottomAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "bottomAnchor");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:", v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      v303[1] = v188;
      v189 = v303;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v292, "addObjectsFromArray:", v212);

    v60 = v278;
    v169 = v283;
    v94 = v286;
    goto LABEL_100;
  }
  v14 = (void *)MEMORY[0x1E0CB3718];
  -[TUIKeyplaneRow letterKeyConstraints](self, "letterKeyConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deactivateConstraints:", v15);

  -[TUIKeyplaneRow hostView](self, "hostView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v298, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyViewForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIKeyplaneRow addSubview:](self, "addSubview:", v18);
  objc_msgSend(v18, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](self, "rowNumberInKeyplane"));
  -[TUIKeyplaneRow keyViews](self, "keyViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v18);

  if (v18)
  {
    objc_msgSend(v18, "leadingAnchor");
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneRow leadingAnchor](self, "leadingAnchor");
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v293, "constraintEqualToAnchor:", v291);
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    v319[0] = v289;
    objc_msgSend(v18, "topAnchor");
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneRow topAnchor](self, "topAnchor");
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v287, "constraintEqualToAnchor:", v284);
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v319[1] = v281;
    -[TUIKeyplaneRow trailingAnchor](self, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v319[2] = v22;
    -[TUIKeyplaneRow bottomAnchor](self, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v319[3] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v319, 4);
    v26 = self;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    -[TUIKeyplaneRow setLetterKeyConstraints:](v26, "setLetterKeyConstraints:", v28);

    v29 = v18;
    v9 = v280;

    v30 = (void *)MEMORY[0x1E0CB3718];
    -[TUIKeyplaneRow letterKeyConstraints](v26, "letterKeyConstraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v31);
LABEL_154:

    goto LABEL_155;
  }
  v29 = 0;
LABEL_155:

}

- (id)constraintsForStringKeys:(id)a3 inRowGuide:(id)a4 matchingSizingGuide:(id)a5 splitIndex:(int64_t)a6
{
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void **v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  TUIKeyplaneRow *v94;
  id v95;
  void *v96;
  unint64_t v97;
  _QWORD v98[2];
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[2];
  void *v105;
  void *v106;
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[4];

  v109[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v93 = a4;
  v91 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v95 = (id)objc_claimAutoreleasedReturnValue();
  v92 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  v10 = 0;
  if (!objc_msgSend(v9, "count"))
    goto LABEL_48;
  v11 = 0;
  v90 = v9;
  v94 = self;
  do
  {
    objc_msgSend(v9, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyplaneRow hostView](self, "hostView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keyViewForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_42;
    v96 = v12;
    v97 = v11;
    if (objc_msgSend(v14, "layoutType") != 1)
    {
      if (v10 && objc_msgSend(v10, "layoutType") == 1)
      {
        objc_msgSend(v92, "rightAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "leftAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintEqualToAnchor:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "addObject:", v31);

      }
      objc_msgSend(v14, "setRowNumber:", -[TUIKeyplaneRow rowNumberInKeyplane](self, "rowNumberInKeyplane"));
      -[TUIKeyplaneRow keyViews](self, "keyViews");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v14);

      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (-[TUIKeyplaneRow rowType](self, "rowType") == 7 && objc_msgSend(v14, "layoutType") != 4)
      {
        if (objc_msgSend(v14, "layoutShape") == 2)
          goto LABEL_13;
        v33 = 1;
      }
      else
      {
        v33 = 0;
      }
      objc_msgSend(v14, "setLayoutShape:", v33);
LABEL_13:
      -[TUIKeyplaneRow addSubview:](self, "addSubview:", v14);
      if (objc_msgSend(v14, "layoutType") == 4)
      {
        -[TUIKeyplaneRow hostView](self, "hostView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "supportsSplit");

        if (v35)
        {
          if (objc_msgSend(v10, "layoutType") == 4)
          {
            -[TUIKeyplaneRow setExtraSpaceBar:](self, "setExtraSpaceBar:", v14);
            -[TUIKeyplaneRow constraintsForSplitRow](self, "constraintsForSplitRow");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyplaneRow splitLayoutGuide](self, "splitLayoutGuide");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "leftAnchor");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "rightAnchor");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "constraintEqualToAnchor:constant:", v86, 0.0);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v108[0] = v85;
            objc_msgSend(v14, "leftAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyplaneRow splitLayoutGuide](self, "splitLayoutGuide");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "rightAnchor");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 0.0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v108[1] = v41;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObjectsFromArray:", v42);

            -[TUIKeyplaneRow constraintsForUnsplitRow](v94, "constraintsForUnsplitRow");
            v43 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "rightAnchor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "rightAnchor");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "constraintEqualToAnchor:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v107[0] = v46;
            objc_msgSend(v10, "leftAnchor");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "leftAnchor");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "constraintEqualToAnchor:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v107[1] = v49;
            v50 = (void *)v43;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObjectsFromArray:", v51);

          }
          else
          {
            if (v10)
            {
LABEL_39:
              objc_msgSend(v14, "widthAnchor");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "widthAnchor");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:multiplier:", v64, 1.0);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = v65;
              a6 = -1;
              v66 = &v105;
LABEL_40:
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "addObjectsFromArray:", v72);

              objc_msgSend(v14, "topAnchor");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "topAnchor");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "constraintEqualToAnchor:", v74);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v98[0] = v75;
              objc_msgSend(v93, "bottomAnchor");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "bottomAnchor");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "constraintEqualToAnchor:", v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v98[1] = v78;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "addObjectsFromArray:", v79);

              v80 = v14;
              v9 = v90;
              v23 = v10;
              self = v94;
              goto LABEL_41;
            }
            objc_msgSend(v14, "leftAnchor");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "leftAnchor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "constraintEqualToAnchor:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v45;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "addObjectsFromArray:", v46);
          }

          goto LABEL_39;
        }
      }
      if (v10)
      {
        if (objc_msgSend(v10, "layoutType") == 1)
          goto LABEL_28;
        if (v11 == a6)
        {
          -[TUIKeyplaneRow hostView](self, "hostView");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "supportsSplit");

          if (v53)
          {
            -[TUIKeyplaneRow splitSpacingGuide](self, "splitSpacingGuide");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "leftAnchor");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "rightAnchor");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "constraintEqualToAnchor:", v56);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v104[0] = v87;
            objc_msgSend(v14, "leftAnchor");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            -[TUIKeyplaneRow splitSpacingGuide](self, "splitSpacingGuide");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "rightAnchor");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "constraintEqualToAnchor:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v104[1] = v60;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "addObjectsFromArray:", v61);

            self = v94;
LABEL_27:

LABEL_28:
            if (objc_msgSend(v14, "layoutType") == 4)
            {
              objc_msgSend(v14, "widthAnchor");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "widthAnchor");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:multiplier:", v64, 1.0);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = v65;
              v66 = &v103;
            }
            else if (-[TUIKeyplaneRow rowType](self, "rowType") == 2 && (objc_msgSend(v14, "multiplier"), v67 > 1.0))
            {
              if (v10)
              {
                objc_msgSend(v14, "multiplier");
                v69 = v68;
                objc_msgSend(v10, "multiplier");
                v71 = v70;
                objc_msgSend(v14, "widthAnchor");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (v69 == v71)
                {
                  objc_msgSend(v10, "widthAnchor");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "constraintEqualToAnchor:multiplier:", v64, 1.0);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v102 = v65;
                  v66 = &v102;
                }
                else
                {
                  objc_msgSend(v91, "widthAnchor");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "multiplier");
                  objc_msgSend(v63, "constraintEqualToAnchor:multiplier:", v64);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = v65;
                  v66 = &v100;
                }
              }
              else
              {
                objc_msgSend(v14, "widthAnchor");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "widthAnchor");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "multiplier");
                objc_msgSend(v63, "constraintGreaterThanOrEqualToAnchor:multiplier:", v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = v65;
                v66 = &v101;
              }
            }
            else
            {
              objc_msgSend(v14, "widthAnchor");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "widthAnchor");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "multiplier");
              objc_msgSend(v63, "constraintEqualToAnchor:multiplier:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = v65;
              v66 = &v99;
            }
            goto LABEL_40;
          }
        }
        objc_msgSend(v14, "leftAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rightAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, 0.0);
        v62 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v14, "leftAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "leftAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "constraintEqualToAnchor:", v55);
        v62 = objc_claimAutoreleasedReturnValue();
      }
      v56 = (void *)v62;
      objc_msgSend(v95, "addObject:", v62);
      goto LABEL_27;
    }
    objc_msgSend(v14, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setIdentifier:", v16);

    -[TUIKeyplaneRow addLayoutGuide:](self, "addLayoutGuide:", v92);
    -[TUIKeyplaneRow layoutGuidesForRow](self, "layoutGuidesForRow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v92);

    WeakRetained = objc_loadWeakRetained((id *)&self->_hostView);
    objc_msgSend(WeakRetained, "factory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dynamicInsets");
    -[TUIKeyplaneRow middlePaddingConstantFromInsets:](self, "middlePaddingConstantFromInsets:");
    v21 = v20;

    objc_msgSend(v92, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v109[0] = v23;
    objc_msgSend(v92, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v109[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObjectsFromArray:", v27);

    self = v94;
    -[TUIKeyplaneRow setMiddlePaddingWidthConstraint:](v94, "setMiddlePaddingWidthConstraint:", v23);
    v28 = v14;

LABEL_41:
    v10 = v14;
    v12 = v96;
    v11 = v97;
LABEL_42:

    ++v11;
  }
  while (v11 < objc_msgSend(v9, "count"));
  if (v10)
  {
    objc_msgSend(v93, "rightAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addObject:", v83);

  }
LABEL_48:

  return v95;
}

- (BOOL)keyIsStringType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "interactionType") == 1
    || objc_msgSend(v3, "interactionType") == 2
    || objc_msgSend(v3, "interactionType") == 16;

  return v4;
}

- (BOOL)keyIsSpaceType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "interactionType") == 15 || objc_msgSend(v3, "displayType") == 25;

  return v4;
}

- (BOOL)keyIsControlType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "interactionType") == 4
    || objc_msgSend(v3, "interactionType") == 5
    || objc_msgSend(v3, "interactionType") == 6
    || objc_msgSend(v3, "interactionType") == 9
    || objc_msgSend(v3, "interactionType") == 10
    || objc_msgSend(v3, "interactionType") == 11
    || objc_msgSend(v3, "interactionType") == 13
    || objc_msgSend(v3, "interactionType") == 14
    || objc_msgSend(v3, "interactionType") == 37
    || objc_msgSend(v3, "interactionType") == 38
    || objc_msgSend(v3, "interactionType") == 17;

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TUIKeyplaneRow currentKeys](self, "currentKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "backingTree");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)TUIKeyplaneRow;
  -[TUIKeyplaneRow description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@ %@>"), v12, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_userInteractionStateDeterminesLayerHitTestState
{
  return 1;
}

- (double)middlePaddingConstantFromInsets:(UIEdgeInsets)a3
{
  return a3.left + a3.right + a3.left + a3.right;
}

- (int64_t)rowType
{
  return self->_rowType;
}

- (void)setRowType:(int64_t)a3
{
  self->_rowType = a3;
}

- (BOOL)edgeToEdge
{
  return self->_edgeToEdge;
}

- (void)setEdgeToEdge:(BOOL)a3
{
  self->_edgeToEdge = a3;
}

- (TUIKeyplaneView)hostView
{
  return (TUIKeyplaneView *)objc_loadWeakRetained((id *)&self->_hostView);
}

- (void)setHostView:(id)a3
{
  objc_storeWeak((id *)&self->_hostView, a3);
}

- (unint64_t)leftControlKeyCount
{
  return self->_leftControlKeyCount;
}

- (void)setLeftControlKeyCount:(unint64_t)a3
{
  self->_leftControlKeyCount = a3;
}

- (unint64_t)rightControlKeyCount
{
  return self->_rightControlKeyCount;
}

- (void)setRightControlKeyCount:(unint64_t)a3
{
  self->_rightControlKeyCount = a3;
}

- (NSMutableArray)letterKeyConstraints
{
  return self->_letterKeyConstraints;
}

- (void)setLetterKeyConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_letterKeyConstraints, a3);
}

- (NSMutableArray)keyViews
{
  return self->_keyViews;
}

- (void)setKeyViews:(id)a3
{
  objc_storeStrong((id *)&self->_keyViews, a3);
}

- (NSMutableArray)layoutGuidesForRow
{
  return self->_layoutGuidesForRow;
}

- (void)setLayoutGuidesForRow:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuidesForRow, a3);
}

- (NSMutableArray)doubleHeightKeys
{
  return self->_doubleHeightKeys;
}

- (void)setDoubleHeightKeys:(id)a3
{
  objc_storeStrong((id *)&self->_doubleHeightKeys, a3);
}

- (NSMutableArray)constraintsForSplitRow
{
  return self->_constraintsForSplitRow;
}

- (void)setConstraintsForSplitRow:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsForSplitRow, a3);
}

- (NSMutableArray)constraintsForUnsplitRow
{
  return self->_constraintsForUnsplitRow;
}

- (void)setConstraintsForUnsplitRow:(id)a3
{
  objc_storeStrong((id *)&self->_constraintsForUnsplitRow, a3);
}

- (TUIKBKeyView)extraSpaceBar
{
  return self->_extraSpaceBar;
}

- (void)setExtraSpaceBar:(id)a3
{
  objc_storeStrong((id *)&self->_extraSpaceBar, a3);
}

- (NSArray)currentKeys
{
  return self->_currentKeys;
}

- (void)setCurrentKeys:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeys, a3);
}

- (UILayoutGuide)keySizingGuide
{
  return self->_keySizingGuide;
}

- (void)setKeySizingGuide:(id)a3
{
  objc_storeStrong((id *)&self->_keySizingGuide, a3);
}

- (int64_t)rowNumberInKeyplane
{
  return self->_rowNumberInKeyplane;
}

- (void)setRowNumberInKeyplane:(int64_t)a3
{
  self->_rowNumberInKeyplane = a3;
}

- (UILayoutGuide)splitSpacingGuide
{
  return self->_splitSpacingGuide;
}

- (void)setSplitSpacingGuide:(id)a3
{
  objc_storeStrong((id *)&self->_splitSpacingGuide, a3);
}

- (NSLayoutConstraint)middlePaddingWidthConstraint
{
  return self->_middlePaddingWidthConstraint;
}

- (void)setMiddlePaddingWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_middlePaddingWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middlePaddingWidthConstraint, 0);
  objc_storeStrong((id *)&self->_splitSpacingGuide, 0);
  objc_storeStrong((id *)&self->_keySizingGuide, 0);
  objc_storeStrong((id *)&self->_currentKeys, 0);
  objc_storeStrong((id *)&self->_extraSpaceBar, 0);
  objc_storeStrong((id *)&self->_constraintsForUnsplitRow, 0);
  objc_storeStrong((id *)&self->_constraintsForSplitRow, 0);
  objc_storeStrong((id *)&self->_doubleHeightKeys, 0);
  objc_storeStrong((id *)&self->_layoutGuidesForRow, 0);
  objc_storeStrong((id *)&self->_keyViews, 0);
  objc_storeStrong((id *)&self->_letterKeyConstraints, 0);
  objc_destroyWeak((id *)&self->_hostView);
}

+ (id)rowForKeyplane:(id)a3 keys:(id)a4 letterKeyGuide:(id)a5
{
  id v5;
  TUIKeyplaneRow *v6;

  v5 = a3;
  v6 = objc_alloc_init(TUIKeyplaneRow);
  -[TUIKeyplaneRow setHostView:](v6, "setHostView:", v5);

  return v6;
}

+ (id)emptyRowForKeyplane:(id)a3 rowNumber:(int64_t)a4
{
  id v5;
  TUIKeyplaneRow *v6;

  v5 = a3;
  v6 = objc_alloc_init(TUIKeyplaneRow);
  -[TUIKeyplaneRow setHostView:](v6, "setHostView:", v5);

  -[TUIKeyplaneRow setRowNumberInKeyplane:](v6, "setRowNumberInKeyplane:", a4);
  return v6;
}

@end
