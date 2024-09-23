@implementation ABMTapToRadar

+ (id)sharedInstance
{
  if (qword_2579B8BC0 != -1)
    dispatch_once(&qword_2579B8BC0, &__block_literal_global_4);
  return (id)_MergedGlobals_5;
}

ABMTapToRadar *__31__ABMTapToRadar_sharedInstance__block_invoke()
{
  ABMTapToRadar *result;

  result = objc_alloc_init(ABMTapToRadar);
  _MergedGlobals_5 = (uint64_t)result;
  return result;
}

- (ABMTapToRadar)init
{
  ABMTapToRadar *v2;
  NSObject *v3;
  NSObject *fObj;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABMTapToRadar;
  v2 = -[ABMTapToRadar init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("abm.TapToRadar.queue", 0);
    fObj = v2->fQueue.fObj.fObj;
    v2->fQueue.fObj.fObj = (dispatch_object_s *)v3;
    if (fObj)
    {
      dispatch_release(fObj);
      v3 = v2->fQueue.fObj.fObj;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __21__ABMTapToRadar_init__block_invoke;
    block[3] = &unk_251CBEC60;
    block[4] = v2;
    dispatch_sync(v3, block);
  }
  return v2;
}

void __21__ABMTapToRadar_init__block_invoke(uint64_t a1)
{
  const void *v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *__dst[2];
  unint64_t v10;
  std::string __p;
  int v12;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = 30;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 86400;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  if ((TelephonyUtilIsInternalBuild() & 1) != 0 || TelephonyUtilIsCarrierBuild())
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = (const void *)*MEMORY[0x24BE04E90];
  v3 = strlen((const char *)*MEMORY[0x24BE04E90]);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v6 = v3 | 7;
    v7 = v6 + 1;
    v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    v10 = v7 | 0x8000000000000000;
    __dst[0] = v5;
    goto LABEL_11;
  }
  HIBYTE(v10) = v3;
  v5 = __dst;
  if (v3)
LABEL_11:
    memmove(v5, v2, (size_t)v4);
  *((_BYTE *)v4 + (_QWORD)v5) = 0;
  v8 = *(_QWORD *)(a1 + 32);
  memset(&__p, 0, sizeof(__p));
  if (prop::ttr::get((char *)__dst, (uint64_t)&__p))
  {
    v12 = -1431655766;
    if (util::convert<int>(&__p, &v12, 0))
      *(_DWORD *)(v8 + 8) = v12;
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10) & 0x80000000) == 0)
      return;
LABEL_19:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10) < 0)
    goto LABEL_19;
}

- (void)setMode:(int)a3
{
  NSObject *fObj;
  _QWORD v4[5];
  int v5;

  fObj = self->fQueue.fObj.fObj;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__ABMTapToRadar_setMode___block_invoke;
  v4[3] = &unk_251CBEC88;
  v4[4] = self;
  v5 = a3;
  dispatch_async(fObj, v4);
}

void __25__ABMTapToRadar_setMode___block_invoke(uint64_t a1)
{
  const void *v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  std::string __p;
  void *__dst[2];
  unint64_t v10;
  std::string v11;

  if ((TelephonyUtilIsInternalBuild() & 1) == 0 && !TelephonyUtilIsCarrierBuild())
    return;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_DWORD *)(a1 + 40);
  v2 = (const void *)*MEMORY[0x24BE04E90];
  v3 = strlen((const char *)*MEMORY[0x24BE04E90]);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v6 = v3 | 7;
    v7 = v6 + 1;
    v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    v10 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v10) = v3;
    v5 = __dst;
    if (!v3)
      goto LABEL_11;
  }
  memmove(v5, v2, (size_t)v4);
LABEL_11:
  *((_BYTE *)v4 + (_QWORD)v5) = 0;
  std::to_string(&v11, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8));
  __p = v11;
  prop::ttr::set((char *)__dst, (char *)&__p);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v10) & 0x80000000) == 0)
      return;
LABEL_15:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10) < 0)
    goto LABEL_15;
}

- (int)getMode
{
  return self->fMode;
}

