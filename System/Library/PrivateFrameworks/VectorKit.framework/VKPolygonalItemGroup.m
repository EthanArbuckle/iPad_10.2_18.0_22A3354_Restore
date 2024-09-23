@implementation VKPolygonalItemGroup

- (VKPolygonalItemGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6
{
  VKPolygonalItemGroup *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v11 = 0;
  v12 = 0;
  v6 = -[VKPolygonalItemGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](self, "initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:", a3, a5, &v11);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v6;
}

- (VKPolygonalItemGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6 storage:(shared_ptr<md::MeshSetStorage>)a7
{
  MeshSetStorage *ptr;
  VKPolygonalItemGroup *v12;
  VKPolygonalItemGroup *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  void *v16;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v19;
  float v20;
  char v21;
  uint64_t v22;
  MeshSetStorage *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  __int128 v29;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  objc_super v48;

  ptr = a7.__ptr_;
  v48.receiver = self;
  v48.super_class = (Class)VKPolygonalItemGroup;
  v12 = -[VKPolygonalItemGroup init](&v48, sel_init, a3, a5, a7.__ptr_, a7.__cntrl_);
  v13 = v12;
  if (v12)
  {
    v12->_tileZoom = a4;
    v12->_contentScale = a6;
    v14 = *(_QWORD *)a3;
    v15 = *(std::__shared_weak_count **)(v14 + 16);
    if (v15 && (v15 = std::__shared_weak_count::lock(v15)) != 0)
      v16 = *(void **)(v14 + 8);
    else
      v16 = 0;
    v13->_styleManager.__ptr_ = v16;
    cntrl = (std::__shared_weak_count *)v13->_styleManager.__cntrl_;
    v13->_styleManager.__cntrl_ = (__shared_weak_count *)v15;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    *(_OWORD *)v13->_boundingBox._minimum._e = xmmword_19FFB4D20;
    *(_QWORD *)&v13->_boundingBox._maximum._e[1] = 0x80000000800000;
    if (a5)
    {
      v13->_centroid._e[0] = *(float *)a5;
      v20 = *((float *)a5 + 1);
      v21 = 1;
    }
    else
    {
      v21 = 0;
      v13->_centroid._e[0] = 0.0;
      v20 = 0.0;
    }
    v13->_isFixedSize = v21;
    v13->_centroid._e[1] = v20;
    v23 = *(MeshSetStorage **)ptr;
    v22 = *((_QWORD *)ptr + 1);
    if (v22)
    {
      v24 = (unint64_t *)(v22 + 8);
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    v26 = (std::__shared_weak_count *)v13->_meshStorage.__cntrl_;
    v13->_meshStorage.__ptr_ = v23;
    v13->_meshStorage.__cntrl_ = (__shared_weak_count *)v22;
    if (v26)
    {
      v27 = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::MeshSet((uint64_t)&v31, (uint64_t)v13->_meshStorage.__ptr_);
    if (v13->_fillMeshInfo._hasValue)
    {
      md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::operator=((uint64_t)&v13->_fillMeshInfo._value, (uint64_t)&v31);
    }
    else
    {
      *(_OWORD *)v13->_fillMeshInfo._value.data = v31;
      *(_QWORD *)&v13->_anon_18[8] = v32;
      v31 = 0uLL;
      *(_OWORD *)&v13->_anon_18[16] = v33;
      *(_QWORD *)&v13->_anon_18[32] = v34;
      v32 = 0;
      v33 = 0uLL;
      v34 = 0;
      *(_OWORD *)&v13->_anon_18[40] = v35;
      *(_OWORD *)&v13->_anon_18[56] = v36;
      v13->_anon_18[72] = v37;
      v13->_anon_18[73] = v38;
      *(_QWORD *)&v13->_anon_18[80] = v39;
      v35 = 0uLL;
      *(_OWORD *)&v13->_anon_18[88] = v40;
      *(_OWORD *)&v13->_anon_18[104] = v41;
      v13->_anon_18[120] = v42;
      v13->_anon_18[121] = v43;
      *(_QWORD *)&v13->_anon_18[128] = v44;
      v39 = 0;
      v40 = 0uLL;
      v44 = 0;
      *(_OWORD *)&v13->_anon_18[136] = v45;
      v29 = v46;
      v46 = 0uLL;
      *(_OWORD *)&v13->_anon_18[152] = v29;
      *(_QWORD *)&v13->_anon_18[168] = v47;
      v47 = 0;
      v13->_fillMeshInfo._hasValue = 1;
    }
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v31);
  }
  return v13;
}

- (unsigned)maxAttributeSetsPerGroup
{
  return 16;
}

- (const)attributeSets
{
  return &self->_attributeSets;
}

- (const)origin
{
  return &self->_boundingBox;
}

- (const)maxPoint
{
  return &self->_boundingBox._maximum;
}

- (Matrix<float,)size
{
  float32x2_t v2;
  float v3;
  float v4;
  Matrix<float, 3, 1> result;

  v2 = vmaxnm_f32(vsub_f32(*(float32x2_t *)self->_boundingBox._maximum._e, *(float32x2_t *)self->_boundingBox._minimum._e), 0);
  v3 = fmaxf(self->_boundingBox._maximum._e[2] - self->_boundingBox._minimum._e[2], 0.0);
  v4 = v2.f32[1];
  result._e[0] = v2.f32[0];
  result._e[2] = v3;
  result._e[1] = v4;
  return result;
}

- (void)styleQueries:(const StyleQueryOverride *)a3
{
}

- (float)tileZoom
{
  return self->_tileZoom;
}

- (void)fillMeshes
{
  return &self->_fillMeshes;
}

- (const)commitRangesToFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  __n128 v6;
  function<BOOL (unsigned long long)> *var1;
  uint64_t v12;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_fillCullingGroups;
  char *begin;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      v23 = v22;
      (*(void (**)(function<BOOL (unsigned long long)> *, _BYTE *))(*(_QWORD *)a6->var0.var0.__lx + 24))(a6, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx
                                                                                           + 16))(var1, a2);
    }
  }
  else
  {
    v23 = 0;
  }
  v12 = 0;
  p_fillCullingGroups = &self->_fillCullingGroups;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v12) & 1) != 0)
    {
      begin = (char *)p_fillCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_fillCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        v15 = &begin[24 * a4];
        v16 = *(_QWORD *)v15;
        v17 = *((_QWORD *)v15 + 1);
        while (v16 != v17)
        {
          v21 = *(_QWORD *)(v16 + 16);
          if (!v23)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_BYTE *, uint64_t *))(*(_QWORD *)v23 + 48))(v23, &v21))
          {
            if (*(_QWORD *)(v16 + 8) != *(_QWORD *)v16)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
    goto LABEL_21;
  }
  if (v23)
  {
    v19 = 5;
LABEL_21:
    v6.n128_f64[0] = (*(double (**)(_QWORD *))(*v18 + 8 * v19))(v18);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0, v6);
}

- (const)commitRangesToStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  __n128 v6;
  function<BOOL (unsigned long long)> *var1;
  uint64_t v12;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_strokeCullingGroups;
  char *begin;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      v23 = v22;
      (*(void (**)(function<BOOL (unsigned long long)> *, _BYTE *))(*(_QWORD *)a6->var0.var0.__lx + 24))(a6, v22);
    }
    else
    {
      v23 = (_BYTE *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(_QWORD *)var1->var0.var0.__lx
                                                                                           + 16))(var1, a2);
    }
  }
  else
  {
    v23 = 0;
  }
  v12 = 0;
  p_strokeCullingGroups = &self->_strokeCullingGroups;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v12) & 1) != 0)
    {
      begin = (char *)p_strokeCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_strokeCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        v15 = &begin[24 * a4];
        v16 = *(_QWORD *)v15;
        v17 = *((_QWORD *)v15 + 1);
        while (v16 != v17)
        {
          v21 = *(_QWORD *)(v16 + 16);
          if (!v23)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_BYTE *, uint64_t *))(*(_QWORD *)v23 + 48))(v23, &v21))
          {
            if (*(_QWORD *)(v16 + 8) != *(_QWORD *)v16)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  v18 = v23;
  if (v23 == v22)
  {
    v19 = 4;
    v18 = v22;
    goto LABEL_21;
  }
  if (v23)
  {
    v19 = 5;
LABEL_21:
    v6.n128_f64[0] = (*(double (**)(_QWORD *))(*v18 + 8 * v19))(v18);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0, v6);
}

