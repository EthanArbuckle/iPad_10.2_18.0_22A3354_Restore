@implementation VKPolylineOverlay

- (VKPolylineOverlay)initWithComposedRoute:(id)a3 traffic:(id)a4
{
  id v7;
  id v8;
  VKPolylineOverlay *v9;
  VKPolylineOverlay *v10;
  VKPolylineOverlay *v11;
  TrafficSegmentsAlongRoute *v12;
  TrafficSegmentsAlongRoute *value;
  void *v14;
  VKPolylineOverlay *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VKPolylineOverlay;
  v9 = -[VKPolylineOverlay init](&v17, sel_init);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_composedRoute, a3);
    -[GEOComposedRoute registerObserver:](v11->_composedRoute, "registerObserver:", v11);
    if (!-[VKPolylineOverlay containsTransit](v11, "containsTransit"))
    {
      objc_storeStrong((id *)&v10->_traffic, a4);
      v12 = (TrafficSegmentsAlongRoute *)operator new();
      *(_QWORD *)v12 = 0;
      *((_QWORD *)v12 + 1) = 0;
      *((_QWORD *)v12 + 2) = 0;
      value = v11->_trafficSegments.__ptr_.__value_;
      v11->_trafficSegments.__ptr_.__value_ = v12;
      if (value)
      {
        v14 = *(void **)value;
        if (*(_QWORD *)value)
        {
          *((_QWORD *)value + 1) = v14;
          operator delete(v14);
        }
        MEMORY[0x1A1AF4E00](value, 0x20C40960023A9);
      }
      -[VKPolylineOverlay updateTraffic:](v11, "updateTraffic:", v8);
    }
    v15 = v11;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  __CFSet *observers;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_storeWeak((id *)&self->_routeRibbon, 0);
  -[GEOComposedRoute unregisterObserver:](self->_composedRoute, "unregisterObserver:", self);
  observers = self->_observers;
  if (observers)
    CFRelease(observers);
  v5.receiver = self;
  v5.super_class = (Class)VKPolylineOverlay;
  -[VKPolylineOverlay dealloc](&v5, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  __CFSet *observers;
  CFSetCallBacks v6;

  v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    v6 = *(CFSetCallBacks *)byte_1E42F3940;
    observers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v6);
    self->_observers = observers;
  }
  CFSetAddValue(observers, v4);

}

- (void)removeObserver:(id)a3
{
  __CFSet *observers;
  id value;

  value = a3;
  observers = self->_observers;
  if (observers)
    CFSetRemoveValue(observers, value);
  -[GEOComposedRoute clearSnappedPathsForObserver:](self->_composedRoute, "clearSnappedPathsForObserver:", value);

}

- (void)_setNeedsLayout
{
  __CFSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_observers;
  v4 = -[__CFSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setNeedsLayoutForPolyline:", self, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[__CFSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setRouteRibbon:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_routeRibbon, obj);
    v6 = objc_loadWeakRetained((id *)&self->_routeRibbonObserver);
    v7 = objc_loadWeakRetained((id *)&self->_routeRibbon);
    objc_msgSend(v6, "polylineOverlay:didUpdateRouteRibbon:", self, v7);

    v5 = obj;
  }

}

- (BOOL)containsTransit
{
  return -[GEOComposedRoute transportType](self->_composedRoute, "transportType") == 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOComposedRoute boundingMapRegion](self->_composedRoute, "boundingMapRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "southLat");
  v4 = v3;
  objc_msgSend(v2, "northLat");
  v6 = v5;
  objc_msgSend(v2, "westLng");
  v8 = v7;
  objc_msgSend(v2, "eastLng");
  v9 = (v6 + v4) * 0.5;
  v11 = (v10 + v8) * 0.5;

  v12 = v9;
  v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (GEOMapRegion)boundingMapRegion
{
  return (GEOMapRegion *)-[GEOComposedRoute boundingMapRegion](self->_composedRoute, "boundingMapRegion");
}

- (_NSRange)sectionRangeForBounds:()Box<double
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  unint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  _NSRange result;

  v3 = a3._maximum._e[1];
  v4 = a3._maximum._e[0];
  v5 = a3._minimum._e[1];
  v6 = a3._minimum._e[0];
  v30 = *MEMORY[0x1E0C80C00];
  -[GEOComposedRoute sections](self->_composedRoute, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[GEOComposedRoute sections](self->_composedRoute, "sections", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  v12 = v9 - 1;
  if (v11)
  {
    v13 = 0;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      v16 = v13;
      v13 += v11;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "vkBounds");
        if (v4 > v20)
        {
          v21 = v6 < v18;
          if (v3 <= v17)
            v21 = 0;
          if (v9 >= v16 + v15)
            v22 = v16 + v15;
          else
            v22 = v9;
          if (v21 && v5 < v19)
          {
            v12 = v16 + v15;
            v9 = v22;
          }
        }
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v23 = v12 - v9 + 1;
  v24 = v9;
  result.length = v23;
  result.location = v24;
  return result;
}

- (void)updateTraffic:(id)a3
{
  GEOComposedRouteTraffic *v5;
  NSObject *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int *v13;
  unsigned __int8 *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  VKPolylineOverlay *v19;
  __int16 v20;
  GEOComposedRouteTraffic *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (GEOComposedRouteTraffic *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_25_11794);
  v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v18 = 134218242;
    v19 = self;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "VKPolylineOverlay %p updateTraffic: %@", (uint8_t *)&v18, 0x16u);
  }

  if (self->_traffic != v5)
    objc_storeStrong((id *)&self->_traffic, a3);
  if (!-[VKPolylineOverlay containsTransit](self, "containsTransit"))
  {
    *((_QWORD *)self->_trafficSegments.__ptr_.__value_ + 1) = *(_QWORD *)self->_trafficSegments.__ptr_.__value_;
    if (v5)
    {
      v7 = -[GEOComposedRouteTraffic trafficColorOffsetsCount](v5, "trafficColorOffsetsCount");
      v8 = -[GEOComposedRouteTraffic trafficColorsCount](v5, "trafficColorsCount");
      if (v8 >= v7)
        v9 = v7;
      else
        v9 = v8;
      if (v9)
      {
        v10 = -[GEOComposedRouteTraffic trafficColors](v5, "trafficColors");
        v11 = -[GEOComposedRouteTraffic trafficColorOffsets](v5, "trafficColorOffsets");
        if (v9 >= 2)
        {
          v12 = v9 - 1;
          v13 = (unsigned int *)(v11 + 4);
          v14 = (unsigned __int8 *)v10;
          do
          {
            v16 = *v13++;
            v15 = v16;
            v17 = *v14;
            v14 += 4;
            md::TrafficSegmentsAlongRoute::addSegmentAt((md::TrafficSegmentsAlongRoute *)self->_trafficSegments.__ptr_.__value_, v15, v17);
            --v12;
          }
          while (v12);
        }
        md::TrafficSegmentsAlongRoute::addSegmentAt((md::TrafficSegmentsAlongRoute *)self->_trafficSegments.__ptr_.__value_, 0xFFFFFFFF, *(unsigned __int8 *)(v10 + 4 * v9 - 4));
      }
      else
      {
        md::TrafficSegmentsAlongRoute::addSegmentAt((md::TrafficSegmentsAlongRoute *)self->_trafficSegments.__ptr_.__value_, 0xFFFFFFFF, 4);
      }
    }
    self->_trafficTimeStamp = CFAbsoluteTimeGetCurrent();
    -[VKPolylineOverlay _setNeedsLayout](self, "_setNeedsLayout");
  }

}