- (vector<std::string,)findLogFiles_sync:(ABMTapToRadar *)self :(SEL)a3
{
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  vector<std::string, std::allocator<std::string>> *result;
  std::string::size_type *v13;
  int v14;
  size_t var1;
  unint64_t v16;
  stat *p_dst;
  uint64_t v18;
  uint64_t v19;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v20;
  int v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  __int128 v24;
  std::string::size_type v25;
  int v26;
  std::string::size_type *v27;
  _WORD *v28;
  timespec v29;
  std::string *p_p;
  timespec v31;
  std::string *v32;
  vector<std::string, std::allocator<std::string>> *v33;
  __int128 v34;
  std::string *v35;
  DIR *v36;
  DIR *v37;
  dirent *v38;
  std::string *v39;
  std::string::size_type size;
  char *v41;
  uint64_t v42;
  int v43;
  const std::string::value_type **v45;
  std::string *v46;
  __int128 v47;
  std::string *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  __int128 v53;
  std::string *v54;
  __int128 v55;
  std::string *v56;
  void *v57;
  std::string *v58;
  const std::string::value_type **v59;
  const std::string::value_type **v60;
  std::string::size_type *v61;
  void *v62;
  ABMTapToRadar *v63;
  __compressed_pair<std::string *, std::allocator<std::string>> *p_var2;
  void *v65[2];
  char v66;
  std::string v67;
  void *v68[3];
  stat v69;
  std::string __p;
  std::locale v71;
  std::__shared_weak_count *v72;
  std::string var0;
  void *v74;
  std::string::size_type *v75;
  uint64_t v76;
  stat __dst;

  v5 = v4;
  retstr->var2.var0 = 0;
  p_var2 = &retstr->var2;
  retstr->var0 = 0;
  retstr->var1 = 0;
  v74 = 0;
  v75 = 0;
  v76 = 0;
  if (*((char *)&a4->var0.var0.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&var0, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
  else
    var0 = (std::string)a4->var0.var0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)&v71, v5, 0);
  support::fs::getFilteredFiles((const char *)&var0, (uint64_t)&v71, (uint64_t)&v74, 0);
  v9 = v72;
  if (!v72)
    goto LABEL_8;
  p_shared_owners = (unint64_t *)&v72->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (v11)
  {
LABEL_8:
    std::locale::~locale(&v71);
    if ((SHIBYTE(var0.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_9;
LABEL_136:
    operator delete(var0.__r_.__value_.__l.__data_);
    v13 = (std::string::size_type *)v74;
    if (v74 != v75)
      goto LABEL_10;
LABEL_137:
    v61 = v13;
    if (v13)
      goto LABEL_138;
    return result;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  std::locale::~locale(&v71);
  if (SHIBYTE(var0.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_136;
LABEL_9:
  v13 = (std::string::size_type *)v74;
  if (v74 == v75)
    goto LABEL_137;
LABEL_10:
  v63 = self;
  do
  {
LABEL_15:
    memset(&__p, 170, sizeof(__p));
    v14 = *((char *)&a4->var0.var0.var0.var1 + 23);
    if (v14 >= 0)
      var1 = *((unsigned __int8 *)&a4->var0.var0.var0.var1 + 23);
    else
      var1 = a4->var0.var0.var0.var1.var1;
    v16 = var1 + 1;
    memset(&__dst, 170, 24);
    if (var1 + 1 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (v16 >= 0x17)
    {
      v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17)
        v18 = v16 | 7;
      v19 = v18 + 1;
      p_dst = (stat *)operator new(v18 + 1);
      __dst.st_ino = var1 + 1;
      *(_QWORD *)&__dst.st_uid = v19 | 0x8000000000000000;
      *(_QWORD *)&__dst.st_dev = p_dst;
    }
    else
    {
      memset(&__dst, 0, 24);
      p_dst = &__dst;
      HIBYTE(__dst.st_gid) = var1 + 1;
      if (!var1)
        goto LABEL_29;
    }
    if (v14 >= 0)
      v20 = a4;
    else
      v20 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->var0.var0.var0.var1.var0;
    memmove(p_dst, v20, var1);
LABEL_29:
    *(_WORD *)((char *)&p_dst->st_dev + var1) = 47;
    v21 = *((char *)v13 + 23);
    if (v21 >= 0)
      v22 = (const std::string::value_type *)v13;
    else
      v22 = (const std::string::value_type *)*v13;
    if (v21 >= 0)
      v23 = *((unsigned __int8 *)v13 + 23);
    else
      v23 = v13[1];
    result = (vector<std::string, std::allocator<std::string>> *)std::string::append((std::string *)&__dst, v22, v23);
    v24 = *(_OWORD *)&result->var0;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)result->var2.var0;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v24;
    result->var1 = 0;
    result->var2.var0 = 0;
    result->var0 = 0;
    if (SHIBYTE(__dst.st_gid) < 0)
      operator delete(*(void **)&__dst.st_dev);
    v25 = *((unsigned __int8 *)v13 + 23);
    v26 = (char)v25;
    if ((v25 & 0x80u) != 0)
      v25 = v13[1];
    if (v25 == 2)
    {
      if (v26 >= 0)
        v28 = v13;
      else
        v28 = (_WORD *)*v13;
      if (*v28 == 11822)
        goto LABEL_13;
    }
    else if (v25 == 1)
    {
      v27 = v26 >= 0 ? v13 : (std::string::size_type *)*v13;
      if (*(_BYTE *)v27 == 46)
        goto LABEL_13;
    }
    v29.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v29.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v69.st_blksize = v29;
    *(timespec *)v69.st_qspare = v29;
    v69.st_birthtimespec = v29;
    *(timespec *)&v69.st_size = v29;
    v69.st_ctimespec = v29;
    v69.st_atimespec = v29;
    v69.st_mtimespec = v29;
    *(timespec *)&v69.st_dev = v29;
    *(timespec *)&v69.st_uid = v29;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    result = (vector<std::string, std::allocator<std::string>> *)lstat((const char *)p_p, &v69);
    if ((v69.st_mode & 0xF000) == 0xA000)
      goto LABEL_13;
    v31.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v31.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&__dst.st_blksize = v31;
    *(timespec *)__dst.st_qspare = v31;
    __dst.st_birthtimespec = v31;
    *(timespec *)&__dst.st_size = v31;
    __dst.st_mtimespec = v31;
    __dst.st_ctimespec = v31;
    *(timespec *)&__dst.st_uid = v31;
    __dst.st_atimespec = v31;
    *(timespec *)&__dst.st_dev = v31;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v32 = &__p;
    else
      v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (stat((const char *)v32, &__dst)
      || ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? (v35 = &__p)
        : (v35 = (std::string *)__p.__r_.__value_.__r.__words[0]),
          (v36 = opendir((const char *)v35), (v37 = v36) == 0)
       || (v38 = readdir(v36), result = (vector<std::string, std::allocator<std::string>> *)closedir(v37), !v38)))
    {
      v33 = (vector<std::string, std::allocator<std::string>> *)retstr->var1;
      if (v33 >= retstr->var2.var0)
      {
        result = (vector<std::string, std::allocator<std::string>> *)std::vector<std::string>::__emplace_back_slow_path<std::string const&>((char **)retstr, (uint64_t)&__p);
      }
      else
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)retstr->var1, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          v34 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v33->var2.var0 = (void *)__p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v33->var0 = v34;
        }
        result = v33 + 1;
        retstr->var1 = &v33[1];
      }
      retstr->var1 = result;
      goto LABEL_13;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      size = __p.__r_.__value_.__l.__size_;
      if (__p.__r_.__value_.__l.__size_ < 0xA)
LABEL_149:
        std::string::__throw_out_of_range[abi:ne180100]();
      v39 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (HIBYTE(__p.__r_.__value_.__r.__words[2]) < 0xAu)
        goto LABEL_149;
      v39 = &__p;
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    v41 = (char *)v39 + size;
    v42 = *(_QWORD *)(v41 - 10);
    v43 = *((unsigned __int16 *)v41 - 1);
    if (v42 == 0x6968637261676F6CLL && v43 == 25974)
      goto LABEL_13;
    memset(v68, 170, sizeof(v68));
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
      std::string::__init_copy_ctor_external(&v67, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    else
      v67 = __p;
    v66 = 2;
    strcpy((char *)v65, ".*");
    result = (vector<std::string, std::allocator<std::string>> *)v63;
    if (v63)
    {
      result = -[ABMTapToRadar findLogFiles_sync::](v63, "findLogFiles_sync::", &v67, v65);
      if (v66 < 0)
      {
        operator delete(v65[0]);
        if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
        {
LABEL_121:
          operator delete(v67.__r_.__value_.__l.__data_);
          v45 = (const std::string::value_type **)v68[0];
          if (v68[0] == v68[1])
          {
LABEL_122:
            v59 = v45;
            if (v45)
              goto LABEL_123;
            goto LABEL_13;
          }
          goto LABEL_86;
        }
      }
      else if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
      {
        goto LABEL_121;
      }
    }
    else
    {
      memset(v68, 0, sizeof(v68));
      if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_121;
    }
    v45 = (const std::string::value_type **)v68[0];
    if (v68[0] == v68[1])
      goto LABEL_122;
LABEL_86:
    v46 = (std::string *)retstr->var1;
    do
    {
      if (v46 < p_var2->var0)
      {
        if (*((char *)v45 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v46, *v45, (std::string::size_type)v45[1]);
        }
        else
        {
          v47 = *(_OWORD *)v45;
          v46->__r_.__value_.__r.__words[2] = (std::string::size_type)v45[2];
          *(_OWORD *)&v46->__r_.__value_.__l.__data_ = v47;
        }
        retstr->var1 = ++v46;
        goto LABEL_90;
      }
      v48 = (std::string *)retstr->var0;
      v49 = 0xAAAAAAAAAAAAAAABLL * (((char *)v46 - (char *)retstr->var0) >> 3);
      v50 = v49 + 1;
      if (v49 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)p_var2->var0 - (char *)v48) >> 3) > v50)
        v50 = 0x5555555555555556 * (((char *)p_var2->var0 - (char *)v48) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_var2->var0 - (char *)v48) >> 3) >= 0x555555555555555)
        v51 = 0xAAAAAAAAAAAAAAALL;
      else
        v51 = v50;
      __dst.st_atimespec.tv_sec = (__darwin_time_t)p_var2;
      if (v51)
      {
        if (v51 > 0xAAAAAAAAAAAAAAALL)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v52 = (char *)operator new(24 * v51);
      }
      else
      {
        v52 = 0;
      }
      result = (vector<std::string, std::allocator<std::string>> *)&v52[24 * v49];
      *(_QWORD *)&__dst.st_dev = v52;
      __dst.st_ino = (__darwin_ino64_t)result;
      *(_QWORD *)&__dst.st_uid = result;
      *(_QWORD *)&__dst.st_rdev = &v52[24 * v51];
      if (*((char *)v45 + 23) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)result, *v45, (std::string::size_type)v45[1]);
        v48 = (std::string *)retstr->var0;
        v46 = (std::string *)retstr->var1;
        result = (vector<std::string, std::allocator<std::string>> *)__dst.st_ino;
        v54 = *(std::string **)&__dst.st_uid;
        if (v46 != retstr->var0)
        {
          do
          {
LABEL_107:
            v55 = *(_OWORD *)&v46[-1].__r_.__value_.__l.__data_;
            result[-1].var2.var0 = (void *)v46[-1].__r_.__value_.__r.__words[2];
            *(_OWORD *)&result[-1].var0 = v55;
            --result;
            v46[-1].__r_.__value_.__l.__size_ = 0;
            v46[-1].__r_.__value_.__r.__words[2] = 0;
            v46[-1].__r_.__value_.__r.__words[0] = 0;
            --v46;
          }
          while (v46 != v48);
          v56 = (std::string *)retstr->var0;
          v48 = (std::string *)retstr->var1;
          goto LABEL_110;
        }
      }
      else
      {
        v53 = *(_OWORD *)v45;
        result->var2.var0 = (void *)v45[2];
        *(_OWORD *)&result->var0 = v53;
        v54 = (std::string *)&v52[24 * v49];
        if (v46 != v48)
          goto LABEL_107;
      }
      v56 = v48;