- (const)commitRangesToVenueWallRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  __n128 v5;
  uint64_t v9;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueCullingGroups;
  char *begin;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v9 = 0;
  v21 = *MEMORY[0x1E0C80C00];
  p_venueCullingGroups = &self->_venueCullingGroups;
  v19[0] = &off_1E42D2830;
  v20 = v19;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v9) & 1) != 0)
    {
      begin = (char *)p_venueCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_venueCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        v12 = &begin[24 * a4];
        v13 = *(_QWORD *)v12;
        v14 = *((_QWORD *)v12 + 1);
        while (v13 != v14)
        {
          v18 = *(_QWORD *)(v13 + 16);
          if (!v20)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_QWORD *, uint64_t *))(*v20 + 48))(v20, &v18))
          {
            if (*(_QWORD *)(v13 + 8) != *(_QWORD *)v13)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  v15 = v20;
  if (v20 == v19)
  {
    v16 = 4;
    v15 = v19;
    goto LABEL_16;
  }
  if (v20)
  {
    v16 = 5;
LABEL_16:
    v5.n128_f64[0] = (*(double (**)(_QWORD *, SEL))(*v15 + 8 * v16))(v15, a2);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0xC8u, v5);
}

- (const)commitRangesToVenueWallEndCapRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  __n128 v5;
  uint64_t v9;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueEndCapCullingGroups;
  char *begin;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v9 = 0;
  v21 = *MEMORY[0x1E0C80C00];
  p_venueEndCapCullingGroups = &self->_venueEndCapCullingGroups;
  v19[0] = &off_1E42D2830;
  v20 = v19;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v9) & 1) != 0)
    {
      begin = (char *)p_venueEndCapCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_venueEndCapCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        v12 = &begin[24 * a4];
        v13 = *(_QWORD *)v12;
        v14 = *((_QWORD *)v12 + 1);
        while (v13 != v14)
        {
          v18 = *(_QWORD *)(v13 + 16);
          if (!v20)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_QWORD *, uint64_t *))(*v20 + 48))(v20, &v18))
          {
            if (*(_QWORD *)(v13 + 8) != *(_QWORD *)v13)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  v15 = v20;
  if (v20 == v19)
  {
    v16 = 4;
    v15 = v19;
    goto LABEL_16;
  }
  if (v20)
  {
    v16 = 5;
LABEL_16:
    v5.n128_f64[0] = (*(double (**)(_QWORD *, SEL))(*v15 + 8 * v16))(v15, a2);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0xC8u, v5);
}

- (const)commitRangesToHorizontalVenueWallStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  __n128 v5;
  uint64_t v9;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueWallHorizontalStrokeCullingGroups;
  char *begin;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v9 = 0;
  v21 = *MEMORY[0x1E0C80C00];
  p_venueWallHorizontalStrokeCullingGroups = &self->_venueWallHorizontalStrokeCullingGroups;
  v19[0] = &off_1E42D2830;
  v20 = v19;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v9) & 1) != 0)
    {
      begin = (char *)p_venueWallHorizontalStrokeCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL
         * (((char *)p_venueWallHorizontalStrokeCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        v12 = &begin[24 * a4];
        v13 = *(_QWORD *)v12;
        v14 = *((_QWORD *)v12 + 1);
        while (v13 != v14)
        {
          v18 = *(_QWORD *)(v13 + 16);
          if (!v20)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_QWORD *, uint64_t *))(*v20 + 48))(v20, &v18))
          {
            if (*(_QWORD *)(v13 + 8) != *(_QWORD *)v13)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  v15 = v20;
  if (v20 == v19)
  {
    v16 = 4;
    v15 = v19;
    goto LABEL_16;
  }
  if (v20)
  {
    v16 = 5;
LABEL_16:
    v5.n128_f64[0] = (*(double (**)(_QWORD *, SEL))(*v15 + 8 * v16))(v15, a2);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0xC8u, v5);
}

- (const)commitRangesToVerticalVenueWallStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  __n128 v5;
  uint64_t v9;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueWallVerticalStrokeCullingGroups;
  char *begin;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v9 = 0;
  v21 = *MEMORY[0x1E0C80C00];
  p_venueWallVerticalStrokeCullingGroups = &self->_venueWallVerticalStrokeCullingGroups;
  v19[0] = &off_1E42D2830;
  v20 = v19;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  do
  {
    if (((a5 >> v9) & 1) != 0)
    {
      begin = (char *)p_venueWallVerticalStrokeCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL
         * (((char *)p_venueWallVerticalStrokeCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        v12 = &begin[24 * a4];
        v13 = *(_QWORD *)v12;
        v14 = *((_QWORD *)v12 + 1);
        while (v13 != v14)
        {
          v18 = *(_QWORD *)(v13 + 16);
          if (!v20)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(_QWORD *, uint64_t *))(*v20 + 48))(v20, &v18))
          {
            if (*(_QWORD *)(v13 + 8) != *(_QWORD *)v13)
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  v15 = v20;
  if (v20 == v19)
  {
    v16 = 4;
    v15 = v19;
    goto LABEL_16;
  }
  if (v20)
  {
    v16 = 5;
LABEL_16:
    v5.n128_f64[0] = (*(double (**)(_QWORD *, SEL))(*v15 + 8 * v16))(v15, a2);
  }
  return ggl::Batcher::commit((__int128 **)a3, 0xC8u, v5);
}

- (unsigned)indexForGeoFeatureAttributes:(const void *)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *left;
  uint64_t v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *v8;
  char *v9;
  _BOOL4 v10;
  char **v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  char *end;
  char *value;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  _BYTE *begin;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  __int128 v32;
  unint64_t *v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  __int128 v42;
  _QWORD *v43;
  _BYTE *v44;
  std::__shared_weak_count *v45;
  unint64_t *p_shared_owners;
  unint64_t v47;
  uint64_t v49;
  _DWORD *v50;
  _DWORD *v51;
  int *v52;
  int *v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  int v57;
  int v58;

  p_pair1 = &self->_attributeSets._set.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_;
  v7 = *(_QWORD *)a3;
  v8 = &self->_attributeSets._set.__tree_.__pair1_;
  if (!left)
  {
LABEL_13:
    v13 = (uint64_t *)operator new(0x30uLL);
    v14 = v13;
    v15 = *((_QWORD *)a3 + 1);
    v13[4] = v7;
    v13[5] = v15;
    if (v15)
    {
      v16 = (unint64_t *)(v15 + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    *v13 = 0;
    v13[1] = 0;
    v13[2] = (uint64_t)v8;
    p_pair1->__value_.__left_ = v13;
    v18 = *(void **)self->_attributeSets._set.__tree_.__begin_node_;
    if (v18)
    {
      self->_attributeSets._set.__tree_.__begin_node_ = v18;
      v14 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_, v14);
    ++self->_attributeSets._set.__tree_.__pair3_.__value_;
LABEL_19:
    end = (char *)self->_attributeSets._array.__end_;
    value = (char *)self->_attributeSets._array.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->_attributeSets._array.__begin_;
      v26 = (end - begin) >> 4;
      v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 60)
        abort();
      v28 = value - begin;
      if (v28 >> 3 > v27)
        v27 = v28 >> 3;
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
        v27 = 0xFFFFFFFFFFFFFFFLL;
      if (v27)
      {
        v29 = 16 * v27;
        v30 = (*(uint64_t (**)(Allocator *, unint64_t, uint64_t))(*(_QWORD *)self->_attributeSets._array.__end_cap_.__value__2._allocator
                                                                                + 16))(self->_attributeSets._array.__end_cap_.__value__2._allocator, 16 * v27, 8);
        v31 = (_OWORD *)(v30 + 16 * v26);
        v27 = v30 + v29;
        if (v30)
        {
          v32 = *(_OWORD *)a3;
          *v31 = *(_OWORD *)a3;
          if (*((_QWORD *)&v32 + 1))
          {
            v33 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
            do
              v34 = __ldxr(v33);
            while (__stxr(v34 + 1, v33));
          }
        }
      }
      else
      {
        v31 = (_OWORD *)(16 * v26);
      }
      v24 = v31 + 1;
      v40 = self->_attributeSets._array.__end_;
      v41 = self->_attributeSets._array.__begin_;
      if (v40 == v41)
      {
        self->_attributeSets._array.__begin_ = v31;
        self->_attributeSets._array.__end_ = v24;
        v44 = self->_attributeSets._array.__end_cap_.__value_;
        self->_attributeSets._array.__end_cap_.__value_ = (void *)v27;
      }
      else
      {
        do
        {
          v42 = *((_OWORD *)v40 - 1);
          v40 -= 2;
          *--v31 = v42;
          *v40 = 0;
          v40[1] = 0;
        }
        while (v40 != v41);
        v40 = self->_attributeSets._array.__begin_;
        v43 = self->_attributeSets._array.__end_;
        self->_attributeSets._array.__begin_ = v31;
        self->_attributeSets._array.__end_ = v24;
        v44 = self->_attributeSets._array.__end_cap_.__value_;
        self->_attributeSets._array.__end_cap_.__value_ = (void *)v27;
        while (v43 != v40)
        {
          v45 = (std::__shared_weak_count *)*(v43 - 1);
          if (v45)
          {
            p_shared_owners = (unint64_t *)&v45->__shared_owners_;
            do
              v47 = __ldaxr(p_shared_owners);
            while (__stlxr(v47 - 1, p_shared_owners));
            if (!v47)
            {
              ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
              std::__shared_weak_count::__release_weak(v45);
            }
          }
          v43 -= 2;
        }
      }
      if (v40)
        (*(void (**)(Allocator *, _QWORD *, int64_t))(*(_QWORD *)self->_attributeSets._array.__end_cap_.__value__2._allocator
                                                                      + 40))(self->_attributeSets._array.__end_cap_.__value__2._allocator, v40, v44 - (_BYTE *)v40);
    }
    else
    {
      if (end)
      {
        v21 = *((_QWORD *)a3 + 1);
        *(_QWORD *)end = *(_QWORD *)a3;
        *((_QWORD *)end + 1) = v21;
        if (v21)
        {
          v22 = (unint64_t *)(v21 + 8);
          do
            v23 = __ldxr(v22);
          while (__stxr(v23 + 1, v22));
        }
      }
      v24 = end + 16;
    }
    self->_attributeSets._array.__end_ = v24;
    return ((int64_t)((uint64_t)v24 - (unint64_t)self->_attributeSets._array.__begin_) >> 4) - 1;
  }
  v9 = (char *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_;
  do
  {
    v10 = FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(*((_QWORD *)v9 + 4), v7);
    v11 = (char **)(v9 + 8);
    if (!v10)
    {
      v11 = (char **)v9;
      v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)v9;
    }
    v9 = *v11;
  }
  while (*v11);
  if (v8 == p_pair1
    || FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v7, (uint64_t)v8[4].__value_.__left_))
  {
    while (1)
    {
      while (1)
      {
        v8 = left;
        v12 = (uint64_t)left[4].__value_.__left_;
        if (!FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v7, v12))
          break;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)left->__value_.__left_;
        p_pair1 = v8;
        if (!v8->__value_.__left_)
          goto LABEL_13;
      }
      if (!FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v12, v7))
        goto LABEL_19;
      p_pair1 = left + 1;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)left[1].__value_.__left_;
      if (!left)
        goto LABEL_13;
    }
  }
  v35 = self->_attributeSets._array.__begin_;
  v36 = (char *)self->_attributeSets._array.__end_ - (char *)v35;
  if (v36)
  {
    v37 = v36 >> 4;
    if (v37 <= 1)
      v38 = 1;
    else
      v38 = v37;
    if (*(_BYTE *)(v7 + 33))
    {
      v36 = 0;
      v39 = *(unsigned __int8 *)(v7 + 33);
      while (1)
      {
        v49 = v35[2 * v36];
        if ((_DWORD)v39 == *(unsigned __int8 *)(v49 + 33))
        {
          v50 = *(_DWORD **)v7;
          v51 = *(_DWORD **)v49;
          if (**(_DWORD **)v7 == *v51 && v50[1] == v51[1])
            break;
        }
LABEL_59:
        if (++v36 == v38)
          goto LABEL_71;
      }
      v52 = v51 + 3;
      v53 = v50 + 3;
      v54 = 1;
      while (v39 != v54)
      {
        v55 = v54;
        if (*(v53 - 1) == *(v52 - 1))
        {
          v57 = *v53;
          v53 += 2;
          v56 = v57;
          v58 = *v52;
          v52 += 2;
          ++v54;
          if (v56 == v58)
            continue;
        }
        if (v55 >= v39)
          return v36;
        goto LABEL_59;
      }
    }
    else
    {
      v36 = 0;
      while (*(_BYTE *)(*v35 + 33))
      {
        ++v36;
        v35 += 2;
        if (v38 == v36)
        {
LABEL_71:
          LOBYTE(v36) = v38;
          return v36;
        }
      }
    }
  }
  return v36;
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  __n128 v3;

  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::createMeshes((uint64_t *)&self->_fillMeshInfo._value, (uint64_t)"Polygon Fill Mesh", (uint64_t)"Polygon Fill Vertex Data", (uint64_t)"Polygon Fill Index Data", a3, v3);
}

- (void)didFinishAddingData
{
  ValueUnion *p_value;
  uint64_t *v4;
  vector<std::shared_ptr<ggl::PolygonBase::CompressedMeshMesh>, std::allocator<std::shared_ptr<ggl::PolygonBase::CompressedMeshMesh>>> *p_fillMeshes;
  char *begin;
  char *end;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unordered_set<unsigned long long, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<unsigned long long>> *p_featureIds;
  vector<std::vector<FeatureRange>, std::allocator<std::vector<FeatureRange>>> *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueCullingGroups;
  vector<std::vector<FeatureRange>, std::allocator<std::vector<FeatureRange>>> *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *__p[2];
  void *v32[2];
  int v33;

  p_value = &self->_fillMeshInfo._value;
  v4 = md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::finishedWriting((uint64_t *)&self->_fillMeshInfo._value);
  p_fillMeshes = &self->_fillMeshes;
  begin = (char *)self->_fillMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_fillMeshes.__end_;
    v8 = self->_fillMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v9 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v9)
        {
          p_shared_owners = (unint64_t *)&v9->__shared_owners_;
          do
            v11 = __ldaxr(p_shared_owners);
          while (__stlxr(v11 - 1, p_shared_owners));
          if (!v11)
          {
            ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
            std::__shared_weak_count::__release_weak(v9);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v8 = p_fillMeshes->__begin_;
    }
    self->_fillMeshes.__end_ = begin;
    operator delete(v8);
    p_fillMeshes->__begin_ = 0;
    self->_fillMeshes.__end_ = 0;
    self->_fillMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&self->_fillMeshes.__begin_ = *(_OWORD *)v4;
  self->_fillMeshes.__end_cap_.__value_ = (void *)v4[2];
  *v4 = 0;
  v4[1] = 0;
  v4[2] = 0;
  if (self->_fillMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)p_value);
    self->_fillMeshInfo._hasValue = 0;
  }
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v32 = 0u;
  v33 = 1065353216;
  std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__move_assign((uint64_t)&self->_polygonEdges, (uint64_t *)__p);
  v12 = v32[0];
  if (v32[0])
  {
    do
    {
      v21 = (_QWORD *)*v12;
      v22 = (void *)v12[4];
      if (v22)
      {
        v12[5] = v22;
        operator delete(v22);
      }
      operator delete(v12);
      v12 = v21;
    }
    while (v21);
  }
  if (__p[0])
    operator delete(__p[0]);
  v13 = 0;
  p_featureIds = &self->_featureIds;
  do
  {
    v15 = &self->_fillCullingGroups.__elems_[v13];
    v16 = (uint64_t *)v15->__begin_;
    v17 = (uint64_t *)v15->__end_;
    while (v16 != v17)
    {
      v18 = *v16;
      v19 = v16[1];
      while (v18 != v19)
      {
        v20 = *(_QWORD *)(v18 + 16);
        if (v20)
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&self->_featureIds, v20, *(_QWORD *)(v18 + 16));
        v18 += 24;
      }
      v16 += 3;
    }
    ++v13;
  }
  while (v13 != 16);
  v23 = 0;
  p_venueCullingGroups = &self->_venueCullingGroups;
  do
  {
    v25 = &p_venueCullingGroups->__elems_[v23];
    v26 = (uint64_t *)v25->__begin_;
    v27 = (uint64_t *)v25->__end_;
    while (v26 != v27)
    {
      v28 = *v26;
      v29 = v26[1];
      while (v28 != v29)
      {
        v30 = *(_QWORD *)(v28 + 16);
        if (v30)
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)p_featureIds, v30, *(_QWORD *)(v28 + 16));
        v28 += 24;
      }
      v26 += 3;
    }
    ++v23;
  }
  while (v23 != 16);
}

