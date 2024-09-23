@implementation VKInternalIconManager

- (void)_startTileGroupObserver
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_purgeStyleManagers");

}

- (id)init:(shared_ptr<grl:(shared_ptr<md::StylesheetVendor>)a4 :IconManager>)a3 stylesheetVendor:
{
  __shared_weak_count *cntrl;
  IconManager *ptr;
  VKInternalIconManager *v6;
  VKInternalIconManager *v7;
  uint64_t v8;
  IconManager *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  StylesheetVendor *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  VKInternalIconManager *v22;
  objc_super v24;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v24.receiver = self;
  v24.super_class = (Class)VKInternalIconManager;
  v6 = -[VKInternalIconManager init](&v24, sel_init, a3.__ptr_, a3.__cntrl_, a4.__ptr_, a4.__cntrl_);
  v7 = v6;
  if (v6)
  {
    v6->_isSharedIconManager = 1;
    v9 = *(IconManager **)ptr;
    v8 = *((_QWORD *)ptr + 1);
    if (v8)
    {
      v10 = (unint64_t *)(v8 + 8);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    v12 = (std::__shared_weak_count *)v6->_iconManager.__cntrl_;
    v6->_iconManager.__ptr_ = v9;
    v6->_iconManager.__cntrl_ = (__shared_weak_count *)v8;
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
    v16 = *(StylesheetVendor **)cntrl;
    v15 = *((_QWORD *)cntrl + 1);
    if (v15)
    {
      v17 = (unint64_t *)(v15 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v19 = (std::__shared_weak_count *)v7->_stylesheetVendor.__cntrl_;
    v7->_stylesheetVendor.__ptr_ = v16;
    v7->_stylesheetVendor.__cntrl_ = (__shared_weak_count *)v15;
    if (v19)
    {
      v20 = (unint64_t *)&v19->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    -[VKInternalIconManager _startTileGroupObserver](v7, "_startTileGroupObserver");
    v22 = v7;
  }

  return v7;
}

+ (int64_t)convertGrlSizeGroup:(unsigned __int8)a3
{
  if (a3 >= 0xAu)
    return 4;
  else
    return a3;
}

- (id).cxx_construct
{
  read_write_lock *p_nameToStyleManagerLock;
  geo::read_write_lock *v4;
  const char *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *p_pair1;
  unsigned __int8 v7;
  float *v8;
  int v10;
  uint64_t v11;
  geo::read_write_lock *v12;
  const char *v13;
  malloc_zone_t *zone;

  *(_OWORD *)&self->_nameToStyleManagerLock._lock.__sig = 0u;
  p_nameToStyleManagerLock = &self->_nameToStyleManagerLock;
  *(_QWORD *)&p_nameToStyleManagerLock->_lock.__opaque[184] = 0;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[152] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[168] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[120] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[136] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[88] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[104] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[56] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[72] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[24] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[40] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[8] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock[-1]._lock.__opaque[160] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock[-1]._lock.__opaque[176] = 0u;
  v4 = (geo::read_write_lock *)pthread_rwlock_init(&p_nameToStyleManagerLock->_lock, 0);
  if ((_DWORD)v4)
    geo::read_write_lock::logFailure(v4, (uint64_t)"initialization", v5);
  self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
  v8 = &md::SignedDistanceFieldGenerator::_hypotCache[32438];
  if ((v7 & 1) == 0)
  {
    v8 = md::SignedDistanceFieldGenerator::_hypotCache + 129752;
    if (v10)
    {
      v11 = operator new();
      *(_QWORD *)(v11 + 16) = 0x5ED09DD50000000FLL;
      *(_QWORD *)(v11 + 24) = "VectorKitLabels";
      *(_OWORD *)(v11 + 32) = xmmword_19FFB2E80;
      *(_QWORD *)v11 = &off_1E42B5668;
      *(_QWORD *)(v11 + 8) = "VectorKitLabels";
      *(_OWORD *)(v11 + 72) = 0u;
      *(_OWORD *)(v11 + 88) = 0u;
      *(_OWORD *)(v11 + 104) = 0u;
      *(_OWORD *)(v11 + 120) = 0u;
      *(_OWORD *)(v11 + 136) = 0u;
      *(_OWORD *)(v11 + 152) = 0u;
      *(_OWORD *)(v11 + 168) = 0u;
      *(_OWORD *)(v11 + 184) = 0u;
      *(_OWORD *)(v11 + 200) = 0u;
      *(_OWORD *)(v11 + 216) = 0u;
      *(_OWORD *)(v11 + 232) = 0u;
      *(_QWORD *)(v11 + 248) = 0;
      *(_OWORD *)(v11 + 56) = 0u;
      v12 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v11 + 56), 0);
      if ((_DWORD)v12)
        geo::read_write_lock::logFailure(v12, (uint64_t)"initialization", v13);
      zone = malloc_create_zone(0, 0);
      *(_QWORD *)(v11 + 48) = zone;
      malloc_set_zone_name(zone, "VectorKitLabels");
      *(_QWORD *)(v11 + 256) = os_log_create("com.apple.VectorKit", "Memory");
      mdm::Allocator::instance(void)::alloc = v11;
      v8 = &md::SignedDistanceFieldGenerator::_hypotCache[32438];
      p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
    }
  }
  self->_nameToStyleManager.__tree_.__pair1_.__value__2._allocator = (Allocator *)*((_QWORD *)v8 + 299);
  self->_nameToStyleManager.__tree_.__pair3_.__value_ = 0;
  self->_nameToStyleManager.__tree_.__begin_node_ = p_pair1;
  self->_manifestTileGroupObserverProxy._vptr$_retain_ptr = (void **)&off_1E42B5270;
  self->_manifestTileGroupObserverProxy._obj = 0;
  self->_resourceManager._vptr$_retain_ptr = (void **)&off_1E42B4D10;
  self->_resourceManager._obj = 0;
  self->_resourceProvider = 0u;
  self->_fontManager = 0u;
  return self;
}

- (VKInternalIconManager)init
{
  VKInternalIconManager *v2;
  VKInternalIconManager *v3;
  VKInternalIconManager *v4;
  VKResourceManager *v5;
  VKResourceManager *obj;
  VKResourceManager *v7;
  shared_ptr<md::StylesheetVendor> v8;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD *v15;
  md::GeoResourceProvider *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __n128 v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  __shared_weak_count *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  VKInternalIconManager *v37;
  objc_super v39;
  shared_ptr<md::StylesheetVendor> v40;

  v39.receiver = self;
  v39.super_class = (Class)VKInternalIconManager;
  v2 = -[VKInternalIconManager init](&v39, sel_init);
  v3 = v2;
  v4 = v2;
  if (v2)
  {
    v2->_isSharedIconManager = 0;
    v5 = objc_alloc_init(VKResourceManager);
    obj = v4->_resourceManager._obj;
    v4->_resourceManager._obj = v5;

    v7 = v4->_resourceManager._obj;
    std::allocate_shared[abi:nn180100]<md::StylesheetVendor,std::allocator<md::StylesheetVendor>,VKResourceManager * {__strong},void>(&v40, v7);
    v8 = v40;
    v40 = (shared_ptr<md::StylesheetVendor>)0;
    cntrl = (std::__shared_weak_count *)v4->_stylesheetVendor.__cntrl_;
    v4->_stylesheetVendor = v8;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v12 = (std::__shared_weak_count *)v40.__cntrl_;
    if (v40.__cntrl_)
    {
      v13 = (unint64_t *)((char *)v40.__cntrl_ + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    md::StylesheetVendor::setupTileGroupObservationProxy((md::StylesheetVendor *)v4->_stylesheetVendor.__ptr_);
    v15 = operator new(0x170uLL);
    v15[1] = 0;
    v15[2] = 0;
    *v15 = &off_1E42DC120;
    v16 = md::GeoResourceProvider::GeoResourceProvider((md::GeoResourceProvider *)(v15 + 3));
    v17 = (std::__shared_weak_count *)v4->_resourceProvider.__cntrl_;
    v4->_resourceProvider.__ptr_ = (GeoResourceProvider *)v16;
    v4->_resourceProvider.__cntrl_ = (__shared_weak_count *)v15;
    if (v17)
    {
      v18 = (unint64_t *)&v17->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = operator new();
    v21 = v20;
    v40.__ptr_ = (StylesheetVendor *)v4->_resourceProvider.__ptr_;
    v22 = v4->_resourceProvider.__cntrl_;
    v40.__cntrl_ = v22;
    if (v22)
    {
      v23 = (unint64_t *)((char *)v22 + 8);
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    v25.n128_f64[0] = grl::FontManager::FontManager(v20, (uint64_t *)&v40, 0xAu);
    v26 = (std::__shared_weak_count *)v40.__cntrl_;
    if (v40.__cntrl_)
    {
      v27 = (unint64_t *)((char *)v40.__cntrl_ + 8);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v26->__on_zero_shared)(v26, v25);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v29 = (__shared_weak_count *)operator new();
    *(_QWORD *)v29 = &off_1E42E7FE0;
    *((_QWORD *)v29 + 1) = 0;
    *((_QWORD *)v29 + 2) = 0;
    *((_QWORD *)v29 + 3) = v21;
    v30 = (std::__shared_weak_count *)v4->_fontManager.__cntrl_;
    v4->_fontManager.__ptr_ = (FontManager *)v21;
    v4->_fontManager.__cntrl_ = v29;
    if (v30)
    {
      v31 = (unint64_t *)&v30->__shared_owners_;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    v33 = operator new(0x218uLL);
    std::__shared_ptr_emplace<grl::IconManager>::__shared_ptr_emplace[abi:nn180100]<std::shared_ptr<md::GeoResourceProvider> &,std::shared_ptr<grl::FontManager> &,std::allocator<grl::IconManager>,0>(v33, (uint64_t)v4->_resourceProvider.__ptr_, (std::__shared_weak_count *)v4->_resourceProvider.__cntrl_, &v3->_fontManager.__ptr_);
    v34 = (std::__shared_weak_count *)v4->_iconManager.__cntrl_;
    v4->_iconManager.__ptr_ = (IconManager *)(v33 + 3);
    v4->_iconManager.__cntrl_ = (__shared_weak_count *)v33;
    if (v34)
    {
      v35 = (unint64_t *)&v34->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    -[VKInternalIconManager _startTileGroupObserver](v4, "_startTileGroupObserver");
    v37 = v4;
  }

  return v4;
}

- (void)_purgeStyleManagers
{
  read_write_lock *p_nameToStyleManagerLock;
  geo::read_write_lock *v4;
  const char *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *p_pair1;
  void *left;
  geo::read_write_lock *v8;
  const char *v9;

  p_nameToStyleManagerLock = &self->_nameToStyleManagerLock;
  v4 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_nameToStyleManagerLock._lock);
  if ((_DWORD)v4)
    geo::read_write_lock::logFailure(v4, (uint64_t)"write lock", v5);
  left = self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
  std::__tree<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,std::__map_value_compare<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,NSStringMapComparison,true>,geo::StdAllocator<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,mdm::Allocator>>::destroy((uint64_t)&p_pair1[-1].__value__2, (uint64_t)left);
  p_pair1[1].__value_.__left_ = 0;
  p_pair1[-1].__value__2._allocator = (Allocator *)p_pair1;
  p_pair1->__value_.__left_ = 0;
  v8 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_nameToStyleManagerLock->_lock);
  if ((_DWORD)v8)
    geo::read_write_lock::logFailure(v8, (uint64_t)"unlock", v9);
}

- (id)imageForImageSourceKey:(id)a3
{
  grl::Allocator *v4;
  float v5;
  IconManager *v6;
  id v7;
  const char *v8;
  size_t v9;
  size_t v10;
  __int128 *p_dst;
  IconManager *ptr;
  unsigned int v13;
  grl::Allocator *v14;
  int v15;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  VKIconImage *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v45;
  id v46;
  std::__shared_weak_count *v47;
  __int128 __dst;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  int v52;
  char v53;
  int v54;
  __int16 v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[176];
  __int128 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = (grl::Allocator *)a3;
  v52 = 1065353216;
  v53 = 4;
  v55 = -1;
  v54 = 0;
  v56 = 0;
  v58 = 0;
  v59 = 0;
  v57 = 0;
  v60 = grl::Allocator::instance(v4);
  -[grl::Allocator contentScale](v4, "contentScale");
  grl::IconRequestOptions::setContentScale((float *)&v52, v5);
  grl::IconRequestOptions::setSizeGroup((uint64_t)&v52, +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", -[grl::Allocator sizeGroup](v4, "sizeGroup")));
  grl::IconRequestOptions::setVariant((uint64_t)&v52, -[grl::Allocator variant](v4, "variant"));
  grl::IconRequestOptions::setDataVariant((uint64_t)&v52, -[grl::Allocator secondaryVariant](v4, "secondaryVariant"));
  grl::IconRequestOptions::setCountryCode((uint64_t)&v52, -[grl::Allocator countryCode](v4, "countryCode"));
  v51 = 0uLL;
  if (-[grl::Allocator keyType](v4, "keyType") != 5)
  {
    if (-[grl::Allocator keyType](v4, "keyType") != 2)
    {
      v21 = 0;
      goto LABEL_35;
    }
    ptr = self->_iconManager.__ptr_;
    v13 = -[grl::Allocator iconAttributeKey](v4, "iconAttributeKey");
    v14 = (grl::Allocator *)-[grl::Allocator iconAttributeValue](v4, "iconAttributeValue");
    v15 = (int)v14;
    *(_QWORD *)v61 = 0;
    memset(&v61[16], 0, 160);
    v62 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v61[8] = _D0;
    v61[30] = 0;
    *(_QWORD *)&v61[104] = grl::Allocator::instance(v14);
    memset(&v61[112], 0, 56);
    *(_QWORD *)&v61[88] = &v61[96];
    v63 = 0;
    grl::IconManager::imageForKeyValue((uint64_t)ptr, v13, v15, (const grl::IconModifiers *)v61, (float *)&v52, 0, &__dst);
    v45 = __dst;
    __dst = 0uLL;
    v51 = v45;
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)v61);
    v21 = (id)v45;
    if (!(_QWORD)v45)
      goto LABEL_35;
    goto LABEL_27;
  }
  v6 = self->_iconManager.__ptr_;
  -[grl::Allocator imageName](v4, "imageName");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = strlen(v8);
  if (v9 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v10 = v9;
  if (v9 >= 0x17)
  {
    v22 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v22 = v9 | 7;
    v23 = v22 + 1;
    p_dst = (__int128 *)operator new(v22 + 1);
    *((_QWORD *)&__dst + 1) = v10;
    v49 = v23 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v49) = v9;
    p_dst = &__dst;
    if (!v9)
      goto LABEL_14;
  }
  v9 = (size_t)memmove(p_dst, v8, v10);
LABEL_14:
  *((_BYTE *)p_dst + v10) = 0;
  *(_QWORD *)v61 = 0;
  memset(&v61[16], 0, 160);
  v63 = 0;
  v62 = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&v61[8] = _D0;
  v61[30] = 0;
  *(_QWORD *)&v61[104] = grl::Allocator::instance((grl::Allocator *)v9);
  memset(&v61[112], 0, 56);
  *(_QWORD *)&v61[88] = &v61[96];
  v63 = 0;
  grl::IconManager::imageForName((uint64_t)v6, (uint64_t)&__dst, (IconModifiers *)v61, (float *)&v52, 0, &v50);
  v25 = v50;
  v50 = 0uLL;
  v26 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
  v51 = v25;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
  if (*((_QWORD *)&v50 + 1))
  {
    v30 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  grl::IconModifiers::~IconModifiers((grl::IconModifiers *)v61);
  if (SHIBYTE(v49) < 0)
    operator delete((void *)__dst);

  v21 = (id)v51;
  if ((_QWORD)v51)
  {
LABEL_27:
    v32 = [VKIconImage alloc];
    v46 = v21;
    v47 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
    if (*((_QWORD *)&v51 + 1))
    {
      v33 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    v21 = -[VKIconImage init:](v32, "init:", &v46, v45);
    v35 = v47;
    if (v47)
    {
      v36 = (unint64_t *)&v47->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
  }
LABEL_35:
  v38 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
  if (*((_QWORD *)&v51 + 1))
  {
    v39 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v41 = v57;
  if (v57)
  {
    v42 = v58;
    v43 = v57;
    if (v58 != v57)
    {
      do
      {
        if (*(char *)(v42 - 1) < 0)
          operator delete(*(void **)(v42 - 24));
        v42 -= 24;
      }
      while (v42 != v41);
      v43 = v57;
    }
    v58 = v41;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v60 + 40))(v60, v43, v59 - v43);
  }

  return v21;
}

- (id)imageForStyleAttributes:(id)a3 styleManager:(shared_ptr<gss:(float)a5 :(int64_t)a6 StylesheetManager<gss:(id)a7 :PropertyID>>)a4 contentScale:sizeGroup:modifiers:
{
  __shared_weak_count *cntrl;
  uint64_t *ptr;
  id v12;
  VKIconModifiers *v13;
  VKIconModifiers *v14;
  id v15;
  __int16 v16;
  _BOOL4 v17;
  _WORD *v18;
  __int16 v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  gss::Allocator *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  int v31;
  unint64_t *v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  std::string::size_type size;
  unsigned int v41;
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  int v55;
  __int16 v56;
  __int16 v57;
  unsigned int v58;
  uint64_t v59;
  unsigned int v60;
  unsigned int v61;
  int v62;
  int v63;
  __int16 v64;
  __int16 v65;
  unsigned int v66;
  uint64_t v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  uint64_t v75;
  unsigned int v76;
  unsigned int v77;
  grl::IconModifiers *v78;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  uint64_t ValueForAttributeKey;
  IconManager *v85;
  grl::Allocator *v86;
  VKIconImage *v87;
  unint64_t *v88;
  unint64_t v89;
  id v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  std::__shared_weak_count *v94;
  unint64_t *v95;
  unint64_t v96;
  std::string::size_type v97;
  std::string::size_type v98;
  std::string::size_type v99;
  unint64_t *p_shared_owners;
  unint64_t v101;
  uint64_t v102;
  __int128 v104;
  uint64_t v105;
  std::__shared_weak_count *v106;
  _QWORD **v107;
  _QWORD *v108[3];
  uint64_t v109;
  std::__shared_weak_count *v110;
  std::string __p;
  std::string::size_type v112;
  uint64_t v113;
  uint64_t v114;
  unsigned __int16 v115;
  __int128 v116;
  _QWORD v117[2];
  unsigned __int8 v118;
  __int128 v119;
  uint64_t v120[3];
  uint64_t v121;
  _BYTE v122[15];
  char v123;

  cntrl = a4.__cntrl_;
  ptr = (uint64_t *)a4.__ptr_;
  v12 = a3;
  v13 = (VKIconModifiers *)(id)a6;
  v14 = v13;
  if (!self->_iconManager.__ptr_)
  {
    v15 = 0;
    goto LABEL_161;
  }
  v15 = 0;
  if (v12 && *ptr)
  {
    if (!v13)
      v14 = objc_alloc_init(VKIconModifiers);
    memset(v122, 0, sizeof(v122));
    v123 = 1;
    if (-[VKIconModifiers transitMode](v14, "transitMode"))
    {
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10001u) = 0;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x1000Du) = 2;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x1000Eu) = 0;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10033u) = 0;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x1003Cu) = 1;
    }
    if (-[VKIconModifiers navMode](v14, "navMode"))
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10000u) = 3;
    if (-[VKIconModifiers interactive](v14, "interactive"))
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10002u) = 2;
    if (-[VKIconModifiers nightMode](v14, "nightMode"))
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10001u) = 1;
    if (-[VKIconModifiers elevated](v14, "elevated"))
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10051u) = 1;
    if (-[VKIconModifiers isSearchResult](v14, "isSearchResult"))
    {
      v16 = -[VKIconModifiers nightMode](v14, "nightMode");
      v17 = -[VKIconModifiers transitMode](v14, "transitMode");
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10001u) = v16;
      v18 = (_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x1000Du);
      if (v17)
        v19 = 2;
      else
        v19 = 0;
      *v18 = v19;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x1000Eu) = 0;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x10033u) = 1;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v122, 0x1003Cu) = 1;
    }
    objc_msgSend(v12, "featureStyleAttributesPtr");
    v104 = v116;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v116;
    v116 = 0uLL;
    md::createFeatureAttributeSet((gss::Allocator *)v120, (uint64_t *)&__p);
    if (*((_QWORD *)&v104 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v104 + 1) + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v104 + 1) + 16))(*((_QWORD *)&v104 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v104 + 1));
      }
    }
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v116 + 1);
    if (*((_QWORD *)&v116 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v116 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v119, *ptr, (gss::FeatureAttributeSet *)v120, (gss::QueryOverrides *)v122);
    v25 = (gss::Allocator *)v119;
    if (!(_QWORD)v119)
    {
      v15 = 0;
      v30 = (std::__shared_weak_count *)*((_QWORD *)&v119 + 1);
      if (*((_QWORD *)&v119 + 1))
      {
LABEL_152:
        p_shared_owners = (unint64_t *)&v30->__shared_owners_;
        do
          v101 = __ldaxr(p_shared_owners);
        while (__stlxr(v101 - 1, p_shared_owners));
        if (!v101)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
LABEL_156:
      if (v120[0])
      {
        v120[1] = v120[0];
        v25 = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v121 + 40))(v121, v120[0], v120[2] - v120[0]);
      }
      if (!v122[14] && *(_QWORD *)v122)
      {
        v102 = gss::Allocator::instance(v25);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v102 + 40))(v102, *(_QWORD *)v122, *(unsigned __int16 *)&v122[12]);
      }
      goto LABEL_161;
    }
    v26 = (std::__shared_weak_count *)*((_QWORD *)&v119 + 1);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v119;
    if (*((_QWORD *)&v119 + 1))
    {
      v27 = (unint64_t *)(*((_QWORD *)&v119 + 1) + 8);
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
      *((_QWORD *)&v116 + 1) = v26;
      do
        v29 = __ldxr(v27);
      while (__stxr(v29 + 1, v27));
    }
    else
    {
      *((_QWORD *)&v116 + 1) = 0;
    }
    v117[0] = 0;
    v117[1] = 0;
    *(_QWORD *)&v116 = v25;
    v118 = 0;
    v31 = (*(uint64_t (**)(gss::Allocator *, _QWORD *))(*(_QWORD *)v25 + 48))(v25, v117);
    v118 = v31;
    if (v26)
    {
      v32 = (unint64_t *)&v26->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
      v31 = v118;
    }
    if (!v31)
      goto LABEL_83;
    v34 = -[VKIconModifiers zoom](v14, "zoom");
    v35 = *(_QWORD *)(v116 + 24);
    if (v34 >= 0x17)
      v36 = 23;
    else
      v36 = v34;
    v37 = *(unsigned __int8 *)(v35 + 12);
    if (v37 == 2)
    {
      if ((gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(v116 + 24), 0x71u, v36, 0) & 1) != 0)
        goto LABEL_56;
      v37 = 1;
    }
    if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v35, 0x71u, v36, v37))
      goto LABEL_65;
