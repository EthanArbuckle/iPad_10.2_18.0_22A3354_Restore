@implementation VKRouteLine

- (VKRouteLine)initWithPolylineOverlay:(id)a3
{
  id v5;
  id v6;
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VKRouteLine;
  v6 = -[VKRouteLine init](&v17, sel_init);
  v7 = (id *)v6;
  if (v6)
  {
    objc_storeStrong((id *)v6 + 24, a3);
    v8 = objc_alloc(MEMORY[0x1E0D27320]);
    objc_msgSend(v7[24], "composedRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithRoute:auditToken:", v9, 0);
    v11 = v7[27];
    v7[27] = (id)v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = v7[29];
    v7[29] = v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = v7[51];
    v7[51] = v14;

  }
  return (VKRouteLine *)v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(*((id *)self + 24), "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearSnappedPathsForObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VKRouteLine;
  -[VKRouteLine dealloc](&v4, sel_dealloc);
}

- (GEOComposedRoute)composedRoute
{
  return (GEOComposedRoute *)objc_msgSend(*((id *)self + 24), "composedRoute");
}

- (void)_addMatchedSegments:(id)a3
{
  id v4;

  v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 416));
  objc_msgSend(*((id *)self + 51), "addObjectsFromArray:", v4);
  std::mutex::unlock((std::mutex *)((char *)self + 416));

}

- (void)_clearMatchedSegments
{
  std::mutex *v3;

  v3 = (std::mutex *)((char *)self + 416);
  std::mutex::lock((std::mutex *)((char *)self + 416));
  objc_msgSend(*((id *)self + 51), "removeAllObjects");
  std::mutex::unlock(v3);
  objc_msgSend(*((id *)self + 29), "removeAllObjects");
}

- (NSArray)matchedSegments
{
  std::mutex *v3;

  v3 = (std::mutex *)((char *)self + 416);
  std::mutex::lock((std::mutex *)((char *)self + 416));
  if (objc_msgSend(*((id *)self + 51), "count"))
  {
    objc_msgSend(*((id *)self + 29), "addObjectsFromArray:", *((_QWORD *)self + 51));
    objc_msgSend(*((id *)self + 51), "removeAllObjects");
  }
  std::mutex::unlock(v3);
  return (NSArray *)*((id *)self + 29);
}

- (void)_updateTilesCovered:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_BYTE *)self + 8))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "matchedPathSegments", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  v11 = (void *)*((_QWORD *)self + 45);
  *((_QWORD *)self + 45) = v5;

}

- (double)_findSimplifiedOffsetFor:(const PolylineCoordinate *)a3 betweenA:(const PolylineCoordinate *)a4 andB:(const PolylineCoordinate *)a5
{
  void *v9;
  void *v10;
  unsigned int index;
  float offset;
  unsigned int v13;
  float v14;
  double v15;
  double v16;
  double result;
  void *v18;
  void *v19;
  unsigned int v20;
  float v21;
  unsigned int v22;
  float v23;
  double v24;
  double v25;

  objc_msgSend(*((id *)self + 24), "composedRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  index = a4->index;
  offset = a4->offset;
  if (offset >= 1.0)
  {
    index += vcvtms_u32_f32(offset);
    offset = offset - floorf(offset);
  }
  v13 = a5->index;
  v14 = a5->offset;
  if (v14 >= 1.0)
  {
    v13 += vcvtms_u32_f32(v14);
    v14 = v14 - floorf(v14);
  }
  objc_msgSend(v9, "distanceBetweenRouteCoordinate:andRouteCoordinate:", index | ((unint64_t)LODWORD(offset) << 32), v13 | ((unint64_t)LODWORD(v14) << 32));
  v16 = v15;

  result = 0.0;
  if (v16 >= 1.0e-10)
  {
    objc_msgSend(*((id *)self + 24), "composedRoute", 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = a4->index;
    v21 = a4->offset;
    if (v21 >= 1.0)
    {
      v20 += vcvtms_u32_f32(v21);
      v21 = v21 - floorf(v21);
    }
    v22 = a3->index;
    v23 = a3->offset;
    if (v23 >= 1.0)
    {
      v22 += vcvtms_u32_f32(v23);
      v23 = v23 - floorf(v23);
    }
    objc_msgSend(v18, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v20 | ((unint64_t)LODWORD(v21) << 32), v22 | ((unint64_t)LODWORD(v23) << 32));
    v25 = v24;

    return v25 / v16;
  }
  return result;
}

- (optional<std::pair<const)_getSnappedSegment:()fast_shared_ptr<md:(mdm:(const PolylineCoordinate *)a4 :MDAllocator>)a3 :RouteLineSection coord:
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  unint64_t v16;
  optional<std::pair<const unsigned int, const unsigned int>> result;

  if (*(_QWORD *)a3._control)
    v6 = *(_QWORD *)a3._control + 8;
  else
    v6 = 0;
  v7 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)v6 + 56))(v6, a2);
  if ((int)v7 < 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      v9 = v7 >> 1;
      v10 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)a3._control + 8) + 48))(*(_QWORD *)a3._control + 8, v8 + (v7 >> 1));
      v11 = *(_DWORD *)(v10 + 12);
      if (v11 < a4->index || v11 == a4->index && *(float *)(v10 + 16) < a4->offset)
      {
        v9 = v7 + ~v9;
        v8 += (v7 >> 1) + 1;
      }
      v7 = v9;
    }
    while (v9 > 0);
  }
  if (*(_QWORD *)a3._control)
    v12 = *(_QWORD *)a3._control + 8;
  else
    v12 = 0;
  v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 56))(v12);
  LODWORD(v14) = v8 - 1;
  if (v8)
    v14 = v14;
  else
    v14 = 0;
  v15 = v13 != v8;
  if (v13 == v8)
    v14 = 0;
  v16 = v14 | ((unint64_t)v8 << 32);
  result.var0 = ($1D584641D81C389A3523C829E496A597)v16;
  result.var1 = v15;
  return result;
}

- (BOOL)buildRouteLine:(id)a3 matchToRoads:(BOOL)a4 shouldGenerateSnapPath:(BOOL)a5 viewUnitsPerPoint:(double)a6 force:(BOOL)a7 boundsInflation:(float)a8 isGradientTraffic:(BOOL)a9 currentLegIndex:(unsigned int)a10 elevationSource:(void *)a11 elevationSourceContext:(void *)a12
{
  _BOOL8 v12;
  _BOOL8 v16;
  int v17;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  BOOL v31;
  _QWORD *v32;
  BOOL v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  unsigned __int8 v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  double v45;
  long double v46;
  long double v47;
  long double v48;
  long double v49;
  long double v50;
  long double v51;
  long double v52;
  double v53;
  long double v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  char *v73;
  char *v74;
  _QWORD *v75;
  _QWORD *v76;
  unsigned __int8 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  unsigned __int8 v85;
  uint64_t v87;
  uint64_t v88;
  id v90;
  _QWORD v91[11];
  unsigned int v92;
  BOOL v93;
  _QWORD v94[4];
  _QWORD v95[8];
  _QWORD v96[7];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  uint64_t (*v101)(uint64_t);
  const char *v102;
  _QWORD *v103;
  _QWORD v104[9];
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  _QWORD v111[5];
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  __n128 (*v115)(__n128 *, __n128 *);
  void (*v116)(uint64_t);
  const char *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;

  v12 = a9;
  v16 = a5;
  v17 = a4;
  v20 = a3;
  if (!*((_BYTE *)self + 8))
  {
    objc_msgSend(*((id *)self + 24), "composedRoute");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clearSnappedPathsForObserver:", self);

  }
  -[VKRouteLine composedRoute](self, "composedRoute");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "revisionIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v23;
  v24 = geo::_retain_ptr<NSUUID * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)self + 42), &v121);

  if ((v24 & 1) == 0)
  {
    -[VKRouteLine composedRoute](self, "composedRoute");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "revisionIdentifier");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      v28 = v26;
    v29 = (void *)*((_QWORD *)self + 42);
    *((_QWORD *)self + 42) = v27;

    a7 = 1;
  }
  v30 = *((id *)self + 46);
  objc_storeStrong((id *)self + 46, a3);
  v90 = v30;
  if (a7
    || *((unsigned __int8 *)self + 8) != v17
    || (objc_msgSend(v30, "isEquivalentToNewRegion:", *((_QWORD *)self + 46)) & 1) == 0)
  {
    *((_BYTE *)self + 8) = v17;
    v32 = (_QWORD *)*((_QWORD *)self + 38);
    if (v32)
    {
      v33 = (*v32)-- == 1;
      if (v33)
      {
        md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v32 + 1));
        {
          v87 = operator new();
          mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v87, "VectorKitLabels", 0x5ED09DD50000000FLL);
        }
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *((_QWORD *)self + 38), 424);
      }
    }
    *((_QWORD *)self + 38) = 0;
    *((_QWORD *)self + 39) = 0xBF80000000000000;
    v35 = *((_QWORD *)self + 35);
    v36 = *((_QWORD *)self + 36);
    v31 = v35 != v36;
    if (v35 != v36)
    {
      v37 = *((_QWORD *)self + 36);
      do
      {
        v39 = *(_QWORD **)(v37 - 8);
        v37 -= 8;
        v38 = v39;
        if (v39)
        {
          v33 = (*v38)-- == 1;
          if (v33)
          {
            md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v38 + 1));
            {
              v41 = operator new();
              mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v41, "VectorKitLabels", 0x5ED09DD50000000FLL);
            }
            (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *(_QWORD *)(v36 - 8), 424);
            *(_QWORD *)(v36 - 8) = 0;
          }
        }
        v36 = v37;
      }
      while (v37 != v35);
    }
    *((_QWORD *)self + 36) = v35;
    v30 = v90;
    if (objc_msgSend(*((id *)self + 24), "containsTransit"))
    {
      +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "dontVerifyRouteToTransitSnapping") ^ 1;

    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(*((id *)self + 24), "getPathsForRenderRegion:shouldSnapToRoads:shouldGenerateSnapPath:verifySnapping:isGradientTraffic:observer:elevationSource:elevationSourceContext:", *((_QWORD *)self + 46), *((unsigned __int8 *)self + 8), v16, v43, v12, self, a11, a12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v44, "count"))
      goto LABEL_67;
    *(float *)&v45 = a8;
    -[VKRouteLine _updateBounds:boundsInflation:](self, "_updateBounds:boundsInflation:", v44, v45);
    -[VKRouteLine _updateTilesCovered:](self, "_updateTilesCovered:", v44);
    v46 = exp((*((double *)self + 6) + *((double *)self + 3)) * 3.14159265 + -3.14159265);
    v47 = atan(v46) * 114.591559 + -90.0;
    v48 = cos(v47 * 0.034906585) * -559.82 + 111132.92;
    v49 = v48 + cos(v47 * 0.0698131701) * 1.175;
    v50 = v49 + cos(v47 * 0.104719755) * -0.0023;
    v51 = v47 * 0.00872664626;
    v52 = tan(v47 * 0.00872664626 + 0.78103484);
    v53 = log(v52);
    v54 = tan(v51 + 0.789761487);
    *((long double *)self + 26) = v50 * a6 / fabs((log(v54) - v53) * 0.159154943);
    *((double *)self + 33) = a6 / (*((double *)self + 5) - *((double *)self + 2));
    v112 = 0;
    v113 = &v112;
    v114 = 0x4812000000;
    v115 = __Block_byref_object_copy__18077;
    v116 = __Block_byref_object_dispose__18078;
    v117 = "";
    v118 = 0;
    v55 = MEMORY[0x1E0C809B0];
    v119 = 0;
    v120 = 0;
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke;
    v111[3] = &unk_1E42F34E0;
    v111[4] = &v112;
    forEachNodeInSortedPaths(v44, v111);
    v56 = v113[7] - v113[6];
    v57 = v56 >> 3;
    v58 = (char *)*((_QWORD *)self + 35);
    if (v56 >> 3 <= (unint64_t)((uint64_t)(*((_QWORD *)self + 37) - (_QWORD)v58) >> 3))
    {
LABEL_54:
      -[VKRouteLine setHasNewRoadMatches:](self, "setHasNewRoadMatches:", 0);
      v105 = 0;
      v106 = &v105;
      v107 = 0x3032000000;
      v108 = __Block_byref_object_copy__11;
      v109 = __Block_byref_object_dispose__12;
      v110 = 0;
      v104[0] = 0;
      v104[1] = v104;
      v104[2] = 0x4812000000;
      v104[3] = __Block_byref_object_copy__13;
      v104[4] = __Block_byref_object_dispose__14;
      v104[5] = "";
      v97 = 0;
      v98 = &v97;
      v99 = 0x3812000000;
      v100 = __Block_byref_object_copy__16_18081;
      v101 = __Block_byref_object_dispose__17_18082;
      v102 = "";
      v103 = 0;
      v96[0] = 0;
      v96[1] = v96;
      v96[2] = 0x3812000000;
      v96[3] = __Block_byref_object_copy__19;
      v96[4] = __Block_byref_object_dispose__20;
      v79 = v113[6];
      v96[5] = "";
      v96[6] = v79;
      v95[0] = 0;
      v95[1] = v95;
      v95[2] = 0x4012000000;
      v95[3] = __Block_byref_object_copy__22;
      v95[4] = __Block_byref_object_dispose__23;
      v95[5] = "";
      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x2020000000;
      v94[3] = 0;
      v91[0] = v55;
      v91[1] = 3221225472;
      v91[2] = __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke_25;
      v91[3] = &unk_1E42F3508;
      v91[4] = self;
      v91[5] = &v105;
      v92 = a10;
      v91[6] = v95;
      v91[7] = &v97;
      v93 = v12;
      v91[8] = v94;
      v91[9] = v96;
      v91[10] = v104;
      forEachNodeInSortedPaths(v44, v91);
      v30 = v90;
      if (v98[6])
      {
        v80 = objc_msgSend((id)v106[5], "routeEnd");
        v81 = v98[6];
        if (v81)
          v82 = v81 + 8;
        else
          v82 = 0;
        *(_QWORD *)(v82 + 120) = v80;
      }
      objc_msgSend(*((id *)self + 24), "trafficTimeStamp");
      *((_QWORD *)self + 44) = v83;
      *((double *)self + 50) = a6;
      _Block_object_dispose(v94, 8);
      _Block_object_dispose(v95, 8);
      _Block_object_dispose(v96, 8);
      _Block_object_dispose(&v97, 8);
      v84 = v103;
      if (v103)
      {
        v33 = (*v103)-- == 1;
        if (v33)
        {
          md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v84 + 1));
          {
            v88 = operator new();
            mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v88, "VectorKitLabels", 0x5ED09DD50000000FLL);
          }
          (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v103, 424);
        }
      }
      _Block_object_dispose(v104, 8);
      _Block_object_dispose(&v105, 8);

      _Block_object_dispose(&v112, 8);
      if (v118)
      {
        v119 = v118;
        operator delete(v118);
      }
      v31 = 1;