- (BOOL)canAcceptPolygon:(void *)a3
{
  int64_t v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *p_pair1;
  char *left;
  uint64_t v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *v10;
  _BOOL4 v11;
  char **v12;

  v5 = (char *)self->_attributeSets._array.__end_ - (char *)self->_attributeSets._array.__begin_;
  if (-[VKPolygonalItemGroup maxAttributeSetsPerGroup](self, "maxAttributeSetsPerGroup") > (unint64_t)(v5 >> 4))
    return 1;
  p_pair1 = &self->_attributeSets._set.__tree_.__pair1_;
  left = (char *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_10;
  v9 = *((_QWORD *)a3 + 3);
  v10 = &self->_attributeSets._set.__tree_.__pair1_;
  do
  {
    v11 = FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(*((_QWORD *)left + 4), v9);
    v12 = (char **)(left + 8);
    if (!v11)
    {
      v12 = (char **)left;
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)left;
    }
    left = *v12;
  }
  while (*v12);
  if (v10 == p_pair1
    || FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v9, (uint64_t)v10[4].__value_.__left_))
  {
LABEL_10:
    v10 = p_pair1;
  }
  return v10 != p_pair1;
}

- (BOOL)hasFeatureId:(unint64_t)a3
{
  unint64_t value;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  value = self->_featureIds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      v5 = a3;
      if (value <= a3)
        v5 = a3 % value;
    }
    else
    {
      v5 = (value - 1) & a3;
    }
    v6 = self->_featureIds.__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v6)
    {
      v6 = (_QWORD *)*v6;
      if (v6)
      {
        if (v4.u32[0] < 2uLL)
        {
          v7 = value - 1;
          while (1)
          {
            v9 = v6[1];
            if (v9 == a3)
            {
              if (v6[2] == a3)
                return v6 != 0;
            }
            else if ((v9 & v7) != v5)
            {
              goto LABEL_21;
            }
            v6 = (_QWORD *)*v6;
            if (!v6)
              return v6 != 0;
          }
        }
        do
        {
          v8 = v6[1];
          if (v8 == a3)
          {
            if (v6[2] == a3)
              return v6 != 0;
          }
          else
          {
            if (v8 >= value)
              v8 %= value;
            if (v8 != v5)
              goto LABEL_21;
          }
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
    }
  }
  else
  {
LABEL_21:
    v6 = 0;
  }
  return v6 != 0;
}

- (const)featureIds
{
  return &self->_featureIds;
}

- (void)updateCachedStyles
{
  VKPolygonalItemGroup *v2;
  unordered_map<StyleQueryOverride, std::vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>, (anonymous namespace)::StyleQueryOverrideHash, std::equal_to<StyleQueryOverride>, std::allocator<std::pair<const StyleQueryOverride, std::vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>>>> *p_styleQueries;
  _QWORD *next;
  unint64_t value;
  uint64_t i;
  uint64_t *begin;
  uint64_t v8;
  gss::Allocator *FeatureAttributeSet;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int16 routeProximity;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  _OWORD *v39;
  __int128 *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 *v46;
  __int16 v47;
  uint64_t v48;
  _DWORD *v49;
  _DWORD *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t v54;
  char *v55;
  unint64_t v56;
  __int16 v57;
  uint64_t v58;
  char *v59;
  uint64_t ptr;
  char *v61;
  char *v62;
  unint64_t v63;
  _OWORD *v64;
  _OWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _OWORD *v70;
  char *v71;
  _QWORD *v72;
  _QWORD *v73;
  __int128 v74;
  _QWORD *v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  unsigned __int16 v86;
  unsigned __int16 v87;
  unsigned __int16 v88;
  uint64_t v89;
  _DWORD *v90;
  uint64_t v91;
  void *v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  unint64_t *p_shared_owners;
  unint64_t v98;
  unsigned __int16 v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  VKPolygonalItemGroup *v104;
  __int128 v105;
  _BYTE __src[15];
  char v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;

  v2 = self;
  p_styleQueries = &self->_styleQueries;
  if (self->_styleQueries.__table_.__p2_.__value_)
  {
    next = self->_styleQueries.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v93 = (_QWORD *)*next;
        v94 = next[3];
        if (v94)
        {
          v95 = next[4];
          v92 = (void *)next[3];
          if (v95 != v94)
          {
            do
            {
              v96 = *(std::__shared_weak_count **)(v95 - 8);
              if (v96)
              {
                p_shared_owners = (unint64_t *)&v96->__shared_owners_;
                do
                  v98 = __ldaxr(p_shared_owners);
                while (__stlxr(v98 - 1, p_shared_owners));
                if (!v98)
                {
                  ((void (*)(std::__shared_weak_count *, SEL))v96->__on_zero_shared)(v96, a2);
                  std::__shared_weak_count::__release_weak(v96);
                }
              }
              v95 -= 16;
            }
            while (v95 != v94);
            v92 = (void *)next[3];
          }
          next[4] = v94;
          operator delete(v92);
        }
        operator delete(next);
        next = v93;
      }
      while (v93);
    }
    v2->_styleQueries.__table_.__p1_.__value_.__next_ = 0;
    value = v2->_styleQueries.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        p_styleQueries->__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    v2->_styleQueries.__table_.__p2_.__value_ = 0;
  }
  v103 = (uint64_t)p_styleQueries;
  v112 = 0x101010000010000;
  begin = (uint64_t *)v2->_attributeSets._array.__begin_;
  if (v2->_attributeSets._array.__end_ != begin)
  {
    v8 = 0;
    v104 = v2;
    do
    {
      FeatureAttributeSet = (gss::Allocator *)md::createFeatureAttributeSet((gss::Allocator *)&v108, &begin[2 * v8]);
      v102 = v111;
      v11 = v108;
      v10 = v109;
      v12 = v109 - v108;
      if (v109 == v108)
      {
        v101 = 0;
        v13 = 0;
        v16 = v111;
        if (v108)
          goto LABEL_17;
      }
      else
      {
        if (v12 < 0)
          abort();
        FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, int64_t, uint64_t))(*(_QWORD *)v111 + 16))(v111, v109 - v108, 4);
        v13 = (char *)FeatureAttributeSet;
        v14 = 0;
        v15 = v12 >> 3;
        do
        {
          if ((gss::Allocator *)((char *)FeatureAttributeSet + v14))
            *(_QWORD *)((char *)FeatureAttributeSet + v14) = *(_QWORD *)&v11[v14];
          v14 += 8;
        }
        while (&v11[v14] != v10);
        v12 = (uint64_t)FeatureAttributeSet + v14;
        v101 = (char *)FeatureAttributeSet + 8 * v15;
        v11 = v108;
        v16 = v102;
        if (v108)
        {
LABEL_17:
          v109 = v11;
          FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, char *, int64_t))(*(_QWORD *)v111 + 40))(v111, v11, v110 - v11);
        }
      }
      v100 = v8;
      if (v2->_hasRouteAttributes)
      {
        if (!v2->_routeAttributes.hasRouteSignificance)
        {
          v17 = v12;
          goto LABEL_51;
        }
        if (v12 < (unint64_t)v101)
        {
          if (v12)
          {
            *(_DWORD *)v12 = 44;
            *(_WORD *)(v12 + 4) = v2->_routeAttributes.routeSignificance;
          }
          v17 = v12 + 8;
LABEL_51:
          routeProximity = v2->_routeAttributes.routeProximity;
          if (v17 < (unint64_t)v101)
          {
            if (v17)
            {
              *(_DWORD *)v17 = 44;
              *(_WORD *)(v17 + 4) = routeProximity;
            }
            v12 = v17 + 8;
            goto LABEL_79;
          }
          v32 = (uint64_t)(v17 - (_QWORD)v13) >> 3;
          v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 61)
            abort();
          if ((v101 - v13) >> 2 > v33)
            v33 = (v101 - v13) >> 2;
          if ((unint64_t)(v101 - v13) >= 0x7FFFFFFFFFFFFFF8)
            v34 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v34 = v33;
          if (v34)
          {
            FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v102 + 16))(v102, 8 * v34, 4);
            v35 = (uint64_t)FeatureAttributeSet + 8 * v32;
            v34 = (uint64_t)FeatureAttributeSet + 8 * v34;
            if (FeatureAttributeSet)
            {
              *(_DWORD *)v35 = 44;
              *(_WORD *)(v35 + 4) = routeProximity;
            }
          }
          else
          {
            v35 = 8 * v32;
          }
          v16 = v102;
          if ((char *)v17 != v13)
          {
            v36 = v17 - (_QWORD)v13 - 8;
            if (v36 < 0x38 || v17 - v35 < 0x20)
            {
              v38 = (char *)v17;
              v43 = v35;
            }
            else
            {
              v37 = (v36 >> 3) + 1;
              v38 = (char *)(v17 - 8 * (v37 & 0x3FFFFFFFFFFFFFFCLL));
              v39 = (_OWORD *)(v35 - 16);
              v40 = (__int128 *)(v17 - 16);
              v41 = v37 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v42 = *v40;
                *(v39 - 1) = *(v40 - 1);
                *v39 = v42;
                v39 -= 2;
                v40 -= 2;
                v41 -= 4;
              }
              while (v41);
              v43 = v35 - 8 * (v37 & 0x3FFFFFFFFFFFFFFCLL);
              if (v37 == (v37 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_76:
                v17 = (unint64_t)v13;
                v13 = (char *)v43;
                v12 = v35 + 8;
                if (v17)
LABEL_77:
                  FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, unint64_t, char *))(*(_QWORD *)v102 + 40))(v102, v17, &v101[-v17]);
