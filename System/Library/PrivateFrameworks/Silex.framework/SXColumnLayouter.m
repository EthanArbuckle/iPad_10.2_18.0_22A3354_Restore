@implementation SXColumnLayouter

- (SXColumnLayouter)initWithLayouterFactory:(id)a3 layoutContextFactory:(id)a4 unitConverterFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXColumnLayouter *v12;
  SXColumnLayouter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXColumnLayouter;
  v12 = -[SXColumnLayouter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layouterFactory, a3);
    objc_storeStrong((id *)&v13->_layoutContextFactory, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
  }

  return v13;
}

- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *intersectionCache;
  double v17;
  double v18;
  uint64_t v19;
  SXComponentDependencyResolver *v20;
  void *v21;
  id *v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  char isKindOfClass;
  SXUnitConverterFactory *unitConverterFactory;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  SXLayouterFactory *layouterFactory;
  id WeakRetained;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  id v78;
  id *v79;
  BOOL *v80;
  id v81;
  id obj;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t v89[128];
  uint8_t buf[4];
  id v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v81 = a5;
  v12 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v81, "taskIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v91 = v10;
    v92 = 2114;
    v93 = v14;
    _os_log_impl(&dword_217023000, v13, OS_LOG_TYPE_DEFAULT, "Starting column layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);

  }
  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  intersectionCache = self->_intersectionCache;
  self->_intersectionCache = v15;

  *a6 = 1;
  objc_msgSend(v11, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", 0, objc_msgSend(v11, "numberOfColumns"), 3, 3, 3);
  v18 = v17;
  objc_msgSend(v10, "startUpdatesForWidth:");
  -[SXColumnLayouter columnStackForLayoutBlueprint:columnLayout:](self, "columnStackForLayoutBlueprint:columnLayout:", v10, v11);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = [SXComponentDependencyResolver alloc];
  objc_msgSend(v10, "componentIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id *)-[SXComponentDependencyResolver initWithComponentIdentifiers:](v20, v21);

  objc_msgSend(v10, "setDependencySolver:", v22);
  v77 = (void *)v19;
  -[SXColumnLayouter createDependenciesForLayoutBlueprint:columnStack:inDependencyResolver:](self, "createDependenciesForLayoutBlueprint:columnStack:inDependencyResolver:", v10, v19, v22);
  v79 = v22;
  -[SXComponentDependencyResolver solvableOrder](v22);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  if (!v84)
    goto LABEL_38;
  v83 = *(_QWORD *)v86;
  v80 = a6;
  v78 = v11;
  while (2)
  {
    for (i = 0; i != v84; ++i)
    {
      if (*(_QWORD *)v86 != v83)
        objc_enumerationMutation(obj);
      v24 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
      -[SXFullscreenCaption text](v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentBlueprintForComponentIdentifier:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = v26;
        objc_msgSend(v27, "layoutBlueprint");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "isComplete"))
          v29 = objc_msgSend(v27, "hasValidLayout");
        else
          v29 = 0;

      }
      else
      {
        v29 = 1;
      }
      objc_msgSend(v26, "componentSizer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "suggestedSizeAfterInvalidation");
      objc_msgSend(v30, "setSuggestedSize:");

      objc_msgSend(v26, "componentSizer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setComponentState:", v32);

      if (-[SXFullscreenCaption caption](v24) == 1
        && (objc_msgSend(v26, "hasValidPosition") & v29 & 1) == 0)
      {
        v62 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          v63 = v62;
          objc_msgSend(v26, "component");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "taskIdentifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v91 = v65;
          v92 = 2114;
          v93 = v66;
          _os_log_impl(&dword_217023000, v63, OS_LOG_TYPE_DEFAULT, "Calculating position, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

          a6 = v80;
        }
        -[SXColumnLayouter calculatePositionForComponentNode:columnLayout:layoutBlueprint:](self, "calculatePositionForComponentNode:columnLayout:layoutBlueprint:", v24, v11, v10);
        v68 = v67;
        v70 = v69;
        -[SXFullscreenCaption text](v24);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updatePosition:forComponentWithIdentifier:", v61, v68, v70);
      }
      else
      {
        if (-[SXFullscreenCaption caption](v24) != 2
          || (objc_msgSend(v26, "hasValidSize") & v29 & 1) != 0)
        {
          goto LABEL_29;
        }
        v33 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          objc_msgSend(v26, "component");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "taskIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v91 = v36;
          v92 = 2114;
          v93 = v37;
          _os_log_impl(&dword_217023000, v34, OS_LOG_TYPE_DEFAULT, "Calculating size, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

          a6 = v80;
        }
        -[SXColumnLayouter calculateSizeForComponentNode:columnLayout:layoutBlueprint:dependencyResolver:](self, "calculateSizeForComponentNode:columnLayout:layoutBlueprint:dependencyResolver:", v24, v11, v10, v79);
        v39 = v38;
        v41 = v40;
        objc_msgSend(v26, "component");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          unitConverterFactory = self->_unitConverterFactory;
          v45 = v26;
          objc_msgSend(v10, "layoutOptions");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXUnitConverterFactory createUnitConverterWithComponentWidth:parentWidth:layoutOptions:](unitConverterFactory, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v46, v39, v18);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "columnLayoutForComponentBlueprint:unitConverter:", v45, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          layouterFactory = self->_layouterFactory;
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          -[SXLayouterFactory layouterForContainerComponentBlueprint:delegate:](layouterFactory, "layouterForContainerComponentBlueprint:delegate:", v45, WeakRetained);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "layoutBlueprint");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "layoutBlueprint:columnLayout:description:shouldContinue:", v52, v48, v81, v80);

          objc_msgSend(v45, "componentSizer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "contentInsetsWithUnitConverter:", v47);
          v55 = v54;
          v57 = v56;

          objc_msgSend(v45, "layoutBlueprint");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          a6 = v80;
          objc_msgSend(v58, "blueprintSize");
          v41 = v57 + v55 + v59;

          v11 = v78;
          objc_msgSend(v48, "minimumHeight");
          if (v41 < v60)
            v41 = v60;

        }
        -[SXFullscreenCaption text](v24);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateSize:forComponentWithIdentifier:", v61, v39, v41);
      }

LABEL_29:
      if (objc_msgSend(v26, "hasValidLayout"))
      {
        if (!*a6)
          goto LABEL_37;
        -[SXColumnLayouter delegate](self, "delegate");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_opt_respondsToSelector();

        if ((v72 & 1) != 0)
        {
          -[SXColumnLayouter delegate](self, "delegate");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "layouter:didFinishLayoutForComponentBlueprint:layoutBlueprint:shouldContinueLayout:", self, v26, v10, a6);

        }
        if (!*a6)
        {
LABEL_37:

          goto LABEL_38;
        }
      }

    }
    v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
    if (v84)
      continue;
    break;
  }
LABEL_38:

  -[SXColumnLayouter analyzeSnapLinesForLayoutBlueprint:](self, "analyzeSnapLinesForLayoutBlueprint:", v10);
  objc_msgSend(v10, "endUpdates");
  v74 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v75 = v74;
    objc_msgSend(v81, "taskIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v91 = v10;
    v92 = 2114;
    v93 = v76;
    _os_log_impl(&dword_217023000, v75, OS_LOG_TYPE_DEFAULT, "Finished column layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);

  }
}

