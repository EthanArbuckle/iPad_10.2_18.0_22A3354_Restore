@implementation PVLivePlayerThermalThrottlingPolicy

- (PVLivePlayerThermalThrottlingPolicy)init
{
  PVLivePlayerThermalThrottlingPolicy *v2;
  HGSynchronizable *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PVLivePlayerThermalThrottlingPolicy;
  v2 = -[PVLivePlayerThermalThrottlingPolicy init](&v5, sel_init);
  if (v2)
  {
    v3 = (HGSynchronizable *)operator new();
    HGSynchronizable::HGSynchronizable(v3);
    v2->_lock = v3;
  }
  return v2;
}

- (void)dealloc
{
  HGSynchronizable *lock;
  objc_super v4;

  lock = self->_lock;
  if (lock)
    (*((void (**)(HGSynchronizable *, SEL))lock->var0 + 1))(lock, a2);
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::destroy((uint64_t)&self->_policy, (_QWORD *)self->_policy.__tree_.__pair1_.__value_.__left_);
  self->_policy.__tree_.__begin_node_ = &self->_policy.__tree_.__pair1_;
  self->_policy.__tree_.__pair3_.__value_ = 0;
  self->_policy.__tree_.__pair1_.__value_.__left_ = 0;
  v4.receiver = self;
  v4.super_class = (Class)PVLivePlayerThermalThrottlingPolicy;
  -[PVLivePlayerThermalThrottlingPolicy dealloc](&v4, sel_dealloc);
}

- (void)setThermalLevel:(int)a3 controlParameters:(id)a4
{
  id v6;
  uint64_t **p_policy;
  uint64_t **v8;
  HGSynchronizable *lock;
  char v10;
  int v11;
  int *v12;

  v11 = a3;
  v6 = a4;
  lock = self->_lock;
  v10 = 0;
  HGSynchronizable::Lock(lock);
  p_policy = (uint64_t **)&self->_policy;
  if (v6)
  {
    v12 = &v11;
    v8 = std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_policy, &v11, (uint64_t)std::piecewise_construct, &v12);
    objc_storeStrong((id *)v8 + 5, a4);
  }
  else
  {
    std::__tree<std::__value_type<PVSPI_OSThermalPressureLevel,PVLivePlayerThrottlingControlParameters * {__strong}>,std::__map_value_compare<PVSPI_OSThermalPressureLevel,std::__value_type<PVSPI_OSThermalPressureLevel,PVLivePlayerThrottlingControlParameters * {__strong}>,std::less<PVSPI_OSThermalPressureLevel>,true>,std::allocator<std::__value_type<PVSPI_OSThermalPressureLevel,PVLivePlayerThrottlingControlParameters * {__strong}>>>::__erase_unique<PVSPI_OSThermalPressureLevel>((uint64_t)p_policy, &v11);
  }
  HGSynchronizer::~HGSynchronizer(&lock);

}

- (id)controlParametersForThermalLevel:(int)a3
{
  uint64_t *v4;
  HGSynchronizable *lock;
  char v7;
  int v8;
  int *v9;

  v8 = a3;
  lock = self->_lock;
  v7 = 0;
  HGSynchronizable::Lock(lock);
  v9 = &v8;
  v4 = std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&self->_policy, &v8, (uint64_t)std::piecewise_construct, &v9)[5];
  HGSynchronizer::~HGSynchronizer(&lock);
  return v4;
}

- (id)populatedControlParametersForThermalLevel:(int)a3
{
  uint64_t **p_policy;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  int v8;
  char v9;
  uint64_t *v10;
  char v11;
  int v13;
  HGSynchronizable *lock;
  char v15;
  int v16;
  int *v17;

  v16 = a3;
  lock = self->_lock;
  v15 = 0;
  HGSynchronizable::Lock(lock);
  p_policy = (uint64_t **)&self->_policy;
  v17 = &v16;
  v5 = std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_policy, &v16, (uint64_t)std::piecewise_construct, &v17)[5];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    +[PVLivePlayerThrottlingControlParameters CreateControllerParameters:::](PVLivePlayerThrottlingControlParameters, "CreateControllerParameters:::", 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v16;
  v13 = v16;
  if (v7)
    v9 = objc_msgSend(v7, "hasNilParameter") ^ 1;
  else
    v9 = 0;
  if (v8 >= 1 && (v9 & 1) == 0)
  {
    do
    {
      v13 = PVThermalMonitorPreviousLevel(v8);
      v17 = &v13;
      v10 = std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_policy, &v13, (uint64_t)std::piecewise_construct, &v17)[5];
      objc_msgSend(v7, "updateNilsFrom:", v10);
      if (v7)
        v11 = objc_msgSend(v7, "hasNilParameter") ^ 1;
      else
        v11 = 0;

      v8 = v13;
    }
    while (v13 >= 1 && (v11 & 1) == 0);
  }
  HGSynchronizer::~HGSynchronizer(&lock);
  return v7;
}

