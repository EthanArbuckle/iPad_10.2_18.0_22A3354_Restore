@implementation PRPosterMutableConfiguredProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)mergeConfiguredProperties:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v48 = a3;
  objc_msgSend(v48, "titleStyleConfiguration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v48, "titleStyleConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setTitleStyleConfiguration:](self, "setTitleStyleConfiguration:", v7);

    }
  }
  objc_msgSend(v48, "complicationLayout");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v48, "complicationLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setComplicationLayout:](self, "setComplicationLayout:", v11);

    }
  }
  objc_msgSend(v48, "focusConfiguration");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v48, "focusConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setFocusConfiguration:](self, "setFocusConfiguration:", v15);

    }
  }
  objc_msgSend(v48, "renderingConfiguration");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      objc_msgSend(v48, "renderingConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setRenderingConfiguration:](self, "setRenderingConfiguration:", v19);

    }
  }
  objc_msgSend(v48, "homeScreenConfiguration");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      objc_msgSend(v48, "homeScreenConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setHomeScreenConfiguration:](self, "setHomeScreenConfiguration:", v23);

    }
  }
  objc_msgSend(v48, "colorVariationsConfiguration");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(v48, "colorVariationsConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setColorVariationsConfiguration:](self, "setColorVariationsConfiguration:", v27);

    }
  }
  objc_msgSend(v48, "quickActionsConfiguration");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      objc_msgSend(v48, "quickActionsConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setQuickActionsConfiguration:](self, "setQuickActionsConfiguration:", v31);

    }
  }
  objc_msgSend(v48, "ambientConfiguration");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      objc_msgSend(v48, "ambientConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setAmbientConfiguration:](self, "setAmbientConfiguration:", v35);

    }
  }
  objc_msgSend(v48, "suggestionMetadata");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      objc_msgSend(v48, "suggestionMetadata");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setSuggestionMetadata:](self, "setSuggestionMetadata:", v39);

    }
  }
  objc_msgSend(v48, "otherMetadata");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      objc_msgSend(v48, "otherMetadata");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setOtherMetadata:](self, "setOtherMetadata:", v43);

    }
  }
  objc_msgSend(v48, "ambientWidgetLayout");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
      objc_msgSend(v48, "ambientWidgetLayout");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties setAmbientWidgetLayout:](self, "setAmbientWidgetLayout:", v47);

    }
  }

}

- (BOOL)_isImmutable
{
  return 0;
}

- (BOOL)applyUpdate:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PRPosterMutableConfiguredProperties applyUpdates:error:](self, "applyUpdates:error:", v8, a4, v11, v12);
  return v9;
}