- (void)clearSnappedPathsForObserver:(id)a3
{
  self->_isReadyForSnapping = 0;
  -[GEOComposedRoute clearSnappedPathsForObserver:](self->_composedRoute, "clearSnappedPathsForObserver:", a3);
}

- (BOOL)_meetsMinimumPathLengthBetweenStart:(unsigned int)a3 end:(unsigned int)a4
{
  unsigned int v7;
  double v8;
  unsigned int v9;
  double v10;

  -[GEOComposedRoute pointAt:](self->_composedRoute, "pointAt:", a3);
  v7 = a3 + 1;
  v8 = 0.0;
  do
  {
    v9 = v7;
    if (v7 > a4)
      break;
    -[GEOComposedRoute pointAt:](self->_composedRoute, "pointAt:", v7);
    GEOCalculateDistance();
    v8 = v10 + v8;
    v7 = v9 + 1;
  }
  while (v8 < 100.0);
  return v9 <= a4;
}

- (void)createMatchedSegmentAndAddToPaths:(id)a3 section:(id)a4 pathStartIndex:(unsigned int)a5 pathEndIndex:(unsigned int)a6 shouldGenerateSnapPath:(BOOL)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9
{
  uint64_t v10;
  uint64_t v11;
  id v14;
  id WeakRetained;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  __objc2_class **v26;
  id v28;
  _QWORD v29[5];

  v10 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a5;
  v28 = a3;
  v14 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);
  objc_msgSend(WeakRetained, "setNumPathsMatching:", (unsigned __int16)(objc_msgSend(WeakRetained, "numPathsMatching") + 1));

  v16 = objc_loadWeakRetained((id *)&self->_routeRibbon);
  objc_msgSend(v16, "pathMatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __153__VKPolylineOverlay_createMatchedSegmentAndAddToPaths_section_pathStartIndex_pathEndIndex_shouldGenerateSnapPath_elevationSource_elevationSourceContext___block_invoke;
  v29[3] = &unk_1E42F3978;
  v29[4] = self;
  objc_msgSend(v17, "matchRouteFromStart:toEnd:finishedHandler:", v11, v10, v29);

  if (a7)
  {
    v18 = objc_loadWeakRetained((id *)&self->_routeRibbon);
    objc_msgSend(v18, "pathMatcher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "matchedSegmentsFromStart:toEnd:", v11, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20 || !objc_msgSend(v20, "count"))
      goto LABEL_10;
    v21 = objc_msgSend(v20, "count");
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "startRouteCoordinate") == (_DWORD)v11)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", v21 - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "endRouteCoordinate");

      if (v24 != (_DWORD)v10)
      {
LABEL_10:

        goto LABEL_11;
      }
      v25 = -[GEOComposedRoute transportType](self->_composedRoute, "transportType");
      v26 = off_1E426D440;
      if (v25)
        v26 = off_1E426D518;
      v22 = (void *)objc_msgSend(objc_alloc(*v26), "initWithOverlay:section:routeStartIndex:routeEndIndex:matchedPathSegments:elevationSource:elevationSourceContext:", self, v14, v11, v10, v20, a8, a9);
      objc_msgSend(v28, "addObject:", v22);
      -[VKPolylineOverlay _setNeedsLayout](self, "_setNeedsLayout");
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (id)getPathsForRenderRegion:(id)a3 shouldSnapToRoads:(BOOL)a4 shouldGenerateSnapPath:(BOOL)a5 verifySnapping:(BOOL)a6 isGradientTraffic:(BOOL)a7 observer:(id)a8 elevationSource:(void *)a9 elevationSourceContext:(void *)a10
{
  _BOOL8 v11;
  _BOOL4 v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  double *v22;
  double *v23;
  double *v24;
  double *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  double *v40;
  char *v41;
  double *v42;
  __int128 v43;
  char *v44;
  double *v45;
  BOOL v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  id WeakRetained;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  float *v68;
  float *v69;
  float *v70;
  double *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  char *v88;
  float *v89;
  char *v90;
  char *v91;
  unsigned int v92;
  id v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  unsigned int v98;
  id v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  float *v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  double v115;
  float v116;
  float v117;
  float v118;
  float *v119;
  uint64_t k;
  void *v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  void *v126;
  void *v127;
  char *v128;
  char *v129;
  char *v130;
  int64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char *v136;
  unsigned int *v137;
  unint64_t v138;
  unsigned int *v139;
  uint64_t v140;
  char *v141;
  char *v142;
  uint64_t v143;
  __int128 v144;
  uint64_t v145;
  char *v146;
  char *v147;
  _BYTE *v148;
  int64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  unint64_t v153;
  char *v154;
  unsigned int *v155;
  char *v156;
  unint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  __int128 v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t m;
  void *v168;
  uint64_t v170;
  uint64_t v171;
  uint64_t n;
  void *v173;
  id v174;
  id v175;
  id v176;
  id v177;
  double *__p;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  _BOOL4 v182;
  _BOOL4 v183;
  id *location;
  uint64_t v185;
  _BOOL4 v186;
  double v187;
  double v188;
  id v189;
  id v190;
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
  void *v203;
  char *v204;
  char *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  uint64_t v222;

  v182 = a7;
  v11 = a6;
  v186 = a5;
  v12 = a4;
  v222 = *MEMORY[0x1E0C80C00];
  v190 = a3;
  v175 = a8;
  v189 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v183 = v12;
  self->_isReadyForSnapping = v12;
  if (-[VKPolylineOverlay containsTransit](self, "containsTransit"))
  {
    -[GEOComposedRoute clearSnappedPathsForObserver:](self->_composedRoute, "clearSnappedPathsForObserver:", v175);
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    -[GEOComposedRoute sections](self->_composedRoute, "sections");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v213, v221, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v214;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v214 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
          objc_msgSend(v18, "pathsForRenderRegion:inOverlay:shouldSnapToTransit:verifySnapping:elevationSource:elevationSourceContext:", v190, self, 1, v11, a9, a10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19
            || (objc_msgSend(v18, "pathsForRenderRegion:inOverlay:elevationSource:elevationSourceContext:", v190, self, a9, a10), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend(v189, "addObjectsFromArray:", v19);
          }

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v213, v221, 16);
      }
      while (v15);
    }
    v20 = v189;
    goto LABEL_13;
  }
  if (!v12)
  {
    -[GEOComposedRoute clearSnappedPathsForObserver:](self->_composedRoute, "clearSnappedPathsForObserver:", v175);
    v197 = 0u;
    v198 = 0u;
    v195 = 0u;
    v196 = 0u;
    -[GEOComposedRoute sections](self->_composedRoute, "sections");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v195, v218, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v196;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v196 != v49)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v195 + 1) + 8 * j), "pathsForRenderRegion:inOverlay:elevationSource:elevationSourceContext:", v190, self, a9, a10);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "addObjectsFromArray:", v51);

        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v195, v218, 16);
      }
      while (v48);
    }

    goto LABEL_193;
  }
  v21 = (_QWORD *)objc_msgSend(v190, "snappingRegion");
  v22 = (double *)(v21 + 1);
  v23 = (double *)*v21;
  if ((_QWORD *)*v21 != v21 + 1)
  {
    __p = 0;
    v24 = 0;
    v25 = 0;
    v26 = MEMORY[0x1E0D266E8];
    while (1)
    {
      v27 = *(double *)(v26 + 16);
      v28 = *(double *)(v26 + 24);
      v29 = v23[4];
      v30 = v27 * v29;
      v31 = v23[7];
      v32 = v28 - v31 * v28;
      v33 = (v23[6] - v29) * v27;
      v34 = (v31 - v23[5]) * v28;
      if (v24 >= v25)
      {
        v36 = ((char *)v24 - (char *)__p) >> 5;
        v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 59)
          abort();
        if (((char *)v25 - (char *)__p) >> 4 > v37)
          v37 = ((char *)v25 - (char *)__p) >> 4;
        if ((unint64_t)((char *)v25 - (char *)__p) >= 0x7FFFFFFFFFFFFFE0)
          v38 = 0x7FFFFFFFFFFFFFFLL;
        else
          v38 = v37;
        if (v38)
        {
          if (v38 >> 59)
            goto LABEL_209;
          v39 = (char *)operator new(32 * v38);
        }
        else
        {
          v39 = 0;
        }
        v40 = (double *)&v39[32 * v36];
        *v40 = v30;
        v40[1] = v32;
        v40[2] = v33;
        v40[3] = v34;
        if (v24 == __p)
        {
          v44 = &v39[32 * v36];
          v42 = __p;
        }
        else
        {
          v41 = &v39[32 * v36];
          v42 = __p;
          do
          {
            v43 = *((_OWORD *)v24 - 1);
            v44 = v41 - 32;
            *((_OWORD *)v41 - 2) = *((_OWORD *)v24 - 2);
            *((_OWORD *)v41 - 1) = v43;
            v24 -= 4;
            v41 -= 32;
          }
          while (v24 != __p);
        }
        v25 = (double *)&v39[32 * v38];
        v24 = v40 + 4;
        if (v42)
          operator delete(v42);
        __p = (double *)v44;
        v35 = (double *)*((_QWORD *)v23 + 1);
        if (v35)
        {
          do
          {
LABEL_39:
            v45 = v35;
            v35 = *(double **)v35;
          }
          while (v35);
          goto LABEL_17;
        }
      }
      else
      {
        *v24 = v30;
        v24[1] = v32;
        v24[2] = v33;
        v24[3] = v34;
        v24 += 4;
        v35 = (double *)*((_QWORD *)v23 + 1);
        if (v35)
          goto LABEL_39;
      }
      do
      {
        v45 = (double *)*((_QWORD *)v23 + 2);
        v46 = *(_QWORD *)v45 == (_QWORD)v23;
        v23 = v45;
      }
      while (!v46);
LABEL_17:
      v23 = v45;
      if (v45 == v22)
        goto LABEL_53;
    }
  }
  v24 = 0;
  __p = 0;
