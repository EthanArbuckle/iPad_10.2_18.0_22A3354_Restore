@implementation VKRouteInfo

- (void)_decodeVisualInfos:(id)a3 withRouteEtaType:(int64_t)a4 into:(id)a5 needsDescription:(BOOL)a6
{
  void *v6;
  _BOOL4 v7;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VKRouteEtaDescription *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  char *v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t *v47;
  char *v48;
  uint64_t v49;
  __int128 v50;
  void *v51;
  VKRouteRangeAnnotationInfo *v52;
  uint64_t v53;
  uint64_t v54;
  VKRouteRangeAnnotationInfo *v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  _BOOL4 v59;
  id obj;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  VKRouteEtaDescription *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v7 = a6;
  v85 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v61 = a5;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v11)
  {
    v62 = *(_QWORD *)v80;
    v59 = v7;
    v58 = a4;
    do
    {
      v67 = 0;
      do
      {
        if (*(_QWORD *)v80 != v62)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v67);
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "basicString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v12;
        LOBYTE(v12) = v14 == 0;

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v70, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "basicString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "appendString:", v16);

        }
        objc_msgSend(v70, "detail");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithDefaultValues");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
          objc_msgSend(v69, "appendFormat:", CFSTR("\n%@"), v68);
        if (v7 && !objc_msgSend(v69, "length"))
          goto LABEL_71;
        v18 = [VKRouteEtaDescription alloc];
        objc_msgSend(v70, "icon");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v70, "icon");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "iconDataSource");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "styleAttributes");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v6;
        }
        else
        {
          v20 = 0;
        }
        v66 = -[VKRouteEtaDescription initWithEtaText:etaAdvisoryStyleAttributes:routeEtaType:](v18, "initWithEtaText:etaAdvisoryStyleAttributes:routeEtaType:", v69, v20, a4);
        if (v19)
        {

        }
        if (a4 == 5 || a4 == 2)
        {
          objc_msgSend(v70, "styleAttributes");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v65 != 0;
          if (a4 == 5)
            goto LABEL_23;
        }
        else
        {
          v21 = 0;
        }
        if (a4 == 2)
LABEL_23:

        if (v21)
        {
          objc_msgSend(v70, "styleAttributes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "attributesCount");

          {
            v56 = operator new();
            mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v56, "VectorKitLabels", 0x5ED09DD50000000FLL);
          }
          v25 = v23;
          v72 = mdm::Allocator::instance(void)::alloc;
          if (v23)
          {
            v26 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                               + 16))(mdm::Allocator::instance(void)::alloc, 8 * v23, 4);
            v74 = &v26[8 * v25];
          }
          else
          {
            v74 = 0;
            v26 = 0;
          }
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          objc_msgSend(v70, "styleAttributes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "attributes");
          v71 = (id)objc_claimAutoreleasedReturnValue();

          v28 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
          if (v28)
          {
            v73 = *(_QWORD *)v76;
            v29 = v26;
            while (1)
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v76 != v73)
                  objc_enumerationMutation(v71);
                v31 = v11;
                v32 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
                v33 = objc_msgSend(v32, "key");
                v34 = objc_msgSend(v32, "value");
                v35 = v34;
                if (v26 >= v74)
                {
                  v36 = (v26 - v29) >> 3;
                  v37 = v36 + 1;
                  if ((unint64_t)(v36 + 1) >> 61)
                    abort();
                  if ((v74 - v29) >> 2 > v37)
                    v37 = (v74 - v29) >> 2;
                  if ((unint64_t)(v74 - v29) >= 0x7FFFFFFFFFFFFFF8)
                    v38 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v38 = v37;
                  if (v38)
                  {
                    v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v72 + 16))(v72, 8 * v38, 4);
                    v40 = (unint64_t *)(v39 + 8 * v36);
                    v38 = v39 + 8 * v38;
                    if (v39)
                      *v40 = v33 | (unint64_t)(v35 << 32);
                  }
                  else
                  {
                    v40 = (unint64_t *)(8 * v36);
                  }
                  v11 = v31;
                  if (v26 != v29)
                  {
                    v41 = v26 - v29 - 8;
                    if (v41 < 0x138
                      || (unint64_t *)((char *)v40 - (v41 & 0xFFFFFFFFFFFFFFF8) - 8) > v40 - 1
                      || &v26[-(v41 & 0xFFFFFFFFFFFFFFF8) - 8] > v26 - 8
                      || (unint64_t)(v26 - (char *)v40) < 0x20)
                    {
                      v42 = v26;
                      v43 = (char *)v40;
                    }
                    else
                    {
                      v46 = (v41 >> 3) + 1;
                      v42 = &v26[-8 * (v46 & 0x3FFFFFFFFFFFFFFCLL)];
                      v47 = v40 - 2;
                      v48 = v26 - 16;
                      v49 = v46 & 0x3FFFFFFFFFFFFFFCLL;
                      do
                      {
                        v50 = *(_OWORD *)v48;
                        *((_OWORD *)v47 - 1) = *((_OWORD *)v48 - 1);
                        *(_OWORD *)v47 = v50;
                        v47 -= 4;
                        v48 -= 32;
                        v49 -= 4;
                      }
                      while (v49);
                      v43 = (char *)&v40[-(v46 & 0x3FFFFFFFFFFFFFFCLL)];
                      if (v46 == (v46 & 0x3FFFFFFFFFFFFFFCLL))
                      {
LABEL_53:
                        v45 = v29;
                        v29 = v43;
                        v26 = (char *)(v40 + 1);
                        if (v45)
                          goto LABEL_54;
                        goto LABEL_55;
                      }
                    }
                    do
                    {
                      v44 = *((_QWORD *)v42 - 1);
                      v42 -= 8;
                      *((_QWORD *)v43 - 1) = v44;
                      v43 -= 8;
                    }
                    while (v42 != v29);
                    goto LABEL_53;
                  }
                  v45 = v26;
                  v29 = (char *)v40;
                  v26 = (char *)(v40 + 1);
                  if (v45)
