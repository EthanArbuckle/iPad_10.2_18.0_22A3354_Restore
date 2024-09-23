@implementation CRLInteractiveCanvasRepContentUpdater

- (CRLInteractiveCanvasRepContentUpdater)initWithCanvas:(id)a3 layerDelegate:(id)a4
{
  id v7;
  id v8;
  CRLInteractiveCanvasRepContentUpdater *v9;
  CRLInteractiveCanvasRepContentUpdater *v10;
  NSMapTable *v11;
  NSMapTable *repRenderablesByRep;
  NSMapTable *v13;
  NSMapTable *repsByRepRenderables;
  NSMapTable *v15;
  NSMapTable *containerLayersByRep;
  NSMapTable *v17;
  NSMapTable *repsByContainerLayer;
  NSMapTable *v19;
  NSMapTable *childWrapperLayersByRep;
  NSMapTable *v21;
  NSMapTable *repsByChildWrapperLayer;
  NSArray *repContentPiles;
  NSOrderedSet *v24;
  NSOrderedSet *allReps;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CRLInteractiveCanvasRepContentUpdater;
  v9 = -[CRLInteractiveCanvasRepContentUpdater init](&v27, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_canvas, a3);
    objc_storeWeak((id *)&v10->_layerDelegate, v8);
    v11 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    repRenderablesByRep = v10->_repRenderablesByRep;
    v10->_repRenderablesByRep = v11;

    v13 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 512, 0);
    repsByRepRenderables = v10->_repsByRepRenderables;
    v10->_repsByRepRenderables = v13;

    v15 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    containerLayersByRep = v10->_containerLayersByRep;
    v10->_containerLayersByRep = v15;

    v17 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    repsByContainerLayer = v10->_repsByContainerLayer;
    v10->_repsByContainerLayer = v17;

    v19 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    childWrapperLayersByRep = v10->_childWrapperLayersByRep;
    v10->_childWrapperLayersByRep = v19;

    v21 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    repsByChildWrapperLayer = v10->_repsByChildWrapperLayer;
    v10->_repsByChildWrapperLayer = v21;

    repContentPiles = v10->_repContentPiles;
    v10->_repContentPiles = (NSArray *)&__NSArray0__struct;

    v24 = (NSOrderedSet *)objc_alloc_init((Class)NSOrderedSet);
    allReps = v10->_allReps;
    v10->_allReps = v24;

  }
  return v10;
}

- (void)teardown
{
  NSMapTable *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_repsByRepRenderables;
  v3 = -[NSMapTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "setDelegate:", 0, (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)updateRepContent
{
  -[CRLInteractiveCanvasRepContentUpdater updateRepContentForcingUpdateOfValidLayers:](self, "updateRepContentForcingUpdateOfValidLayers:", 0);
}

- (void)updateRepContentForcingUpdateOfValidLayers:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  NSOrderedSet *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSOrderedSet *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  CRLInteractiveCanvasRepLayerPile *v29;
  NSArray *repContentPiles;
  NSArray *v31;
  NSOrderedSet *allReps;
  void *v33;
  void *v34;
  void *context;
  NSArray *v36;
  uint64_t v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  v3 = a3;
  v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  v6 = (NSOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  context = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_repRenderablesByRep, "keyEnumerator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas canvasController](self->_canvas, "canvasController"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "repsToHide"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvas topLevelReps](self->_canvas, "topLevelReps"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v10);
        -[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:](self, "p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), v5, v6, 0, v9, v3);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v12);
  }
  v33 = (void *)v9;
  v36 = v5;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v8;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    v37 = *(_QWORD *)v45;
    do
    {
      v18 = 0;
      v38 = v16;
      do
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v18);
        if (!-[NSOrderedSet containsObject:](v6, "containsObject:", v19))
        {
          v20 = v6;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_repRenderablesByRep, "objectForKey:", v19));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_containerLayersByRep, "objectForKey:", v19));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_childWrapperLayersByRep, "objectForKey:", v19));
          -[CRLInteractiveCanvasRepContentUpdater p_discardRenderable:forRep:](self, "p_discardRenderable:forRep:", v21, v19);
          -[NSMapTable removeObjectForKey:](self->_containerLayersByRep, "removeObjectForKey:", v19);
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v24 = v22;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v26; j = (char *)j + 1)
              {
                if (*(_QWORD *)v41 != v27)
                  objc_enumerationMutation(v24);
                -[NSMapTable removeObjectForKey:](self->_repsByContainerLayer, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j));
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            }
            while (v26);
          }

          -[NSMapTable removeObjectForKey:](self->_childWrapperLayersByRep, "removeObjectForKey:", v19);
          -[NSMapTable removeObjectForKey:](self->_repsByChildWrapperLayer, "removeObjectForKey:", v23);

          v6 = v20;
          v17 = v37;
          v16 = v38;
        }
        v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(context);
  if (!-[NSArray count](v36, "count"))
  {
    v29 = objc_alloc_init(CRLInteractiveCanvasRepLayerPile);
    -[NSArray addObject:](v36, "addObject:", v29);

  }
  repContentPiles = self->_repContentPiles;
  self->_repContentPiles = v36;
  v31 = v36;

  allReps = self->_allReps;
  self->_allReps = v6;

}