LABEL_53:
  objc_msgSend(v190, "visibleRect");
  WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);
  objc_msgSend(WeakRetained, "_clearMatchedSegments");

  v53 = objc_loadWeakRetained((id *)&self->_routeRibbon);
  if (v53)
  {
    v54 = v53;
    location = (id *)&self->_routeRibbon;
    v55 = objc_loadWeakRetained((id *)&self->_routeRibbon);
    objc_msgSend(v55, "pathMatcher");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = objc_loadWeakRetained(location);
      objc_msgSend(v57, "setMatchingEndIndex:", 0);

      v58 = -[GEOComposedRoute pointCount](self->_composedRoute, "pointCount") - 1;
      v59 = objc_loadWeakRetained((id *)&self->_routeRibbon);
      objc_msgSend(v59, "setMatchingStartIndex:", v58);

      v211 = 0u;
      v212 = 0u;
      v209 = 0u;
      v210 = 0u;
      -[GEOComposedRoute sections](self->_composedRoute, "sections");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v209, v220, 16);
      if (v181)
      {
        v61 = *(_QWORD *)v210;
        if (__p == v24)
        {
          do
          {
            for (k = 0; k != v181; ++k)
            {
              if (*(_QWORD *)v210 != v61)
                objc_enumerationMutation(v60);
              v121 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * k);
              if (v121)
              {
                objc_msgSend(v121, "bounds");
              }
              else
              {
                v207 = 0u;
                v208 = 0u;
                v206 = 0u;
              }
              GEOMapRectIntersectsRect();
            }
            v181 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v209, v220, 16);
          }
          while (v181);
        }
        else
        {
          v179 = *(_QWORD *)v210;
          v180 = v60;
          do
          {
            v62 = 0;
            do
            {
              if (*(_QWORD *)v210 != v61)
                objc_enumerationMutation(v60);
              v63 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * v62);
              v185 = v62;
              if (v63)
              {
                objc_msgSend(v63, "bounds");
                v64 = *((double *)&v206 + 1);
                v65 = *(double *)&v206;
                v67 = *((double *)&v207 + 1);
                v66 = *(double *)&v208;
              }
              else
              {
                v207 = 0u;
                v208 = 0u;
                v66 = 0.0;
                v67 = 0.0;
                v64 = 0.0;
                v65 = 0.0;
                v206 = 0u;
              }
              if (GEOMapRectIntersectsRect())
              {
                v68 = 0;
                v69 = 0;
                v70 = 0;
                v188 = v66 + v64;
                v187 = 1.0 / v67;
                v71 = __p;
                v72 = 1.0 / v66;
                do
                {
                  v74 = *v71;
                  v73 = v71[1];
                  v76 = v71[2];
                  v75 = v71[3];
                  if (GEOMapRectIntersectsRect())
                  {
                    v77 = (v74 - v65) * v187;
                    v78 = (v188 - v73) * v72;
                    v79 = (v76 + v74 - v65) * v187;
                    v80 = (v188 - (v75 + v73)) * v72;
                    v81 = fminf(fminf(v77, 3.4028e38), v79);
                    v82 = fmaxf(fmaxf(v77, -3.4028e38), v79);
                    v83 = fminf(fminf(v78, 3.4028e38), v80);
                    v84 = fmaxf(fmaxf(v78, -3.4028e38), v80);
                    if (v69 < v70)
                    {
                      *v69 = v81;
                      v69[1] = v83;
                      v69[2] = v82;
                      v69[3] = v84;
                      v69 += 4;
                    }
                    else
                    {
                      v85 = ((char *)v69 - (char *)v68) >> 4;
                      v86 = v85 + 1;
                      if ((unint64_t)(v85 + 1) >> 60)
                        abort();
                      if (((char *)v70 - (char *)v68) >> 3 > v86)
                        v86 = ((char *)v70 - (char *)v68) >> 3;
                      if ((unint64_t)((char *)v70 - (char *)v68) >= 0x7FFFFFFFFFFFFFF0)
                        v87 = 0xFFFFFFFFFFFFFFFLL;
                      else
                        v87 = v86;
                      if (v87)
                      {
                        if (v87 >> 60)
                          goto LABEL_209;
                        v88 = (char *)operator new(16 * v87);
                      }
                      else
                      {
                        v88 = 0;
                      }
                      v89 = (float *)&v88[16 * v85];
                      *v89 = v81;
                      v89[1] = v83;
                      v89[2] = v82;
                      v89[3] = v84;
                      if (v69 == v68)
                      {
                        v91 = &v88[16 * v85];
                      }
                      else
                      {
                        v90 = &v88[16 * v85];
                        do
                        {
                          v91 = v90 - 16;
                          *((_OWORD *)v90 - 1) = *((_OWORD *)v69 - 1);
                          v69 -= 4;
                          v90 -= 16;
                        }
                        while (v69 != v68);
                      }
                      v70 = (float *)&v88[16 * v87];
                      v69 = v89 + 4;
                      if (v68)
                        operator delete(v68);
                      v68 = (float *)v91;
                    }
                  }
                  v71 += 4;
                }
                while (v71 != v24);
                if (v68 != v69)
                {
                  v92 = objc_msgSend(v63, "startPointIndex");
                  v93 = objc_loadWeakRetained(location);
                  v94 = objc_msgSend(v93, "matchingStartIndex");
                  if (v92 >= v94)
                  {
                    v177 = objc_loadWeakRetained(location);
                    v95 = objc_msgSend(v177, "matchingStartIndex");
                  }
                  else
                  {
                    v95 = objc_msgSend(v63, "startPointIndex");
                  }
                  v96 = v95;
                  v97 = objc_loadWeakRetained(location);
                  objc_msgSend(v97, "setMatchingStartIndex:", v96);

                  if (v92 >= v94)
                  v98 = objc_msgSend(v63, "endPointIndex");
                  v99 = objc_loadWeakRetained(location);
                  v100 = objc_msgSend(v99, "matchingEndIndex");
                  if (v98 <= v100)
                  {
                    v176 = objc_loadWeakRetained(location);
                    v101 = objc_msgSend(v176, "matchingEndIndex");
                  }
                  else
                  {
                    v101 = objc_msgSend(v63, "endPointIndex");
                  }
                  v102 = v101;
                  v103 = objc_loadWeakRetained(location);
                  objc_msgSend(v103, "setMatchingEndIndex:", v102);

                  if (v98 <= v100)
                  v104 = objc_msgSend(v63, "points");
                  v105 = objc_msgSend(v63, "startPointIndex");
                  v106 = 0;
                  v107 = 0xFFFFFFFFLL;
                  while (1)
                  {
LABEL_102:
                    if (v106 >= objc_msgSend(v63, "pointCount") - 1)
                    {
                      v108 = v105;
                      goto LABEL_117;
                    }
                    v108 = objc_msgSend(v63, "startPointIndex") + v106;
                    v109 = (float *)(v104 + 12 * v106);
                    v110 = v109[1];
                    v111 = fminf(v110, 3.4028e38);
                    v112 = fmaxf(v110, -3.4028e38);
                    ++v106;
                    v113 = v109[3];
                    v114 = v109[4];
                    *(float *)&v115 = fminf(v113, fminf(*v109, 3.4028e38));
                    v116 = fmaxf(fmaxf(*v109, -3.4028e38), v113);
                    v117 = fminf(v114, v111);
                    v118 = fmaxf(v112, v114);
                    v119 = v68;
                    while (v116 <= *v119 || *(float *)&v115 >= v119[2] || v118 <= v119[1] || v117 >= v119[3])
                    {
                      v119 += 4;
                      if (v119 == v69)
                      {
                        if ((_DWORD)v107 != (_DWORD)v108)
                          goto LABEL_102;
                        if (-[VKPolylineOverlay _meetsMinimumPathLengthBetweenStart:end:](self, "_meetsMinimumPathLengthBetweenStart:end:", v105, v107, v115))
                        {
                          -[VKPolylineOverlay createMatchedSegmentAndAddToPaths:section:pathStartIndex:pathEndIndex:shouldGenerateSnapPath:elevationSource:elevationSourceContext:](self, "createMatchedSegmentAndAddToPaths:section:pathStartIndex:pathEndIndex:shouldGenerateSnapPath:elevationSource:elevationSourceContext:", v189, v63, v105, v107, v186, a9, a10);
                          goto LABEL_102;
                        }
LABEL_110:
                        v107 = (v107 + 1);
                        goto LABEL_102;
                      }
                    }
                    if ((_DWORD)v107 == (_DWORD)v108)
                      goto LABEL_110;
                    if (!-[VKPolylineOverlay _meetsMinimumPathLengthBetweenStart:end:](self, "_meetsMinimumPathLengthBetweenStart:end:", v108, objc_msgSend(v63, "endPointIndex")))break;
                    v107 = (v108 + 1);
                    v105 = v108;
                  }
                  v107 = objc_msgSend(v63, "endPointIndex");
LABEL_117:
                  if ((_DWORD)v107 == objc_msgSend(v63, "endPointIndex"))
                    -[VKPolylineOverlay createMatchedSegmentAndAddToPaths:section:pathStartIndex:pathEndIndex:shouldGenerateSnapPath:elevationSource:elevationSourceContext:](self, "createMatchedSegmentAndAddToPaths:section:pathStartIndex:pathEndIndex:shouldGenerateSnapPath:elevationSource:elevationSourceContext:", v189, v63, v108, v107, v186, a9, a10);
                }
                if (v68)
                  operator delete(v68);
              }
              v62 = v185 + 1;
              v60 = v180;
              v61 = v179;
            }
            while (v185 + 1 != v181);
            v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v209, v220, 16);
          }
          while (v181);
        }
      }

    }
  }
  v203 = 0;
  v204 = 0;
  v205 = 0;
  if (!v189 || !objc_msgSend(v189, "count"))
    goto LABEL_182;
  v122 = 0;
  v123 = 0;
  v124 = -1;
  while (1)
  {
    v125 = v123;
    if (objc_msgSend(v189, "count") <= (unint64_t)v123)
      break;
    objc_msgSend(v189, "objectAtIndex:", v123);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v126;
    if (v124 > v122)
    {
      v124 = objc_msgSend(v126, "routeStart");
      v122 = objc_msgSend(v127, "routeEnd");
    }
    if (v122 >= objc_msgSend(v127, "routeStart"))
    {
      v122 = objc_msgSend(v127, "routeEnd");
      goto LABEL_162;
    }
    v128 = v204;
    if (v204 >= v205)
    {
      v130 = (char *)v203;
      v131 = v204 - (_BYTE *)v203;
      v132 = (v204 - (_BYTE *)v203) >> 3;
      v133 = v132 + 1;
      if ((unint64_t)(v132 + 1) >> 61)
        abort();
      v134 = v205 - (_BYTE *)v203;
      if ((v205 - (_BYTE *)v203) >> 2 > v133)
        v133 = v134 >> 2;
      if ((unint64_t)v134 >= 0x7FFFFFFFFFFFFFF8)
        v135 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v135 = v133;
      if (v135 >> 61)
        goto LABEL_209;
      v136 = (char *)operator new(8 * v135);
      v137 = (unsigned int *)&v136[8 * v132];
      *v137 = v124;
      v137[1] = v122;
      if (v128 == v130)
      {
        v139 = (unsigned int *)&v136[8 * v132];
      }
      else
      {
        v138 = v128 - 8 - v130;
        if (v138 < 0x58)
        {
          v139 = (unsigned int *)&v136[8 * v132];
          goto LABEL_158;
        }
        v139 = (unsigned int *)&v136[8 * v132];
        if ((unint64_t)(v128 - &v136[v131]) < 0x20)
          goto LABEL_215;
        v140 = (v138 >> 3) + 1;
        v141 = &v136[8 * v132 - 16];
        v142 = v128 - 16;
        v143 = v140 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v144 = *(_OWORD *)v142;
          *((_OWORD *)v141 - 1) = *((_OWORD *)v142 - 1);
          *(_OWORD *)v141 = v144;
          v141 -= 32;
          v142 -= 32;
          v143 -= 4;
        }
        while (v143);
        v139 = &v137[-2 * (v140 & 0x3FFFFFFFFFFFFFFCLL)];
        v128 -= 8 * (v140 & 0x3FFFFFFFFFFFFFFCLL);
        if (v140 != (v140 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_215:
          do
          {
LABEL_158:
            v145 = *((_QWORD *)v128 - 1);
            v128 -= 8;
            *((_QWORD *)v139 - 1) = v145;
            v139 -= 2;
          }
          while (v128 != v130);
        }
      }
      v129 = (char *)(v137 + 2);
      v203 = v139;
      v204 = (char *)(v137 + 2);
      v205 = &v136[8 * v135];
      if (v130)
        operator delete(v130);
      goto LABEL_161;
    }
    *(_DWORD *)v204 = v124;
    *((_DWORD *)v128 + 1) = v122;
    v129 = v128 + 8;
LABEL_161:
    v204 = v129;
    v124 = objc_msgSend(v127, "routeStart");
    v122 = objc_msgSend(v127, "routeEnd");
LABEL_162:

    v123 = v125 + 1;
  }
  v146 = v204;
  if (v204 < v205)
  {
    *(_DWORD *)v204 = v124;
    *((_DWORD *)v146 + 1) = v122;
    v147 = v146 + 8;
    goto LABEL_181;
  }
  v148 = v203;
  v149 = v204 - (_BYTE *)v203;
  v150 = (v204 - (_BYTE *)v203) >> 3;
  v151 = v150 + 1;
  if ((unint64_t)(v150 + 1) >> 61)
    abort();
  v152 = v205 - (_BYTE *)v203;
  if ((v205 - (_BYTE *)v203) >> 2 > v151)
    v151 = v152 >> 2;
  if ((unint64_t)v152 >= 0x7FFFFFFFFFFFFFF8)
    v153 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v153 = v151;
  if (v153 >> 61)
