@implementation CRLFreehandDrawingToolEraser

- (CRLFreehandDrawingToolEraser)initWithInteractiveCanvasController:(id)a3 scaledWidthForSlicingEraser:(double)a4 wholeObject:(BOOL)a5
{
  CRLFreehandDrawingToolEraser *result;
  CGSize size;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingToolEraser;
  result = -[CRLFreehandDrawingTool initWithInteractiveCanvasController:](&v9, "initWithInteractiveCanvasController:", a3);
  if (result)
  {
    result->_currentUnscaledEraserPoint = (CGPoint)xmmword_100EEC438;
    result->_scaledWidthForSlicingEraser = a4;
    result->_wholeObjectEraser = a5;
    size = CGRectNull.size;
    result->_lastDirtyRectForUncommittedFillMask.origin = CGRectNull.origin;
    result->_lastDirtyRectForUncommittedFillMask.size = size;
  }
  return result;
}

- (void)setScaledWidthForSlicingEraser:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_wholeObjectEraser)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259FB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E7B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259FD0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser setScaledWidthForSlicingEraser:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 119, 0, "Shouldn't be trying to set the width of a whole object eraser.");

  }
  self->_scaledWidthForSlicingEraser = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freehandDrawingToolkit"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "toolkitUIState"));
  objc_msgSend(v10, "setCurrentToolWidth:", a3);

  objc_msgSend(v9, "containedToolDidSetWidth:", self);
}

- (void)setWholeObjectEraser:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  self->_wholeObjectEraser = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "freehandDrawingToolkit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toolkitUIState"));
  objc_msgSend(v5, "setEraserToolErasesWholeObjects:", v3);

}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  NSMutableArray *v14;
  NSMutableArray *allHitTesterPathsZOrdered;
  NSMapTable *v16;
  NSMapTable *shapeLayoutsForHitTesterPaths;
  NSMapTable *v18;
  NSMapTable *currentPathsForHitTesterPaths;
  NSMapTable *v20;
  NSMapTable *patternOffsetsBySubpathForHitTesterPaths;
  NSHashTable *v22;
  NSHashTable *hitTesterPathsNeedingFinalizationAtEnd;
  double v24;
  CRLBezierHitTester *v25;
  CRLBezierHitTester *strokeHitTester;
  CRLBezierHitTester *v27;
  CRLBezierHitTester *fillHitTester;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CRLBezierPath *v37;
  CRLBezierPath *unscaledStrokeEraserPathToCommit;
  CRLBezierPath *v39;
  CRLBezierPath *unscaledFillEraserPathToCommit;
  uint64_t v41;
  __objc2_class_ro **p_info;
  uint64_t v43;
  void *v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  CFArrayRef (__cdecl **v51)(CTFontDescriptorRef, CFSetRef);
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  void *v66;
  double v67;
  double v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  float v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  CRLFreehandDrawingPathCreator *v87;
  CRLFreehandDrawingPathCreator *strokePathCreator;
  CRLFreehandDrawingPathCreator *v89;
  CRLFreehandDrawingPathCreator *fillPathCreator;
  CRLFreehandDrawingPathCreator *v91;
  CRLFreehandDrawingPathCreator *v92;
  CRLFreehandDrawingPathCreator *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CRLFreehandDrawingPathCreator *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  BOOL v110;
  void *v111;
  id obj;
  uint64_t v113;
  id v114;
  void *v115;
  uint64_t v116;
  void *v117;
  unsigned int v118;
  uint64_t v119;
  id v120;
  id v121;
  _OWORD v122[8];
  _OWORD v123[8];
  _BYTE v124[48];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  objc_super v133;
  uint8_t buf[48];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  CGRect v142;
  CGRect v143;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v133.receiver = self;
  v133.super_class = (Class)CRLFreehandDrawingToolEraser;
  -[CRLFreehandDrawingTool performActionWithInputPoint:isInitialPoint:isFinalPoint:](&v133, "performActionWithInputPoint:isInitialPoint:isFinalPoint:", v8, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v9, "viewScale");
  v11 = v10;
  objc_msgSend(v8, "unscaledPoint");
  self->_currentUnscaledEraserPoint.x = v12;
  self->_currentUnscaledEraserPoint.y = v13;
  v117 = v9;
  if (v6)
  {
    v110 = v6;
    objc_msgSend(v9, "addDecorator:", self);
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    allHitTesterPathsZOrdered = self->_allHitTesterPathsZOrdered;
    self->_allHitTesterPathsZOrdered = v14;

    v16 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
    shapeLayoutsForHitTesterPaths = self->_shapeLayoutsForHitTesterPaths;
    self->_shapeLayoutsForHitTesterPaths = v16;

    v18 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
    currentPathsForHitTesterPaths = self->_currentPathsForHitTesterPaths;
    self->_currentPathsForHitTesterPaths = v18;

    v20 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
    patternOffsetsBySubpathForHitTesterPaths = self->_patternOffsetsBySubpathForHitTesterPaths;
    self->_patternOffsetsBySubpathForHitTesterPaths = v20;

    v22 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    hitTesterPathsNeedingFinalizationAtEnd = self->_hitTesterPathsNeedingFinalizationAtEnd;
    self->_hitTesterPathsNeedingFinalizationAtEnd = v22;

    v24 = ceil(10.0 / fmin(v11, 1.0));
    v25 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", v24);
    strokeHitTester = self->_strokeHitTester;
    self->_strokeHitTester = v25;

    v27 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", v24);
    fillHitTester = self->_fillHitTester;
    self->_fillHitTester = v27;

    objc_msgSend(v9, "visibleUnscaledRect");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v37 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    unscaledStrokeEraserPathToCommit = self->_unscaledStrokeEraserPathToCommit;
    self->_unscaledStrokeEraserPathToCommit = v37;

    v39 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    unscaledFillEraserPathToCommit = self->_unscaledFillEraserPathToCommit;
    self->_unscaledFillEraserPathToCommit = v39;

    v111 = v8;
    objc_msgSend(v8, "unscaledPoint");
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool possibleFreehandDrawingLayoutsInParentContainerAtPoint:](self, "possibleFreehandDrawingLayoutsInParentContainerAtPoint:"));
    v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
    if (v114)
    {
      p_info = &OBJC_METACLASS___CRLWPSearchReferenceAccessibility.info;
      v113 = *(_QWORD *)v130;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v130 != v113)
            objc_enumerationMutation(obj);
          v116 = v43;
          v44 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * v43);
          *(_QWORD *)&v45 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v41).n128_u64[0];
          v47 = v46;
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "info", v45));
          v49 = sub_100221D0C(v47, v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

          v127 = 0u;
          v128 = 0u;
          v125 = 0u;
          v126 = 0u;
          v115 = v50;
          v120 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "childInfos"));
          v51 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
          if (v121)
          {
            v53 = *(_QWORD *)v126;
            v119 = *(_QWORD *)v126;
            do
            {
              v54 = 0;
              do
              {
                if (*(_QWORD *)v126 != v53)
                  objc_enumerationMutation(v120);
                v55 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)v54);
                *(_QWORD *)&v56 = objc_opt_class(p_info + 471, v52).n128_u64[0];
                v58 = v57;
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutForInfo:", v55, v56));
                v60 = sub_100221D0C(v58, v59);
                v61 = (void *)objc_claimAutoreleasedReturnValue(v60);

                if (v61)
                {
                  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "pathSource"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "bezierPath"));

                  objc_msgSend(v61, "pureTransformInRoot");
                  objc_msgSend(v63, "transformUsingAffineTransform:", v124);
                  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "shapeInfo"));
                  v65 = objc_msgSend(v64, "isTreatedAsFillForFreehandDrawing");

                  if ((v65 & 1) != 0)
                  {
                    -[CRLBezierHitTester addPath:filled:clippedToRect:](self->_fillHitTester, "addPath:filled:clippedToRect:", v63, 1, v30, v32, v34, v36);
                  }
                  else
                  {
                    objc_msgSend(v63, "convertCloseElementsToLineElements");
                    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stroke"));
                    objc_msgSend(v66, "width");
                    v68 = v67;

                    v142.origin.x = v30;
                    v142.origin.y = v32;
                    v142.size.width = v34;
                    v142.size.height = v36;
                    v143 = CGRectInset(v142, -v68, -v68);
                    -[CRLBezierHitTester addPath:filled:clippedToRect:](self->_strokeHitTester, "addPath:filled:clippedToRect:", v63, 0, v143.origin.x, v143.origin.y, v143.size.width, v143.size.height);
                    if (v68 > self->_widthOfThickestStrokePossiblyBeingErased)
                      self->_widthOfThickestStrokePossiblyBeingErased = v68;
                  }
                  -[NSMutableArray addObject:](self->_allHitTesterPathsZOrdered, "addObject:", v63);
                  -[NSMapTable setObject:forKeyedSubscript:](self->_shapeLayoutsForHitTesterPaths, "setObject:forKeyedSubscript:", v61, v63);
                  -[NSMapTable setObject:forKeyedSubscript:](self->_currentPathsForHitTesterPaths, "setObject:forKeyedSubscript:", v63, v63);
                  *(_QWORD *)&v70 = objc_opt_class(CRLBrushStroke, v69).n128_u64[0];
                  v72 = v71;
                  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stroke", v70));
                  v74 = sub_100221D0C(v72, v73);
                  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

                  if (v75)
                  {
                    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "shapeInfo"));
                    objc_msgSend(v76, "strokePatternOffsetDistance");
                    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

                    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51[413], "array"));
                    if (objc_msgSend(v63, "elementCount"))
                    {
                      v79 = 0;
                      do
                      {
                        if (!objc_msgSend(v63, "elementAtIndex:", v79))
                          objc_msgSend(v78, "addObject:", v77);
                        ++v79;
                      }
                      while (v79 < (unint64_t)objc_msgSend(v63, "elementCount"));
                    }
                    objc_msgSend(v77, "floatValue");
                    if (v80 != 0.0 && (unint64_t)objc_msgSend(v78, "count") >= 2)
                    {
                      v118 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                      if (qword_10147E370 != -1)
                        dispatch_once(&qword_10147E370, &stru_101259FF0);
                      v81 = off_1013D9070;
                      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109890;
                        *(_DWORD *)&buf[4] = v118;
                        *(_WORD *)&buf[8] = 2082;
                        *(_QWORD *)&buf[10] = "-[CRLFreehandDrawingToolEraser performActionWithInputPoint:isInitialPoint:isFinalPoint:]";
                        *(_WORD *)&buf[18] = 2082;
                        *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreeha"
                                              "ndDrawingToolEraser.m";
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = 208;
                        _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We don't expect a nonzero patternOffsetDistance and mutliple subpaths.", buf, 0x22u);
                      }
                      if (qword_10147E370 != -1)
                        dispatch_once(&qword_10147E370, &stru_10125A010);
                      v82 = off_1013D9070;
                      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      {
                        v85 = v82;
                        v86 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)&buf[4] = v118;
                        *(_WORD *)&buf[8] = 2114;
                        *(_QWORD *)&buf[10] = v86;
                        _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                      }
                      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser performActionWithInputPoint:isInitialPoint:isFinalPoint:]"));
                      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
                      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v83, v84, 208, 0, "We don't expect a nonzero patternOffsetDistance and mutliple subpaths.");

                      v9 = v117;
                      v51 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
                    }
                    -[NSMapTable setObject:forKeyedSubscript:](self->_patternOffsetsBySubpathForHitTesterPaths, "setObject:forKeyedSubscript:", v78, v63);

                    p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLWPSearchReferenceAccessibility + 32);
                    v53 = v119;
                  }

                }
                v54 = (char *)v54 + 1;
              }
              while (v54 != v121);
              v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
            }
            while (v121);
          }

          v43 = v116 + 1;
        }
        while ((id)(v116 + 1) != v114);
        v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v141, 16);
      }
      while (v114);
    }
    v87 = -[CRLFreehandDrawingPathCreator initWithPencilKitSmoothing:]([CRLFreehandDrawingPathCreator alloc], "initWithPencilKitSmoothing:", 0);
    strokePathCreator = self->_strokePathCreator;
    self->_strokePathCreator = v87;

    v8 = v111;
    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](self->_strokePathCreator, "beginDrawingWithViewScale:inputType:", objc_msgSend(v111, "inputType"), v11);
    v89 = objc_alloc_init(CRLFreehandDrawingPathCreator);
    fillPathCreator = self->_fillPathCreator;
    self->_fillPathCreator = v89;

    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](self->_fillPathCreator, "beginDrawingWithViewScale:inputType:", objc_msgSend(v111, "inputType"), v11);
    LOBYTE(v6) = v110;
  }
  if (-[CRLFreehandDrawingPathCreator inputPointCount](self->_strokePathCreator, "inputPointCount") >= 0x64)
  {
    v91 = (CRLFreehandDrawingPathCreator *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPathCreator handoffToNewPathCreator](self->_strokePathCreator, "handoffToNewPathCreator"));
    v92 = self->_strokePathCreator;
    self->_strokePathCreator = v91;

  }
  if (v6 || (objc_msgSend(v8, "wasAddedByTouchesEnded") & 1) == 0)
  {
    v93 = self->_strokePathCreator;
    objc_msgSend(v8, "unscaledPoint");
    v95 = v94;
    v97 = v96;
    objc_msgSend(v8, "time");
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v93, "drawToPoint:atTime:predicted:", objc_msgSend(v8, "isPredicted"), v95, v97, v98);
    v99 = self->_fillPathCreator;
    objc_msgSend(v8, "unscaledPoint");
    v101 = v100;
    v103 = v102;
    objc_msgSend(v8, "time");
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v99, "drawToPoint:atTime:predicted:", objc_msgSend(v8, "isPredicted"), v101, v103, v104);
  }
  -[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing](self, "p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing");
  if (objc_msgSend(v8, "inputType") == (id)2)
  {
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v135 = 0u;
    memset(buf, 0, sizeof(buf));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v106 = objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "freehandDrawingToolkit"));
    v107 = (void *)v106;
    if (v8)
    {
      objc_msgSend(v8, "PKInputPoint");
      if (v107)
      {
LABEL_49:
        objc_msgSend(v107, "inputPointInPKCanvasViewFromUnscaledSpace:", v123);
LABEL_52:

        v108 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "freehandDrawingToolkit"));
        v122[4] = v136;
        v122[5] = v137;
        v122[6] = v138;
        v122[7] = v139;
        v122[0] = *(_OWORD *)buf;
        v122[1] = *(_OWORD *)&buf[16];
        v122[2] = *(_OWORD *)&buf[32];
        v122[3] = v135;
        objc_msgSend(v109, "updatePencilShadowWithInputPoint:", v122);

        goto LABEL_53;
      }
    }
    else
    {
      memset(v123, 0, sizeof(v123));
      if (v106)
        goto LABEL_49;
    }
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v135 = 0u;
    memset(buf, 0, sizeof(buf));
    goto LABEL_52;
  }
