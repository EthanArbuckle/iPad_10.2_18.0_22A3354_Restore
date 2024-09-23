@implementation VKLabelNavTileData

- (VKLabelNavTileData)initWithTile:(const void *)a3
{
  VKLabelNavTileData *v4;
  VKLabelNavTileData *v5;
  uint64_t v6;
  LabelTile *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  NSMapTable *geoJunctionToJunctionMap;
  NSMutableArray *v15;
  NSMutableArray *tileEdgeJunctions;
  NSMutableArray *v17;
  NSMutableArray *oppositeCarriagewayJunctions;
  VKLabelNavTileData *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VKLabelNavTileData;
  v4 = -[VKLabelNavTileData init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    v7 = *(LabelTile **)a3;
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v4->_tile.__cntrl_;
    v4->_tile.__ptr_ = v7;
    v4->_tile.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 5);
    geoJunctionToJunctionMap = v5->_geoJunctionToJunctionMap;
    v5->_geoJunctionToJunctionMap = (NSMapTable *)v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tileEdgeJunctions = v5->_tileEdgeJunctions;
    v5->_tileEdgeJunctions = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    oppositeCarriagewayJunctions = v5->_oppositeCarriagewayJunctions;
    v5->_oppositeCarriagewayJunctions = v17;

    v19 = v5;
  }

  return v5;
}

- (id)junctionForGeoJunction:(GeoCodecsConnectivityJunction *)a3
{
  return -[NSMapTable objectForKey:](self->_geoJunctionToJunctionMap, "objectForKey:", a3);
}

- (id)junctionAtCoordinate:()Matrix<float
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  Matrix<float, 2, 1> v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_tileEdgeJunctions;
  v4 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "tileCoordinate");
        if (__PAIR64__(v9, v8) == v15)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)addJunction:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "geoJunction"))
    -[NSMapTable setObject:forKey:](self->_geoJunctionToJunctionMap, "setObject:forKey:", v4, objc_msgSend(v4, "geoJunction"));
  else
    -[NSMutableArray addObject:](self->_tileEdgeJunctions, "addObject:", v4);

}

- (void)_findTileEdgeJunctions
{
  uint64_t v3;
  uint64_t v4;
  float32x4_t v5;
  int16x4_t v6;
  VKLabelNavJunction *v7;

  v3 = *a2;
  v4 = *(_QWORD *)(*a2 + 8);
  if (!v4 || v4 == **(_QWORD **)(a1 + 8) - 1)
  {
    v5.i64[0] = *(_QWORD *)(**(_QWORD **)(a1 + 16) + 8 * v4);
    v5.i64[1] = v5.i64[0];
    v6.i32[0] = vmovn_s32(vcgtq_f32(v5, (float32x4_t)xmmword_19FFB5D10)).u32[0];
    v6.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_19FFB5D10, v5)).i32[1];
    if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v6, 0xFuLL))) & 1) != 0 && !*(_QWORD *)(v3 + 40))
    {
      v7 = -[VKLabelNavJunction initWithRoadEdge:atA:routeOffset:tile:]([VKLabelNavJunction alloc], "initWithRoadEdge:atA:routeOffset:tile:", v3, 1, 0xBF80000000000000, **(_QWORD **)(a1 + 24) + 8);
      objc_msgSend(**(id **)(a1 + 24), "addJunction:");

    }
  }
}

- (id)findTileEdgeJunctionAtCoordinate:()Matrix<float
{
  float v3;
  float v4;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  float v11;
  double v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3._e[1];
  v4 = a3._e[0];
  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_foundTileEdgeJunctions)
    -[VKLabelNavTileData _findTileEdgeJunctions](self, "_findTileEdgeJunctions");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_tileEdgeJunctions;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "tileCoordinate", (_QWORD)v15);
        v13 = vabds_f32(*(float *)&v12, v4) < 0.0005;
        *(float *)&v12 = vabds_f32(v11, v3);
        v13 = v13 && *(float *)&v12 < 0.0005;
        if (v13)
        {
          v7 = v10;
          goto LABEL_16;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v12);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

  return v7;
}