LABEL_209:
    std::__throw_bad_array_new_length[abi:nn180100]();
  v154 = (char *)operator new(8 * v153);
  v155 = (unsigned int *)&v154[8 * v150];
  v156 = &v154[8 * v153];
  *v155 = v124;
  v155[1] = v122;
  v147 = (char *)(v155 + 2);
  if (v146 != v148)
  {
    v157 = v146 - v148 - 8;
    if (v157 < 0x58)
      goto LABEL_216;
    if ((unint64_t)(v146 - &v154[v149]) < 0x20)
      goto LABEL_216;
    v158 = (v157 >> 3) + 1;
    v159 = &v154[8 * v150 - 16];
    v160 = v146 - 16;
    v161 = v158 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v162 = *(_OWORD *)v160;
      *((_OWORD *)v159 - 1) = *((_OWORD *)v160 - 1);
      *(_OWORD *)v159 = v162;
      v159 -= 32;
      v160 -= 32;
      v161 -= 4;
    }
    while (v161);
    v155 -= 2 * (v158 & 0x3FFFFFFFFFFFFFFCLL);
    v146 -= 8 * (v158 & 0x3FFFFFFFFFFFFFFCLL);
    if (v158 != (v158 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_216:
      do
      {
        v163 = *((_QWORD *)v146 - 1);
        v146 -= 8;
        *((_QWORD *)v155 - 1) = v163;
        v155 -= 2;
      }
      while (v146 != v148);
    }
  }
  v203 = v155;
  v204 = v147;
  v205 = v156;
  if (v148)
    operator delete(v148);