LABEL_53:
  objc_msgSend(v117, "invalidateLayersForDecorator:", self);

}

- (void)doWorkBeforeCanvasLayout
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLFreehandDrawingToolEraser;
  -[CRLFreehandDrawingTool doWorkBeforeCanvasLayout](&v4, "doWorkBeforeCanvasLayout");
  if (!-[CRLFreehandDrawingToolEraser isWholeObjectEraser](self, "isWholeObjectEraser")
    && (self->_currentUnscaledEraserPoint.x != INFINITY || self->_currentUnscaledEraserPoint.y != INFINITY))
  {
    if (-[CRLBezierHitTester pathCount](self->_strokeHitTester, "pathCount"))
      -[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser](self, "p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser");
    if (-[CRLBezierHitTester pathCount](self->_fillHitTester, "pathCount"))
      -[CRLFreehandDrawingToolEraser p_updateFillMaskImage](self, "p_updateFillMaskImage");
  }
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  CRLFreehandDrawingToolEraser *v3;
  void *v4;
  int *v5;
  int *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  uint64_t v21;
  NSHashTable *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  id v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _TtC8Freeform23CRLCommandSetPathSource *v58;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v59;
  void *v60;
  uint64_t v61;
  objc_class *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  void *v74;
  id v75;
  uint64_t v76;
  _TtC8Freeform23CRLCommandSetPathSource *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  char *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  CRLCommandSelectionBehavior *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  CRLFreehandDrawingPathCreator *strokePathCreator;
  CRLFreehandDrawingPathCreator *fillPathCreator;
  CRLBezierHitTester *strokeHitTester;
  CRLBezierHitTester *fillHitTester;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  NSMapTable *currentPathsForHitTesterPaths;
  NSHashTable *hitTesterPathsNeedingFinalizationAtEnd;
  CRLImage *fillMaskImageForErasing;
  CRLBezierPath *unscaledStrokeEraserPathToCommit;
  CRLBezierPath *unscaledFillEraserPathToCommit;
  CGContext *committedFillEraserPathCtx;
  CGContext *fillEraserPathCtx;
  CGImage *committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
  CGSize size;
  void *v116;
  char v117;
  void *v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  id *p_isa;
  id v125;
  id obj;
  char *v127;
  void *v128;
  uint64_t v129;
  NSHashTable *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  CGAffineTransform v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  objc_super v144;
  uint8_t v145[128];
  uint8_t buf[4];
  unsigned int v147;
  __int16 v148;
  const char *v149;
  __int16 v150;
  const char *v151;
  __int16 v152;
  int v153;
  __int16 v154;
  const char *v155;
  _QWORD v156[2];
  _BYTE v157[128];
  _BYTE v158[128];

  v3 = self;
  v144.receiver = self;
  v144.super_class = (Class)CRLFreehandDrawingToolEraser;
  LODWORD(v4) = -[CRLFreehandDrawingTool finalizeAndResetWithSuccess:](&v144, "finalizeAndResetWithSuccess:", a3);
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v3, "icc"));
  -[CRLFreehandDrawingPathCreator endDrawing](v3->_strokePathCreator, "endDrawing");
  -[CRLFreehandDrawingPathCreator endDrawing](v3->_fillPathCreator, "endDrawing");
  v5 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
  v6 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
  if (!(_DWORD)v4)
  {
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v22 = v3->_hitTesterPathsNeedingFinalizationAtEnd;
    v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v132;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v132 != v25)
            objc_enumerationMutation(v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v3->_shapeLayoutsForHitTesterPaths, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v27, "endDynamicOperation");

        }
        v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
      }
      while (v24);
    }
    goto LABEL_64;
  }
  -[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing](v3, "p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing");
  if (!-[CRLFreehandDrawingToolEraser isWholeObjectEraser](v3, "isWholeObjectEraser"))
    -[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser](v3, "p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray crl_arrayWithObjectsInHashTable:](v3->_allHitTesterPathsZOrdered, "crl_arrayWithObjectsInHashTable:", v3->_hitTesterPathsNeedingFinalizationAtEnd));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v3, "icc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commandController"));

  objc_msgSend(v11, "openGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Erase"), 0, CFSTR("UndoStrings")));
  v118 = v11;
  objc_msgSend(v11, "setCurrentGroupActionString:", v13);

  v128 = v8;
  v117 = (char)v4;
  if (!-[CRLFreehandDrawingToolEraser isWholeObjectEraser](v3, "isWholeObjectEraser"))
  {
    obj = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v116 = v7;
    v120 = v7;
    v125 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v136, v157, 16);
    v21 = 0;
    if (!v125)
      goto LABEL_58;
    v123 = *(_QWORD *)v137;
    p_isa = (id *)&v3->super.super.isa;
    while (1)
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v137 != v123)
          objc_enumerationMutation(v120);
        v29 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v3->super.super.isa + v5[136]), "objectForKeyedSubscript:", v29));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "shapeInfo"));
        v32 = objc_msgSend(v31, "isTreatedAsFillForFreehandDrawing");

        if (!v32)
        {
          if (objc_msgSend(v30, "isInvisible"))
          {
            objc_msgSend(v30, "endDynamicOperation");
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "shapeInfo"));
            objc_msgSend(v8, "addObject:", v40);
            goto LABEL_56;
          }
          v121 = v29;
          v129 = v21;
          goto LABEL_45;
        }
        if (!v21)
        {
          v34 = -[CRLFreehandDrawingPathCreator copyOfEntirePath](v3->_fillPathCreator, "copyOfEntirePath");
          -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](v3, "p_unscaledEraserDiameter");
          objc_msgSend(v34, "setLineWidth:");
          objc_msgSend(v34, "setLineCapStyle:", 1);
          objc_msgSend(v34, "setLineJoinStyle:", 1);
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "strokedCopy"));

        }
        *(_QWORD *)&v35 = objc_opt_class(CRLShapeRep, v33).n128_u64[0];
        v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "repForLayout:", v30, v35));
        v39 = sub_100221D0C(v37, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        objc_msgSend(v40, "setFreehandDrawingDynamicFillErasingDelegate:", 0);
        v121 = v29;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v3->_currentPathsForHitTesterPaths, "objectForKeyedSubscript:", v29));
        v156[0] = v41;
        v129 = v21;
        v156[1] = v21;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v156, 2));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath subtractBezierPaths:](CRLBezierPath, "subtractBezierPaths:", v42));

        if (!v43)
        {
          v44 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A030);
          v45 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v147 = v44;
            v148 = 2082;
            v149 = "-[CRLFreehandDrawingToolEraser finalizeAndResetWithSuccess:]";
            v150 = 2082;
            v151 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
            v152 = 1024;
            v153 = 336;
            v154 = 2082;
            v155 = "pathWithErasure";
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A050);
          v46 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v80 = v46;
            v81 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v147 = v44;
            v148 = 2114;
            v149 = v81;
            _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser finalizeAndResetWithSuccess:]"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 336, 0, "invalid nil value for '%{public}s'", "pathWithErasure");

          v5 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
        }
        if (objc_msgSend(v43, "containsElementsOtherThanMoveAndClose"))
        {
          v49 = objc_msgSend(v43, "copy");
          objc_msgSend(v49, "bounds");
          v51 = v50;
          v53 = v52;
          CGAffineTransformMakeTranslation(&v135, -v50, -v52);
          objc_msgSend(v49, "transformUsingAffineTransform:", &v135);
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v49));
          objc_msgSend(v30, "dynamicallySetBezierPathSource:atUnscaledOrigin:", v54, v51, v53);

