@implementation UIPrintFinishingsOption

- (UIPrintFinishingsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintFinishingsOption *v4;
  UIPrintFinishingsOption *v5;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIPrintFinishingsOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v17, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printInfo](v4, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v5, 0x1E9D986F8, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98978, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98998, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v5, 0x1E9D989B8, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v5, 0x1E9D989D8, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v5, 0x1E9D989F8, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98A18, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98A38, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98A58, 0, 0);

    -[UIPrintOption printInfo](v5, "printInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v5, 0x1E9D98A78, 0, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D98978);

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, 0x1E9D98998);

  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, 0x1E9D989B8);

  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:", self, 0x1E9D989D8);

  -[UIPrintOption printInfo](self, "printInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:forKeyPath:", self, 0x1E9D989F8);

  -[UIPrintOption printInfo](self, "printInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:forKeyPath:", self, 0x1E9D98A18);

  -[UIPrintOption printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forKeyPath:", self, 0x1E9D98A38);

  -[UIPrintOption printInfo](self, "printInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:forKeyPath:", self, 0x1E9D98A58);

  -[UIPrintOption printInfo](self, "printInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:forKeyPath:", self, 0x1E9D98A78);

  v13.receiver = self;
  v13.super_class = (Class)UIPrintFinishingsOption;
  -[UIPrintFinishingsOption dealloc](&v13, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintFinishingsOption *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__UIPrintFinishingsOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __74__UIPrintFinishingsOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D986F8))
    objc_msgSend(*(id *)(a1 + 40), "currentPrinterChanged");
  objc_msgSend(*(id *)(a1 + 40), "updateFromPrintInfo");
  objc_msgSend(*(id *)(a1 + 40), "summaryString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSummary:", v2);

}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printerInfoDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "shouldShow") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[UIPrintFinishingsOption printerFinishingOptions](self, "printerFinishingOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "count") != 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)currentPrinterChanged
{
  void *v3;
  UIPrintFinishingTemplatesOption *v4;
  void *v5;
  void *v6;
  UIPrintFinishingTemplatesOption *v7;
  id v8;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFinishingOption:", 0);

  -[UIPrintFinishingsOption setPrinterFinishingOptions:](self, "setPrinterFinishingOptions:", 0);
  v4 = [UIPrintFinishingTemplatesOption alloc];
  -[UIPrintOption printInfo](self, "printInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintFinishingsOption finishingOptionsTableView](self, "finishingOptionsTableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIPrintFinishingTemplatesOption initWithPrintInfo:printPanelViewController:finishingOptionsTableView:](v4, "initWithPrintInfo:printPanelViewController:finishingOptionsTableView:", v8, v5, v6);
  -[UIPrintFinishingsOption setFinishingTemplatesOption:](self, "setFinishingTemplatesOption:", v7);

}

- (void)updateFromPrintInfo
{
  void *v3;
  id v4;

  -[UIPrintFinishingsOption summaryString](self, "summaryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v3);

  -[UIPrintFinishingsOption finishingOptionsTableView](self, "finishingOptionsTableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (NSArray)printerFinishingOptions
{
  NSArray **p_printerFinishingOptions;
  UIPrintFinishingsOption *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  UIPrintFinishingChoice *v16;
  void *v17;
  void *v18;
  void *v19;
  UIPrintFinishingChoice *v20;
  void *v21;
  uint64_t v22;
  UIPrintFinishingChoice *v23;
  void *v24;
  int v25;
  UIPrintFinishingChoice *v26;
  void *v27;
  void *v28;
  UIPrintFinishingChoice *v29;
  void *v30;
  int v31;
  UIPrintFinishingChoice *v32;
  void *v33;
  void *v34;
  UIPrintFinishingChoice *v35;
  void *v36;
  int v37;
  UIPrintFinishingChoice *v38;
  void *v39;
  void *v40;
  UIPrintFinishingChoice *v41;
  void *v42;
  int v43;
  UIPrintFinishingChoice *v44;
  void *v45;
  void *v46;
  UIPrintFinishingChoice *v47;
  void *v48;
  int v49;
  UIPrintFinishingChoice *v50;
  void *v51;
  void *v52;
  UIPrintFinishingChoice *v53;
  void *v54;
  int v55;
  UIPrintFinishingChoice *v56;
  void *v57;
  void *v58;
  UIPrintFinishingChoice *v59;
  void *v60;
  int v61;
  UIPrintFinishingChoice *v62;
  void *v63;
  void *v64;
  UIPrintFinishingChoice *v65;
  void *v66;
  void *v67;
  int v68;
  UIPrintFinishingChoice *v69;
  void *v70;
  void *v71;
  UIPrintFinishingChoice *v72;
  void *v73;
  int v74;
  UIPrintFinishingChoice *v75;
  void *v76;
  void *v77;
  UIPrintFinishingChoice *v78;
  void *v79;
  int v80;
  UIPrintFinishingChoice *v81;
  void *v82;
  void *v83;
  UIPrintFinishingChoice *v84;
  UIPrintFinishingChoice *v85;
  void *v86;
  void *v87;
  UIPrintFinishingChoice *v88;
  _BOOL8 v89;
  UIPrinterFinishingOption *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  UIPrinterFinishingOption *v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  int v101;
  UIPrintFinishingChoice *v102;
  void *v103;
  void *v104;
  void *v105;
  UIPrintFinishingChoice *v106;
  void *v107;
  uint64_t v108;
  UIPrintFinishingChoice *v109;
  void *v110;
  int v111;
  UIPrintFinishingChoice *v112;
  void *v113;
  void *v114;
  UIPrintFinishingChoice *v115;
  void *v116;
  int v117;
  UIPrintFinishingChoice *v118;
  void *v119;
  void *v120;
  UIPrintFinishingChoice *v121;
  void *v122;
  int v123;
  UIPrintFinishingChoice *v124;
  void *v125;
  void *v126;
  UIPrintFinishingChoice *v127;
  void *v128;
  int v129;
  UIPrintFinishingChoice *v130;
  void *v131;
  void *v132;
  UIPrintFinishingChoice *v133;
  void *v134;
  int v135;
  UIPrintFinishingChoice *v136;
  void *v137;
  void *v138;
  UIPrintFinishingChoice *v139;
  void *v140;
  int v141;
  UIPrintFinishingChoice *v142;
  void *v143;
  void *v144;
  UIPrintFinishingChoice *v145;
  void *v146;
  int v147;
  UIPrintFinishingChoice *v148;
  void *v149;
  void *v150;
  UIPrintFinishingChoice *v151;
  void *v152;
  int v153;
  UIPrintFinishingChoice *v154;
  void *v155;
  void *v156;
  UIPrintFinishingChoice *v157;
  void *v158;
  int v159;
  UIPrintFinishingChoice *v160;
  void *v161;
  void *v162;
  UIPrintFinishingChoice *v163;
  void *v164;
  int v165;
  UIPrintFinishingChoice *v166;
  void *v167;
  void *v168;
  UIPrintFinishingChoice *v169;
  UIPrintFinishingChoice *v170;
  void *v171;
  void *v172;
  UIPrintFinishingChoice *v173;
  _BOOL8 v174;
  UIPrinterFinishingOption *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  UIPrinterFinishingOption *v180;
  void *v181;
  void *v182;
  int v183;
  UIPrintFinishingChoice *v184;
  void *v185;
  void *v186;
  UIPrintFinishingChoice *v187;
  void *v188;
  int v189;
  UIPrintFinishingChoice *v190;
  void *v191;
  void *v192;
  UIPrintFinishingChoice *v193;
  void *v194;
  int v195;
  UIPrintFinishingChoice *v196;
  void *v197;
  void *v198;
  UIPrintFinishingChoice *v199;
  void *v200;
  int v201;
  UIPrintFinishingChoice *v202;
  void *v203;
  void *v204;
  UIPrintFinishingChoice *v205;
  void *v206;
  int v207;
  UIPrintFinishingChoice *v208;
  void *v209;
  void *v210;
  UIPrintFinishingChoice *v211;
  void *v212;
  int v213;
  UIPrintFinishingChoice *v214;
  void *v215;
  void *v216;
  UIPrintFinishingChoice *v217;
  void *v218;
  int v219;
  UIPrintFinishingChoice *v220;
  void *v221;
  void *v222;
  UIPrintFinishingChoice *v223;
  void *v224;
  int v225;
  UIPrintFinishingChoice *v226;
  void *v227;
  void *v228;
  UIPrintFinishingChoice *v229;
  void *v230;
  int v231;
  UIPrintFinishingChoice *v232;
  void *v233;
  void *v234;
  UIPrintFinishingChoice *v235;
  void *v236;
  int v237;
  UIPrintFinishingChoice *v238;
  void *v239;
  void *v240;
  UIPrintFinishingChoice *v241;
  void *v242;
  int v243;
  UIPrintFinishingChoice *v244;
  void *v245;
  void *v246;
  UIPrintFinishingChoice *v247;
  UIPrintFinishingChoice *v248;
  void *v249;
  void *v250;
  UIPrintFinishingChoice *v251;
  _BOOL8 v252;
  UIPrinterFinishingOption *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  UIPrinterFinishingOption *v258;
  void *v259;
  int v260;
  void *v261;
  UIPrintFinishingChoice *v262;
  void *v263;
  void *v264;
  UIPrintFinishingChoice *v265;
  UIPrinterFinishingOption *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  UIPrinterFinishingOption *v271;
  void *v272;
  int v273;
  void *v274;
  UIPrintFinishingChoice *v275;
  void *v276;
  void *v277;
  UIPrintFinishingChoice *v278;
  UIPrinterFinishingOption *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  UIPrinterFinishingOption *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t i;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  UIPrintFinishingChoice *v298;
  void *v299;
  UIPrinterFinishingOption *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  UIPrinterFinishingOption *v305;
  void *v306;
  void *v308;
  id *location;
  UIPrintFinishingsOption *v310;
  void *v311;
  void *v312;
  id obj;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  _BYTE v318[128];
  uint64_t v319;

  v319 = *MEMORY[0x1E0C80C00];
  p_printerFinishingOptions = &self->_printerFinishingOptions;
  if (self->_printerFinishingOptions)
    return *p_printerFinishingOptions;
  v3 = self;
  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "printerInfoDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return *p_printerFinishingOptions;
  location = (id *)p_printerFinishingOptions;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](v3, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPrinter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "printerFinishingOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v312 = v9;
  v310 = v3;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", v11))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "containsObject:", v12);

      if (!v13)
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "containsObject:", v14);

    v16 = [UIPrintFinishingChoice alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v15)
    {
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Single (Top-Left)"), CFSTR("Single (Top-Left)"), CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      v21 = v19;
      v22 = 20;
    }
    else
    {
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Automatic"), CFSTR("Automatic"), CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      v21 = v19;
      v22 = 4;
    }
    v23 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v20, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v21, v22, 0);
    objc_msgSend(v10, "addObject:", v23);

    v9 = v312;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v9, "containsObject:", v24);

    if (v25)
    {
      v26 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Single (Botttom-Left)"), CFSTR("Single (Botttom-Left)"), CFSTR("Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v26, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v28, 21, 0);
      objc_msgSend(v10, "addObject:", v29);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v9, "containsObject:", v30);

    if (v31)
    {
      v32 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Double (Left)"), CFSTR("Double (Left)"), CFSTR("Localizable"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v32, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v34, 28, 0);
      objc_msgSend(v10, "addObject:", v35);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v9, "containsObject:", v36);

    if (v37)
    {
      v38 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Double (Top)"), CFSTR("Double (Top)"), CFSTR("Localizable"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v38, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v40, 29, 0);
      objc_msgSend(v10, "addObject:", v41);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 31);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v9, "containsObject:", v42);

    if (v43)
    {
      v44 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Double (Bottom)"), CFSTR("Double (Bottom)"), CFSTR("Localizable"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v44, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v46, 31, 0);
      objc_msgSend(v10, "addObject:", v47);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 32);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v9, "containsObject:", v48);

    if (v49)
    {
      v50 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Triple (Left)"), CFSTR("Triple (Left)"), CFSTR("Localizable"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v50, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v52, 32, 0);
      objc_msgSend(v10, "addObject:", v53);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 33);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v9, "containsObject:", v54);

    if (v55)
    {
      v56 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Triple (Top)"), CFSTR("Triple (Top)"), CFSTR("Localizable"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v56, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v58, 33, 0);
      objc_msgSend(v10, "addObject:", v59);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 35);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v9, "containsObject:", v60);

    if (v61)
    {
      v62 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("Triple (Bottom)"), CFSTR("Triple (Bottom)"), CFSTR("Localizable"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v62, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v64, 35, 0);
      objc_msgSend(v10, "addObject:", v65);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", v66))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 50);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v9, "containsObject:", v67);

      if (!v68)
        goto LABEL_29;
    }
    v69 = [UIPrintFinishingChoice alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("Bind (Left)"), CFSTR("Bind (Left)"), CFSTR("Localizable"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v69, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v71, 50, 0);
    objc_msgSend(v10, "addObject:", v72);

LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 51);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v9, "containsObject:", v73);

    if (v74)
    {
      v75 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("Bind (Top)"), CFSTR("Bind (Top)"), CFSTR("Localizable"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v75, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v77, 51, 0);
      objc_msgSend(v10, "addObject:", v78);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v9, "containsObject:", v79);

    if (v80)
    {
      v81 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("Saddle Stitch"), CFSTR("Saddle Stitch"), CFSTR("Localizable"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v81, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v83, 8, 0);
      objc_msgSend(v10, "addObject:", v84);

    }
    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      v85 = [UIPrintFinishingChoice alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("No staple"), CFSTR("No staple"), CFSTR("Localizable"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v85, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v87, 0, 0);
      objc_msgSend(v10, "insertObject:atIndex:", v88, 0);

    }
    if (objc_msgSend(v10, "count"))
    {
      v89 = (unint64_t)objc_msgSend(v10, "count") > 1;
      v90 = [UIPrinterFinishingOption alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("Staple"), CFSTR("Staple"), CFSTR("Localizable"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOption printPanelViewController](v3, "printPanelViewController");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintFinishingsOption finishingOptionsTableView](v3, "finishingOptionsTableView");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = -[UIPrinterFinishingOption initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:](v90, "initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:", v92, 0, v89, v10, v93, v94);
      objc_msgSend(v311, "addObject:", v95);

      v9 = v312;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", v97))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 70);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v9, "containsObject:", v98);

      if (!v99)
      {
LABEL_44:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 71);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v9, "containsObject:", v110);

        if (v111)
        {
          v112 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "localizedStringForKey:value:table:", CFSTR("Single (Botttom-Left)"), CFSTR("Single (Botttom-Left)"), CFSTR("Localizable"));
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v112, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v114, 71, 0);
          objc_msgSend(v96, "addObject:", v115);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 74);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v9, "containsObject:", v116);

        if (v117)
        {
          v118 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "localizedStringForKey:value:table:", CFSTR("Double (Left)"), CFSTR("Double (Left)"), CFSTR("Localizable"));
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v118, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v120, 74, 0);
          objc_msgSend(v96, "addObject:", v121);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 75);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = objc_msgSend(v9, "containsObject:", v122);

        if (v123)
        {
          v124 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "localizedStringForKey:value:table:", CFSTR("Double (Top)"), CFSTR("Double (Top)"), CFSTR("Localizable"));
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v124, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v126, 75, 0);
          objc_msgSend(v96, "addObject:", v127);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 77);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v9, "containsObject:", v128);

        if (v129)
        {
          v130 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "localizedStringForKey:value:table:", CFSTR("Double (Bottom)"), CFSTR("Double (Bottom)"), CFSTR("Localizable"));
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v130, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v132, 77, 0);
          objc_msgSend(v96, "addObject:", v133);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 78);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = objc_msgSend(v9, "containsObject:", v134);

        if (v135)
        {
          v136 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "localizedStringForKey:value:table:", CFSTR("Triple (Left)"), CFSTR("Triple (Left)"), CFSTR("Localizable"));
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v136, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v138, 78, 0);
          objc_msgSend(v96, "addObject:", v139);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 79);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = objc_msgSend(v9, "containsObject:", v140);

        if (v141)
        {
          v142 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "localizedStringForKey:value:table:", CFSTR("Triple (Top)"), CFSTR("Triple (Top)"), CFSTR("Localizable"));
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v142, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v144, 79, 0);
          objc_msgSend(v96, "addObject:", v145);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 81);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = objc_msgSend(v9, "containsObject:", v146);

        if (v147)
        {
          v148 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "localizedStringForKey:value:table:", CFSTR("Triple (Bottom)"), CFSTR("Triple (Bottom)"), CFSTR("Localizable"));
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v148, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v150, 81, 0);
          objc_msgSend(v96, "addObject:", v151);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 82);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = objc_msgSend(v9, "containsObject:", v152);

        if (v153)
        {
          v154 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "localizedStringForKey:value:table:", CFSTR("Quad (Left)"), CFSTR("Quad (Left)"), CFSTR("Localizable"));
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          v157 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v154, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v156, 82, 0);
          objc_msgSend(v96, "addObject:", v157);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 83);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = objc_msgSend(v9, "containsObject:", v158);

        if (v159)
        {
          v160 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "localizedStringForKey:value:table:", CFSTR("Quad (Top)"), CFSTR("Quad (Top)"), CFSTR("Localizable"));
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v160, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v162, 83, 0);
          objc_msgSend(v96, "addObject:", v163);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 85);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = objc_msgSend(v9, "containsObject:", v164);

        if (v165)
        {
          v166 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "localizedStringForKey:value:table:", CFSTR("Quad (Bottom)"), CFSTR("Quad (Bottom)"), CFSTR("Localizable"));
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v166, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v168, 85, 0);
          objc_msgSend(v96, "addObject:", v169);

        }
        if ((unint64_t)objc_msgSend(v96, "count") >= 2)
        {
          v170 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "localizedStringForKey:value:table:", CFSTR("No punch"), CFSTR("No punch"), CFSTR("Localizable"));
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v170, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v172, 0, 0);
          objc_msgSend(v96, "insertObject:atIndex:", v173, 0);

        }
        if (objc_msgSend(v96, "count"))
        {
          v174 = (unint64_t)objc_msgSend(v96, "count") > 1;
          v175 = [UIPrinterFinishingOption alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "localizedStringForKey:value:table:", CFSTR("Punch"), CFSTR("Punch"), CFSTR("Localizable"));
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintOption printPanelViewController](v310, "printPanelViewController");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintFinishingsOption finishingOptionsTableView](v310, "finishingOptionsTableView");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          v180 = -[UIPrinterFinishingOption initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:](v175, "initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:", v177, 1, v174, v96, v178, v179);
          objc_msgSend(v311, "addObject:", v180);

          v9 = v312;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
        v181 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 90);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = objc_msgSend(v9, "containsObject:", v182);

        if (v183)
        {
          v184 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v185, "localizedStringForKey:value:table:", CFSTR("Accordion"), CFSTR("Accordion"), CFSTR("Localizable"));
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          v187 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v184, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v186, 90, 0);
          objc_msgSend(v181, "addObject:", v187);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 91);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = objc_msgSend(v9, "containsObject:", v188);

        if (v189)
        {
          v190 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v191, "localizedStringForKey:value:table:", CFSTR("Double Gate"), CFSTR("Double Gate"), CFSTR("Localizable"));
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          v193 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v190, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v192, 91, 0);
          objc_msgSend(v181, "addObject:", v193);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 92);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v195 = objc_msgSend(v9, "containsObject:", v194);

        if (v195)
        {
          v196 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "localizedStringForKey:value:table:", CFSTR("Gate"), CFSTR("Gate"), CFSTR("Localizable"));
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v196, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v198, 92, 0);
          objc_msgSend(v181, "addObject:", v199);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 93);
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        v201 = objc_msgSend(v9, "containsObject:", v200);

        if (v201)
        {
          v202 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v203, "localizedStringForKey:value:table:", CFSTR("Half"), CFSTR("Half"), CFSTR("Localizable"));
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          v205 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v202, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v204, 93, 0);
          objc_msgSend(v181, "addObject:", v205);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 94);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        v207 = objc_msgSend(v9, "containsObject:", v206);

        if (v207)
        {
          v208 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v209, "localizedStringForKey:value:table:", CFSTR("Half Z"), CFSTR("Half Z"), CFSTR("Localizable"));
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          v211 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v208, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v210, 94, 0);
          objc_msgSend(v181, "addObject:", v211);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 95);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        v213 = objc_msgSend(v9, "containsObject:", v212);

        if (v213)
        {
          v214 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "localizedStringForKey:value:table:", CFSTR("Left Gate"), CFSTR("Left Gate"), CFSTR("Localizable"));
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          v217 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v214, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v216, 95, 0);
          objc_msgSend(v181, "addObject:", v217);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 96);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = objc_msgSend(v9, "containsObject:", v218);

        if (v219)
        {
          v220 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v221, "localizedStringForKey:value:table:", CFSTR("Letter"), CFSTR("Letter"), CFSTR("Localizable"));
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          v223 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v220, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v222, 96, 0);
          objc_msgSend(v181, "addObject:", v223);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 97);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        v225 = objc_msgSend(v9, "containsObject:", v224);

        if (v225)
        {
          v226 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v227, "localizedStringForKey:value:table:", CFSTR("Parallel"), CFSTR("Parallel"), CFSTR("Localizable"));
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          v229 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v226, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v228, 97, 0);
          objc_msgSend(v181, "addObject:", v229);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 98);
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        v231 = objc_msgSend(v9, "containsObject:", v230);

        if (v231)
        {
          v232 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v233, "localizedStringForKey:value:table:", CFSTR("Poster"), CFSTR("Poster"), CFSTR("Localizable"));
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          v235 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v232, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v234, 98, 0);
          objc_msgSend(v181, "addObject:", v235);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 99);
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = objc_msgSend(v9, "containsObject:", v236);

        if (v237)
        {
          v238 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "localizedStringForKey:value:table:", CFSTR("Right Gate"), CFSTR("Right Gate"), CFSTR("Localizable"));
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          v241 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v238, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v240, 99, 0);
          objc_msgSend(v181, "addObject:", v241);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 100);
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        v243 = objc_msgSend(v9, "containsObject:", v242);

        if (v243)
        {
          v244 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v245, "localizedStringForKey:value:table:", CFSTR("Z-Fold"), CFSTR("Z-Fold"), CFSTR("Localizable"));
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          v247 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v244, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v246, 100, 0);
          objc_msgSend(v181, "addObject:", v247);

        }
        if ((unint64_t)objc_msgSend(v181, "count") >= 2)
        {
          v248 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v249, "localizedStringForKey:value:table:", CFSTR("No fold"), CFSTR("No fold"), CFSTR("Localizable"));
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          v251 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v248, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v250, 0, 0);
          objc_msgSend(v181, "insertObject:atIndex:", v251, 0);

        }
        if (objc_msgSend(v181, "count"))
        {
          v252 = (unint64_t)objc_msgSend(v181, "count") > 1;
          v253 = [UIPrinterFinishingOption alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v254, "localizedStringForKey:value:table:", CFSTR("Fold"), CFSTR("Fold"), CFSTR("Localizable"));
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintOption printPanelViewController](v310, "printPanelViewController");
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintFinishingsOption finishingOptionsTableView](v310, "finishingOptionsTableView");
          v257 = (void *)objc_claimAutoreleasedReturnValue();
          v258 = -[UIPrinterFinishingOption initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:](v253, "initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:", v255, 2, v252, v181, v256, v257);
          objc_msgSend(v311, "addObject:", v258);

          v9 = v312;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 16);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        v260 = objc_msgSend(v9, "containsObject:", v259);

        if (v260)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          v261 = (void *)objc_claimAutoreleasedReturnValue();

          v262 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v263, "localizedStringForKey:value:table:", CFSTR("Laminate"), CFSTR("Laminate"), CFSTR("Localizable"));
          v264 = (void *)objc_claimAutoreleasedReturnValue();
          v265 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v262, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v264, 16, 0);
          objc_msgSend(v261, "addObject:", v265);

          v266 = [UIPrinterFinishingOption alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v267, "localizedStringForKey:value:table:", CFSTR("Laminate"), CFSTR("Laminate"), CFSTR("Localizable"));
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintOption printPanelViewController](v310, "printPanelViewController");
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintFinishingsOption finishingOptionsTableView](v310, "finishingOptionsTableView");
          v270 = (void *)objc_claimAutoreleasedReturnValue();
          v271 = -[UIPrinterFinishingOption initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:](v266, "initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:", v268, 3, 0, v261, v269, v270);
          objc_msgSend(v311, "addObject:", v271);

          v9 = v312;
          v181 = v261;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 15);
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        v273 = objc_msgSend(v9, "containsObject:", v272);

        if (v273)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          v274 = (void *)objc_claimAutoreleasedReturnValue();

          v275 = [UIPrintFinishingChoice alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v276, "localizedStringForKey:value:table:", CFSTR("Coat"), CFSTR("Coat"), CFSTR("Localizable"));
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          v278 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v275, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v277, 15, 0);
          objc_msgSend(v274, "addObject:", v278);

          v279 = [UIPrinterFinishingOption alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v280, "localizedStringForKey:value:table:", CFSTR("Coat"), CFSTR("Coat"), CFSTR("Localizable"));
          v281 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v310;
          -[UIPrintOption printPanelViewController](v310, "printPanelViewController");
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPrintFinishingsOption finishingOptionsTableView](v310, "finishingOptionsTableView");
          v283 = (void *)objc_claimAutoreleasedReturnValue();
          v284 = -[UIPrinterFinishingOption initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:](v279, "initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:", v281, 4, 0, v274, v282, v283);
          objc_msgSend(v311, "addObject:", v284);

          v181 = v274;
        }
        else
        {
          v3 = v310;
        }

        goto LABEL_100;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 70);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v9, "containsObject:", v100);

    v102 = [UIPrintFinishingChoice alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v103;
    if (v101)
    {
      objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("Single (Top-Left)"), CFSTR("Single (Top-Left)"), CFSTR("Localizable"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v102;
      v107 = v105;
      v108 = 70;
    }
    else
    {
      objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("Automatic"), CFSTR("Automatic"), CFSTR("Localizable"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v102;
      v107 = v105;
      v108 = 5;
    }
    v109 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:](v106, "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v107, v108, 0);
    objc_msgSend(v96, "addObject:", v109);

    v9 = v312;
    goto LABEL_44;
  }
LABEL_100:
  -[UIPrintOption printInfo](v3, "printInfo");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "currentPrinter");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v286, "outputBins");
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  if (v287)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    v314 = 0u;
    v315 = 0u;
    v316 = 0u;
    v317 = 0u;
    v308 = v287;
    obj = v287;
    v289 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v314, v318, 16);
    if (v289)
    {
      v290 = v289;
      v291 = *(_QWORD *)v315;
      do
      {
        for (i = 0; i != v290; ++i)
        {
          if (*(_QWORD *)v315 != v291)
            objc_enumerationMutation(obj);
          v293 = *(void **)(*((_QWORD *)&v314 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v293, "objectForKeyedSubscript:", CFSTR("OutputBinChoice"));
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v293, "objectForKeyedSubscript:", CFSTR("OutputBinChoice"));
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v294, "localizedStringForKey:value:table:", v295, v296, CFSTR("Localizable"));
          v297 = (void *)objc_claimAutoreleasedReturnValue();

          v298 = -[UIPrintFinishingChoice initWithTitle:finishingChoiceID:finishingChoiceInfo:]([UIPrintFinishingChoice alloc], "initWithTitle:finishingChoiceID:finishingChoiceInfo:", v297, 3, v293);
          objc_msgSend(v293, "objectForKey:", CFSTR("DefaultOutputBin"));
          v299 = (void *)objc_claimAutoreleasedReturnValue();

          if (v299)
            objc_msgSend(v288, "insertObject:atIndex:", v298, 0);
          else
            objc_msgSend(v288, "addObject:", v298);

        }
        v290 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v314, v318, 16);
      }
      while (v290);
    }

    if ((unint64_t)objc_msgSend(v288, "count") >= 2)
    {
      v300 = [UIPrinterFinishingOption alloc];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v301, "localizedStringForKey:value:table:", CFSTR("Output Bins"), CFSTR("Output Bins"), CFSTR("Localizable"));
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOption printPanelViewController](v310, "printPanelViewController");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintFinishingsOption finishingOptionsTableView](v310, "finishingOptionsTableView");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      v305 = -[UIPrinterFinishingOption initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:](v300, "initWithTitle:finishingType:viewType:optionChoices:printPanelViewController:finishingOptionsTableView:", v302, 6, 1, v288, v303, v304);
      objc_msgSend(v311, "addObject:", v305);

    }
    v287 = v308;
  }
  if (objc_msgSend(v311, "count", v308))
    v306 = v311;
  else
    v306 = 0;
  p_printerFinishingOptions = (NSArray **)location;
  objc_storeStrong(location, v306);

  return *p_printerFinishingOptions;
}