LABEL_54:
                    (*(void (**)(uint64_t, char *, int64_t))(*(_QWORD *)v72 + 40))(v72, v45, v74 - v45);
LABEL_55:
                  v74 = (char *)v38;
                  continue;
                }
                if (v26)
                  *(_QWORD *)v26 = v33 | (unint64_t)(v34 << 32);
                v26 += 8;
                v11 = v31;
              }
              v28 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
              if (!v28)
                goto LABEL_68;
            }
          }
          v29 = v26;
LABEL_68:

          v7 = v59;
          a4 = v58;
          -[VKRouteEtaDescription styleAttributes](v66, "styleAttributes");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "replaceAttributes:count:", v29, (unint64_t)(v26 - v29) >> 3);

          if (v29)
            (*(void (**)(uint64_t, char *, int64_t))(*(_QWORD *)v72 + 40))(v72, v29, v74 - v29);
        }
        v52 = [VKRouteRangeAnnotationInfo alloc];
        v53 = objc_msgSend(v70, "routeCoordinateRange");
        objc_msgSend(v70, "routeCoordinateRange");
        v55 = -[VKRouteRangeAnnotationInfo initWithEtaDescription:start:end:](v52, "initWithEtaDescription:start:end:", v66, v53, v54);
        objc_msgSend(v61, "addObject:", v55);

LABEL_71:
        ++v67;
      }
      while (v67 != v11);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      v11 = v57;
    }
    while (v57);
  }

}

- (BOOL)_isHikingRoute
{
  return -[GEOComposedRoute source](self->_route, "source") == 2
      || -[GEOComposedRoute source](self->_route, "source") == 3;
}

- (BOOL)_isReRoute
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v6;

  -[GEOComposedRoute anchorPoints](self->_route, "anchorPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "routeCoordinate");
  v6 = vabds_f32(*((float *)&v4 + 1), *(float *)(MEMORY[0x1E0D26AA8] + 4)) >= 0.00000011921
    || *MEMORY[0x1E0D26AA8] != (_DWORD)v4;

  return v6;
}

- (VKRouteInfo)initWithComposedRoute:(id)a3 etaText:(id)a4
{
  id v6;
  id v7;
  VKRouteEtaDescription *v8;
  VKRouteInfo *v9;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = -[VKRouteEtaDescription initWithEtaText:]([VKRouteEtaDescription alloc], "initWithEtaText:", v7);
  else
    v8 = 0;
  v9 = -[VKRouteInfo initWithComposedRoute:etaDescription:](self, "initWithComposedRoute:etaDescription:", v6, v8);

  return v9;
}