LABEL_110:
      v46 = v54 + 1;
      retstr->var0 = result;
      retstr->var1 = &v54[1];
      v57 = retstr->var2.var0;
      retstr->var2.var0 = *(void **)&__dst.st_rdev;
      *(_QWORD *)&__dst.st_rdev = v57;
      *(_QWORD *)&__dst.st_dev = v56;
      __dst.st_ino = (__darwin_ino64_t)v56;
      if (v48 != v56)
      {
        v58 = v48 - 1;
        do
        {
          *(_QWORD *)&__dst.st_uid = v58;
          if (SHIBYTE(v58->__r_.__value_.__r.__words[2]) < 0)
            operator delete(v58->__r_.__value_.__l.__data_);
          --v58;
        }
        while (&v58[1] != v56);
        v48 = v56;
      }
      if (v48)
        operator delete(v48);
LABEL_90:
      retstr->var1 = v46;
      v45 += 3;
    }
    while (v45 != v68[1]);
    v59 = (const std::string::value_type **)v68[0];
    if (!v68[0])
      goto LABEL_13;
LABEL_123:
    v60 = v59;
    if (v45 != v59)
    {
      do
      {
        if (*((char *)v45 - 1) < 0)
          operator delete((void *)*(v45 - 3));
        v45 -= 3;
      }
      while (v45 != v59);
      v60 = (const std::string::value_type **)v68[0];
    }
    v68[1] = v59;
    operator delete(v60);
LABEL_13:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      v13 += 3;
      if (v13 == v75)
        break;
      goto LABEL_15;
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    v13 += 3;
  }
  while (v13 != v75);
  v61 = (std::string::size_type *)v74;
  if (!v74)
    return result;
LABEL_138:
  v62 = v61;
  if (v13 != v61)
  {
    do
    {
      if (*((char *)v13 - 1) < 0)
        operator delete((void *)*(v13 - 3));
      v13 -= 3;
    }
    while (v13 != v61);
    v62 = v74;
  }
  v75 = v61;
  operator delete(v62);
  return result;
}