- (void)createDependenciesForLayoutBlueprint:(id)a3 columnStack:(id)a4 inDependencyResolver:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
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
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  SXColumnLayouter *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
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
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  NSUInteger v78;
  NSUInteger v79;
  NSUInteger v80;
  NSUInteger v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t j;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  int v106;
  void *v107;
  void *v108;
  void *v109;
  _BOOL4 v110;
  void *v111;
  NSUInteger v112;
  NSUInteger v113;
  NSUInteger v114;
  NSUInteger v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  NSUInteger v120;
  NSUInteger v121;
  NSUInteger v122;
  NSUInteger v123;
  void *v124;
  void *v125;
  void *v126;
  id *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t k;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  char v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  id *v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id obj;
  uint64_t v166;
  uint64_t v167;
  id *v168;
  uint64_t v169;
  void *v170;
  id v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  id v179;
  id v180;
  id v181;
  uint64_t v182;
  void *v183;
  id *v184;
  void *v185;
  int v186;
  uint64_t v187;
  id v188;
  id v190;
  id v191;
  int v192;
  id v193;
  void *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  uint64_t v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  uint64_t v251;
  NSRange v252;
  NSRange v253;
  NSRange v254;
  NSRange v255;
  NSRange v256;
  NSRange v257;

  v251 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v188 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  objc_msgSend(v7, "componentIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v197 = v7;
  v210 = (uint64_t)v8;
  v167 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v239, v250, 16);
  if (v167)
  {
    v166 = *(_QWORD *)v240;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v240 != v166)
        {
          v10 = v9;
          objc_enumerationMutation(obj);
          v9 = v10;
        }
        v169 = v9;
        v207 = *(id *)(*((_QWORD *)&v239 + 1) + 8 * v9);
        objc_msgSend(v7, "componentBlueprintForComponentIdentifier:");
        v179 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "component");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v194, "classification");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isCollapsible");

        if (v12)
        {
          objc_msgSend(v194, "anchor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "targetComponentIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15
            || !-[SXColumnLayouter intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:](self, "intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:", v179, v15, v7, v188))
          {
            SXComponentDependencyCreate(v207, v207, (void *)1, (void *)2, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v16);

          }
        }
        objc_msgSend(v188, "componentsBeforeComponent:", v179);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v235 = 0u;
        v236 = 0u;
        v237 = 0u;
        v238 = 0u;
        v171 = v17;
        v176 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v235, v249, 16);
        if (v176)
        {
          v173 = *(_QWORD *)v236;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v236 != v173)
                objc_enumerationMutation(v171);
              v182 = v18;
              v19 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * v18);
              objc_msgSend(v19, "component");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v194, "anchor");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v198 = v21;
              objc_msgSend(v21, "targetComponentIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v22, "isEqualToString:", v23);

              v185 = v20;
              objc_msgSend(v20, "anchor");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "targetComponentIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v194, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v26, "isEqualToString:", v27);

              if (v24)
              {
                v29 = v198;
                if (!-[SXColumnLayouter componentBlueprint:shouldIntersectWithComponentBlueprint:](self, "componentBlueprint:shouldIntersectWithComponentBlueprint:", v179, v19)|| objc_msgSend(v198, "range") == 0x7FFFFFFFFFFFFFFFLL)
                {
                  goto LABEL_39;
                }
                if ((v28 & 1) == 0)
                {
                  v30 = self;
                  v31 = v179;
                  v32 = v19;
                  goto LABEL_25;
                }
              }
              else
              {
                v29 = v198;
                if (!v28)
                  goto LABEL_39;
                if (!-[SXColumnLayouter componentBlueprint:shouldIntersectWithComponentBlueprint:](self, "componentBlueprint:shouldIntersectWithComponentBlueprint:", v19, v179))goto LABEL_39;
                objc_msgSend(v19, "component");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "anchor");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "range");

                if (v35 == 0x7FFFFFFFFFFFFFFFLL)
                  goto LABEL_39;
              }
              v30 = self;
              v31 = v19;
              v32 = v179;
LABEL_25:
              if (-[SXColumnLayouter intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:](v30, "intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:", v31, v32, v7, v188))
              {
                -[SXColumnLayouter findComponentStackBeforeComponent:inColumnStack:](self, "findComponentStackBeforeComponent:inColumnStack:", v19, v188);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v231 = 0u;
                v232 = 0u;
                v233 = 0u;
                v234 = 0u;
                v191 = v36;
                v204 = (id)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v231, v248, 16);
                if (!v204)
                  goto LABEL_54;
                v201 = *(_QWORD *)v232;
                while (1)
                {
                  for (i = 0; i != v204; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v232 != v201)
                      objc_enumerationMutation(v191);
                    v38 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * (_QWORD)i);
                    objc_msgSend(v38, "identifier");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v39);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();

                    +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "identifier");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    SXComponentDependencyCreate(v207, v42, (void *)1, (void *)1, v41);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SXComponentDependencyResolver addDependency:](v210, v43);

                    objc_msgSend(v38, "identifier");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    SXComponentDependencyCreate(v207, v44, (void *)1, (void *)2, v41);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SXComponentDependencyResolver addDependency:](v210, v45);

                    objc_msgSend(v38, "anchor");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "targetComponentIdentifier");
                    v47 = objc_claimAutoreleasedReturnValue();
                    if (v47)
                    {
                      v48 = (void *)v47;
                      objc_msgSend(v194, "anchor");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "targetComponentIdentifier");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "anchor");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "targetComponentIdentifier");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();

                      v7 = v197;
                      v53 = v50 == v52;
                      v29 = v198;
                      if (v53)
                        goto LABEL_36;
                      objc_msgSend(v38, "anchor");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "targetComponentIdentifier");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v197, "componentBlueprintForComponentIdentifier:", v55);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();

                      if (-[SXColumnLayouter intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:](self, "intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:", v40, v46, v197, v188))
                      {
                        +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v46, "component");
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v57, "identifier");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        SXComponentDependencyCreate(v207, v58, (void *)1, (void *)1, v56);
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SXComponentDependencyResolver addDependency:](v210, v59);

                        objc_msgSend(v46, "component");
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v60, "identifier");
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        v7 = v197;
                        SXComponentDependencyCreate(v207, v61, (void *)1, (void *)2, v56);
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SXComponentDependencyResolver addDependency:](v210, v62);

                        v29 = v198;
                      }
                    }

LABEL_36:
                  }
                  v204 = (id)objc_msgSend(v191, "countByEnumeratingWithState:objects:count:", &v231, v248, 16);
                  if (!v204)
                  {
                    v8 = (id)v210;
                    goto LABEL_54;
                  }
                }
              }
LABEL_39:
              +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v185, "identifier");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              SXComponentDependencyCreate(v207, v64, (void *)1, (void *)1, v63);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v65);

              objc_msgSend(v185, "identifier");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v191 = v63;
              SXComponentDependencyCreate(v207, v66, (void *)1, (void *)2, v63);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v67);

              objc_msgSend(v185, "anchor");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = v68;
              if (v68)
              {
                objc_msgSend(v68, "targetComponentIdentifier");
                v70 = objc_claimAutoreleasedReturnValue();
                if (v70)
                {
                  v71 = (void *)v70;
                  objc_msgSend(v69, "targetComponentIdentifier");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "targetComponentIdentifier");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v72, "isEqualToString:", v73))
                  {

LABEL_45:
                    objc_msgSend(v185, "anchor");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "targetComponentIdentifier");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v76);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    v78 = objc_msgSend(v179, "columnRange");
                    v80 = v79;
                    v255.location = objc_msgSend(v77, "columnRange");
                    v255.length = v81;
                    v252.location = v78;
                    v252.length = v80;
                    if (NSIntersectionRange(v252, v255).length)
                    {
                      v82 = -[SXColumnLayouter intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:](self, "intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:", v19, v77, v7, v188);
                      if ((objc_msgSend(v171, "containsObject:", v77) & 1) == 0 && v82)
                      {
                        objc_msgSend(v194, "identifier");
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v77, "component");
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v84, "identifier");
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        v86 = objc_msgSend(v83, "isEqualToString:", v85);

                        if ((v86 & 1) == 0)
                        {
                          +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
                          v87 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v77, "component");
                          v88 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v88, "identifier");
                          v89 = (void *)objc_claimAutoreleasedReturnValue();
                          SXComponentDependencyCreate(v207, v89, (void *)1, (void *)1, v87);
                          v90 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v90);

                          objc_msgSend(v77, "component");
                          v91 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v91, "identifier");
                          v92 = (void *)objc_claimAutoreleasedReturnValue();
                          SXComponentDependencyCreate(v207, v92, (void *)1, (void *)2, v87);
                          v93 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v93);

                          if (objc_msgSend(v77, "hasValidSize"))
                          {
                            objc_msgSend(v77, "component");
                            v94 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v94, "identifier");
                            v95 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v7, "invalidateSizeForComponentWithIdentifier:", v95);

                          }
                          v29 = v198;
                        }
                      }
                    }

                    goto LABEL_53;
                  }
                  v74 = objc_msgSend(v29, "range");

                  if (v74 == 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_45;
                }
              }