- (void)updateLayerFramesOnlyForReps:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  _BYTE v34[128];

  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater renderableForRep:](self, "renderableForRep:", v9));
        if (!v10)
        {
          v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012395C0);
          v12 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v25 = v11;
            v26 = 2082;
            v27 = "-[CRLInteractiveCanvasRepContentUpdater updateLayerFramesOnlyForReps:]";
            v28 = 2082;
            v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m";
            v30 = 1024;
            v31 = 131;
            v32 = 2082;
            v33 = "renderable";
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012395E0);
          v13 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v18 = v13;
            v19 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v25 = v11;
            v26 = 2114;
            v27 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater updateLayerFramesOnlyForReps:]"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 131, 0, "invalid nil value for '%{public}s'", "renderable");

        }
        objc_msgSend(v9, "willUpdateRenderable:", v10);
        objc_msgSend(v9, "updateRenderableGeometryFromLayout:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_childWrapperLayersByRep, "objectForKeyedSubscript:", v9));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
          -[CRLInteractiveCanvasRepContentUpdater p_updateChildWrapperLayer:forRep:withLayer:](self, "p_updateChildWrapperLayer:forRep:withLayer:", v16, v9, v17);

        }
        objc_msgSend(v9, "didUpdateRenderable:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v34, 16);
    }
    while (v6);
  }

}

- (void)p_recursivelyUpdateRenderableForRep:(id)a3 accumulatingRepContentPiles:(id)a4 andReps:(id)a5 suppressLayers:(BOOL)a6 hidingLayersForReps:(id)a7 forcingUpdateOfValidLayers:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  id v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  id v21;
  CRLInteractiveCanvasRepLayerPile *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  id WeakRetained;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unsigned int v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  CRLInteractiveCanvasRepContentPlatformViewPile *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  NSHashTable *v61;
  NSHashTable *clonedParentRepLayers;
  id v63;
  id v64;
  uint64_t v65;
  void *j;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *k;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  unsigned __int8 v84;
  unsigned int v85;
  unsigned int v86;
  void *v87;
  unsigned int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  CRLInteractiveCanvasRepContentPlatformViewPile *v94;
  CRLInteractiveCanvasRepContentPlatformViewPile *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  NSHashTable *v105;
  NSHashTable *v106;
  id v107;
  id v108;
  uint64_t v109;
  void *m;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  objc_class *v120;
  void *v121;
  id v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  uint64_t v137;
  void *v138;
  void *v139;
  unsigned int v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  objc_class *v147;
  NSString *v148;
  void *v149;
  uint64_t v150;
  objc_class *v151;
  NSString *v152;
  void *v153;
  objc_class *v154;
  NSString *v155;
  id v156;
  uint64_t v157;
  objc_class *v158;
  NSString *v159;
  id v160;
  char *v161;
  uint64_t v162;
  objc_class *v163;
  void *v164;
  id v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  _QWORD *v175;
  void *v176;
  id v177;
  id v178;
  id v179;
  id v180;
  _QWORD *v181;
  void *v182;
  CRLNoDefaultImplicitActionLayer *v183;
  void *v184;
  unsigned int v185;
  void *v186;
  id v187;
  id v188;
  id v189;
  id v190;
  _BOOL4 v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id obj;
  CRLInteractiveCanvasRepContentUpdater *v198;
  _QWORD v199[4];
  id v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  _QWORD v209[4];
  id v210;
  CRLInteractiveCanvasRepContentUpdater *v211;
  id v212;
  id v213;
  id v214;
  BOOL v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  id v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  id v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  _QWORD v234[4];
  id v235;
  CRLInteractiveCanvasRepContentUpdater *v236;
  id v237;
  id v238;
  id v239;
  uint64_t *v240;
  char v241;
  uint64_t v242;
  uint64_t *v243;
  uint64_t v244;
  uint64_t (*v245)(uint64_t, uint64_t);
  void (*v246)(uint64_t);
  id v247;
  uint8_t buf[4];
  unsigned int v249;
  __int16 v250;
  const char *v251;
  __int16 v252;
  const char *v253;
  __int16 v254;
  int v255;
  __int16 v256;
  id v257;
  __int16 v258;
  id v259;
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];

  v8 = a8;
  v10 = a6;
  v14 = a3;
  v187 = a4;
  v180 = a5;
  v15 = a7;
  v191 = v8;
  if (v8)
    v185 = 1;
  else
    v185 = -[CRLCanvas i_areContentLayersInvalidForRep:](self->_canvas, "i_areContentLayersInvalidForRep:", v14);
  v198 = self;
  -[CRLCanvas contentsScale](self->_canvas, "contentsScale");
  v17 = v16;
  v242 = 0;
  v243 = &v242;
  v244 = 0x3032000000;
  v245 = sub_10011B21C;
  v246 = sub_10011B22C;
  v19 = (objc_class *)objc_opt_class(CRLInteractiveCanvasRepLayerPile, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "lastObject"));
  v21 = sub_1002223BC(v19, v20);
  v247 = (id)objc_claimAutoreleasedReturnValue(v21);

  if (!v243[5])
  {
    v22 = objc_alloc_init(CRLInteractiveCanvasRepLayerPile);
    v23 = (void *)v243[5];
    v243[5] = (uint64_t)v22;

    objc_msgSend(v187, "addObject:", v243[5]);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_containerLayersByRep, "objectForKey:", v14));
  v25 = objc_msgSend(v24, "mutableCopy");

  v26 = objc_alloc_init((Class)NSMutableArray);
  v234[0] = _NSConcreteStackBlock;
  v234[1] = 3221225472;
  v234[2] = sub_10011B234;
  v234[3] = &unk_101239608;
  v177 = v25;
  v235 = v177;
  v236 = self;
  v193 = v14;
  v237 = v193;
  v240 = &v242;
  v178 = v15;
  v238 = v178;
  v241 = v185;
  v179 = v26;
  v239 = v179;
  v181 = objc_retainBlock(v234);
  v27 = ((uint64_t (*)(void))v181[2])();
  v184 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v28 = v193;
  v186 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater renderableForRep:](self, "renderableForRep:", v193));
  v188 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "layer"));
  if (v185)
  {
    v29 = (objc_class *)objc_msgSend(v193, "layerClass");
    if (v188)
    {
      if (objc_msgSend(v188, "isMemberOfClass:", v29) && !v10)
        goto LABEL_20;
      -[CRLInteractiveCanvasRepContentUpdater p_discardRenderable:forRep:](self, "p_discardRenderable:forRep:", v186, v193);

      v186 = 0;
      v28 = v193;
    }
    if (v10)
    {
      v188 = 0;
    }
    else
    {
      v188 = objc_alloc_init(v29);
      v30 = objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v188));

      -[NSMapTable setObject:forKey:](self->_repRenderablesByRep, "setObject:forKey:", v30, v193);
      -[NSMapTable setObject:forKey:](self->_repsByRepRenderables, "setObject:forKey:", v193, v30);
      WeakRetained = objc_loadWeakRetained((id *)&self->_layerDelegate);
      objc_msgSend(v188, "setDelegate:", WeakRetained);

      if ((objc_msgSend(v193, "directlyManagesLayerContent") & 1) == 0)
        objc_msgSend(v188, "setNeedsDisplay");
      v33 = objc_opt_class(CRLTilingLayer, v32);
      v34 = sub_100221D0C(v33, v188);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v34);
      if (v36)
        objc_msgSend(v36, "setTilingMode:", objc_msgSend(v193, "tilingMode"));
      v37 = objc_opt_class(CATransformLayer, v35);
      if ((objc_opt_isKindOfClass(v188, v37) & 1) == 0)
        objc_msgSend(v188, "setContentsScale:", v17);

      v186 = (void *)v30;
      v28 = v193;
    }
  }
