@implementation STUIStatusBarCellularCondensedItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DB0CB0], *MEMORY[0x1E0DB0D38], 0);
}

- (void)_create_dualSignalView
{
  STUIStatusBarDualCellularSignalView *v3;
  STUIStatusBarDualCellularSignalView *v4;
  STUIStatusBarDualCellularSignalView *dualSignalView;
  void *v6;
  id v7;

  v3 = [STUIStatusBarDualCellularSignalView alloc];
  v4 = -[STUIStatusBarDualCellularSignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualSignalView = self->_dualSignalView;
  self->_dualSignalView = v4;

  -[STUIStatusBarDualCellularSignalView topSignalView](self->_dualSignalView, "topSignalView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfBars:", 4);

  -[STUIStatusBarDualCellularSignalView bottomSignalView](self->_dualSignalView, "bottomSignalView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfBars:", 4);

}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  _BOOL4 v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  uint64_t v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  BOOL v96;
  void *v97;
  int v98;
  int v99;
  uint64_t v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  id v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v126;
  void *v127;
  double v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  __CFString *v165;
  void *v166;
  _BOOL4 v167;
  __CFString *v168;
  uint64_t v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  objc_super v174;
  double v175;
  _QWORD v176[2];
  __CFString *(*v177)(uint64_t, void *, __int16 *);
  void *v178;
  double *v179;
  __int16 v180;
  double v181;
  double *v182;
  uint64_t v183;
  char v184;
  objc_super v185;
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[2];
  _QWORD v195[2];
  _QWORD v196[2];
  _QWORD v197[4];

  v197[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v185.receiver = self;
  v185.super_class = (Class)STUIStatusBarCellularCondensedItem;
  v173 = v9;
  -[STUIStatusBarCellularItem applyUpdate:toDisplayItem:](&v185, sel_applyUpdate_toDisplayItem_, v9, v10);
  v171 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularCondensedItem entryForDisplayItemWithIdentifier:](self, "entryForDisplayItemWithIdentifier:", v11);
  v172 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSignalStrengthDisplayIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v12 == v13;

  if ((_DWORD)v9)
  {
    -[STUIStatusBarItem statusBar](self, "statusBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "currentAggregatedData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[STUIStatusBarCellularCondensedItem dualSignalView](self, "dualSignalView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topSignalView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "cellularEntry");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[STUIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v36, v173, v37, 1);

    -[STUIStatusBarCellularCondensedItem dualSignalView](self, "dualSignalView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomSignalView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "secondaryCellularEntry");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[STUIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v40, v173, v41, 1);

    if (objc_msgSend(v173, "dataChanged"))
      objc_msgSend(v10, "setEnabled:", v38 & v42);
    goto LABEL_104;
  }
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualNameDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  if (v14 == v15)
    goto LABEL_20;
  objc_msgSend(v10, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSingleLineNameDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 == v5)
  {
LABEL_19:

    v16 = v15;
LABEL_20:

LABEL_21:
    -[STUIStatusBarItem statusBar](self, "statusBar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "currentAggregatedData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v181 = 0.0;
    v182 = &v181;
    v183 = 0x2020000000;
    v184 = 0;
    -[STUIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = 0;
    if (v44)
    {
      v165 = 0;
      v168 = 0;
    }
    else
    {
      v176[0] = MEMORY[0x1E0C809B0];
      v176[1] = 3221225472;
      v177 = (__CFString *(*)(uint64_t, void *, __int16 *))__64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2;
      v178 = &unk_1E8D62928;
      v179 = &v181;
      objc_msgSend(v34, "cellularEntry");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      __64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2((uint64_t)v176, v45, (_BYTE *)&v180 + 1);
      v165 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "secondaryCellularEntry");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v177((uint64_t)v176, v43, &v180);
      v168 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!*((_BYTE *)v182 + 24)
        && -[__CFString length](v165, "length")
        && -[__CFString length](v168, "length")
        && (-[__CFString isEqualToString:](v165, "isEqualToString:", v168) & 1) == 0)
      {
        *((_BYTE *)v182 + 24) = 1;
      }
    }
    v46 = objc_msgSend(v10, "isEnabled");
    if (v46)
    {
      +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "itemSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "showBothDualCarrierNames"))
        v47 = *((_BYTE *)v182 + 24) != 0;
      else
        v47 = 0;
      objc_msgSend(v10, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47 ^ (v5 == v6);
    }
    else
    {
      v48 = 0;
    }
    objc_msgSend(v10, "setEnabled:", v48);
    if (v46)
    {

    }
    if (!*((_BYTE *)v182 + 24) || !objc_msgSend(v10, "isEnabled"))
      goto LABEL_103;
    objc_msgSend(v10, "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v49 == v50;

    if (v51)
    {
      if (HIBYTE(v180) || !(_BYTE)v180)
      {
        if (objc_msgSend(v172, "type"))
          goto LABEL_103;
        objc_msgSend(v34, "secondaryCellularEntry");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "type") == 0;

        if (v96)
          goto LABEL_103;
      }
      -[STUIStatusBarCellularItem serviceNameView](self, "serviceNameView");
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString setText:](v61, "setText:", v168);
      objc_msgSend(v34, "secondaryCellularEntry");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "crossfadeString");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setAlternateText:](v61, "setAlternateText:", v63);
    }
    else
    {
      objc_msgSend(v10, "identifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "dualNameDisplayIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v52 == v53;

      if (v54)
      {
        -[STUIStatusBarCellularCondensedItem dualNameView](self, "dualNameView");
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringViews](v61, "stringViews");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "firstObject");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setText:", v165);

        -[__CFString stringViews](v61, "stringViews");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setMarqueeRunning:", 1);

        -[__CFString stringViews](v61, "stringViews");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "lastObject");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setText:", v168);

        -[__CFString stringViews](v61, "stringViews");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "lastObject");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setMarqueeRunning:", 1);
      }
      else
      {
        -[STUIStatusBarItem statusBar](self, "statusBar");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = objc_msgSend(v55, "effectiveUserInterfaceLayoutDirection");

        v56 = &stru_1E8D64C18;
        if (v165)
          v56 = v165;
        v57 = v56;
        v58 = -[__CFString length](v57, "length");
        if (v168 && -[__CFString length](v168, "length"))
        {
          if (-[__CFString length](v57, "length"))
          {
            v59 = v168;
            if (v162)
              v60 = v168;
            else
              v60 = v57;
            if (v162)
              v59 = v57;
            -[__CFString stringByAppendingFormat:](v60, "stringByAppendingFormat:", CFSTR(" • %@"), v59);
            v61 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v61 = v168;

            v58 = -[__CFString length](v61, "length");
          }
        }
        else
        {
          v61 = v57;
        }
        objc_msgSend(v10, "identifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "dualSingleLineNameDisplayIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v64 == v65;

        if (v66)
        {
          -[STUIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setText:", v61);

          -[STUIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setMarqueeRunning:", 1);
LABEL_101:

          goto LABEL_102;
        }
        objc_msgSend(v10, "identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v67 == v68;

        if (!v69)
        {
LABEL_102:

LABEL_103:
          _Block_object_dispose(&v181, 8);
LABEL_104:

          goto LABEL_105;
        }
        objc_msgSend(v173, "styleAttributes");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v70, "copy");

        -[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "fontForStyle:", objc_msgSend(v71, "fontStyle"));
        v156 = objc_claimAutoreleasedReturnValue();

        v157 = v58;
        objc_msgSend(v62, "textColor");
        v72 = objc_claimAutoreleasedReturnValue();
        v73 = *MEMORY[0x1E0DC1138];
        v74 = *MEMORY[0x1E0DC1140];
        v196[0] = *MEMORY[0x1E0DC1138];
        v196[1] = v74;
        v197[0] = v156;
        v197[1] = v72;
        v155 = (void *)v72;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v197, v196, 2);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v61, v158);
        -[STUIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v172, "type"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (v75
          || (objc_msgSend(v34, "secondaryCellularEntry"),
              v76 = (void *)objc_claimAutoreleasedReturnValue(),
              -[STUIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v76, "type")), v77 = objc_claimAutoreleasedReturnValue(), v76, v157 = objc_msgSend(v159, "length"), (v75 = (void *)v77) != 0))
        {
          v154 = v75;
          if (objc_msgSend(v75, "length"))
          {
            v175 = 0.0;
            -[STUIStatusBarCellularCondensedItem _fontForEntry:styleAttributes:baselineOffset:](self, "_fontForEntry:styleAttributes:baselineOffset:", v172, v62, &v175);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_alloc(MEMORY[0x1E0CB3498]);
            v194[0] = v73;
            v194[1] = v74;
            v195[0] = v153;
            v195[1] = v155;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v194, 2);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = (void *)objc_msgSend(v78, "initWithString:attributes:", v154, v79);

            if (v162)
              v157 = objc_msgSend(v159, "length") - v157;
            v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v158);
            objc_msgSend(v159, "insertAttributedString:atIndex:", v81, v157);

            objc_msgSend(v159, "insertAttributedString:atIndex:", v80, v157 + (v162 == 0));
          }
        }
        else
        {
          v154 = 0;
        }
        -[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setAttributedText:", v159);

        -[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "setMarqueeRunning:", 1);

        v63 = (void *)v156;
      }
    }

    goto LABEL_101;
  }
  objc_msgSend(v10, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {

    v18 = v5;
    goto LABEL_19;
  }
  objc_msgSend(v10, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 == v20;

  if (v21)
    goto LABEL_21;
  objc_msgSend(v10, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 == v23;

  if (v24)
  {
    if (objc_msgSend(v10, "isEnabled")
      && ((objc_msgSend(v173, "styleAttributesChanged") & 1) != 0 || objc_msgSend(v173, "dataChanged")))
    {
      objc_msgSend(v173, "styleAttributes");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v88, "copy");

      v181 = 0.0;
      -[STUIStatusBarCellularCondensedItem _fontForEntry:styleAttributes:baselineOffset:](self, "_fontForEntry:styleAttributes:baselineOffset:", v172, v34, &v181);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v181;
      objc_msgSend(v10, "baselineOffset");
      if (v90 != v91)
      {
        objc_msgSend(v10, "setBaselineOffset:", v181);
        objc_msgSend(v10, "region");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "layout");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "invalidate");

      }
      objc_msgSend(v34, "setFont:", v89);
      v169 = -[STUIStatusBarCellularCondensedItem _nonCondensedFontRangeForEntry:](self, "_nonCondensedFontRangeForEntry:", v172);
      v163 = v94;
      if (v169 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v174.receiver = self;
        v174.super_class = (Class)STUIStatusBarCellularCondensedItem;
        -[STUIStatusBarItem applyStyleAttributes:toDisplayItem:](&v174, sel_applyStyleAttributes_toDisplayItem_, v34, v10);
      }
      else
      {
        v109 = objc_alloc(MEMORY[0x1E0CB3778]);
        -[STUIStatusBarCellularItem networkTypeView](self, "networkTypeView");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "text");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = *MEMORY[0x1E0DC1138];
        v193[0] = v89;
        v113 = *MEMORY[0x1E0DC1140];
        v160 = v112;
        v192[0] = v112;
        v192[1] = v113;
        objc_msgSend(v34, "textColor");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v193[1] = v114;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 2);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = (void *)objc_msgSend(v109, "initWithString:attributes:", v111, v115);

        v116 = (void *)MEMORY[0x1E0DC1350];
        objc_msgSend(v89, "fontDescriptor");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "fontDescriptorWithSymbolicTraits:", 0);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "pointSize");
        objc_msgSend(v116, "fontWithDescriptor:size:", v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();

        v190[1] = v113;
        v191[0] = v119;
        v190[0] = v160;
        objc_msgSend(v34, "textColor");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v191[1] = v120;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v191, v190, 2);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "setAttributes:range:", v121, v169, v163);

        -[STUIStatusBarCellularItem networkTypeView](self, "networkTypeView");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "setAttributedText:", v166);

      }
      goto LABEL_104;
    }
    goto LABEL_105;
  }
  objc_msgSend(v10, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "animatedTypeDisplayIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25 == v26;

  if (v27)
  {
    if (!v172)
      goto LABEL_105;
    if ((objc_msgSend(v172, "isEnabled") & 1) != 0)
    {
      -[STUIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v172, "type"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v10, "isEnabled");
      if (v34)
        v99 = v98;
      else
        v99 = 0;
      if (v99 == 1)
      {
        v100 = objc_msgSend(v172, "isBootstrapCellular") ^ 1;
LABEL_91:
        objc_msgSend(v10, "setEnabled:", v100);
        if (objc_msgSend(v10, "isEnabled")
          && ((objc_msgSend(v173, "styleAttributesChanged") & 1) != 0 || objc_msgSend(v173, "dataChanged")))
        {
          -[STUIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          if (v105)
          {
            -[STUIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "animatedTypeDisplayItemSpacingFactorForCellularType:", objc_msgSend(v172, "type"));
            v108 = v107;

          }
          else
          {
            v108 = 1.0;
          }
          -[STUIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "styleAttributes");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          +[STUIStatusBarWifiSignalView widthForIconSize:](STUIStatusBarWifiSignalView, "widthForIconSize:", objc_msgSend(v127, "iconSize"));
          objc_msgSend(v126, "setFixedWidth:", v108 * v128);

          v181 = NAN;
          v129 = objc_msgSend(v172, "type");
          -[STUIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v167 = -[STUIStatusBarCellularCondensedItem _animateServiceType:prefixLength:currentType:](self, "_animateServiceType:prefixLength:currentType:", v129, &v181, objc_msgSend(v130, "type"));

          objc_msgSend(v173, "styleAttributes");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = (void *)objc_msgSend(v131, "copy");

          v175 = 0.0;
          -[STUIStatusBarCellularCondensedItem _fontForEntry:styleAttributes:baselineOffset:](self, "_fontForEntry:styleAttributes:baselineOffset:", v172, v132, &v175);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v175;
          objc_msgSend(v10, "baselineOffset");
          if (v133 != v134)
          {
            objc_msgSend(v10, "setBaselineOffset:", v175);
            objc_msgSend(v10, "region");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "layout");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "invalidate");

          }
          objc_msgSend(v132, "setFont:", v170);
          v137 = -[STUIStatusBarCellularCondensedItem _nonCondensedFontRangeForEntry:](self, "_nonCondensedFontRangeForEntry:", v172);
          v164 = v138;
          v139 = v137;
          if (v137 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[STUIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "setText:prefixLength:withStyleAttributes:forType:animated:", v34, *(_QWORD *)&v181, v132, objc_msgSend(v172, "type"), v167);
          }
          else
          {
            v141 = objc_alloc(MEMORY[0x1E0CB3778]);
            v142 = *MEMORY[0x1E0DC1138];
            v189[0] = v170;
            v143 = *MEMORY[0x1E0DC1140];
            v161 = v142;
            v188[0] = v142;
            v188[1] = v143;
            objc_msgSend(v132, "textColor");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v189[1] = v144;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, v188, 2);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = (void *)objc_msgSend(v141, "initWithString:attributes:", v34, v145);

            v146 = (void *)MEMORY[0x1E0DC1350];
            objc_msgSend(v170, "fontDescriptor");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "fontDescriptorWithSymbolicTraits:", 0);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "pointSize");
            objc_msgSend(v146, "fontWithDescriptor:size:", v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();

            v186[1] = v143;
            v187[0] = v149;
            v186[0] = v161;
            objc_msgSend(v132, "textColor");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            v187[1] = v150;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v187, v186, 2);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "setAttributes:range:", v151, v139, v164);

            -[STUIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "setAttributedText:prefixLength:forType:animated:", v140, *(_QWORD *)&v181, objc_msgSend(v172, "type"), v167);

          }
        }
        goto LABEL_104;
      }
    }
    else
    {
      objc_msgSend(v10, "isEnabled");
      v34 = 0;
    }
    v100 = 0;
    goto LABEL_91;
  }
  objc_msgSend(v10, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sosSignalStrengthDisplayIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28 == v29;

  if (v172)
    v31 = v30;
  else
    v31 = 0;
  if (v31)
  {
    v32 = objc_msgSend(v10, "isEnabled")
       && (objc_msgSend(v172, "isBootstrapCellular") & 1) == 0
       && objc_msgSend(v172, "showsSOSWhenDisabled")
       && (unint64_t)(objc_msgSend(v172, "status") == 1);
    objc_msgSend(v10, "setEnabled:", v32);
    if (objc_msgSend(v10, "isEnabled"))
    {
      -[STUIStatusBarCellularCondensedItem sosSignalView](self, "sosSignalView");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "signalView");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v102, v173, v172, 1);

      if (objc_msgSend(v172, "sosAvailable"))
        v103 = 1.0;
      else
        v103 = 0.3;
      -[STUIStatusBarCellularCondensedItem sosSignalView](self, "sosSignalView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sosView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setAlpha:", v103);

      goto LABEL_104;
    }
  }