LABEL_53:

LABEL_54:
              v18 = v182 + 1;
            }
            while (v182 + 1 != v176);
            v176 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v235, v249, 16);
          }
          while (v176);
        }

        v9 = v169 + 1;
      }
      while (v169 + 1 != v167);
      v167 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v239, v250, 16);
    }
    while (v167);
  }

  v229 = 0u;
  v230 = 0u;
  v227 = 0u;
  v228 = 0u;
  objc_msgSend(v7, "componentIdentifiers");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v227, v247, 16);
  if (!v97)
    goto LABEL_110;
  v98 = v97;
  v195 = *(_QWORD *)v228;
  v180 = v96;
  do
  {
    for (j = 0; j != v98; ++j)
    {
      if (*(_QWORD *)v228 != v195)
        objc_enumerationMutation(v96);
      v100 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * j);
      objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "component");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "anchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      if (v103)
      {
        v199 = v100;
        v104 = v103;
        v202 = v102;
        if (objc_msgSend(v103, "originAnchorPosition"))
          v105 = objc_msgSend(v104, "originAnchorPosition");
        else
          v105 = objc_msgSend(v104, "targetAnchorPosition");
        v106 = -[SXColumnLayouter layoutAttributeForAnchor:](self, "layoutAttributeForAnchor:", v105);
        v192 = -[SXColumnLayouter layoutAttributeForAnchor:](self, "layoutAttributeForAnchor:", objc_msgSend(v104, "targetAnchorPosition"));
        objc_msgSend(v104, "targetComponentIdentifier");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v107)
        {
          v102 = v202;
          v103 = v104;
          if (!v106)
            goto LABEL_108;
          v205 = v104;
          SXComponentDependencyCreate(v199, v199, (void *)1, (void *)2, 0);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v109);
          goto LABEL_107;
        }
        v186 = v106;
        v205 = v104;
        objc_msgSend(v104, "targetComponentIdentifier");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        if (v109)
        {
          if (-[SXColumnLayouter componentBlueprint:shouldIntersectWithComponentBlueprint:](self, "componentBlueprint:shouldIntersectWithComponentBlueprint:", v101, v109))
          {
            v110 = objc_msgSend(v205, "range") != 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v110 = 0;
          }
          v183 = v101;
          v112 = objc_msgSend(v101, "columnRange");
          v114 = v113;
          v256.location = objc_msgSend(v109, "columnRange");
          v256.length = v115;
          v253.location = v112;
          v253.length = v114;
          if (NSIntersectionRange(v253, v256).length && !v110)
          {
            v8 = (id)v210;
            v96 = v180;
            v101 = v183;
LABEL_79:
            v102 = v202;
LABEL_107:

            v103 = v205;
            goto LABEL_108;
          }
          objc_msgSend(v205, "targetComponentIdentifier");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v205, "range") == 0x7FFFFFFFFFFFFFFFLL
            && (objc_msgSend(v205, "range"), v116 == 0x7FFFFFFFFFFFFFFFLL))
          {
            +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, v186, v192, 1);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = v183;
            v8 = (id)v210;
            if (!-[SXColumnLayouter anchorPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:](self, "anchorPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:", v183, v109, v7, v188))goto LABEL_105;
          }
          else
          {
            v174 = j;
            v118 = objc_msgSend(v205, "range");
            +[SXTextComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:withRange:]((uint64_t)SXTextComponentLayoutAttributeDescriptor, v186, v192, 1, v118, v119);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = v183;
            v120 = objc_msgSend(v183, "columnRange");
            v122 = v121;
            v257.location = objc_msgSend(v109, "columnRange");
            v257.length = v123;
            v254.location = v120;
            v254.length = v122;
            v8 = (id)v210;
            if (NSIntersectionRange(v254, v257).length)
            {
              if (!-[SXColumnLayouter intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:](self, "intersectionPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:", v183, v109, v7, v188))
              {
                j = v174;
                goto LABEL_105;
              }
              v170 = v109;
              v172 = (id)v98;
              SXComponentDependencyCreate(v111, v199, (void *)2, (void *)2, v117);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentDependencyResolver addDependency:](v210, v124);

              v177 = v117;
              SXComponentDependencyCreate(v199, v111, (void *)1, (void *)2, v117);
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentDependencyResolver addDependency:](v210, v125);

              SXComponentDependencyCreate(v111, v111, (void *)2, (void *)1, 0);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentDependencyResolver addDependency:](v210, v126);

              -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](v210, v199, 1);
              v127 = (id *)objc_claimAutoreleasedReturnValue();
              v223 = 0u;
              v224 = 0u;
              v225 = 0u;
              v226 = 0u;
              v168 = v127;
              -[SXComponentNode dependencies](v127);
              v208 = (id)objc_claimAutoreleasedReturnValue();
              v128 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v223, v246, 16);
              if (v128)
              {
                v129 = v128;
                v130 = *(_QWORD *)v224;
                do
                {
                  for (k = 0; k != v129; ++k)
                  {
                    if (*(_QWORD *)v224 != v130)
                      objc_enumerationMutation(v208);
                    v132 = *(id *)(*(_QWORD *)(*((_QWORD *)&v223 + 1) + 8 * k) + 16);
                    objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", v132);
                    v133 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v132, "isEqualToString:", v111) & 1) == 0)
                    {
                      objc_msgSend(v133, "component");
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v134, "anchor");
                      v135 = v111;
                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v136, "targetComponentIdentifier");
                      v137 = (void *)objc_claimAutoreleasedReturnValue();
                      v138 = objc_msgSend(v137, "isEqualToString:", v135);

                      v111 = v135;
                      if ((v138 & 1) == 0)
                      {
                        SXComponentDependencyCreate(v135, v132, (void *)2, (void *)1, 0);
                        v139 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SXComponentDependencyResolver addDependency:](v210, v139);

                        SXComponentDependencyCreate(v135, v132, (void *)2, (void *)2, 0);
                        v140 = (void *)objc_claimAutoreleasedReturnValue();
                        v111 = v135;
                        -[SXComponentDependencyResolver addDependency:](v210, v140);

                      }
                    }

                    v7 = v197;
                  }
                  v129 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v223, v246, 16);
                }
                while (v129);
              }

              v8 = (id)v210;
              v98 = (uint64_t)v172;
              j = v174;
              v109 = v170;
              v117 = v177;
            }
            else
            {
              j = v174;
              if (!-[SXColumnLayouter anchorPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:](self, "anchorPossibleForComponentWithBlueprint:anchoredToComponentWithBlueprint:layoutBlueprint:columnStack:", v183, v109, v7, v188))goto LABEL_105;
            }
          }
          v141 = j;
          SXComponentDependencyCreate(v199, v111, (void *)1, (void *)1, v117);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v142);

          if (v186 | v192)
          {
            SXComponentDependencyCreate(v199, v111, (void *)1, (void *)2, v117);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v143);

            if (v186)
            {
              SXComponentDependencyCreate(v199, v199, (void *)1, (void *)2, 0);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v144);

            }
          }
          objc_msgSend(v164, "objectForKey:", v111);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v145)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "setObject:forKey:", v145, v111);
          }
          objc_msgSend(v202, "identifier");
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "addObject:", v146);

          j = v141;
          v101 = v183;