- (BOOL)applyUpdates:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  void *v14;
  id v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PRPosterComplicationLayout *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  const __CFString **v47;
  uint64_t *v48;
  id v49;
  int v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  PRPosterComplicationLayout *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  PRPosterAmbientWidgetLayout *v92;
  void *v93;
  PRPosterAmbientWidgetLayout *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  uint64_t v101;
  id v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  char v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  void *v115;
  __CFString *v116;
  int v117;
  __CFString *v118;
  __CFString *v119;
  void *v120;
  void *v121;
  void *v122;
  char v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  void *v129;
  char v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  BOOL v136;
  void *v137;
  void *v138;
  uint64_t v139;
  char v140;
  void *v141;
  id v142;
  id v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  id v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  char v158;
  void *v159;
  void *v160;
  id v161;
  PRPosterComplicationLayout *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  const __CFString **v184;
  uint64_t *v185;
  void *v186;
  int v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  const __CFString **v193;
  uint64_t *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  char v213;
  void *v214;
  PRPosterMutableConfiguredProperties *v215;
  void *v216;
  void *v217;
  char v218;
  void *v219;
  void *v220;
  char v221;
  char v222;
  void *v223;
  void *v224;
  void *v226;
  void *v227;
  PRPosterMutableConfiguredProperties *v228;
  id *v229;
  id v230;
  char v231;
  char v232;
  char v233;
  id v234;
  char v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  uint64_t v247;
  const __CFString *v248;
  uint64_t v249;
  const __CFString *v250;
  uint64_t v251;
  const __CFString *v252;
  uint64_t v253;
  const __CFString *v254;
  uint64_t v255;
  const __CFString *v256;
  uint64_t v257;
  const __CFString *v258;
  uint64_t v259;
  const __CFString *v260;
  uint64_t v261;
  const __CFString *v262;
  uint64_t v263;
  const __CFString *v264;
  uint64_t v265;
  const __CFString *v266;
  uint64_t v267;
  const __CFString *v268;
  _BYTE v269[128];
  uint64_t v270;
  const __CFString *v271;
  _BYTE v272[128];
  uint64_t v273;

  v273 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v218 = 1;
    goto LABEL_216;
  }
  v245 = 0u;
  v246 = 0u;
  v243 = 0u;
  v244 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v243, v272, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v244;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v244 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v243 + 1) + 8 * i), "type");
        if (v12 <= 0xB && ((1 << v12) & 0xCC0) != 0)
        {
          if (a4)
          {
            v216 = (void *)MEMORY[0x1E0CB35C8];
            v270 = *MEMORY[0x1E0CB2D68];
            v271 = CFSTR("Update type not supported!");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v271, &v270, 1);
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v216, "pr_errorWithCode:userInfo:", 2, v217);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v218 = 0;
          goto LABEL_215;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v243, v272, 16);
    }
    while (v9);
  }
  v14 = v7;

  v7 = (id)-[PRPosterMutableConfiguredProperties mutableCopy](self, "mutableCopy");
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v239, v269, 16);
  v17 = v16 != 0;
  if (!v16)
  {
    v213 = 0;
    v221 = 0;
    v222 = 0;
    goto LABEL_209;
  }
  v228 = self;
  v229 = a4;
  v230 = v6;
  v232 = 0;
  v231 = 0;
  v235 = 0;
  v233 = 0;
  v237 = *MEMORY[0x1E0CB2D68];
  v238 = *(_QWORD *)v240;
  v234 = v15;
  v18 = v16;
LABEL_16:
  v19 = 0;
  v236 = v18;
  while (2)
  {
    if (*(_QWORD *)v240 != v238)
      objc_enumerationMutation(v15);
    v20 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * v19);
    v21 = objc_msgSend(v20, "type");
    switch(v21)
    {
      case 1:
      case 2:
      case 8:
        objc_msgSend(v20, "payload");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_opt_class();
        v24 = v22;
        if (v23)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;
        }
        else
        {
          v25 = 0;
        }
        v30 = v25;

        if (!v30
          || v21 == 2
          && (objc_msgSend(v30, "complications"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = objc_msgSend(v31, "count"),
              v31,
              v32 >= 2))
        {
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v267 = v237;
          v268 = CFSTR("Complication payload was invalid; expected only 1 complication");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v268, &v267, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v33;
          goto LABEL_42;
        }
        objc_msgSend(v7, "complicationLayout");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
          v38 = v36;
        else
          v38 = -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:]([PRPosterComplicationLayout alloc], "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", 0, 0, 0, 0, 0);
        v34 = v38;

        switch(v21)
        {
          case 1:
            v162 = [PRPosterComplicationLayout alloc];
            objc_msgSend(v34, "inlineComplication");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "sidebarComplications");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v163 = v30;
            goto LABEL_138;
          case 8:
            v162 = [PRPosterComplicationLayout alloc];
            objc_msgSend(v34, "inlineComplication");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "complications");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v163 = v34;
LABEL_138:
            objc_msgSend(v163, "complications");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:](v162, "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", v80, 0, v81, 0, v82);

