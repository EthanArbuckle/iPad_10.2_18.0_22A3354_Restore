@implementation VKMarker

- (VKMarker)initWithFeatureMarkerPtr:(const void *)a3 markerType:(int)a4
{
  VKMarker *v6;
  VKMarker *v7;
  uint64_t v8;
  Marker *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v14;
  Marker *ptr;
  std::__shared_weak_count *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  const FeatureStyleAttributes *v20;
  char *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  GEOFeatureStyleAttributes *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  GEOFeatureStyleAttributes *styleAttributes;
  const FeatureStyleAttributes *v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)VKMarker;
  v6 = -[VKMarker init](&v37, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_markerType = a4;
  v9 = *(Marker **)a3;
  v8 = *((_QWORD *)a3 + 1);
  if (v8)
  {
    v10 = (unint64_t *)(v8 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  cntrl = (std::__shared_weak_count *)v6->_actualMarker.__cntrl_;
  v6->_actualMarker.__ptr_ = v9;
  v6->_actualMarker.__cntrl_ = (__shared_weak_count *)v8;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  ptr = v7->_actualMarker.__ptr_;
  *(_QWORD *)&ptr->markerName[18] = v7;
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)&ptr->id + 96))(&v35);
  v17 = v35;
  v16 = v36;
  if (!v36)
    goto LABEL_14;
  v18 = (unint64_t *)&v36->__shared_owners_;
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if (v19)
  {
LABEL_14:
    if (v17)
      goto LABEL_15;
LABEL_26:
    styleAttributes = v7->_styleAttributes;
    v7->_styleAttributes = 0;

    return v7;
  }
  ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
  std::__shared_weak_count::__release_weak(v16);
  if (!v17)
    goto LABEL_26;
LABEL_15:
  (*(void (**)(const FeatureStyleAttributes **__return_ptr))(*(_QWORD *)v7->_actualMarker.__ptr_ + 96))(&v33);
  v20 = v33;
  v21 = (char *)operator new(0x40uLL);
  *((_QWORD *)v21 + 1) = 0;
  *((_QWORD *)v21 + 2) = 0;
  *(_QWORD *)v21 = &off_1E42DAB40;
  FeatureStyleAttributes::FeatureStyleAttributes((FeatureStyleAttributes *)(v21 + 24), v20);
  v35 = v22;
  v36 = (std::__shared_weak_count *)v21;
  v23 = v34;
  if (v34)
  {
    v24 = (unint64_t *)&v34->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithFeatureStyleAttributesPtr:", &v35);
  v27 = v7->_styleAttributes;
  v7->_styleAttributes = (GEOFeatureStyleAttributes *)v26;

  v28 = v36;
  if (v36)
  {
    v29 = (unint64_t *)&v36->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  return v7;
}

- (void)dealloc
{
  Marker *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v5;
  unint64_t v6;
  objc_super v7;

  ptr = self->_actualMarker.__ptr_;
  if (ptr)
  {
    *(_QWORD *)&ptr->markerName[18] = 0;
    cntrl = self->_actualMarker.__cntrl_;
    self->_actualMarker.__ptr_ = 0;
    self->_actualMarker.__cntrl_ = 0;
    if (cntrl)
    {
      v5 = (unint64_t *)((char *)cntrl + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)VKMarker;
  -[VKMarker dealloc](&v7, sel_dealloc);
}

- (NSString)name
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(_QWORD *__return_ptr, Marker *, _QWORD))(*(_QWORD *)self->_actualMarker.__ptr_ + 16))(v6, self->_actualMarker.__ptr_, 0);
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

- (NSString)shortName
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(_QWORD *__return_ptr, Marker *, _QWORD))(*(_QWORD *)self->_actualMarker.__ptr_ + 24))(v6, self->_actualMarker.__ptr_, 0);
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

- (unint64_t)featureID
{
  return (*(uint64_t (**)(Marker *))(*(_QWORD *)self->_actualMarker.__ptr_ + 32))(self->_actualMarker.__ptr_);
}

- (unint64_t)venueID
{
  return (*(uint64_t (**)(Marker *))(*(_QWORD *)self->_actualMarker.__ptr_ + 40))(self->_actualMarker.__ptr_);
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  GEOFeatureStyleAttributes *styleAttributes;

  styleAttributes = self->_styleAttributes;
  if (styleAttributes)
    styleAttributes = (GEOFeatureStyleAttributes *)-[GEOFeatureStyleAttributes copy](styleAttributes, "copy");
  return styleAttributes;
}

- (const)actualMarker
{
  return &self->_actualMarker;
}

- (id)featureHandles
{
  return 0;
}

- (int)markerType
{
  return self->_markerType;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_styleAttributes, 0);
  cntrl = self->_actualMarker.__cntrl_;
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
  return self;
}

+ (id)markerWithFeatureMarker:(const void *)a3
{
  VKMarker *v4;

  if (*(_QWORD *)a3)
  {
    v4 = (VKMarker *)*(id *)(*(_QWORD *)a3 + 24);
    if (!v4)
      v4 = -[VKMarker initWithFeatureMarkerPtr:markerType:]([VKMarker alloc], "initWithFeatureMarkerPtr:markerType:", a3, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