LABEL_105:

          v96 = v180;
        }
        else
        {
          if (!v106)
            goto LABEL_79;
          SXComponentDependencyCreate(v199, v199, (void *)2, (void *)1, 0);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v111);
        }
        v102 = v202;

        goto LABEL_107;
      }
LABEL_108:

    }
    v98 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v227, v247, 16);
  }
  while (v98);
LABEL_110:

  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  v181 = v164;
  v178 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v219, v245, 16);
  if (v178)
  {
    v175 = *(_QWORD *)v220;
    do
    {
      v147 = 0;
      do
      {
        if (*(_QWORD *)v220 != v175)
          objc_enumerationMutation(v181);
        v187 = v147;
        v148 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * v147);
        objc_msgSend(v181, "objectForKey:", v148);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:]((uint64_t)v8, v148, 1);
        v149 = (id *)objc_claimAutoreleasedReturnValue();
        v215 = 0u;
        v216 = 0u;
        v217 = 0u;
        v218 = 0u;
        v184 = v149;
        -[SXComponentNode dependencies](v149);
        v190 = (id)objc_claimAutoreleasedReturnValue();
        v200 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v215, v244, 16);
        if (v200)
        {
          v193 = *(id *)v216;
          do
          {
            v150 = 0;
            do
            {
              if (*(id *)v216 != v193)
                objc_enumerationMutation(v190);
              v203 = v150;
              v151 = *(_QWORD *)(*((_QWORD *)&v215 + 1) + 8 * v150);
              +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
              v206 = (id)objc_claimAutoreleasedReturnValue();
              v211 = 0u;
              v212 = 0u;
              v213 = 0u;
              v214 = 0u;
              v152 = v196;
              v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v211, v243, 16);
              if (v153)
              {
                v154 = v153;
                v155 = *(_QWORD *)v212;
                do
                {
                  v156 = 0;
                  v209 = (id)v154;
                  do
                  {
                    if (*(_QWORD *)v212 != v155)
                      objc_enumerationMutation(v152);
                    v157 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * v156);
                    v158 = *(id *)(v151 + 16);
                    if ((objc_msgSend(v152, "containsObject:", v158) & 1) == 0
                      && (objc_msgSend(v158, "isEqualToString:", v148) & 1) == 0)
                    {
                      SXComponentDependencyCreate(v157, v158, (void *)1, (void *)1, v206);
                      v159 = v155;
                      v160 = v151;
                      v161 = v148;
                      v162 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SXComponentDependencyResolver addDependency:](v210, v162);

                      SXComponentDependencyCreate(v157, v158, (void *)2, (void *)1, v206);
                      v163 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SXComponentDependencyResolver addDependency:](v210, v163);

                      v148 = v161;
                      v151 = v160;
                      v155 = v159;
                      v154 = (uint64_t)v209;
                    }

                    ++v156;
                  }
                  while (v154 != v156);
                  v154 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v211, v243, 16);
                }
                while (v154);
              }

              v150 = v203 + 1;
            }
            while (v203 + 1 != v200);
            v200 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v215, v244, 16);
          }
          while (v200);
        }

        v147 = v187 + 1;
        v8 = (id)v210;
      }
      while (v187 + 1 != v178);
      v178 = objc_msgSend(v181, "countByEnumeratingWithState:objects:count:", &v219, v245, 16);
    }
    while (v178);
  }

}

- (id)findComponentStackBeforeComponent:(id)a3 inColumnStack:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  SXColumnLayouter *v20;
  void *v21;
  id obj;
  uint64_t v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v20 = self;
  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v6;
  objc_msgSend(v6, "componentsBeforeComponent:", v5);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v23 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "component", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "targetComponentIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "component");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "anchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "targetComponentIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
        {
          -[SXColumnLayouter findComponentStackBeforeComponent:inColumnStack:](v20, "findComponentStackBeforeComponent:inColumnStack:", v10, v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObjectsFromArray:", v18);
        }
        else
        {
          objc_msgSend(v10, "component");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v18);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  return v24;
}

- (CGPoint)calculatePositionForComponentNode:(id)a3 columnLayout:(id)a4 layoutBlueprint:(id)a5
{
  id *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double Height;
  double v39;
  double v40;
  SXUnitConverterFactory *unitConverterFactory;
  double Width;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  id v63;
  void *v64;
  double MinY;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  int v90;
  double v91;
  void *v92;
  void *v93;
  int v94;
  double v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  double v104;
  SXUnitConverterFactory *v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  void *v129;
  void *v130;
  id *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  uint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  uint64_t v143;
  NSRange v144;
  NSRange v145;
  CGPoint result;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;

  v143 = *MEMORY[0x24BDAC8D0];
  v7 = (id *)a3;
  v8 = a4;
  v9 = a5;
  -[SXFullscreenCaption text]((uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentBlueprintForComponentIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "componentLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentSizer");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v11;
  v129 = v12;
  v130 = v8;
  objc_msgSend(v8, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", objc_msgSend(v11, "columnRange"), objc_msgSend(v128, "shouldIgnoreMarginsForColumnLayout:", v8), objc_msgSend(v12, "ignoreDocumentGutter"), objc_msgSend(v128, "shouldIgnoreViewportPaddingForColumnLayout:", v8));
  v14 = v13;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v133 = objc_claimAutoreleasedReturnValue();
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v131 = v7;
  -[SXComponentNode dependencies](v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
  if (!v16)
  {
    v18 = 0;
    v20 = 0.0;
    v22 = v132;
    v21 = (void *)v133;
    goto LABEL_39;
  }
  v17 = v16;
  v18 = 0;
  v19 = *(_QWORD *)v139;
  v20 = 0.0;
  v22 = v132;
  v21 = (void *)v133;
  v134 = *(_QWORD *)v139;
  v135 = v15;
  do
  {
    v23 = 0;
    v137 = v17;
    do
    {
      if (*(_QWORD *)v139 != v19)
        objc_enumerationMutation(v15);
      v24 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * v23);
      -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "containsObject:", v25) & 1) != 0)
        goto LABEL_34;
      -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        v17 = v137;
        goto LABEL_35;
      }
      -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCaption caption](v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentBlueprintForComponentIdentifier:includeChildren:", v28, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = objc_msgSend(v22, "columnRange");
        v32 = v31;
        v145.location = objc_msgSend(v29, "columnRange");
        v145.length = v33;
        v144.location = v30;
        v144.length = v32;
        if (NSIntersectionRange(v144, v145).length)
        {
          -[SXTextComponentLayoutAttributeDescriptor resultingExclusionPath]((uint64_t)v27);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            -[SXTextComponentLayoutAttributeDescriptor resultingExclusionPath]((uint64_t)v27);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v29, "exclusionPaths");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXFullscreenCaption text]((uint64_t)v131);
            v63 = v9;
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKey:", v64);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v63;
            v22 = v132;

            v21 = (void *)v133;
          }

          objc_msgSend(v29, "frame");
          MinY = CGRectGetMinY(v153);
          -[SXTextExclusionPath position]((uint64_t)v35);
          v67 = v66;
          -[SXTextExclusionPath position]((uint64_t)v35);
          if (v67 >= v68)
            v69 = v67;
          else
            v69 = v68;
          v70 = MinY + v69;
          if (v70 >= v20)
            v20 = v70;
          v54 = -[SXTextExclusionPath insets]((uint64_t)v35) + v20;
        }
        else
        {
          -[SXFullscreenCaption caption](v24);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "componentBlueprintForComponentIdentifier:includeChildren:", v55, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "componentSizer");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = -[SXTextComponentLayoutAttributeDescriptor range]((uint64_t)v27);
          objc_msgSend(v56, "verticalPositionForRange:", v57, v58);
          v60 = v59;
          objc_msgSend(v35, "frame");
          v61 = v60 + CGRectGetMinY(v152);
          if (v61 >= v20)
            v54 = v61;
          else
            v54 = v20;

          v21 = (void *)v133;
        }

        v18 = 1;
        v19 = v134;
        v15 = v135;