LABEL_78:
                v101 = (char *)v34;
                goto LABEL_79;
              }
            }
            do
            {
              v44 = *((_QWORD *)v38 - 1);
              v38 -= 8;
              *(_QWORD *)(v43 - 8) = v44;
              v43 -= 8;
            }
            while (v38 != v13);
            goto LABEL_76;
          }
          v13 = (char *)v35;
          v12 = v35 + 8;
          if (v17)
            goto LABEL_77;
          goto LABEL_78;
        }
        v18 = (v12 - (uint64_t)v13) >> 3;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          abort();
        if ((v101 - v13) >> 2 > v19)
          v19 = (v101 - v13) >> 2;
        if ((unint64_t)(v101 - v13) >= 0x7FFFFFFFFFFFFFF8)
          v20 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v20 = v19;
        if (v20)
        {
          FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v102 + 16))(v102, 8 * v20, 4);
          v21 = (uint64_t)FeatureAttributeSet + 8 * v18;
          v20 = (uint64_t)FeatureAttributeSet + 8 * v20;
          if (FeatureAttributeSet)
          {
            *(_DWORD *)v21 = 44;
            *(_WORD *)(v21 + 4) = v2->_routeAttributes.routeSignificance;
          }
        }
        else
        {
          v21 = 8 * v18;
        }
        v16 = v102;
        if ((char *)v12 != v13)
        {
          v22 = v12 - (_QWORD)v13 - 8;
          if (v22 < 0x38 || (unint64_t)(v12 - v21) < 0x20)
          {
            v24 = v12;
            v29 = v21;
          }
          else
          {
            v23 = (v22 >> 3) + 1;
            v24 = v12 - 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
            v25 = (_OWORD *)(v21 - 16);
            v26 = (__int128 *)(v12 - 16);
            v27 = v23 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v28 = *v26;
              *(v25 - 1) = *(v26 - 1);
              *v25 = v28;
              v25 -= 2;
              v26 -= 2;
              v27 -= 4;
            }
            while (v27);
            v29 = v21 - 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
            if (v23 == (v23 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_48:
              v12 = (uint64_t)v13;
              v13 = (char *)v29;
              v17 = v21 + 8;
              if (v12)
LABEL_49:
                FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, char *))(*(_QWORD *)v102 + 40))(v102, v12, &v101[-v12]);
LABEL_50:
              v101 = (char *)v20;
              goto LABEL_51;
            }
          }
          do
          {
            v30 = *(_QWORD *)(v24 - 8);
            v24 -= 8;
            *(_QWORD *)(v29 - 8) = v30;
            v29 -= 8;
          }
          while ((char *)v24 != v13);
          goto LABEL_48;
        }
        v13 = (char *)v21;
        v17 = v21 + 8;
        if (v12)
          goto LABEL_49;
        goto LABEL_50;
      }
LABEL_79:
      v45 = 0;
      v46 = (unsigned __int8 *)&v112;
      do
      {
        v47 = *v46;
        memset(__src, 0, sizeof(__src));
        v107 = 1;
        v48 = gss::Allocator::instance(FeatureAttributeSet);
        v49 = (_DWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v48 + 16))(v48, 26, 1);
        v50 = v49;
        if (*(_QWORD *)__src)
        {
          if (*(_WORD *)&__src[10])
          {
            v49 = memmove(v49, *(const void **)__src, 4 * *(unsigned __int16 *)&__src[10]);
            if (*(_WORD *)&__src[10])
              v49 = memmove((char *)v50 + 18, (const void *)(*(_QWORD *)__src + *(unsigned __int16 *)&__src[8]), 2 * *(unsigned __int16 *)&__src[10]);
          }
          v51 = gss::Allocator::instance((gss::Allocator *)v49);
          v49 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v51 + 40))(v51, *(_QWORD *)__src, *(unsigned __int16 *)&__src[12]);
        }
        *(_WORD *)&__src[12] = 4;
        *(_QWORD *)__src = v50;
        *(_WORD *)&__src[8] = 18;
        v52 = *(unsigned __int16 *)&__src[10];
        v50[*(unsigned __int16 *)&__src[10]] = 65538;
        *((_WORD *)v50 + v52 + 9) = 0;
        ++*(_WORD *)&__src[10];
        v107 = 0;
        *(_WORD *)((char *)v50 + 2 * *(unsigned __int16 *)&__src[10] + *(unsigned __int16 *)&__src[8] - 2) = v47;
        v53 = *(unsigned __int16 *)&__src[10];
        if (*(_WORD *)&__src[10])
        {
          v54 = 4 * *(unsigned __int16 *)&__src[10];
          v55 = (char *)v50;
          while (*(_DWORD *)v55 != 65613)
          {
            v55 += 4;
            v54 -= 4;
            if (!v54)
            {
              v55 = (char *)&v50[*(unsigned __int16 *)&__src[10]];
              break;
            }
          }
          v56 = (unint64_t)(v55 - (char *)v50) >> 2;
        }
        else
        {
          LOWORD(v56) = 0;
        }
        v57 = *((unsigned __int8 *)&v112 + 2 * v45 + 1);
        if (*(unsigned __int16 *)&__src[10] == (unsigned __int16)v56)
        {
          if (__src[14])
            goto LABEL_95;
          if (*(_WORD *)&__src[10])
          {
            v79 = 4 * *(unsigned __int16 *)&__src[10];
            v80 = (char *)v50;
            while (*(_DWORD *)v80 != 65613)
            {
              v80 += 4;
              v79 -= 4;
              if (!v79)
              {
                v80 = (char *)&v50[*(unsigned __int16 *)&__src[10]];
                break;
              }
            }
            if (*(unsigned __int16 *)&__src[10] != (unsigned __int16)((unint64_t)(v80 - (char *)v50) >> 2))
              goto LABEL_95;
          }
          if (*(unsigned __int16 *)&__src[10] == *(unsigned __int16 *)&__src[12])
          {
            if (*(unsigned __int16 *)&__src[10] == 0xFFFF)
            {
              LOWORD(v53) = -1;
            }
            else
            {
              if (2 * (*(_WORD *)&__src[10] & 0x7FFFu) <= 4)
                v86 = 4;
              else
                v86 = 2 * (*(_WORD *)&__src[10] & 0x7FFF);
              v87 = (8 * (v86 >> 1)) | 2;
              v99 = v86;
              v88 = v87 + 2 * v86;
              v89 = gss::Allocator::instance((gss::Allocator *)v49);
              v90 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v89 + 16))(v89, v88 & 0xFFFE, 1);
              v50 = v90;
              if (*(_QWORD *)__src)
              {
                if (*(_WORD *)&__src[10])
                {
                  v90 = memmove(v90, *(const void **)__src, 4 * *(unsigned __int16 *)&__src[10]);
                  if (*(_WORD *)&__src[10])
                    v90 = memmove((char *)v50 + v87, (const void *)(*(_QWORD *)__src + *(unsigned __int16 *)&__src[8]), 2 * *(unsigned __int16 *)&__src[10]);
                }
                v91 = gss::Allocator::instance((gss::Allocator *)v90);
                (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v91 + 40))(v91, *(_QWORD *)__src, *(unsigned __int16 *)&__src[12]);
              }
              *(_WORD *)&__src[12] = v99;
              *(_QWORD *)__src = v50;
              *(_WORD *)&__src[8] = v87;
              v53 = *(unsigned __int16 *)&__src[10];
              v16 = v102;