LABEL_20:
  objc_msgSend(v180, "addObject:", v28);
  if (v188)
  {
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "childReps"));
    if (objc_msgSend(v176, "count"))
      v38 = 1;
    else
      v38 = objc_msgSend(v28, "wantsChildRepLayerUpdatingCallsEvenWithNoChildren");
    if (v185)
    {
      objc_msgSend(v28, "willUpdateRenderable:", v186);
      objc_msgSend(v28, "updateRenderableGeometryFromLayout:", v186);
      objc_msgSend(v188, "setMasksToBounds:", objc_msgSend(v28, "masksToBounds"));
      objc_msgSend(v188, "setOpaque:", objc_msgSend(v28, "isOpaque"));
      v42 = objc_opt_class(CATransformLayer, v41);
      if ((objc_opt_isKindOfClass(v188, v42) & 1) == 0)
        objc_msgSend(v188, "setContentsScale:", v17);
    }
    v43 = objc_alloc_init((Class)NSMutableArray);
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "additionalRenderablesUnderRenderable"));
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v230, v265, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v231;
      do
      {
        for (i = 0; i != v44; i = (char *)i + 1)
        {
          if (*(_QWORD *)v231 != v45)
            objc_enumerationMutation(obj);
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v230 + 1) + 8 * (_QWORD)i), "layer"));
          v49 = objc_opt_class(CATransformLayer, v48);
          if ((objc_opt_isKindOfClass(v47, v49) & 1) == 0)
            objc_msgSend(v47, "setContentsScale:", v17);
          objc_msgSend(v43, "addObject:", v47);

        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v230, v265, 16);
      }
      while (v44);
    }

    if (objc_msgSend(v193, "directlyManagesAdditionalPlatformViewUnderRenderable"))
    {
      v50 = -[CRLInteractiveCanvasRepContentPlatformViewPile initWithRep:kind:]([CRLInteractiveCanvasRepContentPlatformViewPile alloc], "initWithRep:kind:", v193, 0);
      objc_msgSend(v187, "addObject:", v50);
      objc_msgSend(v184, "setSublayers:", v43);
      v51 = objc_alloc_init((Class)NSMutableArray);

      v52 = (void *)v243[5];
      if (!v52)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239628);
        v53 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
          sub_100DFC638();

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239648);
        v54 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DFC2A8(v55);
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v57, 295, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");

        v52 = (void *)v243[5];
      }
      v229 = 0;
      v58 = objc_msgSend(v52, "newRepLayerPileByTransferringAndCloningParentLayers:", &v229);
      v59 = v229;
      v60 = (void *)v243[5];
      v243[5] = (uint64_t)v58;

      objc_msgSend(v187, "addObject:", v243[5]);
      if (objc_msgSend(v59, "count"))
      {
        if (!self->_clonedParentRepLayers)
        {
          v61 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
          clonedParentRepLayers = self->_clonedParentRepLayers;
          self->_clonedParentRepLayers = v61;

        }
        v227 = 0u;
        v228 = 0u;
        v225 = 0u;
        v226 = 0u;
        v63 = v59;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v225, v264, 16);
        if (v64)
        {
          v65 = *(_QWORD *)v226;
          do
          {
            for (j = 0; j != v64; j = (char *)j + 1)
            {
              if (*(_QWORD *)v226 != v65)
                objc_enumerationMutation(v63);
              -[NSHashTable addObject:](self->_clonedParentRepLayers, "addObject:", *(_QWORD *)(*((_QWORD *)&v225 + 1) + 8 * (_QWORD)j));
            }
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v225, v264, 16);
          }
          while (v64);
        }

      }
      v67 = ((uint64_t (*)(void))v181[2])();
      v68 = objc_claimAutoreleasedReturnValue(v67);

      v43 = v51;
      v184 = (void *)v68;
    }
    objc_msgSend(v43, "addObject:", v188);
    -[NSMapTable setObject:forKey:](self->_containerLayersByRep, "setObject:forKey:", v179, v193);
    v69 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_childWrapperLayersByRep, "objectForKeyedSubscript:", v193));
    v183 = (CRLNoDefaultImplicitActionLayer *)v69;
    if (v69)
      v70 = 0;
    else
      v70 = v38;
    if (v70 == 1)
    {
      v183 = objc_alloc_init(CRLNoDefaultImplicitActionLayer);
      -[NSMapTable setObject:forKey:](self->_childWrapperLayersByRep, "setObject:forKey:", v183, v193);
      -[NSMapTable setObject:forKey:](self->_repsByChildWrapperLayer, "setObject:forKey:", v193, v183);
    }
    else
    {
      if (v69)
        v71 = v38;
      else
        v71 = 1;
      if ((v71 & 1) == 0)
      {
        -[NSMapTable removeObjectForKey:](self->_childWrapperLayersByRep, "removeObjectForKey:", v193);
        -[NSMapTable removeObjectForKey:](self->_repsByChildWrapperLayer, "removeObjectForKey:", v183);
      }
    }
    if (v38)
    {
      if (!v183)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239668);
        v72 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR))
          sub_100DFC5AC();

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239688);
        v73 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DFC2A8(v74);
        }

        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v75, v76, 341, 0, "invalid nil value for '%{public}s'", "childWrapperLayer");

      }
      -[CRLInteractiveCanvasRepContentUpdater p_updateChildWrapperLayer:forRep:withLayer:](self, "p_updateChildWrapperLayer:forRep:withLayer:");
      objc_msgSend(v43, "addObject:", v183);
    }
    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    v196 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "i_additionalRenderablesOverRenderableIncludingKnobs"));
    v77 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v221, v263, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v222;
      do
      {
        for (k = 0; k != v77; k = (char *)k + 1)
        {
          if (*(_QWORD *)v222 != v78)
            objc_enumerationMutation(v196);
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v221 + 1) + 8 * (_QWORD)k), "layer"));
          v82 = objc_opt_class(CATransformLayer, v81);
          if ((objc_opt_isKindOfClass(v80, v82) & 1) == 0)
            objc_msgSend(v80, "setContentsScale:", v17);
          objc_msgSend(v43, "addObject:", v80);

        }
        v77 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v221, v263, 16);
      }
      while (v77);
    }

    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "sublayers"));
    v84 = objc_msgSend(v83, "isEqualToArray:", v43);

    if ((v84 & 1) == 0)
      objc_msgSend(v184, "setSublayers:", v43);
    v85 = objc_msgSend(v193, "directlyManagesContentPlatformView");
    v86 = objc_msgSend(v193, "directlyManagesAdditionalPlatformViewOverRenderable");
    v87 = v186;
    v88 = v86;
    if ((v85 | v86) == 1)
    {
      if (v38)
      {
        if (!v183)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012396A8);
          v89 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v89, OS_LOG_TYPE_ERROR))
            sub_100DFC520();

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012396C8);
          v90 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v90, OS_LOG_TYPE_ERROR))
          {
            v91 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DFC2A8(v91);
          }

          v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v92, v93, 370, 0, "invalid nil value for '%{public}s'", "childWrapperLayer");

        }
        objc_msgSend((id)v243[5], "pushParentLayer:");
      }
      if (v85)
      {
        v94 = -[CRLInteractiveCanvasRepContentPlatformViewPile initWithRep:kind:]([CRLInteractiveCanvasRepContentPlatformViewPile alloc], "initWithRep:kind:", v193, 1);
        objc_msgSend(v187, "addObject:", v94);

      }
      if (v88)
      {
        v95 = -[CRLInteractiveCanvasRepContentPlatformViewPile initWithRep:kind:]([CRLInteractiveCanvasRepContentPlatformViewPile alloc], "initWithRep:kind:", v193, 2);
        objc_msgSend(v187, "addObject:", v95);

      }
      v96 = (void *)v243[5];
      if (!v96)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", v87);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012396E8);
        v97 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_ERROR))
          sub_100DFC494();

        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101239708);
        v98 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v98, OS_LOG_TYPE_ERROR))
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DFC2A8(v99);
        }

        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
        v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v100, v101, 392, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");

        v96 = (void *)v243[5];
      }
      v220 = 0;
      v102 = objc_msgSend(v96, "newRepLayerPileByTransferringAndCloningParentLayers:", &v220);
      v103 = v220;
      v104 = (void *)v243[5];
      v243[5] = (uint64_t)v102;

      objc_msgSend(v187, "addObject:", v243[5]);
      if (objc_msgSend(v103, "count"))
      {
        if (!self->_clonedParentRepLayers)
        {
          v105 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
          v106 = self->_clonedParentRepLayers;
          self->_clonedParentRepLayers = v105;

        }
        v218 = 0u;
        v219 = 0u;
        v216 = 0u;
        v217 = 0u;
        v107 = v103;
        v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v216, v262, 16);
        if (v108)
        {
          v109 = *(_QWORD *)v217;
          do
          {
            for (m = 0; m != v108; m = (char *)m + 1)
            {
              if (*(_QWORD *)v217 != v109)
                objc_enumerationMutation(v107);
              -[NSHashTable addObject:](self->_clonedParentRepLayers, "addObject:", *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * (_QWORD)m));
            }
            v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v216, v262, 16);
          }
          while (v108);
        }

      }
      v87 = v186;
    }
    if (v38)
    {
      objc_msgSend(v193, "willUpdateChildLayers", v87);
      v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      if (objc_msgSend(v193, "drawsDescendantsIntoLayer"))
      {
        v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v176));

        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "childrenToExcludeWhenDrawingDescendantsIntoLayer"));
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "crl_setBySubtractingSet:", v113));

      }
      v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithArray:](NSMutableOrderedSet, "orderedSetWithArray:", v176));
      v209[0] = _NSConcreteStackBlock;
      v209[1] = 3221225472;
      v209[2] = sub_10011B484;
      v209[3] = &unk_101239730;
      v195 = v111;
      v210 = v195;
      v211 = self;
      v194 = v180;
      v212 = v194;
      v190 = v187;
      v213 = v190;
      v189 = v178;
      v214 = v189;
      v215 = v191;
      v175 = objc_retainBlock(v209);
      if ((objc_msgSend(v193, "directlyManagesContentPlatformView") & 1) == 0)
      {
        objc_msgSend((id)v243[5], "pushParentLayer:", v188);
        v207 = 0u;
        v208 = 0u;
        v205 = 0u;
        v206 = 0u;
        v114 = v176;
        v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v205, v261, 16);
        if (v115)
        {
          v116 = *(_QWORD *)v206;
LABEL_140:
          v117 = 0;
          while (1)
          {
            if (*(_QWORD *)v206 != v116)
              objc_enumerationMutation(v114);
            v118 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * v117);
            if (!objc_msgSend(v118, "wantsRenderableToBeDescendedFromParentRepRenderable"))
              break;
            objc_msgSend(v182, "removeObject:", v118);
            ((void (*)(_QWORD *, void *))v175[2])(v175, v118);
            if (v115 == (id)++v117)
            {
              v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v205, v261, 16);
              if (v115)
                goto LABEL_140;
              break;
            }
          }
        }

        v120 = (objc_class *)objc_opt_class(CRLInteractiveCanvasRepLayerPile, v119);
        v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "lastObject"));
        v122 = sub_1002223BC(v120, v121);
        v123 = objc_claimAutoreleasedReturnValue(v122);
        v124 = (void *)v243[5];
        v243[5] = v123;

        v125 = (void *)v243[5];
        if (!v125)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239750);
          v126 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v126, OS_LOG_TYPE_ERROR))
            sub_100DFC408();

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239770);
          v127 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v127, OS_LOG_TYPE_ERROR))
          {
            v128 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DFC2A8(v128);
          }

          v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
          v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v129, v130, 471, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");

          v125 = (void *)v243[5];
        }
        objc_msgSend(v125, "popParentLayer");
        if (!v183)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239790);
          v131 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v131, OS_LOG_TYPE_ERROR))
            sub_100DFC37C();

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012397B0);
          v132 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v132, OS_LOG_TYPE_ERROR))
          {
            v133 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DFC2A8(v133);
          }

          v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
          v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v134, v135, 476, 0, "invalid nil value for '%{public}s'", "childWrapperLayer");

        }
        objc_msgSend((id)v243[5], "pushParentLayer:");
      }
      if (objc_msgSend(v182, "count"))
      {
        v203 = 0u;
        v204 = 0u;
        v201 = 0u;
        v202 = 0u;
        v192 = v182;
        v136 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v201, v260, 16);
        if (v136)
        {
          v137 = *(_QWORD *)v202;
          do
          {
            v138 = 0;
            do
            {
              if (*(_QWORD *)v202 != v137)
                objc_enumerationMutation(v192);
              v139 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * (_QWORD)v138);
              if (objc_msgSend(v139, "wantsRenderableToBeDescendedFromParentRepRenderable"))
              {
                v140 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012397D0);
                v141 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v141, OS_LOG_TYPE_ERROR))
                {
                  v154 = (objc_class *)objc_opt_class(v193, v142);
                  v155 = NSStringFromClass(v154);
                  v156 = (id)objc_claimAutoreleasedReturnValue(v155);
                  v158 = (objc_class *)objc_opt_class(v139, v157);
                  v159 = NSStringFromClass(v158);
                  v160 = (id)objc_claimAutoreleasedReturnValue(v159);
                  *(_DWORD *)buf = 67110402;
                  v249 = v140;
                  v250 = 2082;
                  v251 = "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepCont"
                         "entPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]";
                  v252 = 2082;
                  v253 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m";
                  v254 = 1024;
                  v255 = 489;
                  v256 = 2114;
                  v257 = v156;
                  v258 = 2114;
                  v259 = v160;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v141, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot make this layer descend from parent %{public}@ rep's layer, but the rep %{public}@ is asking to", buf, 0x36u);

                }
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_1012397F0);
                v143 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v143, OS_LOG_TYPE_ERROR))
                {
                  v161 = (char *)(id)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  v249 = v140;
                  v250 = 2114;
                  v251 = v161;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v143, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
                v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
                v147 = (objc_class *)objc_opt_class(v193, v146);
                v148 = NSStringFromClass(v147);
                v149 = (void *)objc_claimAutoreleasedReturnValue(v148);
                v151 = (objc_class *)objc_opt_class(v139, v150);
                v152 = NSStringFromClass(v151);
                v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v144, v145, 489, 0, "Cannot make this layer descend from parent %{public}@ rep's layer, but the rep %{public}@ is asking to", v149, v153);

              }
              if (objc_msgSend(v195, "containsObject:", v139))
                -[CRLInteractiveCanvasRepContentUpdater p_accumulateNonRenderableBackedRepAndDescendants:into:](v198, "p_accumulateNonRenderableBackedRepAndDescendants:into:", v139, v194);
              else
                -[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:](v198, "p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:", v139, v190, v194, 0, v189, v191);
              v138 = (char *)v138 + 1;
            }
            while (v136 != v138);
            v136 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v201, v260, 16);
          }
          while (v136);
        }

        v163 = (objc_class *)objc_opt_class(CRLInteractiveCanvasRepLayerPile, v162);
        v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "lastObject"));
        v165 = sub_1002223BC(v163, v164);
        v166 = objc_claimAutoreleasedReturnValue(v165);
        v167 = (void *)v243[5];
        v243[5] = v166;

        if (!v243[5])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239810);
          v168 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v168, OS_LOG_TYPE_ERROR))
            sub_100DFC2F0();

          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101239830);
          v169 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v169, OS_LOG_TYPE_ERROR))
          {
            v170 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DFC2A8(v170);
          }

          v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInteractiveCanvasRepContentUpdater p_recursivelyUpdateRenderableForRep:accumulatingRepContentPiles:andReps:suppressLayers:hidingLayersForReps:forcingUpdateOfValidLayers:]"));
          v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInteractiveCanvasRepContentUpdater.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v171, v172, 509, 0, "invalid nil value for '%{public}s'", "topRepLayerPile");

        }
      }
      v173 = (void *)v243[5];
      v199[0] = _NSConcreteStackBlock;
      v199[1] = 3221225472;
      v199[2] = sub_10011B678;
      v199[3] = &unk_101239858;
      v174 = v193;
      v200 = v174;
      objc_msgSend(v173, "mutateLayersUsingBlock:", v199);
      objc_msgSend(v174, "didUpdateChildLayers");
      objc_msgSend((id)v243[5], "popParentLayer");

      v87 = v186;
    }
    if (v185)
      objc_msgSend(v193, "didUpdateRenderable:", v87);

  }
  else if (v185)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "sublayers"));
    v40 = objc_msgSend(v39, "count") == 0;

    if (!v40)
      objc_msgSend(v184, "setSublayers:", &__NSArray0__struct);
  }

  _Block_object_dispose(&v242, 8);
}