LABEL_56:
    v38 = -[VKIconModifiers zoom](v14, "zoom", (_QWORD)v104);
    if (v38 >= 0x17)
      v39 = 23;
    else
      v39 = v38;
    gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, *(_QWORD *)(v116 + 24), 0x71u, v39, 1);
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __p.__r_.__value_.__l.__size_;
    if (size)
    {
      v41 = grl::IconManager::identifierForName((uint64_t)self->_iconManager.__ptr_, (uint64_t)&__p, a5);
      if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
        goto LABEL_64;
    }
    else
    {
      v41 = 0;
      if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      {
LABEL_64:
        if (v41)
          goto LABEL_78;
LABEL_65:
        v42 = -[VKIconModifiers zoom](v14, "zoom", (_QWORD)v104);
        v43 = *(_QWORD *)(v116 + 24);
        if (v42 >= 0x17)
          v44 = 23;
        else
          v44 = v42;
        v45 = *(unsigned __int8 *)(v43 + 12);
        if (v45 == 2)
        {
          __p.__r_.__value_.__s.__data_[0] = 1;
          LOBYTE(v107) = 1;
          v46 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v43, 0xBAu, v44, 0, &__p);
          gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v43, 0xBAu, v44, 1u, &v107);
          if (v46)
            goto LABEL_70;
        }
        else
        {
          v46 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(_QWORD *)(v116 + 24), 0xBAu, v44, v45, 0);
          if (v46)
          {
LABEL_70:
            v47 = 0;
            v48 = 0;
            v49 = 0;
            while (v48 < objc_msgSend(v12, "countAttrs"))
            {
              if (*(_DWORD *)(objc_msgSend(v12, "v") + v47) == v46)
                v49 = *(_DWORD *)(objc_msgSend(v12, "v") + v47 + 4);
              ++v48;
              v47 += 8;
            }
LABEL_77:
            v41 = grl::IconManager::identifierForMapKeyValue((uint64_t)self->_iconManager.__ptr_, v46, v49, 1, a5);
            if (v41)
            {
LABEL_78:
              v50 = -[VKIconModifiers zoom](v14, "zoom");
              LOBYTE(v109) = 1;
              v51 = *(_QWORD *)(v116 + 24);
              if (v50 >= 0x17)
                v52 = 23;
              else
                v52 = v50;
              v53 = *(unsigned __int8 *)(v51 + 12);
              if (v53 == 2)
              {
                __p.__r_.__value_.__s.__data_[0] = 1;
                LOBYTE(v107) = 1;
                v54 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v51, 0x16Cu, v52, 0, &__p);
                gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v51, 0x16Cu, v52, 1u, &v107);
                v55 = (__p.__r_.__value_.__s.__data_[0] | v107) != 0;
              }
              else
              {
                v54 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(_QWORD *)(v116 + 24), 0x16Cu, v52, v53, &v109);
                v55 = v109;
              }
              v56 = -[VKIconModifiers variant](v14, "variant");
              if (v55)
                v57 = v54;
              else
                v57 = v56;
              v58 = -[VKIconModifiers zoom](v14, "zoom");
              LOBYTE(v109) = 1;
              v59 = *(_QWORD *)(v116 + 24);
              if (v58 >= 0x17)
                v60 = 23;
              else
                v60 = v58;
              v61 = *(unsigned __int8 *)(v59 + 12);
              if (v61 == 2)
              {
                __p.__r_.__value_.__s.__data_[0] = 1;
                LOBYTE(v107) = 1;
                v62 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v59, 0x174u, v60, 0, &__p);
                gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v59, 0x174u, v60, 1u, &v107);
                v63 = (__p.__r_.__value_.__s.__data_[0] | v107) != 0;
              }
              else
              {
                v62 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(_QWORD *)(v116 + 24), 0x174u, v60, v61, &v109);
                v63 = v109;
              }
              v64 = -[VKIconModifiers secondaryVariant](v14, "secondaryVariant");
              if (v63)
                v65 = v62;
              else
                v65 = v64;
              v66 = -[VKIconModifiers zoom](v14, "zoom");
              v67 = *(_QWORD *)(v116 + 24);
              if (v66 >= 0x17)
                v68 = 23;
              else
                v68 = v66;
              v69 = *(unsigned __int8 *)(v67 + 12);
              if (v69 == 2)
              {
                if ((gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(v116 + 24), 0x162u, v68, 0) & 1) != 0)
                  goto LABEL_104;
                v69 = 1;
              }
              if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v67, 0x162u, v68, v69))
              {
                LOBYTE(cntrl) = +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", cntrl);
                goto LABEL_111;
              }
