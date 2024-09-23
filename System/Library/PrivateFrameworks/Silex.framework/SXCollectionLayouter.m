@implementation SXCollectionLayouter

- (SXCollectionLayouter)initWithContainerComponent:(id)a3 layouterFactory:(id)a4 columnCalculator:(id)a5 unitConverterFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXCollectionLayouter *v15;
  SXCollectionLayouter *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXCollectionLayouter;
  v15 = -[SXCollectionLayouter init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerComponentBlueprint, a3);
    objc_storeStrong((id *)&v16->_layouterFactory, a4);
    objc_storeStrong((id *)&v16->_columnCalculator, a5);
    objc_storeStrong((id *)&v16->_unitConverterFactory, a6);
  }

  return v16;
}

- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  double v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  BOOL v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  unint64_t v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id obj;
  uint64_t v121;
  void *v122;
  void *v124;
  id v125;
  void *v127;
  void *v128;
  id v129;
  uint64_t v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  id v148;
  __int16 v149;
  void *v150;
  uint64_t v151;

  v151 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v125 = a4;
  v129 = a5;
  v9 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v129, "taskIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v148 = v8;
    v149 = 2114;
    v150 = v11;
    _os_log_impl(&dword_217023000, v10, OS_LOG_TYPE_DEFAULT, "Starting collection layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);

  }
  -[SXCollectionLayouter containerComponentBlueprint](self, "containerComponentBlueprint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "component");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXCollectionLayouter containerComponentBlueprint](self, "containerComponentBlueprint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = v13;
  objc_msgSend(v13, "contentDisplay");
  v16 = objc_claimAutoreleasedReturnValue();
  -[SXCollectionLayouter containerComponentBlueprint](self, "containerComponentBlueprint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "columnRange");
  v113 = v15;
  objc_msgSend(v125, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v18, v19, objc_msgSend(v15, "ignoreDocumentMargin"), objc_msgSend(v15, "ignoreDocumentGutter"), objc_msgSend(v15, "ignoreViewportPadding"));
  v21 = v20;

  objc_msgSend(v8, "startUpdatesForWidth:", v21);
  -[SXCollectionLayouter unitConverterFactory](self, "unitConverterFactory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXCollectionLayouter containerComponentBlueprint](self, "containerComponentBlueprint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "parentLayoutBlueprint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "blueprintSize");
  v26 = v25;
  objc_msgSend(v8, "layoutOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v27, v21, v26);
  v28 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentIdentifiers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)v16;
  v112 = (void *)v28;
  +[SXCollectionCalculator layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:](SXCollectionCalculator, "layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:", v16, objc_msgSend(v29, "count"), v28, v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "rowsLayouts");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    v33 = 0;
    v34 = 0;
    v35 = 0.0;
    v122 = v8;
    v115 = v30;
    do
    {
      objc_msgSend(v30, "rowsLayouts");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndex:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v128 = v37;
      v38 = objc_msgSend(v37, "componentsPerRow");
      objc_msgSend(v8, "componentIdentifiers");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "subarrayWithRange:", v33, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v30, "spaceBetweenRows");
        v35 = v35 + v41;
      }
      -[SXCollectionLayouter unitConverterFactory](self, "unitConverterFactory");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "componentWidth");
      v44 = v43;
      objc_msgSend(v8, "layoutOptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v45, v44, v21);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      obj = v40;
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v146, 16);
      if (v46)
      {
        v116 = v38;
        v117 = v34;
        v118 = v33;
        v47 = 0;
        v48 = *(_QWORD *)v141;
        v49 = 0.0;
        v50 = obj;
        v51 = v46;
        v119 = *(_QWORD *)v141;
        do
        {
          v52 = 0;
          v121 = v51;
          do
          {
            if (*(_QWORD *)v141 != v48)
              objc_enumerationMutation(v50);
            v53 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * v52);
            v54 = objc_msgSend(v50, "indexOfObject:", v53);
            objc_msgSend(v8, "componentBlueprintForComponentIdentifier:", v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v56 = (void *)SXLayoutLog;
              if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
              {
                v57 = v56;
                objc_msgSend(v55, "component");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "identifier");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "taskIdentifier");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v148 = v59;
                v149 = 2114;
                v150 = v60;
                _os_log_impl(&dword_217023000, v57, OS_LOG_TYPE_DEFAULT, "Calculating size and position, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

              }
              objc_msgSend(v55, "layoutBlueprint");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "componentLayout");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v62, "minimumHeight");
              objc_msgSend(v127, "convertValueToPoints:", v63, v64);
              v66 = v65;

              -[SXCollectionLayouter containerComponentBlueprint](self, "containerComponentBlueprint");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXCollectionLayouter childColumnLayoutForRowLayout:display:collectionContainerBlueprint:childContainerComponentBlueprint:documentColumnLayout:unitConverter:](self, "childColumnLayoutForRowLayout:display:collectionContainerBlueprint:childContainerComponentBlueprint:documentColumnLayout:unitConverter:", v128, v124, v67, v55, v125, v127);
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v68, "setMinimumHeight:", v66);
              -[SXCollectionLayouter layouterFactory](self, "layouterFactory");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              -[SXCollectionLayouter delegate](self, "delegate");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "layouterForContainerComponentBlueprint:delegate:", v55, v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v71, "layoutBlueprint:columnLayout:description:shouldContinue:", v61, v68, v129, a6);
              objc_msgSend(v55, "componentSizer");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "contentInsetsWithUnitConverter:", v127);
              v74 = v73;
              v76 = v75;

              objc_msgSend(v128, "componentWidth");
              v78 = v77;
              objc_msgSend(v61, "blueprintSize");
              if (v76 + v74 + v79 >= v66)
                v66 = v76 + v74 + v79;
              objc_msgSend(v128, "componentWidth");
              v81 = v80;
              objc_msgSend(v128, "spaceBetweenComponents");
              v83 = v82 * (double)v54 + v81 * (double)v54;
              objc_msgSend(v128, "leftMargin");
              v85 = v84 + v83;
              v8 = v122;
              objc_msgSend(v122, "updateSize:forComponentWithIdentifier:", v53, v78, v66);
              objc_msgSend(v122, "updatePosition:forComponentWithIdentifier:", v53, v85, v35);
              v86 = v49 != 0.0;
              if (v49 == v66)
                v86 = 0;
              v47 |= v86;
              if (v66 > v49)
                v49 = v66;

              v48 = v119;
              v50 = obj;
              v51 = v121;
            }

            ++v52;
          }
          while (v51 != v52);
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v140, v146, 16);
        }
        while (v51);

        if ((v47 & 1) == 0)
        {
          v30 = v115;
          v38 = v116;
          v34 = v117;
          v33 = v118;
          goto LABEL_47;
        }
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v131 = v50;
        v87 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v136, v145, 16);
        if (v87)
        {
          v88 = v87;
          v89 = *(_QWORD *)v137;
          do
          {
            v90 = 0;
            v130 = v88;
            do
            {
              if (*(_QWORD *)v137 != v89)
                objc_enumerationMutation(v131);
              v91 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v90);
              objc_msgSend(v8, "componentBlueprintForComponentIdentifier:", v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v92, "layoutBlueprint");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v132 = 0u;
                v133 = 0u;
                v134 = 0u;
                v135 = 0u;
                objc_msgSend(v93, "componentIdentifiers");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
                if (v95)
                {
                  v96 = v95;
                  v97 = *(_QWORD *)v133;
                  do
                  {
                    for (i = 0; i != v96; ++i)
                    {
                      if (*(_QWORD *)v133 != v97)
                        objc_enumerationMutation(v94);
                      objc_msgSend(v93, "invalidatePositionForComponentWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * i));
                    }
                    v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v132, v144, 16);
                  }
                  while (v96);
                }

                -[SXCollectionLayouter containerComponentBlueprint](self, "containerComponentBlueprint");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                -[SXCollectionLayouter childColumnLayoutForRowLayout:display:collectionContainerBlueprint:childContainerComponentBlueprint:documentColumnLayout:unitConverter:](self, "childColumnLayoutForRowLayout:display:collectionContainerBlueprint:childContainerComponentBlueprint:documentColumnLayout:unitConverter:", v128, v124, v99, v92, v125, v127);
                v100 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v100, "setMinimumHeight:", v49);
                -[SXCollectionLayouter layouterFactory](self, "layouterFactory");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                -[SXCollectionLayouter delegate](self, "delegate");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "layouterForContainerComponentBlueprint:delegate:", v92, v102);
                v103 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v103, "layoutBlueprint:columnLayout:description:shouldContinue:", v93, v100, v129, a6);
                objc_msgSend(v128, "componentWidth");
                v105 = v104;
                objc_msgSend(v93, "blueprintSize");
                if (v106 < v49)
                  v106 = v49;
                v8 = v122;
                objc_msgSend(v122, "updateSize:forComponentWithIdentifier:", v91, v105, v106);

                v88 = v130;
              }

              ++v90;
            }
            while (v90 != v88);
            v88 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v136, v145, 16);
          }
          while (v88);
        }
        v30 = v115;
        v38 = v116;
        v34 = v117;
        v33 = v118;
      }
      else
      {
        v49 = 0.0;
      }
      v50 = obj;