LABEL_67:

      goto LABEL_68;
    }
    if (v56 < 0)
      abort();
    v59 = (char *)*((_QWORD *)self + 36);
    v60 = (char *)operator new(v56);
    v61 = v59 - v58;
    v62 = (unint64_t)&v60[(v59 - v58) & 0xFFFFFFFFFFFFFFF8];
    v63 = &v60[8 * v57];
    if (v59 == v58)
    {
      *((_QWORD *)self + 35) = v62;
      *((_QWORD *)self + 36) = v62;
      *((_QWORD *)self + 37) = v63;
LABEL_52:
      if (v58)
        operator delete(v58);
      goto LABEL_54;
    }
    v64 = v59 - v58 - 8;
    if (v64 > 0x77)
    {
      if (&v60[(v61 & 0xFFFFFFFFFFFFFFF8) - (v64 & 0xFFFFFFFFFFFFFFF8) - 8] >= v59
        || (v65 = &v60[(v59 - v58) & 0xFFFFFFFFFFFFFFF8],
            (unint64_t)&v59[-(v64 & 0xFFFFFFFFFFFFFFF8) - 8] >= v62))
      {
        v66 = v61 >> 3;
        v67 = (v64 >> 3) + 1;
        v68 = &v60[8 * v66 - 16];
        v69 = v59 - 32;
        v70 = v67 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v71 = *((_OWORD *)v69 + 1);
          *((_OWORD *)v68 - 1) = *(_OWORD *)v69;
          *(_OWORD *)v68 = v71;
          *(_OWORD *)v69 = 0uLL;
          *((_OWORD *)v69 + 1) = 0uLL;
          v69 -= 32;
          v68 -= 32;
          v70 -= 4;
        }
        while (v70);
        v65 = (char *)(v62 - 8 * (v67 & 0x3FFFFFFFFFFFFFFCLL));
        v59 -= 8 * (v67 & 0x3FFFFFFFFFFFFFFCLL);
        if (v67 == (v67 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_42:
          v58 = (char *)*((_QWORD *)self + 35);
          v73 = (char *)*((_QWORD *)self + 36);
          *((_QWORD *)self + 35) = v65;
          *((_QWORD *)self + 36) = v62;
          *((_QWORD *)self + 37) = v63;
          if (v73 != v58)
          {
            v74 = v73;
            do
            {
              v76 = (_QWORD *)*((_QWORD *)v74 - 1);
              v74 -= 8;
              v75 = v76;
              if (v76)
              {
                v33 = (*v75)-- == 1;
                if (v33)
                {
                  md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v75 + 1));
                  {
                    v78 = operator new();
                    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v78, "VectorKitLabels", 0x5ED09DD50000000FLL);
                  }
                  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                   + 40))(mdm::Allocator::instance(void)::alloc, *((_QWORD *)v73 - 1), 424);
                  *((_QWORD *)v73 - 1) = 0;
                }
              }
              v73 = v74;
            }
            while (v74 != v58);
          }
          goto LABEL_52;
        }
      }
    }
    else
    {
      v65 = &v60[(v59 - v58) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v72 = *((_QWORD *)v59 - 1);
      v59 -= 8;
      *((_QWORD *)v65 - 1) = v72;
      v65 -= 8;
      *(_QWORD *)v59 = 0;
    }
    while (v59 != v58);
    goto LABEL_42;
  }
  v31 = 0;
LABEL_68:

  return v31;
}

- (void)generateArrowsForManeuverDisplayMode:(int)a3 routeLineWidth:(double)a4 collideTrafficFeatures:(const void *)a5
{
  VKRouteLine *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  char v12;
  char v13;
  _QWORD *v14;
  void *v15;
  float v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  float *v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  int v29;
  _QWORD *v30;
  unsigned int v31;
  unsigned int v32;
  unint64_t v33;
  unint64_t v34;
  _DWORD *v35;
  _DWORD *v36;
  unsigned int v37;
  _DWORD *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  __int128 v47;
  __int128 v48;
  BOOL v49;
  unsigned __int8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  float *v54;
  uint64_t v55;
  float v56;
  _DWORD *v57;
  unint64_t v58;
  float v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  unsigned int v63;
  uint64_t *v64;
  unsigned int v65;
  char v66;
  unint64_t v67;
  unsigned int *v68;
  _DWORD *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  char *v73;
  char *v74;
  char *v75;
  __int128 v76;
  __int128 v77;
  unsigned __int8 v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  float *v83;
  uint64_t v84;
  float v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  unsigned int v89;
  mdm::Allocator *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  VKRouteLine *v94;
  VKRouteLine *v95;
  unint64_t v96;
  int v97;
  _QWORD *v98;
  int v99;
  unsigned int v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  _QWORD *v105;
  _QWORD *v106;

  v8 = self;
  objc_msgSend(*((id *)self + 24), "composedRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentDisplayStep");

  objc_msgSend(*((id *)v8 + 24), "composedRoute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "maneuverDisplayEnabled");

  v13 = v12 ^ 1;
  if (!a3)
    v13 = 1;
  if ((v13 & 1) != 0)
    return;
  v14 = (_QWORD *)((char *)v8 + 376);
  objc_msgSend(*((id *)v8 + 24), "composedRoute");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *((double *)v8 + 26);
  v17 = a4;
  md::ManeuverArrowCoordinates::update((_QWORD *)v8 + 47, v15, a5, v10, v16, v17);

  if (a3 == 1)
  {
    v52 = *((_QWORD *)v8 + 47);
    v53 = *((_QWORD *)v8 + 48);
    if (v53 == v52)
      return;
    v54 = (float *)(v52 + 20 * v10);
    v55 = *(unsigned int *)v54;
    v56 = v54[1];
    v57 = (_DWORD *)*((_QWORD *)v54 + 1);
    v106 = v57;
    if (!*((_BYTE *)v54 + 16))
    {
      v58 = 0;
LABEL_115:
      v80 = v10 + 1;
      if (0xCCCCCCCCCCCCCCCDLL * ((v53 - v52) >> 2) > v80)
      {
        v81 = *((_QWORD *)v8 + 35);
        if (v58 < (*((_QWORD *)v8 + 36) - v81) >> 3)
        {
          v82 = *(_QWORD **)(v81 + 8 * v58);
          v105 = v82;
          if (v82)
            ++*v82;
          v83 = (float *)(v52 + 20 * v80);
          if (*((_BYTE *)v83 + 16))
          {
            v84 = *(unsigned int *)v83;
            v85 = v83[1];
            v86 = *((_QWORD *)v83 + 1);
            v87 = v82 ? (uint64_t)(v82 + 1) : 0;
            v88 = *(_DWORD *)(v87 + 112);
            if (v84 > v88 || (_DWORD)v84 == v88 && v85 >= *(float *)(v87 + 116))
            {
              v89 = *(_DWORD *)(v87 + 120);
              if (v84 < v89 || (_DWORD)v84 == v89 && v85 <= *(float *)(v87 + 124))
              {
                if (v89 <= v86 && (v89 != (_DWORD)v86 || *(float *)(v87 + 124) < *((float *)&v86 + 1)))
                  v86 = *(_QWORD *)(v87 + 120);
                v100 = v10 + 1;
                v101 = v84 | ((unint64_t)LODWORD(v85) << 32);
                v102 = v86;
                v103 = 0xBF80000000000000;
                v104 = 0xBF80000000000000;
                md::RouteLineSection::pushArrow((_QWORD *)v87, (__int128 *)&v100);
              }
            }
          }
          if (v82)
          {
            v49 = (*v82)-- == 1;
            if (v49)
            {
              md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v82 + 1));
              v91 = mdm::Allocator::instance(v90);
              (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v91 + 40))(v91, v82, 424);
            }
          }
        }
      }
      return;
    }
    v58 = 0;
    v59 = *((float *)&v57 + 1);
    v93 = v55 | ((unint64_t)LODWORD(v56) << 32);
    v95 = v8;
    v97 = v55;
    v99 = (int)v57;
    while (1)
    {
      v60 = *((_QWORD *)v8 + 35);
      if (v58 >= (*((_QWORD *)v8 + 36) - v60) >> 3)
      {
LABEL_113:
        v52 = *((_QWORD *)v8 + 47);
        v53 = *((_QWORD *)v8 + 48);
        goto LABEL_115;
      }
      v61 = *(_QWORD **)(v60 + 8 * v58);
      v105 = v61;
      if (v61)
      {
        ++*v61;
        v62 = v61 + 1;
      }
      else
      {
        v62 = 0;
      }
      v63 = *((_DWORD *)v62 + 28);
      if (v55 > v63 || (_DWORD)v55 == v63 && v56 >= *((float *)v62 + 29))
      {
        v64 = v62 + 15;
        v65 = *((_DWORD *)v62 + 30);
        if (v55 < v65 || (_DWORD)v55 == v65 && v56 <= *((float *)v62 + 31))
          break;
      }
      ++v58;
      v66 = 1;
      if (v61)
        goto LABEL_108;
LABEL_69:
      if ((v66 & 1) == 0)
        goto LABEL_113;
    }
    if (v65 > v57 || v65 == (_DWORD)v57 && *((float *)v62 + 31) >= v59)
      v64 = (uint64_t *)&v106;
    v55 = *v64;
    v68 = (unsigned int *)v62[5];
    v67 = v62[6];
    if ((unint64_t)v68 >= v67)
    {
      v69 = (_DWORD *)v62[4];
      v70 = 0x8E38E38E38E38E39 * (v68 - v69) + 1;
      if (v70 > 0x71C71C71C71C71CLL)
        abort();
      v71 = 0x8E38E38E38E38E39 * ((uint64_t)(v67 - (_QWORD)v69) >> 2);
      if (2 * v71 > v70)
        v70 = 2 * v71;
      if (v71 >= 0x38E38E38E38E38ELL)
        v72 = 0x71C71C71C71C71CLL;
      else
        v72 = v70;
      if (v72)
      {
        if (v72 > 0x71C71C71C71C71CLL)
LABEL_140:
          std::__throw_bad_array_new_length[abi:nn180100]();
        v73 = (char *)operator new(36 * v72);
      }
      else
      {
        v73 = 0;
      }
      v74 = &v73[4 * (v68 - v69)];
      *(_DWORD *)v74 = v10;
      *(_QWORD *)(v74 + 4) = v93;
      *(_QWORD *)(v74 + 12) = v55;
      *(_QWORD *)(v74 + 20) = 0xBF80000000000000;
      *(_QWORD *)(v74 + 28) = 0xBF80000000000000;
      v75 = v74;
      if (v68 == v69)
      {
        LODWORD(v55) = v97;
      }
      else
      {
        LODWORD(v55) = v97;
        do
        {
          v76 = *(_OWORD *)(v68 - 9);
          v77 = *(_OWORD *)(v68 - 5);
          *((_DWORD *)v75 - 1) = *(v68 - 1);
          *(_OWORD *)(v75 - 20) = v77;
          *(_OWORD *)(v75 - 36) = v76;
          v75 -= 36;
          v68 -= 9;
        }
        while (v68 != v69);
        v68 = (unsigned int *)v62[4];
      }
      v57 = v74 + 36;
      v62[4] = v75;
      v62[5] = v74 + 36;
      v62[6] = &v73[36 * v72];
      if (v68)
        operator delete(v68);
      v8 = v95;
    }
    else
    {
      *v68 = v10;
      *(_QWORD *)(v68 + 1) = v93;
      *(_QWORD *)(v68 + 3) = v55;
      *(_QWORD *)(v68 + 5) = 0xBF80000000000000;
      v57 = v68 + 9;
      *(_QWORD *)(v68 + 7) = 0xBF80000000000000;
      LODWORD(v55) = v97;
    }
    v66 = 0;
    v62[5] = v57;
    LODWORD(v57) = v99;
    if (!v61)
      goto LABEL_69;
