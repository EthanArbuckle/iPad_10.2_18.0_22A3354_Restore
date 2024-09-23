@implementation SEMSkitWrapper

- (SEMSkitWrapper)initWithSkitDirectoryURL:(id)a3
{
  id v5;
  SEMSkitWrapper *v6;
  SEMSkitWrapper *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  const char *v16;
  const char *v17;
  void **p_var0;
  void **p_size;
  std::string v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SEMSkitWrapper;
  v6 = -[SEMSkitWrapper init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_skitDirectoryURL, a3);
    objc_msgSend_path(v7->_skitDirectoryURL, v8, v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (char *)objc_msgSend_UTF8String(v10, v11, v12);
    if (*((char *)&v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) < 0)
    {
      *(_BYTE *)v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__data_ = 0;
      v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__size_ = 0;
    }
    else
    {
      LOBYTE(v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__s.__data_[0]) = 0;
      *((_BYTE *)&v7->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) = 0;
    }
    v14 = v13 - 1;
    while (*++v14)
      ;
    sub_2462E3EE8((std::string *)&v7->_skitDirectoryPath, v13, v14);

    sub_2462EA394(v16, &v21);
    p_var0 = (void **)&v7->_skitDirectoryPath.__pn_.__r_.var0;
    if (SHIBYTE(v7->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_) < 0)
      operator delete(*p_var0);
    *(_OWORD *)p_var0 = *(_OWORD *)&v21.__r_.__value_.__l.__data_;
    v7->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_ = (unsigned __int16 *)v21.__r_.__value_.__r.__words[2];
    sub_2462EA444(v17, &v21);
    p_size = (void **)&v7->_nameTriePath.__pn_.__r_.__value_.var0.__l.__size_;
    if (*((char *)&v7->_nameTriePath.__pn_.__r_.var1 + 3) < 0)
      operator delete(*p_size);
    *(_OWORD *)p_size = *(_OWORD *)&v21.__r_.__value_.__l.__data_;
    *(_QWORD *)&v7->_nameTriePath.__pn_.__r_.var0 = *((_QWORD *)&v21.__r_.__value_.__l + 2);
  }

  return v7;
}

- (void)boostrap
{
  unsigned __int16 *v3;
  unsigned __int16 *data;
  unint64_t *v5;
  unint64_t v6;
  std::__fs::filesystem::path __p;
  std::__fs::filesystem::path v8;
  void *__dst[2];
  uint64_t v10;

  v3 = (unsigned __int16 *)operator new(0x48uLL);
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = &off_25175F0F0;
  if (*((char *)&self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) < 0)
  {
    sub_2462D3374(__dst, self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__data_, self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__size_);
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__s.__data_;
    v10 = *((_QWORD *)&self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 2);
  }
  if (SHIBYTE(self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_) < 0)
    sub_2462D3374(&v8, *(void **)&self->_skitDirectoryPath.__pn_.__r_.var0, self->_skitDirectoryPath.__pn_.var0);
  else
    v8 = *(std::__fs::filesystem::path *)&self->_skitDirectoryPath.__pn_.__r_.var0;
  if (*((char *)&self->_nameTriePath.__pn_.__r_.var1 + 3) < 0)
    sub_2462D3374(&__p, (void *)self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__size_, *((_QWORD *)&self->_nameTriePath.__pn_.__r_.__value_.var0.__l + 2));
  else
    __p = *(std::__fs::filesystem::path *)((char *)&self->_nameTriePath.__pn_.__r_.__value_ + 8);
  sub_2462F43FC((uint64_t)(v3 + 12), (uint64_t)__dst, &v8, &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v8.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10) < 0)
    operator delete(__dst[0]);
  data = self->_aliasTriePath.__pn_.__r_.__value_.var0.__l.__data_;
  self->_nameTriePath.__pn_.var0 = (int64_t)(v3 + 12);
  self->_aliasTriePath.__pn_.__r_.__value_.var0.__l.__data_ = v3;
  if (data)
  {
    v5 = (unint64_t *)(data + 4);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(unsigned __int16 *))(*(_QWORD *)data + 16))(data);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)data);
    }
  }
}

- (id)readInfo
{
  return (id)MEMORY[0x24BEDD108](SEMSkitInfo, sel_readOnlySkitInfoAtDirectory_, self->_skitDirectoryURL);
}

- (shared_ptr<semskitbridge::Searcher>)searcher
{
  int64_t *v2;
  unsigned __int16 *data;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<semskitbridge::Searcher> result;

  data = self->_aliasTriePath.__pn_.__r_.__value_.var0.__l.__data_;
  *v2 = self->_nameTriePath.__pn_.var0;
  v2[1] = (int64_t)data;
  if (data)
  {
    v4 = (unint64_t *)(data + 4);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Searcher *)self;
  return result;
}

- (void).cxx_destruct
{
  sub_2462D3524((uint64_t)&self->_nameTriePath.__pn_.var0);
  if (*((char *)&self->_nameTriePath.__pn_.__r_.var1 + 3) < 0)
    operator delete((void *)self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__size_);
  if (SHIBYTE(self->_nameTriePath.__pn_.__r_.__value_.var0.__l.__data_) < 0)
    operator delete(*(void **)&self->_skitDirectoryPath.__pn_.__r_.var0);
  if (*((char *)&self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_skitDirectoryPath.__pn_.__r_.__value_.var0.__l.__data_);
  objc_storeStrong((id *)&self->_skitDirectoryURL, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
