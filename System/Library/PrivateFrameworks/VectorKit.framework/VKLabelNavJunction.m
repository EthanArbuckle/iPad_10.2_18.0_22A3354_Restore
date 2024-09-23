@implementation VKLabelNavJunction

- (VKLabelNavJunction)initWithGEOJunction:(GeoCodecsConnectivityJunction *)a3 routeOffset:(PolylineCoordinate)a4 tile:(const void *)a5
{
  VKLabelNavJunction *v8;
  VKLabelNavJunction *v9;
  LabelTile *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  geo::codec::VectorTile *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  GeoCodecsConnectivityJunction *geoJunction;
  uint64_t v25;
  uint64_t var1;
  uint64_t v27;
  unsigned int *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  float *v32;
  float64x2_t v33;
  double v34;
  GeoCodecsPointFeature *var2;
  uint64_t v36;
  NSString *name;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v41;
  _QWORD v42[3];
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)VKLabelNavJunction;
  v8 = -[VKLabelNavJunction init](&v43, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = *(LabelTile **)a5;
    v11 = *((_QWORD *)a5 + 1);
    if (v11)
    {
      v12 = (unint64_t *)(v11 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    cntrl = (std::__shared_weak_count *)v8->_tile.__cntrl_;
    v8->_tile.__ptr_ = v10;
    v8->_tile.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v9->_geoJunction = a3;
    v9->_routeOffset = a4;
    v9->_sortValue = a4.offset + (double)a4.index;
    v9->_preferredLabelPlacement = 0;
    v9->_depthFromRoute = -1;
    v9->_largestRoadClass = 8;
    v17 = *((_QWORD *)v9->_tile.__ptr_ + 3);
    v19 = *(geo::codec::VectorTile **)v17;
    v18 = *(std::__shared_weak_count **)(v17 + 8);
    v42[1] = *(_QWORD *)v17;
    v42[2] = v18;
    if (v18)
    {
      v20 = (unint64_t *)&v18->__shared_owners_;
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v22 = geo::codec::VectorTile::junctions(v19);
    v23 = geo::codec::VectorTile::overpasses(v19);
    geoJunction = v9->_geoJunction;
    if (v22 && v23)
      v9->_isOverpass = *(_WORD *)(v23 + (((uint64_t)geoJunction - v22) >> 4)) != 0;
    if (geoJunction)
    {
      if (!geoJunction->var0)
        goto LABEL_22;
      v25 = geo::codec::VectorTile::pointsOnRoad(v19);
      var1 = v9->_geoJunction->var1;
      v27 = geo::codec::VectorTile::lines(v19);
      v28 = (unsigned int *)(v25 + 16 * var1);
      v29 = (_QWORD *)(v27 + 168 * v28[1]);
      v41 = 0;
      v42[0] = 0;
      v30 = geo::codec::multiSectionFeaturePointsWithElevation(v29, v28[2], &v41, v42);
      v31 = v28[3];
      v32 = (float *)&v30[v31];
      v9->_tileCoordinate._e[0] = *v32;
      v9->_tileCoordinate._e[1] = v32[1];
      v33 = vmlaq_f64(*(float64x2_t *)((char *)v9->_tile.__ptr_ + 312), vcvtq_f64_f32((float32x2_t)v9->_tileCoordinate), vsubq_f64(*(float64x2_t *)((char *)v9->_tile.__ptr_ + 328), *(float64x2_t *)((char *)v9->_tile.__ptr_ + 312)));
      v34 = v41 ? *(float *)(v41 + 4 * v31) : 0.0;
      *(float64x2_t *)v9->_mercatorCoordinate._e = v33;
      v9->_mercatorCoordinate._e[2] = v34;
      geoJunction = v9->_geoJunction;
      if (geoJunction)
      {
LABEL_22:
        var2 = geoJunction->var2;
        if (var2 && *((_BYTE *)var2 + 73))
        {
          v9->_labelFeature = var2;
          v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *((_QWORD *)v9->_labelFeature + 2));
          name = v9->_name;
          v9->_name = (NSString *)v36;

        }
      }
    }
    if (v18)
    {
      v38 = (unint64_t *)&v18->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  return v9;
}

- (VKLabelNavJunction)initWithRoadEdge:(const GeoCodecsRoadEdge *)a3 atA:(BOOL)a4 routeOffset:(PolylineCoordinate)a5 tile:(const void *)a6
{
  _BOOL4 v8;
  VKLabelNavJunction *v10;
  VKLabelNavJunction *v11;
  uint64_t v12;
  LabelTile *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v18;
  NSMutableArray *v19;
  NSMutableArray *roads;
  __int128 v21;
  VKLabelNavRoad *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  float *v26;
  float64x2_t v27;
  double v28;
  VKLabelNavJunction *v29;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[56];
  objc_super v34;

  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)VKLabelNavJunction;
  v10 = -[VKLabelNavJunction init](&v34, sel_init);
  v11 = v10;
  if (v10)
  {
    v13 = *(LabelTile **)a6;
    v12 = *((_QWORD *)a6 + 1);
    if (v12)
    {
      v14 = (unint64_t *)(v12 + 8);
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    cntrl = (std::__shared_weak_count *)v10->_tile.__cntrl_;
    v10->_tile.__ptr_ = v13;
    v10->_tile.__cntrl_ = (__shared_weak_count *)v12;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v11->_routeOffset = a5;
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    roads = v11->_roads;
    v11->_roads = v19;

    v11->_sortValue = a5.offset + (double)a5.index;
    v11->_preferredLabelPlacement = 0;
    v11->_foundRoads = 1;
    v21 = *(_OWORD *)&a3->var2;
    *(_OWORD *)v33 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v33[16] = v21;
    *(_OWORD *)&v33[32] = *(_OWORD *)&a3->var4;
    *(_QWORD *)&v33[48] = a3->var6;
    if (*(_QWORD *)v33)
    {
      if (!v8)
      {
        *(int8x16_t *)&v33[8] = vextq_s8(*(int8x16_t *)&v33[8], *(int8x16_t *)&v33[8], 8uLL);
        *(int8x16_t *)&v33[24] = vextq_s8(*(int8x16_t *)&v33[24], *(int8x16_t *)&v33[24], 8uLL);
        *(int8x16_t *)&v33[40] = vextq_s8(*(int8x16_t *)&v33[40], *(int8x16_t *)&v33[40], 8uLL);
      }
      v22 = -[VKLabelNavRoad initWithRoadEdge:navJunctionA:routeOffset:tile:]([VKLabelNavRoad alloc], "initWithRoadEdge:navJunctionA:routeOffset:tile:", v33, v11, a5, a6);
      if (v22)
        -[NSMutableArray addObject:](v11->_roads, "addObject:", v22);

    }
    v31 = 0;
    v32 = 0;
    v23 = geo::codec::multiSectionFeaturePointsWithElevation(a3->var0, 0, &v31, &v32);
    v24 = 16;
    if (v8)
      v24 = 8;
    v25 = *(uint64_t *)((char *)&a3->var0 + v24);
    v26 = (float *)&v23[v25];
    v11->_tileCoordinate._e[0] = *v26;
    v11->_tileCoordinate._e[1] = v26[1];
    v27 = vmlaq_f64(*(float64x2_t *)((char *)v11->_tile.__ptr_ + 312), vcvtq_f64_f32((float32x2_t)v11->_tileCoordinate), vsubq_f64(*(float64x2_t *)((char *)v11->_tile.__ptr_ + 328), *(float64x2_t *)((char *)v11->_tile.__ptr_ + 312)));
    if (v31)
      v28 = *(float *)(v31 + 4 * v25);
    else
      v28 = 0.0;
    *(float64x2_t *)v11->_mercatorCoordinate._e = v27;
    v11->_mercatorCoordinate._e[2] = v28;
    v29 = v11;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[VKLabelNavRoadLabel setNavFeature:](self->_junctionSign, "setNavFeature:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VKLabelNavJunction;
  -[VKLabelNavJunction dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("VKLabelNavJunction "));
  -[VKLabelNavJunction roads](self, "roads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("roads:%@"), v4);

  return v3;
}

- (BOOL)matchesLocationForJunction:(id)a3
{
  VKLabelNavJunction *v4;
  VKLabelNavJunction *v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;

  v4 = (VKLabelNavJunction *)a3;
  v5 = v4;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (self->_tile.__ptr_ == *(LabelTile **)-[VKLabelNavJunction tile](v4, "tile"))
  {
    -[VKLabelNavJunction tileCoordinate](v5, "tileCoordinate");
    v6 = *(_QWORD *)&self->_tileCoordinate == __PAIR64__(v8, v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setRouteOffset:(PolylineCoordinate)a3
{
  NSMutableArray *roads;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_routeOffset.index != a3.index || vabds_f32(a3.offset, self->_routeOffset.offset) >= 0.00000011921)
  {
    self->_routeOffset = a3;
    self->_sortValue = a3.offset + (double)a3.index;
    roads = self->_roads;
    if (roads)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v5 = roads;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v10;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setRouteOffset:", a3, (_QWORD)v9);
          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

    }
  }
}

- (BOOL)isTileEdgeJunction
{
  float32x4_t v3;
  int16x4_t v4;

  if (self->_isRouteRefineJunction)
    return 0;
  if (self->_geoJunction)
    return 0;
  v3.i64[0] = (uint64_t)self->_tileCoordinate;
  v3.i64[1] = v3.i64[0];
  v4.i32[0] = vmovn_s32(vcgtq_f32(v3, (float32x4_t)xmmword_19FFB5D10)).u32[0];
  v4.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_19FFB5D10, v3)).i32[1];
  return vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v4, 0xFuLL))) & 1;
}

- (BOOL)isRoadTerminus
{
  if (self->_foundRoads)
  {
    if (self->_geoJunction)
      return -[NSMutableArray count](self->_roads, "count") == 1;
  }
  else
  {
    -[VKLabelNavJunction findRoads](self, "findRoads");
    if (self->_geoJunction)
      return -[NSMutableArray count](self->_roads, "count") == 1;
  }
  return 0;
}

- (BOOL)isOnRoute
{
  id WeakRetained;
  BOOL v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_incomingRoad);
  if (WeakRetained)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)&self->_outgoingRoad);
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)isIntersection
{
  if (self->_foundRoads)
  {
    if (self->_isOverpass)
      return 1;
  }
  else
  {
    -[VKLabelNavJunction findRoads](self, "findRoads");
    if (self->_isOverpass)
      return 1;
  }
  return (unint64_t)-[NSMutableArray count](self->_roads, "count") > 2;
}