LABEL_139:
            v18 = v236;

            objc_msgSend(v7, "setComplicationLayout:", v84);
            v49 = 0;
            v50 = 1;
            v34 = (void *)v84;
            v233 = 1;
            goto LABEL_190;
          case 2:
            v79 = [PRPosterComplicationLayout alloc];
            objc_msgSend(v30, "complications");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "firstObject");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "sidebarComplications");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "complications");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:](v79, "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", v81, 0, v82, 0, v83);

            v15 = v234;
            goto LABEL_139;
        }
        v164 = (void *)MEMORY[0x1E0CB35C8];
        v265 = v237;
        v266 = CFSTR("Complication payload was invalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v266, &v265, 1);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "pr_errorWithCode:userInfo:", 3, v165);
        v49 = (id)objc_claimAutoreleasedReturnValue();

LABEL_43:
        v50 = 0;
        goto LABEL_190;
      case 3:
      case 4:
      case 5:
        objc_msgSend(v20, "payload");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_class();
        v28 = v26;
        if (v27)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v28;
          else
            v29 = 0;
        }
        else
        {
          v29 = 0;
        }
        v30 = v29;

        objc_msgSend(v30, "tristate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "BOOLValue");

        if (!v30
          || (objc_msgSend(v30, "tristate"), v41 = (void *)objc_claimAutoreleasedReturnValue(), v41, !v41))
        {
          v45 = (void *)MEMORY[0x1E0CB35C8];
          v255 = v237;
          v256 = CFSTR("Home Screen Legibility payload was invalid; expecting BOOL value not nil");
          v46 = (void *)MEMORY[0x1E0C99D80];
          v47 = &v256;
          v48 = &v255;
          goto LABEL_41;
        }
        objc_msgSend(v7, "homeScreenConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v34, "mutableCopy");
        v43 = v42;
        if (v42)
          v44 = v42;
        else
          v44 = (id)objc_opt_new();
        v85 = v44;

        if (v21 == 5)
        {
          objc_msgSend(v85, "lockPosterAppearance");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "allowsModifyingLegibilityBlur");

          if (v91)
          {
            objc_msgSend(v85, "lockPosterAppearance");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = (void *)objc_msgSend(v88, "copyWithLegibilityBlurEnabled:", v40);
            objc_msgSend(v85, "setLockPosterAppearance:", v89);
            goto LABEL_84;
          }
          v191 = (void *)MEMORY[0x1E0CB35C8];
          v251 = v237;
          v252 = CFSTR("Lock Screen Poster Apperance payload was invalid; does not allow modifying legibility blur");
          v192 = (void *)MEMORY[0x1E0C99D80];
          v193 = &v252;
          v194 = &v251;
        }
        else
        {
          if (v21 != 4)
            goto LABEL_167;
          objc_msgSend(v85, "homePosterAppearance");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v86, "allowsModifyingLegibilityBlur");

          if (v87)
          {
            objc_msgSend(v85, "homePosterAppearance");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = (void *)objc_msgSend(v88, "copyWithLegibilityBlurEnabled:", v40);
            objc_msgSend(v85, "setHomePosterAppearance:", v89);
LABEL_84:

            goto LABEL_167;
          }
          v191 = (void *)MEMORY[0x1E0CB35C8];
          v253 = v237;
          v254 = CFSTR("Home Screen Poster Apperance payload was invalid; does not allow modifying legibility blur");
          v192 = (void *)MEMORY[0x1E0C99D80];
          v193 = &v254;
          v194 = &v253;
        }
        objc_msgSend(v192, "dictionaryWithObjects:forKeys:count:", v193, v194, 1);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "pr_errorWithCode:userInfo:", 3, v195);
        v49 = (id)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          v50 = 0;
          goto LABEL_168;
        }
LABEL_167:
        objc_msgSend(v7, "setHomeScreenConfiguration:", v85);
        v49 = 0;
        v50 = 1;
        v235 = 1;