LABEL_105:

  return v171;
}

- (id)entryForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  objc_super v17;

  v4 = a3;
  -[STUIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global_210);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_3:
    v8 = v7;
    goto LABEL_4;
  }
  objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v4;
  if ((id)v10 != v4)
  {
    v12 = (void *)v10;
    objc_msgSend((id)objc_opt_class(), "animatedTypeDisplayIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((id)v13 != v4)
    {
      v14 = (void *)v13;
      objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 != v4)
        goto LABEL_12;
      goto LABEL_11;
    }

    v11 = v12;
  }

LABEL_11:
  -[STUIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global_211);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_4;
LABEL_12:
  objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v4
    || (-[STUIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global_212), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)STUIStatusBarCellularCondensedItem;
    -[STUIStatusBarCellularItem entryForDisplayItemWithIdentifier:](&v17, sel_entryForDisplayItemWithIdentifier_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_4:

  return v8;
}

+ (STUIStatusBarIdentifier)animatedTypeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("animatedTypeDisplayIdentifier"));
}

- (id)_singleCellularEntryMatching:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = (uint64_t (**)(id, void *))a3;
  -[STUIStatusBarItem statusBar](self, "statusBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAggregatedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellularEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4[2](v4, v7) & 1) == 0)
  {

LABEL_5:
    objc_msgSend(v6, "cellularEntry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4[2](v4, v11))
    {

    }
    else
    {
      objc_msgSend(v6, "secondaryCellularEntry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v4[2](v4, v12);

      if (v13)
      {
        objc_msgSend(v6, "secondaryCellularEntry");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "secondaryCellularEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4[2](v4, v8);

  if ((v9 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v6, "cellularEntry");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14 = (void *)v10;
LABEL_11:

  return v14;
}

uint64_t __72__STUIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
    v3 = objc_msgSend(v2, "isBootstrapCellular") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSignalStrengthDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarCellularCondensedItem;
    v12 = -[STUIStatusBarItem canEnableDisplayItem:fromData:](&v14, sel_canEnableDisplayItem_fromData_, v7, v6);

  }
  else
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[STUIStatusBarCellularCondensedItem entryForDisplayItemWithIdentifier:](self, "entryForDisplayItemWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEnabled");

  }
  return v12;
}

+ (STUIStatusBarIdentifier)dualSignalStrengthDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualSignalStrengthDisplayIdentifier"));
}

uint64_t __72__STUIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
    v3 = objc_msgSend(v2, "isBootstrapCellular") ^ 1;
  else
    v3 = 0;

  return v3;
}

+ (STUIStatusBarIdentifier)dualSingleLineNameAndTypeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualSingleLineNameAndTypeDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)dualNameDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualNameDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)sosSignalStrengthDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("sosSignalStrengthDisplayIdentifier"));
}