LABEL_45:
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pathSource"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "finalInfoGeometryForResize"));
          objc_msgSend(v30, "endDynamicOperation");
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "shapeInfo"));
          v58 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v57, v40);
          objc_msgSend(v118, "enqueueCommand:", v58);
          v59 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v57, v56);
          objc_msgSend(v118, "enqueueCommand:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "parentInfo"));
          objc_opt_class(NSObject, v61);
          v68 = sub_1002220C8(v60, v62, 1, v63, v64, v65, v66, v67, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
          v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

          if (v69
            && (v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v69))) != 0)
          {
            v71 = v70;
            v127 = (char *)objc_msgSend(v70, "integerValue");

          }
          else
          {
            v127 = 0;
          }
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "shapeInfo"));
          v73 = objc_msgSend(v72, "isTreatedAsFillForFreehandDrawing");

          if (v73)
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bezierPath"));
            v75 = objc_msgSend(p_isa, "p_breakApartFilledShapeIfPossible:withDesiredGeometry:bezierPath:previousZOrderOffset:", v57, v56, v74, v127);
          }
          else
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[14], "objectForKeyedSubscript:", v121));
            v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bezierPath"));
            v122 = v40;
            v77 = v58;
            v78 = (void *)v76;
            v75 = objc_msgSend(p_isa, "p_breakApartOpenShapeIfPossible:withDesiredGeometry:bezierPath:strokePatternOffsetArray:previousZOrderOffset:", v57, v56, v76, v74, v127);

            v58 = v77;
            v40 = v122;
          }

          if (v69)
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", &v127[(_QWORD)v75]));
            objc_msgSend(obj, "setObject:forKeyedSubscript:", v79, v69);

          }
          v3 = (CRLFreehandDrawingToolEraser *)p_isa;
          v5 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
          v8 = v128;
          goto LABEL_55;
        }
        objc_msgSend(v30, "endDynamicOperation");
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "shapeInfo"));
        objc_msgSend(v8, "addObject:", v55);

LABEL_55:
        v21 = v129;
LABEL_56:

        v28 = (char *)v28 + 1;
      }
      while (v125 != v28);
      v125 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v136, v157, 16);
      if (!v125)
      {
LABEL_58:

        v6 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
        v7 = v116;
        goto LABEL_60;
      }
    }
  }
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  obj = v7;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v158, 16);
  if (v14)
  {
    v15 = v14;
    v16 = v7;
    v17 = *(_QWORD *)v141;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v141 != v17)
          objc_enumerationMutation(obj);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v3->_shapeLayoutsForHitTesterPaths, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)j)));
        objc_msgSend(v19, "endDynamicOperation");
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "shapeInfo"));
        objc_msgSend(v128, "addObject:", v20);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v158, 16);
    }
    while (v15);
    v21 = 0;
    v7 = v16;
    v8 = v128;
  }
  else
  {
    v21 = 0;
  }
