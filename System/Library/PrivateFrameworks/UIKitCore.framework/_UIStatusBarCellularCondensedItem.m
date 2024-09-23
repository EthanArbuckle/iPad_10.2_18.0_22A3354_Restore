@implementation _UIStatusBarCellularCondensedItem

+ (_UIStatusBarIdentifier)dualSignalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualSignalStrengthDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)dualNameDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualNameDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)dualSingleLineNameDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualSingleLineNameDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)dualSingleLineNameAndTypeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("dualSingleLineNameAndTypeDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)sosSignalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("sosSignalStrengthDisplayIdentifier"));
}

+ (_UIStatusBarIdentifier)animatedTypeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("animatedTypeDisplayIdentifier"));
}

- (_UIStatusBarCellularCondensedItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  _UIStatusBarCellularCondensedItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarCellularCondensedItem;
  v4 = -[_UIStatusBarCellularItem initWithIdentifier:statusBar:](&v6, sel_initWithIdentifier_statusBar_, a3, a4);
  -[_UIStatusBarCellularCondensedItem setReducesFontSize:](v4, "setReducesFontSize:", 1);
  return v4;
}

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("cellularEntry"), CFSTR("secondaryCellularEntry"), 0);
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
    v14.super_class = (Class)_UIStatusBarCellularCondensedItem;
    v12 = -[_UIStatusBarItem canEnableDisplayItem:fromData:](&v14, sel_canEnableDisplayItem_fromData_, v7, v6);

  }
  else
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIStatusBarCellularCondensedItem entryForDisplayItemWithIdentifier:](self, "entryForDisplayItemWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEnabled");

  }
  return v12;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  void *v10;
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
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  BOOL v98;
  void *v99;
  int v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  id v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v128;
  void *v129;
  double v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _BOOL4 v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  objc_super v176;
  double v177;
  _QWORD v178[2];
  __CFString *(*v179)(uint64_t, void *, __int16 *);
  void *v180;
  double *v181;
  __int16 v182;
  double v183;
  double *v184;
  uint64_t v185;
  char v186;
  objc_super v187;
  _QWORD v188[2];
  _QWORD v189[2];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[2];
  _QWORD v195[2];
  _QWORD v196[2];
  _QWORD v197[2];
  _QWORD v198[2];
  _QWORD v199[4];

  v199[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v187.receiver = self;
  v187.super_class = (Class)_UIStatusBarCellularCondensedItem;
  v175 = v8;
  -[_UIStatusBarCellularItem applyUpdate:toDisplayItem:](&v187, sel_applyUpdate_toDisplayItem_, v8, v9);
  v173 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarCellularCondensedItem entryForDisplayItemWithIdentifier:](self, "entryForDisplayItemWithIdentifier:", v10);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSignalStrengthDisplayIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = v11 == v12;

  if ((_DWORD)v8)
  {
    -[_UIStatusBarItem statusBar](self, "statusBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "currentAggregatedData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIStatusBarCellularCondensedItem dualSignalView](self, "dualSignalView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topSignalView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "cellularEntry");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[_UIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v36, v175, v37, 1);

    -[_UIStatusBarCellularCondensedItem dualSignalView](self, "dualSignalView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomSignalView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "secondaryCellularEntry");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[_UIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v40, v175, v41, 1);

    if (objc_msgSend(v175, "dataChanged"))
      objc_msgSend(v9, "setEnabled:", v38 & v42);
    goto LABEL_105;
  }
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualNameDisplayIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (v13 == v14)
    goto LABEL_19;
  objc_msgSend(v9, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSingleLineNameDisplayIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  if (v16 == v17)
  {
LABEL_18:

    v15 = v14;
LABEL_19:

LABEL_20:
    -[_UIStatusBarItem statusBar](self, "statusBar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "currentAggregatedData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v183 = 0.0;
    v184 = &v183;
    v185 = 0x2020000000;
    v186 = 0;
    -[_UIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global_476);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = 0;
    if (v44)
    {
      v45 = 0;
      v46 = 0;
    }
    else
    {
      v178[0] = MEMORY[0x1E0C809B0];
      v178[1] = 3221225472;
      v179 = (__CFString *(*)(uint64_t, void *, __int16 *))__63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2;
      v180 = &unk_1E16E0420;
      v181 = &v183;
      objc_msgSend(v34, "cellularEntry");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      __63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2((uint64_t)v178, v47, (_BYTE *)&v182 + 1);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "secondaryCellularEntry");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v179((uint64_t)v178, v48, &v182);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!*((_BYTE *)v184 + 24)
        && -[__CFString length](v46, "length")
        && -[__CFString length](v45, "length")
        && (-[__CFString isEqualToString:](v46, "isEqualToString:", v45) & 1) == 0)
      {
        *((_BYTE *)v184 + 24) = 1;
      }
    }
    v49 = objc_msgSend(v9, "isEnabled");
    if (v49)
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v50 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1)
        goto LABEL_27;
      v153 = _UIInternalPreference_UIStatusBarShowBothDualCarrierNames;
      if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UIStatusBarShowBothDualCarrierNames)
        goto LABEL_27;
      while (v50 >= v153)
      {
        _UIInternalPreferenceSync(v50, &_UIInternalPreference_UIStatusBarShowBothDualCarrierNames, (uint64_t)CFSTR("UIStatusBarShowBothDualCarrierNames"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v51 = 0;
        v153 = _UIInternalPreference_UIStatusBarShowBothDualCarrierNames;
        if (v50 == _UIInternalPreference_UIStatusBarShowBothDualCarrierNames)
          goto LABEL_28;
      }
      if (!byte_1EDDA82B4)
LABEL_27:
        v51 = 0;
      else
        v51 = *((_BYTE *)v184 + 24) != 0;
LABEL_28:
      objc_msgSend(v9, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51 ^ (v5 == v4);
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v9, "setEnabled:", v52);
    if (v49)
    {

    }
    if (!*((_BYTE *)v184 + 24) || !objc_msgSend(v9, "isEnabled"))
      goto LABEL_104;
    objc_msgSend(v9, "identifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v53 == v54;

    if (v55)
    {
      if (HIBYTE(v182) || !(_BYTE)v182)
      {
        if (objc_msgSend(v174, "type"))
          goto LABEL_104;
        objc_msgSend(v34, "secondaryCellularEntry");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v97, "type") == 0;

        if (v98)
          goto LABEL_104;
      }
      -[_UIStatusBarCellularItem serviceNameView](self, "serviceNameView");
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString setText:](v64, "setText:", v45);
      objc_msgSend(v34, "secondaryCellularEntry");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "crossfadeString");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setAlternateText:](v64, "setAlternateText:", v66);
    }
    else
    {
      objc_msgSend(v9, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "dualNameDisplayIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v56 == v57;

      if (v58)
      {
        -[_UIStatusBarCellularCondensedItem dualNameView](self, "dualNameView");
        v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringViews](v64, "stringViews");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "firstObject");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setText:", v46);

        -[__CFString stringViews](v64, "stringViews");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "firstObject");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setMarqueeRunning:", 1);

        -[__CFString stringViews](v64, "stringViews");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastObject");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setText:", v45);

        -[__CFString stringViews](v64, "stringViews");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "lastObject");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setMarqueeRunning:", 1);
      }
      else
      {
        -[_UIStatusBarItem statusBar](self, "statusBar");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = objc_msgSend(v59, "effectiveUserInterfaceLayoutDirection");

        v60 = &stru_1E16EDF20;
        if (v46)
          v60 = v46;
        v61 = v60;
        v170 = -[__CFString length](v61, "length");
        if (v45 && -[__CFString length](v45, "length"))
        {
          if (-[__CFString length](v61, "length"))
          {
            if (v167)
              v62 = v45;
            else
              v62 = v61;
            if (v167)
              v63 = v61;
            else
              v63 = v45;
            -[__CFString stringByAppendingFormat:](v62, "stringByAppendingFormat:", CFSTR(" • %@"), v63);
            v64 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v64 = v45;

            v170 = -[__CFString length](v64, "length");
          }
        }
        else
        {
          v64 = v61;
        }
        objc_msgSend(v9, "identifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "dualSingleLineNameDisplayIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v67 == v68;

        if (v69)
        {
          -[_UIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setText:", v64);

          -[_UIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setMarqueeRunning:", 1);
LABEL_102:

          goto LABEL_103;
        }
        objc_msgSend(v9, "identifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v70 == v71;

        if (!v72)
        {
LABEL_103:

LABEL_104:
          _Block_object_dispose(&v183, 8);
LABEL_105:

          goto LABEL_106;
        }
        objc_msgSend(v175, "styleAttributes");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(v73, "copy");

        -[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "fontForStyle:", objc_msgSend(v74, "fontStyle"));
        v160 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v65, "textColor");
        v75 = objc_claimAutoreleasedReturnValue();
        v154 = *(_QWORD *)off_1E1678D98;
        v76 = *(_QWORD *)off_1E1678D98;
        v155 = *(_QWORD *)off_1E1678D90;
        v198[0] = *(_QWORD *)off_1E1678D90;
        v198[1] = v76;
        v199[0] = v160;
        v199[1] = v75;
        v159 = (void *)v75;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v199, v198, 2);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v64, v162);
        -[_UIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v174, "type"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77
          || (objc_msgSend(v34, "secondaryCellularEntry"),
              v78 = (void *)objc_claimAutoreleasedReturnValue(),
              -[_UIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v78, "type")), v79 = objc_claimAutoreleasedReturnValue(), v78, v170 = objc_msgSend(v164, "length"), (v77 = (void *)v79) != 0))
        {
          v158 = v77;
          if (objc_msgSend(v77, "length"))
          {
            v177 = 0.0;
            -[_UIStatusBarCellularCondensedItem _fontForEntry:styleAttributes:baselineOffset:](self, "_fontForEntry:styleAttributes:baselineOffset:", v174, v65, &v177);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_alloc(MEMORY[0x1E0CB3498]);
            v196[0] = v155;
            v196[1] = v154;
            v197[0] = v157;
            v197[1] = v159;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v197, v196, 2);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = (void *)objc_msgSend(v80, "initWithString:attributes:", v158, v81);

            if (v167)
              v170 = objc_msgSend(v164, "length") - v170;
            v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v162);
            objc_msgSend(v164, "insertAttributedString:atIndex:", v82, v170);

            objc_msgSend(v164, "insertAttributedString:atIndex:", v156, v170 + (v167 == 0));
          }
        }
        else
        {
          v158 = 0;
        }
        -[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "setAttributedText:", v164);

        -[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "setMarqueeRunning:", 1);

        v66 = (void *)v160;
      }
    }

    goto LABEL_102;
  }
  objc_msgSend(v9, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 == v5)
  {

    v18 = v17;
    goto LABEL_18;
  }
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4 == v20;

  if (v21)
    goto LABEL_20;
  objc_msgSend(v9, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeDisplayIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 == v23;

  if (v24)
  {
    if (objc_msgSend(v9, "isEnabled")
      && ((objc_msgSend(v175, "styleAttributesChanged") & 1) != 0 || objc_msgSend(v175, "dataChanged")))
    {
      objc_msgSend(v175, "styleAttributes");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v89, "copy");

      v183 = 0.0;
      -[_UIStatusBarCellularCondensedItem _fontForEntry:styleAttributes:baselineOffset:](self, "_fontForEntry:styleAttributes:baselineOffset:", v174, v34, &v183);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v183;
      objc_msgSend(v9, "baselineOffset");
      if (v91 != v92)
      {
        objc_msgSend(v9, "setBaselineOffset:", v183);
        objc_msgSend(v9, "region");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "layout");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "invalidate");

      }
      objc_msgSend(v34, "setFont:", v90);
      v95 = -[_UIStatusBarCellularCondensedItem _nonCondensedFontRangeForEntry:](self, "_nonCondensedFontRangeForEntry:", v174);
      v168 = v96;
      v171 = v95;
      if (v95 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v176.receiver = self;
        v176.super_class = (Class)_UIStatusBarCellularCondensedItem;
        -[_UIStatusBarItem applyStyleAttributes:toDisplayItem:](&v176, sel_applyStyleAttributes_toDisplayItem_, v34, v9);
      }
      else
      {
        v111 = objc_alloc(MEMORY[0x1E0CB3778]);
        -[_UIStatusBarCellularItem networkTypeView](self, "networkTypeView");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "text");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = *(_QWORD *)off_1E1678D90;
        v195[0] = v90;
        v115 = *(_QWORD *)off_1E1678D98;
        v165 = v114;
        v194[0] = v114;
        v194[1] = v115;
        objc_msgSend(v34, "textColor");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v195[1] = v116;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v194, 2);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = (void *)objc_msgSend(v111, "initWithString:attributes:", v113, v117);

        objc_msgSend(v90, "fontDescriptor");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "fontDescriptorWithSymbolicTraits:", 0);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "pointSize");
        objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        v192[1] = v115;
        v193[0] = v121;
        v192[0] = v165;
        objc_msgSend(v34, "textColor");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v193[1] = v122;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 2);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "setAttributes:range:", v123, v171, v168);

        -[_UIStatusBarCellularItem networkTypeView](self, "networkTypeView");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "setAttributedText:", v118);

      }
      goto LABEL_105;
    }
    goto LABEL_106;
  }
  objc_msgSend(v9, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "animatedTypeDisplayIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25 == v26;

  if (v27)
  {
    if (!v174)
      goto LABEL_106;
    if ((objc_msgSend(v174, "isEnabled") & 1) != 0)
    {
      -[_UIStatusBarCellularCondensedItem _stringForCellularType:](self, "_stringForCellularType:", objc_msgSend(v174, "type"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v9, "isEnabled");
      if (v34)
        v101 = v100;
      else
        v101 = 0;
      if (v101 == 1)
      {
        v102 = objc_msgSend(v174, "isBootstrapCellular") ^ 1;
LABEL_92:
        objc_msgSend(v9, "setEnabled:", v102);
        if (objc_msgSend(v9, "isEnabled")
          && ((objc_msgSend(v175, "styleAttributesChanged") & 1) != 0 || objc_msgSend(v175, "dataChanged")))
        {
          -[_UIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (v107)
          {
            -[_UIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "animatedTypeDisplayItemSpacingFactorForCellularType:", objc_msgSend(v174, "type"));
            v110 = v109;

          }
          else
          {
            v110 = 1.0;
          }
          -[_UIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "styleAttributes");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIStatusBarWifiSignalView widthForIconSize:](_UIStatusBarWifiSignalView, "widthForIconSize:", objc_msgSend(v129, "iconSize"));
          objc_msgSend(v128, "setFixedWidth:", v110 * v130);

          v183 = NAN;
          v131 = objc_msgSend(v174, "type");
          -[_UIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = -[_UIStatusBarCellularCondensedItem _animateServiceType:prefixLength:currentType:](self, "_animateServiceType:prefixLength:currentType:", v131, &v183, objc_msgSend(v132, "type"));

          objc_msgSend(v175, "styleAttributes");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = (void *)objc_msgSend(v133, "copy");

          v177 = 0.0;
          -[_UIStatusBarCellularCondensedItem _fontForEntry:styleAttributes:baselineOffset:](self, "_fontForEntry:styleAttributes:baselineOffset:", v174, v134, &v177);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = v177;
          objc_msgSend(v9, "baselineOffset");
          if (v135 != v136)
          {
            objc_msgSend(v9, "setBaselineOffset:", v177);
            objc_msgSend(v9, "region");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "layout");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "invalidate");

          }
          objc_msgSend(v134, "setFont:", v172);
          v139 = -[_UIStatusBarCellularCondensedItem _nonCondensedFontRangeForEntry:](self, "_nonCondensedFontRangeForEntry:", v174);
          v166 = v140;
          v141 = v139;
          if (v139 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[_UIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "setText:prefixLength:withStyleAttributes:forType:animated:", v34, *(_QWORD *)&v183, v134, objc_msgSend(v174, "type"), v169);
          }
          else
          {
            v143 = objc_alloc(MEMORY[0x1E0CB3778]);
            v144 = *(_QWORD *)off_1E1678D90;
            v191[0] = v172;
            v145 = *(_QWORD *)off_1E1678D98;
            v161 = v144;
            v190[0] = v144;
            v190[1] = v145;
            objc_msgSend(v134, "textColor");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            v191[1] = v146;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v191, v190, 2);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = (void *)objc_msgSend(v143, "initWithString:attributes:", v34, v147);

            objc_msgSend(v172, "fontDescriptor");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "fontDescriptorWithSymbolicTraits:", 0);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "pointSize");
            objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v149);
            v163 = (void *)objc_claimAutoreleasedReturnValue();

            v188[1] = v145;
            v189[0] = v163;
            v188[0] = v161;
            objc_msgSend(v134, "textColor");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            v189[1] = v150;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, v188, 2);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "setAttributes:range:", v151, v141, v166);

            -[_UIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "setAttributedText:prefixLength:forType:animated:", v142, *(_QWORD *)&v183, objc_msgSend(v174, "type"), v169);

          }
        }
        goto LABEL_105;
      }
    }
    else
    {
      objc_msgSend(v9, "isEnabled");
      v34 = 0;
    }
    v102 = 0;
    goto LABEL_92;
  }
  objc_msgSend(v9, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sosSignalStrengthDisplayIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28 == v29;

  if (v174)
    v31 = v30;
  else
    v31 = 0;
  if (v31)
  {
    v32 = objc_msgSend(v9, "isEnabled")
       && objc_msgSend(v174, "showsSOSWhenDisabled")
       && (unint64_t)(objc_msgSend(v174, "status") == 1);
    objc_msgSend(v9, "setEnabled:", v32);
    if (objc_msgSend(v9, "isEnabled"))
    {
      -[_UIStatusBarCellularCondensedItem sosSignalView](self, "sosSignalView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "signalView");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarCellularItem _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](self, "_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v104, v175, v174, 1);

      if (objc_msgSend(v174, "sosAvailable"))
        v105 = 1.0;
      else
        v105 = 0.3;
      -[_UIStatusBarCellularCondensedItem sosSignalView](self, "sosSignalView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sosView");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setAlpha:", v105);

      goto LABEL_105;
    }
  }
LABEL_106:

  return v173;
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
    v16.super_class = (Class)_UIStatusBarCellularCondensedItem;
    -[_UIStatusBarItem applyStyleAttributes:toDisplayItem:](&v16, sel_applyStyleAttributes_toDisplayItem_, v6, v7);
  }