+ (STUIStatusBarIdentifier)dualSingleLineNameDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualSingleLineNameDisplayIdentifier"));
}

uint64_t __72__STUIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "wifiCallingEnabled"))
    v3 = objc_msgSend(v2, "isBootstrapCellular") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (STUIStatusBarDualCellularSignalView)dualSignalView
{
  STUIStatusBarDualCellularSignalView *dualSignalView;

  dualSignalView = self->_dualSignalView;
  if (!dualSignalView)
  {
    -[STUIStatusBarCellularCondensedItem _create_dualSignalView](self, "_create_dualSignalView");
    dualSignalView = self->_dualSignalView;
  }
  return dualSignalView;
}

- (STUIStatusBarCellularCondensedItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  STUIStatusBarCellularCondensedItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarCellularCondensedItem;
  v4 = -[STUIStatusBarCellularItem initWithIdentifier:statusBar:](&v6, sel_initWithIdentifier_statusBar_, a3, a4);
  -[STUIStatusBarCellularCondensedItem setReducesFontSize:](v4, "setReducesFontSize:", 1);
  return v4;
}

- (void)setReducesFontSize:(BOOL)a3
{
  self->_reducesFontSize = a3;
}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  v10 = (void *)v9;
  objc_msgSend(v7, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "animatedTypeDisplayIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_7;
  }
  v13 = (void *)v12;
  objc_msgSend(v7, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 != v15)
  {
    v16.receiver = self;
    v16.super_class = (Class)STUIStatusBarCellularCondensedItem;
    -[STUIStatusBarItem applyStyleAttributes:toDisplayItem:](&v16, sel_applyStyleAttributes_toDisplayItem_, v6, v7);
  }
