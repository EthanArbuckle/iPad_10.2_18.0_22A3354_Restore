@implementation VKManifestTileGroupObserverProxy

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (void)setDidChangeActiveTileGroup:(function<void (GEOResourceManifestManager *)
{
  objc_copyCppObjectAtomic(&self->_didChangeActiveTileGroup, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__5);
}

- (VKManifestTileGroupObserverProxy)initWithQueue:(id)a3
{
  id v4;
  VKManifestTileGroupObserverProxy *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKManifestTileGroupObserverProxy;
  v5 = -[VKManifestTileGroupObserverProxy init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTileGroupObserver:queue:", v5, v4);

    objc_msgSend(MEMORY[0x1E0D270A0], "sharedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addExperimentObserver:queue:", v5, v4);

  }
  return v5;
}

- (void)setWillChangeActiveTileGroup:(function<void (GEOResourceManifestManager *)
{
  objc_copyCppObjectAtomic(&self->_willChangeActiveTileGroup, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (void)setExperimentConfigurationDidChange:(function<void (GEOExperimentConfiguration *)
{
  objc_copyCppObjectAtomic(&self->_experimentConfigurationDidChange, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__7);
}

- (void)dealloc
{
  function<void (GEOResourceManifestManager *)> *p_willChangeActiveTileGroup;
  function<void (GEOResourceManifestManager *)> *f;
  uint64_t v5;
  VKManifestTileGroupObserverProxy *p_didChangeActiveTileGroup;
  uint64_t v7;
  VKManifestTileGroupObserverProxy *p_experimentConfigurationDidChange;
  uint64_t v9;
  void *v10;
  objc_super v11;

  p_willChangeActiveTileGroup = &self->_willChangeActiveTileGroup;
  f = (function<void (GEOResourceManifestManager *)> *)self->_willChangeActiveTileGroup.__f_.__f_;
  self->_willChangeActiveTileGroup.__f_.__f_ = 0;
  if (f == p_willChangeActiveTileGroup)
  {
    v5 = 4;
    f = p_willChangeActiveTileGroup;
  }
  else
  {
    if (!f)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
LABEL_6:
  p_didChangeActiveTileGroup = (VKManifestTileGroupObserverProxy *)self->_didChangeActiveTileGroup.__f_.__f_;
  self->_didChangeActiveTileGroup.__f_.__f_ = 0;
  if (p_didChangeActiveTileGroup == (VKManifestTileGroupObserverProxy *)&self->_didChangeActiveTileGroup)
  {
    v7 = 4;
    p_didChangeActiveTileGroup = (VKManifestTileGroupObserverProxy *)&self->_didChangeActiveTileGroup;
  }
  else
  {
    if (!p_didChangeActiveTileGroup)
      goto LABEL_11;
    v7 = 5;
  }
  (*((void (**)(void))p_didChangeActiveTileGroup->super.isa + v7))();
LABEL_11:
  p_experimentConfigurationDidChange = (VKManifestTileGroupObserverProxy *)self->_experimentConfigurationDidChange.__f_.__f_;
  self->_experimentConfigurationDidChange.__f_.__f_ = 0;
  if (p_experimentConfigurationDidChange == (VKManifestTileGroupObserverProxy *)&self->_experimentConfigurationDidChange)
  {
    v9 = 4;
    p_experimentConfigurationDidChange = (VKManifestTileGroupObserverProxy *)&self->_experimentConfigurationDidChange;
    goto LABEL_15;
  }
  if (p_experimentConfigurationDidChange)
  {
    v9 = 5;
LABEL_15:
    (*((void (**)(void))p_experimentConfigurationDidChange->super.isa + v9))();
  }
  objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeTileGroupObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)VKManifestTileGroupObserverProxy;
  -[VKManifestTileGroupObserverProxy dealloc](&v11, sel_dealloc);
}

- (void)resourceManifestManagerWillChangeActiveTileGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *f;
  _BYTE v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_willChangeActiveTileGroup.__f_.__f_)
    goto LABEL_8;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v7 = 134217984;
    *(_QWORD *)&v7[4] = self;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[observer:%p] Received WillChangeActiveTileGroup Notification", v7, 0xCu);
  }

  *(_QWORD *)v7 = v4;
  f = self->_willChangeActiveTileGroup.__f_.__f_;
  if (f)
  {
    (*(void (**)(void *, _BYTE *))(*(_QWORD *)f + 48))(f, v7);

LABEL_8:
    return;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *f;
  id v13;
  id v14;
  _BYTE buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_didChangeActiveTileGroup.__f_.__f_)
    goto LABEL_8;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v11 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_19F029000, v11, OS_LOG_TYPE_INFO, "[observer:%p] Received DidChangeActiveTileGroup Notification", buf, 0xCu);
  }

  *(_QWORD *)buf = v8;
  v14 = v9;
  v13 = v10;
  f = self->_didChangeActiveTileGroup.__f_.__f_;
  if (f)
  {
    (*(void (**)(void *, _BYTE *, id *, id *))(*(_QWORD *)f + 48))(f, buf, &v14, &v13);

LABEL_8:
    return;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)experimentConfigurationDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *f;
  _BYTE v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_experimentConfigurationDidChange.__f_.__f_)
    goto LABEL_8;
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v7 = 134217984;
    *(_QWORD *)&v7[4] = self;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "[observer:%p] Received ExperimentalConfigurationDidChange Notification", v7, 0xCu);
  }

  *(_QWORD *)v7 = v4;
  f = self->_experimentConfigurationDidChange.__f_.__f_;
  if (f)
  {
    (*(void (**)(void *, _BYTE *))(*(_QWORD *)f + 48))(f, v7);

LABEL_8:
    return;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (function<void)willChangeActiveTileGroup
{
  function<void (GEOResourceManifestManager *)> *result;

  objc_copyCppObjectAtomic(retstr, &self->_willChangeActiveTileGroup, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (function<void)didChangeActiveTileGroup
{
  function<void (GEOResourceManifestManager *, GEOActiveTileGroup *, GEOActiveTileGroup *)> *result;

  objc_copyCppObjectAtomic(retstr, &self->_didChangeActiveTileGroup, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__4);
  return result;
}

- (function<void)experimentConfigurationDidChange
{
  function<void (GEOExperimentConfiguration *)> *result;

  objc_copyCppObjectAtomic(retstr, &self->_experimentConfigurationDidChange, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__6);
  return result;
}

- (void).cxx_destruct
{
  function<void (GEOExperimentConfiguration *)> *p_experimentConfigurationDidChange;
  function<void (GEOExperimentConfiguration *)> *f;
  uint64_t v5;
  VKManifestTileGroupObserverProxy *p_didChangeActiveTileGroup;
  uint64_t v7;
  VKManifestTileGroupObserverProxy *p_willChangeActiveTileGroup;
  uint64_t v9;

  p_experimentConfigurationDidChange = &self->_experimentConfigurationDidChange;
  f = (function<void (GEOExperimentConfiguration *)> *)self->_experimentConfigurationDidChange.__f_.__f_;
  if (f == p_experimentConfigurationDidChange)
  {
    v5 = 4;
    f = p_experimentConfigurationDidChange;
  }
  else
  {
    if (!f)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
LABEL_6:
  p_didChangeActiveTileGroup = (VKManifestTileGroupObserverProxy *)self->_didChangeActiveTileGroup.__f_.__f_;
  if (p_didChangeActiveTileGroup == (VKManifestTileGroupObserverProxy *)&self->_didChangeActiveTileGroup)
  {
    v7 = 4;
    p_didChangeActiveTileGroup = (VKManifestTileGroupObserverProxy *)&self->_didChangeActiveTileGroup;
  }
  else
  {
    if (!p_didChangeActiveTileGroup)
      goto LABEL_11;
    v7 = 5;
  }
  (*((void (**)(void))p_didChangeActiveTileGroup->super.isa + v7))();
LABEL_11:
  p_willChangeActiveTileGroup = (VKManifestTileGroupObserverProxy *)self->_willChangeActiveTileGroup.__f_.__f_;
  if (p_willChangeActiveTileGroup == (VKManifestTileGroupObserverProxy *)&self->_willChangeActiveTileGroup)
  {
    v9 = 4;
    p_willChangeActiveTileGroup = (VKManifestTileGroupObserverProxy *)&self->_willChangeActiveTileGroup;
  }
  else
  {
    if (!p_willChangeActiveTileGroup)
      return;
    v9 = 5;
  }
  (*((void (**)(void))p_willChangeActiveTileGroup->super.isa + v9))();
}

@end