LABEL_47:
      v33 += v38;
      v35 = v35 + v49;

      ++v34;
      objc_msgSend(v30, "rowsLayouts");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v107, "count");

    }
    while (v34 < v108);
  }
  objc_msgSend(v8, "endUpdates");
  v109 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v110 = v109;
    objc_msgSend(v129, "taskIdentifier");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v148 = v8;
    v149 = 2114;
    v150 = v111;
    _os_log_impl(&dword_217023000, v110, OS_LOG_TYPE_DEFAULT, "Finished collection layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);

  }
}

- (id)childColumnLayoutForRowLayout:(id)a3 display:(id)a4 collectionContainerBlueprint:(id)a5 childContainerComponentBlueprint:(id)a6 documentColumnLayout:(id)a7 unitConverter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  SXDocumentLayout *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  SXDocumentLayout *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v56;
  SXCollectionLayouter *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;

  v61 = a3;
  v14 = a4;
  v15 = a5;
  v59 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v16, "documentLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (double)objc_msgSend(v18, "width");
  v21 = (double)objc_msgSend(v18, "width");
  v57 = self;
  -[SXCollectionLayouter columnCalculator](self, "columnCalculator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  objc_msgSend(v16, "contentScaleFactor");
  v58 = v18;
  objc_msgSend(v22, "columnLayoutWithViewportSize:constrainedToWidth:documentLayout:contentScaleFactor:", v18, v20, v21, v20, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v19, "columnRange");
  v56 = v19;
  objc_msgSend(v25, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v26, v27, objc_msgSend(v19, "ignoreDocumentMargin"), objc_msgSend(v19, "ignoreDocumentGutter"), objc_msgSend(v19, "ignoreViewportPadding"));
  v29 = v28;
  v30 = v15;
  objc_msgSend(v15, "layoutBlueprint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "componentIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v14;
  +[SXCollectionCalculator layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:](SXCollectionCalculator, "layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:", v14, objc_msgSend(v32, "count"), v17, v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "rowsLayouts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectEnumerator");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  do
  {
    v37 = v36;
    objc_msgSend(v35, "nextObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      break;
    v38 = objc_msgSend(v36, "intendedComponentsPerRow");
  }
  while (v38 != objc_msgSend(v36, "componentsPerRow"));
  objc_msgSend(v36, "componentWidth");
  v40 = v39;
  v41 = [SXDocumentLayout alloc];
  v42 = objc_msgSend(v23, "gutter");
  objc_msgSend(v30, "componentLayout");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "columnRange");
  v45 = -[SXDocumentLayout initWithWidth:margin:gutter:columns:](v41, "initWithWidth:margin:gutter:columns:", (uint64_t)v40, 0, v42, v44);

  objc_msgSend(v59, "componentSizer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "contentInsetsWithUnitConverter:", v17);
  v48 = v47;
  v50 = v49;

  objc_msgSend(v61, "componentWidth");
  v52 = v51 - (v48 + v50);
  -[SXCollectionLayouter columnCalculator](v57, "columnCalculator");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "columnLayoutWithConstrainedViewportSize:viewportSize:documentLayout:", v45, v52, v52, v52, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
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

- (SXContainerComponentBlueprint)containerComponentBlueprint
{
  return self->_containerComponentBlueprint;
}

- (SXColumnCalculator)columnCalculator
{
  return self->_columnCalculator;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_columnCalculator, 0);
  objc_storeStrong((id *)&self->_containerComponentBlueprint, 0);
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