LABEL_168:

        v15 = v234;
        goto LABEL_190;
      case 6:
      case 7:
      case 10:
      case 11:
        if (v229)
        {
          v223 = (void *)MEMORY[0x1E0CB35C8];
          v249 = v237;
          v250 = CFSTR("Update type not supported!");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v250, &v249, 1);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "pr_errorWithCode:userInfo:", 2, v224);
          *v229 = (id)objc_claimAutoreleasedReturnValue();

        }
        v49 = 0;
        goto LABEL_214;
      case 9:
        objc_msgSend(v20, "payload");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_opt_class();
        v53 = v51;
        if (v52)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v54 = v53;
          else
            v54 = 0;
        }
        else
        {
          v54 = 0;
        }
        v30 = v54;

        if (v30)
        {
          objc_msgSend(v30, "propertyListRoot");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = [PRPosterAmbientWidgetLayout alloc];
          if (v34)
            v93 = v34;
          else
            v93 = (void *)MEMORY[0x1E0C9AA70];
          v94 = -[PRPosterAmbientWidgetLayout initWithDictionary:](v92, "initWithDictionary:", v93);
          objc_msgSend(v7, "setAmbientWidgetLayout:", v94);

          v49 = 0;
          v50 = 1;
          v232 = 1;
          goto LABEL_190;
        }
        v45 = (void *)MEMORY[0x1E0CB35C8];
        v261 = v237;
        v262 = CFSTR("Ambient Widgets payload was invalid");
        v46 = (void *)MEMORY[0x1E0C99D80];
        v47 = &v262;
        v48 = &v261;
LABEL_41:
        objc_msgSend(v46, "dictionaryWithObjects:forKeys:count:", v47, v48, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v45;
LABEL_42:
        objc_msgSend(v35, "pr_errorWithCode:userInfo:", 3, v34);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      case 12:
        objc_msgSend(v20, "payload");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_opt_class();
        v57 = v55;
        if (v56)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v58 = v57;
          else
            v58 = 0;
        }
        else
        {
          v58 = 0;
        }
        v30 = v58;

        objc_msgSend(v7, "ambientConfiguration");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = (void *)objc_msgSend(v95, "mutableCopy");
        v97 = v96;
        if (v96)
          v98 = v96;
        else
          v98 = (id)objc_opt_new();
        v34 = v98;

        objc_msgSend(v30, "propertyListRoot");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "objectForKey:", CFSTR("creationBehavior"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        v136 = v135 != 0;
        if (v135
          && (objc_msgSend(v30, "propertyListRoot"),
              v137 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v137, "objectForKey:", CFSTR("creationBehavior")),
              v138 = (void *)objc_claimAutoreleasedReturnValue(),
              v139 = objc_msgSend(v138, "unsignedIntegerValue"),
              v138,
              v137,
              objc_msgSend(v34, "creationBehavior") != v139))
        {
          objc_msgSend(v34, "setCreationBehavior:", v139);
          v140 = 1;
        }
        else
        {
          v140 = 0;
        }
        objc_msgSend(v30, "propertyListRoot");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "objectForKey:", CFSTR("deletionBehavior"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();

        if (v167)
        {
          objc_msgSend(v30, "propertyListRoot");
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v168, "objectForKey:", CFSTR("deletionBehavior"));
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = objc_msgSend(v169, "unsignedIntegerValue");

          if (objc_msgSend(v34, "deletionBehavior") == v170)
          {
            v136 = 1;
          }
          else
          {
            objc_msgSend(v34, "setDeletionBehavior:", v170);
            v136 = 1;
            v140 = 1;
          }
        }
        objc_msgSend(v30, "propertyListRoot");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "objectForKey:", CFSTR("supportedDataLayout"));
        v172 = (void *)objc_claimAutoreleasedReturnValue();

        if (v172)
        {
          objc_msgSend(v30, "propertyListRoot");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "objectForKey:", CFSTR("supportedDataLayout"));
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v175 = objc_msgSend(v174, "unsignedIntegerValue");

          if (objc_msgSend(v34, "supportedDataLayout") == v175)
          {
            v136 = 1;
          }
          else
          {
            objc_msgSend(v34, "setSupportedDataLayout:", v175);
            v136 = 1;
            v140 = 1;
          }
        }
        objc_msgSend(v30, "propertyListRoot");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "objectForKey:", CFSTR("editingBehavior"));
        v177 = (void *)objc_claimAutoreleasedReturnValue();

        if (v177)
        {
          objc_msgSend(v30, "propertyListRoot");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "objectForKey:", CFSTR("editingBehavior"));
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          v180 = objc_msgSend(v179, "unsignedIntegerValue");

          if (objc_msgSend(v34, "editingBehavior") != v180)
          {
            objc_msgSend(v34, "setEditingBehavior:", v180);
LABEL_155:
            v181 = (void *)objc_msgSend(v34, "copy");
            objc_msgSend(v7, "setAmbientConfiguration:", v181);
            v49 = 0;
            v50 = 1;
            v231 = 1;
            goto LABEL_185;
          }
        }
        else if (!v136)
        {
          v182 = (void *)MEMORY[0x1E0CB35C8];
          v259 = v237;
          v260 = CFSTR("No changes could be applied; input was not valid");
          v183 = (void *)MEMORY[0x1E0C99D80];
          v184 = &v260;
          v185 = &v259;
          goto LABEL_184;
        }
        if ((v140 & 1) != 0)
          goto LABEL_155;
        v182 = (void *)MEMORY[0x1E0CB35C8];
        v257 = v237;
        v258 = CFSTR("No changes could be applied; input was valid but matched existing values");
        v183 = (void *)MEMORY[0x1E0C99D80];
        v184 = &v258;
        v185 = &v257;