LABEL_8:

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "dualSignalStrengthDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarCellularCondensedItem dualSignalView](self, "dualSignalView");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "dualNameDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[STUIStatusBarCellularCondensedItem dualNameView](self, "dualNameView");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "dualSingleLineNameDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[STUIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          -[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "animatedTypeDisplayIdentifier");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v4)
          {
            -[STUIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "sosSignalStrengthDisplayIdentifier");
            v10 = (id)objc_claimAutoreleasedReturnValue();

            if (v10 == v4)
            {
              -[STUIStatusBarCellularCondensedItem sosSignalView](self, "sosSignalView");
              v11 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14.receiver = self;
              v14.super_class = (Class)STUIStatusBarCellularCondensedItem;
              -[STUIStatusBarCellularItem viewForIdentifier:](&v14, sel_viewForIdentifier_, v4);
              v11 = objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
  }
  v12 = (void *)v11;

  return v12;
}

- (STUIStatusBarEmergencySignalView)sosSignalView
{
  STUIStatusBarEmergencySignalView *sosSignalView;

  sosSignalView = self->_sosSignalView;
  if (!sosSignalView)
  {
    -[STUIStatusBarCellularCondensedItem _create_sosSignalView](self, "_create_sosSignalView");
    sosSignalView = self->_sosSignalView;
  }
  return sosSignalView;
}

