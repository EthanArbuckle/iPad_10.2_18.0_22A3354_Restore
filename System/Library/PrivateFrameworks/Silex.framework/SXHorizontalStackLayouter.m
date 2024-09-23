@implementation SXHorizontalStackLayouter

- (id)initWithContainerComponent:(void *)a3 layouterFactory:(void *)a4 columnCalculator:(void *)a5 layoutContextFactory:(void *)a6 unitConverterFactory:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  id v18;
  objc_super v19;

  v18 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)SXHorizontalStackLayouter;
    v16 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      objc_storeStrong(a1 + 5, a5);
      objc_storeStrong(a1 + 6, a6);
    }
  }

  return a1;
}

- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  SXContainerComponentBlueprint *containerComponentBlueprint;
  void *v13;
  void *v14;
  void *v15;
  SXContainerComponentBlueprint *v16;
  void *v17;
  SXContainerComponentBlueprint *v18;
  void *v19;
  uint64_t v20;
  SXContainerComponentBlueprint *v21;
  void *v22;
  uint64_t v23;
  SXContainerComponentBlueprint *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  SXUnitConverterFactory *unitConverterFactory;
  SXUnitConverterFactory *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  void *v39;
  char isKindOfClass;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  uint64_t v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  uint64_t k;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  void *v78;
  void *v79;
  char v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t n;
  void *v86;
  void *v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  int v105;
  void *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  void *v121;
  SXHorizontalStackLayouter *v122;
  SXLayoutContextFactory *layoutContextFactory;
  void *v124;
  double v125;
  double v126;
  double v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  double v134;
  double v135;
  void *v136;
  char v137;
  void *v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  double v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  SXLayoutContextFactory *v147;
  void *v148;
  double v149;
  double v150;
  double v151;
  uint64_t v152;
  uint64_t v153;
  double v154;
  double v155;
  uint64_t v156;
  uint64_t v157;
  double v158;
  double v159;
  uint64_t v160;
  void *v161;
  NSObject *v162;
  void *v163;
  void *v164;
  id v166;
  id v167;
  void *v168;
  id v169;
  id obj;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  SXHorizontalStackLayoutCalculator *v174;
  uint64_t v175;
  uint64_t v176;
  void *v178;
  void *v179;
  void *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  uint8_t v210[128];
  uint8_t buf[4];
  id v212;
  __int16 v213;
  void *v214;
  uint64_t v215;

  v215 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v166 = a4;
  v167 = a5;
  v9 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v167, "taskIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v212 = v8;
    v213 = 2114;
    v214 = v11;
    _os_log_impl(&dword_217023000, v10, OS_LOG_TYPE_DEFAULT, "Starting horizontal stack layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);

  }
  if (self)
    containerComponentBlueprint = self->_containerComponentBlueprint;
  else
    containerComponentBlueprint = 0;
  -[SXContainerComponentBlueprint layoutBlueprint](containerComponentBlueprint, "layoutBlueprint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  if (self)
    v16 = self->_containerComponentBlueprint;
  else
    v16 = 0;
  -[SXComponentBlueprint componentLayout](v16, "componentLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v18 = self->_containerComponentBlueprint;
  else
    v18 = 0;
  -[SXComponentBlueprint componentSizer](v18, "componentSizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldIgnoreMarginsForColumnLayout:", v166);

  if (self)
    v21 = self->_containerComponentBlueprint;
  else
    v21 = 0;
  -[SXComponentBlueprint componentSizer](v21, "componentSizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldIgnoreViewportPaddingForColumnLayout:", v166);

  if (self)
    v24 = self->_containerComponentBlueprint;
  else
    v24 = 0;
  v25 = -[SXComponentBlueprint columnRange](v24, "columnRange");
  objc_msgSend(v166, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v25, v26, v20, objc_msgSend(v17, "ignoreDocumentGutter"), v23);
  v28 = v27;
  v164 = v17;
  if (self)
    unitConverterFactory = self->_unitConverterFactory;
  else
    unitConverterFactory = 0;
  v30 = unitConverterFactory;
  objc_msgSend(v8, "layoutOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXUnitConverterFactory createUnitConverterWithComponentWidth:parentWidth:layoutOptions:](v30, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v31, 0.0, v28);
  v168 = (void *)objc_claimAutoreleasedReturnValue();

  v174 = objc_alloc_init(SXHorizontalStackLayoutCalculator);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  v204 = 0u;
  v32 = v15;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v201, v210, 16);
  v180 = v8;
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v202;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v202 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * i);
        objc_msgSend(v8, "componentBlueprintForComponentIdentifier:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "component");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[SXHorizontalStackLayoutCalculator addFlexibleItemWithIdentifier:](v174, "addFlexibleItemWithIdentifier:", v37);
          objc_msgSend(v173, "addObject:", v37);
        }
        else
        {
          objc_msgSend(v38, "componentLayout");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "minimumWidth");
          objc_msgSend(v168, "convertValueToPoints:", v42, v43);
          v45 = fmax(v44, 0.0);
          v46 = objc_msgSend(v41, "maximumWidth");
          objc_msgSend(v168, "convertValueToPoints:", v46, v47);
          v49 = fmax(v48, 0.0);
          if (v49 >= 0.00000011920929)
            v50 = v49;
          else
            v50 = v28;
          -[SXHorizontalStackLayoutCalculator addItemWithMinimumWidth:maximumWidth:identifier:](v174, "addItemWithMinimumWidth:maximumWidth:identifier:", v37, v45, v50);
          objc_msgSend(v178, "addObject:", v37);

        }
        v8 = v180;
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v201, v210, 16);
    }
    while (v34);
  }

  -[SXHorizontalStackLayoutCalculator layoutForComponentWidth:](v174, "layoutForComponentWidth:", v28);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v51 = v32;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v197, v209, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v198;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v198 != v54)
          objc_enumerationMutation(v51);
        v56 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * j);
        objc_msgSend(v179, "widthForIdentifier:", v56);
        if (v57 < 2.22044605e-16)
        {
          objc_msgSend(v180, "componentBlueprintForComponentIdentifier:", v56);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setHidden:", 1);
          objc_msgSend(v173, "removeObject:", v56);
          objc_msgSend(v178, "removeObject:", v56);

        }
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v197, v209, 16);
    }
    while (v53);
  }

  v59 = v180;
  objc_msgSend(v180, "componentIdentifiers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (id *)-[SXComponentDependencyResolver initWithComponentIdentifiers:]([SXComponentDependencyResolver alloc], v60);
  objc_msgSend(v180, "setDependencySolver:", v61);
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  obj = v60;
  v175 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v208, 16);
  if (v175)
  {
    v171 = *(_QWORD *)v194;
    do
    {
      for (k = 0; k != v175; ++k)
      {
        if (*(_QWORD *)v194 != v171)
          objc_enumerationMutation(obj);
        v63 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * k);
        objc_msgSend(v59, "componentBlueprintForComponentIdentifier:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "component");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "anchor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          objc_msgSend(v66, "targetComponentIdentifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v67)
          {
            v191 = 0u;
            v192 = 0u;
            v189 = 0u;
            v190 = 0u;
            v72 = v178;
            v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v189, v207, 16);
            if (v74)
            {
              v75 = v74;
              v76 = *(_QWORD *)v190;
              do
              {
                for (m = 0; m != v75; ++m)
                {
                  if (*(_QWORD *)v190 != v76)
                    objc_enumerationMutation(v72);
                  SXComponentDependencyCreate(v63, *(void **)(*((_QWORD *)&v189 + 1) + 8 * m), (void *)1, (void *)2, 0);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v78);

                }
                v75 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v189, v207, 16);
              }
              while (v75);
            }
            goto LABEL_55;
          }
          objc_msgSend(v66, "targetComponentIdentifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(obj, "containsObject:", v68);

          if (v69)
          {
            objc_msgSend(v66, "targetComponentIdentifier");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            SXComponentDependencyCreate(v63, v70, (void *)1, (void *)1, 0);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v71);

            if (objc_msgSend(v66, "targetAnchorPosition") == 3 || objc_msgSend(v66, "targetAnchorPosition") == 2)
            {
              objc_msgSend(v66, "targetComponentIdentifier");
              v72 = (id)objc_claimAutoreleasedReturnValue();
              SXComponentDependencyCreate(v63, v72, (void *)1, (void *)2, 0);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v73);

LABEL_55:
            }
          }
        }
        objc_msgSend(v64, "component");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v80 = objc_opt_isKindOfClass();

        if ((v80 & 1) != 0)
        {
          v187 = 0u;
          v188 = 0u;
          v185 = 0u;
          v186 = 0u;
          v81 = v178;
          v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v185, v206, 16);
          if (v82)
          {
            v83 = v82;
            v84 = *(_QWORD *)v186;
            do
            {
              for (n = 0; n != v83; ++n)
              {
                if (*(_QWORD *)v186 != v84)
                  objc_enumerationMutation(v81);
                SXComponentDependencyCreate(v63, *(void **)(*((_QWORD *)&v185 + 1) + 8 * n), (void *)2, (void *)2, 0);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v86);

              }
              v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v185, v206, 16);
            }
            while (v83);
          }

          SXComponentDependencyCreate(v63, v63, (void *)1, (void *)2, 0);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v87);

        }
        v59 = v180;
      }
      v175 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v208, 16);
    }
    while (v175);
  }

  objc_msgSend(v59, "startUpdatesForWidth:", v28);
  objc_msgSend(v166, "minimumHeight");
  v89 = v88;
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  -[SXComponentDependencyResolver solvableOrder](v61);
  v169 = (id)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v181, v205, 16);
  if (v176)
  {
    v172 = *(_QWORD *)v182;
    do
    {
      v90 = 0;
      do
      {
        if (*(_QWORD *)v182 != v172)
          objc_enumerationMutation(v169);
        v91 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * v90);
        -[SXFullscreenCaption text](v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentBlueprintForComponentIdentifier:", v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "componentSizer");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "suggestedSizeAfterInvalidation");
        objc_msgSend(v94, "setSuggestedSize:");

        objc_msgSend(v179, "widthForIdentifier:", v92);
        v96 = v95;
        objc_msgSend(v93, "componentLayout");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "margin");
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = self;
        if (self)
          v99 = self->_unitConverterFactory;
        v100 = v99;
        objc_msgSend(v59, "layoutOptions");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v101, v96, v28);
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v103 = v93;
          objc_msgSend(v103, "layoutBlueprint");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v104, "isComplete"))
            v105 = objc_msgSend(v103, "hasValidLayout");
          else
            v105 = 0;

          v59 = v180;
        }
        else
        {
          v105 = 1;
        }
        if (objc_msgSend(v93, "hasValidPosition") && (v105 & 1) != 0
          || -[SXFullscreenCaption caption](v91) != 1)
        {
          if ((objc_msgSend(v93, "hasValidSize") & v105 & 1) == 0
            && -[SXFullscreenCaption caption](v91) == 2)
          {
            v111 = (void *)SXLayoutLog;
            if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
            {
              v112 = v111;
              objc_msgSend(v93, "component");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "identifier");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v167, "taskIdentifier");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v212 = v114;
              v213 = 2114;
              v214 = v115;
              _os_log_impl(&dword_217023000, v112, OS_LOG_TYPE_DEFAULT, "Calculating size, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

              v59 = v180;
            }
            objc_msgSend(v93, "componentLayout");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = objc_msgSend(v116, "minimumHeight");
            objc_msgSend(v102, "convertValueToPoints:", v117, v118);
            v120 = v119;

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[SXHorizontalStackLayouter childColumnLayoutForContainerComponentWidth:componentWidth:componentBlueprint:columnLayout:unitConverter:]((id *)&self->super.isa, v93, v166, v102, v28, v96);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "setMinimumHeight:", v120);
              if (self)
              {
                v122 = self;
                layoutContextFactory = self->_layoutContextFactory;
              }
              else
              {
                v122 = 0;
                layoutContextFactory = 0;
              }
              -[SXLayoutContextFactory createLayoutContextForColumnLayout:unitConverter:](layoutContextFactory, "createLayoutContextForColumnLayout:unitConverter:", v121, v102);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = -[SXHorizontalStackLayouter calculateSizeForContainerComponentWithBlueprint:width:layoutContext:layoutDescription:shouldContinue:]((id *)&v122->super.isa, v93, v124, v167, (uint64_t)a6, v96);
              if (v126 >= v120)
                v127 = v126;
              else
                v127 = v120;
              objc_msgSend(v59, "updateSize:forComponentWithIdentifier:", v92, v125, v127);
              v128 = objc_msgSend(v98, "top");
              objc_msgSend(v102, "convertValueToPoints:", v128, v129);
              v131 = v127 + v130;
              v132 = objc_msgSend(v98, "bottom");
              objc_msgSend(v102, "convertValueToPoints:", v132, v133);
              v135 = v131 + v134;
              if (v89 < v135)
                v89 = v135;

            }
            else
            {
              objc_msgSend(v93, "component");
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v137 = objc_opt_isKindOfClass();

              if ((v137 & 1) != 0)
              {
                objc_msgSend(v93, "component");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v139 = objc_opt_isKindOfClass();

                if ((v139 & 1) != 0)
                {
                  v140 = objc_msgSend(v98, "top");
                  objc_msgSend(v102, "convertValueToPoints:", v140, v141);
                  v143 = v89 - v142;
                  v144 = objc_msgSend(v98, "bottom");
                  objc_msgSend(v102, "convertValueToPoints:", v144, v145);
                  objc_msgSend(v59, "updateSize:forComponentWithIdentifier:", v92, v96, fmax(v143 - v146, 0.0));
                }
              }
              else
              {
                if (self)
                  v147 = self->_layoutContextFactory;
                else
                  v147 = 0;
                -[SXLayoutContextFactory createLayoutContextForColumnLayout:unitConverter:](v147, "createLayoutContextForColumnLayout:unitConverter:", v166, v102);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                v149 = -[SXHorizontalStackLayouter calculateSizeForComponentWithBlueprint:width:layoutContext:]((uint64_t)self, v93, v148, v96);
                if (v150 >= v120)
                  v151 = v150;
                else
                  v151 = v120;
                objc_msgSend(v59, "updateSize:forComponentWithIdentifier:", v92, v149, v151);
                v152 = objc_msgSend(v98, "top");
                objc_msgSend(v102, "convertValueToPoints:", v152, v153);
                v155 = v151 + v154;
                v156 = objc_msgSend(v98, "bottom");
                objc_msgSend(v102, "convertValueToPoints:", v156, v157);
                v159 = v155 + v158;
                if (v89 < v159)
                  v89 = v159;

              }
            }
          }
        }
        else
        {
          v106 = (void *)SXLayoutLog;
          if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
          {
            v107 = v106;
            objc_msgSend(v93, "component");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "identifier");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v167, "taskIdentifier");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v212 = v109;
            v213 = 2114;
            v214 = v110;
            _os_log_impl(&dword_217023000, v107, OS_LOG_TYPE_DEFAULT, "Calculating position, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

            v59 = v180;
          }
          objc_msgSend(v59, "updatePosition:forComponentWithIdentifier:", v92, -[SXHorizontalStackLayouter calculatePositionForComponentWithBlueprint:layout:unitConverter:margin:maximumY:layoutBlueprint:]((uint64_t)self, v93, v179, v102, v98, v59));
        }

        ++v90;
      }
      while (v176 != v90);
      v160 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v181, v205, 16);
      v176 = v160;
    }
    while (v160);
  }

  objc_msgSend(v59, "endUpdates");
  v161 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v162 = v161;
    objc_msgSend(v167, "taskIdentifier");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v212 = v59;
    v213 = 2114;
    v214 = v163;
    _os_log_impl(&dword_217023000, v162, OS_LOG_TYPE_DEFAULT, "Finished horizontal stack layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);

  }
}