LABEL_8:

}

- (id)_stringForCellularType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  objc_super v11;

  -[_UIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (-[_UIStatusBarCellularItem typeStringProvider](self, "typeStringProvider"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "stringForCellularType:condensed:", a3, 1),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if (a3 == 7)
    {
      v8 = CFSTR("5GE[condensed]");
      v9 = CFSTR("5G  ᴇ");
    }
    else
    {
      if (a3 == 3)
      {
        v8 = CFSTR("E");
      }
      else
      {
        if (a3 != 2)
        {
LABEL_11:
          v11.receiver = self;
          v11.super_class = (Class)_UIStatusBarCellularCondensedItem;
          -[_UIStatusBarCellularItem _stringForCellularType:](&v11, sel__stringForCellularType_, a3);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          return v7;
        }
        v8 = CFSTR("G");
      }
      v9 = v8;
    }
    _UINSLocalizedStringWithDefaultValue(v8, v9);
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
  -[_UIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v9;
  if (v10)
  {
    -[_UIStatusBarCellularItem typeStringProvider](self, "typeStringProvider");
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
  -[_UIStatusBarItem statusBar](self, "statusBar");
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

- (BOOL)_showCallFowardingForEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[_UIStatusBarItem statusBar](self, "statusBar");
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
    -[_UIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setMarqueeRunning:", 0);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke;
      v23[3] = &unk_1E16B42D0;
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
    -[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
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
    -[_UIStatusBarCellularCondensedItem dualNameView](self, "dualNameView");
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
    v22[2] = __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2;
    v22[3] = &unk_1E16B42D0;
    v22[4] = v13;
    v14 = v22;
    goto LABEL_10;
  }
LABEL_11:

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
  -[_UIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global_196_1);
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
  -[_UIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global_197_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_4;
LABEL_12:
  objc_msgSend((id)objc_opt_class(), "nameDisplayIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v4
    || (-[_UIStatusBarCellularCondensedItem _singleCellularEntryMatching:](self, "_singleCellularEntryMatching:", &__block_literal_global_198), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v17.receiver = self;
    v17.super_class = (Class)_UIStatusBarCellularCondensedItem;
    -[_UIStatusBarCellularItem entryForDisplayItemWithIdentifier:](&v17, sel_entryForDisplayItemWithIdentifier_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_4:

  return v8;
}

- (_UIStatusBarDualCellularSignalView)dualSignalView
{
  _UIStatusBarDualCellularSignalView *dualSignalView;

  dualSignalView = self->_dualSignalView;
  if (!dualSignalView)
  {
    -[_UIStatusBarCellularCondensedItem _create_dualSignalView](self, "_create_dualSignalView");
    dualSignalView = self->_dualSignalView;
  }
  return dualSignalView;
}

- (void)_create_dualSignalView
{
  _UIStatusBarDualCellularSignalView *v3;
  _UIStatusBarDualCellularSignalView *v4;
  _UIStatusBarDualCellularSignalView *dualSignalView;
  void *v6;
  id v7;

  v3 = [_UIStatusBarDualCellularSignalView alloc];
  v4 = -[_UIStatusBarDualCellularSignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualSignalView = self->_dualSignalView;
  self->_dualSignalView = v4;

  -[_UIStatusBarDualCellularSignalView topSignalView](self->_dualSignalView, "topSignalView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfBars:", 4);

  -[_UIStatusBarDualCellularSignalView bottomSignalView](self->_dualSignalView, "bottomSignalView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfBars:", 4);

}

- (_UIStatusBarMultilineStringView)dualNameView
{
  _UIStatusBarMultilineStringView *dualNameView;

  dualNameView = self->_dualNameView;
  if (!dualNameView)
  {
    -[_UIStatusBarCellularCondensedItem _create_dualNameView](self, "_create_dualNameView");
    dualNameView = self->_dualNameView;
  }
  return dualNameView;
}

- (void)_create_dualNameView
{
  _UIStatusBarMultilineStringView *v3;
  _UIStatusBarMultilineStringView *v4;
  _UIStatusBarMultilineStringView *dualNameView;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = [_UIStatusBarMultilineStringView alloc];
  v4 = -[_UIStatusBarMultilineStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualNameView = self->_dualNameView;
  self->_dualNameView = v4;

  -[_UIStatusBarMultilineStringView setNumberOfLines:](self->_dualNameView, "setNumberOfLines:", 2);
  -[_UIStatusBarMultilineStringView stringViews](self->_dualNameView, "stringViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setFontStyle:", 2);
  objc_msgSend(v9, "setMarqueeEnabled:", 1);
  -[_UIStatusBarMultilineStringView stringViews](self->_dualNameView, "stringViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(v8, "setFontStyle:", 2);
  objc_msgSend(v8, "setMarqueeEnabled:", 1);

}

- (_UIStatusBarStringView)dualSingleLineNameView
{
  _UIStatusBarStringView *dualSingleLineNameView;

  dualSingleLineNameView = self->_dualSingleLineNameView;
  if (!dualSingleLineNameView)
  {
    -[_UIStatusBarCellularCondensedItem _create_dualSingleLineNameView](self, "_create_dualSingleLineNameView");
    dualSingleLineNameView = self->_dualSingleLineNameView;
  }
  return dualSingleLineNameView;
}

- (void)_create_dualSingleLineNameView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *dualSingleLineNameView;
  double v6;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualSingleLineNameView = self->_dualSingleLineNameView;
  self->_dualSingleLineNameView = v4;

  -[UILabel setNumberOfLines:](self->_dualSingleLineNameView, "setNumberOfLines:", 1);
  -[_UIStatusBarStringView setFontStyle:](self->_dualSingleLineNameView, "setFontStyle:", 0);
  -[UILabel setMarqueeEnabled:](self->_dualSingleLineNameView, "setMarqueeEnabled:", 1);
  LODWORD(v6) = 1132068864;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_dualSingleLineNameView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
}

- (_UIStatusBarStringView)dualSingleLineNameAndTypeView
{
  _UIStatusBarStringView *dualSingleLineNameAndTypeView;

  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  if (!dualSingleLineNameAndTypeView)
  {
    -[_UIStatusBarCellularCondensedItem _create_dualSingleLineNameAndTypeView](self, "_create_dualSingleLineNameAndTypeView");
    dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  }
  return dualSingleLineNameAndTypeView;
}

- (void)_create_dualSingleLineNameAndTypeView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *dualSingleLineNameAndTypeView;
  double v6;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  dualSingleLineNameAndTypeView = self->_dualSingleLineNameAndTypeView;
  self->_dualSingleLineNameAndTypeView = v4;

  -[UILabel setNumberOfLines:](self->_dualSingleLineNameAndTypeView, "setNumberOfLines:", 1);
  -[_UIStatusBarStringView setFontStyle:](self->_dualSingleLineNameAndTypeView, "setFontStyle:", 0);
  -[UILabel setMarqueeEnabled:](self->_dualSingleLineNameAndTypeView, "setMarqueeEnabled:", 1);
  LODWORD(v6) = 1132068864;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_dualSingleLineNameAndTypeView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
}

- (_UIStatusBarEmergencySignalView)sosSignalView
{
  _UIStatusBarEmergencySignalView *sosSignalView;

  sosSignalView = self->_sosSignalView;
  if (!sosSignalView)
  {
    -[_UIStatusBarCellularCondensedItem _create_sosSignalView](self, "_create_sosSignalView");
    sosSignalView = self->_sosSignalView;
  }
  return sosSignalView;
}

- (void)_create_sosSignalView
{
  _UIStatusBarEmergencySignalView *v3;
  _UIStatusBarEmergencySignalView *v4;
  _UIStatusBarEmergencySignalView *sosSignalView;
  id v6;

  v3 = [_UIStatusBarEmergencySignalView alloc];
  v4 = -[_UIStatusBarEmergencySignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sosSignalView = self->_sosSignalView;
  self->_sosSignalView = v4;

  -[_UIStatusBarEmergencySignalView signalView](self->_sosSignalView, "signalView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfBars:", 4);

}

- (_UIStatusBarCellularNetworkTypeView)animatedNetworkTypeView
{
  _UIStatusBarCellularNetworkTypeView *animatedNetworkTypeView;

  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  if (!animatedNetworkTypeView)
  {
    -[_UIStatusBarCellularCondensedItem _create_animatedNetworkTypeView](self, "_create_animatedNetworkTypeView");
    animatedNetworkTypeView = self->_animatedNetworkTypeView;
  }
  return animatedNetworkTypeView;
}

- (void)_create_animatedNetworkTypeView
{
  _UIStatusBarCellularNetworkTypeView *v3;
  _UIStatusBarCellularNetworkTypeView *v4;
  _UIStatusBarCellularNetworkTypeView *animatedNetworkTypeView;

  v3 = [_UIStatusBarCellularNetworkTypeView alloc];
  v4 = -[_UIStatusBarCellularNetworkTypeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  animatedNetworkTypeView = self->_animatedNetworkTypeView;
  self->_animatedNetworkTypeView = v4;

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
    -[_UIStatusBarCellularCondensedItem dualSignalView](self, "dualSignalView");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "dualNameDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[_UIStatusBarCellularCondensedItem dualNameView](self, "dualNameView");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "dualSingleLineNameDisplayIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        -[_UIStatusBarCellularCondensedItem dualSingleLineNameView](self, "dualSingleLineNameView");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "dualSingleLineNameAndTypeDisplayIdentifier");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          -[_UIStatusBarCellularCondensedItem dualSingleLineNameAndTypeView](self, "dualSingleLineNameAndTypeView");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "animatedTypeDisplayIdentifier");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v4)
          {
            -[_UIStatusBarCellularCondensedItem animatedNetworkTypeView](self, "animatedNetworkTypeView");
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "sosSignalStrengthDisplayIdentifier");
            v10 = (id)objc_claimAutoreleasedReturnValue();

            if (v10 == v4)
            {
              -[_UIStatusBarCellularCondensedItem sosSignalView](self, "sosSignalView");
              v11 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v14.receiver = self;
              v14.super_class = (Class)_UIStatusBarCellularCondensedItem;
              -[_UIStatusBarCellularItem viewForIdentifier:](&v14, sel_viewForIdentifier_, v4);
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

- (BOOL)reducesFontSize
{
  return self->_reducesFontSize;
}

- (void)setReducesFontSize:(BOOL)a3
{
  self->_reducesFontSize = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedNetworkTypeView, 0);
  objc_storeStrong((id *)&self->_sosSignalView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameAndTypeView, 0);
  objc_storeStrong((id *)&self->_dualSingleLineNameView, 0);
  objc_storeStrong((id *)&self->_dualNameView, 0);
  objc_storeStrong((id *)&self->_dualSignalView, 0);
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
    v48.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularCondensedItem;
    objc_msgSendSuper2(&v48, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3 - a4, 0, a5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dualSignalStrengthDisplayIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v9, v7 + 7);
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
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v14, v7 + 3);
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
    +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:priority:](_UIStatusBarDisplayItemPlacement, "placementWithIdentifier:priority:", v22, v7 + 5);
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
    +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:placements:](_UIStatusBarDisplayItemPlacementCellularGroup, "groupWithPriority:placements:", a4, v32);
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
    v47.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularCondensedItem;
    objc_msgSendSuper2(&v47, sel_groupWithHighPriority_lowPriority_typeClass_allowDualNetwork_, a3, a4, a5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
