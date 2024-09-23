@implementation VKStylesheetVendorResourceManifestTileGroupObserverProxy

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (VKStylesheetVendorResourceManifestTileGroupObserverProxy)initWithStylesheetVendor:(shared_ptr<md::StylesheetVendor>)a3
{
  StylesheetVendor *ptr;
  VKStylesheetVendorResourceManifestTileGroupObserverProxy *v4;
  VKStylesheetVendorResourceManifestTileGroupObserverProxy *v5;
  uint64_t v6;
  StylesheetVendor *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *cntrl;
  void *v11;
  objc_super v13;

  ptr = a3.__ptr_;
  v13.receiver = self;
  v13.super_class = (Class)VKStylesheetVendorResourceManifestTileGroupObserverProxy;
  v4 = -[VKStylesheetVendorResourceManifestTileGroupObserverProxy init](&v13, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v7 = *(StylesheetVendor **)ptr;
    v6 = *((_QWORD *)ptr + 1);
    if (v6)
    {
      v8 = (unint64_t *)(v6 + 16);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    cntrl = (std::__shared_weak_count *)v4->_vendor.__cntrl_;
    v5->_vendor.__ptr_ = v7;
    v5->_vendor.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
      std::__shared_weak_count::__release_weak(cntrl);
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTileGroupObserver:queue:", v5, MEMORY[0x1E0C80D38]);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VKStylesheetVendorResourceManifestTileGroupObserverProxy;
  -[VKStylesheetVendorResourceManifestTileGroupObserverProxy dealloc](&v4, sel_dealloc);
}

- (void)resourceManifestManagerWillChangeActiveTileGroup:(id)a3
{
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  StylesheetVendor *ptr;
  unint64_t *p_shared_owners;
  unint64_t v9;

  cntrl = self->_vendor.__cntrl_;
  if (cntrl)
  {
    v5 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v5)
    {
      v6 = v5;
      ptr = self->_vendor.__ptr_;
      if (ptr)
        md::StylesheetVendor::resetStylesheetCache((os_unfair_lock_s *)ptr);
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v4;
  __shared_weak_count *cntrl;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  id v10;

  v4 = a3;
  cntrl = self->_vendor.__cntrl_;
  if (cntrl)
  {
    v10 = v4;
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    v4 = v10;
    if (v6)
    {
      v7 = v6;
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *, id))v6->__on_zero_shared)(v6, v10);
        std::__shared_weak_count::__release_weak(v7);
        v4 = v10;
      }
    }
  }

}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;

  cntrl = self->_vendor.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

@end