LABEL_156:
              v50[v53] = 65613;
              *(_WORD *)((char *)v50 + 2 * v53 + v87) = 0;
              LOWORD(v53) = ++*(_WORD *)&__src[10];
              v107 = 0;
            }
LABEL_95:
            v58 = (unsigned __int16)v53 - 1;
            goto LABEL_97;
          }
          v87 = *(_WORD *)&__src[8];
          goto LABEL_156;
        }
        v58 = (unsigned __int16)v56;
LABEL_97:
        *(_WORD *)((char *)v50 + 2 * v58 + *(unsigned __int16 *)&__src[8]) = v57;
        ptr = (uint64_t)v104->_styleManager.__ptr_;
        v108 = 0;
        v109 = 0;
        v110 = 0;
        v111 = v16;
        if ((char *)v12 != v13)
        {
          if (v12 - (_QWORD)v13 < 0)
            abort();
          v61 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 16))(v16, v12 - (_QWORD)v13, 4);
          v108 = v61;
          v109 = v61;
          v110 = &v61[8 * ((v12 - (uint64_t)v13) >> 3)];
          v62 = v13;
          do
          {
            if (v61)
              *(_QWORD *)v61 = *(_QWORD *)v62;
            v62 += 8;
            v61 += 8;
          }
          while (v62 != (char *)v12);
          v109 = v61;
        }
        gss::FeatureAttributeSet::sort((gss::FeatureAttributeSet *)&v108);
        gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v105, ptr, (gss::FeatureAttributeSet *)&v108, (gss::QueryOverrides *)__src);
        v64 = (_OWORD *)*((_QWORD *)v59 + 1);
        v63 = *((_QWORD *)v59 + 2);
        if ((unint64_t)v64 >= v63)
        {
          v66 = ((uint64_t)v64 - *(_QWORD *)v59) >> 4;
          if ((unint64_t)(v66 + 1) >> 60)
            abort();
          v67 = v63 - *(_QWORD *)v59;
          v68 = v67 >> 3;
          if (v67 >> 3 <= (unint64_t)(v66 + 1))
            v68 = v66 + 1;
          if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF0)
            v69 = 0xFFFFFFFFFFFFFFFLL;
          else
            v69 = v68;
          if (v69 >> 60)
            std::__throw_bad_array_new_length[abi:nn180100]();
          FeatureAttributeSet = (gss::Allocator *)operator new(16 * v69);
          v70 = (_OWORD *)((char *)FeatureAttributeSet + 16 * v66);
          *v70 = v105;
          v65 = v70 + 1;
          v71 = (char *)FeatureAttributeSet + 16 * v69;
          v105 = 0uLL;
          v72 = *(_QWORD **)v59;
          v73 = (_QWORD *)*((_QWORD *)v59 + 1);
          if (v73 == *(_QWORD **)v59)
          {
            *(_QWORD *)v59 = v70;
            *((_QWORD *)v59 + 1) = v65;
            *((_QWORD *)v59 + 2) = v71;
          }
          else
          {
            do
            {
              v74 = *((_OWORD *)v73 - 1);
              v73 -= 2;
              *--v70 = v74;
              *v73 = 0;
              v73[1] = 0;
            }
            while (v73 != v72);
            v73 = *(_QWORD **)v59;
            v75 = (_QWORD *)*((_QWORD *)v59 + 1);
            *(_QWORD *)v59 = v70;
            *((_QWORD *)v59 + 1) = v65;
            *((_QWORD *)v59 + 2) = v71;
            while (v75 != v73)
            {
              v76 = (std::__shared_weak_count *)*(v75 - 1);
              if (v76)
              {
                v77 = (unint64_t *)&v76->__shared_owners_;
                do
                  v78 = __ldaxr(v77);
                while (__stlxr(v78 - 1, v77));
                if (!v78)
                {
                  ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
                  std::__shared_weak_count::__release_weak(v76);
                }
              }
              v75 -= 2;
            }
          }
          v16 = v102;
          if (v73)
            operator delete(v73);
        }
        else
        {
          *v64 = v105;
          v65 = v64 + 1;
          v105 = 0uLL;
        }
        *((_QWORD *)v59 + 1) = v65;
        v81 = (std::__shared_weak_count *)*((_QWORD *)&v105 + 1);
        if (*((_QWORD *)&v105 + 1))
        {
          v82 = (unint64_t *)(*((_QWORD *)&v105 + 1) + 8);
          do
            v83 = __ldaxr(v82);
          while (__stlxr(v83 - 1, v82));
          if (!v83)
          {
            ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
            std::__shared_weak_count::__release_weak(v81);
            v84 = v108;
            if (!v108)
              goto LABEL_139;
LABEL_138:
            v109 = v84;
            FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, char *, int64_t))(*(_QWORD *)v111 + 40))(v111, v84, v110 - v84);
            goto LABEL_139;
          }
        }
        v84 = v108;
        if (v108)
          goto LABEL_138;
LABEL_139:
        if (!__src[14] && *(_QWORD *)__src)
        {
          v85 = gss::Allocator::instance(FeatureAttributeSet);
          FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v85 + 40))(v85, *(_QWORD *)__src, *(unsigned __int16 *)&__src[12]);
        }
        ++v45;
        v46 = (unsigned __int8 *)&v112 + 2 * v45;
      }
      while (v45 != 4);
      if (v13)
        (*(void (**)(uint64_t, char *, int64_t))(*(_QWORD *)v16 + 40))(v16, v13, v101 - v13);
      v8 = v100 + 1;
      v2 = v104;
      begin = (uint64_t *)v104->_attributeSets._array.__begin_;
    }
    while (v100 + 1 < (unint64_t)(((char *)v104->_attributeSets._array.__end_ - (char *)begin) >> 4));
  }
}

- (void)setRouteAttributes:(const PolygonRouteAttributes *)a3
{
  unsigned int routeSignificance;

  self->_hasRouteAttributes = 1;
  routeSignificance = a3->routeSignificance;
  *(_WORD *)&self->_routeAttributes.routeProximity = *(_WORD *)&a3->routeProximity;
  self->_routeAttributes.routeSignificance = routeSignificance;
  -[VKPolygonalItemGroup updateCachedStyles](self, "updateCachedStyles");
}