- (void)p_updateChildWrapperLayer:(id)a3 forRep:(id)a4 withLayer:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double x;
  double y;
  double width;
  double height;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGAffineTransform v37;
  _OWORD v38[3];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "setMasksToBounds:", objc_msgSend(v9, "masksToBounds"));
  v10 = objc_msgSend(v9, "isOpaque");

  objc_msgSend(v7, "setOpaque:", v10);
  objc_msgSend(v8, "layerFrameInScaledCanvasRelativeToParent");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  if (v8)
    objc_msgSend(v8, "i_layerTransform");
  v38[0] = v39;
  v38[1] = v40;
  v38[2] = v41;
  objc_msgSend(v7, "crl_setIfDifferentFrame:orTransform:", v38, v12, v14, v16, v18);
  objc_msgSend(v8, "rectToClipChildRepRenderables");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v42.origin.x = CGRectNull.origin.x;
  v42.origin.y = CGRectNull.origin.y;
  v42.size.width = CGRectNull.size.width;
  v42.size.height = CGRectNull.size.height;
  v46.origin.x = v20;
  v46.origin.y = v22;
  v46.size.width = v24;
  v46.size.height = v26;
  if (CGRectEqualToRect(v42, v46))
  {
    objc_msgSend(v7, "setMask:", 0);
  }
  else
  {
    if (v8)
      objc_msgSend(v8, "transformToConvertNaturalToLayerRelative");
    else
      memset(&v37, 0, sizeof(v37));
    v43.origin.x = v20;
    v43.origin.y = v22;
    v43.size.width = v24;
    v43.size.height = v26;
    v44 = CGRectApplyAffineTransform(v43, &v37);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mask"));
    if (!v31)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLNoDefaultImplicitActionLayer layer](CRLNoDefaultImplicitActionLayer, "layer"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      objc_msgSend(v31, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));

      objc_msgSend(v7, "setMask:", v31);
    }
    objc_msgSend(v31, "frame", *(_OWORD *)&v37.a, *(_OWORD *)&v37.c, *(_OWORD *)&v37.tx);
    v47.origin.x = v33;
    v47.origin.y = v34;
    v47.size.width = v35;
    v47.size.height = v36;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    if (!CGRectEqualToRect(v45, v47))
      objc_msgSend(v31, "setFrame:", x, y, width, height);

  }
}