LABEL_104:
              v70 = -[VKIconModifiers zoom](v14, "zoom");
              v71 = *(_QWORD *)(v116 + 24);
              if (v70 >= 0x17)
                v72 = 23;
              else
                v72 = v70;
              v73 = *(unsigned __int8 *)(v71 + 12);
              if (v73 == 2)
              {
                __p.__r_.__value_.__s.__data_[0] = 1;
                LOBYTE(v107) = 1;
                LODWORD(cntrl) = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v71, 0x162u, v72, 0, &__p);
                gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v71, 0x162u, v72, 1u, &v107);
              }
              else
              {
                LODWORD(cntrl) = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(_QWORD *)(v116 + 24), 0x162u, v72, v73, 0);
              }
LABEL_111:
              v74 = -[VKIconModifiers zoom](v14, "zoom");
              v75 = *(_QWORD *)(v116 + 24);
              if (v74 >= 0x17)
                v76 = 23;
              else
                v76 = v74;
              v77 = *(unsigned __int8 *)(v75 + 12);
              if (v77 == 2)
              {
                if ((gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(v116 + 24), 0xDAu, v76, 0) & 1) != 0)
                {
LABEL_118:
                  v78 = -[VKIconModifiers cppModifiers](v14, "cppModifiers");
                  v79 = -[VKIconModifiers zoom](v14, "zoom");
                  v80 = *(_QWORD *)(v116 + 24);
                  if (v79 >= 0x17)
                    v81 = 23;
                  else
                    v81 = v79;
                  v82 = *(unsigned __int8 *)(v80 + 12);
                  if (v82 == 2)
                  {
                    __p.__r_.__value_.__s.__data_[0] = 1;
                    LOBYTE(v107) = 1;
                    v83 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v80, 0xDAu, v81, 0, &__p);
                    gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v80, 0xDAu, v81, 1u, &v107);
                  }
                  else
                  {
                    v83 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(*(_QWORD *)(v116 + 24), 0xDAu, v81, v82, 0);
                  }
                  grl::IconModifiers::setOpacity(v78, *(float *)&v83);