LABEL_60:
  v130 = (NSHashTable *)v21;

  if (objc_msgSend(v8, "count"))
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setRepresentation"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v3, "icc"));
    v84 = v7;
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "canvasEditor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "canvasEditorHelper"));
    v87 = v8;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "selectionBehaviorForDeletingBoardItems:", v82));

    objc_msgSend(v88, "setSelectionFlags:", (unint64_t)objc_msgSend(v88, "selectionFlags") & 0xFFFFFFFFFFFFFFFBLL);
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "canvasEditor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "canvasEditorHelper"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v82, 1));

    v7 = v84;
    v4 = v118;
    objc_msgSend(v118, "enqueueCommand:withSelectionBehavior:", v91, v88);

    v92 = 0;
  }
  else
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v3, "icc"));
    v87 = v8;
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "editorController"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "selectionPath"));

    v92 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v82, v82);
    v4 = v118;
  }

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v3, "icc"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "pkDrawingProvider"));
  objc_msgSend(v96, "activeDrawingWillEndAfterInsertingFinalizedDrawingItem");

  objc_msgSend(v4, "closeGroupWithSelectionBehavior:", v92);
  v22 = v130;
  LOBYTE(v4) = v117;
LABEL_64:

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v3, "icc"));
  objc_msgSend(v97, "removeDecorator:", v3);

  v3->_currentUnscaledEraserPoint = (CGPoint)xmmword_100EEC438;
  strokePathCreator = v3->_strokePathCreator;
  v3->_strokePathCreator = 0;

  fillPathCreator = v3->_fillPathCreator;
  v3->_fillPathCreator = 0;

  strokeHitTester = v3->_strokeHitTester;
  v3->_strokeHitTester = 0;

  fillHitTester = v3->_fillHitTester;
  v3->_fillHitTester = 0;

  v102 = v6[135];
  v103 = *(Class *)((char *)&v3->super.super.isa + v102);
  *(Class *)((char *)&v3->super.super.isa + v102) = 0;

  v104 = v5[136];
  v105 = *(Class *)((char *)&v3->super.super.isa + v104);
  *(Class *)((char *)&v3->super.super.isa + v104) = 0;

  currentPathsForHitTesterPaths = v3->_currentPathsForHitTesterPaths;
  v3->_currentPathsForHitTesterPaths = 0;

  hitTesterPathsNeedingFinalizationAtEnd = v3->_hitTesterPathsNeedingFinalizationAtEnd;
  v3->_hitTesterPathsNeedingFinalizationAtEnd = 0;

  v3->_widthOfThickestStrokePossiblyBeingErased = 0.0;
  fillMaskImageForErasing = v3->_fillMaskImageForErasing;
  v3->_fillMaskImageForErasing = 0;

  unscaledStrokeEraserPathToCommit = v3->_unscaledStrokeEraserPathToCommit;
  v3->_unscaledStrokeEraserPathToCommit = 0;

  unscaledFillEraserPathToCommit = v3->_unscaledFillEraserPathToCommit;
  v3->_unscaledFillEraserPathToCommit = 0;

  committedFillEraserPathCtx = v3->_committedFillEraserPathCtx;
  if (committedFillEraserPathCtx)
  {
    CGContextRelease(committedFillEraserPathCtx);
    v3->_committedFillEraserPathCtx = 0;
  }
  fillEraserPathCtx = v3->_fillEraserPathCtx;
  if (fillEraserPathCtx)
  {
    CGContextRelease(fillEraserPathCtx);
    v3->_fillEraserPathCtx = 0;
  }
  committedFillMaskImageForErasingPositionedInVisibleCanvasRect = v3->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
  if (committedFillMaskImageForErasingPositionedInVisibleCanvasRect)
  {
    CGImageRelease(committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
    v3->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = 0;
  }
  size = CGRectNull.size;
  v3->_lastDirtyRectForUncommittedFillMask.origin = CGRectNull.origin;
  v3->_lastDirtyRectForUncommittedFillMask.size = size;

  return (char)v4;
}

- (unint64_t)type
{
  return 8;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toolkitUIState"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "strokeWidthsForFreehandDrawingToolType:", -[CRLFreehandDrawingToolEraser type](self, "type")));

  v8 = objc_alloc((Class)PKEraserTool);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
  objc_msgSend(v9, "crl_CGFloatValue");
  v10 = objc_msgSend(v8, "initWithEraserType:width:", 2);

  objc_msgSend(v4, "setTool:", v10);
}

- (NSArray)decoratorOverlayRenderables
{
  CGPoint *p_currentUnscaledEraserPoint;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  void *v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  void *v36;
  double v37;
  CGFloat v38;
  void *v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  p_currentUnscaledEraserPoint = &self->_currentUnscaledEraserPoint;
  if (self->_currentUnscaledEraserPoint.x == INFINITY && self->_currentUnscaledEraserPoint.y == INFINITY)
  {
    v28 = &__NSArray0__struct;
  }
  else
  {
    -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    objc_msgSend(v7, "setDelegate:", v8);

    objc_msgSend(v7, "setLineWidth:", 1.0);
    objc_msgSend(v7, "setFillColor:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freehandDrawingToolkit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultOutlineColor"));
    objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    v12 = sub_10005FD98(p_currentUnscaledEraserPoint->x, p_currentUnscaledEraserPoint->y, v6);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    objc_msgSend(v19, "viewScale");
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    objc_msgSend(v22, "viewScale");
    CGAffineTransformMakeScale(&v48, v21, v23);
    v49.origin.x = v12;
    v49.origin.y = v14;
    v49.size.width = v16;
    v49.size.height = v18;
    v50 = CGRectApplyAffineTransform(v49, &v48);
    x = v50.origin.x;
    y = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;

    objc_msgSend(v7, "setFrame:", x, y, width, height);
    if (-[CRLFreehandDrawingToolEraser isWholeObjectEraser](self, "isWholeObjectEraser"))
    {
      objc_msgSend(v7, "setPath:", 0);
    }
    else
    {
      v29 = sub_10005FDDC();
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      objc_msgSend(v36, "viewScale");
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      objc_msgSend(v39, "viewScale");
      CGAffineTransformMakeScale(&v47, v38, v40);
      v51.origin.x = v29;
      v51.origin.y = v31;
      v51.size.width = v33;
      v51.size.height = v35;
      v52 = CGRectApplyAffineTransform(v51, &v47);
      v41 = v52.origin.x;
      v42 = v52.origin.y;
      v43 = v52.size.width;
      v44 = v52.size.height;

      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", v41, v42, v43, v44)));
      objc_msgSend(v7, "setPath:", objc_msgSend(v45, "CGPath"));

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__NSArray0__struct, "arrayByAddingObject:", v7));

  }
  return (NSArray *)v28;
}

- (CGRect)unscaledRectForMaskImageForErasing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasLayer"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enclosingScrollView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));

  objc_msgSend(v4, "bounds");
  objc_msgSend(v9, "convertRect:toLayer:", v6);
  objc_msgSend(v2, "convertBoundsToUnscaledRect:");
  v19 = CGRectIntegral(v18);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)maskImageForErasing
{
  CRLImage *fillMaskImageForErasing;

  fillMaskImageForErasing = self->_fillMaskImageForErasing;
  if (!fillMaskImageForErasing)
  {
    -[CRLFreehandDrawingToolEraser p_updateFillMaskImage](self, "p_updateFillMaskImage");
    fillMaskImageForErasing = self->_fillMaskImageForErasing;
  }
  return fillMaskImageForErasing;
}

- (double)currentScaledEraserDiameter
{
  double result;

  if (-[CRLFreehandDrawingToolEraser isWholeObjectEraser](self, "isWholeObjectEraser"))
    return 16.0;
  -[CRLFreehandDrawingToolEraser scaledWidthForSlicingEraser](self, "scaledWidthForSlicingEraser");
  return result;
}

