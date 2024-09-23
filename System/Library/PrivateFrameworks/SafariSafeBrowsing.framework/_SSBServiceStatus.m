@implementation _SSBServiceStatus

- (_SSBServiceStatus)initWithServiceStatus:(ServiceStatus *)a3
{
  _SSBServiceStatus *v4;
  _SSBServiceStatus *v5;
  void **p_serviceStatus;
  __int128 v7;
  _SSBServiceStatus *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SSBServiceStatus;
  v4 = -[_SSBServiceStatus init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    p_serviceStatus = (void **)&v4->_serviceStatus;
    if (*((char *)&v4->_serviceStatus.m_name.__r_.__value_.var0.var1 + 23) < 0)
      operator delete(*p_serviceStatus);
    v7 = *(_OWORD *)a3->m_name.__r_.__value_.var0.var0.__data_;
    *((_QWORD *)&v5->_serviceStatus.m_name.__r_.__value_.var0.var1 + 2) = *((_QWORD *)&a3->m_name.__r_.__value_.var0.var1
                                                                          + 2);
    *(_OWORD *)p_serviceStatus = v7;
    *((_BYTE *)&a3->m_name.__r_.__value_.var0.var1 + 23) = 0;
    a3->m_name.__r_.__value_.var0.var0.__data_[0] = 0;
    v5->_serviceStatus.m_name.__r_.var0 = a3->m_name.__r_.var0;
    std::vector<std::string>::__vdeallocate((std::vector<std::string> *)&v5->_serviceStatus.m_name.var0);
    *(_OWORD *)&v5->_serviceStatus.m_name.var0 = *(_OWORD *)&a3->m_name.var0;
    v5[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__data_ = (char *)a3[1].m_name.__r_.__value_.var0.var1.__size_;
    a3->m_name.var0 = 0;
    a3[1].m_name.__r_.__value_.var0.var1.__data_ = 0;
    a3[1].m_name.__r_.__value_.var0.var1.__size_ = 0;
    std::vector<SafeBrowsing::ServiceStatus::Connection>::__vdeallocate((uint64_t *)&v5[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_);
    *(_OWORD *)&v5[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_ = *((_OWORD *)&a3[1].m_name.__r_.__value_.var0.var1
                                                                              + 1);
    *(_QWORD *)&v5[1]._serviceStatus.m_name.__r_.var0 = a3[1].m_name.var0;
    *((_QWORD *)&a3[1].m_name.__r_.__value_.var0.var1 + 2) = 0;
    *(_QWORD *)&a3[1].m_name.__r_.var0 = 0;
    a3[1].m_name.var0 = 0;
    std::vector<SafeBrowsing::ServiceStatus::DatabaseUpdaterStatus>::__move_assign((uint64_t)&v5[1]._serviceStatus.m_name.var0, (__n128 *)&a3[2]);
    v8 = v5;
  }

  return v5;
}

- (NSString)name
{
  ServiceStatus *p_serviceStatus;

  p_serviceStatus = &self->_serviceStatus;
  if (*((char *)&self->_serviceStatus.m_name.__r_.__value_.var0.var1 + 23) < 0)
    p_serviceStatus = (ServiceStatus *)p_serviceStatus->m_name.__r_.__value_.var0.var1.__data_;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_serviceStatus);
}

- (int)processIdentifier
{
  return self->_serviceStatus.m_name.__r_.var0;
}

- (NSArray)activeTransactions
{
  void *v3;
  int64_t var0;
  Class i;
  int64_t v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (((uint64_t)self[1].super.isa - self->_serviceStatus.m_name.var0) >> 3));
  var0 = self->_serviceStatus.m_name.var0;
  for (i = self[1].super.isa; (Class)var0 != i; var0 += 24)
  {
    v6 = var0;
    if (*(char *)(var0 + 23) < 0)
      v6 = *(_QWORD *)var0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  return (NSArray *)v3;
}

- (unint64_t)connectionCount
{
  return (uint64_t)(*((_QWORD *)&self[1]._serviceStatus.m_name.__r_.__value_.var0.var1 + 2)
                 - self[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_) >> 5;
}

- (int)processIdentifierForConnectionAtIndex:(unint64_t)a3
{
  unint64_t size;
  unint64_t v5;
  _SSBServiceStatus *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  size = self[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_;
  v5 = (uint64_t)(*((_QWORD *)&self[1]._serviceStatus.m_name.__r_.__value_.var0.var1 + 2) - size) >> 5;
  if (v5 <= a3)
  {
    v7 = self;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99858], CFSTR("-[%@ %@]"), v10, v11);

    size = v7[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_;
    v5 = (uint64_t)(*((_QWORD *)&v7[1]._serviceStatus.m_name.__r_.__value_.var0.var1 + 2) - size) >> 5;
  }
  if (v5 <= a3)
    __break(1u);
  else
    LODWORD(self) = *(_DWORD *)(size + 32 * a3);
  return (int)self;
}

- (id)bundleIdentifierForConnectionAtIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  int v14;
  void *v15;

  v4 = *((_QWORD *)self + 8);
  v5 = (*((_QWORD *)self + 9) - v4) >> 5;
  if (v5 <= a3)
  {
    v7 = self;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99858], CFSTR("-[%@ %@]"), v10, v11);

    v4 = v7[8];
    v5 = (v7[9] - v4) >> 5;
  }
  if (v5 > a3)
  {
    v12 = v4 + 32 * a3;
    v13 = (_QWORD *)(v12 + 8);
    v14 = *(char *)(v12 + 31);
    if (v14 < 0)
    {
      if (!v13[1])
      {
LABEL_10:
        v15 = 0;
        return v15;
      }
      v13 = (_QWORD *)*v13;
    }
    else if (!v14)
    {
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    return v15;
  }
  __break(1u);
  return self;
}

- (NSArray)databaseUpdatersStatuses
{
  void *v3;
  _QWORD *var0;
  Class i;
  id v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", ((uint64_t)self[2].super.isa - self[1]._serviceStatus.m_name.var0) >> 3);
  var0 = (_QWORD *)self[1]._serviceStatus.m_name.var0;
  for (i = self[2].super.isa; var0 != (_QWORD *)i; ++var0)
  {
    v6 = -[SSBDatabaseUpdaterStatus _initWithDatabaseUpdaterStatus:]([SSBDatabaseUpdaterStatus alloc], "_initWithDatabaseUpdaterStatus:", *var0);
    objc_msgSend(v3, "addObject:", v6);

  }
  return (NSArray *)v3;
}

- (unint64_t)databaseUpdaterState
{
  int *v2;

  v2 = *(int **)(self + 88);
  if (v2 != *(int **)(self + 96))
    return *v2;
  __break(1u);
  return self;
}

- (void).cxx_destruct
{
  objc_class *var0;
  void **p_size;

  var0 = (objc_class *)self[1]._serviceStatus.m_name.var0;
  if (var0)
  {
    self[2].super.isa = var0;
    operator delete(var0);
  }
  p_size = (void **)&self[1]._serviceStatus.m_name.__r_.__value_.var0.var1.__size_;
  std::vector<SafeBrowsing::ServiceStatus::Connection>::__destroy_vector::operator()[abi:sn180100](&p_size);
  p_size = (void **)&self->_serviceStatus.m_name.var0;
  std::vector<std::string>::__destroy_vector::operator()[abi:sn180100](&p_size);
  if (*((char *)&self->_serviceStatus.m_name.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_serviceStatus.m_name.__r_.__value_.var0.var1.__data_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = -1;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