LABEL_108:
    v49 = (*v61)-- == 1;
    if (v49)
    {
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v61 + 1));
      {
        v79 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v79, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v61, 424);
    }
    goto LABEL_69;
  }
  if (a3 == 2)
  {
    v18 = *((_QWORD *)v8 + 35);
    if (*((_QWORD *)v8 + 36) != v18)
    {
      v20 = *((_QWORD *)v8 + 47);
      v19 = *((_QWORD *)v8 + 48);
      if (v19 != v20)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0xCCCCCCCCCCCCCCCDLL * ((v19 - v20) >> 2);
        v96 = v23;
        v98 = (_QWORD *)((char *)v8 + 376);
        v94 = v8;
        do
        {
          v24 = *(_QWORD **)(v18 + 8 * v21);
          v106 = v24;
          if (v24)
            ++*v24;
          v25 = (float *)(*v14 + 20 * v22);
          v26 = *(unsigned int *)v25;
          v27 = v25[1];
          v28 = *((_QWORD *)v25 + 1);
          v29 = *((unsigned __int8 *)v25 + 16);
          if (v24)
            v30 = v24 + 1;
          else
            v30 = 0;
          v31 = *((_DWORD *)v30 + 28);
          if ((v26 > v31 || (_DWORD)v26 == v31 && v27 >= *((float *)v30 + 29))
            && ((v32 = *((_DWORD *)v30 + 30), v26 < v32)
             || (_DWORD)v26 == v32 && v27 <= *((float *)v30 + 31)))
          {
            if (v29)
            {
              if (v32 <= v28 && (v32 != (_DWORD)v28 || *((float *)v30 + 31) < *((float *)&v28 + 1)))
                v28 = v30[15];
              v33 = v26 | ((unint64_t)LODWORD(v27) << 32);
              v35 = (_DWORD *)v30[5];
              v34 = v30[6];
              if ((unint64_t)v35 >= v34)
              {
                v38 = (_DWORD *)v30[4];
                v39 = 0x8E38E38E38E38E39 * (v35 - v38) + 1;
                if (v39 > 0x71C71C71C71C71CLL)
                  abort();
                v40 = 0x8E38E38E38E38E39 * ((uint64_t)(v34 - (_QWORD)v38) >> 2);
                if (2 * v40 > v39)
                  v39 = 2 * v40;
                if (v40 >= 0x38E38E38E38E38ELL)
                  v41 = 0x71C71C71C71C71CLL;
                else
                  v41 = v39;
                if (v41)
                {
                  v92 = v21;
                  if (v41 > 0x71C71C71C71C71CLL)
                    goto LABEL_140;
                  v42 = v33;
                  v43 = v41;
                  v44 = (char *)operator new(36 * v41);
                  v41 = v43;
                  v33 = v42;
                  v21 = v92;
                }
                else
                {
                  v44 = 0;
                }
                v45 = &v44[4 * (v35 - v38)];
                *(_DWORD *)v45 = v22;
                *(_QWORD *)(v45 + 4) = v33;
                *(_QWORD *)(v45 + 12) = v28;
                *(_QWORD *)(v45 + 20) = 0xBF80000000000000;
                *(_QWORD *)(v45 + 28) = 0xBF80000000000000;
                v46 = v45;
                if (v35 == v38)
                {
                  v14 = v98;
                }
                else
                {
                  v14 = v98;
                  do
                  {
                    v47 = *(_OWORD *)(v35 - 9);
                    v48 = *(_OWORD *)(v35 - 5);
                    *((_DWORD *)v46 - 1) = *(v35 - 1);
                    *(_OWORD *)(v46 - 20) = v48;
                    *(_OWORD *)(v46 - 36) = v47;
                    v46 -= 36;
                    v35 -= 9;
                  }
                  while (v35 != v38);
                  v35 = (_DWORD *)v30[4];
                }
                v36 = v45 + 36;
                v30[4] = v46;
                v30[5] = v45 + 36;
                v30[6] = &v44[36 * v41];
                v8 = v94;
                if (v35)
                  operator delete(v35);
              }
              else
              {
                *v35 = v22;
                *(_QWORD *)(v35 + 1) = v33;
                *(_QWORD *)(v35 + 3) = v28;
                *(_QWORD *)(v35 + 5) = 0xBF80000000000000;
                v36 = v35 + 9;
                *(_QWORD *)(v35 + 7) = 0xBF80000000000000;
                v14 = v98;
              }
              v30[5] = v36;
              v23 = v96;
            }
          }
          else
          {
            v37 = *((_DWORD *)v30 + 30);
            if (v26 > v37 || (_DWORD)v26 == v37 && v27 > *((float *)v30 + 31))
            {
              ++v21;
              goto LABEL_55;
            }
            if (v26 >= v31 && ((_DWORD)v26 != v31 || v27 >= *((float *)v30 + 29)))
              goto LABEL_55;
          }
          ++v22;
LABEL_55:
          if (v24)
          {
            v49 = (*v24)-- == 1;
            if (v49)
            {
              md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v24 + 1));
              {
                v51 = operator new();
                mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v51, "VectorKitLabels", 0x5ED09DD50000000FLL);
              }
              (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                 + 40))(mdm::Allocator::instance(void)::alloc, v24, 424);
            }
          }
          v18 = *((_QWORD *)v8 + 35);
        }
        while (v21 < (*((_QWORD *)v8 + 36) - v18) >> 3 && v22 < v23);
      }
    }
  }
}

- (void)createMeshIfNecessary:(int64_t)a3
{
  id WeakRetained;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__VKRouteLine_createMeshIfNecessary___block_invoke;
  v5[3] = &unk_1E42F3530;
  v5[4] = self;
  v5[5] = a3;
  -[VKRouteLine forEachSection:](self, "forEachSection:", v5);
  WeakRetained = objc_loadWeakRetained((id *)self + 34);
  objc_msgSend(WeakRetained, "routeLineDidUpdateSections:", self);

}

- (BOOL)isTrafficUpToDate
{
  double v2;
  double v3;

  v2 = *((double *)self + 44);
  objc_msgSend(*((id *)self + 24), "trafficTimeStamp");
  return v2 >= v3;
}

- (BOOL)isTrafficUptoDate:(double)a3
{
  double v4;

  objc_msgSend(*((id *)self + 24), "trafficTimeStamp");
  return v4 <= a3;
}

- (BOOL)needsUpdateForViewingScale:(double)a3
{
  double v4;
  float v5;
  float v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  void *v10;
  void *v12;

  v4 = *((double *)self + 50);
  if (v4 == 0.0)
  {
    v7 = 1;
  }
  else
  {
    v5 = (v4 - a3) / v4;
    v6 = fabsf(v5);
    if (v4 >= a3)
      v7 = v6 > 0.45;
    else
      v7 = v6 > 1.0;
  }
  if (-[VKRouteLine isTrafficUpToDate](self, "isTrafficUpToDate")
    && !-[VKRouteLine hasNewRoadMatches](self, "hasNewRoadMatches"))
  {
    -[VKRouteLine composedRoute](self, "composedRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "revisionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v8 = geo::_retain_ptr<NSUUID * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)self + 42), &v12) ^ 1 | v7;

  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (optional<VKRouteLineSnapResult>)snapRouteMatch:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unsigned int v32;
  optional<VKRouteLineSnapResult> *result;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  double v46;
  double v47;
  double v49;
  double v50;
  long double v52;
  long double v57;
  double v58;
  long double v59;
  double v60;
  double v61;
  NSObject *v62;
  int v63;
  double v64;
  double v65;
  double v66;
  double v67;
  int v68;
  double v69;
  double v70;
  double v71;
  double v72;
  float v73;
  float v74;
  float v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  float64x2_t v84;
  float64x2_t v85;
  double v86;
  float64x2_t v87;
  double v88;
  float64x2_t v89;
  float64x2_t v90;
  double v91;
  float64x2_t v92;
  VKRouteLine *v93;
  uint64_t v94;
  _BYTE buf[28];
  __int16 v96;
  _BYTE v97[18];
  double v98;
  double v99;
  _BYTE v100[30];
  __int16 v101;
  float64x2_t v102;
  double v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  double v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_41;
  objc_msgSend(v6, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_41;
  objc_msgSend(v7, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueRouteID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRouteLine overlay](self, "overlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composedRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueRouteID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isEqual:", v13);

  if ((v14 & 1) == 0
    || (objc_msgSend(v7, "locationCoordinate3D"),
        objc_msgSend(v7, "locationCoordinate3D"),
        v15 = objc_msgSend(v7, "routeCoordinate"),
        v93 = self,
        v94 = v15,
        v17 = (_QWORD *)*((_QWORD *)self + 35),
        v16 = (_QWORD *)*((_QWORD *)self + 36),
        v17 == v16))
  {
LABEL_41:
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    goto LABEL_42;
  }
  while (1)
  {
    v18 = *v17 ? *v17 + 8 : 0;
    if ((unint64_t)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v18 + 56))(v18) > 1)
      break;
    if (GEOGetVectorKitVKRouteLineLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKRouteLineLog(void)::onceToken, &__block_literal_global_18070);
    v19 = GEOGetVectorKitVKRouteLineLog(void)::log;
    if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKRouteLineLog(void)::log, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v20 = v19;
    v21 = "[RouteSnapping] Not enough vertices";
LABEL_6:
    _os_log_impl(&dword_19F029000, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
LABEL_7:
    if (++v17 == v16)
      goto LABEL_41;
  }
  v22 = *v17 + 8;
  if (!*v17)
    v22 = 0;
  v23 = *(_DWORD *)(v22 + 112);
  if (v23 > v15
    || v23 == (_DWORD)v15 && *(float *)(v22 + 116) > *((float *)&v15 + 1)
    || (v24 = *(_DWORD *)(v22 + 120), v24 < v15)
    || v24 == (_DWORD)v15 && *(float *)(v22 + 124) < *((float *)&v15 + 1))
  {
    if (GEOGetVectorKitVKRouteLineLog(void)::onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKRouteLineLog(void)::onceToken, &__block_literal_global_18070);
    v25 = GEOGetVectorKitVKRouteLineLog(void)::log;
    if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKRouteLineLog(void)::log, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v20 = v25;
    v21 = "[RouteSnapping] Section not contained";
    goto LABEL_6;
  }
  v26 = *(_QWORD *)(v22 + 8);
  v27 = *(_QWORD *)(v22 + 16);
  if (v27 == v26)
  {
    v29 = v26;
  }
  else
  {
    v28 = 0xAAAAAAAAAAAAAAABLL * ((v27 - v26) >> 4);
    v29 = v26;
    do
    {
      v30 = v28 >> 1;
      v31 = v29 + 48 * (v28 >> 1);
      v32 = *(_DWORD *)(v31 + 12);
      if (v32 < v15
        || (v32 == (_DWORD)v15 ? (_NF = *(float *)(v31 + 16) < *((float *)&v15 + 1)) : (_NF = 0), _NF))
      {
        v29 = v31 + 48;
        v30 = v28 + ~v30;
      }
      v28 = v30;
    }
    while (v30);
  }
  if (v29 == v27)
    goto LABEL_7;
  if (v29 == v26)
    v35 = 0;
  else
    v35 = -1;
  v36 = v29 + 48 * v35;
  -[VKRouteLine _findSimplifiedOffsetFor:betweenA:andB:](v93, "_findSimplifiedOffsetFor:betweenA:andB:", &v94, v36 + 12, v29 + 12);
  v38 = v37;
  v39 = *(float *)v36;
  v40 = *(float *)(v36 + 4);
  v41 = *(float *)(v36 + 8);
  v42 = *(float *)v29;
  v43 = *(float *)(v29 + 4);
  v44 = *(float *)(v29 + 8);
  -[VKRouteLine maneuverTransform](v93, "maneuverTransform");
  v45 = v38;
  v46 = (float)(v39 + (float)((float)(v42 - v39) * v45));
  v47 = (float)(v40 + (float)((float)(v43 - v40) * v45));
  v91 = (float)(v41 + (float)((float)(v44 - v41) * v45));
  _Q3 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v102, *(float64x2_t *)buf, v46), *(float64x2_t *)&v97[2], v47), *(float64x2_t *)v100, v91);
  v86 = v46;
  v88 = v47;
  v49 = v103 + *(double *)&buf[16] * v46 + v98 * v47;
  v50 = *(double *)&v100[16];
  _D9 = 0x401921FB54442D18;
  v52 = 6.28318531 * _Q3.f64[0];
  v90 = _Q3;
  __asm { FMLA            D0, D9, V3.D[1]; __x }
  v57 = exp(_D0);
  v58 = atan(v57);
  v59 = fmod(v52, 6.28318531);
  v60 = fmod(v59 + 6.28318531, 6.28318531);
  if (GEOGetVectorKitVKRouteLineLog(void)::onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKRouteLineLog(void)::onceToken, &__block_literal_global_18070);
  v61 = v49 + v50 * v91;
  v62 = GEOGetVectorKitVKRouteLineLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKRouteLineLog(void)::log, OS_LOG_TYPE_INFO))
  {
    v63 = *(_DWORD *)(v36 + 12);
    v64 = *(float *)(v29 + 48 * v35 + 16);
    v65 = *(float *)v36;
    v66 = *(float *)(v36 + 4);
    v67 = *(float *)(v36 + 8);
    v68 = *(_DWORD *)(v29 + 12);
    v69 = *(float *)(v29 + 16);
    v70 = *(float *)v29;
    v71 = *(float *)(v29 + 4);
    v72 = *(float *)(v29 + 8);
    *(_DWORD *)buf = 67113729;
    *(_DWORD *)&buf[4] = v63;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v64;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v65;
    v96 = 2048;
    *(double *)v97 = v66;
    *(_WORD *)&v97[8] = 2048;
    *(double *)&v97[10] = v67;
    LOWORD(v98) = 1024;
    *(_DWORD *)((char *)&v98 + 2) = v68;
    HIWORD(v98) = 2048;
    v99 = v69;
    *(_WORD *)v100 = 2048;
    *(double *)&v100[2] = v70;
    *(_WORD *)&v100[10] = 2048;
    *(double *)&v100[12] = v71;
    *(_WORD *)&v100[20] = 2048;
    *(double *)&v100[22] = v72;
    v101 = 2048;
    v102.f64[0] = v45;
    LOWORD(v102.f64[1]) = 1024;
    *(_DWORD *)((char *)&v102.f64[1] + 2) = v94;
    HIWORD(v102.f64[1]) = 2048;
    v103 = *((float *)&v94 + 1);
    v104 = 2048;
    v105 = v86;
    v106 = 2048;
    v107 = v88;
    v108 = 2048;
    v109 = v91;
    v110 = 2049;
    v111 = v58 * 114.591559 + -90.0;
    v112 = 2049;
    v113 = v60 * 57.2957795 + -180.0;
    v114 = 2049;
    v115 = v49 + v50 * v91;
    _os_log_impl(&dword_19F029000, v62, OS_LOG_TYPE_INFO, "[RouteSnapping] Segment matched: point0 routeIndexAndOffset: (%d, %f), position: (%f, %f, %f) | point1 routeIndexAndOffset: (%d, %f) position: (%f %f %f) |  offset %f | routeCoordinate: (%d, %f) | localResult (%f, %f, %f) | worldResultCoordinate (%{private}f, %{private}f, %{private}f)\n", buf, 0xB4u);
  }
  -[VKRouteLine maneuverTransform](v93, "maneuverTransform");
  v73 = *(float *)v36;
  v74 = *(float *)(v36 + 4);
  v75 = *(float *)(v36 + 8);
  v85 = *(float64x2_t *)buf;
  v87 = *(float64x2_t *)&v97[2];
  v89 = *(float64x2_t *)v100;
  v92 = v102;
  v76 = *(double *)&buf[16];
  v77 = v98;
  v78 = *(double *)&v100[16];
  v79 = v103;
  -[VKRouteLine maneuverTransform](v93, "maneuverTransform");
  v80 = *(float *)v29;
  v81 = *(float *)(v29 + 4);
  v82 = *(float *)(v29 + 8);
  v83 = v103 + *(double *)&buf[16] * v80 + v98 * v81 + *(double *)&v100[16] * v82;
  v84 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v102, *(float64x2_t *)buf, v80), *(float64x2_t *)&v97[2], v81), *(float64x2_t *)v100, v82);
  *(float64x2_t *)&retstr->var0.var0 = v90;
  retstr->var0.var1.var0._e[2] = v61;
  *(float64x2_t *)retstr->var0.var1.var1.first._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v92, v85, v73), v87, v74), v89, v75);
  retstr->var0.var1.var1.first._e[2] = v79 + v76 * v73 + v77 * v74 + v78 * v75;
  *(float64x2_t *)retstr->var0.var1.var1.second._e = v84;
  retstr->var0.var1.var1.second._e[2] = v83;
  retstr->var1 = 1;