LABEL_181:
  v204 = v147;
LABEL_182:
  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  -[GEOComposedRoute sections](self->_composedRoute, "sections");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
  if (v165)
  {
    v166 = *(_QWORD *)v200;
    do
    {
      for (m = 0; m != v165; ++m)
      {
        if (*(_QWORD *)v200 != v166)
          objc_enumerationMutation(v164);
        objc_msgSend(*(id *)(*((_QWORD *)&v199 + 1) + 8 * m), "pathsForRenderRegion:inOverlay:excludedSegments:elevationSource:elevationSourceContext:", v190, self, &v203, a9, a10);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "addObjectsFromArray:", v168);

      }
      v165 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
    }
    while (v165);
  }

  objc_msgSend(v189, "sortUsingComparator:", &__block_literal_global_19248);
  if (v203)
  {
    v204 = (char *)v203;
    operator delete(v203);
  }
  if (__p)
    operator delete(__p);
LABEL_193:
  if (!self->_traffic || -[GEOComposedRoute transportType](self->_composedRoute, "transportType"))
  {
    v20 = v189;
    goto LABEL_196;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  v14 = v189;
  v170 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v191, v217, 16);
  if (v170)
  {
    v171 = *(_QWORD *)v192;
    do
    {
      for (n = 0; n != v170; ++n)
      {
        if (*(_QWORD *)v192 != v171)
          objc_enumerationMutation(v14);
        v173 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * n);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v174 = v173;
          objc_msgSend(v174, "splitTrafficSegmentationAndAddTo:with:shouldSnap:isGradientTraffic:", v20, self->_trafficSegments.__ptr_.__value_, v183, v182);

        }
        else
        {
          objc_msgSend(v20, "addObject:", v173);
        }
      }
      v170 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v191, v217, 16);
    }
    while (v170);
  }