- (int64_t)intraRoadPriorityForRoadLabel
{
  return 0;
}

- (int64_t)intraRoadPriorityForShieldLabel
{
  return 0;
}

- (BOOL)isRamp
{
  return 0;
}

- (BOOL)isAwayFromRoute
{
  return self->_depthFromRoute != 0;
}

- (BOOL)isOffRouteGraph
{
  return self->_depthFromRoute == -1;
}

- (BOOL)isIntraRamp
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  BOOL v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[VKLabelNavJunction roads](self, "roads", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isRamp") & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)isMultiRoadIntersection
{
  BOOL v2;
  void *v4;
  void *v5;
  unint64_t i;
  unint64_t v7;
  void *v8;
  void *v9;

  if (self->_isOverpass)
    return 1;
  if (!-[VKLabelNavJunction isIntersection](self, "isIntersection"))
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_roads, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 1; ; ++i)
  {
    v7 = -[NSMutableArray count](self->_roads, "count");
    v2 = i < v7;
    if (i >= v7)
      break;
    -[NSMutableArray objectAtIndexedSubscript:](self->_roads, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v9 && (objc_msgSend(v5, "isEqualToString:", v9) & 1) == 0)
    {

      break;
    }

  }
  return v2;
}

- (NSArray)roads
{
  if (!self->_foundRoads)
    -[VKLabelNavJunction findRoads](self, "findRoads");
  return (NSArray *)self->_roads;
}