- (void)clearRouteAttributes
{
  self->_hasRouteAttributes = 0;
  -[VKPolygonalItemGroup updateCachedStyles](self, "updateCachedStyles");
}

- (unsigned)cullingMask
{
  return self->_cullingMask;
}

- (BOOL)isFixedSize
{
  return self->_isFixedSize;
}

- (Matrix<float,)centroid
{
  float v2;
  float v3;
  Matrix<float, 2, 1> result;

  v2 = self->_centroid._e[0];
  v3 = self->_centroid._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  _QWORD *next;
  void **value;
  char *begin;
  char *end;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  Batcher *v21;
  Batcher *v22;
  _QWORD *v23;
  _QWORD *v24;
  void **v25;
  unordered_map<std::pair<const void *, unsigned long>, std::vector<md::Edge>, std::hash<md::SectionKey>, std::equal_to<std::pair<const void *, unsigned long>>, std::allocator<std::pair<const std::pair<const void *, unsigned long>, std::vector<md::Edge>>>> *p_polygonEdges;
  _QWORD *v27;
  void **v28;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueWallVerticalStrokeCullingGroups;
  unordered_map<std::pair<const void *, unsigned long>, std::vector<md::Edge>, std::hash<md::SectionKey>, std::equal_to<std::pair<const void *, unsigned long>>, std::allocator<std::pair<const std::pair<const void *, unsigned long>, std::vector<md::Edge>>>> *v30;
  _QWORD *v31;
  void *v32;
  void **v33;
  void **v34;
  void **v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueWallHorizontalStrokeCullingGroups;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *v41;
  void *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  void *v47;
  void *v48;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueEndCapCullingGroups;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *v50;
  void *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  void *v56;
  void *v57;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_venueCullingGroups;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *v59;
  void *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  void *v65;
  void *v66;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *p_strokeCullingGroups;
  array<std::vector<std::vector<FeatureRange>>, 16UL> *v68;
  void *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  void *v74;
  void *v75;
  VKPolygonalItemGroup *v76;
  Class isa;
  objc_class *v78;
  objc_class *ptr;
  objc_class *v80;
  objc_class *v81;
  void *v82;
  void *v83;
  __shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  char *v87;
  char *v88;
  void *v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;

  cntrl = self->_styleManager.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    next = self->_styleQueries.__table_.__p1_.__value_.__next_;
    if (!next)
      goto LABEL_8;
  }
  else
  {
LABEL_5:
    next = self->_styleQueries.__table_.__p1_.__value_.__next_;
    if (!next)
      goto LABEL_8;
  }
  do
  {
    v15 = (_QWORD *)*next;
    v16 = next[3];
    if (v16)
    {
      v17 = next[4];
      v14 = (void *)next[3];
      if (v17 != v16)
      {
        do
        {
          v18 = *(std::__shared_weak_count **)(v17 - 8);
          if (v18)
          {
            p_shared_owners = (unint64_t *)&v18->__shared_owners_;
            do
              v20 = __ldaxr(p_shared_owners);
            while (__stlxr(v20 - 1, p_shared_owners));
            if (!v20)
            {
              ((void (*)(std::__shared_weak_count *, SEL))v18->__on_zero_shared)(v18, a2);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
          v17 -= 16;
        }
        while (v17 != v16);
        v14 = (void *)next[3];
      }
      next[4] = v16;
      operator delete(v14);
    }
    operator delete(next);
    next = v15;
  }
  while (v15);
LABEL_8:
  value = self->_styleQueries.__table_.__bucket_list_.__ptr_.__value_;
  self->_styleQueries.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  begin = (char *)self->_attributeSets._array.__begin_;
  if (begin)
  {
    end = (char *)self->_attributeSets._array.__end_;
    v10 = self->_attributeSets._array.__begin_;
    if (end != begin)
    {
      do
      {
        v11 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v11)
        {
          v12 = (unint64_t *)&v11->__shared_owners_;
          do
            v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *, void *))v11->__on_zero_shared)(v11, v10);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v10 = self->_attributeSets._array.__begin_;
    }
    self->_attributeSets._array.__end_ = begin;
    (*(void (**)(Allocator *, void *, int64_t))(*(_QWORD *)self->_attributeSets._array.__end_cap_.__value__2._allocator
                                                                + 40))(self->_attributeSets._array.__end_cap_.__value__2._allocator, v10, (char *)self->_attributeSets._array.__end_cap_.__value_ - (char *)v10);
  }
  std::__tree<gdc::LayerDataWithWorld>::destroy((_QWORD *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_);
  v21 = self->_strokeRenderItemBatchers.__begin_;
  if (v21)
  {
    std::vector<ggl::Batcher>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_strokeRenderItemBatchers, (uint64_t)v21);
    operator delete(self->_strokeRenderItemBatchers.__begin_);
  }
  v22 = self->_fillRenderItemBatchers.__begin_;
  if (v22)
  {
    std::vector<ggl::Batcher>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_fillRenderItemBatchers, (uint64_t)v22);
    operator delete(self->_fillRenderItemBatchers.__begin_);
  }
  v23 = self->_featureIds.__table_.__p1_.__value_.__next_;
  if (v23)
  {
    do
    {
      v24 = (_QWORD *)*v23;
      operator delete(v23);
      v23 = v24;
    }
    while (v24);
  }
  v25 = self->_featureIds.__table_.__bucket_list_.__ptr_.__value_;
  self->_featureIds.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v25)
    operator delete(v25);
  p_polygonEdges = &self->_polygonEdges;
  v27 = self->_polygonEdges.__table_.__p1_.__value_.__next_;
  if (v27)
  {
    do
    {
      v31 = (_QWORD *)*v27;
      v32 = (void *)v27[4];
      if (v32)
      {
        v27[5] = v32;
        operator delete(v32);
      }
      operator delete(v27);
      v27 = v31;
    }
    while (v31);
  }
  v28 = p_polygonEdges->__table_.__bucket_list_.__ptr_.__value_;
  p_polygonEdges->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v28)
    operator delete(v28);
  p_venueWallVerticalStrokeCullingGroups = &self->_venueWallVerticalStrokeCullingGroups;
  v30 = &self->_polygonEdges;
  do
  {
    v35 = (void **)v30[-1].__table_.__p1_.__value_.__next_;
    v30 = (unordered_map<std::pair<const void *, unsigned long>, std::vector<md::Edge>, std::hash<md::SectionKey>, std::equal_to<std::pair<const void *, unsigned long>>, std::allocator<std::pair<const std::pair<const void *, unsigned long>, std::vector<md::Edge>>>> *)((char *)v30 - 24);
    v34 = v35;
    if (v35)
    {
      v36 = p_polygonEdges[-1].__table_.__p2_.__value_;
      v33 = v34;
      if ((void **)v36 != v34)
      {
        v37 = p_polygonEdges[-1].__table_.__p2_.__value_;
        do
        {
          v39 = *(void **)(v37 - 24);
          v37 -= 24;
          v38 = v39;
          if (v39)
          {
            *(_QWORD *)(v36 - 16) = v38;
            operator delete(v38);
          }
          v36 = v37;
        }
        while ((void **)v37 != v34);
        v33 = v30->__table_.__bucket_list_.__ptr_.__value_;
      }
      p_polygonEdges[-1].__table_.__p2_.__value_ = (unint64_t)v34;
      operator delete(v33);
    }
    p_polygonEdges = v30;
  }
  while (v30 != (unordered_map<std::pair<const void *, unsigned long>, std::vector<md::Edge>, std::hash<md::SectionKey>, std::equal_to<std::pair<const void *, unsigned long>>, std::allocator<std::pair<const std::pair<const void *, unsigned long>, std::vector<md::Edge>>>> *)p_venueWallVerticalStrokeCullingGroups);
  p_venueWallHorizontalStrokeCullingGroups = &self->_venueWallHorizontalStrokeCullingGroups;
  v41 = &self->_venueWallVerticalStrokeCullingGroups;
  do
  {
    v44 = (char *)v41[-1].__elems_[15].__begin_;
    v41 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v41 - 24);
    v43 = v44;
    if (v44)
    {
      v45 = (char *)p_venueWallVerticalStrokeCullingGroups[-1].__elems_[15].__end_;
      v42 = v43;
      if (v45 != v43)
      {
        v46 = (char *)p_venueWallVerticalStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v48 = (void *)*((_QWORD *)v46 - 3);
          v46 -= 24;
          v47 = v48;
          if (v48)
          {
            *((_QWORD *)v45 - 2) = v47;
            operator delete(v47);
          }
          v45 = v46;
        }
        while (v46 != v43);
        v42 = v41->__elems_[0].__begin_;
      }
      p_venueWallVerticalStrokeCullingGroups[-1].__elems_[15].__end_ = v43;
      operator delete(v42);
    }
    p_venueWallVerticalStrokeCullingGroups = v41;
  }
  while (v41 != p_venueWallHorizontalStrokeCullingGroups);
  p_venueEndCapCullingGroups = &self->_venueEndCapCullingGroups;
  v50 = &self->_venueWallHorizontalStrokeCullingGroups;
  do
  {
    v53 = (char *)v50[-1].__elems_[15].__begin_;
    v50 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v50 - 24);
    v52 = v53;
    if (v53)
    {
      v54 = (char *)p_venueWallHorizontalStrokeCullingGroups[-1].__elems_[15].__end_;
      v51 = v52;
      if (v54 != v52)
      {
        v55 = (char *)p_venueWallHorizontalStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v57 = (void *)*((_QWORD *)v55 - 3);
          v55 -= 24;
          v56 = v57;
          if (v57)
          {
            *((_QWORD *)v54 - 2) = v56;
            operator delete(v56);
          }
          v54 = v55;
        }
        while (v55 != v52);
        v51 = v50->__elems_[0].__begin_;
      }
      p_venueWallHorizontalStrokeCullingGroups[-1].__elems_[15].__end_ = v52;
      operator delete(v51);
    }
    p_venueWallHorizontalStrokeCullingGroups = v50;
  }
  while (v50 != p_venueEndCapCullingGroups);
  p_venueCullingGroups = &self->_venueCullingGroups;
  v59 = &self->_venueEndCapCullingGroups;
  do
  {
    v62 = (char *)v59[-1].__elems_[15].__begin_;
    v59 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v59 - 24);
    v61 = v62;
    if (v62)
    {
      v63 = (char *)p_venueEndCapCullingGroups[-1].__elems_[15].__end_;
      v60 = v61;
      if (v63 != v61)
      {
        v64 = (char *)p_venueEndCapCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v66 = (void *)*((_QWORD *)v64 - 3);
          v64 -= 24;
          v65 = v66;
          if (v66)
          {
            *((_QWORD *)v63 - 2) = v65;
            operator delete(v65);
          }
          v63 = v64;
        }
        while (v64 != v61);
        v60 = v59->__elems_[0].__begin_;
      }
      p_venueEndCapCullingGroups[-1].__elems_[15].__end_ = v61;
      operator delete(v60);
    }
    p_venueEndCapCullingGroups = v59;
  }
  while (v59 != p_venueCullingGroups);
  p_strokeCullingGroups = &self->_strokeCullingGroups;
  v68 = &self->_venueCullingGroups;
  do
  {
    v71 = (char *)v68[-1].__elems_[15].__begin_;
    v68 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v68 - 24);
    v70 = v71;
    if (v71)
    {
      v72 = (char *)p_venueCullingGroups[-1].__elems_[15].__end_;
      v69 = v70;
      if (v72 != v70)
      {
        v73 = (char *)p_venueCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v75 = (void *)*((_QWORD *)v73 - 3);
          v73 -= 24;
          v74 = v75;
          if (v75)
          {
            *((_QWORD *)v72 - 2) = v74;
            operator delete(v74);
          }
          v72 = v73;
        }
        while (v73 != v70);
        v69 = v68->__elems_[0].__begin_;
      }
      p_venueCullingGroups[-1].__elems_[15].__end_ = v70;
      operator delete(v69);
    }
    p_venueCullingGroups = v68;
  }
  while (v68 != p_strokeCullingGroups);
  v76 = (VKPolygonalItemGroup *)&self->_strokeCullingGroups;
  do
  {
    ptr = (objc_class *)v76[-1]._styleManager.__ptr_;
    v76 = (VKPolygonalItemGroup *)((char *)v76 - 24);
    v78 = ptr;
    if (ptr)
    {
      v80 = (objc_class *)p_strokeCullingGroups[-1].__elems_[15].__end_;
      isa = v78;
      if (v80 != v78)
      {
        v81 = (objc_class *)p_strokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v83 = (void *)*((_QWORD *)v81 - 3);
          v81 = (objc_class *)((char *)v81 - 24);
          v82 = v83;
          if (v83)
          {
            *((_QWORD *)v80 - 2) = v82;
            operator delete(v82);
          }
          v80 = v81;
        }
        while (v81 != v78);
        isa = v76->super.isa;
      }
      p_strokeCullingGroups[-1].__elems_[15].__end_ = v78;
      operator delete(isa);
    }
    p_strokeCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v76;
  }
  while (v76 != (VKPolygonalItemGroup *)&self->_fillCullingGroups);
  v84 = self->_meshStorage.__cntrl_;
  if (!v84)
    goto LABEL_111;
  v85 = (unint64_t *)((char *)v84 + 8);
  do
    v86 = __ldaxr(v85);
  while (__stlxr(v86 - 1, v85));
  if (!v86)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v84 + 16))(v84);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v84);
    v87 = (char *)self->_fillMeshes.__begin_;
    if (!v87)
      goto LABEL_122;
  }
  else
  {
LABEL_111:
    v87 = (char *)self->_fillMeshes.__begin_;
    if (!v87)
      goto LABEL_122;
  }
  v88 = (char *)self->_fillMeshes.__end_;
  v89 = v87;
  if (v88 != v87)
  {
    do
    {
      v90 = (std::__shared_weak_count *)*((_QWORD *)v88 - 1);
      if (v90)
      {
        v91 = (unint64_t *)&v90->__shared_owners_;
        do
          v92 = __ldaxr(v91);
        while (__stlxr(v92 - 1, v91));
        if (!v92)
        {
          ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
          std::__shared_weak_count::__release_weak(v90);
        }
      }
      v88 -= 16;
    }
    while (v88 != v87);
    v89 = self->_fillMeshes.__begin_;
  }
  self->_fillMeshes.__end_ = v87;
  operator delete(v89);
