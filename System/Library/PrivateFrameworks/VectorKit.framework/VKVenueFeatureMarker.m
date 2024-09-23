@implementation VKVenueFeatureMarker

- (VKVenueFeatureMarker)initWithVenue:(const void *)a3 localize:(BOOL)a4
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  std::__shared_weak_count_vtbl *v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  std::__shared_weak_count_vtbl *v18;
  size_t v19;
  std::string *v20;
  std::__shared_weak_count *shared_weak_owners;
  unint64_t v22;
  unint64_t *p_shared_weak_owners;
  unint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  VKVenueFeatureMarker *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  objc_super v38;
  __int128 v39;
  __int128 v40;

  *((_BYTE *)&self->super._markerType + 4) = a4;
  v5 = (std::__shared_weak_count *)operator new(0x110uLL);
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DBEB8;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E4296768;
  v7 = v5 + 1;
  v5[1].__shared_weak_owners_ = 0;
  v5[2].__vftable = 0;
  v5[1].__shared_owners_ = 0;
  v8 = *(_OWORD *)a3;
  v5[3].__vftable = 0;
  *(_OWORD *)&v5[2].__shared_owners_ = v8;
  v5[3].__shared_owners_ = 0;
  v5[3].__shared_weak_owners_ = 0;
  v9 = *((_QWORD *)a3 + 2);
  v10 = *((_QWORD *)a3 + 3);
  v11 = v10 - v9;
  if (v10 != v9)
  {
    v12 = 0xEEEEEEEEEEEEEEEFLL * (v11 >> 3);
    if (v12 >= 0x222222222222223)
      abort();
    v13 = (std::__shared_weak_count_vtbl *)operator new(v11);
    v14 = 0;
    v5[3].__vftable = v13;
    v5[3].__shared_owners_ = (uint64_t)v13;
    v5[3].__shared_weak_owners_ = (uint64_t)(v13 + 3 * v12);
    do
    {
      md::VenueBuilding::VenueBuilding(&v13[v14].~__shared_weak_count, (uint64_t *)(v9 + v14 * 40));
      v14 += 3;
    }
    while (v9 + v14 * 40 != v10);
    v5[3].__shared_owners_ = (uint64_t)&v13[v14];
  }
  v5[4].__vftable = 0;
  v5[4].__shared_owners_ = 0;
  v5[4].__shared_weak_owners_ = 0;
  v16 = (_BYTE *)*((_QWORD *)a3 + 5);
  v15 = (_BYTE *)*((_QWORD *)a3 + 6);
  v17 = v15 - v16;
  if (v15 != v16)
  {
    if (v17 < 0)
      abort();
    v18 = (std::__shared_weak_count_vtbl *)operator new(v15 - v16);
    v5[4].__vftable = v18;
    v5[4].__shared_owners_ = (uint64_t)v18;
    v5[4].__shared_weak_owners_ = (uint64_t)v18 + 16 * (v17 >> 4);
    v19 = v17 & 0xFFFFFFFFFFFFFFF0;
    memcpy(v18, v16, v19);
    v5[4].__shared_owners_ = (uint64_t)v18 + v19;
  }
  v5[5].__vftable = 0;
  v5[5].__shared_owners_ = 0;
  v5[5].__shared_weak_owners_ = 0;
  if (&v5[2].__shared_owners_ != a3)
    std::vector<gm::Matrix<double,2,1>>::__assign_with_size[abi:nn180100]<gm::Matrix<double,2,1>*,gm::Matrix<double,2,1>*>((uint64_t)&v5[5], *((_QWORD *)a3 + 8), *((char **)a3 + 9), (uint64_t)(*((_QWORD *)a3 + 9) - *((_QWORD *)a3 + 8)) >> 4);
  v5[6].std::__shared_count = *(std::__shared_count *)((char *)a3 + 88);
  if (*((char *)a3 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v5[6].__shared_weak_owners_, *((const std::string::value_type **)a3 + 13), *((_QWORD *)a3 + 14));
  }
  else
  {
    *(_OWORD *)&v5[6].__shared_weak_owners_ = *(_OWORD *)((char *)a3 + 104);
    v5[7].__shared_owners_ = *((_QWORD *)a3 + 15);
  }
  if (*((char *)a3 + 151) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v5[7].__shared_weak_owners_, *((const std::string::value_type **)a3 + 16), *((_QWORD *)a3 + 17));
  }
  else
  {
    *(_OWORD *)&v5[7].__shared_weak_owners_ = *((_OWORD *)a3 + 8);
    v5[8].__shared_owners_ = *((_QWORD *)a3 + 18);
  }
  LOBYTE(v5[8].__shared_weak_owners_) = 0;
  if (*((_BYTE *)a3 + 152))
  {
    if (*((char *)a3 + 183) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v5[9], *((const std::string::value_type **)a3 + 20), *((_QWORD *)a3 + 21));
    }
    else
    {
      v5[9].std::__shared_count = (std::__shared_count)*((_OWORD *)a3 + 10);
      v5[9].__shared_weak_owners_ = *((_QWORD *)a3 + 22);
    }
    LOBYTE(v5[8].__shared_weak_owners_) = 1;
  }
  LOBYTE(v5[10].__vftable) = 0;
  if (*((_BYTE *)a3 + 184))
  {
    v20 = (std::string *)&v5[10].__shared_owners_;
    if (*((char *)a3 + 215) < 0)
    {
      std::string::__init_copy_ctor_external(v20, *((const std::string::value_type **)a3 + 24), *((_QWORD *)a3 + 25));
    }
    else
    {
      *(_OWORD *)&v20->__r_.__value_.__l.__data_ = *((_OWORD *)a3 + 12);
      v5[11].__vftable = (std::__shared_weak_count_vtbl *)*((_QWORD *)a3 + 26);
    }
    LOBYTE(v5[10].__vftable) = 1;
  }
  *(_QWORD *)&v39 = v5 + 1;
  *((_QWORD *)&v39 + 1) = v5;
  shared_weak_owners = (std::__shared_weak_count *)v5[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1)
      goto LABEL_40;
    do
      v22 = __ldxr(p_shared_owners);
    while (__stxr(v22 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v24 = __ldxr(p_shared_weak_owners);
    while (__stxr(v24 + 1, p_shared_weak_owners));
    v5[1].__shared_owners_ = (uint64_t)v7;
    v5[1].__shared_weak_owners_ = (uint64_t)v5;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    do
      v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
    v26 = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
    v5[1].__shared_owners_ = (uint64_t)v7;
    v5[1].__shared_weak_owners_ = (uint64_t)v5;
  }
  do
    v28 = __ldaxr(p_shared_owners);
  while (__stlxr(v28 - 1, p_shared_owners));
  if (!v28)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_40:
  v40 = v39;
  v39 = 0uLL;
  v38.receiver = self;
  v38.super_class = (Class)VKVenueFeatureMarker;
  v29 = -[VKMarker initWithFeatureMarkerPtr:markerType:](&v38, sel_initWithFeatureMarkerPtr_markerType_, &v40, 2);
  v30 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
  if (*((_QWORD *)&v40 + 1))
  {
    v31 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
  if (*((_QWORD *)&v39 + 1))
  {
    v34 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  return v29;
}

- (unint64_t)businessID
{
  return *(_QWORD *)(*(_QWORD *)-[VKVenueFeatureMarker venueFeatureMarker](self, "venueFeatureMarker") + 40);
}

- (GEOMapItemIdentifier)mapIdentifier
{
  const void *v3;
  long double v4;
  long double v5;
  double v6;
  long double v7;

  v3 = -[VKVenueFeatureMarker venueFeatureMarker](self, "venueFeatureMarker");
  v4 = *(double *)(*(_QWORD *)v3 + 120) * 6.28318531;
  v5 = exp(*(double *)(*(_QWORD *)v3 + 128) * 6.28318531 + -3.14159265);
  v6 = atan(v5);
  v7 = fmod(v4, 6.28318531);
  return (GEOMapItemIdentifier *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D271C0]), "initWithMUID:coordinate:", -[VKVenueFeatureMarker businessID](self, "businessID"), v6 * 114.591559 + -90.0, (double)(fmod(v7 + 6.28318531, 6.28318531)* 57.2957795+ -180.0));
}