- (double)p_unscaledEraserDiameter
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[CRLFreehandDrawingToolEraser currentScaledEraserDiameter](self, "currentScaledEraserDiameter");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v5, "viewScale");
  v7 = v4 / v6;

  return v7;
}

- (id)p_copyOfPathCreatorPathCommittingAllAvailablePoints:(id)a3 optionallyAdditionallyCommittingIntoAdditionalPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "pointCountAvailableToCommit"))
  {
    v8 = objc_msgSend(v6, "copyOfUncommittedPath");
    if (v8)
      goto LABEL_16;
    goto LABEL_7;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commitAllAvailablePoints"));
  if (v7)
    objc_msgSend(v7, "appendBezierPath:skippingInitialMoveIfPossible:", v8, 1);
  v9 = objc_msgSend(v6, "copyOfUncommittedPath");
  objc_msgSend(v8, "appendBezierPath:skippingInitialMoveIfPossible:", v9, 1);

  if (!v8)
  {
LABEL_7:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A070);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E838();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A090);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 578, 0, "Path creator should always provide some kind of path.");

    v8 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  }
LABEL_16:
  -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
  objc_msgSend(v8, "setLineWidth:");
  objc_msgSend(v8, "setLineCapStyle:", 1);
  objc_msgSend(v8, "setLineJoinStyle:", 1);

  return v8;
}

- (void)p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser
{
  CRLFreehandDrawingToolEraser *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double widthOfThickestStrokePossiblyBeingErased;
  void *v9;
  uint64_t v10;
  CRLBezierPath *unscaledStrokeEraserPathToCommit;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMapTable *currentPathsForHitTesterPaths;
  void *v18;
  void *v19;
  NSMapTable *shapeLayoutsForHitTesterPaths;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  uint64_t v26;
  double v27;
  char v28;
  double v29;
  double v30;
  double v31;
  NSMapTable *patternOffsetsBySubpathForHitTesterPaths;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  id v38;
  double v39;
  void *v40;
  void *v41;
  NSMapTable *v42;
  void *v43;
  NSMapTable *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  NSObject *v70;
  char *v71;
  NSObject *v72;
  char *v73;
  uint64_t v74;
  id v75;
  id v76;
  id obj;
  id v78;
  CRLFreehandDrawingToolEraser *v79;
  CGAffineTransform v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  void *v87;
  double v88;
  double v89;
  char v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  double v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  unsigned int v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  int v110;
  __int16 v111;
  const char *v112;
  _BYTE v113[128];
  _BYTE v114[128];

  v2 = self;
  if (-[CRLFreehandDrawingToolEraser isWholeObjectEraser](self, "isWholeObjectEraser"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A0B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E8B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A0D0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 590, 0, "This method should only be called for slicing erasers.");

  }
  -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](v2, "p_unscaledEraserDiameter");
  v7 = v6;
  widthOfThickestStrokePossiblyBeingErased = v2->_widthOfThickestStrokePossiblyBeingErased;
  if (-[CRLBezierPath containsElementsOtherThanMoveAndClose](v2->_unscaledStrokeEraserPathToCommit, "containsElementsOtherThanMoveAndClose"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester wrappedAllHitsAlongPath:withSearchThreshold:](v2->_strokeHitTester, "wrappedAllHitsAlongPath:withSearchThreshold:", v2->_unscaledStrokeEraserPathToCommit, (v7 + widthOfThickestStrokePossiblyBeingErased) * 0.5));
    v10 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    unscaledStrokeEraserPathToCommit = v2->_unscaledStrokeEraserPathToCommit;
    v2->_unscaledStrokeEraserPathToCommit = (CRLBezierPath *)v10;

    v78 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
    v79 = v2;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v100;
      v74 = *(_QWORD *)v100;
      do
      {
        v15 = 0;
        v75 = v13;
        do
        {
          if (*(_QWORD *)v100 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v15);
          currentPathsForHitTesterPaths = v2->_currentPathsForHitTesterPaths;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hitPath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](currentPathsForHitTesterPaths, "objectForKeyedSubscript:", v18));

          if (v19)
          {
            shapeLayoutsForHitTesterPaths = v2->_shapeLayoutsForHitTesterPaths;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hitPath"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](shapeLayoutsForHitTesterPaths, "objectForKeyedSubscript:", v21));

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stroke"));
            v25 = 0.0;
            if (v24
              && (objc_opt_class(CRLBrushStroke, v23), (objc_opt_isKindOfClass(v24, v26) & 1) == 0)
              && objc_msgSend(v24, "cap"))
            {
              objc_msgSend(v24, "width");
              v25 = v27;
              v28 = 0;
            }
            else
            {
              v28 = 1;
            }
            objc_msgSend(v24, "width");
            v30 = v29;
            if (v16)
            {
              objc_msgSend(v16, "hitInfo");
              v31 = v98;
            }
            else
            {
              v98 = 0.0;
              v96 = 0u;
              v97 = 0u;
              v31 = 0.0;
              v95 = 0u;
            }
            if (v31 < (v7 + v30) * 0.5)
            {
              patternOffsetsBySubpathForHitTesterPaths = v2->_patternOffsetsBySubpathForHitTesterPaths;
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hitPath"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](patternOffsetsBySubpathForHitTesterPaths, "objectForKeyedSubscript:", v33));
              v35 = objc_msgSend(v34, "mutableCopy");

              if (v16)
              {
                objc_msgSend(v16, "hitInfo");
                v36 = *((double *)&v91 + 1);
                v37 = *(double *)&v91;
              }
              else
              {
                v94 = 0;
                v92 = 0u;
                v93 = 0u;
                v36 = 0.0;
                v37 = 0.0;
                v91 = 0u;
              }
              v85[0] = _NSConcreteStackBlock;
              v85[1] = 3221225472;
              v85[2] = sub_1003E41F0;
              v85[3] = &unk_10125A0F8;
              v88 = v7;
              v38 = v24;
              v90 = v28;
              v86 = v38;
              v87 = v16;
              v89 = v7 + v25;
              objc_msgSend(v38, "width");
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pathByCreatingHoleInPathAtPoint:withDiameter:andThreshold:updatingPatternOffsetsBySubpath:", v85, v35, v37, v36, (v7 + v39) * 0.5));
              if (v40)
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hitPath"));
                objc_msgSend(v78, "setObject:forKeyedSubscript:", v40, v41);

                v42 = v79->_currentPathsForHitTesterPaths;
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hitPath"));
                -[NSMapTable setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v40, v43);

                v44 = v79->_patternOffsetsBySubpathForHitTesterPaths;
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hitPath"));
                -[NSMapTable setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v35, v45);

              }
              v2 = v79;
              v13 = v75;
              v14 = v74;
            }

          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
      }
      while (v13);
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "crl_allKeys"));
    v46 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v81, v113, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v82;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v82 != v48)
            objc_enumerationMutation(v76);
          v50 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v2->_shapeLayoutsForHitTesterPaths, "objectForKeyedSubscript:", v50));
          if (!v51)
          {
            v52 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A118);
            v53 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v104 = v52;
              v105 = 2082;
              v106 = "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]";
              v107 = 2082;
              v108 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              v109 = 1024;
              v110 = 682;
              v111 = 2082;
              v112 = "currentShapeLayout";
              _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A138);
            v54 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v70 = v54;
              v71 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v104 = v52;
              v105 = 2114;
              v106 = v71;
              _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v56, 682, 0, "invalid nil value for '%{public}s'", "currentShapeLayout");

            v2 = v79;
          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", v50));
          if (!v57)
          {
            v58 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A158);
            v59 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v104 = v58;
              v105 = 2082;
              v106 = "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]";
              v107 = 2082;
              v108 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              v109 = 1024;
              v110 = 685;
              v111 = 2082;
              v112 = "unscaledUpdatedPath";
              _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A178);
            v60 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v72 = v60;
              v73 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v104 = v58;
              v105 = 2114;
              v106 = v73;
              _os_log_error_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_sliceAndDynamicallyUpdateStrokePathsForSlicingEraser]"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v61, v62, 685, 0, "invalid nil value for '%{public}s'", "unscaledUpdatedPath");

            v2 = v79;
          }
          if (!-[NSHashTable containsObject:](v2->_hitTesterPathsNeedingFinalizationAtEnd, "containsObject:", v50))
          {
            -[NSHashTable addObject:](v2->_hitTesterPathsNeedingFinalizationAtEnd, "addObject:", v50);
            objc_msgSend(v51, "beginDynamicOperationWithRealTimeCommands:", 0);
          }
          if ((objc_msgSend(v57, "containsElementsOtherThanMoveAndClose") & 1) != 0)
          {
            v63 = objc_msgSend(v57, "copy");
            objc_msgSend(v63, "bounds");
            v65 = v64;
            v67 = v66;
            CGAffineTransformMakeTranslation(&v80, -v64, -v66);
            objc_msgSend(v63, "transformUsingAffineTransform:", &v80);
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v63));
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](v2->_patternOffsetsBySubpathForHitTesterPaths, "objectForKeyedSubscript:", v50));
            objc_msgSend(v51, "dynamicallySetBezierPathSource:atUnscaledOrigin:withPatternOffsetsBySubpath:", v68, v69, v65, v67);

          }
          else
          {
            objc_msgSend(v51, "dynamicallyMakeShapeInvisible");
            -[CRLBezierHitTester removePath:](v2->_strokeHitTester, "removePath:", v50);
          }

          v49 = (char *)v49 + 1;
        }
        while (v47 != v49);
        v47 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v81, v113, 16);
      }
      while (v47);
    }

  }
}