LABEL_125:
                  v115 = 0;
                  ValueForAttributeKey = gss::FeatureAttributeSet::getValueForAttributeKey(v120, 4, &v115);
                  if ((ValueForAttributeKey & 1) == 0)
                    v115 = -1;
                  LODWORD(__p.__r_.__value_.__l.__data_) = 1065353216;
                  __p.__r_.__value_.__s.__data_[4] = 4;
                  WORD1(__p.__r_.__value_.__r.__words[1]) = -1;
                  *(_DWORD *)((char *)__p.__r_.__value_.__r.__words + 6) = 0;
                  __p.__r_.__value_.__s.__data_[12] = 0;
                  v112 = 0;
                  v113 = 0;
                  __p.__r_.__value_.__r.__words[2] = 0;
                  v114 = grl::Allocator::instance((grl::Allocator *)ValueForAttributeKey);
                  grl::IconRequestOptions::setContentScale((float *)&__p, a5);
                  grl::IconRequestOptions::setSizeGroup((uint64_t)&__p, (char)cntrl);
                  grl::IconRequestOptions::setVariant((uint64_t)&__p, v57);
                  grl::IconRequestOptions::setDataVariant((uint64_t)&__p, v65);
                  grl::IconRequestOptions::setCountryCode((uint64_t)&__p, v115);
                  v85 = self->_iconManager.__ptr_;
                  v86 = -[VKIconModifiers cppModifiers](v14, "cppModifiers");
                  v108[0] = 0;
                  v108[1] = (_QWORD *)grl::Allocator::instance(v86);
                  v108[2] = 0;
                  v107 = v108;
                  grl::IconManager::imageForIconID((uint64_t)v85, v41, (IconModifiers *)v86, (uint64_t)&__p, &v107, 0, &v109);
                  std::__tree<std::__value_type<unsigned short,grl::ImageData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,grl::ImageData>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,grl::ImageData>,grl::Allocator>>::destroy((uint64_t)&v107, v108[0]);
                  if (v109)
                  {
                    v87 = [VKIconImage alloc];
                    v105 = v109;
                    v106 = v110;
                    if (v110)
                    {
                      v88 = (unint64_t *)&v110->__shared_owners_;
                      do
                        v89 = __ldxr(v88);
                      while (__stxr(v89 + 1, v88));
                    }
                    v90 = -[VKIconImage init:](v87, "init:", &v105);
                    v91 = v106;
                    if (v106)
                    {
                      v92 = (unint64_t *)&v106->__shared_owners_;
                      do
                        v93 = __ldaxr(v92);
                      while (__stlxr(v93 - 1, v92));
                      if (!v93)
                      {
                        ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
                        std::__shared_weak_count::__release_weak(v91);
                      }
                    }
                    v15 = v90;

                    v94 = v110;
                    if (!v110)
                      goto LABEL_143;
                  }
                  else
                  {
                    v15 = 0;
                    v94 = v110;
                    if (!v110)
                    {
LABEL_143:
                      v97 = __p.__r_.__value_.__r.__words[2];
                      if (__p.__r_.__value_.__r.__words[2])
                      {
                        v98 = v112;
                        v99 = __p.__r_.__value_.__r.__words[2];
                        if (v112 != __p.__r_.__value_.__r.__words[2])
                        {
                          do
                          {
                            if (*(char *)(v98 - 1) < 0)
                              operator delete(*(void **)(v98 - 24));
                            v98 -= 24;
                          }
                          while (v98 != v97);
                          v99 = __p.__r_.__value_.__r.__words[2];
                        }
                        v112 = v97;
                        (*(void (**)(uint64_t, std::string::size_type, std::string::size_type))(*(_QWORD *)v114 + 40))(v114, v99, v113 - v99);
                      }
LABEL_151:
                      v25 = (gss::Allocator *)gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v116);
                      v30 = (std::__shared_weak_count *)*((_QWORD *)&v119 + 1);
                      if (*((_QWORD *)&v119 + 1))
                        goto LABEL_152;
                      goto LABEL_156;
                    }
                  }
                  v95 = (unint64_t *)&v94->__shared_owners_;
                  do
                    v96 = __ldaxr(v95);
                  while (__stlxr(v96 - 1, v95));
                  if (!v96)
                  {
                    ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
                    std::__shared_weak_count::__release_weak(v94);
                  }
                  goto LABEL_143;
                }
                v77 = 1;
              }
              if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v75, 0xDAu, v76, v77))
                goto LABEL_125;
              goto LABEL_118;
            }
LABEL_83:
            v15 = 0;
            goto LABEL_151;
          }
        }
        v49 = 0;
        goto LABEL_77;
      }
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_64;
  }
LABEL_161:

  return v15;
}