LABEL_32:

        v20 = v54;
        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SXFullscreenCaption caption](v24);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentBlueprintForComponentIdentifier:", v36);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "frame");
        v37 = CGRectGetMinY(v147);
        objc_msgSend(v27, "frame");
        Height = CGRectGetHeight(v148);
        -[SXColumnLayouter factorForLayoutAttribute:](self, "factorForLayoutAttribute:", -[SXComponentLayoutAttributeDescriptor toLayoutAttribute]((uint64_t)v25));
        v40 = v37 + Height * v39;
        if (!-[SXComponentLayoutAttributeDescriptor ignoreMargins]((_BOOL8)v25))
        {
          objc_msgSend(v27, "frame");
          if (CGRectGetHeight(v149) != 0.0)
          {
            unitConverterFactory = self->_unitConverterFactory;
            objc_msgSend(v27, "frame");
            Width = CGRectGetWidth(v150);
            objc_msgSend(v9, "blueprintSize");
            v44 = v43;
            objc_msgSend(v9, "layoutOptions");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXUnitConverterFactory createUnitConverterWithComponentWidth:parentWidth:layoutOptions:](unitConverterFactory, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v45, Width, v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "componentLayout");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "margin");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "bottom");
            objc_msgSend(v46, "convertValueToPoints:", v49, v50);
            v40 = v40 + v51;

            v19 = v134;
            v15 = v135;

          }
        }
        objc_msgSend(v22, "frame");
        v52 = CGRectGetHeight(v151);
        -[SXColumnLayouter factorForLayoutAttribute:](self, "factorForLayoutAttribute:", -[SXComponentLayoutAttributeDescriptor fromLayoutAttribute]((uint64_t)v25));
        v54 = v40 - v52 * v53;
        v21 = (void *)v133;
        if (v54 <= v20)
          v54 = v20;
        else
          v18 = -[SXComponentLayoutAttributeDescriptor ignoreMargins]((_BOOL8)v25);
        goto LABEL_32;
      }
LABEL_33:
      -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v71);

      v17 = v137;
LABEL_34:

LABEL_35:
      ++v23;
    }
    while (v17 != v23);
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
  }
  while (v17);
LABEL_39:

  objc_msgSend(v22, "component");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "anchor");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    objc_msgSend(v22, "component");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "anchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "targetComponentIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v130;
    if (v77)
    {

      goto LABEL_46;
    }
    objc_msgSend(v130, "minimumHeight");
    v80 = v79;

    if (v80 <= 0.0)
    {
LABEL_46:
      v22 = v132;
    }
    else
    {
      objc_msgSend(v132, "component");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "anchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "originAnchorPosition");
      objc_msgSend(v132, "component");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "anchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v85;
      if (v83)
        v87 = objc_msgSend(v85, "originAnchorPosition");
      else
        v87 = objc_msgSend(v85, "targetAnchorPosition");
      v117 = v87;

      v22 = v132;
      objc_msgSend(v132, "component");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "anchor");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v119, "targetAnchorPosition");

      objc_msgSend(v132, "frame");
      v121 = CGRectGetHeight(v157);
      -[SXColumnLayouter factorForLayoutAttribute:](self, "factorForLayoutAttribute:", -[SXColumnLayouter layoutAttributeForAnchor:](self, "layoutAttributeForAnchor:", v117));
      v123 = v121 * v122;
      objc_msgSend(v130, "minimumHeight");
      v125 = v124;
      -[SXColumnLayouter factorForLayoutAttribute:](self, "factorForLayoutAttribute:", -[SXColumnLayouter layoutAttributeForAnchor:](self, "layoutAttributeForAnchor:", v120));
      v127 = v125 * v126 - v123;
      if (v127 >= v20)
        v20 = v127;
      v18 |= v117 != 0;
      v21 = (void *)v133;
    }
  }
  else
  {

    v78 = v130;
  }
  objc_msgSend(v22, "frame");
  if (CGRectGetHeight(v154) == 0.0 && objc_msgSend(v22, "hasValidSize"))
  {
    objc_msgSend(v22, "component");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "classification");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "isCollapsible");

    v21 = (void *)v133;
  }
  else
  {
    v90 = 1;
  }
  objc_msgSend(v22, "frame");
  v91 = CGRectGetHeight(v155);
  if ((v18 & 1) != 0
    || (v91 != 0.0 ? (v94 = 1) : (v94 = v90), v91 == 0.0 && v94 && (objc_msgSend(v22, "hasValidSize") & 1) != 0))
  {
    v93 = v128;
    v92 = v129;
  }
  else
  {
    objc_msgSend(v22, "frame");
    v95 = CGRectGetWidth(v156);
    v93 = v128;
    v92 = v129;
    if ((objc_msgSend(v22, "hasValidSize") & 1) == 0)
    {
      objc_msgSend(v22, "componentSizer");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = objc_msgSend(v96, "shouldIgnoreMarginsForColumnLayout:", v78);

      v98 = objc_msgSend(v128, "shouldIgnoreViewportPaddingForColumnLayout:", v78);
      v99 = objc_msgSend(v22, "columnRange");
      v101 = v100;
      v102 = objc_msgSend(v129, "ignoreDocumentGutter");
      v103 = v99;
      v21 = (void *)v133;
      objc_msgSend(v78, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v103, v101, v97, v102, v98);
      v95 = v104;
    }
    v105 = self->_unitConverterFactory;
    objc_msgSend(v9, "blueprintSize");
    v107 = v106;
    objc_msgSend(v9, "layoutOptions");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXUnitConverterFactory createUnitConverterWithComponentWidth:parentWidth:layoutOptions:](v105, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v108, v95, v107);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v129, "margin");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v110, "top");
    objc_msgSend(v109, "convertValueToPoints:", v111, v112);
    v114 = v113;

    v20 = v20 + v114;
  }

  v115 = v14;
  v116 = v20;
  result.y = v116;
  result.x = v115;
  return result;
}

