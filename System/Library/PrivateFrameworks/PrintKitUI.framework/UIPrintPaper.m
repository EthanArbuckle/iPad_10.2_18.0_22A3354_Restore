@implementation UIPrintPaper

+ (UIPrintPaper)bestPaperForPageSize:(CGSize)contentSize withPapersFromArray:(NSArray *)paperList
{
  double height;
  double width;
  NSArray *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  height = contentSize.height;
  width = contentSize.width;
  v7 = paperList;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "generic4x6Paper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paperSize");
  if (vabdd_f64(width, v10) + vabdd_f64(height, v11) < 1.0)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v8, "generic3_5x5Paper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paperSize");
    if (vabdd_f64(width, v13) + vabdd_f64(height, v14) >= 1.0)
    {
      objc_msgSend(v8, "genericA6Paper");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "paperSize");
      if (vabdd_f64(width, v17) + vabdd_f64(height, v18) >= 1.0)
      {
        objc_msgSend(v8, "genericPRC32KPaper");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "paperSize");
        v15 = vabdd_f64(width, v20) + vabdd_f64(height, v21) < 1.0;

      }
      else
      {
        v15 = 1;
      }

    }
    else
    {
      v15 = 1;
    }

  }
  objc_msgSend(a1, "bestPaperForPageSize:andContentType:withPapersFromArray:", v15, v7, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIPrintPaper *)v22;
}

+ (id)bestPaperForPageSize:(CGSize)a3 andContentType:(int64_t)a4 withPapersFromArray:(id)a5
{
  double height;
  double width;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  BOOL v29;
  double v30;
  BOOL v31;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  unint64_t v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  void *j;
  void *v54;
  double v55;
  double v56;
  id v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  _BOOL4 v75;
  double v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v94;
  char v95;
  void *v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t m;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v109;
  void *v110;
  char v111;
  id v112;
  id v113;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
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
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  height = a3.height;
  width = a3.width;
  v145 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4 & 0xFFFFFFFFFFFFFFFDLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
  v116 = v10;
  if (!v11)
  {

    v13 = 0;
    v117 = 0;
    v118 = 0;
    v17 = 3.40282347e38;
    goto LABEL_50;
  }
  v12 = v11;
  v117 = 0;
  v118 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v133;
  v15 = 3.40282347e38;
  v16 = 3.40282347e38;
  v17 = 3.40282347e38;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v133 != v14)
        objc_enumerationMutation(v10);
      v19 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
      objc_msgSend(v19, "_pkPaper");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "paperSize");
      v22 = v21;
      v24 = v23;
      if (objc_msgSend(v20, "isRoll"))
      {
        if (width > 0.0)
        {
          objc_msgSend(v20, "paperSize");
          if (objc_msgSend(v20, "maxCutLength") == (unint64_t)v25)
          {
            v38 = height / width;
            if (v9 == 1)
            {
              objc_msgSend(v19, "printableRect");
              v42 = v38 * v41;
              v43 = objc_msgSend(v20, "topMarginInPoints");
              v40 = v42 + (double)(unint64_t)(objc_msgSend(v20, "bottomMarginInPoints") + v43);
            }
            else
            {
              objc_msgSend(v19, "paperSize");
              v40 = v38 * v39;
            }
            objc_msgSend(v19, "_pkPaper");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "cutToLength:", v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_updatePKPaper:", v45);

            goto LABEL_47;
          }
        }
      }
      v26 = vabdd_f64(v22, width) + vabdd_f64(v24, height);
      if (v26 == 0.0)
      {
        v27 = v19;

        objc_msgSend(v27, "printableRect");
        v29 = v22 == v28;
        if (v24 != v30)
          v29 = 0;
        v17 = 0.0;
        if (v9 != 1)
        {
          if (!v29)
            goto LABEL_40;
          goto LABEL_29;
        }
        if (!v29)
        {
LABEL_29:
          v13 = v27;
          goto LABEL_36;
        }
LABEL_40:
        objc_msgSend(v115, "addObject:", v27);
        v13 = v27;
LABEL_47:

        goto LABEL_48;
      }
      if (v26 < 1.0)
      {
        v46 = v19;

        objc_msgSend(v46, "printableRect");
        goto LABEL_46;
      }
      v31 = v22 < width || v24 < height;
      if (v31)
      {
        if (v22 > width || v24 > height)
        {
          v34 = v117;
          v33 = v118;
          v35 = v15;
          v36 = v19;
          if (v26 >= v16)
            goto LABEL_35;
        }
        else
        {
          v33 = v117;
          v36 = v118;
          v31 = v26 < v15;
          v35 = v26;
          v26 = v16;
          v34 = v19;
          if (!v31)
            goto LABEL_35;
        }
        v37 = v19;

        v15 = v35;
        v16 = v26;
        v117 = v34;
        v118 = v36;
LABEL_35:
        v10 = v116;
        goto LABEL_36;
      }
      if (v26 < v17)
      {
        v46 = v19;

LABEL_46:
        v17 = v26;
        v13 = v46;
        goto LABEL_47;
      }