LABEL_13:
LABEL_196:

  return v20;
}

- (BOOL)isSnappingForSceneTiles
{
  id WeakRetained;
  BOOL v3;

  if (!self->_isReadyForSnapping)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);
  v3 = objc_msgSend(WeakRetained, "numPathsMatching") != 0;

  return v3;
}

- (DebugTreeNode)createDebugNode
{
  _QWORD *v1;
  _QWORD *v2;
  DebugTreeNode *v3;
  uint64_t v4;
  unsigned int v5;
  DebugTreeNode *result;
  _QWORD *v7;
  unint64_t v8;
  void ***v9;
  std::string *v10;
  std::string::size_type size;
  std::string::value_type *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void **v20;
  uint64_t v21;
  void *v22;
  void ***v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void **v30;
  _QWORD v32[7];
  int v33;
  _BYTE v34[8];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  std::string v40;
  _DWORD v41[2];
  std::string v42;
  void *v43;
  __int128 v44;
  _BYTE v45[32];
  char v46;
  _QWORD v47[7];
  int v48;
  _BYTE v49[16];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;

  v2 = v1;
  v3 = retstr;
  *(_OWORD *)&retstr[1]._name.__r_.var0 = 0u;
  *(_OWORD *)retstr[2]._name.__r_.__value_.var0.__s.__data_ = 0u;
  *(_OWORD *)&retstr->_name.var0 = 0u;
  *(_OWORD *)&retstr[1]._name.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)retstr->_name.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&retstr->_name.__r_.__value_.var0.__l + 1) = 0u;
  *((_BYTE *)&v42.__r_.__value_.__s + 23) = 17;
  strcpy((char *)&v42, "traffic timestamp");
  objc_msgSend(v1, "trafficTimeStamp");
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v54 = 2;
  v50 = v4;
  gdc::DebugTreeNode::addProperty((uint64_t)v3, (uint64_t)&v42, (uint64_t)v49);
  *((_BYTE *)&v42.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v42, "selected");
  v5 = objc_msgSend(v2, "selected");
  v48 = 0;
  memset(&v47[4], 0, 24);
  v47[0] = v5;
  gdc::DebugTreeNode::addProperty((uint64_t)v3, (uint64_t)&v42, (uint64_t)v47);
  v7 = (_QWORD *)v2[7];
  if (v7)
  {
    v8 = 0;
    v9 = (void ***)((char *)&v44 + 1);
    while (1)
    {
      if (v8 >= (uint64_t)(v7[1] - *v7) >> 3)
        return result;
      std::to_string(&v40, v8);
      v10 = std::string::insert(&v40, 0, "segment ", 8uLL);
      v12 = (std::string::value_type *)v10->__r_.__value_.__r.__words[0];
      size = v10->__r_.__value_.__l.__size_;
      v41[0] = v10->__r_.__value_.__r.__words[2];
      *(_DWORD *)((char *)v41 + 3) = *(_DWORD *)((char *)&v10->__r_.__value_.__r.__words[2] + 3);
      v13 = SHIBYTE(v10->__r_.__value_.__r.__words[2]);
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      if ((v13 & 0x80000000) == 0)
        break;
      std::string::__init_copy_ctor_external(&v42, v12, size);
      LOBYTE(v43) = 0;
      v44 = 0u;
      memset(v45, 0, sizeof(v45));
      v46 = 0;
      operator delete(v12);
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_7;
LABEL_8:
      *((_BYTE *)&v40.__r_.__value_.__s + 23) = 8;
      strcpy((char *)&v40, "distance");
      v14 = *(_QWORD *)v2[7];
      if (v8 >= (*(_QWORD *)(v2[7] + 8) - v14) >> 3)
        abort();
      v15 = *(unsigned int *)(v14 + 8 * v8);
      v37 = 0;
      v38 = 0;
      v36 = 0;
      v39 = 1;
      v35 = v15;
      gdc::DebugTreeNode::addProperty((uint64_t)&v42, (uint64_t)&v40, (uint64_t)v34);
      v16 = (_QWORD *)v2[7];
      *((_BYTE *)&v40.__r_.__value_.__s + 23) = 5;
      strcpy((char *)&v40, "speed");
      v18 = v16;
      v17 = *v16;
      if (v8 >= (v18[1] - v17) >> 3)
        abort();
      v19 = *(unsigned __int8 *)(v17 + 8 * v8 + 4);
      memset(&v32[4], 0, 24);
      v33 = 0;
      v32[0] = v19;
      gdc::DebugTreeNode::addProperty((uint64_t)&v42, (uint64_t)&v40, (uint64_t)v32);
      gdc::DebugTreeNode::addChildNode(v3, (__int128 *)&v42);
      v20 = *(void ***)&v45[9];
      if (*(_QWORD *)&v45[9])
      {
        v21 = *(_QWORD *)&v45[17];
        v22 = *(void **)&v45[9];
        if (*(_QWORD *)&v45[17] != *(_QWORD *)&v45[9])
        {
          v23 = v9;
          do
          {
            v24 = *(_QWORD *)(v21 - 24);
            if (v24)
            {
              v25 = *(_QWORD *)(v21 - 16);
              v26 = *(void **)(v21 - 24);
              if (v25 != v24)
              {
                do
                {
                  if (*(char *)(v25 - 1) < 0)
                    operator delete(*(void **)(v25 - 24));
                  v25 -= 24;
                }
                while (v25 != v24);
                v26 = *(void **)(v21 - 24);
              }
              *(_QWORD *)(v21 - 16) = v24;
              operator delete(v26);
            }
            v27 = *(_QWORD *)(v21 - 48);
            if (v27)
            {
              v28 = *(_QWORD *)(v21 - 40);
              v29 = *(void **)(v21 - 48);
              if (v28 != v27)
              {
                do
                {
                  if (*(char *)(v28 - 9) < 0)
                    operator delete(*(void **)(v28 - 32));
                  v28 -= 64;
                }
                while (v28 != v27);
                v29 = *(void **)(v21 - 48);
              }
              *(_QWORD *)(v21 - 40) = v27;
              operator delete(v29);
            }
            v30 = (void **)(v21 - 80);
            if (*(char *)(v21 - 57) < 0)
              operator delete(*v30);
            v21 -= 80;
          }
          while (v30 != v20);
          v22 = *(void **)&v45[9];
          v9 = v23;
        }
        *(_QWORD *)&v45[17] = v20;
        operator delete(v22);
        v3 = retstr;
      }
      result = (DebugTreeNode *)std::vector<gdc::DebugTreeNode>::~vector[abi:nn180100](v9);
      if ((char)v44 < 0)
      {
        operator delete(v43);
        if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_3;
      }
      else if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_3;
      }
      operator delete(v42.__r_.__value_.__l.__data_);
LABEL_3:
      ++v8;
      v7 = (_QWORD *)v2[7];
    }
    v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v12;
    v42.__r_.__value_.__l.__size_ = size;
    LODWORD(v42.__r_.__value_.__r.__words[2]) = v41[0];
    *(_DWORD *)((char *)&v42.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v41 + 3);
    *((_BYTE *)&v42.__r_.__value_.__s + 23) = v13;
    LOBYTE(v43) = 0;
    v44 = 0u;
    memset(v45, 0, sizeof(v45));
    v46 = 0;
    if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_8;