- (VKRouteInfo)initWithComposedRoute:(id)a3 etaDescription:(id)a4
{
  VKRouteInfo *v7;
  VKRouteInfo *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  VKRouteInfo *v29;
  id obj;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v33 = a4;
  v39.receiver = self;
  v39.super_class = (Class)VKRouteInfo;
  v7 = -[VKRouteInfo init](&v39, sel_init);
  v8 = v7;
  if (v7)
  {
    -[VKRouteInfo setEtaDescription:](v7, "setEtaDescription:", v33);
    objc_storeStrong((id *)&v8->_route, a3);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKRouteInfo _processWaypoints:](v8, "_processWaypoints:", v9);
    obj = v9;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKRouteInfo _processAnchorpoints:](v8, "_processAnchorpoints:", v10);
    v32 = v10;
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v34, "visualInfos");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "type", obj, v32);
          v19 = v11;
          if (v18 != 131073)
          {
            v20 = objc_msgSend(v17, "type");
            v19 = v12;
            if (v20 != 191)
              continue;
          }
          objc_msgSend(v19, "addObject:", v17);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v14);
    }

    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKRouteInfo _decodeVisualInfos:withRouteEtaType:into:needsDescription:](v8, "_decodeVisualInfos:withRouteEtaType:into:needsDescription:", v11, 1, v21, 1);
    objc_storeStrong((id *)&v8->_exitSignAnnotations, v21);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKRouteInfo _decodeVisualInfos:withRouteEtaType:into:needsDescription:](v8, "_decodeVisualInfos:withRouteEtaType:into:needsDescription:", v12, 5, v22, 0);
    objc_storeStrong((id *)&v8->_travelDirectionAnnotations, v22);
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v34, "mutableData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v34, "mutableData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "trafficDelayInfos");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }

    -[VKRouteInfo _decodeVisualInfos:withRouteEtaType:into:needsDescription:](v8, "_decodeVisualInfos:withRouteEtaType:into:needsDescription:", v26, 2, v23, 1);
    objc_storeStrong((id *)&v8->_trafficAnnotations, v23);
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v34, "visualInfosForRouteNameLabels");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKRouteInfo _decodeVisualInfos:withRouteEtaType:into:needsDescription:](v8, "_decodeVisualInfos:withRouteEtaType:into:needsDescription:", v28, 4, v27, 1);
    objc_storeStrong((id *)&v8->_routeNameAnnotations, v27);
    objc_storeStrong((id *)&v8->_waypoints, obj);
    objc_storeStrong((id *)&v8->_anchorpoints, v32);
    -[VKRouteInfo _assignIndexPositions](v8, "_assignIndexPositions");
    v29 = v8;

  }
  return v8;
}

- (VKRouteInfo)initWithAnchorPoint:(id)a3
{
  id v4;
  VKRouteInfo *v5;
  NSArray *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  NSArray *waypoints;
  VKRouteInfo *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKRouteInfo;
  v5 = -[VKRouteInfo init](&v14, sel_init);
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "locationCoordinate");
    v10 = +[VKRouteWaypointInfo newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v4, 0, objc_msgSend(v4, "routeCoordinate"), v7, v8, v9, -180.0, -180.0, 1.79769313e308);
    objc_msgSend(v10, "setIsAtStart:", 1);
    -[NSArray addObject:](v6, "addObject:", v10);
    waypoints = v5->_waypoints;
    v5->_waypoints = v6;

    v12 = v5;
  }

  return v5;
}

- (void)setEtaDescription:(id)a3
{
  VKRouteEtaDescription *v5;
  VKRouteRangeAnnotationInfo *v6;
  VKRouteRangeAnnotationInfo *routeEtaAnnotation;
  VKRouteEtaDescription *v8;

  v5 = (VKRouteEtaDescription *)a3;
  if (self->_etaDescription != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_etaDescription, a3);
    if (self->_etaDescription && self->_route)
    {
      v6 = -[VKRouteRangeAnnotationInfo initWithEtaDescription:start:end:]([VKRouteRangeAnnotationInfo alloc], "initWithEtaDescription:start:end:", self->_etaDescription, 0, -[GEOComposedRoute endRouteCoordinate](self->_route, "endRouteCoordinate"));
      routeEtaAnnotation = self->_routeEtaAnnotation;
      self->_routeEtaAnnotation = v6;
    }
    else
    {
      routeEtaAnnotation = self->_routeEtaAnnotation;
      self->_routeEtaAnnotation = 0;
    }

    v5 = v8;
  }

}