LABEL_42:

  return result;
}

- (void)splitRouteLineAtAnnotation:(id)a3 puckOffset:(PolylineCoordinate)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  long double v19;
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
  float v30;
  float v31;
  uint64_t **v32;
  uint64_t **i;
  uint64_t *v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  _QWORD v38[6];
  float v39;
  float v40;

  v6 = a3;
  objc_msgSend(v6, "routeMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_11;
  objc_msgSend(v7, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueRouteID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKRouteLine overlay](self, "overlay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "composedRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueRouteID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
    objc_msgSend(v6, "presentationCoordinate");
    v16 = v15;
    objc_msgSend(v6, "presentationCoordinate");
    v18 = v17;
    v19 = tan(v16 * 0.00872664626 + 0.785398163);
    v20 = log(v19);
    v21 = *((double *)self + 8);
    v22 = *((double *)self + 9);
    v24 = *((double *)self + 12);
    v23 = *((double *)self + 13);
    v26 = *((double *)self + 20);
    v25 = *((double *)self + 21);
    if (*MEMORY[0x1E0D26A38] == a4.index && vabds_f32(a4.offset, *(float *)(MEMORY[0x1E0D26A38] + 4)) < 0.00000011921)
      a4 = (PolylineCoordinate)objc_msgSend(v8, "routeCoordinate");
    v27 = v18 * 0.00277777778 + 0.5;
    v28 = v20 * 0.159154943 + 0.5;
    v29 = v26 + v21 * v27 + v28 * v24;
    v30 = v29;
    v31 = v25 + v22 * v27 + v23 * v28;
    if (*((float *)self + 79) < 0.0
      || vabds_f32(v30, *((float *)self + 80)) >= 1.0e-10
      || vabds_f32(v31, *((float *)self + 81)) >= 1.0e-10)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __53__VKRouteLine_splitRouteLineAtAnnotation_puckOffset___block_invoke;
      v38[3] = &unk_1E42F3558;
      v38[4] = self;
      v38[5] = a4;
      v39 = v29;
      v40 = v25 + v22 * v27 + v23 * v28;
      -[VKRouteLine forEachSection:](self, "forEachSection:", v38);
    }
    *((float *)self + 80) = v30;
    *((float *)self + 81) = v31;
  }
  else
  {
LABEL_11:
    *((_QWORD *)self + 39) = 0xBF80000000000000;
    v32 = (uint64_t **)*((_QWORD *)self + 35);
    for (i = (uint64_t **)*((_QWORD *)self + 36); v32 != i; ++v32)
    {
      v34 = *v32;
      if (*v32)
      {
        v35 = *v34;
        *((_DWORD *)v34 + 24) = -1082130432;
        if (!v35)
        {
          md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v34 + 1));
          {
            v37 = operator new();
            mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v37, "VectorKitLabels", 0x5ED09DD50000000FLL);
          }
          (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v34, 424);
        }
      }
      else
      {
        MEMORY[0x58] = -1082130432;
      }
    }
  }

}

- (void)forEachSection:(id)a3
{
  void (**v4)(id, _QWORD *);
  _QWORD **v5;
  _QWORD **v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  _QWORD v14[2];

  v4 = (void (**)(id, _QWORD *))a3;
  if (v4)
  {
    v5 = (_QWORD **)*((_QWORD *)self + 35);
    v6 = (_QWORD **)*((_QWORD *)self + 36);
    if (v5 != v6)
    {
      while (1)
      {
        v7 = *v5;
        v14[1] = v7;
        if (v7)
          *v7 += 2;
        v14[0] = v7;
        v4[2](v4, v14);
        v8 = v14[0];
        if (v14[0])
        {
          v9 = (*(_QWORD *)v14[0])-- == 1;
          if (v9)
            break;
        }
        if (v7)
          goto LABEL_11;
LABEL_5:
        if (++v5 == v6)
          goto LABEL_21;
      }
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v8 + 8));
      {
        v13 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v13, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v14[0], 424);
      v14[0] = 0;
      if (!v7)
        goto LABEL_5;
LABEL_11:
      v9 = (*v7)-- == 1;
      if (v9)
      {
        md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v7 + 1));
        {
          v11 = operator new();
          mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v11, "VectorKitLabels", 0x5ED09DD50000000FLL);
        }
        (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v7, 424);
      }
      goto LABEL_5;
    }
  }
LABEL_21:

}

- (void)_updateBounds:(id)a3 boundsInflation:(float)a4
{
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  long double v15;
  long double v16;
  long double v17;
  long double v18;
  long double v19;
  long double v20;
  double v21;
  long double v22;
  long double v23;
  long double v24;
  long double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  long double v34;
  long double v35;
  long double v36;
  long double v37;
  long double v38;
  long double v39;
  long double v40;
  double v41;
  long double v42;
  float64x2_t v43;
  float64x2_t v44;
  _QWORD v45[11];
  uint64_t v46;
  float *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[8];
  _QWORD v59[10];
  _QWORD v60[5];
  id v61;

  *((int64x2_t *)self + 1) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((_OWORD *)self + 2) = xmmword_19FFB2E00;
  *((int64x2_t *)self + 3) = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__11;
  v60[4] = __Block_byref_object_dispose__12;
  v61 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x5012000000;
  v59[3] = __Block_byref_object_copy__29;
  v59[4] = __Block_byref_object_dispose__30;
  v59[5] = "";
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x4012000000;
  v58[3] = __Block_byref_object_copy__32;
  v58[4] = __Block_byref_object_dispose__33;
  v58[5] = "";
  v54 = 0;
  v55 = (double *)&v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = (float *)&v46;
  v48 = 0x2020000000;
  v49 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __45__VKRouteLine__updateBounds_boundsInflation___block_invoke;
  v45[3] = &unk_1E42F3580;
  v45[6] = v59;
  v45[7] = v58;
  v45[8] = &v54;
  v45[9] = &v50;
  v45[4] = self;
  v45[5] = v60;
  v45[10] = &v46;
  forEachNodeInSortedPaths(a3, v45);
  v6 = v55;
  v55[3] = *((double *)self + 5) - *((double *)self + 2);
  v7 = *((double *)self + 6) - *((double *)self + 3);
  v51[3] = v7;
  v8 = v6[3];
  v10 = *((double *)self + 2);
  v9 = *((double *)self + 3);
  if (v8 <= v7)
  {
    v12 = v10 + v7;
    *((double *)self + 5) = v10 + v7;
    v11 = *((double *)self + 6);
  }
  else
  {
    v11 = v9 + v8;
    *((double *)self + 6) = v9 + v8;
    v12 = *((double *)self + 5);
  }
  v13 = v12 - v10;
  v14 = exp((v9 + (v11 - v9) * 0.5) * 6.28318531 + -3.14159265);
  v15 = atan(v14) * 114.591559 + -90.0;
  v16 = cos(v15 * 0.034906585) * -559.82 + 111132.92;
  v17 = v16 + cos(v15 * 0.0698131701) * 1.175;
  v18 = v17 + cos(v15 * 0.104719755) * -0.0023;
  v19 = v15 * 0.00872664626;
  v20 = tan(v15 * 0.00872664626 + 0.78103484);
  v21 = log(v20);
  v22 = tan(v19 + 0.789761487);
  v23 = log(v22);
  v24 = v47[6] * a4 * fabs((v23 - v21) * 0.159154943) / v18;
  v6[3] = v13;
  v25 = v24 + v13 * 0.005;
  v26 = *((double *)self + 3);
  v27 = *((double *)self + 2) - v25;
  v28 = *((double *)self + 4);
  v29 = v25 + *((double *)self + 5);
  *((double *)self + 2) = v27;
  *((long double *)self + 3) = v26 - v25;
  v30 = *((double *)self + 6);
  v31 = *((double *)self + 7);
  *((double *)self + 5) = v29;
  *((long double *)self + 6) = v30 + v25;
  v32 = v31 - v28;
  if (v31 - v28 <= 0.000000999999997)
  {
    v32 = 1.0;
    *((double *)self + 7) = v28 + 1.0;
  }
  v33 = v29 - v27;
  *((double *)self + 31) = v29 - v27;
  v34 = exp((v30 + v26) * 3.14159265 + -3.14159265);
  v35 = atan(v34) * 114.591559 + -90.0;
  v36 = cos(v35 * 0.034906585) * -559.82 + 111132.92;
  v37 = v36 + cos(v35 * 0.0698131701) * 1.175;
  v38 = v37 + cos(v35 * 0.104719755) * -0.0023;
  v39 = v35 * 0.00872664626;
  v40 = tan(v35 * 0.00872664626 + 0.78103484);
  v41 = log(v40);
  v42 = tan(v39 + 0.789761487);
  *((long double *)self + 25) = fabs((log(v42) - v41) * 0.159154943) / (v38 * v33);
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((double *)self + 18) = 1.0 / v32;
  *((_QWORD *)self + 19) = 0;
  v43 = *((float64x2_t *)self + 1);
  v44 = vsubq_f64(*(float64x2_t *)((char *)self + 40), v43);
  *((double *)self + 8) = 1.0 / v44.f64[0];
  *((double *)self + 13) = 1.0 / v44.f64[1];
  *((float64x2_t *)self + 10) = vdivq_f64(vnegq_f64(v43), v44);
  *((double *)self + 22) = -v28 / v32;
  *((_QWORD *)self + 23) = 0x3FF0000000000000;
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v60, 8);

}