LABEL_7:
    operator delete(v40.__r_.__value_.__l.__data_);
    goto LABEL_8;
  }
  return result;
}

- (void)composedRoute:(id)a3 selectedSections:(id)a4 deselectedSections:(id)a5
{
  id v7;
  id v8;
  __CFSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_observers;
  v10 = -[__CFSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "polyline:selectedSections:deselectedSections:", self, v7, v8, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[__CFSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (GEOComposedRouteTraffic)traffic
{
  return self->_traffic;
}

- (double)trafficTimeStamp
{
  return self->_trafficTimeStamp;
}

- (VKRouteLine)routeRibbon
{
  return (VKRouteLine *)objc_loadWeakRetained((id *)&self->_routeRibbon);
}

- (VKPolylineOverlayRouteRibbonObserver)routeRibbonObserver
{
  return (VKPolylineOverlayRouteRibbonObserver *)objc_loadWeakRetained((id *)&self->_routeRibbonObserver);
}

- (void)setRouteRibbonObserver:(id)a3
{
  objc_storeWeak((id *)&self->_routeRibbonObserver, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (void)setHasFocus:(BOOL)a3
{
  self->_hasFocus = a3;
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (void)setSkipped:(BOOL)a3
{
  self->_skipped = a3;
}

- (BOOL)showTraffic
{
  return self->_showTraffic;
}

- (void)setShowTraffic:(BOOL)a3
{
  self->_showTraffic = a3;
}

- (void).cxx_destruct
{
  TrafficSegmentsAlongRoute *value;
  void *v4;

  objc_storeStrong((id *)&self->_traffic, 0);
  value = self->_trafficSegments.__ptr_.__value_;
  self->_trafficSegments.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void **)value;
    if (*(_QWORD *)value)
    {
      *((_QWORD *)value + 1) = v4;
      operator delete(v4);
    }
    MEMORY[0x1A1AF4E00](value, 0x20C40960023A9);
  }
  objc_destroyWeak((id *)&self->_routeRibbonObserver);
  objc_destroyWeak((id *)&self->_routeRibbon);
  objc_storeStrong((id *)&self->_composedRoute, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

uint64_t __167__VKPolylineOverlay_getPathsForRenderRegion_shouldSnapToRoads_shouldGenerateSnapPath_verifySnapping_isGradientTraffic_observer_elevationSource_elevationSourceContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "routeStart");
  v9 = objc_msgSend(v7, "routeStart");
  if (v8 < v9
    || (_DWORD)v8 == (_DWORD)v9 && (LODWORD(v10) = HIDWORD(v8), *((float *)&v8 + 1) < *((float *)&v9 + 1)))
  {
    v11 = -1;
  }
  else
  {
    v12 = objc_msgSend(v6, "routeStart", v10);
    v13 = objc_msgSend(v7, "routeStart");
    v14 = fabsf(*((float *)&v12 + 1) - *((float *)&v13 + 1));
    v11 = (_DWORD)v12 != (_DWORD)v13 || v14 >= 0.00000011921;
  }

  return v11;
}

void __153__VKPolylineOverlay_createMatchedSegmentAndAddToPaths_section_pathStartIndex_pathEndIndex_shouldGenerateSnapPath_elevationSource_elevationSourceContext___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_addMatchedSegments:", v4);

  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v6, "setNumPathsMatching:", (unsigned __int16)(objc_msgSend(v6, "numPathsMatching") - 1));

}

@end