- (CGSize)calculateSizeForComponentNode:(id)a3 columnLayout:(id)a4 layoutBlueprint:(id)a5 dependencyResolver:(id)a6
{
  id *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  SXUnitConverterFactory *unitConverterFactory;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  char v51;
  void *v52;
  char isKindOfClass;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  CGFloat v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  CGFloat v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  double y;
  double width;
  double height;
  double v80;
  BOOL v81;
  double v82;
  double MaxX;
  double v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  unint64_t v97;
  uint64_t v98;
  SXTextExclusionPath *v99;
  double v100;
  double v101;
  id v102;
  void *v103;
  unint64_t v104;
  char v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  void *v132;
  id v133;
  SXColumnLayouter *v134;
  id *v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  void *v143;
  double v144;
  id v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  _QWORD v156[4];
  id v157;
  _QWORD newValue[4];
  id v159;
  uint64_t v160;
  id *v161;
  id v162;
  SXColumnLayouter *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  _BYTE v172[128];
  uint64_t v173;
  CGSize result;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;

  v173 = *MEMORY[0x24BDAC8D0];
  v10 = (id *)a3;
  v11 = a4;
  v12 = a5;
  v133 = a6;
  v135 = v10;
  -[SXFullscreenCaption text]((uint64_t)v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentBlueprintForComponentIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "columnRange");
  v17 = v16;
  objc_msgSend(v14, "componentLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentSizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldIgnoreMarginsForColumnLayout:", v11);
  v129 = v19;
  v21 = objc_msgSend(v19, "shouldIgnoreViewportPaddingForColumnLayout:", v11);
  objc_msgSend(v11, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v15, v20, objc_msgSend(v18, "ignoreDocumentGutter"), v21);
  v23 = v22;
  v132 = v18;
  v154 = v11;
  objc_msgSend(v11, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v15, v17, v20, objc_msgSend(v18, "ignoreDocumentGutter"), v21);
  v25 = v24;
  v134 = self;
  unitConverterFactory = self->_unitConverterFactory;
  objc_msgSend(v12, "blueprintSize");
  v28 = v27;
  v148 = v12;
  v29 = v12;
  v30 = v14;
  objc_msgSend(v29, "layoutOptions");
  v31 = objc_claimAutoreleasedReturnValue();
  -[SXUnitConverterFactory createUnitConverterWithComponentWidth:parentWidth:layoutOptions:](unitConverterFactory, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v31, v25, v28);
  v32 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "componentSizer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)v32;
  objc_msgSend(v33, "contentInsetsWithUnitConverter:", v32);
  v35 = v34;
  v37 = v36;

  v38 = v35 + v37;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "componentSizer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v31) = objc_opt_isKindOfClass();

  if ((v31 & 1) != 0)
  {
    objc_msgSend(v30, "componentSizer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "removeAllExclusionPaths");

  }
  v128 = v25 - v38;
  -[SXComponentNode dependencies](v135);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXColumnLayouter sortComponentDependencies:forBlueprint:](self, "sortComponentDependencies:forBlueprint:", v42, v148);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v44 = v43;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v168, v172, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v169;
    v138 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v139 = *MEMORY[0x24BDF7718];
    v136 = *(double *)(MEMORY[0x24BDF7718] + 24);
    v137 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v130 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v131 = *MEMORY[0x24BDBEFB0];
    v142 = v30;
    v140 = v23;
    v141 = v25;
    v145 = v44;
    v146 = v39;
    v151 = *(_QWORD *)v169;
    do
    {
      v48 = 0;
      v147 = v46;
      do
      {
        if (*(_QWORD *)v169 != v47)
          objc_enumerationMutation(v44);
        v49 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * v48);
        -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v39, "containsObject:", v50);

        if ((v51 & 1) == 0)
        {
          objc_msgSend(v30, "component");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v30, "component");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v56 = objc_opt_isKindOfClass();

            if ((v56 & 1) != 0)
            {
              v150 = v54;
              objc_msgSend(v54, "identifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "componentBlueprintForComponentIdentifier:includeChildren:", v57, 1);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v58, "componentSizer");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v153 = v58;
              objc_msgSend(v58, "componentLayout");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v59, "shouldIgnoreMarginsForColumnLayout:", v154);
              v149 = v59;
              v62 = objc_msgSend(v59, "shouldIgnoreViewportPaddingForColumnLayout:", v154);
              -[SXFullscreenCaption caption](v49);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "componentBlueprintForComponentIdentifier:", v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v64, "componentLayout");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v154, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", objc_msgSend(v64, "columnRange"), v61, objc_msgSend(v60, "ignoreDocumentGutter"), v62);
              v67 = v66;
              v68 = objc_msgSend(v64, "columnRange");
              objc_msgSend(v154, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v68, v69, v61, objc_msgSend(v60, "ignoreDocumentGutter"), v62);
              v71 = v70;
              v155 = v65;
              objc_msgSend(v65, "margin");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = objc_msgSend(v72, "bottom");
              objc_msgSend(v143, "convertValueToPoints:", v73, v74);
              v76 = v75;

              objc_msgSend(v64, "frame");
              v182.size.height = v76 + CGRectGetHeight(v175);
              v176.origin.y = 0.0;
              v182.origin.y = 0.0;
              v176.origin.x = v23;
              v176.size.width = v25;
              v176.size.height = 1.79769313e308;
              v182.origin.x = v67;
              v182.size.width = v71;
              v177 = CGRectIntersection(v176, v182);
              y = v177.origin.y;
              width = v177.size.width;
              height = v177.size.height;
              v80 = v177.origin.x - v23;
              v81 = v177.origin.x - v23 == 0.0;
              v82 = v138;
              if (!v81)
                v82 = (double)objc_msgSend(v154, "gutter", v138);
              v144 = v82;
              v178.origin.x = v80;
              v178.origin.y = y;
              v178.size.width = width;
              v178.size.height = height;
              MaxX = CGRectGetMaxX(v178);
              v179.origin.y = 0.0;
              v179.origin.x = v23;
              v179.size.width = v25;
              v179.size.height = 1.79769313e308;
              v84 = MaxX + CGRectGetMinX(v179);
              v180.origin.y = 0.0;
              v180.origin.x = v23;
              v180.size.width = v25;
              v180.size.height = 1.79769313e308;
              v85 = v136;
              if (v84 != CGRectGetMaxX(v180))
                v85 = (double)objc_msgSend(v154, "gutter");
              v86 = v152;
              v87 = v139;
              v30 = v142;
              v44 = v145;
              v46 = v147;
              if (-[SXTextComponentLayoutAttributeDescriptor range]((uint64_t)v152))
              {
                objc_msgSend(v155, "margin");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = objc_msgSend(v88, "top");
                objc_msgSend(v143, "convertValueToPoints:", v89, v90);
                v87 = v91;

              }
              v92 = v137;
              if (-[SXComponentLayoutAttributeDescriptor fromLayoutAttribute]((uint64_t)v152) != 2)
              {
                objc_msgSend(v155, "margin");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_msgSend(v93, "bottom");
                objc_msgSend(v143, "convertValueToPoints:", v94, v95);
                v92 = v96;

              }
              objc_msgSend(v64, "frame");
              if (CGRectGetHeight(v181) != 0.0 && objc_msgSend(v149, "stringLength"))
              {
                v97 = -[SXTextComponentLayoutAttributeDescriptor range]((uint64_t)v152);
                v98 = objc_msgSend(v149, "stringLength");
                if (v97 >= v98 - 1)
                  v97 = v98 - 1;
                v99 = [SXTextExclusionPath alloc];
                v102 = -[SXTextExclusionPath initWithTextRange:position:rect:withInsets:](v99, v97, 0, v80, y, v131, v130, width, height, v100, v101, v87, v144, v92, v85);
                -[SXFullscreenCaption caption](v49);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                -[SXTextExclusionPath setComponentIdentifier:]((uint64_t)v102, v103);

                -[SXTextExclusionPath setVerticalAlignmentFactor:]((uint64_t)v102, 0.0);
                -[SXTextExclusionPath setLineVerticalAlignment:]((uint64_t)v102, 1);
                v104 = objc_msgSend(v64, "columnRange");
                if (v104 <= objc_msgSend(v153, "columnRange"))
                {
                  objc_msgSend(v64, "columnRange");
                  v107 = v106;
                  objc_msgSend(v153, "columnRange");
                  v105 = v107 >= v108;
                }
                else
                {
                  v105 = 0;
                }
                -[SXTextExclusionPath setFullBleed:]((uint64_t)v102, v105);
                newValue[0] = MEMORY[0x24BDAC760];
                newValue[1] = 3221225472;
                newValue[2] = __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke;
                newValue[3] = &unk_24D687668;
                v159 = v133;
                v160 = v49;
                v161 = v135;
                v162 = v148;
                v163 = v134;
                v109 = v149;
                v164 = v109;
                v165 = v142;
                v166 = v143;
                v167 = v132;
                -[SXTextExclusionPath setMinYBlock:](v102, (char *)newValue);
                v156[0] = MEMORY[0x24BDAC760];
                v156[1] = 3221225472;
                v156[2] = __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke_2;
                v156[3] = &unk_24D687690;
                v157 = v152;
                -[SXTextExclusionPath setCompletionBlock:](v102, (char *)v156);
                objc_msgSend(v109, "addExclusionPath:", v102);
                -[SXFullscreenCaption caption](v49);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = v152;
                objc_msgSend(v153, "addExclusionPath:forIdentifier:", v102, v110);

                -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v146, "addObject:", v111);

                v44 = v145;
              }

              v23 = v140;
              v25 = v141;
              v39 = v146;
              v54 = v150;
            }

            v47 = v151;
          }
        }
        ++v48;
      }
      while (v46 != v48);
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v168, v172, 16);
    }
    while (v46);
  }

  -[SXLayoutContextFactory createLayoutContextForColumnLayout:unitConverter:](v134->_layoutContextFactory, "createLayoutContextForColumnLayout:unitConverter:", v154, v143);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "componentSizer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "calculateHeightForWidth:layoutContext:", v112, v128);
  v115 = v114;

  objc_msgSend(v30, "componentSizer");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "contentInsetsWithUnitConverter:", v143);
  v118 = v117;
  v120 = v119;

  v121 = v115 + v118 + v120;
  objc_msgSend(v132, "minimumHeight");
  if (v122)
  {
    v123 = objc_msgSend(v132, "minimumHeight");
    objc_msgSend(v143, "convertValueToPoints:", v123, v124);
    if (v121 < v125)
      v121 = v125;
  }

  v126 = v25;
  v127 = v121;
  result.height = v127;
  result.width = v126;
  return result;
}