- (NSArray)buildings
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  VKVenueBuildingFeatureMarker *v7;

  v3 = *(_QWORD *)-[VKVenueFeatureMarker venueFeatureMarker](self, "venueFeatureMarker");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(_QWORD *)(v3 + 56) - *(_QWORD *)(v3 + 48)) >> 3));
  v5 = *(_QWORD *)(v3 + 48);
  for (i = *(_QWORD *)(v3 + 56); v5 != i; v5 += 120)
  {
    v7 = -[VKVenueBuildingFeatureMarker initWithVenueBuilding:localize:]([VKVenueBuildingFeatureMarker alloc], "initWithVenueBuilding:localize:", v5, *((unsigned __int8 *)&self->super._markerType + 4));
    objc_msgSend(v4, "addObject:", v7);

  }
  return (NSArray *)v4;
}

- (id)name
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[VKVenueFeatureMarker venueFeatureMarker](self, "venueFeatureMarker");
  (*(void (**)(_QWORD *__return_ptr, _QWORD, _QWORD))(*(_QWORD *)*v4 + 16))(v8, *v4, *((unsigned __int8 *)&self->super._markerType + 4));
  if (v9 >= 0)
    v5 = v8;
  else
    v5 = (_QWORD *)v8[0];
  objc_msgSend(v3, "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v9) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v10 + 40))(v10, v8[0], v9 & 0x7FFFFFFFFFFFFFFFLL);
  return v6;
}

- (id)shortName
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[VKVenueFeatureMarker venueFeatureMarker](self, "venueFeatureMarker");
  (*(void (**)(_QWORD *__return_ptr, _QWORD, _QWORD))(*(_QWORD *)*v4 + 24))(v8, *v4, *((unsigned __int8 *)&self->super._markerType + 4));
  if (v9 >= 0)
    v5 = v8;
  else
    v5 = (_QWORD *)v8[0];
  objc_msgSend(v3, "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v9) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v10 + 40))(v10, v8[0], v9 & 0x7FFFFFFFFFFFFFFFLL);
  return v6;
}

@end