LABEL_122:
  if (self->_fillMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_fillMeshInfo._value);
    self->_fillMeshInfo._hasValue = 0;
  }
}

- (id).cxx_construct
{
  geo::codec::Allocator *v3;

  self->_fillMeshInfo._hasValue = 0;
  bzero(&self->_fillMeshes, 0x948uLL);
  self->_polygonEdges.__table_.__p3_.__value_ = 1.0;
  self->_featureIds.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_featureIds.__table_.__p1_.__value_.__next_ = 0u;
  self->_featureIds.__table_.__p3_.__value_ = 1.0;
  self->_attributeSets._set.__tree_.__pair1_.__value_.__left_ = 0;
  *(_OWORD *)&self->_attributeSets._set.__tree_.__pair3_.__value_ = 0u;
  *(_OWORD *)&self->_fillRenderItemBatchers.__begin_ = 0u;
  *(_OWORD *)&self->_fillRenderItemBatchers.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_strokeRenderItemBatchers.__end_ = 0u;
  self->_attributeSets._set.__tree_.__begin_node_ = &self->_attributeSets._set.__tree_.__pair1_;
  *(_OWORD *)&self->_attributeSets._array.__end_ = 0u;
  self->_attributeSets._array.__end_cap_.__value__2._allocator = (Allocator *)geo::codec::Allocator::instance(v3);
  self->_styleQueries.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_styleQueries.__table_.__p1_.__value_.__next_ = 0u;
  self->_styleQueries.__table_.__p3_.__value_ = 1.0;
  self->_styleManager = 0u;
  *(__shared_weak_count **)((char *)&self->_styleManager.__cntrl_ + 6) = 0;
  return self;
}

@end