- (double)calculatePositionForComponentWithBlueprint:(uint64_t)a1 layout:(void *)a2 unitConverter:(void *)a3 margin:(void *)a4 maximumY:(void *)a5 layoutBlueprint:(void *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v16 = objc_msgSend(v14, "top");
    objc_msgSend(v13, "convertValueToPoints:", v16, v17);
    objc_msgSend(v11, "component");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "positionForIdentifier:", v19);
    v21 = v20;

    objc_msgSend(v11, "component");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "anchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "targetComponentIdentifier");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
        goto LABEL_9;
      v25 = (void *)v24;
      objc_msgSend(v23, "targetComponentIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 16), "component");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26 == v28)
      {
LABEL_9:
        objc_msgSend(v23, "targetAnchorPosition");
        objc_msgSend(v11, "frame");
        CGRectGetHeight(v43);
        objc_msgSend(v23, "originAnchorPosition");
      }
      else
      {
        objc_msgSend(v23, "targetComponentIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "widthForIdentifier:", v29);
        v31 = v30;

        if (v31 > 0.0)
        {
          objc_msgSend(v23, "targetComponentIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "componentBlueprintForComponentIdentifier:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "range") == 0x7FFFFFFFFFFFFFFFLL
            || (objc_msgSend(v33, "component"),
                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                isKindOfClass = objc_opt_isKindOfClass(),
                v34,
                (isKindOfClass & 1) == 0))
          {
            objc_msgSend(v33, "frame");
            CGRectGetMinY(v44);
            objc_msgSend(v33, "frame");
            CGRectGetHeight(v45);
            objc_msgSend(v23, "targetAnchorPosition");
          }
          else
          {
            objc_msgSend(v33, "componentSizer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "frame");
            CGRectGetMinY(v42);
            v37 = objc_msgSend(v23, "range");
            objc_msgSend(v36, "verticalPositionForRange:", v37, v38);

          }
          objc_msgSend(v11, "frame");
          CGRectGetHeight(v46);
          objc_msgSend(v23, "originAnchorPosition");

        }
      }
      objc_msgSend(v11, "frame");
      CGRectGetHeight(v47);
      v39 = objc_msgSend(v14, "bottom");
      objc_msgSend(v13, "convertValueToPoints:", v39, v40);
    }

  }
  else
  {
    v21 = 0.0;
  }

  return v21;
}