LABEL_36:

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v132, v143, 16);
    if (v12)
      continue;
    break;
  }
LABEL_48:

  if (!v13 || v17 > 1.0)
  {
LABEL_50:
    v119 = v10;
    v47 = 0;
    do
    {
      if (vabdd_f64(width, SubstitutionPaperForPageSize_subs[4 * v47])
         + vabdd_f64(height, SubstitutionPaperForPageSize_subs[4 * v47 + 1]) >= 1.0)
      {
        v49 = 0;
      }
      else
      {
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v48 = v119;
        v49 = (id)objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v136, v144, 16);
        if (v49)
        {
          v50 = v13;
          v51 = v9;
          v52 = *(_QWORD *)v137;
          while (2)
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(_QWORD *)v137 != v52)
                objc_enumerationMutation(v48);
              v54 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v54, "paperSize");
              if (vabdd_f64(v55, SubstitutionPaperForPageSize_subs[4 * v47 + 2])
                 + vabdd_f64(v56, SubstitutionPaperForPageSize_subs[4 * v47 + 3]) < 1.0)
              {
                v49 = v54;
                goto LABEL_63;
              }
            }
            v49 = (id)objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v136, v144, 16);
            if (v49)
              continue;
            break;
          }
LABEL_63:
          v9 = v51;
          v13 = v50;
        }

      }
      if (v47 > 4)
        break;
      ++v47;
    }
    while (!v49);

    if (v49)
    {
      v57 = v49;

      v17 = 0.0;
      v13 = v57;
    }
    v10 = v116;

  }
  if (!v13 || v17 > 1.0)
  {
    +[UIPrintPaper _defaultPaperForOutputType:](UIPrintPaper, "_defaultPaperForOutputType:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "paperSize");
    v60 = v59;
    v62 = v61;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v63 = v10;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v129;
      while (2)
      {
        for (k = 0; k != v65; ++k)
        {
          if (*(_QWORD *)v129 != v66)
            objc_enumerationMutation(v63);
          v68 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
          objc_msgSend(v68, "paperSize");
          v70 = v69;
          v72 = v71;
          v73 = vabdd_f64(v69, v60) + vabdd_f64(v71, v62);
          if (v73 == 0.0)
          {
            objc_msgSend(v68, "printableRect");
            v75 = v70 == v74;
            if (v72 != v76)
              v75 = 0;
            if ((((v9 != 1) ^ v75) & 1) != 0)
              goto LABEL_85;
          }
          if (v73 < 1.0)
          {
LABEL_85:
            v77 = v68;

            v13 = v77;
            goto LABEL_86;
          }
        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
        if (v65)
          continue;
        break;
      }
LABEL_86:
      v10 = v116;
    }

    if (!v13)
    {
      v78 = v118;
      if (!v118)
        v78 = v117;
      v13 = v78;
      if (!v13)
        v13 = v58;
    }

  }
  objc_msgSend(v13, "mediaType");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (v9 == 1)
  {
    if ((objc_msgSend(v79, "containsString:", CFSTR("glossy")) & 1) != 0)
      goto LABEL_130;
    objc_msgSend(v13, "mediaType");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "containsString:", CFSTR("matte"));

    if ((v97 & 1) == 0)
    {
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v80 = v10;
      v98 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
      if (v98)
      {
        v99 = v98;
        v100 = *(_QWORD *)v121;
        while (2)
        {
          for (m = 0; m != v99; ++m)
          {
            if (*(_QWORD *)v121 != v100)
              objc_enumerationMutation(v80);
            v86 = *(id *)(*((_QWORD *)&v120 + 1) + 8 * m);
            if (v86 != v13)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * m), "paperSize");
              v103 = v102;
              v105 = v104;
              objc_msgSend(v13, "paperSize");
              if (v103 == v107 && v105 == v106)
              {
                objc_msgSend(v86, "mediaType");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v109, "containsString:", CFSTR("glossy")))
                {

                  goto LABEL_129;
                }
                objc_msgSend(v86, "mediaType");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v111 = objc_msgSend(v110, "containsString:", CFSTR("matte"));

                if ((v111 & 1) != 0)
                  goto LABEL_129;
              }
            }
          }
          v99 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v120, v140, 16);
          if (v99)
            continue;
          break;
        }