- (unsigned)largestRoadClass
{
  if (!self->_foundRoads)
    -[VKLabelNavJunction findRoads](self, "findRoads");
  return self->_largestRoadClass;
}

- (void)findRoads
{
  VKLabelNavRoad *v3;

  if (*(_QWORD *)*a2)
  {
    v3 = -[VKLabelNavRoad initWithRoadEdge:navJunctionA:routeOffset:tile:]([VKLabelNavRoad alloc], "initWithRoadEdge:navJunctionA:routeOffset:tile:", *a2, **(_QWORD **)(a1 + 8), *(_QWORD *)(**(_QWORD **)(a1 + 8) + 40), **(_QWORD **)(a1 + 8) + 8);
    if (v3)
      objc_msgSend(*(id *)(**(_QWORD **)(a1 + 8) + 48), "addObject:", v3);

  }
}

- (void)addRouteEdge:(const VKLabelNavRouteRoadEdge *)a3 atA:(BOOL)a4
{
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  VKLabelNavRoad **p_outgoingRoad;
  uint64_t i;
  void *v12;
  VKLabelNavRoad **p_incomingRoad;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_roads;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    if (a4)
    {
      p_outgoingRoad = &self->_outgoingRoad;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "matchesRoadEdge:", &a3->var2, (_QWORD)v16))
          {
            objc_msgSend(v12, "setIsOnRoute:", 1);
            objc_msgSend(v12, "setLabelVertexIndexA:", a3->var3);
            objc_msgSend(v12, "setLabelVertexIndexB:", a3->var4);
            objc_storeWeak((id *)p_outgoingRoad, v12);
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    else
    {
      p_incomingRoad = &self->_incomingRoad;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
          if (objc_msgSend(v15, "matchesRoadEdge:", &a3->var2, (_QWORD)v16))
          {
            objc_msgSend(v15, "setIsOnRoute:", 1);
            objc_msgSend(v15, "setLabelVertexIndexA:", a3->var3);
            objc_msgSend(v15, "setLabelVertexIndexB:", a3->var4);
            objc_storeWeak((id *)p_incomingRoad, v15);
            objc_msgSend(v15, "setAreLabelsDisabled:", 1);
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
  }

}

- (void)evaluateCrossStreets
{
  -[VKLabelNavJunction evaluateCrossStreetsUsingRouteJunction:](self, "evaluateCrossStreetsUsingRouteJunction:", self);
}

- (void)evaluateCrossStreetsUsingRouteJunction:(id)a3
{
  float v3;
  float v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  NSMutableArray *v18;
  uint64_t v19;
  BOOL v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  float v25;
  float v26;
  float v27;
  float v28;
  char v29;
  double v30;
  float v31;
  uint64_t j;
  void *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  double v38;
  float v39;
  float v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VKLabelNavJunction findRoads](self, "findRoads");
  objc_msgSend(v6, "incomingRoad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outgoingRoad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "direction2D");
    v3 = v10;
    v4 = v11;
    objc_msgSend(v7, "direction2D");
    v13 = -v12;
    v15 = -v14;
  }
  else
  {
    if (!v8)
      goto LABEL_36;
    objc_msgSend(v8, "direction2D");
    v13 = v16;
    v15 = v17;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = self->_roads;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v19)
  {
    v21 = v9 == v7 || v9 == 0 || v7 == 0;
    v22 = *(_QWORD *)v42;
    if (v21)
    {
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v24, "direction2D", (_QWORD)v41);
          v26 = v25;
          v28 = v27;
          v29 = objc_msgSend(v24, "isOnRoute");
          *(float *)&v30 = v26 * v15;
          if ((v29 & 1) != 0)
          {
            *(float *)&v30 = -(float)(*(float *)&v30 - (float)(v28 * v13));
          }
          else
          {
            v31 = -(float)(*(float *)&v30 - (float)(v28 * v13));
            LODWORD(v30) = -1.0;
            if (v31 >= 0.0)
            {
              *(float *)&v30 = v31;
              if (v31 > 0.0)
                LODWORD(v30) = 1.0;
            }
          }
          objc_msgSend(v24, "setRouteCrossProduct:", v30);
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v19);
    }
    else
    {
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v18);
          v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v33, "direction2D", (_QWORD)v41);
          v35 = v34;
          v37 = v36;
          if (objc_msgSend(v33, "isOnRoute"))
          {
            *(float *)&v38 = -(float)((float)(v35 * v15) - (float)(v37 * v13));
          }
          else
          {
            objc_msgSend(v9, "direction2D");
            v40 = (float)((float)(v4 - v39) * (float)(v35 - v3))
                + (float)((float)(*(float *)&v38 - v3) * (float)(v37 - v4));
            LODWORD(v38) = -1.0;
            if (v40 >= 0.0)
            {
              *(float *)&v38 = v40;
              if (v40 > 0.0)
                LODWORD(v38) = 1.0;
            }
          }
          objc_msgSend(v33, "setRouteCrossProduct:", v38);
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v19);
    }
  }

LABEL_36:
}