double __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  double MinY;
  double Height;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  id *v53;
  BOOL v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v61 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  -[SXFullscreenCaption caption](*(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](v2, v3, 1);
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[SXComponentNode dependencies](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v6)
  {
    v7 = v6;
    v53 = v4;
    v54 = 0;
    v8 = *(_QWORD *)v57;
    v9 = 0.0;
    v55 = *(_QWORD *)v57;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v57 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        -[SXFullscreenCaption caption](v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCaption text](*(_QWORD *)(a1 + 48));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
        {
          v14 = v9;
        }
        else
        {
          v15 = v7;
          v16 = v5;
          -[SXFullscreenCaption caption](v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXFullscreenCaption caption](*(_QWORD *)(a1 + 40));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if ((v19 & 1) != 0)
          {
            v5 = v16;
            v8 = v55;
            v7 = v15;
            continue;
          }
          -[SXTangierTextRenderCollectorItem componentIdentifier](v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 56);
          -[SXFullscreenCaption caption](v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentBlueprintForComponentIdentifier:", v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "hasValidLayout"))
          {
            objc_msgSend(v13, "frame");
            MinY = CGRectGetMinY(v62);
            objc_msgSend(v13, "frame");
            Height = CGRectGetHeight(v63);
            objc_msgSend(*(id *)(a1 + 64), "factorForLayoutAttribute:", -[SXComponentLayoutAttributeDescriptor toLayoutAttribute]((uint64_t)v12));
            v25 = MinY + Height * v24;
          }
          else
          {
            v26 = *(void **)(a1 + 72);
            objc_msgSend(v13, "component");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "existingExclusionPathForComponentWithIdentifier:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXTextExclusionPath position]((uint64_t)v29);
            v31 = v30;

            objc_msgSend(v13, "frame");
            v32 = CGRectGetHeight(v64);
            objc_msgSend(*(id *)(a1 + 64), "factorForLayoutAttribute:", -[SXComponentLayoutAttributeDescriptor toLayoutAttribute]((uint64_t)v12));
            v34 = v31 + v32 * v33;
            objc_msgSend(*(id *)(a1 + 80), "frame");
            v25 = v34 + CGRectGetMinY(v65);
          }
          if (!-[SXComponentLayoutAttributeDescriptor ignoreMargins]((_BOOL8)v12))
          {
            objc_msgSend(v13, "componentLayout");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = *(void **)(a1 + 88);
            objc_msgSend(v35, "margin");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "bottom");
            objc_msgSend(v36, "convertValueToPoints:", v38, v39);
            v41 = v40;

            objc_msgSend(v13, "frame");
            if (CGRectGetHeight(v66) == 0.0)
              v42 = 0.0;
            else
              v42 = v41;
            v25 = v25 + v42;

          }
          v7 = v15;
          objc_msgSend(v13, "frame");
          v43 = CGRectGetHeight(v67);
          objc_msgSend(*(id *)(a1 + 64), "factorForLayoutAttribute:", -[SXComponentLayoutAttributeDescriptor fromLayoutAttribute]((uint64_t)v12));
          v14 = v25 - v43 * v44;
          if (v14 <= v9)
            v14 = v9;
          else
            v54 = -[SXComponentLayoutAttributeDescriptor ignoreMargins]((_BOOL8)v12);
          v5 = v16;
          v8 = v55;
        }

        v9 = v14;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (!v7)
      {

        v4 = v53;
        if (v54)
          goto LABEL_29;
        goto LABEL_28;
      }
    }
  }

  v9 = 0.0;
LABEL_28:
  v45 = *(void **)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 96), "margin");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "top");
  objc_msgSend(v45, "convertValueToPoints:", v47, v48);
  v50 = v49;

  v9 = v9 + v50;
LABEL_29:
  objc_msgSend(*(id *)(a1 + 80), "frame");
  v51 = CGRectGetMinY(v68);

  return v9 - v51;
}

void __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke_2(uint64_t a1, void *a2)
{
  -[SXTextComponentLayoutAttributeDescriptor setResultingExclusionPath:](*(_QWORD *)(a1 + 32), a2);
}

- (void)analyzeSnapLinesForLayoutBlueprint:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  double v28;
  void *v29;
  SXColumnLayouter *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;

  v30 = self;
  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v3, "componentIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    v31 = *(_QWORD *)v39;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v8), v30);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasValidLayout"))
        {
          v10 = v3;
          objc_msgSend(v9, "absoluteFrame");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v18 = v17;
          objc_msgSend(v9, "absoluteFrame");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinY(v45));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v19);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v9, "layoutBlueprint");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXColumnLayouter analyzeSnapLinesForLayoutBlueprint:](v30, "analyzeSnapLinesForLayoutBlueprint:", v20);

          }
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v9, "componentSizer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "snapLines");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v35;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v35 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v26), "floatValue");
                v28 = v27;
                v46.origin.x = v12;
                v46.origin.y = v14;
                v46.size.width = v16;
                v46.size.height = v18;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinY(v46) + v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v29);

                ++v26;
              }
              while (v24 != v26);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v24);
          }

          v3 = v10;
          v7 = v31;
          v6 = v32;
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "setSnapLines:", v4);
}

- (id)columnStackForLayoutBlueprint:(id)a3 columnLayout:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  SXColumnStack *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25 = -[SXColumnStack initWithNumberOfColumns:]([SXColumnStack alloc], "initWithNumberOfColumns:", objc_msgSend(v6, "numberOfColumns"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  objc_msgSend(v5, "componentIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(v7, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentSizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "columnRange");
        v17 = objc_msgSend(v6, "convertColumnRange:minimumColumnLength:", v15, v16, objc_msgSend(v13, "minimumColumnLength"));
        v19 = v18;

        v20 = objc_msgSend(v13, "overrideColumnLayoutForColumnRange:inColumnLayout:", v17, v19, v6);
        v22 = v21;
        if (v20 + v21 > (unint64_t)objc_msgSend(v6, "numberOfColumns"))
          v22 = objc_msgSend(v6, "numberOfColumns") - v20;
        objc_msgSend(v12, "setColumnRange:", v20, v22);
        -[SXColumnStack addComponentBlueprint:](v25, "addComponentBlueprint:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  return v25;
}

- (id)sortComponentDependencies:(id)a3 forBlueprint:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  objc_msgSend(a3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__SXColumnLayouter_sortComponentDependencies_forBlueprint___block_invoke;
  v10[3] = &unk_24D6876B8;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "sortUsingComparator:", v10);

  return v7;
}

uint64_t __59__SXColumnLayouter_sortComponentDependencies_forBlueprint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "componentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaption caption]((uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "indexOfObject:", v9);
  objc_msgSend(*(id *)(a1 + 32), "componentIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaption caption]((uint64_t)v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 < objc_msgSend(v11, "indexOfObject:", v12))
    v13 = -1;
  else
    v13 = 1;

  return v13;
}

- (BOOL)anchorPossibleForComponentWithBlueprint:(id)a3 anchoredToComponentWithBlueprint:(id)a4 layoutBlueprint:(id)a5 columnStack:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  id v49;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;
  NSRange v63;
  NSRange v64;
  NSRange v65;
  NSRange v66;

  v62 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "componentIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "component");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "indexOfObjectIdenticalTo:", v15);

  objc_msgSend(v11, "componentIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v10;
  objc_msgSend(v10, "component");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v17, "indexOfObjectIdenticalTo:", v19);

  if (v16 <= v20)
  {
    objc_msgSend(v12, "componentsAfterComponent:", v9);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v36)
    {
      v37 = v36;
      v49 = v12;
      v50 = v9;
      v38 = *(_QWORD *)v53;
LABEL_14:
      v39 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v38)
          objc_enumerationMutation(v21);
        v40 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v39);
        objc_msgSend(v40, "component");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "componentIdentifiers");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "indexOfObjectIdenticalTo:", v28);

        if (v43 < v20)
        {
          v44 = objc_msgSend(v40, "columnRange");
          v46 = v45;
          v66.location = objc_msgSend(v51, "columnRange");
          v66.length = v47;
          v64.location = v44;
          v64.length = v46;
          if (NSIntersectionRange(v64, v66).length)
            goto LABEL_22;
        }

        if (v37 == ++v39)
        {
          v37 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          v35 = 1;
          if (v37)
            goto LABEL_14;
          goto LABEL_23;
        }
      }
    }