- (BOOL)checkAudioTraces_sync
{
  int v2;
  const char **v3;
  const char *v4;
  size_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  const char *v12;
  int v13;
  char v15[24];
  void *__dst[3];
  _QWORD v17[2];
  uint64_t v18;

  v17[0] = 0;
  v17[1] = 0;
  v18 = 0;
  memset(__dst, 170, sizeof(__dst));
  v2 = capabilities::radio::maverick((capabilities::radio *)self);
  v3 = (const char **)MEMORY[0x24BE05630];
  if (!v2)
    v3 = (const char **)MEMORY[0x24BE05528];
  v4 = *v3;
  v5 = strlen(*v3);
  if (v5 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v6 = (void *)v5;
  if (v5 >= 0x17)
  {
    v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v8 = v5 | 7;
    v9 = v8 + 1;
    v7 = (void **)operator new(v8 + 1);
    __dst[1] = v6;
    __dst[2] = (void *)(v9 | 0x8000000000000000);
    __dst[0] = v7;
    goto LABEL_10;
  }
  HIBYTE(__dst[2]) = v5;
  v7 = __dst;
  if (v5)
LABEL_10:
    memmove(v7, v4, (size_t)v6);
  *((_BYTE *)v6 + (_QWORD)v7) = 0;
  prop::bbtrace::get((char *)__dst, (uint64_t)v17);
  v15[23] = 5;
  strcpy(v15, "Audio");
  v10 = SHIBYTE(v18);
  v11 = (void *)v17[0];
  if (v18 >= 0)
    v12 = (const char *)v17;
  else
    v12 = (const char *)v17[0];
  v13 = strcasecmp(v15, v12);
  if (SHIBYTE(__dst[2]) < 0)
  {
    operator delete(__dst[0]);
    if ((v10 & 0x80000000) == 0)
      return v13 == 0;
LABEL_18:
    operator delete(v11);
    return v13 == 0;
  }
  if (v10 < 0)
    goto LABEL_18;
  return v13 == 0;
}

- (BOOL)checkTraces_sync:(int)a3
{
  const void *v3;
  size_t v4;
  size_t v5;
  void **v6;
  const void *v7;
  size_t v8;
  size_t v9;
  void **p_dst;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **__dst;
  size_t v17;
  unint64_t v18;
  BOOL v19;
  std::string __p;

  v19 = 1;
  if (a3 > 5)
    return v19;
  if (((1 << a3) & 0x26) == 0)
  {
    if (((1 << a3) & 0x18) == 0)
      return v19;
    v7 = (const void *)*MEMORY[0x24BE04E08];
    v8 = strlen((const char *)*MEMORY[0x24BE04E08]);
    if (v8 > 0x7FFFFFFFFFFFFFF7)
LABEL_29:
      std::string::__throw_length_error[abi:ne180100]();
    v9 = v8;
    if (v8 >= 0x17)
    {
      v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17)
        v13 = v8 | 7;
      v14 = v13 + 1;
      p_dst = (void **)operator new(v13 + 1);
      v17 = v9;
      v18 = v14 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v18) = v8;
      p_dst = (void **)&__dst;
      if (!v8)
      {
LABEL_22:
        *((_BYTE *)p_dst + v9) = 0;
        memset(&__p, 0, sizeof(__p));
        if (!prop::coredump::get((char *)&__dst, (uint64_t)&__p))
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    memmove(p_dst, v7, v9);
    goto LABEL_22;
  }
  v3 = (const void *)*MEMORY[0x24BE04E08];
  v4 = strlen((const char *)*MEMORY[0x24BE04E08]);
  if (v4 > 0x7FFFFFFFFFFFFFF7)
    goto LABEL_29;
  v5 = v4;
  if (v4 >= 0x17)
  {
    v11 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v11 = v4 | 7;
    v12 = v11 + 1;
    v6 = (void **)operator new(v11 + 1);
    v17 = v5;
    v18 = v12 | 0x8000000000000000;
    __dst = v6;
    goto LABEL_15;
  }
  HIBYTE(v18) = v4;
  v6 = (void **)&__dst;
  if (v4)
LABEL_15:
    memmove(v6, v3, v5);
  *((_BYTE *)v6 + v5) = 0;
  memset(&__p, 0, sizeof(__p));
  if (!prop::bbtrace::get((char *)&__dst, (uint64_t)&__p))
    goto LABEL_24;
LABEL_23:
  util::convert<BOOL>(&__p, &v19, 0);
LABEL_24:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v18) & 0x80000000) == 0)
      return v19;
  }
  else if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    return v19;
  }
  operator delete(__dst);
  return v19;
}

- (BOOL)checkNotificationCriteria:(int *)a3 :(const void *)a4 :(BOOL)a5
{
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unsigned __int8 v13;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  char *v19;
  size_t v23;
  capabilities::radio *v24;
  size_t v25;
  int v26;
  int64_t v27;
  char *v28;
  const void *v29;
  int64_t v30;
  int64_t v31;
  char *v32;
  const void *v33;
  int64_t v34;
  int64_t v35;
  const void *v36;
  int64_t v37;
  int64_t v38;
  BOOL v39;
  int v40;
  int64_t v41;
  char **v42;
  char *v43;
  char *v44;
  int v45;
  char **v46;
  int64_t v47;
  int v48;
  int64_t v49;
  void *v50;
  int64_t v51;
  char *v52;
  char *v53;
  int v54;
  int64_t v55;
  void *v56;
  int64_t v57;
  char *v58;
  char *v59;
  int v60;
  int64_t v61;
  void *v62;
  int64_t v63;
  char *v64;
  char *v65;
  int v66;
  void *v67;
  char *v68;
  char *v69;
  char *v70;
  char **v71;
  char *v72;
  char **v74;
  int *v75;
  _QWORD __s2[3];
  char *v77;
  char **v78;
  uint64_t v79;

  v9 = (char *)operator new(0x20uLL);
  strcpy(v9, "Carrier Bundle file push failed");
  v77 = (char *)&v77;
  v78 = &v77;
  v79 = 0;
  v10 = (char *)operator new(0x30uLL);
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  std::string::__init_copy_ctor_external((std::string *)(v10 + 16), v9, 0x1FuLL);
  v11 = v79;
  v12 = v77;
  *((_DWORD *)v10 + 10) = 2;
  *(_QWORD *)v10 = v12;
  *((_QWORD *)v10 + 1) = &v77;
  *((_QWORD *)v12 + 1) = v10;
  v77 = v10;
  v79 = v11 + 1;
  operator delete(v9);
  v13 = atomic_load((unsigned __int8 *)&qword_2579B8BC8);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_2579B8BC8))
  {
    qword_2579B8BD0 = (uint64_t)"mav_bedf_component_config_reset: Reset Requested by Component Cfg";
    qword_2579B8BD8 = (uint64_t)"AutoBugCapture";
    qword_2579B8BE0 = *MEMORY[0x24BDFC768];
    __cxa_guard_release(&qword_2579B8BC8);
  }
  v14 = *((char *)a4 + 23);
  if (v14 < 0)
  {
    v15 = *((_QWORD *)a4 + 1);
    if (!v15)
      goto LABEL_21;
    v16 = *(char **)a4;
    if (v15 < 30)
      goto LABEL_21;
  }
  else
  {
    if (!*((_BYTE *)a4 + 23))
      goto LABEL_21;
    v15 = *((unsigned __int8 *)a4 + 23);
    v16 = (char *)a4;
    if ((unint64_t)v15 < 0x1E)
      goto LABEL_21;
  }
  v17 = &v16[v15];
  v18 = v16;
  do
  {
    v19 = (char *)memchr(v18, 67, v15 - 29);
    if (!v19)
      break;
    if (*(_QWORD *)v19 == 0x736964206C6C6143
      && *((_QWORD *)v19 + 1) == 0x657463656E6E6F63
      && *((_QWORD *)v19 + 2) == 0x657078656E752064
      && *(_QWORD *)(v19 + 22) == 0x796C646574636570)
    {
      if (v19 != v17 && v19 - v16 != -1)
      {
        *a3 = 1;
        LOBYTE(v14) = *((_BYTE *)a4 + 23);
      }
      break;
    }
    v18 = v19 + 1;
    v15 = v17 - (_BYTE *)v18;
  }
  while (v17 - (_BYTE *)v18 >= 30);