- (CGRect)p_drawPath:(id)a3 inContext:(CGContext *)a4 drawingCommittedImageBehind:(BOOL)a5 additionalAlreadyOutsetUnscaledDirtyRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGAffineTransform v45;
  CGAffineTransform transform;
  CGAffineTransform v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect result;
  CGRect v58;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  CGContextSaveGState(a4);
  -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
  v15 = v14 * 0.5 + 2.5;
  objc_msgSend(v13, "bounds");
  v49 = CGRectInset(v48, -v15, -v15);
  v43 = v49.origin.y;
  v44 = v49.origin.x;
  v41 = v49.size.height;
  v42 = v49.size.width;
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  v50 = CGRectUnion(v49, v58);
  v16 = v50.origin.x;
  v17 = v50.origin.y;
  v18 = v50.size.width;
  v19 = v50.size.height;
  -[CRLFreehandDrawingToolEraser p_maskImageSize](self, "p_maskImageSize");
  v20 = sub_10005FDDC();
  v22 = v21;
  v24 = v23;
  -[CRLFreehandDrawingToolEraser unscaledRectForMaskImageForErasing](self, "unscaledRectForMaskImageForErasing", v20);
  v26 = v25;
  v28 = v27;
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, v22 / v29, v24 / v30);
  v45 = v47;
  CGAffineTransformTranslate(&transform, &v45, -v26, -v28);
  v47 = transform;
  if (a5)
  {
    CGContextSaveGState(a4);
    transform = v47;
    v51.origin.x = v16;
    v51.origin.y = v17;
    v51.size.width = v18;
    v51.size.height = v19;
    v52 = CGRectApplyAffineTransform(v51, &transform);
    v53 = CGRectIntegral(v52);
    CGContextClipToRect(a4, v53);
    -[CRLFreehandDrawingToolEraser p_maskImageSize](self, "p_maskImageSize");
    v54.origin.x = sub_10005FDDC();
    v31 = v54.origin.x;
    v32 = v54.origin.y;
    v33 = v54.size.width;
    v34 = v54.size.height;
    CGContextClearRect(a4, v54);
    v55.origin.x = v31;
    v55.origin.y = v32;
    v55.size.width = v33;
    v55.size.height = v34;
    CGContextDrawImage(a4, v55, self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
    CGContextRestoreGState(a4);
  }
  transform = v47;
  CGContextConcatCTM(a4, &transform);
  v56.origin.x = v16;
  v56.origin.y = v17;
  v56.size.width = v18;
  v56.size.height = v19;
  CGContextClipToRect(a4, v56);
  CGContextSetBlendMode(a4, kCGBlendModeDestinationOut);
  CGContextSetGrayStrokeColor(a4, 0.0, 1.0);
  CGContextSetLineCap(a4, kCGLineCapRound);
  CGContextSetLineJoin(a4, kCGLineJoinRound);
  -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
  CGContextSetLineWidth(a4, v35);
  v36 = objc_retainAutorelease(v13);
  CGContextAddPath(a4, (CGPathRef)objc_msgSend(v36, "CGPath"));
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);

  v38 = v43;
  v37 = v44;
  v40 = v41;
  v39 = v42;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (CGSize)p_maskImageSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
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
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  objc_msgSend(v4, "contentsScale");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  objc_msgSend(v7, "viewScale");
  v9 = v6 * v8;

  -[CRLFreehandDrawingToolEraser unscaledRectForMaskImageForErasing](self, "unscaledRectForMaskImageForErasing");
  v12 = sub_1000603DC(v10, v11, v9);
  v13 = sub_100063090(v12);
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)p_updateFillMaskImage
{
  double v3;
  double v4;
  CGContext *v5;
  CGContext *committedFillEraserPathCtx;
  CGFloat x;
  double y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  CRLBezierPath *v15;
  CRLBezierPath *unscaledFillEraserPathToCommit;
  CGImage **p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
  CGImage *committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
  double v19;
  double v20;
  CGContext *v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGImage *Image;
  CRLImage *v28;
  CRLImage *fillMaskImageForErasing;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  if (!self->_committedFillEraserPathCtx)
  {
    -[CRLFreehandDrawingToolEraser p_maskImageSize](self, "p_maskImageSize");
    v5 = sub_10040FA64(2, v3, v4);
    self->_committedFillEraserPathCtx = v5;
    CGContextSaveGState(v5);
    CGContextSetBlendMode(self->_committedFillEraserPathCtx, kCGBlendModeNormal);
    CGContextSetGrayFillColor(self->_committedFillEraserPathCtx, 0.0, 1.0);
    committedFillEraserPathCtx = self->_committedFillEraserPathCtx;
    v31.origin.x = sub_10005FDDC();
    CGContextFillRect(committedFillEraserPathCtx, v31);
    CGContextRestoreGState(self->_committedFillEraserPathCtx);
  }
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if ((unint64_t)-[CRLBezierPath elementCount](self->_unscaledFillEraserPathToCommit, "elementCount") < 0x65)
  {
    p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = &self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
    if (self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect)
      goto LABEL_8;
  }
  else
  {
    -[CRLFreehandDrawingToolEraser p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:](self, "p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:", self->_unscaledFillEraserPathToCommit, self->_committedFillEraserPathCtx, 0, CGRectNull.origin.x, y, width, height);
    x = v11;
    y = v12;
    width = v13;
    height = v14;
    v15 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    unscaledFillEraserPathToCommit = self->_unscaledFillEraserPathToCommit;
    self->_unscaledFillEraserPathToCommit = v15;

    p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = &self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
    committedFillMaskImageForErasingPositionedInVisibleCanvasRect = self->_committedFillMaskImageForErasingPositionedInVisibleCanvasRect;
    if (committedFillMaskImageForErasingPositionedInVisibleCanvasRect)
    {
      CGImageRelease(committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
      *p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = 0;
    }
  }
  *p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect = CGBitmapContextCreateImage(self->_committedFillEraserPathCtx);
LABEL_8:
  if (!self->_fillEraserPathCtx)
  {
    -[CRLFreehandDrawingToolEraser p_maskImageSize](self, "p_maskImageSize");
    v21 = sub_10040FA64(2, v19, v20);
    self->_fillEraserPathCtx = v21;
    v32.origin.x = sub_10005FDDC();
    CGContextDrawImage(v21, v32, *p_committedFillMaskImageForErasingPositionedInVisibleCanvasRect);
  }
  v30 = -[CRLBezierPath copy](self->_unscaledFillEraserPathToCommit, "copy");
  v22 = -[CRLFreehandDrawingPathCreator copyOfUncommittedPath](self->_fillPathCreator, "copyOfUncommittedPath");
  objc_msgSend(v30, "appendBezierPath:skippingInitialMoveIfPossible:", v22, 1);

  if (objc_msgSend(v30, "containsElementsOtherThanMoveAndClose"))
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v33 = CGRectUnion(self->_lastDirtyRectForUncommittedFillMask, v34);
    -[CRLFreehandDrawingToolEraser p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:](self, "p_drawPath:inContext:drawingCommittedImageBehind:additionalAlreadyOutsetUnscaledDirtyRect:", v30, self->_fillEraserPathCtx, 1, v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
    self->_lastDirtyRectForUncommittedFillMask.origin.x = v23;
    self->_lastDirtyRectForUncommittedFillMask.origin.y = v24;
    self->_lastDirtyRectForUncommittedFillMask.size.width = v25;
    self->_lastDirtyRectForUncommittedFillMask.size.height = v26;
  }
  Image = CGBitmapContextCreateImage(self->_fillEraserPathCtx);
  v28 = (CRLImage *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:](CRLImage, "imageWithCGImage:", Image));
  fillMaskImageForErasing = self->_fillMaskImageForErasing;
  self->_fillMaskImageForErasing = v28;

  CGImageRelease(Image);
}