LABEL_184:
        objc_msgSend(v183, "dictionaryWithObjects:forKeys:count:", v184, v185, 1);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "pr_errorWithCode:userInfo:", 3, v181);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        v50 = 0;
LABEL_185:

        goto LABEL_189;
      case 13:
        objc_msgSend(v20, "payload");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_opt_class();
        v61 = v59;
        if (v60)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v62 = v61;
          else
            v62 = 0;
        }
        else
        {
          v62 = 0;
        }
        v30 = v62;

        if (v30)
        {
          objc_msgSend(v30, "tristate");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          if (v99)
          {
            objc_msgSend(v30, "tristate");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v100, "BOOLValue");

          }
          else
          {
            v101 = 0;
          }

          objc_msgSend(v7, "homeScreenConfiguration");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "customizationConfiguration");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          v187 = objc_msgSend(v186, "isDimmed");

          if ((_DWORD)v101 == v187)
          {
            v18 = v236;
LABEL_162:

            goto LABEL_193;
          }
          v188 = (void *)objc_msgSend(v34, "mutableCopy");
          v189 = v188;
          if (v188)
            v190 = v188;
          else
            v190 = (id)objc_opt_new();
          v196 = v190;

          objc_msgSend(v196, "customizationConfiguration");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "configurationUpdatingDimmed:", v101);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v196, "setCustomizationConfiguration:", v210);

LABEL_188:
          objc_msgSend(v7, "setHomeScreenConfiguration:", v196);

          v49 = 0;
          v50 = 1;
          v235 = 1;
LABEL_189:
          v18 = v236;
        }
        else
        {
          v141 = (void *)MEMORY[0x1E0CB35C8];
          v263 = v237;
          v264 = CFSTR("Home Screen Legibility payload was invalid; expecting BOOL value not nil");
          v50 = 1;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v264, &v263, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "pr_errorWithCode:userInfo:", 3, v34);
          v49 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_190:

LABEL_191:
        if (v50 && !v49)
        {
LABEL_193:
          if (v18 != ++v19)
            continue;
          v212 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v239, v269, 16);
          v18 = v212;
          if (!v212)
          {

            v213 = v233;
            if ((v233 & 1) != 0)
            {
              objc_msgSend(v7, "complicationLayout");
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              v215 = v228;
              -[PRPosterConfiguredProperties setComplicationLayout:](v228, "setComplicationLayout:", v214);

            }
            else
            {
              v215 = v228;
            }
            if ((v235 & 1) != 0)
            {
              objc_msgSend(v7, "homeScreenConfiguration");
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              -[PRPosterConfiguredProperties setHomeScreenConfiguration:](v215, "setHomeScreenConfiguration:", v226);

              v221 = 1;
            }
            else
            {
              v221 = 0;
            }
            v17 = 1;
            if ((v231 & 1) != 0)
            {
              objc_msgSend(v7, "ambientConfiguration");
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              -[PRPosterConfiguredProperties setAmbientConfiguration:](v215, "setAmbientConfiguration:", v227);

              v222 = 1;
              v6 = v230;
              if ((v232 & 1) == 0)
              {
                v17 = 0;
                goto LABEL_210;
              }
            }
            else
            {
              v222 = 0;
              v6 = v230;
              if ((v232 & 1) == 0)
              {
                v17 = 0;
                goto LABEL_210;
              }
            }
            objc_msgSend(v7, "ambientWidgetLayout");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            -[PRPosterConfiguredProperties setAmbientWidgetLayout:](v215, "setAmbientWidgetLayout:", v15);
LABEL_209:

LABEL_210:
            v218 = v213 | v221 | v222 | v17;
            goto LABEL_215;
          }
          goto LABEL_16;
        }
        if (!v49)
        {
          v219 = (void *)MEMORY[0x1E0CB35C8];
          v247 = v237;
          v248 = CFSTR("unknown error updating configured properties");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v248, &v247, 1);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v219, "pr_errorWithCode:userInfo:", 0, v220);
          v49 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (v229)
        {
          v49 = objc_retainAutorelease(v49);
          *v229 = v49;
        }
LABEL_214:

        v218 = 0;
        v6 = v230;
LABEL_215:

LABEL_216:
        return v218 & 1;
      case 14:
        objc_msgSend(v20, "payload");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_opt_class();
        v65 = v63;
        if (v64)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v66 = v65;
          else
            v66 = 0;
        }
        else
        {
          v66 = 0;
        }
        v102 = v66;

        objc_msgSend(v20, "payload");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_opt_class();
        v105 = v103;
        if (v104)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v106 = v105;
          else
            v106 = 0;
        }
        else
        {
          v106 = 0;
        }
        v142 = v106;

        if (v142)
        {
          v143 = objc_alloc_init(MEMORY[0x1E0D7FCC8]);
          objc_msgSend(v142, "color");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "UIColor");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = objc_msgSend(v143, "copyWithVariatedColor:", v145);
          goto LABEL_132;
        }
        objc_msgSend(v102, "variation");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        if (v147 || (objc_msgSend(v102, "luminance"), (v147 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

LABEL_131:
          v148 = objc_alloc(MEMORY[0x1E0D7FCC8]);
          objc_msgSend(v102, "variation");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "doubleValue");
          v150 = v149;
          objc_msgSend(v102, "luminance");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "doubleValue");
          v152 = v151;
          objc_msgSend(v102, "saturation");
          v143 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "doubleValue");
          v146 = objc_msgSend(v148, "initWithVariation:luminance:saturation:", v150, v152, v153);
LABEL_132:
          v154 = (void *)v146;

          goto LABEL_133;
        }
        objc_msgSend(v102, "saturation");
        v211 = (void *)objc_claimAutoreleasedReturnValue();

        if (v211)
          goto LABEL_131;
        v154 = 0;