- (void)initializeJunctionInfos
{
  uint64_t v3;
  geo::codec::VectorTile *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  LabelNavJunctionInfo *begin;
  LabelNavJunctionInfo *end;
  uint64_t v12;
  LabelNavJunctionInfo *v13;
  LabelNavJunctionInfo *v14;
  LabelNavJunctionInfo *v15;
  __int128 v16;
  LabelNavJunctionInfo *value;
  _DWORD *v18;
  unint64_t i;
  LabelNavJunctionInfo *v20;
  uint64_t v21;
  unsigned int *v22;
  _QWORD *v23;
  float64x2_t v24;
  LabelNavJunctionInfo *v25;
  LabelNavJunctionInfo *v26;
  LabelNavJunctionInfo *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  LabelNavJunctionInfo *v34;
  LabelNavJunctionInfo *v35;
  LabelNavJunctionInfo *v36;
  LabelNavJunctionInfo *v37;
  __int128 v38;
  LabelNavJunctionInfo *v39;
  unint64_t *v40;
  unint64_t v41;
  float64x2_t v42;
  uint64_t v43;
  geo::codec::VectorTile *v44;
  std::__shared_weak_count *v45;

  if (self->_junctionInfos.__begin_ == self->_junctionInfos.__end_)
  {
    v3 = *((_QWORD *)self->_tile.__ptr_ + 3);
    v4 = *(geo::codec::VectorTile **)v3;
    v5 = *(std::__shared_weak_count **)(v3 + 8);
    v44 = *(geo::codec::VectorTile **)v3;
    v45 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    v8 = geo::codec::VectorTile::junctionsCount(v4);
    v9 = v8;
    begin = self->_junctionInfos.__begin_;
    if (v8 > (self->_junctionInfos.__end_cap_.__value_ - begin) >> 5)
    {
      if (v8 >> 59)
        abort();
      end = self->_junctionInfos.__end_;
      v12 = (*(uint64_t (**)(Allocator *, unint64_t, uint64_t))(*(_QWORD *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                              + 16))(self->_junctionInfos.__end_cap_.__value__2._allocator, 32 * v8, 8);
      v14 = self->_junctionInfos.__begin_;
      v13 = self->_junctionInfos.__end_;
      v15 = (LabelNavJunctionInfo *)(v12 + ((end - begin) & 0xFFFFFFFFFFFFFFE0));
      if (v13 != v14)
      {
        do
        {
          v16 = *((_OWORD *)v13 - 1);
          *((_OWORD *)v15 - 2) = *((_OWORD *)v13 - 2);
          *((_OWORD *)v15 - 1) = v16;
          v15 = (LabelNavJunctionInfo *)((char *)v15 - 32);
          v13 = (LabelNavJunctionInfo *)((char *)v13 - 32);
        }
        while (v13 != v14);
        v13 = self->_junctionInfos.__begin_;
      }
      self->_junctionInfos.__begin_ = v15;
      self->_junctionInfos.__end_ = (LabelNavJunctionInfo *)(v12 + ((end - begin) & 0xFFFFFFFFFFFFFFE0));
      value = self->_junctionInfos.__end_cap_.__value_;
      self->_junctionInfos.__end_cap_.__value_ = (LabelNavJunctionInfo *)(v12 + 32 * v9);
      if (v13)
        (*(void (**)(Allocator *, LabelNavJunctionInfo *, int64_t))(*(_QWORD *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                                    + 40))(self->_junctionInfos.__end_cap_.__value__2._allocator, v13, value - v13);
    }
    v18 = (_DWORD *)geo::codec::VectorTile::junctions(v4);
    if (v18)
    {
      for (i = 0; i < geo::codec::VectorTile::junctionsCount(v4); ++i)
      {
        if (*v18)
        {
          v21 = geo::codec::VectorTile::pointsOnRoad(v4);
          v4 = v44;
          v22 = (unsigned int *)(v21 + 16 * v18[1]);
          v23 = (_QWORD *)(geo::codec::VectorTile::lines(v44) + 168 * v22[1]);
          v43 = 0;
          v24 = vmlaq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 312), vcvtq_f64_f32((float32x2_t)geo::codec::multiSectionFeaturePoints(v23, v22[2], &v43)[v22[3]]), vsubq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 328), *(float64x2_t *)((char *)self->_tile.__ptr_ + 312)));
          v25 = self->_junctionInfos.__end_;
          v26 = self->_junctionInfos.__end_cap_.__value_;
          if (v25 >= v26)
          {
            v27 = self->_junctionInfos.__begin_;
            v28 = (v25 - v27) >> 5;
            v29 = v28 + 1;
            if ((unint64_t)(v28 + 1) >> 59)
              abort();
            v30 = v26 - v27;
            if (v30 >> 4 > v29)
              v29 = v30 >> 4;
            if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFE0)
              v31 = 0x7FFFFFFFFFFFFFFLL;
            else
              v31 = v29;
            if (v31)
            {
              v42 = v24;
              v32 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                             + 16))(self->_junctionInfos.__end_cap_.__value__2._allocator, 32 * v31, 8);
              v33 = v32 + 32 * v28;
              v34 = (LabelNavJunctionInfo *)(v32 + 32 * v31);
              if (v32)
              {
                *(_QWORD *)v33 = v18;
                *(float64x2_t *)(v33 + 8) = v42;
                *(_QWORD *)(v33 + 24) = 0;
              }
            }
            else
            {
              v34 = 0;
              v33 = 32 * v28;
            }
            v36 = self->_junctionInfos.__begin_;
            v35 = self->_junctionInfos.__end_;
            v37 = (LabelNavJunctionInfo *)v33;
            if (v35 != v36)
            {
              do
              {
                v38 = *((_OWORD *)v35 - 1);
                *((_OWORD *)v37 - 2) = *((_OWORD *)v35 - 2);
                *((_OWORD *)v37 - 1) = v38;
                v37 = (LabelNavJunctionInfo *)((char *)v37 - 32);
                v35 = (LabelNavJunctionInfo *)((char *)v35 - 32);
              }
              while (v35 != v36);
              v35 = self->_junctionInfos.__begin_;
            }
            v20 = (LabelNavJunctionInfo *)(v33 + 32);
            self->_junctionInfos.__begin_ = v37;
            self->_junctionInfos.__end_ = (LabelNavJunctionInfo *)(v33 + 32);
            v39 = self->_junctionInfos.__end_cap_.__value_;
            self->_junctionInfos.__end_cap_.__value_ = v34;
            if (v35)
              (*(void (**)(Allocator *, LabelNavJunctionInfo *, int64_t))(*(_QWORD *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                                          + 40))(self->_junctionInfos.__end_cap_.__value__2._allocator, v35, v39 - v35);
          }
          else
          {
            if (v25)
            {
              *(_QWORD *)v25 = v18;
              *(float64x2_t *)((char *)v25 + 8) = v24;
              *((_QWORD *)v25 + 3) = 0;
            }
            v20 = (LabelNavJunctionInfo *)((char *)v25 + 32);
          }
          self->_junctionInfos.__end_ = v20;
        }
        v18 += 8;
      }
      v5 = v45;
    }
    if (v5)
    {
      v40 = (unint64_t *)&v5->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

- (void)appendNavJunctionsInWorldRect:(const void *)a3 junctions:(id)a4
{
  LabelNavJunctionInfo *end;
  LabelNavJunctionInfo *begin;
  double v8;
  double v9;
  BOOL v10;
  VKLabelNavJunction *v12;
  id v13;

  v13 = a4;
  begin = self->_junctionInfos.__begin_;
  end = self->_junctionInfos.__end_;
  if (begin != end
    || (-[VKLabelNavTileData initializeJunctionInfos](self, "initializeJunctionInfos"),
        begin = self->_junctionInfos.__begin_,
        end = self->_junctionInfos.__end_,
        begin != end))
  {
    do
    {
      v8 = *((double *)begin + 1);
      if (v8 >= *(double *)a3)
      {
        v9 = *((double *)begin + 2);
        v10 = v8 >= *((double *)a3 + 2) || v9 < *((double *)a3 + 1);
        if (!v10 && v9 < *((double *)a3 + 3))
        {
          -[NSMapTable objectForKey:](self->_geoJunctionToJunctionMap, "objectForKey:", *(_QWORD *)begin);
          v12 = (VKLabelNavJunction *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            v12 = -[VKLabelNavJunction initWithGEOJunction:routeOffset:tile:]([VKLabelNavJunction alloc], "initWithGEOJunction:routeOffset:tile:", *(_QWORD *)begin, 0xBF80000000000000, &self->_tile);
            -[VKLabelNavTileData addJunction:](self, "addJunction:", v12);
          }
          objc_msgSend(v13, "addObject:", v12);

          end = self->_junctionInfos.__end_;
        }
      }
      begin = (LabelNavJunctionInfo *)((char *)begin + 32);
    }
    while (begin != end);
  }

}

- (void)findOppositeCarriagewayJunctionsWithRouteFeatures:(void *)a3 distanceThreshold:(double)a4
{
  LabelNavJunctionInfo *begin;
  VKLabelNavJunction *v8;
  VKLabelNavJunction *v9;
  unsigned __int8 v10;
  uint64_t *v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unsigned int *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  const void **v21;
  const void **v22;
  const void **v23;
  const void **v24;
  uint64_t v25;
  const void *v26;
  const void *v27;
  int v28;
  unsigned __int8 *v29;
  uint64_t v30;
  const void **v31;
  const void **v32;
  __int128 v33;
  const void **v34;
  uint64_t v35;
  const void *v36;
  const void *v37;
  int v38;
  unsigned __int8 *v39;
  uint64_t v40;
  const void **v41;
  double v42;
  double v43;
  unsigned int v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  BOOL v50;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  double *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  id *v69;
  uint64_t v70;
  id *v71;
  uint64_t v72;
  double v73;
  double v74;
  unsigned int v75;
  float v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  unsigned int v87;
  float v88;
  id *v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  const void **v93;
  const void **v94;
  const void **v95;
  uint64_t v96;
  shared_ptr<md::LabelTile> *p_tile;
  LabelNavJunctionInfo *end;
  uint64_t v99;
  std::__shared_weak_count *v100;
  unsigned __int8 v101;
  const void **v102;
  const void **v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD v106[3];
  _QWORD *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if (!self->_oppositeCarriagewayJunctionsValid)
  {
    self->_oppositeCarriagewayJunctionsValid = 1;
    if (self->_junctionInfos.__begin_ == self->_junctionInfos.__end_)
      -[VKLabelNavTileData initializeJunctionInfos](self, "initializeJunctionInfos");
    -[NSMutableArray removeAllObjects](self->_oppositeCarriagewayJunctions, "removeAllObjects");
    begin = self->_junctionInfos.__begin_;
    end = self->_junctionInfos.__end_;
    if (begin != end)
    {
      p_tile = &self->_tile;
      do
      {
        -[NSMapTable objectForKey:](self->_geoJunctionToJunctionMap, "objectForKey:", *(_QWORD *)begin);
        v8 = (VKLabelNavJunction *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          if (-[VKLabelNavJunction isOnRoute](v8, "isOnRoute"))
            goto LABEL_125;
          if (-[VKLabelNavJunction isOnDualCarriageway](v9, "isOnDualCarriageway"))
          {
            -[NSMutableArray addObject:](self->_oppositeCarriagewayJunctions, "addObject:", v9);
            goto LABEL_125;
          }
        }
        v102 = 0;
        v103 = 0;
        v104 = 0;
        {
          v96 = operator new();
          mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v96, "VectorKitLabels", 0x5ED09DD50000000FLL);
        }
        v105 = mdm::Allocator::instance(void)::alloc;
        v101 = 8;
        v11 = (uint64_t *)*((_QWORD *)p_tile->__ptr_ + 3);
        v13 = *v11;
        v12 = (std::__shared_weak_count *)v11[1];
        v99 = v13;
        v100 = v12;
        if (v12)
        {
          p_shared_owners = (unint64_t *)&v12->__shared_owners_;
          do
            v15 = __ldxr(p_shared_owners);
          while (__stxr(v15 + 1, p_shared_owners));
        }
        v16 = *(unsigned int **)begin;
        v106[0] = &off_1E42C80D8;
        v106[1] = &v101;
        v106[2] = &v102;
        v107 = v106;
        geo::codec::forEachEdgeOnJunction(&v99, v16, (uint64_t)v106);
        v17 = v107;
        if (v107 == v106)
        {
          v17 = v106;
          v18 = 4;
        }
        else
        {
          if (!v107)
            goto LABEL_20;
          v18 = 5;
        }
        (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_20:
        v19 = 126 - 2 * __clz(((char *)v103 - (char *)v102) >> 5);
        if (v103 == v102)
          v20 = 0;
        else
          v20 = v19;
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>> *,false>(v102, v103, v20, 1);
        v21 = v102;
        v22 = v103;
        if (v102 != v103)
        {
          v23 = v102 + 4;
          if (v102 + 4 != v103)
          {
            v24 = v102;
            while (1)
            {
              v25 = *((unsigned __int8 *)v24 + 23);
              if ((v25 & 0x80u) == 0)
                v26 = (const void *)*((unsigned __int8 *)v24 + 23);
              else
                v26 = v24[1];
              v27 = (const void *)*((unsigned __int8 *)v24 + 55);
              v28 = (char)v27;
              if ((char)v27 < 0)
                v27 = v24[5];
              if (v26 == v27)
                break;
LABEL_27:
              v23 += 4;
              v24 += 4;
              if (v23 == v22)
                goto LABEL_73;
            }
            if (v28 >= 0)
              v29 = (unsigned __int8 *)v23;
            else
              v29 = (unsigned __int8 *)*v23;
            if ((v25 & 0x80) != 0)
            {
              if (!memcmp(*v24, v29, (size_t)v24[1]))
                goto LABEL_42;
              goto LABEL_27;
            }
            if (*((_BYTE *)v24 + 23))
            {
              v30 = 0;
              while (*((unsigned __int8 *)v24 + v30) == v29[v30])
              {
                if (v25 == ++v30)
                  goto LABEL_42;
              }
              goto LABEL_27;
            }
LABEL_42:
            if (v24 != v22)
            {
              v31 = v24 + 8;
              if (v24 + 8 != v22)
              {
                v32 = v24 + 4;
                while (1)
                {
                  v34 = v32;
                  v32 = v31;
                  v35 = *((unsigned __int8 *)v24 + 23);
                  if ((v35 & 0x80u) == 0)
                    v36 = (const void *)*((unsigned __int8 *)v24 + 23);
                  else
                    v36 = v24[1];
                  v37 = (const void *)*((unsigned __int8 *)v34 + 55);
                  v38 = (char)v37;
                  if ((char)v37 < 0)
                    v37 = v34[5];
                  if (v36 != v37)
                    goto LABEL_46;
                  if (v38 >= 0)
                    v39 = (unsigned __int8 *)v32;
                  else
                    v39 = (unsigned __int8 *)*v32;
                  if ((v35 & 0x80) != 0)
                  {
                    if (memcmp(*v24, v39, (size_t)v24[1]))
                      goto LABEL_46;
                  }
                  else if (*((_BYTE *)v24 + 23))
                  {
                    v40 = 0;
                    while (*((unsigned __int8 *)v24 + v40) == v39[v40])
                    {
                      if (v35 == ++v40)
                        goto LABEL_49;
                    }
LABEL_46:
                    if (*((char *)v24 + 55) < 0)
                      (*(void (**)(const void *, const void *, unint64_t))(*(_QWORD *)v24[7] + 40))(v24[7], v24[4], (unint64_t)v24[6] & 0x7FFFFFFFFFFFFFFFLL);
                    v24 += 4;
                    v33 = *(_OWORD *)v32;
                    v24[2] = v32[2];
                    *(_OWORD *)v24 = v33;
                    *((_BYTE *)v34 + 55) = 0;
                    *(_BYTE *)v32 = 0;
                  }
LABEL_49:
                  v31 = v32 + 4;
                  if (v32 + 4 == v22)
                  {
                    v21 = v102;
                    v22 = v103;
                    break;
                  }
                }
              }
              v41 = v24 + 4;
              if (v22 != v41)
              {
                while (v22 != v41)
                {
                  if (*((char *)v22 - 9) < 0)
                    (*(void (**)(_QWORD, _QWORD, unint64_t))(*(_QWORD *)*(v22 - 1) + 40))(*(v22 - 1), *(v22 - 4), (unint64_t)*(v22 - 2) & 0x7FFFFFFFFFFFFFFFLL);
                  v22 -= 4;
                }
                v103 = v41;
                v21 = v102;
                v22 = v41;
              }
            }
          }
        }
LABEL_73:
        if (v21 != v22)
        {
          v42 = *((double *)begin + 1);
          v43 = *((double *)begin + 2);
          v44 = v101;
          do
          {
            v45 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::find<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(a3, (uint64_t)v21);
            if (v45)
            {
              v46 = v45[6];
              v48 = *(_QWORD *)(v46 + 64);
              v47 = *(_QWORD *)(v46 + 72);
              while (v48 != v47)
              {
                if (v44 <= *(unsigned __int8 *)(v48 + 48))
                {
                  v52 = *(double **)v48;
                  v53 = *(_QWORD *)(v48 + 8) - *(_QWORD *)v48;
                  v54 = v53 >> 4;
                  if ((unint64_t)v53 < 0x11)
                  {
                    v56 = 0;
                    v60 = 0.0;
                    v61 = 1.79769313e308;
                  }
                  else
                  {
                    v55 = 0;
                    v56 = 0;
                    v59 = *v52;
                    v58 = v52[1];
                    v57 = v52 + 3;
                    v60 = 0.0;
                    v61 = 1.79769313e308;
                    do
                    {
                      v63 = *(v57 - 1);
                      v64 = *v57;
                      v65 = v63 - v59;
                      v66 = *v57 - v58;
                      v67 = v65 * v65 + v66 * v66;
                      v68 = 0.0;
                      if (v67 > 1.0e-15)
                        v68 = fmin(fmax(((v42 - v59) * v65 + (v43 - v58) * v66) / v67, 0.0), 1.0);
                      v62 = (v42 - (v59 + v68 * v65)) * (v42 - (v59 + v68 * v65))
                          + (v43 - (v58 + v68 * v66)) * (v43 - (v58 + v68 * v66));
                      if (v62 < v61)
                      {
                        v60 = v68;
                        v56 = v55;
                      }
                      ++v55;
                      v61 = fmin(v62, v61);
                      v57 += 2;
                      v58 = v64;
                      v59 = v63;
                    }
                    while (v54 - 1 != v55);
                  }
                  if (v56 || v60 > 0.1)
                  {
                    v49 = v54 - 1;
                    v50 = v60 >= 0.99 && v56 >= v49;
                    if (!v50 && v61 <= a4)
                    {
                      if (!v9)
                      {
                        v9 = -[VKLabelNavJunction initWithGEOJunction:routeOffset:tile:]([VKLabelNavJunction alloc], "initWithGEOJunction:routeOffset:tile:", *(_QWORD *)begin, 0xBF80000000000000, p_tile);
                        -[VKLabelNavTileData addJunction:](self, "addJunction:", v9);
                      }
                      -[VKLabelNavJunction setDepthFromRoute:](v9, "setDepthFromRoute:", 1);
                      -[VKLabelNavJunction setIsOnDualCarriageway:](v9, "setIsOnDualCarriageway:", 1);
                      v69 = (id *)(v48 + 32);
                      v70 = objc_msgSend(*(id *)(v48 + 32), "routeOffset");
                      v71 = (id *)(v48 + 40);
                      v72 = objc_msgSend(*(id *)(v48 + 40), "routeOffset");
                      LODWORD(v74) = HIDWORD(v70);
                      if (*((float *)&v70 + 1) < 0.0 || (LODWORD(v73) = HIDWORD(v72), *((float *)&v72 + 1) < 0.0))
                      {
                        if (*((float *)&v70 + 1) >= 0.0)
                          v89 = (id *)(v48 + 32);
                        else
                          v89 = (id *)(v48 + 40);
                        -[VKLabelNavJunction setRouteOffset:](v9, "setRouteOffset:", objc_msgSend(*v89, "routeOffset", v74, v73));
                      }
                      else
                      {
                        v75 = objc_msgSend(*v69, "routeOffset", v74, v73);
                        LODWORD(v76) = (unint64_t)objc_msgSend(*v69, "routeOffset") >> 32;
                        v77 = objc_msgSend(*v71, "routeOffset");
                        v78 = objc_msgSend(*v71, "routeOffset");
                        v79 = *(_QWORD *)(v48 + 8);
                        v81 = **(double **)v48;
                        v80 = *(double *)(*(_QWORD *)v48 + 8);
                        v82 = *(double *)(v79 - 16) - v81;
                        v83 = *(double *)(v79 - 8) - v80;
                        v84 = v82 * v82 + v83 * v83;
                        v85 = 0.0;
                        if (v84 > 1.0e-15)
                          v85 = fmin(fmax(((v42 - v81) * v82 + (v43 - v80) * v83) / v84, 0.0), 1.0);
                        v86 = v76 + (double)v75 + v85 * ((double)v77 - (v76 + (double)v75) + *((float *)&v78 + 1));
                        v87 = v86;
                        v88 = v86 - trunc(v86);
                        if (v88 >= 1.0)
                        {
                          v87 += vcvtms_u32_f32(v88);
                          v88 = v88 - floorf(v88);
                        }
                        -[VKLabelNavJunction setRouteOffset:](v9, "setRouteOffset:", v87 | ((unint64_t)LODWORD(v88) << 32));
                      }
                      -[NSMutableArray addObject:](self->_oppositeCarriagewayJunctions, "addObject:", v9);
                      goto LABEL_113;
                    }
                  }
                }
                v48 += 56;
              }
            }
            v21 += 4;
          }
          while (v21 != v22);
        }
LABEL_113:
        v90 = v100;
        if (!v100)
          goto LABEL_117;
        v91 = (unint64_t *)&v100->__shared_owners_;
        do
          v92 = __ldaxr(v91);
        while (__stlxr(v92 - 1, v91));
        if (!v92)
        {
          ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
          std::__shared_weak_count::__release_weak(v90);
          v93 = v102;
          if (v102)
          {
LABEL_118:
            v94 = v103;
            v95 = v93;
            if (v103 != v93)
            {
              do
              {
                if (*((char *)v94 - 9) < 0)
                  (*(void (**)(_QWORD, _QWORD, unint64_t))(*(_QWORD *)*(v94 - 1) + 40))(*(v94 - 1), *(v94 - 4), (unint64_t)*(v94 - 2) & 0x7FFFFFFFFFFFFFFFLL);
                v94 -= 4;
              }
              while (v94 != v93);
              v95 = v102;
            }
            v103 = v93;
            (*(void (**)(uint64_t, const void **, uint64_t))(*(_QWORD *)v105 + 40))(v105, v95, v104 - (_QWORD)v95);
          }
        }
        else
        {
LABEL_117:
          v93 = v102;
          if (v102)
            goto LABEL_118;
        }
LABEL_125:

        begin = (LabelNavJunctionInfo *)((char *)begin + 32);
      }
      while (begin != end);
    }
  }
}

- (BOOL)oppositeCarriagewayJunctionsValid
{
  return self->_oppositeCarriagewayJunctionsValid;
}

- (void)setOppositeCarriagewayJunctionsValid:(BOOL)a3
{
  self->_oppositeCarriagewayJunctionsValid = a3;
}

- (NSMutableArray)oppositeCarriagewayJunctions
{
  return self->_oppositeCarriagewayJunctions;
}

- (const)tile
{
  return &self->_tile;
}

- (void).cxx_destruct
{
  LabelNavJunctionInfo *begin;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;

  begin = self->_junctionInfos.__begin_;
  if (begin)
  {
    self->_junctionInfos.__end_ = begin;
    (*(void (**)(Allocator *, LabelNavJunctionInfo *, int64_t))(*(_QWORD *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                                + 40))(self->_junctionInfos.__end_cap_.__value__2._allocator, begin, self->_junctionInfos.__end_cap_.__value_ - begin);
  }
  objc_storeStrong((id *)&self->_oppositeCarriagewayJunctions, 0);
  objc_storeStrong((id *)&self->_tileEdgeJunctions, 0);
  objc_storeStrong((id *)&self->_geoJunctionToJunctionMap, 0);
  cntrl = self->_tile.__cntrl_;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  unsigned __int8 v2;
  int v3;
  uint64_t v4;
  geo::read_write_lock *v5;
  const char *v6;
  malloc_zone_t *zone;
  id v8;

  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  if ((v2 & 1) == 0)
  {
    v8 = self;
    self = v8;
    if (v3)
    {
      v4 = operator new();
      *(_QWORD *)(v4 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v4 + 24) = "VectorKitLabels";
      *(_OWORD *)(v4 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v4 = &off_1E42B5668;
      *(_QWORD *)(v4 + 8) = "VectorKitLabels";
      *(_OWORD *)(v4 + 72) = 0u;
      *(_OWORD *)(v4 + 88) = 0u;
      *(_OWORD *)(v4 + 104) = 0u;
      *(_OWORD *)(v4 + 120) = 0u;
      *(_OWORD *)(v4 + 136) = 0u;
      *(_OWORD *)(v4 + 152) = 0u;
      *(_OWORD *)(v4 + 168) = 0u;
      *(_OWORD *)(v4 + 184) = 0u;
      *(_OWORD *)(v4 + 200) = 0u;
      *(_OWORD *)(v4 + 216) = 0u;
      *(_OWORD *)(v4 + 232) = 0u;
      *(_QWORD *)(v4 + 248) = 0;
      *(_OWORD *)(v4 + 56) = 0u;
      v5 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v4 + 56), 0);
      if ((_DWORD)v5)
        geo::read_write_lock::logFailure(v5, (uint64_t)"initialization", v6);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v4 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v4 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v4;
      self = v8;
    }
  }
  *((_QWORD *)self + 10) = mdm::Allocator::instance(void)::alloc;
  return self;
}

- (void)findOppositeCarriagewayJunctionsWithRouteFeatures:distanceThreshold:
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int *v8;
  int v9;
  _BYTE *v10;
  unsigned int v11;
  const char *v12;
  uint64_t *v13;
  unsigned __int8 v14;
  size_t v15;
  size_t v16;
  __int128 *p_dst;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t *v26;
  id v27;
  const char *v28;
  unsigned __int8 v29;
  size_t v30;
  size_t v31;
  __int128 *v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD *v35;
  _OWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 __dst;
  __int128 v41;

  v2 = **a2;
  if (v2)
  {
    v4 = *(_QWORD *)(v2 + 24);
    v5 = *(unsigned __int8 *)(v4 + 33);
    if (!*(_BYTE *)(v4 + 33))
      goto LABEL_8;
    v6 = 0;
    v7 = *(int **)v4;
    v8 = v7;
    while (1)
    {
      v9 = *v8;
      v8 += 2;
      if (v9 == 21)
        break;
      if (v5 == ++v6)
        goto LABEL_8;
    }
    if (v7[2 * v6 + 1] <= 0)
    {
LABEL_8:
      v10 = *(_BYTE **)(a1 + 8);
      v11 = *v10;
      if (v11 >= *(unsigned __int8 *)(v2 + 151))
        LOBYTE(v11) = *(_BYTE *)(v2 + 151);
      *v10 = v11;
      v12 = *(const char **)(v2 + 16);
      if (!v12 || !*v12)
        goto LABEL_27;
      v13 = *(uint64_t **)(a1 + 16);
      {
        v37 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v37, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      *((_QWORD *)&v41 + 1) = mdm::Allocator::instance(void)::alloc;
      v15 = strlen(v12);
      if (v15 > 0x7FFFFFFFFFFFFFF7)
        abort();
      v16 = v15;
      if (v15 >= 0x17)
      {
        v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v15 | 7) != 0x17)
          v18 = v15 | 7;
        v19 = v18 + 1;
        p_dst = (__int128 *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                 + 16))(mdm::Allocator::instance(void)::alloc, v18 + 1, 1);
        *((_QWORD *)&__dst + 1) = v16;
        *(_QWORD *)&v41 = v19 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        BYTE7(v41) = v15;
        p_dst = &__dst;
        if (!v15)
        {
LABEL_21:
          *((_BYTE *)p_dst + v16) = 0;
          v20 = (_OWORD *)v13[1];
          if ((unint64_t)v20 >= v13[2])
          {
            v21 = std::vector<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,geo::StdAllocator<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,mdm::Allocator>>::__push_back_slow_path<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(v13, (uint64_t)&__dst);
          }
          else
          {
            if (v20)
            {
              *v20 = __dst;
              v20[1] = v41;
              *(_QWORD *)&v41 = 0;
              __dst = 0uLL;
            }
            v21 = v20 + 2;
          }
          v13[1] = (uint64_t)v21;
          if (SBYTE7(v41) < 0)
          {
            (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)&v41 + 1) + 40))(*((_QWORD *)&v41 + 1), __dst, v41 & 0x7FFFFFFFFFFFFFFFLL);
            if (!*(_BYTE *)(v2 + 72))
              return;
            goto LABEL_28;
          }