- (void)p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing
{
  void *v3;
  double v4;
  double v5;
  unsigned int v6;
  CRLFreehandDrawingPathCreator *strokePathCreator;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  objc_class *v39;
  objc_class *v40;
  void *v41;
  id v42;
  void *v43;
  unsigned int v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  char *v50;
  NSObject *v51;
  char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  double v81;
  void *v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  double v90;
  objc_class *v91;
  objc_class *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  unsigned int v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  char *v105;
  id v106;
  id v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  double v113;
  objc_class *v114;
  objc_class *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  unsigned int v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  char *v126;
  id v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  void *v132;
  void *v133;
  double v134;
  void *v135;
  id obj;
  double obja;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[128];
  uint8_t v159[128];
  uint8_t buf[4];
  unsigned int v161;
  __int16 v162;
  const char *v163;
  __int16 v164;
  const char *v165;
  __int16 v166;
  int v167;
  __int16 v168;
  const char *v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
  v5 = v4;
  v6 = -[CRLFreehandDrawingToolEraser isWholeObjectEraser](self, "isWholeObjectEraser");
  strokePathCreator = self->_strokePathCreator;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolEraser p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:](self, "p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:", strokePathCreator, 0));
    v9 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolEraser p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:](self, "p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:", self->_fillPathCreator, 0));
    v10 = v5 * 0.5;
    v130 = (void *)v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:](self->_strokeHitTester, "pathsCrossingPath:withSearchThreshold:", v8, v10));
    v129 = (void *)v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:](self->_fillHitTester, "pathsCrossingPath:withSearchThreshold:", v9, v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    obj = v11;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v172, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v155;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v155 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * (_QWORD)i);
          -[CRLBezierHitTester removePath:](self->_strokeHitTester, "removePath:", v18);
          objc_msgSend(v13, "addObject:", v18);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v172, 16);
      }
      while (v15);
    }

    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v150, v171, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v151;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v151 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * (_QWORD)j);
          -[CRLBezierHitTester removePath:](self->_fillHitTester, "removePath:", v24);
          objc_msgSend(v13, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v150, v171, 16);
      }
      while (v21);
    }
    v127 = v19;

    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v146, v170, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v147;
      v133 = v25;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v147 != v28)
            objc_enumerationMutation(v133);
          v30 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)v29);
          if (-[NSHashTable containsObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "containsObject:", v30))
          {
            v31 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A198);
            v32 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v161 = v31;
              v162 = 2082;
              v163 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              v164 = 2082;
              v165 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              v166 = 1024;
              v167 = 844;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Should not be trying to delete a whole path that has already been deleted.", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A1B8);
            v33 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v49 = v33;
              v50 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v161 = v31;
              v162 = 2114;
              v163 = v50;
              _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 844, 0, "Should not be trying to delete a whole path that has already been deleted.");

          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_shapeLayoutsForHitTesterPaths, "objectForKeyedSubscript:", v30));
          -[NSHashTable addObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "addObject:", v30);
          objc_msgSend(v36, "beginDynamicOperationWithRealTimeCommands:", 0);
          objc_msgSend(v36, "dynamicallyMakeShapeInvisible");
          *(_QWORD *)&v38 = objc_opt_class(CRLShapeRep, v37).n128_u64[0];
          v40 = v39;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForLayout:", v36, v38));
          v42 = sub_1002223BC(v40, v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);

          if (v43)
          {
            objc_msgSend(v43, "setNeedsDisplay");
          }
          else
          {
            v44 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A1D8);
            v45 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v161 = v44;
              v162 = 2082;
              v163 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              v164 = 2082;
              v165 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              v166 = 1024;
              v167 = 852;
              v168 = 2082;
              v169 = "currentShapeRep";
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A1F8);
            v46 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v51 = v46;
              v52 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v161 = v44;
              v162 = 2114;
              v163 = v52;
              _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 852, 0, "invalid nil value for '%{public}s'", "currentShapeRep");

          }
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v25 = v133;
        v27 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v146, v170, 16);
      }
      while (v27);
    }

    v53 = v127;
  }
  else
  {
    v54 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolEraser p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:](self, "p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:", strokePathCreator, self->_unscaledStrokeEraserPathToCommit));
    v55 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolEraser p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:](self, "p_copyOfPathCreatorPathCommittingAllAvailablePoints:optionallyAdditionallyCommittingIntoAdditionalPath:", self->_fillPathCreator, self->_unscaledFillEraserPathToCommit));
    v134 = (v5 + self->_widthOfThickestStrokePossiblyBeingErased) * 0.5;
    -[CRLFreehandDrawingPathCreator takeDirtyRect](self->_strokePathCreator, "takeDirtyRect");
    obja = v5;
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;
    -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
    v65 = -(v64 * 0.5 + 7.5);
    v173.origin.x = v57;
    v173.origin.y = v59;
    v173.size.width = v61;
    v173.size.height = v63;
    v174 = CGRectInset(v173, v65, v65);
    x = v174.origin.x;
    y = v174.origin.y;
    width = v174.size.width;
    height = v174.size.height;
    -[CRLFreehandDrawingPathCreator takeDirtyRect](self->_fillPathCreator, "takeDirtyRect");
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v77 = v76;
    -[CRLFreehandDrawingToolEraser p_unscaledEraserDiameter](self, "p_unscaledEraserDiameter");
    v79 = -(v78 * 0.5 + 2.5);
    v175.origin.x = v71;
    v175.origin.y = v73;
    v175.size.width = v75;
    v175.size.height = v77;
    v176 = CGRectInset(v175, v79, v79);
    v131 = v176.origin.x;
    v128 = v176.origin.y;
    v80 = v176.size.width;
    v81 = v176.size.height;
    v130 = (void *)v54;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:](self->_strokeHitTester, "pathsCrossingPath:withSearchThreshold:", v54, v134));
    v129 = (void *)v55;
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:](self->_fillHitTester, "pathsCrossingPath:withSearchThreshold:", v55, obja * 0.5));
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    obj = v82;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v143;
      do
      {
        v86 = 0;
        do
        {
          if (*(_QWORD *)v143 != v85)
            objc_enumerationMutation(obj);
          v87 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)v86);
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_shapeLayoutsForHitTesterPaths, "objectForKeyedSubscript:", v87));
          if (!-[NSHashTable containsObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "containsObject:", v87))
          {
            -[NSHashTable addObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "addObject:", v87);
            objc_msgSend(v88, "beginDynamicOperationWithRealTimeCommands:", 0);
          }
          *(_QWORD *)&v90 = objc_opt_class(CRLShapeRep, v89).n128_u64[0];
          v92 = v91;
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForLayout:", v88, v90));
          v94 = sub_1002223BC(v92, v93);
          v95 = (void *)objc_claimAutoreleasedReturnValue(v94);

          if (v95)
          {
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "stroke"));
            objc_msgSend(v96, "width");
            v98 = v97;

            v177.origin.x = x;
            v177.origin.y = y;
            v177.size.width = width;
            v177.size.height = height;
            v178 = CGRectInset(v177, v98 * -1.41421354, v98 * -1.41421354);
            objc_msgSend(v95, "convertNaturalRectFromUnscaledCanvas:", v178.origin.x, v178.origin.y, v178.size.width, v178.size.height);
            objc_msgSend(v95, "setNeedsDisplayInRect:");
            objc_msgSend(v3, "invalidateContentLayersForRep:", v95);
          }
          else
          {
            v99 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A218);
            v100 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v161 = v99;
              v162 = 2082;
              v163 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              v164 = 2082;
              v165 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              v166 = 1024;
              v167 = 889;
              v168 = 2082;
              v169 = "currentShapeRep";
              _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A238);
            v101 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v104 = v101;
              v105 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v161 = v99;
              v162 = 2114;
              v163 = v105;
              _os_log_error_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]"));
            v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v102, v103, 889, 0, "invalid nil value for '%{public}s'", "currentShapeRep");

          }
          v86 = (char *)v86 + 1;
        }
        while (v84 != v86);
        v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
      }
      while (v84);
    }

    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    v25 = v132;
    v106 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
    if (v106)
    {
      v107 = v106;
      v135 = v25;
      v108 = *(_QWORD *)v139;
      do
      {
        v109 = 0;
        do
        {
          if (*(_QWORD *)v139 != v108)
            objc_enumerationMutation(v135);
          v110 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)v109);
          v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->_shapeLayoutsForHitTesterPaths, "objectForKeyedSubscript:", v110));
          if (!-[NSHashTable containsObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "containsObject:", v110))
          {
            -[NSHashTable addObject:](self->_hitTesterPathsNeedingFinalizationAtEnd, "addObject:", v110);
            objc_msgSend(v111, "beginDynamicOperationWithRealTimeCommands:", 0);
          }
          *(_QWORD *)&v113 = objc_opt_class(CRLShapeRep, v112).n128_u64[0];
          v115 = v114;
          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForLayout:", v111, v113));
          v117 = sub_1002223BC(v115, v116);
          v118 = (void *)objc_claimAutoreleasedReturnValue(v117);

          if (v118)
          {
            v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "freehandDrawingDynamicFillErasingDelegate"));

            if (!v119)
              objc_msgSend(v118, "setFreehandDrawingDynamicFillErasingDelegate:", self);
            objc_msgSend(v118, "convertNaturalRectFromUnscaledCanvas:", v131, v128, v80, v81);
            objc_msgSend(v118, "setNeedsDisplayInRect:");
            objc_msgSend(v3, "invalidateContentLayersForRep:", v118);
          }
          else
          {
            v120 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A258);
            v121 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v161 = v120;
              v162 = 2082;
              v163 = "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]";
              v164 = 2082;
              v165 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
              v166 = 1024;
              v167 = 913;
              v168 = 2082;
              v169 = "currentShapeRep";
              _os_log_error_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10125A278);
            v122 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v125 = v122;
              v126 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v161 = v120;
              v162 = 2114;
              v163 = v126;
              _os_log_error_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_updatePathsFromPathCreatorsHidingShapesForWholeObjectAndDirtyingRectsForSlicing]"));
            v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v123, v124, 913, 0, "invalid nil value for '%{public}s'", "currentShapeRep");

          }
          v109 = (char *)v109 + 1;
        }
        while (v107 != v109);
        v107 = objc_msgSend(v135, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
      }
      while (v107);
      v25 = v135;
    }
    v53 = v25;
  }

}