- (id)childColumnLayoutForContainerComponentWidth:(void *)a3 componentWidth:(void *)a4 componentBlueprint:(double)a5 columnLayout:(double)a6 unitConverter:
{
  id *v6;
  id v11;
  id v12;
  id v13;
  SXDocumentLayout *v14;
  uint64_t v15;
  SXDocumentLayout *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v6 = a1;
  if (a1)
  {
    v11 = a4;
    v12 = a3;
    v13 = a2;
    v14 = [SXDocumentLayout alloc];
    v15 = objc_msgSend(v12, "gutter");

    v16 = -[SXDocumentLayout initWithWidth:margin:gutter:columns:](v14, "initWithWidth:margin:gutter:columns:", (uint64_t)a5, 0, v15, 1);
    objc_msgSend(v13, "componentSizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "contentInsetsWithUnitConverter:", v11);
    v19 = v18;
    v21 = v20;

    objc_msgSend(v6[4], "columnLayoutWithConstrainedViewportSize:viewportSize:documentLayout:", v16, a6 - (v19 + v21), a6 - (v19 + v21), a6 - (v19 + v21), a6 - (v19 + v21));
    v6 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (double)calculateSizeForContainerComponentWithBlueprint:(void *)a3 width:(void *)a4 layoutContext:(uint64_t)a5 layoutDescription:(double)a6 shouldContinue:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (!a1)
    return 0.0;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(v13, "layoutBlueprint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = a1[3];
  objc_msgSend(a1, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layouterForContainerComponentBlueprint:delegate:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "columnLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutBlueprint:columnLayout:description:shouldContinue:", v14, v18, v11, a5);

  objc_msgSend(v13, "componentSizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "unitConverter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "contentInsetsWithUnitConverter:", v20);
  objc_msgSend(v14, "blueprintSize");

  return a6;
}

- (double)calculateSizeForComponentWithBlueprint:(void *)a3 width:(double)a4 layoutContext:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  if (!a1)
    return 0.0;
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "componentSizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitConverter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInsetsWithUnitConverter:", v9);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v7, "componentSizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "calculateHeightForWidth:layoutContext:", v6, fmax(a4 - (v11 + v13), 0.0));
  return a4;
}

- (SXLayouterDelegate)delegate
{
  return (SXLayouterDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_layoutContextFactory, 0);
  objc_storeStrong((id *)&self->_columnCalculator, 0);
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_storeStrong((id *)&self->_containerComponentBlueprint, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