LABEL_27:
          if (!*(_BYTE *)(v2 + 72))
            return;
LABEL_28:
          v39 = 0;
          *(_QWORD *)&__dst = 0;
          geo::codec::featureGetNativeShield(v2, 0, &__dst, &v39, 0);
          if ((_QWORD)__dst)
          {
            v22 = objc_alloc(MEMORY[0x1E0CB3940]);
            v23 = (void *)objc_msgSend(v22, "initWithUTF8String:", (_QWORD)__dst);
            if (v23)
            {
              v24 = objc_alloc(MEMORY[0x1E0CB3940]);
              v25 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@_%llX"), v23, v39);
              v26 = *(uint64_t **)(a1 + 16);
              v27 = objc_retainAutorelease(v25);
              v28 = (const char *)objc_msgSend(v27, "UTF8String");
              {
                v38 = operator new();
                mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v38, "VectorKitLabels", 0x5ED09DD50000000FLL);
              }
              *((_QWORD *)&v41 + 1) = mdm::Allocator::instance(void)::alloc;
              v30 = strlen(v28);
              if (v30 > 0x7FFFFFFFFFFFFFF7)
                abort();
              v31 = v30;
              if (v30 >= 0x17)
              {
                v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v30 | 7) != 0x17)
                  v33 = v30 | 7;
                v34 = v33 + 1;
                v32 = (__int128 *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                                       + 16))(mdm::Allocator::instance(void)::alloc, v33 + 1, 1);
                *((_QWORD *)&__dst + 1) = v31;
                *(_QWORD *)&v41 = v34 | 0x8000000000000000;
                *(_QWORD *)&__dst = v32;
              }
              else
              {
                BYTE7(v41) = v30;
                v32 = &__dst;
                if (!v30)
                  goto LABEL_42;
              }
              memmove(v32, v28, v31);