- (int)requiredLabelPlacement
{
  int v2;
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  float v11;
  void *v12;
  float v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isOnDualCarriageway)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_roads;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isOnRoute", (_QWORD)v15) & 1) == 0)
        {
          objc_msgSend(v10, "routeCrossProduct");
          if (v11 < -0.1)
          {
            objc_msgSend(v10, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);
LABEL_6:

            continue;
          }
          objc_msgSend(v10, "routeCrossProduct");
          if (v13 > 0.1)
          {
            objc_msgSend(v10, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);
            goto LABEL_6;
          }
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v4, "count", (_QWORD)v15) && !objc_msgSend(v5, "count"))
    {
      v2 = 2;
    }
    else if (objc_msgSend(v4, "count") || !objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v4, "count") == 1 && objc_msgSend(v4, "isEqualToSet:", v5))
      {
        if (self->_isOverpass)
          v2 = 5;
        else
          v2 = 3;
      }
      else
      {
        v2 = 4;
      }
    }
    else
    {
      v2 = 1;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)setPreferredLabelPlacement:(int)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t j;
  void *v8;
  float v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_preferredLabelPlacement = a3;
  if ((a3 - 1) > 1)
    return;
  if (a3 == 2)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = self->_roads;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (!v11)
      goto LABEL_32;
    v12 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isOnRoute", (_QWORD)v16) & 1) == 0)
        {
          objc_msgSend(v14, "routeCrossProduct");
          if (v15 > 0.0)
          {
            objc_msgSend(v14, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v14, "intraRoadPriorityForRoadLabel") | 2);
            if (!objc_msgSend(v14, "hasShield"))
              continue;
LABEL_28:
            objc_msgSend(v14, "intraRoadPriorityForShieldLabel");
            objc_msgSend(v14, "setIntraRoadPriorityForShieldLabel:");
            continue;
          }
          objc_msgSend(v14, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v14, "intraRoadPriorityForRoadLabel") & 0xFFFFFFFFFFFFFFFDLL);
          if (objc_msgSend(v14, "hasShield"))
            goto LABEL_28;
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (!v11)
        goto LABEL_32;
    }
  }
  if (a3 != 1)
    goto LABEL_33;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_roads;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (!v5)
    goto LABEL_32;
  v6 = *(_QWORD *)v21;
  do
  {
    for (j = 0; j != v5; ++j)
    {
      if (*(_QWORD *)v21 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
      if ((objc_msgSend(v8, "isOnRoute") & 1) == 0)
      {
        objc_msgSend(v8, "routeCrossProduct");
        if (v9 >= 0.0)
        {
          objc_msgSend(v8, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v8, "intraRoadPriorityForRoadLabel") & 0xFFFFFFFFFFFFFFFDLL);
          if (objc_msgSend(v8, "hasShield"))
          {
            v10 = objc_msgSend(v8, "intraRoadPriorityForShieldLabel") & 0xFFFFFFFFFFFFFFFDLL;
            goto LABEL_7;
          }
        }
        else
        {
          objc_msgSend(v8, "setIntraRoadPriorityForRoadLabel:", objc_msgSend(v8, "intraRoadPriorityForRoadLabel") | 2);
          if (objc_msgSend(v8, "hasShield"))
          {
            v10 = objc_msgSend(v8, "intraRoadPriorityForShieldLabel") | 2;
LABEL_7:
            objc_msgSend(v8, "setIntraRoadPriorityForShieldLabel:", v10);
            continue;
          }
        }
      }
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  }
  while (v5);
LABEL_32:

LABEL_33:
  -[NSMutableArray sortUsingComparator:](self->_roads, "sortUsingComparator:", &__block_literal_global_10_26940, (_QWORD)v16);
}

- (double)worldUnitsPerMeter
{
  double result;
  long double v4;
  long double v5;
  long double v6;
  long double v7;
  long double v8;
  long double v9;
  long double v10;
  double v11;
  long double v12;

  result = self->_worldUnitsPerMeter;
  if (result == 0.0)
  {
    v4 = exp(self->_mercatorCoordinate._e[1] * 6.28318531 + -3.14159265);
    v5 = atan(v4) * 114.591559 + -90.0;
    v6 = cos(v5 * 0.034906585) * -559.82 + 111132.92;
    v7 = v6 + cos(v5 * 0.0698131701) * 1.175;
    v8 = v7 + cos(v5 * 0.104719755) * -0.0023;
    v9 = v5 * 0.00872664626;
    v10 = tan(v5 * 0.00872664626 + 0.78103484);
    v11 = log(v10);
    v12 = tan(v9 + 0.789761487);
    result = fabs((log(v12) - v11) * 0.159154943) / v8;
    self->_worldUnitsPerMeter = result;
  }
  return result;
}

- (unsigned)_signOrientationWithDrivingSide:(BOOL)a3
{
  unsigned __int8 v4;
  VKLabelNavRoad **p_incomingRoad;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  float v10;
  float v11;
  float v12;
  float v13;
  id v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  float v24;
  float v25;
  float v26;
  float v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id v34;
  id v35;
  BOOL v36;
  float v37;
  float v38;
  float v39;
  BOOL v40;
  BOOL v41;
  unsigned __int8 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = 7;
  else
    v4 = 6;
  p_incomingRoad = &self->_incomingRoad;
  WeakRetained = objc_loadWeakRetained((id *)&self->_incomingRoad);
  if (!WeakRetained)
    goto LABEL_10;
  v7 = WeakRetained;
  v8 = objc_loadWeakRetained((id *)&self->_outgoingRoad);

  if (!v8)
    goto LABEL_10;
  v9 = objc_loadWeakRetained((id *)p_incomingRoad);
  objc_msgSend(v9, "direction2D");
  v11 = v10;
  v13 = v12;

  v14 = objc_loadWeakRetained((id *)&self->_outgoingRoad);
  objc_msgSend(v14, "direction2D");
  v16 = v15;
  v18 = v17;

  v19 = -(float)((float)(v18 * v11) - (float)(v16 * v13));
  v20 = fabsf(v19);
  v21 = v19 >= 0.0 ? 6 : 7;
  if (v20 <= 0.2)
  {
LABEL_10:
    v22 = objc_loadWeakRetained((id *)p_incomingRoad);

    if (v22)
    {
      v23 = objc_loadWeakRetained((id *)p_incomingRoad);
      objc_msgSend(v23, "direction2D");
      v25 = v24;
      v27 = v26;

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v28 = self->_roads;
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v43 = v4;
      v30 = 0;
      v31 = 0;
      if (v29)
      {
        v32 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v45 != v32)
              objc_enumerationMutation(v28);
            v34 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v35 = objc_loadWeakRetained((id *)p_incomingRoad);
            v36 = v34 == v35;

            if (!v36)
            {
              objc_msgSend(v34, "direction2D");
              v39 = -(float)((float)(v37 * v25) - (float)(v38 * v27));
              if (fabsf(v39) > 0.2)
              {
                if (v39 >= 0.0)
                  ++v30;
                else
                  ++v31;
              }
            }
          }
          v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v29);
      }

      if (v30)
        v40 = 1;
      else
        v40 = v31 == 0;
      if (v40)
        v21 = v43;
      else
        v21 = 7;
      if (v31)
        v41 = 1;
      else
        v41 = v30 == 0;
      if (!v41)
        return 6;
    }
    else
    {
      return v4;
    }
  }
  return v21;
}