- (int64_t)p_breakApartShape:(id)a3 withGeometry:(id)a4 subpaths:(id)a5 strokePatternOffsetArray:(id)a6 previousZOrderOffset:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  double v27;
  objc_class *v28;
  objc_class *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  unsigned int v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  char *v50;
  double v51;
  objc_class *v52;
  objc_class *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  char *v58;
  _TtC8Freeform26CRLCommandInsertBoardItems *v59;
  void *v60;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v61;
  void *v62;
  id v63;
  __objc2_class *v65;
  NSObject *log;
  int64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint8_t buf[4];
  unsigned int v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "editingCoordinator"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "boardItemFactory"));

  v69 = v13;
  v67 = a7;
  if (v15)
  {
    v17 = objc_msgSend(v15, "count");
    if (v17 == objc_msgSend(v14, "count"))
    {
      v70 = v15;
    }
    else
    {
      v18 = v15;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A298);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2E938();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A2B8);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 936, 0, "strokePatternOffsetArray must have the same count as the number of provided subpaths (if it's provided)");

      v70 = 0;
    }
  }
  else
  {
    v70 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v14, "count")));
  if (objc_msgSend(v14, "count"))
  {
    v24 = 0;
    do
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v24));
      *(_QWORD *)&v27 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v26).n128_u64[0];
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "makeDuplicateOfBoardItem:", v12, v27));
      v31 = sub_1002223BC(v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      objc_msgSend(v25, "bounds");
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometryWithNewBounds:"));
      objc_msgSend(v32, "setGeometry:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v25));
      objc_msgSend(v32, "setPathSource:", v34);

      objc_msgSend(v32, "setAspectRatioLocked:", objc_msgSend(v12, "aspectRatioLocked"));
      *(_QWORD *)&v36 = objc_opt_class(CRLBrushStroke, v35).n128_u64[0];
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stroke", v36));
      v40 = sub_100221D0C(v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

      if (v41)
      {
        if (v70)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectAtIndexedSubscript:", v24));
          objc_msgSend(v42, "crl_CGFloatValue");
          v44 = v43;

          objc_msgSend(v32, "setStrokePatternOffsetDistance:", v44);
        }
        else
        {
          v45 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A2D8);
          v46 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v73 = v45;
            v74 = 2082;
            v75 = "-[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previo"
                  "usZOrderOffset:]";
            v76 = 2082;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m";
            v78 = 1024;
            v79 = 958;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Must have a strokePatternOffsetArray if we are erasing a brush stroke.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A2F8);
          v47 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v65 = CRLAssertionHandler;
            log = v47;
            v50 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v73 = v45;
            v74 = 2114;
            v75 = v50;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:]", v65));
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolEraser.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 958, 0, "Must have a strokePatternOffsetArray if we are erasing a brush stroke.");

          v13 = v69;
        }
      }
      objc_msgSend(v22, "addObject:", v32);

      ++v24;
    }
    while (v24 < (unint64_t)objc_msgSend(v14, "count"));
  }
  *(_QWORD *)&v51 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v23).n128_u64[0];
  v53 = v52;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parentInfo", v51));
  v55 = sub_1002223BC(v53, v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "childInfos"));
  v58 = (char *)objc_msgSend(v57, "indexOfObject:", v12) + v67;

  v59 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:index:", v56, v22, v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "commandController"));
  objc_msgSend(v60, "enqueueCommand:", v59);

  v61 = -[CRLCommandDeleteBoardItems initWithBoardItemToDelete:]([_TtC8Freeform26CRLCommandDeleteBoardItems alloc], "initWithBoardItemToDelete:", v12);
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "commandController"));
  objc_msgSend(v62, "enqueueCommand:", v61);

  v63 = objc_msgSend(v22, "count");
  return (int64_t)v63 - 1;
}

- (int64_t)p_breakApartOpenShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 strokePatternOffsetArray:(id)a6 previousZOrderOffset:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  int64_t v17;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:", 1));
  v16 = objc_msgSend(v15, "count");
  if (v14 || (unint64_t)v16 >= 2)
    v17 = -[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:](self, "p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:", v12, v13, v15, v14, a7);
  else
    v17 = 0;

  return v17;
}

- (int64_t)p_breakApartFilledShapeIfPossible:(id)a3 withDesiredGeometry:(id)a4 bezierPath:(id)a5 previousZOrderOffset:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  int64_t v13;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "visuallyDistinctSubregions"));
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    v13 = -[CRLFreehandDrawingToolEraser p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:](self, "p_breakApartShape:withGeometry:subpaths:strokePatternOffsetArray:previousZOrderOffset:", v10, v11, v12, 0, a6);
  else
    v13 = 0;

  return v13;
}

- (double)scaledWidthForSlicingEraser
{
  return self->_scaledWidthForSlicingEraser;
}

- (BOOL)isWholeObjectEraser
{
  return self->_wholeObjectEraser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillMaskImageForErasing, 0);
  objc_storeStrong((id *)&self->_unscaledFillEraserPathToCommit, 0);
  objc_storeStrong((id *)&self->_unscaledStrokeEraserPathToCommit, 0);
  objc_storeStrong((id *)&self->_hitTesterPathsNeedingFinalizationAtEnd, 0);
  objc_storeStrong((id *)&self->_patternOffsetsBySubpathForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_currentPathsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_shapeLayoutsForHitTesterPaths, 0);
  objc_storeStrong((id *)&self->_allHitTesterPathsZOrdered, 0);
  objc_storeStrong((id *)&self->_fillHitTester, 0);
  objc_storeStrong((id *)&self->_strokeHitTester, 0);
  objc_storeStrong((id *)&self->_fillPathCreator, 0);
  objc_storeStrong((id *)&self->_strokePathCreator, 0);
}

@end