- (void)p_discardRenderable:(id)a3 forRep:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v7, "setDelegate:", 0);
  if (v8)
  {
    objc_msgSend(v7, "setContents:", 0);
    -[NSMapTable removeObjectForKey:](self->_repsByRepRenderables, "removeObjectForKey:", v8);
    objc_msgSend(v7, "crl_cancelLayoutForTilingLayers");
  }
  if (v6)
    -[NSMapTable removeObjectForKey:](self->_repRenderablesByRep, "removeObjectForKey:", v6);

}

- (void)p_accumulateNonRenderableBackedRepAndDescendants:(id)a3 into:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "addObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater renderableForRep:](self, "renderableForRep:", v6));
  if (v8)
    -[CRLInteractiveCanvasRepContentUpdater p_discardRenderable:forRep:](self, "p_discardRenderable:forRep:", v8, v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childReps", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CRLInteractiveCanvasRepContentUpdater p_accumulateNonRenderableBackedRepAndDescendants:into:](self, "p_accumulateNonRenderableBackedRepAndDescendants:into:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), v7);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (id)renderableForRep:(id)a3
{
  return -[NSMapTable objectForKey:](self->_repRenderablesByRep, "objectForKey:", a3);
}

- (id)repForLayer:(id)a3
{
  NSMapTable *repsByRepRenderables;
  void *v4;
  void *v5;

  repsByRepRenderables = self->_repsByRepRenderables;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](repsByRepRenderables, "objectForKey:", v4));

  return v5;
}

