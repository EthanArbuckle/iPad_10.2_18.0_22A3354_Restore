@implementation SXTextContrastDarkModePolicyException

- (SXTextContrastDarkModePolicyException)initWithComponentStyleMerger:(id)a3 componentTextStyleMerger:(id)a4
{
  id v7;
  id v8;
  SXTextContrastDarkModePolicyException *v9;
  SXTextContrastDarkModePolicyException *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXTextContrastDarkModePolicyException;
  v9 = -[SXTextContrastDarkModePolicyException init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_componentStyleMerger, a3);
    objc_storeStrong((id *)&v10->_componentTextStyleMerger, a4);
  }

  return v10;
}

- (int64_t)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "analysis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentTextStylesForComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[SXTextContrastDarkModePolicyException opaqueComponentStyleForComponent:DOM:](self, "opaqueComponentStyleForComponent:DOM:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fill");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = 0;
    else
      v14 = -1;

  }
  else
  {
    v14 = -1;
  }

  return v14;
}

- (int64_t)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  uint64_t i;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  unint64_t m;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t n;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  float v106;
  double v107;
  void *v108;
  float v109;
  double v110;
  double v111;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  id obj;
  id obja;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "analysis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentTextStylesForComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[SXTextContrastDarkModePolicyException opaqueComponentStyleForComponent:DOM:](self, "opaqueComponentStyleForComponent:DOM:", v6, v7);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "fill");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = 0;
LABEL_58:

      goto LABEL_59;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "text");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      -[SXTextContrastDarkModePolicyException componentTextStyleForTextComponent:DOM:](self, "componentTextStyleForTextComponent:DOM:", v6, v7);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = -1;
        goto LABEL_58;
      }
      objc_msgSend(v6, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "length");

      -[SXTextContrastDarkModePolicyException componentTextStyleForButtonComponent:DOM:](self, "componentTextStyleForButtonComponent:DOM:", v6, v7);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v114 = (void *)v16;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "relativeLuminance");
    v22 = v21;

    objc_msgSend(v115, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "relativeLuminance");
    v25 = v24;

    v124 = v18;
    if (v15)
    {
      for (i = 0; i != v15; ++i)
      {
        objc_msgSend(v18, "addObject:", &unk_24D6FEF38);
        objc_msgSend(v115, "backgroundColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v25;
        if (v27
          || (objc_msgSend(v7, "documentStyle", v25),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v29, "backgroundColor"),
              v30 = (void *)objc_claimAutoreleasedReturnValue(),
              v30,
              v29,
              v28 = v22,
              v30))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "setObject:atIndexedSubscript:", v31, i);

        }
        v18 = v124;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "textColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "relativeLuminance");
    v36 = v35;

    objc_msgSend(v114, "backgroundColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "relativeLuminance");
    v39 = v38;

    objc_msgSend(v114, "textColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "invertedLightness");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "relativeLuminance");
    v43 = v42;

    if (v15)
    {
      for (j = 0; j != v15; ++j)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:atIndexedSubscript:", v45, j);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:atIndexedSubscript:", v46, j);

        objc_msgSend(v114, "backgroundColor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:atIndexedSubscript:", v48, j);

        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v120 = v7;
      v113 = v6;
      v49 = v6;
      objc_msgSend(v114, "linkStyle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v119 = v49;
      if (v50)
      {
        objc_msgSend(v114, "linkStyle");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "textColor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "relativeLuminance");
        v54 = v53;

        objc_msgSend(v51, "textColor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "invertedLightness");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "relativeLuminance");
        v58 = v57;

        objc_msgSend(v51, "backgroundColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "relativeLuminance");
        v61 = v60;

        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        objc_msgSend(v49, "additions");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v130;
          do
          {
            for (k = 0; k != v63; ++k)
            {
              if (*(_QWORD *)v130 != v64)
                objc_enumerationMutation(obj);
              v66 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * k);
              for (m = objc_msgSend(v66, "range"); ; ++m)
              {
                v68 = objc_msgSend(v66, "range");
                if (m >= v68 + v69)
                  break;
                objc_msgSend(v51, "textColor");
                v70 = (void *)objc_claimAutoreleasedReturnValue();

                if (v70)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setObject:atIndexedSubscript:", v71, m);

                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v58);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "setObject:atIndexedSubscript:", v72, m);

                }
                objc_msgSend(v51, "backgroundColor");
                v73 = (void *)objc_claimAutoreleasedReturnValue();

                if (v73)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v61);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v124, "setObject:atIndexedSubscript:", v74, m);

                }
              }
            }
            v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v134, 16);
          }
          while (v63);
        }

        v18 = v124;
        v49 = v119;
      }
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      objc_msgSend(v49, "inlineTextStyles");
      v116 = (id)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v125, v133, 16);
      if (v121)
      {
        v117 = v32;
        v118 = *(_QWORD *)v126;
        do
        {
          for (n = 0; n != v121; ++n)
          {
            if (*(_QWORD *)v126 != v118)
              objc_enumerationMutation(v116);
            v76 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * n);
            objc_msgSend(v120, "analysis");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "namespacedObjectReferences");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "textStyle");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "identifier");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "namespacedTextStyleIdentifierForIdentifier:component:", v79, v80);
            v81 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v120, "textStyles");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            obja = (id)v81;
            objc_msgSend(v82, "objectForKey:", v81);
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v83, "textColor");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "relativeLuminance");
            v86 = v85;

            objc_msgSend(v83, "textColor");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "invertedLightness");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "relativeLuminance");
            v90 = v89;

            objc_msgSend(v83, "backgroundColor");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "relativeLuminance");
            v93 = v92;

            v94 = objc_msgSend(v76, "range");
            v95 = objc_msgSend(v76, "range");
            v18 = v124;
            v32 = v117;
            if (v94 < v95 + v96)
            {
              do
              {
                objc_msgSend(v83, "textColor");
                v97 = (void *)objc_claimAutoreleasedReturnValue();

                if (v97)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v86);
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "setObject:atIndexedSubscript:", v98, v94);

                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v90);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "setObject:atIndexedSubscript:", v99, v94);

                }
                objc_msgSend(v83, "backgroundColor");
                v100 = (void *)objc_claimAutoreleasedReturnValue();

                if (v100)
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v93);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v124, "setObject:atIndexedSubscript:", v101, v94);

                }
                ++v94;
                v102 = objc_msgSend(v76, "range");
              }
              while (v94 < v102 + v103);
            }

            v49 = v119;
          }
          v121 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v125, v133, 16);
        }
        while (v121);
      }

      v6 = v113;
      v7 = v120;
    }
    objc_msgSend(v32, "valueForKeyPath:", CFSTR("@avg.self"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "floatValue");

    objc_msgSend(v33, "valueForKeyPath:", CFSTR("@avg.self"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "floatValue");
    v107 = v106;

    objc_msgSend(v18, "valueForKeyPath:", CFSTR("@avg.self"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "floatValue");
    v110 = v109;

    v111 = (v110 + 0.05) / (v107 + 0.05);
    if (v111 < 1.0)
      v111 = 1.0 / v111;
    if (v111 < 4.5)
      v13 = 0;
    else
      v13 = -1;

    goto LABEL_58;
  }
  v13 = -1;
LABEL_59:

  return v13;
}

- (id)opaqueComponentStyleForComponent:(id)a3 DOM:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[SXTextContrastDarkModePolicyException componentStyleForComponent:DOM:](self, "componentStyleForComponent:DOM:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {
    objc_msgSend(v9, "fill");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v8, "analysis");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerPathForComponentWithIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v15, "reverseObjectEnumerator");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v29)
      {
        v25 = v9;
        v26 = v7;
        v28 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v31 != v28)
              objc_enumerationMutation(obj);
            v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v15, "removeObject:", v17);
            objc_msgSend(v8, "components");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "componentsForContainerComponentWithPath:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "componentForIdentifier:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXTextContrastDarkModePolicyException componentStyleForComponent:DOM:](self, "componentStyleForComponent:DOM:", v20, v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "backgroundColor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_msgSend(v9, "backgroundColor");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "alphaComponent");
              if (v22 > 0.0)
              {

LABEL_18:
                goto LABEL_19;
              }
            }
            objc_msgSend(v9, "fill");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {

            }
            if (v23)
              goto LABEL_18;

          }
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v29)
            continue;
          break;
        }
        v9 = v25;
