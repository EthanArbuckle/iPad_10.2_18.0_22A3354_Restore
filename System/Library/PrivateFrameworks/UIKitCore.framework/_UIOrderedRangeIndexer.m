@implementation _UIOrderedRangeIndexer

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_orderedRangeIndexerImpl.__cntrl_;
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

- (_UIOrderedRangeIndexer)init
{
  _UIOrderedRangeIndexer *v2;
  char *v3;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIOrderedRangeIndexer;
  v2 = -[_UIOrderedRangeIndexer init](&v8, sel_init);
  if (v2)
  {
    v3 = (char *)operator new(0x40uLL);
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    *(_QWORD *)v3 = &off_1E168B6A8;
    *(_OWORD *)(v3 + 40) = 0u;
    *((_QWORD *)v3 + 7) = 0;
    *(_OWORD *)(v3 + 24) = 0u;
    cntrl = (std::__shared_weak_count *)v2->_orderedRangeIndexerImpl.__cntrl_;
    v2->_orderedRangeIndexerImpl.__ptr_ = (_UIOrderedRangeIndexerImpl *)(v3 + 24);
    v2->_orderedRangeIndexerImpl.__cntrl_ = (__shared_weak_count *)v3;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  return v2;
}

- (uint64_t)rangeContainingLocation:(uint64_t)result
{
  _UIOrderedRangeIndexerImpl *v2;
  _QWORD v3[3];

  if (result)
  {
    v2 = *(_UIOrderedRangeIndexerImpl **)(result + 8);
    memset(v3, 0, sizeof(v3));
    _UIOrderedRangeIndexerImpl::binarySearchForLocation(v2, a2, (uint64_t)v3);
    return v3[0];
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _UIOrderedRangeIndexerImpl *ptr;
  NSRange *v8;
  NSRange *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p:"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ptr = self->_orderedRangeIndexerImpl.__ptr_;
  v8 = *(NSRange **)ptr;
  v9 = (NSRange *)*((_QWORD *)ptr + 1);
  if (*(NSRange **)ptr != v9)
  {
    do
    {
      NSStringFromRange(*v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v10);

      ++v8;
    }
    while (v8 != v9);
  }
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  return v6;
}

@end