LABEL_127:
        v10 = v116;
      }
LABEL_130:

    }
  }
  else
  {
    v81 = objc_msgSend(v79, "isEqualToString:", CFSTR("stationery"));

    if ((v81 & 1) == 0)
    {
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v80 = v10;
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v125;
LABEL_97:
        v85 = 0;
        while (1)
        {
          if (*(_QWORD *)v125 != v84)
            objc_enumerationMutation(v80);
          v86 = *(id *)(*((_QWORD *)&v124 + 1) + 8 * v85);
          if (v86 != v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * v85), "paperSize");
            v88 = v87;
            v90 = v89;
            objc_msgSend(v13, "paperSize");
            if (v88 == v92 && v90 == v91)
            {
              objc_msgSend(v86, "mediaType");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = objc_msgSend(v94, "isEqualToString:", CFSTR("stationery"));

              if ((v95 & 1) != 0)
                break;
            }
          }
          if (v83 == ++v85)
          {
            v83 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v124, v141, 16);
            if (v83)
              goto LABEL_97;
            goto LABEL_127;
          }
        }
LABEL_129:
        v112 = v86;

        v10 = v116;
        v80 = v116;
        v13 = v112;
      }
      goto LABEL_130;
    }
  }
  v113 = v13;

  return v113;
}