- (id)containerRenderablesForRep:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_containerLayersByRep, "objectForKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_arrayByMappingObjectsUsingBlock:", &stru_101239898));

  return v4;
}

- (BOOL)isRepContentLayer:(id)a3
{
  NSMapTable *repsByRepRenderables;
  void *v4;
  void *v5;

  repsByRepRenderables = self->_repsByRepRenderables;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](repsByRepRenderables, "objectForKey:", v4));
  LOBYTE(repsByRepRenderables) = v5 != 0;

  return (char)repsByRepRenderables;
}

- (BOOL)isRepContainerLayer:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_repsByContainerLayer, "objectForKey:", a3));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isChildWrapperLayer:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_repsByChildWrapperLayer, "objectForKey:", a3));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isClonedParentRepLayer:(id)a3
{
  return -[NSHashTable containsObject:](self->_clonedParentRepLayers, "containsObject:", a3);
}

- (CRLCanvas)canvas
{
  return self->_canvas;
}

- (CALayerDelegate)layerDelegate
{
  return (CALayerDelegate *)objc_loadWeakRetained((id *)&self->_layerDelegate);
}

- (NSArray)repContentPiles
{
  return self->_repContentPiles;
}

- (NSOrderedSet)allReps
{
  return self->_allReps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allReps, 0);
  objc_storeStrong((id *)&self->_repContentPiles, 0);
  objc_destroyWeak((id *)&self->_layerDelegate);
  objc_storeStrong((id *)&self->_canvas, 0);
  objc_storeStrong((id *)&self->_clonedParentRepLayers, 0);
  objc_storeStrong((id *)&self->_repsByChildWrapperLayer, 0);
  objc_storeStrong((id *)&self->_childWrapperLayersByRep, 0);
  objc_storeStrong((id *)&self->_repsByContainerLayer, 0);
  objc_storeStrong((id *)&self->_containerLayersByRep, 0);
  objc_storeStrong((id *)&self->_repsByRepRenderables, 0);
  objc_storeStrong((id *)&self->_repRenderablesByRep, 0);
}

