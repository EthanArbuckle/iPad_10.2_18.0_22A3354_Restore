@implementation WKWallpaperAdjustmentTraitOffset

- (WKWallpaperAdjustmentTraitOffset)initWithAttributeDictionary:(id)a3
{
  id v4;
  WKWallpaperAdjustmentTraitOffset *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  float v40;
  float v41;
  float v42;
  float v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  float v53;
  float v54;
  float v55;
  float v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  float v69;
  double v70;
  float v71;
  double v72;
  float v73;
  float v74;
  float v75;
  float v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  float v86;
  float v87;
  float v88;
  float v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  float v99;
  float v100;
  float v101;
  float v102;
  double v104;
  objc_super v105;

  v4 = a3;
  v105.receiver = self;
  v105.super_class = (Class)WKWallpaperAdjustmentTraitOffset;
  v5 = -[WKWallpaperAdjustmentTraitOffset init](&v105, sel_init);
  if (v5)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("screenScaleModeZoomed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = v7;
    v12 = v6;
    v13 = v7;
    v14 = v6;
    if (v10)
    {
      objc_opt_class();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interfaceOrientationAny"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;

      if (v16)
      {
        objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interfaceOrientationAny"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("x"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interfaceOrientationAny"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("y"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
        v24 = v23;

        objc_msgSend(v20, "floatValue");
        v14 = v25;
        objc_msgSend(v24, "floatValue");
        v13 = v26;
        objc_msgSend(v20, "floatValue");
        v28 = v27;

        v12 = v28;
        objc_msgSend(v24, "floatValue");
        v30 = v29;

        v11 = v30;
      }
      else
      {
        objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interfaceOrientationLandscape"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;
        v33 = v32;

        v13 = v7;
        v14 = v6;
        if (v33)
        {
          objc_opt_class();
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("x"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v35 = v34;
          else
            v35 = 0;
          v36 = v35;

          objc_opt_class();
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("y"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v38 = v37;
          else
            v38 = 0;
          v39 = v38;

          objc_msgSend(v36, "floatValue");
          v41 = v40;

          v14 = v41;
          objc_msgSend(v39, "floatValue");
          v43 = v42;

          v13 = v43;
        }
        objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("interfaceOrientationPortrait"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v45 = v44;
        else
          v45 = 0;
        v46 = v45;

        v11 = v7;
        v12 = v6;
        if (v46)
        {
          objc_opt_class();
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("x"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v48 = v47;
          else
            v48 = 0;
          v49 = v48;

          objc_opt_class();
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("y"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v51 = v50;
          else
            v51 = 0;
          v52 = v51;

          objc_msgSend(v49, "floatValue");
          v54 = v53;

          v12 = v54;
          objc_msgSend(v52, "floatValue");
          v56 = v55;

          v11 = v56;
        }

      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("screenScaleModeMoreSpace"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v13;
    if (v57)
    {
      objc_opt_class();
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("interfaceOrientationAny"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v59 = v58;
      else
        v59 = 0;

      v60 = v14;
      if (v59)
      {
        objc_opt_class();
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("interfaceOrientationAny"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("x"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v63 = v62;
        else
          v63 = 0;
        v64 = v63;

        objc_opt_class();
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("interfaceOrientationAny"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("y"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v67 = v66;
        else
          v67 = 0;
        v68 = v67;

        objc_msgSend(v64, "floatValue");
        v70 = v69;
        objc_msgSend(v68, "floatValue");
        v72 = v71;
        objc_msgSend(v64, "floatValue");
        v74 = v73;

        v6 = v74;
        objc_msgSend(v68, "floatValue");
        v76 = v75;

        v7 = v76;
      }
      else
      {
        objc_opt_class();
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("interfaceOrientationLandscape"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v78 = v77;
        else
          v78 = 0;
        v79 = v78;

        v72 = v7;
        v70 = v6;
        if (v79)
        {
          objc_opt_class();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("x"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v81 = v80;
          else
            v81 = 0;
          v82 = v81;

          objc_opt_class();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("y"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v84 = v83;
          else
            v84 = 0;
          v85 = v84;

          objc_msgSend(v82, "floatValue");
          v87 = v86;

          v70 = v87;
          objc_msgSend(v85, "floatValue");
          v89 = v88;

          v72 = v89;
        }
        objc_opt_class();
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("interfaceOrientationPortrait"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v91 = v90;
        else
          v91 = 0;
        v92 = v91;

        if (v92)
        {
          objc_opt_class();
          objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("x"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v94 = v93;
          else
            v94 = 0;
          v95 = v94;

          objc_opt_class();
          objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("y"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v97 = v96;
          else
            v97 = 0;
          v98 = v97;

          objc_msgSend(v95, "floatValue");
          v100 = v99;

          v6 = v100;
          objc_msgSend(v98, "floatValue");
          v102 = v101;

          v7 = v102;
        }

      }
    }
    else
    {
      v60 = v14;
      v72 = v7;
      v70 = v6;
    }
    v5->_zoomedModeOffsetLandscape.x = v60;
    v5->_zoomedModeOffsetLandscape.y = v104;
    v5->_zoomedModeOffsetPortrait.x = v12;
    v5->_zoomedModeOffsetPortrait.y = v11;
    v5->_moreSpaceModeOffsetLandscape.x = v70;
    v5->_moreSpaceModeOffsetLandscape.y = v72;
    v5->_moreSpaceModeOffsetPortrait.x = v6;
    v5->_moreSpaceModeOffsetPortrait.y = v7;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WKWallpaperAdjustmentTraitOffset propertyListRepresentation](self, "propertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAttributeDictionary:", v5);

  return v6;
}

- (CGPoint)offsetForCurrentScreenScaleModeWithInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[WKWallpaperAdjustmentTraitOffset overrideScreenScaleMode](self, "overrideScreenScaleMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[WKWallpaperAdjustmentTraitOffset overrideScreenScaleMode](self, "overrideScreenScaleMode");
  else
    WKCurrentScreenScaleMode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("screenScaleModeZoomed")))
  {
    if ((unint64_t)(a3 - 1) > 1)
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetLandscape](self, "zoomedModeOffsetLandscape");
    else
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
LABEL_13:
    v9 = v7;
    v10 = v8;
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("screenScaleModeMoreSpace")))
  {
    if ((unint64_t)(a3 - 1) > 1)
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetLandscape](self, "moreSpaceModeOffsetLandscape");
    else
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait");
    goto LABEL_13;
  }
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_14:

  v11 = v9;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)propertyListRepresentation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v11;
  double v12;
  double v14;
  double v15;
  void *v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  BOOL v56;
  double v57;
  double v58;
  BOOL v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  const __CFString *v96;
  void *v97;
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  const __CFString *v104;
  _QWORD v105[3];

  v105[1] = *MEMORY[0x1E0C80C00];
  -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetLandscape](self, "zoomedModeOffsetLandscape");
  v5 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (*MEMORY[0x1E0C9D538] == v6 && v4 == v3)
  {
    -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
    if (v5 == v9 && v4 == v8)
    {
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetLandscape](self, "moreSpaceModeOffsetLandscape");
      if (v5 == v12 && v4 == v11)
      {
        -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait");
        if (v5 == v15 && v4 == v14)
        {
          v17 = 0;
          return v17;
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetLandscape](self, "zoomedModeOffsetLandscape");
  v20 = v5 == v19 && v4 == v18;
  if (!v20
    || ((-[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait"), v5 == v22)
      ? (v23 = v4 == v21)
      : (v23 = 0),
        !v23))
  {
    -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
    v25 = v24;
    v27 = v26;
    -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetLandscape](self, "zoomedModeOffsetLandscape");
    if (v25 == v29 && v27 == v28)
    {
      v104 = CFSTR("interfaceOrientationAny");
      v102[0] = CFSTR("x");
      v30 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
      objc_msgSend(v30, "numberWithDouble:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = v31;
      v102[1] = CFSTR("y");
      v32 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
      objc_msgSend(v32, "numberWithDouble:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v103[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v105[0] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetLandscape](self, "zoomedModeOffsetLandscape");
      if (v5 != v38 || v4 != v37)
      {
        v100[0] = CFSTR("x");
        v40 = (void *)MEMORY[0x1E0CB37E8];
        -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetLandscape](self, "zoomedModeOffsetLandscape");
        objc_msgSend(v40, "numberWithDouble:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v100[1] = CFSTR("y");
        v101[0] = v41;
        v42 = (void *)MEMORY[0x1E0CB37E8];
        -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetLandscape](self, "zoomedModeOffsetLandscape");
        objc_msgSend(v42, "numberWithDouble:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v101[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "na_safeSetObject:forKey:", v45, CFSTR("interfaceOrientationLandscape"));
      }
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
      if (v5 == v47 && v4 == v46)
        goto LABEL_43;
      v98[0] = CFSTR("x");
      v49 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
      objc_msgSend(v49, "numberWithDouble:");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v98[1] = CFSTR("y");
      v99[0] = v50;
      v51 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset zoomedModeOffsetPortrait](self, "zoomedModeOffsetPortrait");
      objc_msgSend(v51, "numberWithDouble:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "na_safeSetObject:forKey:", v31, CFSTR("interfaceOrientationPortrait"));
    }

LABEL_43:
    objc_msgSend(v17, "na_safeSetObject:forKey:", v36, CFSTR("screenScaleModeZoomed"));

  }
  -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetLandscape](self, "moreSpaceModeOffsetLandscape");
  v56 = v5 == v55 && v4 == v54;
  if (!v56
    || ((-[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait"), v5 == v58)
      ? (v59 = v4 == v57)
      : (v59 = 0),
        !v59))
  {
    -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait");
    v61 = v60;
    v63 = v62;
    -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetLandscape](self, "moreSpaceModeOffsetLandscape");
    if (v61 == v65 && v63 == v64)
    {
      v96 = CFSTR("interfaceOrientationAny");
      v94[0] = CFSTR("x");
      v66 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait");
      objc_msgSend(v66, "numberWithDouble:");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = CFSTR("y");
      v95[0] = v67;
      v68 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait");
      objc_msgSend(v68, "numberWithDouble:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v95[1] = v70;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v71;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetLandscape](self, "moreSpaceModeOffsetLandscape");
      if (v5 != v74 || v4 != v73)
      {
        v92[0] = CFSTR("x");
        v76 = (void *)MEMORY[0x1E0CB37E8];
        -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetLandscape](self, "moreSpaceModeOffsetLandscape");
        objc_msgSend(v76, "numberWithDouble:");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v92[1] = CFSTR("y");
        v93[0] = v77;
        v78 = (void *)MEMORY[0x1E0CB37E8];
        -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetLandscape](self, "moreSpaceModeOffsetLandscape");
        objc_msgSend(v78, "numberWithDouble:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v93[1] = v80;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v72, "na_safeSetObject:forKey:", v81, CFSTR("interfaceOrientationLandscape"));
      }
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait");
      if (v5 == v83 && v4 == v82)
        goto LABEL_65;
      v84 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait", CFSTR("x"));
      objc_msgSend(v84, "numberWithDouble:");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = CFSTR("y");
      v91[0] = v85;
      v86 = (void *)MEMORY[0x1E0CB37E8];
      -[WKWallpaperAdjustmentTraitOffset moreSpaceModeOffsetPortrait](self, "moreSpaceModeOffsetPortrait");
      objc_msgSend(v86, "numberWithDouble:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v91[1] = v88;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v72, "na_safeSetObject:forKey:", v67, CFSTR("interfaceOrientationPortrait"));
    }

LABEL_65:
    objc_msgSend(v17, "na_safeSetObject:forKey:", v72, CFSTR("screenScaleModeMoreSpace"));

  }
  return v17;
}

id __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke()
{
  if (WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_token_0, &__block_literal_global_7_1);
  return (id)WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_object_0;
}

void __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_object_0;
  WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_object_0 = v0;

}

id __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_12_2);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_14_0);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_15_1);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_16_2);
  objc_msgSend(v0, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a2, "zoomedModeOffsetPortrait");
  return objc_msgSend(v2, "valueWithCGPoint:");
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a2, "zoomedModeOffsetLandscape");
  return objc_msgSend(v2, "valueWithCGPoint:");
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a2, "moreSpaceModeOffsetPortrait");
  return objc_msgSend(v2, "valueWithCGPoint:");
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a2, "moreSpaceModeOffsetLandscape");
  return objc_msgSend(v2, "valueWithCGPoint:");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (id)wk_descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__WKWallpaperAdjustmentTraitOffset_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6EF94B0;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __57__WKWallpaperAdjustmentTraitOffset_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "descriptionBuilderBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[WKWallpaperAdjustmentTraitOffset wk_descriptionBuilder](self, "wk_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)descriptionBuilderBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__WKWallpaperAdjustmentTraitOffset_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6EF94D8;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __59__WKWallpaperAdjustmentTraitOffset_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  CGPoint v9;
  CGPoint v10;
  CGPoint v11;
  CGPoint v12;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "zoomedModeOffsetPortrait");
  NSStringFromCGPoint(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("zoomedModeOffsetPortrait"));

  objc_msgSend(WeakRetained, "zoomedModeOffsetLandscape");
  NSStringFromCGPoint(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("zoomedModeOffsetLandscape"));

  objc_msgSend(WeakRetained, "moreSpaceModeOffsetPortrait");
  NSStringFromCGPoint(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("moreSpaceModeOffsetPortrait"));

  objc_msgSend(WeakRetained, "moreSpaceModeOffsetLandscape");
  NSStringFromCGPoint(v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("moreSpaceModeOffsetLandscape"));

}

- (CGPoint)zoomedModeOffsetLandscape
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomedModeOffsetLandscape.x;
  y = self->_zoomedModeOffsetLandscape.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setZoomedModeOffsetLandscape:(CGPoint)a3
{
  self->_zoomedModeOffsetLandscape = a3;
}

- (CGPoint)zoomedModeOffsetPortrait
{
  double x;
  double y;
  CGPoint result;

  x = self->_zoomedModeOffsetPortrait.x;
  y = self->_zoomedModeOffsetPortrait.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setZoomedModeOffsetPortrait:(CGPoint)a3
{
  self->_zoomedModeOffsetPortrait = a3;
}

- (CGPoint)moreSpaceModeOffsetLandscape
{
  double x;
  double y;
  CGPoint result;

  x = self->_moreSpaceModeOffsetLandscape.x;
  y = self->_moreSpaceModeOffsetLandscape.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMoreSpaceModeOffsetLandscape:(CGPoint)a3
{
  self->_moreSpaceModeOffsetLandscape = a3;
}

- (CGPoint)moreSpaceModeOffsetPortrait
{
  double x;
  double y;
  CGPoint result;

  x = self->_moreSpaceModeOffsetPortrait.x;
  y = self->_moreSpaceModeOffsetPortrait.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMoreSpaceModeOffsetPortrait:(CGPoint)a3
{
  self->_moreSpaceModeOffsetPortrait = a3;
}

- (NSString)overrideScreenScaleMode
{
  return self->_overrideScreenScaleMode;
}

- (void)setOverrideScreenScaleMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideScreenScaleMode, 0);
}

@end