+ (id)_readyPaperListForPrinter:(id)a3 withDuplexMode:(int64_t)a4 forContentType:(int64_t)a5 contentSize:(CGSize)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  UIPrintPaper *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  height = a6.height;
  width = a6.width;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    objc_msgSend(v10, "papersForPhotoWithSize:", width, height);
  else
    objc_msgSend(v10, "papersForDocumentWithSize:andDuplex:", a4 != 0, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v20 = [UIPrintPaper alloc];
        v21 = -[UIPrintPaper _initWithPrintKitPaper:](v20, "_initWithPrintKitPaper:", v19, (_QWORD)v23);
        objc_msgSend(v13, "addObject:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  return v13;
}

+ (id)_readyDocumentPaperListForPrinter:(id)a3 withDuplexMode:(int64_t)a4 contentSize:(CGSize)a5 scaleUpForRoll:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  UIPrintPaper *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "papersForDocumentWithSize:scaleUpOnRoll:andDuplex:", v6, a4 != 0, width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v20 = [UIPrintPaper alloc];
        v21 = -[UIPrintPaper _initWithPrintKitPaper:](v20, "_initWithPrintKitPaper:", v19, (_QWORD)v23);
        objc_msgSend(v13, "addObject:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  return v13;
}

+ (id)_defaultPKPaperForOuptutType:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (!_defaultPKPaperForOuptutType____letterCountries)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("US"), CFSTR("CA"), CFSTR("MX"), CFSTR("CR"), CFSTR("PH"), CFSTR("CL"), CFSTR("CO"), 0);
    v5 = (void *)_defaultPKPaperForOuptutType____letterCountries;
    _defaultPKPaperForOuptutType____letterCountries = v4;

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("JP")))
      objc_msgSend(MEMORY[0x1E0D80A58], "generic3_5x5Paper");
    else
      objc_msgSend(MEMORY[0x1E0D80A58], "generic4x6Paper");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend((id)_defaultPKPaperForOuptutType____letterCountries, "containsObject:", v7) & 1) != 0 || !v7)
  {
    objc_msgSend(MEMORY[0x1E0D80A58], "genericLetterPaper");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80A58], "genericA4Paper");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)_genericPaperListForOutputType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    objc_msgSend(v4, "genericA6Paper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generic4x6Paper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "generic3_5x5Paper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericPRC32KPaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericHagakiPaper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericBorderlessWithName:", CFSTR("na_5x7_5x7in"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericBorderlessWithName:", CFSTR("na_govt-letter_8x10in"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericBorderlessWithName:", CFSTR("om_small-photo_100x150mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericBorderlessWithName:", CFSTR("om_large-photo_200x300"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "genericA4Paper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericLetterPaper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericLegalPaper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericWithName:", CFSTR("na_ledger_11x17in"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericWithName:", CFSTR("iso_a3_297x420mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericWithName:", CFSTR("iso_b5_176x250mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "genericWithName:", CFSTR("jis_b5_182x257mm"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = -[UIPrintPaper _initWithPrintKitPaper:]([UIPrintPaper alloc], "_initWithPrintKitPaper:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  return v17;
}

+ (id)_defaultPaperListForOutputType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  UIPrintPaper *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    objc_msgSend(MEMORY[0x1E0D80A58], "photoPapers");
  else
    objc_msgSend(MEMORY[0x1E0D80A58], "documentPapers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPrintPaper _defaultPKPaperForOuptutType:](UIPrintPaper, "_defaultPKPaperForOuptutType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = [UIPrintPaper alloc];
        v14 = -[UIPrintPaper _initWithPrintKitPaper:](v13, "_initWithPrintKitPaper:", v12, (_QWORD)v16);
        if (objc_msgSend(v5, "isEqual:", v12))
          objc_msgSend(v6, "insertObject:atIndex:", v14, 0);
        else
          objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)_defaultPaperForOutputType:(int64_t)a3
{
  void *v3;
  id v4;

  +[UIPrintPaper _defaultPKPaperForOuptutType:](UIPrintPaper, "_defaultPKPaperForOuptutType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIPrintPaper _initWithPrintKitPaper:]([UIPrintPaper alloc], "_initWithPrintKitPaper:", v3);

  return v4;
}

- (id)_initWithPrintKitPaper:(id)a3
{
  id v5;
  UIPrintPaper *v6;
  UIPrintPaper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIPrintPaper;
  v6 = -[UIPrintPaper init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_internal, a3);
    v7->_scalingFactor = 1.0;
  }

  return v7;
}

- (void)_updatePKPaper:(id)a3
{
  id v5;
  id *p_internal;
  id internal;
  id v8;

  v5 = a3;
  internal = self->_internal;
  p_internal = &self->_internal;
  if (internal != v5)
  {
    v8 = v5;
    objc_storeStrong(p_internal, a3);
    v5 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id internal;
  void *v4;

  internal = self->_internal;
  objc_msgSend(a3, "_pkPaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(internal) = objc_msgSend(internal, "isEqual:", v4);

  return (char)internal;
}

- (CGSize)paperSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int paperOrientation;
  double v12;
  CGSize result;

  objc_msgSend(self->_internal, "paperSize");
  v4 = v3;
  v6 = v5;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v8 = v4 / v7;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v10 = v6 / v9;
  paperOrientation = self->_paperOrientation;
  if (paperOrientation)
    v12 = v6 / v9;
  else
    v12 = v8;
  if (paperOrientation)
    v10 = v8;
  result.height = v10;
  result.width = v12;
  return result;
}

- (CGSize)unAdjustedPaperSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(self->_internal, "paperSize");
  v4 = v3;
  v6 = v5;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v8 = v4 / v7;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v10 = v6 / v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGRect)unAdjustedPrintableRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(self->_internal, "imageableAreaRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)printableRect
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int paperOrientation;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  objc_msgSend(self->_internal, "paperSize");
  v4 = v3;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v6 = v5;
  objc_msgSend(self->_internal, "paperSize");
  v8 = v7;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v10 = v9;
  objc_msgSend(self->_internal, "imageableAreaRect");
  v12 = v11;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v14 = v12 / v13;
  objc_msgSend(self->_internal, "imageableAreaRect");
  v16 = v15;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v18 = v16 / v17;
  objc_msgSend(self->_internal, "imageableAreaRect");
  v20 = v19;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  v22 = v20 / v21;
  objc_msgSend(self->_internal, "imageableAreaRect");
  v24 = v23;
  -[UIPrintPaper scalingFactor](self, "scalingFactor");
  paperOrientation = self->_paperOrientation;
  v27 = v24 / v25;
  if (paperOrientation == 2)
  {
    v29 = v4 / v6 - v14 - v22;
    v28 = v22;
  }
  else if (paperOrientation == 1)
  {
    v18 = v8 / v10 - v18 - v27;
    v28 = v22;
    v29 = v14;
  }
  else
  {
    v28 = v24 / v25;
    v27 = v22;
    v29 = v18;
    v18 = v14;
  }
  v30 = v18;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v29;
  result.origin.x = v30;
  return result;
}

- (CGRect)_printableRectForDuplex:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  CGFloat v6;
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
  double MinX;
  double v18;
  double v19;
  double MinY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v3 = a3;
  -[UIPrintPaper printableRect](self, "printableRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v3)
  {
    -[UIPrintPaper paperSize](self, "paperSize");
    v14 = v13;
    v16 = v15;
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    MinX = CGRectGetMinX(v26);
    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    v18 = v14 - CGRectGetMaxX(v27);
    if (MinX >= v18)
      v19 = MinX;
    else
      v19 = v18;
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    MinY = CGRectGetMinY(v28);
    v29.origin.x = v6;
    v29.origin.y = v8;
    v29.size.width = v10;
    v29.size.height = v12;
    v21 = v16 - CGRectGetMaxY(v29);
    if (MinY >= v21)
      v8 = MinY;
    else
      v8 = v21;
    v10 = v14 + v19 * -2.0;
    v12 = v16 + v8 * -2.0;
    v6 = v19;
  }
  v22 = v6;
  v23 = v8;
  v24 = v10;
  v25 = v12;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)_pkPaper
{
  return self->_internal;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIPrintPaper _pkPaper](self, "_pkPaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<UIPrintPaper:%p %@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_localizedName
{
  return (id)objc_msgSend(self->_internal, "localizedName");
}

- (id)_localizedMediaTypeName
{
  return (id)objc_msgSend(self->_internal, "mediaTypeName");
}

- (id)_keywordForPDFMetadata
{
  return 0;
}

- (void)_setPaperOrientation:(int)a3
{
  self->_paperOrientation = a3;
}

- (int)_paperOrientation
{
  return self->_paperOrientation;
}

- (id)mediaType
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPrintPaper _pkPaper](self, "_pkPaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("media-type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

- (CGRect)printRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