LABEL_21:
  __s2[1] = 0xAAAAAAAAAA005D73;
  __s2[2] = 0xAAAAAAAAAAAAAAALL;
  __s2[0] = *(_QWORD *)"[Settings]";
  if (self->fMode == 3)
    goto LABEL_33;
  if ((v14 & 0x80) == 0)
  {
    if (v14 >= 0xAu)
      v23 = 10;
    else
      v23 = v14;
    v24 = (capabilities::radio *)memcmp(a4, __s2, v23);
    if (v23 != 10)
      goto LABEL_47;
    goto LABEL_32;
  }
  if (*((_QWORD *)a4 + 1) >= 0xAuLL)
    v25 = 10;
  else
    v25 = *((_QWORD *)a4 + 1);
  v24 = (capabilities::radio *)memcmp(*(const void **)a4, __s2, v25);
  if (v25 == 10)
  {
LABEL_32:
    if ((_DWORD)v24)
      goto LABEL_47;
LABEL_33:
    v26 = (char)v14;
    if ((v14 & 0x80u) == 0)
      v27 = v14;
    else
      v27 = *((_QWORD *)a4 + 1);
    if (!v27)
    {
LABEL_46:
      v39 = 1;
      goto LABEL_111;
    }
    goto LABEL_37;
  }
LABEL_47:
  v39 = 0;
  if (capabilities::radio::supportsAutomaticRadarFiling(v24))
  {
    v75 = a3;
    if (!a5)
    {
      v39 = 0;
      v40 = *((char *)a4 + 23);
      v41 = v40 >= 0 ? *((unsigned __int8 *)a4 + 23) : *((_QWORD *)a4 + 1);
      if (v41 && *v75 != 1)
      {
        v42 = v78;
        if (v78 == &v77)
          goto LABEL_110;
        if (v40 >= 0)
          v43 = (char *)a4;
        else
          v43 = *(char **)a4;
        v44 = &v43[v41];
        while (1)
        {
          v45 = *((char *)v42 + 39);
          v46 = v45 >= 0 ? v42 + 2 : (char **)v42[2];
          v47 = v45 >= 0 ? *((unsigned __int8 *)v42 + 39) : (int64_t)v42[3];
          if (!v47)
            break;
          if (v41 >= v47)
          {
            v48 = *(char *)v46;
            v49 = v41;
            v50 = v43;
            do
            {
              v51 = v49 - v47;
              if (v51 == -1)
                break;
              v52 = (char *)memchr(v50, v48, v51 + 1);
              if (!v52)
                break;
              v53 = v52;
              if (!memcmp(v52, v46, v47))
              {
                if (v53 == v44 || v53 - v43 == -1)
                  break;
                goto LABEL_76;
              }
              v50 = v53 + 1;
              v49 = v44 - (v53 + 1);
            }
            while (v49 >= v47);
          }
          v39 = 0;
          v42 = (char **)v42[1];
          if (v42 == &v77)
            goto LABEL_111;
        }
LABEL_76:
        *v75 = *((_DWORD *)v42 + 10);
        v26 = *((char *)a4 + 23);
        if (v26 >= 0)
          v27 = *((unsigned __int8 *)a4 + 23);
        else
          v27 = *((_QWORD *)a4 + 1);
        if (!v27)
          goto LABEL_46;
LABEL_37:
        if (v26 >= 0)
          v28 = (char *)a4;
        else
          v28 = *(char **)a4;
        v29 = (const void *)qword_2579B8BD0;
        v30 = strlen((const char *)qword_2579B8BD0);
        if (v30)
        {
          v31 = v30;
          v32 = &v28[v27];
          if (v27 >= v30)
          {
            v54 = *(char *)qword_2579B8BD0;
            v55 = v27;
            v56 = v28;
            do
            {
              v57 = v55 - v31;
              if (v57 == -1)
                break;
              v58 = (char *)memchr(v56, v54, v57 + 1);
              if (!v58)
                break;
              v59 = v58;
              if (!memcmp(v58, v29, v31))
              {
                if (v59 != v32 && v59 - v28 != -1)
                  goto LABEL_110;
                break;
              }
              v56 = v59 + 1;
              v55 = v32 - (v59 + 1);
            }
            while (v55 >= v31);
          }
          v33 = (const void *)qword_2579B8BD8;
          v34 = strlen((const char *)qword_2579B8BD8);
          if (v34)
          {
            v35 = v34;
            if (v27 >= v34)
            {
              v60 = *(char *)qword_2579B8BD8;
              v61 = v27;
              v62 = v28;
              do
              {
                v63 = v61 - v35;
                if (v63 == -1)
                  break;
                v64 = (char *)memchr(v62, v60, v63 + 1);
                if (!v64)
                  break;
                v65 = v64;
                if (!memcmp(v64, v33, v35))
                {
                  if (v65 != v32 && v65 - v28 != -1)
                    goto LABEL_110;
                  break;
                }
                v62 = v65 + 1;
                v61 = v32 - (v65 + 1);
              }
              while (v61 >= v35);
            }
            v36 = (const void *)qword_2579B8BE0;
            v37 = strlen((const char *)qword_2579B8BE0);
            if (v37)
            {
              v38 = v37;
              if (v27 >= v37)
              {
                v66 = *(char *)qword_2579B8BE0;
                v67 = v28;
                while (v27 - v38 != -1)
                {
                  v68 = (char *)memchr(v67, v66, v27 - v38 + 1);
                  if (!v68)
                    break;
                  v69 = v68;
                  if (!memcmp(v68, v36, v38))
                  {
                    if (v69 == v32 || v69 - v28 == -1)
                      goto LABEL_46;
                    goto LABEL_110;
                  }
                  v67 = v69 + 1;
                  v27 = v32 - (v69 + 1);
                  if (v27 < v38)
                    goto LABEL_46;
                }
              }
              goto LABEL_46;
            }
          }
        }
LABEL_110:
        v39 = 0;
      }
    }
  }
LABEL_111:
  if (v79)
  {
    v70 = v77;
    v71 = v78;
    v72 = *v78;
    *((_QWORD *)v72 + 1) = *((_QWORD *)v77 + 1);
    **((_QWORD **)v70 + 1) = v72;
    v79 = 0;
    if (v71 != &v77)
    {
      do
      {
        v74 = (char **)v71[1];
        if (*((char *)v71 + 39) < 0)
          operator delete(v71[2]);
        operator delete(v71);
        v71 = v74;
      }
      while (v74 != &v77);
    }
  }
  return v39;
}

