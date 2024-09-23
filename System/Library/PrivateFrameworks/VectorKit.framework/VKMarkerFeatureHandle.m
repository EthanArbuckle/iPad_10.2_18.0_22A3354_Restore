@implementation VKMarkerFeatureHandle

- (VKMarkerFeatureHandle)initWithMarkerHandle:(const void *)a3 featureType:(int)a4
{
  char *v6;
  char *v7;
  VKMarkerFeatureHandle *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  GEOFeatureStyleAttributes *styleAttributes;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VKMarkerFeatureHandle;
  v6 = -[VKMarkerFeatureHandle init](&v21, sel_init);
  v7 = v6;
  v8 = (VKMarkerFeatureHandle *)v6;
  if (v6)
  {
    v9 = *(_OWORD *)a3;
    v10 = *((_OWORD *)a3 + 1);
    *(_OWORD *)(v6 + 40) = *((_OWORD *)a3 + 2);
    *(_OWORD *)(v6 + 24) = v10;
    *(_OWORD *)(v6 + 8) = v9;
    v12 = *((_QWORD *)a3 + 6);
    v11 = *((_QWORD *)a3 + 7);
    if (v11)
    {
      v13 = (unint64_t *)(v11 + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 7) = v12;
    *((_QWORD *)v6 + 8) = v11;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithFeatureStyleAttributesConstPtr:", v7 + 56);
    styleAttributes = v8->_styleAttributes;
    v8->_styleAttributes = (GEOFeatureStyleAttributes *)v18;

    v8->_featureType = a4;
  }
  return v8;
}

- (const)actualHandle
{
  return &self->_actualHandle;
}

- (int)featureType
{
  return self->_featureType;
}

- (int64_t)featureIndex
{
  return self->_actualHandle.featureIndex;
}

- (int)tileX
{
  return self->_actualHandle.key._xIdx;
}

- (int)tileY
{
  return self->_actualHandle.key._yIdx;
}

- (int)tileZ
{
  return self->_actualHandle.key._level;
}

- (int)tileStyle
{
  return self->_actualHandle.tileStyle;
}

- (unsigned)tileVersion
{
  return self->_actualHandle.tileVersion;
}

- (id)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_styleAttributes, 0);
  cntrl = self->_actualHandle.styleAttributes.__cntrl_;
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
  *((_WORD *)self + 12) = 255;
  *((_DWORD *)self + 7) = 0;
  *((_DWORD *)self + 8) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