- (id)imageForStyleAttributes:(id)a3 withStylesheetName:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  geo::read_write_lock *v15;
  const char *v16;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *v19;
  _BOOL4 v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **p_value__2;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  geo::read_write_lock *v25;
  const char *v26;
  double v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  const char *v35;
  geo::read_write_lock *v36;
  const char *v37;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *v38;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *v39;
  _BOOL4 v40;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **v41;
  size_t v42;
  void *v43;
  void **v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *allocator;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *v64;
  uint64_t v65;
  uint64_t v66;
  std::__shared_weak_count_vtbl *v67;
  std::__shared_weak_count *v68;
  std::__shared_weak_count_vtbl *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  char *v78;
  Allocator *v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t *v82;
  unint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  void *v87;
  uint64_t *v88;
  __int128 v89;
  unint64_t *v90;
  unint64_t v91;
  unint64_t *v92;
  geo::read_write_lock *v93;
  const char *v94;
  __int128 v95;
  std::__shared_weak_count_vtbl *v96;
  std::__shared_weak_count *v97;
  void *__dst[2];
  unint64_t v99;
  __int128 v100;
  pthread_rwlock_t *p_lock;
  __int128 v102;
  uint64_t (**v103)();
  id v104;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%f"), v13, a5);
  v103 = &off_1E42B5490;
  v104 = (id)objc_claimAutoreleasedReturnValue();
  v102 = 0uLL;
  __dst[0] = &self->_nameToStyleManagerLock;
  v15 = (geo::read_write_lock *)pthread_rwlock_rdlock(&self->_nameToStyleManagerLock._lock);
  if ((_DWORD)v15)
    geo::read_write_lock::logFailure(v15, (uint64_t)"read lock", v16);
  p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v19 = &self->_nameToStyleManager.__tree_.__pair1_;
    do
    {
      v20 = NSStringMapComparison::operator()((uint64_t)&left[2], (uint64_t)&v103);
      p_value__2 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)&left->__value__2;
      if (!v20)
      {
        p_value__2 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)left;
        v19 = left;
      }
      left = *p_value__2;
    }
    while (*p_value__2);
    if (v19 == p_pair1 || NSStringMapComparison::operator()((uint64_t)&v103, (uint64_t)&v19[2]))
    {
      v22 = 0;
      left = 0;
    }
    else
    {
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)v19[3].__value__2._allocator;
      v22 = (std::__shared_weak_count *)v19[4].__value_.__left_;
      if (v22)
      {
        p_shared_owners = (unint64_t *)&v22->__shared_owners_;
        do
          v24 = __ldxr(p_shared_owners);
        while (__stxr(v24 + 1, p_shared_owners));
      }
      *(_QWORD *)&v102 = left;
      *((_QWORD *)&v102 + 1) = v22;
    }
  }
  else
  {
    v22 = 0;
  }
  v25 = (geo::read_write_lock *)pthread_rwlock_unlock(&self->_nameToStyleManagerLock._lock);
  if ((_DWORD)v25)
    geo::read_write_lock::logFailure(v25, (uint64_t)"unlock", v26);
  if (left)
  {
    *(_QWORD *)&v95 = left;
    *((_QWORD *)&v95 + 1) = v22;
    if (!v22)
      goto LABEL_22;
    goto LABEL_20;
  }
  v34 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
  v30 = 0;
  if (!self->_stylesheetVendor.__ptr_)
    goto LABEL_42;
  v35 = (const char *)v34;
  if (!v34)
    goto LABEL_42;
  p_lock = &self->_nameToStyleManagerLock._lock;
  v36 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_nameToStyleManagerLock._lock);
  if ((_DWORD)v36)
    geo::read_write_lock::logFailure(v36, (uint64_t)"write lock", v37);
  v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)p_pair1->__value_.__left_;
  if (!p_pair1->__value_.__left_)
    goto LABEL_38;
  v39 = &self->_nameToStyleManager.__tree_.__pair1_;
  do
  {
    v40 = NSStringMapComparison::operator()((uint64_t)&v38[2], (uint64_t)&v103);
    v41 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)&v38->__value__2;
    if (!v40)
    {
      v41 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)v38;
      v39 = v38;
    }
    v38 = *v41;
  }
  while (*v41);
  if (v39 == p_pair1 || NSStringMapComparison::operator()((uint64_t)&v103, (uint64_t)&v39[2]))
  {
LABEL_38:
    v42 = strlen(v35);
    if (v42 >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v43 = (void *)v42;
    if (v42 >= 0x17)
    {
      v49 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v42 | 7) != 0x17)
        v49 = v42 | 7;
      v50 = v49 + 1;
      v44 = (void **)operator new(v49 + 1);
      __dst[1] = v43;
      v99 = v50 | 0x8000000000000000;
      __dst[0] = v44;
    }
    else
    {
      HIBYTE(v99) = v42;
      v44 = __dst;
      if (!v42)
        goto LABEL_52;
    }
    memmove(v44, v35, (size_t)v43);
LABEL_52:
    *((_BYTE *)v43 + (_QWORD)v44) = 0;
    gss::StyleManagerExtension::initWithName<gss::PropertyID>((gss::Allocator **)&v100, (uint64_t)__dst, 0, (uint64_t)self->_stylesheetVendor.__ptr_, a5);
    v51 = v100;
    v100 = 0uLL;
    v52 = (std::__shared_weak_count *)*((_QWORD *)&v102 + 1);
    v102 = v51;
    if (v52)
    {
      v53 = (unint64_t *)&v52->__shared_owners_;
      do
        v54 = __ldaxr(v53);
      while (__stlxr(v54 - 1, v53));
      if (!v54)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
    v55 = (std::__shared_weak_count *)*((_QWORD *)&v100 + 1);
    if (*((_QWORD *)&v100 + 1))
    {
      v56 = (unint64_t *)(*((_QWORD *)&v100 + 1) + 8);
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
    if (SHIBYTE(v99) < 0)
      operator delete(__dst[0]);
    v58 = *(_QWORD *)(v102 + 520);
    v59 = *(std::__shared_weak_count **)(v102 + 528);
    if (v59)
    {
      v60 = (unint64_t *)&v59->__shared_owners_;
      do
        v61 = __ldxr(v60);
      while (__stxr(v61 + 1, v60));
      do
        v62 = __ldaxr(v60);
      while (__stlxr(v62 - 1, v60));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
      }
    }
    if (!v58)
    {
      v66 = v102;
      v67 = (std::__shared_weak_count_vtbl *)operator new();
      gss::ClientStyleState<gss::PropertyID>::ClientStyleState((uint64_t)v67);
      std::shared_ptr<gss::ClientStyleState<gss::PropertyID>>::shared_ptr[abi:nn180100]<gss::ClientStyleState<gss::PropertyID>,void>(&v96, v67);
      v69 = v96;
      v68 = v97;
      if (v97)
      {
        v70 = (unint64_t *)&v97->__shared_owners_;
        do
          v71 = __ldxr(v70);
        while (__stxr(v71 + 1, v70));
      }
      *(_QWORD *)(v66 + 520) = v69;
      v72 = *(std::__shared_weak_count **)(v66 + 528);
      *(_QWORD *)(v66 + 528) = v68;
      if (v72)
      {
        v73 = (unint64_t *)&v72->__shared_owners_;
        do
          v74 = __ldaxr(v73);
        while (__stlxr(v74 - 1, v73));
        if (!v74)
        {
          ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
          std::__shared_weak_count::__release_weak(v72);
        }
      }
      v75 = v97;
      if (v97)
      {
        v76 = (unint64_t *)&v97->__shared_owners_;
        do
          v77 = __ldaxr(v76);
        while (__stlxr(v77 - 1, v76));
        if (!v77)
        {
          ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
          std::__shared_weak_count::__release_weak(v75);
        }
      }
    }
    if (*((_BYTE *)self->_iconManager.__ptr_ + 88))
      goto LABEL_111;
    allocator = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)p_pair1->__value_.__left_;
    if (p_pair1->__value_.__left_)
    {
      while (1)
      {
        while (1)
        {
          v64 = allocator;
          v65 = (uint64_t)&allocator[2];
          if (!NSStringMapComparison::operator()((uint64_t)&v103, (uint64_t)&allocator[2]))
            break;
          allocator = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)v64->__value_.__left_;
          p_pair1 = v64;
          if (!v64->__value_.__left_)
            goto LABEL_100;
        }
        if (!NSStringMapComparison::operator()(v65, (uint64_t)&v103))
          break;
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)&v64->__value__2;
        allocator = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)v64->__value__2._allocator;
        if (!allocator)
          goto LABEL_100;
      }
      v84 = (uint64_t)p_pair1->__value_.__left_;
      if (p_pair1->__value_.__left_)
      {
LABEL_103:
        v89 = v102;
        if (*((_QWORD *)&v102 + 1))
        {
          v90 = (unint64_t *)(*((_QWORD *)&v102 + 1) + 8);
          do
            v91 = __ldxr(v90);
          while (__stxr(v91 + 1, v90));
        }
        v22 = *(std::__shared_weak_count **)(v84 + 64);
        *(_OWORD *)(v84 + 56) = v89;
        if (v22)
        {
          v92 = (unint64_t *)&v22->__shared_owners_;
          do
            v83 = __ldaxr(v92);
          while (__stlxr(v83 - 1, v92));
          goto LABEL_109;
        }
        goto LABEL_111;
      }
    }
    else
    {
      v64 = &self->_nameToStyleManager.__tree_.__pair1_;
    }