- (void)showUserNotification:(int)a3 dumpReason:()basic_string<char
{
  char *v6;
  unsigned __int8 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  NSObject *v11;
  unint64_t *v12;
  unint64_t v13;
  void **v14;
  char v15;
  size_t var1;
  unint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  std::string v23;
  std::string v24;
  std::string __p;
  __int128 v26;
  std::string v27;
  void *v28[2];
  _QWORD v29[4];
  uint8_t buf[24];
  void *v31;
  __int128 *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&v27.__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)v28 = 0u;
  memset(v29, 0, sizeof(v29));
  *((_BYTE *)&v27.__r_.__value_.__s + 23) = 7;
  strcpy((char *)&v27, "LogDump");
  if (-[ABMTapToRadar checkTraces_sync:](self, "checkTraces_sync:"))
  {
    if (SHIBYTE(v29[0]) < 0)
    {
      v28[1] = (void *)20;
      v6 = (char *)v28[0];
    }
    else
    {
      HIBYTE(v29[0]) = 20;
      v6 = (char *)v28;
    }
    strcpy(v6, "Telephony_Dump_Ready");
  }
  else
  {
    std::string::__assign_external((std::string *)v28, "Telephony_Dump_Insufficient", 0x1BuLL);
  }
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 0x40000000;
  *(_QWORD *)&buf[16] = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v31 = &__block_descriptor_tmp_13_5;
  v32 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v8 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v26 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, buf);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v26 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_12;
  }
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
LABEL_12:
  v11 = *((_QWORD *)GetGlobalLogger((uint64_t *)&v26) + 4);
  if (!v8)
    goto LABEL_16;
  v12 = (unint64_t *)&v8->__shared_owners_;
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
  }
  else
  {
LABEL_16:
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
  }
  if (v29[0] >= 0)
    v14 = v28;
  else
    v14 = (void **)v28[0];
  *(_DWORD *)buf = 67109378;
  *(_DWORD *)&buf[4] = a3;
  *(_WORD *)&buf[8] = 2080;
  *(_QWORD *)&buf[10] = v14;
  _os_log_impl(&dword_24B855000, v11, OS_LOG_TYPE_DEFAULT, "#I Show user notification for radarType: %d with header: %s", buf, 0x12u);
LABEL_21:
  v15 = *((_BYTE *)&a4->var0.var0.var0.var1 + 23);
  if ((v15 & 0x80000000) == 0)
  {
    if (!*((_BYTE *)&a4->var0.var0.var0.var1 + 23))
      goto LABEL_23;
LABEL_26:
    if (v15 >= 0)
      var1 = *((unsigned __int8 *)&a4->var0.var0.var0.var1 + 23);
    else
      var1 = a4->var0.var0.var0.var1.var1;
    v17 = var1 + 8;
    memset(buf, 170, sizeof(buf));
    if (var1 + 8 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (v17 >= 0x17)
    {
      v19 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v17 | 7) != 0x17)
        v19 = v17 | 7;
      v20 = v19 + 1;
      v21 = operator new(v19 + 1);
      *(_QWORD *)&buf[8] = var1 + 8;
      *(_QWORD *)&buf[16] = v20 | 0x8000000000000000;
      *(_QWORD *)buf = v21;
      *v21 = 0x203A6E6F73616552;
      v18 = (uint8_t *)(v21 + 1);
    }
    else
    {
      v18 = &buf[8];
      buf[9] = 0;
      *(_WORD *)&buf[10] = 0;
      *(_DWORD *)&buf[12] = 0;
      *(_QWORD *)&buf[16] = 0;
      buf[23] = var1 + 8;
      strcpy((char *)buf, "Reason: ");
      if (!var1)
      {
        buf[8] = 0;
        if ((SHIBYTE(v29[3]) & 0x80000000) == 0)
          goto LABEL_33;
        goto LABEL_61;
      }
    }
    if (v15 >= 0)
      var0 = a4;
    else
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->var0.var0.var0.var1.var0;
    memmove(v18, var0, var1);
    v18[var1] = 0;
    if ((SHIBYTE(v29[3]) & 0x80000000) == 0)
    {
LABEL_33:
      *(_OWORD *)&v29[1] = *(_OWORD *)buf;
      v29[3] = *(_QWORD *)&buf[16];
      if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_24;
      goto LABEL_34;
    }
LABEL_61:
    operator delete((void *)v29[1]);
    goto LABEL_33;
  }
  if (a4->var0.var0.var0.var1.var1)
    goto LABEL_26;
LABEL_23:
  if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_24:
    v23 = v27;
    goto LABEL_35;
  }
LABEL_34:
  std::string::__init_copy_ctor_external(&v23, v27.__r_.__value_.__l.__data_, v27.__r_.__value_.__l.__size_);
LABEL_35:
  if (SHIBYTE(v29[0]) < 0)
  {
    std::string::__init_copy_ctor_external(&v24, (const std::string::value_type *)v28[0], (std::string::size_type)v28[1]);
  }
  else
  {
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = *(_OWORD *)v28;
    v24.__r_.__value_.__r.__words[2] = v29[0];
  }
  if (SHIBYTE(v29[3]) < 0)
    std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v29[1], v29[2]);
  else
    __p = *(std::string *)&v29[1];
  support::ui::showNotification(1u, (uint64_t)&v23, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_43:
      if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_44;
      goto LABEL_50;
    }
  }
  else if ((SHIBYTE(v24.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_43;
  }
  operator delete(v24.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_44:
    if ((SHIBYTE(v29[3]) & 0x80000000) == 0)
      goto LABEL_45;
    goto LABEL_51;
  }
LABEL_50:
  operator delete(v23.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v29[3]) & 0x80000000) == 0)
  {
LABEL_45:
    if ((SHIBYTE(v29[0]) & 0x80000000) == 0)
      goto LABEL_46;
    goto LABEL_52;
  }
LABEL_51:
  operator delete((void *)v29[1]);
  if ((SHIBYTE(v29[0]) & 0x80000000) == 0)
  {
LABEL_46:
    if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_53:
    operator delete(v27.__r_.__value_.__l.__data_);
    return;
  }
LABEL_52:
  operator delete(v28[0]);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_53;
}

- (void)showNotification:(int)a3 :()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> ::
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *fObj;
  _QWORD v11[5];
  std::string v12;
  __rep var0;
  std::string v14;
  std::string __p;
  int v16;

  v7 = v6;
  v8 = v4;
  fObj = self->fQueue.fObj.fObj;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3321888768;
  v11[2] = __38__ABMTapToRadar_showNotification___::__block_invoke;
  v11[3] = &unk_251CBECE0;
  v11[4] = self;
  v16 = a3;
  if (*(char *)(v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v12, *(const std::string::value_type **)v5, *(_QWORD *)(v5 + 8));
    if ((*((char *)&a4->var0.var0.var0.var1 + 23) & 0x80000000) == 0)
      goto LABEL_3;
  }
  else
  {
    v12 = *(std::string *)v5;
    if ((*((char *)&a4->var0.var0.var0.var1 + 23) & 0x80000000) == 0)
    {
LABEL_3:
      var0 = a4->var0.var0;
      goto LABEL_6;
    }
  }
  std::string::__init_copy_ctor_external((std::string *)&var0, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
LABEL_6:
  if (*(char *)(v8 + 23) < 0)
    std::string::__init_copy_ctor_external(&v14, *(const std::string::value_type **)v8, *(_QWORD *)(v8 + 8));
  else
    v14 = *(std::string *)v8;
  if (*(char *)(v7 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *(_QWORD *)(v7 + 8));
  else
    __p = *(std::string *)v7;
  dispatch_async(fObj, v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_14:
      if ((*((char *)&var0.var0.var1 + 23) & 0x80000000) == 0)
        goto LABEL_15;
      goto LABEL_19;
    }
  }
  else if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_14;
  }
  operator delete(v14.__r_.__value_.__l.__data_);
  if ((*((char *)&var0.var0.var1 + 23) & 0x80000000) == 0)
  {
LABEL_15:
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_20:
    operator delete(v12.__r_.__value_.__l.__data_);
    return;
  }