- (BOOL)hasRouteEta
{
  VKRouteEtaDescription *etaDescription;
  void *v4;
  void *v5;
  BOOL v6;

  etaDescription = self->_etaDescription;
  if (!etaDescription)
    return 0;
  -[VKRouteEtaDescription etaText](etaDescription, "etaText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VKRouteEtaDescription etaText](self->_etaDescription, "etaText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasRouteLegEtas
{
  NSArray *routeLegEtaAnnotations;

  routeLegEtaAnnotations = self->_routeLegEtaAnnotations;
  if (routeLegEtaAnnotations)
    LOBYTE(routeLegEtaAnnotations) = -[NSArray count](routeLegEtaAnnotations, "count") != 0;
  return (char)routeLegEtaAnnotations;
}

- (void)visitAnnotations:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__VKRouteInfo_visitAnnotations___block_invoke;
  v7[3] = &unk_1E42F2AC0;
  v5 = (void (**)(_QWORD))v4;
  v8 = v5;
  v6 = (void *)MEMORY[0x1A1AF5730](v7);
  if (self->_routeEtaAnnotation)
    v5[2](v5);
  -[NSArray enumerateObjectsUsingBlock:](self->_debugAnnotations, "enumerateObjectsUsingBlock:", v6);
  -[NSArray enumerateObjectsUsingBlock:](self->_routeLegEtaAnnotations, "enumerateObjectsUsingBlock:", v6);
  -[NSArray enumerateObjectsUsingBlock:](self->_trafficAnnotations, "enumerateObjectsUsingBlock:", v6);
  -[NSArray enumerateObjectsUsingBlock:](self->_exitSignAnnotations, "enumerateObjectsUsingBlock:", v6);
  -[NSArray enumerateObjectsUsingBlock:](self->_routeNameAnnotations, "enumerateObjectsUsingBlock:", v6);

}

- (id)waypointForWaypoint:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *j;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_waypoints;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "waypoint");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          objc_msgSend(v9, "waypoint");
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_20:
          v12 = (void *)v18;
          goto LABEL_21;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v6)
        continue;
      break;
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_anchorpoints;
  v12 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v15, "waypoint", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v4);

        if (v17)
        {
          objc_msgSend(v15, "waypoint");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
      }
      v12 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_21:

  return v12;
}

- (id)waypointInfoForWaypoint:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_waypoints;
    v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "waypoint", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_processWaypoints:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  unint64_t i;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;

  v47 = a3;
  -[GEOComposedRoute legs](self->_route, "legs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[GEOComposedRoute legs](self->_route, "legs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && (!objc_msgSend(v8, "isCurrentLocation")
       || -[VKRouteInfo _isHikingRoute](self, "_isHikingRoute") && !-[VKRouteInfo _isReRoute](self, "_isReRoute")))
    {
      -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", objc_msgSend(v7, "startRouteCoordinate"));
      v11 = v10;
      v13 = v12;
      v15 = v14;
      if ((unint64_t)objc_msgSend(v7, "pointCount") < 2)
      {
        v21 = 1.79769313e308;
        v17 = -180.0;
        v19 = -180.0;
      }
      else
      {
        -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", objc_msgSend(v7, "startPointIndex") + 1);
        v17 = v16;
        v19 = v18;
        v21 = v20;
      }
      -[GEOComposedRoute waypointDisplayInfoForWaypoint:](self->_route, "waypointDisplayInfoForWaypoint:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[VKRouteWaypointInfo newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v9, v22, 0, objc_msgSend(v7, "startRouteCoordinate"), v11, v13, v15, v17, v19, v21);
      objc_msgSend(v23, "setIsAtStart:", 1);
      objc_msgSend(v47, "addObject:", v23);

    }
  }
  for (i = 0; ; ++i)
  {
    -[GEOComposedRoute legs](self->_route, "legs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (i >= v26)
      break;
    -[GEOComposedRoute legs](self->_route, "legs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", i);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "destination");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29
      && (!objc_msgSend(v29, "isCurrentLocation") || -[VKRouteInfo _isHikingRoute](self, "_isHikingRoute")))
    {
      -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", objc_msgSend(v28, "endRouteCoordinate"));
      v32 = v31;
      v34 = v33;
      v36 = v35;
      if ((unint64_t)objc_msgSend(v28, "pointCount") < 2)
      {
        v40 = -180.0;
        v42 = 1.79769313e308;
        v38 = -180.0;
      }
      else
      {
        -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", objc_msgSend(v28, "endPointIndex") - 1);
        v38 = v37;
        v40 = v39;
        v42 = v41;
      }
      -[GEOComposedRoute waypointDisplayInfoForWaypoint:](self->_route, "waypointDisplayInfoForWaypoint:", v30);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = +[VKRouteWaypointInfo newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v30, v43, i, objc_msgSend(v28, "endRouteCoordinate"), v32, v34, v36, v38, v40, v42);
      -[GEOComposedRoute legs](self->_route, "legs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count") - 1;

      if (i == v46)
        objc_msgSend(v44, "setIsAtEnd:", 1);
      objc_msgSend(v47, "addObject:", v44);

    }
  }

}