- (vector<gm::Matrix<float,)maneuverPoints
{
  unint64_t v5;
  unint64_t v6;
  float *v7;
  unint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  long double v16;
  float v17;
  float v18;
  float *var0;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  float *v27;
  unint64_t v28;
  float *v29;
  float *v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  float *v34;
  uint64_t v35;
  __int128 v36;
  vector<gm::Matrix<float, 2, 1>, std::allocator<gm::Matrix<float, 2, 1>>> *result;
  id v38;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  objc_msgSend(*((id *)self + 24), "composedRoute");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v38, "stepsCount");
  v6 = v5;
  if (v5)
  {
    if (v5 >> 61)
      abort();
    v7 = (float *)operator new(8 * v5);
    retstr->var0 = v7;
    retstr->var1 = v7;
    retstr->var2.var0 = &v7[2 * v6];
  }
  else
  {
    v7 = 0;
  }
  for (i = 0; i < objc_msgSend(v38, "stepsCount"); ++i)
  {
    objc_msgSend(v38, "stepAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pointAtRouteCoordinate:", objc_msgSend(v9, "endRouteCoordinate"));
    v11 = v10;
    v13 = tan(v12 * 0.00872664626 + 0.785398163);
    v14 = log(v13);
    v15 = v11 * 0.00277777778 + 0.5;
    v16 = v14 * 0.159154943 + 0.5;
    v17 = *((double *)self + 20) + *((double *)self + 8) * v15 + v16 * *((double *)self + 12);
    v18 = *((double *)self + 21) + *((double *)self + 9) * v15 + *((double *)self + 13) * v16;
    var0 = (float *)retstr->var2.var0;
    if (v7 < var0)
    {
      *v7 = v17;
      v7[1] = v18;
      v7 += 2;
      goto LABEL_7;
    }
    v20 = (float *)retstr->var0;
    v21 = (char *)v7 - (char *)retstr->var0;
    v22 = v21 >> 3;
    v23 = (v21 >> 3) + 1;
    if (v23 >> 61)
      abort();
    v24 = (char *)var0 - (char *)v20;
    if (v24 >> 2 > v23)
      v23 = v24 >> 2;
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
      v25 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v25 = v23;
    if (v25)
    {
      if (v25 >> 61)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v26 = operator new(8 * v25);
    }
    else
    {
      v26 = 0;
    }
    v27 = (float *)&v26[8 * v22];
    *v27 = v17;
    v27[1] = v18;
    if (v7 == v20)
    {
      v20 = v7;
      v30 = (float *)&v26[8 * v22];
    }
    else
    {
      v28 = (char *)(v7 - 2) - (char *)v20;
      if (v28 < 0x168
        || &v26[v21 - 8 - (v28 & 0xFFFFFFFFFFFFFFF8)] > &v26[v21 - 8]
        || (float *)((char *)v7 - (v28 & 0xFFFFFFFFFFFFFFF8) - 8) > v7 - 2
        || (unint64_t)((char *)v7 - &v26[v21]) < 0x20)
      {
        v29 = v7;
        v30 = (float *)&v26[8 * v22];
        do
        {
LABEL_23:
          v31 = *((_QWORD *)v29 - 1);
          v29 -= 2;
          *((_QWORD *)v30 - 1) = v31;
          v30 -= 2;
        }
        while (v29 != v20);
        v20 = (float *)retstr->var0;
        goto LABEL_26;
      }
      v32 = (v28 >> 3) + 1;
      v29 = &v7[-2 * (v32 & 0x3FFFFFFFFFFFFFFCLL)];
      v33 = &v26[8 * v22 - 16];
      v34 = v7 - 4;
      v35 = v32 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v36 = *(_OWORD *)v34;
        *(v33 - 1) = *((_OWORD *)v34 - 1);
        *v33 = v36;
        v33 -= 2;
        v34 -= 8;
        v35 -= 4;
      }
      while (v35);
      v30 = &v27[-2 * (v32 & 0x3FFFFFFFFFFFFFFCLL)];
      if (v32 != (v32 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_23;
    }
LABEL_26:
    v7 = v27 + 2;
    retstr->var0 = v30;
    retstr->var1 = v27 + 2;
    retstr->var2.var0 = &v26[8 * v25];
    if (v20)
      operator delete(v20);
LABEL_7:
    retstr->var1 = v7;

  }
  return result;
}

- (Matrix<double,)inverseManeuverTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1]._e[2];
  *(_OWORD *)&retstr->_e[8] = *(_OWORD *)self[1]._e;
  *(_OWORD *)&retstr->_e[10] = v3;
  v4 = *(_OWORD *)&self[1]._e[6];
  *(_OWORD *)&retstr->_e[12] = *(_OWORD *)&self[1]._e[4];
  *(_OWORD *)&retstr->_e[14] = v4;
  v5 = *(_OWORD *)&self->_e[10];
  *(_OWORD *)retstr->_e = *(_OWORD *)&self->_e[8];
  *(_OWORD *)&retstr->_e[2] = v5;
  v6 = *(_OWORD *)&self->_e[14];
  *(_OWORD *)&retstr->_e[4] = *(_OWORD *)&self->_e[12];
  *(_OWORD *)&retstr->_e[6] = v6;
  return self;
}

- (Matrix<double,)maneuverTransform
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = self->_e[2];
  v4 = self->_e[3];
  v5 = self->_e[4];
  v6 = self->_e[5];
  v7 = self->_e[6];
  v8 = self->_e[7];
  *(_OWORD *)&retstr->_e[5] = 0u;
  *(_OWORD *)&retstr->_e[9] = 0u;
  *(_OWORD *)&retstr->_e[1] = 0u;
  *(_OWORD *)&retstr->_e[3] = 0u;
  *(_OWORD *)&retstr->_e[7] = 0u;
  retstr->_e[11] = 0.0;
  retstr->_e[15] = 1.0;
  retstr->_e[0] = v6 - v3;
  retstr->_e[5] = v7 - v4;
  retstr->_e[10] = v8 - v5;
  retstr->_e[12] = v3;
  retstr->_e[13] = v4;
  retstr->_e[14] = v5;
  return self;
}

- (double)boundsUnitsPerMeter
{
  return *((double *)self + 25);
}

- (vector<geo::fast_shared_ptr<md::RouteLineSection,)sections
{
  void **v3;
  void **v4;
  vector<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>, std::allocator<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>>> *result;
  uint64_t v7;
  _QWORD *v8;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v3 = (void **)*((_QWORD *)self + 35);
  v4 = (void **)*((_QWORD *)self + 36);
  result = (vector<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>, std::allocator<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>>> *)((char *)v4 - (char *)v3);
  if (v4 != v3)
  {
    if (((unint64_t)result & 0x8000000000000000) != 0)
      abort();
    v7 = (uint64_t)result >> 3;
    result = (vector<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>, std::allocator<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>>> *)operator new((size_t)result);
    retstr->__begin_ = result;
    retstr->__end_cap_.__value_ = &result->__begin_ + v7;
    do
    {
      v8 = *v3;
      result->__begin_ = *v3;
      if (v8)
        ++*v8;
      ++v3;
      result = (vector<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>, std::allocator<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>>> *)((char *)result + 8);
    }
    while (v3 != v4);
    retstr->__end_ = result;
  }
  return result;
}

- (Box<double,)bounds
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_maximum._e[1];
  *(_OWORD *)retstr->_minimum._e = *(_OWORD *)&self->_minimum._e[2];
  *(_OWORD *)&retstr->_minimum._e[2] = v3;
  *(_OWORD *)&retstr->_maximum._e[1] = *(_OWORD *)self[1]._minimum._e;
  return self;
}

- (VKPolylineOverlay)overlay
{
  return (VKPolylineOverlay *)*((_QWORD *)self + 24);
}

- (BOOL)hasNewRoadMatches
{
  return *((_BYTE *)self + 9) & 1;
}

- (void)setHasNewRoadMatches:(BOOL)a3
{
  *((_BYTE *)self + 9) = a3;
}

- (double)simplificationEpsilonPoints
{
  return *((double *)self + 32);
}

- (void)setSimplificationEpsilonPoints:(double)a3
{
  *((double *)self + 32) = a3;
}

- (VKRouteLineObserverProtocol)observer
{
  return (VKRouteLineObserverProtocol *)objc_loadWeakRetained((id *)self + 34);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)self + 34, a3);
}

- (VKPolylineOverlayRenderRegion)renderRegion
{
  return (VKPolylineOverlayRenderRegion *)*((_QWORD *)self + 46);
}

- (double)boundsInWorldUnit
{
  return *((double *)self + 31);
}

- (GEOPathMatcher)pathMatcher
{
  return (GEOPathMatcher *)*((_QWORD *)self + 27);
}

- (unsigned)numPathsMatching
{
  return *((_WORD *)self + 112);
}

- (void)setNumPathsMatching:(unsigned __int16)a3
{
  *((_WORD *)self + 112) = a3;
}

- (unsigned)matchingStartIndex
{
  return *((_DWORD *)self + 60);
}

- (void)setMatchingStartIndex:(unsigned int)a3
{
  *((_DWORD *)self + 60) = a3;
}

- (unsigned)matchingEndIndex
{
  return *((_DWORD *)self + 61);
}

- (void)setMatchingEndIndex:(unsigned int)a3
{
  *((_DWORD *)self + 61) = a3;
}

- (void).cxx_destruct
{
  void *v3;
  _QWORD *v4;
  BOOL v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  malloc_zone_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  unsigned __int8 v14;
  uint64_t v15;
  geo::read_write_lock *v16;
  const char *v17;
  uint64_t v18;
  geo::read_write_lock *v19;
  const char *v20;
  malloc_zone_t *zone;
  uint64_t v22;

  std::mutex::~mutex((std::mutex *)((char *)self + 416));
  objc_storeStrong((id *)self + 51, 0);
  v3 = (void *)*((_QWORD *)self + 47);
  if (v3)
  {
    *((_QWORD *)self + 48) = v3;
    operator delete(v3);
  }
  objc_storeStrong((id *)self + 46, 0);
  objc_storeStrong((id *)self + 45, 0);
  *((_QWORD *)self + 41) = &off_1E42B5330;

  v4 = (_QWORD *)*((_QWORD *)self + 38);
  if (v4)
  {
    v5 = (*v4)-- == 1;
    if (v5)
    {
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v4 + 1));
      {
        v18 = operator new();
        *(_QWORD *)(v18 + 16) = 0x5ED09DD50000000FLL;
        *(_QWORD *)(v18 + 24) = "VectorKitLabels";
        *(_OWORD *)(v18 + 32) = xmmword_19FFB2E80;
        *(_QWORD *)v18 = &off_1E42B5668;
        *(_QWORD *)(v18 + 8) = "VectorKitLabels";
        *(_OWORD *)(v18 + 72) = 0u;
        *(_OWORD *)(v18 + 88) = 0u;
        *(_OWORD *)(v18 + 104) = 0u;
        *(_OWORD *)(v18 + 120) = 0u;
        *(_OWORD *)(v18 + 136) = 0u;
        *(_OWORD *)(v18 + 152) = 0u;
        *(_OWORD *)(v18 + 168) = 0u;
        *(_OWORD *)(v18 + 184) = 0u;
        *(_OWORD *)(v18 + 200) = 0u;
        *(_OWORD *)(v18 + 216) = 0u;
        *(_OWORD *)(v18 + 232) = 0u;
        *(_QWORD *)(v18 + 248) = 0;
        *(_OWORD *)(v18 + 56) = 0u;
        v19 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v18 + 56), 0);
        if ((_DWORD)v19)
          geo::read_write_lock::logFailure(v19, (uint64_t)"initialization", v20);
        zone = malloc_create_zone(0, 0);
        *(_QWORD *)(v18 + 48) = zone;
        malloc_set_zone_name(zone, "VectorKitLabels");
        *(_QWORD *)(v18 + 256) = os_log_create("com.apple.VectorKit", "Memory");
        mdm::Allocator::instance(void)::alloc = v18;
      }
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *((_QWORD *)self + 38), 424);
      *((_QWORD *)self + 38) = 0;
    }
  }
  v7 = *((_QWORD *)self + 35);
  if (v7)
  {
    v8 = *((_QWORD *)self + 36);
    v9 = (void *)*((_QWORD *)self + 35);
    if (v8 != v7)
    {
      v10 = *((_QWORD *)self + 36);
      do
      {
        v13 = *(_QWORD **)(v10 - 8);
        v10 -= 8;
        v12 = v13;
        if (v13)
        {
          v5 = (*v12)-- == 1;
          if (v5)
          {
            md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v12 + 1));
            {
              v22 = v7;
              v15 = operator new();
              *(_QWORD *)(v15 + 16) = 0x5ED09DD50000000FLL;
              *(_QWORD *)(v15 + 24) = "VectorKitLabels";
              *(_OWORD *)(v15 + 32) = xmmword_19FFB2E80;
              *(_QWORD *)v15 = &off_1E42B5668;
              *(_QWORD *)(v15 + 8) = "VectorKitLabels";
              *(_OWORD *)(v15 + 72) = 0u;
              *(_OWORD *)(v15 + 88) = 0u;
              *(_OWORD *)(v15 + 104) = 0u;
              *(_OWORD *)(v15 + 120) = 0u;
              *(_OWORD *)(v15 + 136) = 0u;
              *(_OWORD *)(v15 + 152) = 0u;
              *(_OWORD *)(v15 + 168) = 0u;
              *(_OWORD *)(v15 + 184) = 0u;
              *(_OWORD *)(v15 + 200) = 0u;
              *(_OWORD *)(v15 + 216) = 0u;
              *(_OWORD *)(v15 + 232) = 0u;
              *(_QWORD *)(v15 + 248) = 0;
              *(_OWORD *)(v15 + 56) = 0u;
              v16 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v15 + 56), 0);
              if ((_DWORD)v16)
                geo::read_write_lock::logFailure(v16, (uint64_t)"initialization", v17);
              v11 = malloc_create_zone(0, 0);
              *(_QWORD *)(v15 + 48) = v11;
              malloc_set_zone_name(v11, "VectorKitLabels");
              *(_QWORD *)(v15 + 256) = os_log_create("com.apple.VectorKit", "Memory");
              mdm::Allocator::instance(void)::alloc = v15;
              v7 = v22;
            }
            (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *(_QWORD *)(v8 - 8), 424);
            *(_QWORD *)(v8 - 8) = 0;
          }
        }
        v8 = v10;
      }
      while (v10 != v7);
      v9 = (void *)*((_QWORD *)self + 35);
    }
    *((_QWORD *)self + 36) = v7;
    operator delete(v9);
  }
  objc_destroyWeak((id *)self + 34);
  objc_storeStrong((id *)self + 29, 0);
  objc_storeStrong((id *)self + 27, 0);
  objc_storeStrong((id *)self + 24, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 39) = 0xBF80000000000000;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *((_QWORD *)self + 41) = &off_1E42B5330;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 48) = 0;
  *((_QWORD *)self + 49) = 0;
  *((_QWORD *)self + 47) = 0;
  *((_QWORD *)self + 52) = 850045863;
  *((_QWORD *)self + 59) = 0;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  return self;
}