LABEL_19:
  operator delete(var0.var0.var1.var0);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_20;
}

void __38__ABMTapToRadar_showNotification___::__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  void *v3;
  const void *v4;
  size_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  size_t v11;
  unint64_t v12;
  void *v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  unsigned __int8 v18;
  void **v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  xpc_object_t v25;
  uint64_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  const char *v30;
  xpc_object_t v31;
  xpc_object_t v32;
  const char *v33;
  xpc_object_t v34;
  xpc_object_t v35;
  const char *v36;
  xpc_object_t v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  xpc_object_t v41;
  xpc_object_t v42;
  char *v43;
  char *v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  __int128 v50;
  unsigned __int8 v51;
  std::__shared_weak_count *v52;
  unint64_t *p_shared_owners;
  unint64_t v54;
  NSObject *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  void **v61;
  void **v62;
  void **v63;
  __int128 v64;
  xpc_object_t object;
  void *v66[2];
  __int128 v67;
  xpc_object_t v68;
  _QWORD v69[2];
  void (*v70)(uint64_t, uint64_t);
  void *v71;
  xpc_object_t v72;
  __int128 v73;
  unint64_t v74;
  unint64_t v75;
  void *__p[3];
  void *__dst[2];
  unint64_t v78;
  void *v79[3];
  void **block;
  uint64_t v81;
  void (*v82)(uint64_t);
  void *v83;
  __int128 *v84;
  uint8_t buf[4];
  void **v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD **)(a1 + 32);
  if (!v2[2]
    || !objc_msgSend(v2, "checkTraces_sync:", *(unsigned int *)(a1 + 136))
    || *(_DWORD *)(a1 + 136) == 5 && !objc_msgSend(*(id *)(a1 + 32), "checkAudioTraces_sync"))
  {
    return;
  }
  memset(v79, 170, sizeof(v79));
  v3 = *(void **)(a1 + 32);
  v4 = (const void *)*MEMORY[0x24BDFC720];
  v5 = strlen((const char *)*MEMORY[0x24BDFC720]);
  if (v5 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v6 = (void *)v5;
  if (v5 >= 0x17)
  {
    v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v8 = v5 | 7;
    v9 = v8 + 1;
    v7 = (void **)operator new(v8 + 1);
    __dst[1] = v6;
    v78 = v9 | 0x8000000000000000;
    __dst[0] = v7;
    goto LABEL_12;
  }
  HIBYTE(v78) = v5;
  v7 = __dst;
  if (v5)
LABEL_12:
    memmove(v7, v4, (size_t)v6);
  *((_BYTE *)v6 + (_QWORD)v7) = 0;
  v10 = *(char *)(a1 + 63);
  if (v10 >= 0)
    v11 = *(unsigned __int8 *)(a1 + 63);
  else
    v11 = *(_QWORD *)(a1 + 48);
  v12 = v11 + 2;
  memset(__p, 170, sizeof(__p));
  if (v11 + 2 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v12 >= 0x17)
  {
    v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v15 = v12 | 7;
    v16 = v15 + 1;
    v13 = operator new(v15 + 1);
    __p[1] = (void *)(v11 + 2);
    __p[2] = (void *)(v16 | 0x8000000000000000);
    __p[0] = v13;
  }
  else
  {
    memset(__p, 0, sizeof(__p));
    v13 = __p;
    HIBYTE(__p[2]) = v11 + 2;
    if (!v11)
    {
      strcpy((char *)__p, ".*");
      if (v3)
        goto LABEL_20;
      goto LABEL_32;
    }
  }
  if (v10 >= 0)
    v17 = (const void *)(a1 + 40);
  else
    v17 = *(const void **)(a1 + 40);
  memmove(v13, v17, v11);
  strcpy((char *)v13 + v11, ".*");
  if (v3)
  {
LABEL_20:
    objc_msgSend(v3, "findLogFiles_sync::", __dst, __p);
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
      goto LABEL_21;
    goto LABEL_33;
  }
LABEL_32:
  memset(v79, 0, sizeof(v79));
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
LABEL_21:
    if ((SHIBYTE(v78) & 0x80000000) == 0)
      goto LABEL_22;
    goto LABEL_34;
  }
LABEL_33:
  operator delete(__p[0]);
  if ((SHIBYTE(v78) & 0x80000000) == 0)
  {
LABEL_22:
    v14 = (void **)v79[1];
    if (v79[1] == v79[0])
      goto LABEL_23;
    goto LABEL_35;
  }
LABEL_34:
  operator delete(__dst[0]);
  v14 = (void **)v79[1];
  if (v79[1] == v79[0])
  {
LABEL_23:
    if (!v14)
      return;
    goto LABEL_112;
  }