LABEL_100:
    v84 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)self->_nameToStyleManager.__tree_.__pair1_.__value__2._allocator
                                                                   + 16))(self->_nameToStyleManager.__tree_.__pair1_.__value__2._allocator, 72, 8);
    *(_QWORD *)(v84 + 32) = &off_1E42B5490;
    *(_QWORD *)(v84 + 40) = 0;
    v85 = v104;
    v86 = *(void **)(v84 + 40);
    *(_QWORD *)(v84 + 40) = v85;

    *(_QWORD *)(v84 + 56) = 0;
    *(_QWORD *)(v84 + 64) = 0;
    *(_QWORD *)v84 = 0;
    *(_QWORD *)(v84 + 8) = 0;
    *(_QWORD *)(v84 + 16) = v64;
    p_pair1->__value_.__left_ = (void *)v84;
    v87 = *(void **)self->_nameToStyleManager.__tree_.__begin_node_;
    v88 = (uint64_t *)v84;
    if (v87)
    {
      self->_nameToStyleManager.__tree_.__begin_node_ = v87;
      v88 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_, v88);
    ++self->_nameToStyleManager.__tree_.__pair3_.__value_;
    goto LABEL_103;
  }
  v79 = v39[3].__value__2._allocator;
  v78 = (char *)v39[4].__value_.__left_;
  if (v78)
  {
    v80 = (unint64_t *)(v78 + 8);
    do
      v81 = __ldxr(v80);
    while (__stxr(v81 + 1, v80));
  }
  *(_QWORD *)&v102 = v79;
  *((_QWORD *)&v102 + 1) = v78;
  if (v22)
  {
    v82 = (unint64_t *)&v22->__shared_owners_;
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
LABEL_109:
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
LABEL_111:
  v93 = (geo::read_write_lock *)pthread_rwlock_unlock(p_lock);
  if ((_DWORD)v93)
    geo::read_write_lock::logFailure(v93, (uint64_t)"unlock", v94);
  v22 = (std::__shared_weak_count *)*((_QWORD *)&v102 + 1);
  v95 = v102;
  if (!*((_QWORD *)&v102 + 1))
    goto LABEL_22;
LABEL_20:
  v28 = (unint64_t *)&v22->__shared_owners_;
  do
    v29 = __ldxr(v28);
  while (__stxr(v29 + 1, v28));
LABEL_22:
  *(float *)&v27 = a5;
  -[VKInternalIconManager imageForStyleAttributes:styleManager:contentScale:sizeGroup:modifiers:](self, "imageForStyleAttributes:styleManager:contentScale:sizeGroup:modifiers:", v12, &v95, a6, v14, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (std::__shared_weak_count *)*((_QWORD *)&v95 + 1);
  if (*((_QWORD *)&v95 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v95 + 1) + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
LABEL_42:
  v45 = (std::__shared_weak_count *)*((_QWORD *)&v102 + 1);
  if (*((_QWORD *)&v102 + 1))
  {
    v46 = (unint64_t *)(*((_QWORD *)&v102 + 1) + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

  return v30;
}

- (id)imageForDataID:(unsigned int)a3 text:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  id v12;
  grl::Allocator *v13;
  grl::Allocator *v14;
  IconManager *v15;
  const char *v16;
  size_t v17;
  size_t v18;
  _BYTE *v19;
  id v20;
  IconManager *v21;
  const char *v22;
  size_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  IconManager *ptr;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v45;
  std::__shared_weak_count *v46;
  unint64_t *p_shared_owners;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  VKIconImage *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  id v65;
  std::__shared_weak_count *v66;
  void *__p[2];
  unint64_t v68;
  __int128 v69;
  int v70;
  char v71;
  int v72;
  __int16 v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  _BYTE __dst[176];
  __int128 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = (grl::Allocator *)a7;
  v79 = 0uLL;
  v70 = 1065353216;
  v71 = 4;
  v73 = -1;
  v72 = 0;
  v74 = 0;
  v76 = 0;
  v77 = 0;
  v75 = 0;
  v78 = grl::Allocator::instance(v13);
  grl::IconRequestOptions::setContentScale((float *)&v70, a5);
  v14 = (grl::Allocator *)grl::IconRequestOptions::setSizeGroup((uint64_t)&v70, +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", a6));
  if (!v12)
  {
    if (v13)
    {
      grl::IconRequestOptions::setVariant((uint64_t)&v70, -[grl::Allocator variant](v13, "variant"));
      grl::IconRequestOptions::setDataVariant((uint64_t)&v70, -[grl::Allocator secondaryVariant](v13, "secondaryVariant"));
      grl::IconRequestOptions::setCountryCode((uint64_t)&v70, -[grl::Allocator countryCode](v13, "countryCode"));
      grl::IconManager::imageForDataID((uint64_t)self->_iconManager.__ptr_, a3, (IconModifiers *)-[grl::Allocator cppModifiers](v13, "cppModifiers"), (float *)&v70, 0, __dst);
      v79 = *(_OWORD *)__dst;
      v20 = *(id *)__dst;
      if (!*(_QWORD *)__dst)
        goto LABEL_56;
      goto LABEL_48;
    }
    ptr = self->_iconManager.__ptr_;
    *(_QWORD *)__dst = 0;
    memset(&__dst[16], 0, 160);
    v81 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&__dst[8] = _D0;
    __dst[30] = 0;
    *(_QWORD *)&__dst[104] = grl::Allocator::instance(v14);
    memset(&__dst[112], 0, 56);
    *(_QWORD *)&__dst[88] = &__dst[96];
    v82 = 0;
    grl::IconManager::imageForDataID((uint64_t)ptr, a3, (IconModifiers *)__dst, (float *)&v70, 0, __p);
    v41 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    v79 = v41;
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)__dst);
    goto LABEL_47;
  }
  if (!v13)
  {
    v21 = self->_iconManager.__ptr_;
    v22 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    v23 = strlen(v22);
    if (v23 > 0x7FFFFFFFFFFFFFF7)
      abort();
    v24 = (void *)v23;
    if (v23 >= 0x17)
    {
      v42 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v23 | 7) != 0x17)
        v42 = v23 | 7;
      v43 = v42 + 1;
      v25 = operator new(v42 + 1);
      __p[1] = v24;
      v68 = v43 | 0x8000000000000000;
      __p[0] = v25;
    }
    else
    {
      HIBYTE(v68) = v23;
      v25 = __p;
      if (!v23)
      {
LABEL_34:
        *((_BYTE *)v24 + (_QWORD)v25) = 0;
        *(_QWORD *)__dst = 0;
        memset(&__dst[16], 0, 160);
        v82 = 0;
        v81 = 0u;
        __asm { FMOV            V0.2S, #1.0 }
        *(_QWORD *)&__dst[8] = _D0;
        __dst[30] = 0;
        *(_QWORD *)&__dst[104] = grl::Allocator::instance((grl::Allocator *)v23);
        memset(&__dst[112], 0, 56);
        *(_QWORD *)&__dst[88] = &__dst[96];
        v82 = 0;
        grl::IconManager::imageForDataIDAndText((uint64_t)v21, a3, (char *)__p, (IconModifiers *)__dst, (float *)&v70, 0, &v69);
        v45 = v69;
        v69 = 0uLL;
        v46 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
        v79 = v45;
        if (v46)
        {
          p_shared_owners = (unint64_t *)&v46->__shared_owners_;
          do
            v48 = __ldaxr(p_shared_owners);
          while (__stlxr(v48 - 1, p_shared_owners));
          if (!v48)
          {
            ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
            std::__shared_weak_count::__release_weak(v46);
          }
        }
        v49 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
        if (*((_QWORD *)&v69 + 1))
        {
          v50 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
          do
            v51 = __ldaxr(v50);
          while (__stlxr(v51 - 1, v50));
          if (!v51)
          {
            ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
            std::__shared_weak_count::__release_weak(v49);
          }
        }
        grl::IconModifiers::~IconModifiers((grl::IconModifiers *)__dst);
        if (SHIBYTE(v68) < 0)
          operator delete(__p[0]);
        goto LABEL_47;
      }
    }
    v23 = (size_t)memmove(v25, v22, (size_t)v24);
    goto LABEL_34;
  }
  grl::IconRequestOptions::setVariant((uint64_t)&v70, -[grl::Allocator variant](v13, "variant"));
  grl::IconRequestOptions::setDataVariant((uint64_t)&v70, -[grl::Allocator secondaryVariant](v13, "secondaryVariant"));
  grl::IconRequestOptions::setCountryCode((uint64_t)&v70, -[grl::Allocator countryCode](v13, "countryCode"));
  v15 = self->_iconManager.__ptr_;
  v16 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  v17 = strlen(v16);
  if (v17 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v18 = v17;
  if (v17 >= 0x17)
  {
    v26 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v26 = v17 | 7;
    v27 = v26 + 1;
    v19 = operator new(v26 + 1);
    *(_QWORD *)&__dst[8] = v18;
    *(_QWORD *)&__dst[16] = v27 | 0x8000000000000000;
    *(_QWORD *)__dst = v19;
    goto LABEL_17;
  }
  __dst[23] = v17;
  v19 = __dst;
  if (v17)
LABEL_17:
    memmove(v19, v16, v18);
  v19[v18] = 0;
  grl::IconManager::imageForDataIDAndText((uint64_t)v15, a3, __dst, (IconModifiers *)-[grl::Allocator cppModifiers](v13, "cppModifiers"), (float *)&v70, 0, __p);
  v28 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  v29 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
  v79 = v28;
  if (v29)
  {
    v30 = (unint64_t *)&v29->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = (std::__shared_weak_count *)__p[1];
  if (!__p[1])
    goto LABEL_27;
  v33 = (unint64_t *)((char *)__p[1] + 8);
  do
    v34 = __ldaxr(v33);
  while (__stlxr(v34 - 1, v33));
  if (v34)
  {
LABEL_27:
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_47;
    goto LABEL_28;
  }
  ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
  std::__shared_weak_count::__release_weak(v32);
  if ((__dst[23] & 0x80000000) != 0)
LABEL_28:
    operator delete(*(void **)__dst);
LABEL_47:
  v20 = (id)v79;
  if (!(_QWORD)v79)
    goto LABEL_56;
LABEL_48:
  v52 = [VKIconImage alloc];
  v65 = v20;
  v66 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
  if (*((_QWORD *)&v79 + 1))
  {
    v53 = (unint64_t *)(*((_QWORD *)&v79 + 1) + 8);
    do
      v54 = __ldxr(v53);
    while (__stxr(v54 + 1, v53));
  }
  v20 = -[VKIconImage init:](v52, "init:", &v65);
  v55 = v66;
  if (v66)
  {
    v56 = (unint64_t *)&v66->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
LABEL_56:
  v58 = v75;
  if (v75)
  {
    v59 = v76;
    v60 = v75;
    if (v76 != v75)
    {
      do
      {
        if (*(char *)(v59 - 1) < 0)
          operator delete(*(void **)(v59 - 24));
        v59 -= 24;
      }
      while (v59 != v58);
      v60 = v75;
    }
    v76 = v58;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v78 + 40))(v78, v60, v77 - v60);
  }
  v61 = (std::__shared_weak_count *)*((_QWORD *)&v79 + 1);
  if (*((_QWORD *)&v79 + 1))
  {
    v62 = (unint64_t *)(*((_QWORD *)&v79 + 1) + 8);
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }

  return v20;
}

- (id)imageForKey:(unsigned int)a3 value:(unsigned int)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  grl::Allocator *v12;
  grl::Allocator *v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  VKIconImage *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v35;
  std::__shared_weak_count *v36;
  __int128 v37;
  int v38;
  char v39;
  int v40;
  __int16 v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[5];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = (grl::Allocator *)a7;
  v47 = 0uLL;
  v38 = 1065353216;
  v39 = 4;
  v41 = -1;
  v40 = 0;
  v42 = 0;
  v44 = 0;
  v45 = 0;
  v43 = 0;
  v46 = grl::Allocator::instance(v12);
  grl::IconRequestOptions::setContentScale((float *)&v38, a5);
  v13 = (grl::Allocator *)grl::IconRequestOptions::setSizeGroup((uint64_t)&v38, +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", a6));
  if (!v12)
  {
    *(_QWORD *)&v48 = 0;
    v49 = 0u;
    memset(v55, 0, sizeof(v55));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    *((_QWORD *)&v48 + 1) = _D0;
    BYTE14(v49) = 0;
    v54 = 0uLL;
    *((_QWORD *)&v54 + 1) = grl::Allocator::instance(v13);
    memset(v55, 0, 56);
    *((_QWORD *)&v53 + 1) = &v54;
    v56 = 0;
    grl::IconManager::imageForKeyValue((uint64_t)self->_iconManager.__ptr_, a3, a4, (const grl::IconModifiers *)&v48, (float *)&v38, 0, &v37);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
    v15 = v37;
    v47 = v37;
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&v48);
    if (v15)
      goto LABEL_3;
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  grl::IconRequestOptions::setVariant((uint64_t)&v38, -[grl::Allocator variant](v12, "variant"));
  grl::IconRequestOptions::setDataVariant((uint64_t)&v38, -[grl::Allocator secondaryVariant](v12, "secondaryVariant"));
  grl::IconRequestOptions::setCountryCode((uint64_t)&v38, -[grl::Allocator countryCode](v12, "countryCode"));
  grl::IconManager::imageForKeyValue((uint64_t)self->_iconManager.__ptr_, a3, a4, (const grl::IconModifiers *)-[grl::Allocator cppModifiers](v12, "cppModifiers"), (float *)&v38, 0, &v48);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v48 + 1);
  v15 = v48;
  v47 = v48;
  if (!(_QWORD)v48)
    goto LABEL_12;
LABEL_3:
  v16 = [VKIconImage alloc];
  v35 = v15;
  v36 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  v19 = -[VKIconImage init:](v16, "init:", &v35);
  v20 = v36;
  if (v36)
  {
    v21 = (unint64_t *)&v36->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_13:
  v28 = v43;
  if (v43)
  {
    v29 = v44;
    v30 = v43;
    if (v44 != v43)
    {
      do
      {
        if (*(char *)(v29 - 1) < 0)
          operator delete(*(void **)(v29 - 24));
        v29 -= 24;
      }
      while (v29 != v28);
      v30 = v43;
    }
    v44 = v28;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v46 + 40))(v46, v30, v45 - v30);
  }
  v31 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
  if (*((_QWORD *)&v47 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

  return v19;
}

- (id)imageForName:(id)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  id v10;
  grl::Allocator *v11;
  grl::Allocator *v12;
  IconManager *v13;
  const char *v14;
  size_t v15;
  size_t v16;
  _BYTE *v17;
  id v18;
  IconManager *ptr;
  const char *v20;
  size_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  VKIconImage *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  id v61;
  std::__shared_weak_count *v62;
  void *__p[2];
  unint64_t v64;
  __int128 v65;
  int v66;
  char v67;
  int v68;
  __int16 v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  _BYTE __dst[176];
  __int128 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (grl::Allocator *)a6;
  v12 = v11;
  if (!v10)
  {
    v18 = 0;
    goto LABEL_66;
  }
  v75 = 0uLL;
  v66 = 1065353216;
  v67 = 4;
  v69 = -1;
  v68 = 0;
  v70 = 0;
  v72 = 0;
  v73 = 0;
  v71 = 0;
  v74 = grl::Allocator::instance(v11);
  grl::IconRequestOptions::setContentScale((float *)&v66, a4);
  grl::IconRequestOptions::setSizeGroup((uint64_t)&v66, +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", a5));
  if (!v12)
  {
    ptr = self->_iconManager.__ptr_;
    v20 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    v21 = strlen(v20);
    if (v21 > 0x7FFFFFFFFFFFFFF7)
      abort();
    v22 = (void *)v21;
    if (v21 >= 0x17)
    {
      v34 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v21 | 7) != 0x17)
        v34 = v21 | 7;
      v35 = v34 + 1;
      v23 = operator new(v34 + 1);
      __p[1] = v22;
      v64 = v35 | 0x8000000000000000;
      __p[0] = v23;
    }
    else
    {
      HIBYTE(v64) = v21;
      v23 = __p;
      if (!v21)
      {
LABEL_31:
        *((_BYTE *)v22 + (_QWORD)v23) = 0;
        *(_QWORD *)__dst = 0;
        memset(&__dst[16], 0, 160);
        v78 = 0;
        v77 = 0u;
        __asm { FMOV            V0.2S, #1.0 }
        *(_QWORD *)&__dst[8] = _D0;
        __dst[30] = 0;
        *(_QWORD *)&__dst[104] = grl::Allocator::instance((grl::Allocator *)v21);
        memset(&__dst[112], 0, 56);
        *(_QWORD *)&__dst[88] = &__dst[96];
        v78 = 0;
        grl::IconManager::imageForName((uint64_t)ptr, (uint64_t)__p, (IconModifiers *)__dst, (float *)&v66, 0, &v65);
        v41 = v65;
        v65 = 0uLL;
        v42 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
        v75 = v41;
        if (v42)
        {
          p_shared_owners = (unint64_t *)&v42->__shared_owners_;
          do
            v44 = __ldaxr(p_shared_owners);
          while (__stlxr(v44 - 1, p_shared_owners));
          if (!v44)
          {
            ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
            std::__shared_weak_count::__release_weak(v42);
          }
        }
        v45 = (std::__shared_weak_count *)*((_QWORD *)&v65 + 1);
        if (*((_QWORD *)&v65 + 1))
        {
          v46 = (unint64_t *)(*((_QWORD *)&v65 + 1) + 8);
          do
            v47 = __ldaxr(v46);
          while (__stlxr(v47 - 1, v46));
          if (!v47)
          {
            ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
            std::__shared_weak_count::__release_weak(v45);
          }
        }
        grl::IconModifiers::~IconModifiers((grl::IconModifiers *)__dst);
        if ((SHIBYTE(v64) & 0x80000000) == 0)
          goto LABEL_44;
        v33 = __p[0];
        goto LABEL_43;
      }
    }
    v21 = (size_t)memmove(v23, v20, (size_t)v22);
    goto LABEL_31;
  }
  grl::IconRequestOptions::setVariant((uint64_t)&v66, -[grl::Allocator variant](v12, "variant"));
  grl::IconRequestOptions::setDataVariant((uint64_t)&v66, -[grl::Allocator secondaryVariant](v12, "secondaryVariant"));
  grl::IconRequestOptions::setCountryCode((uint64_t)&v66, -[grl::Allocator countryCode](v12, "countryCode"));
  v13 = self->_iconManager.__ptr_;
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  v15 = strlen(v14);
  if (v15 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v16 = v15;
  if (v15 >= 0x17)
  {
    v24 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v24 = v15 | 7;
    v25 = v24 + 1;
    v17 = operator new(v24 + 1);
    *(_QWORD *)&__dst[8] = v16;
    *(_QWORD *)&__dst[16] = v25 | 0x8000000000000000;
    *(_QWORD *)__dst = v17;
  }
  else
  {
    __dst[23] = v15;
    v17 = __dst;
    if (!v15)
      goto LABEL_16;
  }
  memmove(v17, v14, v16);
LABEL_16:
  v17[v16] = 0;
  grl::IconManager::imageForName((uint64_t)v13, (uint64_t)__dst, (IconModifiers *)-[grl::Allocator cppModifiers](v12, "cppModifiers"), (float *)&v66, 0, __p);
  v26 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  v27 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
  v75 = v26;
  if (v27)
  {
    v28 = (unint64_t *)&v27->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v31 = (unint64_t *)((char *)__p[1] + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
      if ((__dst[23] & 0x80000000) == 0)
        goto LABEL_44;
      goto LABEL_26;
    }
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
LABEL_26:
    v33 = *(void **)__dst;
LABEL_43:
    operator delete(v33);
  }
LABEL_44:
  v18 = (id)v75;
  if ((_QWORD)v75)
  {
    v48 = [VKIconImage alloc];
    v61 = v18;
    v62 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
    if (*((_QWORD *)&v75 + 1))
    {
      v49 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
      do
        v50 = __ldxr(v49);
      while (__stxr(v50 + 1, v49));
    }
    v18 = -[VKIconImage init:](v48, "init:", &v61);
    v51 = v62;
    if (v62)
    {
      v52 = (unint64_t *)&v62->__shared_owners_;
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
  }
  v54 = v71;
  if (v71)
  {
    v55 = v72;
    v56 = v71;
    if (v72 != v71)
    {
      do
      {
        if (*(char *)(v55 - 1) < 0)
          operator delete(*(void **)(v55 - 24));
        v55 -= 24;
      }
      while (v55 != v54);
      v56 = v71;
    }
    v72 = v54;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v74 + 40))(v74, v56, v73 - v56);
  }
  v57 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
  if (*((_QWORD *)&v75 + 1))
  {
    v58 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
LABEL_66:

  return v18;
}

- (id)imageForIconID:(unsigned int)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  grl::Allocator *v10;
  grl::Allocator *v11;
  IconManager *v12;
  grl::Allocator *v13;
  std::__shared_weak_count *v14;
  _QWORD **v15;
  VKIconImage *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  IconManager *ptr;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  _QWORD **v36;
  std::__shared_weak_count *v37;
  _QWORD **v38;
  _QWORD *v39[3];
  _QWORD **v40;
  std::__shared_weak_count *v41;
  int v42;
  char v43;
  int v44;
  __int16 v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD **v51;
  std::__shared_weak_count *v52;
  _BYTE v53[176];
  __int128 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = (grl::Allocator *)a6;
  v51 = 0;
  v52 = 0;
  v42 = 1065353216;
  v43 = 4;
  v45 = -1;
  v44 = 0;
  v46 = 0;
  v48 = 0;
  v49 = 0;
  v47 = 0;
  v50 = grl::Allocator::instance(v10);
  grl::IconRequestOptions::setContentScale((float *)&v42, a4);
  v11 = (grl::Allocator *)grl::IconRequestOptions::setSizeGroup((uint64_t)&v42, +[VKInternalIconManager convertSizeGroup:](VKInternalIconManager, "convertSizeGroup:", a5));
  if (!v10)
  {
    *(_QWORD *)v53 = 0;
    memset(&v53[16], 0, 160);
    v54 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&v53[8] = _D0;
    v53[30] = 0;
    *(_QWORD *)&v53[104] = grl::Allocator::instance(v11);
    memset(&v53[112], 0, 56);
    *(_QWORD *)&v53[88] = &v53[96];
    v55 = 0;
    ptr = self->_iconManager.__ptr_;
    v39[0] = 0;
    v39[1] = (_QWORD *)grl::Allocator::instance(*(grl::Allocator **)&v53[104]);
    v39[2] = 0;
    v38 = v39;
    grl::IconManager::imageForIconID((uint64_t)ptr, a3, (IconModifiers *)v53, (uint64_t)&v42, &v38, 0, &v40);
    v15 = v40;
    v14 = v41;
    v40 = 0;
    v41 = 0;
    v51 = v15;
    v52 = v14;
    std::__tree<std::__value_type<unsigned short,grl::ImageData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,grl::ImageData>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,grl::ImageData>,grl::Allocator>>::destroy((uint64_t)&v38, v39[0]);
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)v53);
    if (v15)
      goto LABEL_3;
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  grl::IconRequestOptions::setVariant((uint64_t)&v42, -[grl::Allocator variant](v10, "variant"));
  grl::IconRequestOptions::setDataVariant((uint64_t)&v42, -[grl::Allocator secondaryVariant](v10, "secondaryVariant"));
  grl::IconRequestOptions::setCountryCode((uint64_t)&v42, -[grl::Allocator countryCode](v10, "countryCode"));
  v12 = self->_iconManager.__ptr_;
  v13 = (grl::Allocator *)-[grl::Allocator cppModifiers](v10, "cppModifiers");
  *(_QWORD *)&v53[8] = 0;
  *(_OWORD *)&v53[16] = (unint64_t)grl::Allocator::instance(v13);
  *(_QWORD *)v53 = &v53[8];
  grl::IconManager::imageForIconID((uint64_t)v12, a3, (IconModifiers *)v13, (uint64_t)&v42, v53, 0, &v38);
  v15 = v38;
  v14 = (std::__shared_weak_count *)v39[0];
  v38 = 0;
  v39[0] = 0;
  v51 = v15;
  v52 = v14;
  std::__tree<std::__value_type<unsigned short,grl::ImageData>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,grl::ImageData>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,grl::ImageData>,grl::Allocator>>::destroy((uint64_t)v53, *(_QWORD **)&v53[8]);
  if (!v15)
    goto LABEL_12;
LABEL_3:
  v16 = [VKIconImage alloc];
  v36 = v15;
  v37 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  v19 = -[VKIconImage init:](v16, "init:", &v36);
  v20 = v37;
  if (v37)
  {
    v21 = (unint64_t *)&v37->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_13:
  v29 = v47;
  if (v47)
  {
    v30 = v48;
    v31 = v47;
    if (v48 != v47)
    {
      do
      {
        if (*(char *)(v30 - 1) < 0)
          operator delete(*(void **)(v30 - 24));
        v30 -= 24;
      }
      while (v30 != v29);
      v31 = v47;
    }
    v48 = v29;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v50 + 40))(v50, v31, v49 - v31);
  }
  v32 = v52;
  if (v52)
  {
    v33 = (unint64_t *)&v52->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  return v19;
}