void __45__VKRouteLine__updateBounds_boundsInflation___block_invoke(_QWORD *a1, float *a2, float a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;

  v10 = a6;
  v11 = v10;
  if (*(id *)(*(_QWORD *)(a1[5] + 8) + 40) != v10)
  {
    objc_msgSend(v10, "section");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vkBounds");
    v13 = *(_QWORD **)(a1[6] + 8);
    v13[6] = v14;
    v13[7] = v15;
    v13[8] = v16;
    v13[9] = v17;

    objc_msgSend(v11, "section");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "bounds");
      v20 = v34;
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v11, "section");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "bounds");
      v23 = v33;
    }
    else
    {
      v23 = 0.0;
    }
    objc_msgSend(v11, "section");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "bounds");
      v26 = v32;
    }
    else
    {
      v26 = 0.0;
    }
    v27 = *(_QWORD *)(a1[7] + 8);
    *(_QWORD *)(v27 + 48) = v20;
    *(double *)(v27 + 56) = v26 + v23;

    *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 64)
                                                 - *(double *)(*(_QWORD *)(a1[6] + 8) + 48);
    *(double *)(*(_QWORD *)(a1[9] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 72)
                                                 - *(double *)(*(_QWORD *)(a1[6] + 8) + 56);
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a6);
  }
  v28 = *(_QWORD *)(a1[6] + 8);
  v29 = *(double *)(v28 + 48) + *(double *)(*(_QWORD *)(a1[8] + 8) + 24) * *a2;
  v30 = *(double *)(v28 + 56) + *(double *)(*(_QWORD *)(a1[9] + 8) + 24) * a2[1];
  v31 = *(double *)(*(_QWORD *)(a1[7] + 8) + 48) + a2[2];
  *(double *)(a1[4] + 16) = fmin(*(double *)(a1[4] + 16), v29);
  *(double *)(a1[4] + 40) = fmax(*(double *)(a1[4] + 40), v29);
  *(double *)(a1[4] + 24) = fmin(*(double *)(a1[4] + 24), v30);
  *(double *)(a1[4] + 48) = fmax(*(double *)(a1[4] + 48), v30);
  *(double *)(a1[4] + 32) = fmin(*(double *)(a1[4] + 32), v31);
  *(double *)(a1[4] + 56) = fmax(*(double *)(a1[4] + 56), v31);
  *(float *)(*(_QWORD *)(a1[10] + 8) + 24) = fmaxf(*(float *)(*(_QWORD *)(a1[10] + 8) + 24), a3);

}

void __53__VKRouteLine_splitRouteLineAtAnnotation_puckOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int v7;
  const PolylineCoordinate *v9;
  unsigned int v10;
  void *v11;
  unint64_t v12;
  char v13;
  char v14;
  _QWORD *v15;
  unsigned __int8 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  float *v25;
  float v26;
  float v27;
  float *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  BOOL v36;
  int v37;
  float v38;
  uint64_t v39;
  md::RouteLineSection *v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  _QWORD *v46;

  v3 = a1 + 40;
  v4 = *(_DWORD *)(a1 + 40);
  v5 = *(_QWORD **)a2;
  if (*(_QWORD *)a2)
    v6 = *(_QWORD *)a2 + 8;
  else
    v6 = 0;
  v7 = *(_DWORD *)(v6 + 112);
  if (v4 < v7 || v4 == v7 && *(float *)(a1 + 44) < *(float *)(v6 + 116))
  {
    v9 = (const PolylineCoordinate *)md::RouteLineSection::kSplitLocationBeforeSection;
LABEL_10:
    md::RouteLineSection::split((md::RouteLineSection *)v6, v9);
    return;
  }
  v10 = *(_DWORD *)(v6 + 120);
  if (v10 < v4 || v10 == v4 && *(float *)(v6 + 124) < *(float *)(a1 + 44))
  {
    v9 = (const PolylineCoordinate *)md::RouteLineSection::kSplitLocationAfterSection;
    goto LABEL_10;
  }
  v11 = *(void **)(a1 + 32);
  v46 = *(_QWORD **)a2;
  if (v5)
    ++*v5;
  v12 = objc_msgSend(v11, "_getSnappedSegment:coord:", &v46, v3);
  v14 = v13;
  v15 = v46;
  if (v46)
  {
    if ((*v46)-- == 1)
    {
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v15 + 1));
      {
        v45 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v45, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v46, 424);
      v46 = 0;
    }
  }
  if (v14)
  {
    v18 = v12;
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)a2 + 8) + 48))(*(_QWORD *)a2 + 8, v12);
    (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)(*(_QWORD *)a2 + 8) + 48))(*(_QWORD *)a2 + 8, HIDWORD(v12));
    if ((int)v12 - 5 <= 1)
      v19 = 1;
    else
      v19 = (v12 - 5);
    v20 = v18 + 5;
    if (*(_QWORD *)a2)
      v21 = *(_QWORD *)a2 + 8;
    else
      v21 = 0;
    v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 56))(v21);
    if (v22 >= v20)
      v23 = v20;
    else
      v23 = v22;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312) = 0;
    if (v23 > v19)
    {
      v24 = 3.4028e38;
      do
      {
        v25 = (float *)(*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)(*(_QWORD *)a2 + 8) + 48))(*(_QWORD *)a2 + 8, v19 - 1);
        v27 = *v25;
        v26 = v25[1];
        v28 = (float *)(*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)(*(_QWORD *)a2 + 8) + 48))(*(_QWORD *)a2 + 8, v19);
        v29 = *v28 - v27;
        v30 = v28[1] - v26;
        v31 = (float)(v29 * v29) + (float)(v30 * v30);
        v33 = *(float *)(a1 + 48);
        v32 = *(float *)(a1 + 52);
        v34 = 0.0;
        if (v31 > 1.0e-15)
          v34 = fminf(fmaxf((float)((float)((float)(v33 - v27) * v29) + (float)((float)(v32 - v26) * v30)) / v31, 0.0), 1.0);
        v35 = (float)((float)(v33 - (float)(v27 + (float)(v34 * v29))) * (float)(v33 - (float)(v27 + (float)(v34 * v29))))
            + (float)((float)(v32 - (float)(v26 + (float)(v34 * v30))) * (float)(v32 - (float)(v26 + (float)(v34 * v30))));
        if (v35 < v24)
        {
          v36 = v34 < 1.0;
          v37 = vcvtms_u32_f32(v34) + v19 - 1;
          v38 = v34 - floorf(v34);
          if (v34 >= 1.0)
            v34 = v38;
          v39 = *(_QWORD *)(a1 + 32);
          if (v36)
            v37 = v19 - 1;
          *(_DWORD *)(v39 + 312) = v37;
          *(float *)(v39 + 316) = v34;
          v24 = v35;
        }
        ++v19;
      }
      while (v23 != v19);
    }
    if (*(_QWORD *)a2)
      v40 = (md::RouteLineSection *)(*(_QWORD *)a2 + 8);
    else
      v40 = 0;
    md::RouteLineSection::split(v40, (const PolylineCoordinate *)(*(_QWORD *)(a1 + 32) + 312));
    if (*(_QWORD *)a2)
      v41 = *(_QWORD *)a2 + 8;
    else
      v41 = 0;
    v42 = *(_DWORD *)(v41 + 112);
    v43 = *(_DWORD *)(a1 + 40);
    *(_BYTE *)(v41 + 261) = (v42 < v43 || v42 == v43 && *(float *)(v41 + 116) <= *(float *)(a1 + 44))
                         && ((v44 = *(_DWORD *)(v41 + 120), v43 < v44)
                          || v43 == v44 && *(float *)(a1 + 44) <= *(float *)(v41 + 124));
  }
}

void __37__VKRouteLine_createMeshIfNecessary___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  size_t v5;
  double v6;
  double v7;
  double v8;
  _QWORD *v9;
  void (**v10)(md::RouteLineSection::SingleLayerVertexSource *__hidden);
  _QWORD *v11;
  double v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  float32x2_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  float32x2_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  VKPolylineOverlay *v27;
  uint64_t v28;
  uint64_t i;
  PolylineCoordinate v30;
  PolylineCoordinate v31;
  float32x2_t *v32;
  unint64_t j;
  float32x2_t *v34;
  float32x2_t v35;
  double v36;
  id v37;

  if (*a2)
    v2 = *a2 + 8;
  else
    v2 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v37 = *(id *)(v3 + 192);
  v4 = (uint64_t *)(v2 + 8);
  v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v2 + 16) - *(_QWORD *)(v2 + 8)) >> 4);
  if (v5 >= 2)
  {
    v6 = *(double *)(v3 + 256);
    v7 = *(double *)(v3 + 264);
    v8 = *(double *)(v2 + 144);
    if (v8 < 0.0 || vabdd_f64(v8 / v7, v6) > 1.0)
    {
      if (*(_QWORD *)(v2 + 128))
      {
        free(*(void **)(v2 + 128));
        *(_QWORD *)(v2 + 128) = 0;
        v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v2 + 16) - *(_QWORD *)(v2 + 8)) >> 4);
      }
      *(_QWORD *)(v2 + 136) = 0;
      *(_QWORD *)(v2 + 144) = 0xBFF0000000000000;
      v11 = malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
      v12 = v7 * v6;
      *(double *)(v2 + 144) = v12;
      *(_QWORD *)(v2 + 128) = v11;
      *(_QWORD *)(v2 + 136) = 1;
      *v11 = 0;
      v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AF5730]();
      v14 = *(float32x2_t **)(v2 + 8);
      v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v2 + 16) - (_QWORD)v14) >> 4);
      if (v15 >= 2)
      {
        v16 = 1;
        v17 = 48;
        do
        {
          v18 = v15 - 1;
          v19 = ((uint64_t (**)(_QWORD, uint64_t, unint64_t, BOOL))v13)[2](v13, v2 + 8, v16, v16 == v15 - 1);
          if (v16 == v18)
            v20 = 1;
          else
            v20 = v19;
          v21 = *v4;
          if ((v20 & 1) != 0
            || (v22 = vsub_f32(*v14, *(float32x2_t *)(v21 + v17)), v12 < sqrtf(vaddv_f32(vmul_f32(v22, v22)))))
          {
            *(_QWORD *)(*(_QWORD *)(v2 + 128) + 8 * *(_QWORD *)(v2 + 136)) = v16;
            v14 = (float32x2_t *)(v21 + v17);
            ++*(_QWORD *)(v2 + 136);
          }
          ++v16;
          v15 = 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v2 + 16) - v21) >> 4);
          v17 += 48;
        }
        while (v15 > v16);
      }

      v23 = *(_QWORD *)(v2 + 96);
      if (v23)
        (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
      v24 = (_QWORD *)operator new();
      v25 = *(_QWORD *)(v2 + 128);
      v26 = *(_QWORD *)(v2 + 136);
      *v24 = &off_1E42920C0;
      v24[1] = v4;
      v24[2] = v25;
      v24[3] = v26;
      *(_QWORD *)(v2 + 96) = v24;
      *(_QWORD *)(v2 + 104) = v24;
      v27 = (VKPolylineOverlay *)v37;
      v28 = *(_QWORD *)(v2 + 32);
      for (i = *(_QWORD *)(v2 + 40); v28 != i; v28 += 36)
      {
        v30 = *(PolylineCoordinate *)(v28 + 4);
        *(_QWORD *)(v28 + 20) = md::RouteLineSection::simplifiedCoordinate((md::RouteLineSection *)v2, v27, v30);
        v31 = *(PolylineCoordinate *)(v28 + 12);
        *(_QWORD *)(v28 + 28) = md::RouteLineSection::simplifiedCoordinate((md::RouteLineSection *)v2, v27, v31);
      }

      v10 = **(void (****)(md::RouteLineSection::SingleLayerVertexSource *__hidden))(v2 + 96);
    }
    else
    {
      if (*(_QWORD *)(v2 + 96))
        goto LABEL_30;
      v9 = (_QWORD *)operator new();
      v10 = &off_1E42920F8;
      *v9 = &off_1E42920F8;
      v9[1] = v4;
      *(_QWORD *)(v2 + 96) = v9;
      *(_QWORD *)(v2 + 104) = v9;
    }
    *(_QWORD *)(v2 + 232) = 0;
    v32 = (float32x2_t *)((uint64_t (*)(void))v10[4])();
    v32[4].i32[0] = 0;
    for (j = 1; (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 96) + 24))(*(_QWORD *)(v2 + 96)) > j; ++j)
    {
      v34 = (float32x2_t *)(*(uint64_t (**)(_QWORD, unint64_t))(**(_QWORD **)(v2 + 96) + 32))(*(_QWORD *)(v2 + 96), j);
      v35 = vsub_f32(*v34, *v32);
      v36 = *(double *)(v2 + 232) + sqrtf(vaddv_f32(vmul_f32(v35, v35)));
      *(double *)(v2 + 232) = v36;
      *(float *)&v36 = v36;
      v34[4].i32[0] = LODWORD(v36);
      v32 = v34;
    }
    *(_DWORD *)(v2 + 88) = -1082130432;
  }
LABEL_30:

}

void __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v8;
  _QWORD *v9;
  unint64_t v10;
  char *v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BYTE *v18;
  _QWORD *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v8 = a5;
  if (a6)
  {
    v9 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v11 = (char *)v9[7];
    v10 = v9[8];
    if ((unint64_t)v11 >= v10)
    {
      v29 = v8;
      v13 = (char *)v9[6];
      v14 = (v11 - v13) >> 3;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 61)
        abort();
      v16 = v10 - (_QWORD)v13;
      if (v16 >> 2 > v15)
        v15 = v16 >> 2;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
        v17 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
      {
        if (v17 >> 61)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v18 = operator new(8 * v17);
      }
      else
      {
        v18 = 0;
      }
      v19 = &v18[8 * v14];
      v20 = &v18[8 * v17];
      *v19 = 0;
      v12 = v19 + 1;
      if (v11 != v13)
      {
        v21 = v11 - v13 - 8;
        if (v21 < 0x58)
          goto LABEL_30;
        if ((unint64_t)(v13 - v18) < 0x20)
          goto LABEL_30;
        v22 = (v21 >> 3) + 1;
        v23 = &v18[8 * v14 - 16];
        v24 = v11 - 16;
        v25 = v22 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v26 = *(_OWORD *)v24;
          *(v23 - 1) = *((_OWORD *)v24 - 1);
          *v23 = v26;
          v23 -= 2;
          v24 -= 32;
          v25 -= 4;
        }
        while (v25);
        v19 -= v22 & 0x3FFFFFFFFFFFFFFCLL;
        v11 -= 8 * (v22 & 0x3FFFFFFFFFFFFFFCLL);
        if (v22 != (v22 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_30:
          do
          {
            v27 = *((_QWORD *)v11 - 1);
            v11 -= 8;
            *--v19 = v27;
          }
          while (v11 != v13);
        }
      }
      v9[6] = v19;
      v9[7] = v12;
      v9[8] = v20;
      if (v13)
        operator delete(v13);
      v8 = v29;
    }
    else
    {
      *(_QWORD *)v11 = 0;
      v12 = v11 + 8;
    }
    v9[7] = v12;
  }
  v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
  ++*(_QWORD *)(v28 - 8);

}

