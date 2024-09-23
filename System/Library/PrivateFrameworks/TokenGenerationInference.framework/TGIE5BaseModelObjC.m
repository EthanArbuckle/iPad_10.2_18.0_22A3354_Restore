@implementation TGIE5BaseModelObjC

- (TGIE5BaseModelObjC)initWithModelConfiguration:(id)a3
{
  id v4;
  TGIE5BaseModelObjC *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *modelURL;
  os_log_t v10;
  OS_os_log *log;
  TGIE5ANESessionObjC *v12;
  NSURL *v13;
  uint64_t v14;
  void *v15;
  TGIE5ANESessionObjC *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TGIE5BaseModelObjC;
  v5 = -[TGIE5BaseModelObjC init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "modelBundlePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v8;

    v10 = os_log_create("com.apple.tokengenerationinference", "E5LanguageModel");
    log = v5->_log;
    v5->_log = (OS_os_log *)v10;

    v5->_useEnergyEfficientMode = objc_msgSend(v4, "useEnergyEfficientMode");
    v12 = [TGIE5ANESessionObjC alloc];
    v13 = v5->_modelURL;
    v14 = objc_msgSend(v4, "useEnergyEfficientMode");
    objc_msgSend(v4, "assetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TGIE5ANESessionObjC initWithResourceURL:useEnergyEfficientMode:assetIdentifier:](v12, "initWithResourceURL:useEnergyEfficientMode:assetIdentifier:", v13, v14, v15);
    -[TGIE5BaseModelObjC setAneSession:](v5, "setAneSession:", v16);

  }
  return v5;
}

- (BOOL)load:(id *)a3
{
  OS_os_log *v4;
  void *v5;
  void *v6;
  id v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  std::string buf;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = self->_log;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
  {
    -[TGIE5BaseModelObjC modelURL](self, "modelURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl(&dword_248CAA000, (os_log_t)v4, OS_LOG_TYPE_INFO, "Loading base model with model : %@", (uint8_t *)&buf, 0xCu);

  }
  -[TGIE5BaseModelObjC modelURL](self, "modelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (char *)objc_msgSend(v7, "UTF8String");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v15);
  cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase::create(&buf, &v16);
  v17 = v16;
  if (v16)
  {
    v8 = (std::__shared_weak_count *)operator new();
    v9 = v16;
    v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_2519DE660;
    v8->__shared_owners_ = 0;
    v8->__shared_weak_owners_ = 0;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  }
  else
  {
    v8 = 0;
  }
  v18 = v8;
  v16 = 0;
  -[TGIE5BaseModelObjC setBaseModel:](self, "setBaseModel:", &v17);
  v10 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  std::unique_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase>::reset[abi:ne180100](&v16, 0);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);

  -[TGIE5BaseModelObjC aneSession](self, "aneSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");

  return 1;
}

- (unordered_map<std::string,)sharedConstants
{
  unordered_map<std::string, std::shared_ptr<E5RT::MemoryObject>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::shared_ptr<E5RT::MemoryObject>>>> *result;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase *v8;
  std::__shared_weak_count *v9;

  -[TGIE5BaseModelObjC baseModel](self, "baseModel");
  cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase::getSharedConstants(v8, (uint64_t)retstr);
  v5 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return result;
}

- (void)moveToDynamicState
{
  id v2;

  -[TGIE5BaseModelObjC aneSession](self, "aneSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)moveToFullyLoadedState
{
  id v2;

  -[TGIE5BaseModelObjC aneSession](self, "aneSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (shared_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase>)baseModel
{
  void *v2;
  AJAXE5MLModelBase *v3;
  __shared_weak_count *v4;
  shared_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase> result;

  objc_copyCppObjectAtomic(v2, &self->_baseModel, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setBaseModel:(shared_ptr<cgm::token_generation_inference::espresso_inference::AJAXE5MLModelBase>)a3
{
  objc_copyCppObjectAtomic(&self->_baseModel, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (BOOL)useEnergyEfficientMode
{
  return self->_useEnergyEfficientMode;
}

- (TGIE5ANESessionObjC)aneSession
{
  return (TGIE5ANESessionObjC *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAneSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  std::shared_ptr<E5RT::ExecutionStreamOperation>::~shared_ptr[abi:ne180100]((uint64_t)&self->_baseModel);
  objc_storeStrong((id *)&self->_aneSession, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

- (void)load:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t (*v3)(uint64_t);
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16);
  v4 = a2;
  v5 = 136315138;
  v6 = v3(a1);
  _os_log_error_impl(&dword_248CAA000, v4, OS_LOG_TYPE_ERROR, "Failed to load model: %s.", (uint8_t *)&v5, 0xCu);

}

@end