LABEL_19:
        v7 = v26;
      }

    }
  }

  return v9;
}

- (id)componentStyleForComponent:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "classification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultComponentStyleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  objc_msgSend(v7, "analysis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "namespacedObjectReferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "namespacedComponentStyleIdentifiersForIdentifiers:component:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentStyles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v17;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v19, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v24), (_QWORD)v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v18, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v18, "count"))
  {
    -[SXJSONObjectMerger mergeObjects:](self->_componentStyleMerger, "mergeObjects:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)componentTextStyleForTextComponent:(id)a3 DOM:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  v8 = a4;
  objc_msgSend(v6, "classification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultTextStyleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "textStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  objc_msgSend(v8, "analysis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "namespacedObjectReferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "namespacedComponentTextStyleIdentifiersForIdentifiers:component:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTextContrastDarkModePolicyException mergedComponentTextStyleWithIdentifiers:DOM:](self, "mergedComponentTextStyleWithIdentifiers:DOM:", v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)componentTextStyleForButtonComponent:(id)a3 DOM:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  v8 = a4;
  objc_msgSend(v6, "classification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultTextStyleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "textStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  objc_msgSend(v8, "analysis");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "namespacedObjectReferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "namespacedComponentTextStyleIdentifiersForIdentifiers:component:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTextContrastDarkModePolicyException mergedComponentTextStyleWithIdentifiers:DOM:](self, "mergedComponentTextStyleWithIdentifiers:DOM:", v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)mergedComponentTextStyleWithIdentifiers:(id)a3 DOM:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentTextStyles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count"))
  {
    -[SXJSONObjectMerger mergeObjects:](self->_componentTextStyleMerger, "mergeObjects:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (SXJSONObjectMerger)componentStyleMerger
{
  return self->_componentStyleMerger;
}

- (SXJSONObjectMerger)componentTextStyleMerger
{
  return self->_componentTextStyleMerger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentTextStyleMerger, 0);
  objc_storeStrong((id *)&self->_componentStyleMerger, 0);
}

@end