- (unsigned)styleAttributeTransitTypeKey
{
  return 37;
}

- (unsigned)styleAttributeTransitSystemTypeKey
{
  return 49;
}

- (unsigned)trafficIncidentTypeKey
{
  return 65544;
}

- (unsigned)darkVariant
{
  return 3;
}

- (BOOL)isCachingAtlases
{
  IconManager *ptr;

  ptr = self->_iconManager.__ptr_;
  return ptr && *((_BYTE *)ptr + 88) == 0;
}

- (void)setIsCachingAtlases:(BOOL)a3
{
  *((_BYTE *)self->_iconManager.__ptr_ + 88) = !a3;
}

- (void)dealloc
{
  objc_super v3;

  -[VKInternalIconManager purge](self, "purge");
  v3.receiver = self;
  v3.super_class = (Class)VKInternalIconManager;
  -[VKInternalIconManager dealloc](&v3, sel_dealloc);
}

- (void)purge
{
  IconManager *ptr;

  ptr = self->_iconManager.__ptr_;
  if (ptr)
    grl::IconManager::removeAllPacks((grl::IconManager *)ptr);
  -[VKInternalIconManager _purgeStyleManagers](self, "_purgeStyleManagers");
}

- (void)purgeNonsharedResources
{
  StylesheetVendor *ptr;

  if (!self->_isSharedIconManager)
  {
    -[VKInternalIconManager purge](self, "purge");
    ptr = self->_stylesheetVendor.__ptr_;
    if (ptr)
      md::StylesheetVendor::resetStylesheetCache((os_unfair_lock_s *)ptr);
  }
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  geo::read_write_lock *v9;
  const char *v10;
  __shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;

  cntrl = self->_fontManager.__cntrl_;
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
    v6 = self->_resourceProvider.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  else
  {
LABEL_5:
    v6 = self->_resourceProvider.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  v7 = (unint64_t *)((char *)v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v6 + 16))(v6, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
LABEL_11:
  self->_resourceManager._vptr$_retain_ptr = (void **)&off_1E42B4D10;

  self->_manifestTileGroupObserverProxy._vptr$_retain_ptr = (void **)&off_1E42B5270;
  std::__tree<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,std::__map_value_compare<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,NSStringMapComparison,true>,geo::StdAllocator<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,mdm::Allocator>>::destroy((uint64_t)&self->_nameToStyleManager, (uint64_t)self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_);
  v9 = (geo::read_write_lock *)pthread_rwlock_destroy(&self->_nameToStyleManagerLock._lock);
  if ((_DWORD)v9)
    geo::read_write_lock::logFailure(v9, (uint64_t)"destruction", v10);
  v11 = self->_stylesheetVendor.__cntrl_;
  if (!v11)
    goto LABEL_17;
  v12 = (unint64_t *)((char *)v11 + 8);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (!v13)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v11 + 16))(v11);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v11);
    v14 = self->_iconManager.__cntrl_;
    if (!v14)
      return;
  }
  else
  {
LABEL_17:
    v14 = self->_iconManager.__cntrl_;
    if (!v14)
      return;
  }
  v15 = (unint64_t *)((char *)v14 + 8);
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (!v16)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v14 + 16))(v14);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v14);
  }
}

- (uint64_t)_startTileGroupObserver
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)_startTileGroupObserver
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7BC8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

+ (unsigned)convertSizeGroup:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xA)
    return 4;
  else
    return a3;
}

@end
