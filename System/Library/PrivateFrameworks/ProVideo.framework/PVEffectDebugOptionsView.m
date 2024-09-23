@implementation PVEffectDebugOptionsView

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PVEffectDebugOptionsView options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("enabled"));

  v4.receiver = self;
  v4.super_class = (Class)PVEffectDebugOptionsView;
  -[PVEffectDebugOptionsView dealloc](&v4, sel_dealloc);
}

- (PVEffectDebugOptionsView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PVEffectDebugOptionsView *v10;
  PVEffectDebugOptionsView *v11;
  id v12;
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
  id v23;
  void *v24;
  void *v25;
  PVEffectDebugKeyRowView *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  PVEffectDebugKeyRowView *v36;
  void *v37;
  PVEffectDebugKeyRowView *v38;
  id v39;
  id v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  CGFloat v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  PVEffectDebugKeyRowView *v58;
  void *v59;
  PVEffectDebugKeyRowView *v60;
  id v61;
  id v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  void *v67;
  double v68;
  CGFloat v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  PVEffectDebugKeyRowView *v77;
  void *v78;
  PVEffectDebugKeyRowView *v79;
  id v80;
  id v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  void *v86;
  double v87;
  CGFloat v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  void *v98;
  void *v99;
  PVEffectDebugKeyRowView *v100;
  void *v101;
  PVEffectDebugKeyRowView *v102;
  id v103;
  id v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  void *v109;
  double v110;
  CGFloat v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  uint64_t v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  PVEffectDebugKeyRowView *v122;
  void *v123;
  PVEffectDebugKeyRowView *v124;
  id v125;
  id v126;
  double v127;
  CGFloat v128;
  double v129;
  CGFloat v130;
  void *v131;
  double v132;
  CGFloat v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  PVEffectDebugKeyRowView *v144;
  id v145;
  void *v146;
  void *v147;
  PVEffectDebugKeyRowView *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  PVEffectDebugKeyRowView *v154;
  id v155;
  void *v156;
  void *v157;
  PVEffectDebugKeyRowView *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  id v162;
  void *v163;
  void *v164;
  PVEffectDebugKeyRowView *v165;
  void *v166;
  void *v167;
  id v168;
  id v169;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  PVEffectDebugOptionsView *v179;
  void *v180;
  void *v181;
  void *v182;
  _QWORD v183[4];
  id v184;
  id v185;
  _QWORD v186[4];
  id v187;
  __CFString *v188;
  _QWORD v189[4];
  id v190;
  __CFString *v191;
  _QWORD v192[4];
  id v193;
  __CFString *v194;
  _QWORD v195[4];
  id v196;
  __CFString *v197;
  _QWORD v198[4];
  id v199;
  __CFString *v200;
  _QWORD v201[4];
  id v202;
  __CFString *v203;
  _QWORD v204[4];
  id v205;
  __CFString *v206;
  _QWORD v207[4];
  id v208;
  __CFString *v209;
  objc_super v210;
  _QWORD v211[4];
  _QWORD v212[4];
  _QWORD v213[4];
  _QWORD v214[4];
  _QWORD v215[4];
  _QWORD v216[4];
  _QWORD v217[4];
  _QWORD v218[4];
  _QWORD v219[4];
  _QWORD v220[4];
  _QWORD v221[4];
  _QWORD v222[4];
  _QWORD v223[4];
  _QWORD v224[4];
  _QWORD v225[4];
  _QWORD v226[4];
  _QWORD v227[6];
  CGSize v228;
  CGSize v229;
  CGSize v230;
  CGSize v231;
  CGSize v232;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v227[4] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v210.receiver = self;
  v210.super_class = (Class)PVEffectDebugOptionsView;
  v10 = -[PVEffectDebugOptionsView initWithFrame:](&v210, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[PVEffectDebugOptionsView setOptions:](v10, "setOptions:", v9);
    v12 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    -[PVEffectDebugOptionsView bounds](v11, "bounds");
    v13 = (void *)objc_msgSend(v12, "initWithFrame:");
    -[PVEffectDebugOptionsView setRowsStackView:](v11, "setRowsStackView:", v13);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "setAlignment:", 1);
    objc_msgSend(v13, "setAxis:", 1);
    objc_msgSend(v13, "setDistribution:", 3);
    objc_msgSend(v13, "setSpacing:", 10.0);
    objc_msgSend(v13, "setLayoutMarginsRelativeArrangement:", 1);
    -[PVEffectDebugOptionsView addSubview:](v11, "addSubview:", v13);
    v172 = (void *)MEMORY[0x1E0CB3718];
    -[PVEffectDebugOptionsView layoutMarginsGuide](v11, "layoutMarginsGuide");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "leadingAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "constraintEqualToAnchor:", v177);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v227[0] = v176;
    -[PVEffectDebugOptionsView layoutMarginsGuide](v11, "layoutMarginsGuide");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "trailingAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:", v173);
    v180 = v9;
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v227[1] = v171;
    -[PVEffectDebugOptionsView layoutMarginsGuide](v11, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v227[2] = v17;
    v179 = v11;
    -[PVEffectDebugOptionsView layoutMarginsGuide](v11, "layoutMarginsGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v227[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v227, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "activateConstraints:", v22);

    v23 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("rectangle.3.offgrid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithImage:", v24);

    objc_msgSend(v25, "setFrame:", 0.0, 0.0, 30.0, 30.0);
    v26 = [PVEffectDebugKeyRowView alloc];
    v225[0] = CFSTR("title");
    v225[1] = CFSTR("icon");
    v226[0] = CFSTR("Enable Debug View");
    v226[1] = v25;
    v225[2] = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v180, "isEnabled"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v226[2] = v27;
    v225[3] = CFSTR("action");
    v28 = (void *)MEMORY[0x1E0CEA2A8];
    v207[0] = MEMORY[0x1E0C809B0];
    v207[1] = 3221225472;
    v207[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke;
    v207[3] = &unk_1E64D44D8;
    v29 = v180;
    v208 = v29;
    v209 = CFSTR("Enable Debug View");
    objc_msgSend(v28, "actionWithHandler:", v207);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v226[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v226, v225, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x1E0C9D648];
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v36 = -[PVEffectDebugKeyRowView initWithFrame:config:](v26, "initWithFrame:config:", v31, *MEMORY[0x1E0C9D648], v33, v34, v35);

    v182 = v13;
    objc_msgSend(v13, "addArrangedSubview:", v36);

    +[PVEffectDebugView documentBoundsLayerWithFrame:options:](PVEffectDebugView, "documentBoundsLayerWithFrame:options:", v29, 0.0, 0.0, 30.0, 30.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = [PVEffectDebugKeyRowView alloc];
    v224[0] = CFSTR("Document Bounds / Origin");
    v223[0] = CFSTR("title");
    v223[1] = CFSTR("icon");
    v39 = objc_alloc(MEMORY[0x1E0CEA658]);
    v40 = v37;
    objc_msgSend(v40, "frame");
    v42 = v41;
    objc_msgSend(v40, "frame");
    v44 = v43;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scale");
    v47 = v46;
    v228.width = v42;
    v228.height = v44;
    UIGraphicsBeginImageContextWithOptions(v228, 0, v47);

    objc_msgSend(v40, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v49 = (void *)objc_msgSend(v39, "initWithImage:", v48);
    v224[1] = v49;
    v223[2] = CFSTR("on");
    v50 = (void *)MEMORY[0x1E0CB37E8];
    v51 = objc_msgSend(v29, "showDocumentBoundingBox");
    v52 = 0;
    if (v51)
      v52 = objc_msgSend(v29, "showOrigin", 0);
    objc_msgSend(v50, "numberWithInt:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v224[2] = v53;
    v223[3] = CFSTR("action");
    v54 = (void *)MEMORY[0x1E0CEA2A8];
    v204[0] = MEMORY[0x1E0C809B0];
    v204[1] = 3221225472;
    v204[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_2;
    v204[3] = &unk_1E64D44D8;
    v55 = v29;
    v205 = v55;
    v206 = CFSTR("Document Bounds / Origin");
    objc_msgSend(v54, "actionWithHandler:", v204);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v224[3] = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v224, v223, 4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = -[PVEffectDebugKeyRowView initWithFrame:config:](v38, "initWithFrame:config:", v57, v32, v33, v34, v35);

    objc_msgSend(v182, "addArrangedSubview:", v58);
    +[PVEffectDebugView outputROILayerWithFrame:options:](PVEffectDebugView, "outputROILayerWithFrame:options:", v55, 0.0, 0.0, 30.0, 30.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = [PVEffectDebugKeyRowView alloc];
    v222[0] = CFSTR("Output ROI");
    v221[0] = CFSTR("title");
    v221[1] = CFSTR("icon");
    v61 = objc_alloc(MEMORY[0x1E0CEA658]);
    v62 = v59;
    objc_msgSend(v62, "frame");
    v64 = v63;
    objc_msgSend(v62, "frame");
    v66 = v65;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "scale");
    v69 = v68;
    v229.width = v64;
    v229.height = v66;
    UIGraphicsBeginImageContextWithOptions(v229, 0, v69);

    objc_msgSend(v62, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v71 = (void *)objc_msgSend(v61, "initWithImage:", v70);
    v222[1] = v71;
    v221[2] = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v55, "showOutputROI"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v222[2] = v72;
    v221[3] = CFSTR("action");
    v73 = (void *)MEMORY[0x1E0CEA2A8];
    v201[0] = MEMORY[0x1E0C809B0];
    v201[1] = 3221225472;
    v201[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_3;
    v201[3] = &unk_1E64D44D8;
    v74 = v55;
    v202 = v74;
    v203 = CFSTR("Output ROI");
    objc_msgSend(v73, "actionWithHandler:", v201);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v222[3] = v75;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v222, v221, 4);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[PVEffectDebugKeyRowView initWithFrame:config:](v60, "initWithFrame:config:", v76, v32, v33, v34, v35);

    objc_msgSend(v182, "addArrangedSubview:", v77);
    +[PVEffectDebugView objectBoundsLayerWithFrame:options:](PVEffectDebugView, "objectBoundsLayerWithFrame:options:", v74, 0.0, 0.0, 30.0, 30.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = [PVEffectDebugKeyRowView alloc];
    v220[0] = CFSTR("Object Bounds / Midpoint");
    v219[0] = CFSTR("title");
    v219[1] = CFSTR("icon");
    v80 = objc_alloc(MEMORY[0x1E0CEA658]);
    v81 = v78;
    objc_msgSend(v81, "frame");
    v83 = v82;
    objc_msgSend(v81, "frame");
    v85 = v84;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "scale");
    v88 = v87;
    v230.width = v83;
    v230.height = v85;
    UIGraphicsBeginImageContextWithOptions(v230, 0, v88);

    objc_msgSend(v81, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v90 = (void *)objc_msgSend(v80, "initWithImage:", v89);
    v220[1] = v90;
    v219[2] = CFSTR("on");
    v91 = (void *)MEMORY[0x1E0CB37E8];
    v92 = objc_msgSend(v74, "showObjectAlignedBoundingBox");
    v93 = 0;
    if (v92)
    {
      if (objc_msgSend(v74, "showMidpoint", 0))
        v93 = objc_msgSend(v74, "showCornerPoints");
      else
        v93 = 0;
    }
    objc_msgSend(v91, "numberWithInt:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v220[2] = v94;
    v219[3] = CFSTR("action");
    v95 = (void *)MEMORY[0x1E0CEA2A8];
    v96 = MEMORY[0x1E0C809B0];
    v198[0] = MEMORY[0x1E0C809B0];
    v198[1] = 3221225472;
    v198[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_4;
    v198[3] = &unk_1E64D44D8;
    v97 = v74;
    v199 = v97;
    v200 = CFSTR("Object Bounds / Midpoint");
    objc_msgSend(v95, "actionWithHandler:", v198);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v220[3] = v98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v220, v219, 4);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = -[PVEffectDebugKeyRowView initWithFrame:config:](v79, "initWithFrame:config:", v99, v32, v33, v34, v35);

    objc_msgSend(v182, "addArrangedSubview:", v100);
    +[PVEffectDebugView textBoundsLayerWithFrame:options:](PVEffectDebugView, "textBoundsLayerWithFrame:options:", v97, 0.0, 0.0, 30.0, 30.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = [PVEffectDebugKeyRowView alloc];
    v218[0] = CFSTR("Text Bounds");
    v217[0] = CFSTR("title");
    v217[1] = CFSTR("icon");
    v103 = objc_alloc(MEMORY[0x1E0CEA658]);
    v104 = v101;
    objc_msgSend(v104, "frame");
    v106 = v105;
    objc_msgSend(v104, "frame");
    v108 = v107;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "scale");
    v111 = v110;
    v231.width = v106;
    v231.height = v108;
    UIGraphicsBeginImageContextWithOptions(v231, 0, v111);

    objc_msgSend(v104, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v113 = (void *)objc_msgSend(v103, "initWithImage:", v112);
    v218[1] = v113;
    v217[2] = CFSTR("on");
    v114 = (void *)MEMORY[0x1E0CB37E8];
    v115 = objc_msgSend(v97, "showTextBoundingBoxes");
    v116 = 0;
    if (v115)
      v116 = objc_msgSend(v97, "showTextCornerPoints", 0);
    objc_msgSend(v114, "numberWithInt:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v218[2] = v117;
    v217[3] = CFSTR("action");
    v118 = (void *)MEMORY[0x1E0CEA2A8];
    v195[0] = v96;
    v195[1] = 3221225472;
    v195[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_5;
    v195[3] = &unk_1E64D44D8;
    v119 = v97;
    v196 = v119;
    v197 = CFSTR("Text Bounds");
    objc_msgSend(v118, "actionWithHandler:", v195);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v218[3] = v120;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v218, v217, 4);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = -[PVEffectDebugKeyRowView initWithFrame:config:](v102, "initWithFrame:config:", v121, v32, v33, v34, v35);

    objc_msgSend(v182, "addArrangedSubview:", v122);
    +[PVEffectDebugView hitAreaShapeLayerWithFrame:options:](PVEffectDebugView, "hitAreaShapeLayerWithFrame:options:", v119, 0.0, 0.0, 30.0, 30.0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = [PVEffectDebugKeyRowView alloc];
    v216[0] = CFSTR("Hit Shape");
    v215[0] = CFSTR("title");
    v215[1] = CFSTR("icon");
    v125 = objc_alloc(MEMORY[0x1E0CEA658]);
    v126 = v123;
    objc_msgSend(v126, "frame");
    v128 = v127;
    objc_msgSend(v126, "frame");
    v130 = v129;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "scale");
    v133 = v132;
    v232.width = v128;
    v232.height = v130;
    UIGraphicsBeginImageContextWithOptions(v232, 0, v133);

    objc_msgSend(v126, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v135 = (void *)objc_msgSend(v125, "initWithImage:", v134);
    v216[1] = v135;
    v215[2] = CFSTR("on");
    v136 = (void *)MEMORY[0x1E0CB37E8];
    v137 = objc_msgSend(v119, "showHitAreaShape");
    v138 = 0;
    if (v137)
      v138 = objc_msgSend(v119, "showHitAreaPoints", 0);
    objc_msgSend(v136, "numberWithInt:", v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v216[2] = v139;
    v215[3] = CFSTR("action");
    v140 = (void *)MEMORY[0x1E0CEA2A8];
    v192[0] = v96;
    v192[1] = 3221225472;
    v192[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_6;
    v192[3] = &unk_1E64D44D8;
    v141 = v119;
    v193 = v141;
    v194 = CFSTR("Hit Shape");
    objc_msgSend(v140, "actionWithHandler:", v192);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v216[3] = v142;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v216, v215, 4);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = -[PVEffectDebugKeyRowView initWithFrame:config:](v124, "initWithFrame:config:", v143, v32, v33, v34, v35);

    objc_msgSend(v182, "addArrangedSubview:", v144);
    v145 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.fill"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = (void *)objc_msgSend(v145, "initWithImage:", v146);

    objc_msgSend(v147, "setFrame:", 0.0, 0.0, 30.0, 30.0);
    v148 = [PVEffectDebugKeyRowView alloc];
    v213[0] = CFSTR("title");
    v213[1] = CFSTR("icon");
    v214[0] = CFSTR("User Rects");
    v214[1] = v147;
    v213[2] = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v141, "showUserRects"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v214[2] = v149;
    v213[3] = CFSTR("action");
    v150 = (void *)MEMORY[0x1E0CEA2A8];
    v189[0] = v96;
    v189[1] = 3221225472;
    v189[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_7;
    v189[3] = &unk_1E64D44D8;
    v151 = v141;
    v190 = v151;
    v191 = CFSTR("User Rects");
    objc_msgSend(v150, "actionWithHandler:", v189);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v214[3] = v152;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v214, v213, 4);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = -[PVEffectDebugKeyRowView initWithFrame:config:](v148, "initWithFrame:config:", v153, v32, v33, v34, v35);

    objc_msgSend(v182, "addArrangedSubview:", v154);
    v155 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("person.fill"));
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = (void *)objc_msgSend(v155, "initWithImage:", v156);

    objc_msgSend(v157, "setFrame:", 0.0, 0.0, 30.0, 30.0);
    v158 = [PVEffectDebugKeyRowView alloc];
    v211[0] = CFSTR("title");
    v211[1] = CFSTR("icon");
    v212[0] = CFSTR("User Points");
    v212[1] = v157;
    v211[2] = CFSTR("on");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v151, "showUserPoints"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v212[2] = v159;
    v211[3] = CFSTR("action");
    v160 = (void *)MEMORY[0x1E0CEA2A8];
    v161 = MEMORY[0x1E0C809B0];
    v186[0] = MEMORY[0x1E0C809B0];
    v186[1] = 3221225472;
    v186[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_8;
    v186[3] = &unk_1E64D44D8;
    v162 = v151;
    v187 = v162;
    v188 = CFSTR("User Points");
    objc_msgSend(v160, "actionWithHandler:", v186);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v212[3] = v163;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v212, v211, 4);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = -[PVEffectDebugKeyRowView initWithFrame:config:](v158, "initWithFrame:config:", v164, v32, v33, v34, v35);

    objc_msgSend(v182, "addArrangedSubview:", v165);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "arrangedSubviews");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v183[0] = v161;
    v183[1] = 3221225472;
    v183[2] = __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_9;
    v183[3] = &unk_1E64D4500;
    v184 = v166;
    v185 = v182;
    v168 = v182;
    v169 = v166;
    objc_msgSend(v167, "enumerateObjectsUsingBlock:", v183);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v169);
    v11 = v179;
    -[PVEffectDebugOptionsView updateWithOptions:](v179, "updateWithOptions:", v162);
    objc_msgSend(v162, "addObserver:forKeyPath:options:context:", v179, CFSTR("enabled"), 1, 0);

    v9 = v180;
  }

  return v11;
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke(uint64_t a1)
{
  int v2;
  const __CFString *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", v2 ^ 1u);
  v3 = CFSTR("On");
  if (v2)
    v3 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v3, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showDocumentBoundingBox");
  v3 = v2 ^ 1u;
  objc_msgSend(*(id *)(a1 + 32), "setShowDocumentBoundingBox:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setShowOrigin:", v3);
  v4 = CFSTR("On");
  if (v2)
    v4 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v4, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_3(uint64_t a1)
{
  int v2;
  const __CFString *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showOutputROI");
  objc_msgSend(*(id *)(a1 + 32), "setShowOutputROI:", v2 ^ 1u);
  v3 = CFSTR("On");
  if (v2)
    v3 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v3, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showObjectAlignedBoundingBox");
  v3 = v2 ^ 1u;
  objc_msgSend(*(id *)(a1 + 32), "setShowObjectAlignedBoundingBox:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setShowMidpoint:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setShowCornerPoints:", v3);
  v4 = CFSTR("On");
  if (v2)
    v4 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v4, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_5(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showTextBoundingBoxes");
  v3 = v2 ^ 1u;
  objc_msgSend(*(id *)(a1 + 32), "setShowTextBoundingBoxes:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setShowTextCornerPoints:", v3);
  v4 = CFSTR("On");
  if (v2)
    v4 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v4, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_6(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showHitAreaShape");
  v3 = v2 ^ 1u;
  objc_msgSend(*(id *)(a1 + 32), "setShowHitAreaShape:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setShowHitAreaPoints:", v3);
  v4 = CFSTR("On");
  if (v2)
    v4 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v4, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_7(uint64_t a1)
{
  int v2;
  const __CFString *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showUserRects");
  objc_msgSend(*(id *)(a1 + 32), "setShowUserRects:", v2 ^ 1u);
  v3 = CFSTR("On");
  if (v2)
    v3 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v3, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_8(uint64_t a1)
{
  int v2;
  const __CFString *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "showUserPoints");
  objc_msgSend(*(id *)(a1 + 32), "setShowUserPoints:", v2 ^ 1u);
  v3 = CFSTR("On");
  if (v2)
    v3 = CFSTR("Off");
  NSLog(CFSTR("switched %@ %@"), v3, *(_QWORD *)(a1 + 40));
}

void __50__PVEffectDebugOptionsView_initWithFrame_options___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "subviews");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

}

- (void)updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PVEffectDebugOptionsView rowsStackView](self, "rowsStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PVEffectDebugOptionsView_updateWithOptions___block_invoke;
  v8[3] = &unk_1E64D4528;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __46__PVEffectDebugOptionsView_updateWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v8;
    if (a3)
      objc_msgSend(v7, "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "isEnabled"));

    v6 = v8;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("enabled")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Updated %@ for %@"), v13, v14);

    -[PVEffectDebugOptionsView updateWithOptions:](self, "updateWithOptions:", v9);
  }

}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (PVEffectDebugViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (UIStackView)rowsStackView
{
  return self->_rowsStackView;
}

- (void)setRowsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_rowsStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowsStackView, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
}

@end