LABEL_24:
    v35 = 1;
    goto LABEL_25;
  }
  objc_msgSend(v12, "componentsBeforeComponent:", v9);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v22)
    goto LABEL_24;
  v23 = v22;
  v49 = v12;
  v50 = v9;
  v24 = *(_QWORD *)v57;
LABEL_4:
  v25 = 0;
  while (1)
  {
    if (*(_QWORD *)v57 != v24)
      objc_enumerationMutation(v21);
    v26 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v25);
    objc_msgSend(v26, "component");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "componentIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "indexOfObjectIdenticalTo:", v28);

    if (v30 > v20)
    {
      v31 = objc_msgSend(v26, "columnRange");
      v33 = v32;
      v65.location = objc_msgSend(v51, "columnRange");
      v65.length = v34;
      v63.location = v31;
      v63.length = v33;
      if (NSIntersectionRange(v63, v65).length)
        break;
    }

    if (v23 == ++v25)
    {
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      v35 = 1;
      if (v23)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
LABEL_22:

  v35 = 0;
LABEL_23:
  v12 = v49;
  v9 = v50;
LABEL_25:

  return v35;
}

- (BOOL)intersectionPossibleForComponentWithBlueprint:(id)a3 anchoredToComponentWithBlueprint:(id)a4 layoutBlueprint:(id)a5 columnStack:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  SXColumnLayouter *v41;
  id v42;
  void *v43;
  id v44;
  NSMutableDictionary *intersectionCache;
  void *v46;
  unint64_t v48;
  void *v49;
  void *v50;
  NSRange v51;
  NSRange v52;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "component");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "component");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@"), v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_intersectionCache, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    LOBYTE(v22) = objc_msgSend(v20, "BOOLValue");
  }
  else
  {
    objc_msgSend(v11, "component");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "anchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v10, "columnRange");
    v27 = v26;
    v52.location = objc_msgSend(v11, "columnRange");
    v52.length = v28;
    v51.location = v25;
    v51.length = v27;
    v50 = v12;
    if (NSIntersectionRange(v51, v52).length)
    {
      v49 = v24;
      objc_msgSend(v24, "targetComponentIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "component");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v29, "isEqualToString:", v31);

      if ((v32 & 1) != 0)
      {
        v22 = 0;
        v24 = v49;
      }
      else
      {
        objc_msgSend(v50, "componentIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "component");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v33, "indexOfObjectIdenticalTo:", v35);

        objc_msgSend(v50, "componentIdentifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "component");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v36, "indexOfObjectIdenticalTo:", v38);

        if (v48 <= v39)
        {
          objc_msgSend(v13, "componentsBeforeComponent:", v11);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = self;
          v42 = v13;
          v43 = v40;
          v44 = v10;
        }
        else
        {
          objc_msgSend(v13, "componentsBeforeComponent:", v10);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = self;
          v42 = v13;
          v43 = v40;
          v44 = v11;
        }
        v22 = -[SXColumnLayouter stack:stackComponents:containsComponentIncludingAnchoredComponents:forSourceComponent:](v41, "stack:stackComponents:containsComponentIncludingAnchoredComponents:forSourceComponent:", v42, v43, v44, v10);
        v24 = v49;

      }
    }
    else
    {
      v22 = 0;
    }
    intersectionCache = self->_intersectionCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v22);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](intersectionCache, "setObject:forKey:", v46, v19);

    v12 = v50;
  }

  return v22;
}

- (BOOL)stack:(id)a3 stackComponents:(id)a4 containsComponentIncludingAnchoredComponents:(id)a5 forSourceComponent:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t i;
  id v19;
  void *v20;
  void *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  NSRange v48;
  NSRange v49;
  NSRange v50;
  NSRange v51;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v38 = v9;
  objc_msgSend(v9, "allComponentsBeforeComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    v17 = 1;
    v36 = v13;
    v40 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(obj);
        v19 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v13, "containsObject:", v19, v36) & 1) == 0)
        {
          objc_msgSend(v19, "component");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "anchor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 == v11)
            goto LABEL_20;
          v22 = objc_msgSend(v19, "columnRange");
          v24 = v23;
          v50.location = objc_msgSend(v12, "columnRange");
          v50.length = v25;
          v48.location = v22;
          v48.length = v24;
          if (NSIntersectionRange(v48, v50).length)
          {
            v26 = objc_msgSend(v19, "columnRange");
            v28 = v27;
            v51.location = objc_msgSend(v11, "columnRange");
            v51.length = v29;
            v49.location = v26;
            v49.length = v28;
            if (NSIntersectionRange(v49, v51).length)
            {
              objc_msgSend(v12, "component");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "anchor");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "targetComponentIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "targetComponentIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v32, "isEqualToString:", v33))
              {

LABEL_19:
                v17 = 0;
                v13 = v36;
LABEL_20:

                goto LABEL_21;
              }
              v39 = objc_msgSend(v21, "range");

              if (v39 == 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_19;
              objc_msgSend(v38, "componentsBeforeComponent:", v19);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[SXColumnLayouter stack:stackComponents:containsComponentIncludingAnchoredComponents:forSourceComponent:](self, "stack:stackComponents:containsComponentIncludingAnchoredComponents:forSourceComponent:", v38, v34, v11, v12);

              v13 = v36;
            }
          }

          v16 = v40;
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_21:

  return v17;
}

- (BOOL)componentBlueprint:(id)a3 shouldIntersectWithComponentBlueprint:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  char v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "columnRange");
  if (v7 <= objc_msgSend(v6, "columnRange"))
  {
    v13 = 1;
  }
  else
  {
    v8 = objc_msgSend(v5, "columnRange");
    objc_msgSend(v5, "columnRange");
    v10 = v9 + v8;
    v11 = objc_msgSend(v6, "columnRange");
    objc_msgSend(v6, "columnRange");
    v13 = v10 >= v12 + v11;
  }
  objc_msgSend(v6, "componentSizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "allowComponentIntersection");

  return v15 & v13;
}

- (double)factorForLayoutAttribute:(int)a3
{
  double result;

  result = 0.0;
  if (a3 == 1)
    result = 0.5;
  if (a3 == 2)
    return 1.0;
  return result;
}

- (int)layoutAttributeForAnchor:(int64_t)a3
{
  if (a3 == 3)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (SXLayouterDelegate)delegate
{
  return (SXLayouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXLayouterFactory)layouterFactory
{
  return self->_layouterFactory;
}

- (NSMutableDictionary)intersectionCache
{
  return self->_intersectionCache;
}

- (SXLayoutContextFactory)layoutContextFactory
{
  return self->_layoutContextFactory;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_layoutContextFactory, 0);
  objc_storeStrong((id *)&self->_intersectionCache, 0);
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
