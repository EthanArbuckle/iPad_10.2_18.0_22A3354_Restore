@implementation VKVenueBuildingFeatureMarker

- (VKVenueBuildingFeatureMarker)initWithVenueBuilding:(const void *)a3 localize:(BOOL)a4
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *shared_weak_owners;
  unint64_t v10;
  unint64_t *p_shared_weak_owners;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  VKVenueBuildingFeatureMarker *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  objc_super v25;
  __int128 v26;
  __int128 v27;

  *((_BYTE *)&self->super._markerType + 4) = a4;
  v6 = (std::__shared_weak_count *)operator new(0xB0uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DD508;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42A39D0;
  v8 = v6 + 1;
  v6[2].__vftable = 0;
  v6[1].__shared_owners_ = 0;
  v6[1].__shared_weak_owners_ = 0;
  md::VenueBuilding::VenueBuilding(&v6[2].__shared_owners_, (uint64_t *)a3);
  *(_QWORD *)&v26 = v6 + 1;
  *((_QWORD *)&v26 + 1) = v6;
  shared_weak_owners = (std::__shared_weak_count *)v6[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1)
      goto LABEL_14;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v12 = __ldxr(p_shared_weak_owners);
    while (__stxr(v12 + 1, p_shared_weak_owners));
    v6[1].__shared_owners_ = (uint64_t)v8;
    v6[1].__shared_weak_owners_ = (uint64_t)v6;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
    v14 = (unint64_t *)&v6->__shared_weak_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
    v6[1].__shared_owners_ = (uint64_t)v8;
    v6[1].__shared_weak_owners_ = (uint64_t)v6;
  }
  do
    v16 = __ldaxr(p_shared_owners);
  while (__stlxr(v16 - 1, p_shared_owners));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_14:
  v27 = v26;
  v26 = 0uLL;
  v25.receiver = self;
  v25.super_class = (Class)VKVenueBuildingFeatureMarker;
  v17 = -[VKMarker initWithFeatureMarkerPtr:markerType:](&v25, sel_initWithFeatureMarkerPtr_markerType_, &v27, 3);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
  if (*((_QWORD *)&v26 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return v17;
}

- (unint64_t)buildingId
{
  _QWORD *v2;

  v2 = -[VKVenueBuildingFeatureMarker venueBuildingFeatureMarker](self, "venueBuildingFeatureMarker");
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v2 + 48))(*v2);
}

- (unint64_t)businessId
{
  return *(_QWORD *)(*(_QWORD *)-[VKVenueBuildingFeatureMarker venueBuildingFeatureMarker](self, "venueBuildingFeatureMarker")+ 80);
}

- (NSArray)floorOrdinals
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  v2 = *(_QWORD *)-[VKVenueBuildingFeatureMarker venueBuildingFeatureMarker](self, "venueBuildingFeatureMarker");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xD37A6F4DE9BD37A7 * ((uint64_t)(*(_QWORD *)(v2 + 40) - *(_QWORD *)(v2 + 32)) >> 3));
  v4 = *(_QWORD *)(v2 + 32);
  for (i = *(_QWORD *)(v2 + 40); v4 != i; v4 += 184)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(v4 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  return (NSArray *)v3;
}

- (NSDictionary)shortFloorNames
{
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  _BYTE *v10;
  _BYTE *v11;
  _BYTE *v12;
  _BYTE *v13;
  void *v14;
  void *v15;

  v3 = *(_QWORD *)-[VKVenueBuildingFeatureMarker venueBuildingFeatureMarker](self, "venueBuildingFeatureMarker");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0xD37A6F4DE9BD37A7 * ((uint64_t)(*(_QWORD *)(v3 + 40) - *(_QWORD *)(v3 + 32)) >> 3));
  v5 = *(_BYTE **)(v3 + 32);
  v6 = *(_BYTE **)(v3 + 40);
  if (v5 != v6)
  {
    v7 = v5 + 80;
    do
    {
      if (*(v7 - 64))
      {
        if (!*((_BYTE *)&self->super._markerType + 4) || (v9 = v7, !*v7))
          v9 = v5 + 16;
        v12 = (_BYTE *)*((_QWORD *)v9 + 1);
        v10 = v9 + 8;
        v11 = v12;
        if ((char)v10[23] >= 0)
          v13 = v10;
        else
          v13 = v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *((__int16 *)v7 - 36));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

      }
      v5 += 184;
      v8 = v7 + 104;
      v7 += 184;
    }
    while (v8 != v6);
  }
  return (NSDictionary *)v4;
}