LABEL_42:
              *((_BYTE *)v32 + v31) = 0;
              v35 = (_OWORD *)v26[1];
              if ((unint64_t)v35 >= v26[2])
              {
                v36 = std::vector<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,geo::StdAllocator<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,mdm::Allocator>>::__push_back_slow_path<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(v26, (uint64_t)&__dst);
              }
              else
              {
                if (v35)
                {
                  *v35 = __dst;
                  v35[1] = v41;
                  *(_QWORD *)&v41 = 0;
                  __dst = 0uLL;
                }
                v36 = v35 + 2;
              }
              v26[1] = (uint64_t)v36;
              if (SBYTE7(v41) < 0)
                (*(void (**)(_QWORD, _QWORD, uint64_t))(**((_QWORD **)&v41 + 1) + 40))(*((_QWORD *)&v41 + 1), __dst, v41 & 0x7FFFFFFFFFFFFFFFLL);

            }
          }
          else
          {
            v23 = 0;
          }

          return;
        }
      }
      memmove(p_dst, v12, v16);
      goto LABEL_21;
    }
  }
}

- (__n128)findOppositeCarriagewayJunctionsWithRouteFeatures:distanceThreshold:
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E42C80D8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (__n128)_findTileEdgeJunctions
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E42F67B8;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (_QWORD)_findTileEdgeJunctions
{
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v10 = 0;
  v9 = geo::codec::multiSectionFeaturePoints(v3, 0, &v10);
  v4 = *(uint64_t **)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = operator new(0x20uLL);
  *v6 = &off_1E42F67B8;
  v6[1] = &v10;
  v6[2] = &v9;
  v6[3] = v5;
  v12 = v6;
  geo::codec::forEachEdgeInRoad(v4, (uint64_t)v3, 1, (uint64_t)v11);
  result = v12;
  if (v12 == v11)
  {
    v8 = 4;
    result = v11;
  }
  else
  {
    if (!v12)
      return result;
    v8 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v8))();
}

@end