LABEL_35:
  v74 = 0xAAAAAAAAAAAAAAAALL;
  v75 = 0xAAAAAAAAAAAAAAAALL;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  v19 = (void **)MEMORY[0x24BDAC760];
  block = (void **)MEMORY[0x24BDAC760];
  v81 = 0x40000000;
  v82 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v83 = &__block_descriptor_tmp_13_5;
  v84 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v20 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v73 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_40;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v20 = *((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v73 = GetABMLogServer(void)::sLogServer;
    if (!*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_40;
  }
  v21 = (unint64_t *)(v20 + 8);
  do
    v22 = __ldxr(v21);
  while (__stxr(v22 + 1, v21));
LABEL_40:
  abm::HelperClient::create();
  if (*((_QWORD *)&v73 + 1))
  {
    v23 = (unint64_t *)(*((_QWORD *)&v73 + 1) + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v73 + 1) + 16))(*((_QWORD *)&v73 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v73 + 1));
    }
  }
  v25 = xpc_dictionary_create(0, 0, 0);
  v26 = MEMORY[0x24BDACFA0];
  if (v25 || (v25 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v25) == v26)
    {
      xpc_retain(v25);
      v27 = v25;
    }
    else
    {
      v27 = xpc_null_create();
    }
  }
  else
  {
    v27 = xpc_null_create();
    v25 = 0;
  }
  xpc_release(v25);
  v28 = xpc_int64_create(*(unsigned int *)(a1 + 136));
  if (!v28)
    v28 = xpc_null_create();
  xpc_dictionary_set_value(v27, (const char *)*MEMORY[0x24BDFC7A0], v28);
  v29 = xpc_null_create();
  xpc_release(v28);
  xpc_release(v29);
  v30 = (const char *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
    v30 = *(const char **)v30;
  v31 = xpc_string_create(v30);
  if (!v31)
    v31 = xpc_null_create();
  xpc_dictionary_set_value(v27, (const char *)*MEMORY[0x24BDFC7B0], v31);
  v32 = xpc_null_create();
  xpc_release(v31);
  xpc_release(v32);
  v33 = (const char *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0)
    v33 = *(const char **)v33;
  v34 = xpc_string_create(v33);
  if (!v34)
    v34 = xpc_null_create();
  xpc_dictionary_set_value(v27, (const char *)*MEMORY[0x24BDFC7F0], v34);
  v35 = xpc_null_create();
  xpc_release(v34);
  xpc_release(v35);
  v36 = (const char *)(a1 + 112);
  if (*(char *)(a1 + 135) < 0)
    v36 = *(const char **)v36;
  v37 = xpc_string_create(v36);
  if (!v37)
    v37 = xpc_null_create();
  xpc_dictionary_set_value(v27, (const char *)*MEMORY[0x24BDFC860], v37);
  v38 = xpc_null_create();
  xpc_release(v37);
  xpc_release(v38);
  v39 = xpc_int64_create(0);
  if (!v39)
    v39 = xpc_null_create();
  xpc_dictionary_set_value(v27, (const char *)*MEMORY[0x24BDFC7D8], v39);
  v40 = xpc_null_create();
  xpc_release(v39);
  xpc_release(v40);
  v41 = xpc_array_create(0, 0);
  if (v41 || (v41 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2A468](v41) == MEMORY[0x24BDACF78])
    {
      xpc_retain(v41);
      v42 = v41;
    }
    else
    {
      v42 = xpc_null_create();
    }
  }
  else
  {
    v42 = xpc_null_create();
    v41 = 0;
  }
  xpc_release(v41);
  v43 = (char *)v79[0];
  v44 = (char *)v79[1];
  v69[0] = v19;
  v69[1] = 3321888768;
  v70 = __38__ABMTapToRadar_showNotification___::__block_invoke_2;
  v71 = &__block_descriptor_40_e8_32c16_ZTSN3xpc5arrayE_e10_v16__0r_v8l;
  v72 = v42;
  if (v42)
    xpc_retain(v42);
  else
    v72 = xpc_null_create();
  while (v43 != v44)
  {
    v70((uint64_t)v69, (uint64_t)v43);
    v43 += 24;
  }
  if (v42)
  {
    xpc_retain(v42);
    v45 = v42;
  }
  else
  {
    v45 = xpc_null_create();
  }
  xpc_dictionary_set_value(v27, (const char *)*MEMORY[0x24BDFC888], v45);
  v46 = xpc_null_create();
  xpc_release(v45);
  xpc_release(v46);
  v68 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v47 = xpc_dictionary_create(0, 0, 0);
  v48 = v47;
  if (v47)
  {
    v68 = v47;
  }
  else
  {
    v48 = xpc_null_create();
    v68 = v48;
    if (!v48)
    {
      v49 = xpc_null_create();
      v48 = 0;
      goto LABEL_88;
    }
  }
  if (MEMORY[0x24BD2A468](v48) == v26)
  {
    xpc_retain(v48);
    goto LABEL_89;
  }
  v49 = xpc_null_create();
LABEL_88:
  v68 = v49;
LABEL_89:
  xpc_release(v48);
  *(_QWORD *)&v50 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v66 = v50;
  v67 = v50;
  object = v27;
  if (v27)
    xpc_retain(v27);
  else
    object = xpc_null_create();
  abm::HelperClient::perform();
  xpc_release(object);
  object = 0;
  if (!LODWORD(v66[0]))
    goto LABEL_104;
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100], &GetABMLogServer(void)::sLogServer, &dword_24B855000);
  }
  block = v19;
  v81 = 0x40000000;
  v82 = ___ZL17sABMLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v83 = &__block_descriptor_tmp_13_5;
  v84 = &GetABMLogServer(void)::sLogServer;
  if (sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    v52 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v64 = GetABMLogServer(void)::sLogServer;
    if (*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
      goto LABEL_96;
  }
  else
  {
    dispatch_once(&sABMLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    v52 = (std::__shared_weak_count *)*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1);
    v64 = GetABMLogServer(void)::sLogServer;
    if (*((_QWORD *)&GetABMLogServer(void)::sLogServer + 1))
    {
LABEL_96:
      p_shared_owners = (unint64_t *)&v52->__shared_owners_;
      do
        v54 = __ldxr(p_shared_owners);
      while (__stxr(v54 + 1, p_shared_owners));
    }
  }
  v55 = *((_QWORD *)GetGlobalLogger((uint64_t *)&v64) + 4);
  if (v52)
  {
    v56 = (unint64_t *)&v52->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    xpc::dict::to_debug_string((xpc::dict *)&block, (uint64_t)v27);
    v63 = SHIBYTE(v82) >= 0 ? (void **)&block : block;
    *(_DWORD *)buf = 136315138;
    v86 = v63;
    _os_log_error_impl(&dword_24B855000, v55, OS_LOG_TYPE_ERROR, "Failed to file the radar: %s", buf, 0xCu);
    if (SHIBYTE(v82) < 0)
      operator delete(block);
  }
LABEL_104:
  if (SHIBYTE(v67) < 0)
    operator delete(v66[1]);
  xpc_release(v68);
  xpc_release(v72);
  v72 = 0;
  xpc_release(v42);
  xpc_release(v27);
  v58 = (std::__shared_weak_count *)v75;
  if (v75)
  {
    v59 = (unint64_t *)(v75 + 8);
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  v14 = (void **)v79[0];
  if (v79[0])
  {
LABEL_112:
    v61 = (void **)v79[1];
    v62 = v14;
    if (v79[1] != v14)
    {
      do
      {
        if (*((char *)v61 - 1) < 0)
          operator delete(*(v61 - 3));
        v61 -= 3;
      }
      while (v61 != v14);
      v62 = (void **)v79[0];
    }
    v79[1] = v14;
    operator delete(v62);
  }
}

void __38__ABMTapToRadar_showNotification___::__block_invoke_2(uint64_t a1, uint64_t a2)
{
  const char *v3;
  xpc_object_t v4;

  if (*(char *)(a2 + 23) >= 0)
    v3 = (const char *)a2;
  else
    v3 = *(const char **)a2;
  v4 = xpc_string_create(v3);
  if (!v4)
    v4 = xpc_null_create();
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);
  xpc_release(v4);
}

- (void).cxx_destruct
{
  NSObject *fObj;

  fObj = self->fQueue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