- (Mercator3<double>)_anchorCoordinateForSignOrientation:(unsigned __int8)a3
{
  int v3;
  double v5;
  double v6;
  double v7;
  VKLabelNavRoad **p_incomingRoad;
  id WeakRetained;
  id v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  id v17;
  id v18;
  float v19;
  float v20;
  float v21;
  long double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  long double v27;
  long double v28;
  double v29;
  long double v30;
  long double v31;
  double v32;
  double v33;
  double v34;
  Mercator3<double> result;

  v3 = a3;
  v5 = self->_mercatorCoordinate._e[0];
  v6 = self->_mercatorCoordinate._e[1];
  v7 = self->_mercatorCoordinate._e[2];
  p_incomingRoad = &self->_incomingRoad;
  WeakRetained = objc_loadWeakRetained((id *)&self->_incomingRoad);

  if (WeakRetained)
  {
    v10 = objc_loadWeakRetained((id *)p_incomingRoad);
    objc_msgSend(v10, "direction2D");
    v12 = v11;
    v14 = v13;

    v15 = -v12;
    v16 = -v14;
  }
  else
  {
    v17 = objc_loadWeakRetained((id *)&self->_outgoingRoad);

    if (!v17)
      goto LABEL_11;
    v18 = objc_loadWeakRetained((id *)&self->_outgoingRoad);
    objc_msgSend(v18, "direction2D");
    v15 = v19;
    v16 = v20;

  }
  if (v3 == 6)
    v21 = -v15;
  else
    v21 = v15;
  if (v3 != 6)
    v16 = -v16;
  v22 = exp(self->_mercatorCoordinate._e[1] * 6.28318531 + -3.14159265);
  v23 = atan(v22) * 114.591559 + -90.0;
  v24 = cos(v23 * 0.034906585) * -559.82 + 111132.92;
  v25 = v24 + cos(v23 * 0.0698131701) * 1.175;
  v26 = v25 + cos(v23 * 0.104719755) * -0.0023;
  v27 = v23 * 0.00872664626;
  v28 = tan(v23 * 0.00872664626 + 0.78103484);
  v29 = log(v28);
  v30 = tan(v27 + 0.789761487);
  v31 = fabs((log(v30) - v29) * 0.159154943) * 3.5 / v26;
  v5 = v5 + v31 * v16;
  v6 = v6 + v31 * v21;
LABEL_11:
  v32 = v5;
  v33 = v6;
  v34 = v7;
  result._e[2] = v34;
  result._e[1] = v33;
  result._e[0] = v32;
  return result;
}

- (void)_updateWithNavContext:(NavContext *)a3 threshold:(double)a4
{
  BOOL v5;
  BOOL v6;
  VKLabelNavRoadLabel *junctionSign;
  _BYTE *v8;
  BOOL v9;

  v5 = DetermineJunctionVisibility(self, (md::NavContext *)a3, a4);
  v6 = self->_isVisible && v5;
  self->_isVisible = v6;
  junctionSign = self->_junctionSign;
  if (junctionSign && *(_QWORD *)-[VKLabelNavRoadLabel label](junctionSign, "label"))
  {
    v8 = *(_BYTE **)-[VKLabelNavRoadLabel label](self->_junctionSign, "label");
    v9 = -[VKLabelNavJunction isVisible](self, "isVisible");
    v8[297] = v9;
    if (v8[296])
      v8[298] = v9;
  }
}

- (void)_updateWithNavContext:(NavContext *)a3
{
  -[VKLabelNavJunction _updateWithNavContext:threshold:](self, "_updateWithNavContext:threshold:", a3, 0.0);
}