- (id)i_stringFromLayerDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_1012A72B0, "stringByPaddingToLength:withString:startingAtIndex:", 4 * (_QWORD)objc_msgSend(v3, "levelInTree"), CFSTR(" "), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerPointer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerPurpose"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repPointer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerPosition"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerBounds"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ %@ %@ %@ %@ %@ %@"), v4, v5, v6, v7, v8, v9, v10, v11));
  return v12;
}

- (id)p_layerDescriptionFromString:(id)a3
{
  id v3;
  _CRLLayerDescription *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(_CRLLayerDescription);
  v5 = 0;
  if (objc_msgSend(v3, "length"))
  {
    do
    {
      if (objc_msgSend(v3, "characterAtIndex:", v5) != 32)
        break;
      ++v5;
    }
    while (v5 < (unint64_t)objc_msgSend(v3, "length"));
  }
  -[_CRLLayerDescription setLevelInTree:](v4, "setLevelInTree:", v5 >> 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" ")));
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
      switch(v8)
      {
        case 0uLL:
          -[_CRLLayerDescription setLayerClass:](v4, "setLayerClass:", v9);
          break;
        case 2uLL:
          -[_CRLLayerDescription setLayerPurpose:](v4, "setLayerPurpose:", v9);
          break;
        case 3uLL:
          -[_CRLLayerDescription setRepClass:](v4, "setRepClass:", v9);
          break;
        case 5uLL:
          -[_CRLLayerDescription setLayerPosition:](v4, "setLayerPosition:", v9);
          break;
        case 6uLL:
          -[_CRLLayerDescription setLayerBounds:](v4, "setLayerBounds:", v9);
          break;
        default:
          break;
      }

      ++v8;
    }
    while (v8 < (unint64_t)objc_msgSend(v7, "count"));
  }

  return v4;
}