- (void)_create_sosSignalView
{
  STUIStatusBarEmergencySignalView *v3;
  STUIStatusBarEmergencySignalView *v4;
  STUIStatusBarEmergencySignalView *sosSignalView;
  id v6;

  v3 = [STUIStatusBarEmergencySignalView alloc];
  v4 = -[STUIStatusBarEmergencySignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sosSignalView = self->_sosSignalView;
  self->_sosSignalView = v4;

  -[STUIStatusBarEmergencySignalView signalView](self->_sosSignalView, "signalView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfBars:", 4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedNetworkTypeView, 0);
  objc_storeStrong((id *)&self->_sosSignalView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameAndTypeView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameView, 0);
  objc_storeStrong((id *)&self->_dualNameView, 0);
  objc_storeStrong((id *)&self->_dualSignalView, 0);
}

BOOL __64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
  {
    objc_msgSend(v2, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

__CFString *__64__STUIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  __CFString *v6;

  v5 = a2;
  if (objc_msgSend(v5, "status") == 5 || (objc_msgSend(v5, "wifiCallingEnabled") & 1) != 0)
  {
    *a3 = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 0;
    if (objc_msgSend(v5, "status") == 1 || objc_msgSend(v5, "status") == 2)
    {
      v6 = CFSTR("– –");
      goto LABEL_5;
    }
  }
  objc_msgSend(v5, "string");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v6;
}

- (id)_stringForCellularType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  objc_super v13;

  -[STUIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (-[STUIStatusBarCellularItem typeStringProvider](self, "typeStringProvider"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "stringForCellularType:condensed:", a3, 1),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if (a3 == 7)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("5GE[condensed]");
      v11 = CFSTR("5G  ᴇ");
    }
    else
    {
      if (a3 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("E");
      }
      else
      {
        if (a3 != 2)
        {
LABEL_11:
          v13.receiver = self;
          v13.super_class = (Class)STUIStatusBarCellularCondensedItem;
          -[STUIStatusBarCellularItem _stringForCellularType:](&v13, sel__stringForCellularType_, a3);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          return v7;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("G");
      }
      v11 = &stru_1E8D64C18;
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v11, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_11;
  }
  return v7;
}

- (id)_fontForEntry:(id)a3 styleAttributes:(id)a4 baselineOffset:(double *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  objc_msgSend(a4, "smallFont");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v9;
  if (v10)
  {
    -[STUIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "condensedFontForCellularType:defaultFont:baselineOffset:", objc_msgSend(v8, "type"), v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (_NSRange)_nonCondensedFontRangeForEntry:(id)a3
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = objc_msgSend(a3, "type");
  v4 = (v3 & 0xFFFFFFFFFFFFFFFELL) == 12;
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    v5 = 2;
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  result.length = v4;
  result.location = v5;
  return result;
}

- (BOOL)_showCallFowardingForEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[STUIStatusBarItem statusBar](self, "statusBar");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "currentAggregatedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secondaryCellularEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v4, "callForwardingEnabled");
  if ((v5 & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "callForwardingEnabled");

  return v8;
}

- (BOOL)_animateServiceType:(int64_t)a3 prefixLength:(int64_t *)a4 currentType:(int64_t)a5
{
  if ((unint64_t)(a3 - 11) >= 3)
    return a3 == 10 && (unint64_t)(a5 - 11) < 3;
  if (a4)
    *a4 = 2;
  return a5 == 10;
}

- (void)prepareAnimation:(id)a3 forDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") != 1)
    goto LABEL_11;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSingleLineNameDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    -[STUIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setMarqueeRunning:", 0);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke;
      v23[3] = &unk_1E8D628C0;
      v23[4] = v13;
      v14 = v23;
LABEL_10:
      v21 = v13;
      objc_msgSend(v6, "addCompletionHandler:", v14);

      goto LABEL_11;
    }
    goto LABEL_8;
  }
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {
    -[STUIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_8:
  objc_msgSend(v7, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualNameDisplayIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v16)
  {
    -[STUIStatusBarCellularCondensedItem dualNameView](self, "dualNameView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringViews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMarqueeRunning:", 0);

    objc_msgSend(v13, "stringViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMarqueeRunning:", 0);

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2;
    v22[3] = &unk_1E8D628C0;
    v22[4] = v13;
    v14 = v22;
    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "setMarqueeRunning:", 1);
  return result;
}

void __70__STUIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMarqueeRunning:", 1);

    objc_msgSend(*(id *)(a1 + 32), "stringViews");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMarqueeRunning:", 1);

  }
}

- (STUIStatusBarMultilineStringView)dualNameView
{
  STUIStatusBarMultilineStringView *dualNameView;

  dualNameView = self->_dualNameView;
  if (!dualNameView)
  {
    -[STUIStatusBarCellularCondensedItem _create_dualNameView](self, "_create_dualNameView");
    dualNameView = self->_dualNameView;
  }
  return dualNameView;
}

- (void)_create_dualNameView
{
  STUIStatusBarMultilineStringView *v3;
  STUIStatusBarMultilineStringView *v4;
  STUIStatusBarMultilineStringView *dualNameView;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = [STUIStatusBarMultilineStringView alloc];
  v4 = -[STUIStatusBarMultilineStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualNameView = self->_dualNameView;
  self->_dualNameView = v4;

  -[STUIStatusBarMultilineStringView setNumberOfLines:](self->_dualNameView, "setNumberOfLines:", 2);
  -[STUIStatusBarMultilineStringView stringViews](self->_dualNameView, "stringViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setFontStyle:", 2);
  objc_msgSend(v9, "setMarqueeEnabled:", 1);
  -[STUIStatusBarMultilineStringView stringViews](self->_dualNameView, "stringViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(v8, "setFontStyle:", 2);
  objc_msgSend(v8, "setMarqueeEnabled:", 1);

}

- (STUIStatusBarStringView)dualSingleLineNameView
{
  STUIStatusBarStringView *dualSingleLineNameView;

  dualSingleLineNameView = self->_dualSingleLineNameView;
  if (!dualSingleLineNameView)
  {
    -[STUIStatusBarCellularCondensedItem _create_dualSingleLineNameView](self, "_create_dualSingleLineNameView");
    dualSingleLineNameView = self->_dualSingleLineNameView;
  }
  return dualSingleLineNameView;
}

- (void)_create_dualSingleLineNameView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *dualSingleLineNameView;
  double v6;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualSingleLineNameView = self->_dualSingleLineNameView;
  self->_dualSingleLineNameView = v4;

  -[STUIStatusBarStringView setNumberOfLines:](self->_dualSingleLineNameView, "setNumberOfLines:", 1);
  -[STUIStatusBarStringView setFontStyle:](self->_dualSingleLineNameView, "setFontStyle:", 0);
  -[STUIStatusBarStringView setMarqueeEnabled:](self->_dualSingleLineNameView, "setMarqueeEnabled:", 1);
  LODWORD(v6) = 1132068864;
  -[STUIStatusBarStringView setContentCompressionResistancePriority:forAxis:](self->_dualSingleLineNameView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
}

- (STUIStatusBarStringView)dualSingleLineNameAndTypeView
{
  STUIStatusBarStringView *dualSingleLineNameAndTypeView;

  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  if (!dualSingleLineNameAndTypeView)
  {
    -[STUIStatusBarCellularCondensedItem _create_dualSingleLineNameAndTypeView](self, "_create_dualSingleLineNameAndTypeView");
    dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  }
  return dualSingleLineNameAndTypeView;
}

- (void)_create_dualSingleLineNameAndTypeView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *dualSingleLineNameAndTypeView;
  double v6;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  self->_dualSingleLineNameAndTypeView = v4;

  -[STUIStatusBarStringView setNumberOfLines:](self->_dualSingleLineNameAndTypeView, "setNumberOfLines:", 1);
  -[STUIStatusBarStringView setFontStyle:](self->_dualSingleLineNameAndTypeView, "setFontStyle:", 0);
  -[STUIStatusBarStringView setMarqueeEnabled:](self->_dualSingleLineNameAndTypeView, "setMarqueeEnabled:", 1);
  LODWORD(v6) = 1132068864;
  -[STUIStatusBarStringView setContentCompressionResistancePriority:forAxis:](self->_dualSingleLineNameAndTypeView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
}

- (STUIStatusBarCellularNetworkTypeView)animatedNetworkTypeView
{
  STUIStatusBarCellularNetworkTypeView *animatedNetworkTypeView;

  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  if (!animatedNetworkTypeView)
  {
    -[STUIStatusBarCellularCondensedItem _create_animatedNetworkTypeView](self, "_create_animatedNetworkTypeView");
    animatedNetworkTypeView = self->_animatedNetworkTypeView;
  }
  return animatedNetworkTypeView;
}

- (void)_create_animatedNetworkTypeView
{
  STUIStatusBarCellularNetworkTypeView *v3;
  STUIStatusBarCellularNetworkTypeView *v4;
  STUIStatusBarCellularNetworkTypeView *animatedNetworkTypeView;

  v3 = [STUIStatusBarCellularNetworkTypeView alloc];
  v4 = -[STUIStatusBarCellularNetworkTypeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  self->_animatedNetworkTypeView = v4;

}

- (BOOL)reducesFontSize
{
  return self->_reducesFontSize;
}

- (void)setDualSignalView:(id)a3
{
  objc_storeStrong((id *)&self->_dualSignalView, a3);
}

- (void)setDualNameView:(id)a3
{
  objc_storeStrong((id *)&self->_dualNameView, a3);
}

- (void)setDualSingleLineNameView:(id)a3
{
  objc_storeStrong((id *)&self->_dualSingleLineNameView, a3);
}

- (void)setDualSingleLineNameAndTypeView:(id)a3
{
  objc_storeStrong((id *)&self->_dualSingleLineNameAndTypeView, a3);
}

- (void)setSosSignalView:(id)a3
{
  objc_storeStrong((id *)&self->_sosSignalView, a3);
}

- (void)setAnimatedNetworkTypeView:(id)a3
{
  objc_storeStrong((id *)&self->_animatedNetworkTypeView, a3);
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;
  objc_super v48;
  void *v49;
  _QWORD v50[9];
  _QWORD v51[3];
  uint64_t v52;
  void *v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v7 = a3 - a4;
    v48.receiver = a1;
    v48.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularCondensedItem;
    objc_msgSendSuper2(&v48, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3 - a4, 0, a5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dualSignalStrengthDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, v7 + 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "signalStrengthPlacement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "excludingPlacements:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dualSingleLineNameDisplayIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v14, v7 + 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "namePlacement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "excludingPlacements:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "typePlacement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)v13;
    v52 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "requiringAnyPlacements:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dualSingleLineNameAndTypeDisplayIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](STUIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v22, v7 + 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "namePlacement");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v24;
    v51[1] = v18;
    v25 = v18;
    v43 = (void *)v18;
    v51[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "excludingPlacements:", v26);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "signalStrengthPlacement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v27;
    v50[1] = v13;
    objc_msgSend(v8, "warningPlacement");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v28;
    objc_msgSend(v8, "rawPlacement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v29;
    objc_msgSend(v8, "namePlacement");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v30;
    v50[5] = v25;
    v50[6] = v44;
    v50[7] = v21;
    objc_msgSend(v8, "callForwardingPlacement");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[8] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarDisplayItemPlacementGroup groupWithPriority:placements:](STUIStatusBarDisplayItemPlacementCellularGroup, "groupWithPriority:placements:", a4, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "signalStrengthPlacement");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSignalStrengthPlacement:", v34);

    objc_msgSend(v8, "warningPlacement");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWarningPlacement:", v35);

    objc_msgSend(v8, "namePlacement");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNamePlacement:", v36);

    objc_msgSend(v33, "setTypePlacement:", v21);
    objc_msgSend(v8, "callForwardingPlacement");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCallForwardingPlacement:", v37);

    objc_msgSend(v8, "rawPlacement");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRawPlacement:", v38);

    objc_msgSend(v33, "setDualSignalStrengthPlacement:", v45);
    objc_msgSend(v33, "setDualNamePlacement:", v43);
    objc_msgSend(v33, "setDualNameAndTypePlacement:", v44);
    objc_msgSend(v8, "placementsAffectedByAirplaneMode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPlacementsAffectedByAirplaneMode:", v41);

    return v33;
  }
  else
  {
    v47.receiver = a1;
    v47.super_class = (Class)&OBJC_METACLASS___STUIStatusBarCellularCondensedItem;
    objc_msgSendSuper2(&v47, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3, a4, a5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
