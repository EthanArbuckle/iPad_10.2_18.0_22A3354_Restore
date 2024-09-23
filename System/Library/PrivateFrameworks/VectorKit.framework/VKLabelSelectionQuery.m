@implementation VKLabelSelectionQuery

- (VKLabelSelectionQuery)initWithLabelMarker:(shared_ptr<md:(unsigned int)a4 :StandardLabelMarker>)a3 selectionFilterStamp:
{
  unsigned int cntrl;
  StandardLabelMarker *ptr;
  VKLabelSelectionQuery *v6;
  VKLabelSelectionQuery *v7;
  uint64_t v8;
  StandardLabelMarker *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  objc_super v16;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v16.receiver = self;
  v16.super_class = (Class)VKLabelSelectionQuery;
  v6 = -[VKLabelSelectionQuery init](&v16, sel_init, a3.__ptr_, a3.__cntrl_, *(_QWORD *)&a4);
  v7 = v6;
  if (v6)
  {
    v9 = *(StandardLabelMarker **)ptr;
    v8 = *((_QWORD *)ptr + 1);
    if (v8)
    {
      v10 = (unint64_t *)(v8 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (std::__shared_weak_count *)v6->_labelMarker.__cntrl_;
    v6->_labelMarker.__ptr_ = v9;
    v6->_labelMarker.__cntrl_ = (__shared_weak_count *)v8;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v7->_filterStamp = cntrl;
  }
  return v7;
}

- (VKLabelMarker)labelMarker
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  StandardLabelMarker *ptr;
  __shared_weak_count *v11;

  cntrl = self->_labelMarker.__cntrl_;
  ptr = self->_labelMarker.__ptr_;
  v11 = cntrl;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  +[VKLabelMarker markerWithLabelMarker:](VKLabelMarker, "markerWithLabelMarker:", &ptr);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v7 = (unint64_t *)((char *)v11 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return (VKLabelMarker *)v5;
}

- (shared_ptr<md::StandardLabelMarker>)standardLabelMarker
{
  StandardLabelMarker **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::StandardLabelMarker> result;

  cntrl = self->_labelMarker.__cntrl_;
  *v2 = self->_labelMarker.__ptr_;
  v2[1] = (StandardLabelMarker *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (StandardLabelMarker *)self;
  return result;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (unsigned)filterStamp
{
  return self->_filterStamp;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_labelMarker.__cntrl_;
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
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