- (void)p_visitLayer:(id)a3 atLevel:(unint64_t)a4 appendTo:(id)a5
{
  id v8;
  id v9;
  _CRLLayerDescription *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSMapTable *repsByRepRenderables;
  void *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CGPoint v45;
  CGRect v46;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(_CRLLayerDescription);
  v12 = (objc_class *)objc_opt_class(v8, v11);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[_CRLLayerDescription setLayerClass:](v10, "setLayerClass:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v8));
  -[_CRLLayerDescription setLayerPointer:](v10, "setLayerPointer:", v15);

  -[_CRLLayerDescription setLevelInTree:](v10, "setLevelInTree:", a4);
  objc_msgSend(v8, "bounds");
  v16 = NSStringFromCGRect(v46);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1012A72B0));
  -[_CRLLayerDescription setLayerBounds:](v10, "setLayerBounds:", v18);

  objc_msgSend(v8, "position");
  v19 = NSStringFromCGPoint(v45);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1012A72B0));
  -[_CRLLayerDescription setLayerPosition:](v10, "setLayerPosition:", v21);

  repsByRepRenderables = self->_repsByRepRenderables;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v8));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](repsByRepRenderables, "objectForKey:", v23));

  if (v24)
  {
    v25 = CFSTR("RepContent");
LABEL_7:
    -[_CRLLayerDescription setLayerPurpose:](v10, "setLayerPurpose:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v24));
    -[_CRLLayerDescription setRepPointer:](v10, "setRepPointer:", v28);

    v30 = (objc_class *)objc_opt_class(v24, v29);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[_CRLLayerDescription setRepClass:](v10, "setRepClass:", v32);

    goto LABEL_8;
  }
  v26 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_repsByContainerLayer, "objectForKey:", v8));
  if (v26)
  {
    v24 = (void *)v26;
    v25 = CFSTR("RepContainer");
    goto LABEL_7;
  }
  v27 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_repsByChildWrapperLayer, "objectForKey:", v8));
  if (v27)
  {
    v24 = (void *)v27;
    v25 = CFSTR("ChildWrapper");
    goto LABEL_7;
  }
  -[_CRLLayerDescription setLayerPurpose:](v10, "setLayerPurpose:", CFSTR("-"));
  -[_CRLLayerDescription setRepPointer:](v10, "setRepPointer:", CFSTR("-"));
  -[_CRLLayerDescription setRepClass:](v10, "setRepClass:", CFSTR("-"));
LABEL_8:
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater i_stringFromLayerDescription:](self, "i_stringFromLayerDescription:", v10));
  objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), v33);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sublayers"));
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v41;
    v38 = a4 + 1;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(v34);
        -[CRLInteractiveCanvasRepContentUpdater p_visitLayer:atLevel:appendTo:](self, "p_visitLayer:atLevel:appendTo:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v39), v38, v9);
        v39 = (char *)v39 + 1;
      }
      while (v36 != v39);
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v36);
  }

}

- (id)i_descriptionOfLayerTreeRootedAt:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  -[CRLInteractiveCanvasRepContentUpdater p_visitLayer:atLevel:appendTo:](self, "p_visitLayer:atLevel:appendTo:", v4, 0, v5);

  return v5;
}

- (id)i_firstDifferenceBetweenLayerTreeDescription:(id)a3 andDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n")));
  v36 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n")));
  v11 = objc_msgSend(v9, "count");
  v39 = v10;
  v38 = v8;
  if (v11 == objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v9, "count") != (id)1)
    {
      v12 = 0;
      while (1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater p_layerDescriptionFromString:](self, "p_layerDescriptionFromString:", v13));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInteractiveCanvasRepContentUpdater p_layerDescriptionFromString:](self, "p_layerDescriptionFromString:", v14));
        v17 = objc_msgSend(v15, "levelInTree");
        if (v17 != objc_msgSend(v16, "levelInTree")
          || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerClass")),
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerClass")),
              v20 = objc_msgSend(v18, "isEqualToString:", v19),
              v19,
              v18,
              (v20 & 1) == 0))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerPurpose"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerPurpose"));
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if ((v23 & 1) != 0)
            goto LABEL_19;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repClass"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "repClass"));
        v26 = objc_msgSend(v24, "isEqualToString:", v25);

        if ((v26 & 1) == 0)
        {
LABEL_19:
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerBounds"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerBounds"));
          v29 = objc_msgSend(v27, "isEqualToString:", v28);

          if ((v29 & 1) != 0)
            goto LABEL_18;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerPosition"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerPosition"));
        v32 = objc_msgSend(v30, "isEqualToString:", v31);

        if ((v32 & 1) == 0)
        {
LABEL_18:
          v33 = objc_msgSend(v15, "levelInTree");
          if (v33 == objc_msgSend(v16, "levelInTree"))
            break;
        }

        if ((char *)++v12 >= (char *)objc_msgSend(v9, "count") - 1)
          goto LABEL_14;
      }
      v40[0] = v13;
      v40[1] = v14;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
      objc_msgSend(v38, "addObjectsFromArray:", v35);

    }
  }
  else
  {
    objc_msgSend(v8, "addObject:", CFSTR("Count of layers"));
  }
LABEL_14:

  return v38;
}

@end
