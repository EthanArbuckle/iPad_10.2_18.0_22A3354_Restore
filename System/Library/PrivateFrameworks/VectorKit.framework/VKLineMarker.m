@implementation VKLineMarker

- (VKLineMarker)initWithLabelFeatureMarkerPtr:(const void *)a3
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  VKLineMarker *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  LabelFeatureMarker *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *cntrl;
  unint64_t *v16;
  unint64_t v17;
  objc_super v19;
  LabelFeatureMarker *v20;
  std::__shared_weak_count *v21;

  v4 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  v20 = *(LabelFeatureMarker **)a3;
  v21 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v19.receiver = self;
  v19.super_class = (Class)VKLineMarker;
  v7 = -[VKMarker initWithFeatureMarkerPtr:markerType:](&v19, sel_initWithFeatureMarkerPtr_markerType_, &v20, 4);
  v8 = v21;
  if (v21)
  {
    v9 = (unint64_t *)&v21->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v7)
  {
    v12 = *(LabelFeatureMarker **)a3;
    v11 = *((_QWORD *)a3 + 1);
    if (v11)
    {
      v13 = (unint64_t *)(v11 + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    cntrl = (std::__shared_weak_count *)v7->_labelFeatureMarker.__cntrl_;
    v7->_labelFeatureMarker.__ptr_ = v12;
    v7->_labelFeatureMarker.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl)
    {
      v16 = (unint64_t *)&cntrl->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  return v7;
}

- (const)labelFeatureMarkerImpl
{
  return &self->_labelFeatureMarker;
}

- (NSString)localizedName
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(_QWORD *__return_ptr, LabelFeatureMarker *, uint64_t))(*(_QWORD *)self->_labelFeatureMarker.__ptr_
                                                                              + 16))(v6, self->_labelFeatureMarker.__ptr_, 1);
  if (v7 >= 0)
    v3 = v6;
  else
    v3 = (_QWORD *)v6[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v7) < 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  return (NSString *)v4;
}

- (id)featureHandles
{
  __int128 *v2;
  char v3;
  int v4;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unsigned __int8 v12;
  float *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  VKMarkerFeatureHandle *v23;
  void *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;

  v2 = (__int128 *)*((_QWORD *)self->_labelFeatureMarker.__ptr_ + 8);
  v36 = *v2;
  v3 = *((_BYTE *)v2 + 17);
  v4 = *((_DWORD *)v2 + 5);
  v5 = *((_DWORD *)v2 + 6);
  v6 = *((_BYTE *)v2 + 16);
  v7 = *((_QWORD *)v2 + 5);
  v8 = *((_QWORD *)v2 + 6);
  v9 = (std::__shared_weak_count *)*((_QWORD *)v2 + 7);
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v13 = &md::SignedDistanceFieldGenerator::_hypotCache[32438];
  if ((v12 & 1) == 0)
  {
    v13 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
    if (v29)
    {
      v30 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v30, "VectorKitLabels", 0x5ED09DD50000000FLL);
      v13 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
    }
  }
  v35 = *((_QWORD *)v13 + 299);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v35 + 16))(v35, 64, 8);
  v31 = v14;
  v34 = v14 + 64;
  if (v14)
  {
    *(_OWORD *)v14 = v36;
    *(_BYTE *)(v14 + 16) = v6;
    *(_BYTE *)(v14 + 17) = v3;
    *(_DWORD *)(v14 + 20) = v4;
    *(_DWORD *)(v14 + 24) = v5;
    *(_QWORD *)(v14 + 40) = v7;
    *(_QWORD *)(v14 + 48) = v8;
    *(_QWORD *)(v14 + 56) = v9;
    if (!v9)
    {
      v33 = v14 + 64;
      goto LABEL_16;
    }
    v15 = (unint64_t *)&v9->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
    v33 = v14 + 64;
  }
  else
  {
    v33 = 64;
    if (!v9)
      goto LABEL_16;
  }
  v17 = (unint64_t *)&v9->__shared_owners_;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_16:
  v20 = v31;
  v19 = v33;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (v33 - v31) >> 6);
  if (v31 != v33)
  {
    v22 = v31;
    do
    {
      v23 = -[VKMarkerFeatureHandle initWithMarkerHandle:featureType:]([VKMarkerFeatureHandle alloc], "initWithMarkerHandle:featureType:", v22, 1);
      if (v23)
        objc_msgSend(v21, "addObject:", v23);

      v22 += 64;
    }
    while (v22 != v33);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v21, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (v20 != v33)
    {
      do
      {
        v25 = *(std::__shared_weak_count **)(v19 - 8);
        if (v25)
        {
          v26 = (unint64_t *)&v25->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
            std::__shared_weak_count::__release_weak(v25);
          }
        }
        v19 -= 64;
      }
      while (v19 != v20);
      v19 = v32;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v35 + 40))(v35, v19, v34 - v19);
  }
  return v24;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_labelFeatureMarker.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

+ (id)markerWithLabelFeatureMarker:(const void *)a3
{
  id v4;
  void *v5;
  VKLineMarker *v6;
  VKLineMarker *v7;

  if (*(_QWORD *)a3)
  {
    v4 = *(id *)(*(_QWORD *)a3 + 24);
    v5 = v4;
    if (v4)
      v6 = (VKLineMarker *)v4;
    else
      v6 = -[VKLineMarker initWithLabelFeatureMarkerPtr:]([VKLineMarker alloc], "initWithLabelFeatureMarkerPtr:", a3);
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