- (void)layoutWithNavContext:(NavContext *)a3
{
  VKLabelNavRoadLabel *junctionSign;

  -[VKLabelNavJunction _updateWithNavContext:threshold:](self, "_updateWithNavContext:threshold:", 20.0);
  junctionSign = self->_junctionSign;
  if (junctionSign)
  {
    if (*(_QWORD *)-[VKLabelNavRoadLabel label](junctionSign, "label"))
      -[VKLabelNavRoadLabel layoutWithNavContext:](self->_junctionSign, "layoutWithNavContext:", a3);
  }
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)prepareStyleVarsWithContext:(NavContext *)a3
{
  PolylineCoordinate *p_routeOffset;
  uint64_t v6;
  uint64_t (***v7)(_QWORD);
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  LabelManager *var1;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  float *v27;
  float v28;
  BOOL v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char v34;
  BOOL v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  _BYTE v49[2];
  _BYTE v50[2];
  uint64_t v51;
  std::__shared_weak_count *v52;
  char v53;
  unsigned __int8 v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  char v57;

  p_routeOffset = &self->_routeOffset;
  v6 = *(_QWORD *)(*((_QWORD *)a3->var1 + 21) + 32);
  (*(void (**)(char *__return_ptr, uint64_t, PolylineCoordinate *))(*(_QWORD *)v6 + 88))(&v53, v6, p_routeOffset);
  v7 = *(uint64_t (****)(_QWORD))(*((_QWORD *)a3->var1 + 21) + 32);
  v8 = (**v7)(v7);
  if (v53)
    v9 = v54 + 4 * v8;
  else
    v9 = (4 * v8) | 3;
  if (v9 >= 7)
    v10 = 7;
  else
    v10 = v9;
  if (self->_cachedSignVisibility[v10])
  {
    self->_isVisible = 1;
  }
  else
  {
    if (-[VKLabelNavJunction isOnRoute](self, "isOnRoute"))
      v11 = 1;
    else
      v11 = 2 * (self->_depthFromRoute == 0);
    v50[0] = 0;
    v49[0] = 0;
    if (v53)
    {
      v49[1] = v54;
      v49[0] = 1;
      GetLabelNavStyleAttributes(&v51, 1u, v11, v50, v49);
      v49[0] = 0;
    }
    else
    {
      GetLabelNavStyleAttributes(&v51, 1u, v11, v50, v49);
    }
    var1 = a3->var1;
    v13 = v52;
    v55 = v51;
    v56 = v52;
    if (v52)
    {
      p_shared_owners = (unint64_t *)&v52->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
    }
    v16 = *((_QWORD *)var1 + 42);
    md::createFeatureAttributeSet((gss::Allocator *)&v42, &v55);
    md::LabelStyleCache::styleQueryForFeatureAttributes((unint64_t *)&v47, (uint64_t *)(v16 + 184), &v42, 0);
    if (v42)
    {
      v43 = v42;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v45 + 40))(v45, v42, v44 - v42);
    }
    if (v13)
    {
      v17 = (unint64_t *)&v13->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v19 = v47;
    v20 = v48;
    v55 = v47;
    v56 = v48;
    if (v48)
    {
      v21 = (unint64_t *)&v48->__shared_owners_;
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
      v43 = (uint64_t)v20;
      do
        v23 = __ldxr(v21);
      while (__stxr(v23 + 1, v21));
    }
    else
    {
      v43 = 0;
    }
    v44 = 0;
    v45 = 0;
    v42 = v19;
    v46 = 0;
    if (v19)
      LODWORD(v19) = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v19 + 48))(v19, &v44);
    v46 = v19;
    if (v20)
    {
      v24 = (unint64_t *)&v20->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
      LODWORD(v19) = v46;
    }
    if ((_DWORD)v19)
    {
      v26 = *(_QWORD *)(v42 + 24);
      v27 = *(float **)v26;
      if (*(_QWORD *)v26
        && (v28 = *v27, LODWORD(v27) = *v27 == 1.0, *(_BYTE *)(v26 + 10))
        && (v28 != 0.0 ? (v29 = v28 == 1.0) : (v29 = 1), !v29)
        || (v30 = *(unsigned __int8 *)(v26 + v27 + 11), v28 = 0.0, v30 == 2))
      {
        LOBYTE(v55) = 1;
        v57 = 1;
        v31 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v26, 0xDDu, 0, &v55);
        v32 = gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(v26, 0xDDu, 1u, &v57);
        if (v28 >= 1.0)
          v33 = (char *)v32;
        else
          v33 = (char *)v31;
        v34 = *v33;
      }
      else
      {
        v34 = *(_BYTE *)gss::RenderStyle<gss::PropertyID>::styleValueForKey<BOOL>(*(_QWORD *)(v42 + 24), 0xDDu, v30, 0);
      }
      v35 = v34 != 0;
    }
    else
    {
      v35 = 1;
    }
    self->_cachedSignVisibility[v10] = v35;
    self->_isVisible = v35;
    -[VKLabelNavJunction _updateWithNavContext:](self, "_updateWithNavContext:", a3, v42, v43, v44, v45);
    gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v42);
    v36 = v48;
    if (v48)
    {
      v37 = (unint64_t *)&v48->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
    v39 = v52;
    if (v52)
    {
      v40 = (unint64_t *)&v52->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
  }
}