- (void)clearFinishingOptions
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStaple:", 0);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPunch:", 0);

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFold:", 0);

  -[UIPrintOption printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLaminate:", 0);

  -[UIPrintOption printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoat:", 0);

  -[UIPrintOption printInfo](self, "printInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFinishingTemplate:", 0);

  -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectedTemplate:", 0);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPrintFinishingsOption printerFinishingOptions](self, "printerFinishingOptions", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setSelectedChoice:", 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (UITableView)finishingOptionsTableView
{
  UITableView *finishingOptionsTableView;
  id v4;
  UITableView *v5;
  UITableView *v6;

  finishingOptionsTableView = self->_finishingOptionsTableView;
  if (!finishingOptionsTableView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_finishingOptionsTableView;
    self->_finishingOptionsTableView = v5;

    -[UITableView setDataSource:](self->_finishingOptionsTableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_finishingOptionsTableView, "setDelegate:", self);
    -[UITableView setEstimatedSectionHeaderHeight:](self->_finishingOptionsTableView, "setEstimatedSectionHeaderHeight:", 8.0);
    finishingOptionsTableView = self->_finishingOptionsTableView;
  }
  return finishingOptionsTableView;
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Finishing Options"), CFSTR("Finishing Options"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)summaryString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "finishingOption");

  if (v4 == 1)
  {
    -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "summary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[UIPrintFinishingsOption printerFinishingOptions](self, "printerFinishingOptions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "summary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if (objc_msgSend(v5, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR(" • "), CFSTR(" • "), CFSTR("Localizable"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appendString:", v13);

            }
            objc_msgSend(v5, "appendString:", v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    if (!objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("No finishing option summary"), CFSTR("No finishing option summary"), CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    v14 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("No finishing chosen"), CFSTR("No finishing chosen"), CFSTR("Localizable"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
LABEL_19:

  return v15;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[UIPrintOption printInfo](self, "printInfo", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "finishingOption"))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a4)
  {
    -[UIPrintOption printInfo](self, "printInfo", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "finishingOption") == 1)
    {
      v6 = 1;
    }
    else
    {
      -[UIPrintFinishingsOption printerFinishingOptions](self, "printerFinishingOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v12, "count");

    }
  }
  else
  {
    -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldShow");

    if (v8)
      v9 = 2;
    else
      v9 = 1;
    -[UIPrintFinishingsOption printerFinishingOptions](self, "printerFinishingOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
      return v9 + 1;
    else
      return v9;
  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  UIPrintOptionListCell *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "finishingOption");

    if (v9 == 1)
    {
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionListCell"));
      v10 = (UIPrintOptionListCell *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        v10 = -[UIPrintOptionListCell initWithStyle:reuseIdentifier:]([UIPrintOptionListCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("UIPrintOptionListCell"));
      objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Finishing Template"), CFSTR("Finishing Template"), CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v13);

      -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "summary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSecondaryText:", v15);

      -[UIPrintOptionListCell setContentConfiguration:](v10, "setContentConfiguration:", v11);
      -[UIPrintOptionListCell setAccessoryType:](v10, "setAccessoryType:", 1);
      -[UIPrintOptionListCell setSelectionStyle:](v10, "setSelectionStyle:", 3);
      -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOptionListCell setItemListDelegate:](v10, "setItemListDelegate:", v16);

      -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFinishingTemplatesCell:", v10);

    }
    else
    {
      -[UIPrintFinishingsOption printerFinishingOptions](self, "printerFinishingOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v7, "row"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "viewType"))
      {
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionListCell"));
        v10 = (UIPrintOptionListCell *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          v10 = -[UIPrintOptionListCell initWithStyle:reuseIdentifier:]([UIPrintOptionListCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("UIPrintOptionListCell"));
        -[UIPrintOptionListCell setAccessoryType:](v10, "setAccessoryType:", 1);
        -[UIPrintOptionListCell setSelectionStyle:](v10, "setSelectionStyle:", 3);
        -[UIPrintOptionListCell setItemListDelegate:](v10, "setItemListDelegate:", v11);
        objc_msgSend(v11, "optionChoices");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndex:", objc_msgSend(v11, "selectedChoice"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "title");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
        v10 = (UIPrintOptionListCell *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          v10 = -[UIPrintOptionCell initWithStyle:reuseIdentifier:]([UIPrintOptionCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("UIPrintOptionCell"));
        -[UIPrintOptionListCell setSelectionStyle:](v10, "setSelectionStyle:", 0);
        createPrintKitUISwitch(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setOn:", objc_msgSend(v11, "selectedChoice") != 0);
        objc_msgSend(v28, "addTarget:action:forControlEvents:", v11, sel_updateSwitchValue_, 4096);
        -[UIPrintOptionListCell setAccessoryView:](v10, "setAccessoryView:", v28);
        v29 = 0;
      }
      objc_msgSend(v11, "setPrinterFinishingOptionCell:", v10);

      objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v33);

      objc_msgSend(v32, "setSecondaryText:", v29);
      -[UIPrintOptionListCell setContentConfiguration:](v10, "setContentConfiguration:", v32);

    }
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
    v10 = (UIPrintOptionListCell *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = -[UIPrintOptionCell initWithStyle:reuseIdentifier:]([UIPrintOptionCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("UIPrintOptionCell"));
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "row"))
    {
      if (objc_msgSend(v7, "row") == 1)
      {
        -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "shouldShow");

        -[UIPrintOption printInfo](self, "printInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "finishingOption");

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v19)
        {
          v24 = v21 == 1;
          v25 = CFSTR("Finishing Templates");
        }
        else
        {
          v24 = v21 == 2;
          v25 = CFSTR("Printer Options");
        }
      }
      else
      {
        -[UIPrintOption printInfo](self, "printInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v31, "finishingOption") == 2;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v25 = CFSTR("Printer Options");
      }
    }
    else
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v30, "finishingOption") == 0;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v25 = CFSTR("No finishing option");
    }
    objc_msgSend(v22, "localizedStringForKey:value:table:", v25, v25, CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v34);

    -[UIPrintOptionListCell setSelectionStyle:](v10, "setSelectionStyle:", 3);
    -[UIPrintOptionListCell setContentConfiguration:](v10, "setContentConfiguration:", v11);
    if (v24)
      v35 = 3;
    else
      v35 = 0;
    -[UIPrintOptionListCell setAccessoryType:](v10, "setAccessoryType:", v35);
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v13, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "printOptionCellTapped");
    objc_msgSend(v7, "setSelected:", 0);
    goto LABEL_12;
  }
  -[UIPrintFinishingsOption clearFinishingOptions](self, "clearFinishingOptions");
  if (!objc_msgSend(v6, "row"))
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v11 = 0;
LABEL_11:
    objc_msgSend(v10, "setFinishingOption:", v11);
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "row") != 1)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v11 = 2;
    goto LABEL_11;
  }
  -[UIPrintFinishingsOption finishingTemplatesOption](self, "finishingTemplatesOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "shouldShow"))
    v8 = 1;
  else
    v8 = 2;
  -[UIPrintOption printInfo](self, "printInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFinishingOption:", v8);

LABEL_12:
  -[UIPrintFinishingsOption summaryString](self, "summaryString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v12);

}

- (void)setPrinterFinishingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_printerFinishingOptions, a3);
}

- (void)setFinishingOptionsTableView:(id)a3
{
  objc_storeStrong((id *)&self->_finishingOptionsTableView, a3);
}

- (UIPrintFinishingTemplatesOption)finishingTemplatesOption
{
  return self->_finishingTemplatesOption;
}

- (void)setFinishingTemplatesOption:(id)a3
{
  objc_storeStrong((id *)&self->_finishingTemplatesOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishingTemplatesOption, 0);
  objc_storeStrong((id *)&self->_finishingOptionsTableView, 0);
  objc_storeStrong((id *)&self->_printerFinishingOptions, 0);
}

@end