LABEL_133:
        objc_msgSend(v7, "homeScreenConfiguration");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "customizationConfiguration");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "tintColorStyle");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = objc_msgSend(v157, "isEqual:", v154);

        if ((v158 & 1) == 0)
        {
          v159 = (void *)objc_msgSend(v155, "mutableCopy");
          v160 = v159;
          if (v159)
            v161 = v159;
          else
            v161 = (id)objc_opt_new();
          v206 = v161;

          objc_msgSend(v206, "customizationConfiguration");
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v207, "configurationUpdatingTintColorStyle:", v154);
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v206, "setCustomizationConfiguration:", v208);

          objc_msgSend(v7, "setHomeScreenConfiguration:", v206);
          v235 = 1;
        }

        v18 = v236;
        if ((v158 & 1) != 0)
        {
          v15 = v234;
          goto LABEL_193;
        }
        v49 = 0;
        v50 = 1;
        v15 = v234;
        goto LABEL_191;
      case 15:
        objc_msgSend(v20, "payload");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_opt_class();
        v69 = v67;
        if (v68)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v70 = v69;
          else
            v70 = 0;
        }
        else
        {
          v70 = 0;
        }
        v107 = v70;

        objc_msgSend(v107, "color");
        v30 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "homeScreenConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "customizationConfiguration");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "suggestedTintColor");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = objc_msgSend(v109, "isEqual:", v30);

        if ((v110 & 1) != 0)
          goto LABEL_162;
        v111 = (void *)objc_msgSend(v34, "mutableCopy");
        v112 = v111;
        if (v111)
          v113 = v111;
        else
          v113 = (id)objc_opt_new();
        v196 = v113;

        objc_msgSend(v196, "customizationConfiguration");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "UIColor");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "configurationUpdatingSuggestedTintColor:", v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "setCustomizationConfiguration:", v199);

        goto LABEL_188;
      case 16:
        objc_msgSend(v20, "payload");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_opt_class();
        v73 = v71;
        if (v72)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v74 = v73;
          else
            v74 = 0;
        }
        else
        {
          v74 = 0;
        }
        v114 = v74;

        objc_msgSend(v114, "tristate");
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        v116 = CFSTR("SMALL");
        if (v115)
        {
          v117 = objc_msgSend(v115, "BOOLValue");
          v118 = CFSTR("LARGE");
          if (!v117)
            v118 = CFSTR("SMALL");
          v119 = v118;

          v116 = v119;
        }
        objc_msgSend(v7, "homeScreenConfiguration");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "customizationConfiguration");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "iconUserInterfaceSize");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend(v122, "isEqual:", v116);

        if ((v123 & 1) == 0)
        {
          v124 = (void *)objc_msgSend(v120, "mutableCopy");
          v125 = v124;
          if (v124)
            v126 = v124;
          else
            v126 = (id)objc_opt_new();
          v200 = v126;

          objc_msgSend(v120, "customizationConfiguration");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v201, "configurationUpdatingIconUserInterfaceSize:", v116);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v200, "setCustomizationConfiguration:", v202);

          objc_msgSend(v7, "setHomeScreenConfiguration:", v200);
          v235 = 1;
          v15 = v234;
          v18 = v236;
        }

        if ((v123 & 1) == 0)
          goto LABEL_174;
        goto LABEL_193;
      case 17:
        objc_msgSend(v20, "payload");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_opt_class();
        v77 = v75;
        if (v76)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v78 = v77;
          else
            v78 = 0;
        }
        else
        {
          v78 = 0;
        }
        v127 = v78;

        objc_msgSend(v127, "propertyListRoot");
        v30 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "homeScreenConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "customizationConfiguration");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "iconUserInterfaceStyleType");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = objc_msgSend(v129, "isEqual:", v30);

        if ((v130 & 1) != 0)
          goto LABEL_162;
        v131 = (void *)objc_msgSend(v34, "mutableCopy");
        v132 = v131;
        if (v131)
          v133 = v131;
        else
          v133 = (id)objc_opt_new();
        v203 = v133;

        objc_msgSend(v34, "customizationConfiguration");
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "configurationUpdatingIconUserInterfaceStyle:", v30);
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "setCustomizationConfiguration:", v205);

        objc_msgSend(v7, "setHomeScreenConfiguration:", v203);
        v49 = 0;
        v50 = 1;
        v235 = 1;
        goto LABEL_190;
      default:
LABEL_174:
        v49 = 0;
        v50 = 1;
        goto LABEL_191;
    }
  }
}

@end