- (void)createLabelWithNavContext:(NavContext *)a3 isDrivingSideRight:(BOOL)a4 artworkCache:(void *)a5
{
  uint64_t *labelFeature;
  _BOOL8 v8;
  PolylineCoordinate *p_routeOffset;
  uint64_t v11;
  uint64_t v12;
  LabelManager *var1;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unsigned __int8 v20;
  NSString *v21;
  uint64_t v22;
  unsigned __int8 v29;
  unsigned __int8 v30;
  LabelManager *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  VKLabelNavRoadLabel *v44;
  VKLabelNavRoadLabel *v45;
  VKLabelNavRoadLabel *junctionSign;
  VKLabelNavRoadLabel *v47;
  uint64_t v48;
  _BOOL4 v49;
  char v50;
  std::__shared_weak_count *v51;
  uint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  std::string::size_type v59;
  std::__shared_weak_count *v60;
  _OWORD v61[3];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int16 v73;
  RoadSignMetrics v74;
  RoadSignColoring v75;
  std::string::size_type v76;
  std::__shared_weak_count *v77;
  _BYTE v78[2];
  _BYTE v79[2];
  uint64_t v80;
  double v81;
  _BYTE v82[2];
  std::string::size_type v83[2];
  _QWORD v84[2];

  labelFeature = (uint64_t *)self->_labelFeature;
  if (labelFeature && !self->_areLabelsDisabled && !self->_junctionSign && *((_BYTE *)labelFeature + 73))
  {
    v8 = a4;
    p_routeOffset = &self->_routeOffset;
    v11 = *(_QWORD *)(*((_QWORD *)a3->var1 + 21) + 32);
    (*(void (**)(_BYTE *__return_ptr, uint64_t, PolylineCoordinate *))(*(_QWORD *)v11 + 88))(v82, v11, p_routeOffset);
    if (-[VKLabelNavJunction isOnRoute](self, "isOnRoute"))
      v12 = 1;
    else
      v12 = 2 * (self->_depthFromRoute == 0);
    v79[0] = 0;
    v78[0] = 0;
    if (v82[0])
    {
      v78[1] = v82[1];
      v78[0] = 1;
      GetLabelNavStyleAttributes(&v80, 1u, v12, v79, v78);
      v78[0] = 0;
    }
    else
    {
      GetLabelNavStyleAttributes(&v80, 1u, v12, v79, v78);
    }
    var1 = a3->var1;
    v14 = *(std::__shared_weak_count **)&v81;
    *(_QWORD *)&v74._orientation = v80;
    v74._scale = v81;
    if (v81 != 0.0)
    {
      v15 = (unint64_t *)(*(_QWORD *)&v81 + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v17 = *((_QWORD *)var1 + 42);
    md::createFeatureAttributeSet((gss::Allocator *)&v75, (uint64_t *)&v74);
    md::LabelStyleCache::styleQueryForFeatureAttributes(&v76, (uint64_t *)(v17 + 184), (uint64_t *)&v75._hasFillColor, 0);
    if (*(_QWORD *)&v75._hasFillColor)
    {
      v75._fillColor._backing._e[0] = *(double *)&v75._hasFillColor;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)&v75._fillColor._backing._e[2] + 40))(*(_QWORD *)&v75._fillColor._backing._e[2], *(_QWORD *)&v75._hasFillColor, *(_QWORD *)&v75._fillColor._backing._e[1] - *(_QWORD *)&v75._hasFillColor);
    }
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (v76)
    {
      v20 = atomic_load((unsigned __int8 *)a3->var1 + 3392);
      VKLabelCopyText(labelFeature, v20 & 1);
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = -[VKLabelNavJunction _signOrientationWithDrivingSide:](self, "_signOrientationWithDrivingSide:", v8);
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)v75._fillColor._backing._e = _Q0;
        *(_OWORD *)&v75._fillColor._backing._e[2] = _Q0;
        *(_QWORD *)&v75._hasFillColor = 0x1010000000001;
        memset(&v75._shadowColor, 0, 24);
        v75._shadowColor._backing._e[3] = 0.200000003;
        memset(&v75._textColor, 0, 24);
        v75._gradientFillAngle = 0.0;
        v75._textColor._backing._e[3] = 1.0;
        v74._orientation = 0;
        *(_OWORD *)&v74._scale = _Q0;
        *(_OWORD *)&v74._arrowWeight = xmmword_19FFB4FB0;
        v74._arrowTipCornerRadius = 0.0;
        v74._arrowJoinCornerRadius = 0.0;
        v74._shadowOffset = (CGSize)*MEMORY[0x1E0C9D820];
        v74._strokeWeight = 0.0;
        v74._innerStrokeWeight = 0.0;
        v74._shadowRadius = 20.0;
        *(_OWORD *)&v74._signHeight = xmmword_19FFB4FC0;
        v74._horizontalMargin = 0.0;
        v74._verticalMargin = 0.0;
        v74._glyphSize = v74._shadowOffset;
        v74._cornerRadius = 6.5;
        v74._glyphVerticalOffset = 0.0;
        __asm { FMOV            V1.2D, #6.0 }
        v61[0] = _Q0;
        v61[1] = _Q1;
        v61[2] = xmmword_19FFB5930;
        v62 = 0x4031000000000000;
        v63 = 0;
        v64 = 0;
        v65 = 0;
        {
          v57 = operator new();
          mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v57, "VectorKitLabels", 0x5ED09DD50000000FLL);
        }
        v66 = mdm::Allocator::instance(void)::alloc;
        v67 = 0;
        v68 = 0;
        v69 = 0;
        {
          v58 = operator new();
          mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v58, "VectorKitLabels", 0x5ED09DD50000000FLL);
        }
        v71 = 0;
        v72 = 0;
        v70 = mdm::Allocator::instance(void)::alloc;
        v73 = 1;
        v74._orientation = v22;
        v31 = a3->var1;
        v32 = *((float *)v31 + 44);
        v74._scale = *(float *)(*((_QWORD *)v31 + 42) + 172);
        v74._contentScale = v32;
        *(double *)v61 = v74._scale;
        *((double *)v61 + 1) = v32;
        v84[0] = 0;
        v84[1] = 0;
        v83[0] = 0;
        v83[1] = 0;
        if (GetRoadSignMetadataForStyleQuery(v76, v77, v83, (uint64_t)&v75, (uint64_t)&v74, (uint64_t)v61))
        {
          -[VKLabelNavJunction _anchorCoordinateForSignOrientation:](self, "_anchorCoordinateForSignOrientation:", v22);
          v34 = v33;
          v36 = v35;
          v38 = v37;
          VKLabelNavArtworkCache::getRoadSignArtwork((VKLabelNavArtworkCache *)a5, v21, &v74, &v75, (const md::RoadSignTextMetrics *)v61);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            v40 = operator new();
            v41 = v40;
            v59 = v76;
            v60 = v77;
            if (v77)
            {
              v42 = &v77->__shared_owners_;
              do
                v43 = __ldxr((unint64_t *)v42);
              while (__stxr(v43 + 1, (unint64_t *)v42));
            }
            md::NavRoadSign::NavRoadSign(v40, v21, (uint64_t *)&v59, v39, v34, v36, v38);
            std::shared_ptr<md::NavLabel>::shared_ptr[abi:nn180100]<md::NavRoadSign,void>(v84, v41);
            std::shared_ptr<esl::QuartzContext>::~shared_ptr[abi:ne180100]((uint64_t)&v59);
            v44 = [VKLabelNavRoadLabel alloc];
            v45 = -[VKLabelNavRoadLabel initWithNavFeature:label:navLabelType:](v44, "initWithNavFeature:label:navLabelType:", self, v84, 3, v59, v60);
            junctionSign = self->_junctionSign;
            self->_junctionSign = v45;

            std::shared_ptr<esl::QuartzContext>::~shared_ptr[abi:ne180100]((uint64_t)v84);
          }

        }
        if (SHIBYTE(v69) < 0)
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v70 + 40))(v70, v67, v69 & 0x7FFFFFFFFFFFFFFFLL);
        if (SHIBYTE(v65) < 0)
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v66 + 40))(v66, v63, v65 & 0x7FFFFFFFFFFFFFFFLL);
      }
      v47 = self->_junctionSign;
      if (v47)
      {
        v48 = *(_QWORD *)-[VKLabelNavRoadLabel label](v47, "label");
        v49 = -[VKLabelNavJunction isOnRoute](self, "isOnRoute");
        *(_BYTE *)(v48 + 24) = !v49;
        if (v49)
          v50 = 2;
        else
          v50 = 0;
        *(_BYTE *)(v48 + 27) = v50;
      }
      -[VKLabelNavJunction _updateWithNavContext:](self, "_updateWithNavContext:", a3);

    }
    v51 = v77;
    if (v77)
    {
      v52 = &v77->__shared_owners_;
      do
        v53 = __ldaxr((unint64_t *)v52);
      while (__stlxr(v53 - 1, (unint64_t *)v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
    v54 = *(std::__shared_weak_count **)&v81;
    if (v81 != 0.0)
    {
      v55 = (unint64_t *)(*(_QWORD *)&v81 + 8);
      do
        v56 = __ldaxr(v55);
      while (__stlxr(v56 - 1, v55));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
  }
}

- (BOOL)isStartOfRoadName
{
  return 0;
}

- (BOOL)isInGuidance
{
  return 0;
}

- (NSString)shieldDisplayGroup
{
  return 0;
}

- (BOOL)isGuidanceStepStart
{
  return 0;
}

- (void)setSharedRouteDirection:()Matrix<float
{
  self->_hasSharedRouteDirection = 1;
  self->_sharedRouteDirection = a3;
}

- (BOOL)isEtaFeature
{
  return 0;
}

- (BOOL)isTrafficCameraFeature
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (const)geoJunction
{
  return self->_geoJunction;
}

- (Matrix<float,)tileCoordinate
{
  float v2;
  float v3;
  Matrix<float, 2, 1> result;

  v2 = self->_tileCoordinate._e[0];
  v3 = self->_tileCoordinate._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (VKLabelNavRoad)outgoingRoad
{
  return (VKLabelNavRoad *)objc_loadWeakRetained((id *)&self->_outgoingRoad);
}

- (VKLabelNavRoad)incomingRoad
{
  return (VKLabelNavRoad *)objc_loadWeakRetained((id *)&self->_incomingRoad);
}

- (int)preferredLabelPlacement
{
  return self->_preferredLabelPlacement;
}

- (float)distanceFromPreviousShieldLabel
{
  return self->_distanceFromPreviousShieldLabel;
}

- (void)setDistanceFromPreviousShieldLabel:(float)a3
{
  self->_distanceFromPreviousShieldLabel = a3;
}

- (BOOL)isOnDualCarriageway
{
  return self->_isOnDualCarriageway;
}

- (void)setIsOnDualCarriageway:(BOOL)a3
{
  self->_isOnDualCarriageway = a3;
}

- (BOOL)hasSharedRouteDirection
{
  return self->_hasSharedRouteDirection;
}

- (Matrix<float,)sharedRouteDirection
{
  float v2;
  float v3;
  Matrix<float, 2, 1> result;

  v2 = self->_sharedRouteDirection._e[0];
  v3 = self->_sharedRouteDirection._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (unint64_t)depthFromRoute
{
  return self->_depthFromRoute;
}

- (void)setDepthFromRoute:(unint64_t)a3
{
  self->_depthFromRoute = a3;
}

- (VKLabelNavJunction)overpassJunction
{
  return (VKLabelNavJunction *)objc_loadWeakRetained((id *)&self->_overpassJunction);
}

- (void)setOverpassJunction:(id)a3
{
  objc_storeWeak((id *)&self->_overpassJunction, a3);
}

- (BOOL)isOverpass
{
  return self->_isOverpass;
}

- (BOOL)isRouteOverpass
{
  return self->_isRouteOverpass;
}

- (void)setIsRouteOverpass:(BOOL)a3
{
  self->_isRouteOverpass = a3;
}

- (BOOL)isRouteRefineJunction
{
  return self->_isRouteRefineJunction;
}

- (void)setIsRouteRefineJunction:(BOOL)a3
{
  self->_isRouteRefineJunction = a3;
}

- (NSString)name
{
  return self->_name;
}

- (VKLabelNavRoadLabel)junctionSign
{
  return self->_junctionSign;
}

- (BOOL)isPicked
{
  return self->_isPicked;
}

- (void)setIsPicked:(BOOL)a3
{
  self->_isPicked = a3;
}

- (const)mercatorCoordinate
{
  return &self->_mercatorCoordinate;
}

- (const)tile
{
  return &self->_tile;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_destroyWeak((id *)&self->_overpassJunction);
  objc_storeStrong((id *)&self->_junctionSign, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_outgoingRoad);
  objc_destroyWeak((id *)&self->_incomingRoad);
  objc_storeStrong((id *)&self->_roads, 0);
  cntrl = self->_tile.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 5) = 0xBF80000000000000;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 22) = 0;
  return self;
}

uint64_t __49__VKLabelNavJunction_setPreferredLabelPlacement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "intraRoadPriorityForRoadLabel");
  v7 = objc_msgSend(v4, "intraRoadPriorityForRoadLabel");
  if (v6 < v7)
    v8 = -1;
  else
    v8 = v6 > v7;

  return v8;
}

uint64_t __31__VKLabelNavJunction_findRoads__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "roadClass");
  v9 = objc_msgSend(v7, "roadClass");
  if (v8 < v9)
    v10 = -1;
  else
    v10 = v8 > v9;

  return v10;
}

- (_QWORD)findRoads
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E42C7628;
  result[1] = v3;
  return result;
}

- (uint64_t)findRoads
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E42C7628;
  a2[1] = v2;
  return result;
}

@end