void __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke_25(uint64_t a1, float *a2, uint64_t *a3, uint64_t a4, void *a5, int a6, uint64_t a7, float a8)
{
  void *v10;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned __int8 v29;
  uint64_t v30;
  float v31;
  float v32;
  char v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  unint64_t v38;
  char *v39;
  float *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t *v61;
  char *v62;
  _QWORD *v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  _QWORD *v74;
  _QWORD *v75;
  unsigned __int8 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  unsigned __int8 v82;
  uint64_t v83;
  unint64_t *v84;
  unint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  _BYTE *v88;
  _BYTE *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  float v101;
  _QWORD *v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  void *v113;
  double v114;
  void *v115;
  double v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  void *v121;
  double v122;
  float64x2_t v123;
  uint64_t v124;
  float64x2_t v125;
  float64x2_t v126;
  double v127;
  double v128;
  uint64_t v129;
  float64x2_t v131;
  float64x2_t v132;
  uint64_t *v136;
  uint64_t v137;
  float v138;
  float v139;
  float32x2_t v140;
  float32x2_t v141;
  float v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  uint64_t v146;
  float v147;
  float32x2_t v148;
  int v149;
  float v150;
  char *v151;
  char *v152;
  float v154;
  float v155;
  float v157;
  float v158;
  float v160;
  float v161;
  float *v163;
  char *v164;
  float v165;
  float v166;
  float v167;
  float v169;
  float v171;
  float v172;
  float v173;
  float v175;
  float v176;
  float v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  float v184;
  char v185;
  unint64_t v186;
  char *v187;
  unint64_t v188;
  unint64_t v189;
  unint64_t v190;
  char *v191;
  char *v192;
  __int128 v193;
  __int128 v194;
  _DWORD *v195;
  double v196;
  double v197;
  double *v198;
  double v199;
  double v200;
  long double v201;
  double v202;
  long double v203;
  double v204;
  __double2 v205;
  __double2 v206;
  uint64_t v207;
  void *v208;
  void *v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  long double v219;
  double v220;
  long double v221;
  double v222;
  __double2 v223;
  double v224;
  __double2 v225;
  uint64_t v226;
  uint64_t v227;
  unint64_t v228;
  void *v229;
  double v230;
  void *v231;
  double v232;
  id v233;
  void *v234;
  float64_t v235;
  double v236;
  id v237;
  float64_t v238;
  void *v239;
  float64_t v240;
  void *val;
  float64_t vala;
  float32x2_t v246;
  float32x2_t v247;
  double v249;
  double v250;
  __int128 v251;
  __int128 v252;
  double v253;

  v10 = a5;
  v12 = a5;
  if (!a6)
    goto LABEL_85;
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v233 = v12;
  if (v13)
  {
    objc_msgSend(v13, "section");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "transportType"))
    {

    }
    else
    {
      objc_msgSend(v12, "section");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "transportType");

      if (v48)
      {
        objc_msgSend(*(id *)(a1 + 32), "composedRoute");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "section");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "legIndexForStepIndex:", objc_msgSend(v50, "finalStepIndex"));

        objc_msgSend(*(id *)(a1 + 32), "composedRoute");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "section");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v52, "legIndexForStepIndex:", objc_msgSend(v53, "finalStepIndex"));

        if (v51 != v54 && v51 < *(unsigned int *)(a1 + 88))
        {
          objc_msgSend(v12, "section");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55;
          if (v55)
          {
            objc_msgSend(v55, "bounds");
            v57 = *((double *)&v251 + 1);
            v58 = *(double *)&v251;
            v60 = *((double *)&v252 + 1);
            v59 = v253;
          }
          else
          {
            v252 = 0u;
            v253 = 0.0;
            v251 = 0u;
            v59 = 0.0;
            v60 = 0.0;
            v57 = 0.0;
            v58 = 0.0;
          }
          v196 = v58 + v60 * *a2;
          v197 = v57 + v59 * (float)(1.0 - a2[1]);
          v198 = (double *)MEMORY[0x1E0D266F8];
          v199 = *MEMORY[0x1E0D266F8];
          v200 = *(double *)(MEMORY[0x1E0D266F8] + 8);

          v201 = exp(3.14159265 - v197 * 6.28318531 / v200);
          v202 = atan(v201) * 2.0 + -1.57079633;
          v203 = fmod(v196 * 6.28318531 / v199, 6.28318531);
          v204 = fmod(v203 + 6.28318531, 6.28318531) + -3.14159265;
          v205 = __sincos_stret(v202);
          v206 = __sincos_stret(v204);
          v207 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "section");
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          v209 = v208;
          if (v208)
          {
            objc_msgSend(v208, "bounds");
            v210 = *((double *)&v251 + 1);
            v211 = *(double *)&v251;
            v213 = *((double *)&v252 + 1);
            v212 = v253;
          }
          else
          {
            *(_QWORD *)&v252 = 0;
            v212 = 0.0;
            v213 = 0.0;
            v210 = 0.0;
            v211 = 0.0;
          }
          v228 = 0xBF7B6B90F1FE94F0;
          v214 = 6378137.0 / sqrt(v205.__sinval * v205.__sinval * -0.00669437999 + 1.0);
          v236 = v214 * v205.__cosval * v206.__cosval;
          v232 = v214 * v205.__cosval * v206.__sinval;
          v230 = v205.__sinval * 0.99330562 * v214;
          v215 = v211 + v213 * *(float *)(v207 + 48);
          v216 = v210 + v212 * (float)(1.0 - *(float *)(v207 + 52));
          v217 = *v198;
          v218 = v198[1];

          v219 = exp(3.14159265 - v216 * 6.28318531 / v218);
          v220 = atan(v219) * 2.0 + -1.57079633;
          v221 = fmod(v215 * 6.28318531 / v217, 6.28318531);
          v222 = fmod(v221 + 6.28318531, 6.28318531) + -3.14159265;
          v223 = __sincos_stret(v220);
          v224 = 6378137.0 / sqrt(v223.__sinval * v223.__sinval * -0.00669437999 + 1.0);
          v225 = __sincos_stret(v222);
          if (sqrt(-(v236 - v224 * v223.__cosval * v225.__cosval) * -(v236 - v224 * v223.__cosval * v225.__cosval)+ -(v232 - v224 * v223.__cosval * v225.__sinval) * -(v232 - v224 * v223.__cosval * v225.__sinval)+ -(v230 - v223.__sinval * 0.99330562 * v224) * -(v230 - v223.__sinval * 0.99330562 * v224)) <= 10.0)goto LABEL_85;
        }
      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48))
  {
    v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "routeEnd");
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
    if (v16)
      v17 = v16 + 8;
    else
      v17 = 0;
    *(_QWORD *)(v17 + 120) = v15;
  }
  objc_msgSend(v12, "section", v228);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "composedRouteSegment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v234 = v19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)MEMORY[0x1E0D275B0];
    objc_msgSend(v19, "transitLine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attributesForTransitLine:", v21);
    v231 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v231 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "composedRoute");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "section");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "legIndexForStepIndex:", objc_msgSend(v23, "finalStepIndex"));

  v25 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "section");
  val = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v27 = *(_QWORD *)(v26 + 24);
  *(_QWORD *)(v26 + 24) = v27 + 1;
  objc_msgSend(v12, "section");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v229, "transportType");
  {
    v226 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v226, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, 424, 8);
  v239 = v10;
  *(_QWORD *)v30 = 1;
  v31 = *(double *)(v25 + 200);
  v32 = *(double *)(v25 + 248);
  v33 = *(_BYTE *)(a1 + 92);
  v34 = v231;
  *(_QWORD *)(v30 + 8) = &off_1E4292130;
  *(_OWORD *)(v30 + 16) = 0u;
  *(_OWORD *)(v30 + 32) = 0u;
  *(_OWORD *)(v30 + 48) = 0u;
  v35 = v34;
  *(_QWORD *)(v30 + 136) = 0;
  *(_QWORD *)(v30 + 64) = &off_1E42B4D70;
  *(_QWORD *)(v30 + 72) = v35;
  v237 = v35;
  *(float *)(v30 + 88) = v31;
  *(float *)(v30 + 92) = v32;
  *(_QWORD *)(v30 + 104) = 0;
  *(_QWORD *)(v30 + 112) = 0;
  *(_DWORD *)(v30 + 120) = 0;
  *(_QWORD *)(v30 + 124) = 3212836864;
  *(_DWORD *)(v30 + 132) = -1082130432;
  *(_QWORD *)(v30 + 144) = 0;
  *(_QWORD *)(v30 + 152) = 0xBFF0000000000000;
  *(_DWORD *)(v30 + 168) = 1043452238;
  *(_QWORD *)(v30 + 160) = 0x4040000000000000;
  *(_DWORD *)(v30 + 224) = v28;
  objc_initWeak((id *)(v30 + 232), val);
  *(_QWORD *)(v30 + 248) = v27;
  *(_QWORD *)(v30 + 256) = v24;
  *(_BYTE *)(v30 + 264) = v33;
  *(_DWORD *)(v30 + 268) = 0;
  *(_DWORD *)(v30 + 271) = 0;
  *(_WORD *)(v30 + 275) = 257;
  *(_BYTE *)(v30 + 277) = 0;
  *(_OWORD *)(v30 + 280) = 0u;
  *(_OWORD *)(v30 + 296) = 0u;
  *(_OWORD *)(v30 + 312) = 0u;
  *(_OWORD *)(v30 + 328) = 0u;
  *(_OWORD *)(v30 + 344) = 0u;
  *(_OWORD *)(v30 + 360) = 0u;
  *(_OWORD *)(v30 + 376) = 0u;
  *(_OWORD *)(v30 + 392) = 0u;
  *(_QWORD *)(v30 + 408) = -1;
  *(_BYTE *)(v30 + 416) = 1;
  if (md::RouteLineSection::RouteLineSection(float,float,GEOComposedRouteSection *,unsigned long,GEOTransportType,GEOStyleAttributes *,unsigned long,BOOL)::once != -1)
    dispatch_once(&md::RouteLineSection::RouteLineSection(float,float,GEOComposedRouteSection *,unsigned long,GEOTransportType,GEOStyleAttributes *,unsigned long,BOOL)::once, &__block_literal_global_24757);
  v10 = v239;
  *(_DWORD *)(v30 + 96) = -1082130432;
  v36 = *(void **)(v30 + 136);
  v37 = v237;
  if (v36)
  {
    free(v36);
    *(_QWORD *)(v30 + 136) = 0;
  }
  *(_QWORD *)(v30 + 144) = 0;
  *(_QWORD *)(v30 + 152) = 0xBFF0000000000000;

  v39 = *(char **)(v25 + 288);
  v38 = *(_QWORD *)(v25 + 296);
  if ((unint64_t)v39 >= v38)
  {
    v41 = *(char **)(v25 + 280);
    v42 = (v39 - v41) >> 3;
    v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61)
      abort();
    v44 = v38 - (_QWORD)v41;
    if (v44 >> 2 > v43)
      v43 = v44 >> 2;
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
      v45 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v45 = v43;
    if (v45)
    {
      if (v45 >> 61)
        goto LABEL_171;
      v46 = (char *)operator new(8 * v45);
    }
    else
    {
      v46 = 0;
    }
    v61 = (uint64_t *)&v46[8 * v42];
    v62 = &v46[8 * v45];
    *v61 = v30;
    v63 = v61 + 1;
    if (v39 == v41)
    {
      v12 = v233;
      v10 = v239;
      v40 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
    }
    else
    {
      v64 = v39 - v41 - 8;
      v12 = v233;
      v10 = v239;
      if (v64 >= 0x78)
      {
        v40 = &md::SignedDistanceFieldGenerator::_hypotCache[32438];
        if (&v46[v39 - v41 - (v64 & 0xFFFFFFFFFFFFFFF8) - 8] >= v39
          || &v39[-(v64 & 0xFFFFFFFFFFFFFFF8) - 8] >= (char *)v61)
        {
          v65 = (v64 >> 3) + 1;
          v66 = &v46[8 * v42 - 16];
          v67 = v39 - 32;
          v68 = v65 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v69 = *((_OWORD *)v67 + 1);
            *((_OWORD *)v66 - 1) = *(_OWORD *)v67;
            *(_OWORD *)v66 = v69;
            *(_OWORD *)v67 = 0uLL;
            *((_OWORD *)v67 + 1) = 0uLL;
            v67 -= 32;
            v66 -= 32;
            v68 -= 4;
          }
          while (v68);
          v61 -= v65 & 0x3FFFFFFFFFFFFFFCLL;
          v39 -= 8 * (v65 & 0x3FFFFFFFFFFFFFFCLL);
          if (v65 == (v65 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_45;
        }
      }
      else
      {
        v40 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
      }
      do
      {
        v70 = *((_QWORD *)v39 - 1);
        v39 -= 8;
        *--v61 = v70;
        *(_QWORD *)v39 = 0;
      }
      while (v39 != v41);
    }
LABEL_45:
    v72 = *(char **)(v25 + 280);
    v71 = *(char **)(v25 + 288);
    *(_QWORD *)(v25 + 280) = v61;
    *(_QWORD *)(v25 + 288) = v63;
    *(_QWORD *)(v25 + 296) = v62;
    if (v71 != v72)
    {
      v73 = v71;
      do
      {
        v75 = (_QWORD *)*((_QWORD *)v73 - 1);
        v73 -= 8;
        v74 = v75;
        if (v75)
        {
          _ZF = (*v74)-- == 1;
          if (_ZF)
          {
            md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v74 + 1));
            {
              v77 = operator new();
              *((_QWORD *)v40 + 299) = geo::MallocZoneAllocator::MallocZoneAllocator(v77, "VectorKitLabels", 0x5ED09DD50000000FLL);
            }
            (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)v40 + 299) + 40))(*((_QWORD *)v40 + 299), *((_QWORD *)v71 - 1), 424);
            *((_QWORD *)v71 - 1) = 0;
          }
        }
        v71 = v73;
      }
      while (v73 != v72);
    }
    if (v72)
      operator delete(v72);
    *(_QWORD *)(v25 + 288) = v63;
    v19 = v234;
    v37 = v237;
    goto LABEL_58;
  }
  *(_QWORD *)v39 = v30;
  *(_QWORD *)(v25 + 288) = v39 + 8;
  v12 = v233;
  v40 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