- (NSDictionary)floorNames
{
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  _BYTE *v10;
  _BYTE *v11;
  _BYTE *v12;
  _BYTE *v13;
  void *v14;
  void *v15;

  v3 = *(_QWORD *)-[VKVenueBuildingFeatureMarker venueBuildingFeatureMarker](self, "venueBuildingFeatureMarker");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0xD37A6F4DE9BD37A7 * ((uint64_t)(*(_QWORD *)(v3 + 40) - *(_QWORD *)(v3 + 32)) >> 3));
  v5 = *(_BYTE **)(v3 + 32);
  v6 = *(_BYTE **)(v3 + 40);
  if (v5 != v6)
  {
    v7 = v5 + 112;
    do
    {
      if (*(v7 - 64))
      {
        if (!*((_BYTE *)&self->super._markerType + 4) || (v9 = v7, !*v7))
          v9 = v5 + 48;
        v12 = (_BYTE *)*((_QWORD *)v9 + 1);
        v10 = v9 + 8;
        v11 = v12;
        if ((char)v10[23] >= 0)
          v13 = v10;
        else
          v13 = v11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *((__int16 *)v7 - 52));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

      }
      v5 += 184;
      v8 = v7 + 72;
      v7 += 184;
    }
    while (v8 != v6);
  }
  return (NSDictionary *)v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)nearestFramingPositionToLocation:(id)a3
{
  double var1;
  double var0;
  uint64_t v5;
  long double v6;
  double v7;
  double *v8;
  double *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double *v14;
  double v15;
  double v16;
  char v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  long double v28;
  long double v29;
  double v30;
  long double v31;
  double v32;
  double v33;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = *(_QWORD *)-[VKVenueBuildingFeatureMarker venueBuildingFeatureMarker](self, "venueBuildingFeatureMarker");
  v6 = tan(var0 * 0.00872664626 + 0.785398163);
  v7 = log(v6);
  v8 = *(double **)(v5 + 112);
  v9 = *(double **)(v5 + 120);
  v10 = ((char *)v9 - (char *)v8) >> 4;
  if (v10)
  {
    if (v10 == 1)
    {
      v12 = *v8;
      v11 = v8[1];
    }
    else
    {
      v12 = var1 * 0.00277777778 + 0.5;
      v11 = v7 * 0.159154943 + 0.5;
      if (v9 != v8)
      {
        v13 = 0;
        v14 = v8 + 1;
        v15 = v8[1];
        v16 = *v8;
        v17 = 1;
        v18 = 1.79769313e308;
        do
        {
          v20 = *(v14 - 1);
          v19 = *v14;
          if (v10 - 1 == v13)
            v21 = 0;
          else
            v21 = v13 + 1;
          v22 = &v8[2 * v21];
          v23 = *v22;
          v24 = v22[1];
          v25 = *v22 - v20;
          v26 = v24 - v19;
          if (-((v24 - v19) * (v12 - v20) - v25 * (v11 - v19)) < 0.0)
          {
            v27 = (v25 * (v12 - v20) + v26 * (v11 - v19)) / (v25 * v25 + v26 * v26);
            if (v27 >= 0.0)
            {
              if (v27 <= 1.0)
              {
                v23 = v20 + v27 * v25;
                v24 = v19 + v27 * v26;
              }
            }
            else
            {
              v23 = *(v14 - 1);
              v24 = *v14;
            }
            v17 = 0;
            if ((v12 - v23) * (v12 - v23) + (v11 - v24) * (v11 - v24) < v18)
            {
              v16 = v23;
              v15 = v24;
              v18 = (v12 - v23) * (v12 - v23) + (v11 - v24) * (v11 - v24);
            }
          }
          ++v13;
          v14 += 2;
        }
        while (v10 != v13);
        if ((v17 & 1) == 0)
        {
          v12 = v16;
          v11 = v15;
        }
      }
    }
    v28 = v12 * 6.28318531;
    v29 = exp(v11 * 6.28318531 + -3.14159265);
    v30 = atan(v29);
    v31 = fmod(v28, 6.28318531);
    var1 = fmod(v31 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
    var0 = v30 * 114.591559 + -90.0;
  }
  v32 = var0;
  v33 = var1;
  result.var1 = v33;
  result.var0 = v32;
  return result;
}

@end