- (void)_processAnchorpoints:(id)a3
{
  unint64_t i;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;

  v22 = a3;
  for (i = 0; ; ++i)
  {
    -[GEOComposedRoute anchorPoints](self->_route, "anchorPoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (i >= v6)
      break;
    -[GEOComposedRoute anchorPoints](self->_route, "anchorPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && objc_msgSend(v8, "anchorPointType") != 1 && objc_msgSend(v8, "anchorPointType") != 2)
    {
      -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", objc_msgSend(v8, "routeCoordinate"));
      v10 = v9;
      v12 = v11;
      v14 = v13;
      if ((objc_msgSend(v8, "routeCoordinate") & 0xFFFFFFFELL) != 0)
      {
        -[GEOComposedRoute pointWithAltitudeCorrectionAtRouteCoordinate:](self->_route, "pointWithAltitudeCorrectionAtRouteCoordinate:", objc_msgSend(v8, "routeCoordinate") - 1);
        v16 = v15;
        v18 = v17;
        v20 = v19;
      }
      else
      {
        v20 = 1.79769313e308;
        v16 = -180.0;
        v18 = -180.0;
      }
      v21 = +[VKRouteWaypointInfo newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:](VKRouteWaypointInfo, "newRouteWaypointForAnchorpoint:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v8, 0, objc_msgSend(v8, "routeCoordinate"), v10, v12, v14, v16, v18, v20);
      objc_msgSend(v22, "addObject:", v21);

    }
  }

}

- (void)_assignIndexPositions
{
  void *v3;
  unint64_t i;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "addObjectsFromArray:", self->_waypoints);
  objc_msgSend(v6, "addObjectsFromArray:", self->_anchorpoints);
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_14903);
  v3 = v6;
  for (i = 0; i < objc_msgSend(v3, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWaypointIndex:", i);

    v3 = v6;
  }

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (VKRouteEtaDescription)etaDescription
{
  return self->_etaDescription;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (void)setHasFocus:(BOOL)a3
{
  self->_hasFocus = a3;
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (NSArray)anchorpoints
{
  return self->_anchorpoints;
}

- (NSArray)trafficAnnotations
{
  return self->_trafficAnnotations;
}

- (NSArray)exitSignAnnotations
{
  return self->_exitSignAnnotations;
}

- (NSArray)routeLegEtaAnnotations
{
  return self->_routeLegEtaAnnotations;
}

- (void)setRouteLegEtaAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_routeLegEtaAnnotations, a3);
}

- (NSArray)travelDirectionAnnotations
{
  return self->_travelDirectionAnnotations;
}

- (void)setTravelDirectionAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_travelDirectionAnnotations, a3);
}

- (NSArray)routeNameAnnotations
{
  return self->_routeNameAnnotations;
}

- (void)setRouteNameAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_routeNameAnnotations, a3);
}

- (NSArray)debugAnnotations
{
  return self->_debugAnnotations;
}

- (void)setDebugAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_debugAnnotations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorpoints, 0);
  objc_storeStrong((id *)&self->_routeEtaAnnotation, 0);
  objc_storeStrong((id *)&self->_debugAnnotations, 0);
  objc_storeStrong((id *)&self->_travelDirectionAnnotations, 0);
  objc_storeStrong((id *)&self->_routeNameAnnotations, 0);
  objc_storeStrong((id *)&self->_routeLegEtaAnnotations, 0);
  objc_storeStrong((id *)&self->_exitSignAnnotations, 0);
  objc_storeStrong((id *)&self->_trafficAnnotations, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_etaDescription, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

uint64_t __36__VKRouteInfo__assignIndexPositions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "polylineCoordinate");
  v6 = objc_msgSend(v4, "polylineCoordinate");
  if (v5 < v6 || (_DWORD)v5 == (_DWORD)v6 && *((float *)&v5 + 1) < *((float *)&v6 + 1))
    v7 = -1;
  else
    v7 = 1;

  return v7;
}

uint64_t __32__VKRouteInfo_visitAnnotations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