LABEL_58:

  v78 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288);
  v79 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v80 = *(_QWORD **)(v78 - 8);
  if (v80)
    ++*v80;
  v81 = *(_QWORD **)(v79 + 48);
  if (v81)
  {
    _ZF = (*v81)-- == 1;
    if (_ZF)
    {
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v81 + 1));
      {
        v227 = operator new();
        *((_QWORD *)v40 + 299) = geo::MallocZoneAllocator::MallocZoneAllocator(v227, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)v40 + 299) + 40))(*((_QWORD *)v40 + 299), *(_QWORD *)(v79 + 48), 424);
      *(_QWORD *)(v79 + 48) = 0;
      v80 = *(_QWORD **)(v78 - 8);
    }
  }
  *(_QWORD *)(v79 + 48) = v80;
  v83 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v84 = *(unint64_t **)(v83 + 48);
  v85 = *v84;
  *(_QWORD *)(v83 + 48) = v84 + 1;
  v86 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  if (v86)
    v87 = (_QWORD *)(v86 + 8);
  else
    v87 = 0;
  v88 = (_BYTE *)v87[1];
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v87[3] - (_QWORD)v88) >> 4) < v85)
  {
    if (v85 > 0x555555555555555)
      abort();
    v89 = (_BYTE *)v87[2];
    v90 = (char *)operator new(48 * v85);
    v91 = &v90[48 * ((v89 - v88) / 48)];
    v92 = v91;
    if (v89 != v88)
    {
      v93 = &v90[48 * ((v89 - v88) / 48)];
      do
      {
        v92 = v93 - 48;
        v94 = *((_OWORD *)v89 - 3);
        v95 = *((_OWORD *)v89 - 1);
        *((_OWORD *)v93 - 2) = *((_OWORD *)v89 - 2);
        *((_OWORD *)v93 - 1) = v95;
        *((_OWORD *)v93 - 3) = v94;
        v89 -= 48;
        v93 -= 48;
      }
      while (v89 != v88);
    }
    v87[1] = v92;
    v87[2] = v91;
    v87[3] = &v90[48 * v85];
    if (v88)
      operator delete(v88);
  }
  v96 = objc_msgSend(v12, "routeStart");
  v97 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  if (v97)
    v98 = v97 + 8;
  else
    v98 = 0;
  *(_QWORD *)(v98 + 112) = v96;
  v99 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  if (v99)
    v100 = v99 + 8;
  else
    v100 = 0;
  v101 = 1.0 / *(double *)(*(_QWORD *)(a1 + 32) + 264);
  *(float *)(v100 + 152) = v101;
  v102 = *(_QWORD **)(a1 + 32);
  v103 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  if (v103)
    v104 = (_QWORD *)(v103 + 8);
  else
    v104 = 0;
  v104[21] = v102[2];
  v104[22] = v102[3];
  v104[23] = v102[4];
  v104[24] = v102[5];
  v104[25] = v102[6];
  v104[26] = v102[7];

LABEL_85:
  v105 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(id *)(v105 + 40) != v12)
  {
    objc_msgSend(v12, "section");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "vkBounds");
    vala = v107;
    objc_msgSend(v12, "section");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "vkBounds");
    v240 = v109;
    objc_msgSend(v12, "section");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v110;
    if (v110)
    {
      objc_msgSend(v110, "bounds");
      v112 = *(double *)&v252;
    }
    else
    {
      v112 = 0.0;
    }
    objc_msgSend(v12, "section", v228);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "vkBounds");
    v238 = v114;
    objc_msgSend(v12, "section");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "vkBounds");
    v235 = v116;
    objc_msgSend(v12, "section");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v117;
    if (v117)
    {
      objc_msgSend(v117, "bounds");
      v119 = v250;
    }
    else
    {
      v119 = 0.0;
    }
    objc_msgSend(v12, "section");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v120;
    if (v120)
    {
      objc_msgSend(v120, "bounds");
      v122 = v249;
    }
    else
    {
      v122 = 0.0;
    }

    v123.f64[0] = v238;
    v123.f64[1] = v235;
    v124 = *(_QWORD *)(a1 + 32);
    v125.f64[0] = vala;
    v125.f64[1] = v240;
    v126 = vsubq_f64(v123, v125);
    v123.f64[0] = *(float64_t *)(v124 + 32);
    v127 = v119 - v112 + v122;
    v128 = (v112 - v123.f64[0]) / v127;
    *(float *)v123.f64 = (*(double *)(v124 + 56) - v123.f64[0]) / v127;
    *(float *)v123.f64 = 1.0 / *(float *)v123.f64;
    *(float *)&v128 = v128;
    *(float *)&v128 = *(float *)v123.f64 * *(float *)&v128;
    v129 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    *(_DWORD *)(v129 + 56) = LODWORD(v123.f64[0]);
    _Q1 = *(float64x2_t *)(v124 + 16);
    v131 = vdivq_f64(vsubq_f64(v125, _Q1), v126);
    v132 = vdivq_f64(vsubq_f64(*(float64x2_t *)(v124 + 40), _Q1), v126);
    __asm { FMOV            V1.2S, #1.0 }
    *(float32x2_t *)&v132.f64[0] = vdiv_f32(*(float32x2_t *)&_Q1.f64[0], vcvt_f32_f64(v132));
    *(float64_t *)(v129 + 48) = v132.f64[0];
    *(float32x2_t *)(v129 + 60) = vmul_f32(*(float32x2_t *)&v132.f64[0], vcvt_f32_f64(v131));
    *(_DWORD *)(v129 + 68) = LODWORD(v128);
    v105 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  v136 = a3;
  v137 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v138 = *(float *)(v137 + 56);
  v139 = a2[2];
  v140 = *(float32x2_t *)(v137 + 48);
  v141 = *(float32x2_t *)a2;
  v246 = *(float32x2_t *)(v137 + 60);
  v142 = *(float *)(v137 + 68);
  objc_storeStrong((id *)(v105 + 40), v10);
  v143 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48);
  v144 = *v136;
  v145 = objc_msgSend(v12, "pointCount");
  if (v143)
    v146 = v143 + 8;
  else
    v146 = 0;
  v147 = v142 + (float)(v139 * v138);
  v148 = vmla_f32(v246, v140, v141);
  v149 = *(unsigned __int8 *)(a7 + 4);
  v150 = *(float *)a7;
  v151 = *(char **)(v146 + 8);
  v152 = *(char **)(v146 + 16);
  _ZF = v151 == v152 || v145 - 1 == a4;
  if (!_ZF)
  {
    if (*(_BYTE *)(v146 + 256))
    {
      if (v149 != *(unsigned __int8 *)(a7 + 5) && (v150 == 0.0 || v150 == 1.0) || *((float *)v152 - 3) != a8)
        goto LABEL_143;
    }
    else if (*(v152 - 4) != v149)
    {
      goto LABEL_143;
    }
    v154 = *((float *)v152 - 12);
    v155 = vabds_f32(v154, v148.f32[0]);
    if (v155 <= (float)(fabsf(v148.f32[0] + v154) * 0.000011921) || v155 <= 1.1755e-38)
    {
      v157 = *((float *)v152 - 11);
      v158 = vabds_f32(v157, v148.f32[1]);
      if (v158 <= (float)(fabsf(v148.f32[1] + v157) * 0.000011921) || v158 <= 1.1755e-38)
      {
        v160 = *((float *)v152 - 10);
        v161 = vabds_f32(v160, v147);
        if (v161 <= (float)(fabsf(v147 + v160) * 0.000011921) || v161 <= 1.1755e-38)
          goto LABEL_161;
      }
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v152 - v151) >> 4) >= 2)
    {
      v163 = (float *)&v151[16 * ((v152 - v151) >> 4)];
      v165 = *(v163 - 24);
      v164 = (char *)(v163 - 24);
      v166 = v165;
      v167 = vabds_f32(v165, v154);
      if (v167 <= (float)(fabsf(v165 + v154) * 0.000011921) || v167 <= 1.1755e-38)
      {
        v176 = *((float *)v164 + 1);
        v175 = *((float *)v152 - 11);
        v169 = vabds_f32(v176, v175);
        if (v169 <= (float)(fabsf(v175 + v176) * 0.000011921) || v169 <= 1.1755e-38)
        {
          v171 = *((float *)v164 + 2);
          v172 = *((float *)v152 - 10);
          v173 = vabds_f32(v171, v172);
          if (v173 <= (float)(fabsf(v172 + v171) * 0.000011921) || v173 <= 1.1755e-38)
            goto LABEL_143;
        }
      }
      else
      {
        v175 = *((float *)v152 - 11);
        v176 = *((float *)v164 + 1);
      }
      v177 = v154 - v166;
      v178 = v175 - v176;
      v179 = *((float *)v152 - 10);
      v180 = v179 - *((float *)v164 + 2);
      v181 = v148.f32[0] - v154;
      v182 = v148.f32[1] - v175;
      v183 = v147 - v179;
      v184 = sqrtf((float)((float)(v181 * v181) + (float)(v182 * v182)) + (float)(v183 * v183));
      if ((float)((float)((float)((float)(v177 * v181) + (float)(v182 * v178)) + (float)(v183 * v180))
                 / (float)(v184 * sqrtf((float)((float)(v177 * v177) + (float)(v178 * v178)) + (float)(v180 * v180)))) < *(float *)(v146 + 160)
        && (float)(*(float *)(v146 + 152) * v184) < *(float *)(v146 + 156))
      {
        goto LABEL_161;
      }
    }
  }
LABEL_143:
  v185 = *(_BYTE *)(a7 + 5);
  v186 = *(_QWORD *)(v146 + 24);
  if ((unint64_t)v152 < v186)
  {
    *(float32x2_t *)v152 = v148;
    *((float *)v152 + 2) = v147;
    *(_QWORD *)(v152 + 12) = v144;
    *((_QWORD *)v152 + 3) = 0;
    *((_DWORD *)v152 + 8) = 0;
    *((float *)v152 + 9) = a8;
    *((float *)v152 + 10) = v150;
    v152[44] = v149;
    v152[45] = v185;
    v187 = v152 + 48;
    *((_WORD *)v152 + 23) = 253;
LABEL_160:
    *(_QWORD *)(v146 + 16) = v187;
    goto LABEL_161;
  }
  v188 = 0xAAAAAAAAAAAAAAABLL * ((v152 - v151) >> 4) + 1;
  if (v188 > 0x555555555555555)
    abort();
  v189 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v186 - (_QWORD)v151) >> 4);
  if (2 * v189 > v188)
    v188 = 2 * v189;
  if (v189 >= 0x2AAAAAAAAAAAAAALL)
    v190 = 0x555555555555555;
  else
    v190 = v188;
  if (!v190)
  {
    v191 = 0;
    goto LABEL_155;
  }
  v247 = v148;
  if (v190 > 0x555555555555555)
LABEL_171:
    std::__throw_bad_array_new_length[abi:nn180100]();
  v191 = (char *)operator new(48 * v190);
  v148 = v247;
LABEL_155:
  v192 = &v191[16 * ((v152 - v151) >> 4)];
  *(float32x2_t *)v192 = v148;
  *((float *)v192 + 2) = v147;
  *(_QWORD *)(v192 + 12) = v144;
  *((_QWORD *)v192 + 3) = 0;
  *((_DWORD *)v192 + 8) = 0;
  *((float *)v192 + 9) = a8;
  *((float *)v192 + 10) = v150;
  v192[44] = v149;
  v192[45] = v185;
  *((_WORD *)v192 + 23) = 253;
  v187 = v192 + 48;
  if (v152 != v151)
  {
    do
    {
      v193 = *((_OWORD *)v152 - 3);
      v194 = *((_OWORD *)v152 - 1);
      *((_OWORD *)v192 - 2) = *((_OWORD *)v152 - 2);
      *((_OWORD *)v192 - 1) = v194;
      *((_OWORD *)v192 - 3) = v193;
      v192 -= 48;
      v152 -= 48;
    }
    while (v152 != v151);
    v152 = *(char **)(v146 + 8);
  }
  *(_QWORD *)(v146 + 8) = v192;
  *(_QWORD *)(v146 + 16) = v187;
  *(_QWORD *)(v146 + 24) = &v191[48 * v190];
  if (!v152)
    goto LABEL_160;
  operator delete(v152);
  *(_QWORD *)(v146 + 16) = v187;
LABEL_161:
  v195 = *(_DWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v195[12] = *(_DWORD *)a2;
  v195[13] = *((_DWORD *)a2 + 1);
  v195[14] = *((_DWORD *)a2 + 2);

}

@end
