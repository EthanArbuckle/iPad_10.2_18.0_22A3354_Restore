void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

_QWORD *std::ifstream::basic_ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB838];
  v3 = MEMORY[0x24BEDB838] + 64;
  a1[53] = MEMORY[0x24BEDB838] + 64;
  v4 = a1 + 2;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  a1[1] = 0;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 2);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[53] = v3;
  MEMORY[0x24BD28118](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_24B8262FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x24BD2825C](v1 + 424);
  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E0];
  v3 = *MEMORY[0x24BEDB7E0];
  *a1 = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x24BD28124](a1 + 2);
  std::istream::~istream();
  MEMORY[0x24BD2825C](a1 + 53);
  return a1;
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  std::__shared_weak_count *locale;
  unint64_t *p_shared_owners;
  unint64_t v4;

  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (!locale)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&locale->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    std::locale::~locale(this);
  }
  else
  {
LABEL_5:
    std::locale::~locale(this);
  }
}

BOOL support::fs::getFilteredFiles(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  DIR *v7;
  DIR *v8;
  dirent *v9;
  char *d_name;
  size_t v11;
  size_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  std::string::size_type v19;
  _BYTE *v20;
  _WORD *v21;
  DIR *v22;
  uint64_t v23;
  uint64_t v24;
  timespec v25;
  int v26;
  size_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const std::string::value_type *v33;
  std::string *v34;
  __int128 v35;
  void **v36;
  std::sub_match<const char *> *v37;
  std::sub_match<std::__wrap_iter<const char *>> *v38;
  __int128 v39;
  int v40;
  int v41;
  unint64_t v42;
  __int128 v43;
  std::string *v44;
  unsigned __int8 v45;
  NSObject *v46;
  _BOOL8 result;
  int *v48;
  char *v49;
  char v50;
  const char *v52;
  std::string v53;
  _BYTE __dst[24];
  void *__p[2];
  _QWORD v56[9];
  __int128 v57;
  uint64_t v58;
  stat v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  *__error() = 0;
  if (a1[23] < 0)
  {
    v7 = opendir(*(const char **)a1);
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v7 = opendir(a1);
    if (v7)
    {
LABEL_3:
      v8 = v7;
      v9 = readdir(v7);
      if (v9)
      {
        v52 = a1;
        v50 = 0;
        while (1)
        {
          d_name = v9->d_name;
          memset(__dst, 170, sizeof(__dst));
          v11 = strlen(v9->d_name);
          if (v11 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          v12 = v11;
          if (v11 >= 0x17)
            break;
          __dst[23] = v11;
          v13 = __dst;
          if (v11)
            goto LABEL_12;
LABEL_13:
          v13[v12] = 0;
          v16 = __dst[23];
          v17 = __dst[23];
          v18 = *(_QWORD *)&__dst[8];
          if (__dst[23] >= 0)
            v19 = __dst[23];
          else
            v19 = *(_QWORD *)&__dst[8];
          if (v19 == 2)
          {
            v21 = *(_WORD **)__dst;
            if (__dst[23] >= 0)
              v21 = __dst;
            if (*v21 == 11822)
              goto LABEL_73;
          }
          else if (v19 == 1)
          {
            v20 = *(_BYTE **)__dst;
            if (__dst[23] >= 0)
              v20 = __dst;
            if (*v20 == 46)
              goto LABEL_73;
          }
          if ((a4 & 1) != 0)
            goto LABEL_53;
          v22 = v8;
          v23 = a4;
          v24 = a3;
          v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&v59.st_blksize = v25;
          *(timespec *)v59.st_qspare = v25;
          v59.st_birthtimespec = v25;
          *(timespec *)&v59.st_size = v25;
          v59.st_mtimespec = v25;
          v59.st_ctimespec = v25;
          *(timespec *)&v59.st_uid = v25;
          v59.st_atimespec = v25;
          *(timespec *)&v59.st_dev = v25;
          v26 = v52[23];
          if (v26 >= 0)
            v27 = *((unsigned __int8 *)v52 + 23);
          else
            v27 = *((_QWORD *)v52 + 1);
          v28 = v27 + 1;
          memset(&v53, 170, sizeof(v53));
          if (v27 + 1 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v28 >= 0x17)
          {
            v30 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v28 | 7) != 0x17)
              v30 = v28 | 7;
            v31 = v30 + 1;
            v29 = (char *)operator new(v30 + 1);
            v53.__r_.__value_.__l.__size_ = v27 + 1;
            v53.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
            v53.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
          }
          else
          {
            memset(&v53, 0, sizeof(v53));
            v29 = (char *)&v53;
            *((_BYTE *)&v53.__r_.__value_.__s + 23) = v27 + 1;
            if (!v27)
              goto LABEL_40;
          }
          if (v26 >= 0)
            v32 = v52;
          else
            v32 = *(const char **)v52;
          memmove(v29, v32, v27);
LABEL_40:
          a3 = v24;
          *(_WORD *)&v29[v27] = 47;
          if (v17 >= 0)
            v33 = __dst;
          else
            v33 = *(const std::string::value_type **)__dst;
          v34 = std::string::append(&v53, v33, v19);
          a4 = v23;
          v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
          v56[0] = *((_QWORD *)&v34->__r_.__value_.__l + 2);
          *(_OWORD *)__p = v35;
          v34->__r_.__value_.__l.__size_ = 0;
          v34->__r_.__value_.__r.__words[2] = 0;
          v34->__r_.__value_.__r.__words[0] = 0;
          if (v56[0] >= 0)
            v36 = __p;
          else
            v36 = (void **)__p[0];
          lstat((const char *)v36, &v59);
          v8 = v22;
          if (SHIBYTE(v56[0]) < 0)
          {
            operator delete(__p[0]);
            if ((SHIBYTE(v53.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_48:
              if ((v59.st_mode & 0xF000) != 0xA000)
                goto LABEL_52;
              goto LABEL_73;
            }
          }
          else if ((SHIBYTE(v53.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_48;
          }
          operator delete(v53.__r_.__value_.__l.__data_);
          if ((v59.st_mode & 0xF000) != 0xA000)
          {
LABEL_52:
            v16 = __dst[23];
            v18 = *(_QWORD *)&__dst[8];
            LOBYTE(v17) = __dst[23];
LABEL_53:
            if ((v17 & 0x80u) == 0)
              v37 = (std::sub_match<const char *> *)__dst;
            else
              v37 = *(std::sub_match<const char *> **)__dst;
            if ((v17 & 0x80u) != 0)
              v16 = v18;
            v38 = (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v37 + v16);
            *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v57 = v39;
            v56[6] = 0xAAAAAAAAAAAAAA00;
            v56[3] = 0xAAAAAAAAAAAAAAAALL;
            v56[4] = 0;
            v56[5] = 0;
            v56[7] = 0;
            v56[8] = 0;
            LOBYTE(v57) = 0;
            BYTE8(v57) = 0;
            v58 = 0;
            *(_OWORD *)__p = 0u;
            memset(v56, 0, 25);
            *(_OWORD *)&v59.st_birthtimespec.tv_nsec = v39;
            v59.st_ctimespec.tv_sec = 0xAAAAAAAAAAAAAAAALL;
            v59.st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
            memset(&v59.st_mtimespec, 0, 17);
            memset(&v59.st_ctimespec.tv_nsec, 0, 17);
            LOBYTE(v59.st_size) = 0;
            v59.st_blocks = 0;
            memset(&v59, 0, 41);
            v40 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a2, v37, (std::sub_match<const char *> *)((char *)v37 + v16), (std::vector<std::csub_match> *)&v59, 4160);
            std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)__p, (uint64_t)v37, v38, (uint64_t *)&v59.st_dev, 0);
            if (*(_QWORD *)&v59.st_dev)
            {
              v59.st_ino = *(_QWORD *)&v59.st_dev;
              operator delete(*(void **)&v59.st_dev);
            }
            if ((_BYTE)v57)
              v41 = v40 ^ 1;
            else
              v41 = 1;
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            if ((v40 & v41) != 0)
            {
              v42 = *(_QWORD *)(a3 + 8);
              if (v42 >= *(_QWORD *)(a3 + 16))
              {
                v44 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)a3, (uint64_t)__dst);
              }
              else
              {
                if ((__dst[23] & 0x80000000) != 0)
                {
                  std::string::__init_copy_ctor_external(*(std::string **)(a3 + 8), *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
                }
                else
                {
                  v43 = *(_OWORD *)__dst;
                  *(_QWORD *)(v42 + 16) = *(_QWORD *)&__dst[16];
                  *(_OWORD *)v42 = v43;
                }
                v44 = (std::string *)(v42 + 24);
                *(_QWORD *)(a3 + 8) = v42 + 24;
              }
              *(_QWORD *)(a3 + 8) = v44;
              v50 = 1;
            }
          }
LABEL_73:
          if ((__dst[23] & 0x80000000) != 0)
            operator delete(*(void **)__dst);
          v9 = readdir(v8);
          if (!v9)
            goto LABEL_85;
        }
        v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v11 | 7) != 0x17)
          v14 = v11 | 7;
        v15 = v14 + 1;
        v13 = operator new(v14 + 1);
        *(_QWORD *)&__dst[8] = v12;
        *(_QWORD *)&__dst[16] = v15 | 0x8000000000000000;
        *(_QWORD *)__dst = v13;
LABEL_12:
        memmove(v13, d_name, v12);
        goto LABEL_13;
      }
      v50 = 0;
LABEL_85:
      closedir(v8);
      return v50 & 1;
    }
  }
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2579B8240 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v46 = qword_2579B8240;
    result = os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
  }
  else
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v46 = qword_2579B8240;
    result = os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
  }
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v48 = __error();
  v49 = strerror(*v48);
  v59.st_dev = 136315394;
  *(_QWORD *)&v59.st_mode = a1;
  WORD2(v59.st_ino) = 2080;
  *(__darwin_ino64_t *)((char *)&v59.st_ino + 6) = (__darwin_ino64_t)v49;
  _os_log_error_impl(&dword_24B825000, v46, OS_LOG_TYPE_ERROR, "Error %s (%s)\n", (uint8_t *)&v59, 0x16u);
  return 0;
}

void sub_24B826A00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49)
{
  uint64_t v49;
  uint64_t v50;

  *(_QWORD *)(v49 + 8) = v50;
  if (a30 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *support::fs::readCurrentLine@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  const std::locale::facet *v6;
  unsigned __int8 v7;
  std::locale v9[16];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::istream::tellg();
  v4 = v10;
  if (v10 >= 2)
  {
    do
    {
      std::istream::seekg();
      if (std::istream::peek() == 10)
        break;
    }
    while (v4-- > 1);
  }
  std::istream::seekg();
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v6 = std::locale::use_facet(v9, MEMORY[0x24BEDB350]);
  v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(v9);
  return std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a1, (uint64_t)a2, v7);
}

void sub_24B826B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

void sub_24B826BB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
  {
    operator delete(*(void **)v1);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251CB4040, MEMORY[0x24BEDAAF0]);
}

void sub_24B826C28(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

std::string *std::vector<std::string>::__push_back_slow_path<std::string const&>(char **a1, uint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  char *v9;
  std::string *v10;
  std::string *v11;
  __int128 v12;
  char *v13;
  void **v14;
  std::string *v16;
  std::string *v17;
  char *v18;

  v3 = *a1;
  v4 = a1[1];
  v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3);
  v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * ((a1[2] - v3) >> 3) > v6)
    v6 = 0x5555555555555556 * ((a1[2] - v3) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3) >= 0x555555555555555)
    v8 = 0xAAAAAAAAAAAAAAALL;
  else
    v8 = v6;
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v9 = (char *)operator new(24 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = (std::string *)&v9[24 * v5];
  v16 = v10;
  v17 = v10;
  v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v3 = *a1;
    v4 = a1[1];
    v10 = v16;
    v11 = v17 + 1;
    if (v4 == *a1)
    {
LABEL_17:
      v13 = v3;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v10->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
    v11 = v10 + 1;
    if (v4 == v3)
      goto LABEL_17;
  }
  do
  {
    v12 = *(_OWORD *)(v4 - 24);
    v10[-1].__r_.__value_.__r.__words[2] = *((_QWORD *)v4 - 1);
    *(_OWORD *)&v10[-1].__r_.__value_.__l.__data_ = v12;
    --v10;
    *((_QWORD *)v4 - 2) = 0;
    *((_QWORD *)v4 - 1) = 0;
    *((_QWORD *)v4 - 3) = 0;
    v4 -= 24;
  }
  while (v4 != v3);
  v13 = *a1;
  v3 = a1[1];
LABEL_18:
  *a1 = (char *)v10;
  a1[1] = (char *)v11;
  a1[2] = v18;
  if (v3 != v13)
  {
    v14 = (void **)(v3 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0)
        operator delete(*v14);
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    v3 = v13;
  }
  if (v3)
    operator delete(v3);
  return v11;
}

void sub_24B826EE4(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251CB4048, MEMORY[0x24BEDAB00]);
}

void sub_24B826FC0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

_QWORD *std::string::__assign_no_alias<true>(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL)
      std::string::__throw_length_error[abi:ne180100]();
    v7 = 44;
    if (__len > 0x2C)
      v7 = __len;
    v8 = (v7 | 7) + 1;
    v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      v6 = __dst;
    }
  }
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v13;
  uint64_t v14;

  v6 = (unint64_t)a1[2];
  v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    v8 = *a1;
    a1[1] = (void *)__len;
    if (__len)
      memmove(v8, __src, __len);
    goto LABEL_12;
  }
  v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = v7 - 1;
  v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2)
      goto LABEL_7;
LABEL_14:
    v13 = 2 * v10;
    if (__len > 2 * v10)
      v13 = __len;
    v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v14 = v13 | 7;
    if (v13 >= 0x17)
      v9 = v14 + 1;
    else
      v9 = 23;
    v8 = operator new(v9);
    if (!__len)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2)
    goto LABEL_14;
LABEL_7:
  v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len)
LABEL_8:
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22)
    operator delete(v11);
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((_BYTE *)v8 + __len) = 0;
  return a1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1, char *a2, int a3)
{
  const std::locale *v6;
  size_t v7;

  v6 = (const std::locale *)MEMORY[0x24BD28220]();
  *(_QWORD *)(a1 + 8) = std::locale::use_facet(v6, MEMORY[0x24BEDB350]);
  *(_QWORD *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x24BEDB4B0]);
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  v7 = strlen(a2);
  if (std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(a1, a2, &a2[v7]) != (std::basic_regex<char> *)&a2[v7])
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  return a1;
}

void sub_24B827304(_Unwind_Exception *a1)
{
  std::locale *v1;
  uint64_t v2;

  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v2);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_24B827320(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(uint64_t a1, char *a2, char *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  char *v15;
  std::basic_regex<char> *v16;
  std::__owns_one_state<char> *v17;
  int v18;
  std::basic_regex<char> *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  std::basic_regex<char> *v30;
  char *v31;
  std::__owns_one_state<char> *v32;
  int v33;
  std::basic_regex<char> *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = operator new(8uLL);
  *v6 = &unk_251CB4298;
  v7 = operator new(0x10uLL);
  v7[1] = v6;
  v8 = operator new(0x20uLL);
  *v8 = &unk_251CB42F0;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      v12 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 56) = v12;
      v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
      if (v13 <= 0x3F)
        goto LABEL_6;
LABEL_11:
      if (v13 != 64)
      {
        if (v13 == 128)
          return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(a1, a2, a3);
        if (v13 == 256)
          return std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
LABEL_38:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
    }
  }
  v12 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 56) = v12;
  v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v13 > 0x3F)
    goto LABEL_11;
LABEL_6:
  if (v13)
  {
    if (v13 == 16)
      return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, a2, a3);
    if (v13 != 32)
      goto LABEL_38;
    return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
  }
  v15 = a2;
  while (1)
  {
    v16 = (std::basic_regex<char> *)v15;
    v15 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v15, a3);
    if (v15 == (char *)v16)
      break;
LABEL_17:
    if (v15 == (char *)v16)
      goto LABEL_23;
  }
  v17 = *(std::__owns_one_state<char> **)(a1 + 56);
  v18 = *(_DWORD *)(a1 + 28);
  v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v16, (std::basic_regex<char> *)a3);
  if (v19 != v16)
  {
    v15 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v19, (std::basic_regex<char> *)a3, v17, (v18 + 1), (*(_DWORD *)(a1 + 28) + 1));
    goto LABEL_17;
  }
LABEL_23:
  if (v16 == (std::basic_regex<char> *)a2)
  {
    v20 = operator new(0x10uLL);
    v21 = *(_QWORD *)(a1 + 56);
    v22 = *(_QWORD *)(v21 + 8);
    v20[1] = v22;
    *(_QWORD *)(v21 + 8) = v20;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  if (v16 == (std::basic_regex<char> *)a3)
    return (std::basic_regex<char> *)a3;
  while (2)
  {
    if (LOBYTE(v16->__traits_.__loc_.__locale_) != 124)
      return v16;
    v29 = *(_QWORD *)(a1 + 56);
    v30 = (std::basic_regex<char> *)((char *)&v16->__traits_.__loc_.__locale_ + 1);
    v31 = (char *)&v16->__traits_.__loc_.__locale_ + 1;
    while (2)
    {
      v16 = (std::basic_regex<char> *)v31;
      v31 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v31, a3);
      if (v31 != (char *)v16)
      {
LABEL_32:
        if (v31 == (char *)v16)
          goto LABEL_27;
        continue;
      }
      break;
    }
    v32 = *(std::__owns_one_state<char> **)(a1 + 56);
    v33 = *(_DWORD *)(a1 + 28);
    v34 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v16, (std::basic_regex<char> *)a3);
    if (v34 != v16)
    {
      v31 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v34, (std::basic_regex<char> *)a3, v32, (v33 + 1), (*(_DWORD *)(a1 + 28) + 1));
      goto LABEL_32;
    }
LABEL_27:
    if (v16 == v30)
    {
      v35 = operator new(0x10uLL);
      v36 = *(_QWORD *)(a1 + 56);
      v37 = *(_QWORD *)(v36 + 8);
      v35[1] = v37;
      *(_QWORD *)(v36 + 8) = v35;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    v23 = operator new(0x18uLL);
    v24 = *(_QWORD *)(v29 + 8);
    v23[1] = *(_QWORD *)(v12 + 8);
    v23[2] = v24;
    *v23 = &unk_251CB48B0;
    *(_QWORD *)(v12 + 8) = v23;
    *(_QWORD *)(v29 + 8) = 0;
    v25 = operator new(0x10uLL);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25[1] = v26;
    *(_QWORD *)(v29 + 8) = v25;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
    v27 = operator new(0x10uLL);
    v28 = *(_QWORD *)(v29 + 8);
    *v27 = &unk_251CB48F8;
    v27[1] = v28;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v27;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(v29 + 8);
    if (v16 != (std::basic_regex<char> *)a3)
      continue;
    return (std::basic_regex<char> *)a3;
  }
}

void sub_24B827734(_Unwind_Exception *a1)
{
  void *v1;
  void (__cdecl ***v2)(std::__owns_one_state<char> *__hidden);

  operator delete(v1);
  operator delete(v2);
  (*(void (**)(void *))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_24B827770(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v2 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B8277C0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  char *v7;
  std::basic_regex<char> *v8;
  std::__owns_one_state<char> *v9;
  unsigned int marked_count;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *first;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;
  std::__node<char> *v20;
  std::__owns_one_state<char> *v21;
  std::basic_regex<char> *v22;
  char *v23;
  std::__owns_one_state<char> *v24;
  unsigned int v25;
  std::basic_regex<char> *v26;
  std::__node<char> *v27;
  std::__owns_one_state<char> *v28;
  std::__node<char> *v29;

  end = a1->__end_;
  v7 = a2;
  while (1)
  {
    v8 = (std::basic_regex<char> *)v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v7, a3);
    if (v7 == (char *)v8)
      break;
LABEL_2:
    if (v7 == (char *)v8)
      goto LABEL_6;
  }
  v9 = a1->__end_;
  marked_count = a1->__marked_count_;
  v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, v8);
  if (v11 != v8)
  {
    v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 == (std::basic_regex<char> *)a2)
  {
    v12 = (std::__node<char> *)operator new(0x10uLL);
    v13 = a1->__end_;
    first = v13->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)first;
    v13->__first_ = v12;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  if (v8 == (std::basic_regex<char> *)a3)
    return a3;
  while (2)
  {
    if (LOBYTE(v8->__traits_.__loc_.__locale_) != 124)
      return (char *)v8;
    v21 = a1->__end_;
    v22 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    v23 = (char *)&v8->__traits_.__loc_.__locale_ + 1;
    while (2)
    {
      v8 = (std::basic_regex<char> *)v23;
      v23 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v23, a3);
      if (v23 != (char *)v8)
      {
LABEL_14:
        if (v23 == (char *)v8)
          goto LABEL_17;
        continue;
      }
      break;
    }
    v24 = a1->__end_;
    v25 = a1->__marked_count_;
    v26 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, v8);
    if (v26 != v8)
    {
      v23 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v26, (std::basic_regex<char> *)a3, v24, v25 + 1, a1->__marked_count_ + 1);
      goto LABEL_14;
    }
LABEL_17:
    if (v8 == v22)
    {
      v27 = (std::__node<char> *)operator new(0x10uLL);
      v28 = a1->__end_;
      v29 = v28->__first_;
      v27[1].__vftable = (std::__node<char>_vtbl *)v29;
      v28->__first_ = v27;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    v15 = (std::__node<char> *)operator new(0x18uLL);
    v16 = v21->__first_;
    v15[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
    v15[2].__vftable = (std::__node<char>_vtbl *)v16;
    v15->__vftable = (std::__node<char>_vtbl *)&unk_251CB48B0;
    end->__first_ = v15;
    v21->__first_ = 0;
    v17 = (std::__node<char> *)operator new(0x10uLL);
    v18 = a1->__end_->__first_;
    v17[1].__vftable = (std::__node<char>_vtbl *)v18;
    v21->__first_ = v17;
    a1->__end_->__first_ = 0;
    v19 = (std::__node<char> *)operator new(0x10uLL);
    v20 = v21->__first_;
    v19->__vftable = (std::__node<char>_vtbl *)&unk_251CB48F8;
    v19[1].__vftable = (std::__node<char>_vtbl *)v20;
    a1->__end_->__first_ = v19;
    a1->__end_ = (std::__owns_one_state<char> *)v21->__first_;
    if (v8 != (std::basic_regex<char> *)a3)
      continue;
    return a3;
  }
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(uint64_t a1, char *a2, char *a3)
{
  std::basic_regex<char> *v3;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  std::basic_regex<char> *v10;
  std::__owns_one_state<char> *v11;
  int v12;
  char *v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (std::basic_regex<char> *)a2;
  if (a2 == a3)
    return a2;
  if (*a2 == 94)
  {
    v6 = operator new(0x18uLL);
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *v6 = &unk_251CB43E8;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      v10 = v3;
      v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      v12 = *(_DWORD *)(a1 + 28);
      v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, (uint64_t)v10, a3);
      if (v13 != (char *)v10)
      {
        v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v3 != v10)
          continue;
      }
      if ((char *)&v10->__traits_.__loc_.__locale_ + 1 != a3 || LOBYTE(v10->__traits_.__loc_.__locale_) != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v14 = operator new(0x18uLL);
      v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(v16 + 8);
      *v14 = &unk_251CB4430;
      v14[1] = v17;
      *((_BYTE *)v14 + 16) = v15;
      *(_QWORD *)(v16 + 8) = v14;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  uint64_t v6;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  uint64_t v9;
  std::basic_regex<char> *v10;
  std::basic_regex<char> *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v3 = a3;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v7 == a2)
    goto LABEL_13;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, v7, v3);
  }
  while (v7 != v8);
  if (v8 == a2)
LABEL_13:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 != v3)
  {
    while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
    {
      v9 = *(_QWORD *)(a1 + 56);
      v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
      v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1), v3);
      if (v11 == (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1))
        goto LABEL_13;
      do
      {
        v8 = v11;
        v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, v11, v3);
      }
      while (v11 != v8);
      if (v8 == v10)
        goto LABEL_13;
      v12 = operator new(0x18uLL);
      v13 = *(_QWORD *)(v9 + 8);
      v12[1] = *(_QWORD *)(v6 + 8);
      v12[2] = v13;
      *v12 = &unk_251CB48B0;
      *(_QWORD *)(v6 + 8) = v12;
      *(_QWORD *)(v9 + 8) = 0;
      v14 = operator new(0x10uLL);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14[1] = v15;
      *(_QWORD *)(v9 + 8) = v14;
      *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
      v16 = operator new(0x10uLL);
      v17 = *(_QWORD *)(v9 + 8);
      *v16 = &unk_251CB48F8;
      v16[1] = v17;
      *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v16;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(v9 + 8);
      if (v8 == v3)
        return v3;
    }
    return v8;
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v10 = operator new(0x10uLL);
    v11 = *(_QWORD *)(v6 + 8);
    v10[1] = v11;
    *(_QWORD *)(v6 + 8) = v10;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8 == a3)
      v9 = v8;
    else
      v9 = v8 + 1;
    if (v9 == a3)
      return a3;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, __s, v8);
    if (v8 == a3)
      v9 = v8;
    else
      v9 = v8 + 1;
    if (v9 == a3)
      return a3;
  }
  v12 = *(_QWORD *)(a1 + 56);
  do
  {
    v21 = (char *)memchr(v9, 10, a3 - v9);
    if (v21)
      v22 = v21;
    else
      v22 = a3;
    if (v22 == v9)
    {
      v13 = operator new(0x10uLL);
      v14 = *(_QWORD *)(v12 + 8);
      v13[1] = v14;
      *(_QWORD *)(v12 + 8) = v13;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, v9, v22);
    }
    v15 = operator new(0x18uLL);
    v16 = *(_QWORD *)(v12 + 8);
    v15[1] = *(_QWORD *)(v6 + 8);
    v15[2] = v16;
    *v15 = &unk_251CB48B0;
    *(_QWORD *)(v6 + 8) = v15;
    *(_QWORD *)(v12 + 8) = 0;
    v17 = operator new(0x10uLL);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17[1] = v18;
    *(_QWORD *)(v12 + 8) = v17;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
    v19 = operator new(0x10uLL);
    v20 = *(_QWORD *)(v12 + 8);
    *v19 = &unk_251CB48F8;
    v19[1] = v20;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v19;
    v12 = *(_QWORD *)(v12 + 8);
    *(_QWORD *)(a1 + 56) = v12;
    if (v22 == a3)
      v9 = v22;
    else
      v9 = v22 + 1;
  }
  while (v9 != a3);
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(uint64_t a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  uint64_t v6;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  std::basic_regex<char> *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  std::basic_regex<char> *v21;
  std::basic_regex<char> *v22;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v10 = operator new(0x10uLL);
    v11 = *(_QWORD *)(v6 + 8);
    v10[1] = v11;
    *(_QWORD *)(v6 + 8) = v10;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8 == a3)
      v9 = v8;
    else
      v9 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    if (v9 == a3)
      return a3;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, __s, v8);
    if (v8 == a3)
      v9 = v8;
    else
      v9 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    if (v9 == a3)
      return a3;
  }
  v12 = *(_QWORD *)(a1 + 56);
  do
  {
    v21 = (std::basic_regex<char> *)memchr(v9, 10, (char *)a3 - (char *)v9);
    if (v21)
      v22 = v21;
    else
      v22 = a3;
    if (v22 == v9)
    {
      v13 = operator new(0x10uLL);
      v14 = *(_QWORD *)(v12 + 8);
      v13[1] = v14;
      *(_QWORD *)(v12 + 8) = v13;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, v9, v22);
    }
    v15 = operator new(0x18uLL);
    v16 = *(_QWORD *)(v12 + 8);
    v15[1] = *(_QWORD *)(v6 + 8);
    v15[2] = v16;
    *v15 = &unk_251CB48B0;
    *(_QWORD *)(v6 + 8) = v15;
    *(_QWORD *)(v12 + 8) = 0;
    v17 = operator new(0x10uLL);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17[1] = v18;
    *(_QWORD *)(v12 + 8) = v17;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
    v19 = operator new(0x10uLL);
    v20 = *(_QWORD *)(v12 + 8);
    *v19 = &unk_251CB48F8;
    v19[1] = v20;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v19;
    v12 = *(_QWORD *)(v12 + 8);
    *(_QWORD *)(a1 + 56) = v12;
    if (v22 == a3)
      v9 = v22;
    else
      v9 = (std::basic_regex<char> *)((char *)&v22->__traits_.__loc_.__locale_ + 1);
  }
  while (v9 != a3);
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B8280BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000024B844BF9)
    return a1 + 24;
  if (((v3 & 0x800000024B844BF9 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000024B844BF9))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000024B844BF9 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
}

{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  operator delete(this);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(uint64_t a1, char *a2, char *a3)
{
  int v6;
  char *v7;
  BOOL v8;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v15;
  char *v16;
  uint64_t v17;
  char *v18;
  int v20;
  __int128 v21;
  char *v22;
  unsigned int v23;
  uint64_t v24;
  __int128 v25;
  unsigned int marked_count;
  std::basic_regex<char> v27;

  if (a2 == a3)
    return a2;
  v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        v15 = a2[1];
        if (v15 == 66)
        {
          v16 = (char *)operator new(0x30uLL);
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v16 = &unk_251CB4478;
          *((_QWORD *)v16 + 1) = v24;
          std::locale::locale((std::locale *)v16 + 2, (const std::locale *)a1);
          *(_OWORD *)(v16 + 24) = *(_OWORD *)(a1 + 8);
          v16[40] = 1;
        }
        else
        {
          if (v15 != 98)
            return a2;
          v16 = (char *)operator new(0x30uLL);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v16 = &unk_251CB4478;
          *((_QWORD *)v16 + 1) = v17;
          std::locale::locale((std::locale *)v16 + 2, (const std::locale *)a1);
          *(_OWORD *)(v16 + 24) = *(_OWORD *)(a1 + 8);
          v16[40] = 0;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v16;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return a2 + 2;
      }
      return a2;
    }
    if (v6 != 94)
      return a2;
    v10 = operator new(0x18uLL);
    v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(v12 + 8);
LABEL_14:
    *v10 = v14 + 16;
    v10[1] = v13;
    *((_BYTE *)v10 + 16) = v11;
    *(_QWORD *)(v12 + 8) = v10;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return a2 + 1;
  }
  if (v6 == 36)
  {
    v10 = operator new(0x18uLL);
    v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(v12 + 8);
    goto LABEL_14;
  }
  v8 = v6 == 40;
  v7 = a2 + 1;
  v8 = !v8 || v7 == a3;
  if (v8)
    return a2;
  v8 = *v7 == 63;
  v18 = a2 + 2;
  if (!v8 || v18 == a3)
    return a2;
  v20 = *v18;
  if (v20 == 33)
  {
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v27.__loop_count_ = v25;
    *(_OWORD *)&v27.__start_.__cntrl_ = v25;
    *(_OWORD *)&v27.__traits_.__loc_.__locale_ = v25;
    *(_OWORD *)&v27.__traits_.__col_ = v25;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v27);
    v27.__flags_ = *(_DWORD *)(a1 + 24);
    v22 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v27, a2 + 3, a3);
    marked_count = v27.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v27, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v22 == a3 || *v22 != 41)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    goto LABEL_32;
  }
  if (v20 != 61)
    return a2;
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v27.__loop_count_ = v21;
  *(_OWORD *)&v27.__start_.__cntrl_ = v21;
  *(_OWORD *)&v27.__traits_.__loc_.__locale_ = v21;
  *(_OWORD *)&v27.__traits_.__col_ = v21;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v27);
  v27.__flags_ = *(_DWORD *)(a1 + 24);
  v22 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v27, a2 + 3, a3);
  v23 = v27.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v27, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v23;
  if (v22 == a3 || *v22 != 41)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_32:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v27.__traits_.__loc_);
  return v22 + 1;
}

void sub_24B8285BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_24B8285D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_24B8285E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_24B8285F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  int *p_open_count;
  char *v7;
  std::__node<char> *v8;
  std::__owns_one_state<char> *v9;
  std::__node<char> *v10;
  std::__node<char> *v12;
  unsigned int marked_count;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  char *v16;
  std::__node<char> *v17;
  std::__owns_one_state<char> *v18;
  std::__node<char> *v19;

  v3 = a2;
  if (a2 != a3)
  {
    switch(LOBYTE(a2->__traits_.__loc_.__locale_))
    {
      case '(':
        if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1) == a3)
          goto LABEL_26;
        if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 2) != a3
          && BYTE1(a2->__traits_.__loc_.__locale_) == 63
          && BYTE2(a2->__traits_.__loc_.__locale_) == 58)
        {
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, (char *)&a2->__traits_.__loc_.__locale_ + 3, (char *)a3);
          if (v7 == (char *)a3)
            goto LABEL_26;
          v3 = (std::basic_regex<char> *)v7;
          if (*v7 != 41)
            goto LABEL_26;
        }
        else
        {
          if ((this->__flags_ & 2) != 0)
          {
            marked_count = this->__marked_count_;
          }
          else
          {
            v12 = (std::__node<char> *)operator new(0x18uLL);
            marked_count = this->__marked_count_ + 1;
            this->__marked_count_ = marked_count;
            end = this->__end_;
            first = end->__first_;
            v12->__vftable = (std::__node<char>_vtbl *)&unk_251CB4748;
            v12[1].__vftable = (std::__node<char>_vtbl *)first;
            LODWORD(v12[2].__vftable) = marked_count;
            end->__first_ = v12;
            this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
          }
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, (char *)&v3->__traits_.__loc_.__locale_ + 1, (char *)a3);
          if (v16 == (char *)a3 || (v3 = (std::basic_regex<char> *)v16, *v16 != 41))
LABEL_26:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
          if ((this->__flags_ & 2) == 0)
          {
            v17 = (std::__node<char> *)operator new(0x18uLL);
            v18 = this->__end_;
            v19 = v18->__first_;
            v17->__vftable = (std::__node<char>_vtbl *)&unk_251CB4790;
            v17[1].__vftable = (std::__node<char>_vtbl *)v19;
            LODWORD(v17[2].__vftable) = marked_count;
            v18->__first_ = v17;
            this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
          }
        }
        --*p_open_count;
LABEL_23:
        v3 = (std::basic_regex<char> *)((char *)v3 + 1);
        break;
      case ')':
      case ',':
      case '-':
      case '/':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ':':
      case ';':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'M':
      case 'N':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
      case '*':
      case '+':
      case '?':
        goto LABEL_25;
      case '.':
        v8 = (std::__node<char> *)operator new(0x10uLL);
        v9 = this->__end_;
        v10 = v9->__first_;
        v8->__vftable = (std::__node<char>_vtbl *)&unk_251CB4508;
        v8[1].__vftable = (std::__node<char>_vtbl *)v10;
        v9->__first_ = v8;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        goto LABEL_23;
      case '[':
        return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, (char *)a2, (char *)a3);
      case '\\':
        return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(this, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      default:
        if (LOBYTE(a2->__traits_.__loc_.__locale_) == 123)
LABEL_25:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
    }
  }
  return v3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int v6;
  int locale_low;
  std::basic_regex<char> *v8;
  char *v9;
  size_t v10;
  char *v11;
  int v12;
  int v13;
  char *v14;
  int v15;
  int v16;
  std::basic_regex<char> *v17;
  unsigned __int8 *v18;
  BOOL v20;
  std::basic_regex<char> *v21;
  BOOL v22;
  char *v23;
  size_t v24;
  std::basic_regex<char> *v25;
  int v26;
  int v27;
  std::basic_regex<char> *v28;
  int v29;
  std::basic_regex<char> *v30;
  _BYTE *v31;

  if (this == a3)
    return this;
  v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6)
        v20 = 1;
      else
        v20 = v8 == a3;
      if (!v20 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v10 = 0;
        goto LABEL_35;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v24 = 0;
      goto LABEL_44;
    }
    if (locale_low == 43)
    {
      v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v10 = 1;
LABEL_35:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v10, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v9;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v24 = 1;
      goto LABEL_44;
    }
    return this;
  }
  if (locale_low == 63)
  {
    v21 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6)
      v22 = 1;
    else
      v22 = v21 == a3;
    if (v22 || LOBYTE(v21->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v21;
    }
    else
    {
      v23 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v23;
    }
  }
  else
  {
    if (locale_low != 123)
      return this;
    v11 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_71;
    v12 = *v11;
    if ((v12 & 0xF8) != 0x30 && (v12 & 0xFE) != 0x38)
      goto LABEL_71;
    v13 = v12 - 48;
    v14 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_19:
      v14 = (char *)a3;
    }
    else
    {
      while (1)
      {
        v15 = *v14;
        if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
          break;
        if (v13 >= 214748364)
          goto LABEL_71;
        v13 = v15 + 10 * v13 - 48;
        if (++v14 == (char *)a3)
          goto LABEL_19;
      }
    }
    if (v14 == v11)
      goto LABEL_71;
    if (v14 == (char *)a3)
      goto LABEL_72;
    v16 = *v14;
    if (v16 != 44)
    {
      if (v16 == 125)
      {
        v17 = (std::basic_regex<char> *)(v14 + 1);
        if (v6 || v17 == a3 || LOBYTE(v17->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 1);
          return v17;
        }
        else
        {
          v18 = (unsigned __int8 *)(v14 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v18;
        }
      }
LABEL_71:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    v25 = (std::basic_regex<char> *)(v14 + 1);
    if (v14 + 1 == (char *)a3)
      goto LABEL_71;
    v26 = LOBYTE(v25->__traits_.__loc_.__locale_);
    if (v26 == 125)
    {
      v8 = (std::basic_regex<char> *)(v14 + 2);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        v10 = v13;
        v9 = v14 + 3;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        goto LABEL_35;
      }
      v24 = v13;
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
LABEL_44:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v24, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v8;
    }
    if ((v26 & 0xF8) != 0x30 && (v26 & 0xFE) != 0x38)
      goto LABEL_72;
    v27 = v26 - 48;
    v28 = (std::basic_regex<char> *)(v14 + 2);
    if (v28 == a3)
    {
LABEL_60:
      v28 = a3;
    }
    else
    {
      while (1)
      {
        v29 = LOBYTE(v28->__traits_.__loc_.__locale_);
        if ((v29 & 0xF8) != 0x30 && (v29 & 0xFE) != 0x38)
          break;
        if (v27 >= 214748364)
          goto LABEL_71;
        v27 = v29 + 10 * v27 - 48;
        v28 = (std::basic_regex<char> *)((char *)v28 + 1);
        if (v28 == a3)
          goto LABEL_60;
      }
    }
    if (v28 == v25 || v28 == a3 || LOBYTE(v28->__traits_.__loc_.__locale_) != 125)
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v27 < v13)
      goto LABEL_71;
    v30 = (std::basic_regex<char> *)((char *)&v28->__traits_.__loc_.__locale_ + 1);
    if (v6 || v30 == a3 || LOBYTE(v30->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 1);
      return v30;
    }
    else
    {
      v31 = (char *)&v28->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v31;
    }
  }
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x24BD28220]();
  *(_QWORD *)(a1 + 8) = std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  *(_QWORD *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x24BEDB4B0]);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  return a1;
}

void sub_24B828CA4(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  char *v8;
  std::__node<char> *first;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v8 = (char *)operator new(0x58uLL);
  first = this->__end_->__first_;
  *(_QWORD *)v8 = &unk_251CB44C0;
  *((_QWORD *)v8 + 1) = first;
  std::locale::locale((std::locale *)v8 + 2, &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *((_QWORD *)v8 + 7) = a2->__start_.__ptr_;
  *((_QWORD *)v8 + 8) = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  *((_QWORD *)v8 + 9) = a2->__end_;
  *((_DWORD *)v8 + 20) = a4;
  v8[84] = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B828DA8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;

  if (!*(_BYTE *)(a2 + 92))
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
LABEL_11:
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
    return result;
  }
  if (*(_QWORD *)(a2 + 16) == *(_QWORD *)(a2 + 8) && (*(_BYTE *)(a2 + 88) & 1) == 0)
    goto LABEL_11;
LABEL_12:
  *(_DWORD *)a2 = -993;
  *(_QWORD *)(a2 + 80) = 0;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4478;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4478;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_19;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 != v3)
  {
    if (v4 == v2)
    {
      v5 = *(_DWORD *)(a2 + 88);
      if ((v5 & 0x80) == 0)
      {
        if ((v5 & 4) == 0)
        {
          v6 = *v2;
          if (v6 == 95)
            goto LABEL_17;
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    v7 = *(v4 - 1);
    v8 = *v4;
    if (v7 == 95
      || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
    {
      v9 = 1;
      if ((_DWORD)v8 == 95)
        goto LABEL_24;
    }
    else
    {
      v9 = 0;
      if ((_DWORD)v8 == 95)
        goto LABEL_24;
    }
    if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
    {
      if (*(_BYTE *)(result + 40) == (v9 != 0))
        goto LABEL_20;
      goto LABEL_27;
    }
LABEL_24:
    if (*(_BYTE *)(result + 40) != (v9 != 1))
      goto LABEL_27;
    goto LABEL_20;
  }
  if ((*(_BYTE *)(a2 + 88) & 8) == 0)
  {
    v6 = *(v3 - 1);
    if (v6 == 95)
      goto LABEL_17;
LABEL_15:
    if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
    {
LABEL_17:
      if (*(_BYTE *)(result + 40) != 1)
        goto LABEL_27;
LABEL_20:
      *(_DWORD *)a2 = -993;
      *(_QWORD *)(a2 + 80) = 0;
      return result;
    }
  }
LABEL_19:
  if (!*(_BYTE *)(result + 40))
    goto LABEL_20;
LABEL_27:
  v10 = *(_QWORD *)(result + 8);
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void (__cdecl **v6)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CB44C0;
  v2 = (std::locale *)(a1 + 2);
  v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  std::locale::~locale(v2);
  v6 = a1[1];
  if (v6)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v6 + 1))(v6);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  std::locale *v2;
  std::__shared_weak_count *locale;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::locale::__imp *v6;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB44C0;
  v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale)
  {
    p_shared_owners = (unint64_t *)&locale->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
      std::__shared_weak_count::__release_weak(locale);
    }
  }
  std::locale::~locale(v2);
  v6 = a1[1].__locale_;
  if (v6)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v6 + 8))(v6);
  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  std::vector<std::csub_match>::size_type v5;
  uint64_t v6;
  const char *v7;
  BOOL v8;
  char v9;
  std::sub_match<const char *> *begin;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  std::sub_match<const char *> *v16;
  uint64_t v17;
  std::vector<std::csub_match> __p;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v22 = 0xAAAAAAAAAAAAAA00;
  v24 = v4;
  v21 = 0;
  v23 = 0uLL;
  LOBYTE(v24) = 0;
  BYTE8(v24) = 0;
  v25 = 0;
  memset(&__p, 0, sizeof(__p));
  v5 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)&v19 = *(_QWORD *)(a2 + 24);
  *((_QWORD *)&v19 + 1) = v19;
  LOBYTE(v20) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v5, (std::vector<std::csub_match>::const_reference)&v19);
  *((_QWORD *)&v20 + 1) = v6;
  v21 = v6;
  LOBYTE(v22) = 0;
  v23 = v19;
  LOBYTE(v24) = v20;
  v25 = v6;
  BYTE8(v24) = 1;
  v7 = *(const char **)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(const char **)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v7, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &begin[v15];
    v17 = v14 + 24 * (v13 + v12);
    *(std::pair<const char *, const char *> *)v17 = v16->std::pair<const char *, const char *>;
    *(_BYTE *)(v17 + 16) = v16->matched;
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_24B82943C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  char *v21;
  uint64_t v22;
  const char *v23;
  char *v24;
  void *v25;
  void *v26;
  __int128 v27;
  char *v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _BYTE *v40;
  unsigned int v41;
  uint64_t v42;
  char v43;
  _BYTE v45[96];
  std::vector<std::csub_match>::value_type __x;
  char *v47;
  char *v48;
  unint64_t v49;

  v47 = 0;
  v48 = 0;
  v49 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.second = a3;
    *(_QWORD *)&__x.matched = 0xAAAAAAAAAAAAAA00;
    __x.first = a3;
    *(_DWORD *)v45 = 0;
    memset(&v45[8], 0, 85);
    v48 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v47, (uint64_t)v45);
    if (*(_QWORD *)&v45[56])
    {
      *(_QWORD *)&v45[64] = *(_QWORD *)&v45[56];
      operator delete(*(void **)&v45[56]);
    }
    if (*(_QWORD *)&v45[32])
    {
      *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
      operator delete(*(void **)&v45[32]);
    }
    v13 = v48;
    *((_DWORD *)v48 - 24) = 0;
    *((_QWORD *)v13 - 11) = a2;
    *((_QWORD *)v13 - 10) = a2;
    *((_QWORD *)v13 - 9) = a3;
    v14 = *((_QWORD *)v13 - 8);
    v15 = *(unsigned int *)(a1 + 28);
    v16 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v13 - 7) - v14) >> 3);
    if (v15 <= v16)
    {
      if (v15 < v16)
        *((_QWORD *)v13 - 7) = v14 + 24 * v15;
    }
    else
    {
      std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v13 - 64), v15 - v16, &__x);
      v13 = v48;
    }
    v17 = *((_QWORD *)v13 - 5);
    v18 = *(unsigned int *)(a1 + 32);
    v19 = (*((_QWORD *)v13 - 4) - v17) >> 4;
    if (v18 <= v19)
    {
      if (v18 < v19)
        *((_QWORD *)v13 - 4) = v17 + 16 * v18;
    }
    else
    {
      std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v13 - 40), v18 - v19);
      v13 = v48;
    }
    *((_QWORD *)v13 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *(v13 - 4) = a6;
    v20 = 1;
    while (2)
    {
      if ((v20 & 0xFFF) == 0 && (int)(v20 >> 12) >= (int)a3 - (int)a2)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v22 = *((_QWORD *)v13 - 2);
      if (v22)
        (*(void (**)(uint64_t, char *))(*(_QWORD *)v22 + 16))(v22, v13 - 96);
      switch(*((_DWORD *)v13 - 24))
      {
        case 0xFFFFFC18:
          v23 = (const char *)*((_QWORD *)v13 - 10);
          if ((a5 & 0x20) != 0 && v23 == a2 || (a5 & 0x1000) != 0 && v23 != a3)
            goto LABEL_26;
          v36 = *a4;
          *(_QWORD *)v36 = a2;
          *(_QWORD *)(v36 + 8) = v23;
          *(_BYTE *)(v36 + 16) = 1;
          v37 = *((_QWORD *)v13 - 8);
          v38 = *((_QWORD *)v13 - 7) - v37;
          if (v38)
          {
            v39 = 0xAAAAAAAAAAAAAAABLL * (v38 >> 3);
            v40 = (_BYTE *)(v37 + 16);
            v41 = 1;
            do
            {
              v42 = v36 + 24 * v41;
              *(_OWORD *)v42 = *((_OWORD *)v40 - 1);
              v43 = *v40;
              v40 += 24;
              *(_BYTE *)(v42 + 16) = v43;
            }
            while (v39 > v41++);
          }
          v6 = 1;
          v21 = v47;
          if (!v47)
            return v6;
          goto LABEL_37;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_16;
        case 0xFFFFFC1F:
LABEL_26:
          v24 = v48;
          v25 = (void *)*((_QWORD *)v48 - 5);
          if (v25)
          {
            *((_QWORD *)v48 - 4) = v25;
            operator delete(v25);
          }
          v26 = (void *)*((_QWORD *)v24 - 8);
          if (v26)
          {
            *((_QWORD *)v24 - 7) = v26;
            operator delete(v26);
          }
          v48 = v24 - 96;
          goto LABEL_16;
        case 0xFFFFFC20:
          *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&v45[64] = v27;
          *(_OWORD *)&v45[80] = v27;
          *(_OWORD *)&v45[32] = v27;
          *(_OWORD *)&v45[48] = v27;
          *(_OWORD *)v45 = v27;
          *(_OWORD *)&v45[16] = v27;
          std::__state<char>::__state((uint64_t)v45, (__int128 *)v13 - 6);
          (*(void (**)(_QWORD, uint64_t, char *))(**((_QWORD **)v13 - 2) + 24))(*((_QWORD *)v13 - 2), 1, v13 - 96);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v45[80] + 24))(*(_QWORD *)&v45[80], 0, v45);
          v28 = v48;
          if ((unint64_t)v48 >= v49)
          {
            v48 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v47, (uint64_t)v45);
            if (*(_QWORD *)&v45[56])
            {
              *(_QWORD *)&v45[64] = *(_QWORD *)&v45[56];
              operator delete(*(void **)&v45[56]);
            }
          }
          else
          {
            v29 = *(_OWORD *)&v45[16];
            *(_OWORD *)v48 = *(_OWORD *)v45;
            *((_OWORD *)v28 + 1) = v29;
            *((_QWORD *)v28 + 4) = 0;
            *((_QWORD *)v28 + 5) = 0;
            *((_QWORD *)v28 + 6) = 0;
            *((_QWORD *)v28 + 7) = 0;
            *((_OWORD *)v28 + 2) = *(_OWORD *)&v45[32];
            *((_QWORD *)v28 + 6) = *(_QWORD *)&v45[48];
            memset(&v45[32], 0, 24);
            *((_QWORD *)v28 + 8) = 0;
            *((_QWORD *)v28 + 9) = 0;
            *(_OWORD *)(v28 + 56) = *(_OWORD *)&v45[56];
            *((_QWORD *)v28 + 9) = *(_QWORD *)&v45[72];
            memset(&v45[56], 0, 24);
            v30 = *(_QWORD *)&v45[80];
            *(_QWORD *)(v28 + 85) = *(_QWORD *)&v45[85];
            *((_QWORD *)v28 + 10) = v30;
            v48 = v28 + 96;
          }
          if (*(_QWORD *)&v45[32])
          {
            *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
            operator delete(*(void **)&v45[32]);
          }
LABEL_16:
          v21 = v47;
          v13 = v48;
          ++v20;
          if (v47 != v48)
            continue;
          v6 = 0;
          if (v47)
          {
LABEL_37:
            v31 = v48;
            v32 = v21;
            if (v48 != v21)
            {
              do
              {
                v33 = (void *)*((_QWORD *)v31 - 5);
                if (v33)
                {
                  *((_QWORD *)v31 - 4) = v33;
                  operator delete(v33);
                }
                v34 = (void *)*((_QWORD *)v31 - 8);
                if (v34)
                {
                  *((_QWORD *)v31 - 7) = v34;
                  operator delete(v34);
                }
                v31 -= 96;
              }
              while (v31 != v21);
              v32 = v47;
            }
            v48 = v21;
            operator delete(v32);
          }
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  return v6;
}

void sub_24B829868(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_24B82987C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  std::__state<char>::~__state((uint64_t *)va);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_24B8298C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_24B8298D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  uint64_t v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::sub_match<const char *> *v14;
  std::vector<std::csub_match>::pointer end;
  unint64_t v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) < __n)
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_26;
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    v10 = v8 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v9;
    if (v10 > 0xAAAAAAAAAAAAAAALL)
LABEL_26:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = v10;
    v12 = (std::sub_match<const char *> *)operator new(24 * v10);
    this->__begin_ = v12;
    this->__end_ = v12;
    this->__end_cap_.__value_ = &v12[v11];
    v13 = 24 * __n;
    v14 = &v12[__n];
    do
    {
      v12->std::pair<const char *, const char *> = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v12->matched = *(_QWORD *)&__u->matched;
      ++v12;
      v13 -= 24;
    }
    while (v13);
    goto LABEL_25;
  }
  end = this->__end_;
  v16 = end - begin;
  if (v16 >= __n)
    v17 = __n;
  else
    v17 = end - begin;
  if (v17)
  {
    v18 = begin;
    do
    {
      *v18++ = *__u;
      --v17;
    }
    while (v17);
  }
  if (__n <= v16)
  {
    v14 = &begin[__n];
LABEL_25:
    this->__end_ = v14;
    return;
  }
  v19 = &end[__n - v16];
  v20 = 24 * __n - 24 * v16;
  do
  {
    v21 = __u->std::pair<const char *, const char *>;
    *(_QWORD *)&end->matched = *(_QWORD *)&__u->matched;
    end->std::pair<const char *, const char *> = v21;
    ++end;
    v20 -= 24;
  }
  while (v20);
  this->__end_ = v19;
}

_QWORD *std::__state<char>::~__state(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B829AFC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B829B48(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::__state<char>>::~vector[abi:ne180100](void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 5);
        if (v5)
        {
          *((_QWORD *)v3 - 4) = v5;
          operator delete(v5);
        }
        v6 = (void *)*((_QWORD *)v3 - 8);
        if (v6)
        {
          *((_QWORD *)v3 - 7) = v6;
          operator delete(v6);
        }
        v3 -= 96;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  __int128 v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  void *v22;
  void *v23;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 5);
  v4 = v3 + 1;
  if (v3 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) >= 0x155555555555555)
    v6 = 0x2AAAAAAAAAAAAAALL;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(96 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_OWORD *)(a2 + 16);
  v9 = &v7[96 * v3];
  *(_OWORD *)v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v9 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(v9 + 85) = *(_QWORD *)(a2 + 85);
  v11 = *(_QWORD *)(a2 + 72);
  v12 = *(_QWORD *)(a2 + 80);
  *((_QWORD *)v9 + 9) = 0;
  *((_QWORD *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v9 + 9) = v11;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  v13 = v9 + 96;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = &v9[v16];
      v18 = &v15[v16];
      v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((_QWORD *)v17 - 7) = 0;
      *((_QWORD *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((_QWORD *)v17 - 6) = *(_QWORD *)&v15[v16 - 48];
      *((_QWORD *)v18 - 8) = 0;
      *((_QWORD *)v18 - 7) = 0;
      *((_QWORD *)v18 - 6) = 0;
      *((_QWORD *)v17 - 4) = 0;
      *((_QWORD *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((_QWORD *)v17 - 3) = *(_QWORD *)&v15[v16 - 24];
      *((_QWORD *)v18 - 5) = 0;
      *((_QWORD *)v18 - 4) = 0;
      *((_QWORD *)v18 - 3) = 0;
      v20 = *(_QWORD *)&v15[v16 - 16];
      *(_QWORD *)(v17 - 11) = *(_QWORD *)&v15[v16 - 11];
      *((_QWORD *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    v15 = (char *)*a1;
    v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      v22 = (void *)*((_QWORD *)v21 - 5);
      if (v22)
      {
        *((_QWORD *)v21 - 4) = v22;
        operator delete(v22);
      }
      v23 = (void *)*((_QWORD *)v21 - 8);
      if (v23)
      {
        *((_QWORD *)v21 - 7) = v23;
        operator delete(v23);
      }
      v21 -= 96;
    }
  }
  if (v15)
    operator delete(v15);
  return v13;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::sub_match<const char *> *value;
  std::vector<std::csub_match>::pointer end;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  std::sub_match<const char *> *v13;
  std::vector<std::csub_match>::size_type v14;
  std::pair<const char *, const char *> v15;
  std::sub_match<const char *> *v16;
  std::vector<std::csub_match>::size_type v17;
  std::sub_match<const char *> *v18;
  std::pair<const char *, const char *> *v19;
  std::pair<const char *, const char *> v20;
  std::vector<std::csub_match>::pointer begin;
  std::pair<const char *, const char *> v22;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      v13 = &end[__n];
      v14 = 24 * __n;
      do
      {
        v15 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__x->matched;
        end->std::pair<const char *, const char *> = v15;
        ++end;
        v14 -= 24;
      }
      while (v14);
      end = v13;
    }
    this->__end_ = end;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v12 = (char *)operator new(24 * v11);
    }
    else
    {
      v12 = 0;
    }
    v16 = (std::sub_match<const char *> *)&v12[24 * v8];
    v17 = 24 * __n;
    v18 = &v16[__n];
    v19 = v16;
    do
    {
      v20 = __x->std::pair<const char *, const char *>;
      v19[1].first = *(const char **)&__x->matched;
      *v19 = v20;
      v19 = (std::pair<const char *, const char *> *)((char *)v19 + 24);
      v17 -= 24;
    }
    while (v17);
    begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        v22 = end[-1].std::pair<const char *, const char *>;
        *(_QWORD *)&v16[-1].matched = *(_QWORD *)&end[-1].matched;
        v16[-1].std::pair<const char *, const char *> = v22;
        --v16;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v16;
    this->__end_ = v18;
    this->__end_cap_.__value_ = (std::sub_match<const char *> *)&v12[24 * v11];
    if (end)
      operator delete(end);
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::pair<unsigned long, const char *> *value;
  std::pair<unsigned long, const char *> *end;
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  std::vector<std::pair<unsigned long, const char *>>::size_type v12;
  std::pair<unsigned long, const char *> *v13;
  size_t v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      v12 = 16 * __n;
      bzero(this->__end_, 16 * __n);
      end = (std::pair<unsigned long, const char *> *)((char *)end + v12);
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v7 = end - this->__begin_;
    v8 = v7 + __n;
    if ((v7 + __n) >> 60)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v9 = (char *)value - (char *)begin;
    if (v9 >> 3 > v8)
      v8 = v9 >> 3;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
      v10 = 0xFFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v11 = (char *)operator new(16 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = (std::pair<unsigned long, const char *> *)&v11[16 * v7];
    v14 = __n;
    v15 = (std::pair<unsigned long, const char *> *)&v11[16 * v10];
    bzero(v13, v14 * 16);
    v16 = &v13[v14];
    if (end != begin)
    {
      do
      {
        v13[-1] = end[-1];
        --v13;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
      operator delete(end);
  }
}

uint64_t std::__state<char>::__state(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  _BYTE *v6;
  _BYTE *v7;
  int64_t v8;
  char *v9;
  size_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v7 = (_BYTE *)*((_QWORD *)a2 + 4);
  v6 = (_BYTE *)*((_QWORD *)a2 + 5);
  v8 = v6 - v7;
  if (v6 != v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v8 >> 3) >= 0xAAAAAAAAAAAAAABLL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v9 = (char *)operator new(v8);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v9;
    *(_QWORD *)(a1 + 48) = &v9[8 * (v8 >> 3)];
    v10 = 24 * ((v8 - 24) / 0x18uLL) + 24;
    memcpy(v9, v7, v10);
    *(_QWORD *)(a1 + 40) = &v9[v10];
  }
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v12 = (_BYTE *)*((_QWORD *)a2 + 7);
  v11 = (_BYTE *)*((_QWORD *)a2 + 8);
  v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v14 = (char *)operator new(v11 - v12);
    *(_QWORD *)(a1 + 56) = v14;
    *(_QWORD *)(a1 + 64) = v14;
    *(_QWORD *)(a1 + 72) = &v14[16 * (v13 >> 4)];
    memcpy(v14, v12, v13 & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)(a1 + 64) = &v14[v13 & 0xFFFFFFFFFFFFFFF0];
  }
  v15 = *((_QWORD *)a2 + 10);
  *(_QWORD *)(a1 + 85) = *(_QWORD *)((char *)a2 + 85);
  *(_QWORD *)(a1 + 80) = v15;
  return a1;
}

void sub_24B82A1B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 64) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 40) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  int v7;
  unsigned int v8;
  unsigned __int8 *v10;
  int v11;
  unsigned __int8 *v12;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v7 = *v5;
  v8 = v7 - 48;
  if (v7 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
    return a2 + 2;
  }
  if ((v7 - 49) > 8)
    goto LABEL_18;
  v10 = a2 + 2;
  if (a2 + 2 == a3)
  {
    v10 = a3;
  }
  else
  {
    while (1)
    {
      v11 = *v10;
      if ((v11 - 48) > 9)
        break;
      if (v8 >= 0x19999999)
        goto LABEL_23;
      ++v10;
      v8 = v11 + 10 * v8 - 48;
      if (v10 == a3)
      {
        v10 = a3;
        break;
      }
    }
    if (!v8)
LABEL_23:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  if (v8 > this->__marked_count_)
    goto LABEL_23;
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v8);
  if (v10 == v5)
  {
LABEL_18:
    v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>((uint64_t)this, a2 + 1, a3);
    if (v10 == v5)
    {
      v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(this, a2 + 1, a3, 0);
      if (v12 == v5)
        return a2;
      else
        return v12;
    }
  }
  return v10;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  int v5;
  char v6;
  char *v7;
  void *v8;
  char *v9;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_20;
    v5 = a2[1];
    v6 = v5 == 94;
    v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
    *(_QWORD *)(a1 + 56) = v8;
    if (v7 == a3)
      goto LABEL_20;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3)
      goto LABEL_20;
    do
    {
      v9 = v7;
      v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(a1, v7, a3, (uint64_t)v8);
    }
    while (v7 != v9);
    if (v9 == a3)
      goto LABEL_20;
    if (*v9 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
      ++v9;
    }
    if (v9 == a3 || *v9 != 93)
LABEL_20:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v9 + 1;
  }
  return a2;
}

void sub_24B82A4A0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82A4EC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *result;

  if (this == a3)
    return this;
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '{':
    case '|':
    case '}':
      return this;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
      result = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      break;
  }
  return result;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82A630(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  _DWORD *v5;
  _DWORD *v6;
  int v7;

  v3 = a2;
  if (a2 != a3)
  {
    switch(*a2)
    {
      case 'D':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_7;
      case 'S':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_11;
      case 'W':
        v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_9;
      case 'd':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_7:
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v5;
        *(_QWORD *)(a1 + 56) = v5;
        v7 = v5[40] | 0x400;
        goto LABEL_12;
      case 's':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_11:
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v5;
        *(_QWORD *)(a1 + 56) = v5;
        v7 = v5[40] | 0x4000;
LABEL_12:
        v5[40] = v7;
        goto LABEL_13;
      case 'w':
        v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_9:
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v6;
        *(_QWORD *)(a1 + 56) = v6;
        v6[40] |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v6, 95);
LABEL_13:
        ++v3;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_24B82A814(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B82A828(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B82A83C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B82A850(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B82A864(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B82A878(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  std::basic_regex<char>::value_type v6;
  unsigned __int8 *result;
  unsigned __int8 v8;
  std::basic_regex<char>::value_type v9;
  int v10;
  int v11;
  unsigned __int8 v12;
  char v13;
  unsigned __int8 v14;
  char v15;
  std::basic_regex<char>::value_type v16;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3)
        goto LABEL_81;
      v8 = v4[1];
      if (((v8 & 0xDF) - 65) > 0x19u)
        goto LABEL_81;
      v9 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v9;
        *((_BYTE *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v9);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        v10 = v4[1];
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38 || (v10 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            v11 = *v4;
            if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
              goto LABEL_38;
          }
        }
      }
      goto LABEL_81;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        v6 = 11;
LABEL_65:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_38:
      if (v4 + 1 == a3)
        goto LABEL_81;
      v12 = v4[1];
      v13 = -48;
      if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
        goto LABEL_43;
      v12 |= 0x20u;
      if ((v12 - 97) >= 6u)
        goto LABEL_81;
      v13 = -87;
LABEL_43:
      if (v4 + 2 == a3)
        goto LABEL_81;
      v14 = v4[2];
      v15 = -48;
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      {
        v14 |= 0x20u;
        if ((v14 - 97) >= 6u)
LABEL_81:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        v15 = -87;
      }
      v16 = v14 + 16 * (v12 + v13) + v15;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v16;
      *((_BYTE *)a4 + 1) = 0;
      result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0)
        goto LABEL_81;
      if (!a4)
        goto LABEL_65;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  char *v8;
  std::__node<char> *first;
  std::__node<char> *v10;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    first = this->__end_->__first_;
    *(_QWORD *)v8 = &unk_251CB4550;
    *((_QWORD *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    v10 = this->__end_->__first_;
    *(_QWORD *)v8 = &unk_251CB4598;
    *((_QWORD *)v8 + 1) = v10;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_251CB45E0;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_24B82AE54(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82AECC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  char *v11;

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)(v11 + 16);
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&unk_251CB46B8;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4550;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4550;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(v4 + 8);
  }
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4598;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4598;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4628;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4628;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (!*(_BYTE *)(v3 + 16)
    || (v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3, v5 = *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24) - v5 < v4))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    return result;
  }
  v6 = result;
  if (v4 >= 1)
  {
    v7 = 0;
    while (1)
    {
      v8 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v6 + 24) + 40))(*(_QWORD *)(v6 + 24), *(char *)(*(_QWORD *)v3 + v7));
      result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v6 + 24) + 40))(*(_QWORD *)(v6 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v7));
      if (v8 != (_DWORD)result)
        goto LABEL_3;
      if (v4 == ++v7)
      {
        v5 = *(_QWORD *)(a2 + 16);
        break;
      }
    }
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 16) = v5 + v4;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(v6 + 8);
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4670;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_251CB4670;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (!*(_BYTE *)(v3 + 24 * v2 + 16)
    || (v4 = (unsigned __int8 **)(v3 + 24 * v2),
        v5 = *v4,
        v6 = v4[1] - *v4,
        v7 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v7 < v6))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    return result;
  }
  if (v6 >= 1)
  {
    v8 = v6;
    v9 = *(unsigned __int8 **)(a2 + 16);
    do
    {
      v11 = *v5++;
      v10 = v11;
      v12 = *v9++;
      if (v10 != v12)
        goto LABEL_3;
    }
    while (--v8);
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 16) = v7 + v6;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    *(_QWORD *)(a2 + 80) = *((_QWORD *)v6 + 1);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  return result;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  _QWORD *v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  _BYTE *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  unint64_t v28;
  unint64_t v29;
  __int128 *v30;
  _OWORD *v31;
  unint64_t v32;
  __int128 v33;
  char *v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  __int128 *v38;
  _OWORD *v39;
  unint64_t v40;
  __int128 v41;
  char *v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  __int128 *v46;
  _OWORD *v47;
  unint64_t v48;
  __int128 v49;
  char *v50;
  _QWORD *v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char v55;
  char *v56;
  char v57;
  char *v58;
  char v59;

  v2 = a2;
  if (!*(_BYTE *)(a1 + 169))
  {
    v6 = (_QWORD *)(a1 + 40);
    v5 = *(_BYTE **)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v5 < v16)
        goto LABEL_24;
      v17 = (_BYTE *)*v6;
      v18 = (unint64_t)&v5[-*v6];
      v19 = v18 + 1;
      if ((uint64_t)(v18 + 1) >= 0)
      {
        v20 = v16 - (_QWORD)v17;
        if (2 * v20 > v19)
          v19 = 2 * v20;
        if (v20 >= 0x3FFFFFFFFFFFFFFFLL)
          v21 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        if (v21)
        {
          v12 = operator new(v21);
          v13 = &v12[v18];
          v14 = &v12[v21];
          v12[v18] = v2;
          v15 = (uint64_t)&v12[v18 + 1];
          if (v5 == v17)
            goto LABEL_49;
        }
        else
        {
          v12 = 0;
          v13 = &v5[-*v6];
          v14 = 0;
          *(_BYTE *)v18 = a2;
          v15 = v18 + 1;
          if (v5 == v17)
            goto LABEL_49;
        }
        if (v18 >= 8 && (unint64_t)(v17 - v12) >= 0x20)
        {
          if (v18 >= 0x20)
          {
            v28 = v18 & 0xFFFFFFFFFFFFFFE0;
            v38 = (__int128 *)(v5 - 16);
            v39 = &v12[v5 - 16 - v17];
            v40 = v18 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v41 = *v38;
              *(v39 - 1) = *(v38 - 1);
              *v39 = v41;
              v39 -= 2;
              v38 -= 2;
              v40 -= 32;
            }
            while (v40);
            if (v18 == v28)
              goto LABEL_86;
            if ((v18 & 0x18) == 0)
            {
              v13 -= v28;
              v5 -= v28;
              goto LABEL_80;
            }
          }
          else
          {
            v28 = 0;
          }
          v13 -= v18 & 0xFFFFFFFFFFFFFFF8;
          v42 = &v5[-v28 - 8];
          v43 = &v12[v42 - v17];
          v44 = v28 - (v18 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v45 = *(_QWORD *)v42;
            v42 -= 8;
            *v43-- = v45;
            v44 += 8;
          }
          while (v44);
          v5 -= v18 & 0xFFFFFFFFFFFFFFF8;
          if (v18 == (v18 & 0xFFFFFFFFFFFFFFF8))
            goto LABEL_86;
        }
LABEL_80:
        v56 = v13 - 1;
        do
        {
          v57 = *--v5;
          *v56-- = v57;
        }
        while (v5 != v17);
        goto LABEL_86;
      }
LABEL_89:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if ((unint64_t)v5 < v16)
      goto LABEL_24;
    v23 = (_BYTE *)*v6;
    v24 = (unint64_t)&v5[-*v6];
    v25 = v24 + 1;
    if ((uint64_t)(v24 + 1) < 0)
      goto LABEL_89;
    v26 = v16 - (_QWORD)v23;
    if (2 * v26 > v25)
      v25 = 2 * v26;
    if (v26 >= 0x3FFFFFFFFFFFFFFFLL)
      v27 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v27 = v25;
    if (v27)
    {
      v12 = operator new(v27);
      v13 = &v12[v24];
      v14 = &v12[v27];
      v12[v24] = v2;
      v15 = (uint64_t)&v12[v24 + 1];
      if (v5 == v23)
      {
LABEL_49:
        *(_QWORD *)(a1 + 40) = v13;
        *(_QWORD *)(a1 + 48) = v15;
        *(_QWORD *)(a1 + 56) = v14;
        if (!v5)
          goto LABEL_88;
        goto LABEL_87;
      }
    }
    else
    {
      v12 = 0;
      v13 = &v5[-*v6];
      v14 = 0;
      *(_BYTE *)v24 = a2;
      v15 = v24 + 1;
      if (v5 == v23)
        goto LABEL_49;
    }
    if (v24 >= 8 && (unint64_t)(v23 - v12) >= 0x20)
    {
      if (v24 >= 0x20)
      {
        v29 = v24 & 0xFFFFFFFFFFFFFFE0;
        v46 = (__int128 *)(v5 - 16);
        v47 = &v12[v5 - 16 - v23];
        v48 = v24 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v49 = *v46;
          *(v47 - 1) = *(v46 - 1);
          *v47 = v49;
          v47 -= 2;
          v46 -= 2;
          v48 -= 32;
        }
        while (v48);
        if (v24 == v29)
          goto LABEL_86;
        if ((v24 & 0x18) == 0)
        {
          v13 -= v29;
          v5 -= v29;
          goto LABEL_84;
        }
      }
      else
      {
        v29 = 0;
      }
      v13 -= v24 & 0xFFFFFFFFFFFFFFF8;
      v50 = &v5[-v29 - 8];
      v51 = &v12[v50 - v23];
      v52 = v29 - (v24 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v53 = *(_QWORD *)v50;
        v50 -= 8;
        *v51-- = v53;
        v52 += 8;
      }
      while (v52);
      v5 -= v24 & 0xFFFFFFFFFFFFFFF8;
      if (v24 == (v24 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_86;
    }
LABEL_84:
    v58 = v13 - 1;
    do
    {
      v59 = *--v5;
      *v58-- = v59;
    }
    while (v5 != v23);
    goto LABEL_86;
  }
  v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v5 = *(_BYTE **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)v5 < v4)
  {
LABEL_24:
    *v5 = v2;
    v15 = (uint64_t)(v5 + 1);
    goto LABEL_88;
  }
  v6 = (_QWORD *)(a1 + 40);
  v7 = *(_BYTE **)(a1 + 40);
  v8 = v5 - v7;
  v9 = v5 - v7 + 1;
  if (v9 < 0)
    goto LABEL_89;
  v10 = v4 - (_QWORD)v7;
  if (2 * v10 > v9)
    v9 = 2 * v10;
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = v9;
  if (v11)
  {
    v12 = operator new(v11);
    v13 = &v12[v8];
    v14 = &v12[v11];
    v12[v8] = v2;
    v15 = (uint64_t)&v12[v8 + 1];
    if (v5 == v7)
      goto LABEL_49;
  }
  else
  {
    v12 = 0;
    v13 = (char *)(v5 - v7);
    v14 = 0;
    *(_BYTE *)v8 = v2;
    v15 = v8 + 1;
    if (v5 == v7)
      goto LABEL_49;
  }
  if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20)
    goto LABEL_76;
  if (v8 < 0x20)
  {
    v22 = 0;
    goto LABEL_55;
  }
  v22 = v8 & 0xFFFFFFFFFFFFFFE0;
  v30 = (__int128 *)(v5 - 16);
  v31 = &v12[v5 - 16 - v7];
  v32 = v8 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    v33 = *v30;
    *(v31 - 1) = *(v30 - 1);
    *v31 = v33;
    v31 -= 2;
    v30 -= 2;
    v32 -= 32;
  }
  while (v32);
  if (v8 != v22)
  {
    if ((v8 & 0x18) == 0)
    {
      v13 -= v22;
      v5 -= v22;
      goto LABEL_76;
    }
LABEL_55:
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    v34 = &v5[-v22 - 8];
    v35 = &v12[v34 - v7];
    v36 = v22 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v37 = *(_QWORD *)v34;
      v34 -= 8;
      *v35-- = v37;
      v36 += 8;
    }
    while (v36);
    v5 -= v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_86;
LABEL_76:
    v54 = v13 - 1;
    do
    {
      v55 = *--v5;
      *v54-- = v55;
    }
    while (v5 != v7);
  }
LABEL_86:
  v5 = (_BYTE *)*v6;
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v14;
  if (v5)
LABEL_87:
    operator delete(v5);
LABEL_88:
  *(_QWORD *)(a1 + 48) = v15;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  std::string::size_type size;
  std::string *v14;
  BOOL v15;
  std::locale v17;
  std::string v18;

  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v18.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v18;
    v15 = v14->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v15 = 1;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_24B82BC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  uint64_t v9;
  std::locale *v10;
  void **v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale(&a9);
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v9 + 136));
  v14 = *(void **)(v9 + 112);
  if (v14)
  {
    *(_QWORD *)(v9 + 120) = v14;
    operator delete(v14);
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v11);
    v15 = *(void **)(v9 + 64);
    if (!v15)
    {
LABEL_3:
      v16 = *v12;
      if (!*v12)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else
  {
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v11);
    v15 = *(void **)(v9 + 64);
    if (!v15)
      goto LABEL_3;
  }
  *(_QWORD *)(v9 + 72) = v15;
  operator delete(v15);
  v16 = *v12;
  if (!*v12)
  {
LABEL_5:
    std::locale::~locale(v10);
    v17 = *(_QWORD *)(v9 + 8);
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    _Unwind_Resume(a1);
  }
LABEL_4:
  *(_QWORD *)(v9 + 48) = v16;
  operator delete(v16);
  goto LABEL_5;
}

void **std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0)
LABEL_9:
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale *v1;

  v1 = std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);
  operator delete(v1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v2;
  char *current;
  char *last;
  char v6;
  char v7;
  std::regex_traits<char> *p_traits;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v10;
  uint64_t v11;
  char *p_second;
  std::vector<std::pair<std::string, std::string>>::pointer v14;
  char v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  void **v19;
  char v20;
  void *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  BOOL v24;
  uint64_t v25;
  _BOOL4 negate;
  void *v27;
  unsigned __int8 v28;
  std::vector<char>::pointer v29;
  unint64_t v30;
  int v31;
  std::regex_traits<char>::char_class_type v32;
  char v33;
  int v34;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v36;
  char *v37;
  std::vector<std::pair<std::string, std::string>>::pointer v38;
  std::vector<std::pair<std::string, std::string>>::pointer v39;
  unsigned int v40;
  int64_t v41;
  uint64_t v42;
  unint64_t v43;
  void **v44;
  void *v45;
  uint64_t v46;
  unsigned __int8 *v47;
  BOOL v48;
  int v49;
  char *v50;
  size_t v51;
  size_t v52;
  int v53;
  int v54;
  char *v55;
  size_t v56;
  size_t v57;
  int v58;
  int v59;
  char *v60;
  size_t v61;
  size_t v62;
  int v63;
  int v64;
  char *v65;
  size_t v66;
  size_t v67;
  int v68;
  int v69;
  int v70;
  std::vector<std::string>::pointer v71;
  uint64_t v72;
  int64_t v73;
  unint64_t v74;
  unint64_t v75;
  const void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  BOOL v80;
  std::string *v81;
  void *v82;
  int v83;
  std::string *v84;
  uint64_t v85;
  const void *v86;
  void *v87;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v88;
  std::vector<std::string>::pointer v89;
  int v90;
  int64_t v91;
  unint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  std::string *v98;
  void *v99;
  int v100;
  void **v101;
  uint64_t v102;
  uint64_t v103;
  const void *v104;
  uint64_t v105;
  std::string::size_type size;
  int v107;
  std::vector<std::string>::pointer v108;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v111;
  std::regex_traits<char>::char_class_type neg_mask;
  int v113;
  std::string::size_type v114;
  std::regex_traits<char>::char_class_type v115;
  int v116;
  std::__node<char> *first;
  int v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  std::string::value_type *v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  char v126;
  BOOL v127;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v128;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v129;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v130;
  _BOOL4 v131;
  _BOOL4 v132;
  int v133;
  uint64_t v134;
  int v135;
  void *v136[3];
  __int16 __src;
  void *__p[3];

  v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v25 = 0;
    negate = this->__negate_;
    goto LABEL_245;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_34;
  v6 = *current;
  LOBYTE(__src) = *current;
  v7 = current[1];
  HIBYTE(__src) = v7;
  if (this->__icase_)
  {
    LOBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  p_traits = &this->__traits_;
  std::regex_traits<char>::__lookup_collatename<char *>(&__src, (uint64_t)&this->__traits_, __p, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    v27 = __p[1];
    operator delete(__p[0]);
    if (v27)
      goto LABEL_8;
LABEL_34:
    negate = 0;
    v25 = 1;
    v28 = *v2->__current_;
    LOBYTE(__src) = v28;
    if (!this->__icase_)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (!HIBYTE(__p[2]))
    goto LABEL_34;
LABEL_8:
  begin = this->__digraphs_.__begin_;
  v10 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v10)
  {
    v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1)
      v11 = 1;
    p_second = &begin->second;
    while (__src != *(p_second - 1) || HIBYTE(__src) != *p_second)
    {
      p_second += 2;
      if (!--v11)
        goto LABEL_17;
    }
    goto LABEL_227;
  }
LABEL_17:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    negate = 0;
    goto LABEL_167;
  }
  memset(v136, 170, sizeof(v136));
  __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  __p[2] = (void *)0x2AAAAAAAAAAAAAALL;
  __p[0] = (void *)0xAAAAAAAAAA00AAAALL;
  LOWORD(__p[0]) = __src;
  (*(void (**)(void **__return_ptr, const std::collate<char> *, void **, char *))(*(_QWORD *)this->__traits_.__col_
                                                                                           + 32))(v136, this->__traits_.__col_, __p, (char *)__p + 2);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  v14 = this->__ranges_.__begin_;
  v15 = HIBYTE(v136[2]);
  v16 = (char *)this->__ranges_.__end_ - (char *)v14;
  if (!v16)
  {
    v24 = 0;
    v70 = 0;
    v69 = 0;
    goto LABEL_164;
  }
  v128 = v2;
  v17 = 0;
  v18 = v16 / 48;
  if (SHIBYTE(v136[2]) >= 0)
    v19 = v136;
  else
    v19 = (void **)v136[0];
  v20 = HIBYTE(v136[2]);
  if (SHIBYTE(v136[2]) >= 0)
    v21 = (void *)HIBYTE(v136[2]);
  else
    v21 = v136[1];
  if (v18 <= 1)
    v22 = 1;
  else
    v22 = v16 / 48;
  v23 = (unsigned __int8 *)&v14->second.__r_.__value_.__r.__words[2] + 7;
  v24 = 1;
  do
  {
    v59 = (char)*(v23 - 24);
    if (v59 >= 0)
      v60 = (char *)(v23 - 47);
    else
      v60 = *(char **)(v23 - 47);
    if (v59 >= 0)
      v61 = *(v23 - 24);
    else
      v61 = *(_QWORD *)(v23 - 39);
    if ((unint64_t)v21 >= v61)
      v62 = v61;
    else
      v62 = (size_t)v21;
    v63 = memcmp(v60, v19, v62);
    if (v63)
    {
      if ((v63 & 0x80000000) == 0)
        goto LABEL_98;
    }
    else if (v61 > (unint64_t)v21)
    {
      goto LABEL_98;
    }
    v64 = (char)*v23;
    if (v64 >= 0)
      v65 = (char *)(v23 - 23);
    else
      v65 = *(char **)(v23 - 23);
    if (v64 >= 0)
      v66 = *v23;
    else
      v66 = *(_QWORD *)(v23 - 15);
    if (v66 >= (unint64_t)v21)
      v67 = (size_t)v21;
    else
      v67 = v66;
    v68 = memcmp(v19, v65, v67);
    if (v68)
    {
      if (v68 < 0)
      {
LABEL_123:
        v69 = 1;
        v70 = 5;
        goto LABEL_162;
      }
    }
    else if ((unint64_t)v21 <= v66)
    {
      goto LABEL_123;
    }
LABEL_98:
    v24 = ++v17 < v18;
    v23 += 48;
  }
  while (v22 != v17);
  v70 = 0;
  v69 = 0;
LABEL_162:
  v2 = v128;
  p_traits = &this->__traits_;
  v15 = v20;
LABEL_164:
  if (v15 < 0)
    operator delete(v136[0]);
  negate = v69;
  if (v24)
    goto LABEL_207;
LABEL_167:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_209;
  v133 = negate;
  v88 = v2;
  memset(__p, 170, sizeof(__p));
  std::regex_traits<char>::__transform_primary<char *>(&__src, (uint64_t)p_traits, __p, __p);
  v89 = this->__equivalences_.__begin_;
  v90 = SHIBYTE(__p[2]);
  v91 = (char *)this->__equivalences_.__end_ - (char *)v89;
  if (!v91)
    goto LABEL_188;
  v92 = v91 / 24;
  v93 = __p[1];
  if (SHIBYTE(__p[2]) >= 0)
    v94 = (void *)HIBYTE(__p[2]);
  else
    v94 = __p[1];
  if (SHIBYTE(__p[2]) < 0)
  {
    v135 = SHIBYTE(__p[2]);
    v103 = 0;
    v104 = __p[0];
    if (v92 <= 1)
      v105 = 1;
    else
      v105 = v91 / 24;
    v97 = 1;
    do
    {
      size = HIBYTE(v89->__r_.__value_.__r.__words[2]);
      v107 = (char)size;
      if ((size & 0x80u) != 0)
        size = v89->__r_.__value_.__l.__size_;
      if (v94 == (void *)size)
      {
        v108 = v107 >= 0 ? v89 : (std::vector<std::string>::pointer)v89->__r_.__value_.__r.__words[0];
        if (!memcmp(v104, v108, (size_t)v93))
        {
          v133 = 1;
          v70 = 5;
          goto LABEL_203;
        }
      }
      v97 = ++v103 < v92;
      ++v89;
    }
    while (v105 != v103);
    v70 = 0;
LABEL_203:
    v2 = v88;
    v90 = v135;
    goto LABEL_204;
  }
  if (!HIBYTE(__p[2]))
  {
    v114 = HIBYTE(v89->__r_.__value_.__r.__words[2]);
    if ((v114 & 0x80u) != 0)
      v114 = v89->__r_.__value_.__l.__size_;
    if (v114 != HIBYTE(__p[2]))
    {
      v119 = 0;
      if (v92 <= 1)
        v120 = 1;
      else
        v120 = v92;
      v121 = v120 - 1;
      v122 = &v89[1].__r_.__value_.__s.__data_[8];
      v2 = v88;
      while (v121 != v119)
      {
        ++v119;
        v123 = v122[15];
        v125 = *(_QWORD *)v122;
        v122 += 24;
        v124 = v125;
        if ((v123 & 0x80u) != 0)
          v123 = v124;
        if (v94 == (void *)v123)
        {
          v97 = v119 < v92;
          v133 = 1;
          v70 = 5;
          goto LABEL_204;
        }
      }
      v97 = 0;
      v70 = 0;
      goto LABEL_204;
    }
    v2 = v88;
    negate = 1;
LABEL_208:
    v25 = 2;
    goto LABEL_245;
  }
  v95 = 0;
  v96 = v92 <= 1 ? 1 : v91 / 24;
  v97 = 1;
  do
  {
    v98 = &v89[v95];
    v99 = (void *)HIBYTE(v98->__r_.__value_.__r.__words[2]);
    v100 = (char)v99;
    if ((char)v99 < 0)
      v99 = (void *)v98->__r_.__value_.__l.__size_;
    if (v94 == v99)
    {
      if (v100 < 0)
        v98 = (std::string *)v98->__r_.__value_.__r.__words[0];
      v101 = __p;
      v102 = HIBYTE(__p[2]);
      while (*(unsigned __int8 *)v101 == v98->__r_.__value_.__s.__data_[0])
      {
        v101 = (void **)((char *)v101 + 1);
        v98 = (std::string *)((char *)v98 + 1);
        if (!--v102)
        {
          v133 = 1;
          v70 = 5;
          v2 = v88;
          goto LABEL_204;
        }
      }
    }
    v97 = ++v95 < v92;
  }
  while (v95 != v96);
LABEL_188:
  v97 = 0;
  v70 = 0;
  v2 = v88;
LABEL_204:
  if (v90 < 0)
    operator delete(__p[0]);
  negate = v133;
  if (!v97)
  {
LABEL_209:
    if ((char)__src < 0)
    {
      neg_mask = this->__neg_mask_;
    }
    else
    {
      mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      v111 = tab[__src];
      if (((v111 & mask) != 0 || __src == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((tab[HIBYTE(__src)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_227;
      }
      neg_mask = this->__neg_mask_;
      if ((neg_mask & v111) != 0 || __src == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_226:
        v113 = negate;
LABEL_228:
        negate = v113;
        v25 = 2;
        goto LABEL_245;
      }
    }
    if ((SHIBYTE(__src) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(__src)] & neg_mask) == 0)
      {
        v113 = 1;
        if (HIBYTE(__src) != 95 || (neg_mask & 0x80) == 0)
          goto LABEL_228;
      }
      goto LABEL_226;
    }
LABEL_227:
    v113 = 1;
    goto LABEL_228;
  }
LABEL_207:
  if (v70)
    goto LABEL_208;
  v25 = 2;
  v28 = *v2->__current_;
  LOBYTE(__src) = v28;
  if (this->__icase_)
  {
LABEL_35:
    v28 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v28);
    LOBYTE(__src) = v28;
  }
LABEL_36:
  v29 = this->__chars_.__begin_;
  v30 = this->__chars_.__end_ - v29;
  if (v30)
  {
    if (v30 <= 1)
      v30 = 1;
    while (1)
    {
      v31 = *v29++;
      if (v31 == v28)
        break;
      if (!--v30)
        goto LABEL_41;
    }
LABEL_244:
    negate = 1;
    goto LABEL_245;
  }
LABEL_41:
  v32 = this->__neg_mask_;
  if (v32 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v28 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v28] & v32) == 0)
    {
      v34 = (v32 >> 7) & 1;
      v33 = v28 == 95 ? v34 : 0;
    }
    else
    {
      v33 = 1;
    }
    end = this->__neg_chars_.__end_;
    v36 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v28, end - this->__neg_chars_.__begin_);
    v37 = v36 ? v36 : end;
    if ((v33 & 1) == 0 && v37 == end)
      goto LABEL_244;
  }
  v38 = this->__ranges_.__begin_;
  v39 = this->__ranges_.__end_;
  if (v38 == v39)
    goto LABEL_128;
  memset(v136, 170, sizeof(v136));
  if (!this->__collate_)
  {
    v40 = 1;
    HIBYTE(v136[2]) = 1;
    LOWORD(v136[0]) = v28;
    v41 = (char *)v39 - (char *)v38;
    if (v41)
      goto LABEL_59;
LABEL_155:
    v48 = 0;
    if ((v40 & 0x80) != 0)
      goto LABEL_126;
    goto LABEL_127;
  }
  __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  __p[2] = (void *)0x1AAAAAAAAAAAAAALL;
  __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
  LOWORD(__p[0]) = v28;
  (*(void (**)(void **__return_ptr, const std::collate<char> *, void **, char *))(*(_QWORD *)this->__traits_.__col_
                                                                                           + 32))(v136, this->__traits_.__col_, __p, (char *)__p + 1);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  v38 = this->__ranges_.__begin_;
  v40 = HIBYTE(v136[2]);
  v41 = (char *)this->__ranges_.__end_ - (char *)v38;
  if (!v41)
    goto LABEL_155;
LABEL_59:
  v134 = v25;
  v131 = negate;
  v129 = v2;
  v42 = 0;
  v43 = v41 / 48;
  v126 = v40;
  if ((v40 & 0x80u) == 0)
    v44 = v136;
  else
    v44 = (void **)v136[0];
  if ((v40 & 0x80u) == 0)
    v45 = (void *)v40;
  else
    v45 = v136[1];
  if (v43 <= 1)
    v46 = 1;
  else
    v46 = v41 / 48;
  v47 = (unsigned __int8 *)&v38->second.__r_.__value_.__r.__words[2] + 7;
  v48 = 1;
  while (2)
  {
    v49 = (char)*(v47 - 24);
    if (v49 >= 0)
      v50 = (char *)(v47 - 47);
    else
      v50 = *(char **)(v47 - 47);
    if (v49 >= 0)
      v51 = *(v47 - 24);
    else
      v51 = *(_QWORD *)(v47 - 39);
    if ((unint64_t)v45 >= v51)
      v52 = v51;
    else
      v52 = (size_t)v45;
    v53 = memcmp(v50, v44, v52);
    if (v53)
    {
      if (v53 < 0)
        goto LABEL_84;
    }
    else if (v51 <= (unint64_t)v45)
    {
LABEL_84:
      v54 = (char)*v47;
      if (v54 >= 0)
        v55 = (char *)(v47 - 23);
      else
        v55 = *(char **)(v47 - 23);
      if (v54 >= 0)
        v56 = *v47;
      else
        v56 = *(_QWORD *)(v47 - 15);
      if (v56 >= (unint64_t)v45)
        v57 = (size_t)v45;
      else
        v57 = v56;
      v58 = memcmp(v44, v55, v57);
      if (v58)
      {
        if (v58 < 0)
        {
LABEL_95:
          negate = 1;
          v2 = v129;
          v25 = v134;
          if ((v126 & 0x80) == 0)
            goto LABEL_127;
          goto LABEL_126;
        }
      }
      else if ((unint64_t)v45 <= v56)
      {
        goto LABEL_95;
      }
    }
    v48 = ++v42 < v43;
    v47 += 48;
    if (v46 != v42)
      continue;
    break;
  }
  v2 = v129;
  negate = v131;
  v25 = v134;
  if ((v126 & 0x80) == 0)
    goto LABEL_127;
LABEL_126:
  operator delete(v136[0]);
LABEL_127:
  if (v48)
    goto LABEL_245;
LABEL_128:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_239:
    if ((v28 & 0x80) != 0)
      goto LABEL_245;
    v115 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v28] & v115) == 0)
    {
      v116 = (v115 >> 7) & 1;
      if (v28 != 95)
        v116 = 0;
      if (v116 != 1)
        goto LABEL_245;
    }
    goto LABEL_244;
  }
  memset(__p, 170, sizeof(__p));
  std::regex_traits<char>::__transform_primary<char *>(&__src, (uint64_t)&this->__traits_, (_BYTE *)&__src + 1, __p);
  v71 = this->__equivalences_.__begin_;
  v72 = HIBYTE(__p[2]);
  v73 = (char *)this->__equivalences_.__end_ - (char *)v71;
  if (!v73)
  {
    if ((HIBYTE(__p[2]) & 0x80) != 0)
      operator delete(__p[0]);
LABEL_238:
    v28 = __src;
    goto LABEL_239;
  }
  v132 = negate;
  v130 = v2;
  v74 = 0;
  v75 = v73 / 24;
  v76 = __p[0];
  v77 = __p[1];
  if (SHIBYTE(__p[2]) >= 0)
    v78 = (void *)HIBYTE(__p[2]);
  else
    v78 = __p[1];
  if (v75 <= 1)
    v79 = 1;
  else
    v79 = v73 / 24;
  v80 = 1;
  while (2)
  {
    v81 = &v71[v74];
    v82 = (void *)HIBYTE(v81->__r_.__value_.__r.__words[2]);
    v83 = (char)v82;
    if ((char)v82 < 0)
      v82 = (void *)v81->__r_.__value_.__l.__size_;
    if (v78 != v82)
    {
LABEL_149:
      if (++v74 == v79)
      {
        if ((v72 & 0x80) != 0)
LABEL_236:
          operator delete(__p[0]);
        v2 = v130;
        negate = v132;
        goto LABEL_238;
      }
      goto LABEL_153;
    }
    if (v83 >= 0)
      v84 = &v71[v74];
    else
      v84 = (std::string *)v81->__r_.__value_.__r.__words[0];
    if ((v72 & 0x80) == 0)
    {
      if (!(_DWORD)v72)
      {
LABEL_157:
        v2 = v130;
        negate = 1;
        if (!v80)
          goto LABEL_238;
        goto LABEL_245;
      }
      v85 = 0;
      while (*((unsigned __int8 *)__p + v85) == v84->__r_.__value_.__s.__data_[v85])
      {
        if (v72 == ++v85)
          goto LABEL_157;
      }
      goto LABEL_149;
    }
    v127 = v80;
    v86 = v76;
    v87 = v77;
    if (memcmp(v76, v84, (size_t)v77))
    {
      ++v74;
      v77 = v87;
      v76 = v86;
      if (v74 == v79)
        goto LABEL_236;
LABEL_153:
      v80 = v74 < v75;
      continue;
    }
    break;
  }
  operator delete(__p[0]);
  v2 = v130;
  negate = 1;
  if (!v127)
    goto LABEL_238;
LABEL_245:
  if (negate == this->__negate_)
  {
    first = 0;
    v118 = -993;
  }
  else
  {
    v2->__current_ += v25;
    first = this->__first_;
    v118 = -995;
  }
  v2->__do_ = v118;
  v2->__node_ = first;
}

void sub_24B82C878(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale::__imp *v6;
  std::locale::__imp *v7;
  std::locale::__imp *v8;
  std::locale::__imp *v9;
  std::locale::__imp *v10;
  std::locale::__imp *v11;

  locale = a1[17].__locale_;
  if (locale)
  {
    v3 = a1[18].__locale_;
    v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*((void **)v3 - 3));
        v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  v6 = a1[11].__locale_;
  if (v6)
  {
    v7 = a1[12].__locale_;
    v8 = a1[11].__locale_;
    if (v7 == v6)
    {
LABEL_21:
      a1[12].__locale_ = v6;
      operator delete(v8);
      goto LABEL_22;
    }
    while (1)
    {
      if (*((char *)v7 - 1) < 0)
      {
        operator delete(*((void **)v7 - 3));
        if (*((char *)v7 - 25) < 0)
LABEL_19:
          operator delete(*((void **)v7 - 6));
      }
      else if (*((char *)v7 - 25) < 0)
      {
        goto LABEL_19;
      }
      v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v9 = a1[8].__locale_;
  if (v9)
  {
    a1[9].__locale_ = v9;
    operator delete(v9);
  }
  v10 = a1[5].__locale_;
  if (v10)
  {
    a1[6].__locale_ = v10;
    operator delete(v10);
  }
  std::locale::~locale(a1 + 2);
  v11 = a1[1].__locale_;
  if (v11)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v11 + 8))(v11);
  return a1;
}

void std::regex_traits<char>::__lookup_collatename<char *>(_BYTE *__src@<X1>, uint64_t a2@<X0>, _BYTE *a3@<X2>, uint64_t a4@<X8>)
{
  size_t v5;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _BYTE *v18;
  size_t v19;
  std::string v20;
  _BYTE __dst[24];

  v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v5 <= 0x16)
  {
    __dst[23] = (_BYTE)a3 - (_BYTE)__src;
    v9 = __dst;
    if (__src == a3)
      goto LABEL_9;
LABEL_8:
    memcpy(v9, __src, v5);
    v9 += v5;
    goto LABEL_9;
  }
  v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17)
    v10 = v5 | 7;
  v11 = v10 + 1;
  v9 = operator new(v10 + 1);
  *(_QWORD *)&__dst[8] = v5;
  *(_QWORD *)&__dst[16] = v11 | 0x8000000000000000;
  *(_QWORD *)__dst = v9;
  if (__src != a3)
    goto LABEL_8;
LABEL_9:
  *v9 = 0;
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    v12 = *(char **)__dst;
    if (!*(_QWORD *)&__dst[8])
      goto LABEL_18;
  }
  else
  {
    if (!__dst[23])
      return;
    v12 = __dst;
  }
  std::__get_collation_name(&v20, v12);
  *(_OWORD *)a4 = *(_OWORD *)&v20.__r_.__value_.__l.__data_;
  v13 = v20.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v20.__r_.__value_.__l + 2);
  v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0)
    v14 = *(_QWORD *)(a4 + 8);
  if (v14)
    goto LABEL_16;
  if ((__dst[23] & 0x80000000) != 0)
  {
    v15 = *(_QWORD *)&__dst[8];
    v12 = *(char **)__dst;
    if (*(_QWORD *)&__dst[8] < 3uLL)
      goto LABEL_24;
LABEL_18:
    operator delete(v12);
    return;
  }
  v15 = __dst[23];
  if (__dst[23] < 3u)
  {
    v12 = __dst;
LABEL_24:
    (*(void (**)(std::string *__return_ptr, _QWORD, char *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v20, *(_QWORD *)(a2 + 16), v12, &v12[v15]);
    if (*(char *)(a4 + 23) < 0)
      operator delete(*(void **)a4);
    *(std::string *)a4 = v20;
    if (*(char *)(a4 + 23) < 0)
    {
      v17 = *(_QWORD *)(a4 + 8);
      if (v17 == 1 || v17 == 12)
      {
        if (__dst != (_BYTE *)a4)
        {
          if (__dst[23] >= 0)
            v18 = __dst;
          else
            v18 = *(_BYTE **)__dst;
          if (__dst[23] >= 0)
            v19 = __dst[23];
          else
            v19 = *(_QWORD *)&__dst[8];
          std::string::__assign_no_alias<false>((void **)a4, v18, v19);
        }
      }
      else
      {
        **(_BYTE **)a4 = 0;
        *(_QWORD *)(a4 + 8) = 0;
      }
    }
    else
    {
      v16 = *(unsigned __int8 *)(a4 + 23);
      if (v16 == 1 || v16 == 12)
      {
        if (__dst != (_BYTE *)a4)
        {
          if ((__dst[23] & 0x80000000) != 0)
          {
            std::string::__assign_no_alias<true>((_QWORD *)a4, *(void **)__dst, *(size_t *)&__dst[8]);
          }
          else
          {
            *(_OWORD *)a4 = *(_OWORD *)__dst;
            *(_QWORD *)(a4 + 16) = *(_QWORD *)&__dst[16];
          }
        }
      }
      else
      {
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 23) = 0;
      }
    }
LABEL_16:
    if ((__dst[23] & 0x80000000) == 0)
      return;
    v12 = *(char **)__dst;
    goto LABEL_18;
  }
}

void sub_24B82CC88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<char *>(_BYTE *__src@<X1>, uint64_t a2@<X0>, _BYTE *a3@<X2>, _QWORD *a4@<X8>)
{
  size_t v5;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void **v13;
  uint64_t v14;
  int v15;
  _BYTE *v16;
  void *__dst[3];

  v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v5 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a3 - (_BYTE)__src;
    v9 = __dst;
    if (__src == a3)
      goto LABEL_9;
LABEL_8:
    memcpy(v9, __src, v5);
    v9 = (void **)((char *)v9 + v5);
    goto LABEL_9;
  }
  v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17)
    v10 = v5 | 7;
  v11 = v10 + 1;
  v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v5;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a3)
    goto LABEL_8;
LABEL_9:
  *(_BYTE *)v9 = 0;
  memset(a4, 170, 24);
  v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0)
    v13 = __dst;
  else
    v13 = (void **)__dst[0];
  if (SHIBYTE(__dst[2]) < 0)
    v12 = (char *)__dst[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v13, &v12[(_QWORD)v13]);
  v14 = *((unsigned __int8 *)a4 + 23);
  v15 = (char)v14;
  if ((v14 & 0x80u) != 0)
    v14 = a4[1];
  if (v14 == 1)
  {
LABEL_25:
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      return;
    goto LABEL_26;
  }
  if (v14 == 12)
  {
    if (v15 >= 0)
      v16 = a4;
    else
      v16 = (_BYTE *)*a4;
    v16[11] = v16[3];
    if (SHIBYTE(__dst[2]) < 0)
      goto LABEL_26;
    return;
  }
  if ((v15 & 0x80000000) == 0)
  {
    *(_BYTE *)a4 = 0;
    *((_BYTE *)a4 + 23) = 0;
    goto LABEL_25;
  }
  *(_BYTE *)*a4 = 0;
  a4[1] = 0;
  if (SHIBYTE(__dst[2]) < 0)
LABEL_26:
    operator delete(__dst[0]);
}

void sub_24B82CE5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82CEB0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v4;
  int v5;
  char *v6;
  int v9;
  int v10;
  char v11;
  _BYTE *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  char *v15;
  int v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int v21;
  char *v22;
  uint64_t v23;
  int v24;
  int v25;
  std::basic_regex<char>::value_type *v26;
  char *v27;
  char *v28;
  int v29;
  void **v30;
  _BYTE *v31;
  char *v32;
  _BYTE *v34;
  void *v35[2];
  uint64_t v36;
  void *v37[2];
  uint64_t v38;
  void *__p[2];
  uint64_t v40;
  __int128 v41;
  int64_t v42;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if (v5 == 93)
    return v4;
  v6 = (char *)a4;
  v9 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v40 = 0;
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_38:
    v24 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_33;
  }
  v10 = a2[1];
  if (v10 != 46)
  {
    if (v10 != 58)
    {
      if (v10 == 61)
      {
        v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(a1, a2 + 2, a3, a4);
        v11 = 0;
        if ((SHIBYTE(v40) & 0x80000000) == 0)
          goto LABEL_64;
        goto LABEL_63;
      }
      v9 = 0;
      goto LABEL_38;
    }
    v12 = a2 + 2;
    if (a3 - (v4 + 2) >= 2)
    {
      v13 = 0;
      v14 = (unsigned __int8 *)v4;
      if (v4[2] == 58)
        goto LABEL_14;
      do
      {
        do
        {
          if (a3 - v4 - 4 == v13)
            goto LABEL_89;
          v14 = (unsigned __int8 *)&v4[++v13];
        }
        while (v4[v13 + 2] != 58);
LABEL_14:
        ;
      }
      while (v14[3] != 93);
      v15 = &v4[v13 + 2];
      if (v15 != a3)
      {
        v16 = std::regex_traits<char>::__lookup_classname<char const*>(a1, v12, v15, *(_DWORD *)(a1 + 24) & 1);
        if (!v16)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
        v11 = 0;
        *((_DWORD *)v6 + 40) |= v16;
        v6 = &v4[v13 + 4];
        if (SHIBYTE(v40) < 0)
          goto LABEL_63;
        goto LABEL_64;
      }
    }
LABEL_89:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  v17 = a2 + 2;
  if (a3 - (v4 + 2) < 2)
    goto LABEL_89;
  v18 = a3 - v4 - 4;
  v19 = v4 + 2;
  v20 = v17 + 1;
  if (*v17 == 46)
    goto LABEL_23;
  do
  {
    do
    {
      if (!v18)
        goto LABEL_89;
      --v18;
      v19 = v20;
      v21 = *v20++;
    }
    while (v21 != 46);
LABEL_23:
    ;
  }
  while (*v20 != 93);
  if (v19 == a3)
    goto LABEL_89;
  std::regex_traits<char>::__lookup_collatename<char const*>(v17, a1, v19, (uint64_t)&v41);
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  v40 = v42;
  *(_OWORD *)__p = v41;
  v22 = (char *)HIBYTE(v42);
  v9 = SHIBYTE(v42);
  v23 = *((_QWORD *)&v41 + 1);
  if (v42 < 0)
    v22 = (char *)__p[1];
  if ((unint64_t)(v22 - 1) >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  v4 = v19 + 2;
  v24 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v42 >= 0)
    v23 = HIBYTE(v42);
  if (v23)
  {
    v28 = v4;
    if (v4 == a3)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_33:
  if ((v24 | 0x40) != 0x40)
  {
    LOBYTE(v25) = *v4;
LABEL_57:
    if (v9 < 0)
    {
      v34 = __p[0];
      __p[1] = (void *)1;
      *(_BYTE *)__p[0] = v25;
      v34[1] = 0;
      v28 = v4 + 1;
      if (v4 + 1 == a3)
        goto LABEL_41;
    }
    else
    {
      HIBYTE(v40) = 1;
      LOWORD(__p[0]) = v25;
      v28 = v4 + 1;
      if (v4 + 1 == a3)
        goto LABEL_41;
    }
    goto LABEL_40;
  }
  v25 = *v4;
  if (v25 != 92)
    goto LABEL_57;
  v26 = v4 + 1;
  if (v24)
    v27 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v26, a3, (uint64_t *)__p);
  else
    v27 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v26, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v6);
  v28 = v27;
  if (v27 == a3)
  {
LABEL_41:
    if (SHIBYTE(v40) < 0)
    {
      if (!__p[1])
        goto LABEL_62;
      if (__p[1] != (void *)1)
      {
        v30 = (void **)__p[0];
LABEL_61:
        std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v6, *(char *)v30, *((char *)v30 + 1));
LABEL_62:
        v11 = 1;
        v4 = v28;
        if ((SHIBYTE(v40) & 0x80000000) == 0)
          goto LABEL_64;
        goto LABEL_63;
      }
      v30 = (void **)__p[0];
    }
    else
    {
      if (!HIBYTE(v40))
        goto LABEL_62;
      v30 = __p;
      if (HIBYTE(v40) != 1)
        goto LABEL_61;
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v6, *(char *)v30);
    goto LABEL_62;
  }
LABEL_40:
  v29 = *v28;
  if (v29 == 93)
    goto LABEL_41;
  v31 = v28 + 1;
  if (v28 + 1 == a3 || v29 != 45 || *v31 == 93)
    goto LABEL_41;
  v41 = 0uLL;
  v42 = 0;
  v4 = v28 + 2;
  if (v28 + 2 == a3 || *v31 != 91 || *v4 != 46)
  {
    if ((v24 | 0x40) == 0x40)
    {
      LODWORD(v31) = *v31;
      if ((_DWORD)v31 == 92)
      {
        if (v24)
          v32 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v28 + 2, a3, (uint64_t *)&v41);
        else
          v32 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v28 + 2, (unsigned __int8 *)a3, (uint64_t)&v41, (uint64_t)v6);
        goto LABEL_79;
      }
    }
    else
    {
      LOBYTE(v31) = *v31;
    }
    HIBYTE(v42) = 1;
    LOWORD(v41) = v31;
    goto LABEL_80;
  }
  v32 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v28 + 3, a3, (uint64_t)&v41);
LABEL_79:
  v4 = v32;
LABEL_80:
  *(_OWORD *)v37 = *(_OWORD *)__p;
  v38 = v40;
  __p[1] = 0;
  v40 = 0;
  __p[0] = 0;
  *(_OWORD *)v35 = v41;
  v36 = v42;
  v41 = 0uLL;
  v42 = 0;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v6, (char *)v37, (uint64_t)v35);
  if (SHIBYTE(v36) < 0)
  {
    operator delete(v35[0]);
    if ((SHIBYTE(v38) & 0x80000000) == 0)
    {
LABEL_82:
      if ((SHIBYTE(v42) & 0x80000000) == 0)
        goto LABEL_83;
LABEL_87:
      operator delete((void *)v41);
      v11 = 1;
      if (SHIBYTE(v40) < 0)
        goto LABEL_63;
      goto LABEL_64;
    }
  }
  else if ((SHIBYTE(v38) & 0x80000000) == 0)
  {
    goto LABEL_82;
  }
  operator delete(v37[0]);
  if (SHIBYTE(v42) < 0)
    goto LABEL_87;
LABEL_83:
  v11 = 1;
  if (SHIBYTE(v40) < 0)
LABEL_63:
    operator delete(__p[0]);
LABEL_64:
  if ((v11 & 1) != 0)
    return v4;
  return v6;
}

void sub_24B82D3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (*(char *)(v28 - 49) < 0)
  {
    operator delete(*(void **)(v28 - 72));
    if (a28 < 0)
    {
LABEL_5:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(uint64_t a1, char *__src, char *a3, uint64_t a4)
{
  uint64_t v7;
  char *v8;
  char *v9;
  void **v10;
  unint64_t v11;
  __int128 v12;
  void *v13;
  void **v14;
  void **v15;
  void *__p[3];
  void *v18[3];

  if (a3 - __src < 2 || a3 - 1 == __src)
    goto LABEL_39;
  v7 = 0;
  v8 = __src;
  if (*__src != 61)
    goto LABEL_5;
LABEL_4:
  if (v8[1] != 93)
  {
LABEL_5:
    while (a3 - __src - 2 != v7)
    {
      v8 = &__src[++v7];
      if (__src[v7] == 61)
        goto LABEL_4;
    }
LABEL_39:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (&__src[v7] == a3)
    goto LABEL_39;
  memset(v18, 170, sizeof(v18));
  std::regex_traits<char>::__lookup_collatename<char const*>(__src, a1, &__src[v7], (uint64_t)v18);
  if ((SHIBYTE(v18[2]) & 0x80000000) == 0)
  {
    v9 = (char *)HIBYTE(v18[2]);
    if (HIBYTE(v18[2]))
    {
      memset(__p, 170, sizeof(__p));
      v10 = v18;
      goto LABEL_14;
    }
LABEL_40:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  v9 = (char *)v18[1];
  if (!v18[1])
    goto LABEL_40;
  memset(__p, 170, sizeof(__p));
  v10 = (void **)v18[0];
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, (uint64_t)v10, &v9[(_QWORD)v10], (_BYTE **)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    if (__p[1])
    {
LABEL_16:
      v11 = *(_QWORD *)(a4 + 144);
      if (v11 >= *(_QWORD *)(a4 + 152))
      {
        *(_QWORD *)(a4 + 144) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)(a4 + 136), (uint64_t)__p);
        if (SHIBYTE(__p[2]) < 0)
          goto LABEL_37;
      }
      else
      {
        if ((HIBYTE(__p[2]) & 0x80) != 0)
        {
          std::string::__init_copy_ctor_external(*(std::string **)(a4 + 144), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          v12 = *(_OWORD *)__p;
          *(void **)(v11 + 16) = __p[2];
          *(_OWORD *)v11 = v12;
        }
        *(_QWORD *)(a4 + 144) = v11 + 24;
        *(_QWORD *)(a4 + 144) = v11 + 24;
        if (SHIBYTE(__p[2]) < 0)
          goto LABEL_37;
      }
      goto LABEL_33;
    }
  }
  else if (HIBYTE(__p[2]))
  {
    goto LABEL_16;
  }
  v13 = (void *)HIBYTE(v18[2]);
  if (SHIBYTE(v18[2]) < 0)
    v13 = v18[1];
  if (v13 == (void *)2)
  {
    v15 = v18;
    if (SHIBYTE(v18[2]) < 0)
      v15 = (void **)v18[0];
    std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](a4, *(char *)v15, *((char *)v15 + 1));
  }
  else
  {
    if (v13 != (void *)1)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
    v14 = v18;
    if (SHIBYTE(v18[2]) < 0)
      v14 = (void **)v18[0];
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a4, *(char *)v14);
  }
  if (SHIBYTE(__p[2]) < 0)
  {
LABEL_37:
    operator delete(__p[0]);
    if (SHIBYTE(v18[2]) < 0)
      goto LABEL_38;
    return &__src[v7 + 2];
  }
LABEL_33:
  if (SHIBYTE(v18[2]) < 0)
LABEL_38:
    operator delete(v18[0]);
  return &__src[v7 + 2];
}

void sub_24B82D690(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;
  uint64_t v21;

  *(_QWORD *)(v20 + 144) = v21;
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *__src, char *a3, uint64_t a4)
{
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v11;
  unint64_t v12;

  if (a3 - __src < 2 || a3 - 1 == __src)
    goto LABEL_15;
  v6 = 0;
  v7 = __src;
  if (*__src != 46)
    goto LABEL_5;
LABEL_4:
  if (v7[1] != 93)
  {
LABEL_5:
    while (a3 - __src - 2 != v6)
    {
      v7 = &__src[++v6];
      if (__src[v6] == 46)
        goto LABEL_4;
    }
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (&__src[v6] == a3)
    goto LABEL_15;
  std::regex_traits<char>::__lookup_collatename<char const*>(__src, a1, &__src[v6], (uint64_t)&v11);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v11;
  v8 = v12;
  *(_QWORD *)(a4 + 16) = v12;
  v9 = HIBYTE(v8);
  if ((v9 & 0x80u) != 0)
    v9 = *(_QWORD *)(a4 + 8);
  if (v9 - 1 >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  return &__src[v6 + 2];
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 *result;

  if (a2 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
      result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 1) = 0;
        result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  std::basic_regex<char>::value_type v5;
  std::basic_regex<char>::value_type v7;
  std::basic_regex<char>::value_type *v8;
  std::basic_regex<char>::value_type v9;
  int v10;
  std::basic_regex<char>::value_type v11;

  if (a2 == a3)
LABEL_70:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  switch(*a2)
  {
    case '"':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v5;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30)
        goto LABEL_70;
      v7 = *a2 - 48;
      v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        v8 = a3;
LABEL_42:
        if (a4)
          goto LABEL_43;
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30)
        goto LABEL_42;
      v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        v8 = a3;
        if (a4)
          goto LABEL_43;
        goto LABEL_69;
      }
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      if (!a4)
        goto LABEL_69;
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v7;
      *((_BYTE *)a4 + 1) = 0;
      return v8;
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  unint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t j;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t k;
  char *v18;
  unint64_t v19;
  char *v20;
  unint64_t m;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char *v32;
  int v33;
  char *v34;
  char v35;
  char *v36;
  char v37;
  _BYTE *v38;
  unint64_t v39;
  __int128 v40;
  uint64_t v41;
  char *v42;
  int v43;
  void *v44[2];
  uint64_t v45;
  void *v46[2];
  uint64_t v47;
  void *__p[2];
  uint64_t v49;
  void *v50[2];
  uint64_t v51;

  v3 = a3;
  v4 = (uint64_t)a2;
  if (!*(_BYTE *)(a1 + 170))
  {
    v16 = a2[23];
    if (a2[23] < 0)
    {
      if (*((_QWORD *)a2 + 1) != 1)
        goto LABEL_74;
    }
    else if (v16 != 1)
    {
LABEL_74:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    }
    if (*(char *)(a3 + 23) < 0)
    {
      if (*(_QWORD *)(a3 + 8) != 1)
        goto LABEL_74;
    }
    else if (*(_BYTE *)(a3 + 23) != 1)
    {
      goto LABEL_74;
    }
    if (!*(_BYTE *)(a1 + 169))
    {
LABEL_67:
      *(_OWORD *)__p = *(_OWORD *)v4;
      v49 = *(_QWORD *)(v4 + 16);
      *(_QWORD *)(v4 + 8) = 0;
      *(_QWORD *)(v4 + 16) = 0;
      *(_QWORD *)v4 = 0;
      *(_OWORD *)v50 = *(_OWORD *)v3;
      v51 = *(_QWORD *)(v3 + 16);
      *(_QWORD *)(v3 + 8) = 0;
      *(_QWORD *)(v3 + 16) = 0;
      *(_QWORD *)v3 = 0;
      v39 = *(_QWORD *)(a1 + 96);
      if (v39 < *(_QWORD *)(a1 + 104))
      {
        v40 = *(_OWORD *)__p;
        *(_QWORD *)(v39 + 16) = v49;
        *(_OWORD *)v39 = v40;
        __p[1] = 0;
        v49 = 0;
        __p[0] = 0;
        v41 = v51;
        *(_OWORD *)(v39 + 24) = *(_OWORD *)v50;
        *(_QWORD *)(v39 + 40) = v41;
        v50[1] = 0;
        v51 = 0;
        v50[0] = 0;
        *(_QWORD *)(a1 + 96) = v39 + 48;
        if (SHIBYTE(v49) < 0)
          goto LABEL_69;
        return;
      }
      v42 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
      v43 = SHIBYTE(v51);
      *(_QWORD *)(a1 + 96) = v42;
      if ((v43 & 0x80000000) == 0)
      {
        if (SHIBYTE(v49) < 0)
          goto LABEL_69;
        return;
      }
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0)
        return;
LABEL_69:
      operator delete(__p[0]);
      return;
    }
    v34 = a2;
    if ((v16 & 0x80) != 0)
      v34 = *(char **)a2;
    v35 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v34);
    if (*(char *)(v4 + 23) < 0)
    {
      **(_BYTE **)v4 = v35;
      v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0)
        goto LABEL_64;
    }
    else
    {
      *(_BYTE *)v4 = v35;
      v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0)
      {
LABEL_64:
        v37 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v36);
        v38 = (_BYTE *)v3;
        if (*(char *)(v3 + 23) < 0)
          v38 = *(_BYTE **)v3;
        *v38 = v37;
        goto LABEL_67;
      }
    }
    v36 = *(char **)v3;
    goto LABEL_64;
  }
  if (*(_BYTE *)(a1 + 169))
  {
    for (i = 0; ; ++i)
    {
      v7 = *(unsigned __int8 *)(v4 + 23);
      if (*(char *)(v4 + 23) < 0)
      {
        if (i >= *(_QWORD *)(v4 + 8))
        {
LABEL_13:
          for (j = 0; ; ++j)
          {
            v12 = *(unsigned __int8 *)(v3 + 23);
            if (*(char *)(v3 + 23) < 0)
            {
              if (j >= *(_QWORD *)(v3 + 8))
                goto LABEL_44;
            }
            else if (j >= v12)
            {
              goto LABEL_44;
            }
            v13 = v3;
            if ((v12 & 0x80) != 0)
              v13 = *(_QWORD *)v3;
            v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *(char *)(v13 + j));
            v15 = v3;
            if (*(char *)(v3 + 23) < 0)
              v15 = *(_QWORD *)v3;
            *(_BYTE *)(v15 + j) = v14;
          }
        }
      }
      else if (i >= v7)
      {
        goto LABEL_13;
      }
      v8 = v4;
      if ((v7 & 0x80) != 0)
        v8 = *(_QWORD *)v4;
      v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *(char *)(v8 + i));
      v10 = v4;
      if (*(char *)(v4 + 23) < 0)
        v10 = *(_QWORD *)v4;
      *(_BYTE *)(v10 + i) = v9;
    }
  }
  for (k = 0; ; ++k)
  {
    v19 = a2[23];
    if (a2[23] < 0)
      break;
    if (k >= v19)
      goto LABEL_35;
LABEL_33:
    v18 = a2;
    if ((v19 & 0x80) != 0)
    {
      v18 = *(char **)a2;
      v20 = *(char **)a2;
    }
    else
    {
      v20 = a2;
    }
    v20[k] = v18[k];
  }
  if (k < *((_QWORD *)a2 + 1))
    goto LABEL_33;
LABEL_35:
  for (m = 0; ; ++m)
  {
    v23 = *(unsigned __int8 *)(a3 + 23);
    if (*(char *)(a3 + 23) < 0)
      break;
    if (m >= v23)
      goto LABEL_44;
LABEL_42:
    v22 = a3;
    if ((v23 & 0x80) != 0)
    {
      v22 = *(_QWORD *)a3;
      v24 = *(_QWORD *)a3;
    }
    else
    {
      v24 = a3;
    }
    *(_BYTE *)(v24 + m) = *(_BYTE *)(v22 + m);
  }
  if (m < *(_QWORD *)(a3 + 8))
    goto LABEL_42;
LABEL_44:
  if (*(char *)(v4 + 23) < 0)
  {
    v26 = v4;
    v4 = *(_QWORD *)v4;
    v25 = *(_QWORD *)(v26 + 8);
  }
  else
  {
    v25 = *(unsigned __int8 *)(v4 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v4, (char *)(v4 + v25));
  if (*(char *)(v3 + 23) < 0)
  {
    v28 = v3;
    v3 = *(_QWORD *)v3;
    v27 = *(_QWORD *)(v28 + 8);
  }
  else
  {
    v27 = *(unsigned __int8 *)(v3 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v3, (char *)(v3 + v27));
  *(_OWORD *)__p = *(_OWORD *)v46;
  v49 = v47;
  *(_OWORD *)v50 = *(_OWORD *)v44;
  v51 = v45;
  v29 = *(_QWORD *)(a1 + 96);
  if (v29 >= *(_QWORD *)(a1 + 104))
  {
    v32 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
    v33 = SHIBYTE(v51);
    *(_QWORD *)(a1 + 96) = v32;
    if (v33 < 0)
    {
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0)
        return;
    }
    else if ((SHIBYTE(v49) & 0x80000000) == 0)
    {
      return;
    }
    goto LABEL_69;
  }
  v30 = *(_OWORD *)__p;
  *(_QWORD *)(v29 + 16) = v49;
  *(_OWORD *)v29 = v30;
  __p[1] = 0;
  v49 = 0;
  __p[0] = 0;
  v31 = v51;
  *(_OWORD *)(v29 + 24) = *(_OWORD *)v50;
  *(_QWORD *)(v29 + 40) = v31;
  v50[1] = 0;
  v51 = 0;
  v50[0] = 0;
  *(_QWORD *)(a1 + 96) = v29 + 48;
  if (SHIBYTE(v49) < 0)
    goto LABEL_69;
}

void sub_24B82E284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::pair<std::string,std::string>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B82E298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  std::pair<std::string,std::string>::~pair((uint64_t)&a21);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  char *v8;
  char **v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _WORD *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  _OWORD *v34;
  char *v35;
  unint64_t v36;
  __int128 v37;
  __int16 v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  _OWORD *v51;
  char *v52;
  unint64_t v53;
  __int128 v54;
  __int16 v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  _OWORD *v60;
  char *v61;
  unint64_t v62;
  __int128 v63;
  __int16 v64;

  if (*(_BYTE *)(a1 + 169))
  {
    v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3) << 8);
    v8 = *(char **)(a1 + 120);
    v7 = *(_QWORD *)(a1 + 128);
    if ((unint64_t)v8 >= v7)
    {
      v9 = (char **)(a1 + 112);
      v10 = *(char **)(a1 + 112);
      v11 = v8 - v10;
      if (v8 - v10 > -3)
      {
        v12 = v11 >> 1;
        v13 = v7 - (_QWORD)v10;
        if (v13 <= (v11 >> 1) + 1)
          v14 = v12 + 1;
        else
          v14 = v13;
        if (v13 >= 0x7FFFFFFFFFFFFFFELL)
          v15 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v15 = v14;
        if (!v15)
        {
          v16 = 0;
          v17 = (_WORD *)(2 * v12);
          v18 = 0;
          *(_WORD *)(2 * v12) = v6;
          v19 = 2 * v12 + 2;
          v20 = (char *)(v8 - v10);
          if (v8 == v10)
            goto LABEL_64;
LABEL_30:
          v30 = (unint64_t)(v20 - 2);
          if (v30 < 0x1E)
            goto LABEL_71;
          if ((unint64_t)(v8 - &v16[v11 & 0xFFFFFFFFFFFFFFFELL]) < 0x20)
            goto LABEL_71;
          v31 = (v30 >> 1) + 1;
          v32 = 2 * (v31 & 0xFFFFFFFFFFFFFFF0);
          v33 = &v8[-v32];
          v17 = (_WORD *)((char *)v17 - v32);
          v34 = &v16[2 * v12 - 16];
          v35 = v8 - 16;
          v36 = v31 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v37 = *(_OWORD *)v35;
            *(v34 - 1) = *((_OWORD *)v35 - 1);
            *v34 = v37;
            v34 -= 2;
            v35 -= 32;
            v36 -= 16;
          }
          while (v36);
          v8 = v33;
          if (v31 != (v31 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_71:
            do
            {
              v38 = *((_WORD *)v8 - 1);
              v8 -= 2;
              *--v17 = v38;
            }
            while (v8 != v10);
          }
LABEL_63:
          v8 = *v9;
          goto LABEL_64;
        }
        if ((v15 & 0x8000000000000000) == 0)
        {
          v16 = operator new(2 * v15);
          v17 = &v16[2 * v12];
          v18 = &v16[2 * v15];
          *v17 = v6;
          v19 = (uint64_t)(v17 + 1);
          v20 = (char *)(v8 - v10);
          if (v8 == v10)
            goto LABEL_64;
          goto LABEL_30;
        }
LABEL_68:
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
LABEL_67:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
LABEL_28:
    *(_WORD *)v8 = v6;
    v19 = (uint64_t)(v8 + 2);
    goto LABEL_66;
  }
  v9 = (char **)(a1 + 112);
  v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
  v8 = *(char **)(a1 + 120);
  v21 = *(_QWORD *)(a1 + 128);
  if (*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v8 < v21)
      goto LABEL_28;
    v22 = *v9;
    v23 = v8 - *v9;
    if (v23 <= -3)
      goto LABEL_67;
    v24 = v23 >> 1;
    v25 = v21 - (_QWORD)v22;
    if (v25 <= (v23 >> 1) + 1)
      v26 = v24 + 1;
    else
      v26 = v25;
    if (v25 >= 0x7FFFFFFFFFFFFFFELL)
      v27 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v27 = v26;
    if (v27)
    {
      if (v27 < 0)
        goto LABEL_68;
      v28 = operator new(2 * v27);
      v17 = &v28[2 * v24];
      v18 = &v28[2 * v27];
      *v17 = v6;
      v19 = (uint64_t)(v17 + 1);
      v29 = (char *)(v8 - v22);
      if (v8 == v22)
        goto LABEL_64;
    }
    else
    {
      v28 = 0;
      v17 = (_WORD *)(2 * v24);
      v18 = 0;
      *(_WORD *)(2 * v24) = v6;
      v19 = 2 * v24 + 2;
      v29 = (char *)(v8 - v22);
      if (v8 == v22)
        goto LABEL_64;
    }
    v47 = (unint64_t)(v29 - 2);
    if (v47 < 0x1E)
      goto LABEL_72;
    if ((unint64_t)(v8 - &v28[v23 & 0xFFFFFFFFFFFFFFFELL]) < 0x20)
      goto LABEL_72;
    v48 = (v47 >> 1) + 1;
    v49 = 2 * (v48 & 0xFFFFFFFFFFFFFFF0);
    v50 = &v8[-v49];
    v17 = (_WORD *)((char *)v17 - v49);
    v51 = &v28[2 * v24 - 16];
    v52 = v8 - 16;
    v53 = v48 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v54 = *(_OWORD *)v52;
      *(v51 - 1) = *((_OWORD *)v52 - 1);
      *v51 = v54;
      v51 -= 2;
      v52 -= 32;
      v53 -= 16;
    }
    while (v53);
    v8 = v50;
    if (v48 != (v48 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        v55 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--v17 = v55;
      }
      while (v8 != v22);
    }
    goto LABEL_63;
  }
  if ((unint64_t)v8 < v21)
    goto LABEL_28;
  v39 = *v9;
  v40 = v8 - *v9;
  if (v40 <= -3)
    goto LABEL_67;
  v41 = v40 >> 1;
  v42 = v21 - (_QWORD)v39;
  if (v42 <= (v40 >> 1) + 1)
    v43 = v41 + 1;
  else
    v43 = v42;
  if (v42 >= 0x7FFFFFFFFFFFFFFELL)
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v44 = v43;
  if (!v44)
  {
    v45 = 0;
    v17 = (_WORD *)(2 * v41);
    v18 = 0;
    *(_WORD *)(2 * v41) = v6;
    v19 = 2 * v41 + 2;
    v46 = (char *)(v8 - v39);
    if (v8 == v39)
      goto LABEL_64;
    goto LABEL_57;
  }
  if (v44 < 0)
    goto LABEL_68;
  v45 = operator new(2 * v44);
  v17 = &v45[2 * v41];
  v18 = &v45[2 * v44];
  *v17 = v6;
  v19 = (uint64_t)(v17 + 1);
  v46 = (char *)(v8 - v39);
  if (v8 != v39)
  {
LABEL_57:
    v56 = (unint64_t)(v46 - 2);
    if (v56 < 0x1E)
      goto LABEL_73;
    if ((unint64_t)(v8 - &v45[v40 & 0xFFFFFFFFFFFFFFFELL]) < 0x20)
      goto LABEL_73;
    v57 = (v56 >> 1) + 1;
    v58 = 2 * (v57 & 0xFFFFFFFFFFFFFFF0);
    v59 = &v8[-v58];
    v17 = (_WORD *)((char *)v17 - v58);
    v60 = &v45[2 * v41 - 16];
    v61 = v8 - 16;
    v62 = v57 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v63 = *(_OWORD *)v61;
      *(v60 - 1) = *((_OWORD *)v61 - 1);
      *v60 = v63;
      v60 -= 2;
      v61 -= 32;
      v62 -= 16;
    }
    while (v62);
    v8 = v59;
    if (v57 != (v57 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_73:
      do
      {
        v64 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--v17 = v64;
      }
      while (v8 != v39);
    }
    goto LABEL_63;
  }
LABEL_64:
  *(_QWORD *)(a1 + 112) = v17;
  *(_QWORD *)(a1 + 120) = v19;
  *(_QWORD *)(a1 + 128) = v18;
  if (v8)
    operator delete(v8);
LABEL_66:
  *(_QWORD *)(a1 + 120) = v19;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82E6D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::__lookup_collatename<char const*>(_BYTE *__src@<X1>, uint64_t a2@<X0>, _BYTE *a3@<X2>, uint64_t a4@<X8>)
{
  size_t v5;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _BYTE *v18;
  size_t v19;
  std::string v20;
  _BYTE __dst[24];

  v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v5 <= 0x16)
  {
    __dst[23] = (_BYTE)a3 - (_BYTE)__src;
    v9 = __dst;
    if (__src == a3)
      goto LABEL_9;
LABEL_8:
    memcpy(v9, __src, v5);
    v9 += v5;
    goto LABEL_9;
  }
  v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17)
    v10 = v5 | 7;
  v11 = v10 + 1;
  v9 = operator new(v10 + 1);
  *(_QWORD *)&__dst[8] = v5;
  *(_QWORD *)&__dst[16] = v11 | 0x8000000000000000;
  *(_QWORD *)__dst = v9;
  if (__src != a3)
    goto LABEL_8;
LABEL_9:
  *v9 = 0;
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    v12 = *(char **)__dst;
    if (!*(_QWORD *)&__dst[8])
      goto LABEL_18;
  }
  else
  {
    if (!__dst[23])
      return;
    v12 = __dst;
  }
  std::__get_collation_name(&v20, v12);
  *(_OWORD *)a4 = *(_OWORD *)&v20.__r_.__value_.__l.__data_;
  v13 = v20.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v20.__r_.__value_.__l + 2);
  v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0)
    v14 = *(_QWORD *)(a4 + 8);
  if (v14)
    goto LABEL_16;
  if ((__dst[23] & 0x80000000) != 0)
  {
    v15 = *(_QWORD *)&__dst[8];
    v12 = *(char **)__dst;
    if (*(_QWORD *)&__dst[8] < 3uLL)
      goto LABEL_24;
LABEL_18:
    operator delete(v12);
    return;
  }
  v15 = __dst[23];
  if (__dst[23] < 3u)
  {
    v12 = __dst;
LABEL_24:
    (*(void (**)(std::string *__return_ptr, _QWORD, char *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v20, *(_QWORD *)(a2 + 16), v12, &v12[v15]);
    if (*(char *)(a4 + 23) < 0)
      operator delete(*(void **)a4);
    *(std::string *)a4 = v20;
    if (*(char *)(a4 + 23) < 0)
    {
      v17 = *(_QWORD *)(a4 + 8);
      if (v17 == 1 || v17 == 12)
      {
        if (__dst != (_BYTE *)a4)
        {
          if (__dst[23] >= 0)
            v18 = __dst;
          else
            v18 = *(_BYTE **)__dst;
          if (__dst[23] >= 0)
            v19 = __dst[23];
          else
            v19 = *(_QWORD *)&__dst[8];
          std::string::__assign_no_alias<false>((void **)a4, v18, v19);
        }
      }
      else
      {
        **(_BYTE **)a4 = 0;
        *(_QWORD *)(a4 + 8) = 0;
      }
    }
    else
    {
      v16 = *(unsigned __int8 *)(a4 + 23);
      if (v16 == 1 || v16 == 12)
      {
        if (__dst != (_BYTE *)a4)
        {
          if ((__dst[23] & 0x80000000) != 0)
          {
            std::string::__assign_no_alias<true>((_QWORD *)a4, *(void **)__dst, *(size_t *)&__dst[8]);
          }
          else
          {
            *(_OWORD *)a4 = *(_OWORD *)__dst;
            *(_QWORD *)(a4 + 16) = *(_QWORD *)&__dst[16];
          }
        }
      }
      else
      {
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 23) = 0;
      }
    }
LABEL_16:
    if ((__dst[23] & 0x80000000) == 0)
      return;
    v12 = *(char **)__dst;
    goto LABEL_18;
  }
}

void sub_24B82E940(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, _BYTE **a4@<X8>)
{
  unint64_t v5;
  _OWORD *v9;
  _BYTE *v10;
  char *v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  void **v20;
  _BYTE *v21;
  int v22;
  _BYTE *v23;
  void *__p[3];

  v5 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v5 > 0x16)
  {
    v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v16 = v5 | 7;
    v17 = v16 + 1;
    v9 = operator new(v16 + 1);
    __p[1] = (void *)v5;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a2 != a3)
      goto LABEL_4;
LABEL_13:
    v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  v9 = __p;
  if ((char *)a2 == a3)
    goto LABEL_13;
LABEL_4:
  if (v5 < 0x20 || (unint64_t)v9 - a2 < 0x20)
  {
    v10 = v9;
    v11 = (char *)a2;
  }
  else
  {
    v10 = (char *)v9 + (v5 & 0xFFFFFFFFFFFFFFE0);
    v11 = (char *)(a2 + (v5 & 0xFFFFFFFFFFFFFFE0));
    v12 = (__int128 *)(a2 + 16);
    v13 = v9 + 1;
    v14 = v5 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v5 == (v5 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_16;
  }
  do
  {
    v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a3);
LABEL_16:
  *v10 = 0;
  memset(a4, 170, 24);
  v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v20 = __p;
  else
    v20 = (void **)__p[0];
  if (SHIBYTE(__p[2]) < 0)
    v19 = (char *)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v20, &v19[(_QWORD)v20]);
  v21 = (_BYTE *)*((unsigned __int8 *)a4 + 23);
  v22 = (char)v21;
  if ((char)v21 < 0)
    v21 = a4[1];
  if (v21 == (_BYTE *)1)
    goto LABEL_32;
  if (v21 != (_BYTE *)12)
  {
    if (v22 < 0)
    {
      **a4 = 0;
      a4[1] = 0;
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
        return;
LABEL_35:
      operator delete(__p[0]);
      return;
    }
    *(_BYTE *)a4 = 0;
    *((_BYTE *)a4 + 23) = 0;
LABEL_32:
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
      return;
    goto LABEL_35;
  }
  if (v22 >= 0)
    v23 = a4;
  else
    v23 = *a4;
  v23[11] = v23[3];
  if (SHIBYTE(__p[2]) < 0)
    goto LABEL_35;
}

void sub_24B82EB74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82EBC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<char const*>(uint64_t a1, _BYTE *__src, _BYTE *a3, BOOL a4)
{
  size_t v4;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void **v13;
  const char *v14;
  uint64_t classname;
  void *__dst[3];

  v4 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a3 - (_BYTE)__src;
    v9 = __dst;
    if (__src == a3)
      goto LABEL_9;
LABEL_8:
    memcpy(v9, __src, v4);
    v9 = (void **)((char *)v9 + v4);
    goto LABEL_9;
  }
  v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17)
    v10 = v4 | 7;
  v11 = v10 + 1;
  v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v4;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a3)
    goto LABEL_8;
LABEL_9:
  *(_BYTE *)v9 = 0;
  v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0)
    v13 = __dst;
  else
    v13 = (void **)__dst[0];
  if (SHIBYTE(__dst[2]) < 0)
    v12 = (char *)__dst[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v13, &v12[(_QWORD)v13]);
  if (SHIBYTE(__dst[2]) >= 0)
    v14 = (const char *)__dst;
  else
    v14 = (const char *)__dst[0];
  classname = std::__get_classname(v14, a4);
  if (SHIBYTE(__dst[2]) < 0)
    operator delete(__dst[0]);
  return classname;
}

void sub_24B82ED14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  _QWORD *v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  _BYTE *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  unint64_t v28;
  unint64_t v29;
  __int128 *v30;
  _OWORD *v31;
  unint64_t v32;
  __int128 v33;
  char *v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  __int128 *v38;
  _OWORD *v39;
  unint64_t v40;
  __int128 v41;
  char *v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  __int128 *v46;
  _OWORD *v47;
  unint64_t v48;
  __int128 v49;
  char *v50;
  _QWORD *v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char v55;
  char *v56;
  char v57;
  char *v58;
  char v59;

  v2 = a2;
  if (!*(_BYTE *)(a1 + 169))
  {
    v6 = (_QWORD *)(a1 + 64);
    v5 = *(_BYTE **)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 80);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v5 < v16)
        goto LABEL_24;
      v17 = (_BYTE *)*v6;
      v18 = (unint64_t)&v5[-*v6];
      v19 = v18 + 1;
      if ((uint64_t)(v18 + 1) >= 0)
      {
        v20 = v16 - (_QWORD)v17;
        if (2 * v20 > v19)
          v19 = 2 * v20;
        if (v20 >= 0x3FFFFFFFFFFFFFFFLL)
          v21 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        if (v21)
        {
          v12 = operator new(v21);
          v13 = &v12[v18];
          v14 = &v12[v21];
          v12[v18] = v2;
          v15 = (uint64_t)&v12[v18 + 1];
          if (v5 == v17)
            goto LABEL_49;
        }
        else
        {
          v12 = 0;
          v13 = &v5[-*v6];
          v14 = 0;
          *(_BYTE *)v18 = a2;
          v15 = v18 + 1;
          if (v5 == v17)
            goto LABEL_49;
        }
        if (v18 >= 8 && (unint64_t)(v17 - v12) >= 0x20)
        {
          if (v18 >= 0x20)
          {
            v28 = v18 & 0xFFFFFFFFFFFFFFE0;
            v38 = (__int128 *)(v5 - 16);
            v39 = &v12[v5 - 16 - v17];
            v40 = v18 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v41 = *v38;
              *(v39 - 1) = *(v38 - 1);
              *v39 = v41;
              v39 -= 2;
              v38 -= 2;
              v40 -= 32;
            }
            while (v40);
            if (v18 == v28)
              goto LABEL_86;
            if ((v18 & 0x18) == 0)
            {
              v13 -= v28;
              v5 -= v28;
              goto LABEL_80;
            }
          }
          else
          {
            v28 = 0;
          }
          v13 -= v18 & 0xFFFFFFFFFFFFFFF8;
          v42 = &v5[-v28 - 8];
          v43 = &v12[v42 - v17];
          v44 = v28 - (v18 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v45 = *(_QWORD *)v42;
            v42 -= 8;
            *v43-- = v45;
            v44 += 8;
          }
          while (v44);
          v5 -= v18 & 0xFFFFFFFFFFFFFFF8;
          if (v18 == (v18 & 0xFFFFFFFFFFFFFFF8))
            goto LABEL_86;
        }
LABEL_80:
        v56 = v13 - 1;
        do
        {
          v57 = *--v5;
          *v56-- = v57;
        }
        while (v5 != v17);
        goto LABEL_86;
      }
LABEL_89:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if ((unint64_t)v5 < v16)
      goto LABEL_24;
    v23 = (_BYTE *)*v6;
    v24 = (unint64_t)&v5[-*v6];
    v25 = v24 + 1;
    if ((uint64_t)(v24 + 1) < 0)
      goto LABEL_89;
    v26 = v16 - (_QWORD)v23;
    if (2 * v26 > v25)
      v25 = 2 * v26;
    if (v26 >= 0x3FFFFFFFFFFFFFFFLL)
      v27 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v27 = v25;
    if (v27)
    {
      v12 = operator new(v27);
      v13 = &v12[v24];
      v14 = &v12[v27];
      v12[v24] = v2;
      v15 = (uint64_t)&v12[v24 + 1];
      if (v5 == v23)
      {
LABEL_49:
        *(_QWORD *)(a1 + 64) = v13;
        *(_QWORD *)(a1 + 72) = v15;
        *(_QWORD *)(a1 + 80) = v14;
        if (!v5)
          goto LABEL_88;
        goto LABEL_87;
      }
    }
    else
    {
      v12 = 0;
      v13 = &v5[-*v6];
      v14 = 0;
      *(_BYTE *)v24 = a2;
      v15 = v24 + 1;
      if (v5 == v23)
        goto LABEL_49;
    }
    if (v24 >= 8 && (unint64_t)(v23 - v12) >= 0x20)
    {
      if (v24 >= 0x20)
      {
        v29 = v24 & 0xFFFFFFFFFFFFFFE0;
        v46 = (__int128 *)(v5 - 16);
        v47 = &v12[v5 - 16 - v23];
        v48 = v24 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v49 = *v46;
          *(v47 - 1) = *(v46 - 1);
          *v47 = v49;
          v47 -= 2;
          v46 -= 2;
          v48 -= 32;
        }
        while (v48);
        if (v24 == v29)
          goto LABEL_86;
        if ((v24 & 0x18) == 0)
        {
          v13 -= v29;
          v5 -= v29;
          goto LABEL_84;
        }
      }
      else
      {
        v29 = 0;
      }
      v13 -= v24 & 0xFFFFFFFFFFFFFFF8;
      v50 = &v5[-v29 - 8];
      v51 = &v12[v50 - v23];
      v52 = v29 - (v24 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v53 = *(_QWORD *)v50;
        v50 -= 8;
        *v51-- = v53;
        v52 += 8;
      }
      while (v52);
      v5 -= v24 & 0xFFFFFFFFFFFFFFF8;
      if (v24 == (v24 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_86;
    }
LABEL_84:
    v58 = v13 - 1;
    do
    {
      v59 = *--v5;
      *v58-- = v59;
    }
    while (v5 != v23);
    goto LABEL_86;
  }
  v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v5 = *(_BYTE **)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  if ((unint64_t)v5 < v4)
  {
LABEL_24:
    *v5 = v2;
    v15 = (uint64_t)(v5 + 1);
    goto LABEL_88;
  }
  v6 = (_QWORD *)(a1 + 64);
  v7 = *(_BYTE **)(a1 + 64);
  v8 = v5 - v7;
  v9 = v5 - v7 + 1;
  if (v9 < 0)
    goto LABEL_89;
  v10 = v4 - (_QWORD)v7;
  if (2 * v10 > v9)
    v9 = 2 * v10;
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = v9;
  if (v11)
  {
    v12 = operator new(v11);
    v13 = &v12[v8];
    v14 = &v12[v11];
    v12[v8] = v2;
    v15 = (uint64_t)&v12[v8 + 1];
    if (v5 == v7)
      goto LABEL_49;
  }
  else
  {
    v12 = 0;
    v13 = (char *)(v5 - v7);
    v14 = 0;
    *(_BYTE *)v8 = v2;
    v15 = v8 + 1;
    if (v5 == v7)
      goto LABEL_49;
  }
  if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20)
    goto LABEL_76;
  if (v8 < 0x20)
  {
    v22 = 0;
    goto LABEL_55;
  }
  v22 = v8 & 0xFFFFFFFFFFFFFFE0;
  v30 = (__int128 *)(v5 - 16);
  v31 = &v12[v5 - 16 - v7];
  v32 = v8 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    v33 = *v30;
    *(v31 - 1) = *(v30 - 1);
    *v31 = v33;
    v31 -= 2;
    v30 -= 2;
    v32 -= 32;
  }
  while (v32);
  if (v8 != v22)
  {
    if ((v8 & 0x18) == 0)
    {
      v13 -= v22;
      v5 -= v22;
      goto LABEL_76;
    }
LABEL_55:
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    v34 = &v5[-v22 - 8];
    v35 = &v12[v34 - v7];
    v36 = v22 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v37 = *(_QWORD *)v34;
      v34 -= 8;
      *v35-- = v37;
      v36 += 8;
    }
    while (v36);
    v5 -= v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_86;
LABEL_76:
    v54 = v13 - 1;
    do
    {
      v55 = *--v5;
      *v54-- = v55;
    }
    while (v5 != v7);
  }
LABEL_86:
  v5 = (_BYTE *)*v6;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v15;
  *(_QWORD *)(a1 + 80) = v14;
  if (v5)
LABEL_87:
    operator delete(v5);
LABEL_88:
  *(_QWORD *)(a1 + 72) = v15;
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, char *a3)
{
  unint64_t v3;
  _OWORD *v7;
  _BYTE *v8;
  char *v9;
  __int128 *v10;
  _OWORD *v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char *v17;
  void **v18;
  void *__p[3];

  v3 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v3 > 0x16)
  {
    v14 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v14 = v3 | 7;
    v15 = v14 + 1;
    v7 = operator new(v14 + 1);
    __p[1] = (void *)v3;
    __p[2] = (void *)(v15 | 0x8000000000000000);
    __p[0] = v7;
    if ((char *)a2 != a3)
      goto LABEL_4;
LABEL_13:
    v8 = v7;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  v7 = __p;
  if ((char *)a2 == a3)
    goto LABEL_13;
LABEL_4:
  if (v3 < 0x20 || (unint64_t)v7 - a2 < 0x20)
  {
    v8 = v7;
    v9 = (char *)a2;
  }
  else
  {
    v8 = (char *)v7 + (v3 & 0xFFFFFFFFFFFFFFE0);
    v9 = (char *)(a2 + (v3 & 0xFFFFFFFFFFFFFFE0));
    v10 = (__int128 *)(a2 + 16);
    v11 = v7 + 1;
    v12 = v3 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v13 = *v10;
      *(v11 - 1) = *(v10 - 1);
      *v11 = v13;
      v10 += 2;
      v11 += 2;
      v12 -= 32;
    }
    while (v12);
    if (v3 == (v3 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_16;
  }
  do
  {
    v16 = *v9++;
    *v8++ = v16;
  }
  while (v9 != a3);
LABEL_16:
  *v8 = 0;
  v17 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v18 = __p;
  else
    v18 = (void **)__p[0];
  if (SHIBYTE(__p[2]) < 0)
    v17 = (char *)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v18, &v17[(_QWORD)v18]);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
}

void sub_24B82F328(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82F37C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(void **a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  char *v11;
  void **v12;
  void **v13;
  __int128 v14;
  __int128 v15;
  void **v16;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v4 = v3 + 1;
  if (v3 + 1 > 0x555555555555555)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL)
    v6 = 0x555555555555555;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0x555555555555555)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(48 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[48 * v3];
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  v9 = &v7[48 * v6];
  v10 = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((_QWORD *)v8 + 5) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  v11 = v8 + 48;
  v12 = (void **)*a1;
  v13 = (void **)a1[1];
  if (v13 != *a1)
  {
    do
    {
      v14 = *((_OWORD *)v13 - 3);
      *((_QWORD *)v8 - 4) = *(v13 - 4);
      *((_OWORD *)v8 - 3) = v14;
      *(v13 - 5) = 0;
      *(v13 - 4) = 0;
      *(v13 - 6) = 0;
      v15 = *(_OWORD *)(v13 - 3);
      *((_QWORD *)v8 - 1) = *(v13 - 1);
      *(_OWORD *)(v8 - 24) = v15;
      v8 -= 48;
      *(v13 - 2) = 0;
      *(v13 - 1) = 0;
      *(v13 - 3) = 0;
      v13 -= 6;
    }
    while (v13 != v12);
    v13 = (void **)*a1;
    v16 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    while (1)
    {
      if (v16 == v13)
        goto LABEL_22;
      if (*((char *)v16 - 1) < 0)
      {
        operator delete(*(v16 - 3));
        if ((*((char *)v16 - 25) & 0x80000000) == 0)
          goto LABEL_14;
      }
      else if ((*((char *)v16 - 25) & 0x80000000) == 0)
      {
        goto LABEL_14;
      }
      operator delete(*(v16 - 6));
LABEL_14:
      v16 -= 6;
    }
  }
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
LABEL_22:
  if (v13)
    operator delete(v13);
  return v11;
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8;
  int v9;
  _QWORD *v14;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  void *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = operator new(0x10uLL);
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new(0x38uLL);
  LODWORD(first) = this->__loop_count_;
  v18 = __s->__first_;
  *(_QWORD *)v17 = &unk_251CB47D8;
  *((_QWORD *)v17 + 1) = v18;
  *((_QWORD *)v17 + 2) = v14;
  *((_QWORD *)v17 + 3) = __min;
  *((_QWORD *)v17 + 4) = __max;
  *((_DWORD *)v17 + 10) = (_DWORD)first;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((_BYTE *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)&unk_251CB4868;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((_QWORD *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = (_DWORD)first + 1;
}

void sub_24B82F790(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);

  std::__loop<char>::~__loop(v1);
  _Unwind_Resume(a1);
}

void sub_24B82F7A4(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  uint64_t v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82F814(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82F860(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CB4838;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CB4838;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

uint64_t std::__loop<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BYTE *v35;

  v2 = *(unsigned int *)(result + 40);
  v3 = *(_QWORD *)(a2 + 56);
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 != -991)
  {
    *v4 = 0;
    if (!*(_QWORD *)(result + 32))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_28;
    }
    if (*(_QWORD *)(result + 24))
    {
      *(_DWORD *)a2 = -994;
      *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
      *(_QWORD *)(v3 + 16 * v2 + 8) = *(_QWORD *)(a2 + 16);
      v20 = *(_DWORD *)(result + 44);
      v21 = *(_DWORD *)(result + 48);
      if (v20 == v21)
        return result;
      v22 = (v21 - 1);
      v23 = (v20 - 1);
      v24 = *(_QWORD *)(a2 + 24);
      v25 = *(_QWORD *)(a2 + 32);
      v26 = v22 - v23;
      if ((unint64_t)(v22 - v23) >= 2)
      {
        v27 = (v26 & 0xFFFFFFFFFFFFFFFELL) + v23;
        v28 = v25 + 24 * v23 + 24;
        v29 = v26 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *(_QWORD *)(v28 - 24) = v24;
          *(_QWORD *)(v28 - 16) = v24;
          *(_QWORD *)v28 = v24;
          *(_QWORD *)(v28 + 8) = v24;
          *(_BYTE *)(v28 - 8) = 0;
          *(_BYTE *)(v28 + 16) = 0;
          v28 += 48;
          v29 -= 2;
        }
        while (v29);
        if (v26 == (v26 & 0xFFFFFFFFFFFFFFFELL))
          return result;
      }
      else
      {
        v27 = v23;
      }
      v30 = v22 - v27;
      v31 = (_BYTE *)(v25 + 24 * v27 + 16);
      do
      {
        *((_QWORD *)v31 - 2) = v24;
        *((_QWORD *)v31 - 1) = v24;
        *v31 = 0;
        v31 += 24;
        --v30;
      }
      while (v30);
      return result;
    }
LABEL_26:
    *(_DWORD *)a2 = -992;
    return result;
  }
  v5 = *v4 + 1;
  *v4 = v5;
  v6 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v8 = v5 < v7;
  if (v5 < v7 && v5 >= v6)
    v8 = v5 < v7 && *(_QWORD *)(v3 + 16 * v2 + 8) != *(_QWORD *)(a2 + 16);
  if (v8 && v5 >= v6)
    goto LABEL_26;
  *(_DWORD *)a2 = -994;
  if (!v8)
  {
LABEL_28:
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 16);
    return result;
  }
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  *(_QWORD *)(v3 + 16 * v2 + 8) = *(_QWORD *)(a2 + 16);
  v12 = *(_DWORD *)(result + 44);
  v13 = *(_DWORD *)(result + 48);
  if (v12 == v13)
    return result;
  v14 = (v13 - 1);
  v15 = (v12 - 1);
  v16 = *(_QWORD *)(a2 + 24);
  v17 = *(_QWORD *)(a2 + 32);
  v18 = v14 - v15;
  if ((unint64_t)(v14 - v15) < 2)
  {
    v19 = v15;
LABEL_39:
    v34 = v14 - v19;
    v35 = (_BYTE *)(v17 + 24 * v19 + 16);
    do
    {
      *((_QWORD *)v35 - 2) = v16;
      *((_QWORD *)v35 - 1) = v16;
      *v35 = 0;
      v35 += 24;
      --v34;
    }
    while (v34);
    return result;
  }
  v19 = (v18 & 0xFFFFFFFFFFFFFFFELL) + v15;
  v32 = v17 + 24 * v15 + 24;
  v33 = v18 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    *(_QWORD *)(v32 - 24) = v16;
    *(_QWORD *)(v32 - 16) = v16;
    *(_QWORD *)v32 = v16;
    *(_QWORD *)(v32 + 8) = v16;
    *(_BYTE *)(v32 - 8) = 0;
    *(_BYTE *)(v32 + 16) = 0;
    v32 += 48;
    v33 -= 2;
  }
  while (v33);
  if (v18 != (v18 & 0xFFFFFFFFFFFFFFFELL))
    goto LABEL_39;
  return result;
}

uint64_t std::__loop<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;

  *(_DWORD *)a3 = -994;
  if (*(unsigned __int8 *)(result + 52) == a2)
  {
    *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + 16);
    return result;
  }
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + 8);
  v3 = *(_DWORD *)(result + 44);
  *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * *(unsigned int *)(result + 40) + 8) = *(_QWORD *)(a3 + 16);
  v4 = *(_DWORD *)(result + 48);
  if (v3 != v4)
  {
    v5 = (v4 - 1);
    v6 = (v3 - 1);
    v7 = *(_QWORD *)(a3 + 24);
    v8 = *(_QWORD *)(a3 + 32);
    v9 = v5 - v6;
    if ((unint64_t)(v5 - v6) < 2)
    {
      v10 = v6;
LABEL_9:
      v13 = v5 - v10;
      v14 = (_BYTE *)(v8 + 24 * v10 + 16);
      do
      {
        *((_QWORD *)v14 - 2) = v7;
        *((_QWORD *)v14 - 1) = v7;
        *v14 = 0;
        v14 += 24;
        --v13;
      }
      while (v13);
      return result;
    }
    v10 = (v9 & 0xFFFFFFFFFFFFFFFELL) + v6;
    v11 = v8 + 24 * v6 + 24;
    v12 = v9 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(_QWORD *)(v11 - 24) = v7;
      *(_QWORD *)(v11 - 16) = v7;
      *(_QWORD *)v11 = v7;
      *(_QWORD *)(v11 + 8) = v7;
      *(_BYTE *)(v11 - 8) = 0;
      *(_BYTE *)(v11 + 16) = 0;
      v11 += 48;
      v12 -= 2;
    }
    while (v12);
    if (v9 != (v9 & 0xFFFFFFFFFFFFFFFELL))
      goto LABEL_9;
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CB4838;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CB4838;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CB4838;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_251CB4838;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24BD280DC](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_24B82FE30(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(uint64_t a1, uint64_t a2, char *a3)
{
  char *v6;
  char *v7;
  int v8;
  std::basic_regex<char> *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  std::basic_regex<char> *v15;
  std::__owns_one_state<char> *v16;
  int v17;
  std::basic_regex<char> *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>((std::basic_regex<char> *)a1, (char *)a2, a3);
  v7 = v6;
  if (v6 != (char *)a2 || v6 == a3)
    return v7;
  if ((char *)(a2 + 1) == a3)
    return (char *)a2;
  if (*(_BYTE *)a2 != 92)
    return (char *)a2;
  v8 = *(unsigned __int8 *)(a2 + 1);
  if (v8 == 40)
  {
    v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(_BYTE *)(a1 + 24) & 2) != 0)
    {
      v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      v10 = operator new(0x18uLL);
      v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(v12 + 8);
      *v10 = &unk_251CB4748;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(_QWORD *)(v12 + 8) = v10;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3)
        goto LABEL_25;
      v15 = v9;
      v16 = *(std::__owns_one_state<char> **)(a1 + 56);
      v17 = *(_DWORD *)(a1 + 28);
      v18 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, v15, a3);
      if (v18 == v15)
        break;
      v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, v18, (std::basic_regex<char> *)a3, v16, (v17 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v9 != v15);
    if ((char *)&v15->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v15->__traits_.__loc_.__locale_) != 92
      || BYTE1(v15->__traits_.__loc_.__locale_) != 41)
    {
LABEL_25:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    v7 = (char *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 41);
    if ((*(_BYTE *)(a1 + 24) & 2) == 0)
    {
      v19 = operator new(0x18uLL);
      v20 = *(_QWORD *)(a1 + 56);
      v21 = *(_QWORD *)(v20 + 8);
      *v19 = &unk_251CB4790;
      v19[1] = v21;
      *((_DWORD *)v19 + 4) = v11;
      *(_QWORD *)(v20 + 8) = v19;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return v7;
    }
    return v7;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8)
    return (char *)a2;
  if ((v8 - 48) > *(_DWORD *)(a1 + 28))
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return (char *)(a2 + 2);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  std::basic_regex<char> *v6;
  int locale_low;
  std::basic_regex<char> *v9;
  int v10;
  int v11;
  std::basic_regex<char> *v12;
  int v13;
  std::basic_regex<char> *v14;
  int v15;
  int v16;
  int v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;

  v6 = this;
  if (this == a3)
    return v6;
  locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)v6 + 1);
  }
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return v6;
  }
  v9 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v9 == a3)
    goto LABEL_43;
  v10 = LOBYTE(v9->__traits_.__loc_.__locale_);
  if ((v10 & 0xF8) != 0x30 && (v10 & 0xFE) != 0x38)
    goto LABEL_43;
  v11 = v10 - 48;
  v12 = (std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_16:
    v12 = a3;
  }
  else
  {
    while (1)
    {
      v13 = LOBYTE(v12->__traits_.__loc_.__locale_);
      if ((v13 & 0xF8) != 0x30 && (v13 & 0xFE) != 0x38)
        break;
      if (v11 >= 214748364)
        goto LABEL_43;
      v11 = v13 + 10 * v11 - 48;
      v12 = (std::basic_regex<char> *)((char *)v12 + 1);
      if (v12 == a3)
        goto LABEL_16;
    }
  }
  if (v12 == v9)
    goto LABEL_43;
  if (v12 == a3)
    goto LABEL_41;
  v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 1);
  v15 = LOBYTE(v12->__traits_.__loc_.__locale_);
  if (v15 != 44)
  {
    if (v14 != a3 && v15 == 92 && LOBYTE(v14->__traits_.__loc_.__locale_) == 125)
    {
      v19 = (unsigned __int8 *)&v12->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v11, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_41;
  }
  if (v14 == a3)
    goto LABEL_41;
  v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
  if ((v16 & 0xF8) == 0x30 || (v16 & 0xFE) == 0x38)
  {
    v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2) == a3)
      goto LABEL_41;
    v17 = v16 - 48;
    while (1)
    {
      v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
      if ((v16 & 0xF8) != 0x30 && (v16 & 0xFE) != 0x38)
        break;
      if (v17 >= 214748364)
        goto LABEL_43;
      v17 = v16 + 10 * v17 - 48;
      v14 = (std::basic_regex<char> *)((char *)v14 + 1);
      if (v14 == a3)
        goto LABEL_41;
    }
  }
  else
  {
    v17 = -1;
  }
  if (v14 == a3
    || (std::basic_regex<char> *)((char *)&v14->__traits_.__loc_.__locale_ + 1) == a3
    || v16 != 92
    || BYTE1(v14->__traits_.__loc_.__locale_) != 125)
  {
LABEL_41:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  }
  v18 = (unsigned __int8 *)v14 + 2 * (BYTE1(v14->__traits_.__loc_.__locale_) == 125);
  if (v17 != -1)
  {
    if (v17 >= v11)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v17, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v18;
    }
LABEL_43:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v18;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  int v5;
  char *v6;
  int v9;
  std::__node<char> *v10;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if (a2 == a3)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
  v6 = a2 + 1;
  v5 = *a2;
  if (a2 + 1 == a3 && v5 == 36)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
  if ((v5 - 46) > 0x2E || ((1 << (v5 - 46)) & 0x600000000001) == 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
    return a2 + 1;
  }
  else
  {
    if (v6 != a3 && v5 == 92)
    {
      v9 = *v6;
      if ((v9 - 36) <= 0x3A && ((1 << (v9 - 36)) & 0x580000000000441) != 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v9);
        return a2 + 2;
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    }
    if (v5 != 46)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    v10 = (std::__node<char> *)operator new(0x10uLL);
    end = this->__end_;
    first = end->__first_;
    v10->__vftable = (std::__node<char>_vtbl *)&unk_251CB4940;
    v10[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v10;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return a2 + 1;
  }
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > this->__marked_count_)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *v6;
  int v7;
  std::basic_regex<char> *v8;
  int locale_low;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  std::basic_regex<char> *v22;
  std::basic_regex<char> *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>((std::basic_regex<char> *)a1, a2, a3);
  if (v8 == a2
    && (v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(a1, a2, a3), v8 == a2))
  {
    if (a2 != a3 && LOBYTE(a2->__traits_.__loc_.__locale_) == 46)
    {
      v14 = operator new(0x10uLL);
      v15 = *(_QWORD *)(a1 + 56);
      v16 = *(_QWORD *)(v15 + 8);
      *v14 = &unk_251CB4940;
      v14[1] = v16;
      *(_QWORD *)(v15 + 8) = v14;
LABEL_14:
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = (std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v8, a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(a1, (char *)a2, (char *)a3);
    if (v8 != a2)
      goto LABEL_25;
  }
  else if (v8 != a2)
  {
    goto LABEL_25;
  }
  if (v8 == a3)
  {
LABEL_25:
    if (v8 != a2)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v8, a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
    return a2;
  }
  locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  switch(locale_low)
  {
    case '$':
      v10 = operator new(0x18uLL);
      v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v12 = *(_QWORD *)(a1 + 56);
      goto LABEL_13;
    case '(':
      if ((*(_BYTE *)(a1 + 24) & 2) != 0)
      {
        v19 = *(_DWORD *)(a1 + 28);
      }
      else
      {
        v18 = operator new(0x18uLL);
        v19 = *(_DWORD *)(a1 + 28) + 1;
        *(_DWORD *)(a1 + 28) = v19;
        v20 = *(_QWORD *)(a1 + 56);
        v21 = *(_QWORD *)(v20 + 8);
        *v18 = &unk_251CB4748;
        v18[1] = v21;
        *((_DWORD *)v18 + 4) = v19;
        *(_QWORD *)(v20 + 8) = v18;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      ++*(_DWORD *)(a1 + 36);
      v22 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
      if (v22 == a3 || (v23 = v22, LOBYTE(v22->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      if ((*(_BYTE *)(a1 + 24) & 2) == 0)
      {
        v24 = operator new(0x18uLL);
        v25 = *(_QWORD *)(a1 + 56);
        v26 = *(_QWORD *)(v25 + 8);
        *v24 = &unk_251CB4790;
        v24[1] = v26;
        *((_DWORD *)v24 + 4) = v19;
        *(_QWORD *)(v25 + 8) = v24;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      --*(_DWORD *)(a1 + 36);
      v8 = (std::basic_regex<char> *)((char *)&v23->__traits_.__loc_.__locale_ + 1);
      goto LABEL_25;
    case '^':
      v10 = operator new(0x18uLL);
      v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v12 = *(_QWORD *)(a1 + 56);
LABEL_13:
      v17 = *(_QWORD *)(v12 + 8);
      *v10 = v13 + 16;
      v10[1] = v17;
      *((_BYTE *)v10 + 16) = v11;
      *(_QWORD *)(v12 + 8) = v10;
      goto LABEL_14;
  }
  return a2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  if (this == a3)
    return this;
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
      return this;
    case ')':
      if (a1->__open_count_)
        return this;
      break;
    default:
      break;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
  return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  std::basic_regex<char>::value_type *v4;
  std::basic_regex<char>::value_type v5;
  std::basic_regex<char>::value_type *result;
  _BOOL4 v7;
  uint64_t v8;

  v3 = this;
  if (this == a3)
    return (std::basic_regex<char>::value_type *)v3;
  v4 = (char *)&this->__traits_.__loc_.__locale_ + 1;
  if ((std::basic_regex<char> *)((char *)&v3->__traits_.__loc_.__locale_ + 1) == a3
    || LOBYTE(v3->__traits_.__loc_.__locale_) != 92)
  {
    return (std::basic_regex<char>::value_type *)v3;
  }
  v5 = *v4;
  switch(*v4)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
    case '}':
      std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v5);
      return (char *)v3 + 2;
    default:
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        result = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v4, (std::basic_regex<char>::value_type *)a3, 0);
      }
      else
      {
        v7 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v5);
        v8 = 2;
        if (!v7)
          v8 = 0;
        result = (char *)v3 + v8;
      }
      break;
  }
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, std::sub_match<const char *> *a2, std::sub_match<const char *> *a3, std::vector<std::csub_match> *this, int a5)
{
  int v9;
  int v10;
  const std::vector<std::csub_match>::value_type *v11;
  int v12;
  const char *i;
  std::vector<std::csub_match>::pointer begin;
  std::sub_match<const char *> *first;
  std::sub_match<const char *> *second;
  uint64_t result;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  v10 = *(_DWORD *)(a1 + 28);
  this[1].__begin_ = a3;
  v11 = (const std::vector<std::csub_match>::value_type *)&this[1];
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  std::vector<std::sub_match<char const*>>::assign(this, (v10 + 1), (std::vector<std::csub_match>::const_reference)&this[1]);
  this[2].__begin_ = a2;
  this[2].__end_ = a2;
  LOBYTE(this[2].__end_cap_.__value_) = 0;
  *(std::pair<const char *, const char *> *)&this[3].__begin_ = v11->std::pair<const char *, const char *>;
  LOBYTE(this[3].__end_cap_.__value_) = this[1].__end_cap_.__value_;
  if ((v9 & 0x800) == 0)
    this[4].__end_ = a2;
  LOBYTE(this[4].__begin_) = 1;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
  {
    if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0) & 1) != 0)goto LABEL_28;
    goto LABEL_13;
  }
  if (*(_DWORD *)(a1 + 28))
  {
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))goto LABEL_28;
LABEL_13:
    if (a2 != a3 && (v9 & 0x40) == 0)
    {
      v12 = v9 | 0x80;
      for (i = (char *)&a2->first + 1; i != (const char *)a3; ++i)
      {
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
        if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
        {
          if (*(_DWORD *)(a1 + 28))
          {
            if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28;
          }
          else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)i, (uint64_t)a3, (uint64_t *)this, v12, 0) & 1) != 0)
          {
            goto LABEL_28;
          }
        }
        else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0) & 1) != 0)
        {
          goto LABEL_28;
        }
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      }
      std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
      {
        if (*(_DWORD *)(a1 + 28))
        {
          if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28;
        }
        else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a3, (uint64_t)a3, (uint64_t *)this, v12, 0) & 1) != 0)
        {
          goto LABEL_28;
        }
      }
      else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0) & 1) != 0)
      {
        goto LABEL_28;
      }
    }
    result = 0;
    this->__end_ = this->__begin_;
    return result;
  }
  if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0) & 1) == 0)goto LABEL_13;
LABEL_28:
  if (this->__end_ == this->__begin_)
    begin = (std::vector<std::csub_match>::pointer)v11;
  else
    begin = this->__begin_;
  first = (std::sub_match<const char *> *)begin->first;
  this[2].__end_ = (std::vector<std::csub_match>::pointer)begin->first;
  LOBYTE(this[2].__end_cap_.__value_) = this[2].__begin_ != first;
  second = (std::sub_match<const char *> *)begin->second;
  this[3].__begin_ = second;
  LOBYTE(this[3].__end_cap_.__value_) = second != this[3].__end_;
  return 1;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(std::vector<std::ssub_match> *this, uint64_t a2, std::sub_match<std::__wrap_iter<const char *>> *a3, uint64_t *a4, char a5)
{
  uint64_t v10;
  unint64_t v11;
  std::vector<std::ssub_match>::pointer begin;
  std::sub_match<std::__wrap_iter<const char *>> *end;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  std::vector<std::ssub_match>::pointer v25;
  std::sub_match<std::__wrap_iter<const char *>> *v26;

  v10 = a4[6];
  v11 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  begin = this->__begin_;
  end = this->__end_;
  v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
  if (v11 <= v14)
  {
    if (v11 < v14)
    {
      end = (std::vector<std::ssub_match>::pointer)((char *)begin + 8 * ((a4[1] - *a4) >> 3));
      this->__end_ = end;
    }
  }
  else
  {
    std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(this, v11 - v14);
    begin = this->__begin_;
    end = this->__end_;
  }
  if (end != begin)
  {
    v15 = 0;
    v16 = 0;
    v18 = *a4;
    v17 = a4[1];
    do
    {
      v19 = 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3);
      v20 = (_QWORD *)(v18 + v15 * 24);
      if (v19 <= v16)
        v21 = a4 + 3;
      else
        v21 = v20;
      begin[v15].first.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *v21 - v10);
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v16)
        v22 = (uint64_t)(a4 + 3);
      else
        v22 = *a4 + v15 * 24;
      this->__begin_[v15].second.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *(_QWORD *)(v22 + 8) - v10);
      v18 = *a4;
      v17 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v17 - *a4) >> 3) <= v16)
        v23 = (uint64_t)(a4 + 3);
      else
        v23 = *a4 + v15 * 24;
      v24 = *(_BYTE *)(v23 + 16);
      begin = this->__begin_;
      v25 = this->__end_;
      this->__begin_[v15].matched = v24;
      ++v16;
      ++v15;
    }
    while (v16 < 0xAAAAAAAAAAAAAAABLL * (((char *)v25 - (char *)begin) >> 3));
  }
  this[1].__begin_ = a3;
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  v26 = (std::sub_match<std::__wrap_iter<const char *>> *)(a2 + a4[6] - v10);
  this[2].__begin_ = v26;
  this[2].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[7] - v10);
  LOBYTE(this[2].__end_cap_.__value_) = *((_BYTE *)a4 + 64);
  this[3].__begin_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[9] - v10);
  this[3].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[10] - v10);
  LOBYTE(this[3].__end_cap_.__value_) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0)
    this[4].__end_ = v26;
  LOBYTE(this[4].__begin_) = *((_BYTE *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  std::vector<std::pair<unsigned long, const char *>> *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void **v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  _QWORD *v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void **v85;
  void **v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  _BYTE v97[96];
  __int128 v98;
  __int128 v99;
  __int128 v100;

  v99 = 0u;
  v100 = 0u;
  v98 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
  {
LABEL_79:
    v85 = (void **)*((_QWORD *)&v98 + 1);
    v86 = (void **)v99;
    *((_QWORD *)&v100 + 1) = 0;
    v87 = v99 - *((_QWORD *)&v98 + 1);
    if ((_QWORD)v99 - *((_QWORD *)&v98 + 1) < 0x11uLL)
      goto LABEL_81;
    do
    {
LABEL_80:
      operator delete(*v85);
      v86 = (void **)v99;
      v85 = (void **)(*((_QWORD *)&v98 + 1) + 8);
      *((_QWORD *)&v98 + 1) = v85;
      v87 = v99 - (_QWORD)v85;
    }
    while ((_QWORD)v99 - (_QWORD)v85 > 0x10uLL);
    goto LABEL_81;
  }
  *(_DWORD *)v97 = 0;
  memset(&v97[8], 0, 85);
  std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v98);
  v11 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (((_QWORD)v100 + *((_QWORD *)&v100 + 1)) / 0x2AuLL))
      + 96 * (((_QWORD)v100 + *((_QWORD *)&v100 + 1)) % 0x2AuLL);
  v12 = *(_OWORD *)&v97[16];
  *(_OWORD *)v11 = *(_OWORD *)v97;
  *(_OWORD *)(v11 + 16) = v12;
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 48) = 0;
  *(_QWORD *)(v11 + 32) = 0;
  memset(&v97[32], 0, 24);
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *(_QWORD *)(v11 + 72) = 0;
  memset(&v97[56], 0, 24);
  v13 = *(_QWORD *)&v97[80];
  *(_QWORD *)(v11 + 85) = *(_QWORD *)&v97[85];
  *(_QWORD *)(v11 + 80) = v13;
  v15 = *((_QWORD *)&v100 + 1);
  v14 = v100;
  v16 = ++*((_QWORD *)&v100 + 1);
  v17 = *((_QWORD *)&v98 + 1);
  v18 = *(unsigned int *)(a1 + 32);
  v19 = v100 + v15;
  v20 = 8 * (v19 / 0x2A);
  v21 = 96 * (v19 % 0x2A);
  v22 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + v20) + v21;
  *(_DWORD *)v22 = 0;
  *(_QWORD *)(v22 + 8) = a2;
  *(_QWORD *)(*(_QWORD *)(v17 + v20) + v21 + 16) = a2;
  *(_QWORD *)(*(_QWORD *)(v17 + v20) + v21 + 24) = a3;
  v23 = *(_QWORD *)(v17 + v20) + v21;
  v26 = *(_QWORD *)(v23 + 56);
  v24 = (std::vector<std::pair<unsigned long, const char *>> *)(v23 + 56);
  v25 = v26;
  v27 = ((uint64_t)v24->__end_ - v26) >> 4;
  v92 = a4;
  if (v18 <= v27)
  {
    if (v18 < v27)
      v24->__end_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)(v25 + 16 * v18);
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(v24, v18 - v27);
    v16 = *((_QWORD *)&v100 + 1);
    v14 = v100;
    v17 = *((_QWORD *)&v98 + 1);
  }
  v93 = 0;
  v94 = 0;
  v28 = 0;
  v29 = v14 + v16 - 1;
  v30 = 8 * (v29 / 0x2A);
  v31 = 96 * (v29 % 0x2A);
  *(_QWORD *)(*(_QWORD *)(v17 + v30) + v31 + 80) = v6;
  v32 = a3 - a2;
  v33 = *(_QWORD *)(v17 + v30) + v31;
  *(_DWORD *)(v33 + 88) = a5;
  *(_BYTE *)(v33 + 92) = a6;
  while (2)
  {
    if ((++v28 & 0xFFF) == 0 && (int)(v28 >> 12) >= (int)v32)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v35 = v16 + v100 - 1;
    v36 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (v35 / 0x2A));
    v37 = v35 % 0x2A;
    v38 = v36 + 96 * (v35 % 0x2A);
    v40 = (_QWORD *)(v38 + 80);
    v39 = *(_QWORD *)(v38 + 80);
    if (v39)
      (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v39 + 16))(v39, v36 + 96 * v37);
    switch(*(_DWORD *)v38)
    {
      case 0xFFFFFC18:
        v41 = *(_QWORD *)(v36 + 96 * v37 + 16);
        if ((a5 & 0x20) != 0 && v41 == a2 || (a5 & 0x1000) != 0 && v41 != a3)
          goto LABEL_21;
        v65 = v41 - *(_QWORD *)(v36 + 96 * v37 + 8);
        v66 = v93;
        if ((v94 & (v93 >= v65)) == 0)
          v66 = v65;
        if (v66 == v32)
        {
          v67 = (void **)*((_QWORD *)&v98 + 1);
          v68 = v99;
          if ((_QWORD)v99 == *((_QWORD *)&v98 + 1))
          {
            *((_QWORD *)&v100 + 1) = 0;
            v82 = 0;
          }
          else
          {
            v69 = (_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * ((unint64_t)v100 / 0x2A));
            v70 = (_QWORD *)(*v69 + 96 * ((unint64_t)v100 % 0x2A));
            v71 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * ((*((_QWORD *)&v100 + 1) + (_QWORD)v100) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v100 + 1) + (_QWORD)v100) % 0x2AuLL);
            if (v70 != (_QWORD *)v71)
            {
              do
              {
                v72 = (void *)v70[7];
                if (v72)
                {
                  v70[8] = v72;
                  operator delete(v72);
                }
                v73 = (void *)v70[4];
                if (v73)
                {
                  v70[5] = v73;
                  operator delete(v73);
                }
                v70 += 12;
                if ((_QWORD *)((char *)v70 - *v69) == (_QWORD *)4032)
                {
                  v74 = (_QWORD *)v69[1];
                  ++v69;
                  v70 = v74;
                }
              }
              while (v70 != (_QWORD *)v71);
              v67 = (void **)*((_QWORD *)&v98 + 1);
              v68 = v99;
            }
            *((_QWORD *)&v100 + 1) = 0;
            v82 = v68 - (_QWORD)v67;
            if (v82 >= 0x11)
            {
              do
              {
                operator delete(*v67);
                v67 = (void **)(*((_QWORD *)&v98 + 1) + 8);
                *((_QWORD *)&v98 + 1) = v67;
                v82 = v99 - (_QWORD)v67;
              }
              while ((_QWORD)v99 - (_QWORD)v67 > 0x10uLL);
            }
          }
          if (v82 >> 3 == 1)
          {
            v83 = 21;
          }
          else
          {
            if (v82 >> 3 != 2)
            {
LABEL_76:
              v94 = 1;
              v93 = a3 - a2;
              goto LABEL_8;
            }
            v83 = 42;
          }
          *(_QWORD *)&v100 = v83;
          goto LABEL_76;
        }
        v93 = v66;
        v75 = *((_QWORD *)&v100 + 1) + v100 - 1;
        v76 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (v75 / 0x2A));
        v77 = v75 % 0x2A;
        v78 = *(void **)(v76 + 96 * (v75 % 0x2A) + 56);
        if (v78)
        {
          *(_QWORD *)(v76 + 96 * v77 + 64) = v78;
          operator delete(v78);
        }
        v79 = *(void **)(v76 + 96 * v77 + 32);
        if (v79)
        {
          *(_QWORD *)(v76 + 96 * v77 + 40) = v79;
          operator delete(v79);
        }
        v80 = 42 * ((uint64_t)(v99 - *((_QWORD *)&v98 + 1)) >> 3) - 1;
        v81 = v100;
        --*((_QWORD *)&v100 + 1);
        if ((_QWORD)v99 == *((_QWORD *)&v98 + 1))
          v80 = 0;
        if ((unint64_t)(v80 - (*((_QWORD *)&v81 + 1) + v81) + 1) >= 0x54)
        {
          operator delete(*(void **)(v99 - 8));
          *(_QWORD *)&v99 = v99 - 8;
        }
        v94 = 1;
LABEL_8:
        v16 = *((_QWORD *)&v100 + 1);
        if (*((_QWORD *)&v100 + 1))
          continue;
        if ((v94 & 1) != 0)
        {
          v84 = *v92;
          *(_QWORD *)v84 = a2;
          *(_QWORD *)(v84 + 8) = a2 + v93;
          v6 = 1;
          *(_BYTE *)(v84 + 16) = 1;
          goto LABEL_79;
        }
        v6 = 0;
        v85 = (void **)*((_QWORD *)&v98 + 1);
        v86 = (void **)v99;
        *((_QWORD *)&v100 + 1) = 0;
        v87 = v99 - *((_QWORD *)&v98 + 1);
        if ((_QWORD)v99 - *((_QWORD *)&v98 + 1) >= 0x11uLL)
          goto LABEL_80;
LABEL_81:
        v88 = v87 >> 3;
        if (v88 == 1)
        {
          v89 = 21;
LABEL_85:
          *(_QWORD *)&v100 = v89;
        }
        else if (v88 == 2)
        {
          v89 = 42;
          goto LABEL_85;
        }
        if (v85 != v86)
        {
          do
          {
            v90 = *v85++;
            operator delete(v90);
          }
          while (v85 != v86);
          if ((_QWORD)v99 != *((_QWORD *)&v98 + 1))
            *(_QWORD *)&v99 = v99 + ((*((_QWORD *)&v98 + 1) - v99 + 7) & 0xFFFFFFFFFFFFFFF8);
        }
        if ((_QWORD)v98)
          operator delete((void *)v98);
        return v6;
      case 0xFFFFFC19:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_8;
      case 0xFFFFFC1D:
        v49 = v100;
        if (!(_QWORD)v100)
        {
          std::deque<std::__state<char>>::__add_front_capacity((uint64_t)&v98);
          v49 = v100;
        }
        v50 = (_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (v49 / 0x2A));
        v51 = *v50 + 96 * (v49 % 0x2A);
        if ((_QWORD)v99 == *((_QWORD *)&v98 + 1))
          v51 = 0;
        if (v51 == *v50)
          v51 = *(v50 - 1) + 4032;
        v52 = *(_OWORD *)(v38 + 16);
        *(_OWORD *)(v51 - 96) = *(_OWORD *)v38;
        *(_OWORD *)(v51 - 80) = v52;
        v53 = v36 + 96 * v37;
        *(_QWORD *)(v51 - 56) = 0;
        *(_QWORD *)(v51 - 48) = 0;
        *(_QWORD *)(v51 - 64) = 0;
        *(_OWORD *)(v51 - 64) = *(_OWORD *)(v53 + 32);
        *(_QWORD *)(v51 - 48) = *(_QWORD *)(v53 + 48);
        *(_QWORD *)(v53 + 32) = 0;
        *(_QWORD *)(v53 + 40) = 0;
        *(_QWORD *)(v53 + 48) = 0;
        *(_QWORD *)(v51 - 40) = 0;
        *(_QWORD *)(v51 - 32) = 0;
        *(_QWORD *)(v51 - 24) = 0;
        *(_OWORD *)(v51 - 40) = *(_OWORD *)(v53 + 56);
        *(_QWORD *)(v51 - 24) = *(_QWORD *)(v53 + 72);
        *(_QWORD *)(v53 + 56) = 0;
        *(_QWORD *)(v53 + 64) = 0;
        *(_QWORD *)(v53 + 72) = 0;
        v54 = *v40;
        *(_QWORD *)(v51 - 11) = *(_QWORD *)(v38 + 85);
        *(_QWORD *)(v51 - 16) = v54;
        v55 = *((_QWORD *)&v100 + 1);
        *(_QWORD *)&v100 = v100 - 1;
        ++*((_QWORD *)&v100 + 1);
        v56 = v55 + v100;
        v57 = (v55 + (uint64_t)v100) / 0x2AuLL;
        v43 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v57);
        v44 = v56 - 42 * v57;
        v45 = *(void **)(v43 + 96 * v44 + 56);
        if (!v45)
          goto LABEL_23;
        goto LABEL_22;
      case 0xFFFFFC1F:
LABEL_21:
        v42 = *((_QWORD *)&v100 + 1) + v100 - 1;
        v43 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (v42 / 0x2A));
        v44 = v42 % 0x2A;
        v45 = *(void **)(v43 + 96 * (v42 % 0x2A) + 56);
        if (v45)
        {
LABEL_22:
          *(_QWORD *)(v43 + 96 * v44 + 64) = v45;
          operator delete(v45);
        }
LABEL_23:
        v46 = *(void **)(v43 + 96 * v44 + 32);
        if (v46)
        {
          *(_QWORD *)(v43 + 96 * v44 + 40) = v46;
          operator delete(v46);
        }
        v47 = 42 * ((uint64_t)(v99 - *((_QWORD *)&v98 + 1)) >> 3) - 1;
        v48 = v100;
        --*((_QWORD *)&v100 + 1);
        if ((_QWORD)v99 == *((_QWORD *)&v98 + 1))
          v47 = 0;
        if ((unint64_t)(v47 - (*((_QWORD *)&v48 + 1) + v48) + 1) >= 0x54)
        {
          operator delete(*(void **)(v99 - 8));
          *(_QWORD *)&v99 = v99 - 8;
        }
        goto LABEL_8;
      case 0xFFFFFC20:
        *(_QWORD *)&v58 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v58 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v97[64] = v58;
        *(_OWORD *)&v97[80] = v58;
        *(_OWORD *)&v97[32] = v58;
        *(_OWORD *)&v97[48] = v58;
        *(_OWORD *)v97 = v58;
        *(_OWORD *)&v97[16] = v58;
        std::__state<char>::__state((uint64_t)v97, (__int128 *)(v36 + 96 * v37));
        (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v40 + 24))(*v40, 1, v36 + 96 * v37);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v97[80] + 24))(*(_QWORD *)&v97[80], 0, v97);
        v59 = *((_QWORD *)&v98 + 1);
        if ((_QWORD)v99 == *((_QWORD *)&v98 + 1))
          v60 = 0;
        else
          v60 = 42 * ((uint64_t)(v99 - *((_QWORD *)&v98 + 1)) >> 3) - 1;
        v61 = *((_QWORD *)&v100 + 1) + v100;
        if (v60 == *((_QWORD *)&v100 + 1) + (_QWORD)v100)
        {
          std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v98);
          v59 = *((_QWORD *)&v98 + 1);
          v61 = *((_QWORD *)&v100 + 1) + v100;
        }
        v62 = *(_QWORD *)(v59 + 8 * (v61 / 0x2A)) + 96 * (v61 % 0x2A);
        v63 = *(_OWORD *)&v97[16];
        *(_OWORD *)v62 = *(_OWORD *)v97;
        *(_OWORD *)(v62 + 16) = v63;
        *(_QWORD *)(v62 + 40) = 0;
        *(_QWORD *)(v62 + 48) = 0;
        *(_QWORD *)(v62 + 32) = 0;
        *(_OWORD *)(v62 + 32) = *(_OWORD *)&v97[32];
        *(_QWORD *)(v62 + 48) = *(_QWORD *)&v97[48];
        memset(&v97[32], 0, 24);
        *(_QWORD *)(v62 + 56) = 0;
        *(_QWORD *)(v62 + 64) = 0;
        *(_QWORD *)(v62 + 72) = 0;
        *(_OWORD *)(v62 + 56) = *(_OWORD *)&v97[56];
        *(_QWORD *)(v62 + 72) = *(_QWORD *)&v97[72];
        memset(&v97[56], 0, 24);
        v64 = *(_QWORD *)&v97[80];
        *(_QWORD *)(v62 + 85) = *(_QWORD *)&v97[85];
        *(_QWORD *)(v62 + 80) = v64;
        ++*((_QWORD *)&v100 + 1);
        if (*(_QWORD *)&v97[56])
        {
          *(_QWORD *)&v97[64] = *(_QWORD *)&v97[56];
          operator delete(*(void **)&v97[56]);
        }
        if (*(_QWORD *)&v97[32])
        {
          *(_QWORD *)&v97[40] = *(_QWORD *)&v97[32];
          operator delete(*(void **)&v97[32]);
        }
        goto LABEL_8;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
  }
}

void sub_24B83165C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_24B831670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  std::__state<char>::~__state((uint64_t *)va);
  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v11 - 144));
  _Unwind_Resume(a1);
}

void sub_24B8316B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_24B8316CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::deque<std::__state<char>>::~deque[abi:ne180100]((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  const char *v20;
  BOOL v21;
  uint64_t v22;
  char *v23;
  char *v24;
  const char *v25;
  char *v26;
  void *v27;
  void *v28;
  __int128 v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  __int128 v35;
  uint64_t v36;
  char *v37;
  char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  _BYTE *v45;
  unsigned int v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  void *v50;
  char *v51;
  char *v52;
  char *v53;
  void *v54;
  void *v55;
  uint64_t *v57;
  const char *v58;
  const char *v59;
  char v60;
  _BYTE v62[96];
  std::vector<std::csub_match>::value_type __x;
  _BYTE v64[40];
  void *v65[2];
  _BYTE v66[40];
  char *v67;
  char *v68;
  unint64_t v69;

  v67 = 0;
  v68 = 0;
  v69 = 0;
  *(_DWORD *)&v66[36] = -1431655766;
  *(_QWORD *)v64 = 0xAAAAAAAA00000000;
  memset(&v64[8], 0, 32);
  *(_OWORD *)v65 = 0u;
  memset(v66, 0, 36);
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    goto LABEL_63;
  __x.second = a3;
  *(_QWORD *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.first = a3;
  *(_DWORD *)v62 = 0;
  memset(&v62[8], 0, 85);
  v68 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v67, (uint64_t)v62);
  if (*(_QWORD *)&v62[56])
  {
    *(_QWORD *)&v62[64] = *(_QWORD *)&v62[56];
    operator delete(*(void **)&v62[56]);
  }
  if (*(_QWORD *)&v62[32])
  {
    *(_QWORD *)&v62[40] = *(_QWORD *)&v62[32];
    operator delete(*(void **)&v62[32]);
  }
  v12 = v68;
  *((_DWORD *)v68 - 24) = 0;
  *((_QWORD *)v12 - 11) = a2;
  *((_QWORD *)v12 - 10) = a2;
  *((_QWORD *)v12 - 9) = a3;
  v13 = *((_QWORD *)v12 - 8);
  v14 = *(unsigned int *)(a1 + 28);
  v15 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v12 - 7) - v13) >> 3);
  if (v14 <= v15)
  {
    if (v14 < v15)
      *((_QWORD *)v12 - 7) = v13 + 24 * v14;
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v12 - 64), v14 - v15, &__x);
    v12 = v68;
  }
  v16 = *((_QWORD *)v12 - 5);
  v17 = *(unsigned int *)(a1 + 32);
  v18 = (*((_QWORD *)v12 - 4) - v16) >> 4;
  v57 = a4;
  if (v17 <= v18)
  {
    if (v17 < v18)
      *((_QWORD *)v12 - 4) = v16 + 16 * v17;
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v12 - 40), v17 - v18);
    v12 = v68;
  }
  v60 = 0;
  v19 = 0;
  v20 = (const char *)(a3 - a2);
  *((_QWORD *)v12 - 2) = v6;
  *((_DWORD *)v12 - 2) = a5;
  v59 = 0;
  *(v12 - 4) = a6;
  v58 = a3;
  do
  {
    v21 = (++v19 & 0xFFF) != 0 || (int)(v19 >> 12) < (int)v20;
    if (!v21)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v23 = v12 - 16;
    v22 = *((_QWORD *)v12 - 2);
    v24 = v12 - 96;
    if (v22)
      (*(void (**)(uint64_t, char *))(*(_QWORD *)v22 + 16))(v22, v12 - 96);
    switch(*(_DWORD *)v24)
    {
      case 0xFFFFFC18:
        v25 = (const char *)*((_QWORD *)v12 - 10);
        if ((a5 & 0x20) != 0 && v25 == a2 || (a5 & 0x1000) != 0 && v25 != v58)
          goto LABEL_29;
        v33 = &v25[-*((_QWORD *)v12 - 11)];
        v34 = v59;
        if ((v60 & ((uint64_t)v59 >= (uint64_t)v33)) == 0)
        {
          v35 = *((_OWORD *)v12 - 5);
          *(_OWORD *)v64 = *(_OWORD *)v24;
          *(_OWORD *)&v64[16] = v35;
          if (v64 != v24)
          {
            std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>((char **)&v64[32], *((char **)v12 - 8), *((char **)v12 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v12 - 7) - *((_QWORD *)v12 - 8)) >> 3));
            std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((uint64_t)v66, *((const double **)v12 - 5), *((const double **)v12 - 4), (uint64_t)(*((_QWORD *)v12 - 4) - *((_QWORD *)v12 - 5)) >> 4);
          }
          v36 = *(_QWORD *)v23;
          *(_QWORD *)&v66[29] = *(_QWORD *)(v12 - 11);
          *(_QWORD *)&v66[24] = v36;
          v34 = v33;
        }
        v37 = v68;
        if (v34 == v20)
        {
          v38 = v67;
          while (v37 != v38)
          {
            v39 = (void *)*((_QWORD *)v37 - 5);
            if (v39)
            {
              *((_QWORD *)v37 - 4) = v39;
              operator delete(v39);
            }
            v40 = (void *)*((_QWORD *)v37 - 8);
            if (v40)
            {
              *((_QWORD *)v37 - 7) = v40;
              operator delete(v40);
            }
            v37 -= 96;
          }
          v68 = v38;
          v60 = 1;
          v59 = v20;
        }
        else
        {
          v59 = v34;
          v41 = (void *)*((_QWORD *)v68 - 5);
          if (v41)
          {
            *((_QWORD *)v68 - 4) = v41;
            operator delete(v41);
          }
          v42 = (void *)*((_QWORD *)v37 - 8);
          if (v42)
          {
            *((_QWORD *)v37 - 7) = v42;
            operator delete(v42);
          }
          v68 = v37 - 96;
          v60 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_29:
        v26 = v68;
        v27 = (void *)*((_QWORD *)v68 - 5);
        if (v27)
        {
          *((_QWORD *)v68 - 4) = v27;
          operator delete(v27);
        }
        v28 = (void *)*((_QWORD *)v26 - 8);
        if (v28)
        {
          *((_QWORD *)v26 - 7) = v28;
          operator delete(v28);
        }
        v68 = v26 - 96;
        break;
      case 0xFFFFFC20:
        *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v62[64] = v29;
        *(_OWORD *)&v62[80] = v29;
        *(_OWORD *)&v62[32] = v29;
        *(_OWORD *)&v62[48] = v29;
        *(_OWORD *)v62 = v29;
        *(_OWORD *)&v62[16] = v29;
        std::__state<char>::__state((uint64_t)v62, (__int128 *)v12 - 6);
        (*(void (**)(_QWORD, uint64_t, char *))(**(_QWORD **)v23 + 24))(*(_QWORD *)v23, 1, v12 - 96);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v62[80] + 24))(*(_QWORD *)&v62[80], 0, v62);
        v30 = v68;
        if ((unint64_t)v68 >= v69)
        {
          v68 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v67, (uint64_t)v62);
          if (*(_QWORD *)&v62[56])
          {
            *(_QWORD *)&v62[64] = *(_QWORD *)&v62[56];
            operator delete(*(void **)&v62[56]);
          }
        }
        else
        {
          v31 = *(_OWORD *)&v62[16];
          *(_OWORD *)v68 = *(_OWORD *)v62;
          *((_OWORD *)v30 + 1) = v31;
          *((_QWORD *)v30 + 4) = 0;
          *((_QWORD *)v30 + 5) = 0;
          *((_QWORD *)v30 + 6) = 0;
          *((_QWORD *)v30 + 7) = 0;
          *((_OWORD *)v30 + 2) = *(_OWORD *)&v62[32];
          *((_QWORD *)v30 + 6) = *(_QWORD *)&v62[48];
          memset(&v62[32], 0, 24);
          *((_QWORD *)v30 + 8) = 0;
          *((_QWORD *)v30 + 9) = 0;
          *(_OWORD *)(v30 + 56) = *(_OWORD *)&v62[56];
          *((_QWORD *)v30 + 9) = *(_QWORD *)&v62[72];
          memset(&v62[56], 0, 24);
          v32 = *(_QWORD *)&v62[80];
          *(_QWORD *)(v30 + 85) = *(_QWORD *)&v62[85];
          *((_QWORD *)v30 + 10) = v32;
          v68 = v30 + 96;
        }
        if (*(_QWORD *)&v62[32])
        {
          *(_QWORD *)&v62[40] = *(_QWORD *)&v62[32];
          operator delete(*(void **)&v62[32]);
        }
        break;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    v12 = v68;
  }
  while (v67 != v68);
  if ((v60 & 1) == 0)
  {
LABEL_63:
    v49 = 0;
    v50 = *(void **)v66;
    if (!*(_QWORD *)v66)
      goto LABEL_65;
    goto LABEL_64;
  }
  v43 = *v57;
  *(_QWORD *)v43 = a2;
  *(_QWORD *)(v43 + 8) = &v59[(_QWORD)a2];
  *(_BYTE *)(v43 + 16) = 1;
  if (v65[0] != *(void **)&v64[32])
  {
    v44 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v65[0] - *(_QWORD *)&v64[32]) >> 3);
    v45 = (_BYTE *)(*(_QWORD *)&v64[32] + 16);
    v46 = 1;
    do
    {
      v47 = v43 + 24 * v46;
      *(_OWORD *)v47 = *((_OWORD *)v45 - 1);
      v48 = *v45;
      v45 += 24;
      *(_BYTE *)(v47 + 16) = v48;
      v21 = v44 > v46++;
    }
    while (v21);
  }
  v49 = 1;
  v50 = *(void **)v66;
  if (*(_QWORD *)v66)
  {
LABEL_64:
    *(_QWORD *)&v66[8] = v50;
    operator delete(v50);
  }
LABEL_65:
  if (*(_QWORD *)&v64[32])
  {
    v65[0] = *(void **)&v64[32];
    operator delete(*(void **)&v64[32]);
  }
  v51 = v67;
  if (v67)
  {
    v52 = v68;
    v53 = v67;
    if (v68 != v67)
    {
      do
      {
        v54 = (void *)*((_QWORD *)v52 - 5);
        if (v54)
        {
          *((_QWORD *)v52 - 4) = v54;
          operator delete(v54);
        }
        v55 = (void *)*((_QWORD *)v52 - 8);
        if (v55)
        {
          *((_QWORD *)v52 - 7) = v55;
          operator delete(v55);
        }
        v52 -= 96;
      }
      while (v52 != v51);
      v53 = v67;
    }
    v68 = v51;
    operator delete(v53);
  }
  return v49;
}

void sub_24B831C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  std::__state<char>::~__state(&a35);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v35 - 120));
  _Unwind_Resume(a1);
}

void std::deque<std::__state<char>>::clear(_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  void **v5;
  char *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  if (v3 == v2)
  {
    a1[5] = 0;
    v11 = 0;
  }
  else
  {
    v4 = a1[4];
    v5 = &v2[v4 / 0x2A];
    v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    v7 = (unint64_t)v2[(a1[5] + v4) / 0x2A] + 96 * ((a1[5] + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        v8 = (void *)*((_QWORD *)v6 + 7);
        if (v8)
        {
          *((_QWORD *)v6 + 8) = v8;
          operator delete(v8);
        }
        v9 = (void *)*((_QWORD *)v6 + 4);
        if (v9)
        {
          *((_QWORD *)v6 + 5) = v9;
          operator delete(v9);
        }
        v6 += 96;
        if (v6 - (_BYTE *)*v5 == 4032)
        {
          v10 = (char *)v5[1];
          ++v5;
          v6 = v10;
        }
      }
      while (v6 != (char *)v7);
      v2 = (void **)a1[1];
      v3 = (void **)a1[2];
    }
    a1[5] = 0;
    v11 = (char *)v3 - (char *)v2;
    if (v11 >= 0x11)
    {
      do
      {
        operator delete(*v2);
        v12 = a1[2];
        v2 = (void **)(a1[1] + 8);
        a1[1] = v2;
        v11 = v12 - (_QWORD)v2;
      }
      while (v11 > 0x10);
    }
  }
  if (v11 >> 3 == 1)
  {
    v13 = 21;
  }
  else
  {
    if (v11 >> 3 != 2)
      return;
    v13 = 42;
  }
  a1[4] = v13;
}

void **std::deque<std::__state<char>>::~deque[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;
  _BYTE *v5;
  _BYTE *v6;

  std::deque<std::__state<char>>::clear(a1);
  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  if (v2 != v3)
  {
    do
    {
      v4 = *v2++;
      operator delete(v4);
    }
    while (v2 != v3);
    v6 = a1[1];
    v5 = a1[2];
    if (v5 != v6)
      a1[2] = &v5[(v6 - v5 + 7) & 0xFFFFFFFFFFFFFFF8];
  }
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::deque<std::__state<char>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  void *v26;
  char *v27;
  char *v28;
  char *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  BOOL v38;
  int64_t v39;
  unint64_t v40;
  char *v41;
  _QWORD *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  int64_t v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD *v56;
  unint64_t v57;
  char *v58;
  char *v59;
  unint64_t v60;
  int64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 *v68;
  char *v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 *v76;
  _OWORD *v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  __int128 *v84;
  _OWORD *v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  void *v89;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v4;
    v6 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v6 + 1);
    v8 = *v6;
    *(_QWORD *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_76:
      *(_QWORD *)v5 = v8;
      *(_QWORD *)(a1 + 16) += 8;
      return;
    }
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v32 = (v5 - v9) >> 2;
      if (v5 == v9)
        v32 = 1;
      if (!(v32 >> 61))
      {
        v33 = v32 >> 2;
        v34 = 8 * v32;
        v35 = (char *)operator new(8 * v32);
        v36 = &v35[8 * v33];
        v37 = &v35[v34];
        v39 = v5 - v7;
        v38 = v5 == v7;
        v5 = v36;
        if (!v38)
        {
          v5 = &v36[v39 & 0xFFFFFFFFFFFFFFF8];
          v40 = v39 - 8;
          if ((unint64_t)(v39 - 8) >= 0x38)
          {
            v73 = &v35[8 * v33];
            v41 = v73;
            if ((unint64_t)(v73 - v7) >= 0x20)
            {
              v74 = (v40 >> 3) + 1;
              v75 = 8 * (v74 & 0x3FFFFFFFFFFFFFFCLL);
              v41 = &v36[v75];
              v7 += v75;
              v76 = (__int128 *)(v6 + 3);
              v77 = v73 + 16;
              v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v79 = *v76;
                *(v77 - 1) = *(v76 - 1);
                *v77 = v79;
                v76 += 2;
                v77 += 2;
                v78 -= 4;
              }
              while (v78);
              if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_74;
            }
          }
          else
          {
            v41 = &v35[8 * v33];
          }
          do
          {
            v80 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v41 = v80;
            v41 += 8;
          }
          while (v41 != v5);
        }
        goto LABEL_74;
      }
LABEL_85:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    v11 = v10 >> 3;
    if (v11 >= -1)
      v12 = v11 + 1;
    else
      v12 = v11 + 2;
    v13 = v12 >> 1;
    v14 = -v13;
    v15 = &v7[-8 * v13];
    v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      v7 = *(char **)(a1 + 8);
    }
    v5 = &v15[v16];
    *(_QWORD *)(a1 + 8) = &v7[8 * v14];
    *(_QWORD *)(a1 + 16) = &v15[v16];
    goto LABEL_76;
  }
  v18 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  v19 = *(_QWORD *)(a1 + 8);
  v20 = v18 - v19;
  v21 = (v18 - v19) >> 3;
  v22 = v17 - *(_QWORD *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      v89 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v89);
      return;
    }
    v89 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v89);
    v42 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v42 + 1);
    v8 = *v42;
    *(_QWORD *)(a1 + 8) = v42 + 1;
    if (v5 != *(char **)(a1 + 24))
      goto LABEL_76;
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v43 = (v5 - v9) >> 2;
      if (v5 == v9)
        v43 = 1;
      if (!(v43 >> 61))
      {
        v44 = v43 >> 2;
        v45 = 8 * v43;
        v35 = (char *)operator new(8 * v43);
        v36 = &v35[8 * v44];
        v37 = &v35[v45];
        v46 = v5 - v7;
        v38 = v5 == v7;
        v5 = v36;
        if (!v38)
        {
          v5 = &v36[v46 & 0xFFFFFFFFFFFFFFF8];
          v47 = v46 - 8;
          if ((unint64_t)(v46 - 8) >= 0x38)
          {
            v81 = &v35[8 * v44];
            v48 = v81;
            if ((unint64_t)(v81 - v7) >= 0x20)
            {
              v82 = (v47 >> 3) + 1;
              v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
              v48 = &v36[v83];
              v7 += v83;
              v84 = (__int128 *)(v42 + 3);
              v85 = v81 + 16;
              v86 = v82 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v87 = *v84;
                *(v85 - 1) = *(v84 - 1);
                *v85 = v87;
                v84 += 2;
                v85 += 2;
                v86 -= 4;
              }
              while (v86);
              if (v82 == (v82 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_74;
            }
          }
          else
          {
            v48 = &v35[8 * v44];
          }
          do
          {
            v88 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v48 = v88;
            v48 += 8;
          }
          while (v48 != v5);
        }
LABEL_74:
        *(_QWORD *)a1 = v35;
        *(_QWORD *)(a1 + 8) = v36;
        *(_QWORD *)(a1 + 16) = v5;
        *(_QWORD *)(a1 + 24) = v37;
        if (v9)
        {
          operator delete(v9);
          v5 = *(char **)(a1 + 16);
        }
        goto LABEL_76;
      }
      goto LABEL_85;
    }
    goto LABEL_5;
  }
  v23 = v22 >> 2;
  if (v17 == *(_QWORD *)a1)
    v24 = 1;
  else
    v24 = v23;
  if (v24 >> 61)
    goto LABEL_85;
  v25 = (char *)operator new(8 * v24);
  v26 = operator new(0xFC0uLL);
  v27 = &v25[8 * v21];
  v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    v30 = v26;
    if (v20 < 1)
    {
      if (v18 == v19)
        v49 = 1;
      else
        v49 = v20 >> 2;
      if (v49 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v27 = (char *)operator new(8 * v49);
      v28 = &v27[8 * v49];
      operator delete(v25);
      v50 = *(_QWORD *)(a1 + 8);
      v18 = *(_QWORD *)(a1 + 16);
      v25 = v27;
      *(_QWORD *)v27 = v30;
      v29 = v27 + 8;
      if (v18 == v50)
        goto LABEL_45;
    }
    else
    {
      v31 = v21 + 2;
      if (v21 >= -1)
        v31 = v21 + 1;
      v27 -= 8 * (v31 >> 1);
      *(_QWORD *)v27 = v26;
      v29 = v27 + 8;
      if (v18 == v19)
        goto LABEL_45;
    }
    goto LABEL_49;
  }
  *(_QWORD *)v27 = v26;
  v29 = v27 + 8;
  if (v18 != v19)
  {
    do
    {
LABEL_49:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v25)
            v57 = 1;
          else
            v57 = (v28 - v25) >> 2;
          if (v57 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v58 = (char *)operator new(8 * v57);
          v59 = v58;
          v60 = (v57 + 3) >> 2;
          v27 = &v58[8 * v60];
          v61 = v29 - v25;
          v38 = v29 == v25;
          v29 = v27;
          if (!v38)
          {
            v29 = &v27[v61 & 0xFFFFFFFFFFFFFFF8];
            v62 = v61 - 8;
            v63 = &v58[8 * v60];
            v64 = v25;
            if (v62 < 0x38)
              goto LABEL_89;
            v65 = 8 * v60;
            v63 = &v58[8 * v60];
            v64 = v25;
            if ((unint64_t)(v63 - v25) < 0x20)
              goto LABEL_89;
            v66 = (v62 >> 3) + 1;
            v67 = 8 * (v66 & 0x3FFFFFFFFFFFFFFCLL);
            v63 = &v27[v67];
            v64 = &v25[v67];
            v68 = (__int128 *)(v25 + 16);
            v69 = &v58[v65 + 16];
            v70 = v66 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v71 = *v68;
              *((_OWORD *)v69 - 1) = *(v68 - 1);
              *(_OWORD *)v69 = v71;
              v68 += 2;
              v69 += 32;
              v70 -= 4;
            }
            while (v70);
            if (v66 != (v66 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_89:
              do
              {
                v72 = *(_QWORD *)v64;
                v64 += 8;
                *(_QWORD *)v63 = v72;
                v63 += 8;
              }
              while (v63 != v29);
            }
          }
          v28 = &v58[8 * v57];
          operator delete(v25);
          v25 = v59;
        }
        else
        {
          v53 = (v28 - v29) >> 3;
          if (v53 >= -1)
            v54 = v53 + 1;
          else
            v54 = v53 + 2;
          v55 = v54 >> 1;
          v27 = &v25[8 * (v54 >> 1)];
          v56 = v25;
          if (v29 != v25)
          {
            memmove(v27, v25, v29 - v25);
            v56 = v29;
          }
          v29 = (char *)v56 + 8 * v55;
        }
      }
      v52 = *(_QWORD *)(v18 - 8);
      v18 -= 8;
      *((_QWORD *)v27 - 1) = v52;
      v27 -= 8;
    }
    while (v18 != *(_QWORD *)(a1 + 8));
  }
LABEL_45:
  v51 = *(char **)a1;
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v27;
  *(_QWORD *)(a1 + 16) = v29;
  *(_QWORD *)(a1 + 24) = v28;
  if (v51)
    operator delete(v51);
}

void sub_24B8323FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(char **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  BOOL v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v4 = a1[2];
  if (v4 != a1[3])
    goto LABEL_22;
  v5 = *a1;
  v6 = a1[1];
  if (v6 > *a1)
  {
    v7 = (v6 - *a1) >> 3;
    if (v7 >= -1)
      v8 = v7 + 1;
    else
      v8 = v7 + 2;
    v9 = v8 >> 1;
    v10 = -v9;
    v11 = &v6[-8 * v9];
    v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      v4 = a1[1];
    }
    v13 = &v4[8 * v10];
    v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  v14 = (v4 - v5) >> 2;
  if (v4 == v5)
    v14 = 1;
  if (v14 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v15 = v14 >> 2;
  v16 = 8 * v14;
  v17 = (char *)operator new(8 * v14);
  v18 = &v17[8 * v15];
  v20 = v4 - v6;
  v19 = v4 == v6;
  v4 = v18;
  if (!v19)
  {
    v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        v31 = *(_QWORD *)v6;
        v6 += 8;
        *(_QWORD *)v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    v23 = &v17[8 * v15];
    v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20)
      goto LABEL_19;
    v24 = (v21 >> 3) + 1;
    v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    v22 = &v18[v25];
    v26 = &v6[v25];
    v27 = (__int128 *)(v6 + 16);
    v28 = v23 + 16;
    v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_19;
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    v4 = a1[2];
  }
LABEL_22:
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(void **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    v7 = a1[2];
    v6 = a1[3];
    if (v7 >= v6)
    {
      v13 = v6 - v4;
      v12 = v13 == 0;
      v14 = v13 >> 2;
      if (v12)
        v14 = 1;
      if (v14 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v15 = (v14 + 3) >> 2;
      v16 = 8 * v14;
      v17 = (char *)operator new(8 * v14);
      v5 = &v17[8 * v15];
      v18 = v5;
      v19 = v7 - v4;
      if (v7 != v4)
      {
        v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        v20 = v19 - 8;
        v21 = &v17[8 * v15];
        v22 = v4;
        if (v20 < 0x38)
          goto LABEL_27;
        v23 = &v17[8 * v15];
        v21 = v23;
        v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20)
          goto LABEL_27;
        v24 = (v20 >> 3) + 1;
        v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        v21 = &v5[v25];
        v22 = &v4[v25];
        v26 = (__int128 *)(v4 + 16);
        v27 = v23 + 16;
        v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            v30 = *(_QWORD *)v22;
            v22 += 8;
            *(_QWORD *)v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        v5 = (char *)a1[1];
      }
    }
    else
    {
      v8 = (v6 - v7) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v11 = &v7[8 * (v9 >> 1)];
      v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    v5 = (char *)a1[1];
  }
  *((_QWORD *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

void std::deque<std::__state<char>>::__add_front_capacity(uint64_t a1)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  BOOL v30;
  int64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 *v39;
  char *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  void *v46;
  void *v47;

  v3 = *(uint64_t **)(a1 + 8);
  v2 = *(uint64_t **)(a1 + 16);
  v4 = v2 - v3;
  if (v2 == v3)
    v5 = 0;
  else
    v5 = 42 * v4 - 1;
  v6 = *(_QWORD *)(a1 + 32);
  if ((unint64_t)(v5 - (*(_QWORD *)(a1 + 40) + v6)) >= 0x2A)
  {
    *(_QWORD *)(a1 + 32) = v6 + 42;
    v47 = (void *)*(v2 - 1);
    *(_QWORD *)(a1 + 16) = v2 - 1;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v47);
    return;
  }
  v7 = *(uint64_t **)(a1 + 24);
  v8 = *(uint64_t **)a1;
  v9 = (uint64_t)v7 - *(_QWORD *)a1;
  if (v4 < v9 >> 3)
  {
    if (v3 == v8)
    {
      v47 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v47);
      v43 = *(_QWORD *)(a1 + 16);
      v47 = *(void **)(v43 - 8);
      *(_QWORD *)(a1 + 16) = v43 - 8;
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v47);
      if (*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8) == 8)
        goto LABEL_9;
    }
    else
    {
      v47 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v47);
      if (*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8) == 8)
      {
LABEL_9:
        v10 = 21;
LABEL_45:
        *(_QWORD *)(a1 + 32) = v10;
        return;
      }
    }
    v10 = *(_QWORD *)(a1 + 32) + 42;
    goto LABEL_45;
  }
  if (v7 == v8)
    v11 = 1;
  else
    v11 = v9 >> 2;
  if (v11 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v12 = (char *)operator new(8 * v11);
  v13 = operator new(0xFC0uLL);
  v14 = v13;
  if (v11)
  {
    v15 = &v12[8 * v11];
    *(_QWORD *)v12 = v13;
    v16 = v12 + 8;
    if (v3 != v2)
    {
LABEL_16:
      v17 = v12;
      while (1)
      {
        if (v16 == v15)
        {
          if (v17 <= v12)
          {
            if (v16 == v12)
              v26 = 1;
            else
              v26 = (v16 - v12) >> 2;
            if (v26 >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v27 = (char *)operator new(8 * v26);
            v28 = v27;
            v29 = v26 >> 2;
            v18 = &v27[8 * (v26 >> 2)];
            v31 = v16 - v17;
            v30 = v16 == v17;
            v16 = v18;
            if (!v30)
            {
              v16 = &v18[v31 & 0xFFFFFFFFFFFFFFF8];
              v32 = v31 - 8;
              if (v32 < 0x38 || (v33 = 8 * v29, (unint64_t)(&v27[8 * v29] - v17) < 0x20))
              {
                v34 = &v27[8 * (v26 >> 2)];
                v35 = v17;
                goto LABEL_35;
              }
              v37 = (v32 >> 3) + 1;
              v38 = 8 * (v37 & 0x3FFFFFFFFFFFFFFCLL);
              v34 = &v18[v38];
              v35 = &v17[v38];
              v39 = (__int128 *)(v17 + 16);
              v40 = &v27[v33 + 16];
              v41 = v37 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v42 = *v39;
                *((_OWORD *)v40 - 1) = *(v39 - 1);
                *(_OWORD *)v40 = v42;
                v39 += 2;
                v40 += 32;
                v41 -= 4;
              }
              while (v41);
              if (v37 != (v37 & 0x3FFFFFFFFFFFFFFCLL))
              {
                do
                {
LABEL_35:
                  v36 = *(_QWORD *)v35;
                  v35 += 8;
                  *(_QWORD *)v34 = v36;
                  v34 += 8;
                }
                while (v34 != v16);
              }
            }
            v15 = &v27[8 * v26];
            if (v12)
              operator delete(v12);
            v12 = v28;
            goto LABEL_18;
          }
          v20 = (v17 - v12) >> 3;
          if (v20 >= -1)
            v21 = v20 + 1;
          else
            v21 = v20 + 2;
          v22 = v21 >> 1;
          v23 = &v17[-8 * (v21 >> 1)];
          v24 = v16;
          if (v16 != v17)
          {
            memmove(v23, v17, v16 - v17);
            v24 = v17;
          }
          v25 = -v22;
          v15 = v16;
          v16 = &v23[v16 - v17];
          v18 = &v24[8 * v25];
        }
        else
        {
          v18 = v17;
        }
LABEL_18:
        v19 = *v3++;
        *(_QWORD *)v16 = v19;
        v16 += 8;
        v17 = v18;
        if (v3 == *(uint64_t **)(a1 + 16))
          goto LABEL_48;
      }
    }
  }
  else
  {
    v44 = (char *)operator new(8uLL);
    v15 = v44 + 8;
    operator delete(v12);
    v3 = *(uint64_t **)(a1 + 8);
    v45 = *(uint64_t **)(a1 + 16);
    v12 = v44;
    *(_QWORD *)v44 = v14;
    v16 = v44 + 8;
    if (v3 != v45)
      goto LABEL_16;
  }
  v18 = v12;
LABEL_48:
  v46 = *(void **)a1;
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 8) = v18;
  *(_QWORD *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 24) = v15;
  if (v16 - v18 == 8)
  {
    *(_QWORD *)(a1 + 32) = 21;
    if (v46)
LABEL_50:
      operator delete(v46);
  }
  else
  {
    *(_QWORD *)(a1 + 32) += 42;
    if (v46)
      goto LABEL_50;
  }
}

void sub_24B832AB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char **a1, char *a2, char *a3, size_t __sz)
{
  char *v6;
  uint64_t v8;
  char *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  int64_t v16;
  _QWORD *v17;
  char *v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  char *v24;
  char *v25;

  v6 = a2;
  v8 = (uint64_t)a1[2];
  result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= __sz)
  {
    v18 = a1[1];
    v17 = a1 + 1;
    v14 = v18;
    v19 = 0xAAAAAAAAAAAAAAABLL * ((v18 - result) >> 3);
    if (v19 >= __sz)
    {
      v24 = result;
      if (a2 != a3)
      {
        v25 = result;
        do
        {
          *(_OWORD *)v25 = *(_OWORD *)v6;
          v25[16] = v6[16];
          v24 += 24;
          v6 += 24;
          v25 += 24;
        }
        while (v6 != a3);
      }
      v16 = v24 - result;
      v14 = result;
    }
    else
    {
      v20 = &a2[24 * v19];
      if (v14 != result)
      {
        do
        {
          *(_OWORD *)result = *(_OWORD *)v6;
          result[16] = v6[16];
          v6 += 24;
          result += 24;
        }
        while (v6 != v20);
      }
      v21 = v14;
      if (v20 != a3)
      {
        v22 = v14;
        do
        {
          v23 = *(_OWORD *)v20;
          *((_QWORD *)v22 + 2) = *((_QWORD *)v20 + 2);
          *(_OWORD *)v22 = v23;
          v22 += 24;
          v20 += 24;
          v21 += 24;
        }
        while (v20 != a3);
      }
      v16 = v21 - v14;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (__sz > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_26;
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= __sz)
      v11 = __sz;
    v12 = v10 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v11;
    if (v12 > 0xAAAAAAAAAAAAAAALL)
LABEL_26:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v13 = 24 * v12;
    result = (char *)operator new(24 * v12);
    v14 = result;
    *a1 = result;
    a1[1] = result;
    a1[2] = &result[v13];
    v15 = result;
    if (v6 != a3)
    {
      result = (char *)memcpy(result, v6, 24 * ((a3 - v6 - 24) / 0x18uLL) + 24);
      v15 = &v14[24 * ((a3 - v6 - 24) / 0x18uLL) + 24];
    }
    v16 = v15 - v14;
    v17 = a1 + 1;
  }
  *v17 = &v14[v16];
  return result;
}

double *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(uint64_t a1, const double *a2, const double *a3, size_t __sz)
{
  uint64_t v8;
  double *result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double *v13;
  double *v14;
  int64_t v15;
  _QWORD *v16;
  double *v17;
  int64_t v18;
  unint64_t v19;
  const double *v20;
  unint64_t v21;
  double *v22;
  const double *v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  double *v27;
  __int128 v28;
  unint64_t v29;
  char *v30;
  const double *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  BOOL v37;
  char v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  const double *v42;
  double *v43;
  uint64_t v44;
  const double *v45;
  double *v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  BOOL v51;
  char v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  const double *v56;
  double *v57;
  uint64_t v58;
  const double *v59;
  double *v60;
  float64x2x2_t v61;
  float64x2x2_t v62;
  float64x2x2_t v63;
  float64x2x2_t v64;

  v8 = *(_QWORD *)(a1 + 16);
  result = *(double **)a1;
  if (__sz > (v8 - (uint64_t)result) >> 4)
  {
    if (result)
    {
      *(_QWORD *)(a1 + 8) = result;
      operator delete(result);
      v8 = 0;
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
    if (__sz >> 60)
      goto LABEL_62;
    v10 = v8 >> 3;
    if (v8 >> 3 <= __sz)
      v10 = __sz;
    v37 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0;
    v11 = 0xFFFFFFFFFFFFFFFLL;
    if (!v37)
      v11 = v10;
    if (v11 >> 60)
LABEL_62:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v12 = 2 * v11;
    result = (double *)operator new(16 * v11);
    v13 = result;
    *(_QWORD *)a1 = result;
    *(_QWORD *)(a1 + 8) = result;
    *(_QWORD *)(a1 + 16) = &result[v12];
    v14 = result;
    if (a2 != a3)
    {
      result = (double *)memcpy(result, a2, ((char *)a3 - (char *)a2) & 0xFFFFFFFFFFFFFFF0);
      v14 = (double *)((char *)v13 + (((char *)a3 - (char *)a2) & 0xFFFFFFFFFFFFFFF0));
    }
    v15 = (char *)v14 - (char *)v13;
    v16 = (_QWORD *)(a1 + 8);
    goto LABEL_29;
  }
  v17 = *(double **)(a1 + 8);
  v16 = (_QWORD *)(a1 + 8);
  v13 = v17;
  v18 = (char *)v17 - (char *)result;
  v19 = ((char *)v17 - (char *)result) >> 4;
  if (v19 >= __sz)
  {
    if (a2 == a3)
    {
      v30 = (char *)result;
    }
    else
    {
      v29 = (char *)a3 - (char *)a2 - 16;
      if (v29 < 0xF0
        || ((v47 = v29 & 0xFFFFFFFFFFFFFFF0 | 8,
             v48 = (char *)result + v47,
             v49 = (unint64_t)a2 + v47,
             v50 = (v29 & 0xFFFFFFFFFFFFFFF0) + 16,
             result + 1 < (const double *)((char *)a2 + v50))
          ? (v51 = a2 + 1 >= (double *)((char *)result + v50))
          : (v51 = 1),
            v51 ? (v52 = 0) : (v52 = 1),
            v48 > (char *)a2 ? (v53 = (unint64_t)result >= v49) : (v53 = 1),
            !v53 || (v52 & 1) != 0))
      {
        v30 = (char *)result;
        v31 = a2;
      }
      else
      {
        v54 = (v29 >> 4) + 1;
        v55 = 2 * (v54 & 0x1FFFFFFFFFFFFFFCLL);
        v30 = (char *)&result[v55];
        v31 = &a2[v55];
        v56 = a2 + 4;
        v57 = result + 4;
        v58 = v54 & 0x1FFFFFFFFFFFFFFCLL;
        do
        {
          v59 = v56 - 4;
          v62 = vld2q_f64(v59);
          v64 = vld2q_f64(v56);
          v60 = v57 - 4;
          vst2q_f64(v60, v62);
          vst2q_f64(v57, v64);
          v56 += 8;
          v57 += 8;
          v58 -= 4;
        }
        while (v58);
        if (v54 == (v54 & 0x1FFFFFFFFFFFFFFCLL))
          goto LABEL_28;
      }
      do
      {
        v32 = *(_QWORD *)v31;
        v33 = *((_QWORD *)v31 + 1);
        v31 += 2;
        *(_QWORD *)v30 = v32;
        *((_QWORD *)v30 + 1) = v33;
        v30 += 16;
      }
      while (v31 != a3);
    }
LABEL_28:
    v15 = v30 - (char *)result;
    v13 = result;
    goto LABEL_29;
  }
  v20 = &a2[2 * v19];
  if (v13 != result)
  {
    v21 = v18 - 16;
    if ((unint64_t)(v18 - 16) < 0xF0
      || ((v34 = v18 & 0xFFFFFFFFFFFFFFF0,
           v35 = (char *)result + v34 - 8,
           v36 = (unint64_t)a2 + v34 - 8,
           result + 1 < (const double *)((char *)a2 + v34))
        ? (v37 = a2 + 1 >= (double *)((char *)result + v34))
        : (v37 = 1),
          v37 ? (v38 = 0) : (v38 = 1),
          v35 > (char *)a2 ? (v39 = (unint64_t)result >= v36) : (v39 = 1),
          !v39 || (v38 & 1) != 0))
    {
      v22 = result;
      v23 = a2;
    }
    else
    {
      v40 = (v21 >> 4) + 1;
      v41 = 2 * (v40 & 0x1FFFFFFFFFFFFFFCLL);
      v22 = &result[v41];
      v23 = &a2[v41];
      v42 = a2 + 4;
      v43 = result + 4;
      v44 = v40 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        v45 = v42 - 4;
        v61 = vld2q_f64(v45);
        v63 = vld2q_f64(v42);
        v46 = v43 - 4;
        vst2q_f64(v46, v61);
        vst2q_f64(v43, v63);
        v42 += 8;
        v43 += 8;
        v44 -= 4;
      }
      while (v44);
      if (v40 == (v40 & 0x1FFFFFFFFFFFFFFCLL))
        goto LABEL_18;
    }
    do
    {
      v24 = *(_QWORD *)v23;
      v25 = *((_QWORD *)v23 + 1);
      v23 += 2;
      *(_QWORD *)v22 = v24;
      *((_QWORD *)v22 + 1) = v25;
      v22 += 2;
    }
    while (v23 != v20);
  }
LABEL_18:
  v26 = v13;
  if (v20 != a3)
  {
    v27 = v13;
    do
    {
      v28 = *(_OWORD *)v20;
      v20 += 2;
      *(_OWORD *)v27 = v28;
      v27 += 2;
      v26 += 2;
    }
    while (v20 != a3);
  }
  v15 = (char *)v26 - (char *)v13;
LABEL_29:
  *v16 = (char *)v13 + v15;
  return result;
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __n)
{
  std::sub_match<std::__wrap_iter<const char *>> *value;
  std::vector<std::ssub_match>::pointer end;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  std::sub_match<std::__wrap_iter<const char *>> *v11;
  std::vector<std::ssub_match>::size_type v12;
  std::sub_match<std::__wrap_iter<const char *>> *v13;
  std::vector<std::ssub_match>::size_type v14;
  std::sub_match<std::__wrap_iter<const char *>> *v15;
  std::sub_match<std::__wrap_iter<const char *>> *v16;
  std::vector<std::ssub_match>::pointer begin;
  std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v18;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      v11 = &end[__n];
      v12 = 24 * __n;
      do
      {
        end->first.__i_ = 0;
        end->second.__i_ = 0;
        end->matched = 0;
        ++end;
        v12 -= 24;
      }
      while (v12);
      end = v11;
    }
    this->__end_ = end;
  }
  else
  {
    v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    v7 = v6 + __n;
    if (v6 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v8 > v7)
      v7 = 2 * v8;
    if (v8 >= 0x555555555555555)
      v9 = 0xAAAAAAAAAAAAAAALL;
    else
      v9 = v7;
    if (v9)
    {
      if (v9 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v10 = (char *)operator new(24 * v9);
    }
    else
    {
      v10 = 0;
    }
    v13 = (std::sub_match<std::__wrap_iter<const char *>> *)&v10[24 * v6];
    v14 = 24 * __n;
    v15 = &v13[__n];
    v16 = v13;
    do
    {
      v16->first.__i_ = 0;
      v16->second.__i_ = 0;
      v16->matched = 0;
      ++v16;
      v14 -= 24;
    }
    while (v14);
    begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        v18 = end[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>>;
        *(_QWORD *)&v13[-1].matched = *(_QWORD *)&end[-1].matched;
        v13[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> = v18;
        --v13;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v15;
    this->__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)&v10[24 * v9];
    if (end)
      operator delete(end);
  }
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>(uint64_t a1, uint64_t a2, int a3)
{
  const std::locale *v6;
  uint64_t v7;
  char *v8;

  v6 = (const std::locale *)MEMORY[0x24BD28220]();
  *(_QWORD *)(a1 + 8) = std::locale::use_facet(v6, MEMORY[0x24BEDB350]);
  *(_QWORD *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x24BEDB4B0]);
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0)
    v8 = (char *)a2;
  else
    v8 = *(char **)a2;
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(a2 + 8);
  if (&v8[v7] != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(a1, v8, &v8[v7]))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  return a1;
}

void sub_24B8331F0(_Unwind_Exception *a1)
{
  std::locale *v1;
  uint64_t v2;

  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v2);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_24B83320C(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unsigned int v12;

  v6 = operator new(8uLL);
  *v6 = &unk_251CB4298;
  v7 = operator new(0x10uLL);
  v7[1] = v6;
  v8 = operator new(0x20uLL);
  *v8 = &unk_251CB42F0;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  if (!v9)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
    v12 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v12 <= 0x3F)
    {
LABEL_6:
      if (!v12)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      if (v12 != 16)
      {
        if (v12 != 32)
LABEL_19:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
        return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, a2, a3);
    }
  }
  else
  {
LABEL_5:
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
    v12 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v12 <= 0x3F)
      goto LABEL_6;
  }
  if (v12 == 64)
    return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
  if (v12 == 128)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v12 != 256)
    goto LABEL_19;
  return (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)a3);
}

void sub_24B8333D4(_Unwind_Exception *a1)
{
  void *v1;
  void (__cdecl ***v2)(std::__owns_one_state<char> *__hidden);

  operator delete(v1);
  operator delete(v2);
  (*(void (**)(void *))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_24B833410(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v2 + 8))(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  char *v7;
  std::basic_regex<char> *v8;
  std::__owns_one_state<char> *v9;
  unsigned int marked_count;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *first;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;
  std::__node<char> *v20;
  std::__owns_one_state<char> *v21;
  std::basic_regex<char> *v22;
  char *v23;
  std::__owns_one_state<char> *v24;
  unsigned int v25;
  std::basic_regex<char> *v26;
  std::__node<char> *v27;
  std::__owns_one_state<char> *v28;
  std::__node<char> *v29;

  end = a1->__end_;
  v7 = a2;
  while (1)
  {
    v8 = (std::basic_regex<char> *)v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v7, a3);
    if (v8 == (std::basic_regex<char> *)v7)
      break;
LABEL_2:
    if (v7 == (char *)v8)
      goto LABEL_6;
  }
  v9 = a1->__end_;
  marked_count = a1->__marked_count_;
  v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, (std::basic_regex<char> *)a3);
  if (v8 != v11)
  {
    v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 != (std::basic_regex<char> *)a2)
  {
    if (v8 != (std::basic_regex<char> *)a3)
      goto LABEL_14;
    return a3;
  }
  v12 = (std::__node<char> *)operator new(0x10uLL);
  v13 = a1->__end_;
  first = v13->__first_;
  v12[1].__vftable = (std::__node<char>_vtbl *)first;
  v13->__first_ = v12;
  a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  if (v8 != (std::basic_regex<char> *)a3)
  {
LABEL_14:
    if (LOBYTE(v8->__traits_.__loc_.__locale_) != 124)
      return (char *)v8;
    v21 = a1->__end_;
    v22 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    v23 = (char *)&v8->__traits_.__loc_.__locale_ + 1;
    while (1)
    {
      v8 = (std::basic_regex<char> *)v23;
      v23 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v23, a3);
      if (v8 == (std::basic_regex<char> *)v23)
      {
        v24 = a1->__end_;
        v25 = a1->__marked_count_;
        v26 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, (std::basic_regex<char> *)a3);
        if (v8 == v26)
        {
LABEL_11:
          if (v8 == v22)
          {
            v27 = (std::__node<char> *)operator new(0x10uLL);
            v28 = a1->__end_;
            v29 = v28->__first_;
            v27[1].__vftable = (std::__node<char>_vtbl *)v29;
            v28->__first_ = v27;
            a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
          }
          v15 = (std::__node<char> *)operator new(0x18uLL);
          v16 = v21->__first_;
          v15[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
          v15[2].__vftable = (std::__node<char>_vtbl *)v16;
          v15->__vftable = (std::__node<char>_vtbl *)&unk_251CB48B0;
          end->__first_ = v15;
          v21->__first_ = 0;
          v17 = (std::__node<char> *)operator new(0x10uLL);
          v18 = a1->__end_->__first_;
          v17[1].__vftable = (std::__node<char>_vtbl *)v18;
          v21->__first_ = v17;
          a1->__end_->__first_ = 0;
          v19 = (std::__node<char> *)operator new(0x10uLL);
          v20 = v21->__first_;
          v19->__vftable = (std::__node<char>_vtbl *)&unk_251CB48F8;
          v19[1].__vftable = (std::__node<char>_vtbl *)v20;
          a1->__end_->__first_ = v19;
          a1->__end_ = (std::__owns_one_state<char> *)v21->__first_;
          if (v8 == (std::basic_regex<char> *)a3)
            return a3;
          goto LABEL_14;
        }
        v23 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v26, (std::basic_regex<char> *)a3, v24, v25 + 1, a1->__marked_count_ + 1);
      }
      if (v23 == (char *)v8)
        goto LABEL_11;
    }
  }
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  std::basic_regex<char> *v3;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  std::__owns_one_state<char> *v11;
  int v12;
  char *v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (std::basic_regex<char> *)a2;
  if (a2 == a3)
    return a2;
  if (*a2 == 94)
  {
    v6 = operator new(0x18uLL);
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *v6 = &unk_251CB43E8;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      v10 = v3;
      v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      v12 = *(_DWORD *)(a1 + 28);
      v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, (uint64_t)v10, a3);
      if (v10 != v13)
      {
        v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v10 != (_BYTE *)v3)
          continue;
      }
      if (v10 + 1 != a3 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v14 = operator new(0x18uLL);
      v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(v16 + 8);
      *v14 = &unk_251CB4430;
      v14[1] = v17;
      *((_BYTE *)v14 + 16) = v15;
      *(_QWORD *)(v16 + 8) = v14;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  uint64_t v6;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  uint64_t v9;
  std::basic_regex<char> *v10;
  std::basic_regex<char> *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == a2)
    goto LABEL_12;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, v7, a3);
  }
  while (v8 != v7);
  if (v8 == a2)
LABEL_12:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == a3)
    return a3;
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    v9 = *(_QWORD *)(a1 + 56);
    v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1), a3);
    if ((std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1) == v11)
      goto LABEL_12;
    do
    {
      v8 = v11;
      v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, v11, a3);
    }
    while (v8 != v11);
    if (v8 == v10)
      goto LABEL_12;
    v12 = operator new(0x18uLL);
    v13 = *(_QWORD *)(v9 + 8);
    v12[1] = *(_QWORD *)(v6 + 8);
    v12[2] = v13;
    *v12 = &unk_251CB48B0;
    *(_QWORD *)(v6 + 8) = v12;
    *(_QWORD *)(v9 + 8) = 0;
    v14 = operator new(0x10uLL);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14[1] = v15;
    *(_QWORD *)(v9 + 8) = v14;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
    v16 = operator new(0x10uLL);
    v17 = *(_QWORD *)(v9 + 8);
    *v16 = &unk_251CB48F8;
    v16[1] = v17;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v16;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(v9 + 8);
    if (v8 == a3)
      return a3;
  }
  return v8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<std::__wrap_iter<char const*>>(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = operator new(0x10uLL);
    v10 = *(_QWORD *)(v6 + 8);
    v9[1] = v10;
    *(_QWORD *)(v6 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8 == a3)
      v11 = v8;
    else
      v11 = v8 + 1;
    if (v11 == a3)
      return a3;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, __s, v8);
    if (v8 == a3)
      v11 = v8;
    else
      v11 = v8 + 1;
    if (v11 == a3)
      return a3;
  }
  v12 = *(_QWORD *)(a1 + 56);
  do
  {
    v21 = (char *)memchr(v11, 10, a3 - v11);
    if (v21)
      v22 = v21;
    else
      v22 = a3;
    if (v22 == v11)
    {
      v13 = operator new(0x10uLL);
      v14 = *(_QWORD *)(v12 + 8);
      v13[1] = v14;
      *(_QWORD *)(v12 + 8) = v13;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, v11, v22);
    }
    v15 = operator new(0x18uLL);
    v16 = *(_QWORD *)(v12 + 8);
    v15[1] = *(_QWORD *)(v6 + 8);
    v15[2] = v16;
    *v15 = &unk_251CB48B0;
    *(_QWORD *)(v6 + 8) = v15;
    *(_QWORD *)(v12 + 8) = 0;
    v17 = operator new(0x10uLL);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17[1] = v18;
    *(_QWORD *)(v12 + 8) = v17;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
    v19 = operator new(0x10uLL);
    v20 = *(_QWORD *)(v12 + 8);
    *v19 = &unk_251CB48F8;
    v19[1] = v20;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v19;
    v12 = *(_QWORD *)(v12 + 8);
    *(_QWORD *)(a1 + 56) = v12;
    if (v22 == a3)
      v11 = v22;
    else
      v11 = v22 + 1;
  }
  while (v11 != a3);
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  uint64_t v6;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  _QWORD *v9;
  uint64_t v10;
  std::basic_regex<char> *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  std::basic_regex<char> *v21;
  std::basic_regex<char> *v22;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = operator new(0x10uLL);
    v10 = *(_QWORD *)(v6 + 8);
    v9[1] = v10;
    *(_QWORD *)(v6 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8 == a3)
      v11 = v8;
    else
      v11 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    if (v11 == a3)
      return a3;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, __s, v8);
    if (v8 == a3)
      v11 = v8;
    else
      v11 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    if (v11 == a3)
      return a3;
  }
  v12 = *(_QWORD *)(a1 + 56);
  do
  {
    v21 = (std::basic_regex<char> *)memchr(v11, 10, (char *)a3 - (char *)v11);
    if (v21)
      v22 = v21;
    else
      v22 = a3;
    if (v22 == v11)
    {
      v13 = operator new(0x10uLL);
      v14 = *(_QWORD *)(v12 + 8);
      v13[1] = v14;
      *(_QWORD *)(v12 + 8) = v13;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, v11, v22);
    }
    v15 = operator new(0x18uLL);
    v16 = *(_QWORD *)(v12 + 8);
    v15[1] = *(_QWORD *)(v6 + 8);
    v15[2] = v16;
    *v15 = &unk_251CB48B0;
    *(_QWORD *)(v6 + 8) = v15;
    *(_QWORD *)(v12 + 8) = 0;
    v17 = operator new(0x10uLL);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17[1] = v18;
    *(_QWORD *)(v12 + 8) = v17;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
    v19 = operator new(0x10uLL);
    v20 = *(_QWORD *)(v12 + 8);
    *v19 = &unk_251CB48F8;
    v19[1] = v20;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v19;
    v12 = *(_QWORD *)(v12 + 8);
    *(_QWORD *)(a1 + 56) = v12;
    if (v22 == a3)
      v11 = v22;
    else
      v11 = (std::basic_regex<char> *)((char *)&v22->__traits_.__loc_.__locale_ + 1);
  }
  while (v11 != a3);
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  int v6;
  int v7;
  __int128 v8;
  char *v9;
  unsigned int v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  unsigned int marked_count;
  std::basic_regex<char> v23;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        v17 = a2[1];
        if (v17 == 66)
        {
          v18 = (char *)operator new(0x30uLL);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v18 = &unk_251CB4478;
          *((_QWORD *)v18 + 1) = v20;
          std::locale::locale((std::locale *)v18 + 2, (const std::locale *)a1);
          *(_OWORD *)(v18 + 24) = *(_OWORD *)(a1 + 8);
          v18[40] = 1;
        }
        else
        {
          if (v17 != 98)
            return v3;
          v18 = (char *)operator new(0x30uLL);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v18 = &unk_251CB4478;
          *((_QWORD *)v18 + 1) = v19;
          std::locale::locale((std::locale *)v18 + 2, (const std::locale *)a1);
          *(_OWORD *)(v18 + 24) = *(_OWORD *)(a1 + 8);
          v18[40] = 0;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v18;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return v3 + 2;
      }
      return v3;
    }
    if (v6 != 94)
      return v3;
    v11 = operator new(0x18uLL);
    v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(v13 + 8);
LABEL_17:
    *v11 = v15 + 16;
    v11[1] = v14;
    *((_BYTE *)v11 + 16) = v12;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 == 36)
  {
    v11 = operator new(0x18uLL);
    v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(v13 + 8);
    goto LABEL_17;
  }
  if (v6 != 40 || a2 + 1 == a3 || a2[1] != 63 || a2 + 2 == a3)
    return v3;
  v7 = a2[2];
  if (v7 == 33)
  {
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v23.__loop_count_ = v21;
    *(_OWORD *)&v23.__start_.__cntrl_ = v21;
    *(_OWORD *)&v23.__traits_.__loc_.__locale_ = v21;
    *(_OWORD *)&v23.__traits_.__col_ = v21;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v23);
    v23.__flags_ = *(_DWORD *)(a1 + 24);
    v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v23, v3 + 3, a3);
    marked_count = v23.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v23, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v9 == a3 || *v9 != 41)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    goto LABEL_27;
  }
  if (v7 != 61)
    return v3;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v23.__loop_count_ = v8;
  *(_OWORD *)&v23.__start_.__cntrl_ = v8;
  *(_OWORD *)&v23.__traits_.__loc_.__locale_ = v8;
  *(_OWORD *)&v23.__traits_.__col_ = v8;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v23);
  v23.__flags_ = *(_DWORD *)(a1 + 24);
  v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v23, v3 + 3, a3);
  v10 = v23.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v23, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v10;
  if (v9 == a3 || *v9 != 41)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_27:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v23.__traits_.__loc_);
  return v9 + 1;
}

void sub_24B833FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_24B833FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_24B833FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_24B83400C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  std::basic_regex<char> *v6;
  std::basic_regex<char> *result;
  std::__node<char> *v8;
  std::__owns_one_state<char> *v9;
  std::__node<char> *v10;
  std::__node<char> *v11;
  unsigned int marked_count;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  std::basic_regex<char> *v15;
  std::basic_regex<char> *v16;
  std::__node<char> *v17;
  std::__owns_one_state<char> *v18;
  std::__node<char> *v19;

  v3 = a2;
  if (a2 == a3)
    return v3;
  switch(LOBYTE(a2->__traits_.__loc_.__locale_))
  {
    case '(':
      if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1) == a3)
        goto LABEL_26;
      if ((std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 2) != a3
        && BYTE1(a2->__traits_.__loc_.__locale_) == 63
        && BYTE2(a2->__traits_.__loc_.__locale_) == 58)
      {
        ++this->__open_count_;
        v6 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, (char *)&a2->__traits_.__loc_.__locale_ + 3, a3);
        if (v6 != a3 && LOBYTE(v6->__traits_.__loc_.__locale_) == 41)
        {
          --this->__open_count_;
          return (std::basic_regex<char> *)((char *)&v6->__traits_.__loc_.__locale_ + 1);
        }
LABEL_26:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if ((this->__flags_ & 2) != 0)
      {
        marked_count = this->__marked_count_;
      }
      else
      {
        v11 = (std::__node<char> *)operator new(0x18uLL);
        marked_count = this->__marked_count_ + 1;
        this->__marked_count_ = marked_count;
        end = this->__end_;
        first = end->__first_;
        v11->__vftable = (std::__node<char>_vtbl *)&unk_251CB4748;
        v11[1].__vftable = (std::__node<char>_vtbl *)first;
        LODWORD(v11[2].__vftable) = marked_count;
        end->__first_ = v11;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      v15 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, (char *)&v3->__traits_.__loc_.__locale_ + 1, a3);
      if (v15 == a3)
        goto LABEL_26;
      v16 = v15;
      if (LOBYTE(v15->__traits_.__loc_.__locale_) != 41)
        goto LABEL_26;
      if ((this->__flags_ & 2) == 0)
      {
        v17 = (std::__node<char> *)operator new(0x18uLL);
        v18 = this->__end_;
        v19 = v18->__first_;
        v17->__vftable = (std::__node<char>_vtbl *)&unk_251CB4790;
        v17[1].__vftable = (std::__node<char>_vtbl *)v19;
        LODWORD(v17[2].__vftable) = marked_count;
        v18->__first_ = v17;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      result = (std::basic_regex<char> *)((char *)&v16->__traits_.__loc_.__locale_ + 1);
      break;
    case ')':
    case ',':
    case '-':
    case '/':
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case ':':
    case ';':
    case '<':
    case '=':
    case '>':
    case '@':
    case 'A':
    case 'B':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
    case '*':
    case '+':
    case '?':
      goto LABEL_25;
    case '.':
      v8 = (std::__node<char> *)operator new(0x10uLL);
      v9 = this->__end_;
      v10 = v9->__first_;
      v8->__vftable = (std::__node<char>_vtbl *)&unk_251CB4508;
      v8[1].__vftable = (std::__node<char>_vtbl *)v10;
      v9->__first_ = v8;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return (std::basic_regex<char> *)((char *)v3 + 1);
    case '[':
      return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, (char *)a2, (char *)a3);
    case '\\':
      return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(this, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    default:
      if (LOBYTE(a2->__traits_.__loc_.__locale_) == 123)
LABEL_25:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
      return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(this, a2, a3);
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int v6;
  int locale_low;
  std::basic_regex<char> *v8;
  std::basic_regex<char> *v9;
  char *v10;
  size_t v11;
  char *v13;
  int v14;
  int v15;
  char *v16;
  int v17;
  int v18;
  std::basic_regex<char> *v19;
  unsigned __int8 *v20;
  BOOL v21;
  std::basic_regex<char> *v22;
  BOOL v23;
  char *v24;
  size_t v25;
  std::basic_regex<char> *v26;
  int v27;
  int v28;
  std::basic_regex<char> *v29;
  int v30;
  std::basic_regex<char> *v31;
  _BYTE *v32;

  if (this == a3)
    return this;
  v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6)
        v21 = 1;
      else
        v21 = v9 == a3;
      if (!v21 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v11 = 0;
        goto LABEL_36;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v25 = 0;
      goto LABEL_45;
    }
    v8 = this;
    if (locale_low == 43)
    {
      v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v11 = 1;
LABEL_36:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v10;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v25 = 1;
      goto LABEL_45;
    }
    return v8;
  }
  if (locale_low == 63)
  {
    v22 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6)
      v23 = 1;
    else
      v23 = v22 == a3;
    if (v23 || LOBYTE(v22->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v22;
    }
    else
    {
      v24 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v24;
    }
  }
  else
  {
    v8 = this;
    if (locale_low != 123)
      return v8;
    v13 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_72;
    v14 = *v13;
    if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      goto LABEL_72;
    v15 = v14 - 48;
    v16 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_21:
      v16 = (char *)a3;
    }
    else
    {
      while (1)
      {
        v17 = *v16;
        if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38)
          break;
        if (v15 >= 214748364)
          goto LABEL_72;
        v15 = v17 + 10 * v15 - 48;
        if (++v16 == (char *)a3)
          goto LABEL_21;
      }
    }
    if (v16 == v13)
      goto LABEL_72;
    if (v16 == (char *)a3)
      goto LABEL_73;
    v18 = *v16;
    if (v18 != 44)
    {
      if (v18 == 125)
      {
        v19 = (std::basic_regex<char> *)(v16 + 1);
        if (v6 || v19 == a3 || LOBYTE(v19->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 1);
          return v19;
        }
        else
        {
          v20 = (unsigned __int8 *)(v16 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v20;
        }
      }
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    v26 = (std::basic_regex<char> *)(v16 + 1);
    if (v16 + 1 == (char *)a3)
      goto LABEL_72;
    v27 = LOBYTE(v26->__traits_.__loc_.__locale_);
    if (v27 == 125)
    {
      v9 = (std::basic_regex<char> *)(v16 + 2);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v11 = v15;
        v10 = v16 + 3;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        goto LABEL_36;
      }
      v25 = v15;
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
LABEL_45:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v25, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v9;
    }
    if ((v27 & 0xF8) != 0x30 && (v27 & 0xFE) != 0x38)
      goto LABEL_73;
    v28 = v27 - 48;
    v29 = (std::basic_regex<char> *)(v16 + 2);
    if (v29 == a3)
    {
LABEL_61:
      v29 = a3;
    }
    else
    {
      while (1)
      {
        v30 = LOBYTE(v29->__traits_.__loc_.__locale_);
        if ((v30 & 0xF8) != 0x30 && (v30 & 0xFE) != 0x38)
          break;
        if (v28 >= 214748364)
          goto LABEL_72;
        v28 = v30 + 10 * v28 - 48;
        v29 = (std::basic_regex<char> *)((char *)v29 + 1);
        if (v29 == a3)
          goto LABEL_61;
      }
    }
    if (v29 == v26 || v29 == a3 || LOBYTE(v29->__traits_.__loc_.__locale_) != 125)
LABEL_73:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v28 < v15)
      goto LABEL_72;
    v31 = (std::basic_regex<char> *)((char *)&v29->__traits_.__loc_.__locale_ + 1);
    if (v6 || v31 == a3 || LOBYTE(v31->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 1);
      return v31;
    }
    else
    {
      v32 = (char *)&v29->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v32;
    }
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v4;
  unsigned __int8 *v6;
  int v8;
  unsigned int v9;
  int v11;
  unsigned __int8 *v12;

  if (a2 == a3)
    return a2;
  v4 = a2;
  if (*a2 == 92)
  {
    v6 = a2 + 1;
    if (a2 + 1 == a3)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    v8 = *v6;
    v9 = v8 - 48;
    if (v8 == 48)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v9);
      return a2 + 2;
    }
    if ((v8 - 49) <= 8)
    {
      v4 = a2 + 2;
      if (a2 + 2 == a3)
      {
        v4 = a3;
      }
      else
      {
        while (1)
        {
          v11 = *v4;
          if ((v11 - 48) > 9)
            break;
          if (v9 >= 0x19999999)
            goto LABEL_24;
          ++v4;
          v9 = v11 + 10 * v9 - 48;
          if (v4 == a3)
          {
            v4 = a3;
            break;
          }
        }
        if (!v9)
LABEL_24:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
      }
      if (v9 > this->__marked_count_)
        goto LABEL_24;
      std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v9);
      if (v4 != v6)
        return v4;
    }
    v4 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>((uint64_t)this, a2 + 1, a3);
    if (v6 == v4)
    {
      v12 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(this, a2 + 1, a3, 0);
      if (v6 == v12)
        return a2;
      else
        return v12;
    }
  }
  return v4;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  int v5;
  char v6;
  char *v7;
  void *v8;
  char *v9;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_20;
    v5 = a2[1];
    v6 = v5 == 94;
    v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
    *(_QWORD *)(a1 + 56) = v8;
    if (v7 == a3)
      goto LABEL_20;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3)
      goto LABEL_20;
    do
    {
      v9 = v7;
      v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(a1, v7, a3, (uint64_t)v8);
    }
    while (v9 != v7);
    if (v9 == a3)
      goto LABEL_20;
    if (*v9 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
      ++v9;
    }
    if (v9 == a3 || *v9 != 93)
LABEL_20:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v9 + 1;
  }
  return a2;
}

void sub_24B834924(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *result;

  if (this == a3)
    return this;
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '{':
    case '|':
    case '}':
      return this;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
      result = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      break;
  }
  return result;
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<std::__wrap_iter<char const*>>(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  _DWORD *v5;
  _DWORD *v6;
  int v7;

  v3 = a2;
  if (a2 != a3)
  {
    switch(*a2)
    {
      case 'D':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_7;
      case 'S':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_11;
      case 'W':
        v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_9;
      case 'd':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_7:
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v5;
        *(_QWORD *)(a1 + 56) = v5;
        v7 = v5[40] | 0x400;
        goto LABEL_12;
      case 's':
        v5 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v5, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_11:
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v5;
        *(_QWORD *)(a1 + 56) = v5;
        v7 = v5[40] | 0x4000;
LABEL_12:
        v5[40] = v7;
        goto LABEL_13;
      case 'w':
        v6 = operator new(0xB0uLL);
        std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v6, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_9:
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v6;
        *(_QWORD *)(a1 + 56) = v6;
        v6[40] |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v6, 95);
LABEL_13:
        ++v3;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_24B834B78(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B834B8C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B834BA0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B834BB4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B834BC8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24B834BDC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  std::basic_regex<char>::value_type v6;
  unsigned __int8 *result;
  unsigned int v8;
  std::basic_regex<char>::value_type v10;
  int v11;
  int v12;
  unsigned __int8 v13;
  char v14;
  unsigned __int8 v15;
  char v16;
  std::basic_regex<char>::value_type v17;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || (char)v4[1] < 65)
        goto LABEL_85;
      v8 = v4[1];
      if (v8 >= 0x5B && (v8 - 97) > 0x19u)
        goto LABEL_85;
      v10 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v10;
        *((_BYTE *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v10);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        v11 = v4[1];
        if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            v12 = *v4;
            if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38 || (v12 | 0x20u) - 97 < 6)
              goto LABEL_42;
          }
        }
      }
      goto LABEL_85;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        v6 = 11;
LABEL_68:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_42:
      if (v4 + 1 == a3)
        goto LABEL_85;
      v13 = v4[1];
      v14 = -48;
      if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38)
        goto LABEL_47;
      v13 |= 0x20u;
      if ((v13 - 97) >= 6u)
        goto LABEL_85;
      v14 = -87;
LABEL_47:
      if (v4 + 2 == a3)
        goto LABEL_85;
      v15 = v4[2];
      v16 = -48;
      if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
      {
        v15 |= 0x20u;
        if ((v15 - 97) >= 6u)
LABEL_85:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        v16 = -87;
      }
      v17 = v15 + 16 * (v13 + v14) + v16;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v17;
      *((_BYTE *)a4 + 1) = 0;
      result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0)
        goto LABEL_85;
      if (!a4)
        goto LABEL_68;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v4;
  int64_t v5;
  int v6;
  char *v7;
  char *v8;
  int v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  char *v19;
  int v20;
  _BYTE *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  char *v25;
  uint64_t v26;
  int v27;
  int v28;
  std::basic_regex<char>::value_type *v29;
  char *v30;
  _BYTE *v31;
  int v32;
  void **v33;
  _BYTE *v34;
  char *v35;
  void *v37[2];
  uint64_t v38;
  void *v39[2];
  uint64_t v40;
  void *__p[2];
  uint64_t v42;
  __int128 v43;
  int64_t v44;

  v4 = a2;
  v5 = a2 - a3;
  if (a2 == a3)
    return a2;
  v6 = *a2;
  v7 = a2;
  if (v6 == 93)
    return v7;
  v8 = (char *)a4;
  v11 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v42 = 0;
  if (a2 + 1 == a3 || v6 != 91)
  {
LABEL_36:
    v27 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_39;
  }
  v12 = a2[1];
  if (v12 != 46)
  {
    if (v12 == 58)
    {
      v14 = (uint64_t)(a2 + 2);
      if (a3 - (v4 + 2) < 2)
        goto LABEL_91;
      v15 = 0;
      v16 = v5 + 4;
      v17 = (unsigned __int8 *)v4;
      v18 = v16;
      if (v4[2] == 58)
        goto LABEL_15;
      do
      {
        do
        {
          if (!v18)
            goto LABEL_91;
          v17 = (unsigned __int8 *)&v4[++v15];
          v18 = v16 + v15;
        }
        while (v4[v15 + 2] != 58);
LABEL_15:
        ;
      }
      while (v17[3] != 93);
      v19 = &v4[v15 + 2];
      if (v19 == a3)
LABEL_91:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      v20 = std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(a1, v14, v19, *(_DWORD *)(a1 + 24) & 1);
      if (!v20)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
      v13 = 0;
      *((_DWORD *)v8 + 40) |= v20;
      v8 = &v4[v15 + 4];
      v7 = v4;
      if (SHIBYTE(v42) < 0)
        goto LABEL_70;
      goto LABEL_71;
    }
    if (v12 == 61)
    {
      v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(a1, a2 + 2, a3, a4);
      v13 = 0;
      v7 = v4;
      if ((SHIBYTE(v42) & 0x80000000) == 0)
        goto LABEL_71;
      goto LABEL_70;
    }
    v11 = 0;
    goto LABEL_36;
  }
  v21 = a2 + 2;
  if (a3 - (v4 + 2) < 2)
    goto LABEL_92;
  v22 = (unsigned __int8 *)(v4 + 2);
  v23 = (unsigned __int8 *)(v4 + 3);
  if (*v21 == 46)
    goto LABEL_24;
  do
  {
    do
    {
      if (a3 - 4 == v4)
        goto LABEL_92;
      ++v4;
      v22 = v23;
      v24 = *v23++;
    }
    while (v24 != 46);
LABEL_24:
    ;
  }
  while (*v23 != 93);
  if (v22 == (unsigned __int8 *)a3)
LABEL_92:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, (uint64_t)v21, v4 + 2, (uint64_t)&v43);
  if (SHIBYTE(v42) < 0)
    operator delete(__p[0]);
  v42 = v44;
  *(_OWORD *)__p = v43;
  v25 = (char *)HIBYTE(v44);
  v11 = SHIBYTE(v44);
  v26 = *((_QWORD *)&v43 + 1);
  if (v44 < 0)
    v25 = (char *)__p[1];
  if ((unint64_t)(v25 - 1) >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  v4 = (char *)(v22 + 2);
  v27 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v44 >= 0)
    v26 = HIBYTE(v44);
  if (v26)
  {
    if (v4 == a3)
      goto LABEL_52;
    goto LABEL_51;
  }
LABEL_39:
  if ((v27 | 0x40) != 0x40)
  {
    LOBYTE(v28) = *v4;
LABEL_44:
    if (v11 < 0)
    {
      v31 = __p[0];
      __p[1] = (void *)1;
      *(_BYTE *)__p[0] = v28;
      v31[1] = 0;
      if (++v4 == a3)
        goto LABEL_52;
    }
    else
    {
      HIBYTE(v42) = 1;
      LOWORD(__p[0]) = v28;
      if (++v4 == a3)
        goto LABEL_52;
    }
    goto LABEL_51;
  }
  v28 = *v4;
  if (v28 != 92)
    goto LABEL_44;
  v29 = v4 + 1;
  if (v27)
    v30 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v29, a3, (uint64_t *)__p);
  else
    v30 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v29, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
  v4 = v30;
  if (v30 == a3)
  {
LABEL_52:
    if (SHIBYTE(v42) < 0)
    {
      if (!__p[1])
        goto LABEL_69;
      if (__p[1] != (void *)1)
      {
        v33 = (void **)__p[0];
LABEL_68:
        std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v33, *((char *)v33 + 1));
LABEL_69:
        v13 = 1;
        v7 = v4;
        if ((SHIBYTE(v42) & 0x80000000) == 0)
          goto LABEL_71;
        goto LABEL_70;
      }
      v33 = (void **)__p[0];
    }
    else
    {
      if (!HIBYTE(v42))
        goto LABEL_69;
      v33 = __p;
      if (HIBYTE(v42) != 1)
        goto LABEL_68;
    }
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v33);
    goto LABEL_69;
  }
LABEL_51:
  v32 = *v4;
  if (v32 == 93)
    goto LABEL_52;
  v34 = v4 + 1;
  if (v4 + 1 == a3 || v32 != 45 || *v34 == 93)
    goto LABEL_52;
  v43 = 0uLL;
  v44 = 0;
  v7 = v4 + 2;
  if (v4 + 2 == a3 || *v34 != 91 || *v7 != 46)
  {
    if ((v27 | 0x40) == 0x40)
    {
      LODWORD(v34) = *v34;
      if ((_DWORD)v34 == 92)
      {
        if (v27)
          v35 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v4 + 2, a3, (uint64_t *)&v43);
        else
          v35 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v4 + 2, (unsigned __int8 *)a3, (uint64_t)&v43, (uint64_t)v8);
        goto LABEL_81;
      }
    }
    else
    {
      LOBYTE(v34) = *v34;
    }
    HIBYTE(v44) = 1;
    LOWORD(v43) = v34;
    goto LABEL_82;
  }
  v35 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, v4 + 3, a3, (uint64_t)&v43);
LABEL_81:
  v7 = v35;
LABEL_82:
  *(_OWORD *)v39 = *(_OWORD *)__p;
  v40 = v42;
  __p[1] = 0;
  v42 = 0;
  __p[0] = 0;
  *(_OWORD *)v37 = v43;
  v38 = v44;
  v43 = 0uLL;
  v44 = 0;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v8, (char *)v39, (uint64_t)v37);
  if (SHIBYTE(v38) < 0)
  {
    operator delete(v37[0]);
    if ((SHIBYTE(v40) & 0x80000000) == 0)
    {
LABEL_84:
      if ((SHIBYTE(v44) & 0x80000000) == 0)
        goto LABEL_85;
LABEL_89:
      operator delete((void *)v43);
      v13 = 1;
      if (SHIBYTE(v42) < 0)
        goto LABEL_70;
      goto LABEL_71;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_84;
  }
  operator delete(v39[0]);
  if (SHIBYTE(v44) < 0)
    goto LABEL_89;
LABEL_85:
  v13 = 1;
  if (SHIBYTE(v42) < 0)
LABEL_70:
    operator delete(__p[0]);
LABEL_71:
  if ((v13 & 1) != 0)
    return v7;
  return v8;
}

void sub_24B8355E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (*(char *)(v28 - 49) < 0)
  {
    operator delete(*(void **)(v28 - 72));
    if (a28 < 0)
    {
LABEL_5:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  int v10;
  char *v11;
  void **v12;
  unint64_t v13;
  __int128 v14;
  void *v15;
  void **v16;
  void **v17;
  void *__p[3];
  void *v20[3];

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_39;
  v6 = a3 - 2;
  v7 = a2;
  v8 = a2;
  v9 = a2 + 1;
  if (*a2 != 61)
    goto LABEL_5;
LABEL_4:
  if (*v9 != 93)
  {
LABEL_5:
    while (a2 != v6)
    {
      ++v7;
      --v6;
      v8 = v9;
      v10 = *v9++;
      if (v10 == 61)
        goto LABEL_4;
    }
LABEL_39:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (v8 == a3)
    goto LABEL_39;
  memset(v20, 170, sizeof(v20));
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, (uint64_t)a2, v7, (uint64_t)v20);
  if ((SHIBYTE(v20[2]) & 0x80000000) == 0)
  {
    v11 = (char *)HIBYTE(v20[2]);
    if (HIBYTE(v20[2]))
    {
      memset(__p, 170, sizeof(__p));
      v12 = v20;
      goto LABEL_14;
    }
LABEL_40:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  v11 = (char *)v20[1];
  if (!v20[1])
    goto LABEL_40;
  memset(__p, 170, sizeof(__p));
  v12 = (void **)v20[0];
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, (uint64_t)v12, &v11[(_QWORD)v12], (_BYTE **)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    if (__p[1])
    {
LABEL_16:
      v13 = *(_QWORD *)(a4 + 144);
      if (v13 >= *(_QWORD *)(a4 + 152))
      {
        *(_QWORD *)(a4 + 144) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)(a4 + 136), (uint64_t)__p);
        if (SHIBYTE(__p[2]) < 0)
          goto LABEL_37;
      }
      else
      {
        if ((HIBYTE(__p[2]) & 0x80) != 0)
        {
          std::string::__init_copy_ctor_external(*(std::string **)(a4 + 144), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          v14 = *(_OWORD *)__p;
          *(void **)(v13 + 16) = __p[2];
          *(_OWORD *)v13 = v14;
        }
        *(_QWORD *)(a4 + 144) = v13 + 24;
        *(_QWORD *)(a4 + 144) = v13 + 24;
        if (SHIBYTE(__p[2]) < 0)
          goto LABEL_37;
      }
      goto LABEL_33;
    }
  }
  else if (HIBYTE(__p[2]))
  {
    goto LABEL_16;
  }
  v15 = (void *)HIBYTE(v20[2]);
  if (SHIBYTE(v20[2]) < 0)
    v15 = v20[1];
  if (v15 == (void *)2)
  {
    v17 = v20;
    if (SHIBYTE(v20[2]) < 0)
      v17 = (void **)v20[0];
    std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](a4, *(char *)v17, *((char *)v17 + 1));
  }
  else
  {
    if (v15 != (void *)1)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
    v16 = v20;
    if (SHIBYTE(v20[2]) < 0)
      v16 = (void **)v20[0];
    std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a4, *(char *)v16);
  }
  if (SHIBYTE(__p[2]) < 0)
  {
LABEL_37:
    operator delete(__p[0]);
    if (SHIBYTE(v20[2]) < 0)
      goto LABEL_38;
    return v7 + 2;
  }
LABEL_33:
  if ((SHIBYTE(v20[2]) & 0x80000000) == 0)
    return v7 + 2;
LABEL_38:
  operator delete(v20[0]);
  return v7 + 2;
}

void sub_24B8358E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;
  uint64_t v21;

  *(_QWORD *)(v20 + 144) = v21;
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v13;
  unint64_t v14;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  v5 = a3 - 2;
  v6 = a2;
  v7 = a2;
  v8 = a2 + 1;
  if (*a2 != 46)
    goto LABEL_5;
LABEL_4:
  if (*v8 != 93)
  {
LABEL_5:
    while (a2 != v5)
    {
      ++v6;
      --v5;
      v7 = v8;
      v9 = *v8++;
      if (v9 == 46)
        goto LABEL_4;
    }
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  }
  if (v7 == a3)
    goto LABEL_15;
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(a1, (uint64_t)a2, v6, (uint64_t)&v13);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v13;
  v10 = v14;
  *(_QWORD *)(a4 + 16) = v14;
  v11 = HIBYTE(v10);
  if ((v11 & 0x80u) != 0)
    v11 = *(_QWORD *)(a4 + 8);
  if (v11 - 1 >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  return v6 + 2;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 *result;

  if (a2 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
      result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 1) = 0;
        result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  std::basic_regex<char>::value_type v5;
  std::basic_regex<char>::value_type v7;
  std::basic_regex<char>::value_type *v8;
  std::basic_regex<char>::value_type v9;
  int v10;
  std::basic_regex<char>::value_type v11;

  if (a2 == a3)
LABEL_70:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  switch(*a2)
  {
    case '"':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v5;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30)
        goto LABEL_70;
      v7 = *a2 - 48;
      v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        v8 = a3;
LABEL_42:
        if (a4)
          goto LABEL_43;
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30)
        goto LABEL_42;
      v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        v8 = a3;
        if (a4)
          goto LABEL_43;
        goto LABEL_69;
      }
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      if (!a4)
        goto LABEL_69;
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v7;
      *((_BYTE *)a4 + 1) = 0;
      return v8;
  }
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5;
  char *v9;
  char *v10;
  char *v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  char *v25;
  size_t v26;
  std::string v27;
  char __s[24];

  v5 = (unint64_t)&a3[-a2];
  memset(__s, 170, sizeof(__s));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v5 <= 0x16)
  {
    __s[23] = (_BYTE)a3 - a2;
    v9 = __s;
    if ((char *)a2 != a3)
      goto LABEL_4;
LABEL_13:
    v10 = v9;
    goto LABEL_16;
  }
  v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17)
    v16 = v5 | 7;
  v17 = v16 + 1;
  v9 = (char *)operator new(v16 + 1);
  *(_QWORD *)&__s[8] = v5;
  *(_QWORD *)&__s[16] = v17 | 0x8000000000000000;
  *(_QWORD *)__s = v9;
  if ((char *)a2 == a3)
    goto LABEL_13;
LABEL_4:
  if (v5 < 0x20 || (unint64_t)&v9[-a2] < 0x20)
  {
    v10 = v9;
    v11 = (char *)a2;
    do
    {
LABEL_15:
      v18 = *v11++;
      *v10++ = v18;
    }
    while (v11 != a3);
    goto LABEL_16;
  }
  v10 = &v9[v5 & 0xFFFFFFFFFFFFFFE0];
  v11 = (char *)(a2 + (v5 & 0xFFFFFFFFFFFFFFE0));
  v12 = (__int128 *)(a2 + 16);
  v13 = v9 + 16;
  v14 = v5 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    v15 = *v12;
    *(v13 - 1) = *(v12 - 1);
    *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  if (v5 != (v5 & 0xFFFFFFFFFFFFFFE0))
    goto LABEL_15;
LABEL_16:
  *v10 = 0;
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (__s[23] < 0)
  {
    v19 = *(char **)__s;
    if (!*(_QWORD *)&__s[8])
      goto LABEL_29;
  }
  else
  {
    if (!__s[23])
      return;
    v19 = __s;
  }
  std::__get_collation_name(&v27, v19);
  *(_OWORD *)a4 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  v20 = v27.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0)
    v21 = *(_QWORD *)(a4 + 8);
  if (v21)
  {
LABEL_23:
    if ((__s[23] & 0x80000000) == 0)
      return;
    v19 = *(char **)__s;
LABEL_29:
    operator delete(v19);
    return;
  }
  if (__s[23] < 0)
  {
    v19 = *(char **)__s;
    v22 = *(_QWORD *)&__s[8];
    if (*(_QWORD *)&__s[8] >= 3uLL)
      goto LABEL_29;
    goto LABEL_31;
  }
  v22 = __s[23];
  if (__s[23] < 3u)
  {
    v19 = __s;
LABEL_31:
    (*(void (**)(std::string *__return_ptr, _QWORD, char *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v27, *(_QWORD *)(a1 + 16), v19, &v19[v22]);
    if (*(char *)(a4 + 23) < 0)
      operator delete(*(void **)a4);
    *(std::string *)a4 = v27;
    if (*(char *)(a4 + 23) < 0)
    {
      v24 = *(_QWORD *)(a4 + 8);
      if (v24 == 1 || v24 == 12)
      {
        if (__s != (char *)a4)
        {
          if (__s[23] >= 0)
            v25 = __s;
          else
            v25 = *(char **)__s;
          if (__s[23] >= 0)
            v26 = __s[23];
          else
            v26 = *(_QWORD *)&__s[8];
          std::string::__assign_no_alias<false>((void **)a4, v25, v26);
        }
      }
      else
      {
        **(_BYTE **)a4 = 0;
        *(_QWORD *)(a4 + 8) = 0;
      }
    }
    else
    {
      v23 = *(unsigned __int8 *)(a4 + 23);
      if (v23 == 1 || v23 == 12)
      {
        if (__s != (char *)a4)
        {
          if (__s[23] < 0)
          {
            std::string::__assign_no_alias<true>((_QWORD *)a4, *(void **)__s, *(size_t *)&__s[8]);
          }
          else
          {
            *(_OWORD *)a4 = *(_OWORD *)__s;
            *(_QWORD *)(a4 + 16) = *(_QWORD *)&__s[16];
          }
        }
      }
      else
      {
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 23) = 0;
      }
    }
    goto LABEL_23;
  }
}

void sub_24B8362BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::regex_traits<char>::__lookup_classname<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, char *a3, BOOL a4)
{
  unint64_t v4;
  _OWORD *v9;
  _BYTE *v10;
  char *v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  void **v20;
  void **v21;
  uint64_t classname;
  void *__p[3];

  v4 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 > 0x16)
  {
    v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v16 = v4 | 7;
    v17 = v16 + 1;
    v9 = operator new(v16 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a2 != a3)
      goto LABEL_4;
LABEL_13:
    v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  v9 = __p;
  if ((char *)a2 == a3)
    goto LABEL_13;
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v9 - a2 < 0x20)
  {
    v10 = v9;
    v11 = (char *)a2;
  }
  else
  {
    v10 = (char *)v9 + (v4 & 0xFFFFFFFFFFFFFFE0);
    v11 = (char *)(a2 + (v4 & 0xFFFFFFFFFFFFFFE0));
    v12 = (__int128 *)(a2 + 16);
    v13 = v9 + 1;
    v14 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_16;
  }
  do
  {
    v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a3);
LABEL_16:
  *v10 = 0;
  v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v20 = __p;
  else
    v20 = (void **)__p[0];
  if (SHIBYTE(__p[2]) < 0)
    v19 = (char *)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v20, &v19[(_QWORD)v20]);
  if (SHIBYTE(__p[2]) >= 0)
    v21 = __p;
  else
    v21 = (void **)__p[0];
  classname = std::__get_classname((const char *)v21, a4);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  return classname;
}

void sub_24B836484(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, char *a3)
{
  char *v6;
  int v8;
  std::basic_regex<char> *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  std::basic_regex<char> *v14;
  std::__owns_one_state<char> *v15;
  int v16;
  std::basic_regex<char> *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (char *)a2, a3);
  if ((char *)a2 != v6 || (char *)a2 == a3 || (char *)(a2 + 1) == a3 || *(_BYTE *)a2 != 92)
    return v6;
  v8 = *(unsigned __int8 *)(a2 + 1);
  if (v8 == 40)
  {
    v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(_BYTE *)(a1 + 24) & 2) != 0)
    {
      v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      v10 = operator new(0x18uLL);
      v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(v12 + 8);
      *v10 = &unk_251CB4748;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(_QWORD *)(v12 + 8) = v10;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3)
        goto LABEL_23;
      v14 = v9;
      v15 = *(std::__owns_one_state<char> **)(a1 + 56);
      v16 = *(_DWORD *)(a1 + 28);
      v17 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v14, a3);
      if (v14 == v17)
        break;
      v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v17, (std::basic_regex<char> *)a3, v15, (v16 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v14 != v9);
    if ((char *)&v14->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v14->__traits_.__loc_.__locale_) != 92
      || BYTE1(v14->__traits_.__loc_.__locale_) != 41)
    {
LABEL_23:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    v6 = (char *)v14 + 2 * (BYTE1(v14->__traits_.__loc_.__locale_) == 41);
    if ((*(_BYTE *)(a1 + 24) & 2) == 0)
    {
      v18 = operator new(0x18uLL);
      v19 = *(_QWORD *)(a1 + 56);
      v20 = *(_QWORD *)(v19 + 8);
      *v18 = &unk_251CB4790;
      v18[1] = v20;
      *((_DWORD *)v18 + 4) = v11;
      *(_QWORD *)(v19 + 8) = v18;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return v6;
    }
    return v6;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8)
    return v6;
  if ((v8 - 48) > *(_DWORD *)(a1 + 28))
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return (char *)(a2 + 2);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int locale_low;
  unsigned __int8 *v9;
  std::basic_regex<char> *v10;
  int v11;
  int v12;
  std::basic_regex<char> *v13;
  int v14;
  std::basic_regex<char> *v15;
  int v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;

  if (this == a3)
    return this;
  locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  v9 = (unsigned __int8 *)a3;
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return this;
  }
  v10 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v10 == a3)
    goto LABEL_45;
  v11 = LOBYTE(v10->__traits_.__loc_.__locale_);
  if ((v11 & 0xF8) != 0x30 && (v11 & 0xFE) != 0x38)
    goto LABEL_45;
  v12 = v11 - 48;
  v13 = (std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_15:
    v13 = a3;
  }
  else
  {
    while (1)
    {
      v14 = LOBYTE(v13->__traits_.__loc_.__locale_);
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
        break;
      if (v12 >= 214748364)
        goto LABEL_45;
      v12 = v14 + 10 * v12 - 48;
      v13 = (std::basic_regex<char> *)((char *)v13 + 1);
      if (v13 == a3)
        goto LABEL_15;
    }
  }
  if (v13 == v10)
    goto LABEL_45;
  if (v13 == a3)
LABEL_46:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 1);
  v16 = LOBYTE(v13->__traits_.__loc_.__locale_);
  if (v16 != 44)
  {
    if (v15 != a3 && v16 == 92 && LOBYTE(v15->__traits_.__loc_.__locale_) == 125)
    {
      v19 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v12, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_46;
  }
  if (v15 == a3)
    goto LABEL_46;
  v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
  if ((v17 & 0xF8) == 0x30 || (v17 & 0xFE) == 0x38)
  {
    v18 = v17 - 48;
    v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_37:
      v15 = a3;
      goto LABEL_40;
    }
    while (1)
    {
      v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
      if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38)
        break;
      if (v18 >= 214748364)
        goto LABEL_45;
      v18 = v17 + 10 * v18 - 48;
      v15 = (std::basic_regex<char> *)((char *)v15 + 1);
      if (v15 == a3)
        goto LABEL_37;
    }
  }
  else
  {
    v18 = -1;
  }
  if (v15 == a3)
  {
    v20 = (unsigned __int8 *)v15;
    v15 = a3;
    v9 = v20;
  }
  else if ((std::basic_regex<char> *)((char *)&v15->__traits_.__loc_.__locale_ + 1) == a3 || v17 != 92)
  {
    v9 = (unsigned __int8 *)v15;
  }
  else
  {
    v9 = (unsigned __int8 *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 125);
  }
LABEL_40:
  if (v15 == (std::basic_regex<char> *)v9)
    goto LABEL_46;
  if (v18 != -1)
  {
    if (v18 >= v12)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v18, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v9;
    }
LABEL_45:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v9;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, char *a2, char *a3)
{
  int v5;
  char *v6;
  int v9;
  std::__node<char> *v10;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if (a2 == a3)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
  v6 = a2 + 1;
  v5 = *a2;
  if (a2 + 1 == a3 && v5 == 36)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
  if ((v5 - 46) > 0x2E || ((1 << (v5 - 46)) & 0x600000000001) == 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
    return a2 + 1;
  }
  else if (v6 != a3
         && v5 == 92
         && (v9 = *v6, (v9 - 36) <= 0x3A)
         && ((1 << (v9 - 36)) & 0x580000000000441) != 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v9);
    return a2 + 2;
  }
  else
  {
    if (*a2 != 46)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
    v10 = (std::__node<char> *)operator new(0x10uLL);
    end = this->__end_;
    first = end->__first_;
    v10->__vftable = (std::__node<char>_vtbl *)&unk_251CB4940;
    v10[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v10;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return a2 + 1;
  }
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *v6;
  int v7;
  std::basic_regex<char> *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int locale_low;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  std::basic_regex<char> *v22;
  std::basic_regex<char> *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
  if (v8 == a2)
  {
    v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)a2, (std::basic_regex<char>::value_type *)a3);
    if (v8 == a2)
    {
      if (a2 == a3 || LOBYTE(a2->__traits_.__loc_.__locale_) != 46)
      {
        v8 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, (char *)a2, (char *)a3);
      }
      else
      {
        v9 = operator new(0x10uLL);
        v10 = *(_QWORD *)(a1 + 56);
        v11 = *(_QWORD *)(v10 + 8);
        *v9 = &unk_251CB4940;
        v9[1] = v11;
        *(_QWORD *)(v10 + 8) = v9;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v8 = (std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1);
      }
    }
  }
  if (v8 != a2 || v8 == a3)
  {
LABEL_23:
    if (v8 != a2)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v8, a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
    return a2;
  }
  locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  switch(locale_low)
  {
    case '$':
      v13 = operator new(0x18uLL);
      v14 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v15 = *(_QWORD *)(a1 + 56);
      goto LABEL_14;
    case '(':
      if ((*(_BYTE *)(a1 + 24) & 2) != 0)
      {
        v19 = *(_DWORD *)(a1 + 28);
      }
      else
      {
        v18 = operator new(0x18uLL);
        v19 = *(_DWORD *)(a1 + 28) + 1;
        *(_DWORD *)(a1 + 28) = v19;
        v20 = *(_QWORD *)(a1 + 56);
        v21 = *(_QWORD *)(v20 + 8);
        *v18 = &unk_251CB4748;
        v18[1] = v21;
        *((_DWORD *)v18 + 4) = v19;
        *(_QWORD *)(v20 + 8) = v18;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      ++*(_DWORD *)(a1 + 36);
      v22 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
      if (v22 == a3 || (v23 = v22, LOBYTE(v22->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      if ((*(_BYTE *)(a1 + 24) & 2) == 0)
      {
        v24 = operator new(0x18uLL);
        v25 = *(_QWORD *)(a1 + 56);
        v26 = *(_QWORD *)(v25 + 8);
        *v24 = &unk_251CB4790;
        v24[1] = v26;
        *((_DWORD *)v24 + 4) = v19;
        *(_QWORD *)(v25 + 8) = v24;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      --*(_DWORD *)(a1 + 36);
      v8 = (std::basic_regex<char> *)((char *)&v23->__traits_.__loc_.__locale_ + 1);
      goto LABEL_23;
    case '^':
      v13 = operator new(0x18uLL);
      v14 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v15 = *(_QWORD *)(a1 + 56);
LABEL_14:
      v17 = *(_QWORD *)(v15 + 8);
      *v13 = v16 + 16;
      v13[1] = v17;
      *((_BYTE *)v13 + 16) = v14;
      *(_QWORD *)(v15 + 8) = v13;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = (std::basic_regex<char> *)((char *)&a2->__traits_.__loc_.__locale_ + 1);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v8, a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
  }
  return a2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  if (this == a3)
    return this;
  switch(LOBYTE(this->__traits_.__loc_.__locale_))
  {
    case '$':
    case '(':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
      return this;
    case ')':
      if (a1->__open_count_)
        return this;
      break;
    default:
      break;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
  return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::basic_regex<char>::value_type *v3;
  std::basic_regex<char>::value_type *v4;
  std::basic_regex<char>::value_type v5;
  std::basic_regex<char>::value_type *result;
  _BOOL4 v7;
  uint64_t v8;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92)
    return v3;
  v5 = *v4;
  switch(*v4)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
    case '}':
      std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v5);
      v3 += 2;
      return v3;
    default:
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        result = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v4, a3, 0);
      }
      else
      {
        v7 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v5);
        v8 = 2;
        if (!v7)
          v8 = 0;
        result = &v3[v8];
      }
      break;
  }
  return result;
}

_QWORD *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  v11 = -86;
  MEMORY[0x24BD28154](&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_24B836F88(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x24B836F54);
  }
  __cxa_rethrow();
}

void sub_24B836FCC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

std::string *abm::trace::getBasebandTraceDirSuffix@<X0>(abm::trace *this@<X0>, std::string *a2@<X8>)
{
  int v2;
  std::string *result;
  char **v5;

  v2 = (int)this;
  memset(a2, 170, sizeof(std::string));
  *((_BYTE *)&a2->__r_.__value_.__s + 23) = 0;
  a2->__r_.__value_.__s.__data_[0] = 0;
  result = (std::string *)capabilities::radio::vendor(this);
  if (((_DWORD)result - 2) >= 2)
  {
    if ((_DWORD)result != 1)
      return result;
    if (v2)
    {
      *((_BYTE *)&a2->__r_.__value_.__s + 23) = 5;
      strcpy((char *)a2, "-qdss");
      return result;
    }
    v5 = abm::trace::kEURTraceSnapshotDirectorySuffix;
  }
  else
  {
    v5 = abm::trace::kICETraceSnapshotDirectorySuffix;
  }
  return std::string::__assign_external(a2, *v5);
}

void sub_24B837078(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

size_t std::string::basic_string[abi:ne180100]<0>(const char *a1)
{
  size_t result;
  size_t v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;

  result = strlen(a1);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v3 = result;
  if (result >= 0x17)
  {
    v5 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v5 = result | 7;
    v6 = v5 + 1;
    v4 = (__int128 *)operator new(v5 + 1);
    *((_QWORD *)&xmmword_2579B8198 + 1) = v3;
    unk_2579B81A8 = v6 | 0x8000000000000000;
    *(_QWORD *)&xmmword_2579B8198 = v4;
  }
  else
  {
    v4 = &xmmword_2579B8198;
    byte_2579B81AF = result;
    if (!result)
    {
      LOBYTE(xmmword_2579B8198) = 0;
      return result;
    }
  }
  result = (size_t)memmove(v4, a1, v3);
  *((_BYTE *)v4 + v3) = 0;
  return result;
}

void abm::trace::getCoreDumpDirSuffix(std::string *a1@<X8>)
{
  unsigned __int8 v3;
  capabilities::radio *v4;
  int v5;
  char **v6;

  v3 = atomic_load((unsigned __int8 *)&_MergedGlobals);
  if ((v3 & 1) == 0)
  {
    v4 = (capabilities::radio *)__cxa_guard_acquire(&_MergedGlobals);
    if ((_DWORD)v4)
    {
      v5 = capabilities::radio::maverick(v4);
      v6 = abm::trace::kEURCoreDumpSnapshotDirectorySuffix;
      if (!v5)
        v6 = abm::trace::kCoreDumpSnapshotDirectorySuffix;
      std::string::basic_string[abi:ne180100]<0>(*v6);
      __cxa_guard_release(&_MergedGlobals);
    }
  }
  if (byte_2579B81AF < 0)
  {
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)xmmword_2579B8198, *((std::string::size_type *)&xmmword_2579B8198 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_2579B8198;
    a1->__r_.__value_.__r.__words[2] = unk_2579B81A8;
  }
}

void sub_24B837200(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&_MergedGlobals);
  _Unwind_Resume(a1);
}

uint64_t abm::trace::isSupported(uint64_t a1)
{
  const char *v1;
  int v2;
  capabilities::radio *v3;
  const char *v4;
  capabilities::radio *v5;
  const char *v6;
  capabilities::radio *v7;
  capabilities::trace *v8;
  capabilities::trace *v9;

  v1 = (const char *)a1;
  v2 = *(char *)(a1 + 23);
  if (v2 < 0)
  {
    v3 = (capabilities::radio *)strcasecmp(*(const char **)a1, (const char *)abm::trace::kDIAG);
    if ((_DWORD)v3)
    {
LABEL_3:
      v4 = v1;
      if ((v2 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = (capabilities::radio *)strcasecmp((const char *)a1, (const char *)abm::trace::kDIAG);
    if ((_DWORD)v3)
      goto LABEL_3;
  }
  if ((capabilities::radio::maverick(v3) & 1) != 0)
    return 1;
  LOBYTE(v2) = v1[23];
  v4 = v1;
  if ((v2 & 0x80) == 0)
  {
LABEL_4:
    v5 = (capabilities::radio *)strcasecmp(v4, (const char *)abm::trace::kICETrace);
    if ((_DWORD)v5)
      goto LABEL_5;
LABEL_12:
    if ((capabilities::radio::ice(v5) & 1) != 0)
      return 1;
    LOBYTE(v2) = v1[23];
    if ((v2 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_11:
  v5 = (capabilities::radio *)strcasecmp(*(const char **)v1, (const char *)abm::trace::kICETrace);
  if (!(_DWORD)v5)
    goto LABEL_12;
LABEL_5:
  if ((v2 & 0x80) == 0)
  {
LABEL_6:
    v6 = v1;
    if (!strcasecmp(v1, (const char *)abm::trace::kBasebandTrace))
      return 1;
    goto LABEL_15;
  }
LABEL_14:
  v6 = *(const char **)v1;
  if (!strcasecmp(*(const char **)v1, (const char *)abm::trace::kBasebandTrace))
    return 1;
LABEL_15:
  v7 = (capabilities::radio *)strcasecmp(v6, (const char *)abm::trace::kEURCoreDump);
  if ((_DWORD)v7)
  {
    if ((v2 & 0x80) == 0)
      goto LABEL_17;
  }
  else
  {
    if ((capabilities::radio::maverick(v7) & 1) != 0)
      return 1;
    if ((v1[23] & 0x80) == 0)
    {
LABEL_17:
      if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump)
        || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs))
      {
        return 1;
      }
      v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kCompression);
      if (!(_DWORD)v8)
        return capabilities::trace::allowed(v8);
      v9 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kBasebandIPC);
      if ((_DWORD)v9)
      {
        v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kIPC);
        if (!(_DWORD)v8)
          return capabilities::trace::allowed(v8);
        v8 = (capabilities::trace *)strcasecmp(v1, "KernelPCI");
        if (!(_DWORD)v8)
          return capabilities::trace::allowed(v8);
        v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kTapToRadar);
        if (!(_DWORD)v8)
          return capabilities::trace::allowed(v8);
        goto LABEL_34;
      }
      return capabilities::trace::supportsBasebandIPCTrace(v9);
    }
  }
  v1 = *(const char **)v1;
  if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump) || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs))
    return 1;
  v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kCompression);
  if (!(_DWORD)v8)
    return capabilities::trace::allowed(v8);
  v9 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kBasebandIPC);
  if ((_DWORD)v9)
  {
    v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kIPC);
    if (!(_DWORD)v8)
      return capabilities::trace::allowed(v8);
    v8 = (capabilities::trace *)strcasecmp(v1, "KernelPCI");
    if (!(_DWORD)v8)
      return capabilities::trace::allowed(v8);
    v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kTapToRadar);
    if (!(_DWORD)v8)
      return capabilities::trace::allowed(v8);
LABEL_34:
    if (strcasecmp(v1, (const char *)abm::trace::kProfile))
    {
      v8 = (capabilities::trace *)strcasecmp(v1, (const char *)abm::trace::kTraceTailspin);
      if ((_DWORD)v8)
      {
        v8 = (capabilities::trace *)strcasecmp(v1, "Settings");
        if ((_DWORD)v8)
        {
          v8 = (capabilities::trace *)strcasecmp(v1, "LogFilter");
          if ((_DWORD)v8)
            return 0;
        }
      }
      return capabilities::trace::allowed(v8);
    }
    return 1;
  }
  return capabilities::trace::supportsBasebandIPCTrace(v9);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  std::string *v9;
  unint64_t v10;
  size_t v11;
  std::string::size_type v12;
  uint64_t v13;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22)
            operator delete(v9);
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        v12 = 2 * v8;
        if (__n > 2 * v8)
          v12 = __n;
        v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v13 = v12 | 7;
        if (v12 >= 0x17)
          v11 = v13 + 1;
        else
          v11 = 23;
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:ne180100]();
    }
    v6 = HIBYTE(v10);
    v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        v8 = 22;
        v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_23;
  *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((_BYTE *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

void abm::debug::registerLogServer(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN3abm5debugL14sLogServerInitERNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a1;
  if (abm::debug::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce != -1)
    dispatch_once(&abm::debug::sLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, block);
}

void ___ZN3abm5debugL14sLogServerInitERNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  xpc_object_t value;
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  capabilities::abs *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  capabilities::radio *v26;
  uint64_t v27;

  ctu::LogServer::getConfig(**(ctu::LogServer ***)(a1 + 32));
  value = xpc_dictionary_get_value((xpc_object_t)0xAAAAAAAAAAAAAAAALL, "kDomainLogLevels");
  v3 = value;
  v4 = MEMORY[0x24BDACFA0];
  if (value)
  {
    xpc_retain(value);
  }
  else
  {
    v3 = xpc_null_create();
    if (!v3)
    {
      v5 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x24BD284D8](v3) == v4)
  {
    xpc_retain(v3);
    v5 = v3;
  }
  else
  {
    v5 = xpc_null_create();
  }
LABEL_8:
  xpc_release(v3);
  if (MEMORY[0x24BD284D8](v5) == v4)
  {
    v7 = v5;
  }
  else
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    if (v6 || (v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD284D8](v6) == v4)
      {
        xpc_retain(v6);
        v7 = v6;
      }
      else
      {
        v7 = xpc_null_create();
      }
    }
    else
    {
      v7 = xpc_null_create();
      v6 = 0;
    }
    xpc_release(v6);
    v8 = xpc_null_create();
    xpc_release(v5);
    xpc_release(v8);
  }
  v9 = xpc_int64_create(1);
  if (!v9)
    v9 = xpc_null_create();
  xpc_dictionary_set_value(v7, "libetl", v9);
  v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  v11 = xpc_int64_create(1);
  if (!v11)
    v11 = xpc_null_create();
  xpc_dictionary_set_value(v7, "libtu", v11);
  v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  v13 = xpc_int64_create(1);
  if (!v13)
    v13 = xpc_null_create();
  xpc_dictionary_set_value(v7, "trace.diag.cfg", v13);
  v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  v15 = xpc_int64_create(1);
  if (!v15)
    v15 = xpc_null_create();
  xpc_dictionary_set_value(v7, "trace.diag.svc", v15);
  v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  v17 = xpc_int64_create(1);
  if (!v17)
    v17 = xpc_null_create();
  xpc_dictionary_set_value(v7, "libktl", v17);
  v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  if (v7)
  {
    xpc_retain(v7);
    v19 = v7;
  }
  else
  {
    v19 = xpc_null_create();
  }
  xpc_dictionary_set_value((xpc_object_t)0xAAAAAAAAAAAAAAAALL, "kDomainLogLevels", v19);
  v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  xpc_retain((xpc_object_t)0xAAAAAAAAAAAAAAAALL);
  ctu::LogServer::updateConfig();
  xpc_release((xpc_object_t)0xAAAAAAAAAAAAAAAALL);
  v21 = (capabilities::abs *)operator new(0x10uLL);
  v22 = *(_QWORD **)(a1 + 32);
  *(_QWORD *)v21 = *v22;
  v23 = v22[1];
  *((_QWORD *)v21 + 1) = v23;
  if (v23)
  {
    v24 = (unint64_t *)(v23 + 16);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  _MergedGlobals_0 = (uint64_t)v21;
  if (!qword_2579B81C0)
  {
    v21 = (capabilities::abs *)os_log_create("com.apple.telephony.abm", "libtu");
    qword_2579B81C0 = (uint64_t)v21;
  }
  capabilities::abs::TUDebugFlags(v21);
  TelephonyUtilDebugSetFlags();
  v26 = (capabilities::radio *)TelephonyUtilDebugRegisterDelegate();
  v27 = capabilities::radio::ice(v26);
  if ((v27 & 1) == 0)
    capabilities::radio::maverick((capabilities::radio *)v27);
  if (!qword_2579B81C8)
    qword_2579B81C8 = (uint64_t)os_log_create("com.apple.telephony.abm", "bbu");
  BBUpdaterRegisterGlobalLogSink();
  xpc_release(v7);
  xpc_release((xpc_object_t)0xAAAAAAAAAAAAAAAALL);
}

void sub_24B837AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
  void *v10;

  xpc_release(object);
  xpc_release(v10);
  xpc_release(a10);
  _Unwind_Resume(a1);
}

void abm::debug::handleDebugPrintTelephonyUtil(abm::debug *this, const char *a2, const char *a3, char *a4)
{
  abm::debug::handleDebugPrint(0, this, (uint64_t)a2, (uint64_t)a3);
}

void abm::debug::handleDebugPrintBinaryTelephonyUtil(uint64_t a1, int a2, uint64_t a3, int a4)
{
  const char *v4;
  const char *v5;
  _QWORD *v6;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  ctu::Clock *v17;
  std::__shared_weak_count_vtbl *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  void **v28;
  void *__p[2];
  char v30;
  void *v31[2];
  uint64_t v32;
  _OWORD v33[3];
  unint64_t v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void **v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = "misc";
  if (!a2)
    v4 = "send";
  if (a2 == 1)
    v5 = "recv";
  else
    v5 = v4;
  v6 = (_QWORD *)_MergedGlobals_0;
  if (_MergedGlobals_0)
  {
    v8 = *(std::__shared_weak_count **)(_MergedGlobals_0 + 8);
    if (v8)
    {
      v10 = std::__shared_weak_count::lock(v8);
      if (v10)
      {
        v11 = v10;
        if (*v6)
        {
          v34 = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v33[1] = v12;
          v33[2] = v12;
          v33[0] = v12;
          ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v33);
          v13 = MEMORY[0x24BD28070](v33, a1);
          MEMORY[0x24BD28070](v13, " (");
          v14 = ctu::operator<<();
          v15 = MEMORY[0x24BD28070](v14, ") ");
          v16 = MEMORY[0x24BD28070](v15, v5);
          MEMORY[0x24BD28070](v16, "\n");
          v31[1] = (void *)0xAAAAAAAAAAAAAAAALL;
          v32 = 0xAAAAAAAAAAAAAALL;
          v31[0] = (void *)0xAAAAAAAAAAAAAA00;
          ctu::assign();
          v17 = (ctu::Clock *)MEMORY[0x24BD2807C](v33, v31);
          ctu::Clock::now_in_nanoseconds(v17);
          v18 = (std::__shared_weak_count_vtbl *)operator new(0x60uLL);
          v30 = 5;
          strcpy((char *)__p, "libtu");
          MEMORY[0x24BD27F98](v33);
          ctu::LogMessageBuffer::takeMetadata((ctu::LogMessageBuffer *)v33);
          ctu::LogMessage::LogMessage();
          v19 = (std::__shared_weak_count *)operator new(0x20uLL);
          v19->__shared_owners_ = 0;
          p_shared_owners = (unint64_t *)&v19->__shared_owners_;
          v19->__vftable = (std::__shared_weak_count_vtbl *)off_251CB49D8;
          v19->__shared_weak_owners_ = 0;
          v19[1].__vftable = v18;
          if (v30 < 0)
            operator delete(__p[0]);
          do
            v21 = __ldxr(p_shared_owners);
          while (__stxr(v21 + 1, p_shared_owners));
          ctu::LogServer::log();
          if (v19)
          {
            v22 = (unint64_t *)&v19->__shared_owners_;
            do
              v23 = __ldaxr(v22);
            while (__stlxr(v23 - 1, v22));
            if (!v23)
            {
              ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
              std::__shared_weak_count::__release_weak(v19);
            }
          }
          v24 = qword_2579B81C0;
          if (qword_2579B81C0 && os_log_type_enabled((os_log_t)qword_2579B81C0, OS_LOG_TYPE_DEBUG))
          {
            v28 = v31;
            if (v32 < 0)
              v28 = (void **)v31[0];
            *(_DWORD *)buf = 67109634;
            v36 = a4;
            v37 = 2080;
            v38 = v5;
            v39 = 2080;
            v40 = v28;
            _os_log_debug_impl(&dword_24B825000, v24, OS_LOG_TYPE_DEBUG, "(%d) %s: %s", buf, 0x1Cu);
          }
          do
            v25 = __ldaxr(p_shared_owners);
          while (__stlxr(v25 - 1, p_shared_owners));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
          if (SHIBYTE(v32) < 0)
            operator delete(v31[0]);
          MEMORY[0x24BD27FC8](v33);
        }
        v26 = (unint64_t *)&v11->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
    }
  }
}

void sub_24B837F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  std::__shared_weak_count *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t *p_shared_owners;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;

  if (a10)
  {
    p_shared_owners = (unint64_t *)&a10->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  do
    v29 = __ldaxr(v25);
  while (__stlxr(v29 - 1, v25));
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  if (a22 < 0)
    operator delete(__p);
  MEMORY[0x24BD27FC8](&a23);
  v30 = (unint64_t *)&v23->__shared_owners_;
  do
    v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  _Unwind_Resume(a1);
}

uint64_t abm::debug::handleDebugPrintBBU(abm::debug *this, void *a2, const char *a3, const char *a4)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  std::ios_base *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  size_t v14;
  abm::debug *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  size_t v19;
  void **v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  void *__dst[3];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *__p[2];
  __int128 v34;
  unint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v35 = 0xAAAAAAAAAAAAAAAALL;
  v45 = v5;
  v44 = v5;
  v43 = v5;
  v42 = v5;
  v41 = v5;
  v40 = v5;
  v39 = v5;
  v38 = v5;
  v37 = v5;
  *(_OWORD *)__p = v5;
  v34 = v5;
  v31 = v5;
  v32 = v5;
  v29 = v5;
  v30 = v5;
  v6 = MEMORY[0x24BEDB870];
  v7 = MEMORY[0x24BEDB870] + 64;
  v36 = MEMORY[0x24BEDB870] + 64;
  v8 = (uint64_t *)MEMORY[0x24BEDB800];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v28 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v28 + *(_QWORD *)(v28 - 24)) = v9;
  v10 = (std::ios_base *)((char *)&v28 + *(_QWORD *)(v28 - 24));
  std::ios_base::init(v10, &v29);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  v28 = v6 + 24;
  v36 = v7;
  std::streambuf::basic_streambuf();
  v11 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v29 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v34 = 0u;
  LODWORD(v35) = 16;
  v12 = (_QWORD *)std::ostream::operator<<();
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)":", 1);
  v14 = strlen(a3);
  v15 = (abm::debug *)std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)a3, v14);
  memset(__dst, 170, sizeof(__dst));
  if ((v35 & 0x10) != 0)
  {
    v21 = *((_QWORD *)&v34 + 1);
    if (*((_QWORD *)&v34 + 1) < (unint64_t)v32)
    {
      *((_QWORD *)&v34 + 1) = v32;
      v21 = v32;
    }
    v22 = (const void *)*((_QWORD *)&v31 + 1);
    v19 = v21 - *((_QWORD *)&v31 + 1);
    if ((unint64_t)(v21 - *((_QWORD *)&v31 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_22;
  }
  else
  {
    if ((v35 & 8) == 0)
    {
      v19 = 0;
      HIBYTE(__dst[2]) = 0;
      v20 = __dst;
      goto LABEL_14;
    }
    v22 = (const void *)v30;
    v19 = v31 - v30;
    if ((_QWORD)v31 - (_QWORD)v30 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_22:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v19 >= 0x17)
  {
    v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v23 = v19 | 7;
    v24 = v23 + 1;
    v20 = (void **)operator new(v23 + 1);
    __dst[1] = (void *)v19;
    __dst[2] = (void *)(v24 | 0x8000000000000000);
    __dst[0] = v20;
    goto LABEL_13;
  }
  HIBYTE(__dst[2]) = v19;
  v20 = __dst;
  if (v19)
LABEL_13:
    v15 = (abm::debug *)memmove(v20, v22, v19);
LABEL_14:
  *((_BYTE *)v20 + v19) = 0;
  v25 = __dst;
  if (SHIBYTE(__dst[2]) < 0)
    v25 = (void **)__dst[0];
  abm::debug::handleDebugPrintBBUHelper(v15, v16, v17, v18, v25);
  if (SHIBYTE(__dst[2]) < 0)
    operator delete(__dst[0]);
  v28 = *v8;
  *(uint64_t *)((char *)&v28 + *(_QWORD *)(v28 - 24)) = v8[3];
  *(_QWORD *)&v29 = v11 + 16;
  if (SBYTE7(v34) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x24BD2825C](&v36);
}

void sub_24B8382D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0)
  {
    operator delete(__p);
    std::ostringstream::~ostringstream((uint64_t)&a17);
    _Unwind_Resume(a1);
  }
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void abm::debug::handleDebugPrint(int a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v10;
  __int128 v11;
  uint64_t v12;
  ctu::Clock *v13;
  std::string *v14;
  const char *v15;
  size_t v16;
  void *v17;
  void **v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  std::string *v23;
  int v24;
  size_t size;
  std::string *data;
  _BYTE *v27;
  unint64_t v28;
  unsigned __int8 *v29;
  char *v30;
  int v31;
  char *v32;
  std::string::size_type v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  std::string::__raw *v40;
  std::string::size_type v41;
  std::string::pointer v42;
  std::string::__raw *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *p_shared_owners;
  unint64_t v48;
  std::string::pointer v49;
  std::__shared_weak_count *v50;
  void *__dst[2];
  unint64_t v52;
  std::string *v53;
  std::__shared_weak_count *v54;
  _OWORD v55[3];
  unint64_t v56;
  std::__shared_weak_count *v58;
  uint8_t buf[4];
  std::string::__raw *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)_MergedGlobals_0;
  if (!_MergedGlobals_0)
    return;
  v6 = *(std::__shared_weak_count **)(_MergedGlobals_0 + 8);
  if (!v6)
    return;
  v10 = std::__shared_weak_count::lock(v6);
  v58 = v10;
  if (!v10)
    return;
  if (!*v4)
  {
    v19 = v10;
LABEL_67:
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v48 = __ldaxr(p_shared_owners);
    while (__stlxr(v48 - 1, p_shared_owners));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
    return;
  }
  v56 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v55[1] = v11;
  v55[2] = v11;
  v55[0] = v11;
  ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v55);
  if (a2 && *a2)
  {
    v12 = MEMORY[0x24BD28070](v55, a2);
    MEMORY[0x24BD28070](v12, ": ");
  }
  MEMORY[0x24BD27FB0](&v53, a3, a4);
  ctu::operator<<();
  v13 = (ctu::Clock *)MEMORY[0x24BD27FC8](&v53);
  ctu::Clock::now_in_nanoseconds(v13);
  v14 = (std::string *)operator new(0x60uLL);
  v15 = abm::debug::kLogDomainMap[a1];
  v16 = strlen(v15);
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = (void *)v16;
  if (v16 >= 0x17)
  {
    v20 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v20 = v16 | 7;
    v21 = v20 + 1;
    v18 = (void **)operator new(v20 + 1);
    __dst[1] = v17;
    v52 = v21 | 0x8000000000000000;
    __dst[0] = v18;
    goto LABEL_16;
  }
  HIBYTE(v52) = v16;
  v18 = __dst;
  if (v16)
LABEL_16:
    memmove(v18, v15, (size_t)v17);
  *((_BYTE *)v17 + (_QWORD)v18) = 0;
  MEMORY[0x24BD27F98](v55);
  ctu::LogMessageBuffer::takeMetadata((ctu::LogMessageBuffer *)v55);
  ctu::LogMessage::LogMessage();
  v53 = v14;
  v22 = (std::__shared_weak_count *)operator new(0x20uLL);
  v22->__vftable = (std::__shared_weak_count_vtbl *)off_251CB49D8;
  v22->__shared_owners_ = 0;
  v22->__shared_weak_owners_ = 0;
  v22[1].__vftable = (std::__shared_weak_count_vtbl *)v14;
  v54 = v22;
  if (SHIBYTE(v52) < 0)
  {
    operator delete(__dst[0]);
    v23 = v14 + 2;
    v24 = SHIBYTE(v14[2].__r_.__value_.__r.__words[2]);
    if ((v24 & 0x80000000) == 0)
      goto LABEL_19;
  }
  else
  {
    v23 = v14 + 2;
    v24 = SHIBYTE(v14[2].__r_.__value_.__r.__words[2]);
    if ((v24 & 0x80000000) == 0)
    {
LABEL_19:
      size = v24;
      data = v23;
      goto LABEL_22;
    }
  }
  data = (std::string *)v14[2].__r_.__value_.__l.__data_;
  size = v14[2].__r_.__value_.__l.__size_;
LABEL_22:
  v27 = memchr(data, 10, size);
  if (v27)
    v28 = (unint64_t)v27;
  else
    v28 = (unint64_t)data + size;
  if (v28 - (_QWORD)data != size)
  {
    v29 = (unsigned __int8 *)(v28 + 1);
    if ((std::string *)(v28 + 1) != (std::string *)((char *)data + size))
    {
      v30 = (char *)data + size + ~v28;
      do
      {
        v31 = *v29;
        if (v31 != 10)
          *(_BYTE *)v28++ = v31;
        ++v29;
        --v30;
      }
      while (v30);
      LOBYTE(v24) = *((_BYTE *)&v14[2].__r_.__value_.__s + 23);
    }
  }
  if ((v24 & 0x80) == 0)
  {
    v32 = (char *)v23 + v24;
    v33 = v28 - (_QWORD)v23;
    if (v24 >= v28 - (unint64_t)v23)
      goto LABEL_34;
LABEL_51:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  v42 = v14[2].__r_.__value_.__l.__data_;
  v41 = v14[2].__r_.__value_.__l.__size_;
  v32 = &v42[v41];
  v33 = v28 - (_QWORD)v42;
  if (v41 < v28 - (unint64_t)v42)
    goto LABEL_51;
LABEL_34:
  if (&v32[-v28] == (char *)-1)
  {
    if ((v24 & 0x80) != 0)
    {
      v49 = v14[2].__r_.__value_.__l.__data_;
      v14[2].__r_.__value_.__l.__size_ = v33;
      v49[v33] = 0;
      v34 = v54;
      v50 = v54;
      if (!v54)
        goto LABEL_38;
    }
    else
    {
      *((_BYTE *)&v14[2].__r_.__value_.__s + 23) = v33 & 0x7F;
      v23->__r_.__value_.__s.__data_[v33] = 0;
      v34 = v54;
      v50 = v54;
      if (!v54)
        goto LABEL_38;
    }
  }
  else
  {
    std::string::__erase_external_with_move(v23, v33, (std::string::size_type)&v32[-v28]);
    v34 = v54;
    v50 = v54;
    if (!v54)
      goto LABEL_38;
  }
  v35 = (unint64_t *)&v34->__shared_owners_;
  do
    v36 = __ldxr(v35);
  while (__stxr(v36 + 1, v35));
LABEL_38:
  ctu::LogServer::log();
  if (v50)
  {
    v37 = (unint64_t *)&v50->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  if (a1)
  {
    if (a1 == 3)
    {
      v39 = qword_2579B81C8;
      if (qword_2579B81C8)
      {
        if (os_log_type_enabled((os_log_t)qword_2579B81C8, OS_LOG_TYPE_DEFAULT))
        {
          v40 = (std::string::__raw *)&v53[2];
          if (SHIBYTE(v53[2].__r_.__value_.__r.__words[2]) < 0)
            v40 = (std::string::__raw *)v40->__words[0];
          *(_DWORD *)buf = 136315138;
          v60 = v40;
LABEL_60:
          _os_log_impl(&dword_24B825000, v39, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v39 = qword_2579B81C0;
    if (qword_2579B81C0 && os_log_type_enabled((os_log_t)qword_2579B81C0, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (std::string::__raw *)&v53[2];
      if (SHIBYTE(v53[2].__r_.__value_.__r.__words[2]) < 0)
        v43 = (std::string::__raw *)v43->__words[0];
      *(_DWORD *)buf = 136315138;
      v60 = v43;
      goto LABEL_60;
    }
  }
  v44 = v54;
  if (v54)
  {
    v45 = (unint64_t *)&v54->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  MEMORY[0x24BD27FC8](v55);
  v19 = v58;
  if (v58)
    goto LABEL_67;
}

void sub_24B838828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  uint64_t v24;

  MEMORY[0x24BD27FC8](&a24);
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v24 - 112);
  _Unwind_Resume(a1);
}

void sub_24B8388C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v1 - 112);
  _Unwind_Resume(a1);
}

void sub_24B8388D4()
{
  void *v0;

  operator delete(v0);
  JUMPOUT(0x24B83891CLL);
}

void sub_24B838900(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  if (a16 < 0)
    operator delete(__p);
  operator delete(v16);
  JUMPOUT(0x24B83891CLL);
}

void std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ctu::LogMessage *,std::shared_ptr<ctu::LogMessage>::__shared_ptr_default_delete<ctu::LogMessage,ctu::LogMessage>,std::allocator<ctu::LogMessage>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000024B845039)
    return a1 + 24;
  if (((v3 & 0x800000024B845039 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000024B845039))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000024B845039 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void std::string::__erase_external_with_move(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  int v4;
  std::string::size_type size;
  std::string *v6;
  std::string::size_type v7;
  std::string::size_type v8;
  std::string::size_type v9;

  if (!__n)
    return;
  v4 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v4 < 0)
  {
    v6 = (std::string *)this->__r_.__value_.__r.__words[0];
    size = this->__r_.__value_.__l.__size_;
    v7 = size - __pos;
    if (size - __pos >= __n)
      v8 = __n;
    else
      v8 = size - __pos;
    if (size - __pos <= __n)
      goto LABEL_8;
  }
  else
  {
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v6 = this;
    v7 = size - __pos;
    if (size - __pos >= __n)
      v8 = __n;
    else
      v8 = HIBYTE(this->__r_.__value_.__r.__words[2]) - __pos;
    if (v7 <= __n)
      goto LABEL_8;
  }
  memmove((char *)v6 + __pos, (char *)v6 + __pos + v8, v7 - v8);
  LOBYTE(v4) = *((_BYTE *)&this->__r_.__value_.__s + 23);
LABEL_8:
  v9 = size - v8;
  if ((v4 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = v9;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = v9 & 0x7F;
  v6->__r_.__value_.__s.__data_[v9] = 0;
}

void abm::debug::handleDebugPrintBBUHelper(abm::debug *this, void *a2, uint64_t a3, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  abm::debug::handleDebugPrint(3, &unk_24B84549A, (uint64_t)"%s", (uint64_t)va);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD2825C](a1 + 112);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x24BD2816C](v13, a1);
  if (LOBYTE(v13[0]))
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x24BD28178](v13);
  return a1;
}

void sub_24B838C44(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x24BD28178](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24B838C24);
}

void sub_24B838C8C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__b[3];

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12)
          return 0;
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(_QWORD *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_24B838E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void Timestamp::Timestamp(Timestamp *this)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  int *v10;
  char *v11;
  unsigned __int128 v12;
  uint8_t buf[4];
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 1) = 0;
  v2 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  v12 = 0uLL;
  if ((gettimeofday((timeval *)&v12, 0) & 0x80000000) == 0
    || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v3 = *v2;
    v4 = v2;
    if (*v2)
      goto LABEL_4;
LABEL_10:
    v7 = (char *)operator new(0x38uLL);
    *((_DWORD *)v7 + 8) = 0;
    *((_QWORD *)v7 + 5) = 0;
    *((_QWORD *)v7 + 6) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v4;
    *v2 = v7;
    v8 = **(_QWORD **)this;
    v9 = (uint64_t *)v7;
    if (v8)
    {
      *(_QWORD *)this = v8;
      v9 = (uint64_t *)*v2;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), v9);
    ++*((_QWORD *)this + 2);
    goto LABEL_13;
  }
  v10 = __error();
  v11 = strerror(*v10);
  *(_DWORD *)buf = 136315138;
  v14 = v11;
  _os_log_error_impl(&dword_24B825000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to get current time. Error: %s\n", buf, 0xCu);
  v3 = *v2;
  v4 = v2;
  if (!*v2)
    goto LABEL_10;
LABEL_4:
  v5 = v3;
  while (1)
  {
    while (1)
    {
      v4 = (_QWORD *)v5;
      v6 = *(_DWORD *)(v5 + 32);
      if (v6 < 1)
        break;
      v5 = *v4;
      v2 = v4;
      if (!*v4)
        goto LABEL_10;
    }
    if ((v6 & 0x80000000) == 0)
      break;
    v5 = v4[1];
    if (!v5)
    {
      v2 = v4 + 1;
      goto LABEL_10;
    }
  }
  v7 = (char *)v4;
LABEL_13:
  *(_OWORD *)(v7 + 40) = v12;
}

void sub_24B838FDC(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD **v2;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, *v2);
  _Unwind_Resume(a1);
}

void sub_24B838FF8(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, v2);
  _Unwind_Resume(a1);
}

void Timestamp::Timestamp(Timestamp *this, const Timestamp *a2)
{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(_QWORD **)a2, (_QWORD *)a2 + 1);
}

{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(_QWORD **)a2, (_QWORD *)a2 + 1);
}

void sub_24B839050(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

void sub_24B8390A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

_QWORD *Timestamp::Timestamp(_QWORD *a1, _OWORD *a2, int a3)
{
  _QWORD *v6;
  char *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

{
  _QWORD *v6;
  char *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

__n128 Timestamp::set(uint64_t **a1, __n128 *a2, int a3)
{
  char *v6;
  uint64_t **v7;
  char *v8;
  int v9;
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  __n128 result;

  v7 = a1 + 1;
  v6 = (char *)a1[1];
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        v8 = v6;
        v9 = *((_DWORD *)v6 + 8);
        if (v9 <= a3)
          break;
        v6 = *(char **)v8;
        v7 = (uint64_t **)v8;
        if (!*(_QWORD *)v8)
          goto LABEL_8;
      }
      if (v9 >= a3)
        break;
      v6 = (char *)*((_QWORD *)v8 + 1);
      if (!v6)
      {
        v7 = (uint64_t **)(v8 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v8 = (char *)(a1 + 1);
LABEL_8:
    v10 = v8;
    v8 = (char *)operator new(0x38uLL);
    *((_DWORD *)v8 + 8) = a3;
    *((_QWORD *)v8 + 5) = 0;
    *((_QWORD *)v8 + 6) = 0;
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    *((_QWORD *)v8 + 2) = v10;
    *v7 = (uint64_t *)v8;
    v11 = (uint64_t *)**a1;
    v12 = (uint64_t *)v8;
    if (v11)
    {
      *a1 = v11;
      v12 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  result = *a2;
  *(__n128 *)(v8 + 40) = *a2;
  return result;
}

_QWORD *Timestamp::Timestamp(_QWORD *a1, uint64_t a2, int a3)
{
  _QWORD *v6;
  _DWORD *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  *((_BYTE *)v7 + 24) = 1;
  a1[2] = 1;
  *((_QWORD *)v7 + 5) = a2;
  *((_QWORD *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

{
  _QWORD *v6;
  _DWORD *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  *((_BYTE *)v7 + 24) = 1;
  a1[2] = 1;
  *((_QWORD *)v7 + 5) = a2;
  *((_QWORD *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

uint64_t **Timestamp::Timestamp(uint64_t **a1, char *a2, char a3, int a4)
{
  const char *v5;
  uint64_t **v7;
  int *v8;
  char *v9;
  NSObject *v10;
  const char *v11;
  uint64_t *v12;
  uint64_t **v13;
  int v14;
  char *v15;
  uint64_t *v16;
  uint64_t *v17;
  int *v19;
  char *v20;
  int *v21;
  char *v22;
  unsigned __int128 v23;
  tm v24;
  void *__p[4];
  uint8_t buf[4];
  char *v27;
  uint64_t v28;

  v5 = a2;
  v28 = *MEMORY[0x24BDAC8D0];
  a1[1] = 0;
  v7 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  __p[2] = (void *)0x11AAAAAAAAAA0053;
  *(_OWORD *)__p = *(_OWORD *)"%Y-%m-%d-%H-%M-%S";
  if ((a3 & 0x10) != 0)
  {
    HIBYTE(__p[2]) = 19;
    strcpy((char *)__p, "%Y.%m.%d_%H-%M-%S%z");
  }
  *((_QWORD *)&v23 + 1) = 0xAAAAAAAA00000000;
  memset(&v24, 0, sizeof(v24));
  if (a2[23] < 0)
    v5 = *(const char **)a2;
  if (strptime(v5, (const char *)__p, &v24))
  {
    v24.tm_isdst = -1;
    *(_QWORD *)&v23 = mktime(&v24);
    if ((_QWORD)v23 != -1)
      goto LABEL_15;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v19 = __error();
      v20 = strerror(*v19);
      *(_DWORD *)buf = 136315138;
      v27 = v20;
      _os_log_error_impl(&dword_24B825000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to convert to absolute time. Error: %s\n", buf, 0xCu);
      v23 = 0uLL;
      if ((gettimeofday((timeval *)&v23, 0) & 0x80000000) == 0)
        goto LABEL_15;
    }
    else
    {
      v23 = 0uLL;
      if ((gettimeofday((timeval *)&v23, 0) & 0x80000000) == 0)
        goto LABEL_15;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v8 = __error();
    v9 = strerror(*v8);
    *(_DWORD *)buf = 136315138;
    v27 = v9;
    v10 = MEMORY[0x24BDACB70];
    v11 = "Failed to get current time after absolute time conversion failed. Error: %s\n";
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B825000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to convert time from string format\n", buf, 2u);
  }
  v23 = 0uLL;
  if (gettimeofday((timeval *)&v23, 0) < 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v21 = __error();
    v22 = strerror(*v21);
    *(_DWORD *)buf = 136315138;
    v27 = v22;
    v10 = MEMORY[0x24BDACB70];
    v11 = "Failed to get current time after conversion failure. Error: %s\n";
LABEL_32:
    _os_log_error_impl(&dword_24B825000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
  }
LABEL_15:
  v12 = *v7;
  v13 = v7;
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        v13 = (uint64_t **)v12;
        v14 = *((_DWORD *)v12 + 8);
        if (v14 <= a4)
          break;
        v12 = *v13;
        v7 = v13;
        if (!*v13)
          goto LABEL_22;
      }
      if (v14 >= a4)
        break;
      v12 = v13[1];
      if (!v12)
      {
        v7 = v13 + 1;
        goto LABEL_22;
      }
    }
    *(_OWORD *)(v13 + 5) = v23;
    if (SHIBYTE(__p[2]) < 0)
      goto LABEL_25;
  }
  else
  {
LABEL_22:
    v15 = (char *)operator new(0x38uLL);
    *((_DWORD *)v15 + 8) = a4;
    *((_QWORD *)v15 + 5) = 0;
    *((_QWORD *)v15 + 6) = 0;
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
    *((_QWORD *)v15 + 2) = v13;
    *v7 = (uint64_t *)v15;
    v16 = (uint64_t *)**a1;
    v17 = (uint64_t *)v15;
    if (v16)
    {
      *a1 = v16;
      v17 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v17);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    *(_OWORD *)(v15 + 40) = v23;
    if (SHIBYTE(__p[2]) < 0)
LABEL_25:
      operator delete(__p[0]);
  }
  return a1;
}

void sub_24B8396A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  if (a24 < 0)
    operator delete(__p);
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v24, *(_QWORD **)(v24 + 8));
  _Unwind_Resume(a1);
}

uint64_t Timestamp::get(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t *v9;

  *a2 = 0;
  a2[1] = 0;
  v5 = *(_QWORD *)(a1 + 8);
  v3 = a1 + 8;
  v4 = v5;
  if (!v5)
    return 0;
  v6 = v3;
  do
  {
    v7 = *(_DWORD *)(v4 + 32);
    v8 = v7 < a3;
    if (v7 >= a3)
      v9 = (uint64_t *)v4;
    else
      v9 = (uint64_t *)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v3 || *(_DWORD *)(v6 + 32) > a3)
    return 0;
  *(_OWORD *)a2 = *(_OWORD *)(v6 + 40);
  return 1;
}

uint64_t Timestamp::now(timeval *this, timeval *a2)
{
  return gettimeofday(this, 0);
}

uint64_t Timestamp::asString@<X0>(uint64_t a1@<X0>, int a2@<W1>, char a3@<W2>, _BYTE *a4@<X8>)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::ios_base *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  uint64_t *v23;
  _BYTE *v24;
  time_t v25;
  __int128 v26;
  const char *v27;
  size_t v28;
  uint64_t v29;
  char *v30;
  const std::locale::facet *v31;
  size_t v32;
  uint64_t v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  tm v41;
  time_t v42;
  _QWORD v43[2];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 __p;
  __int128 v50;
  unint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  std::locale v62;
  char __s[16];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v61 = v7;
  v51 = 0xAAAAAAAAAAAAAAAALL;
  v60 = v7;
  v59 = v7;
  v58 = v7;
  v57 = v7;
  v56 = v7;
  v55 = v7;
  v54 = v7;
  v53 = v7;
  v50 = v7;
  __p = v7;
  v48 = v7;
  v47 = v7;
  v46 = v7;
  v45 = v7;
  v8 = MEMORY[0x24BEDB858];
  v9 = MEMORY[0x24BEDB858] + 104;
  v52 = MEMORY[0x24BEDB858] + 104;
  v10 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v11 = MEMORY[0x24BEDB858] + 64;
  v12 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v13 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  v44 = MEMORY[0x24BEDB858] + 64;
  v43[0] = v12;
  *(_QWORD *)((char *)v43 + *(_QWORD *)(v12 - 24)) = v13;
  v43[1] = 0;
  v14 = (std::ios_base *)((char *)v43 + *(_QWORD *)(v43[0] - 24));
  std::ios_base::init(v14, &v45);
  v14[1].__vftable = 0;
  v14[1].__fmtflags_ = -1;
  v15 = v10[5];
  v44 = v10[4];
  *(uint64_t *)((char *)&v44 + *(_QWORD *)(v44 - 24)) = v15;
  v43[0] = v10[1];
  *(_QWORD *)((char *)v43 + *(_QWORD *)(v43[0] - 24)) = v10[6];
  v52 = v9;
  v43[0] = v8 + 24;
  v44 = v11;
  std::streambuf::basic_streambuf();
  v16 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v45 = MEMORY[0x24BEDB848] + 16;
  __p = 0u;
  v50 = 0u;
  LODWORD(v51) = 24;
  v19 = *(_QWORD *)(a1 + 8);
  v18 = a1 + 8;
  v17 = v19;
  if (!v19)
    goto LABEL_13;
  v20 = v18;
  do
  {
    v21 = *(_DWORD *)(v17 + 32);
    v22 = v21 < a2;
    if (v21 >= a2)
      v23 = (uint64_t *)v17;
    else
      v23 = (uint64_t *)(v17 + 8);
    if (!v22)
      v20 = v17;
    v17 = *v23;
  }
  while (*v23);
  if (v20 == v18)
  {
LABEL_13:
    v25 = 0;
    v24 = a4;
    if ((a3 & 0x11) != 0)
      goto LABEL_14;
    goto LABEL_22;
  }
  v24 = a4;
  if (*(_DWORD *)(v20 + 32) <= a2)
  {
    v25 = *(_QWORD *)(v20 + 40);
    if ((a3 & 0x11) != 0)
      goto LABEL_14;
LABEL_22:
    std::ostream::operator<<();
    if ((a3 & 4) != 0 || (a3 & 8) != 0)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v44, (uint64_t)".", 1);
      std::ostream::operator<<();
    }
    goto LABEL_25;
  }
  v25 = 0;
  if ((a3 & 0x11) == 0)
    goto LABEL_22;
LABEL_14:
  v41.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  v42 = v25;
  *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v41.tm_mon = v26;
  *(_OWORD *)&v41.tm_isdst = v26;
  *(_OWORD *)&v41.tm_sec = v26;
  localtime_r(&v42, &v41);
  v65 = 0u;
  v66 = 0u;
  *(_OWORD *)__s = 0u;
  v64 = 0u;
  if ((a3 & 0x10) != 0)
    v27 = "%Y.%m.%d_%H-%M-%S%z";
  else
    v27 = "%Y-%m-%d-%H-%M-%S";
  strftime(__s, 0x40uLL, v27, &v41);
  v28 = strlen(__s);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v44, (uint64_t)__s, v28);
  if ((a3 & 8) != 0)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v44, (uint64_t)"-", 1);
    v29 = v44;
    v30 = (char *)&v44 + *(_QWORD *)(v44 - 24);
    if (*((_DWORD *)v30 + 36) == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v44 + *(_QWORD *)(v44 - 24)));
      v31 = std::locale::use_facet(&v62, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 32);
      std::locale::~locale(&v62);
      v29 = v44;
    }
    *((_DWORD *)v30 + 36) = 48;
    *(_QWORD *)((char *)&v46 + *(_QWORD *)(v29 - 24)) = 3;
    std::ostream::operator<<();
  }
LABEL_25:
  if ((v51 & 0x10) != 0)
  {
    v33 = *((_QWORD *)&v50 + 1);
    if (*((_QWORD *)&v50 + 1) < (unint64_t)v48)
    {
      *((_QWORD *)&v50 + 1) = v48;
      v33 = v48;
    }
    v34 = (const void *)*((_QWORD *)&v47 + 1);
    v32 = v33 - *((_QWORD *)&v47 + 1);
    if ((unint64_t)(v33 - *((_QWORD *)&v47 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_42;
  }
  else
  {
    if ((v51 & 8) == 0)
    {
      v32 = 0;
      v24[23] = 0;
      goto LABEL_38;
    }
    v34 = (const void *)v46;
    v32 = v47 - v46;
    if ((_QWORD)v47 - (_QWORD)v46 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_42:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v32 >= 0x17)
  {
    v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v32 | 7) != 0x17)
      v35 = v32 | 7;
    v36 = v35 + 1;
    v37 = operator new(v35 + 1);
    *((_QWORD *)v24 + 1) = v32;
    *((_QWORD *)v24 + 2) = v36 | 0x8000000000000000;
    *(_QWORD *)v24 = v37;
    v24 = v37;
    goto LABEL_37;
  }
  v24[23] = v32;
  if (v32)
LABEL_37:
    memmove(v24, v34, v32);
LABEL_38:
  v24[v32] = 0;
  v43[0] = *MEMORY[0x24BEDB7F0];
  v38 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v43 + *(_QWORD *)(v43[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v44 = v38;
  *(_QWORD *)&v45 = v16 + 16;
  if (SBYTE7(v50) < 0)
    operator delete((void *)__p);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x24BD2825C](&v52);
}

void sub_24B839BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B839BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  std::locale::~locale((std::locale *)(v11 - 184));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B839C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24B839C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2825C](a9);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x24BD2825C](a1 + 128);
  return a1;
}

uint64_t *Timestamp::convert(uint64_t a1)
{
  uint64_t *v1;
  uint64_t **v2;
  uint64_t *v3;
  uint64_t **v4;
  uint64_t **v5;
  int v6;
  uint64_t **v7;
  uint64_t *v8;
  std::string __p;
  uint64_t *v11[3];

  memset(v11, 170, sizeof(v11));
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  Timestamp::Timestamp(v11, (char *)&__p, 9, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    v1 = v11[1];
    if (!v11[1])
    {
LABEL_18:
      v8 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v1 = v11[1];
    if (!v11[1])
      goto LABEL_18;
  }
  v2 = &v11[1];
  v3 = v1;
  do
  {
    v4 = (uint64_t **)v3;
    v5 = v2;
    v6 = *((_DWORD *)v3 + 8);
    if (v6 >= 0)
      v2 = (uint64_t **)v3;
    else
      ++v3;
    v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v2 == &v11[1])
    goto LABEL_18;
  v7 = v6 >= 0 ? v4 : v5;
  if (*((int *)v7 + 8) > 0)
    goto LABEL_18;
  if (v6 < 0)
    v4 = v5;
  v8 = v4[5];
LABEL_19:
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy((uint64_t)v11, v1);
  return v8;
}

void sub_24B839E0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result)
    return result;
  while (1)
  {
    v2 = a2[2];
    if (*(_BYTE *)(v2 + 24))
      return result;
    v3 = *(uint64_t **)(v2 + 16);
    v4 = *v3;
    if (*v3 != v2)
      break;
    v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
          goto LABEL_15;
      }
      else
      {
        v9 = *(uint64_t **)(v2 + 8);
        v10 = *v9;
        *(_QWORD *)(v2 + 8) = *v9;
        if (v10)
        {
          *(_QWORD *)(v10 + 16) = v2;
          v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
        *v9 = v2;
        *(_QWORD *)(v2 + 16) = v9;
        v3 = (uint64_t *)v9[2];
        v2 = *v3;
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
LABEL_15:
          *(_QWORD *)(v11 + 16) = v3;
      }
      *(_QWORD *)(v2 + 16) = v3[2];
      *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
      *(_QWORD *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    *v5 = 1;
    if (v3 == result)
      return result;
  }
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 24);
    v5 = (_BYTE *)(v4 + 24);
    if (!v6)
      goto LABEL_3;
  }
  if (*(uint64_t **)v2 == a2)
  {
    v12 = a2[1];
    *(_QWORD *)v2 = v12;
    if (v12)
    {
      *(_QWORD *)(v12 + 16) = v2;
      v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(_QWORD *)(v2 + 16) = a2;
    v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((_BYTE *)a2 + 24) = 1;
  *((_BYTE *)v3 + 24) = 0;
  v13 = (uint64_t *)v3[1];
  v14 = *v13;
  v3[1] = *v13;
  if (v14)
    *(_QWORD *)(v14 + 16) = v3;
  v13[2] = v3[2];
  *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v13;
  *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t *std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>(uint64_t *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  BOOL v12;
  uint64_t **v13;
  uint64_t **v14;
  int v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = result;
    v6 = result + 1;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = (uint64_t *)v5[1];
      v9 = v6;
      if ((uint64_t *)*v5 == v6)
        goto LABEL_10;
      v10 = v5[1];
      v11 = v6;
      if (v8)
      {
        do
        {
          v9 = (uint64_t *)v10;
          v10 = *(_QWORD *)(v10 + 8);
        }
        while (v10);
      }
      else
      {
        do
        {
          v9 = (uint64_t *)v11[2];
          v12 = *v9 == (_QWORD)v11;
          v11 = v9;
        }
        while (v12);
      }
      if (*((_DWORD *)v9 + 8) < v7)
      {
LABEL_10:
        if (v8)
          v13 = (uint64_t **)v9;
        else
          v13 = (uint64_t **)v6;
        if (v8)
          v14 = (uint64_t **)(v9 + 1);
        else
          v14 = (uint64_t **)v6;
        if (*v14)
          goto LABEL_29;
      }
      else
      {
        v14 = (uint64_t **)v6;
        v13 = (uint64_t **)v6;
        if (v8)
        {
          while (1)
          {
            while (1)
            {
              v13 = (uint64_t **)v8;
              v15 = *((_DWORD *)v8 + 8);
              if (v15 <= v7)
                break;
              v8 = *v13;
              v14 = v13;
              if (!*v13)
                goto LABEL_25;
            }
            if (v15 >= v7)
              goto LABEL_29;
            v8 = v13[1];
            if (!v8)
            {
              v14 = v13 + 1;
              break;
            }
          }
        }
      }
LABEL_25:
      v16 = operator new(0x38uLL);
      v17 = v4[6];
      v16[2] = *((_OWORD *)v4 + 2);
      *((_QWORD *)v16 + 6) = v17;
      *(_QWORD *)v16 = 0;
      *((_QWORD *)v16 + 1) = 0;
      *((_QWORD *)v16 + 2) = v13;
      *v14 = (uint64_t *)v16;
      v18 = *(_QWORD *)*v5;
      if (v18)
      {
        *v5 = v18;
        v19 = *v14;
      }
      else
      {
        v19 = (uint64_t *)v16;
      }
      result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v5[1], v19);
      ++v5[2];
LABEL_29:
      v20 = (_QWORD *)v4[1];
      if (v20)
      {
        do
        {
          v21 = v20;
          v20 = (_QWORD *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          v21 = (_QWORD *)v4[2];
          v12 = *v21 == (_QWORD)v4;
          v4 = v21;
        }
        while (!v12);
      }
      v4 = v21;
    }
    while (v21 != a3);
  }
  return result;
}

uint64_t ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<ServerLogging>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy, &ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance, &dword_24B825000);
  }
  return result;
}

uint64_t __cxx_global_var_init_10()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ServerLogging>::~PthreadMutexGuardPolicy, &ctu::Singleton<ServerLogging,ServerLogging,ctu::PthreadMutexGuardPolicy<ServerLogging>>::sInstance, &dword_24B825000);
  }
  return result;
}

void util::strip_non_printable(std::string *this)
{
  std::string *v1;
  std::string::size_type size;
  std::string *v3;
  std::string *v4;
  std::string::size_type v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  std::string::size_type v12;
  int v13;
  std::string *v14;
  char *v15;
  std::string::size_type v16;
  std::string::size_type v17;

  v1 = this;
  size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) == 0)
    v3 = this;
  else
    v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  if ((size & 0x80u) != 0)
    size = this->__r_.__value_.__l.__size_;
  if (size)
  {
    v4 = (std::string *)((char *)v3 + size);
    v5 = size - 1;
    v6 = MEMORY[0x24BDAC740];
    while (1)
    {
      v7 = v3->__r_.__value_.__s.__data_[0];
      if ((v7 & 0x80000000) != 0)
        break;
      v8 = *(_DWORD *)(v6 + 4 * v7 + 60);
      if ((v8 & 0x40000) == 0 || (v8 & 0x4000) != 0)
        goto LABEL_15;
LABEL_8:
      v3 = (std::string *)((char *)v3 + 1);
      --v5;
      if (v3 == v4)
        goto LABEL_28;
    }
    if (__maskrune(v3->__r_.__value_.__s.__data_[0], 0x40000uLL) && !__maskrune(v7, 0x4000uLL))
      goto LABEL_8;
LABEL_15:
    if (v3 != v4 && (std::string *)((char *)&v3->__r_.__value_.__l.__data_ + 1) != v4)
    {
      v9 = 1;
      v4 = v3;
      while (1)
      {
        v10 = v3->__r_.__value_.__s.__data_[v9];
        if ((v10 & 0x80000000) != 0)
        {
          if (!__maskrune(v3->__r_.__value_.__s.__data_[v9], 0x40000uLL) || __maskrune(v10, 0x4000uLL))
            goto LABEL_19;
        }
        else
        {
          v11 = *(_DWORD *)(v6 + 4 * v10 + 60);
          if ((v11 & 0x40000) == 0 || (v11 & 0x4000) != 0)
            goto LABEL_19;
        }
        v4->__r_.__value_.__s.__data_[0] = v3->__r_.__value_.__s.__data_[v9];
        v4 = (std::string *)((char *)v4 + 1);
LABEL_19:
        ++v9;
        if (!--v5)
          goto LABEL_28;
      }
    }
  }
  v4 = v3;
LABEL_28:
  v12 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  v13 = (char)v12;
  v14 = (std::string *)v1->__r_.__value_.__r.__words[0];
  v15 = (char *)(v1->__r_.__value_.__r.__words[0] + v1->__r_.__value_.__l.__size_);
  if ((v12 & 0x80u) != 0)
  {
    v16 = v1->__r_.__value_.__r.__words[0];
  }
  else
  {
    v15 = (char *)v1 + v12;
    v16 = (std::string::size_type)v1;
  }
  if ((v12 & 0x80u) != 0)
    v12 = v1->__r_.__value_.__l.__size_;
  v17 = (std::string::size_type)v4 - v16;
  if (v12 < (unint64_t)v4 - v16)
    std::string::__throw_out_of_range[abi:ne180100]();
  if (v15 - (char *)v4 == -1)
  {
    if (v13 < 0)
    {
      v1->__r_.__value_.__l.__size_ = v17;
      v1 = v14;
    }
    else
    {
      *((_BYTE *)&v1->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
    v1->__r_.__value_.__s.__data_[v17] = 0;
  }
  else
  {
    std::string::__erase_external_with_move(v1, v17, v15 - (char *)v4);
  }
}

uint64_t util::convert_garbage(uint64_t result)
{
  int v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;

  v1 = *(char *)(result + 23);
  if (v1 >= 0)
    v2 = (_BYTE *)result;
  else
    v2 = *(_BYTE **)result;
  if (v1 >= 0)
    v3 = *(unsigned __int8 *)(result + 23);
  else
    v3 = *(_QWORD *)(result + 8);
  if (v3)
  {
    v4 = MEMORY[0x24BDAC740];
    do
    {
      v5 = (char)*v2;
      if ((v5 & 0x80000000) != 0)
      {
        result = __maskrune((char)*v2, 0x40000uLL);
        if ((_DWORD)result)
          goto LABEL_10;
        result = __maskrune(v5, 0x4000uLL);
        if ((_DWORD)result)
          goto LABEL_10;
      }
      else
      {
        v6 = *(_DWORD *)(v4 + 4 * v5 + 60);
        if ((v6 & 0x40000) != 0)
          goto LABEL_10;
        result = v6 & 0x4000;
        if ((v6 & 0x4000) != 0)
          goto LABEL_10;
      }
      *v2 = 32;
LABEL_10:
      ++v2;
      --v3;
    }
    while (v3);
  }
  return result;
}

void util::strip_pattern(char *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  int v5;
  int v6;
  std::string *v7;
  std::string *v8;
  int64_t v9;
  std::string::size_type v10;
  char *v11;
  uint64_t size;
  std::string::size_type v13;
  std::string::size_type v14;
  int v15;
  std::string *v16;
  int v17;
  char *v18;
  int64_t v19;
  int64_t v20;
  char *v21;
  int v22;
  std::string *v23;
  int64_t v24;
  char *v25;
  char *v26;
  char *v27;
  int v28;
  std::string *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  std::string::size_type v33;
  int v34;
  std::string *v35;
  int v36;
  char *v37;
  int64_t v38;
  int64_t v39;
  char *v40;
  int v41;
  std::string *v42;
  int64_t v43;
  char *v44;
  char *v45;

  memset(a3, 170, sizeof(std::string));
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
  v5 = a1[23];
  v6 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
  v7 = (std::string *)a3->__r_.__value_.__r.__words[0];
  if (v6 >= 0)
    v8 = a3;
  else
    v8 = (std::string *)a3->__r_.__value_.__r.__words[0];
  if (v5 >= 0)
    v9 = a1[23];
  else
    v9 = *((_QWORD *)a1 + 1);
  v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if (v5 >= 0)
    v11 = a1;
  else
    v11 = *(char **)a1;
  if (!v9)
  {
    v13 = 0;
    goto LABEL_20;
  }
  if (v6 >= 0)
    size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  else
    size = a3->__r_.__value_.__l.__size_;
  if (size >= v9)
  {
    v27 = (char *)v8 + size;
    v28 = *v11;
    v29 = v8;
    do
    {
      v30 = size - v9;
      if (v30 == -1)
        break;
      v31 = (char *)memchr(v29, v28, v30 + 1);
      if (!v31)
        break;
      v32 = v31;
      if (!memcmp(v31, v11, v9))
      {
        if (v32 != v27)
        {
          v13 = v32 - (char *)v8;
          if (v32 - (char *)v8 != -1)
          {
            if (v9 == -1)
            {
              while (1)
              {
                v33 = a3->__r_.__value_.__l.__size_;
                if ((v10 & 0x80u) == 0)
                  v33 = v10;
                if (v33 < v13)
                  break;
                if ((char)v10 < 0)
                {
                  a3->__r_.__value_.__l.__size_ = v13;
                }
                else
                {
                  *((_BYTE *)&a3->__r_.__value_.__s + 23) = v13 & 0x7F;
                  v7 = a3;
                }
                v7->__r_.__value_.__s.__data_[v13] = 0;
                v34 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
                v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                v7 = (std::string *)a3->__r_.__value_.__r.__words[0];
                if (v34 >= 0)
                  v35 = a3;
                else
                  v35 = (std::string *)a3->__r_.__value_.__r.__words[0];
                v36 = a1[23];
                if (v36 >= 0)
                  v37 = a1;
                else
                  v37 = *(char **)a1;
                if (v36 >= 0)
                  v38 = a1[23];
                else
                  v38 = *((_QWORD *)a1 + 1);
                if (v38)
                {
                  if (v34 >= 0)
                    v39 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                  else
                    v39 = a3->__r_.__value_.__l.__size_;
                  if (v39 < v38)
                    return;
                  v40 = (char *)v35 + v39;
                  v41 = *v37;
                  v42 = v35;
                  while (1)
                  {
                    v43 = v39 - v38;
                    if (v43 == -1)
                      return;
                    v44 = (char *)memchr(v42, v41, v43 + 1);
                    if (!v44)
                      return;
                    v45 = v44;
                    if (!memcmp(v44, v37, v38))
                      break;
                    v42 = (std::string *)(v45 + 1);
                    v39 = v40 - (v45 + 1);
                    if (v39 < v38)
                      return;
                  }
                  if (v45 == v40)
                    return;
                  v13 = v45 - (char *)v35;
                  if (v45 - (char *)v35 == -1)
                    return;
                }
                else
                {
                  v13 = 0;
                }
              }
            }
            else
            {
LABEL_20:
              while (1)
              {
                v14 = (v10 & 0x80u) == 0 ? v10 : a3->__r_.__value_.__l.__size_;
                if (v14 < v13)
                  break;
                std::string::__erase_external_with_move(a3, v13, v9);
                v15 = SHIBYTE(a3->__r_.__value_.__r.__words[2]);
                v10 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                if (v15 >= 0)
                  v16 = a3;
                else
                  v16 = (std::string *)a3->__r_.__value_.__r.__words[0];
                v17 = a1[23];
                if (v17 >= 0)
                  v18 = a1;
                else
                  v18 = *(char **)a1;
                if (v17 >= 0)
                  v19 = a1[23];
                else
                  v19 = *((_QWORD *)a1 + 1);
                if (v19)
                {
                  if (v15 >= 0)
                    v20 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
                  else
                    v20 = a3->__r_.__value_.__l.__size_;
                  if (v20 < v19)
                    return;
                  v21 = (char *)v16 + v20;
                  v22 = *v18;
                  v23 = v16;
                  while (1)
                  {
                    v24 = v20 - v19;
                    if (v24 == -1)
                      return;
                    v25 = (char *)memchr(v23, v22, v24 + 1);
                    if (!v25)
                      return;
                    v26 = v25;
                    if (!memcmp(v25, v18, v19))
                      break;
                    v23 = (std::string *)(v26 + 1);
                    v20 = v21 - (v26 + 1);
                    if (v20 < v19)
                      return;
                  }
                  if (v26 == v21)
                    return;
                  v13 = v26 - (char *)v16;
                  if (v26 - (char *)v16 == -1)
                    return;
                }
                else
                {
                  v13 = 0;
                }
              }
            }
            std::string::__throw_out_of_range[abi:ne180100]();
          }
        }
        return;
      }
      v29 = (std::string *)(v32 + 1);
      size = v27 - (v32 + 1);
    }
    while (size >= v9);
  }
}

void sub_24B83A8CC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *util::strip_leading_trailing@<X0>(_QWORD *result@<X0>, void **a2@<X1>, _QWORD *a3@<X8>)
{
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  void *v10;
  size_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = *((unsigned __int8 *)result + 23);
  v5 = (_QWORD *)*result;
  v6 = result[1];
  if ((v4 & 0x80u) == 0)
    v7 = result;
  else
    v7 = (_QWORD *)*result;
  if ((v4 & 0x80u) == 0)
    v8 = *((unsigned __int8 *)result + 23);
  else
    v8 = result[1];
  v9 = *((char *)a2 + 23);
  if (v9 >= 0)
    v10 = a2;
  else
    v10 = *a2;
  if (v9 >= 0)
    v11 = *((unsigned __int8 *)a2 + 23);
  else
    v11 = (size_t)a2[1];
  if (!v8)
    goto LABEL_26;
  v12 = result;
  v13 = 0;
  if (!v11)
  {
    v14 = v8 - 1;
    if ((v4 & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
  while (1)
  {
    result = memchr(v10, *((char *)v7 + v13), v11);
    if (!result)
      break;
    if (v8 == ++v13)
      goto LABEL_26;
  }
  if (v13 == -1)
  {
LABEL_26:
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return result;
  }
  do
  {
    if (!v8)
    {
      v14 = -1;
      if ((v4 & 0x80) == 0)
        goto LABEL_28;
LABEL_24:
      if (v6 >= v13)
      {
        v4 = v6;
        v12 = v5;
        goto LABEL_29;
      }
LABEL_41:
      std::string::__throw_out_of_range[abi:ne180100]();
    }
    result = memchr(v10, *((char *)v7 + --v8), v11);
  }
  while (result);
  v14 = v8;
  if ((v4 & 0x80) != 0)
    goto LABEL_24;
LABEL_28:
  if (v13 > v4)
    goto LABEL_41;
LABEL_29:
  v15 = v14 - v13 + 1;
  if (v4 - v13 >= v15)
    v16 = v15;
  else
    v16 = v4 - v13;
  if (v16 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v16 >= 0x17)
  {
    v17 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v17 = v16 | 7;
    v18 = v17 + 1;
    v19 = operator new(v17 + 1);
    a3[1] = v16;
    a3[2] = v18 | 0x8000000000000000;
    *a3 = v19;
    a3 = v19;
    goto LABEL_39;
  }
  *((_BYTE *)a3 + 23) = v16;
  if (v16)
LABEL_39:
    result = memmove(a3, (char *)v12 + v13, v16);
  *((_BYTE *)a3 + v16) = 0;
  return result;
}

uint64_t util::to_upper(uint64_t result)
{
  uint64_t v1;
  int v2;
  _BYTE *v3;
  _BYTE *v4;
  _BYTE *v5;

  v1 = *(unsigned __int8 *)(result + 23);
  v2 = (char)v1;
  v3 = (_BYTE *)(result + v1);
  if (v2 >= 0)
    v4 = v3;
  else
    v4 = (_BYTE *)(*(_QWORD *)result + *(_QWORD *)(result + 8));
  if (v2 >= 0)
    v5 = (_BYTE *)result;
  else
    v5 = *(_BYTE **)result;
  for (; v5 != v4; ++v5)
  {
    result = __toupper((char)*v5);
    *v5 = result;
  }
  return result;
}

BOOL util::equal_nocase(const char *a1, const char *a2)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (a2[23] < 0)
    a2 = *(const char **)a2;
  return strcasecmp(a1, a2) == 0;
}

void util::strip_non_alpha(std::string *a1)
{
  std::string::size_type size;
  char *v3;
  char *v4;
  std::string::size_type v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  std::string::size_type v12;
  char *v13;
  std::string *v14;
  std::string::size_type v15;

  size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) == 0)
    v3 = (char *)a1;
  else
    v3 = (char *)a1->__r_.__value_.__r.__words[0];
  if ((size & 0x80u) != 0)
    size = a1->__r_.__value_.__l.__size_;
  if (!size)
    goto LABEL_21;
  v4 = &v3[size];
  v5 = size - 1;
  v6 = MEMORY[0x24BDAC740];
  while (1)
  {
    v7 = *v3;
    if ((v7 & 0x80000000) != 0)
    {
      if (!__maskrune(v7, 0x100uLL))
        break;
      goto LABEL_9;
    }
    if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x100) == 0)
      break;
LABEL_9:
    ++v3;
    --v5;
    if (v3 == v4)
      goto LABEL_22;
  }
  if (v3 != v4 && v3 + 1 != v4)
  {
    v8 = 1;
    v4 = v3;
    while (1)
    {
      v9 = v3[v8];
      if ((v9 & 0x80000000) == 0)
        break;
      if (__maskrune(v9, 0x100uLL))
        goto LABEL_16;
LABEL_17:
      ++v8;
      if (!--v5)
        goto LABEL_22;
    }
    if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x100) == 0)
      goto LABEL_17;
LABEL_16:
    *v4++ = v3[v8];
    goto LABEL_17;
  }
LABEL_21:
  v4 = v3;
LABEL_22:
  v10 = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  v11 = (char)v10;
  v12 = a1->__r_.__value_.__r.__words[0];
  v13 = (char *)(a1->__r_.__value_.__r.__words[0] + a1->__r_.__value_.__l.__size_);
  if ((v10 & 0x80u) != 0)
  {
    v14 = (std::string *)a1->__r_.__value_.__r.__words[0];
  }
  else
  {
    v13 = (char *)a1 + v10;
    v14 = a1;
  }
  if ((v10 & 0x80u) != 0)
    v10 = a1->__r_.__value_.__l.__size_;
  v15 = v4 - (char *)v14;
  if (v10 < v4 - (char *)v14)
    std::string::__throw_out_of_range[abi:ne180100]();
  if (v13 - v4 == -1)
  {
    if (v11 < 0)
    {
      a1->__r_.__value_.__l.__size_ = v15;
      *(_BYTE *)(v12 + v15) = 0;
    }
    else
    {
      *((_BYTE *)&a1->__r_.__value_.__s + 23) = v15 & 0x7F;
      a1->__r_.__value_.__s.__data_[v15] = 0;
    }
  }
  else
  {
    std::string::__erase_external_with_move(a1, v15, v13 - v4);
  }
}

void util::readPlistToCFDictionary(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v2;
  const __CFAllocator *v4;
  __CFError *v5;
  __CFError *v6;
  uint64_t (*v7)(uint64_t);
  __CFError *v8;
  __CFReadStream *v9;
  uint64_t (*v10)(uint64_t);
  CFPropertyListRef v11;
  unsigned __int8 v12;
  NSObject *v13;
  CFIndex Code;
  void **v15;
  void *__p[2];
  uint64_t v17;
  CFErrorRef error[4];
  uint8_t buf[24];
  void **v20;
  uint64_t v21;

  v2 = (const char *)a1;
  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (*(char *)(a1 + 23) < 0)
    v2 = *(const char **)a1;
  v5 = (__CFError *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v2, 0x8000100u);
  error[3] = v5;
  v6 = CFURLCreateWithFileSystemPath(v4, (CFStringRef)v5, kCFURLPOSIXPathStyle, 0);
  error[2] = v6;
  *a2 = 0;
  v7 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get;
  if (!v6)
    v7 = 0;
  if (!v7)
    goto LABEL_18;
  v8 = CFReadStreamCreateWithFile(v4, v6);
  v9 = v8;
  error[1] = v8;
  v10 = ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get;
  if (!v8)
    v10 = 0;
  if (!v10
    || (CFReadStreamOpen(v8),
        error[0] = 0,
        v11 = CFPropertyListCreateWithStream(v4, v9, 0, 1uLL, 0, error),
        *a2 = v11,
        CFReadStreamClose(v9),
        !error[0]))
  {
LABEL_16:
    if (!v9)
      goto LABEL_18;
    goto LABEL_17;
  }
  CFErrorGetDomain(error[0]);
  memset(buf, 0, sizeof(buf));
  ctu::cf::assign();
  *(_OWORD *)__p = *(_OWORD *)buf;
  v17 = *(_QWORD *)&buf[16];
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2579B8240 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v13 = qword_2579B8240;
    if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
LABEL_26:
    Code = CFErrorGetCode(error[0]);
    v15 = __p;
    if (v17 < 0)
      v15 = (void **)__p[0];
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = Code;
    *(_WORD *)&buf[22] = 2080;
    v20 = v15;
    _os_log_error_impl(&dword_24B825000, v13, OS_LOG_TYPE_ERROR, "Failed to create %@ PropertyList: %ld: %s", buf, 0x20u);
    goto LABEL_13;
  }
  v13 = qword_2579B8240;
  if (os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
    goto LABEL_26;
LABEL_13:
  CFRelease(error[0]);
  *a2 = 0;
  if (v11)
    CFRelease(v11);
  if ((SHIBYTE(v17) & 0x80000000) == 0)
    goto LABEL_16;
  operator delete(__p[0]);
  if (v9)
LABEL_17:
    CFRelease(v9);
LABEL_18:
  if (v6)
    CFRelease(v6);
  if (v5)
    CFRelease(v5);
}

void sub_24B83AF50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ctu::SharedRef<__CFReadStream,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFReadStream>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const void **ctu::cf::CFSharedRef<__CFReadStream>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void util::moveDirContent(const void **a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5)
{
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  int filtered_files;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char *v15;
  __int128 v16;
  int v17;
  size_t v18;
  unint64_t v19;
  std::string *p_dst;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  std::string *v24;
  std::string::size_type size;
  std::string *v26;
  __int128 v27;
  int is_directory;
  int v29;
  size_t v30;
  unint64_t v31;
  std::string *v32;
  unsigned __int8 v33;
  NSObject *v34;
  int v35;
  size_t v36;
  unint64_t v37;
  std::string *v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  std::string *v42;
  std::string::size_type v43;
  std::string *v44;
  __int128 v45;
  std::string *v46;
  __int128 v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const void *v56;
  std::string *v57;
  std::string::size_type v58;
  std::string *v59;
  __int128 v60;
  std::string *p_p;
  unsigned __int8 v62;
  NSObject *v63;
  void **v64;
  void **v65;
  char *v66;
  __int128 v67;
  int v68;
  size_t v69;
  unint64_t v70;
  std::string *p_buf;
  uint64_t v72;
  uint64_t v73;
  const void *v74;
  std::string *v75;
  std::string::size_type v76;
  std::string *v77;
  __int128 v78;
  int v79;
  size_t v80;
  unint64_t v81;
  std::string *v82;
  uint64_t v83;
  uint64_t v84;
  const void *v85;
  std::string *v86;
  std::string::size_type v87;
  std::string *v88;
  __int128 v89;
  char v90;
  unsigned __int8 v91;
  NSObject *v92;
  int v93;
  size_t v94;
  unint64_t v95;
  std::string *v96;
  NSObject *v97;
  int v98;
  size_t v99;
  unint64_t v100;
  std::string *v101;
  uint64_t v102;
  uint64_t v103;
  const void *v104;
  std::string *v105;
  std::string::size_type v106;
  std::string *v107;
  __int128 v108;
  std::string *v109;
  std::string *v110;
  uint64_t v111;
  uint64_t v112;
  const void *v113;
  std::string *v114;
  std::string::size_type v115;
  std::string *v116;
  __int128 v117;
  std::string *v118;
  std::string *v119;
  std::string::size_type v120;
  int v121;
  char *v124;
  std::locale v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  std::__shared_weak_count *v129;
  uint64_t v130;
  std::string v131;
  void *v132[2];
  std::string::size_type v133;
  std::string __dst;
  std::string __p;
  std::locale v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  std::__shared_weak_count *v140;
  uint64_t v141;
  char *v142;
  void **v143;
  uint64_t v144;
  uint8_t v145[4];
  std::string *v146;
  __int16 v147;
  std::string *v148;
  std::string buf;
  std::string v150;
  uint64_t v151;

  v151 = *MEMORY[0x24BDAC8D0];
  v142 = 0;
  v143 = 0;
  v144 = 0;
  std::locale::locale(&v136, (const std::locale *)a5);
  v137 = *(_OWORD *)(a5 + 8);
  v138 = *(_OWORD *)(a5 + 24);
  v8 = *(std::__shared_weak_count **)(a5 + 48);
  v139 = *(_QWORD *)(a5 + 40);
  v140 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v141 = *(_QWORD *)(a5 + 56);
  filtered_files = ctu::fs::get_filtered_files();
  v12 = v140;
  if (!v140)
    goto LABEL_8;
  v13 = (unint64_t *)&v140->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    std::locale::~locale(&v136);
    if (filtered_files)
    {
LABEL_9:
      v15 = v142;
      v124 = (char *)v143;
      if (v142 != (char *)v143)
      {
        if (a4)
        {
          while (1)
          {
            memset(&v150, 170, sizeof(v150));
            if (v15[23] < 0)
            {
              std::string::__init_copy_ctor_external(&v150, *(const std::string::value_type **)v15, *((_QWORD *)v15 + 1));
            }
            else
            {
              v16 = *(_OWORD *)v15;
              v150.__r_.__value_.__r.__words[2] = *((_QWORD *)v15 + 2);
              *(_OWORD *)&v150.__r_.__value_.__l.__data_ = v16;
            }
            v17 = *((char *)a1 + 23);
            if (v17 >= 0)
              v18 = *((unsigned __int8 *)a1 + 23);
            else
              v18 = (size_t)a1[1];
            v19 = v18 + 1;
            memset(&__dst, 170, sizeof(__dst));
            if (v18 + 1 > 0x7FFFFFFFFFFFFFF7)
              std::string::__throw_length_error[abi:ne180100]();
            if (v19 >= 0x17)
            {
              v21 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v19 | 7) != 0x17)
                v21 = v19 | 7;
              v22 = v21 + 1;
              p_dst = (std::string *)operator new(v21 + 1);
              __dst.__r_.__value_.__l.__size_ = v18 + 1;
              __dst.__r_.__value_.__r.__words[2] = v22 | 0x8000000000000000;
              __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
            }
            else
            {
              memset(&__dst, 0, sizeof(__dst));
              p_dst = &__dst;
              *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v18 + 1;
              if (!v18)
                goto LABEL_30;
            }
            if (v17 >= 0)
              v23 = a1;
            else
              v23 = *a1;
            memmove(p_dst, v23, v18);
LABEL_30:
            *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v18) = 47;
            if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v24 = &v150;
            else
              v24 = (std::string *)v150.__r_.__value_.__r.__words[0];
            if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(v150.__r_.__value_.__r.__words[2]);
            else
              size = v150.__r_.__value_.__l.__size_;
            v26 = std::string::append(&__dst, (const std::string::value_type *)v24, size);
            v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
            __p.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v27;
            v26->__r_.__value_.__l.__size_ = 0;
            v26->__r_.__value_.__r.__words[2] = 0;
            v26->__r_.__value_.__r.__words[0] = 0;
            is_directory = ctu::fs::is_directory();
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(__p.__r_.__value_.__l.__data_);
              if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_38:
                if (is_directory)
                  goto LABEL_39;
                goto LABEL_48;
              }
            }
            else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
              goto LABEL_38;
            }
            operator delete(__dst.__r_.__value_.__l.__data_);
            if (is_directory)
            {
LABEL_39:
              v29 = *((char *)a1 + 23);
              if (v29 >= 0)
                v30 = *((unsigned __int8 *)a1 + 23);
              else
                v30 = (size_t)a1[1];
              v31 = v30 + 1;
              memset(&__dst, 170, sizeof(__dst));
              if (v30 + 1 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              if (v31 >= 0x17)
              {
                v39 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v31 | 7) != 0x17)
                  v39 = v31 | 7;
                v40 = v39 + 1;
                v32 = (std::string *)operator new(v39 + 1);
                __dst.__r_.__value_.__l.__size_ = v30 + 1;
                __dst.__r_.__value_.__r.__words[2] = v40 | 0x8000000000000000;
                __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
              }
              else
              {
                memset(&__dst, 0, sizeof(__dst));
                v32 = &__dst;
                *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v30 + 1;
                if (!v30)
                  goto LABEL_65;
              }
              if (v29 >= 0)
                v41 = a1;
              else
                v41 = *a1;
              memmove(v32, v41, v30);
LABEL_65:
              *(_WORD *)((char *)&v32->__r_.__value_.__l.__data_ + v30) = 47;
              if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v42 = &v150;
              else
                v42 = (std::string *)v150.__r_.__value_.__r.__words[0];
              if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v43 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
              else
                v43 = v150.__r_.__value_.__l.__size_;
              v44 = std::string::append(&__dst, (const std::string::value_type *)v42, v43);
              v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
              __p.__r_.__value_.__r.__words[2] = v44->__r_.__value_.__r.__words[2];
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v45;
              v44->__r_.__value_.__l.__size_ = 0;
              v44->__r_.__value_.__r.__words[2] = 0;
              v44->__r_.__value_.__r.__words[0] = 0;
              v46 = std::string::append(&__p, "/", 1uLL);
              v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
              v133 = v46->__r_.__value_.__r.__words[2];
              *(_OWORD *)v132 = v47;
              v46->__r_.__value_.__l.__size_ = 0;
              v46->__r_.__value_.__r.__words[2] = 0;
              v46->__r_.__value_.__r.__words[0] = 0;
              if (*(char *)(a2 + 23) < 0)
                std::string::__init_copy_ctor_external(&v131, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
              else
                v131 = *(std::string *)a2;
              std::locale::locale(&v125, (const std::locale *)a5);
              v126 = *(_OWORD *)(a5 + 8);
              v127 = *(_OWORD *)(a5 + 24);
              v48 = *(std::__shared_weak_count **)(a5 + 48);
              v128 = *(_QWORD *)(a5 + 40);
              v129 = v48;
              if (v48)
              {
                v49 = (unint64_t *)&v48->__shared_owners_;
                do
                  v50 = __ldxr(v49);
                while (__stxr(v50 + 1, v49));
              }
              v130 = *(_QWORD *)(a5 + 56);
              util::moveDirContent(v132, &v131, a3, (a4 - 1), &v125);
              v51 = v129;
              if (!v129)
                goto LABEL_81;
              v52 = (unint64_t *)&v129->__shared_owners_;
              do
                v53 = __ldaxr(v52);
              while (__stlxr(v53 - 1, v52));
              if (!v53)
              {
                ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
                std::__shared_weak_count::__release_weak(v51);
                std::locale::~locale(&v125);
                if ((SHIBYTE(v131.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_82;
              }
              else
              {
LABEL_81:
                std::locale::~locale(&v125);
                if ((SHIBYTE(v131.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_82:
                  if ((SHIBYTE(v133) & 0x80000000) == 0)
                    goto LABEL_83;
LABEL_88:
                  operator delete(v132[0]);
                  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    goto LABEL_84;
                  goto LABEL_89;
                }
              }
              operator delete(v131.__r_.__value_.__l.__data_);
              if ((SHIBYTE(v133) & 0x80000000) == 0)
              {
LABEL_83:
                if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_84;
                goto LABEL_89;
              }
              goto LABEL_88;
            }
LABEL_48:
            {
              GetOsLogContext(void)::sOsLogContext = 0;
              qword_2579B8240 = 0;
              __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
            }
            if (GetOsLogContext(void)::onceToken == -1)
            {
              v34 = qword_2579B8240;
              if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
                goto LABEL_91;
            }
            else
            {
              dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
              v34 = qword_2579B8240;
              if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
                goto LABEL_91;
            }
            v35 = *((char *)a1 + 23);
            if (v35 >= 0)
              v36 = *((unsigned __int8 *)a1 + 23);
            else
              v36 = (size_t)a1[1];
            v37 = v36 + 1;
            memset(&__dst, 170, sizeof(__dst));
            if (v36 + 1 > 0x7FFFFFFFFFFFFFF7)
              std::string::__throw_length_error[abi:ne180100]();
            if (v37 >= 0x17)
            {
              v121 = v35;
              v54 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v37 | 7) != 0x17)
                v54 = v37 | 7;
              v55 = v54 + 1;
              v38 = (std::string *)operator new(v54 + 1);
              __dst.__r_.__value_.__l.__size_ = v36 + 1;
              __dst.__r_.__value_.__r.__words[2] = v55 | 0x8000000000000000;
              __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v38;
              v35 = v121;
            }
            else
            {
              memset(&__dst, 0, sizeof(__dst));
              v38 = &__dst;
              *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v36 + 1;
              if (!v36)
                goto LABEL_100;
            }
            if (v35 >= 0)
              v56 = a1;
            else
              v56 = *a1;
            memmove(v38, v56, v36);
LABEL_100:
            *(_WORD *)((char *)&v38->__r_.__value_.__l.__data_ + v36) = 47;
            if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v57 = &v150;
            else
              v57 = (std::string *)v150.__r_.__value_.__r.__words[0];
            if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v58 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
            else
              v58 = v150.__r_.__value_.__l.__size_;
            v59 = std::string::append(&__dst, (const std::string::value_type *)v57, v58);
            v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
            __p.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v60;
            v59->__r_.__value_.__l.__size_ = 0;
            v59->__r_.__value_.__r.__words[2] = 0;
            v59->__r_.__value_.__r.__words[0] = 0;
            p_p = &__p;
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = a4;
            _os_log_error_impl(&dword_24B825000, v34, OS_LOG_TYPE_ERROR, "%s is not a directory. So, skip to move it with the depth (%d)", (uint8_t *)&buf, 0x12u);
            if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_84:
              if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
                goto LABEL_90;
              goto LABEL_91;
            }
LABEL_89:
            operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
LABEL_90:
              operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_91:
            if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v150.__r_.__value_.__l.__data_);
            v15 += 24;
            if (v15 == v124)
              goto LABEL_118;
          }
        }
        while (1)
        {
          memset(&v150, 170, sizeof(v150));
          if (v15[23] < 0)
          {
            std::string::__init_copy_ctor_external(&v150, *(const std::string::value_type **)v15, *((_QWORD *)v15 + 1));
          }
          else
          {
            v67 = *(_OWORD *)v15;
            v150.__r_.__value_.__r.__words[2] = *((_QWORD *)v15 + 2);
            *(_OWORD *)&v150.__r_.__value_.__l.__data_ = v67;
          }
          memset(&__p, 170, sizeof(__p));
          v68 = *(char *)(a2 + 23);
          if (v68 >= 0)
            v69 = *(unsigned __int8 *)(a2 + 23);
          else
            v69 = *(_QWORD *)(a2 + 8);
          v70 = v69 + 1;
          memset(&buf, 170, sizeof(buf));
          if (v69 + 1 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v70 >= 0x17)
          {
            v72 = (v70 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v70 | 7) != 0x17)
              v72 = v70 | 7;
            v73 = v72 + 1;
            p_buf = (std::string *)operator new(v72 + 1);
            buf.__r_.__value_.__l.__size_ = v69 + 1;
            buf.__r_.__value_.__r.__words[2] = v73 | 0x8000000000000000;
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)p_buf;
          }
          else
          {
            memset(&buf, 0, sizeof(buf));
            p_buf = &buf;
            *((_BYTE *)&buf.__r_.__value_.__s + 23) = v69 + 1;
            if (!v69)
              goto LABEL_148;
          }
          if (v68 >= 0)
            v74 = (const void *)a2;
          else
            v74 = *(const void **)a2;
          memmove(p_buf, v74, v69);
LABEL_148:
          *(_WORD *)((char *)&p_buf->__r_.__value_.__l.__data_ + v69) = 47;
          if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v75 = &v150;
          else
            v75 = (std::string *)v150.__r_.__value_.__r.__words[0];
          if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v76 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
          else
            v76 = v150.__r_.__value_.__l.__size_;
          v77 = std::string::append(&buf, (const std::string::value_type *)v75, v76);
          v78 = *(_OWORD *)&v77->__r_.__value_.__l.__data_;
          __dst.__r_.__value_.__r.__words[2] = v77->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v78;
          v77->__r_.__value_.__l.__size_ = 0;
          v77->__r_.__value_.__r.__words[2] = 0;
          v77->__r_.__value_.__r.__words[0] = 0;
          ctu::fs::get_unique_filename();
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__dst.__r_.__value_.__l.__data_);
            if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_156;
          }
          else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_156;
          }
          operator delete(buf.__r_.__value_.__l.__data_);
LABEL_156:
          v79 = *((char *)a1 + 23);
          if (v79 >= 0)
            v80 = *((unsigned __int8 *)a1 + 23);
          else
            v80 = (size_t)a1[1];
          v81 = v80 + 1;
          memset(&buf, 170, sizeof(buf));
          if (v80 + 1 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v81 >= 0x17)
          {
            v83 = (v81 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v81 | 7) != 0x17)
              v83 = v81 | 7;
            v84 = v83 + 1;
            v82 = (std::string *)operator new(v83 + 1);
            buf.__r_.__value_.__l.__size_ = v80 + 1;
            buf.__r_.__value_.__r.__words[2] = v84 | 0x8000000000000000;
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v82;
          }
          else
          {
            memset(&buf, 0, sizeof(buf));
            v82 = &buf;
            *((_BYTE *)&buf.__r_.__value_.__s + 23) = v80 + 1;
            if (!v80)
              goto LABEL_170;
          }
          if (v79 >= 0)
            v85 = a1;
          else
            v85 = *a1;
          memmove(v82, v85, v80);
LABEL_170:
          *(_WORD *)((char *)&v82->__r_.__value_.__l.__data_ + v80) = 47;
          if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v86 = &v150;
          else
            v86 = (std::string *)v150.__r_.__value_.__r.__words[0];
          if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v87 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
          else
            v87 = v150.__r_.__value_.__l.__size_;
          v88 = std::string::append(&buf, (const std::string::value_type *)v86, v87);
          v89 = *(_OWORD *)&v88->__r_.__value_.__l.__data_;
          __dst.__r_.__value_.__r.__words[2] = v88->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v89;
          v88->__r_.__value_.__l.__size_ = 0;
          v88->__r_.__value_.__r.__words[2] = 0;
          v88->__r_.__value_.__r.__words[0] = 0;
          v90 = ctu::fs::rename();
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__dst.__r_.__value_.__l.__data_);
            if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_178:
              if ((v90 & 1) == 0)
                goto LABEL_193;
              goto LABEL_179;
            }
          }
          else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_178;
          }
          operator delete(buf.__r_.__value_.__l.__data_);
          if ((v90 & 1) == 0)
          {
LABEL_193:
            {
              GetOsLogContext(void)::sOsLogContext = 0;
              qword_2579B8240 = 0;
              __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
            }
            if (GetOsLogContext(void)::onceToken == -1)
            {
              v97 = qword_2579B8240;
              if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
                goto LABEL_243;
LABEL_196:
              v98 = *((char *)a1 + 23);
              if (v98 >= 0)
                v99 = *((unsigned __int8 *)a1 + 23);
              else
                v99 = (size_t)a1[1];
              v100 = v99 + 1;
              memset(&buf, 170, sizeof(buf));
              if (v99 + 1 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              if (v100 >= 0x17)
              {
                v111 = (v100 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v100 | 7) != 0x17)
                  v111 = v100 | 7;
                v112 = v111 + 1;
                v101 = (std::string *)operator new(v111 + 1);
                buf.__r_.__value_.__l.__size_ = v99 + 1;
                buf.__r_.__value_.__r.__words[2] = v112 | 0x8000000000000000;
                buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v101;
              }
              else
              {
                memset(&buf, 0, sizeof(buf));
                v101 = &buf;
                *((_BYTE *)&buf.__r_.__value_.__s + 23) = v99 + 1;
                if (!v99)
                  goto LABEL_230;
              }
              if (v98 >= 0)
                v113 = a1;
              else
                v113 = *a1;
              memmove(v101, v113, v99);
LABEL_230:
              *(_WORD *)((char *)&v101->__r_.__value_.__l.__data_ + v99) = 47;
              if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v114 = &v150;
              else
                v114 = (std::string *)v150.__r_.__value_.__r.__words[0];
              if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v115 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
              else
                v115 = v150.__r_.__value_.__l.__size_;
              v116 = std::string::append(&buf, (const std::string::value_type *)v114, v115);
              v117 = *(_OWORD *)&v116->__r_.__value_.__l.__data_;
              __dst.__r_.__value_.__r.__words[2] = v116->__r_.__value_.__r.__words[2];
              *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v117;
              v116->__r_.__value_.__l.__size_ = 0;
              v116->__r_.__value_.__r.__words[2] = 0;
              v116->__r_.__value_.__r.__words[0] = 0;
              v118 = &__dst;
              if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v118 = (std::string *)__dst.__r_.__value_.__r.__words[0];
              v119 = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v119 = (std::string *)__p.__r_.__value_.__r.__words[0];
              *(_DWORD *)v145 = 136315394;
              v146 = v118;
              v147 = 2080;
              v148 = v119;
              _os_log_error_impl(&dword_24B825000, v97, OS_LOG_TYPE_ERROR, "Failed to move %s -> %s", v145, 0x16u);
              if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
              {
LABEL_241:
                operator delete(__dst.__r_.__value_.__l.__data_);
                if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_243;
                goto LABEL_242;
              }
LABEL_221:
              if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                goto LABEL_243;
LABEL_242:
              operator delete(buf.__r_.__value_.__l.__data_);
              goto LABEL_243;
            }
            dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
            v97 = qword_2579B8240;
            if (os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
              goto LABEL_196;
            goto LABEL_243;
          }
LABEL_179:
          {
            GetOsLogContext(void)::sOsLogContext = 0;
            qword_2579B8240 = 0;
            __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
          }
          if (GetOsLogContext(void)::onceToken == -1)
          {
            v92 = qword_2579B8240;
            if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_DEFAULT))
              goto LABEL_243;
LABEL_182:
            v93 = *((char *)a1 + 23);
            if (v93 >= 0)
              v94 = *((unsigned __int8 *)a1 + 23);
            else
              v94 = (size_t)a1[1];
            v95 = v94 + 1;
            memset(&buf, 170, sizeof(buf));
            if (v94 + 1 > 0x7FFFFFFFFFFFFFF7)
              std::string::__throw_length_error[abi:ne180100]();
            if (v95 >= 0x17)
            {
              v102 = (v95 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v95 | 7) != 0x17)
                v102 = v95 | 7;
              v103 = v102 + 1;
              v96 = (std::string *)operator new(v102 + 1);
              buf.__r_.__value_.__l.__size_ = v94 + 1;
              buf.__r_.__value_.__r.__words[2] = v103 | 0x8000000000000000;
              buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v96;
            }
            else
            {
              memset(&buf, 0, sizeof(buf));
              v96 = &buf;
              *((_BYTE *)&buf.__r_.__value_.__s + 23) = v94 + 1;
              if (!v94)
                goto LABEL_210;
            }
            if (v93 >= 0)
              v104 = a1;
            else
              v104 = *a1;
            memmove(v96, v104, v94);
LABEL_210:
            *(_WORD *)((char *)&v96->__r_.__value_.__l.__data_ + v94) = 47;
            if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v105 = &v150;
            else
              v105 = (std::string *)v150.__r_.__value_.__r.__words[0];
            if ((v150.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v106 = HIBYTE(v150.__r_.__value_.__r.__words[2]);
            else
              v106 = v150.__r_.__value_.__l.__size_;
            v107 = std::string::append(&buf, (const std::string::value_type *)v105, v106);
            v108 = *(_OWORD *)&v107->__r_.__value_.__l.__data_;
            __dst.__r_.__value_.__r.__words[2] = v107->__r_.__value_.__r.__words[2];
            *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v108;
            v107->__r_.__value_.__l.__size_ = 0;
            v107->__r_.__value_.__r.__words[2] = 0;
            v107->__r_.__value_.__r.__words[0] = 0;
            v109 = &__dst;
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v109 = (std::string *)__dst.__r_.__value_.__r.__words[0];
            v110 = &__p;
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v110 = (std::string *)__p.__r_.__value_.__r.__words[0];
            *(_DWORD *)v145 = 136315394;
            v146 = v109;
            v147 = 2080;
            v148 = v110;
            _os_log_impl(&dword_24B825000, v92, OS_LOG_TYPE_DEFAULT, "Moved %s -> %s", v145, 0x16u);
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_241;
            goto LABEL_221;
          }
          dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
          v92 = qword_2579B8240;
          if (os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_DEFAULT))
            goto LABEL_182;
LABEL_243:
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0)
LABEL_247:
              operator delete(v150.__r_.__value_.__l.__data_);
          }
          else if (SHIBYTE(v150.__r_.__value_.__r.__words[2]) < 0)
          {
            goto LABEL_247;
          }
          v15 += 24;
          if (v15 == v124)
            goto LABEL_118;
        }
      }
      goto LABEL_118;
    }
  }
  else
  {
LABEL_8:
    std::locale::~locale(&v136);
    if (filtered_files)
      goto LABEL_9;
  }
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2579B8240 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v63 = qword_2579B8240;
    if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
      goto LABEL_118;
  }
  else
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v63 = qword_2579B8240;
    if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
      goto LABEL_118;
  }
  v120 = (std::string::size_type)a1;
  if (*((char *)a1 + 23) < 0)
    v120 = (std::string::size_type)*a1;
  LODWORD(v150.__r_.__value_.__l.__data_) = 136315138;
  *(std::string::size_type *)((char *)v150.__r_.__value_.__r.__words + 4) = v120;
  _os_log_error_impl(&dword_24B825000, v63, OS_LOG_TYPE_ERROR, "Failed to find a content in %s", (uint8_t *)&v150, 0xCu);
LABEL_118:
  if (a3)
    ctu::fs::remove_dir();
  v64 = (void **)v142;
  if (v142)
  {
    v65 = v143;
    v66 = v142;
    if (v143 != (void **)v142)
    {
      do
      {
        if (*((char *)v65 - 1) < 0)
          operator delete(*(v65 - 3));
        v65 -= 3;
      }
      while (v65 != v64);
      v66 = v142;
    }
    v143 = v64;
    operator delete(v66);
  }
}

void sub_24B83C0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::locale a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,void *__p,uint64_t a53,int a54,__int16 a55,char a56,char a57,std::locale a58)
{
  uint64_t v58;

  if (a57 < 0)
    operator delete(__p);
  if (*(char *)(v58 - 105) < 0)
    operator delete(*(void **)(v58 - 128));
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v58 - 216));
  _Unwind_Resume(a1);
}

void util::generateSHA256(const char *a1@<X0>, void *a2@<X1>, unsigned int a3@<W2>, unsigned __int8 **a4@<X8>)
{
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  __int128 v10;
  const char *v11;
  int v12;
  unint64_t v13;
  ssize_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  const char *v17;
  uint8_t *p_c;
  NSObject *v19;
  uint32_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  int *v23;
  char *v24;
  int v25;
  int v26;
  unsigned __int8 v27;
  NSObject *v28;
  int *v29;
  char *v30;
  int v31;
  int v32;
  CC_SHA256_CTX c;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v8 = (unsigned __int8 *)operator new(0x20uLL);
  a4[1] = v8 + 32;
  a4[2] = v8 + 32;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *a4 = v8;
  if (!a2)
  {
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2579B8240 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v16 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
        return;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v16 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
        return;
    }
    LOWORD(c.count[0]) = 0;
    v17 = "dataIn Buffer is NULL";
    p_c = (uint8_t *)&c;
    v19 = v16;
    v20 = 2;
LABEL_20:
    _os_log_error_impl(&dword_24B825000, v19, OS_LOG_TYPE_ERROR, v17, p_c, v20);
    return;
  }
  v9 = v8;
  *(_QWORD *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v10;
  *(_OWORD *)&c.wbuf[10] = v10;
  *(_OWORD *)&c.hash[6] = v10;
  *(_OWORD *)&c.wbuf[2] = v10;
  *(_OWORD *)c.count = v10;
  *(_OWORD *)&c.hash[2] = v10;
  if (!ctu::fs::get_file_size())
    return;
  CC_SHA256_Init(&c);
  v11 = a1;
  if (a1[23] < 0)
    v11 = *(const char **)a1;
  v12 = open(v11, 0);
  if (v12 >= 1)
  {
    v13 = 0;
    while (1)
    {
      v14 = read(v12, a2, a3);
      if (v14 == -1)
        break;
      CC_SHA256_Update(&c, a2, v14);
      v13 += v14;
      if (v13 >= 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_24;
    }
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2579B8240 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v28 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        CC_SHA256_Final(v9, &c);
        close(v12);
        return;
      }
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v28 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
    }
    if (a1[23] < 0)
      a1 = *(const char **)a1;
    v29 = __error();
    v30 = strerror(*v29);
    v31 = *__error();
    v32 = *__error();
    *(_DWORD *)buf = 136315906;
    v35 = a1;
    v36 = 2080;
    v37 = v30;
    v38 = 1024;
    v39 = v31;
    v40 = 1024;
    v41 = v32;
    _os_log_error_impl(&dword_24B825000, v28, OS_LOG_TYPE_ERROR, "Failed to read: %s : %s (%d,0x%x)", buf, 0x22u);
    goto LABEL_24;
  }
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2579B8240 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v22 = qword_2579B8240;
    if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
      return;
    goto LABEL_17;
  }
  dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  v22 = qword_2579B8240;
  if (os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
  {
LABEL_17:
    if (a1[23] < 0)
      a1 = *(const char **)a1;
    v23 = __error();
    v24 = strerror(*v23);
    v25 = *__error();
    v26 = *__error();
    *(_DWORD *)buf = 136315906;
    v35 = a1;
    v36 = 2080;
    v37 = v24;
    v38 = 1024;
    v39 = v25;
    v40 = 1024;
    v41 = v26;
    v17 = "Failed to open: %s : %s (%d, 0x%x)";
    p_c = buf;
    v19 = v22;
    v20 = 34;
    goto LABEL_20;
  }
}

void sub_24B83C734(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_24B83C74C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_24B83C764(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_24B83C77C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_24B83C794(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

BOOL util::markPurgeableFile(uint64_t *a1)
{
  uint64_t *v1;
  int v2;
  int v3;
  int v4;
  unsigned __int8 v5;
  uint64_t v6;
  _BOOL8 result;
  int *v8;
  char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  int *v15;
  char *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t *v19;
  __int16 v20;
  _BYTE v21[14];
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v1 = a1;
  v24 = *MEMORY[0x24BDAC8D0];
  v17 = 65541;
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    v2 = open((const char *)a1, 0);
    if ((v2 & 0x80000000) == 0)
      goto LABEL_3;
LABEL_11:
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2579B8240 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v14 = qword_2579B8240;
      result = os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v14 = qword_2579B8240;
      result = os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
    }
    if (*((char *)v1 + 23) < 0)
      v1 = (uint64_t *)*v1;
    v15 = __error();
    v16 = strerror(*v15);
    *(_DWORD *)buf = 136315394;
    v19 = v1;
    v20 = 2080;
    *(_QWORD *)v21 = v16;
    v10 = "Failed to open %s : %s";
    v11 = v14;
    v12 = 22;
    goto LABEL_17;
  }
  v2 = open((const char *)*a1, 0);
  if (v2 < 0)
    goto LABEL_11;
LABEL_3:
  v3 = v2;
  v4 = ffsctl(v2, 0xC0084A44uLL, &v17, 0);
  close(v3);
  if (!v4)
    return 1;
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2579B8240 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v6 = qword_2579B8240;
    result = os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR);
    if (result)
    {
LABEL_7:
      if (*((char *)v1 + 23) < 0)
        v1 = (uint64_t *)*v1;
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 136315906;
      v19 = v1;
      v20 = 1024;
      *(_DWORD *)v21 = v4;
      *(_WORD *)&v21[4] = 2080;
      *(_QWORD *)&v21[6] = v9;
      v22 = 2048;
      v23 = v17;
      v10 = "Failed to mark %s as purgeable %d (%s) (flags 0x%llx)";
      v11 = v6;
      v12 = 38;
LABEL_17:
      _os_log_error_impl(&dword_24B825000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      return 0;
    }
  }
  else
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v6 = qword_2579B8240;
    result = os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR);
    if (result)
      goto LABEL_7;
  }
  return result;
}

BOOL util::checkLogFileAge(uint64_t a1, int64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  std::sub_match<const char *> *v6;
  std::sub_match<std::__wrap_iter<const char *>> *v7;
  int v8;
  int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  char *v16;
  __int128 *v17;
  _OWORD *v18;
  unint64_t v19;
  __int128 v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  _BYTE *v31;
  char *v32;
  __int128 *v33;
  _OWORD *v34;
  unint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  _BYTE *v43;
  _BYTE *v44;
  char *v45;
  __int128 *v46;
  _OWORD *v47;
  unint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  _BYTE *v56;
  _BYTE *v57;
  char *v58;
  __int128 *v59;
  _OWORD *v60;
  unint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  _BYTE *v69;
  _BYTE *v70;
  char *v71;
  __int128 *v72;
  _OWORD *v73;
  unint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  _BYTE *v82;
  _BYTE *v83;
  char *v84;
  __int128 *v85;
  _OWORD *v86;
  unint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  time_t v92;
  std::string v93;
  _BYTE v94[40];
  __int128 v95;
  uint64_t v96;
  unint64_t v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  tm __p;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v95 = 0xAAAAAAAAAAAAAAAALL;
  v97 = 0xAAAAAAAAAAAAAA00;
  v99 = v4;
  v96 = 0;
  v98 = 0uLL;
  LOBYTE(v99) = 0;
  BYTE8(v99) = 0;
  v100 = 0;
  memset(v94, 0, sizeof(v94));
  v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) == 0)
    v6 = (std::sub_match<const char *> *)a1;
  else
    v6 = *(std::sub_match<const char *> **)a1;
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a1 + 8);
  v7 = (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v6 + v5);
  v103 = 0xAAAAAAAAAAAAAA00;
  __p.tm_gmtoff = 0xAAAAAAAAAAAAAAAALL;
  v106 = v4;
  __p.tm_zone = 0;
  v102 = 0;
  v104 = 0;
  v105 = 0;
  LOBYTE(v106) = 0;
  BYTE8(v106) = 0;
  v107 = 0;
  memset(&__p, 0, 41);
  v8 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a3, v6, (std::sub_match<const char *> *)((char *)v6 + v5), (std::vector<std::csub_match> *)&__p, 4160);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)v94, (uint64_t)v6, v7, (uint64_t *)&__p.tm_sec, 0);
  if (*(_QWORD *)&__p.tm_sec)
  {
    *(_QWORD *)&__p.tm_hour = *(_QWORD *)&__p.tm_sec;
    operator delete(*(void **)&__p.tm_sec);
  }
  if ((_BYTE)v99)
    v9 = 0;
  else
    v9 = v8;
  if (v9 != 1)
  {
    v21 = 0;
    v22 = *(void **)v94;
    if (!*(_QWORD *)v94)
      return v21;
LABEL_23:
    *(_QWORD *)&v94[8] = v22;
    operator delete(v22);
    return v21;
  }
  memset(&__p, 0, sizeof(__p));
  v10 = *(_QWORD *)v94;
  if (!*(_BYTE *)(*(_QWORD *)v94 + 40))
  {
    memset(&v93, 0, sizeof(v93));
    goto LABEL_33;
  }
  v12 = *(_QWORD *)(*(_QWORD *)v94 + 24);
  v11 = *(char **)(*(_QWORD *)v94 + 32);
  v13 = (unint64_t)&v11[-v12];
  if ((unint64_t)&v11[-v12] > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v13 <= 0x16)
  {
    *((_BYTE *)&v93.__r_.__value_.__s + 23) = (_BYTE)v11 - v12;
    v14 = &v93;
    if ((char *)v12 != v11)
      goto LABEL_16;
LABEL_29:
    *v14 = 0;
    goto LABEL_33;
  }
  v24 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v13 | 7) != 0x17)
    v24 = v13 | 7;
  v25 = v24 + 1;
  v14 = operator new(v24 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v11[-v12];
  v93.__r_.__value_.__r.__words[2] = v25 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v14;
  if ((char *)v12 == v11)
    goto LABEL_29;
LABEL_16:
  if (v13 < 0x20 || (unint64_t)&v14[-v12] < 0x20)
  {
    v15 = v14;
    v16 = (char *)v12;
  }
  else
  {
    v15 = &v14[v13 & 0xFFFFFFFFFFFFFFE0];
    v16 = (char *)(v12 + (v13 & 0xFFFFFFFFFFFFFFE0));
    v17 = (__int128 *)(v12 + 16);
    v18 = v14 + 16;
    v19 = v13 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v20 = *v17;
      *(v18 - 1) = *(v17 - 1);
      *v18 = v20;
      v17 += 2;
      v18 += 2;
      v19 -= 32;
    }
    while (v19);
    if (v13 == (v13 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_32;
  }
  do
  {
    v26 = *v16++;
    *v15++ = v26;
  }
  while (v16 != v11);
LABEL_32:
  *v15 = 0;
LABEL_33:
  util::convert<int>(&v93, &__p.tm_year);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    __p.tm_year -= 1900;
    if (*(_BYTE *)(v10 + 64))
      goto LABEL_35;
LABEL_45:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_53;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  __p.tm_year -= 1900;
  if (!*(_BYTE *)(v10 + 64))
    goto LABEL_45;
LABEL_35:
  v28 = *(_QWORD *)(v10 + 48);
  v27 = *(char **)(v10 + 56);
  v29 = (unint64_t)&v27[-v28];
  if ((unint64_t)&v27[-v28] > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v29 <= 0x16)
  {
    *((_BYTE *)&v93.__r_.__value_.__s + 23) = (_BYTE)v27 - v28;
    v30 = &v93;
    if ((char *)v28 != v27)
      goto LABEL_38;
LABEL_49:
    *v30 = 0;
    goto LABEL_53;
  }
  v37 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v29 | 7) != 0x17)
    v37 = v29 | 7;
  v38 = v37 + 1;
  v30 = operator new(v37 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v27[-v28];
  v93.__r_.__value_.__r.__words[2] = v38 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
  if ((char *)v28 == v27)
    goto LABEL_49;
LABEL_38:
  if (v29 < 0x20 || (unint64_t)&v30[-v28] < 0x20)
  {
    v31 = v30;
    v32 = (char *)v28;
  }
  else
  {
    v31 = &v30[v29 & 0xFFFFFFFFFFFFFFE0];
    v32 = (char *)(v28 + (v29 & 0xFFFFFFFFFFFFFFE0));
    v33 = (__int128 *)(v28 + 16);
    v34 = v30 + 16;
    v35 = v29 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v36 = *v33;
      *(v34 - 1) = *(v33 - 1);
      *v34 = v36;
      v33 += 2;
      v34 += 2;
      v35 -= 32;
    }
    while (v35);
    if (v29 == (v29 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_52;
  }
  do
  {
    v39 = *v32++;
    *v31++ = v39;
  }
  while (v32 != v27);
LABEL_52:
  *v31 = 0;
LABEL_53:
  util::convert<int>(&v93, &__p.tm_mon);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    --__p.tm_mon;
    if (*(_BYTE *)(v10 + 88))
      goto LABEL_55;
LABEL_65:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_73;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  --__p.tm_mon;
  if (!*(_BYTE *)(v10 + 88))
    goto LABEL_65;
LABEL_55:
  v41 = *(_QWORD *)(v10 + 72);
  v40 = *(char **)(v10 + 80);
  v42 = (unint64_t)&v40[-v41];
  if ((unint64_t)&v40[-v41] > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v42 <= 0x16)
  {
    *((_BYTE *)&v93.__r_.__value_.__s + 23) = (_BYTE)v40 - v41;
    v43 = &v93;
    if ((char *)v41 != v40)
      goto LABEL_58;
LABEL_69:
    *v43 = 0;
    goto LABEL_73;
  }
  v50 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v42 | 7) != 0x17)
    v50 = v42 | 7;
  v51 = v50 + 1;
  v43 = operator new(v50 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v40[-v41];
  v93.__r_.__value_.__r.__words[2] = v51 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
  if ((char *)v41 == v40)
    goto LABEL_69;
LABEL_58:
  if (v42 < 0x20 || (unint64_t)&v43[-v41] < 0x20)
  {
    v44 = v43;
    v45 = (char *)v41;
  }
  else
  {
    v44 = &v43[v42 & 0xFFFFFFFFFFFFFFE0];
    v45 = (char *)(v41 + (v42 & 0xFFFFFFFFFFFFFFE0));
    v46 = (__int128 *)(v41 + 16);
    v47 = v43 + 16;
    v48 = v42 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v49 = *v46;
      *(v47 - 1) = *(v46 - 1);
      *v47 = v49;
      v46 += 2;
      v47 += 2;
      v48 -= 32;
    }
    while (v48);
    if (v42 == (v42 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_72;
  }
  do
  {
    v52 = *v45++;
    *v44++ = v52;
  }
  while (v45 != v40);
LABEL_72:
  *v44 = 0;
LABEL_73:
  util::convert<int>(&v93, (_DWORD *)((unint64_t)&__p | 0xC));
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(v10 + 112))
      goto LABEL_75;
LABEL_85:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_93;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(_BYTE *)(v10 + 112))
    goto LABEL_85;
LABEL_75:
  v54 = *(_QWORD *)(v10 + 96);
  v53 = *(char **)(v10 + 104);
  v55 = (unint64_t)&v53[-v54];
  if ((unint64_t)&v53[-v54] > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v55 <= 0x16)
  {
    *((_BYTE *)&v93.__r_.__value_.__s + 23) = (_BYTE)v53 - v54;
    v56 = &v93;
    if ((char *)v54 != v53)
      goto LABEL_78;
LABEL_89:
    *v56 = 0;
    goto LABEL_93;
  }
  v63 = (v55 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v55 | 7) != 0x17)
    v63 = v55 | 7;
  v64 = v63 + 1;
  v56 = operator new(v63 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v53[-v54];
  v93.__r_.__value_.__r.__words[2] = v64 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v56;
  if ((char *)v54 == v53)
    goto LABEL_89;
LABEL_78:
  if (v55 < 0x20 || (unint64_t)&v56[-v54] < 0x20)
  {
    v57 = v56;
    v58 = (char *)v54;
  }
  else
  {
    v57 = &v56[v55 & 0xFFFFFFFFFFFFFFE0];
    v58 = (char *)(v54 + (v55 & 0xFFFFFFFFFFFFFFE0));
    v59 = (__int128 *)(v54 + 16);
    v60 = v56 + 16;
    v61 = v55 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v62 = *v59;
      *(v60 - 1) = *(v59 - 1);
      *v60 = v62;
      v59 += 2;
      v60 += 2;
      v61 -= 32;
    }
    while (v61);
    if (v55 == (v55 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_92;
  }
  do
  {
    v65 = *v58++;
    *v57++ = v65;
  }
  while (v58 != v53);
LABEL_92:
  *v57 = 0;
LABEL_93:
  util::convert<int>(&v93, &__p.tm_hour);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(v10 + 136))
      goto LABEL_95;
LABEL_105:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_113;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(_BYTE *)(v10 + 136))
    goto LABEL_105;
LABEL_95:
  v67 = *(_QWORD *)(v10 + 120);
  v66 = *(char **)(v10 + 128);
  v68 = (unint64_t)&v66[-v67];
  if ((unint64_t)&v66[-v67] > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v68 <= 0x16)
  {
    *((_BYTE *)&v93.__r_.__value_.__s + 23) = (_BYTE)v66 - v67;
    v69 = &v93;
    if ((char *)v67 != v66)
      goto LABEL_98;
LABEL_109:
    *v69 = 0;
    goto LABEL_113;
  }
  v76 = (v68 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v68 | 7) != 0x17)
    v76 = v68 | 7;
  v77 = v76 + 1;
  v69 = operator new(v76 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v66[-v67];
  v93.__r_.__value_.__r.__words[2] = v77 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v69;
  if ((char *)v67 == v66)
    goto LABEL_109;
LABEL_98:
  if (v68 < 0x20 || (unint64_t)&v69[-v67] < 0x20)
  {
    v70 = v69;
    v71 = (char *)v67;
  }
  else
  {
    v70 = &v69[v68 & 0xFFFFFFFFFFFFFFE0];
    v71 = (char *)(v67 + (v68 & 0xFFFFFFFFFFFFFFE0));
    v72 = (__int128 *)(v67 + 16);
    v73 = v69 + 16;
    v74 = v68 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v75 = *v72;
      *(v73 - 1) = *(v72 - 1);
      *v73 = v75;
      v72 += 2;
      v73 += 2;
      v74 -= 32;
    }
    while (v74);
    if (v68 == (v68 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_112;
  }
  do
  {
    v78 = *v71++;
    *v70++ = v78;
  }
  while (v71 != v66);
LABEL_112:
  *v70 = 0;
LABEL_113:
  util::convert<int>(&v93, &__p.tm_min);
  if ((SHIBYTE(v93.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(v10 + 160))
      goto LABEL_115;
LABEL_125:
    memset(&v93, 0, sizeof(v93));
    goto LABEL_133;
  }
  operator delete(v93.__r_.__value_.__l.__data_);
  if (!*(_BYTE *)(v10 + 160))
    goto LABEL_125;
LABEL_115:
  v80 = *(_QWORD *)(v10 + 144);
  v79 = *(char **)(v10 + 152);
  v81 = (unint64_t)&v79[-v80];
  if ((unint64_t)&v79[-v80] > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v81 <= 0x16)
  {
    *((_BYTE *)&v93.__r_.__value_.__s + 23) = (_BYTE)v79 - v80;
    v82 = &v93;
    if ((char *)v80 != v79)
      goto LABEL_118;
LABEL_129:
    *v82 = 0;
    goto LABEL_133;
  }
  v89 = (v81 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v81 | 7) != 0x17)
    v89 = v81 | 7;
  v90 = v89 + 1;
  v82 = operator new(v89 + 1);
  v93.__r_.__value_.__l.__size_ = (std::string::size_type)&v79[-v80];
  v93.__r_.__value_.__r.__words[2] = v90 | 0x8000000000000000;
  v93.__r_.__value_.__r.__words[0] = (std::string::size_type)v82;
  if ((char *)v80 == v79)
    goto LABEL_129;
LABEL_118:
  if (v81 < 0x20 || (unint64_t)&v82[-v80] < 0x20)
  {
    v83 = v82;
    v84 = (char *)v80;
  }
  else
  {
    v83 = &v82[v81 & 0xFFFFFFFFFFFFFFE0];
    v84 = (char *)(v80 + (v81 & 0xFFFFFFFFFFFFFFE0));
    v85 = (__int128 *)(v80 + 16);
    v86 = v82 + 16;
    v87 = v81 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v88 = *v85;
      *(v86 - 1) = *(v85 - 1);
      *v86 = v88;
      v85 += 2;
      v86 += 2;
      v87 -= 32;
    }
    while (v87);
    if (v81 == (v81 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_132;
  }
  do
  {
    v91 = *v84++;
    *v83++ = v91;
  }
  while (v84 != v79);
LABEL_132:
  *v83 = 0;
LABEL_133:
  util::convert<int>(&v93, &__p);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v93.__r_.__value_.__l.__data_);
  __p.tm_isdst = -1;
  v92 = mktime(&__p);
  v93.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v93.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday((timeval *)&v93, 0);
  v21 = (int64_t)(v93.__r_.__value_.__r.__words[0] - v92) > a2;
  v22 = *(void **)v94;
  if (*(_QWORD *)v94)
    goto LABEL_23;
  return v21;
}

void sub_24B83D2E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t util::convert<int>(const std::string *a1, _DWORD *a2)
{
  uint64_t result;
  const char *v5;
  std::string::size_type size;
  size_t __idx;

  if ((SHIBYTE(a1->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    result = strcasecmp((const char *)a1, "false");
    if (!(_DWORD)result)
      goto LABEL_29;
    result = strcasecmp((const char *)a1, "off");
    if (!(_DWORD)result)
      goto LABEL_29;
    result = strcasecmp((const char *)a1, "no");
    if (!(_DWORD)result)
      goto LABEL_29;
    if (strcasecmp((const char *)a1, "true")
      && strcasecmp((const char *)a1, "on")
      && strcasecmp((const char *)a1, "yes")
      && strcasecmp((const char *)a1, "full")
      && strcasecmp((const char *)a1, "streaming"))
    {
      v5 = (const char *)a1;
      if (!strcasecmp((const char *)a1, "lite"))
        goto LABEL_31;
      goto LABEL_21;
    }
LABEL_28:
    result = 1;
LABEL_29:
    *a2 = result;
    return result;
  }
  v5 = (const char *)a1->__r_.__value_.__r.__words[0];
  result = strcasecmp(a1->__r_.__value_.__l.__data_, "false");
  if (!(_DWORD)result)
    goto LABEL_29;
  result = strcasecmp(v5, "off");
  if (!(_DWORD)result)
    goto LABEL_29;
  result = strcasecmp(v5, "no");
  if (!(_DWORD)result)
    goto LABEL_29;
  if (!strcasecmp(v5, "true")
    || !strcasecmp(v5, "on")
    || !strcasecmp(v5, "yes")
    || !strcasecmp(v5, "full")
    || !strcasecmp(v5, "streaming"))
  {
    goto LABEL_28;
  }
  if (!strcasecmp(v5, "lite"))
  {
LABEL_31:
    result = 2;
    goto LABEL_29;
  }
LABEL_21:
  if (!strcasecmp(v5, "background"))
    goto LABEL_31;
  __idx = 0xAAAAAAAAAAAAAAAALL;
  result = std::stol(a1, &__idx, 10);
  size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = a1->__r_.__value_.__l.__size_;
  if (__idx == size && result >= (uint64_t)0xFFFFFFFF80000000 && result <= 0x7FFFFFFF)
    goto LABEL_29;
  return result;
}

void sub_24B83D580(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void util::findBasebandLogInfoFile(const void **a1@<X0>, __int128 **a2@<X1>, _QWORD *a3@<X8>)
{
  __int128 *v3;
  __int128 v5;
  int v6;
  size_t v7;
  int v8;
  size_t size;
  unint64_t v10;
  void **v11;
  const void *v12;
  char *v13;
  std::string *v14;
  timespec v15;
  const char *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  DIR *v21;
  DIR *v22;
  dirent *v23;
  _DWORD *v24;
  void **v28;
  void *v29;
  _DWORD *v30;
  char *v34;
  uint64_t v35;
  int v36;
  int v38;
  size_t v39;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  std::string *v44;
  _OWORD *v45;
  _OWORD *v46;
  __int128 *v47;
  void *__dst[3];
  std::string v49;
  stat v50;

  *a3 = 0;
  a3[1] = 0;
  v46 = a3;
  a3[2] = 0;
  v3 = *a2;
  v47 = a2[1];
  if (v3 == v47)
    return;
  while (1)
  {
    memset(&v49, 170, sizeof(v49));
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v49, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
    }
    else
    {
      v5 = *v3;
      v49.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
      *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v5;
    }
    v6 = *((char *)a1 + 23);
    if (v6 >= 0)
      v7 = *((unsigned __int8 *)a1 + 23);
    else
      v7 = (size_t)a1[1];
    v8 = SHIBYTE(v49.__r_.__value_.__r.__words[2]);
    if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v49.__r_.__value_.__r.__words[2]);
    else
      size = v49.__r_.__value_.__l.__size_;
    v10 = size + v7;
    memset(__dst, 170, sizeof(__dst));
    if (size + v7 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v10 <= 0x16)
    {
      memset(__dst, 0, sizeof(__dst));
      v11 = __dst;
      HIBYTE(__dst[2]) = size + v7;
      if (!v7)
        goto LABEL_20;
LABEL_16:
      if (v6 >= 0)
        v12 = a1;
      else
        v12 = *a1;
      memmove(v11, v12, v7);
      goto LABEL_20;
    }
    v18 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v18 = v10 | 7;
    v19 = v18 + 1;
    v11 = (void **)operator new(v18 + 1);
    __dst[1] = (void *)(size + v7);
    __dst[2] = (void *)(v19 | 0x8000000000000000);
    __dst[0] = v11;
    if (v7)
      goto LABEL_16;
LABEL_20:
    v13 = (char *)v11 + v7;
    if (size)
    {
      if (v8 >= 0)
        v14 = &v49;
      else
        v14 = (std::string *)v49.__r_.__value_.__r.__words[0];
      memmove(v13, v14, size);
    }
    v13[size] = 0;
    v15.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v15.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v50.st_blksize = v15;
    *(timespec *)v50.st_qspare = v15;
    v50.st_birthtimespec = v15;
    *(timespec *)&v50.st_size = v15;
    v50.st_mtimespec = v15;
    v50.st_ctimespec = v15;
    *(timespec *)&v50.st_uid = v15;
    v50.st_atimespec = v15;
    *(timespec *)&v50.st_dev = v15;
    if (SHIBYTE(__dst[2]) >= 0)
      v16 = (const char *)__dst;
    else
      v16 = (const char *)__dst[0];
    if (stat(v16, &v50)
      || (SHIBYTE(__dst[2]) >= 0 ? (v20 = (const char *)__dst) : (v20 = (const char *)__dst[0]),
          v21 = opendir(v20),
          (v22 = v21) == 0))
    {
      v17 = HIBYTE(__dst[2]);
      goto LABEL_30;
    }
    v23 = readdir(v21);
    closedir(v22);
    v17 = HIBYTE(__dst[2]);
    if (v23)
      break;
LABEL_30:
    if (v17 < 0)
    {
      operator delete(__dst[0]);
      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
LABEL_59:
        operator delete(v49.__r_.__value_.__l.__data_);
    }
    else if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_59;
    }
    v3 = (__int128 *)((char *)v3 + 24);
    if (v3 == v47)
      return;
  }
  if ((HIBYTE(__dst[2]) & 0x80) == 0)
  {
    if (HIBYTE(__dst[2]) <= 4u)
      goto LABEL_99;
    v24 = (_DWORD *)((char *)__dst + HIBYTE(__dst[2]) - 5);
    if (*v24 == 1885626669 && *((_BYTE *)__dst + HIBYTE(__dst[2]) - 1) == 108)
      goto LABEL_79;
    if (*v24 == 1935962413 && *((_BYTE *)__dst + HIBYTE(__dst[2]) - 1) == 115)
      goto LABEL_79;
    if (*v24 == 1634296877 && *((_BYTE *)__dst + HIBYTE(__dst[2]) - 1) == 103)
      goto LABEL_79;
    if (HIBYTE(__dst[2]) < 9u)
      goto LABEL_99;
    v28 = __dst;
    v29 = (void *)HIBYTE(__dst[2]);
    goto LABEL_74;
  }
  v29 = __dst[1];
  if (__dst[1] < (void *)5)
    goto LABEL_99;
  v28 = (void **)__dst[0];
  v30 = (char *)__dst[1] + (unint64_t)__dst[0] - 5;
  if ((*v30 != 1885626669 || *((_BYTE *)__dst[1] + (unint64_t)__dst[0] - 1) != 108)
    && (*v30 != 1935962413 || *((_BYTE *)__dst[1] + (unint64_t)__dst[0] - 1) != 115)
    && (*v30 != 1634296877 || *((_BYTE *)__dst[1] + (unint64_t)__dst[0] - 1) != 103))
  {
    if (__dst[1] < (void *)9)
LABEL_99:
      std::string::__throw_out_of_range[abi:ne180100]();
LABEL_74:
    v34 = (char *)v28 + (_QWORD)v29;
    v35 = *(_QWORD *)(v34 - 9);
    v36 = *(v34 - 1);
    if (v35 == 0x636172742D62622DLL && v36 == 101)
      goto LABEL_79;
    goto LABEL_30;
  }
LABEL_79:
  v38 = SHIBYTE(v49.__r_.__value_.__r.__words[2]);
  if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v39 = HIBYTE(v49.__r_.__value_.__r.__words[2]);
  else
    v39 = v49.__r_.__value_.__l.__size_;
  v40 = v39 + 9;
  memset(&v50, 170, 24);
  if (v39 + 9 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v40 >= 0x17)
  {
    v42 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v40 | 7) != 0x17)
      v42 = v40 | 7;
    v43 = v42 + 1;
    v41 = operator new(v42 + 1);
    v50.st_ino = v39 + 9;
    *(_QWORD *)&v50.st_uid = v43 | 0x8000000000000000;
    *(_QWORD *)&v50.st_dev = v41;
  }
  else
  {
    memset(&v50, 0, 24);
    v41 = &v50;
    HIBYTE(v50.st_gid) = v39 + 9;
    if (!v39)
      goto LABEL_93;
  }
  if (v38 >= 0)
    v44 = &v49;
  else
    v44 = (std::string *)v49.__r_.__value_.__r.__words[0];
  memmove(v41, v44, v39);
LABEL_93:
  strcpy((char *)v41 + v39, "/info.txt");
  v45 = v46;
  *v46 = *(_OWORD *)&v50.st_dev;
  *((_QWORD *)v45 + 2) = *(_QWORD *)&v50.st_uid;
  if ((v17 & 0x80) == 0)
  {
    if ((v38 & 0x80) == 0)
      return;
LABEL_97:
    operator delete(v49.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(__dst[0]);
  if ((*((_BYTE *)&v49.__r_.__value_.__s + 23) & 0x80) != 0)
    goto LABEL_97;
}

void sub_24B83DA14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0)
  {
    operator delete(__p);
    if ((a23 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a23 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a18);
  _Unwind_Resume(exception_object);
}

BOOL util::isDumpForSysdiagnose(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  int v3;
  size_t v4;
  unint64_t v5;
  const void **v6;
  std::string::value_type *v8;
  uint64_t v9;
  uint64_t v10;
  _WORD *v11;
  const void **v12;
  std::string *v13;
  __int128 v14;
  unint64_t *v15;
  unint64_t v16;
  _BOOL4 FilteredFiles;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  _BOOL8 v21;
  char *v22;
  char *v23;
  int64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  std::string *v29;
  char *v30;
  void **v31;
  void **v32;
  void *v33;
  int v34;
  size_t size;
  int v36;
  size_t v37;
  unint64_t v38;
  void **v39;
  const void *v40;
  char *v41;
  std::string *v42;
  void **v43;
  uint64_t v44;
  int v45;
  void *v46;
  char *v47;
  void **v48;
  char *v49;
  unsigned __int8 v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned __int8 v59;
  NSObject *v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  void **v64;
  void **v65;
  void *v66;
  std::string *v68;
  void *v69;
  char *v70;
  char *v71;
  std::string v72;
  std::locale v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  uint64_t v78;
  std::string v79;
  std::string v80;
  _BYTE v81[48];
  __int128 v82;
  void *v83;
  char *v84;
  uint64_t v85;
  void *__dst[4];
  void *__p[76];

  __p[73] = *(void **)MEMORY[0x24BDAC8D0];
  v83 = 0;
  v84 = 0;
  v85 = 0;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v81[32] = v2;
  v82 = v2;
  *(_OWORD *)v81 = v2;
  *(_OWORD *)&v81[16] = v2;
  v3 = *(char *)(a2 + 23);
  if (v3 >= 0)
    v4 = *(unsigned __int8 *)(a2 + 23);
  else
    v4 = *(_QWORD *)(a2 + 8);
  v5 = v4 + 2;
  memset(&v80, 170, sizeof(v80));
  if (v4 + 2 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v6 = (const void **)a2;
  if (v5 >= 0x17)
  {
    v9 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v9 = v5 | 7;
    v10 = v9 + 1;
    v11 = operator new(v9 + 1);
    v80.__r_.__value_.__l.__size_ = v4 + 2;
    v80.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    v80.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
    *v11 = 10798;
    v8 = (std::string::value_type *)(v11 + 1);
  }
  else
  {
    v80.__r_.__value_.__r.__words[2] = 0;
    *((_BYTE *)&v80.__r_.__value_.__s + 23) = v4 + 2;
    v8 = &v80.__r_.__value_.__s.__data_[2];
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = 0x2A2EuLL;
    if (!v4)
      goto LABEL_15;
  }
  if (v3 >= 0)
    v12 = v6;
  else
    v12 = (const void **)*v6;
  memmove(v8, v12, v4);
LABEL_15:
  v8[v4] = 0;
  v13 = std::string::append(&v80, ".*", 2uLL);
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  __p[2] = (void *)v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v81, (uint64_t)__p, 0);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v80.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_20:
    operator delete(v80.__r_.__value_.__l.__data_);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      goto LABEL_18;
    goto LABEL_21;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_20;
LABEL_17:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
LABEL_18:
    v79 = *(std::string *)a1;
    goto LABEL_22;
  }
LABEL_21:
  std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
LABEL_22:
  std::locale::locale(&v73, (const std::locale *)v81);
  v74 = *(_OWORD *)&v81[8];
  v75 = *(_OWORD *)&v81[24];
  v76 = *(_QWORD *)&v81[40];
  v77 = (std::__shared_weak_count *)v82;
  if ((_QWORD)v82)
  {
    v15 = (unint64_t *)(v82 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v78 = *((_QWORD *)&v82 + 1);
  FilteredFiles = support::fs::getFilteredFiles((const char *)&v79, (uint64_t)&v73, (uint64_t)&v83, 0);
  v18 = v77;
  if (!v77)
    goto LABEL_29;
  p_shared_owners = (unint64_t *)&v77->__shared_owners_;
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
    std::locale::~locale(&v73);
    if ((SHIBYTE(v79.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_30:
      if (FilteredFiles)
        goto LABEL_31;
LABEL_35:
      v21 = 0;
      goto LABEL_124;
    }
  }
  else
  {
LABEL_29:
    std::locale::~locale(&v73);
    if ((SHIBYTE(v79.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_30;
  }
  operator delete(v79.__r_.__value_.__l.__data_);
  if (!FilteredFiles)
    goto LABEL_35;
LABEL_31:
  memset(&v80, 170, sizeof(v80));
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v72, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v72 = *(std::string *)a1;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v22 = (char *)v83;
  v23 = v84;
  __p[0] = &v69;
  __p[1] = (void *)0xAAAAAAAAAAAAAA00;
  v24 = v84 - (_BYTE *)v83;
  if (v84 != v83)
  {
    v25 = 0xAAAAAAAAAAAAAAABLL * (v24 >> 3);
    if (v25 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v26 = (char *)operator new(v24);
    v27 = 0;
    v69 = v26;
    v70 = v26;
    v71 = &v26[24 * v25];
    do
    {
      v29 = (std::string *)&v26[v27];
      v30 = &v22[v27];
      if (v22[v27 + 23] < 0)
      {
        std::string::__init_copy_ctor_external(v29, *(const std::string::value_type **)v30, *((_QWORD *)v30 + 1));
      }
      else
      {
        v28 = *(_OWORD *)v30;
        v29->__r_.__value_.__r.__words[2] = *((_QWORD *)v30 + 2);
        *(_OWORD *)&v29->__r_.__value_.__l.__data_ = v28;
      }
      v27 += 24;
    }
    while (&v22[v27] != v23);
    v70 = &v26[v27];
  }
  util::findBasebandLogInfoFile((const void **)&v72.__r_.__value_.__l.__data_, (__int128 **)&v69, &v80);
  v31 = (void **)v69;
  if (v69)
  {
    v32 = (void **)v70;
    v33 = v69;
    if (v70 != v69)
    {
      do
      {
        if (*((char *)v32 - 1) < 0)
          operator delete(*(v32 - 3));
        v32 -= 3;
      }
      while (v32 != v31);
      v33 = v69;
    }
    v70 = (char *)v31;
    operator delete(v33);
  }
  if ((SHIBYTE(v72.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    v34 = SHIBYTE(v80.__r_.__value_.__r.__words[2]);
    if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v80.__r_.__value_.__r.__words[2]);
    else
      size = v80.__r_.__value_.__l.__size_;
    if (size)
      goto LABEL_58;
LABEL_105:
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2579B8240 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v56 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_DEFAULT))
        goto LABEL_111;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v56 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_DEFAULT))
        goto LABEL_111;
    }
    if (*((char *)v6 + 23) < 0)
      v6 = (const void **)*v6;
    LODWORD(__p[0]) = 136315138;
    *(void **)((char *)__p + 4) = v6;
    _os_log_impl(&dword_24B825000, v56, OS_LOG_TYPE_DEFAULT, "No baseband info file found for %s", (uint8_t *)__p, 0xCu);
LABEL_111:
    v21 = 0;
    if ((v34 & 0x80) != 0)
      goto LABEL_123;
    goto LABEL_124;
  }
  operator delete(v72.__r_.__value_.__l.__data_);
  v34 = SHIBYTE(v80.__r_.__value_.__r.__words[2]);
  if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v80.__r_.__value_.__r.__words[2]);
  else
    size = v80.__r_.__value_.__l.__size_;
  if (!size)
    goto LABEL_105;
LABEL_58:
  memset(__p, 170, 0x240uLL);
  v36 = *(char *)(a1 + 23);
  if (v36 >= 0)
    v37 = *(unsigned __int8 *)(a1 + 23);
  else
    v37 = *(_QWORD *)(a1 + 8);
  v38 = v37 + size;
  memset(__dst, 170, 24);
  if (v37 + size > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v38 <= 0x16)
  {
    memset(__dst, 0, 24);
    v39 = __dst;
    HIBYTE(__dst[2]) = v37 + size;
    if (!v37)
      goto LABEL_68;
    goto LABEL_64;
  }
  v57 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v38 | 7) != 0x17)
    v57 = v38 | 7;
  v58 = v57 + 1;
  v39 = (void **)operator new(v57 + 1);
  __dst[1] = (void *)(v37 + size);
  __dst[2] = (void *)(v58 | 0x8000000000000000);
  __dst[0] = v39;
  if (v37)
  {
LABEL_64:
    if (v36 >= 0)
      v40 = (const void *)a1;
    else
      v40 = *(const void **)a1;
    memmove(v39, v40, v37);
  }
LABEL_68:
  v41 = (char *)v39 + v37;
  if (v34 >= 0)
    v42 = &v80;
  else
    v42 = (std::string *)v80.__r_.__value_.__r.__words[0];
  memmove(v41, v42, size);
  v41[size] = 0;
  std::ifstream::basic_ifstream(__p);
  if (SHIBYTE(__dst[2]) < 0)
  {
    operator delete(__dst[0]);
    if (__p[17])
      goto LABEL_73;
LABEL_118:
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_2579B8240 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v60 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
      {
LABEL_121:
        v21 = 0;
        goto LABEL_122;
      }
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v60 = qword_2579B8240;
      if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_ERROR))
        goto LABEL_121;
    }
    v68 = (std::string *)v80.__r_.__value_.__r.__words[0];
    if (v34 >= 0)
      v68 = &v80;
    LODWORD(__dst[0]) = 136315138;
    *(void **)((char *)__dst + 4) = v68;
    _os_log_error_impl(&dword_24B825000, v60, OS_LOG_TYPE_ERROR, "Failed to open info file: %s", (uint8_t *)__dst, 0xCu);
    goto LABEL_121;
  }
  if (!__p[17])
    goto LABEL_118;
LABEL_73:
  std::istream::seekg();
  memset(__dst, 170, 24);
  v43 = __dst;
  support::fs::readCurrentLine(__p, __dst);
  v44 = HIBYTE(__dst[2]);
  v45 = SHIBYTE(__dst[2]);
  v46 = __dst[0];
  if (SHIBYTE(__dst[2]) < 0)
  {
    v44 = (uint64_t)__dst[1];
    v43 = (void **)__dst[0];
  }
  v47 = (char *)v43 + v44;
  if (v44 >= 35)
  {
    v48 = v43;
    do
    {
      v49 = (char *)memchr(v48, 98, v44 - 34);
      if (!v49)
        break;
      if (*(_QWORD *)v49 == 0x6320676F6C206262
        && *((_QWORD *)v49 + 1) == 0x6F697463656C6C6FLL
        && *((_QWORD *)v49 + 2) == 0x20726F66202D206ELL
        && *((_QWORD *)v49 + 3) == 0x6E67616964737973
        && *(_QWORD *)(v49 + 27) == 0x65736F6E67616964)
      {
        goto LABEL_93;
      }
      v48 = (void **)(v49 + 1);
      v44 = v47 - (char *)v48;
    }
    while (v47 - (char *)v48 > 34);
  }
  v49 = v47;
LABEL_93:
  v21 = v49 != v47 && v49 - (char *)v43 != -1;
  if (v45 < 0)
    operator delete(v46);
LABEL_122:
  __p[0] = *(void **)MEMORY[0x24BEDB7E0];
  *(void **)((char *)__p + *((_QWORD *)__p[0] - 3)) = *(void **)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x24BD28124](&__p[2]);
  std::istream::~istream();
  MEMORY[0x24BD2825C](&__p[53]);
  if ((*((_BYTE *)&v80.__r_.__value_.__s + 23) & 0x80) != 0)
LABEL_123:
    operator delete(v80.__r_.__value_.__l.__data_);
LABEL_124:
  v61 = (std::__shared_weak_count *)v82;
  if ((_QWORD)v82)
  {
    v62 = (unint64_t *)(v82 + 8);
    do
      v63 = __ldaxr(v62);
    while (__stlxr(v63 - 1, v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  std::locale::~locale((std::locale *)v81);
  v64 = (void **)v83;
  if (v83)
  {
    v65 = (void **)v84;
    v66 = v83;
    if (v84 != v83)
    {
      do
      {
        if (*((char *)v65 - 1) < 0)
          operator delete(*(v65 - 3));
        v65 -= 3;
      }
      while (v65 != v64);
      v66 = v83;
    }
    v84 = (char *)v64;
    operator delete(v66);
  }
  return v21;
}

void sub_24B83E378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,uint64_t a30,std::locale a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,char a50)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a31);
  std::vector<std::string>::~vector[abi:ne180100](&a40);
  _Unwind_Resume(a1);
}

void sub_24B83E3D8(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *__p, uint64_t a7, int a8, __int16 a9, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,...)
{
  std::locale v27;
  va_list va;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  va_list va1;

  va_start(va1, a26);
  va_start(va, a26);
  v27.__locale_ = va_arg(va1, std::locale::__imp *);
  v29 = va_arg(va1, _QWORD);
  v30 = va_arg(va1, _QWORD);
  v31 = va_arg(va1, _QWORD);
  v32 = va_arg(va1, _QWORD);
  v33 = va_arg(va1, _QWORD);
  v34 = va_arg(va1, _QWORD);
  v35 = va_arg(va1, _QWORD);
  v36 = va_arg(va1, _QWORD);
  std::vector<std::string>::~vector[abi:ne180100](&a3);
  if (a11 < 0)
    operator delete(__p);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)va);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va1);
  _Unwind_Resume(a1);
}

void sub_24B83E3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void **a47)
{
  std::__exception_guard_exceptions<std::vector<std::string>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a47);
  JUMPOUT(0x24B83E4A8);
}

void sub_24B83E3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,std::locale a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,...)
{
  va_list va;

  va_start(va, a35);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a10);
  if (a23 < 0)
    JUMPOUT(0x24B83E408);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a27);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_24B83E424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  if (a55 < 0)
  {
    operator delete(__p);
    if (a33 < 0)
    {
LABEL_5:
      operator delete(a28);
      std::vector<std::string>::~vector[abi:ne180100](&a43);
      _Unwind_Resume(a1);
    }
  }
  else if (a33 < 0)
  {
    goto LABEL_5;
  }
  std::vector<std::string>::~vector[abi:ne180100](&a43);
  _Unwind_Resume(a1);
}

void sub_24B83E480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  std::vector<std::string>::~vector[abi:ne180100](&a40);
  _Unwind_Resume(a1);
}

void sub_24B83E494()
{
  uint64_t v0;
  uint64_t v1;

  for (; v1; v1 -= 24)
  {
    if (*(char *)(v0 + v1 - 1) < 0)
      operator delete(*(void **)(v0 + v1 - 24));
  }
  JUMPOUT(0x24B83E4A0);
}

void util::findLastLogDumpTimestamp(util *this@<X0>, const char *__s@<X1>, const char *a3@<X2>, int a4@<W3>, char *a5@<X4>, std::string *a6@<X8>)
{
  unsigned int v8;
  std::string *v10;
  size_t v11;
  size_t v12;
  __int128 *p_dst;
  uint64_t v14;
  uint64_t v15;
  std::string *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  size_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  _BOOL4 FilteredFiles;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  __n128 v31;
  unint64_t v32;
  uint64_t v33;
  const void **v34;
  __int128 v35;
  int64_t size;
  std::string::size_type v37;
  int v38;
  std::string *v39;
  std::string *v40;
  std::string *v41;
  int64_t v42;
  __int128 v43;
  std::string::size_type v44;
  std::sub_match<const char *> *v45;
  int v46;
  std::string::size_type v47;
  std::string *v48;
  _BYTE *p_end_cap;
  std::vector<std::ssub_match>::pointer begin;
  std::__wrap_iter<const char *>::iterator_type i;
  const char **p_i;
  const char *v53;
  unint64_t v54;
  __int128 *v55;
  __int128 *v56;
  const char *v57;
  __int128 *v58;
  _OWORD *v59;
  unint64_t v60;
  __int128 v61;
  int64_t v62;
  int64_t v63;
  int64_t v64;
  int v65;
  std::sub_match<std::__wrap_iter<const char *>> *v66;
  char *v67;
  int v68;
  std::string *v69;
  int64_t v70;
  char *v71;
  char *v72;
  char *v73;
  int v74;
  std::string *v75;
  int64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  size_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  _BOOL4 isDumpForSysdiagnose;
  unsigned __int8 v88;
  NSObject *v89;
  std::string *v90;
  char v91;
  char v92;
  int64_t v93;
  std::string *v94;
  size_t v95;
  unint64_t *v96;
  unint64_t v97;
  _BOOL4 v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  std::__shared_weak_count *v105;
  unint64_t *v106;
  unint64_t v107;
  const void **v108;
  const void **v109;
  const void **v110;
  unsigned int v111;
  char *v113;
  const void **v115;
  std::string *v116;
  BOOL v117;
  std::locale v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  std::__shared_weak_count *v122;
  uint64_t v123;
  std::string v124;
  std::string v125;
  void *v126[2];
  unint64_t v127;
  std::vector<std::ssub_match> v128[2];
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  std::string v136;
  std::string v137;
  std::locale v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  std::__shared_weak_count *v142;
  uint64_t v143;
  void *__p[2];
  unint64_t v145;
  _BYTE v146[48];
  __int128 v147;
  _BYTE v148[48];
  __int128 v149;
  void *v150[3];
  const void **v151;
  const void **v152;
  uint64_t v153;
  __int128 __dst;
  _BYTE v155[32];
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  __int128 v161;
  uint64_t v162;
  uint64_t v163;

  v8 = a3;
  v10 = a6;
  v163 = *MEMORY[0x24BDAC8D0];
  a6->__r_.__value_.__r.__words[0] = 0;
  a6->__r_.__value_.__l.__size_ = 0;
  a6->__r_.__value_.__r.__words[2] = 0;
  v151 = 0;
  v152 = 0;
  v153 = 0;
  memset(v150, 170, sizeof(v150));
  v11 = strlen(__s);
  v116 = v10;
  if (v11 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v12 = v11;
  if (v11 >= 0x17)
  {
    v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v14 = v11 | 7;
    v15 = v14 + 1;
    p_dst = (__int128 *)operator new(v14 + 1);
    *((_QWORD *)&__dst + 1) = v12;
    *(_QWORD *)v155 = v15 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_8;
  }
  v155[7] = v11;
  p_dst = &__dst;
  if (v11)
LABEL_8:
    memcpy(p_dst, __s, v12);
  *((_BYTE *)p_dst + v12) = 0;
  v16 = std::string::append((std::string *)&__dst, ".*", 2uLL);
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v150[2] = (void *)v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)v150 = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if ((v155[7] & 0x80000000) != 0)
    operator delete((void *)__dst);
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v148[32] = v18;
  v149 = v18;
  *(_OWORD *)v148 = v18;
  *(_OWORD *)&v148[16] = v18;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v148, (uint64_t)v150, 0);
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v146[32] = v19;
  v147 = v19;
  *(_OWORD *)v146 = v19;
  *(_OWORD *)&v146[16] = v19;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)v146, "(\\d{4})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{3})", 0);
  v20 = strlen((const char *)this);
  if (v20 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v21 = (void *)v20;
  v117 = a5 == 0;
  if (v20 >= 0x17)
  {
    v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17)
      v23 = v20 | 7;
    v24 = v23 + 1;
    v22 = operator new(v23 + 1);
    v145 = v24 | 0x8000000000000000;
    __p[0] = v22;
    __p[1] = v21;
    goto LABEL_18;
  }
  HIBYTE(v145) = v20;
  v22 = __p;
  if (v20)
LABEL_18:
    memcpy(v22, this, (size_t)v21);
  *((_BYTE *)v21 + (_QWORD)v22) = 0;
  std::locale::locale(&v138, (const std::locale *)v148);
  v139 = *(_OWORD *)&v148[8];
  v140 = *(_OWORD *)&v148[24];
  v141 = *(_QWORD *)&v148[40];
  v142 = (std::__shared_weak_count *)v149;
  if ((_QWORD)v149)
  {
    v25 = (unint64_t *)(v149 + 8);
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
  }
  v143 = *((_QWORD *)&v149 + 1);
  FilteredFiles = support::fs::getFilteredFiles((const char *)__p, (uint64_t)&v138, (uint64_t)&v151, 0);
  v28 = v142;
  if (!v142)
    goto LABEL_26;
  p_shared_owners = (unint64_t *)&v142->__shared_owners_;
  do
    v30 = __ldaxr(p_shared_owners);
  while (__stlxr(v30 - 1, p_shared_owners));
  if (!v30)
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    std::locale::~locale(&v138);
    if ((SHIBYTE(v145) & 0x80000000) == 0)
    {
LABEL_27:
      if (!FilteredFiles)
        goto LABEL_176;
      goto LABEL_31;
    }
  }
  else
  {
LABEL_26:
    std::locale::~locale(&v138);
    if ((SHIBYTE(v145) & 0x80000000) == 0)
      goto LABEL_27;
  }
  operator delete(__p[0]);
  if (!FilteredFiles)
    goto LABEL_176;
LABEL_31:
  v32 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (v152 - v151));
  if (v152 == v151)
    v33 = 0;
  else
    v33 = v32;
  std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>((uint64_t)v151, v152, v33, 1, v31);
  memset(&v137, 0, sizeof(v137));
  v34 = v151;
  v115 = v152;
  if (v151 == v152)
  {
LABEL_176:
    if (!v8)
      goto LABEL_196;
LABEL_177:
    if (SHIBYTE(v10->__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v124, v10->__r_.__value_.__l.__data_, v10->__r_.__value_.__l.__size_);
    else
      v124 = *v10;
    std::locale::locale(&v118, (const std::locale *)v146);
    v119 = *(_OWORD *)&v146[8];
    v120 = *(_OWORD *)&v146[24];
    v121 = *(_QWORD *)&v146[40];
    v122 = (std::__shared_weak_count *)v147;
    if ((_QWORD)v147)
    {
      v96 = (unint64_t *)(v147 + 8);
      do
        v97 = __ldxr(v96);
      while (__stxr(v97 + 1, v96));
    }
    v123 = *((_QWORD *)&v147 + 1);
    v98 = util::checkLogFileAge((uint64_t)&v124, v8, (uint64_t)&v118);
    v99 = v122;
    if (!v122)
      goto LABEL_187;
    v100 = (unint64_t *)&v122->__shared_owners_;
    do
      v101 = __ldaxr(v100);
    while (__stlxr(v101 - 1, v100));
    if (!v101)
    {
      ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
      std::__shared_weak_count::__release_weak(v99);
      std::locale::~locale(&v118);
      if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_188:
        if (!v98)
          goto LABEL_196;
LABEL_192:
        if (SHIBYTE(v10->__r_.__value_.__r.__words[2]) < 0)
        {
          *v10->__r_.__value_.__l.__data_ = 0;
          v10->__r_.__value_.__l.__size_ = 0;
        }
        else
        {
          v10->__r_.__value_.__s.__data_[0] = 0;
          *((_BYTE *)&v10->__r_.__value_.__s + 23) = 0;
        }
        goto LABEL_196;
      }
    }
    else
    {
LABEL_187:
      std::locale::~locale(&v118);
      if ((SHIBYTE(v124.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_188;
    }
    operator delete(v124.__r_.__value_.__l.__data_);
    if (!v98)
      goto LABEL_196;
    goto LABEL_192;
  }
  v111 = v8;
  v113 = a5;
  while (1)
  {
    memset(&v136, 170, sizeof(v136));
    if (*((char *)v34 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v136, (const std::string::value_type *)*v34, (std::string::size_type)v34[1]);
    }
    else
    {
      v35 = *(_OWORD *)v34;
      v136.__r_.__value_.__r.__words[2] = (std::string::size_type)v34[2];
      *(_OWORD *)&v136.__r_.__value_.__l.__data_ = v35;
    }
    if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v137.__r_.__value_.__r.__words[2]);
    else
      size = v137.__r_.__value_.__l.__size_;
    v37 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
    v38 = SHIBYTE(v136.__r_.__value_.__r.__words[2]);
    v39 = (std::string *)v136.__r_.__value_.__r.__words[0];
    if (size)
    {
      if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v40 = &v137;
      else
        v40 = (std::string *)v137.__r_.__value_.__r.__words[0];
      if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v41 = &v136;
      else
        v41 = (std::string *)v136.__r_.__value_.__r.__words[0];
      v42 = v136.__r_.__value_.__l.__size_;
      if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v42 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
      if (v42 >= size)
      {
        v67 = (char *)v41 + v42;
        v68 = v40->__r_.__value_.__s.__data_[0];
        v69 = v41;
        do
        {
          v70 = v42 - size;
          if (v70 == -1)
            break;
          v71 = (char *)memchr(v69, v68, v70 + 1);
          if (!v71)
            break;
          v72 = v71;
          if (!memcmp(v71, v40, size))
          {
            if (v72 == v67 || v72 - (char *)v41 == -1)
              break;
            v65 = 3;
            v10 = v116;
            if ((v38 & 0x80) == 0)
              goto LABEL_155;
            goto LABEL_109;
          }
          v69 = (std::string *)(v72 + 1);
          v42 = v67 - (v72 + 1);
        }
        while (v42 >= size);
      }
    }
    *(_QWORD *)&v43 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v134 = v43;
    v131 = 0xAAAAAAAAAAAAAA00;
    v128[1].__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)0xAAAAAAAAAAAAAAAALL;
    v129 = 0;
    v130 = 0;
    v132 = 0;
    v133 = 0;
    LOBYTE(v134) = 0;
    BYTE8(v134) = 0;
    v135 = 0;
    memset(v128, 0, 41);
    if (v117)
    {
      v44 = v136.__r_.__value_.__l.__size_;
      v161 = v43;
      v158 = 0xAAAAAAAAAAAAAA00;
      *(_QWORD *)&v155[24] = v43;
      v156 = 0;
      v157 = 0;
      v159 = 0;
      v160 = 0;
      LOBYTE(v161) = 0;
      BYTE8(v161) = 0;
      v162 = 0;
      __dst = 0uLL;
      *(_OWORD *)v155 = 0uLL;
      if (v38 >= 0)
        v45 = (std::sub_match<const char *> *)&v136;
      else
        v45 = (std::sub_match<const char *> *)v39;
      if (v38 >= 0)
        v44 = v37;
      *(_OWORD *)&v155[9] = 0uLL;
      v10 = v116;
      v46 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v146, v45, (std::sub_match<const char *> *)((char *)v45 + v44), (std::vector<std::csub_match> *)&__dst, 0);
      v47 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
      if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = &v136;
      else
        v48 = (std::string *)v136.__r_.__value_.__r.__words[0];
      if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v47 = v136.__r_.__value_.__l.__size_;
      std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v128, (uint64_t)v48, (std::sub_match<std::__wrap_iter<const char *>> *)((char *)v48 + v47), (uint64_t *)&__dst, 0);
      if ((_QWORD)__dst)
      {
        *((_QWORD *)&__dst + 1) = __dst;
        operator delete((void *)__dst);
      }
      if (v46)
      {
        p_end_cap = &v128[1].__end_cap_;
        if (v128[0].__end_ != v128[0].__begin_)
          p_end_cap = &v128[0].__begin_->matched;
        if (!*p_end_cap)
        {
          __dst = 0uLL;
          *(_QWORD *)v155 = 0;
          if ((SHIBYTE(v116->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_119;
          goto LABEL_104;
        }
        begin = (std::vector<std::ssub_match>::pointer)&v128[1];
        if (v128[0].__end_ != v128[0].__begin_)
          begin = v128[0].__begin_;
        i = begin->first.__i_;
        p_i = &v128[0].__begin_->second.__i_;
        if (v128[0].__end_ == v128[0].__begin_)
          p_i = (const char **)&v128[1].__end_;
        v53 = *p_i;
        v54 = *p_i - i;
        if (v54 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v54 > 0x16)
        {
          v79 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v54 | 7) != 0x17)
            v79 = v54 | 7;
          v80 = v79 + 1;
          v55 = (__int128 *)operator new(v79 + 1);
          *((_QWORD *)&__dst + 1) = v54;
          *(_QWORD *)v155 = v80 | 0x8000000000000000;
          *(_QWORD *)&__dst = v55;
          if (i != v53)
          {
LABEL_77:
            if (v54 < 0x20 || (unint64_t)((char *)v55 - i) < 0x20)
            {
              v56 = v55;
              v57 = i;
            }
            else
            {
              v56 = (__int128 *)((char *)v55 + (v54 & 0xFFFFFFFFFFFFFFE0));
              v57 = &i[v54 & 0xFFFFFFFFFFFFFFE0];
              v58 = (__int128 *)(i + 16);
              v59 = v55 + 1;
              v60 = v54 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                v61 = *v58;
                *(v59 - 1) = *(v58 - 1);
                *v59 = v61;
                v58 += 2;
                v59 += 2;
                v60 -= 32;
              }
              while (v60);
              if (v54 == (v54 & 0x7FFFFFFFFFFFFFE0))
              {
LABEL_118:
                *(_BYTE *)v56 = 0;
                if ((SHIBYTE(v116->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_119:
                  *(_OWORD *)&v116->__r_.__value_.__l.__data_ = __dst;
                  v116->__r_.__value_.__r.__words[2] = *(_QWORD *)v155;
                  if (!a4)
                    goto LABEL_146;
                  goto LABEL_120;
                }
LABEL_104:
                operator delete(v116->__r_.__value_.__l.__data_);
                *(_OWORD *)&v116->__r_.__value_.__l.__data_ = __dst;
                v116->__r_.__value_.__r.__words[2] = *(_QWORD *)v155;
                if (!a4)
                  goto LABEL_146;
LABEL_120:
                v82 = strlen((const char *)this);
                if (v82 > 0x7FFFFFFFFFFFFFF7)
                  std::string::__throw_length_error[abi:ne180100]();
                v83 = (void *)v82;
                if (v82 >= 0x17)
                {
                  v85 = (v82 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v82 | 7) != 0x17)
                    v85 = v82 | 7;
                  v86 = v85 + 1;
                  v84 = operator new(v85 + 1);
                  v126[1] = v83;
                  v127 = v86 | 0x8000000000000000;
                  v126[0] = v84;
                }
                else
                {
                  HIBYTE(v127) = v82;
                  v84 = v126;
                  if (!v82)
                  {
                    LOBYTE(v126[0]) = 0;
                    if ((SHIBYTE(v116->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    {
LABEL_124:
                      v125 = *v116;
LABEL_130:
                      isDumpForSysdiagnose = util::isDumpForSysdiagnose((uint64_t)v126, (uint64_t)&v125);
                      if (SHIBYTE(v125.__r_.__value_.__r.__words[2]) < 0)
                      {
                        operator delete(v125.__r_.__value_.__l.__data_);
                        if ((SHIBYTE(v127) & 0x80000000) == 0)
                        {
LABEL_132:
                          if (isDumpForSysdiagnose)
                          {
LABEL_133:
                            if ((v88 & 1) == 0
                            {
                              GetOsLogContext(void)::sOsLogContext = 0;
                              qword_2579B8240 = 0;
                              __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
                            }
                            if (GetOsLogContext(void)::onceToken == -1)
                            {
                              v89 = qword_2579B8240;
                              if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_DEFAULT))
                                goto LABEL_140;
                            }
                            else
                            {
                              dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
                              v89 = qword_2579B8240;
                              if (!os_log_type_enabled((os_log_t)qword_2579B8240, OS_LOG_TYPE_DEFAULT))
                                goto LABEL_140;
                            }
                            if ((v116->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                              v90 = v116;
                            else
                              v90 = (std::string *)v116->__r_.__value_.__r.__words[0];
                            LODWORD(__dst) = 136315138;
                            *(_QWORD *)((char *)&__dst + 4) = v90;
                            _os_log_impl(&dword_24B825000, v89, OS_LOG_TYPE_DEFAULT, "Ignore dump for sysdiagnose: %s", (uint8_t *)&__dst, 0xCu);
LABEL_140:
                            if (&v137 != v116)
                            {
                              v91 = HIBYTE(v116->__r_.__value_.__r.__words[2]);
                              if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
                              {
                                if (v91 >= 0)
                                  v94 = v116;
                                else
                                  v94 = (std::string *)v116->__r_.__value_.__r.__words[0];
                                if (v91 >= 0)
                                  v95 = HIBYTE(v116->__r_.__value_.__r.__words[2]);
                                else
                                  v95 = v116->__r_.__value_.__l.__size_;
                                std::string::__assign_no_alias<false>((void **)&v137.__r_.__value_.__l.__data_, v94, v95);
                              }
                              else
                              {
                                if ((*((_BYTE *)&v116->__r_.__value_.__s + 23) & 0x80) == 0)
                                {
                                  v137 = *v116;
LABEL_169:
                                  v65 = 0;
                                  v116->__r_.__value_.__s.__data_[0] = 0;
                                  *((_BYTE *)&v116->__r_.__value_.__s + 23) = 0;
                                  goto LABEL_151;
                                }
                                std::string::__assign_no_alias<true>(&v137, v116->__r_.__value_.__l.__data_, v116->__r_.__value_.__l.__size_);
                              }
                            }
                            if (SHIBYTE(v116->__r_.__value_.__r.__words[2]) < 0)
                            {
                              v65 = 0;
                              *v116->__r_.__value_.__l.__data_ = 0;
                              v116->__r_.__value_.__l.__size_ = 0;
                              goto LABEL_151;
                            }
                            goto LABEL_169;
                          }
                          goto LABEL_146;
                        }
                      }
                      else if ((SHIBYTE(v127) & 0x80000000) == 0)
                      {
                        goto LABEL_132;
                      }
                      operator delete(v126[0]);
                      if (isDumpForSysdiagnose)
                        goto LABEL_133;
LABEL_146:
                      v65 = 2;
LABEL_151:
                      v92 = 1;
LABEL_152:
                      v117 = v92;
                      v66 = v128[0].__begin_;
                      if (v128[0].__begin_)
                        goto LABEL_153;
                      goto LABEL_154;
                    }
LABEL_129:
                    std::string::__init_copy_ctor_external(&v125, v116->__r_.__value_.__l.__data_, v116->__r_.__value_.__l.__size_);
                    goto LABEL_130;
                  }
                }
                memcpy(v84, this, (size_t)v83);
                *((_BYTE *)v83 + (_QWORD)v84) = 0;
                if ((SHIBYTE(v116->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_124;
                goto LABEL_129;
              }
            }
            do
            {
              v81 = *v57++;
              *(_BYTE *)v56 = v81;
              v56 = (__int128 *)((char *)v56 + 1);
            }
            while (v57 != v53);
            goto LABEL_118;
          }
        }
        else
        {
          v155[7] = *(_BYTE *)p_i - (_BYTE)i;
          v55 = &__dst;
          if (i != v53)
            goto LABEL_77;
        }
        *(_BYTE *)v55 = 0;
        if ((SHIBYTE(v116->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_119;
        goto LABEL_104;
      }
LABEL_150:
      v65 = 0;
      goto LABEL_151;
    }
    if (v38 >= 0)
      v39 = &v136;
    v62 = strlen(v113);
    v10 = v116;
    if (!v62)
    {
LABEL_149:
      std::string::__assign_external(&v137, v113);
      goto LABEL_150;
    }
    v63 = v62;
    v64 = v136.__r_.__value_.__l.__size_;
    if (v38 >= 0)
      v64 = v37;
    if (v64 >= v62)
    {
      v73 = (char *)v39 + v64;
      v74 = *v113;
      v75 = v39;
      do
      {
        v76 = v64 - v63;
        if (v76 == -1)
          break;
        v77 = (char *)memchr(v75, v74, v76 + 1);
        if (!v77)
          break;
        v78 = v77;
        if (!memcmp(v77, v113, v63))
        {
          v92 = 0;
          if (v78 != v73)
          {
            v93 = v78 - (char *)v39;
            v65 = 0;
            if (v93 == -1)
              goto LABEL_152;
            goto LABEL_149;
          }
          v65 = 0;
          v117 = 0;
          v66 = v128[0].__begin_;
          if (v128[0].__begin_)
            goto LABEL_153;
          goto LABEL_154;
        }
        v75 = (std::string *)(v78 + 1);
        v64 = v73 - (v78 + 1);
      }
      while (v64 >= v63);
    }
    v65 = 0;
    v117 = 0;
    v66 = v128[0].__begin_;
    if (v128[0].__begin_)
    {
LABEL_153:
      v128[0].__end_ = v66;
      operator delete(v66);
    }
LABEL_154:
    if ((*((_BYTE *)&v136.__r_.__value_.__s + 23) & 0x80) != 0)
      break;
LABEL_155:
    if (v65 != 3)
      goto LABEL_156;
LABEL_36:
    v34 += 3;
    if (v34 == v115)
      goto LABEL_175;
  }
LABEL_109:
  operator delete(v136.__r_.__value_.__l.__data_);
  if (v65 == 3)
    goto LABEL_36;
LABEL_156:
  if (!v65)
    goto LABEL_36;
LABEL_175:
  v8 = v111;
  if ((SHIBYTE(v137.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_176;
  operator delete(v137.__r_.__value_.__l.__data_);
  if (v111)
    goto LABEL_177;
LABEL_196:
  v102 = (std::__shared_weak_count *)v147;
  if ((_QWORD)v147)
  {
    v103 = (unint64_t *)(v147 + 8);
    do
      v104 = __ldaxr(v103);
    while (__stlxr(v104 - 1, v103));
    if (!v104)
    {
      ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
      std::__shared_weak_count::__release_weak(v102);
      std::locale::~locale((std::locale *)v146);
      v105 = (std::__shared_weak_count *)v149;
      if ((_QWORD)v149)
        goto LABEL_201;
      goto LABEL_204;
    }
  }
  std::locale::~locale((std::locale *)v146);
  v105 = (std::__shared_weak_count *)v149;
  if (!(_QWORD)v149)
    goto LABEL_204;
LABEL_201:
  v106 = (unint64_t *)&v105->__shared_owners_;
  do
    v107 = __ldaxr(v106);
  while (__stlxr(v107 - 1, v106));
  if (v107)
  {
LABEL_204:
    std::locale::~locale((std::locale *)v148);
    if (SHIBYTE(v150[2]) < 0)
      goto LABEL_205;
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
    std::__shared_weak_count::__release_weak(v105);
    std::locale::~locale((std::locale *)v148);
    if (SHIBYTE(v150[2]) < 0)
LABEL_205:
      operator delete(v150[0]);
  }
  v108 = v151;
  if (v151)
  {
    v109 = v152;
    v110 = v151;
    if (v152 != v151)
    {
      do
      {
        if (*((char *)v109 - 1) < 0)
          operator delete((void *)*(v109 - 3));
        v109 -= 3;
      }
      while (v109 != v108);
      v110 = v151;
    }
    v152 = v108;
    operator delete(v110);
  }
}

void sub_24B83F1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;

  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)&STACK[0x220]);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex((std::locale *)&STACK[0x260]);
  if (SLOBYTE(STACK[0x2B7]) < 0)
    operator delete((void *)STACK[0x2A0]);
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v24 - 248));
  if (*(char *)(a24 + 23) < 0)
    operator delete(*(void **)a24);
  _Unwind_Resume(a1);
}

uint64_t util::getNumberOfLogDumps(uint64_t a1, const void **a2)
{
  char *v4;
  char *v5;
  __int128 v6;
  int v7;
  size_t v8;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  _BYTE *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  std::string *v18;
  __int128 v19;
  __int128 v20;
  int v21;
  size_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  _BYTE *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  std::string *v32;
  __int128 v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  std::sub_match<const char *> *v39;
  std::sub_match<const char *> *v40;
  _BYTE *v41;
  __int128 *v42;
  std::__compressed_pair<std::csub_match *> *p_end_cap;
  __int128 v44;
  uint64_t *v45;
  _QWORD *v46;
  const char *second;
  std::sub_match<const char *> *first;
  int v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  _BYTE *v53;
  uint64_t *v54;
  uint64_t v55;
  char **v56;
  char *v57;
  unint64_t v58;
  _OWORD *v59;
  _BYTE *v60;
  char *v61;
  __int128 *v62;
  _OWORD *v63;
  unint64_t v64;
  __int128 v65;
  void *v66;
  void **v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  void **v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint8x8_t v142;
  unint64_t v143;
  uint64_t **v144;
  uint64_t *v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const void **v150;
  void **v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const void **v155;
  void **v156;
  void **v157;
  void **v158;
  uint64_t v159;
  int v160;
  std::sub_match<const char *> *v161;
  float v162;
  _BOOL8 v163;
  unint64_t v164;
  unint64_t v165;
  size_t prime;
  void *v167;
  void *v168;
  uint64_t v169;
  _QWORD **v170;
  size_t v171;
  size_t v172;
  size_t v173;
  _QWORD *i;
  size_t v175;
  uint64_t v176;
  unint64_t v177;
  uint8x8_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  _QWORD *v182;
  unint64_t v183;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  size_t v187;
  uint64_t v188;
  std::sub_match<const char *> **v189;
  unint64_t v190;
  uint64_t v191;
  std::__shared_weak_count *v192;
  unint64_t *v193;
  unint64_t v194;
  std::__shared_weak_count *v195;
  unint64_t *v196;
  unint64_t v197;
  void **v198;
  void *v199;
  void **v200;
  void **v201;
  void *v202;
  void **v204;
  char *v205;
  uint64_t *v206;
  std::__compressed_pair<std::csub_match *> *v207;
  __int128 *v208;
  _BYTE *v209;
  std::sub_match<const char *> *v210;
  std::sub_match<const char *> *v211;
  _QWORD *v212;
  uint64_t *v213;
  void *v214[2];
  unint64_t v215;
  std::locale v216;
  __int128 v217;
  __int128 v218;
  uint64_t v219;
  std::__shared_weak_count *v220;
  uint64_t v221;
  std::string v222;
  std::locale v223[2];
  __int128 v224;
  __int128 v225;
  __int128 v226;
  _BYTE v227[48];
  __int128 v228;
  __int128 v229;
  __int128 v230;
  unint64_t v231;
  void *v232;
  std::sub_match<const char *> *v233;
  uint64_t v234;
  std::vector<std::csub_match> __p[2];
  uint64_t v236;
  _BYTE v237[32];
  uint64_t v238;
  _BYTE __dst[56];
  __int128 v240;
  __int128 v241;
  __int128 v242;
  uint64_t v243;
  uint64_t v244;

  v244 = *MEMORY[0x24BDAC8D0];
  v232 = 0;
  v233 = 0;
  v234 = 0;
  v229 = 0u;
  v230 = 0u;
  v231 = 0xAAAAAAAA3F800000;
  v4 = (char *)operator new(0x48uLL);
  v5 = v4;
  strcpy(v4, "[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2,4}-[0-9]{3}");
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v227[32] = v6;
  v228 = v6;
  *(_OWORD *)v227 = v6;
  *(_OWORD *)&v227[16] = v6;
  v7 = *((char *)a2 + 23);
  if (v7 >= 0)
    v8 = *((unsigned __int8 *)a2 + 23);
  else
    v8 = (size_t)a2[1];
  v9 = v8 + 64;
  memset(__dst, 170, 24);
  v205 = v4;
  if (v8 + 64 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v9 <= 0x16)
  {
    memset(__dst, 0, 24);
    v10 = __dst;
    __dst[23] = v8 + 64;
LABEL_10:
    if (v7 >= 0)
      v13 = a2;
    else
      v13 = *a2;
    memmove(v10, v13, v8);
    goto LABEL_14;
  }
  v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v9 | 7) != 0x17)
    v11 = v9 | 7;
  v12 = v11 + 1;
  v10 = operator new(v11 + 1);
  *(_QWORD *)&__dst[8] = v8 + 64;
  *(_QWORD *)&__dst[16] = v12 | 0x8000000000000000;
  *(_QWORD *)__dst = v10;
  if (v8)
    goto LABEL_10;
LABEL_14:
  v14 = &v10[v8];
  v15 = *(_OWORD *)v5;
  v16 = *((_OWORD *)v5 + 1);
  v17 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v14 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v14 + 3) = v17;
  *(_OWORD *)v14 = v15;
  *((_OWORD *)v14 + 1) = v16;
  v14[64] = 0;
  v18 = std::string::append((std::string *)__dst, ".*", 2uLL);
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  __p[0].__end_cap_.__value_ = (std::sub_match<const char *> *)v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p[0].__begin_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v227, (uint64_t)__p, 0);
  if (SHIBYTE(__p[0].__end_cap_.__value_) < 0)
  {
    operator delete(__p[0].__begin_);
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_16;
  }
  else if ((__dst[23] & 0x80000000) == 0)
  {
    goto LABEL_16;
  }
  operator delete(*(void **)__dst);
LABEL_16:
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v225 = v20;
  v226 = v20;
  v224 = v20;
  *(_OWORD *)&v223[0].__locale_ = v20;
  v21 = *((char *)a2 + 23);
  if (v21 >= 0)
    v22 = *((unsigned __int8 *)a2 + 23);
  else
    v22 = (size_t)a2[1];
  v23 = v22 + 64;
  memset(__dst, 170, 24);
  if (v22 + 64 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v23 <= 0x16)
  {
    memset(__dst, 0, 24);
    v24 = __dst;
    __dst[23] = v22 + 64;
LABEL_25:
    if (v21 >= 0)
      v27 = a2;
    else
      v27 = *a2;
    memmove(v24, v27, v22);
    goto LABEL_29;
  }
  v25 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v23 | 7) != 0x17)
    v25 = v23 | 7;
  v26 = v25 + 1;
  v24 = operator new(v25 + 1);
  *(_QWORD *)&__dst[8] = v22 + 64;
  *(_QWORD *)&__dst[16] = v26 | 0x8000000000000000;
  *(_QWORD *)__dst = v24;
  if (v22)
    goto LABEL_25;
LABEL_29:
  v28 = &v24[v22];
  v29 = *(_OWORD *)v5;
  v30 = *((_OWORD *)v5 + 1);
  v31 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v28 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v28 + 3) = v31;
  *(_OWORD *)v28 = v29;
  *((_OWORD *)v28 + 1) = v30;
  v28[64] = 0;
  v32 = std::string::append((std::string *)__dst, "(?=-*)(?!\\.json)", 0x10uLL);
  v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
  __p[0].__end_cap_.__value_ = (std::sub_match<const char *> *)v32->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p[0].__begin_ = v33;
  v32->__r_.__value_.__l.__size_ = 0;
  v32->__r_.__value_.__r.__words[2] = 0;
  v32->__r_.__value_.__r.__words[0] = 0;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v223, (uint64_t)__p, 0);
  if ((SHIBYTE(__p[0].__end_cap_.__value_) & 0x80000000) == 0)
  {
    if ((__dst[23] & 0x80000000) == 0)
      goto LABEL_31;
LABEL_36:
    operator delete(*(void **)__dst);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      goto LABEL_32;
    goto LABEL_37;
  }
  operator delete(__p[0].__begin_);
  if ((__dst[23] & 0x80000000) != 0)
    goto LABEL_36;
LABEL_31:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
LABEL_32:
    v222 = *(std::string *)a1;
    goto LABEL_38;
  }
LABEL_37:
  std::string::__init_copy_ctor_external(&v222, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
LABEL_38:
  std::locale::locale(&v216, (const std::locale *)v227);
  v217 = *(_OWORD *)&v227[8];
  v218 = *(_OWORD *)&v227[24];
  v219 = *(_QWORD *)&v227[40];
  v220 = (std::__shared_weak_count *)v228;
  if ((_QWORD)v228)
  {
    v34 = (unint64_t *)(v228 + 8);
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }
  v221 = *((_QWORD *)&v228 + 1);
  support::fs::getFilteredFiles((const char *)&v222, (uint64_t)&v216, (uint64_t)&v232, 0);
  v36 = v220;
  if (!v220)
    goto LABEL_45;
  p_shared_owners = (unint64_t *)&v220->__shared_owners_;
  do
    v38 = __ldaxr(p_shared_owners);
  while (__stlxr(v38 - 1, p_shared_owners));
  if (!v38)
  {
    ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
    std::__shared_weak_count::__release_weak(v36);
    std::locale::~locale(&v216);
    if ((SHIBYTE(v222.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_46:
      v40 = (std::sub_match<const char *> *)v232;
      v39 = v233;
      if (v232 == v233)
        goto LABEL_234;
      goto LABEL_50;
    }
  }
  else
  {
LABEL_45:
    std::locale::~locale(&v216);
    if ((SHIBYTE(v222.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_46;
  }
  operator delete(v222.__r_.__value_.__l.__data_);
  v40 = (std::sub_match<const char *> *)v232;
  v39 = v233;
  if (v232 == v233)
    goto LABEL_234;
LABEL_50:
  v41 = &__dst[48];
  v42 = &v241;
  p_end_cap = &__p[1].__end_cap_;
  v213 = &v236;
  v211 = (std::sub_match<const char *> *)&v230;
  v212 = v237;
  v206 = (uint64_t *)&__dst[24];
  v209 = &__dst[48];
  v210 = v39;
  v207 = &__p[1].__end_cap_;
  v208 = &v241;
  while (2)
  {
    *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v241 = v44;
    v242 = v44;
    *(_OWORD *)&__dst[40] = v44;
    v240 = v44;
    *(_QWORD *)v41 = 0;
    *((_QWORD *)v41 + 1) = 0;
    v41[16] = 0;
    *(_QWORD *)v42 = 0;
    *((_QWORD *)v42 + 1) = 0;
    *((_BYTE *)v42 + 16) = 0;
    BYTE8(v242) = 0;
    v243 = 0;
    memset(__dst, 0, 41);
    *(_OWORD *)&p_end_cap[4].__value_ = v44;
    *(_OWORD *)&p_end_cap[6].__value_ = v44;
    *(_OWORD *)&p_end_cap->__value_ = v44;
    *(_OWORD *)&p_end_cap[2].__value_ = v44;
    v45 = v213;
    *v213 = 0;
    v45[1] = 0;
    *((_BYTE *)v45 + 16) = 0;
    v46 = v212;
    *v212 = 0;
    v46[1] = 0;
    *((_BYTE *)v46 + 16) = 0;
    v237[24] = 0;
    v238 = 0;
    memset(__p, 0, 41);
    second = (const char *)*((unsigned __int8 *)&v40->matched + 7);
    if ((char)second >= 0)
      first = v40;
    else
      first = (std::sub_match<const char *> *)v40->first;
    if ((char)second < 0)
      second = v40->second;
    v49 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v223, first, (std::sub_match<const char *> *)&second[(_QWORD)first], __p, 0);
    v50 = (const char *)*((unsigned __int8 *)&v40->matched + 7);
    if ((char)v50 >= 0)
      v51 = (uint64_t)v40;
    else
      v51 = (uint64_t)v40->first;
    if ((char)v50 < 0)
      v50 = v40->second;
    std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)__dst, v51, (std::sub_match<std::__wrap_iter<const char *>> *)&v50[v51], (uint64_t *)__p, 0);
    if (__p[0].__begin_)
    {
      __p[0].__end_ = __p[0].__begin_;
      operator delete(__p[0].__begin_);
    }
    v52 = *(void **)__dst;
    if (!v49)
      goto LABEL_232;
    if (*(_QWORD *)&__dst[8] == *(_QWORD *)__dst)
      v53 = &__dst[40];
    else
      v53 = (_BYTE *)(*(_QWORD *)__dst + 16);
    if (!*v53)
    {
      v66 = 0;
      v67 = 0;
      v68 = 0;
      v214[0] = 0;
      v214[1] = 0;
      v215 = 0;
      goto LABEL_90;
    }
    v54 = v206;
    if (*(_QWORD *)&__dst[8] != *(_QWORD *)__dst)
      v54 = *(uint64_t **)__dst;
    v55 = *v54;
    v56 = (char **)(*(_QWORD *)__dst + 8);
    if (*(_QWORD *)&__dst[8] == *(_QWORD *)__dst)
      v56 = (char **)&__dst[32];
    v57 = *v56;
    v58 = (unint64_t)&(*v56)[-v55];
    if (v58 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v58 > 0x16)
    {
      v69 = (v58 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v58 | 7) != 0x17)
        v69 = v58 | 7;
      v70 = v69 + 1;
      v59 = operator new(v69 + 1);
      v214[1] = (void *)v58;
      v215 = v70 | 0x8000000000000000;
      v214[0] = v59;
      if ((char *)v55 != v57)
        goto LABEL_76;
LABEL_86:
      v60 = v59;
      goto LABEL_89;
    }
    HIBYTE(v215) = *(_BYTE *)v56 - v55;
    v59 = v214;
    if ((char *)v55 == v57)
      goto LABEL_86;
LABEL_76:
    if (v58 < 0x20 || (unint64_t)v59 - v55 < 0x20)
    {
      v60 = v59;
      v61 = (char *)v55;
    }
    else
    {
      v60 = (char *)v59 + (v58 & 0xFFFFFFFFFFFFFFE0);
      v61 = (char *)(v55 + (v58 & 0xFFFFFFFFFFFFFFE0));
      v62 = (__int128 *)(v55 + 16);
      v63 = v59 + 1;
      v64 = v58 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v65 = *v62;
        *(v63 - 1) = *(v62 - 1);
        *v63 = v65;
        v62 += 2;
        v63 += 2;
        v64 -= 32;
      }
      while (v64);
      if (v58 == (v58 & 0x7FFFFFFFFFFFFFE0))
        goto LABEL_89;
    }
    do
    {
      v71 = *v61++;
      *v60++ = v71;
    }
    while (v61 != v57);
LABEL_89:
    *v60 = 0;
    v68 = HIBYTE(v215);
    v67 = (void **)v214[0];
    v66 = v214[1];
LABEL_90:
    if ((v68 & 0x80u) == 0)
      v72 = v214;
    else
      v72 = v67;
    if ((v68 & 0x80u) == 0)
      v73 = v68;
    else
      v73 = (unint64_t)v66;
    if (v73 > 0x20)
    {
      if (v73 <= 0x40)
      {
        if ((v68 & 0x80u) == 0)
          v67 = v214;
        v77 = (char *)v67[3];
        v78 = *(uint64_t *)((char *)v72 + v73 - 16);
        v79 = (uint64_t)*v72 - 0x3C5A37A36834CED9 * v78 + 0xC3A5C85C97CB3127 * v73;
        v80 = __ROR8__(&v77[v79], 52);
        v82 = (char *)v67[1];
        v81 = (char *)v67[2];
        v83 = &v82[v79];
        v84 = __ROR8__(v83, 7);
        v85 = &v81[(_QWORD)v83];
        v86 = v84
            + __ROR8__((char *)*v72 - 0x3C5A37A36834CED9 * v78 + 0xC3A5C85C97CB3127 * v73, 37)
            + v80
            + __ROR8__(v85, 31);
        v87 = &v81[*(_QWORD *)((char *)v72 + v73 - 32)];
        v88 = &v77[*(_QWORD *)((char *)v72 + v73 - 8)];
        v89 = __ROR8__(&v87[(_QWORD)v88], 52);
        v90 = __ROR8__(v87, 37);
        v91 = &v87[*(_QWORD *)((char *)v72 + v73 - 24)];
        v92 = __ROR8__(v91, 7);
        v93 = &v91[v78];
        v94 = &v88[(_QWORD)v93];
        v95 = &v77[v90 + v92 + v89 + __ROR8__(v93, 31) + (_QWORD)v85];
        v96 = 0x9AE16A3B2F90404FLL;
        v97 = v86
            - 0x3C5A37A36834CED9
            * ((0xC3A5C85C97CB3127 * (_QWORD)&v94[v86] - 0x651E95C4D06FBFB1 * (_QWORD)v95) ^ ((0xC3A5C85C97CB3127
                                                                                                 * (unint64_t)&v94[v86]
                                                                                                 - 0x651E95C4D06FBFB1
                                                                                                 * (_QWORD)v95) >> 47));
        goto LABEL_108;
      }
      v104 = *(uint64_t *)((char *)v72 + v73 - 48);
      v105 = *(uint64_t *)((char *)v72 + v73 - 40);
      v106 = *(uint64_t *)((char *)v72 + v73 - 24);
      v107 = *(uint64_t *)((char *)v72 + v73 - 56);
      v108 = *(uint64_t *)((char *)v72 + v73 - 16);
      v109 = *(uint64_t *)((char *)v72 + v73 - 8);
      v110 = v107 + v108;
      v111 = 0x9DDFEA08EB382D69
           * (v106 ^ ((0x9DDFEA08EB382D69 * (v106 ^ (v104 + v73))) >> 47) ^ (0x9DDFEA08EB382D69
                                                                             * (v106 ^ (v104 + v73))));
      v112 = 0x9DDFEA08EB382D69 * (v111 ^ (v111 >> 47));
      v113 = *(char **)((char *)v72 + v73 - 64) + v73;
      v114 = &v113[v104 + v107];
      v115 = &v114[v105];
      v116 = (uint64_t)&v113[__ROR8__(v114, 44) + __ROR8__(&v113[v105 + v112], 21)];
      v117 = *(uint64_t *)((char *)v72 + v73 - 32) + v107 + v108 - 0x4B6D499041670D8DLL;
      v118 = v106 + v108 + v117;
      v119 = v118 + v109;
      v120 = __ROR8__(v118, 44) + v117 + __ROR8__(v117 + v105 + v109, 21);
      v121 = v72 + 4;
      v122 = (uint64_t)*v72 - 0x4B6D499041670D8DLL * v105;
      v123 = -(uint64_t)((v73 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v124 = *(v121 - 3);
        v125 = &v115[v122 + v110 + v124];
        v126 = v121[2];
        v127 = v121[3];
        v128 = v121[1];
        v110 = (unint64_t)&v115[v128 + 0xB492B66FBE98F273 * __ROR8__(v110 + v116 + v126, 42)];
        v129 = v112 + v119;
        v130 = *(v121 - 2);
        v131 = *(v121 - 1);
        v132 = *(v121 - 4) - 0x4B6D499041670D8DLL * v116;
        v133 = v132 + v119 + v131;
        v134 = v132 + v124 + v130;
        v115 = (char *)(v134 + v131);
        v135 = __ROR8__(v134, 44) + v132;
        v136 = (0xB492B66FBE98F273 * __ROR8__(v125, 37)) ^ v120;
        v122 = 0xB492B66FBE98F273 * __ROR8__(v129, 33);
        v116 = v135 + __ROR8__(v133 + v136, 21);
        v137 = v122 + v120 + *v121;
        v119 = v128 + v126 + v137 + v127;
        v120 = __ROR8__(v128 + v126 + v137, 44) + v137 + __ROR8__(v110 + v130 + v137 + v127, 21);
        v121 += 8;
        v112 = v136;
        v123 += 64;
      }
      while (v123);
      v138 = 0x9DDFEA08EB382D69
           * (v120 ^ ((0x9DDFEA08EB382D69 * (v120 ^ v116)) >> 47) ^ (0x9DDFEA08EB382D69 * (v120 ^ v116)));
      v139 = v122 - 0x622015F714C7D297 * (v138 ^ (v138 >> 47));
      v140 = 0x9DDFEA08EB382D69
           * (v139 ^ (v136
                    - 0x4B6D499041670D8DLL * (v110 ^ (v110 >> 47))
                    - 0x622015F714C7D297
                    * ((0x9DDFEA08EB382D69
                      * (v119 ^ ((0x9DDFEA08EB382D69 * (v119 ^ (unint64_t)v115)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                                  * (v119 ^ (unint64_t)v115)))) ^ ((0x9DDFEA08EB382D69 * (v119 ^ ((0x9DDFEA08EB382D69 * (v119 ^ (unint64_t)v115)) >> 47) ^ (0x9DDFEA08EB382D69 * (v119 ^ (unint64_t)v115)))) >> 47))));
      v76 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69 * (v139 ^ (v140 >> 47) ^ v140)) ^ ((0x9DDFEA08EB382D69
                                                                     * (v139 ^ (v140 >> 47) ^ v140)) >> 47));
    }
    else
    {
      if (v73 > 0x10)
      {
        v98 = 0xB492B66FBE98F273 * (_QWORD)*v72;
        if ((v68 & 0x80u) == 0)
          v67 = v214;
        v99 = (unint64_t)v67[1];
        v100 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)v72 + v73 - 8), 30)
             + __ROR8__(v98 - v99, 43)
             - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)v72 + v73 - 16);
        v101 = v98
             + v73
             + __ROR8__(v99 ^ 0xC949D7C7509E6557, 20)
             - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)v72 + v73 - 8);
        v102 = v100 ^ v101;
        v96 = 0x9DDFEA08EB382D69;
        v103 = v101 ^ ((0x9DDFEA08EB382D69 * v102) >> 47) ^ (0x9DDFEA08EB382D69 * v102);
        goto LABEL_107;
      }
      if (v73 >= 9)
      {
        v74 = *(uint64_t *)((char *)v72 + v73 - 8);
        v75 = __ROR8__(v74 + v73, v73);
        v76 = (0x9DDFEA08EB382D69
             * ((0x9DDFEA08EB382D69
               * (v75 ^ ((0x9DDFEA08EB382D69 * (v75 ^ (unint64_t)*v72)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                         * (v75 ^ (unint64_t)*v72)))) ^ ((0x9DDFEA08EB382D69 * (v75 ^ ((0x9DDFEA08EB382D69 * (v75 ^ (unint64_t)*v72)) >> 47) ^ (0x9DDFEA08EB382D69 * (v75 ^ (unint64_t)*v72)))) >> 47))) ^ v74;
        goto LABEL_112;
      }
      if (v73 >= 4)
      {
        v180 = *(unsigned int *)((char *)v72 + v73 - 4);
        v96 = 0x9DDFEA08EB382D69;
        v181 = 0x9DDFEA08EB382D69 * ((v73 + (8 * *(_DWORD *)v72)) ^ v180);
        v103 = v180 ^ (v181 >> 47) ^ v181;
LABEL_107:
        v97 = 0x9DDFEA08EB382D69 * v103;
LABEL_108:
        v76 = (v97 ^ (v97 >> 47)) * v96;
        goto LABEL_112;
      }
      v76 = 0x9AE16A3B2F90404FLL;
      if (v73)
      {
        v183 = (0xC949D7C7509E6557 * (v73 + 4 * *((unsigned __int8 *)v72 + v73 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                           * (*(unsigned __int8 *)v72 | ((unint64_t)*((unsigned __int8 *)v72 + (v73 >> 1)) << 8)));
        v76 = 0x9AE16A3B2F90404FLL * (v183 ^ (v183 >> 47));
      }
    }
LABEL_112:
    v141 = *((_QWORD *)&v229 + 1);
    if (!*((_QWORD *)&v229 + 1))
    {
      v143 = 0xAAAAAAAAAAAAAAAALL;
LABEL_155:
      __p[0].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAA01;
      v161 = (std::sub_match<const char *> *)operator new(0x28uLL);
      __p[0].__begin_ = v161;
      __p[0].__end_ = v211;
      v161->first = 0;
      v161->second = (const char *)v76;
      *(_OWORD *)&v161->matched = *(_OWORD *)v214;
      v161[1].second = (const char *)v215;
      v214[0] = 0;
      v214[1] = 0;
      v215 = 0;
      v162 = (float)(unint64_t)(*((_QWORD *)&v230 + 1) + 1);
      if (v141 && (float)(*(float *)&v231 * (float)v141) >= v162)
      {
        v76 = v143;
        v41 = v209;
        v39 = v210;
        goto LABEL_220;
      }
      v163 = (v141 & (v141 - 1)) != 0;
      if (v141 < 3)
        v163 = 1;
      v164 = v163 | (2 * v141);
      v165 = vcvtps_u32_f32(v162 / *(float *)&v231);
      if (v164 <= v165)
        prime = v165;
      else
        prime = v164;
      if (prime == 1)
      {
        prime = 2;
        v41 = v209;
        v39 = v210;
      }
      else
      {
        v41 = v209;
        v39 = v210;
        if ((prime & (prime - 1)) != 0)
        {
          prime = std::__next_prime(prime);
          v141 = *((_QWORD *)&v229 + 1);
        }
      }
      if (prime <= v141)
      {
        if (prime >= v141)
          goto LABEL_208;
        v177 = vcvtps_u32_f32((float)*((unint64_t *)&v230 + 1) / *(float *)&v231);
        if (v141 < 3 || (v178 = (uint8x8_t)vcnt_s8((int8x8_t)v141), v178.i16[0] = vaddlv_u8(v178), v178.u32[0] > 1uLL))
        {
          v177 = std::__next_prime(v177);
        }
        else
        {
          v179 = 1 << -(char)__clz(v177 - 1);
          if (v177 >= 2)
            v177 = v179;
        }
        if (prime <= v177)
          prime = v177;
        if (prime >= v141)
        {
          v141 = *((_QWORD *)&v229 + 1);
          v185 = *((_QWORD *)&v229 + 1) - 1;
          if ((*((_QWORD *)&v229 + 1) & (*((_QWORD *)&v229 + 1) - 1)) != 0)
          {
LABEL_218:
            if (v76 >= v141)
              v76 %= v141;
LABEL_220:
            v188 = v229;
            v189 = *(std::sub_match<const char *> ***)(v229 + 8 * v76);
            if (v189)
            {
              v161->first = (const char *)*v189;
            }
            else
            {
              v161->first = (const char *)v230;
              *(_QWORD *)&v230 = v161;
              *(_QWORD *)(v188 + 8 * v76) = v211;
              if (!v161->first)
                goto LABEL_229;
              v190 = *((_QWORD *)v161->first + 1);
              if ((v141 & (v141 - 1)) != 0)
              {
                if (v190 >= v141)
                  v190 %= v141;
              }
              else
              {
                v190 &= v141 - 1;
              }
              v189 = (std::sub_match<const char *> **)(v229 + 8 * v190);
            }
            *v189 = v161;
LABEL_229:
            ++*((_QWORD *)&v230 + 1);
            if ((v215 & 0x8000000000000000) != 0)
              goto LABEL_230;
            goto LABEL_231;
          }
LABEL_209:
          v76 &= v185;
          goto LABEL_220;
        }
        if (!prime)
        {
          v184 = (void *)v229;
          *(_QWORD *)&v229 = 0;
          if (v184)
            operator delete(v184);
          v141 = 0;
          *((_QWORD *)&v229 + 1) = 0;
          v185 = -1;
          goto LABEL_209;
        }
      }
      if (prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v167 = operator new(8 * prime);
      v168 = (void *)v229;
      *(_QWORD *)&v229 = v167;
      if (v168)
        operator delete(v168);
      v169 = 0;
      *((_QWORD *)&v229 + 1) = prime;
      do
        *(_QWORD *)(v229 + 8 * v169++) = 0;
      while (prime != v169);
      v170 = (_QWORD **)v230;
      if (!(_QWORD)v230)
      {
LABEL_217:
        v141 = prime;
        v185 = prime - 1;
        if ((prime & (prime - 1)) != 0)
          goto LABEL_218;
        goto LABEL_209;
      }
      v171 = *(_QWORD *)(v230 + 8);
      v172 = prime - 1;
      if ((prime & (prime - 1)) == 0)
      {
        v173 = v171 & v172;
        *(_QWORD *)(v229 + 8 * v173) = v211;
        for (i = *v170; *v170; i = *v170)
        {
          v175 = i[1] & v172;
          if (v175 == v173)
          {
            v170 = (_QWORD **)i;
          }
          else if (*(_QWORD *)(v229 + 8 * v175))
          {
            *v170 = (_QWORD *)*i;
            v176 = 8 * v175;
            *i = **(_QWORD **)(v229 + v176);
            **(_QWORD **)(v229 + v176) = i;
          }
          else
          {
            *(_QWORD *)(v229 + 8 * v175) = v170;
            v170 = (_QWORD **)i;
            v173 = v175;
          }
        }
        goto LABEL_217;
      }
      if (v171 < prime)
      {
        *(_QWORD *)(v229 + 8 * v171) = v211;
        v182 = *v170;
        if (*v170)
          goto LABEL_212;
        goto LABEL_207;
      }
      v171 %= prime;
      *(_QWORD *)(v229 + 8 * v171) = v211;
      v182 = *v170;
      if (!*v170)
      {
LABEL_207:
        v141 = prime;
LABEL_208:
        v185 = v141 - 1;
        if ((v141 & (v141 - 1)) != 0)
          goto LABEL_218;
        goto LABEL_209;
      }
      while (1)
      {
LABEL_212:
        v187 = v182[1];
        if (v187 >= prime)
          v187 %= prime;
        if (v187 == v171)
          goto LABEL_211;
        if (*(_QWORD *)(v229 + 8 * v187))
        {
          *v170 = (_QWORD *)*v182;
          v186 = 8 * v187;
          *v182 = **(_QWORD **)(v229 + v186);
          **(_QWORD **)(v229 + v186) = v182;
          v182 = v170;
LABEL_211:
          v170 = (_QWORD **)v182;
          v182 = (_QWORD *)*v182;
          if (!v182)
            goto LABEL_217;
        }
        else
        {
          *(_QWORD *)(v229 + 8 * v187) = v170;
          v170 = (_QWORD **)v182;
          v182 = (_QWORD *)*v182;
          v171 = v187;
          if (!v182)
            goto LABEL_217;
        }
      }
    }
    v142 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v229 + 8));
    v142.i16[0] = vaddlv_u8(v142);
    if (v142.u32[0] > 1uLL)
    {
      v143 = v76;
      if (v76 >= *((_QWORD *)&v229 + 1))
        v143 = v76 % *((_QWORD *)&v229 + 1);
    }
    else
    {
      v143 = (*((_QWORD *)&v229 + 1) - 1) & v76;
    }
    v144 = *(uint64_t ***)(v229 + 8 * v143);
    if (!v144)
      goto LABEL_155;
    v145 = *v144;
    if (!*v144)
      goto LABEL_155;
    if (v142.u32[0] < 2uLL)
    {
      v146 = *((_QWORD *)&v229 + 1) - 1;
      while (1)
      {
        v152 = v145[1];
        if (v152 == v76)
        {
          v153 = *((unsigned __int8 *)v145 + 39);
          if ((v153 & 0x80u) == 0)
            v154 = *((unsigned __int8 *)v145 + 39);
          else
            v154 = v145[3];
          if (v154 == v73)
          {
            v155 = (const void **)(v145 + 2);
            if ((v153 & 0x80) != 0)
            {
              v157 = v72;
              v158 = v72;
              v159 = v146;
              v160 = memcmp(*v155, v157, v145[3]);
              v146 = v159;
              v72 = v158;
              if (!v160)
                goto LABEL_153;
            }
            else
            {
              if (!*((_BYTE *)v145 + 39))
                goto LABEL_153;
              v156 = v72;
              while (*(unsigned __int8 *)v155 == *(unsigned __int8 *)v156)
              {
                v155 = (const void **)((char *)v155 + 1);
                v156 = (void **)((char *)v156 + 1);
                if (!--v153)
                  goto LABEL_153;
              }
            }
          }
        }
        else if ((v152 & v146) != v143)
        {
          goto LABEL_155;
        }
        v145 = (uint64_t *)*v145;
        if (!v145)
          goto LABEL_155;
      }
    }
    while (1)
    {
      v147 = v145[1];
      if (v147 == v76)
        break;
      if (v147 >= v141)
        v147 %= v141;
      if (v147 != v143)
        goto LABEL_155;
LABEL_123:
      v145 = (uint64_t *)*v145;
      if (!v145)
        goto LABEL_155;
    }
    v148 = *((unsigned __int8 *)v145 + 39);
    if ((v148 & 0x80u) == 0)
      v149 = *((unsigned __int8 *)v145 + 39);
    else
      v149 = v145[3];
    if (v149 != v73)
      goto LABEL_123;
    v150 = (const void **)(v145 + 2);
    if ((v148 & 0x80) == 0)
    {
      if (!*((_BYTE *)v145 + 39))
        goto LABEL_153;
      v151 = v72;
      while (*(unsigned __int8 *)v150 == *(unsigned __int8 *)v151)
      {
        v150 = (const void **)((char *)v150 + 1);
        v151 = (void **)((char *)v151 + 1);
        if (!--v148)
          goto LABEL_153;
      }
      goto LABEL_123;
    }
    if (memcmp(*v150, v72, v145[3]))
      goto LABEL_123;
LABEL_153:
    v41 = v209;
    v39 = v210;
    if ((v68 & 0x80) != 0)
LABEL_230:
      operator delete(v214[0]);
LABEL_231:
    v52 = *(void **)__dst;
    p_end_cap = v207;
    v42 = v208;
LABEL_232:
    if (v52)
    {
      *(_QWORD *)&__dst[8] = v52;
      operator delete(v52);
    }
    if (++v40 != v39)
      continue;
    break;
  }
LABEL_234:
  v191 = *((_QWORD *)&v230 + 1);
  v192 = (std::__shared_weak_count *)v226;
  if ((_QWORD)v226)
  {
    v193 = (unint64_t *)(v226 + 8);
    do
      v194 = __ldaxr(v193);
    while (__stlxr(v194 - 1, v193));
    if (!v194)
    {
      ((void (*)(std::__shared_weak_count *))v192->__on_zero_shared)(v192);
      std::__shared_weak_count::__release_weak(v192);
    }
  }
  std::locale::~locale(v223);
  v195 = (std::__shared_weak_count *)v228;
  if ((_QWORD)v228)
  {
    v196 = (unint64_t *)(v228 + 8);
    do
      v197 = __ldaxr(v196);
    while (__stlxr(v197 - 1, v196));
    if (!v197)
    {
      ((void (*)(std::__shared_weak_count *))v195->__on_zero_shared)(v195);
      std::__shared_weak_count::__release_weak(v195);
    }
  }
  std::locale::~locale((std::locale *)v227);
  operator delete(v205);
  v198 = (void **)v230;
  if ((_QWORD)v230)
  {
    do
    {
      v204 = (void **)*v198;
      if (*((char *)v198 + 39) < 0)
        operator delete(v198[2]);
      operator delete(v198);
      v198 = v204;
    }
    while (v204);
  }
  v199 = (void *)v229;
  *(_QWORD *)&v229 = 0;
  if (v199)
    operator delete(v199);
  v200 = (void **)v232;
  if (v232)
  {
    v201 = (void **)v233;
    v202 = v232;
    if (v233 != v232)
    {
      do
      {
        if (*((char *)v201 - 1) < 0)
          operator delete(*(v201 - 3));
        v201 -= 3;
      }
      while (v201 != v200);
      v202 = v232;
    }
    v233 = (std::sub_match<const char *> *)v200;
    operator delete(v202);
  }
  return v191;
}

void sub_24B840730(_Unwind_Exception *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  operator delete(v2);
  std::unordered_set<std::string>::~unordered_set[abi:ne180100](&v3);
  std::vector<std::string>::~vector[abi:ne180100](&v4);
  _Unwind_Resume(a1);
}

void sub_24B840738()
{
  __cxa_end_catch();
  JUMPOUT(0x24B840740);
}

void sub_24B840760(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t std::unordered_set<std::string>::~unordered_set[abi:ne180100](uint64_t a1)
{
  void **v2;
  void *v3;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      v5 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v5;
    }
    while (v5);
  }
  v3 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v3)
    operator delete(v3);
  return a1;
}

uint64_t util::compareTwoStringsWithPattern(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  std::sub_match<const char *> *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  std::vector<std::ssub_match>::pointer begin;
  std::vector<std::ssub_match>::pointer end;
  __int128 v14;
  std::__wrap_iter<const char *>::iterator_type v15;
  std::__wrap_iter<const char *>::iterator_type i;
  unint64_t v17;
  std::sub_match<const char *> *v18;
  std::sub_match<const char *> *v19;
  _BYTE *v20;
  __int128 *v21;
  BOOL *p_matched;
  unint64_t v23;
  __int128 v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char *v29;
  char *v30;
  char *v31;
  void **v32;
  __int128 v33;
  uint64_t v34;
  std::sub_match<const char *> *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  std::vector<std::ssub_match>::pointer v39;
  std::vector<std::ssub_match>::pointer v40;
  __int128 v41;
  std::__wrap_iter<const char *>::iterator_type v42;
  std::__wrap_iter<const char *>::iterator_type v43;
  unint64_t v44;
  std::sub_match<const char *> *v45;
  std::sub_match<const char *> *v46;
  _BYTE *v47;
  __int128 *v48;
  BOOL *v49;
  unint64_t v50;
  __int128 v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  void **v62;
  char *v63;
  char *v64;
  std::__shared_weak_count *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  char *v70;
  uint64_t v71;
  char *v72;
  unint64_t *p_shared_owners;
  unint64_t v74;
  void *__p;
  char *v77;
  unint64_t v78;
  void *v79;
  char *v80;
  unint64_t v81;
  std::locale v82[2];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  std::vector<std::ssub_match> v86[2];
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  std::vector<std::csub_match> v94[2];
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;

  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v89 = 0xAAAAAAAAAAAAAA00;
  v86[1].__end_cap_.__value_ = (std::sub_match<std::__wrap_iter<const char *>> *)0xAAAAAAAAAAAAAAAALL;
  v92 = v5;
  v87 = 0;
  v88 = 0;
  v90 = 0;
  v91 = 0;
  LOBYTE(v92) = 0;
  BYTE8(v92) = 0;
  v93 = 0;
  memset(v86, 0, 41);
  v84 = v5;
  v85 = v5;
  *(_OWORD *)&v82[0].__locale_ = v5;
  v83 = v5;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]<std::char_traits<char>,std::allocator<char>>((uint64_t)v82, a3, 0);
  v79 = 0;
  v80 = 0;
  v81 = 0;
  __p = 0;
  v77 = 0;
  v78 = 0;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v97 = 0xAAAAAAAAAAAAAA00;
  v94[1].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAAAALL;
  v100 = v6;
  v95 = 0;
  v96 = 0;
  v98 = 0;
  v99 = 0;
  LOBYTE(v100) = 0;
  BYTE8(v100) = 0;
  v101 = 0;
  memset(v94, 0, 32);
  v7 = *(unsigned __int8 *)(a1 + 23);
  if ((v7 & 0x80u) == 0)
    v8 = (std::sub_match<const char *> *)a1;
  else
    v8 = *(std::sub_match<const char *> **)a1;
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)((char *)&v94[1].__begin_ + 1) = 0uLL;
  v9 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v82, v8, (std::sub_match<const char *> *)((char *)v8 + v7), v94, 0);
  v10 = *(unsigned __int8 *)(a1 + 23);
  if ((v10 & 0x80u) == 0)
    v11 = a1;
  else
    v11 = *(_QWORD *)a1;
  if ((v10 & 0x80u) != 0)
    v10 = *(_QWORD *)(a1 + 8);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v86, v11, (std::sub_match<std::__wrap_iter<const char *>> *)(v11 + v10), (uint64_t *)v94, 0);
  if (v94[0].__begin_)
  {
    v94[0].__end_ = v94[0].__begin_;
    operator delete(v94[0].__begin_);
  }
  if (v9)
  {
    end = v86[0].__end_;
    begin = v86[0].__begin_;
    if (v86[0].__begin_ != v86[0].__end_)
    {
      while (1)
      {
        if (!begin->matched)
        {
          memset(v94, 0, 24);
          v25 = v80;
          if ((unint64_t)v80 >= v81)
            goto LABEL_38;
          goto LABEL_16;
        }
        i = begin->first.__i_;
        v15 = begin->second.__i_;
        v17 = v15 - begin->first.__i_;
        if (v17 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v17 > 0x16)
        {
          v26 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v17 | 7) != 0x17)
            v26 = v17 | 7;
          v27 = v26 + 1;
          v18 = (std::sub_match<const char *> *)operator new(v26 + 1);
          v94[0].__end_ = (std::vector<std::csub_match>::pointer)v17;
          v94[0].__end_cap_.__value_ = (std::sub_match<const char *> *)(v27 | 0x8000000000000000);
          v94[0].__begin_ = v18;
          if (i == v15)
          {
LABEL_33:
            LOBYTE(v18->first) = 0;
            v25 = v80;
            if ((unint64_t)v80 >= v81)
              goto LABEL_38;
            goto LABEL_16;
          }
        }
        else
        {
          HIBYTE(v94[0].__end_cap_.__value_) = (_BYTE)v15 - LOBYTE(begin->first.__i_);
          v18 = (std::sub_match<const char *> *)v94;
          if (i == v15)
            goto LABEL_33;
        }
        if (v17 < 0x20 || (unint64_t)((char *)v18 - i) < 0x20)
          break;
        v19 = (std::sub_match<const char *> *)((char *)v18 + (v17 & 0xFFFFFFFFFFFFFFE0));
        v20 = &i[v17 & 0xFFFFFFFFFFFFFFE0];
        v21 = (__int128 *)(i + 16);
        p_matched = &v18->matched;
        v23 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v24 = *v21;
          *((_OWORD *)p_matched - 1) = *(v21 - 1);
          *(_OWORD *)p_matched = v24;
          v21 += 2;
          p_matched += 32;
          v23 -= 32;
        }
        while (v23);
        if (v17 != (v17 & 0x7FFFFFFFFFFFFFE0))
          goto LABEL_36;
LABEL_37:
        LOBYTE(v19->first) = 0;
        v25 = v80;
        if ((unint64_t)v80 >= v81)
        {
LABEL_38:
          v80 = std::vector<std::string>::__push_back_slow_path<std::string>(&v79, (uint64_t)v94);
          if (SHIBYTE(v94[0].__end_cap_.__value_) < 0)
            operator delete(v94[0].__begin_);
          goto LABEL_17;
        }
LABEL_16:
        v14 = *(_OWORD *)&v94[0].__begin_;
        *((_QWORD *)v25 + 2) = v94[0].__end_cap_.__value_;
        *(_OWORD *)v25 = v14;
        v80 = v25 + 24;
LABEL_17:
        if (++begin == end)
          goto LABEL_40;
      }
      v19 = v18;
      v20 = i;
      do
      {
LABEL_36:
        v28 = *v20++;
        LOBYTE(v19->first) = v28;
        v19 = (std::sub_match<const char *> *)((char *)v19 + 1);
      }
      while (v20 != v15);
      goto LABEL_37;
    }
LABEL_40:
    v29 = (char *)v79;
    v30 = v80;
    if (v80 - (_BYTE *)v79 != 24)
    {
      if ((char *)v79 + 24 != v80)
      {
        v31 = (char *)v79 + 23;
        do
        {
          v32 = (void **)(v31 - 23);
          if (*v31 < 0)
            operator delete(*v32);
          *(_OWORD *)v32 = *(_OWORD *)(v31 + 1);
          *(_QWORD *)(v31 - 7) = *(_QWORD *)(v31 + 17);
          v31[24] = 0;
          v31 += 24;
          *(v31 - 23) = 0;
          v29 += 24;
        }
        while (v31 + 1 != v30);
        v30 = v80;
      }
      while (v30 != v29)
      {
        if (*(v30 - 1) < 0)
          operator delete(*((void **)v30 - 3));
        v30 -= 24;
      }
      v80 = v29;
    }
    *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v97 = 0xAAAAAAAAAAAAAA00;
    v94[1].__end_cap_.__value_ = (std::sub_match<const char *> *)0xAAAAAAAAAAAAAAAALL;
    v100 = v33;
    v95 = 0;
    v96 = 0;
    v98 = 0;
    v99 = 0;
    LOBYTE(v100) = 0;
    BYTE8(v100) = 0;
    v101 = 0;
    memset(v94, 0, 32);
    v34 = *(unsigned __int8 *)(a2 + 23);
    if ((v34 & 0x80u) == 0)
      v35 = (std::sub_match<const char *> *)a2;
    else
      v35 = *(std::sub_match<const char *> **)a2;
    if ((v34 & 0x80u) != 0)
      v34 = *(_QWORD *)(a2 + 8);
    *(_OWORD *)((char *)&v94[1].__begin_ + 1) = 0uLL;
    v36 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v82, v35, (std::sub_match<const char *> *)((char *)v35 + v34), v94, 0);
    v37 = *(unsigned __int8 *)(a2 + 23);
    if ((v37 & 0x80u) == 0)
      v38 = a2;
    else
      v38 = *(_QWORD *)a2;
    if ((v37 & 0x80u) != 0)
      v37 = *(_QWORD *)(a2 + 8);
    std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(v86, v38, (std::sub_match<std::__wrap_iter<const char *>> *)(v38 + v37), (uint64_t *)v94, 0);
    if (v94[0].__begin_)
    {
      v94[0].__end_ = v94[0].__begin_;
      operator delete(v94[0].__begin_);
    }
    if (v36)
    {
      v40 = v86[0].__end_;
      v39 = v86[0].__begin_;
      if (v86[0].__begin_ != v86[0].__end_)
      {
        while (1)
        {
          if (!v39->matched)
          {
            memset(v94, 0, 24);
            v52 = v77;
            if ((unint64_t)v77 >= v78)
              goto LABEL_89;
            goto LABEL_67;
          }
          v43 = v39->first.__i_;
          v42 = v39->second.__i_;
          v44 = v42 - v39->first.__i_;
          if (v44 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v44 > 0x16)
          {
            v53 = (v44 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v44 | 7) != 0x17)
              v53 = v44 | 7;
            v54 = v53 + 1;
            v45 = (std::sub_match<const char *> *)operator new(v53 + 1);
            v94[0].__end_ = (std::vector<std::csub_match>::pointer)v44;
            v94[0].__end_cap_.__value_ = (std::sub_match<const char *> *)(v54 | 0x8000000000000000);
            v94[0].__begin_ = v45;
            if (v43 == v42)
            {
LABEL_84:
              LOBYTE(v45->first) = 0;
              v52 = v77;
              if ((unint64_t)v77 >= v78)
                goto LABEL_89;
              goto LABEL_67;
            }
          }
          else
          {
            HIBYTE(v94[0].__end_cap_.__value_) = (_BYTE)v42 - LOBYTE(v39->first.__i_);
            v45 = (std::sub_match<const char *> *)v94;
            if (v43 == v42)
              goto LABEL_84;
          }
          if (v44 < 0x20 || (unint64_t)((char *)v45 - v43) < 0x20)
            break;
          v46 = (std::sub_match<const char *> *)((char *)v45 + (v44 & 0xFFFFFFFFFFFFFFE0));
          v47 = &v43[v44 & 0xFFFFFFFFFFFFFFE0];
          v48 = (__int128 *)(v43 + 16);
          v49 = &v45->matched;
          v50 = v44 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v51 = *v48;
            *((_OWORD *)v49 - 1) = *(v48 - 1);
            *(_OWORD *)v49 = v51;
            v48 += 2;
            v49 += 32;
            v50 -= 32;
          }
          while (v50);
          if (v44 != (v44 & 0x7FFFFFFFFFFFFFE0))
            goto LABEL_87;
LABEL_88:
          LOBYTE(v46->first) = 0;
          v52 = v77;
          if ((unint64_t)v77 >= v78)
          {
LABEL_89:
            v77 = std::vector<std::string>::__push_back_slow_path<std::string>(&__p, (uint64_t)v94);
            if (SHIBYTE(v94[0].__end_cap_.__value_) < 0)
              operator delete(v94[0].__begin_);
            goto LABEL_68;
          }
LABEL_67:
          v41 = *(_OWORD *)&v94[0].__begin_;
          *((_QWORD *)v52 + 2) = v94[0].__end_cap_.__value_;
          *(_OWORD *)v52 = v41;
          v77 = v52 + 24;
LABEL_68:
          if (++v39 == v40)
            goto LABEL_91;
        }
        v46 = v45;
        v47 = v43;
        do
        {
LABEL_87:
          v55 = *v47++;
          LOBYTE(v46->first) = v55;
          v46 = (std::sub_match<const char *> *)((char *)v46 + 1);
        }
        while (v47 != v42);
        goto LABEL_88;
      }
LABEL_91:
      v57 = (char *)__p;
      v56 = v77;
      if (v77 - (_BYTE *)__p == 24)
      {
        v58 = (char *)v79;
        v59 = v80;
        v60 = 1;
        if (v79 != v80)
          goto LABEL_117;
LABEL_105:
        if (v57)
          goto LABEL_106;
LABEL_134:
        v64 = (char *)v79;
        if (v79)
          goto LABEL_135;
        goto LABEL_108;
      }
      if ((char *)__p + 24 != v77)
      {
        v61 = (char *)__p + 23;
        do
        {
          v62 = (void **)(v61 - 23);
          if (*v61 < 0)
            operator delete(*v62);
          *(_OWORD *)v62 = *(_OWORD *)(v61 + 1);
          *(_QWORD *)(v61 - 7) = *(_QWORD *)(v61 + 17);
          v61[24] = 0;
          v61 += 24;
          *(v61 - 23) = 0;
          v57 += 24;
        }
        while (v61 + 1 != v56);
        v56 = v77;
      }
      while (v56 != v57)
      {
        if (*(v56 - 1) < 0)
          operator delete(*((void **)v56 - 3));
        v56 -= 24;
      }
      v77 = v57;
      v57 = (char *)__p;
      v58 = (char *)v79;
      v59 = v80;
      v60 = 1;
      if (v79 == v80)
        goto LABEL_105;
      while (1)
      {
LABEL_117:
        v66 = v58[23];
        if ((v66 & 0x80u) == 0)
          v67 = v58[23];
        else
          v67 = *((_QWORD *)v58 + 1);
        v68 = v57[23];
        v69 = (char)v68;
        if ((v68 & 0x80u) != 0)
          v68 = *((_QWORD *)v57 + 1);
        if (v67 != v68)
          break;
        if (v69 >= 0)
          v70 = v57;
        else
          v70 = *(char **)v57;
        if ((v66 & 0x80) != 0)
        {
          if (memcmp(*(const void **)v58, v70, *((_QWORD *)v58 + 1)))
            break;
        }
        else if (v58[23])
        {
          v71 = 0;
          while (v58[v71] == v70[v71])
          {
            if (v66 == ++v71)
              goto LABEL_116;
          }
          break;
        }
LABEL_116:
        v58 += 24;
        v57 += 24;
        if (v58 == v59)
          goto LABEL_133;
      }
    }
  }
  v60 = 0;
LABEL_133:
  v57 = (char *)__p;
  if (!__p)
    goto LABEL_134;
LABEL_106:
  v63 = v77;
  if (v77 != v57)
  {
    do
    {
      if (*(v63 - 1) < 0)
        operator delete(*((void **)v63 - 3));
      v63 -= 24;
    }
    while (v63 != v57);
    v77 = v57;
    operator delete(__p);
    v64 = (char *)v79;
    if (v79)
      goto LABEL_135;
LABEL_108:
    v65 = (std::__shared_weak_count *)v85;
    if (!(_QWORD)v85)
      goto LABEL_146;
    goto LABEL_142;
  }
  v77 = v57;
  operator delete(v57);
  v64 = (char *)v79;
  if (!v79)
    goto LABEL_108;
LABEL_135:
  v72 = v80;
  if (v80 == v64)
  {
    v80 = v64;
    operator delete(v64);
    v65 = (std::__shared_weak_count *)v85;
    if (!(_QWORD)v85)
      goto LABEL_146;
    goto LABEL_142;
  }
  do
  {
    if (*(v72 - 1) < 0)
      operator delete(*((void **)v72 - 3));
    v72 -= 24;
  }
  while (v72 != v64);
  v80 = v64;
  operator delete(v79);
  v65 = (std::__shared_weak_count *)v85;
  if ((_QWORD)v85)
  {
LABEL_142:
    p_shared_owners = (unint64_t *)&v65->__shared_owners_;
    do
      v74 = __ldaxr(p_shared_owners);
    while (__stlxr(v74 - 1, p_shared_owners));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
LABEL_146:
  std::locale::~locale(v82);
  if (v86[0].__begin_)
  {
    v86[0].__end_ = v86[0].__begin_;
    operator delete(v86[0].__begin_);
  }
  return v60;
}

void sub_24B840FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, std::locale a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  uint64_t v24;
  void *v26;

  v26 = *(void **)(v24 - 192);
  if (v26)
  {
    *(_QWORD *)(v24 - 184) = v26;
    operator delete(v26);
  }
  std::vector<std::string>::~vector[abi:ne180100]((void **)&a9);
  std::vector<std::string>::~vector[abi:ne180100](&a12);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a15);
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ***std::__exception_guard_exceptions<std::vector<std::string>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](void ***result)
{
  void ***v1;
  void **v2;
  void **v3;
  void **v4;
  void *v5;

  v1 = result;
  if (!*((_BYTE *)result + 8))
  {
    v2 = *result;
    v3 = (void **)**result;
    if (v3)
    {
      v4 = (void **)v2[1];
      v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0)
            operator delete(*(v4 - 3));
          v4 -= 3;
        }
        while (v4 != v3);
        v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

__n128 std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>(uint64_t a1, const void **a2, uint64_t a3, char a4, __n128 result)
{
  unint64_t j;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  int v17;
  const void *v18;
  size_t v19;
  int v20;
  const void *v21;
  size_t v22;
  size_t v23;
  int v24;
  uint64_t v25;
  __n128 v26;
  __n128 *v27;
  size_t v28;
  const void *v29;
  int v30;
  const void *v31;
  size_t v32;
  size_t v33;
  int v34;
  unint64_t v35;
  const void **v36;
  const void **v37;
  const void **v38;
  const void *v39;
  const void **v40;
  size_t v41;
  size_t v42;
  int v43;
  const void *v44;
  const void **v45;
  size_t v46;
  size_t v47;
  int v48;
  const void **v49;
  __int128 v50;
  __int128 v51;
  __n128 *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  const void *v56;
  unint64_t v57;
  size_t v58;
  int v59;
  const void **v60;
  const void *v61;
  const void **v62;
  unint64_t v63;
  size_t v64;
  int v65;
  __n128 *v66;
  __n128 v67;
  __n128 v68;
  BOOL v69;
  __n128 v70;
  const void **v71;
  __n128 *v72;
  size_t v73;
  size_t v74;
  const void *v75;
  const void **v76;
  const void **v77;
  size_t v78;
  size_t v79;
  int v80;
  unint64_t v81;
  uint64_t v82;
  const void *v83;
  size_t v84;
  size_t v85;
  int v86;
  const void **k;
  const void **v88;
  const void **v89;
  size_t v90;
  size_t v91;
  int v92;
  const void *v93;
  __int128 v94;
  __int128 v95;
  __n128 *v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  const void *v100;
  unint64_t v101;
  size_t v102;
  int v103;
  const void **v104;
  const void *v105;
  const void **v106;
  const void *v107;
  size_t v108;
  int v109;
  __n128 *v110;
  __n128 v111;
  int v112;
  const void *v113;
  size_t v114;
  size_t v115;
  int v116;
  __n128 *v117;
  int v118;
  const void **v119;
  size_t v120;
  int v121;
  void *v122;
  const void *v123;
  const void *v124;
  size_t v125;
  size_t v126;
  int v127;
  const void *v128;
  uint64_t v129;
  uint64_t v130;
  __n128 *v131;
  __n128 *v132;
  int v133;
  const void *v134;
  size_t v135;
  int v136;
  __n128 *v137;
  size_t v138;
  size_t v139;
  int v140;
  __n128 v141;
  __n128 *v142;
  size_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  const void *v147;
  size_t v148;
  size_t v149;
  int v150;
  int64_t v151;
  int64_t v152;
  const void **v153;
  int64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const void **v158;
  int v159;
  const void *v160;
  unint64_t v161;
  int v162;
  const void *v163;
  unint64_t v164;
  size_t v165;
  int v166;
  BOOL v167;
  uint64_t v168;
  int v169;
  const void *v170;
  size_t v171;
  int v172;
  const void *v173;
  size_t v174;
  size_t v175;
  int v176;
  BOOL v177;
  __n128 v178;
  __int128 v179;
  unint64_t v180;
  __n128 *v181;
  __int128 v182;
  uint64_t v183;
  uint64_t v184;
  int v185;
  const void *v186;
  unint64_t v187;
  int v188;
  const void *v189;
  unint64_t v190;
  size_t v191;
  int v192;
  BOOL v193;
  int v194;
  const void *v195;
  size_t v196;
  size_t v197;
  int v198;
  int64_t v199;
  uint64_t v200;
  uint64_t v201;
  __n128 *v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  const void *v206;
  size_t v207;
  int v208;
  const void *v209;
  size_t v210;
  size_t v211;
  int v212;
  uint64_t v213;
  unint64_t v214;
  unint64_t v215;
  uint64_t v216;
  int v217;
  const void *v218;
  size_t v219;
  int v220;
  __n128 *v221;
  size_t v222;
  size_t v223;
  int v224;
  __n128 v225;
  __n128 *v226;
  size_t v227;
  __n128 v228;
  __int128 v229;
  unint64_t v230;
  uint64_t v231;
  int v232;
  const void *v233;
  size_t v234;
  size_t v235;
  int v236;
  const void *v237;
  const void **v238;
  int v239;
  const void *v240;
  size_t v241;
  int v242;
  const void *v243;
  size_t v244;
  size_t v245;
  int v246;
  __n128 v247;
  __n128 *v248;
  size_t v249;
  uint64_t i;
  int v251;
  const void *v252;
  size_t v253;
  size_t v254;
  int v255;
  const void *v256;
  uint64_t v257;
  const void **v258;
  const void **v259;
  size_t v261;
  const void *v262;
  uint64_t v263;
  __n128 *v264;
  const void *v265;
  const void **v266;
  int64_t v267;
  const void *v268;
  const void **v269;
  const void **v270;
  __n128 v271;
  int64_t v272;

LABEL_1:
  v266 = a2 - 3;
  v269 = a2;
  v258 = a2 - 9;
  v259 = a2 - 6;
  j = a1;
  while (2)
  {
    a1 = j;
    v9 = (uint64_t)a2 - j;
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - j) >> 3);
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v117 = (__n128 *)(a2 - 3);
        v118 = *((char *)a2 - 1);
        if (v118 >= 0)
          v119 = a2 - 3;
        else
          v119 = (const void **)*(a2 - 3);
        if (v118 >= 0)
          v120 = *((unsigned __int8 *)a2 - 1);
        else
          v120 = (size_t)*(a2 - 2);
        v121 = *(char *)(a1 + 23);
        v122 = *(void **)a1;
        v123 = *(const void **)(a1 + 8);
        if (v121 >= 0)
          v124 = (const void *)a1;
        else
          v124 = *(const void **)a1;
        if (v121 >= 0)
          v125 = *(unsigned __int8 *)(a1 + 23);
        else
          v125 = *(_QWORD *)(a1 + 8);
        if (v125 >= v120)
          v126 = v120;
        else
          v126 = v125;
        v127 = memcmp(v119, v124, v126);
        if (v127)
        {
          if (v127 < 0)
            return result;
        }
        else if (v120 <= v125)
        {
          return result;
        }
        v256 = *(const void **)(a1 + 16);
        v257 = (uint64_t)*(a2 - 1);
        result = *v117;
        *(__n128 *)a1 = *v117;
        *(_QWORD *)(a1 + 16) = v257;
        *(a2 - 3) = v122;
        *(a2 - 2) = v123;
        *(a2 - 1) = v256;
        return result;
      case 3uLL:
        result.n128_u64[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, v266).n128_u64[0];
        return result;
      case 4uLL:
        result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, v266).n128_u64[0];
        return result;
      case 5uLL:
        result.n128_u64[0] = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a1 + 72, v266).n128_u64[0];
        return result;
      default:
        if (v9 <= 575)
        {
          if ((a4 & 1) != 0)
          {
            if ((const void **)a1 == a2)
              return result;
            v128 = (const void *)(a1 + 24);
            if ((const void **)(a1 + 24) == a2)
              return result;
            v129 = 0;
            v130 = a1;
            while (1)
            {
              v132 = (__n128 *)v130;
              v130 = (uint64_t)v128;
              v133 = v132[2].n128_i8[15];
              if (v133 >= 0)
                v134 = v128;
              else
                v134 = (const void *)v132[1].n128_u64[1];
              if (v133 >= 0)
                v135 = v132[2].n128_u8[15];
              else
                v135 = v132[2].n128_u64[0];
              v136 = v132[1].n128_i8[7];
              if (v136 >= 0)
                v137 = v132;
              else
                v137 = (__n128 *)v132->n128_u64[0];
              if (v136 >= 0)
                v138 = v132[1].n128_u8[7];
              else
                v138 = v132->n128_u64[1];
              if (v138 >= v135)
                v139 = v135;
              else
                v139 = v138;
              v140 = memcmp(v134, v137, v139);
              if (v140)
              {
                if (v140 < 0)
                  goto LABEL_259;
              }
              else if (v135 <= v138)
              {
                goto LABEL_259;
              }
              v141 = *(__n128 *)v130;
              v272 = *(_QWORD *)(v130 + 16);
              v271 = v141;
              if (v272 >= 0)
                v142 = &v271;
              else
                v142 = (__n128 *)v141.n128_u64[0];
              if (v272 >= 0)
                v143 = HIBYTE(v272);
              else
                v143 = v141.n128_u64[1];
              *(_QWORD *)(v130 + 16) = v132[1].n128_u64[0];
              *(__n128 *)v130 = *v132;
              v132[1].n128_u8[7] = 0;
              v132->n128_u8[0] = 0;
              v131 = (__n128 *)a1;
              if (v132 != (__n128 *)a1)
              {
                v144 = v129;
                while (1)
                {
                  v145 = a1 + v144;
                  v146 = *(char *)(a1 + v144 - 1);
                  if (v146 >= 0)
                    v147 = (const void *)(a1 + v144 - 24);
                  else
                    v147 = *(const void **)(a1 + v144 - 24);
                  if (v146 >= 0)
                    v148 = *(unsigned __int8 *)(a1 + v144 - 1);
                  else
                    v148 = *(_QWORD *)(a1 + v144 - 16);
                  if (v148 >= v143)
                    v149 = v143;
                  else
                    v149 = v148;
                  v150 = memcmp(v142, v147, v149);
                  if (v150)
                  {
                    if (v150 < 0)
                    {
                      v131 = (__n128 *)(a1 + v144);
                      break;
                    }
                  }
                  else if (v143 <= v148)
                  {
                    v131 = v132;
                    break;
                  }
                  v132 = (__n128 *)((char *)v132 - 24);
                  *(_OWORD *)v145 = *(_OWORD *)(a1 + v144 - 24);
                  *(_QWORD *)(v145 + 16) = *(_QWORD *)(a1 + v144 - 8);
                  *(_BYTE *)(v145 - 1) = 0;
                  *(_BYTE *)(v145 - 24) = 0;
                  v144 -= 24;
                  if (!v144)
                  {
                    v131 = (__n128 *)a1;
                    break;
                  }
                }
              }
              result = v271;
              v131[1].n128_u64[0] = v272;
              *v131 = result;
LABEL_259:
              v128 = (const void *)(v130 + 24);
              v129 += 24;
              if ((const void **)(v130 + 24) == v269)
                return result;
            }
          }
          if ((const void **)a1 == a2)
            return result;
          v237 = (const void *)(a1 + 24);
          if ((const void **)(a1 + 24) == a2)
            return result;
LABEL_471:
          v238 = (const void **)a1;
          a1 = (uint64_t)v237;
          v239 = *((char *)v238 + 47);
          if (v239 >= 0)
            v240 = v237;
          else
            v240 = v238[3];
          if (v239 >= 0)
            v241 = *((unsigned __int8 *)v238 + 47);
          else
            v241 = (size_t)v238[4];
          v242 = *((char *)v238 + 23);
          if (v242 >= 0)
            v243 = v238;
          else
            v243 = *v238;
          if (v242 >= 0)
            v244 = *((unsigned __int8 *)v238 + 23);
          else
            v244 = (size_t)v238[1];
          if (v244 >= v241)
            v245 = v241;
          else
            v245 = v244;
          v246 = memcmp(v240, v243, v245);
          if (v246)
          {
            if (v246 < 0)
              goto LABEL_470;
          }
          else if (v241 <= v244)
          {
            goto LABEL_470;
          }
          v247 = *(__n128 *)a1;
          v272 = *(_QWORD *)(a1 + 16);
          v271 = v247;
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          if (v272 >= 0)
            v248 = &v271;
          else
            v248 = (__n128 *)v271.n128_u64[0];
          if (v272 >= 0)
            v249 = HIBYTE(v272);
          else
            v249 = v271.n128_u64[1];
          for (i = a1; ; i -= 24)
          {
            *(_OWORD *)i = *(_OWORD *)(i - 24);
            *(_QWORD *)(i + 16) = *(_QWORD *)(i - 8);
            *(_BYTE *)(i - 1) = 0;
            *(_BYTE *)(i - 24) = 0;
            v251 = *(char *)(i - 25);
            if (v251 >= 0)
              v252 = (const void *)(i - 48);
            else
              v252 = *(const void **)(i - 48);
            if (v251 >= 0)
              v253 = *(unsigned __int8 *)(i - 25);
            else
              v253 = *(_QWORD *)(i - 40);
            if (v253 >= v249)
              v254 = v249;
            else
              v254 = v253;
            v255 = memcmp(v248, v252, v254);
            if (v255)
            {
              if (v255 < 0)
              {
LABEL_469:
                result = v271;
                *(_QWORD *)(i - 8) = v272;
                *(__n128 *)(i - 24) = result;
LABEL_470:
                v237 = (const void *)(a1 + 24);
                if ((const void **)(a1 + 24) == a2)
                  return result;
                goto LABEL_471;
              }
            }
            else if (v249 <= v253)
            {
              goto LABEL_469;
            }
          }
        }
        if (!a3)
        {
          if ((const void **)a1 == a2)
            return result;
          v151 = (v10 - 2) >> 1;
          v152 = v151;
          while (1)
          {
            v154 = v152;
            if (v151 < v152)
              goto LABEL_306;
            v155 = (2 * v152) | 1;
            v156 = a1 + 24 * v155;
            v157 = 2 * v152 + 2;
            if (v157 >= (uint64_t)v10)
              goto LABEL_330;
            v158 = (const void **)(v156 + 24);
            v159 = *(char *)(v156 + 23);
            v160 = v159 >= 0 ? (const void *)(a1 + 24 * v155) : *(const void **)v156;
            v161 = v159 >= 0 ? *(unsigned __int8 *)(v156 + 23) : *(_QWORD *)(v156 + 8);
            v162 = *(char *)(v156 + 47);
            v163 = v162 >= 0 ? (const void *)(v156 + 24) : *(const void **)(v156 + 24);
            v164 = v162 >= 0 ? *(unsigned __int8 *)(v156 + 47) : *(_QWORD *)(v156 + 32);
            v165 = v164 >= v161 ? v161 : v164;
            v166 = memcmp(v160, v163, v165);
            if (v166)
              break;
            v167 = v161 >= v164;
            if (v161 == v164)
            {
              v158 = (const void **)(a1 + 24 * v155);
              v157 = (2 * v154) | 1;
              a2 = v269;
              goto LABEL_331;
            }
            a2 = v269;
            if (!v167)
              goto LABEL_330;
LABEL_331:
            v168 = a1 + 24 * v154;
            v169 = *((char *)v158 + 23);
            if (v169 >= 0)
              v170 = v158;
            else
              v170 = *v158;
            if (v169 >= 0)
              v171 = *((unsigned __int8 *)v158 + 23);
            else
              v171 = (size_t)v158[1];
            v172 = *(char *)(v168 + 23);
            if (v172 >= 0)
              v173 = (const void *)(a1 + 24 * v154);
            else
              v173 = *(const void **)v168;
            if (v172 >= 0)
              v174 = *(unsigned __int8 *)(v168 + 23);
            else
              v174 = *(_QWORD *)(v168 + 8);
            if (v174 >= v171)
              v175 = v171;
            else
              v175 = v174;
            v176 = memcmp(v170, v173, v175);
            if (v176)
            {
              v151 = (v10 - 2) >> 1;
              if (v176 < 0)
                goto LABEL_350;
            }
            else
            {
              v177 = v171 > v174;
              v151 = (v10 - 2) >> 1;
              if (!v177)
              {
LABEL_350:
                v178 = *(__n128 *)v168;
                v272 = *(_QWORD *)(v168 + 16);
                v271 = v178;
                *(_QWORD *)(v168 + 8) = 0;
                *(_QWORD *)(v168 + 16) = 0;
                *(_QWORD *)v168 = 0;
                v179 = *(_OWORD *)v158;
                *(_QWORD *)(v168 + 16) = v158[2];
                *(_OWORD *)v168 = v179;
                *((_BYTE *)v158 + 23) = 0;
                *(_BYTE *)v158 = 0;
                if (v151 >= v157)
                {
                  v180 = HIBYTE(v272);
                  v181 = &v271;
                  if (v272 < 0)
                  {
                    v180 = v271.n128_u64[1];
                    v181 = (__n128 *)v271.n128_u64[0];
                  }
                  v261 = v180;
                  v264 = v181;
                  v267 = v154;
                  while (1)
                  {
                    v183 = (2 * v157) | 1;
                    v184 = a1 + 24 * v183;
                    v157 = 2 * v157 + 2;
                    if (v157 >= (uint64_t)v10)
                      goto LABEL_378;
                    v153 = (const void **)(v184 + 24);
                    v185 = *(char *)(v184 + 23);
                    v186 = v185 >= 0 ? (const void *)(a1 + 24 * v183) : *(const void **)v184;
                    v187 = v185 >= 0 ? *(unsigned __int8 *)(v184 + 23) : *(_QWORD *)(v184 + 8);
                    v188 = *(char *)(v184 + 47);
                    v189 = v188 >= 0 ? (const void *)(v184 + 24) : *(const void **)(v184 + 24);
                    v190 = v188 >= 0 ? *(unsigned __int8 *)(v184 + 47) : *(_QWORD *)(v184 + 32);
                    v191 = v190 >= v187 ? v187 : v190;
                    v192 = memcmp(v186, v189, v191);
                    if (v192)
                      break;
                    v193 = v187 >= v190;
                    if (v187 == v190)
                    {
                      v153 = (const void **)(a1 + 24 * v183);
                      v157 = v183;
                      a2 = v269;
                      v151 = (v10 - 2) >> 1;
                      goto LABEL_379;
                    }
                    a2 = v269;
                    v151 = (v10 - 2) >> 1;
                    if (!v193)
                      goto LABEL_378;
LABEL_379:
                    v194 = *((char *)v153 + 23);
                    if (v194 >= 0)
                      v195 = v153;
                    else
                      v195 = *v153;
                    if (v194 >= 0)
                      v196 = *((unsigned __int8 *)v153 + 23);
                    else
                      v196 = (size_t)v153[1];
                    if (v261 >= v196)
                      v197 = v196;
                    else
                      v197 = v261;
                    v198 = memcmp(v195, v264, v197);
                    if (v198)
                    {
                      v154 = v267;
                      if ((v198 & 0x80000000) == 0)
                        goto LABEL_304;
                    }
                    else
                    {
                      v154 = v267;
                      if (v196 > v261)
                        goto LABEL_304;
                    }
                    v182 = *(_OWORD *)v153;
                    v158[2] = v153[2];
                    *(_OWORD *)v158 = v182;
                    *((_BYTE *)v153 + 23) = 0;
                    *(_BYTE *)v153 = 0;
                    v158 = v153;
                    if (v151 < v157)
                      goto LABEL_305;
                  }
                  a2 = v269;
                  v151 = (v10 - 2) >> 1;
                  if ((v192 & 0x80000000) == 0)
                    goto LABEL_379;
LABEL_378:
                  v153 = (const void **)(a1 + 24 * v183);
                  v157 = v183;
                  goto LABEL_379;
                }
LABEL_304:
                v153 = v158;
LABEL_305:
                result = v271;
                v153[2] = (const void *)v272;
                *(__n128 *)v153 = result;
              }
            }
LABEL_306:
            v152 = v154 - 1;
            if (!v154)
            {
              v199 = v9 / 0x18uLL;
              while (2)
              {
                if (v199 < 2)
                  goto LABEL_393;
                v200 = 0;
                v268 = *(const void **)a1;
                v270 = a2;
                v262 = *(const void **)(a1 + 16);
                v265 = *(const void **)(a1 + 8);
                *(_QWORD *)(a1 + 8) = 0;
                *(_QWORD *)(a1 + 16) = 0;
                v201 = a1;
                *(_QWORD *)a1 = 0;
LABEL_399:
                v203 = v201 + 24 * v200 + 24;
                v204 = (2 * v200) | 1;
                v200 = 2 * v200 + 2;
                if (v200 >= v199)
                  goto LABEL_397;
                v202 = (__n128 *)(v203 + 24);
                v205 = *(char *)(v203 + 23);
                if (v205 >= 0)
                  v206 = (const void *)v203;
                else
                  v206 = *(const void **)v203;
                if (v205 >= 0)
                  v207 = *(unsigned __int8 *)(v203 + 23);
                else
                  v207 = *(_QWORD *)(v203 + 8);
                v208 = *(char *)(v203 + 47);
                if (v208 >= 0)
                  v209 = (const void *)(v203 + 24);
                else
                  v209 = *(const void **)(v203 + 24);
                if (v208 >= 0)
                  v210 = *(unsigned __int8 *)(v203 + 47);
                else
                  v210 = *(_QWORD *)(v203 + 32);
                if (v210 >= v207)
                  v211 = v207;
                else
                  v211 = v210;
                v212 = memcmp(v206, v209, v211);
                if (v212)
                {
                  if ((v212 & 0x80000000) == 0)
                    goto LABEL_417;
LABEL_397:
                  v202 = (__n128 *)v203;
                  v200 = v204;
                  if ((*(char *)(v201 + 23) & 0x80000000) == 0)
                  {
LABEL_398:
                    result = *v202;
                    *(_QWORD *)(v201 + 16) = v202[1].n128_u64[0];
                    *(__n128 *)v201 = result;
                    v202[1].n128_u8[7] = 0;
                    v202->n128_u8[0] = 0;
                    v201 = (uint64_t)v202;
                    if (v200 > (uint64_t)((unint64_t)(v199 - 2) >> 1))
                    {
                      if (v202 == (__n128 *)(a2 - 3))
                      {
                        v202->n128_u64[0] = (unint64_t)v268;
                        v202->n128_u64[1] = (unint64_t)v265;
                        v202[1].n128_u64[0] = (unint64_t)v262;
                      }
                      else
                      {
                        result = *(__n128 *)(a2 - 3);
                        v202[1].n128_u64[0] = (unint64_t)*(a2 - 1);
                        *v202 = result;
                        *(a2 - 3) = v268;
                        *(a2 - 2) = v265;
                        *(a2 - 1) = v262;
                        v213 = (uint64_t)&v202[1].n128_i64[1] - a1;
                        if (v213 >= 25)
                        {
                          v214 = v213 / 0x18uLL - 2;
                          v215 = v214 >> 1;
                          v216 = a1 + 24 * (v214 >> 1);
                          v217 = *(char *)(v216 + 23);
                          if (v217 >= 0)
                            v218 = (const void *)(a1 + 24 * (v214 >> 1));
                          else
                            v218 = *(const void **)v216;
                          if (v217 >= 0)
                            v219 = *(unsigned __int8 *)(v216 + 23);
                          else
                            v219 = *(_QWORD *)(v216 + 8);
                          v220 = v202[1].n128_i8[7];
                          if (v220 >= 0)
                            v221 = v202;
                          else
                            v221 = (__n128 *)v202->n128_u64[0];
                          if (v220 >= 0)
                            v222 = v202[1].n128_u8[7];
                          else
                            v222 = v202->n128_u64[1];
                          if (v222 >= v219)
                            v223 = v219;
                          else
                            v223 = v222;
                          v224 = memcmp(v218, v221, v223);
                          if (v224)
                          {
                            if (v224 < 0)
                              goto LABEL_393;
LABEL_443:
                            v225 = *v202;
                            v272 = v202[1].n128_i64[0];
                            v271 = v225;
                            v202->n128_u64[1] = 0;
                            v202[1].n128_u64[0] = 0;
                            v202->n128_u64[0] = 0;
                            if (v272 >= 0)
                              v226 = &v271;
                            else
                              v226 = (__n128 *)v271.n128_u64[0];
                            if (v272 >= 0)
                              v227 = HIBYTE(v272);
                            else
                              v227 = v271.n128_u64[1];
                            v228 = *(__n128 *)v216;
                            v202[1].n128_u64[0] = *(_QWORD *)(v216 + 16);
                            *v202 = v228;
                            *(_BYTE *)(v216 + 23) = 0;
                            *(_BYTE *)v216 = 0;
                            if (v214 >= 2)
                            {
                              while (1)
                              {
                                v230 = v215 - 1;
                                v215 = (v215 - 1) >> 1;
                                v231 = a1 + 24 * v215;
                                v232 = *(char *)(v231 + 23);
                                if (v232 >= 0)
                                  v233 = (const void *)(a1 + 24 * v215);
                                else
                                  v233 = *(const void **)v231;
                                if (v232 >= 0)
                                  v234 = *(unsigned __int8 *)(v231 + 23);
                                else
                                  v234 = *(_QWORD *)(v231 + 8);
                                if (v227 >= v234)
                                  v235 = v234;
                                else
                                  v235 = v227;
                                v236 = memcmp(v233, v226, v235);
                                if (v236)
                                {
                                  if (v236 < 0)
                                    break;
                                }
                                else if (v234 <= v227)
                                {
                                  break;
                                }
                                v229 = *(_OWORD *)v231;
                                *(_QWORD *)(v216 + 16) = *(_QWORD *)(v231 + 16);
                                *(_OWORD *)v216 = v229;
                                *(_BYTE *)(v231 + 23) = 0;
                                *(_BYTE *)v231 = 0;
                                v216 = a1 + 24 * v215;
                                if (v230 <= 1)
                                  goto LABEL_465;
                              }
                            }
                            v231 = v216;
LABEL_465:
                            result = v271;
                            *(_QWORD *)(v231 + 16) = v272;
                            *(__n128 *)v231 = result;
                            a2 = v270;
                          }
                          else if (v219 > v222)
                          {
                            goto LABEL_443;
                          }
                        }
                      }
LABEL_393:
                      a2 -= 3;
                      v177 = (unint64_t)v199-- > 2;
                      if (!v177)
                        return result;
                      continue;
                    }
                    goto LABEL_399;
                  }
                }
                else
                {
                  if (v207 == v210 || v207 < v210)
                    goto LABEL_397;
LABEL_417:
                  if ((*(char *)(v201 + 23) & 0x80000000) == 0)
                    goto LABEL_398;
                }
                break;
              }
              operator delete(*(void **)v201);
              goto LABEL_398;
            }
          }
          a2 = v269;
          if ((v166 & 0x80000000) == 0)
            goto LABEL_331;
LABEL_330:
          v158 = (const void **)(a1 + 24 * v155);
          v157 = (2 * v154) | 1;
          goto LABEL_331;
        }
        v11 = v10 >> 1;
        v12 = a1 + 24 * (v10 >> 1);
        if ((unint64_t)v9 < 0xC01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(v12, a1, v266);
          v263 = a3 - 1;
          if ((a4 & 1) != 0)
            goto LABEL_26;
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, v12, v266);
          v13 = 24 * v11;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1 + 24, v13 + a1 - 24, v259);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1 + 48, a1 + 24 + v13, v258);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(v13 + a1 - 24, v12, (const void **)(a1 + 24 + v13));
          v14 = *(void **)a1;
          v15 = *(_OWORD *)(a1 + 8);
          v16 = *(_OWORD *)v12;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v12 + 16);
          *(_OWORD *)a1 = v16;
          *(_QWORD *)v12 = v14;
          *(_OWORD *)(v12 + 8) = v15;
          v263 = a3 - 1;
          if ((a4 & 1) != 0)
            goto LABEL_26;
        }
        v17 = *(char *)(a1 - 1);
        if (v17 >= 0)
          v18 = (const void *)(a1 - 24);
        else
          v18 = *(const void **)(a1 - 24);
        if (v17 >= 0)
          v19 = *(unsigned __int8 *)(a1 - 1);
        else
          v19 = *(_QWORD *)(a1 - 16);
        v20 = *(char *)(a1 + 23);
        if (v20 >= 0)
          v21 = (const void *)a1;
        else
          v21 = *(const void **)a1;
        if (v20 >= 0)
          v22 = *(unsigned __int8 *)(a1 + 23);
        else
          v22 = *(_QWORD *)(a1 + 8);
        if (v22 >= v19)
          v23 = v19;
        else
          v23 = v22;
        v24 = memcmp(v18, v21, v23);
        if (v24)
        {
          if ((v24 & 0x80000000) == 0)
            goto LABEL_26;
LABEL_124:
          v70 = *(__n128 *)a1;
          v272 = *(_QWORD *)(a1 + 16);
          v271 = v70;
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          v71 = a2;
          if (v272 >= 0)
            v72 = &v271;
          else
            v72 = (__n128 *)v271.n128_u64[0];
          if (v272 >= 0)
            v73 = HIBYTE(v272);
          else
            v73 = v271.n128_u64[1];
          v74 = *((unsigned __int8 *)v71 - 1);
          v76 = (const void **)*(v71 - 3);
          v75 = *(v71 - 2);
          if ((v74 & 0x80u) == 0)
            v77 = v266;
          else
            v77 = (const void **)*(v71 - 3);
          if ((v74 & 0x80u) == 0)
            v78 = *((unsigned __int8 *)v71 - 1);
          else
            v78 = (size_t)*(v71 - 2);
          if (v78 >= v73)
            v79 = v73;
          else
            v79 = v78;
          v80 = memcmp(v72, v77, v79);
          if (v80)
          {
            if ((v80 & 0x80000000) == 0)
              goto LABEL_141;
          }
          else if (v73 > v78)
          {
LABEL_141:
            v81 = a1 + 24;
            do
            {
              while (1)
              {
                j = v81;
                v82 = *(unsigned __int8 *)(v81 + 23);
                v83 = (v82 & 0x80u) == 0 ? (const void *)j : *(const void **)j;
                v84 = (v82 & 0x80u) == 0 ? v82 : *(_QWORD *)(j + 8);
                v85 = v84 >= v73 ? v73 : v84;
                v86 = memcmp(v72, v83, v85);
                v81 = j + 24;
                if (v86)
                  break;
                if (v73 > v84)
                  goto LABEL_154;
              }
            }
            while (v86 < 0);
            goto LABEL_154;
          }
          for (j = a1 + 24; j < (unint64_t)v269; j += 24)
          {
            v112 = *(char *)(j + 23);
            if (v112 >= 0)
              v113 = (const void *)j;
            else
              v113 = *(const void **)j;
            if (v112 >= 0)
              v114 = *(unsigned __int8 *)(j + 23);
            else
              v114 = *(_QWORD *)(j + 8);
            if (v114 >= v73)
              v115 = v73;
            else
              v115 = v114;
            v116 = memcmp(v72, v113, v115);
            if (v116)
            {
              if ((v116 & 0x80000000) == 0)
                break;
            }
            else if (v73 > v114)
            {
              break;
            }
          }
LABEL_154:
          k = v269;
          if (j < (unint64_t)v269)
          {
            for (k = v266; ; v75 = k[1])
            {
              if ((v74 & 0x80u) == 0)
                v89 = k;
              else
                v89 = v76;
              if ((v74 & 0x80u) == 0)
                v90 = v74;
              else
                v90 = (size_t)v75;
              if (v90 >= v73)
                v91 = v73;
              else
                v91 = v90;
              v92 = memcmp(v72, v89, v91);
              if (v92)
              {
                if (v92 < 0)
                  break;
              }
              else if (v73 <= v90)
              {
                break;
              }
              v88 = (const void **)*(k - 3);
              k -= 3;
              v76 = v88;
              v74 = *((unsigned __int8 *)k + 23);
            }
          }
          if (j < (unint64_t)k)
          {
            v93 = *(const void **)j;
            do
            {
              v94 = *(_OWORD *)(j + 8);
              v95 = *(_OWORD *)k;
              *(_QWORD *)(j + 16) = k[2];
              *(_OWORD *)j = v95;
              *k = v93;
              *(_OWORD *)(k + 1) = v94;
              if (v272 >= 0)
                v96 = &v271;
              else
                v96 = (__n128 *)v271.n128_u64[0];
              if (v272 >= 0)
                v97 = HIBYTE(v272);
              else
                v97 = v271.n128_u64[1];
              v98 = j + 24;
              do
              {
                while (1)
                {
                  j = v98;
                  v99 = *(unsigned __int8 *)(v98 + 23);
                  v93 = *(const void **)j;
                  v100 = (v99 & 0x80u) == 0 ? (const void *)j : *(const void **)j;
                  v101 = (v99 & 0x80u) == 0 ? v99 : *(_QWORD *)(j + 8);
                  v102 = v101 >= v97 ? v97 : v101;
                  v103 = memcmp(v96, v100, v102);
                  v98 = j + 24;
                  if (v103)
                    break;
                  if (v97 > v101)
                    goto LABEL_191;
                }
              }
              while (v103 < 0);
LABEL_191:
              v104 = k - 3;
              do
              {
                while (1)
                {
                  k = v104;
                  v105 = (const void *)*((unsigned __int8 *)v104 + 23);
                  v106 = (char)v105 >= 0 ? k : (const void **)*k;
                  v107 = (char)v105 >= 0 ? v105 : k[1];
                  v108 = (unint64_t)v107 >= v97 ? v97 : (size_t)v107;
                  v109 = memcmp(v96, v106, v108);
                  v104 = k - 3;
                  if (v109)
                    break;
                  if (v97 <= (unint64_t)v107)
                    goto LABEL_171;
                }
              }
              while ((v109 & 0x80000000) == 0);
LABEL_171:
              ;
            }
            while (j < (unint64_t)k);
          }
          v110 = (__n128 *)(j - 24);
          if (j - 24 == a1)
          {
            a2 = v269;
            a3 = v263;
            if (*(char *)(j - 1) < 0)
              operator delete(*(void **)a1);
          }
          else
          {
            if (*(char *)(a1 + 23) < 0)
              operator delete(*(void **)a1);
            v111 = *v110;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(j - 8);
            *(__n128 *)a1 = v111;
            *(_BYTE *)(j - 1) = 0;
            *(_BYTE *)(j - 24) = 0;
            a2 = v269;
            a3 = v263;
          }
          a4 = 0;
          result = v271;
          *(_QWORD *)(j - 8) = v272;
          *v110 = result;
          continue;
        }
        if (v19 <= v22)
          goto LABEL_124;
LABEL_26:
        v25 = 0;
        v26 = *(__n128 *)a1;
        v272 = *(_QWORD *)(a1 + 16);
        v271 = v26;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        if (v272 >= 0)
          v27 = &v271;
        else
          v27 = (__n128 *)v271.n128_u64[0];
        if (v272 >= 0)
          v28 = HIBYTE(v272);
        else
          v28 = v271.n128_u64[1];
        while (2)
        {
          v29 = *(const void **)(a1 + v25 + 24);
          v30 = *(char *)(a1 + v25 + 47);
          if (v30 >= 0)
            v31 = (const void *)(a1 + v25 + 24);
          else
            v31 = *(const void **)(a1 + v25 + 24);
          if (v30 >= 0)
            v32 = *(unsigned __int8 *)(a1 + v25 + 47);
          else
            v32 = *(_QWORD *)(a1 + v25 + 32);
          if (v28 >= v32)
            v33 = v32;
          else
            v33 = v28;
          v34 = memcmp(v31, v27, v33);
          if (!v34)
          {
            if (v32 <= v28)
              goto LABEL_45;
LABEL_33:
            v25 += 24;
            continue;
          }
          break;
        }
        if ((v34 & 0x80000000) == 0)
          goto LABEL_33;
LABEL_45:
        v35 = a1 + v25 + 24;
        v36 = v266;
        if (v25)
        {
          do
          {
            while (1)
            {
              v37 = v36;
              v44 = (const void *)*((unsigned __int8 *)v36 + 23);
              v45 = (char)v44 >= 0 ? v37 : (const void **)*v37;
              v46 = (size_t)((char)v44 >= 0 ? v44 : v37[1]);
              v47 = v28 >= v46 ? v46 : v28;
              v48 = memcmp(v45, v27, v47);
              v36 = v37 - 3;
              if (v48)
                break;
              if (v46 > v28)
                goto LABEL_76;
            }
          }
          while (v48 < 0);
        }
        else
        {
          v37 = v269;
          if (v35 < (unint64_t)v269)
          {
            v38 = v266;
            do
            {
              while (1)
              {
                v37 = v38;
                v39 = (const void *)*((unsigned __int8 *)v38 + 23);
                v40 = (char)v39 >= 0 ? v37 : (const void **)*v37;
                v41 = (size_t)((char)v39 >= 0 ? v39 : v37[1]);
                v42 = v28 >= v41 ? v41 : v28;
                v43 = memcmp(v40, v27, v42);
                v38 = v37 - 3;
                if (!v43)
                  break;
                if (v35 >= (unint64_t)v37 || (v43 & 0x80000000) == 0)
                  goto LABEL_76;
              }
            }
            while (v35 < (unint64_t)v37 && v41 <= v28);
          }
        }
LABEL_76:
        if (v35 >= (unint64_t)v37)
        {
          j = v35;
        }
        else
        {
          v49 = v37;
          j = v35;
          do
          {
            v50 = *(_OWORD *)(j + 8);
            v51 = *(_OWORD *)v49;
            *(_QWORD *)(j + 16) = v49[2];
            *(_OWORD *)j = v51;
            *v49 = v29;
            *(_OWORD *)(v49 + 1) = v50;
            if (v272 >= 0)
              v52 = &v271;
            else
              v52 = (__n128 *)v271.n128_u64[0];
            if (v272 >= 0)
              v53 = HIBYTE(v272);
            else
              v53 = v271.n128_u64[1];
            v54 = j + 24;
            do
            {
              while (1)
              {
                j = v54;
                v55 = *(unsigned __int8 *)(v54 + 23);
                v29 = *(const void **)j;
                v56 = (v55 & 0x80u) == 0 ? (const void *)j : *(const void **)j;
                v57 = (v55 & 0x80u) == 0 ? v55 : *(_QWORD *)(j + 8);
                v58 = v53 >= v57 ? v57 : v53;
                v59 = memcmp(v56, v52, v58);
                v54 = j + 24;
                if (v59)
                  break;
                if (v57 <= v53)
                  goto LABEL_98;
              }
            }
            while ((v59 & 0x80000000) == 0);
LABEL_98:
            v60 = v49 - 3;
            do
            {
              while (1)
              {
                v49 = v60;
                v61 = (const void *)*((unsigned __int8 *)v60 + 23);
                v62 = (char)v61 >= 0 ? v49 : (const void **)*v49;
                v63 = (unint64_t)((char)v61 >= 0 ? v61 : v49[1]);
                v64 = v53 >= v63 ? v63 : v53;
                v65 = memcmp(v62, v52, v64);
                v60 = v49 - 3;
                if (v65)
                  break;
                if (v63 > v53)
                  goto LABEL_78;
              }
            }
            while (v65 < 0);
LABEL_78:
            ;
          }
          while (j < (unint64_t)v49);
        }
        v66 = (__n128 *)(j - 24);
        if (j - 24 == a1)
        {
          a2 = v269;
          a3 = v263;
          if (*(char *)(j - 1) < 0)
            operator delete(*(void **)a1);
        }
        else
        {
          a2 = v269;
          a3 = v263;
          if (*(char *)(a1 + 23) < 0)
            operator delete(*(void **)a1);
          v67 = *v66;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(j - 8);
          *(__n128 *)a1 = v67;
          *(_BYTE *)(j - 1) = 0;
          *(_BYTE *)(j - 24) = 0;
        }
        v68 = v271;
        *(_QWORD *)(j - 8) = v272;
        *v66 = v68;
        if (v35 < (unint64_t)v37)
        {
LABEL_122:
          std::__introsort<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*,false>(a1, j - 24, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v69 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, (const void **)(j - 24));
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(j, a2))
        {
          if (v69)
            continue;
          goto LABEL_122;
        }
        a2 = (const void **)(j - 24);
        if (!v69)
          goto LABEL_1;
        return result;
    }
  }
}

__n128 std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, const void **a3)
{
  int v6;
  const void *v7;
  const void *v8;
  const void *v9;
  size_t v10;
  int v11;
  const void *v12;
  const void *v13;
  const void *v14;
  size_t v15;
  size_t v16;
  int v17;
  int v18;
  const void *v19;
  size_t v20;
  size_t v21;
  int v22;
  const void *v23;
  const void *v24;
  __n128 result;
  int v26;
  const void *v27;
  size_t v28;
  size_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const void *v34;
  size_t v35;
  const void *v36;
  size_t v37;
  size_t v38;
  int v39;
  const void *v40;
  const void *v41;
  int v42;
  const void *v43;
  size_t v44;
  int v45;
  const void *v46;
  uint64_t v47;
  const void *v48;
  size_t v49;
  size_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;

  v6 = *(char *)(a2 + 23);
  v7 = *(const void **)a2;
  v8 = *(const void **)(a2 + 8);
  if (v6 >= 0)
    v9 = (const void *)a2;
  else
    v9 = *(const void **)a2;
  if (v6 >= 0)
    v10 = *(unsigned __int8 *)(a2 + 23);
  else
    v10 = *(_QWORD *)(a2 + 8);
  v11 = *(char *)(a1 + 23);
  v13 = *(const void **)a1;
  v12 = *(const void **)(a1 + 8);
  if (v11 >= 0)
    v14 = (const void *)a1;
  else
    v14 = *(const void **)a1;
  if (v11 >= 0)
    v15 = *(unsigned __int8 *)(a1 + 23);
  else
    v15 = *(_QWORD *)(a1 + 8);
  if (v15 >= v10)
    v16 = v10;
  else
    v16 = v15;
  v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0)
      goto LABEL_18;
  }
  else if (v10 > v15)
  {
LABEL_18:
    v18 = *((char *)a3 + 23);
    if (v18 >= 0)
      v19 = a3;
    else
      v19 = *a3;
    if (v18 >= 0)
      v20 = *((unsigned __int8 *)a3 + 23);
    else
      v20 = (size_t)a3[1];
    if (v10 >= v20)
      v21 = v20;
    else
      v21 = v10;
    v22 = memcmp(v19, v9, v21);
    if (v22)
    {
      if ((v22 & 0x80000000) == 0)
      {
LABEL_29:
        v23 = *(const void **)(a1 + 16);
        v24 = a3[2];
        result = *(__n128 *)a3;
        *(_OWORD *)a1 = *(_OWORD *)a3;
        *(_QWORD *)(a1 + 16) = v24;
        *a3 = v13;
        a3[1] = v12;
        a3[2] = v23;
        return result;
      }
    }
    else if (v20 > v10)
    {
      goto LABEL_29;
    }
    v31 = *(_QWORD *)(a1 + 16);
    v32 = *(_QWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = v32;
    *(_QWORD *)a2 = v13;
    *(_QWORD *)(a2 + 8) = v12;
    *(_QWORD *)(a2 + 16) = v31;
    v33 = *((char *)a3 + 23);
    if (v33 >= 0)
      v34 = a3;
    else
      v34 = *a3;
    if (v33 >= 0)
      v35 = *((unsigned __int8 *)a3 + 23);
    else
      v35 = (size_t)a3[1];
    if (v31 >= 0)
      v36 = (const void *)a2;
    else
      v36 = v13;
    if (v31 >= 0)
      v37 = HIBYTE(v31);
    else
      v37 = (size_t)v12;
    if (v37 >= v35)
      v38 = v35;
    else
      v38 = v37;
    v39 = memcmp(v34, v36, v38);
    if (v39)
    {
      if (v39 < 0)
        return result;
    }
    else if (v35 <= v37)
    {
      return result;
    }
    result = *(__n128 *)a3;
    *(_QWORD *)(a2 + 16) = a3[2];
    *(__n128 *)a2 = result;
    *a3 = v13;
    a3[1] = v12;
    a3[2] = (const void *)v31;
    return result;
  }
  v26 = *((char *)a3 + 23);
  if (v26 >= 0)
    v27 = a3;
  else
    v27 = *a3;
  if (v26 >= 0)
    v28 = *((unsigned __int8 *)a3 + 23);
  else
    v28 = (size_t)a3[1];
  if (v10 >= v28)
    v29 = v28;
  else
    v29 = v10;
  v30 = memcmp(v27, v9, v29);
  if (v30)
  {
    if (v30 < 0)
      return result;
  }
  else if (v28 <= v10)
  {
    return result;
  }
  v40 = *(const void **)(a2 + 16);
  v41 = a3[2];
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = v41;
  *a3 = v7;
  a3[1] = v8;
  a3[2] = v40;
  v42 = *(char *)(a2 + 23);
  if (v42 >= 0)
    v43 = (const void *)a2;
  else
    v43 = *(const void **)a2;
  if (v42 >= 0)
    v44 = *(unsigned __int8 *)(a2 + 23);
  else
    v44 = *(_QWORD *)(a2 + 8);
  v45 = *(char *)(a1 + 23);
  v46 = *(const void **)a1;
  v47 = *(_QWORD *)(a1 + 8);
  if (v45 >= 0)
    v48 = (const void *)a1;
  else
    v48 = *(const void **)a1;
  if (v45 >= 0)
    v49 = *(unsigned __int8 *)(a1 + 23);
  else
    v49 = *(_QWORD *)(a1 + 8);
  if (v49 >= v44)
    v50 = v44;
  else
    v50 = v49;
  v51 = memcmp(v43, v48, v50);
  if (!v51)
  {
    if (v44 <= v49)
      return result;
    goto LABEL_84;
  }
  if ((v51 & 0x80000000) == 0)
  {
LABEL_84:
    v52 = *(_QWORD *)(a1 + 16);
    v53 = *(_QWORD *)(a2 + 16);
    result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = v53;
    *(_QWORD *)a2 = v46;
    *(_QWORD *)(a2 + 8) = v47;
    *(_QWORD *)(a2 + 16) = v52;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, const void **a2)
{
  const void **v2;
  unint64_t v4;
  _BOOL8 result;
  const void **v6;
  int v7;
  const void **v8;
  size_t v9;
  int v10;
  const void *v11;
  const void *v12;
  const void *v13;
  size_t v14;
  size_t v15;
  int v16;
  const void **v17;
  const void **v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  int v23;
  const void *v24;
  size_t v25;
  int v26;
  const void *v27;
  size_t v28;
  size_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  __int128 *v34;
  unint64_t v35;
  int v36;
  const void *v37;
  unint64_t v38;
  size_t v39;
  int v40;
  const void *v41;
  uint64_t v42;
  const void **v43;
  __int128 v44;
  const void *v45;

  v2 = a2;
  v4 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = a2 - 3;
      v7 = *((char *)a2 - 1);
      if (v7 >= 0)
        v8 = a2 - 3;
      else
        v8 = (const void **)*(a2 - 3);
      if (v7 >= 0)
        v9 = *((unsigned __int8 *)a2 - 1);
      else
        v9 = (size_t)*(a2 - 2);
      v10 = *(char *)(a1 + 23);
      v11 = *(const void **)a1;
      v12 = *(const void **)(a1 + 8);
      if (v10 >= 0)
        v13 = (const void *)a1;
      else
        v13 = *(const void **)a1;
      if (v10 >= 0)
        v14 = *(unsigned __int8 *)(a1 + 23);
      else
        v14 = *(_QWORD *)(a1 + 8);
      if (v14 >= v9)
        v15 = v9;
      else
        v15 = v14;
      v16 = memcmp(v8, v13, v15);
      if (v16)
      {
        if (v16 < 0)
          return 1;
      }
      else if (v9 <= v14)
      {
        return 1;
      }
      v41 = *(const void **)(a1 + 16);
      v42 = (uint64_t)*(v2 - 1);
      *(_OWORD *)a1 = *(_OWORD *)v6;
      *(_QWORD *)(a1 + 16) = v42;
      *(v2 - 3) = v11;
      *(v2 - 2) = v12;
      *(v2 - 1) = v41;
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a2 - 3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a2 - 3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, a1 + 48, a1 + 72, a2 - 3);
      return 1;
    default:
      v17 = (const void **)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a1 + 24, (const void **)(a1 + 48));
      v18 = (const void **)(a1 + 72);
      if ((const void **)(a1 + 72) == v2)
        return 1;
      v19 = 0;
      v20 = 0;
      v43 = v2;
      break;
  }
  while (2)
  {
    v23 = *((char *)v18 + 23);
    if (v23 >= 0)
      v24 = v18;
    else
      v24 = *v18;
    if (v23 >= 0)
      v25 = *((unsigned __int8 *)v18 + 23);
    else
      v25 = (size_t)v18[1];
    v26 = *((char *)v17 + 23);
    if (v26 >= 0)
      v27 = v17;
    else
      v27 = *v17;
    if (v26 >= 0)
      v28 = *((unsigned __int8 *)v17 + 23);
    else
      v28 = (size_t)v17[1];
    if (v28 >= v25)
      v29 = v25;
    else
      v29 = v28;
    v30 = memcmp(v24, v27, v29);
    if (v30)
    {
      if (v30 < 0)
        goto LABEL_25;
    }
    else if (v25 <= v28)
    {
      goto LABEL_25;
    }
    v44 = *(_OWORD *)v18;
    v45 = v18[2];
    *(_OWORD *)v18 = *(_OWORD *)v17;
    v18[2] = v17[2];
    *((_BYTE *)v17 + 23) = 0;
    *(_BYTE *)v17 = 0;
    v21 = a1;
    if (v17 == (const void **)a1)
      goto LABEL_24;
    v31 = v19;
    while (1)
    {
      v32 = a1 + v31;
      v33 = (_OWORD *)(a1 + v31 + 24);
      v34 = SHIBYTE(v45) >= 0 ? &v44 : (__int128 *)v44;
      v35 = SHIBYTE(v45) >= 0 ? HIBYTE(v45) : *((_QWORD *)&v44 + 1);
      v36 = *(char *)(v32 + 47);
      v37 = v36 >= 0 ? (const void *)(a1 + v31 + 24) : *(const void **)(a1 + v31 + 24);
      v38 = v36 >= 0 ? *(unsigned __int8 *)(v32 + 47) : *(_QWORD *)(v32 + 32);
      v39 = v38 >= v35 ? v35 : v38;
      v40 = memcmp(v34, v37, v39);
      if (!v40)
        break;
      if (v40 < 0)
      {
        v21 = (uint64_t)v17;
        goto LABEL_23;
      }
LABEL_48:
      v17 -= 3;
      *(_OWORD *)(v32 + 48) = *v33;
      *(_QWORD *)(v32 + 64) = *(_QWORD *)(a1 + v31 + 40);
      *(_BYTE *)(v32 + 47) = 0;
      *(_BYTE *)v33 = 0;
      v31 -= 24;
      if (v31 == -48)
      {
        v21 = a1;
        goto LABEL_23;
      }
    }
    if (v35 > v38)
      goto LABEL_48;
    v21 = a1 + v31 + 48;
LABEL_23:
    v2 = v43;
LABEL_24:
    v22 = v44;
    *(_QWORD *)(v21 + 16) = v45;
    *(_OWORD *)v21 = v22;
    if (++v20 == 8)
      return v18 + 3 == v2;
LABEL_25:
    v17 = v18;
    v19 += 24;
    v18 += 3;
    if (v18 != v2)
      continue;
    return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4)
{
  int v8;
  const void *v9;
  size_t v10;
  int v11;
  const void *v12;
  const void *v13;
  const void *v14;
  size_t v15;
  size_t v16;
  int v17;
  __n128 result;
  const void *v19;
  const void *v20;
  int v21;
  const void *v22;
  size_t v23;
  int v24;
  const void *v25;
  uint64_t v26;
  const void *v27;
  size_t v28;
  size_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const void *v34;
  size_t v35;
  int v36;
  const void *v37;
  uint64_t v38;
  const void *v39;
  size_t v40;
  size_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a2, (const void **)a3);
  v8 = *((char *)a4 + 23);
  if (v8 >= 0)
    v9 = a4;
  else
    v9 = *a4;
  if (v8 >= 0)
    v10 = *((unsigned __int8 *)a4 + 23);
  else
    v10 = (size_t)a4[1];
  v11 = *(char *)(a3 + 23);
  v12 = *(const void **)a3;
  v13 = *(const void **)(a3 + 8);
  if (v11 >= 0)
    v14 = (const void *)a3;
  else
    v14 = *(const void **)a3;
  if (v11 >= 0)
    v15 = *(unsigned __int8 *)(a3 + 23);
  else
    v15 = *(_QWORD *)(a3 + 8);
  if (v15 >= v10)
    v16 = v10;
  else
    v16 = v15;
  v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if (v17 < 0)
      return result;
  }
  else if (v10 <= v15)
  {
    return result;
  }
  v19 = *(const void **)(a3 + 16);
  v20 = a4[2];
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(_QWORD *)(a3 + 16) = v20;
  *a4 = v12;
  a4[1] = v13;
  a4[2] = v19;
  v21 = *(char *)(a3 + 23);
  if (v21 >= 0)
    v22 = (const void *)a3;
  else
    v22 = *(const void **)a3;
  if (v21 >= 0)
    v23 = *(unsigned __int8 *)(a3 + 23);
  else
    v23 = *(_QWORD *)(a3 + 8);
  v24 = *(char *)(a2 + 23);
  v25 = *(const void **)a2;
  v26 = *(_QWORD *)(a2 + 8);
  if (v24 >= 0)
    v27 = (const void *)a2;
  else
    v27 = *(const void **)a2;
  if (v24 >= 0)
    v28 = *(unsigned __int8 *)(a2 + 23);
  else
    v28 = *(_QWORD *)(a2 + 8);
  if (v28 >= v23)
    v29 = v23;
  else
    v29 = v28;
  v30 = memcmp(v22, v27, v29);
  if (v30)
  {
    if (v30 < 0)
      return result;
  }
  else if (v23 <= v28)
  {
    return result;
  }
  v31 = *(_QWORD *)(a2 + 16);
  v32 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = v32;
  *(_QWORD *)a3 = v25;
  *(_QWORD *)(a3 + 8) = v26;
  *(_QWORD *)(a3 + 16) = v31;
  v33 = *(char *)(a2 + 23);
  if (v33 >= 0)
    v34 = (const void *)a2;
  else
    v34 = *(const void **)a2;
  if (v33 >= 0)
    v35 = *(unsigned __int8 *)(a2 + 23);
  else
    v35 = *(_QWORD *)(a2 + 8);
  v36 = *(char *)(a1 + 23);
  v37 = *(const void **)a1;
  v38 = *(_QWORD *)(a1 + 8);
  if (v36 >= 0)
    v39 = (const void *)a1;
  else
    v39 = *(const void **)a1;
  if (v36 >= 0)
    v40 = *(unsigned __int8 *)(a1 + 23);
  else
    v40 = *(_QWORD *)(a1 + 8);
  if (v40 >= v35)
    v41 = v35;
  else
    v41 = v40;
  v42 = memcmp(v34, v39, v41);
  if (!v42)
  {
    if (v35 <= v40)
      return result;
LABEL_58:
    v43 = *(_QWORD *)(a1 + 16);
    v44 = *(_QWORD *)(a2 + 16);
    result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = v44;
    *(_QWORD *)a2 = v37;
    *(_QWORD *)(a2 + 8) = v38;
    *(_QWORD *)(a2 + 16) = v43;
    return result;
  }
  if ((v42 & 0x80000000) == 0)
    goto LABEL_58;
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void **a5)
{
  int v10;
  const void *v11;
  size_t v12;
  int v13;
  const void *v14;
  const void *v15;
  const void *v16;
  size_t v17;
  size_t v18;
  int v19;
  __n128 result;
  const void *v21;
  const void *v22;
  int v23;
  const void *v24;
  size_t v25;
  int v26;
  const void *v27;
  uint64_t v28;
  const void *v29;
  size_t v30;
  size_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const void *v36;
  size_t v37;
  int v38;
  const void *v39;
  uint64_t v40;
  const void *v41;
  size_t v42;
  size_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const void *v48;
  size_t v49;
  int v50;
  const void *v51;
  uint64_t v52;
  const void *v53;
  size_t v54;
  size_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::string> &,std::string*>(a1, a2, a3, (const void **)a4);
  v10 = *((char *)a5 + 23);
  if (v10 >= 0)
    v11 = a5;
  else
    v11 = *a5;
  if (v10 >= 0)
    v12 = *((unsigned __int8 *)a5 + 23);
  else
    v12 = (size_t)a5[1];
  v13 = *(char *)(a4 + 23);
  v14 = *(const void **)a4;
  v15 = *(const void **)(a4 + 8);
  if (v13 >= 0)
    v16 = (const void *)a4;
  else
    v16 = *(const void **)a4;
  if (v13 >= 0)
    v17 = *(unsigned __int8 *)(a4 + 23);
  else
    v17 = *(_QWORD *)(a4 + 8);
  if (v17 >= v12)
    v18 = v12;
  else
    v18 = v17;
  v19 = memcmp(v11, v16, v18);
  if (v19)
  {
    if (v19 < 0)
      return result;
  }
  else if (v12 <= v17)
  {
    return result;
  }
  v21 = *(const void **)(a4 + 16);
  v22 = a5[2];
  *(_OWORD *)a4 = *(_OWORD *)a5;
  *(_QWORD *)(a4 + 16) = v22;
  *a5 = v14;
  a5[1] = v15;
  a5[2] = v21;
  v23 = *(char *)(a4 + 23);
  if (v23 >= 0)
    v24 = (const void *)a4;
  else
    v24 = *(const void **)a4;
  if (v23 >= 0)
    v25 = *(unsigned __int8 *)(a4 + 23);
  else
    v25 = *(_QWORD *)(a4 + 8);
  v26 = *(char *)(a3 + 23);
  v27 = *(const void **)a3;
  v28 = *(_QWORD *)(a3 + 8);
  if (v26 >= 0)
    v29 = (const void *)a3;
  else
    v29 = *(const void **)a3;
  if (v26 >= 0)
    v30 = *(unsigned __int8 *)(a3 + 23);
  else
    v30 = *(_QWORD *)(a3 + 8);
  if (v30 >= v25)
    v31 = v25;
  else
    v31 = v30;
  v32 = memcmp(v24, v29, v31);
  if (v32)
  {
    if (v32 < 0)
      return result;
  }
  else if (v25 <= v30)
  {
    return result;
  }
  v33 = *(_QWORD *)(a3 + 16);
  v34 = *(_QWORD *)(a4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(_QWORD *)(a3 + 16) = v34;
  *(_QWORD *)a4 = v27;
  *(_QWORD *)(a4 + 8) = v28;
  *(_QWORD *)(a4 + 16) = v33;
  v35 = *(char *)(a3 + 23);
  if (v35 >= 0)
    v36 = (const void *)a3;
  else
    v36 = *(const void **)a3;
  if (v35 >= 0)
    v37 = *(unsigned __int8 *)(a3 + 23);
  else
    v37 = *(_QWORD *)(a3 + 8);
  v38 = *(char *)(a2 + 23);
  v39 = *(const void **)a2;
  v40 = *(_QWORD *)(a2 + 8);
  if (v38 >= 0)
    v41 = (const void *)a2;
  else
    v41 = *(const void **)a2;
  if (v38 >= 0)
    v42 = *(unsigned __int8 *)(a2 + 23);
  else
    v42 = *(_QWORD *)(a2 + 8);
  if (v42 >= v37)
    v43 = v37;
  else
    v43 = v42;
  v44 = memcmp(v36, v41, v43);
  if (v44)
  {
    if (v44 < 0)
      return result;
  }
  else if (v37 <= v42)
  {
    return result;
  }
  v45 = *(_QWORD *)(a2 + 16);
  v46 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(_QWORD *)(a2 + 16) = v46;
  *(_QWORD *)a3 = v39;
  *(_QWORD *)(a3 + 8) = v40;
  *(_QWORD *)(a3 + 16) = v45;
  v47 = *(char *)(a2 + 23);
  if (v47 >= 0)
    v48 = (const void *)a2;
  else
    v48 = *(const void **)a2;
  if (v47 >= 0)
    v49 = *(unsigned __int8 *)(a2 + 23);
  else
    v49 = *(_QWORD *)(a2 + 8);
  v50 = *(char *)(a1 + 23);
  v51 = *(const void **)a1;
  v52 = *(_QWORD *)(a1 + 8);
  if (v50 >= 0)
    v53 = (const void *)a1;
  else
    v53 = *(const void **)a1;
  if (v50 >= 0)
    v54 = *(unsigned __int8 *)(a1 + 23);
  else
    v54 = *(_QWORD *)(a1 + 8);
  if (v54 >= v49)
    v55 = v49;
  else
    v55 = v54;
  v56 = memcmp(v48, v53, v55);
  if (v56)
  {
    if (v56 < 0)
      return result;
  }
  else if (v49 <= v54)
  {
    return result;
  }
  v57 = *(_QWORD *)(a1 + 16);
  v58 = *(_QWORD *)(a2 + 16);
  result = *(__n128 *)a2;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v58;
  *(_QWORD *)a2 = v51;
  *(_QWORD *)(a2 + 8) = v52;
  *(_QWORD *)(a2 + 16) = v57;
  return result;
}

char *std::vector<std::string>::__push_back_slow_path<std::string>(void **a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  void **v11;
  void **v12;
  __int128 v13;
  void **v14;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v4)
    v4 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v4;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[24 * v3];
  v9 = &v7[24 * v6];
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v10 = v8 + 24;
  v11 = (void **)*a1;
  v12 = (void **)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
  }
  else
  {
    do
    {
      v13 = *(_OWORD *)(v12 - 3);
      *((_QWORD *)v8 - 1) = *(v12 - 1);
      *(_OWORD *)(v8 - 24) = v13;
      v8 -= 24;
      *(v12 - 2) = 0;
      *(v12 - 1) = 0;
      *(v12 - 3) = 0;
      v12 -= 3;
    }
    while (v12 != v11);
    v12 = (void **)*a1;
    v14 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    while (v14 != v12)
    {
      if (*((char *)v14 - 1) < 0)
        operator delete(*(v14 - 3));
      v14 -= 3;
    }
  }
  if (v12)
    operator delete(v12);
  return v10;
}

uint64_t *std::unique_ptr<std::__hash_node<std::string,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16) && *(char *)(v2 + 39) < 0)
      operator delete(*(void **)(v2 + 16));
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t *GetOsLogContext(void)
{
  unsigned __int8 v0;

  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2579B8240 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  return &GetOsLogContext(void)::sOsLogContext;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  _BYTE v0[16];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(uint64_t *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];
  std::__shared_weak_count *v11;

  v2 = atomic_load((unsigned __int8 *)&qword_2579B81E8);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_2579B81E8))
  {
    MEMORY[0x24BD27F80](&unk_2579B81F0);
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED98A0], &unk_2579B81F0, &dword_24B825000);
    __cxa_guard_release(&qword_2579B81E8);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_3;
  v3 = *a1;
  v4 = (std::__shared_weak_count *)a1[1];
  v10[4] = v3;
  v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  if (_MergedGlobals_1 != -1)
  {
    dispatch_once(&_MergedGlobals_1, v10);
    v4 = v11;
    if (v11)
      goto LABEL_7;
    return &unk_2579B81F0;
  }
  if (!v4)
    return &unk_2579B81F0;
LABEL_7:
  v7 = (unint64_t *)&v4->__shared_owners_;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (v8)
    return &unk_2579B81F0;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return &unk_2579B81F0;
}

void sub_24B842D9C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_2579B81E8);
  _Unwind_Resume(a1);
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _BYTE v10[16];
  _BYTE v11[48];
  uint64_t v12;
  uint64_t v13;

  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_2579B8240 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_24B825000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v10, (const ctu::OsLogContext *)&GetOsLogContext(void)::sOsLogContext);
  MEMORY[0x24BD27F74](v11, v10, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  v4 = v12;
  v3 = v13;
  if (v13)
  {
    v5 = (unint64_t *)(v13 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)qword_2579B8228;
  qword_2579B8220 = v4;
  qword_2579B8228 = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  ctu::StaticLogger::~StaticLogger((ctu::StaticLogger *)v11);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v10);
}

void sub_24B842EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1180";
}

uint64_t BBUpdaterRegisterGlobalLogSink()
{
  return MEMORY[0x24BED3468]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x24BED96F8]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x24BED9700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  return MEMORY[0x24BED90C0](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x24BED9298](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x24BED92A8](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x24BED92B8](this);
}

uint64_t capabilities::trace::supportsBasebandIPCTrace(capabilities::trace *this)
{
  return MEMORY[0x24BED9300](this);
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  return MEMORY[0x24BED9330](this);
}

uint64_t ctu::LogMessage::LogMessage()
{
  return MEMORY[0x24BED97E0]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x24BED9860](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x24BED9870]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x24BED9880]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x24BED9888](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
  MEMORY[0x24BED98A0](this);
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9968](this);
}

uint64_t ctu::LogMessageBuffer::takeMetadata(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9970](this);
}

uint64_t ctu::LogMessageBuffer::vprintf(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x24BED9988](this, a2, a3);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9990](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  MEMORY[0x24BED9998](this);
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x24BED99C8]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

uint64_t ctu::fs::remove_dir()
{
  return MEMORY[0x24BED9B30]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x24BED9B50]();
}

uint64_t ctu::fs::get_file_size()
{
  return MEMORY[0x24BED9B58]();
}

uint64_t ctu::fs::get_filtered_files()
{
  return MEMORY[0x24BED9B70]();
}

uint64_t ctu::fs::get_unique_filename()
{
  return MEMORY[0x24BED9B78]();
}

uint64_t ctu::fs::rename()
{
  return MEMORY[0x24BED9B88]();
}

uint64_t ctu::Clock::now_in_nanoseconds(ctu::Clock *this)
{
  return MEMORY[0x24BED9C58](this);
}

uint64_t ctu::assign()
{
  return MEMORY[0x24BED9C60]();
}

uint64_t ctu::LogServer::updateConfig()
{
  return MEMORY[0x24BED9CA8]();
}

uint64_t ctu::LogServer::log()
{
  return MEMORY[0x24BED9CB0]();
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x24BED9D28]();
}

{
  return MEMORY[0x24BED9D38]();
}

{
  return MEMORY[0x24BED9D48]();
}

{
  return MEMORY[0x24BED9D58]();
}

uint64_t ctu::LogServer::getConfig(ctu::LogServer *this)
{
  return MEMORY[0x24BED9EC0](this);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x24BEDAE10]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF58]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB338](__str, __idx, *(_QWORD *)&__base);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_251CB40A0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CB40A8(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x24BDAFF98](a1, a2, a3);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