- (id)populatedControlParametersForCurrentThermalLevel
{
  void *v3;
  void *v4;

  +[PVThermalMonitor sharedInstance](PVThermalMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVLivePlayerThermalThrottlingPolicy populatedControlParametersForThermalLevel:](self, "populatedControlParametersForThermalLevel:", objc_msgSend(v3, "thermalLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  uint64_t **p_policy;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *p_pair1;
  int left;
  id v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  int v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *v19;
  BOOL v20;
  int *v21;
  int *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int *v27;
  int *v28;
  id v29;
  uint64_t v30;
  void *v31;
  int v33;
  void *__p;
  char *v35;
  char *v36;
  int *v37;

  __p = 0;
  v35 = 0;
  v36 = 0;
  p_policy = (uint64_t **)&self->_policy;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *)self->_policy.__tree_.__begin_node_;
  p_pair1 = &self->_policy.__tree_.__pair1_;
  if (begin_node == &self->_policy.__tree_.__pair1_)
  {
    v22 = 0;
    v21 = 0;
  }
  else
  {
    do
    {
      left = (int)begin_node[4].__value_.__left_;
      v7 = begin_node[5].__value_.__left_;
      v8 = v35;
      if (v35 >= v36)
      {
        v10 = (char *)__p;
        v11 = (v35 - (_BYTE *)__p) >> 2;
        v12 = v11 + 1;
        if ((unint64_t)(v11 + 1) >> 62)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v13 = v36 - (_BYTE *)__p;
        if ((v36 - (_BYTE *)__p) >> 1 > v12)
          v12 = v13 >> 1;
        if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
          v14 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v14 = v12;
        if (v14)
        {
          v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v36, v14);
          v10 = (char *)__p;
          v8 = v35;
        }
        else
        {
          v15 = 0;
        }
        v16 = &v15[4 * v11];
        *(_DWORD *)v16 = left;
        v9 = v16 + 4;
        while (v8 != v10)
        {
          v17 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *((_DWORD *)v16 - 1) = v17;
          v16 -= 4;
        }
        __p = v16;
        v35 = v9;
        v36 = &v15[4 * v14];
        if (v10)
          operator delete(v10);
      }
      else
      {
        *(_DWORD *)v35 = left;
        v9 = v8 + 4;
      }
      v35 = v9;

      v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *)begin_node[1].__value_.__left_;
      if (v18)
      {
        do
        {
          v19 = v18;
          v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *)v18->__value_.__left_;
        }
        while (v18);
      }
      else
      {
        do
        {
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<PVSPI_OSThermalPressureLevel, PVLivePlayerThrottlingControlParameters *>, void *>>> *)begin_node[2].__value_.__left_;
          v20 = v19->__value_.__left_ == begin_node;
          begin_node = v19;
        }
        while (!v20);
      }
      begin_node = v19;
    }
    while (v19 != p_pair1);
    v21 = (int *)__p;
    v22 = (int *)v35;
  }
  v23 = 126 - 2 * __clz(v22 - v21);
  if (v22 == v21)
    v24 = 0;
  else
    v24 = v23;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,PVSPI_OSThermalPressureLevel *,false>((uint64_t)v21, v22, (uint64_t)&v37, v24, 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  v27 = (int *)__p;
  v28 = (int *)v35;
  if (__p != v35)
  {
    do
    {
      v33 = *v27;
      PVThermalMonitorLevelName(v33);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "UTF8String");
      v37 = &v33;
      objc_msgSend(std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_policy, &v33, (uint64_t)std::piecewise_construct, &v37)[5], "description");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "appendFormat:", CFSTR("\n %15s - %@"), v30, v31);

      ++v27;
    }
    while (v27 != v28);
  }
  if (__p)
  {
    v35 = (char *)__p;
    operator delete(__p);
  }
  return v26;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::destroy((uint64_t)&self->_policy, (_QWORD *)self->_policy.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  return self;
}

@end
