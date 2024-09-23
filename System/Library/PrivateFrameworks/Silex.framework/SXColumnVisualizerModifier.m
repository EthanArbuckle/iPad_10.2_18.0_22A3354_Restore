@implementation SXColumnVisualizerModifier

- (void)modifyDOM:(id)a3 context:(id)a4
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  unint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  SXTextComponent *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  SXTextComponent *v143;
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
  void *v156;
  void *v157;
  void *v158;
  _QWORD v159[5];
  _QWORD v160[5];
  _QWORD v161[3];
  _QWORD v162[3];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[2];
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[2];
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[3];
  _QWORD v176[3];
  _QWORD v177[3];
  _QWORD v178[3];
  _QWORD v179[3];
  _QWORD v180[3];
  _QWORD v181[3];
  _QWORD v182[3];
  _QWORD v183[3];
  _QWORD v184[3];
  _QWORD v185[3];
  _QWORD v186[3];
  _QWORD v187[2];
  _QWORD v188[2];
  _QWORD v189[3];
  _QWORD v190[5];
  CGSize v191;
  CGSize v192;

  v190[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v7;
  objc_msgSend(v7, "layoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "columnLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXColumnVisualizerModifier componentStyleWithJSON:](self, "componentStyleWithJSON:", &unk_24D703288);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentStyleWithJSON:](self, "componentStyleWithJSON:", &unk_24D7032B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentStyleWithJSON:](self, "componentStyleWithJSON:", &unk_24D7032D8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentStyleWithJSON:](self, "componentStyleWithJSON:", &unk_24D703300);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentStyles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v10;
  objc_msgSend(v14, "setObject:forKey:", v10, v15);

  objc_msgSend(v6, "componentStyles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v11;
  objc_msgSend(v16, "setObject:forKey:", v11, v17);

  v153 = v6;
  objc_msgSend(v6, "componentStyles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v12;
  objc_msgSend(v18, "setObject:forKey:", v12, v19);

  objc_msgSend(v6, "componentStyles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v13;
  objc_msgSend(v20, "setObject:forKey:", v13, v21);

  v190[0] = CFSTR("both");
  v189[0] = CFSTR("ignoreViewportPadding");
  v189[1] = CFSTR("columnRange");
  v187[0] = CFSTR("start");
  v187[1] = CFSTR("length");
  v188[0] = &unk_24D6FEEF0;
  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "documentLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "columns"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v188[1] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v188, v187, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v25;
  v189[2] = CFSTR("minimumHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v190, v189, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentLayoutWithJSON:](self, "componentLayoutWithJSON:", v27);
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  v185[0] = CFSTR("minimumWidth");
  v28 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "leftScreenMargin");
  objc_msgSend(v28, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v186[0] = v29;
  v185[1] = CFSTR("maximumWidth");
  v30 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "leftScreenMargin");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v186[1] = v31;
  v185[2] = CFSTR("minimumHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v186[2] = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v186, v185, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentLayoutWithJSON:](self, "componentLayoutWithJSON:", v33);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  v183[0] = CFSTR("minimumWidth");
  v34 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "rightScreenMargin");
  objc_msgSend(v34, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v184[0] = v35;
  v183[1] = CFSTR("maximumWidth");
  v36 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "rightScreenMargin");
  objc_msgSend(v36, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v184[1] = v37;
  v183[2] = CFSTR("minimumHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v184[2] = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v184, v183, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentLayoutWithJSON:](self, "componentLayoutWithJSON:", v39);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  v181[0] = CFSTR("minimumWidth");
  v40 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "leftMargin");
  objc_msgSend(v40, "numberWithDouble:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v182[0] = v41;
  v181[1] = CFSTR("maximumWidth");
  v42 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "leftMargin");
  objc_msgSend(v42, "numberWithDouble:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v182[1] = v43;
  v181[2] = CFSTR("minimumHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v182[2] = v44;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v182, v181, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentLayoutWithJSON:](self, "componentLayoutWithJSON:", v45);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  v179[0] = CFSTR("minimumWidth");
  v46 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "rightMargin");
  objc_msgSend(v46, "numberWithDouble:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v180[0] = v47;
  v179[1] = CFSTR("maximumWidth");
  v48 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "rightMargin");
  objc_msgSend(v48, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v180[1] = v49;
  v179[2] = CFSTR("minimumHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v180[2] = v50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v180, v179, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentLayoutWithJSON:](self, "componentLayoutWithJSON:", v51);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  v177[0] = CFSTR("minimumWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "gutter"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v178[0] = v52;
  v177[1] = CFSTR("maximumWidth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "gutter"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v178[1] = v53;
  v177[2] = CFSTR("minimumHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v178[2] = v54;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v178, v177, 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentLayoutWithJSON:](self, "componentLayoutWithJSON:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v175[0] = CFSTR("minimumWidth");
  v57 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "columnWidth");
  objc_msgSend(v57, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v176[0] = v58;
  v175[1] = CFSTR("maximumWidth");
  v59 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "columnWidth");
  objc_msgSend(v59, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v60;
  v175[2] = CFSTR("minimumHeight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v176[2] = v61;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v176, v175, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier componentLayoutWithJSON:](self, "componentLayoutWithJSON:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentLayouts");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "identifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = v56;
  objc_msgSend(v64, "setObject:forKey:", v56, v65);

  objc_msgSend(v6, "componentLayouts");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "identifier");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v63;
  objc_msgSend(v66, "setObject:forKey:", v63, v67);

  objc_msgSend(v6, "componentLayouts");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "identifier");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKey:", v145, v69);

  objc_msgSend(v6, "componentLayouts");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "identifier");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKey:", v150, v71);

  objc_msgSend(v6, "componentLayouts");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "identifier");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKey:", v149, v73);

  objc_msgSend(v6, "componentLayouts");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "identifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setObject:forKey:", v152, v75);

  objc_msgSend(v6, "componentLayouts");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "identifier");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setObject:forKey:", v151, v77);

  objc_msgSend(v9, "leftScreenMargin");
  if (v78 > 0.0)
  {
    v173[0] = CFSTR("layout");
    objc_msgSend(v152, "identifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v173[1] = CFSTR("style");
    v174[0] = v79;
    objc_msgSend(v147, "identifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v174[1] = v80;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v174, v173, 2);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXColumnVisualizerModifier containerComponentWithJSON:](self, "containerComponentWithJSON:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "JSONRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v83);

  }
  objc_msgSend(v9, "leftMargin");
  if (v84 > 0.0)
  {
    v171[0] = CFSTR("layout");
    objc_msgSend(v150, "identifier");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v171[1] = CFSTR("style");
    v172[0] = v85;
    objc_msgSend(v11, "identifier");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v172[1] = v86;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v172, v171, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXColumnVisualizerModifier containerComponentWithJSON:](self, "containerComponentWithJSON:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "JSONRepresentation");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v89);

  }
  objc_msgSend(v148, "layoutOptions");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "columnLayout");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "numberOfColumns");

  if (v92)
  {
    v93 = 0;
    do
    {
      v169[0] = CFSTR("layout");
      objc_msgSend(v156, "identifier");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v169[1] = CFSTR("style");
      v170[0] = v94;
      objc_msgSend(v157, "identifier");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v170[1] = v95;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v170, v169, 2);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXColumnVisualizerModifier containerComponentWithJSON:](self, "containerComponentWithJSON:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "JSONRepresentation");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "addObject:", v98);

      if (++v93 < v92 && objc_msgSend(v9, "gutter") >= 1)
      {
        v167[0] = CFSTR("layout");
        objc_msgSend(v154, "identifier");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v167[1] = CFSTR("style");
        v168[0] = v99;
        objc_msgSend(v155, "identifier");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v168[1] = v100;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v168, v167, 2);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXColumnVisualizerModifier containerComponentWithJSON:](self, "containerComponentWithJSON:", v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "JSONRepresentation");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "addObject:", v103);

      }
    }
    while (v92 != v93);
  }
  objc_msgSend(v9, "rightMargin");
  if (v104 > 0.0)
  {
    v165[0] = CFSTR("layout");
    objc_msgSend(v149, "identifier");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v165[1] = CFSTR("style");
    v166[0] = v105;
    objc_msgSend(v11, "identifier");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v166[1] = v106;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXColumnVisualizerModifier containerComponentWithJSON:](self, "containerComponentWithJSON:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "JSONRepresentation");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v109);

  }
  objc_msgSend(v9, "rightScreenMargin");
  if (v110 > 0.0)
  {
    v163[0] = CFSTR("layout");
    objc_msgSend(v151, "identifier");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v163[1] = CFSTR("style");
    v164[0] = v111;
    objc_msgSend(v147, "identifier");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v164[1] = v112;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v164, v163, 2);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXColumnVisualizerModifier containerComponentWithJSON:](self, "containerComponentWithJSON:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "JSONRepresentation");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "addObject:", v115);

  }
  objc_msgSend(v153, "components");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = CFSTR("layout");
  objc_msgSend(v145, "identifier");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v117;
  v162[1] = &unk_24D703328;
  v161[1] = CFSTR("contentDisplay");
  v161[2] = CFSTR("components");
  v162[2] = v158;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v162, v161, 3);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnVisualizerModifier containerComponentWithJSON:](self, "containerComponentWithJSON:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "insertComponent:atIndex:", v119, 0);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewportSize");
  NSStringFromCGSize(v191);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "appendFormat:", CFSTR("Viewport: %@\n"), v121);

  objc_msgSend(v9, "constrainedViewportSize");
  NSStringFromCGSize(v192);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "appendFormat:", CFSTR("Constrained Viewport: %@\n"), v122);

  objc_msgSend(v9, "leftScreenMargin");
  v124 = v123;
  objc_msgSend(v9, "rightScreenMargin");
  objc_msgSend(v120, "appendFormat:", CFSTR("Viewport Padding: %.0f/%.0f\n"), v124, v125);
  objc_msgSend(v9, "leftMargin");
  v127 = v126;
  objc_msgSend(v9, "rightMargin");
  objc_msgSend(v120, "appendFormat:", CFSTR("Document Margin: %lu/%lu\n"), v127, v128);
  objc_msgSend(v120, "appendFormat:", CFSTR("Columns: %lu\n"), objc_msgSend(v9, "numberOfColumns"));
  objc_msgSend(v9, "columnWidth");
  objc_msgSend(v120, "appendFormat:", CFSTR("ColumnWidth: %.0f\n"), v129);
  objc_msgSend(v120, "appendFormat:", CFSTR("Gutter: %lu\n"), objc_msgSend(v9, "gutter"));
  objc_msgSend(v9, "documentLayout");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "width");
  objc_msgSend(v9, "documentLayout");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend(v132, "columns");
  objc_msgSend(v9, "documentLayout");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend(v134, "margin");
  objc_msgSend(v9, "documentLayout");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "appendFormat:", CFSTR("Document Layout: {width: %lu, columns: %lu, margin: %lu, gutter: %lu}\n"), v131, v133, v135, objc_msgSend(v136, "gutter"));

  objc_msgSend(v9, "contentScaleFactor");
  objc_msgSend(v120, "appendFormat:", CFSTR("Content Scale: %.2f"), v137);
  v138 = [SXTextComponent alloc];
  v159[0] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "UUIDString");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v160[0] = v140;
  v160[1] = CFSTR("text");
  v159[1] = CFSTR("role");
  v159[2] = CFSTR("type");
  v160[2] = CFSTR("text");
  v159[3] = CFSTR("layout");
  objc_msgSend(v145, "identifier");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v159[4] = CFSTR("text");
  v160[3] = v141;
  v160[4] = v120;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v160, v159, 5);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = -[SXJSONObject initWithJSONObject:andVersion:](v138, "initWithJSONObject:andVersion:", v142, CFSTR("1.28"));

  objc_msgSend(v153, "components");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "insertComponent:atIndex:", v143, 0);

}

- (id)componentLayoutWithJSON:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SXComponentLayout *v6;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  v6 = -[SXJSONObject initWithJSONObject:andVersion:]([SXComponentLayout alloc], "initWithJSONObject:andVersion:", v3, CFSTR("1.28"));
  return v6;
}

- (id)componentStyleWithJSON:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SXComponentStyle *v6;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  v6 = -[SXJSONObject initWithJSONObject:andVersion:]([SXComponentStyle alloc], "initWithJSONObject:andVersion:", v3, CFSTR("1.28"));
  return v6;
}

- (id)containerComponentWithJSON:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SXContainerComponent *v6;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v3, "setObject:forKey:", CFSTR("container"), CFSTR("role"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("container"), CFSTR("type"));
  v6 = -[SXJSONObject initWithJSONObject:andVersion:]([SXContainerComponent alloc], "initWithJSONObject:andVersion:", v3, CFSTR("1.28"));

  return v6;
}

@end
