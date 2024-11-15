uint64_t marisa::grimoire::io::Mapper::Mapper(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_QWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 32) = -1;
  return this;
}

{
  *(_QWORD *)this = 0;
  *(_QWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 32) = -1;
  return this;
}

void marisa::grimoire::io::Mapper::~Mapper(marisa::grimoire::io::Mapper *this)
{
  void *v2;
  int v3;

  v2 = (void *)*((_QWORD *)this + 1);
  if (v2 != (void *)-1)
    munmap(v2, *((_QWORD *)this + 3));
  v3 = *((_DWORD *)this + 8);
  if (v3 != -1)
    close(v3);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void marisa::grimoire::io::Mapper::open(marisa::grimoire::io::Mapper *this, const char *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  int v6;
  _QWORD *exception;
  __int128 v8;
  __int128 v9;
  int v10;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x200000037;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:55: MARISA_NULL_ERROR: "
                   "filename == NULL";
  }
  *(_QWORD *)&v8 = 0;
  *((_QWORD *)&v8 + 1) = -1;
  v9 = 0uLL;
  v10 = -1;
  marisa::grimoire::io::Mapper::open_((marisa::grimoire::io::Mapper *)&v8, a2);
  v3 = v9;
  v4 = *(_OWORD *)this;
  v5 = *((_OWORD *)this + 1);
  *(_OWORD *)this = v8;
  *((_OWORD *)this + 1) = v3;
  v8 = v4;
  v9 = v5;
  v6 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = v10;
  v10 = v6;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)&v8);
}

void sub_209CA026C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)&a9);
  _Unwind_Resume(a1);
}

void *marisa::grimoire::io::Mapper::open_(marisa::grimoire::io::Mapper *this, const char *a2)
{
  int v4;
  void *result;
  _QWORD *exception;
  const char *v7;
  stat v8;

  if (stat(a2, &v8))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x90000008DLL;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:141: MARISA_IO_ERROR: ::stat(filename, &st) != 0";
    goto LABEL_8;
  }
  *((_QWORD *)this + 3) = v8.st_size;
  v4 = open(a2, 0);
  *((_DWORD *)this + 8) = v4;
  if (v4 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000092;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:146: MARISA_IO_ERROR: fd_ == -1";
    goto LABEL_8;
  }
  result = mmap(0, *((_QWORD *)this + 3), 1, 1, v4, 0);
  *((_QWORD *)this + 1) = result;
  if (result == (void *)-1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000095;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:149: MARISA_IO_ERROR: origin_ == MAP_FAILED";
LABEL_8:
    exception[3] = v7;
  }
  *(_QWORD *)this = result;
  *((_QWORD *)this + 2) = *((_QWORD *)this + 3);
  return result;
}

uint64_t *marisa::grimoire::io::Mapper::swap(uint64_t *this, marisa::grimoire::io::Mapper *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *this;
  *this = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  v4 = this[1];
  v3 = this[2];
  v5 = *((_QWORD *)a2 + 2);
  this[1] = *((_QWORD *)a2 + 1);
  this[2] = v5;
  *((_QWORD *)a2 + 1) = v4;
  *((_QWORD *)a2 + 2) = v3;
  v6 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  LODWORD(v6) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v6;
  return this;
}

__n128 marisa::grimoire::io::Mapper::open(marisa::grimoire::io::Mapper *this, const void *a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  int v5;
  __n128 result;
  _QWORD *exception;
  _OWORD v8[2];
  int v9;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x20000003FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:63: MARISA_NULL_ERROR: "
                   "(ptr == NULL) && (size != 0)";
  }
  v3 = *(_OWORD *)this;
  v4 = *((_OWORD *)this + 1);
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = -1;
  *((_QWORD *)this + 2) = a3;
  *((_QWORD *)this + 3) = 0;
  v8[0] = v3;
  v8[1] = v4;
  v5 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = -1;
  v9 = v5;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v8);
  return result;
}

_QWORD *marisa::grimoire::io::Mapper::open_(_QWORD *this, const void *a2, uint64_t a3)
{
  *this = a2;
  this[2] = a3;
  return this;
}

uint64_t marisa::grimoire::io::Mapper::seek(marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  _QWORD *exception;
  const char *v4;

  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000047;
    v4 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:71: MARISA_STATE_ERROR: !is_open()";
    goto LABEL_6;
  }
  if (*((_QWORD *)this + 2) < a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000048;
    v4 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:72: MARISA_IO_ERROR: size > avail_";
LABEL_6:
    exception[3] = v4;
  }
  return marisa::grimoire::io::Mapper::map_data(this, a2);
}

BOOL marisa::grimoire::io::Mapper::is_open(marisa::grimoire::io::Mapper *this)
{
  return *(_QWORD *)this != 0;
}

uint64_t marisa::grimoire::io::Mapper::map_data(marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  _QWORD *exception;
  const char *v8;

  v2 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000063;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:99: MARISA_STATE_ERROR: !is_open()";
LABEL_6:
    exception[3] = v8;
  }
  v3 = *((_QWORD *)this + 2);
  v4 = v3 >= a2;
  v5 = v3 - a2;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000064;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:100: MARISA_IO_ERROR: size > avail_";
    goto LABEL_6;
  }
  *(_QWORD *)this = v2 + a2;
  *((_QWORD *)this + 2) = v5;
  return v2;
}

__n128 marisa::grimoire::io::Mapper::clear(marisa::grimoire::io::Mapper *this)
{
  __int128 v1;
  __int128 v2;
  __n128 result;
  _OWORD v4[2];
  int v5;

  v1 = *(_OWORD *)this;
  v2 = *((_OWORD *)this + 1);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = -1;
  v4[0] = v1;
  v4[1] = v2;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v5 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = -1;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v4);
  return result;
}

void marisa::Exception::~Exception(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x20BD185FCLL);
}

uint64_t marisa::Exception::what(marisa::Exception *this)
{
  return *((_QWORD *)this + 3);
}

marisa::grimoire::trie::LoudsTrie *marisa::grimoire::trie::LoudsTrie::LoudsTrie(marisa::grimoire::trie::LoudsTrie *this)
{
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 89) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *(_OWORD *)((char *)this + 345) = 0u;
  *(_OWORD *)((char *)this + 393) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 297) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *(_OWORD *)((char *)this + 441) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *(_OWORD *)((char *)this + 553) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
  *(_OWORD *)((char *)this + 601) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 37) = 0u;
  *(_OWORD *)((char *)this + 505) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *(_OWORD *)((char *)this + 649) = 0u;
  *((_OWORD *)this + 39) = 0u;
  *((_OWORD *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 697) = 0u;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *((_QWORD *)this + 90) = 0;
  *((_DWORD *)this + 182) = 0;
  *((_QWORD *)this + 92) = 0;
  marisa::grimoire::trie::Tail::Tail((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744));
  *((_BYTE *)this + 1048) = 0;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1000) = 0u;
  *((_OWORD *)this + 66) = 0u;
  *((_QWORD *)this + 134) = 3;
  *((_QWORD *)this + 135) = 0x100000000200;
  *((_DWORD *)this + 272) = 0x20000;
  marisa::grimoire::io::Mapper::Mapper((uint64_t)this + 1096);
  return this;
}

void sub_209CA07B4(_Unwind_Exception *a1)
{
  marisa::grimoire::vector::BitVector *v1;
  marisa::grimoire::vector::BitVector *v2;
  marisa::grimoire::vector::BitVector *v3;
  marisa::grimoire::trie::Tail *v4;
  marisa::grimoire::trie::LoudsTrie **v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v9;

  v9 = *((_QWORD *)v1 + 126);
  if (v9)
    MEMORY[0x20BD185D8](v9, 0x1000C8077774924);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v5);
  marisa::grimoire::trie::Tail::~Tail(v4);
  if (*v7)
    MEMORY[0x20BD185D8](*v7, 0x1000C8077774924);
  if (*v6)
    MEMORY[0x20BD185D8](*v6, 0x1000C8077774924);
  marisa::grimoire::vector::BitVector::~BitVector(v3);
  marisa::grimoire::vector::BitVector::~BitVector(v2);
  marisa::grimoire::vector::BitVector::~BitVector(v1);
  _Unwind_Resume(a1);
}

void marisa::grimoire::trie::Tail::~Tail(marisa::grimoire::trie::Tail *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *((_QWORD *)this + 26);
  if (v2)
    MEMORY[0x20BD185D8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 20);
  if (v3)
    MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 14);
  if (v4)
    MEMORY[0x20BD185D8](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 6);
  if (v5)
    MEMORY[0x20BD185D8](v5, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x20BD185D8](*(_QWORD *)this, 0x1000C8077774924);
}

void marisa::grimoire::vector::BitVector::~BitVector(marisa::grimoire::vector::BitVector *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 20);
  if (v2)
    MEMORY[0x20BD185D8](v2, 0x1000C8077774924);
  v3 = *((_QWORD *)this + 14);
  if (v3)
    MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 8);
  if (v4)
    MEMORY[0x20BD185D8](v4, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x20BD185D8](*(_QWORD *)this, 0x1000C8077774924);
}

void marisa::grimoire::trie::LoudsTrie::~LoudsTrie(marisa::grimoire::trie::LoudsTrie *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::trie::LoudsTrie *)((char *)this + 1096));
  v2 = *((_QWORD *)this + 126);
  if (v2)
    MEMORY[0x20BD185D8](v2, 0x1000C8077774924);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((char *)this + 1000);
  v3 = *((_QWORD *)this + 119);
  if (v3)
    MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  v4 = *((_QWORD *)this + 113);
  if (v4)
    MEMORY[0x20BD185D8](v4, 0x1000C8077774924);
  v5 = *((_QWORD *)this + 107);
  if (v5)
    MEMORY[0x20BD185D8](v5, 0x1000C8077774924);
  v6 = *((_QWORD *)this + 99);
  if (v6)
    MEMORY[0x20BD185D8](v6, 0x1000C8077774924);
  v7 = *((_QWORD *)this + 93);
  if (v7)
    MEMORY[0x20BD185D8](v7, 0x1000C8077774924);
  v8 = *((_QWORD *)this + 84);
  if (v8)
    MEMORY[0x20BD185D8](v8, 0x1000C8077774924);
  v9 = *((_QWORD *)this + 78);
  if (v9)
    MEMORY[0x20BD185D8](v9, 0x1000C8077774924);
  v10 = *((_QWORD *)this + 72);
  if (v10)
    MEMORY[0x20BD185D8](v10, 0x1000C8077774924);
  v11 = *((_QWORD *)this + 66);
  if (v11)
    MEMORY[0x20BD185D8](v11, 0x1000C8077774924);
  v12 = *((_QWORD *)this + 60);
  if (v12)
    MEMORY[0x20BD185D8](v12, 0x1000C8077774924);
  v13 = *((_QWORD *)this + 52);
  if (v13)
    MEMORY[0x20BD185D8](v13, 0x1000C8077774924);
  v14 = *((_QWORD *)this + 46);
  if (v14)
    MEMORY[0x20BD185D8](v14, 0x1000C8077774924);
  v15 = *((_QWORD *)this + 40);
  if (v15)
    MEMORY[0x20BD185D8](v15, 0x1000C8077774924);
  v16 = *((_QWORD *)this + 34);
  if (v16)
    MEMORY[0x20BD185D8](v16, 0x1000C8077774924);
  v17 = *((_QWORD *)this + 26);
  if (v17)
    MEMORY[0x20BD185D8](v17, 0x1000C8077774924);
  v18 = *((_QWORD *)this + 20);
  if (v18)
    MEMORY[0x20BD185D8](v18, 0x1000C8077774924);
  v19 = *((_QWORD *)this + 14);
  if (v19)
    MEMORY[0x20BD185D8](v19, 0x1000C8077774924);
  v20 = *((_QWORD *)this + 8);
  if (v20)
    MEMORY[0x20BD185D8](v20, 0x1000C8077774924);
  if (*(_QWORD *)this)
    MEMORY[0x20BD185D8](*(_QWORD *)this, 0x1000C8077774924);
}

void marisa::grimoire::trie::LoudsTrie::build(marisa::grimoire::trie::LoudsTrie *this, marisa::Keyset *a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  _QWORD v8[2];
  int v9;

  v5 = 3;
  v6 = 0x100000000200;
  v7 = 0x20000;
  marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v5, a3);
  v8[0] = v5;
  v8[1] = v6;
  v9 = v7;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie((marisa::grimoire::trie::LoudsTrie *)&v5);
  marisa::grimoire::trie::LoudsTrie::build_((marisa::grimoire::trie::LoudsTrie *)&v5, a2, (const marisa::grimoire::trie::Config *)v8);
  marisa::grimoire::trie::LoudsTrie::swap(this, (marisa::grimoire::trie::LoudsTrie *)&v5);
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)&v5);
}

void sub_209CA0C84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)va);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_(marisa::grimoire::trie::LoudsTrie *this, marisa::Keyset *a2, const marisa::grimoire::trie::Config *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t i;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t result;
  _OWORD v28[3];
  __int128 v29;
  unint64_t v30[4];
  _OWORD v31[3];
  char v32;

  memset(v31, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::resize((uint64_t *)v31, *((_QWORD *)a2 + 11));
  if (*((_QWORD *)a2 + 11))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = *((_QWORD *)&v31[0] + 1) + v6;
      v9 = *(_QWORD *)(*((_QWORD *)a2 + 6) + ((v7 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v7;
      v10 = *(_DWORD *)(v9 + 8);
      *(_QWORD *)v8 = *(_QWORD *)v9;
      *(_DWORD *)(v8 + 8) = v10;
      *(_DWORD *)(v8 + 12) = *(_DWORD *)(v9 + 12);
      ++v7;
      v6 += 24;
    }
    while (v7 < *((_QWORD *)a2 + 11));
  }
  v29 = 0u;
  memset(v30, 0, 25);
  marisa::grimoire::trie::LoudsTrie::build_trie<marisa::grimoire::trie::Key>((uint64_t)this, (uint64_t *)v31, &v29, (uint64_t)a3, 1);
  memset(v28, 0, 41);
  marisa::grimoire::vector::Vector<std::pair<unsigned int,unsigned int>>::resize((uint64_t *)v28, v30[1]);
  v11 = *((_QWORD *)&v28[1] + 1);
  if (*((_QWORD *)&v28[1] + 1))
  {
    v12 = 0;
    v13 = *((_QWORD *)&v29 + 1);
    v14 = (_DWORD *)(*((_QWORD *)&v28[0] + 1) + 4);
    do
    {
      *(v14 - 1) = *(_DWORD *)(v13 + 4 * v12);
      *v14 = v12++;
      v14 += 2;
    }
    while (v11 != v12);
  }
  v15 = v29;
  v29 = 0u;
  memset(v30, 0, 25);
  if (v15)
  {
    MEMORY[0x20BD185D8](v15, 0x1000C8077774924);
    v11 = *((_QWORD *)&v28[1] + 1);
  }
  v16 = 126 - 2 * __clz(v11);
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(*((uint64_t *)&v28[0] + 1), (unsigned int *)(*((_QWORD *)&v28[0] + 1) + 8 * v11), (uint64_t)&v32, v17, 1);
  if (*((_QWORD *)&v28[1] + 1))
  {
    v18 = 0;
    v19 = 0;
    do
    {
      for (i = *((_QWORD *)&v28[0] + 1); ; i = *((_QWORD *)&v28[0] + 1))
      {
        v21 = *(unsigned int *)(i + 8 * v18);
        if (v19 >= v21)
          break;
        marisa::grimoire::vector::BitVector::push_back((uint64_t *)this + 26, 0);
        ++v19;
      }
      if (v19 == v21)
      {
        marisa::grimoire::vector::BitVector::push_back((uint64_t *)this + 26, 1);
        ++v19;
      }
      ++v18;
    }
    while (v18 < *((_QWORD *)&v28[1] + 1));
  }
  else
  {
    v19 = 0;
  }
  for (; v19 < *((_QWORD *)this + 81); ++v19)
    marisa::grimoire::vector::BitVector::push_back((uint64_t *)this + 26, 0);
  v22 = (uint64_t *)((char *)this + 208);
  marisa::grimoire::vector::BitVector::push_back(v22, 0);
  marisa::grimoire::vector::BitVector::build((marisa::grimoire::vector::BitVector *)v22, 0, 1);
  if (*((_QWORD *)a2 + 11))
  {
    v23 = 0;
    v24 = 0;
    do
    {
      v25 = *(unsigned int *)(*((_QWORD *)&v28[0] + 1) + v23 + 4);
      v26 = *(_QWORD *)(*((_QWORD *)a2 + 6) + ((v25 >> 5) & 0x7FFFFF8));
      *(_DWORD *)(v26 + 16 * v25 + 12) = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::vector::BitVector *)v22, *(unsigned int *)(*((_QWORD *)&v28[0] + 1) + v23));
      ++v24;
      v23 += 8;
    }
    while (v24 < *((_QWORD *)a2 + 11));
  }
  if (*(_QWORD *)&v28[0])
    MEMORY[0x20BD185D8](*(_QWORD *)&v28[0], 0x1000C8077774924);
  if ((_QWORD)v29)
    MEMORY[0x20BD185D8](v29, 0x1000C8077774924);
  result = *(_QWORD *)&v31[0];
  if (*(_QWORD *)&v31[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v31[0], 0x1000C8077774924);
  return result;
}

void sub_209CA0F64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  if (a15)
    MEMORY[0x20BD185D8](a15, 0x1000C8077774924);
  if (a21)
    MEMORY[0x20BD185D8](a21, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t *marisa::grimoire::trie::LoudsTrie::swap(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::trie::LoudsTrie *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  marisa::grimoire::vector::BitVector::swap(this, a2);
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 208));
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 416));
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 78, (uint64_t *)a2 + 78);
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 84, (uint64_t *)a2 + 84);
  v4 = *((_QWORD *)this + 90);
  *((_QWORD *)this + 90) = *((_QWORD *)a2 + 90);
  *((_QWORD *)a2 + 90) = v4;
  LODWORD(v4) = *((_DWORD *)this + 182);
  *((_DWORD *)this + 182) = *((_DWORD *)a2 + 182);
  *((_DWORD *)a2 + 182) = v4;
  v5 = *((_QWORD *)this + 92);
  *((_QWORD *)this + 92) = *((_QWORD *)a2 + 92);
  *((_QWORD *)a2 + 92) = v5;
  marisa::grimoire::trie::Tail::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 744));
  v6 = *((_QWORD *)this + 125);
  *((_QWORD *)this + 125) = *((_QWORD *)a2 + 125);
  *((_QWORD *)a2 + 125) = v6;
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 126, (uint64_t *)a2 + 126);
  v7 = *((_QWORD *)this + 132);
  *((_QWORD *)this + 132) = *((_QWORD *)a2 + 132);
  *((_QWORD *)a2 + 132) = v7;
  v8 = *((_QWORD *)this + 133);
  *((_QWORD *)this + 133) = *((_QWORD *)a2 + 133);
  *((_QWORD *)a2 + 133) = v8;
  v9 = *((_QWORD *)this + 134);
  *((_QWORD *)this + 134) = *((_QWORD *)a2 + 134);
  *((_QWORD *)a2 + 134) = v9;
  v10 = *((_QWORD *)this + 135);
  *((_QWORD *)this + 135) = *((_QWORD *)a2 + 135);
  *((_QWORD *)a2 + 135) = v10;
  LODWORD(v9) = *((_DWORD *)this + 272);
  *((_DWORD *)this + 272) = *((_DWORD *)a2 + 272);
  *((_DWORD *)a2 + 272) = v9;
  return marisa::grimoire::io::Mapper::swap((uint64_t *)this + 137, (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 1096));
}

void marisa::grimoire::trie::LoudsTrie::map(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Mapper *a2)
{
  _BYTE v4[1096];
  uint64_t v5[5];

  marisa::grimoire::trie::Header::map((marisa::grimoire::trie::Header *)v4, a2);
  marisa::grimoire::trie::LoudsTrie::LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::map_((marisa::grimoire::trie::LoudsTrie *)v4, a2);
  marisa::grimoire::io::Mapper::swap(v5, a2);
  marisa::grimoire::trie::LoudsTrie::swap(this, (marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
}

void sub_209CA115C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)&a9);
  _Unwind_Resume(a1);
}

_BYTE *marisa::grimoire::trie::Header::map(marisa::grimoire::trie::Header *this, marisa::grimoire::io::Mapper *a2)
{
  _BYTE *result;
  uint64_t v3;
  int v4;
  int v5;
  _QWORD *exception;

  result = (_BYTE *)marisa::grimoire::io::Mapper::map_data(a2, 0x10uLL);
  if (*result != 87)
    goto LABEL_7;
  v3 = 1u;
  do
  {
    if (v3 == 16)
      return result;
    v4 = result[v3];
    v5 = marisa::grimoire::trie::Header::get_header(void)::buf[v3++];
  }
  while (v4 == v5);
  if ((unint64_t)(v3 - 2) <= 0xE)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h";
    exception[2] = 0xA00000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h:21: MARISA_FORMAT_ERRO"
                   "R: !test_header(ptr)";
  }
  return result;
}

double marisa::grimoire::trie::LoudsTrie::map_(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Mapper *a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  unsigned int v7;
  double result;
  _QWORD *exception;
  uint64_t v10;
  double v11;
  int v12;

  marisa::grimoire::vector::BitVector::map(this, a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), a2);
  marisa::grimoire::vector::Vector<unsigned char>::map((__int128 *)this + 39, a2);
  marisa::grimoire::vector::FlatVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 672), a2);
  marisa::grimoire::trie::Tail::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2);
  if (*((_QWORD *)this + 59) && !*((_QWORD *)this + 96))
  {
    v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
    v5 = v4;
    if (v4)
      marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
    marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset((marisa::grimoire::trie::LoudsTrie **)this + 125, v5);
    v6 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x80000021ELL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:542: MARISA_MEM"
                     "ORY_ERROR: next_trie_.get() == NULL";
    }
    marisa::grimoire::trie::LoudsTrie::map_(v6, a2);
  }
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::map((__int128 *)this + 63, a2);
  *((_QWORD *)this + 132) = *((_QWORD *)this + 129) - 1;
  *((_QWORD *)this + 133) = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v7 = *(_DWORD *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v10 = 3;
  *(_QWORD *)&v11 = 0x100000000200;
  v12 = 0x20000;
  marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v10, v7);
  *((_QWORD *)this + 134) = v10;
  result = v11;
  *((double *)this + 135) = v11;
  *((_DWORD *)this + 272) = v12;
  return result;
}

void sub_209CA139C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD185F0](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

void marisa::grimoire::trie::LoudsTrie::read(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Reader *a2)
{
  _BYTE v4[1136];

  marisa::grimoire::trie::Header::read((marisa::grimoire::trie::Header *)v4, a2);
  marisa::grimoire::trie::LoudsTrie::LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::read_((marisa::grimoire::trie::LoudsTrie *)v4, a2);
  marisa::grimoire::trie::LoudsTrie::swap(this, (marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
}

void sub_209CA1418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::Header::read(marisa::grimoire::trie::Header *this, marisa::grimoire::io::Reader *a2)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  int v5;
  _QWORD *exception;
  char v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  result = marisa::grimoire::io::Reader::read_data((uint64_t)a2, v7, 0x10uLL);
  if (v7[0] != 87)
    goto LABEL_7;
  v3 = 1u;
  do
  {
    if (v3 == 16)
      return result;
    v4 = v7[v3];
    v5 = marisa::grimoire::trie::Header::get_header(void)::buf[v3++];
  }
  while (v4 == v5);
  if ((unint64_t)(v3 - 2) <= 0xE)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h";
    exception[2] = 0xA0000001ALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h:26: MARISA_FORMAT_ERRO"
                   "R: !test_header(buf)";
  }
  return result;
}

double marisa::grimoire::trie::LoudsTrie::read_(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Reader *a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  double result;
  _QWORD *exception;
  int v9;
  uint64_t v10;
  double v11;
  int v12;

  marisa::grimoire::vector::BitVector::read(this, a2);
  marisa::grimoire::vector::BitVector::read((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), a2);
  marisa::grimoire::vector::BitVector::read((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), a2);
  marisa::grimoire::vector::Vector<unsigned char>::read((__int128 *)this + 39, a2);
  marisa::grimoire::vector::FlatVector::read((marisa::grimoire::trie::LoudsTrie *)((char *)this + 672), a2);
  marisa::grimoire::trie::Tail::read((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2);
  if (*((_QWORD *)this + 59) && !*((_QWORD *)this + 96))
  {
    v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
    v5 = v4;
    if (v4)
      marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
    marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset((marisa::grimoire::trie::LoudsTrie **)this + 125, v5);
    v6 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x800000238;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:568: MARISA_MEM"
                     "ORY_ERROR: next_trie_.get() == NULL";
    }
    marisa::grimoire::trie::LoudsTrie::read_(v6, a2);
  }
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::read((__int128 *)this + 63, a2);
  *((_QWORD *)this + 132) = *((_QWORD *)this + 129) - 1;
  LODWORD(v10) = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)a2, (char *)&v10, 4uLL);
  *((_QWORD *)this + 133) = v10;
  v9 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)a2, (char *)&v9, 4uLL);
  v10 = 3;
  *(_QWORD *)&v11 = 0x100000000200;
  v12 = 0x20000;
  marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v10, v9);
  *((_QWORD *)this + 134) = v10;
  result = v11;
  *((double *)this + 135) = v11;
  *((_DWORD *)this + 272) = v12;
  return result;
}

void sub_209CA16AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD185F0](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::LoudsTrie::write(marisa::grimoire::trie::LoudsTrie **this, marisa::grimoire::io::Writer *a2)
{
  marisa::grimoire::io::Writer::write_data((uint64_t)a2, "We love Marisa.", 0x10uLL);
  return marisa::grimoire::trie::LoudsTrie::write_(this, a2);
}

uint64_t marisa::grimoire::trie::LoudsTrie::write_(marisa::grimoire::trie::LoudsTrie **this, marisa::grimoire::io::Writer *a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  int v6;
  unsigned int __buf;

  marisa::grimoire::vector::BitVector::write_((marisa::grimoire::vector::BitVector *)this, a2);
  marisa::grimoire::vector::BitVector::write_((marisa::grimoire::vector::BitVector *)(this + 26), a2);
  marisa::grimoire::vector::BitVector::write_((marisa::grimoire::vector::BitVector *)(this + 52), a2);
  marisa::grimoire::vector::Vector<unsigned char>::write_((uint64_t)(this + 78), a2);
  marisa::grimoire::vector::FlatVector::write_((marisa::grimoire::vector::FlatVector *)(this + 84), a2);
  marisa::grimoire::trie::Tail::write((marisa::grimoire::trie::Tail *)(this + 93), a2);
  v4 = this[125];
  if (v4)
    marisa::grimoire::trie::LoudsTrie::write_(v4, a2);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::write_((uint64_t)(this + 126), a2);
  __buf = this[133];
  marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  v6 = *((_DWORD *)this + 271) | *((_DWORD *)this + 268) | *((_DWORD *)this + 272);
  return marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&v6, 4uLL);
}

uint64_t marisa::grimoire::trie::LoudsTrie::lookup(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *((_QWORD *)a2 + 5);
  *(_QWORD *)(v4 + 96) = 0;
  *(_DWORD *)(v4 + 108) = 0;
  while (1)
  {
    v5 = *((_QWORD *)a2 + 1);
    if (v5 <= *(unsigned int *)(v4 + 100))
      break;
    if ((marisa::grimoire::trie::LoudsTrie::find_child(this, a2) & 1) == 0)
      return 0;
  }
  v6 = *(unsigned int *)(v4 + 96);
  if (((*(_QWORD *)(*((_QWORD *)this + 28) + ((v6 >> 3) & 0x1FFFFFF8)) >> v6) & 1) != 0)
  {
    *((_QWORD *)a2 + 3) = *(_QWORD *)a2;
    *((_DWORD *)a2 + 8) = v5;
    *((_DWORD *)a2 + 9) = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), v6);
    return 1;
  }
  return 0;
}

uint64_t marisa::grimoire::trie::LoudsTrie::find_child(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  marisa::grimoire::trie::LoudsTrie *v25;
  uint64_t v26;
  marisa::grimoire::trie::LoudsTrie *v27;

  v4 = *((_QWORD *)a2 + 5);
  v5 = *(unsigned int *)(v4 + 96);
  v6 = *(unsigned int *)(v4 + 100);
  v7 = (*(unsigned __int8 *)(*(_QWORD *)a2 + v6) ^ (32 * v5) ^ v5) & *((_QWORD *)this + 132);
  v8 = *((_QWORD *)this + 128);
  if ((_DWORD)v5 != *(_DWORD *)(v8 + 12 * v7))
  {
    v10 = marisa::grimoire::vector::BitVector::select0(this, v5);
    v11 = *((_QWORD *)this + 2);
    if (((*(_QWORD *)(v11 + (((v10 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v10 + 1)) & 1) != 0)
    {
      v12 = v10 - *(_DWORD *)(v4 + 96);
      *(_DWORD *)(v4 + 96) = v12;
      v13 = v10 + 2;
      v14 = 0xFFFFFFFFLL;
      while (1)
      {
        v15 = v12;
        if (((*(_QWORD *)(*((_QWORD *)this + 54) + (((unint64_t)v12 >> 3) & 0x1FFFFFF8)) >> v12) & 1) != 0)
        {
          if (v14 == 0xFFFFFFFFLL)
          {
            v14 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), v12);
            v15 = *(unsigned int *)(v4 + 96);
          }
          else
          {
            ++v14;
          }
          v17 = *(_DWORD *)(v4 + 100);
          v18 = *((_QWORD *)this + 90);
          v19 = (unint64_t)(v18 * v14) >> 6;
          v20 = (v18 * v14) & 0x3F;
          v21 = v20 + v18;
          v22 = *((_QWORD *)this + 86);
          v23 = *(_QWORD *)(v22 + 8 * v19) >> v20;
          if (v21 > 0x40)
            v23 |= (2 * *(_QWORD *)(v22 + 8 * v19 + 8)) << (v20 ^ 0x3Fu);
          v24 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + v15) | ((*((_DWORD *)this + 182) & v23) << 8);
          v25 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
          if (v25)
          {
            if ((marisa::grimoire::trie::LoudsTrie::match_(v25, a2, v24) & 1) != 0)
              return 1;
          }
          else if ((marisa::grimoire::trie::Tail::match((_QWORD *)this + 93, (uint64_t *)a2, v24) & 1) != 0)
          {
            return 1;
          }
          if (*(_DWORD *)(v4 + 100) != v17)
            return 0;
          v12 = *(_DWORD *)(v4 + 96);
          v11 = *((_QWORD *)this + 2);
        }
        else
        {
          v16 = *(unsigned int *)(v4 + 100);
          if (*(unsigned __int8 *)(*((_QWORD *)this + 80) + v12) == *(unsigned __int8 *)(*(_QWORD *)a2 + v16))
          {
            *(_DWORD *)(v4 + 100) = v16 + 1;
            return 1;
          }
        }
        *(_DWORD *)(v4 + 96) = ++v12;
        v26 = *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v13;
        ++v13;
        if ((v26 & 1) == 0)
          return 0;
      }
    }
    return 0;
  }
  v9 = *(unsigned int *)(v8 + 12 * v7 + 8);
  if (v9 > 0xFFFFFEFF)
  {
    *(_DWORD *)(v4 + 100) = v6 + 1;
    goto LABEL_24;
  }
  v27 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
  if (v27)
  {
    if ((marisa::grimoire::trie::LoudsTrie::match_(v27, a2, v9) & 1) != 0)
      goto LABEL_24;
    return 0;
  }
  if ((marisa::grimoire::trie::Tail::match((_QWORD *)this + 93, (uint64_t *)a2, v9) & 1) == 0)
    return 0;
LABEL_24:
  *(_DWORD *)(v4 + 96) = *(_DWORD *)(*((_QWORD *)this + 128) + 12 * v7 + 4);
  return 1;
}

unint64_t marisa::grimoire::trie::LoudsTrie::reverse_lookup(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  size_t v7;
  unint64_t result;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  marisa::grimoire::trie::LoudsTrie *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  BOOL v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD *exception;
  char v35;

  v3 = *((_QWORD *)a2 + 2);
  if (v3 >= *((_QWORD *)this + 33))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
    exception[2] = 0x300000049;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:73: MARISA_BOUND_"
                   "ERROR: agent.query().id() >= size()";
  }
  v5 = *((_QWORD *)a2 + 5);
  *(_QWORD *)(v5 + 24) = 0;
  v6 = *(_QWORD *)(v5 + 32);
  if (v6 <= 0x1F)
  {
    if (v6 <= 0x10)
      v7 = 32;
    else
      v7 = 2 * v6;
    marisa::grimoire::vector::Vector<char>::realloc((uint64_t *)v5, v7);
    v3 = *((_QWORD *)a2 + 2);
  }
  *(_DWORD *)(v5 + 108) = 0;
  result = marisa::grimoire::vector::BitVector::select1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), v3);
  *(_DWORD *)(v5 + 96) = result;
  if (!(_DWORD)result)
    goto LABEL_30;
  while (1)
  {
    if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((result >> 3) & 0x1FFFFFF8)) >> result) & 1) != 0)
    {
      v9 = *(_QWORD *)(v5 + 24);
      v10 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + result);
      v11 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), result);
      v12 = *((_QWORD *)this + 90);
      v13 = (unint64_t)(v12 * v11) >> 6;
      v14 = (v12 * v11) & 0x3F;
      v15 = v14 + v12;
      v16 = *((_QWORD *)this + 86);
      v17 = *(_QWORD *)(v16 + 8 * v13) >> v14;
      if (v15 > 0x40)
        v17 |= (2 * *(_QWORD *)(v16 + 8 * v13 + 8)) << (v14 ^ 0x3Fu);
      v18 = v10 | ((*((_DWORD *)this + 182) & v17) << 8);
      v19 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
      if (v19)
        result = (unint64_t)marisa::grimoire::trie::LoudsTrie::restore_(v19, a2, v18);
      else
        result = (unint64_t)marisa::grimoire::trie::Tail::restore((uint64_t *)this + 93, a2, v18);
      v20 = *(_QWORD *)(v5 + 24);
      if (v9 != v20)
      {
        v21 = *(_QWORD *)(v5 + 8);
        v22 = (_BYTE *)(v21 + v20 - 1);
        if ((unint64_t)v22 > v21 + v9)
        {
          v23 = v21 + v9 + 1;
          do
          {
            v24 = *(_BYTE *)(v23 - 1);
            *(_BYTE *)(v23 - 1) = *v22;
            *v22-- = v24;
            v25 = v23++ >= (unint64_t)v22;
          }
          while (!v25);
        }
      }
    }
    else
    {
      v35 = *(_BYTE *)(*((_QWORD *)this + 80) + result);
      result = (unint64_t)marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v5, &v35);
    }
    v26 = *(unsigned int *)(v5 + 96);
    if (*((_QWORD *)this + 133) >= v26)
      break;
    result = marisa::grimoire::vector::BitVector::select1(this, v26) + ~(unint64_t)*(unsigned int *)(v5 + 96);
    *(_DWORD *)(v5 + 96) = result;
  }
  v27 = *(_QWORD *)(v5 + 8);
  v28 = *(_QWORD *)(v5 + 24);
  v29 = (_BYTE *)(v27 + v28 - 1);
  if (v28)
    v30 = (unint64_t)v29 > v27;
  else
    v30 = 0;
  if (v30)
  {
    v31 = v27 + 1;
    do
    {
      v32 = *(_BYTE *)(v31 - 1);
      *(_BYTE *)(v31 - 1) = *v29;
      *v29-- = v32;
      v25 = v31++ >= (unint64_t)v29;
    }
    while (!v25);
LABEL_30:
    v27 = *(_QWORD *)(v5 + 8);
    v28 = *(_QWORD *)(v5 + 24);
  }
  *((_QWORD *)a2 + 3) = v27;
  v33 = *((_QWORD *)a2 + 2);
  *((_DWORD *)a2 + 8) = v28;
  *((_DWORD *)a2 + 9) = v33;
  return result;
}

uint64_t *marisa::grimoire::vector::Vector<char>::push_back(uint64_t *result, _BYTE *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  size_t v8;

  v3 = result;
  v4 = result[3];
  v5 = result[4];
  v6 = v4 + 1;
  if (v5 < (unint64_t)(v4 + 1))
  {
    v7 = 2 * v5;
    if (v5 < 0)
      v7 = -1;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    result = (uint64_t *)marisa::grimoire::vector::Vector<char>::realloc(result, v8);
    v4 = v3[3];
  }
  *(_BYTE *)(v3[1] + v4) = *a2;
  ++v3[3];
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::common_prefix_search(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  unsigned int *v4;
  unsigned int v5;
  uint64_t result;
  unint64_t v7;
  marisa::grimoire::vector::BitVector *v8;
  unsigned int v9;

  v4 = (unsigned int *)*((_QWORD *)a2 + 5);
  v5 = v4[27];
  if (v5 == 1)
  {
LABEL_5:
    while (*((_QWORD *)a2 + 1) > (unint64_t)v4[25]
         && (marisa::grimoire::trie::LoudsTrie::find_child(this, a2) & 1) != 0)
    {
      v7 = v4[24];
      if (((*(_QWORD *)(*((_QWORD *)this + 28) + ((v7 >> 3) & 0x1FFFFFF8)) >> v7) & 1) != 0)
      {
        v8 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 208);
        v9 = v4[25];
        *((_QWORD *)a2 + 3) = *(_QWORD *)a2;
        *((_DWORD *)a2 + 8) = v9;
        goto LABEL_11;
      }
    }
    result = 0;
    v4[27] = 3;
  }
  else if (v5 == 3)
  {
    return 0;
  }
  else
  {
    *((_QWORD *)v4 + 12) = 0;
    v4[27] = 1;
    if ((**((_BYTE **)this + 28) & 1) == 0)
      goto LABEL_5;
    v8 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 208);
    *((_QWORD *)a2 + 3) = *(_QWORD *)a2;
    *((_DWORD *)a2 + 8) = 0;
    v7 = 0;
LABEL_11:
    *((_DWORD *)a2 + 9) = marisa::grimoire::vector::BitVector::rank1(v8, v7);
    return 1;
  }
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::predictive_search(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int *v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  marisa::grimoire::trie::LoudsTrie *v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  int v39;
  _BYTE v40[20];

  v4 = *((_QWORD *)a2 + 5);
  v5 = *(_DWORD *)(v4 + 108);
  if (v5 == 2)
  {
    do
    {
      while (1)
      {
LABEL_10:
        v10 = *(unsigned int *)(v4 + 104);
        if (*(_QWORD *)(v4 + 72) == v10)
        {
          v11 = *(_QWORD *)(v4 + 56) + 20 * v10;
          *(_OWORD *)v40 = xmmword_209CB0570;
          *(_DWORD *)&v40[16] = -1;
          v12 = marisa::grimoire::vector::BitVector::select0(this, *(unsigned int *)(v11 - 20));
          *(_DWORD *)&v40[4] = v12 + 1;
          *(_DWORD *)v40 = v12 - *(_DWORD *)(v11 - 20);
          marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::push_back((uint64_t *)(v4 + 48), (__n128 *)v40);
          LODWORD(v10) = *(_DWORD *)(v4 + 104);
        }
        v13 = *(_QWORD *)(v4 + 56);
        v14 = (unsigned int *)(v13 + 20 * v10);
        v15 = v14[1];
        v16 = *(_QWORD *)(*((_QWORD *)this + 2) + ((v15 >> 3) & 0x1FFFFFF8));
        v14[1] = v15 + 1;
        if (((v16 >> v15) & 1) != 0)
          break;
        if ((_DWORD)v10 == 1)
        {
LABEL_7:
          result = 0;
          *(_DWORD *)(v4 + 108) = 4;
          return result;
        }
        v23 = v13 + 20 * v10;
        ++*(_DWORD *)(v23 - 20);
        marisa::grimoire::vector::Vector<char>::resize((uint64_t *)v4, *(unsigned int *)(v23 - 32));
        --*(_DWORD *)(v4 + 104);
      }
      *(_DWORD *)(v4 + 104) = v10 + 1;
      v17 = *v14;
      if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((v17 >> 3) & 0x1FFFFFF8)) >> v17) & 1) != 0)
      {
        v18 = v13 + 20 * v10;
        v21 = *(_DWORD *)(v18 + 12);
        v20 = (unsigned int *)(v18 + 12);
        v19 = v21;
        if (v21 == -1)
        {
          v22 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), v17);
          v17 = *v14;
        }
        else
        {
          v22 = v19 + 1;
        }
        *v20 = v22;
        v24 = *((_QWORD *)this + 90);
        v25 = v24 * v22;
        v26 = v25 >> 6;
        v27 = v25 & 0x3F;
        v28 = v27 + v24;
        v29 = *((_QWORD *)this + 86);
        v30 = *(_QWORD *)(v29 + 8 * v26);
        if (v28 > 0x40)
          v31 = ((2 * *(_QWORD *)(v29 + 8 * v26 + 8)) << (v27 ^ 0x3Fu)) | (v30 >> v27);
        else
          v31 = v30 >> v27;
        v32 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + v17) | ((*((_DWORD *)this + 182) & v31) << 8);
        v33 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
        if (v33)
          marisa::grimoire::trie::LoudsTrie::restore_(v33, a2, v32);
        else
          marisa::grimoire::trie::Tail::restore((uint64_t *)this + 93, a2, v32);
      }
      else
      {
        v40[0] = *(_BYTE *)(*((_QWORD *)this + 80) + v17);
        marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v4, v40);
      }
      v34 = *(_DWORD *)(v4 + 24);
      *(_DWORD *)(v13 + 20 * v10 + 8) = v34;
      v35 = *v14;
    }
    while (((*(_QWORD *)(*((_QWORD *)this + 28) + ((v35 >> 3) & 0x1FFFFFF8)) >> v35) & 1) == 0);
    v36 = v13 + 20 * v10;
    v39 = *(_DWORD *)(v36 + 16);
    v38 = (_DWORD *)(v36 + 16);
    v37 = v39;
    if (v39 == -1)
    {
      v9 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), v35);
      v34 = *(_DWORD *)(v4 + 24);
    }
    else
    {
      v9 = v37 + 1;
    }
    *v38 = v9;
    *((_QWORD *)a2 + 3) = *(_QWORD *)(v4 + 8);
    *((_DWORD *)a2 + 8) = v34;
  }
  else
  {
    if (v5 == 4)
      return 0;
    marisa::grimoire::trie::State::predictive_search_init(*((marisa::grimoire::trie::State **)a2 + 5));
    while (*((_QWORD *)a2 + 1) > (unint64_t)*(unsigned int *)(v4 + 100))
    {
      if ((marisa::grimoire::trie::LoudsTrie::predictive_find_child(this, a2) & 1) == 0)
        goto LABEL_7;
    }
    *(_QWORD *)&v40[12] = -1;
    *(_QWORD *)v40 = *(unsigned int *)(v4 + 96);
    *(_DWORD *)&v40[8] = *(_QWORD *)(v4 + 24);
    marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::push_back((uint64_t *)(v4 + 48), (__n128 *)v40);
    *(_DWORD *)(v4 + 104) = 1;
    v7 = *(unsigned int *)(v4 + 96);
    if (((*(_QWORD *)(*((_QWORD *)this + 28) + ((v7 >> 3) & 0x1FFFFFF8)) >> v7) & 1) == 0)
      goto LABEL_10;
    v8 = *(_QWORD *)(v4 + 24);
    *((_QWORD *)a2 + 3) = *(_QWORD *)(v4 + 8);
    *((_DWORD *)a2 + 8) = v8;
    v9 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), v7);
  }
  *((_DWORD *)a2 + 9) = v9;
  return 1;
}

double marisa::grimoire::trie::State::predictive_search_init(marisa::grimoire::trie::State *this)
{
  unint64_t v2;
  size_t v3;
  unint64_t v4;
  uint64_t v5;
  double result;

  *((_QWORD *)this + 3) = 0;
  v2 = *((_QWORD *)this + 4);
  if (v2 <= 0x3F)
  {
    if (v2 <= 0x20)
      v3 = 64;
    else
      v3 = 2 * v2;
    marisa::grimoire::vector::Vector<char>::realloc((uint64_t *)this, v3);
  }
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::resize((uint64_t *)this + 6, 0);
  v4 = *((_QWORD *)this + 10);
  if (v4 <= 3)
  {
    if (v4 == 3)
      v5 = 6;
    else
      v5 = 4;
    marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::realloc((uint64_t *)this + 6, v5);
  }
  result = 0.0;
  *((_OWORD *)this + 6) = xmmword_209CB0580;
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::predictive_find_child(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  marisa::grimoire::trie::LoudsTrie *v24;
  uint64_t v25;
  marisa::grimoire::trie::LoudsTrie *v26;
  char v28;
  char v29;

  v4 = *((_QWORD *)a2 + 5);
  v5 = *(unsigned int *)(v4 + 96);
  v6 = (*(unsigned __int8 *)(*(_QWORD *)a2 + *(unsigned int *)(v4 + 100)) ^ (32 * v5) ^ v5) & *((_QWORD *)this + 132);
  v7 = *((_QWORD *)this + 128);
  if ((_DWORD)v5 != *(_DWORD *)(v7 + 12 * v6))
  {
    v10 = marisa::grimoire::vector::BitVector::select0(this, v5);
    v11 = *((_QWORD *)this + 2);
    if (((*(_QWORD *)(v11 + (((v10 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v10 + 1)) & 1) != 0)
    {
      v12 = v10 - *(_DWORD *)(v4 + 96);
      *(_DWORD *)(v4 + 96) = v12;
      v13 = v10 + 2;
      v14 = 0xFFFFFFFFLL;
      while (1)
      {
        v15 = v12;
        if (((*(_QWORD *)(*((_QWORD *)this + 54) + (((unint64_t)v12 >> 3) & 0x1FFFFFF8)) >> v12) & 1) != 0)
        {
          if (v14 == 0xFFFFFFFFLL)
          {
            v14 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), v12);
            v15 = *(unsigned int *)(v4 + 96);
          }
          else
          {
            ++v14;
          }
          v16 = *(_DWORD *)(v4 + 100);
          v17 = *((_QWORD *)this + 90);
          v18 = (unint64_t)(v17 * v14) >> 6;
          v19 = (v17 * v14) & 0x3F;
          v20 = v19 + v17;
          v21 = *((_QWORD *)this + 86);
          v22 = *(_QWORD *)(v21 + 8 * v18) >> v19;
          if (v20 > 0x40)
            v22 |= (2 * *(_QWORD *)(v21 + 8 * v18 + 8)) << (v19 ^ 0x3Fu);
          v23 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + v15) | ((*((_DWORD *)this + 182) & v22) << 8);
          v24 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
          if (v24)
          {
            if ((marisa::grimoire::trie::LoudsTrie::prefix_match_(v24, a2, v23) & 1) != 0)
              return 1;
          }
          else if (marisa::grimoire::trie::Tail::prefix_match((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2, v23))
          {
            return 1;
          }
          if (*(_DWORD *)(v4 + 100) != v16)
            return 0;
          v12 = *(_DWORD *)(v4 + 96);
          v11 = *((_QWORD *)this + 2);
        }
        else if (*(unsigned __int8 *)(*((_QWORD *)this + 80) + v12) == *(unsigned __int8 *)(*(_QWORD *)a2
                                                                                           + *(unsigned int *)(v4 + 100)))
        {
          v28 = *(_BYTE *)(*((_QWORD *)this + 80) + v12);
          marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v4, &v28);
          ++*(_DWORD *)(v4 + 100);
          return 1;
        }
        *(_DWORD *)(v4 + 96) = ++v12;
        v25 = *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v13;
        ++v13;
        if ((v25 & 1) == 0)
          return 0;
      }
    }
    return 0;
  }
  v8 = v7 + 12 * v6;
  v9 = *(unsigned int *)(v8 + 8);
  if (v9 > 0xFFFFFEFF)
  {
    v29 = *(_DWORD *)(v8 + 8);
    marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v4, &v29);
    ++*(_DWORD *)(v4 + 100);
    goto LABEL_24;
  }
  v26 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
  if (v26)
  {
    if ((marisa::grimoire::trie::LoudsTrie::prefix_match_(v26, a2, v9) & 1) != 0)
      goto LABEL_24;
    return 0;
  }
  if (!marisa::grimoire::trie::Tail::prefix_match((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2, v9))
    return 0;
LABEL_24:
  *(_DWORD *)(v4 + 96) = *(_DWORD *)(*((_QWORD *)this + 128) + 12 * v6 + 4);
  return 1;
}

__n128 marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::push_back(uint64_t *a1, __n128 *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 *v9;
  __n128 result;

  v4 = a1[3];
  v5 = a1[4];
  v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    v7 = 2 * v5;
    if (v5 > 0x666666666666666)
      v7 = 0xCCCCCCCCCCCCCCCLL;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::realloc(a1, v8);
    v4 = a1[3];
  }
  v9 = (__n128 *)(a1[1] + 20 * v4);
  result = *a2;
  v9[1].n128_u32[0] = a2[1].n128_u32[0];
  *v9 = result;
  ++a1[3];
  return result;
}

uint64_t *marisa::grimoire::vector::Vector<char>::resize(uint64_t *result, size_t a2)
{
  size_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 < 0)
      v5 = -1;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)marisa::grimoire::vector::Vector<char>::realloc(result, a2);
  }
  v3[3] = v2;
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::total_size(marisa::grimoire::trie::LoudsTrie *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  marisa::grimoire::trie::LoudsTrie *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = *((_QWORD *)this + 3);
  v3 = *((_QWORD *)this + 11);
  v4 = *((_QWORD *)this + 17);
  v5 = *((_QWORD *)this + 23);
  v6 = *((_QWORD *)this + 29);
  v7 = *((_QWORD *)this + 37);
  v8 = *((_QWORD *)this + 43);
  v9 = *((_QWORD *)this + 49);
  v10 = *((_QWORD *)this + 55);
  v11 = *((_QWORD *)this + 63);
  v12 = *((_QWORD *)this + 69);
  v13 = *((_QWORD *)this + 75);
  v14 = *((_QWORD *)this + 81);
  v15 = *((_QWORD *)this + 87);
  v16 = *((_QWORD *)this + 96);
  v17 = *((_QWORD *)this + 102);
  v18 = *((_QWORD *)this + 110);
  v19 = *((_QWORD *)this + 116);
  v20 = *((_QWORD *)this + 122);
  v21 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
  if (v21)
  {
    v34 = v3;
    v35 = v4;
    v26 = v18;
    v27 = v11;
    v22 = v5;
    v32 = v20;
    v33 = v2;
    v30 = v7;
    v31 = v14;
    v28 = v17;
    v29 = v12;
    v23 = v16;
    v24 = v13;
    v21 = (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::total_size(v21);
    v12 = v29;
    v7 = v30;
    v14 = v31;
    v20 = v32;
    v2 = v33;
    v3 = v34;
    v13 = v24;
    v16 = v23;
    v11 = v27;
    v17 = v28;
    v5 = v22;
    v18 = v26;
    v4 = v35;
  }
  return (uint64_t)v21
       + 12 * *((_QWORD *)this + 129)
       + 12 * v18
       + 12 * v11
       + 12 * v3
       + 12 * v7
       + 8 * v2
       + 8 * v17
       + 8 * v15
       + 8 * v10
       + 8 * v6
       + 4 * v4
       + 4 * v8
       + 4 * v9
       + 4 * v12
       + 4 * v13
       + 4 * v19
       + 4 * v20
       + 4 * v5
       + v16
       + v14;
}

unint64_t marisa::grimoire::trie::LoudsTrie::io_size(marisa::grimoire::trie::LoudsTrie *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  marisa::grimoire::trie::LoudsTrie *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v2 = *((_QWORD *)this + 11);
  v3 = *((_QWORD *)this + 17);
  v4 = *((_QWORD *)this + 23);
  v28 = *((_QWORD *)this + 29);
  v29 = *((_QWORD *)this + 3);
  v5 = *((_QWORD *)this + 37);
  v6 = *((_QWORD *)this + 43);
  v7 = *((_QWORD *)this + 49);
  v25 = *((_QWORD *)this + 63);
  v26 = *((_QWORD *)this + 69);
  v27 = *((_QWORD *)this + 55);
  v8 = *((_QWORD *)this + 75);
  v9 = *((_QWORD *)this + 81);
  v10 = *((_QWORD *)this + 87);
  v11 = marisa::grimoire::trie::Tail::io_size((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744));
  v12 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
  if (v12)
  {
    v24 = v8;
    v13 = v5;
    v14 = v6;
    v15 = v7;
    v16 = v10;
    v17 = v2;
    v18 = v3;
    v19 = v4;
    v20 = v11;
    v21 = marisa::grimoire::trie::LoudsTrie::io_size(v12);
    v11 = v20;
    v4 = v19;
    v3 = v18;
    v2 = v17;
    v10 = v16;
    v7 = v15;
    v6 = v14;
    v5 = v13;
    v8 = v24;
    v22 = v21 - 16;
  }
  else
  {
    v22 = 0;
  }
  return ((12 * v2 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((4 * v3 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((4 * v4 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((12 * v5 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((4 * v6 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((4 * v7 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((12 * v25 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((4 * v26 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((v9 + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((4 * v8 + 7) & 0xFFFFFFFFFFFFFFF8)
       + v11
       + 8 * (v28 + v29 + v27 + v10)
       + v22
       + ((12 * *((_QWORD *)this + 129) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 184;
}

unint64_t marisa::grimoire::trie::Tail::io_size(marisa::grimoire::trie::Tail *this)
{
  return ((*((_QWORD *)this + 3) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8 * *((_QWORD *)this + 9)
       + ((4 * *((_QWORD *)this + 23) + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((4 * *((_QWORD *)this + 29) + 7) & 0xFFFFFFFFFFFFFFF8)
       + ((12 * *((_QWORD *)this + 17) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 48;
}

void marisa::grimoire::trie::LoudsTrie::clear(marisa::grimoire::trie::LoudsTrie *this)
{
  _BYTE v2[1136];

  marisa::grimoire::trie::LoudsTrie::LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v2);
  marisa::grimoire::trie::LoudsTrie::swap((marisa::grimoire::trie::LoudsTrie *)v2, this);
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v2);
}

void sub_209CA28DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)&a9);
  _Unwind_Resume(a1);
}

uint64_t *marisa::grimoire::vector::BitVector::swap(marisa::grimoire::vector::BitVector *this, marisa::grimoire::vector::BitVector *a2)
{
  uint64_t v4;
  uint64_t v5;

  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  v4 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v4;
  v5 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v5;
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 8, (uint64_t *)a2 + 8);
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 14, (uint64_t *)a2 + 14);
  return marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 20, (uint64_t *)a2 + 20);
}

uint64_t *marisa::grimoire::vector::Vector<unsigned char>::swap(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *result;
  *result = *a2;
  *a2 = v2;
  v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  v4 = result[2];
  v5 = result[3];
  v6 = a2[3];
  result[2] = a2[2];
  result[3] = v6;
  a2[2] = v4;
  a2[3] = v5;
  v7 = result[4];
  result[4] = a2[4];
  a2[4] = v7;
  LOBYTE(v7) = *((_BYTE *)result + 40);
  *((_BYTE *)result + 40) = *((_BYTE *)a2 + 40);
  *((_BYTE *)a2 + 40) = v7;
  return result;
}

uint64_t *marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 > 0x555555555555555)
      v5 = 0xAAAAAAAAAAAAAAALL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::realloc(result, a2);
  }
  v6 = v3[3];
  v7 = v2 - v6;
  if (v2 > v6)
  {
    v8 = 24 * v6;
    do
    {
      v9 = v3[1] + v8;
      *(_QWORD *)v9 = 0;
      *(_QWORD *)(v9 + 8) = 0;
      *(_DWORD *)(v9 + 16) = 0;
      v8 += 24;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_trie<marisa::grimoire::trie::Key>(uint64_t a1, uint64_t *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  _DWORD *v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  __int128 v17[3];
  uint64_t v18;
  uint64_t v19;
  int v20;

  marisa::grimoire::trie::LoudsTrie::build_current_trie<marisa::grimoire::trie::Key>((uint64_t *)a1, (uint64_t)a2, a3, a4, a5);
  memset(v17, 0, 41);
  if (a2[3])
    marisa::grimoire::trie::LoudsTrie::build_next_trie<marisa::grimoire::trie::Key>(a1, a2, v17, a4, a5);
  v9 = *(_DWORD **)(a1 + 1000);
  if (v9)
  {
    v10 = (v9[268] + 1) | v9[271] | v9[272];
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v18, v10);
  }
  else
  {
    if (*(_QWORD *)(a1 + 840))
      v11 = 0x2000;
    else
      v11 = 4096;
    v12 = *(_DWORD *)(a4 + 16) | *(_DWORD *)(a4 + 8) | v11 | 1;
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v18, v12);
  }
  *(_QWORD *)(a1 + 1072) = v18;
  *(_QWORD *)(a1 + 1080) = v19;
  *(_DWORD *)(a1 + 1088) = v20;
  marisa::grimoire::vector::BitVector::build((marisa::grimoire::vector::BitVector *)(a1 + 416), 0, 0);
  if (*((_QWORD *)&v17[1] + 1))
  {
    v13 = 0;
    v14 = 0;
    do
    {
      do
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 432) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14;
        ++v14;
      }
      while ((v15 & 1) == 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 632) + v14 - 1) = *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13);
      *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13++) >>= 8;
    }
    while (v13 < *((_QWORD *)&v17[1] + 1));
  }
  marisa::grimoire::vector::FlatVector::build((__int128 *)(a1 + 672), (uint64_t)v17);
  marisa::grimoire::trie::LoudsTrie::fill_cache(a1);
  result = *(_QWORD *)&v17[0];
  if (*(_QWORD *)&v17[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v17[0], 0x1000C8077774924);
  return result;
}

void sub_209CA2BE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

void marisa::grimoire::vector::Vector<std::pair<unsigned int,unsigned int>>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = a2;
  v4 = a1[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 60)
      v5 = 0x1FFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    marisa::grimoire::vector::Vector<unsigned long long>::realloc(a1, a2);
  }
  v6 = a1[3];
  if (v2 > v6)
    bzero((void *)(a1[1] + 8 * v6), 8 * (v2 - v6));
  a1[3] = v2;
}

uint64_t *marisa::grimoire::vector::BitVector::push_back(uint64_t *this, int a2)
{
  unint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *exception;
  uint64_t v7;

  v2 = this[6];
  if (v2 == 0xFFFFFFFF)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h";
    exception[2] = 0x700000034;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h:52: MARI"
                   "SA_SIZE_ERROR: size_ == MARISA_UINT32_MAX";
  }
  v4 = this;
  v5 = this[3];
  if (v2 == v5 << 6)
  {
    v7 = 0;
    this = marisa::grimoire::vector::Vector<unsigned long long>::resize(this, v5 + 1, &v7);
    v2 = v4[6];
  }
  if (a2)
  {
    *(_QWORD *)(v4[1] + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v2;
    ++v4[7];
  }
  v4[6] = v2 + 1;
  return this;
}

uint64_t marisa::grimoire::vector::BitVector::build(marisa::grimoire::vector::BitVector *this, int a2, int a3)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[4];
  __int128 v9;
  _BYTE v10[25];
  __int128 v11;
  _BYTE v12[25];
  __int128 v13;
  _BYTE v14[25];

  memset(v8, 0, 41);
  v11 = 0u;
  memset(v12, 0, sizeof(v12));
  v13 = 0u;
  memset(v14, 0, sizeof(v14));
  v8[3] = 0u;
  v9 = 0u;
  memset(v10, 0, sizeof(v10));
  marisa::grimoire::vector::BitVector::build_index((marisa::grimoire::vector::BitVector *)v8, this, a2, a3);
  marisa::grimoire::vector::Vector<unsigned long long>::shrink(this);
  v4 = v8[0];
  v8[0] = *(_OWORD *)this;
  *(_OWORD *)this = v4;
  v5 = *(_QWORD *)&v8[1];
  *(_QWORD *)&v8[1] = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = v5;
  v6 = *(_OWORD *)((char *)&v8[1] + 8);
  *(_OWORD *)((char *)&v8[1] + 8) = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = v6;
  LOBYTE(v5) = BYTE8(v8[2]);
  BYTE8(v8[2]) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = v5;
  marisa::grimoire::vector::BitVector::swap(this, (marisa::grimoire::vector::BitVector *)v8);
  if ((_QWORD)v13)
    MEMORY[0x20BD185D8](v13, 0x1000C8077774924);
  if ((_QWORD)v11)
    MEMORY[0x20BD185D8](v11, 0x1000C8077774924);
  if ((_QWORD)v9)
    MEMORY[0x20BD185D8](v9, 0x1000C8077774924);
  result = *(_QWORD *)&v8[0];
  if (*(_QWORD *)&v8[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v8[0], 0x1000C8077774924);
  return result;
}

void sub_209CA2E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::vector::BitVector::~BitVector((marisa::grimoire::vector::BitVector *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_next_trie<marisa::grimoire::trie::Key>(uint64_t a1, uint64_t *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unsigned int *v10;
  _DWORD *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  marisa::grimoire::trie::LoudsTrie *v21;
  marisa::grimoire::trie::LoudsTrie *v22;
  marisa::grimoire::trie::LoudsTrie **v23;
  uint64_t result;
  _QWORD *exception;
  __int128 v26;
  _BYTE v27[25];

  if (*(_QWORD *)a4 == a5)
  {
    v26 = 0u;
    memset(v27, 0, sizeof(v27));
    marisa::grimoire::vector::Vector<marisa::grimoire::trie::Entry>::resize((uint64_t *)&v26, a2[3]);
    v9 = a2[3];
    if (v9)
    {
      v10 = (unsigned int *)(*((_QWORD *)&v26 + 1) + 8);
      v11 = (_DWORD *)(a2[1] + 8);
      do
      {
        v12 = *((_QWORD *)v11 - 1);
        v13 = *v11;
        v11 += 6;
        *((_QWORD *)v10 - 1) = v12 + v13 - 1;
        *v10 = v13;
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    marisa::grimoire::trie::Tail::build((__int128 *)(a1 + 744), (uint64_t)&v26, a3, *(_DWORD *)(a4 + 12));
  }
  else
  {
    v26 = 0u;
    memset(v27, 0, sizeof(v27));
    marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::resize((uint64_t *)&v26, a2[3]);
    if (a2[3])
    {
      v15 = 0;
      v16 = 0;
      do
      {
        v17 = *((_QWORD *)&v26 + 1) + v15;
        v18 = a2[1] + v15;
        v19 = *(unsigned int *)(v18 + 8);
        *(_QWORD *)v17 = *(_QWORD *)v18 + v19;
        *(_DWORD *)(v17 + 8) = v19;
        *(_DWORD *)(v17 + 12) = *(_DWORD *)(v18 + 12);
        ++v16;
        v15 += 24;
      }
      while (v16 < a2[3]);
    }
    v20 = *a2;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_OWORD *)((char *)a2 + 25) = 0u;
    if (v20)
      MEMORY[0x20BD185D8](v20, 0x1000C8077774924);
    v21 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
    v22 = v21;
    if (v21)
      marisa::grimoire::trie::LoudsTrie::LoudsTrie(v21);
    v23 = (marisa::grimoire::trie::LoudsTrie **)(a1 + 1000);
    marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset(v23, v22);
    if (!*v23)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x8000001C3;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:451: MARISA_MEM"
                     "ORY_ERROR: next_trie_.get() == NULL";
    }
    marisa::grimoire::trie::LoudsTrie::build_trie<marisa::grimoire::trie::ReverseKey>((uint64_t)*v23, (uint64_t)&v26, a3, a4, a5 + 1);
  }
  result = v26;
  if ((_QWORD)v26)
    return MEMORY[0x20BD185D8](v26, 0x1000C8077774924);
  return result;
}

void sub_209CA30A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  MEMORY[0x20BD185F0](v9, MEMORY[0x24BEDB6B8]);
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t *marisa::grimoire::vector::Vector<marisa::grimoire::trie::Entry>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 59)
      v5 = 0xFFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)marisa::grimoire::vector::Vector<marisa::grimoire::trie::Entry>::realloc(result, a2);
  }
  v6 = v3[3];
  v7 = v2 - v6;
  if (v2 > v6)
  {
    v8 = 16 * v6;
    do
    {
      v9 = (_QWORD *)(v3[1] + v8);
      *v9 = 0;
      v9[1] = 0;
      v8 += 16;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

marisa::grimoire::trie::LoudsTrie **marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset(marisa::grimoire::trie::LoudsTrie **a1, marisa::grimoire::trie::LoudsTrie *a2)
{
  _QWORD *exception;
  marisa::grimoire::trie::LoudsTrie *v4;

  if (a2 && *a1 == a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h";
    exception[2] = 0x600000013;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h:19: MARISA_RESET_ERROR: (ptr"
                   " != NULL) && (ptr == ptr_)";
  }
  v4 = *a1;
  *a1 = a2;
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v4);
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_trie<marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  _DWORD *v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  __int128 v17[3];
  uint64_t v18;
  uint64_t v19;
  int v20;

  marisa::grimoire::trie::LoudsTrie::build_current_trie<marisa::grimoire::trie::ReverseKey>((uint64_t *)a1, a2, a3, a4, a5);
  memset(v17, 0, 41);
  if (*(_QWORD *)(a2 + 24))
    marisa::grimoire::trie::LoudsTrie::build_next_trie<marisa::grimoire::trie::ReverseKey>(a1, a2, v17, a4, a5);
  v9 = *(_DWORD **)(a1 + 1000);
  if (v9)
  {
    v10 = (v9[268] + 1) | v9[271] | v9[272];
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v18, v10);
  }
  else
  {
    if (*(_QWORD *)(a1 + 840))
      v11 = 0x2000;
    else
      v11 = 4096;
    v12 = *(_DWORD *)(a4 + 16) | *(_DWORD *)(a4 + 8) | v11 | 1;
    v18 = 3;
    v19 = 0x100000000200;
    v20 = 0x20000;
    marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v18, v12);
  }
  *(_QWORD *)(a1 + 1072) = v18;
  *(_QWORD *)(a1 + 1080) = v19;
  *(_DWORD *)(a1 + 1088) = v20;
  marisa::grimoire::vector::BitVector::build((marisa::grimoire::vector::BitVector *)(a1 + 416), 0, 0);
  if (*((_QWORD *)&v17[1] + 1))
  {
    v13 = 0;
    v14 = 0;
    do
    {
      do
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 432) + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14;
        ++v14;
      }
      while ((v15 & 1) == 0);
      *(_BYTE *)(*(_QWORD *)(a1 + 632) + v14 - 1) = *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13);
      *(_DWORD *)(*((_QWORD *)&v17[0] + 1) + 4 * v13++) >>= 8;
    }
    while (v13 < *((_QWORD *)&v17[1] + 1));
  }
  marisa::grimoire::vector::FlatVector::build((__int128 *)(a1 + 672), (uint64_t)v17);
  marisa::grimoire::trie::LoudsTrie::fill_cache(a1);
  result = *(_QWORD *)&v17[0];
  if (*(_QWORD *)&v17[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v17[0], 0x1000C8077774924);
  return result;
}

void sub_209CA3398(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_next_trie<marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t result;
  marisa::grimoire::trie::LoudsTrie *v16;
  marisa::grimoire::trie::LoudsTrie *v17;
  marisa::grimoire::trie::LoudsTrie **v18;
  _QWORD *exception;
  _OWORD v20[3];

  if (*(_QWORD *)a4 == a5)
  {
    memset(v20, 0, 41);
    marisa::grimoire::vector::Vector<marisa::grimoire::trie::Entry>::resize((uint64_t *)v20, *(_QWORD *)(a2 + 24));
    v9 = *(_QWORD *)(a2 + 24);
    if (v9)
    {
      v10 = (_DWORD *)(*((_QWORD *)&v20[0] + 1) + 8);
      v11 = (_DWORD *)(*(_QWORD *)(a2 + 8) + 8);
      do
      {
        v12 = *((_QWORD *)v11 - 1);
        v13 = *v11;
        v11 += 6;
        *((_QWORD *)v10 - 1) = v12 - 1;
        *v10 = v13;
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    marisa::grimoire::trie::Tail::build((__int128 *)(a1 + 744), (uint64_t)v20, a3, *(_DWORD *)(a4 + 12));
    result = *(_QWORD *)&v20[0];
    if (*(_QWORD *)&v20[0])
      return MEMORY[0x20BD185D8](*(_QWORD *)&v20[0], 0x1000C8077774924);
  }
  else
  {
    v16 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
    v17 = v16;
    if (v16)
      marisa::grimoire::trie::LoudsTrie::LoudsTrie(v16);
    v18 = (marisa::grimoire::trie::LoudsTrie **)(a1 + 1000);
    marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset(v18, v17);
    if (!*v18)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x8000001D4;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:468: MARISA_MEM"
                     "ORY_ERROR: next_trie_.get() == NULL";
    }
    return marisa::grimoire::trie::LoudsTrie::build_trie<marisa::grimoire::trie::ReverseKey>(*v18, a2, a3, a4, a5 + 1);
  }
  return result;
}

void sub_209CA353C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD185F0](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::LoudsTrie::cache<marisa::grimoire::trie::Key>(uint64_t result, uint64_t a2, int a3, unsigned __int8 a4, float a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  float v9;
  _DWORD *v10;

  v5 = *(_QWORD *)(result + 1056) & (a4 ^ (unint64_t)(32 * a2) ^ a2);
  v6 = *(_QWORD *)(result + 1016);
  v7 = v6 + 12 * v5;
  v9 = *(float *)(v7 + 8);
  v8 = (float *)(v7 + 8);
  if (v9 < a5)
  {
    v10 = (_DWORD *)(v6 + 12 * v5);
    *v10 = a2;
    v10[1] = a3;
    *v8 = a5;
  }
  return result;
}

uint64_t *marisa::grimoire::trie::LoudsTrie::reserve_cache(marisa::grimoire::trie::LoudsTrie *this, const marisa::grimoire::trie::Config *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t *result;

  v5 = 256;
  if (a3 != 1)
    v5 = 1;
  do
  {
    v6 = v5;
    v5 *= 2;
  }
  while (v6 < a4 / *((unsigned int *)a2 + 2));
  result = marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::resize((uint64_t *)this + 126, v6);
  *((_QWORD *)this + 132) = v6 - 1;
  return result;
}

uint64_t *marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 > 0xAAAAAAAAAAAAAAALL)
      v5 = 0x1555555555555555;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::realloc(result, a2);
  }
  v6 = v3[3];
  v7 = v2 - v6;
  if (v2 > v6)
  {
    v8 = 12 * v6;
    do
    {
      v9 = v3[1] + v8;
      *(_QWORD *)v9 = 0;
      *(_DWORD *)(v9 + 8) = 0x800000;
      v8 += 12;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::cache<marisa::grimoire::trie::ReverseKey>(uint64_t result, int a2, uint64_t a3, float a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float *v7;
  float v8;
  _DWORD *v9;

  v4 = *(_QWORD *)(result + 1056) & a3;
  v5 = *(_QWORD *)(result + 1016);
  v6 = v5 + 12 * v4;
  v8 = *(float *)(v6 + 8);
  v7 = (float *)(v6 + 8);
  if (v8 < a4)
  {
    v9 = (_DWORD *)(v5 + 12 * v4);
    *v9 = a2;
    v9[1] = a3;
    *v7 = a4;
  }
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::fill_cache(uint64_t this)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  marisa::grimoire::vector::BitVector *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;

  v1 = *(_QWORD *)(this + 1032);
  if (v1)
  {
    v2 = this;
    v3 = 0;
    v4 = 0;
    v5 = (marisa::grimoire::vector::BitVector *)(this + 416);
    do
    {
      v6 = *(_QWORD *)(v2 + 1016);
      v7 = *(unsigned int *)(v6 + v3 + 4);
      if ((_DWORD)v7)
      {
        *(_BYTE *)(v6 + v3 + 8) = *(_BYTE *)(*(_QWORD *)(v2 + 632) + v7);
        v8 = *(_QWORD *)(v2 + 1016);
        if (((*(_QWORD *)(*(_QWORD *)(v2 + 432) + ((v7 >> 3) & 0x1FFFFFF8)) >> v7) & 1) != 0)
        {
          this = marisa::grimoire::vector::BitVector::rank1(v5, v7);
          v9 = *(_QWORD *)(v2 + 720);
          v10 = (unint64_t)(v9 * this) >> 6;
          v11 = (v9 * this) & 0x3F;
          v12 = v11 + v9;
          v13 = *(_QWORD *)(v2 + 688);
          v14 = *(_QWORD *)(v13 + 8 * v10);
          if (v12 > 0x40)
            v15 = ((2 * *(_QWORD *)(v13 + 8 * v10 + 8)) << (v11 ^ 0x3Fu)) | (v14 >> v11);
          else
            v15 = v14 >> v11;
          v16 = *(_DWORD *)(v2 + 728) & v15;
        }
        else
        {
          v16 = 0xFFFFFF;
        }
        *(_DWORD *)(v8 + v3 + 8) = *(unsigned __int8 *)(v8 + v3 + 8) | (v16 << 8);
        v1 = *(_QWORD *)(v2 + 1032);
      }
      else
      {
        *(_QWORD *)(v6 + v3) = -1;
      }
      ++v4;
      v3 += 12;
    }
    while (v4 < v1);
  }
  return this;
}

uint64_t marisa::grimoire::vector::BitVector::map(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Mapper *a2)
{
  uint64_t result;
  _OWORD v4[4];
  __int128 v5;
  _BYTE v6[25];
  __int128 v7;
  _BYTE v8[25];
  __int128 v9;
  _BYTE v10[25];

  memset(v4, 0, 41);
  v7 = 0u;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v4[3] = 0u;
  v5 = 0u;
  memset(v6, 0, sizeof(v6));
  marisa::grimoire::vector::BitVector::map_((marisa::grimoire::vector::BitVector *)v4, a2);
  marisa::grimoire::vector::BitVector::swap(this, (marisa::grimoire::vector::BitVector *)v4);
  if ((_QWORD)v9)
    MEMORY[0x20BD185D8](v9, 0x1000C8077774924);
  if ((_QWORD)v7)
    MEMORY[0x20BD185D8](v7, 0x1000C8077774924);
  if ((_QWORD)v5)
    MEMORY[0x20BD185D8](v5, 0x1000C8077774924);
  result = *(_QWORD *)&v4[0];
  if (*(_QWORD *)&v4[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v4[0], 0x1000C8077774924);
  return result;
}

void sub_209CA38B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::vector::BitVector::~BitVector((marisa::grimoire::vector::BitVector *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA3958(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::FlatVector::map(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _OWORD v9[3];
  uint64_t v10;
  int v11;
  uint64_t v12;

  memset(v9, 0, 41);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  marisa::grimoire::vector::FlatVector::map_((marisa::grimoire::vector::FlatVector *)v9, a2);
  v3 = *(_OWORD *)this;
  *(_OWORD *)this = v9[0];
  v9[0] = v3;
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v9[1];
  *(_QWORD *)&v9[1] = v4;
  v5 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  v6 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v10;
  v10 = v6;
  LODWORD(v6) = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v11;
  v11 = v6;
  v7 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v12;
  result = v3;
  v12 = v7;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA3A50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA3B0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::BitVector::read(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Reader *a2)
{
  uint64_t result;
  _OWORD v4[4];
  __int128 v5;
  _BYTE v6[25];
  __int128 v7;
  _BYTE v8[25];
  __int128 v9;
  _BYTE v10[25];

  memset(v4, 0, 41);
  v7 = 0u;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v4[3] = 0u;
  v5 = 0u;
  memset(v6, 0, sizeof(v6));
  marisa::grimoire::vector::BitVector::read_((marisa::grimoire::vector::BitVector *)v4, a2);
  marisa::grimoire::vector::BitVector::swap(this, (marisa::grimoire::vector::BitVector *)v4);
  if ((_QWORD)v9)
    MEMORY[0x20BD185D8](v9, 0x1000C8077774924);
  if ((_QWORD)v7)
    MEMORY[0x20BD185D8](v7, 0x1000C8077774924);
  if ((_QWORD)v5)
    MEMORY[0x20BD185D8](v5, 0x1000C8077774924);
  result = *(_QWORD *)&v4[0];
  if (*(_QWORD *)&v4[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v4[0], 0x1000C8077774924);
  return result;
}

void sub_209CA3C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::vector::BitVector::~BitVector((marisa::grimoire::vector::BitVector *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::read(__int128 *a1, marisa::grimoire::io::Reader *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned char>::read_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA3CB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::FlatVector::read(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Reader *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _OWORD v9[3];
  uint64_t v10;
  int v11;
  uint64_t v12;

  memset(v9, 0, 41);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  marisa::grimoire::vector::FlatVector::read_((marisa::grimoire::vector::FlatVector *)v9, a2);
  v3 = *(_OWORD *)this;
  *(_OWORD *)this = v9[0];
  v9[0] = v3;
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v9[1];
  *(_QWORD *)&v9[1] = v4;
  v5 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  v6 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = v10;
  v10 = v6;
  LODWORD(v6) = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v11;
  v11 = v6;
  v7 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = v12;
  result = v3;
  v12 = v7;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA3DA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::read(__int128 *a1, marisa::grimoire::io::Reader *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::read_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA3E64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t *marisa::grimoire::trie::LoudsTrie::restore_(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2, unint64_t a3)
{
  uint64_t *v6;
  marisa::grimoire::vector::BitVector *v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *result;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  marisa::grimoire::trie::LoudsTrie *v23;
  unint64_t v24;
  marisa::grimoire::trie::LoudsTrie *v25;
  char v26;
  char v27;

  v6 = (uint64_t *)*((_QWORD *)a2 + 5);
  v7 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 416);
  v8 = (uint64_t *)((char *)this + 744);
  while (1)
  {
    while (1)
    {
      v9 = *((_QWORD *)this + 132) & a3;
      v10 = *((_QWORD *)this + 128);
      if (a3 != *(_DWORD *)(v10 + 12 * v9 + 4))
        break;
      v11 = v10 + 12 * v9;
      v12 = *(unsigned int *)(v11 + 8);
      if (v12 <= 0xFFFFFEFF)
      {
        v23 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
        if (v23)
          result = (uint64_t *)marisa::grimoire::trie::LoudsTrie::restore_(v23, a2, v12);
        else
          result = marisa::grimoire::trie::Tail::restore(v8, a2, v12);
      }
      else
      {
        v27 = *(_DWORD *)(v11 + 8);
        result = marisa::grimoire::vector::Vector<char>::push_back(v6, &v27);
      }
      a3 = *(unsigned int *)(*((_QWORD *)this + 128) + 12 * v9);
      if (!(_DWORD)a3)
        return result;
    }
    if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
    {
      v14 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + a3);
      v15 = marisa::grimoire::vector::BitVector::rank1(v7, a3);
      v16 = *((_QWORD *)this + 90);
      v17 = (unint64_t)(v16 * v15) >> 6;
      v18 = (v16 * v15) & 0x3F;
      v19 = v18 + v16;
      v20 = *((_QWORD *)this + 86);
      v21 = *(_QWORD *)(v20 + 8 * v17);
      v22 = v19 > 0x40
          ? ((2 * *(_QWORD *)(v20 + 8 * v17 + 8)) << (v18 ^ 0x3Fu)) | (v21 >> v18)
          : v21 >> v18;
      v24 = v14 | ((*((_DWORD *)this + 182) & v22) << 8);
      v25 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
      result = v25
             ? (uint64_t *)marisa::grimoire::trie::LoudsTrie::restore_(v25, a2, v24)
             : marisa::grimoire::trie::Tail::restore(v8, a2, v24);
    }
    else
    {
      v26 = *(_BYTE *)(*((_QWORD *)this + 80) + a3);
      result = marisa::grimoire::vector::Vector<char>::push_back(v6, &v26);
    }
    if (a3 <= *((_QWORD *)this + 133))
      break;
    a3 = marisa::grimoire::vector::BitVector::select1(this, a3) + ~a3;
  }
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::match_(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2, unint64_t a3)
{
  uint64_t v6;
  marisa::grimoire::vector::BitVector *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  marisa::grimoire::trie::LoudsTrie *v24;
  marisa::grimoire::trie::LoudsTrie *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *((_QWORD *)a2 + 5);
  v7 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 416);
  v8 = (_QWORD *)((char *)this + 744);
  while (1)
  {
    while (1)
    {
      v9 = *((_QWORD *)this + 132) & a3;
      v10 = *((_QWORD *)this + 128);
      if (a3 == *(_DWORD *)(v10 + 12 * v9 + 4))
        break;
      if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
      {
        v13 = *((_QWORD *)this + 125);
        v14 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + a3);
        v15 = marisa::grimoire::vector::BitVector::rank1(v7, a3);
        v16 = *((_QWORD *)this + 90);
        v17 = (unint64_t)(v16 * v15) >> 6;
        v18 = (v16 * v15) & 0x3F;
        v19 = v18 + v16;
        v20 = *((_QWORD *)this + 86);
        v21 = *(_QWORD *)(v20 + 8 * v17);
        if (v13)
        {
          v22 = v21 >> v18;
          if (v19 > 0x40)
            v22 |= (2 * *(_QWORD *)(v20 + 8 * v17 + 8)) << (v18 ^ 0x3Fu);
          v23 = v14 | ((*((_DWORD *)this + 182) & v22) << 8);
          v24 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
          if (v24)
          {
            if ((marisa::grimoire::trie::LoudsTrie::match_(v24, a2, v23) & 1) == 0)
              return 0;
            goto LABEL_27;
          }
        }
        else
        {
          if (v19 > 0x40)
            v27 = ((2 * *(_QWORD *)(v20 + 8 * v17 + 8)) << (v18 ^ 0x3Fu)) | (v21 >> v18);
          else
            v27 = v21 >> v18;
          v23 = v14 | ((*((_DWORD *)this + 182) & v27) << 8);
        }
        if ((marisa::grimoire::trie::Tail::match(v8, (uint64_t *)a2, v23) & 1) == 0)
          return 0;
      }
      else
      {
        v26 = *(unsigned int *)(v6 + 100);
        if (*(unsigned __int8 *)(*((_QWORD *)this + 80) + a3) != *(unsigned __int8 *)(*(_QWORD *)a2 + v26))
          return 0;
        *(_DWORD *)(v6 + 100) = v26 + 1;
      }
LABEL_27:
      if (a3 <= *((_QWORD *)this + 133))
        return 1;
      if (*((_QWORD *)a2 + 1) <= (unint64_t)*(unsigned int *)(v6 + 100))
        return 0;
      a3 = marisa::grimoire::vector::BitVector::select1(this, a3) + ~a3;
    }
    v11 = *(unsigned int *)(v10 + 12 * v9 + 8);
    if (v11 <= 0xFFFFFEFF)
    {
      v25 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
      if (v25)
      {
        if ((marisa::grimoire::trie::LoudsTrie::match_(v25, a2, v11) & 1) == 0)
          return 0;
      }
      else if ((marisa::grimoire::trie::Tail::match(v8, (uint64_t *)a2, v11) & 1) == 0)
      {
        return 0;
      }
    }
    else
    {
      v12 = *(unsigned int *)(v6 + 100);
      if (*(unsigned __int8 *)(*(_QWORD *)a2 + v12) != v11)
        return 0;
      *(_DWORD *)(v6 + 100) = v12 + 1;
    }
    a3 = *(unsigned int *)(*((_QWORD *)this + 128) + 12 * v9);
    if (!(_DWORD)a3)
      return 1;
    if (*((_QWORD *)a2 + 1) <= (unint64_t)*(unsigned int *)(v6 + 100))
      return 0;
  }
}

uint64_t marisa::grimoire::trie::LoudsTrie::prefix_match_(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2, unint64_t a3)
{
  uint64_t v6;
  marisa::grimoire::vector::BitVector *v7;
  marisa::grimoire::trie::Tail *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  marisa::grimoire::trie::LoudsTrie *v21;
  unint64_t v22;
  marisa::grimoire::trie::LoudsTrie *v23;
  char v25;
  char v26;

  v6 = *((_QWORD *)a2 + 5);
  v7 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 416);
  v8 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 744);
  while (1)
  {
    v9 = *((_QWORD *)this + 132) & a3;
    v10 = *((_QWORD *)this + 128);
    if (a3 != *(_DWORD *)(v10 + 12 * v9 + 4))
    {
      v12 = *(unsigned __int8 *)(*((_QWORD *)this + 80) + a3);
      if (((*(_QWORD *)(*((_QWORD *)this + 54) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
      {
        v13 = marisa::grimoire::vector::BitVector::rank1(v7, a3);
        v14 = *((_QWORD *)this + 90);
        v15 = (unint64_t)(v14 * v13) >> 6;
        v16 = (v14 * v13) & 0x3F;
        v17 = v16 + v14;
        v18 = *((_QWORD *)this + 86);
        v19 = *(_QWORD *)(v18 + 8 * v15);
        if (v17 > 0x40)
          v20 = ((2 * *(_QWORD *)(v18 + 8 * v15 + 8)) << (v16 ^ 0x3Fu)) | (v19 >> v16);
        else
          v20 = v19 >> v16;
        v22 = v12 | ((*((_DWORD *)this + 182) & v20) << 8);
        v23 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
        if (v23)
        {
          if ((marisa::grimoire::trie::LoudsTrie::prefix_match_(v23, a2, v22) & 1) == 0)
            return 0;
        }
        else if (!marisa::grimoire::trie::Tail::prefix_match(v8, a2, v22))
        {
          return 0;
        }
      }
      else
      {
        if (v12 != *(unsigned __int8 *)(*(_QWORD *)a2 + *(unsigned int *)(v6 + 100)))
          return 0;
        v25 = *(_BYTE *)(*((_QWORD *)this + 80) + a3);
        marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v6, &v25);
        ++*(_DWORD *)(v6 + 100);
      }
      if (a3 <= *((_QWORD *)this + 133))
        return 1;
      a3 = marisa::grimoire::vector::BitVector::select1(this, a3) + ~a3;
      goto LABEL_23;
    }
    v11 = *(unsigned int *)(v10 + 12 * v9 + 8);
    if (v11 > 0xFFFFFEFF)
    {
      if (*(unsigned __int8 *)(*(_QWORD *)a2 + *(unsigned int *)(v6 + 100)) != v11)
        return 0;
      v26 = *(_DWORD *)(v10 + 12 * v9 + 8);
      marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v6, &v26);
      ++*(_DWORD *)(v6 + 100);
      goto LABEL_22;
    }
    v21 = (marisa::grimoire::trie::LoudsTrie *)*((_QWORD *)this + 125);
    if (!v21)
      break;
    if ((marisa::grimoire::trie::LoudsTrie::prefix_match_(v21, a2, v11) & 1) == 0)
      return 0;
LABEL_22:
    a3 = *(unsigned int *)(*((_QWORD *)this + 128) + 12 * v9);
    if (!(_DWORD)a3)
      return 1;
LABEL_23:
    if (*((_QWORD *)a2 + 1) <= (unint64_t)*(unsigned int *)(v6 + 100))
    {
      marisa::grimoire::trie::LoudsTrie::restore_(this, a2, a3);
      return 1;
    }
  }
  if (marisa::grimoire::trie::Tail::prefix_match(v8, a2, v11))
    goto LABEL_22;
  return 0;
}

uint64_t marisa::grimoire::trie::Config::parse_(marisa::grimoire::trie::Config *this, unsigned int a2)
{
  _QWORD *exception;

  if (a2 >= 0x100000)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x50000003BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:59: MARISA_CODE_ERROR:"
                   " (config_flags & ~MARISA_CONFIG_MASK) != 0";
  }
  if ((a2 & 0x7F) != 0)
    *(_QWORD *)this = a2 & 0x7F;
  marisa::grimoire::trie::Config::parse_cache_level((uint64_t)this, a2);
  marisa::grimoire::trie::Config::parse_tail_mode((uint64_t)this, a2);
  return marisa::grimoire::trie::Config::parse_node_order((uint64_t)this, a2);
}

uint64_t marisa::grimoire::trie::Config::parse_cache_level(uint64_t this, __int16 a2)
{
  unsigned int v2;
  int v3;
  _QWORD *exception;

  v2 = a2 & 0xF80;
  v3 = 512;
  if (v2 > 0x1FF)
  {
    if (v2 == 512)
      goto LABEL_11;
    if (v2 != 1024)
    {
      v3 = a2 & 0xF80;
      if (v2 != 2048)
        goto LABEL_9;
      goto LABEL_11;
    }
LABEL_10:
    v3 = a2 & 0xF80;
    goto LABEL_11;
  }
  if ((a2 & 0xF80) == 0)
    goto LABEL_11;
  if (v2 == 128)
    goto LABEL_10;
  v3 = a2 & 0xF80;
  if (v2 != 256)
  {
LABEL_9:
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x500000065;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:101: MARISA_CODE_ERROR"
                   ": undefined cache level";
  }
LABEL_11:
  *(_DWORD *)(this + 8) = v3;
  return this;
}

uint64_t marisa::grimoire::trie::Config::parse_tail_mode(uint64_t this, __int16 a2)
{
  int v2;
  int v3;
  _QWORD *exception;

  v2 = 4096;
  v3 = a2 & 0xF000;
  if ((a2 & 0xF000) != 0 && v3 != 4096)
  {
    if (v3 != 0x2000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x500000079;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:121: MARISA_CODE_ERR"
                     "OR: undefined tail mode";
    }
    v2 = 0x2000;
  }
  *(_DWORD *)(this + 12) = v2;
  return this;
}

uint64_t marisa::grimoire::trie::Config::parse_node_order(uint64_t this, int a2)
{
  int v2;
  int v3;
  _QWORD *exception;

  v2 = 0x20000;
  v3 = a2 & 0xF0000;
  if ((a2 & 0xF0000) != 0 && v3 != 0x20000)
  {
    if (v3 != 0x10000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x50000008DLL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:141: MARISA_CODE_ERR"
                     "OR: undefined node order";
    }
    v2 = 0x10000;
  }
  *(_DWORD *)(this + 16) = v2;
  return this;
}

_BYTE *marisa::grimoire::vector::Vector<char>::realloc(uint64_t *a1, size_t __sz)
{
  _BYTE *result;
  uint64_t v5;
  char *v6;
  _BYTE *v7;
  char v8;
  uint64_t v9;

  result = operator new[](__sz, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (char *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = __sz;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

uint64_t *marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _DWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 > 0x666666666666666)
      v5 = 0xCCCCCCCCCCCCCCCLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::realloc(result, a2);
  }
  v6 = v3[3];
  v7 = v2 - v6;
  if (v2 > v6)
  {
    v8 = (_DWORD *)(v3[1] + 20 * v6 + 16);
    do
    {
      *((_OWORD *)v8 - 1) = xmmword_209CB0570;
      *v8 = -1;
      v8 += 5;
      --v7;
    }
    while (v7);
  }
  v3[3] = v2;
  return result;
}

_DWORD *marisa::grimoire::vector::Vector<marisa::grimoire::trie::History>::realloc(uint64_t *a1, uint64_t a2)
{
  _DWORD *result;
  uint64_t v5;
  __int128 *v6;
  _DWORD *v7;
  __int128 v8;
  uint64_t v9;

  result = operator new[](20 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (__int128 *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6;
      v7[4] = *((_DWORD *)v6 + 4);
      *(_OWORD *)v7 = v8;
      v7 += 5;
      v6 = (__int128 *)((char *)v6 + 20);
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

uint64_t *marisa::grimoire::vector::Vector<unsigned long long>::resize(uint64_t *result, unint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v4 = a2;
  v5 = result;
  v6 = result[4];
  if (v6 < a2)
  {
    v7 = 2 * v6;
    if (v6 >> 60)
      v7 = 0x1FFFFFFFFFFFFFFFLL;
    if (v6 > a2 >> 1)
      a2 = v7;
    result = marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, a2);
  }
  v8 = v5[3];
  v9 = v4 - v8;
  if (v4 > v8)
  {
    v10 = (_QWORD *)(v5[1] + 8 * v8);
    do
    {
      *v10++ = *a3;
      --v9;
    }
    while (v9);
  }
  v5[3] = v4;
  return result;
}

_QWORD *marisa::grimoire::vector::Vector<unsigned long long>::realloc(uint64_t *a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = operator new[](8 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (uint64_t *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

_QWORD *marisa::grimoire::vector::Vector<unsigned long long>::shrink(_QWORD *result)
{
  uint64_t v1;
  _QWORD *exception;

  if (*((_BYTE *)result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0x100000064;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:100: MARISA_"
                   "STATE_ERROR: fixed_";
  }
  v1 = result[3];
  if (v1 != result[4])
    return marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, v1);
  return result;
}

uint64_t marisa::grimoire::vector::BitVector::map_(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Mapper *a2)
{
  unint64_t v4;
  _QWORD *exception;

  marisa::grimoire::vector::Vector<unsigned long long>::map((__int128 *)this, a2);
  *((_QWORD *)this + 6) = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  v4 = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (*((_QWORD *)this + 6) < v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h";
    exception[2] = 0xA00000087;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h:135: MAR"
                   "ISA_FORMAT_ERROR: temp_num_1s > size_";
  }
  *((_QWORD *)this + 7) = v4;
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map((__int128 *)this + 4, a2);
  marisa::grimoire::vector::Vector<unsigned int>::map((__int128 *)this + 7, a2);
  return marisa::grimoire::vector::Vector<unsigned int>::map((__int128 *)this + 10, a2);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned long long>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA4B4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA4C08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned int>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA4CC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  _QWORD *exception;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 7) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<unsigned long long>(this, (uint64_t *)(a1 + 16), v4 >> 3);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4 >> 3;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<unsigned long long>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = marisa::grimoire::io::Mapper::map_data(a1, 8 * a3);
  *a2 = result;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::fix(uint64_t result)
{
  _QWORD *exception;

  if (*(_BYTE *)(result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0x10000006BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:107: MARISA_"
                   "STATE_ERROR: fixed_";
  }
  *(_BYTE *)(result + 40) = 1;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *exception;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  v5 = v4 / 0xC;
  if (v4 % 0xC)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<marisa::grimoire::vector::RankIndex>(this, (uint64_t *)(a1 + 16), v5);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v5;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<marisa::grimoire::vector::RankIndex>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = marisa::grimoire::io::Mapper::map_data(a1, 12 * a3);
  *a2 = result;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;
  _QWORD *exception;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 3) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<unsigned int>(this, (uint64_t *)(a1 + 16), v4 >> 2);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4 >> 2;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<unsigned int>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t result;
  _QWORD *exception;
  const char *v6;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  result = marisa::grimoire::io::Mapper::map_data(a1, 4 * a3);
  *a2 = result;
  return result;
}

_QWORD *marisa::grimoire::vector::FlatVector::map_(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Mapper *a2)
{
  uint64_t v4;
  _QWORD *result;
  _QWORD *exception;

  marisa::grimoire::vector::Vector<unsigned long long>::map((__int128 *)this, a2);
  v4 = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (v4 >= 0x21)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h";
    exception[2] = 0xA00000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h:134: MA"
                   "RISA_FORMAT_ERROR: temp_value_size > 32";
  }
  *((_QWORD *)this + 6) = v4;
  *((_DWORD *)this + 14) = *(_DWORD *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  result = (_QWORD *)marisa::grimoire::io::Mapper::map_data(a2, 8uLL);
  *((_QWORD *)this + 8) = *result;
  return result;
}

uint64_t marisa::grimoire::vector::BitVector::read_(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Reader *a2)
{
  _QWORD *exception;
  unsigned int v6;
  unsigned int v7;

  marisa::grimoire::vector::Vector<unsigned long long>::read((__int128 *)this, a2);
  v7 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)a2, (char *)&v7, 4uLL);
  *((_QWORD *)this + 6) = v7;
  v6 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)a2, (char *)&v6, 4uLL);
  if (*((_QWORD *)this + 6) < (unint64_t)v6)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h";
    exception[2] = 0xA00000099;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h:153: MAR"
                   "ISA_FORMAT_ERROR: temp_num_1s > size_";
  }
  *((_QWORD *)this + 7) = v6;
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::read((__int128 *)this + 4, a2);
  marisa::grimoire::vector::Vector<unsigned int>::read((__int128 *)this + 7, a2);
  return marisa::grimoire::vector::Vector<unsigned int>::read((__int128 *)this + 10, a2);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::read(__int128 *a1, marisa::grimoire::io::Reader *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned long long>::read_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA53FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::read(__int128 *a1, marisa::grimoire::io::Reader *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::read_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA54B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::read(__int128 *a1, marisa::grimoire::io::Reader *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned int>::read_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA5574(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::read_(uint64_t a1, marisa::grimoire::io::Reader *this)
{
  unint64_t v4;
  _QWORD *exception;
  unint64_t v7;

  v7 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)this, (char *)&v7, 8uLL);
  if ((v7 & 7) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000D5;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:213: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  v4 = v7 >> 3;
  marisa::grimoire::vector::Vector<unsigned long long>::resize((uint64_t *)a1, v7 >> 3);
  marisa::grimoire::io::Reader::read<unsigned long long>((uint64_t)this, *(char **)(a1 + 8), v4);
  return marisa::grimoire::io::Reader::seek((uint64_t)this, -(int)v7 & 7);
}

uint64_t *marisa::grimoire::vector::Vector<unsigned long long>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 60)
      v5 = 0x1FFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = marisa::grimoire::vector::Vector<unsigned long long>::realloc(result, a2);
  }
  v3[3] = v2;
  return result;
}

uint64_t marisa::grimoire::io::Reader::read<unsigned long long>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h";
    exception[2] = 0x20000001FLL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h:31: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h";
    exception[2] = 0x700000021;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h:33: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return marisa::grimoire::io::Reader::read_data(a1, a2, 8 * a3);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::read_(uint64_t a1, marisa::grimoire::io::Reader *this)
{
  unint64_t v4;
  _QWORD *exception;
  unint64_t v7;

  v7 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)this, (char *)&v7, 8uLL);
  v4 = v7 / 0xC;
  if (v7 % 0xC)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000D5;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:213: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::resize((uint64_t *)a1, v7 / 0xC);
  marisa::grimoire::io::Reader::read<marisa::grimoire::vector::RankIndex>((uint64_t)this, *(char **)(a1 + 8), v4);
  return marisa::grimoire::io::Reader::seek((uint64_t)this, -(int)v7 & 7);
}

void marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = a2;
  v4 = a1[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 > 0xAAAAAAAAAAAAAAALL)
      v5 = 0x1555555555555555;
    if (v4 > a2 >> 1)
      a2 = v5;
    marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::realloc(a1, a2);
  }
  v6 = a1[3];
  if (v2 > v6)
    bzero((void *)(a1[1] + 12 * v6), 12 * (v2 - v6));
  a1[3] = v2;
}

uint64_t marisa::grimoire::io::Reader::read<marisa::grimoire::vector::RankIndex>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h";
    exception[2] = 0x20000001FLL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h:31: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h";
    exception[2] = 0x700000021;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h:33: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return marisa::grimoire::io::Reader::read_data(a1, a2, 12 * a3);
}

_DWORD *marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::realloc(uint64_t *a1, uint64_t a2)
{
  _DWORD *result;
  uint64_t v5;
  uint64_t *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = operator new[](12 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (uint64_t *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6;
      v7[2] = *((_DWORD *)v6 + 2);
      *(_QWORD *)v7 = v8;
      v7 += 3;
      v6 = (uint64_t *)((char *)v6 + 12);
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::read_(uint64_t a1, marisa::grimoire::io::Reader *this)
{
  unint64_t v4;
  _QWORD *exception;
  unint64_t v7;

  v7 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)this, (char *)&v7, 8uLL);
  if ((v7 & 3) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000D5;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:213: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  v4 = v7 >> 2;
  marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)a1, v7 >> 2);
  marisa::grimoire::io::Reader::read<unsigned int>((uint64_t)this, *(char **)(a1 + 8), v4);
  return marisa::grimoire::io::Reader::seek((uint64_t)this, -(int)v7 & 7);
}

uint64_t *marisa::grimoire::vector::Vector<unsigned int>::resize(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = a2;
  v3 = result;
  v4 = result[4];
  if (v4 < a2)
  {
    v5 = 2 * v4;
    if (v4 >> 61)
      v5 = 0x3FFFFFFFFFFFFFFFLL;
    if (v4 > a2 >> 1)
      a2 = v5;
    result = (uint64_t *)marisa::grimoire::vector::Vector<unsigned int>::realloc(result, a2);
  }
  v3[3] = v2;
  return result;
}

uint64_t marisa::grimoire::io::Reader::read<unsigned int>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h";
    exception[2] = 0x20000001FLL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h:31: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h";
    exception[2] = 0x700000021;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h:33: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return marisa::grimoire::io::Reader::read_data(a1, a2, 4 * a3);
}

_DWORD *marisa::grimoire::vector::Vector<unsigned int>::realloc(uint64_t *a1, uint64_t a2)
{
  _DWORD *result;
  uint64_t v5;
  int *v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;

  result = operator new[](4 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (int *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

uint64_t marisa::grimoire::vector::FlatVector::read_(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Reader *a2)
{
  uint64_t result;
  _QWORD *exception;
  uint64_t v6;

  marisa::grimoire::vector::Vector<unsigned long long>::read((__int128 *)this, a2);
  LODWORD(v6) = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)a2, (char *)&v6, 4uLL);
  if (v6 >= 0x21)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h";
    exception[2] = 0xA0000009BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h:155: MA"
                   "RISA_FORMAT_ERROR: temp_value_size > 32";
  }
  *((_QWORD *)this + 6) = v6;
  LODWORD(v6) = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)a2, (char *)&v6, 4uLL);
  *((_DWORD *)this + 14) = v6;
  v6 = 0;
  result = marisa::grimoire::io::Reader::read_data((uint64_t)a2, (char *)&v6, 8uLL);
  *((_QWORD *)this + 8) = v6;
  return result;
}

uint64_t marisa::grimoire::vector::BitVector::write_(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Writer *a2)
{
  int v5;
  int __buf;

  marisa::grimoire::vector::Vector<unsigned long long>::write_((uint64_t)this, a2);
  __buf = *((_QWORD *)this + 6);
  marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  v5 = *((_QWORD *)this + 7);
  marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&v5, 4uLL);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::write_((uint64_t)this + 64, a2);
  marisa::grimoire::vector::Vector<unsigned int>::write_((uint64_t)this + 112, a2);
  return marisa::grimoire::vector::Vector<unsigned int>::write_((uint64_t)this + 160, a2);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::write_(uint64_t a1, marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = 8 * *(_QWORD *)(a1 + 24);
  marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  marisa::grimoire::io::Writer::write<unsigned long long>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return marisa::grimoire::io::Writer::seek((uint64_t)this, 0);
}

uint64_t marisa::grimoire::io::Writer::write<unsigned long long>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h";
    exception[2] = 0x20000001ELL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h:30: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h";
    exception[2] = 0x700000020;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h:32: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return marisa::grimoire::io::Writer::write_data(a1, a2, 8 * a3);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::write_(uint64_t a1, marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = 12 * *(_QWORD *)(a1 + 24);
  marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  marisa::grimoire::io::Writer::write<marisa::grimoire::vector::RankIndex>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return marisa::grimoire::io::Writer::seek((uint64_t)this, 4 * (*(_DWORD *)(a1 + 24) & 1));
}

uint64_t marisa::grimoire::io::Writer::write<marisa::grimoire::vector::RankIndex>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h";
    exception[2] = 0x20000001ELL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h:30: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h";
    exception[2] = 0x700000020;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h:32: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return marisa::grimoire::io::Writer::write_data(a1, a2, 12 * a3);
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::write_(uint64_t a1, marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = 4 * *(_QWORD *)(a1 + 24);
  marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  marisa::grimoire::io::Writer::write<unsigned int>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return marisa::grimoire::io::Writer::seek((uint64_t)this, 4 * (*(_DWORD *)(a1 + 24) & 1));
}

uint64_t marisa::grimoire::io::Writer::write<unsigned int>(uint64_t a1, char *a2, unint64_t a3)
{
  _QWORD *exception;
  const char *v5;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h";
    exception[2] = 0x20000001ELL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h:30: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h";
    exception[2] = 0x700000020;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h:32: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v5;
  }
  return marisa::grimoire::io::Writer::write_data(a1, a2, 4 * a3);
}

uint64_t marisa::grimoire::vector::FlatVector::write_(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Writer *a2)
{
  uint64_t __buf;

  marisa::grimoire::vector::Vector<unsigned long long>::write_((uint64_t)this, a2);
  LODWORD(__buf) = *((_QWORD *)this + 6);
  marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  LODWORD(__buf) = *((_DWORD *)this + 14);
  marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 4uLL);
  __buf = *((_QWORD *)this + 8);
  return marisa::grimoire::io::Writer::write_data((uint64_t)a2, (char *)&__buf, 8uLL);
}

marisa::grimoire::trie::LoudsTrie **marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(marisa::grimoire::trie::LoudsTrie **a1)
{
  marisa::grimoire::trie::LoudsTrie *v2;

  v2 = *a1;
  if (v2)
  {
    marisa::grimoire::trie::LoudsTrie::~LoudsTrie(v2);
    MEMORY[0x20BD185FC]();
  }
  return a1;
}

char *marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::realloc(uint64_t *a1, uint64_t a2)
{
  char *result;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;

  result = (char *)operator new[](24 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (_DWORD *)(a1[1] + 16);
    v7 = result + 16;
    do
    {
      *((_QWORD *)v7 - 2) = *((_QWORD *)v6 - 2);
      *(v7 - 2) = *(v6 - 2);
      *(v7 - 1) = *(v6 - 1);
      v8 = *v6;
      v6 += 6;
      *v7 = v8;
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_current_trie<marisa::grimoire::trie::Key>(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  __n128 v34;
  uint64_t v35;
  __n128 *v36;
  unint64_t v37;
  __n128 *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unsigned int *v43;
  uint64_t *v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int32 *v57;
  float v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float *v63;
  float v64;
  uint64_t v65;
  _DWORD *v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  uint64_t result;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  __n128 v78;
  int v79;
  __int128 v80;
  uint64_t v81[4];
  _OWORD v82[2];
  __int128 v83;
  _OWORD v84[4];

  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 8);
  if (v9)
  {
    v11 = 0;
    v12 = (_DWORD *)(v10 + 16);
    do
    {
      *v12 = v11;
      v12 += 6;
      ++v11;
    }
    while (v9 != v11);
  }
  v13 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Key *>(v10, v10 + 24 * v9, 0);
  v14 = 256;
  if (a5 != 1)
    v14 = 1;
  do
  {
    v15 = v14;
    v14 *= 2;
  }
  while (v15 < v13 / *(unsigned int *)(a4 + 8));
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::resize(a1 + 126, v15);
  a1[132] = v15 - 1;
  marisa::grimoire::vector::BitVector::push_back(a1, 1);
  marisa::grimoire::vector::BitVector::push_back(a1, 0);
  v16 = a1 + 78;
  LOBYTE(v84[0]) = 0;
  marisa::grimoire::vector::Vector<char>::push_back(a1 + 78, v84);
  v77 = a1 + 52;
  marisa::grimoire::vector::BitVector::push_back(a1 + 52, 0);
  v72 = a5;
  memset(v84, 0, 41);
  v83 = 0u;
  memset(v82, 0, sizeof(v82));
  v80 = 0u;
  memset(v81, 0, 25);
  v78.n128_u64[0] = *(_QWORD *)(a2 + 24) << 32;
  v78.n128_u32[2] = 0;
  std::deque<marisa::grimoire::trie::Range>::push_back(v82, (uint64_t *)&v78);
  v17 = *((_QWORD *)&v83 + 1);
  if (*((_QWORD *)&v83 + 1))
  {
    v73 = a1 + 78;
    do
    {
      v18 = a1[58];
      v19 = (unsigned int *)(*(_QWORD *)(*((_QWORD *)&v82[0] + 1) + 8 * ((unint64_t)v83 / 0x155))
                           + 12 * ((unint64_t)v83 % 0x155));
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      *(_QWORD *)&v83 = v83 + 1;
      *((_QWORD *)&v83 + 1) = v17 - 1;
      if ((unint64_t)v83 >= 0x2AA)
      {
        v23 = v18;
        operator delete(**((void ***)&v82[0] + 1));
        v18 = v23;
        *((_QWORD *)&v82[0] + 1) += 8;
        *(_QWORD *)&v83 = v83 - 341;
      }
      v76 = v17;
      v24 = v18 - v17;
      if (v20 < v21)
      {
        while (1)
        {
          v25 = *(_QWORD *)(a2 + 8);
          if (*(_DWORD *)(v25 + 24 * v20 + 8) != (_DWORD)v22)
            break;
          *(_DWORD *)(v25 + 24 * v20 + 12) = v24;
          v20 = (v20 + 1);
          if ((_DWORD)v21 == (_DWORD)v20)
            goto LABEL_49;
        }
      }
      if ((_DWORD)v20 != (_DWORD)v21)
      {
        v75 = v18;
        v26 = v80;
        v80 = 0u;
        memset(v81, 0, 25);
        if (v26)
          MEMORY[0x20BD185D8](v26, 0x1000C8077774924);
        v27 = *(_QWORD *)(a2 + 8);
        v28 = *(float *)(v27 + 24 * v20 + 12);
        v29 = v20 + 1;
        if (v20 + 1 < v21)
        {
          v30 = 24 * v20;
          v31 = (v20 << 32) + 0x100000000;
          do
          {
            if (*(unsigned __int8 *)(*(_QWORD *)(v27 + v30) + v22) != *(unsigned __int8 *)(*(_QWORD *)(v27 + v30 + 24)
                                                                                          + v22))
            {
              *(float *)&v32 = v28;
              v78.n128_u64[0] = v31 + v20;
              v78.n128_u64[1] = v22 | ((unint64_t)v32 << 32);
              marisa::grimoire::vector::Vector<marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
              v27 = *(_QWORD *)(a2 + 8);
              v28 = 0.0;
              LODWORD(v20) = v29;
            }
            v28 = v28 + *(float *)(v27 + v30 + 36);
            ++v29;
            v30 += 24;
            v31 += 0x100000000;
          }
          while (v21 != v29);
        }
        *(float *)&v33 = v28;
        v78.n128_u32[0] = v20;
        v78.n128_u32[1] = v21;
        v78.n128_u64[1] = v22 | ((unint64_t)v33 << 32);
        v34 = marisa::grimoire::vector::Vector<marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
        v16 = a1 + 78;
        v35 = v75;
        if (*(_DWORD *)(a4 + 16) == 0x20000)
        {
          v36 = (__n128 *)*((_QWORD *)&v80 + 1);
          v37 = v81[1];
          if (v81[1] < 129)
          {
            v38 = 0;
            v40 = 0;
          }
          else
          {
            v38 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<marisa::grimoire::trie::WeightedRange>(v81[1]);
            v40 = v39;
          }
          std::__stable_sort<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(v36, &v36[v37], (uint64_t)&v78, v37, v38, v40, v34);
          if (v38)
            operator delete(v38);
          v35 = v75;
        }
        v41 = v81[1];
        if (v35 == v76)
          a1[133] = v81[1];
        if (v41)
        {
          v42 = 0;
          do
          {
            v43 = (unsigned int *)(*((_QWORD *)&v80 + 1) + 16 * v42);
            v44 = (uint64_t *)v43;
            v45 = v43[2];
            v46 = *v43;
            v47 = *(_QWORD *)(a2 + 8);
            v48 = *(unsigned int *)(v47 + 24 * *v43 + 8);
            v49 = v45 + 1;
            if (v45 + 1 >= v48)
            {
              v50 = v43[2];
              LODWORD(v48) = v45 + 1;
            }
            else
            {
              v50 = v48 - 1;
              v51 = v43[2];
              do
              {
                v52 = v51;
                v51 = v49;
                v53 = (uint64_t *)(v47 + 24 * v46);
                v54 = *v43;
                while (++v54 < (unint64_t)v43[1])
                {
                  v55 = *v53;
                  v56 = v53[3];
                  v53 += 3;
                  if (*(unsigned __int8 *)(v55 + v51) != *(unsigned __int8 *)(v56 + v51))
                  {
                    v50 = v52;
                    LODWORD(v48) = v51;
                    goto LABEL_43;
                  }
                }
                v49 = v51 + 1;
              }
              while (v51 + 1 != v48);
            }
LABEL_43:
            v58 = *((float *)v43 + 3);
            v57 = v43 + 3;
            v59 = v58;
            v60 = ((32 * v24) ^ v24 ^ *(unsigned __int8 *)(*(_QWORD *)(v47 + 24 * v46) + v45)) & a1[132];
            v61 = a1[127];
            v62 = v61 + 12 * v60;
            v64 = *(float *)(v62 + 8);
            v63 = (float *)(v62 + 8);
            if (v64 < v59)
            {
              v65 = a1[81];
              v66 = (_DWORD *)(v61 + 12 * v60);
              *v66 = v24;
              v66[1] = v65;
              *v63 = v59;
              v45 = *((unsigned int *)v44 + 2);
            }
            if (v50 == v45)
            {
              v78.n128_u8[0] = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v44) + v50);
              marisa::grimoire::vector::Vector<char>::push_back(v73, &v78);
              marisa::grimoire::vector::BitVector::push_back(v77, 0);
            }
            else
            {
              v78.n128_u8[0] = 0;
              marisa::grimoire::vector::Vector<char>::push_back(v73, &v78);
              marisa::grimoire::vector::BitVector::push_back(v77, 1);
              v78 = 0uLL;
              v79 = 0;
              v67 = *((unsigned int *)v44 + 2);
              v78.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v44) + v67;
              v78.n128_u64[1] = (v48 - v67);
              v78.n128_u32[3] = *v57;
              marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::push_back((uint64_t *)v84, (uint64_t)&v78);
            }
            *((_DWORD *)v44 + 2) = v48;
            std::deque<marisa::grimoire::trie::Range>::push_back(v82, v44);
            marisa::grimoire::vector::BitVector::push_back(a1, 1);
            ++v42;
          }
          while (v42 < v81[1]);
        }
      }
LABEL_49:
      marisa::grimoire::vector::BitVector::push_back(a1, 0);
      v17 = *((_QWORD *)&v83 + 1);
    }
    while (*((_QWORD *)&v83 + 1));
  }
  marisa::grimoire::vector::BitVector::push_back(a1, 0);
  marisa::grimoire::vector::BitVector::build((marisa::grimoire::vector::BitVector *)a1, v72 == 1, 1);
  marisa::grimoire::vector::Vector<unsigned char>::shrink(v16);
  marisa::grimoire::trie::LoudsTrie::build_terminals<marisa::grimoire::trie::Key>((uint64_t)a1, a2, a3);
  v68 = *(_OWORD *)a2;
  *(_OWORD *)a2 = v84[0];
  v84[0] = v68;
  v69 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = *(_QWORD *)&v84[1];
  *(_QWORD *)&v84[1] = v69;
  v70 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)((char *)&v84[1] + 8);
  *(_OWORD *)((char *)&v84[1] + 8) = v70;
  LOBYTE(v69) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a2 + 40) = BYTE8(v84[2]);
  BYTE8(v84[2]) = v69;
  if ((_QWORD)v80)
    MEMORY[0x20BD185D8](v80, 0x1000C8077774924);
  std::deque<marisa::grimoire::trie::Range>::~deque[abi:ne180100](v82);
  result = *(_QWORD *)&v84[0];
  if (*(_QWORD *)&v84[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v84[0], 0x1000C8077774924);
  return result;
}

void sub_209CA687C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, ...)
{
  uint64_t v18;
  uint64_t v21;
  _QWORD *exception;
  va_list va;

  va_start(va, a18);
  if (a13)
    MEMORY[0x20BD185D8](a13, 0x1000C8077774924);
  std::deque<marisa::grimoire::trie::Range>::~deque[abi:ne180100]((uint64_t *)va);
  v21 = *(_QWORD *)(v18 - 144);
  if (v21)
    MEMORY[0x20BD185D8](v21, 0x1000C8077774924);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
    exception[2] = 0x8000001ACLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:428: MARISA_MEMOR"
                   "Y_ERROR: std::bad_alloc";
  }
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::vector::FlatVector::build(__int128 *a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _OWORD v9[3];
  uint64_t v10;
  int v11;
  uint64_t v12;

  memset(v9, 0, 41);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  marisa::grimoire::vector::FlatVector::build_((uint64_t)v9, a2);
  v3 = *a1;
  *a1 = v9[0];
  v9[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v9[1];
  *(_QWORD *)&v9[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  v6 = *((_QWORD *)a1 + 6);
  *((_QWORD *)a1 + 6) = v10;
  v10 = v6;
  LODWORD(v6) = *((_DWORD *)a1 + 14);
  *((_DWORD *)a1 + 14) = v11;
  v11 = v6;
  v7 = *((_QWORD *)a1 + 8);
  *((_QWORD *)a1 + 8) = v12;
  result = v3;
  v12 = v7;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CA6A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

__n128 marisa::grimoire::vector::Vector<marisa::grimoire::trie::WeightedRange>::push_back(uint64_t *a1, __n128 *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 result;

  v4 = a1[3];
  v5 = a1[4];
  v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    v7 = 2 * v5;
    if (v5 >> 59)
      v7 = 0xFFFFFFFFFFFFFFFLL;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    marisa::grimoire::vector::Vector<marisa::grimoire::trie::WeightedRange>::realloc(a1, v8);
    v4 = a1[3];
  }
  result = *a2;
  *(__n128 *)(a1[1] + 16 * v4) = *a2;
  ++a1[3];
  return result;
}

uint64_t *marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::push_back(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = result;
  v4 = result[3];
  v5 = result[4];
  v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    v7 = 2 * v5;
    if (v5 > 0x555555555555555)
      v7 = 0xAAAAAAAAAAAAAAALL;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    result = (uint64_t *)marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::realloc(result, v8);
    v4 = v3[3];
  }
  v9 = v3[1] + 24 * v4;
  *(_QWORD *)v9 = *(_QWORD *)a2;
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(v9 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(v9 + 16) = *(_DWORD *)(a2 + 16);
  ++v3[3];
  return result;
}

_BYTE *marisa::grimoire::vector::Vector<unsigned char>::shrink(_BYTE *result)
{
  size_t v1;
  _QWORD *exception;

  if (result[40])
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0x100000064;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:100: MARISA_"
                   "STATE_ERROR: fixed_";
  }
  v1 = *((_QWORD *)result + 3);
  if (v1 != *((_QWORD *)result + 4))
    return marisa::grimoire::vector::Vector<char>::realloc((uint64_t *)result, v1);
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_terminals<marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t result;
  _OWORD v13[3];

  memset(v13, 0, 41);
  marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v13, *(_QWORD *)(a2 + 24));
  v5 = *(_QWORD *)(a2 + 24);
  if (v5)
  {
    v6 = *((_QWORD *)&v13[0] + 1);
    v7 = (unsigned int *)(*(_QWORD *)(a2 + 16) + 16);
    do
    {
      *(_DWORD *)(v6 + 4 * *v7) = *(v7 - 1);
      v7 += 6;
      --v5;
    }
    while (v5);
  }
  else
  {
    v6 = *((_QWORD *)&v13[0] + 1);
  }
  v8 = *a3;
  v9 = *(_QWORD *)&v13[1];
  *(_QWORD *)a3 = *(_QWORD *)&v13[0];
  *((_QWORD *)a3 + 1) = v6;
  v13[0] = v8;
  v10 = *((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = v9;
  *(_QWORD *)&v13[1] = v10;
  v11 = *(__int128 *)((char *)a3 + 24);
  *(__int128 *)((char *)a3 + 24) = *(_OWORD *)((char *)&v13[1] + 8);
  *(_OWORD *)((char *)&v13[1] + 8) = v11;
  LOBYTE(v10) = *((_BYTE *)a3 + 40);
  *((_BYTE *)a3 + 40) = BYTE8(v13[2]);
  result = v8;
  BYTE8(v13[2]) = v10;
  if ((_QWORD)v8)
    return MEMORY[0x20BD185D8](v8, 0x1000C8077774924);
  return result;
}

void sub_209CA6CCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Key *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v4 = a2;
  v5 = a1;
  v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 241)
  {
    v7 = 0;
    goto LABEL_69;
  }
  v7 = 0;
  do
  {
    v8 = marisa::grimoire::algorithm::details::median<marisa::grimoire::trie::Key>(v5, v5 + 24 * (v6 / 0x30uLL), v4 - 24, a3);
    v9 = v8;
    v10 = v5;
    v11 = v4;
    v12 = v5;
    v13 = v4;
    while (v10 < v11)
    {
      v14 = *(unsigned int *)(v10 + 8);
      v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(_QWORD *)v10 + a3);
      if (v15 > v8)
        break;
      if (v15 == v8)
      {
        v16 = *(_QWORD *)v10;
        *(_QWORD *)v10 = *(_QWORD *)v12;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v12 + 8);
        v17 = *(_QWORD *)(v10 + 12);
        *(_DWORD *)(v10 + 12) = *(_DWORD *)(v12 + 12);
        *(_DWORD *)(v10 + 16) = *(_DWORD *)(v12 + 16);
        *(_QWORD *)v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(_QWORD *)(v12 + 12) = v17;
        v12 += 24;
      }
LABEL_11:
      v10 += 24;
    }
    if (v10 < v11)
    {
      v18 = v11 - 24;
      do
      {
        v11 = v18;
        v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19)
          v20 = -1;
        else
          v20 = *(unsigned __int8 *)(*(_QWORD *)v11 + a3);
        if (v20 < v8)
          break;
        if (v20 == v8)
        {
          v21 = *(_QWORD *)(v13 - 24);
          v13 -= 24;
          v22 = *(_QWORD *)v11;
          *(_QWORD *)v11 = v21;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 + 8);
          v23 = *(_QWORD *)(v11 + 12);
          *(_DWORD *)(v11 + 12) = *(_DWORD *)(v13 + 12);
          *(_DWORD *)(v11 + 16) = *(_DWORD *)(v13 + 16);
          *(_QWORD *)v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(_QWORD *)(v13 + 12) = v23;
        }
        v18 = v11 - 24;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      v24 = *(_QWORD *)v10;
      v25 = *(_DWORD *)(v10 + 16);
      *(_QWORD *)v10 = *(_QWORD *)v11;
      v26 = *(_QWORD *)(v10 + 8);
      *(_DWORD *)(v10 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v10 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v10 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v24;
      *(_QWORD *)(v11 + 8) = v26;
      *(_DWORD *)(v11 + 16) = v25;
      goto LABEL_11;
    }
    v44 = v7;
    if (v12 > v5)
    {
      v27 = 0;
      do
      {
        v28 = v12 + v27;
        v29 = v10 + v27;
        v30 = *(_QWORD *)(v12 + v27 - 24);
        v31 = *(_DWORD *)(v12 + v27 - 8);
        *(_QWORD *)(v28 - 24) = *(_QWORD *)(v10 + v27 - 24);
        v32 = *(_QWORD *)(v12 + v27 - 16);
        *(_DWORD *)(v28 - 16) = *(_DWORD *)(v10 + v27 - 16);
        *(_DWORD *)(v28 - 12) = *(_DWORD *)(v10 + v27 - 12);
        *(_DWORD *)(v28 - 8) = *(_DWORD *)(v10 + v27 - 8);
        *(_QWORD *)(v29 - 24) = v30;
        *(_QWORD *)(v29 - 16) = v32;
        *(_DWORD *)(v29 - 8) = v31;
        v27 -= 24;
      }
      while (v12 + v27 > v5);
      v10 += v27;
    }
    while (v13 < v4)
    {
      v33 = *(_QWORD *)v13;
      v34 = *(_DWORD *)(v13 + 16);
      *(_QWORD *)v13 = *(_QWORD *)v11;
      v35 = *(_QWORD *)(v13 + 8);
      *(_DWORD *)(v13 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v13 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v13 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v33;
      *(_QWORD *)(v11 + 8) = v35;
      *(_DWORD *)(v11 + 16) = v34;
      v11 += 24;
      v13 += 24;
    }
    v36 = v10 - v5;
    v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v5) >> 3);
    v38 = v11 - v10;
    v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v10) >> 3);
    if (v37 <= v39)
    {
      v40 = v4 - v11;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)) <= v39)
      {
        if (v36 == 24)
        {
          v41 = v44 + 1;
        }
        else
        {
          if (v36 < 25)
            goto LABEL_53;
          v41 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Key *>(v5, v10, a3) + v44;
        }
        v44 = v41;
LABEL_53:
        if (v40 == 24)
        {
          v7 = v44 + 1;
        }
        else if (v40 < 25)
        {
          v7 = v44;
        }
        else
        {
          v7 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Key *>(v11, v4, a3) + v44;
        }
        if (v38 == 24)
        {
          ++v7;
        }
        else if (v38 >= 25)
        {
          if (v9 == -1)
          {
            ++v7;
            v5 = v11;
            goto LABEL_64;
          }
          ++a3;
        }
        v5 = v10;
LABEL_64:
        v4 = v11;
        goto LABEL_65;
      }
    }
    if (v38 == 24)
      goto LABEL_32;
    if (v38 < 25)
    {
      v7 = v44;
    }
    else if (v8 == -1)
    {
LABEL_32:
      v7 = v44 + 1;
    }
    else
    {
      v7 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Key *>(v10, v11, a3 + 1) + v44;
    }
    v42 = v4 - v11;
    if (v37 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)))
    {
      if (v42 == 24)
      {
        ++v7;
      }
      else if (v42 >= 25)
      {
        v7 += marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Key *>(v11, v4, a3);
      }
      v4 = v10;
    }
    else
    {
      if (v36 == 24)
      {
        ++v7;
      }
      else if (v36 >= 25)
      {
        v7 += marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Key *>(v5, v10, a3);
      }
      v5 = v11;
    }
LABEL_65:
    v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 240);
LABEL_69:
  if (v6 >= 25)
    v7 += marisa::grimoire::algorithm::details::insertion_sort<marisa::grimoire::trie::Key *>(v5, v4, a3);
  return v7;
}

uint64_t marisa::grimoire::algorithm::details::median<marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (*(unsigned int *)(a1 + 8) <= a4)
    v4 = -1;
  else
    v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + a4);
  if (*(unsigned int *)(a2 + 8) <= a4)
    v5 = -1;
  else
    v5 = *(unsigned __int8 *)(*(_QWORD *)a2 + a4);
  if (*(unsigned int *)(a3 + 8) <= a4)
    v6 = -1;
  else
    v6 = *(unsigned __int8 *)(*(_QWORD *)a3 + a4);
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  if (v4 >= v5)
    v4 = v5;
  if (v4 <= v6)
    v4 = v6;
  if (v7 >= v6)
    return v4;
  else
    return v7;
}

uint64_t marisa::grimoire::algorithm::details::insertion_sort<marisa::grimoire::trie::Key *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1 + 24;
  if (a1 + 24 >= a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v3;
    if (v3 <= a1)
    {
      v10 = 0;
    }
    else
    {
      while (1)
      {
        v9 = v8 - 24;
        v10 = marisa::grimoire::algorithm::details::compare<marisa::grimoire::trie::Key>(v8 - 24, v8, a3);
        if (v10 < 1)
          break;
        v11 = *(_QWORD *)(v8 - 24);
        v12 = *(_DWORD *)(v8 - 8);
        *(_QWORD *)(v8 - 24) = *(_QWORD *)v8;
        v13 = *(_QWORD *)(v8 + 8);
        *(_DWORD *)(v8 - 8) = *(_DWORD *)(v8 + 16);
        *(_QWORD *)v8 = v11;
        v14 = *(_QWORD *)(v8 - 16);
        *(_QWORD *)(v8 - 16) = v13;
        *(_QWORD *)(v8 + 8) = v14;
        *(_DWORD *)(v8 + 16) = v12;
        v8 -= 24;
        if (v9 <= a1)
        {
          v10 = 1;
          break;
        }
      }
    }
    if (v10)
      ++v7;
    v3 += 24;
  }
  while (v3 < a2);
  return v7;
}

uint64_t marisa::grimoire::algorithm::details::compare<marisa::grimoire::trie::Key>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  uint64_t result;
  unsigned int v12;

  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(unsigned int *)(a2 + 8);
  v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4)
      v12 = -1;
    else
      v12 = 1;
    if ((_DWORD)v3 == (_DWORD)v4)
      return 0;
    else
      return v12;
  }
  else
  {
    v6 = v4 - a3;
    v7 = (unsigned __int8 *)(*(_QWORD *)a1 + a3);
    v8 = (unsigned __int8 *)(*(_QWORD *)a2 + a3);
    while (v6)
    {
      v9 = *v7;
      v10 = *v8;
      result = (v9 - v10);
      if (v9 != v10)
        return result;
      --v6;
      ++v7;
      ++v8;
      if (!--v5)
        goto LABEL_6;
    }
    return 1;
  }
}

void std::deque<marisa::grimoire::trie::Range>::push_back(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 341 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<marisa::grimoire::trie::Range>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x155)) + 12 * (v7 % 0x155);
  v9 = *a2;
  *(_DWORD *)(v8 + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)v8 = v9;
  ++a1[5];
}

void std::deque<marisa::grimoire::trie::Range>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x155;
  v4 = v2 - 341;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFFCuLL);
      std::__split_buffer<marisa::grimoire::trie::Range *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFFCuLL);
    std::__split_buffer<marisa::grimoire::trie::Range *>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFFCuLL);
  std::__split_buffer<marisa::grimoire::trie::Range *>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<marisa::grimoire::trie::Range *>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_209CA76AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<marisa::grimoire::trie::Range *>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<marisa::grimoire::trie::Range *>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<marisa::grimoire::trie::Range *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_OWORD *marisa::grimoire::vector::Vector<marisa::grimoire::trie::WeightedRange>::realloc(uint64_t *a1, uint64_t a2)
{
  _OWORD *result;
  uint64_t v5;
  __int128 *v6;
  _OWORD *v7;
  __int128 v8;
  uint64_t v9;

  result = operator new[](16 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (__int128 *)a1[1];
    v7 = result;
    do
    {
      v8 = *v6++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

void *std::get_temporary_buffer[abi:ne180100]<marisa::grimoire::trie::WeightedRange>(uint64_t a1)
{
  unint64_t v1;
  const std::nothrow_t *v2;
  void *result;
  BOOL v4;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x7FFFFFFFFFFFFFFLL)
    v1 = 0x7FFFFFFFFFFFFFFLL;
  else
    v1 = a1;
  v2 = (const std::nothrow_t *)MEMORY[0x24BEDB6B8];
  while (1)
  {
    result = operator new(16 * v1, v2);
    if (result)
      break;
    v4 = v1 > 1;
    v1 >>= 1;
    if (!v4)
      return 0;
  }
  return result;
}

double std::__stable_sort<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4, __n128 *a5, uint64_t a6, __n128 a7)
{
  unint64_t v13;
  __n128 *v14;
  unint64_t v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;

  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      a7.n128_u32[0] = a2[-1].n128_u32[3];
      if (a7.n128_f32[0] > a1->n128_f32[3])
      {
        a7 = *a1;
        *a1 = a2[-1];
        a2[-1] = a7;
      }
    }
    else if ((uint64_t)a4 > 128)
    {
      v13 = a4 >> 1;
      v14 = &a1[a4 >> 1];
      v15 = a4 >> 1;
      if ((uint64_t)a4 <= a6)
      {
        v17.n128_f64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(a1, v14, a3, v15, a5, a7);
        v18.n128_f64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[v13], v17);
        a7.n128_u64[0] = std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*,marisa::grimoire::trie::WeightedRange*,marisa::grimoire::trie::WeightedRange*>(a5, &a5[v13], &a5[v13], &a5[a4], a1, v18).n128_u64[0];
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(a1, v14, a3, v15, a5, a6);
        std::__stable_sort<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), a5, a6);
        a7.n128_u64[0] = std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>((__int128 *)a1, (__int128 *)&a1[a4 >> 1], (__int128 *)a2, a3, a4 >> 1, a4 - (a4 >> 1), (char *)a5, a6, v16).n128_u64[0];
      }
    }
    else
    {
      std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>((uint64_t)a1, (uint64_t)a2);
    }
  }
  return a7.n128_f64[0];
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  if (result != a2)
  {
    v2 = result + 16;
    if (result + 16 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = *(float *)(v4 + 28);
        v6 = *(float *)(v4 + 12);
        v4 = v2;
        if (v5 > v6)
        {
          v10 = *(_QWORD *)v2;
          v11 = *(_DWORD *)(v2 + 8);
          v7 = v3;
          while (1)
          {
            *(_OWORD *)(result + v7 + 16) = *(_OWORD *)(result + v7);
            if (!v7)
              break;
            v8 = *(float *)(result + v7 - 4);
            v7 -= 16;
            if (v5 <= v8)
            {
              v9 = result + v7 + 16;
              goto LABEL_10;
            }
          }
          v9 = result;
LABEL_10:
          *(_QWORD *)v9 = v10;
          *(_DWORD *)(v9 + 8) = v11;
          *(float *)(v9 + 12) = v5;
        }
        v2 = v4 + 16;
        v3 += 16;
      }
      while (v4 + 16 != a2);
    }
  }
  return result;
}

double std::__stable_sort_move<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4, __n128 *a5, __n128 a6)
{
  __n128 *v10;
  __n128 v12;

  if (a4)
  {
    if (a4 == 2)
    {
      v10 = a2 - 1;
      if (a2[-1].n128_f32[3] <= a1->n128_f32[3])
      {
        *a5 = *a1;
        a6 = *v10;
      }
      else
      {
        *a5 = *v10;
        a6 = *a1;
      }
      a5[1] = a6;
    }
    else if (a4 == 1)
    {
      a6 = *a1;
      *a5 = *a1;
    }
    else if ((uint64_t)a4 > 8)
    {
      std::__stable_sort<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(a1, &a1[a4 >> 1], a3, a4 >> 1, a5, a4 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[a4 >> 1], a4 - (a4 >> 1));
      a6.n128_u64[0] = std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*,marisa::grimoire::trie::WeightedRange*,marisa::grimoire::trie::WeightedRange*>(a1, &a1[a4 >> 1], &a1[a4 >> 1], a2, a5, v12).n128_u64[0];
    }
    else
    {
      a6.n128_u64[0] = std::__insertion_sort_move[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(a1, a2, a5).n128_u64[0];
    }
  }
  return a6.n128_f64[0];
}

__n128 std::__merge_move_assign[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*,marisa::grimoire::trie::WeightedRange*,marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, __n128 result)
{
  __n128 v6;
  __n128 v7;
  __n128 v8;
  uint64_t v9;

  while (1)
  {
    if (a1 == a2)
    {
      while (a3 != a4)
      {
        v8 = *a3++;
        result.n128_u64[0] = v8.n128_u64[0];
        *a5++ = v8;
      }
      return result;
    }
    if (a3 == a4)
      break;
    if (a3->n128_f32[3] <= a1->n128_f32[3])
    {
      v7 = *a1++;
      result = v7;
    }
    else
    {
      v6 = *a3++;
      result = v6;
    }
    *a5++ = result;
  }
  if (a1 != a2)
  {
    v9 = 0;
    do
    {
      result = a1[v9];
      a5[v9++] = result;
    }
    while (&a1[v9] != a2);
  }
  return result;
}

__n128 std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, __n128 result)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  unint64_t v21;
  unint64_t v22;
  __int128 *v23;
  float v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  __int128 *v29;
  float v30;
  __int128 *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  __int128 *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 *v39;
  uint64_t v40;
  __n128 v43;

  if (a6)
  {
    v10 = a6;
    do
    {
      if (v10 <= a8 || a5 <= a8)
      {
        std::__buffered_inplace_merge[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(a1, a2, a3, a4, a5, v10, a7);
        return result;
      }
      if (!a5)
        return result;
      v12 = 0;
      result.n128_u32[0] = *((_DWORD *)a2 + 3);
      v13 = -a5;
      while (1)
      {
        v14 = &a1[v12];
        if (result.n128_f32[0] > *((float *)&a1[v12] + 3))
          break;
        ++v12;
        if (__CFADD__(v13++, 1))
          return result;
      }
      v16 = -v13;
      v39 = a3;
      v40 = a8;
      if (-v13 >= v10)
      {
        if (v13 == -1)
        {
          v43 = (__n128)a1[v12];
          a1[v12] = *a2;
          result = v43;
          *a2 = (__int128)v43;
          return result;
        }
        if (v13 > 0)
          v16 = 1 - v13;
        v26 = v16 >> 1;
        v20 = &a1[(v16 >> 1) + v12];
        v19 = a3;
        if (a3 != a2)
        {
          v27 = a3 - a2;
          v19 = a2;
          do
          {
            v28 = v27 >> 1;
            v29 = &v19[v27 >> 1];
            v30 = *((float *)v29 + 3);
            v31 = v29 + 1;
            v27 += ~(v27 >> 1);
            if (v30 > *((float *)v20 + 3))
              v19 = v31;
            else
              v27 = v28;
          }
          while (v27);
        }
        v18 = v19 - a2;
      }
      else
      {
        if (v10 >= 0)
          v17 = v10;
        else
          v17 = v10 + 1;
        v18 = v17 >> 1;
        v19 = &a2[v17 >> 1];
        v20 = a2;
        if (v14 != a2)
        {
          v21 = ((char *)a2 - (char *)a1 - v12 * 16) >> 4;
          v20 = &a1[v12];
          do
          {
            v22 = v21 >> 1;
            v23 = &v20[v21 >> 1];
            v24 = *((float *)v23 + 3);
            v25 = v23 + 1;
            v21 += ~(v21 >> 1);
            if (*((float *)v19 + 3) > v24)
              v21 = v22;
            else
              v20 = v25;
          }
          while (v21);
        }
        v26 = ((char *)v20 - (char *)a1 - v12 * 16) >> 4;
      }
      a5 = -(v26 + v13);
      v32 = v10 - v18;
      v33 = v18;
      v34 = std::__rotate[abi:ne180100]<std::_ClassicAlgPolicy,marisa::grimoire::trie::WeightedRange *,marisa::grimoire::trie::WeightedRange *>((char *)v20, (char *)a2, (char *)v19);
      v35 = v33;
      v36 = (__int128 *)v34;
      if (v26 + v35 >= v10 - (v26 + v35) - v13)
      {
        v38 = v35;
        std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(v34, v19, v39, a4, a5, v32, a7, v40);
        v19 = v20;
        v32 = v38;
        a5 = v26;
        a8 = v40;
        a3 = v36;
      }
      else
      {
        v37 = v26;
        a8 = v40;
        std::__inplace_merge<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(v14, v20, v34, a4, v37, v35, a7, v40);
        v14 = v36;
        a3 = v39;
      }
      v10 = v32;
      a1 = v14;
      a2 = v19;
    }
    while (v32);
  }
  return result;
}

__n128 std::__insertion_sort_move[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(__n128 *a1, __n128 *a2, __n128 *a3)
{
  __n128 result;
  __n128 *v4;
  uint64_t v5;
  __n128 *v6;
  __n128 *v7;
  __n128 *v8;
  __n128 *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    result = *a1;
    *a3 = *a1;
    v4 = a1 + 1;
    if (&a1[1] != a2)
    {
      v5 = 0;
      v6 = a3;
      do
      {
        v7 = a1;
        v8 = v6;
        a1 = v4;
        v9 = ++v6;
        if (v7[1].n128_f32[3] > v8->n128_f32[3])
        {
          *v6 = *v8;
          v9 = a3;
          if (v8 != a3)
          {
            v10 = v5;
            while (1)
            {
              v9 = (__n128 *)((char *)a3 + v10);
              if (v7[1].n128_f32[3] <= *(float *)((char *)&a3->n128_f32[-1] + v10))
                break;
              *v9 = v9[-1];
              v10 -= 16;
              if (!v10)
              {
                v9 = a3;
                break;
              }
            }
          }
        }
        result = *a1;
        *v9 = *a1;
        v4 = a1 + 1;
        v5 += 16;
      }
      while (&a1[1] != a2);
    }
  }
  return result;
}

__int128 *std::__buffered_inplace_merge[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(__int128 *result, __int128 *a2, __int128 *a3, int a4, uint64_t a5, uint64_t a6, char *__src)
{
  uint64_t v7;
  float *v8;
  __int128 *v9;
  float v10;
  float v11;
  char *v12;
  unint64_t v13;
  float *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;

  if (a5 <= a6)
  {
    if (result != a2)
    {
      v13 = 0;
      do
      {
        *(_OWORD *)&__src[v13] = result[v13 / 0x10];
        v13 += 16;
      }
      while (&result[v13 / 0x10] != a2);
      if (v13)
      {
        v14 = (float *)__src;
        while (a2 != a3)
        {
          if (*((float *)a2 + 3) <= v14[3])
          {
            v17 = *(_OWORD *)v14;
            v14 += 4;
            v16 = v17;
          }
          else
          {
            v15 = *a2++;
            v16 = v15;
          }
          *result++ = v16;
          if (&__src[v13] == (char *)v14)
            return result;
        }
        return (__int128 *)memmove(result, v14, __src - (char *)v14 + v13);
      }
    }
  }
  else if (a2 != a3)
  {
    v7 = 0;
    do
    {
      *(_OWORD *)&__src[v7 * 16] = a2[v7];
      ++v7;
    }
    while (&a2[v7] != a3);
    if (v7 * 16)
    {
      v8 = (float *)&__src[v7 * 16];
      v9 = a3 - 1;
      while (a2 != result)
      {
        v10 = *(v8 - 1);
        v11 = *((float *)a2 - 1);
        if (v10 <= v11)
          v12 = (char *)(v8 - 4);
        else
          v12 = (char *)(a2 - 1);
        if (v10 <= v11)
          v8 -= 4;
        else
          --a2;
        *v9-- = *(_OWORD *)v12;
        if (v8 == (float *)__src)
          return result;
      }
      v18 = 0;
      do
      {
        v9[v18 / 4] = *(_OWORD *)&v8[v18 - 4];
        v18 -= 4;
      }
      while (&v8[v18] != (float *)__src);
    }
  }
  return result;
}

char *std::__rotate[abi:ne180100]<std::_ClassicAlgPolicy,marisa::grimoire::trie::WeightedRange *,marisa::grimoire::trie::WeightedRange *>(char *__src, char *a2, char *a3)
{
  char *v4;
  int64_t v6;
  size_t v7;
  __int128 v9;
  __int128 v10;

  v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if (__src + 16 == a2)
    {
      v9 = *(_OWORD *)__src;
      v6 = a3 - a2;
      memmove(__src, a2, a3 - a2);
      v4 = &__src[v6];
      *(_OWORD *)v4 = v9;
    }
    else if (a2 + 16 == a3)
    {
      v4 = __src + 16;
      v10 = *((_OWORD *)a3 - 1);
      v7 = a3 - 16 - __src;
      if (a3 - 16 != __src)
        memmove(__src + 16, __src, v7);
      *(_OWORD *)__src = v10;
    }
    else
    {
      return (char *)std::__rotate_gcd[abi:ne180100]<std::_ClassicAlgPolicy,marisa::grimoire::trie::WeightedRange *>(__src, a2, a3);
    }
  }
  return v4;
}

_OWORD *std::__rotate_gcd[abi:ne180100]<std::_ClassicAlgPolicy,marisa::grimoire::trie::WeightedRange *>(_OWORD *a1, _OWORD *a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  _OWORD *v14;
  _OWORD *v15;
  _OWORD *v16;
  BOOL v17;
  char v18;
  uint64_t v19;

  v3 = a2 - a1;
  if (v3 == a3 - a2)
  {
    if (a1 != a2 && a2 != a3)
    {
      v4 = 0;
      do
      {
        v5 = a1[v4];
        a1[v4] = a2[v4];
        v6 = (uint64_t)&a1[v4 + 1];
        a2[v4] = v5;
        v7 = (uint64_t)&a2[++v4];
      }
      while ((_OWORD *)v6 != a2 && v7 != (_QWORD)a3);
    }
  }
  else
  {
    v9 = a3 - a2;
    v10 = a2 - a1;
    do
    {
      v11 = v10;
      v10 = v9;
      v9 = v11 % v9;
    }
    while (v9);
    if (v10)
    {
      v12 = &a1[v10];
      do
      {
        v13 = *--v12;
        v14 = &v12[v3];
        v15 = v12;
        do
        {
          v16 = v15;
          v15 = v14;
          *v16 = *v14;
          v17 = __OFSUB__(v3, a3 - v14);
          v19 = v3 - (a3 - v14);
          v18 = (v19 < 0) ^ v17;
          v14 = &a1[v19];
          if (v18)
            v14 = &v15[v3];
        }
        while (v14 != v12);
        *v15 = v13;
      }
      while (v12 != a1);
    }
    return &a1[a3 - a2];
  }
  return a2;
}

uint64_t std::deque<marisa::grimoire::trie::Range>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 170;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 341;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<marisa::grimoire::trie::Range *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<marisa::grimoire::trie::Range *>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

uint64_t marisa::grimoire::vector::FlatVector::build_(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;
  _BOOL8 v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;

  v4 = *(_QWORD *)(a2 + 24);
  if (!v4)
    goto LABEL_10;
  v5 = 0;
  v6 = *(unsigned int **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  do
  {
    v9 = *v6++;
    v8 = v9;
    if (v9 > v5)
      v5 = v8;
    --v7;
  }
  while (v7);
  if (v5)
  {
    v10 = 0;
    do
    {
      ++v10;
      v11 = v5 > 1;
      v5 >>= 1;
    }
    while (v11);
  }
  else
  {
LABEL_10:
    v10 = 0;
  }
  v12 = v4 != 0;
  v13 = (unint64_t)(v10 * v4 + 63) >> 6;
  if (v10)
    v14 = v13;
  else
    v14 = v12;
  result = (uint64_t)marisa::grimoire::vector::Vector<unsigned long long>::resize((uint64_t *)a1, v14);
  if (v14)
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * *(_QWORD *)(a1 + 24) - 8) = 0;
  *(_QWORD *)(a1 + 48) = v10;
  if (v10)
    *(_DWORD *)(a1 + 56) = 0xFFFFFFFF >> -(char)v10;
  v16 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 64) = v16;
  if (v16)
  {
    v17 = 0;
    do
    {
      result = marisa::grimoire::vector::FlatVector::set(a1, v17, *(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v17));
      ++v17;
    }
    while (v17 < *(_QWORD *)(a2 + 24));
  }
  return result;
}

uint64_t marisa::grimoire::vector::FlatVector::set(uint64_t this, uint64_t a2, int a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *(_QWORD *)(this + 48);
  v4 = (unint64_t)(v3 * a2) >> 6;
  v5 = (v3 * a2) & 0x3F;
  v6 = *(unsigned int *)(this + 56);
  v7 = *(_QWORD *)(this + 8);
  v8 = v6 & a3;
  *(_QWORD *)(v7 + 8 * v4) = *(_QWORD *)(v7 + 8 * v4) & ~(v6 << (v3 * a2)) | (v8 << (v3 * a2));
  if ((unint64_t)(v5 + v3) >= 0x41)
    *(_QWORD *)(v7 + 8 * v4 + 8) = *(_QWORD *)(v7 + 8 * v4 + 8) & ~(v6 >> -(char)v5) | (v8 >> -(char)v5);
  return this;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int *v18;
  char v19;
  BOOL v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  v8 = (unsigned int *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = ((char *)a2 - (char *)v9) >> 3;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v21 = *(a2 - 2);
        v22 = *v9;
        if (v21 < *v9 || v22 >= v21 && *(a2 - 1) < v9[1])
        {
          *v9 = v21;
          *(a2 - 2) = v22;
          v23 = v9[1];
          v9[1] = *(a2 - 1);
          *(a2 - 1) = v23;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v9 + 2, a2 - 2);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v9 + 2, v9 + 4, a2 - 2);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v9 + 2, v9 + 4, v9 + 6, a2 - 2);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, a2);
          else
            return (uint64_t)std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[2 * (v13 >> 1)];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(&v9[2 * (v13 >> 1)], v9, a2 - 2);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, &v9[2 * (v13 >> 1)], a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9 + 2, v15 - 2, a2 - 4);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9 + 4, &v9[2 * v14 + 2], a2 - 6);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v15 - 2, v15, &v9[2 * v14 + 2]);
            v16 = *(_QWORD *)v9;
            *(_QWORD *)v9 = *(_QWORD *)v15;
            *(_QWORD *)v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 2);
          if (v17 >= *v9 && (*v9 < v17 || *(v9 - 1) >= v9[1]))
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(v9, a2);
            v9 = (unsigned int *)result;
            goto LABEL_19;
          }
LABEL_14:
          v18 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(v9, a2);
          if ((v19 & 1) == 0)
            goto LABEL_17;
          v20 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v9, v18);
          v9 = v18 + 2;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(v18 + 2, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v20)
              continue;
LABEL_17:
            result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,false>(v8, v18, a3, -v11, a5 & 1);
            v9 = v18 + 2;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v18;
          if (v20)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,std::pair<unsigned int,unsigned int> *>(v9, a2, a2, a3);
        return result;
    }
  }
}

unsigned int *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, unsigned int *a2)
{
  unsigned int *v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;

  if (result != a2)
  {
    v2 = result + 2;
    if (result + 2 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v6 = v5[2];
        v7 = *v5;
        if (v6 < *v5 || v7 >= v6 && v5[3] < v5[1])
        {
          v9 = v5[2];
          v8 = v5[3];
          v10 = v5[1];
          v5[2] = v7;
          v4[1] = v10;
          v11 = result;
          if (v5 != result)
          {
            v12 = v3;
            do
            {
              v13 = *(unsigned int *)((char *)result + v12 - 8);
              if (v13 <= v9)
              {
                if (v13 < v9)
                {
                  v11 = v5;
                  goto LABEL_17;
                }
                v11 = (unsigned int *)((char *)result + v12);
                v14 = *(unsigned int *)((char *)result + v12 - 4);
                if (v14 <= v8)
                  goto LABEL_17;
              }
              else
              {
                v14 = *(unsigned int *)((char *)result + v12 - 4);
              }
              v5 -= 2;
              v15 = (unsigned int *)((char *)result + v12);
              *v15 = v13;
              v15[1] = v14;
              v12 -= 8;
            }
            while (v12);
            v11 = result;
          }
LABEL_17:
          *v11 = v9;
          v11[1] = v8;
        }
        v2 = v4 + 2;
        v3 += 8;
      }
      while (v4 + 2 != a2);
    }
  }
  return result;
}

unsigned int *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, unsigned int *a2)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *i;
  unsigned int v10;

  if (result != a2)
  {
    v2 = result + 2;
    if (result + 2 != a2)
    {
      v3 = result + 1;
      do
      {
        v4 = result;
        result = v2;
        v5 = v4[2];
        v6 = *v4;
        if (v5 < *v4 || v6 >= v5 && v4[3] < v4[1])
        {
          v7 = *result;
          v8 = result[1];
          for (i = v3; ; i -= 2)
          {
            v10 = *i;
            i[1] = v6;
            i[2] = v10;
            v6 = *(i - 3);
            if (v6 <= v7 && (v6 < v7 || *(i - 2) <= v8))
              break;
          }
          *(i - 1) = v7;
          *i = v8;
        }
        v2 = result + 2;
        v3 += 2;
      }
      while (result + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int *v6;
  int *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v3 = *a2;
  v4 = *a1;
  if (*a2 >= *a1 && (v4 < v3 || a2[1] >= a1[1]))
  {
    v9 = *a3;
    if (*a3 >= v3 && (v3 < v9 || a3[1] >= a2[1]))
      return 0;
    *a2 = v9;
    *a3 = v3;
    v11 = (int *)(a2 + 1);
    v10 = a2[1];
    a2[1] = a3[1];
    a3[1] = v10;
    v12 = *a2;
    v13 = *a1;
    if (*a2 >= *a1 && (v13 < v12 || *v11 >= a1[1]))
      return 1;
    *a1 = v12;
    v6 = (int *)(a1 + 1);
    *a2 = v13;
    v8 = 2;
  }
  else
  {
    v5 = *a3;
    if (*a3 < v3 || v3 >= v5 && a3[1] < a2[1])
    {
      *a1 = v5;
      v6 = (int *)(a1 + 1);
      *a3 = v4;
      v7 = (int *)(a3 + 1);
      v8 = 1;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = a1[1];
      a1[1] = a2[1];
      a2[1] = v14;
      v15 = *a3;
      v16 = *a2;
      if (*a3 >= *a2 && (v16 < v15 || a3[1] >= v14))
        return 1;
      *a2 = v15;
      *a3 = v16;
      v7 = (int *)(a3 + 1);
      v8 = 2;
      v6 = (int *)(a2 + 1);
    }
    v11 = v7;
  }
  v17 = *v6;
  *v6 = *v11;
  *v11 = v17;
  return v8;
}

unsigned int *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(unsigned int *a1, unsigned int *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *i;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;

  v3 = *a1;
  v2 = a1[1];
  v4 = *(a2 - 2);
  if (v4 <= *a1 && (v4 < v3 || *(a2 - 1) <= v2))
  {
    for (i = a1 + 2; i < a2 && *i <= v3 && (*i < v3 || i[1] <= v2); i += 2)
      ;
  }
  else
  {
    i = a1;
    do
    {
      v7 = i[2];
      i += 2;
      v6 = v7;
    }
    while (v7 <= v3 && (v6 < v3 || i[1] <= v2));
  }
  if (i < a2)
  {
    for (a2 -= 2; v4 > v3 || v4 >= v3 && a2[1] > v2; a2 -= 2)
    {
      v8 = *(a2 - 2);
      v4 = v8;
    }
  }
  if (i < a2)
  {
    v9 = *i;
    v10 = *a2;
    do
    {
      *i = v10;
      *a2 = v9;
      v11 = i[1];
      i[1] = a2[1];
      a2[1] = v11;
      do
      {
        v12 = i[2];
        i += 2;
        v9 = v12;
      }
      while (v12 <= v3 && (v9 < v3 || i[1] <= v2));
      do
      {
        do
        {
          v13 = *(a2 - 2);
          a2 -= 2;
          v10 = v13;
          v14 = v13 >= v3;
        }
        while (v13 > v3);
      }
      while (v14 && a2[1] > v2);
    }
    while (i < a2);
  }
  if (i - 2 != a1)
  {
    *a1 = *(i - 2);
    a1[1] = *(i - 1);
  }
  *(i - 2) = v3;
  *(i - 1) = v2;
  return i;
}

unsigned int *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned int,unsigned int> *,std::__less<void,void> &>(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  unsigned int v18;

  v2 = 0;
  v3 = *a1;
  v4 = a1[1];
  while (1)
  {
    v5 = a1[v2 + 2];
    if (v5 >= v3 && (v5 > v3 || a1[v2 + 3] >= v4))
      break;
    v2 += 2;
  }
  v6 = (unint64_t)&a1[v2 + 2];
  if (v2 * 4)
  {
    do
    {
      v8 = *(a2 - 2);
      a2 -= 2;
      v7 = v8;
    }
    while (v8 >= v3 && (v7 > v3 || a2[1] >= v4));
  }
  else
  {
LABEL_19:
    if (v6 < (unint64_t)a2)
    {
      do
      {
        v10 = *(a2 - 2);
        a2 -= 2;
        v9 = v10;
        if (v10 < v3)
          break;
        if (v9 > v3)
          goto LABEL_19;
      }
      while (a2[1] >= v4 && v6 < (unint64_t)a2);
    }
  }
  if (v6 >= (unint64_t)a2)
  {
    v13 = (unsigned int *)v6;
  }
  else
  {
    v12 = *a2;
    v13 = (unsigned int *)v6;
    v14 = a2;
    do
    {
      *v13 = v12;
      *v14 = v5;
      v15 = v13[1];
      v13[1] = v14[1];
      v14[1] = v15;
      do
      {
        do
        {
          v16 = v13[2];
          v13 += 2;
          v5 = v16;
          v17 = v16 > v3;
        }
        while (v16 < v3);
      }
      while (!v17 && v13[1] < v4);
      do
      {
        v18 = *(v14 - 2);
        v14 -= 2;
        v12 = v18;
      }
      while (v18 >= v3 && (v12 > v3 || v14[1] >= v4));
    }
    while (v13 < v14);
  }
  if (v13 - 2 != a1)
  {
    *a1 = *(v13 - 2);
    a1[1] = *(v13 - 1);
  }
  *(v13 - 2) = v3;
  *(v13 - 1) = v4;
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2)
{
  uint64_t v4;
  _BOOL8 result;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  uint64_t v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;

  v4 = ((char *)a2 - (char *)a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 2);
      v7 = *a1;
      if (v6 < *a1 || v7 >= v6 && *(a2 - 1) < a1[1])
      {
        *a1 = v6;
        *(a2 - 2) = v7;
        v8 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      v9 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a1 + 2, a1 + 4);
      v10 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  do
  {
    v13 = *v9;
    if (*v10 >= *v9 && (v13 < *v10 || v10[1] >= v9[1]))
      goto LABEL_22;
    v14 = *v10;
    v15 = v10[1];
    *v10 = v13;
    v10[1] = v9[1];
    v16 = a1;
    if (v9 == a1)
      goto LABEL_21;
    v17 = v11;
    while (1)
    {
      v18 = (char *)a1 + v17;
      v19 = *(unsigned int *)((char *)a1 + v17 + 8);
      if (v19 <= v14)
        break;
      v20 = *((_DWORD *)v18 + 3);
LABEL_18:
      v9 -= 2;
      *((_DWORD *)v18 + 4) = v19;
      *(unsigned int *)((char *)a1 + v17 + 20) = v20;
      v17 -= 8;
      if (v17 == -16)
      {
        v16 = a1;
        goto LABEL_21;
      }
    }
    if (v19 < v14)
    {
      v16 = v9;
      goto LABEL_21;
    }
    v20 = *(unsigned int *)((char *)a1 + v17 + 12);
    if (v20 > v15)
      goto LABEL_18;
    v16 = (unsigned int *)((char *)a1 + v17 + 16);
LABEL_21:
    *v16 = v14;
    v16[1] = v15;
    if (++v12 == 8)
      return v10 + 2 == a2;
LABEL_22:
    v9 = v10;
    v11 += 8;
    v10 += 2;
  }
  while (v10 != a2);
  return 1;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  if (*a4 < *a3 || v10 >= v9 && a4[1] < a3[1])
  {
    *a3 = v9;
    *a4 = v10;
    v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    v12 = *a3;
    v13 = *a2;
    if (*a3 < *a2 || v13 >= v12 && a3[1] < a2[1])
    {
      *a2 = v12;
      *a3 = v13;
      v14 = a2[1];
      a2[1] = a3[1];
      a3[1] = v14;
      v15 = *a2;
      v16 = *a1;
      if (*a2 < *a1 || v16 >= v15 && a2[1] < a1[1])
      {
        *a1 = v15;
        *a2 = v16;
        v17 = a1[1];
        a1[1] = a2[1];
        a2[1] = v17;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  uint64_t result;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  if (*a5 < *a4 || v12 >= v11 && a5[1] < a4[1])
  {
    *a4 = v11;
    *a5 = v12;
    v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    v14 = *a4;
    v15 = *a3;
    if (*a4 < *a3 || v15 >= v14 && a4[1] < a3[1])
    {
      *a3 = v14;
      *a4 = v15;
      v16 = a3[1];
      a3[1] = a4[1];
      a4[1] = v16;
      v17 = *a3;
      v18 = *a2;
      if (*a3 < *a2 || v18 >= v17 && a3[1] < a2[1])
      {
        *a2 = v17;
        *a3 = v18;
        v19 = a2[1];
        a2[1] = a3[1];
        a3[1] = v19;
        v20 = *a2;
        v21 = *a1;
        if (*a2 < *a1 || v21 >= v20 && a2[1] < a1[1])
        {
          *a1 = v20;
          *a2 = v21;
          v22 = a1[1];
          a1[1] = a2[1];
          a2[1] = v22;
        }
      }
    }
  }
  return result;
}

unsigned int *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *,std::pair<unsigned int,unsigned int> *>(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int *v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) >> 3;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[2 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 2;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        if (*v14 < *a1 || v16 >= v15 && v14[1] < a1[1])
        {
          *v14 = v16;
          *a1 = v15;
          v17 = v14[1];
          v14[1] = a1[1];
          a1[1] = v17;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v18 = (unint64_t)v8 >> 3;
      v19 = a2 - 2;
      do
      {
        v21 = *a1;
        v20 = a1[1];
        v22 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(a1, a4, v18);
        if (v19 == v22)
        {
          *v22 = v21;
          v22[1] = v20;
        }
        else
        {
          *v22 = *v19;
          v22[1] = v19[1];
          *v19 = v21;
          v19[1] = v20;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>((uint64_t)a1, (uint64_t)(v22 + 2), a4, ((char *)(v22 + 2) - (char *)a1) >> 3);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(uint64_t result, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (unsigned int *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[2];
        if (*v8 < v10 || v10 >= *v8 && *(_DWORD *)(result + 8 * v7 + 4) < v8[3])
        {
          v8 += 2;
          v7 = v9;
        }
      }
      v11 = *v8;
      if (*v8 >= *a4 && (*a4 < v11 || v8[1] >= a4[1]))
      {
        v12 = *a4;
        v13 = a4[1];
        *a4 = v11;
        a4[1] = v8[1];
        if (v5 >= v7)
        {
          while (1)
          {
            v15 = 2 * v7;
            v7 = (2 * v7) | 1;
            v14 = (unsigned int *)(result + 8 * v7);
            v16 = v15 + 2;
            if (v16 < a3)
            {
              v17 = v14[2];
              if (*v14 < v17 || v17 >= *v14 && *(_DWORD *)(result + 8 * v7 + 4) < v14[3])
              {
                v14 += 2;
                v7 = v16;
              }
            }
            v18 = *v14;
            if (*v14 < v12 || v18 <= v12 && v14[1] < v13)
              break;
            *v8 = v18;
            v8[1] = v14[1];
            v8 = v14;
            if (v5 < v7)
              goto LABEL_22;
          }
        }
        v14 = v8;
LABEL_22:
        *v14 = v12;
        v14[1] = v13;
      }
    }
  }
  return result;
}

unsigned int *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(unsigned int *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    v7 = v3 + 1;
    result += 2 * v3 + 2;
    v8 = 2 * v3;
    v3 = (2 * v3) | 1;
    v9 = v8 + 2;
    if (v9 < a3)
    {
      v10 = result[2];
      if (*result < v10 || v10 >= *result && v6[2 * v7 + 1] < result[3])
      {
        result += 2;
        v3 = v9;
      }
    }
    *v6 = *result;
    v6[1] = result[1];
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned int,unsigned int> *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (unsigned int *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_DWORD *)(a2 - 8);
    if (*v6 < v8 || v8 >= v7 && *(_DWORD *)(result + 8 * v5 + 4) < *(_DWORD *)(a2 - 4))
    {
      v9 = *(_DWORD *)(a2 - 8);
      v10 = *(_DWORD *)(a2 - 4);
      *(_DWORD *)(a2 - 8) = v7;
      *(_DWORD *)(a2 - 4) = v6[1];
      if (v4 >= 2)
      {
        while (1)
        {
          v12 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v11 = (unsigned int *)(result + 8 * v5);
          v13 = *v11;
          if (*v11 >= v9)
          {
            if (v13 > v9)
              break;
            v14 = *(_DWORD *)(result + 8 * v5 + 4);
            if (v14 >= v10)
              break;
          }
          else
          {
            v14 = v11[1];
          }
          *v6 = v13;
          v6[1] = v14;
          v6 = (unsigned int *)(result + 8 * v5);
          if (v12 <= 1)
            goto LABEL_12;
        }
      }
      v11 = v6;
LABEL_12:
      *v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

char *marisa::grimoire::vector::Vector<marisa::grimoire::trie::Entry>::realloc(uint64_t *a1, uint64_t a2)
{
  char *result;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = (char *)operator new[](16 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (uint64_t *)(a1[1] + 8);
    v7 = result + 8;
    do
    {
      *(v7 - 1) = *(v6 - 1);
      v8 = *v6;
      v6 += 2;
      *v7 = v8;
      v7 += 2;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

uint64_t marisa::grimoire::trie::LoudsTrie::build_current_trie<marisa::grimoire::trie::ReverseKey>(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  __n128 v33;
  uint64_t v34;
  __n128 *v35;
  unint64_t v36;
  __n128 *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unsigned int *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int32 *v57;
  float v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  float *v63;
  float v64;
  _DWORD *v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  uint64_t result;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v75;
  uint64_t v76;
  int v77;
  __n128 v78;
  int v79;
  __int128 v80;
  uint64_t v81[4];
  _OWORD v82[2];
  __int128 v83;
  _OWORD v84[4];

  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 8);
  if (v8)
  {
    v10 = 0;
    v11 = (_DWORD *)(v9 + 16);
    do
    {
      *v11 = v10;
      v11 += 6;
      ++v10;
    }
    while (v8 != v10);
  }
  v12 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::ReverseKey *>(v9, v9 + 24 * v8, 0);
  v13 = 256;
  if (a5 != 1)
    v13 = 1;
  do
  {
    v14 = v13;
    v13 *= 2;
  }
  while (v14 < v12 / *(unsigned int *)(a4 + 8));
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::resize(a1 + 126, v14);
  a1[132] = v14 - 1;
  marisa::grimoire::vector::BitVector::push_back(a1, 1);
  marisa::grimoire::vector::BitVector::push_back(a1, 0);
  v15 = a1 + 78;
  LOBYTE(v84[0]) = 0;
  marisa::grimoire::vector::Vector<char>::push_back(a1 + 78, v84);
  marisa::grimoire::vector::BitVector::push_back(a1 + 52, 0);
  memset(v84, 0, 41);
  v83 = 0u;
  memset(v82, 0, sizeof(v82));
  v80 = 0u;
  memset(v81, 0, 25);
  v78.n128_u64[0] = *(_QWORD *)(a2 + 24) << 32;
  v78.n128_u32[2] = 0;
  std::deque<marisa::grimoire::trie::Range>::push_back(v82, (uint64_t *)&v78);
  v16 = *((_QWORD *)&v83 + 1);
  if (*((_QWORD *)&v83 + 1))
  {
    v72 = a1 + 52;
    v73 = a1 + 78;
    do
    {
      v17 = a1[58];
      v18 = (unsigned int *)(*(_QWORD *)(*((_QWORD *)&v82[0] + 1) + 8 * ((unint64_t)v83 / 0x155))
                           + 12 * ((unint64_t)v83 % 0x155));
      v19 = *v18;
      v20 = v18[1];
      v21 = v18[2];
      *(_QWORD *)&v83 = v83 + 1;
      *((_QWORD *)&v83 + 1) = v16 - 1;
      if ((unint64_t)v83 >= 0x2AA)
      {
        v22 = v17;
        v23 = v16;
        operator delete(**((void ***)&v82[0] + 1));
        v16 = v23;
        v17 = v22;
        *((_QWORD *)&v82[0] + 1) += 8;
        *(_QWORD *)&v83 = v83 - 341;
      }
      if (v19 < v20)
      {
        while (1)
        {
          v24 = *(_QWORD *)(a2 + 8);
          if (*(_DWORD *)(v24 + 24 * v19 + 8) != (_DWORD)v21)
            break;
          *(_DWORD *)(v24 + 24 * v19 + 12) = v17 - v16;
          v19 = (v19 + 1);
          if ((_DWORD)v20 == (_DWORD)v19)
            goto LABEL_49;
        }
      }
      if ((_DWORD)v19 != (_DWORD)v20)
      {
        v76 = v16;
        v77 = v17 - v16;
        v25 = v80;
        v80 = 0u;
        memset(v81, 0, 25);
        if (v25)
          MEMORY[0x20BD185D8](v25, 0x1000C8077774924);
        v75 = v17;
        v26 = *(_QWORD *)(a2 + 8);
        v27 = *(float *)(v26 + 24 * v19 + 12);
        v28 = v19 + 1;
        if (v19 + 1 < v20)
        {
          v29 = 24 * v19;
          v30 = (v19 << 32) + 0x100000000;
          do
          {
            if (*(unsigned __int8 *)(*(_QWORD *)(v26 + v29) - v21 - 1) != *(unsigned __int8 *)(*(_QWORD *)(v26 + v29 + 24)
                                                                                              - v21
                                                                                              - 1))
            {
              *(float *)&v31 = v27;
              v78.n128_u64[0] = v30 + v19;
              v78.n128_u64[1] = v21 | ((unint64_t)v31 << 32);
              marisa::grimoire::vector::Vector<marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
              v26 = *(_QWORD *)(a2 + 8);
              v27 = 0.0;
              LODWORD(v19) = v28;
            }
            v27 = v27 + *(float *)(v26 + v29 + 36);
            ++v28;
            v29 += 24;
            v30 += 0x100000000;
          }
          while (v20 != v28);
        }
        *(float *)&v32 = v27;
        v78.n128_u32[0] = v19;
        v78.n128_u32[1] = v20;
        v78.n128_u64[1] = v21 | ((unint64_t)v32 << 32);
        v33 = marisa::grimoire::vector::Vector<marisa::grimoire::trie::WeightedRange>::push_back((uint64_t *)&v80, &v78);
        v15 = a1 + 78;
        v34 = v76;
        if (*(_DWORD *)(a4 + 16) == 0x20000)
        {
          v35 = (__n128 *)*((_QWORD *)&v80 + 1);
          v36 = v81[1];
          if (v81[1] < 129)
          {
            v37 = 0;
            v39 = 0;
          }
          else
          {
            v37 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<marisa::grimoire::trie::WeightedRange>(v81[1]);
            v39 = v38;
          }
          std::__stable_sort<std::_ClassicAlgPolicy,std::greater<marisa::grimoire::trie::WeightedRange> &,marisa::grimoire::trie::WeightedRange*>(v35, &v35[v36], (uint64_t)&v78, v36, v37, v39, v33);
          if (v37)
            operator delete(v37);
          v34 = v76;
        }
        v40 = v81[1];
        if (v75 == v34)
          a1[133] = v81[1];
        if (v40)
        {
          v41 = 0;
          do
          {
            v42 = (unsigned int *)(*((_QWORD *)&v80 + 1) + 16 * v41);
            v43 = (uint64_t *)v42;
            v44 = v42[2];
            v45 = *(_QWORD *)(a2 + 8);
            v46 = *(unsigned int *)(v45 + 24 * *v42 + 8);
            v47 = v44 + 1;
            if (v44 + 1 >= v46)
            {
              v48 = v42[2];
              LODWORD(v46) = v44 + 1;
            }
            else
            {
              v48 = v46 - 1;
              v49 = (uint64_t *)(v45 + 24 * *v42);
              v50 = v42[2];
              do
              {
                v51 = v50;
                v50 = v47;
                v52 = v49;
                v53 = *v42;
                while (++v53 < (unint64_t)v42[1])
                {
                  v54 = *v52;
                  v55 = v52[3];
                  v52 += 3;
                  if (*(unsigned __int8 *)(v54 + ~v51 - 1) != *(unsigned __int8 *)(v55 + ~v51 - 1))
                  {
                    v48 = v51;
                    LODWORD(v46) = v47;
                    goto LABEL_43;
                  }
                }
                ++v47;
              }
              while (v50 + 1 != v46);
            }
LABEL_43:
            v56 = a1[81];
            v58 = *((float *)v42 + 3);
            v57 = v42 + 3;
            v59 = v58;
            v60 = a1[132] & v56;
            v61 = a1[127];
            v62 = v61 + 12 * v60;
            v64 = *(float *)(v62 + 8);
            v63 = (float *)(v62 + 8);
            if (v64 < v59)
            {
              v65 = (_DWORD *)(v61 + 12 * v60);
              *v65 = v77;
              v65[1] = v56;
              *v63 = v59;
              v44 = *((unsigned int *)v43 + 2);
            }
            if (v48 == v44)
            {
              v78.n128_u8[0] = *(_BYTE *)(~v48 + *(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v43));
              marisa::grimoire::vector::Vector<char>::push_back(v73, &v78);
              marisa::grimoire::vector::BitVector::push_back(v72, 0);
            }
            else
            {
              v78.n128_u8[0] = 0;
              marisa::grimoire::vector::Vector<char>::push_back(v73, &v78);
              marisa::grimoire::vector::BitVector::push_back(v72, 1);
              v78 = 0uLL;
              v79 = 0;
              v66 = *((unsigned int *)v43 + 2);
              v78.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(a2 + 8) + 24 * *(unsigned int *)v43) - v66;
              v78.n128_u64[1] = (v46 - v66);
              v78.n128_u32[3] = *v57;
              marisa::grimoire::vector::Vector<marisa::grimoire::trie::Key>::push_back((uint64_t *)v84, (uint64_t)&v78);
            }
            *((_DWORD *)v43 + 2) = v46;
            std::deque<marisa::grimoire::trie::Range>::push_back(v82, v43);
            marisa::grimoire::vector::BitVector::push_back(a1, 1);
            ++v41;
          }
          while (v41 < v81[1]);
        }
      }
LABEL_49:
      marisa::grimoire::vector::BitVector::push_back(a1, 0);
      v16 = *((_QWORD *)&v83 + 1);
    }
    while (*((_QWORD *)&v83 + 1));
  }
  marisa::grimoire::vector::BitVector::push_back(a1, 0);
  marisa::grimoire::vector::BitVector::build((marisa::grimoire::vector::BitVector *)a1, a5 == 1, 1);
  marisa::grimoire::vector::Vector<unsigned char>::shrink(v15);
  marisa::grimoire::trie::LoudsTrie::build_terminals<marisa::grimoire::trie::Key>((uint64_t)a1, a2, a3);
  v67 = *(_OWORD *)a2;
  *(_OWORD *)a2 = v84[0];
  v84[0] = v67;
  v68 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = *(_QWORD *)&v84[1];
  *(_QWORD *)&v84[1] = v68;
  v69 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)((char *)&v84[1] + 8);
  *(_OWORD *)((char *)&v84[1] + 8) = v69;
  LOBYTE(v68) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a2 + 40) = BYTE8(v84[2]);
  BYTE8(v84[2]) = v68;
  if ((_QWORD)v80)
    MEMORY[0x20BD185D8](v80, 0x1000C8077774924);
  std::deque<marisa::grimoire::trie::Range>::~deque[abi:ne180100](v82);
  result = *(_QWORD *)&v84[0];
  if (*(_QWORD *)&v84[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v84[0], 0x1000C8077774924);
  return result;
}

void sub_209CAA060(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v27;
  uint64_t v30;
  _QWORD *exception;

  if (a21)
    MEMORY[0x20BD185D8](a21, 0x1000C8077774924);
  std::deque<marisa::grimoire::trie::Range>::~deque[abi:ne180100](&a27);
  v30 = *(_QWORD *)(v27 - 144);
  if (v30)
    MEMORY[0x20BD185D8](v30, 0x1000C8077774924);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
    exception[2] = 0x8000001ACLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:428: MARISA_MEMOR"
                   "Y_ERROR: std::bad_alloc";
  }
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::ReverseKey *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v4 = a2;
  v5 = a1;
  v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 241)
  {
    v7 = 0;
    goto LABEL_69;
  }
  v7 = 0;
  do
  {
    v8 = marisa::grimoire::algorithm::details::median<marisa::grimoire::trie::ReverseKey>(v5, v5 + 24 * (v6 / 0x30uLL), v4 - 24, a3);
    v9 = v8;
    v10 = v5;
    v11 = v4;
    v12 = v5;
    v13 = v4;
    while (v10 < v11)
    {
      v14 = *(unsigned int *)(v10 + 8);
      v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(_QWORD *)v10 - a3 - 1);
      if (v15 > v8)
        break;
      if (v15 == v8)
      {
        v16 = *(_QWORD *)v10;
        *(_QWORD *)v10 = *(_QWORD *)v12;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(v12 + 8);
        v17 = *(_QWORD *)(v10 + 12);
        *(_DWORD *)(v10 + 12) = *(_DWORD *)(v12 + 12);
        *(_DWORD *)(v10 + 16) = *(_DWORD *)(v12 + 16);
        *(_QWORD *)v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(_QWORD *)(v12 + 12) = v17;
        v12 += 24;
      }
LABEL_11:
      v10 += 24;
    }
    if (v10 < v11)
    {
      v18 = v11 - 24;
      do
      {
        v11 = v18;
        v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19)
          v20 = -1;
        else
          v20 = *(unsigned __int8 *)(*(_QWORD *)v11 - a3 - 1);
        if (v20 < v8)
          break;
        if (v20 == v8)
        {
          v21 = *(_QWORD *)(v13 - 24);
          v13 -= 24;
          v22 = *(_QWORD *)v11;
          *(_QWORD *)v11 = v21;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)(v13 + 8);
          v23 = *(_QWORD *)(v11 + 12);
          *(_DWORD *)(v11 + 12) = *(_DWORD *)(v13 + 12);
          *(_DWORD *)(v11 + 16) = *(_DWORD *)(v13 + 16);
          *(_QWORD *)v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(_QWORD *)(v13 + 12) = v23;
        }
        v18 = v11 - 24;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      v24 = *(_QWORD *)v10;
      v25 = *(_DWORD *)(v10 + 16);
      *(_QWORD *)v10 = *(_QWORD *)v11;
      v26 = *(_QWORD *)(v10 + 8);
      *(_DWORD *)(v10 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v10 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v10 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v24;
      *(_QWORD *)(v11 + 8) = v26;
      *(_DWORD *)(v11 + 16) = v25;
      goto LABEL_11;
    }
    v44 = v7;
    if (v12 > v5)
    {
      v27 = 0;
      do
      {
        v28 = v12 + v27;
        v29 = v10 + v27;
        v30 = *(_QWORD *)(v12 + v27 - 24);
        v31 = *(_DWORD *)(v12 + v27 - 8);
        *(_QWORD *)(v28 - 24) = *(_QWORD *)(v10 + v27 - 24);
        v32 = *(_QWORD *)(v12 + v27 - 16);
        *(_DWORD *)(v28 - 16) = *(_DWORD *)(v10 + v27 - 16);
        *(_DWORD *)(v28 - 12) = *(_DWORD *)(v10 + v27 - 12);
        *(_DWORD *)(v28 - 8) = *(_DWORD *)(v10 + v27 - 8);
        *(_QWORD *)(v29 - 24) = v30;
        *(_QWORD *)(v29 - 16) = v32;
        *(_DWORD *)(v29 - 8) = v31;
        v27 -= 24;
      }
      while (v12 + v27 > v5);
      v10 += v27;
    }
    while (v13 < v4)
    {
      v33 = *(_QWORD *)v13;
      v34 = *(_DWORD *)(v13 + 16);
      *(_QWORD *)v13 = *(_QWORD *)v11;
      v35 = *(_QWORD *)(v13 + 8);
      *(_DWORD *)(v13 + 8) = *(_DWORD *)(v11 + 8);
      *(_DWORD *)(v13 + 12) = *(_DWORD *)(v11 + 12);
      *(_DWORD *)(v13 + 16) = *(_DWORD *)(v11 + 16);
      *(_QWORD *)v11 = v33;
      *(_QWORD *)(v11 + 8) = v35;
      *(_DWORD *)(v11 + 16) = v34;
      v11 += 24;
      v13 += 24;
    }
    v36 = v10 - v5;
    v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v5) >> 3);
    v38 = v11 - v10;
    v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v10) >> 3);
    if (v37 <= v39)
    {
      v40 = v4 - v11;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)) <= v39)
      {
        if (v36 == 24)
        {
          v41 = v44 + 1;
        }
        else
        {
          if (v36 < 25)
            goto LABEL_53;
          v41 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::ReverseKey *>(v5, v10, a3) + v44;
        }
        v44 = v41;
LABEL_53:
        if (v40 == 24)
        {
          v7 = v44 + 1;
        }
        else if (v40 < 25)
        {
          v7 = v44;
        }
        else
        {
          v7 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::ReverseKey *>(v11, v4, a3) + v44;
        }
        if (v38 == 24)
        {
          ++v7;
        }
        else if (v38 >= 25)
        {
          if (v9 == -1)
          {
            ++v7;
            v5 = v11;
            goto LABEL_64;
          }
          ++a3;
        }
        v5 = v10;
LABEL_64:
        v4 = v11;
        goto LABEL_65;
      }
    }
    if (v38 == 24)
      goto LABEL_32;
    if (v38 < 25)
    {
      v7 = v44;
    }
    else if (v8 == -1)
    {
LABEL_32:
      v7 = v44 + 1;
    }
    else
    {
      v7 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::ReverseKey *>(v10, v11, a3 + 1) + v44;
    }
    v42 = v4 - v11;
    if (v37 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v11) >> 3)))
    {
      if (v42 == 24)
      {
        ++v7;
      }
      else if (v42 >= 25)
      {
        v7 += marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::ReverseKey *>(v11, v4, a3);
      }
      v4 = v10;
    }
    else
    {
      if (v36 == 24)
      {
        ++v7;
      }
      else if (v36 >= 25)
      {
        v7 += marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::ReverseKey *>(v5, v10, a3);
      }
      v5 = v11;
    }
LABEL_65:
    v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 240);
LABEL_69:
  if (v6 >= 25)
    v7 += marisa::grimoire::algorithm::details::insertion_sort<marisa::grimoire::trie::ReverseKey *>(v5, v4, a3);
  return v7;
}

uint64_t marisa::grimoire::algorithm::details::median<marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (*(unsigned int *)(a1 + 8) <= a4)
    v4 = -1;
  else
    v4 = *(unsigned __int8 *)(~a4 + *(_QWORD *)a1);
  if (*(unsigned int *)(a2 + 8) <= a4)
    v5 = -1;
  else
    v5 = *(unsigned __int8 *)(~a4 + *(_QWORD *)a2);
  if (*(unsigned int *)(a3 + 8) <= a4)
    v6 = -1;
  else
    v6 = *(unsigned __int8 *)(~a4 + *(_QWORD *)a3);
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  if (v4 >= v5)
    v4 = v5;
  if (v4 <= v6)
    v4 = v6;
  if (v7 >= v6)
    return v4;
  else
    return v7;
}

uint64_t marisa::grimoire::algorithm::details::insertion_sort<marisa::grimoire::trie::ReverseKey *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1 + 24;
  if (a1 + 24 >= a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v3;
    if (v3 <= a1)
    {
      v10 = 0;
    }
    else
    {
      while (1)
      {
        v9 = v8 - 24;
        v10 = marisa::grimoire::algorithm::details::compare<marisa::grimoire::trie::ReverseKey>(v8 - 24, v8, a3);
        if (v10 < 1)
          break;
        v11 = *(_QWORD *)(v8 - 24);
        v12 = *(_DWORD *)(v8 - 8);
        *(_QWORD *)(v8 - 24) = *(_QWORD *)v8;
        v13 = *(_QWORD *)(v8 + 8);
        *(_DWORD *)(v8 - 8) = *(_DWORD *)(v8 + 16);
        *(_QWORD *)v8 = v11;
        v14 = *(_QWORD *)(v8 - 16);
        *(_QWORD *)(v8 - 16) = v13;
        *(_QWORD *)(v8 + 8) = v14;
        *(_DWORD *)(v8 + 16) = v12;
        v8 -= 24;
        if (v9 <= a1)
        {
          v10 = 1;
          break;
        }
      }
    }
    if (v10)
      ++v7;
    v3 += 24;
  }
  while (v3 < a2);
  return v7;
}

uint64_t marisa::grimoire::algorithm::details::compare<marisa::grimoire::trie::ReverseKey>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  uint64_t result;
  unsigned int v12;

  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(unsigned int *)(a2 + 8);
  v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4)
      v12 = -1;
    else
      v12 = 1;
    if ((_DWORD)v3 == (_DWORD)v4)
      return 0;
    else
      return v12;
  }
  else
  {
    v6 = v4 - a3;
    v7 = (unsigned __int8 *)(*(_QWORD *)a2 + ~a3);
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 + ~a3);
    while (v6)
    {
      v9 = *v8;
      v10 = *v7;
      result = (v9 - v10);
      if (v9 != v10)
        return result;
      --v6;
      --v7;
      --v8;
      if (!--v5)
        goto LABEL_6;
    }
    return 1;
  }
}

char *marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::realloc(uint64_t *a1, uint64_t a2)
{
  char *result;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  int v8;
  uint64_t v9;

  result = (char *)operator new[](12 * a2, MEMORY[0x24BEDB6B8]);
  v5 = a1[3];
  if (v5)
  {
    v6 = (_DWORD *)(a1[1] + 8);
    v7 = result + 8;
    do
    {
      *((_QWORD *)v7 - 1) = *((_QWORD *)v6 - 1);
      v8 = *v6;
      v6 += 3;
      *v7 = v8;
      v7 += 3;
      --v5;
    }
    while (v5);
  }
  v9 = *a1;
  *a1 = (uint64_t)result;
  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)result;
  a1[4] = a2;
  if (v9)
    JUMPOUT(0x20BD185D8);
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4;

  v4 = *(_QWORD *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  *(_QWORD *)(a1 + 16) = marisa::grimoire::io::Mapper::map_data(this, v4);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(_QWORD *)(a1 + 24) = v4;
  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::read_(uint64_t a1, marisa::grimoire::io::Reader *this)
{
  size_t v4;
  size_t v6;

  v6 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)this, (char *)&v6, 8uLL);
  v4 = v6;
  marisa::grimoire::vector::Vector<char>::resize((uint64_t *)a1, v6);
  marisa::grimoire::io::Reader::read<unsigned char>((uint64_t)this, *(char **)(a1 + 8), v4);
  return marisa::grimoire::io::Reader::seek((uint64_t)this, -(int)v6 & 7);
}

uint64_t marisa::grimoire::io::Reader::read<unsigned char>(uint64_t a1, char *a2, size_t a3)
{
  _QWORD *exception;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h";
    exception[2] = 0x20000001FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/reader.h:31: MARISA_NULL_"
                   "ERROR: (objs == NULL) && (num_objs != 0)";
  }
  return marisa::grimoire::io::Reader::read_data(a1, a2, a3);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::read_(uint64_t a1, marisa::grimoire::io::Reader *this)
{
  unint64_t v4;
  _QWORD *exception;
  unint64_t v7;

  v7 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)this, (char *)&v7, 8uLL);
  v4 = v7 / 0xC;
  if (v7 % 0xC)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000D5;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:213: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::resize((uint64_t *)a1, v7 / 0xC);
  marisa::grimoire::io::Reader::read<marisa::grimoire::vector::RankIndex>((uint64_t)this, *(char **)(a1 + 8), v4);
  return marisa::grimoire::io::Reader::seek((uint64_t)this, -(int)v7 & 7);
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::write_(uint64_t a1, marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = *(_QWORD *)(a1 + 24);
  marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  marisa::grimoire::io::Writer::write<unsigned char>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return marisa::grimoire::io::Writer::seek((uint64_t)this, -*(_DWORD *)(a1 + 24) & 7);
}

uint64_t marisa::grimoire::io::Writer::write<unsigned char>(uint64_t a1, char *a2, size_t a3)
{
  _QWORD *exception;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h";
    exception[2] = 0x20000001ELL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/writer.h:30: MARISA_NULL_"
                   "ERROR: (objs == NULL) && (num_objs != 0)";
  }
  return marisa::grimoire::io::Writer::write_data(a1, a2, a3);
}

double marisa::Keyset::Keyset(marisa::Keyset *this)
{
  double result;

  *((_QWORD *)this + 12) = 0;
  result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

{
  double result;

  *((_QWORD *)this + 12) = 0;
  result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

size_t marisa::Keyset::push_back(size_t *a1, uint64_t a2)
{
  size_t result;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  size_t v9;

  result = marisa::Keyset::reserve(a1, *(unsigned int *)(a2 + 8));
  if (*(_DWORD *)(a2 + 8))
  {
    v5 = 0;
    do
    {
      *(_BYTE *)(result + v5) = *(_BYTE *)(*(_QWORD *)a2 + v5);
      ++v5;
      v6 = *(unsigned int *)(a2 + 8);
    }
    while (v5 < v6);
    v7 = *(_DWORD *)(a2 + 8);
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = *(_QWORD *)(a1[6] + ((a1[11] >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * a1[11];
  *(_QWORD *)v8 = result;
  *(_DWORD *)(v8 + 8) = v7;
  *(_DWORD *)(v8 + 12) = *(_DWORD *)(a2 + 12);
  v9 = a1[12] + v6;
  ++a1[11];
  a1[12] = v9;
  return result;
}

size_t marisa::Keyset::reserve(size_t *this, size_t __sz)
{
  size_t result;
  size_t v5;

  if (this[7] == this[11] >> 8)
    marisa::Keyset::append_key_block((marisa::Keyset *)this);
  if (__sz < 0x401)
  {
    v5 = this[10];
    if (v5 < __sz)
    {
      marisa::Keyset::append_base_block((uint64_t *)this);
      v5 = this[10];
    }
    result = this[9];
    this[9] = result + __sz;
    this[10] = v5 - __sz;
  }
  else
  {
    marisa::Keyset::append_extra_block((marisa::Keyset *)this, __sz);
    return *(_QWORD *)(this[3] + 8 * this[4] - 8);
  }
  return result;
}

size_t marisa::Keyset::push_back(marisa::Keyset *this, uint64_t a2, char a3)
{
  size_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (*((_QWORD *)this + 7) == *((_QWORD *)this + 11) >> 8)
    marisa::Keyset::append_key_block(this);
  result = marisa::Keyset::reserve((size_t *)this, *(unsigned int *)(a2 + 8) + 1);
  if (*(_DWORD *)(a2 + 8))
  {
    v7 = 0;
    do
    {
      *(_BYTE *)(result + v7) = *(_BYTE *)(*(_QWORD *)a2 + v7);
      ++v7;
      v8 = *(unsigned int *)(a2 + 8);
    }
    while (v7 < v8);
  }
  else
  {
    v8 = 0;
  }
  *(_BYTE *)(result + v8) = a3;
  v9 = *(_QWORD *)(*((_QWORD *)this + 6) + ((*((_QWORD *)this + 11) >> 5) & 0x7FFFFFFFFFFFFF8))
     + 16 * *((_QWORD *)this + 11);
  v10 = *(unsigned int *)(a2 + 8);
  *(_QWORD *)v9 = result;
  *(_DWORD *)(v9 + 8) = v10;
  *(_DWORD *)(v9 + 12) = *(_DWORD *)(a2 + 12);
  v11 = *((_QWORD *)this + 12) + v10;
  ++*((_QWORD *)this + 11);
  *((_QWORD *)this + 12) = v11;
  return result;
}

uint64_t marisa::Keyset::append_key_block(marisa::Keyset *this)
{
  uint64_t v2;
  unint64_t v3;
  _BOOL4 v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;
  _QWORD *exception;
  uint64_t v20;

  v2 = *((_QWORD *)this + 7);
  if (v2 == *((_QWORD *)this + 8))
  {
    if (v2)
      v3 = 2 * v2;
    else
      v3 = 1;
    v4 = v3 >> 61 != 0;
    if (8 * v3 >= 0xFFFFFFFFFFFFFFF0)
      v4 = 1;
    if (v4)
      v5 = -1;
    else
      v5 = 8 * v3 + 16;
    v6 = operator new[](v5, MEMORY[0x24BEDB6B8]);
    if (!v6)
    {
      v20 = 0;
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
      exception[2] = 0x8000000A9;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:169: MARISA_MEMORY_ERROR: new_blo"
                     "cks.get() == NULL";
    }
    *v6 = 8;
    v6[1] = v3;
    v7 = (uint64_t)(v6 + 2);
    if (v3)
      bzero(v6 + 2, 8 * v3);
    v20 = v7;
    if (v2)
    {
      for (i = 0; i != v2; ++i)
      {
        v9 = *((_QWORD *)this + 6);
        v10 = v20;
        v11 = *(_QWORD *)(v9 + 8 * i);
        *(_QWORD *)(v9 + 8 * i) = *(_QWORD *)(v20 + 8 * i);
        *(_QWORD *)(v10 + 8 * i) = v11;
      }
      v7 = v20;
    }
    v12 = *((_QWORD *)this + 6);
    *((_QWORD *)this + 6) = v7;
    v20 = v12;
    *((_QWORD *)this + 8) = v3;
    marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array(&v20);
  }
  v13 = operator new[](0x1000uLL, MEMORY[0x24BEDB6B8]);
  if (!v13)
  {
    v18 = __cxa_allocate_exception(0x20uLL);
    *v18 = &unk_24C2545B8;
    v18[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
    v18[2] = 0x8000000B1;
    v18[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:177: MARISA_MEMORY_ERROR: new_block.get() == NULL";
  }
  v14 = v13;
  bzero(v13, 0x1000uLL);
  v16 = *((_QWORD *)this + 6);
  v15 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = v15 + 1;
  result = *(_QWORD *)(v16 + 8 * v15);
  *(_QWORD *)(v16 + 8 * v15) = v14;
  if (result)
    return MEMORY[0x20BD185D8](result, 0x1050C80717B85FCLL);
  return result;
}

void sub_209CAAF08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array((uint64_t *)va);
  _Unwind_Resume(a1);
}

size_t marisa::Keyset::push_back(size_t *this, const char *a2)
{
  uint64_t v2;
  _QWORD *exception;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
    exception[2] = 0x200000032;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:50: MARISA_NULL_ERROR: str == NULL";
  }
  v2 = 0;
  while (a2[v2++])
    ;
  return marisa::Keyset::push_back(this, a2, v2 - 1, 1.0);
}

size_t marisa::Keyset::push_back(size_t *this, const char *a2, size_t __sz, float a4)
{
  const char *v6;
  size_t result;
  _BYTE *v9;
  size_t v10;
  char v11;
  uint64_t v12;
  size_t v13;
  _QWORD *exception;
  const char *v15;

  v6 = a2;
  if (!a2 && __sz)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
    exception[2] = 0x20000003DLL;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:61: MARISA_NULL_ERROR: (ptr == NULL) && (length != 0)";
    goto LABEL_10;
  }
  if (HIDWORD(__sz))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
    exception[2] = 0x70000003ELL;
    v15 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:62: MARISA_SIZE_ERROR: length > MARISA_UINT32_MAX";
LABEL_10:
    exception[3] = v15;
  }
  result = marisa::Keyset::reserve(this, __sz);
  if (__sz)
  {
    v9 = (_BYTE *)result;
    v10 = __sz;
    do
    {
      v11 = *v6++;
      *v9++ = v11;
      --v10;
    }
    while (v10);
  }
  v12 = *(_QWORD *)(this[6] + ((this[11] >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * this[11];
  *(_QWORD *)v12 = result;
  *(_DWORD *)(v12 + 8) = __sz;
  *(float *)(v12 + 12) = a4;
  v13 = this[12] + __sz;
  ++this[11];
  this[12] = v13;
  return result;
}

double marisa::Keyset::reset(marisa::Keyset *this)
{
  double result;

  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 4) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  return result;
}

uint64_t *marisa::Keyset::clear(marisa::Keyset *this)
{
  _OWORD v2[3];
  _OWORD v3[3];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  memset(v2, 0, sizeof(v2));
  marisa::Keyset::swap((uint64_t *)v2, this);
  marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array((uint64_t *)v3);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)&v2[1] + 1);
  return marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)v2);
}

uint64_t *marisa::Keyset::swap(uint64_t *this, marisa::Keyset *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *this;
  v3 = this[1];
  v4 = *((_QWORD *)a2 + 1);
  *this = *(_QWORD *)a2;
  this[1] = v4;
  *(_QWORD *)a2 = v2;
  *((_QWORD *)a2 + 1) = v3;
  v5 = this[2];
  v6 = this[3];
  v7 = *((_QWORD *)a2 + 3);
  this[2] = *((_QWORD *)a2 + 2);
  this[3] = v7;
  *((_QWORD *)a2 + 2) = v5;
  *((_QWORD *)a2 + 3) = v6;
  v8 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v8;
  v9 = this[5];
  v10 = this[6];
  v11 = *((_QWORD *)a2 + 6);
  this[5] = *((_QWORD *)a2 + 5);
  this[6] = v11;
  *((_QWORD *)a2 + 5) = v9;
  *((_QWORD *)a2 + 6) = v10;
  v12 = this[7];
  this[7] = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v12;
  v13 = this[8];
  v14 = this[9];
  v15 = *((_QWORD *)a2 + 9);
  this[8] = *((_QWORD *)a2 + 8);
  this[9] = v15;
  *((_QWORD *)a2 + 8) = v13;
  *((_QWORD *)a2 + 9) = v14;
  v16 = this[10];
  this[10] = *((_QWORD *)a2 + 10);
  *((_QWORD *)a2 + 10) = v16;
  v17 = this[11];
  this[11] = *((_QWORD *)a2 + 11);
  *((_QWORD *)a2 + 11) = v17;
  v18 = this[12];
  this[12] = *((_QWORD *)a2 + 12);
  *((_QWORD *)a2 + 12) = v18;
  return this;
}

void *marisa::Keyset::append_extra_block(marisa::Keyset *this, size_t __sz)
{
  uint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  size_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *exception;
  uint64_t v21;

  v4 = *((_QWORD *)this + 4);
  if (v4 == *((_QWORD *)this + 5))
  {
    if (v4)
      v5 = 2 * v4;
    else
      v5 = 1;
    v6 = v5 >> 61 != 0;
    if (8 * v5 >= 0xFFFFFFFFFFFFFFF0)
      v6 = 1;
    if (v6)
      v7 = -1;
    else
      v7 = 8 * v5 + 16;
    v8 = operator new[](v7, MEMORY[0x24BEDB6B8]);
    if (!v8)
    {
      v21 = 0;
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
      exception[2] = 0x800000097;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:151: MARISA_MEMORY_ERROR: new_blo"
                     "cks.get() == NULL";
    }
    *v8 = 8;
    v8[1] = v5;
    v9 = (uint64_t)(v8 + 2);
    if (v5)
      bzero(v8 + 2, 8 * v5);
    v21 = v9;
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        v11 = *((_QWORD *)this + 3);
        v12 = v21;
        v13 = *(_QWORD *)(v11 + 8 * i);
        *(_QWORD *)(v11 + 8 * i) = *(_QWORD *)(v21 + 8 * i);
        *(_QWORD *)(v12 + 8 * i) = v13;
      }
      v9 = v21;
    }
    v14 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v9;
    v21 = v14;
    *((_QWORD *)this + 5) = v5;
    marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(&v21);
  }
  result = operator new[](__sz, MEMORY[0x24BEDB6B8]);
  if (!result)
  {
    v19 = __cxa_allocate_exception(0x20uLL);
    *v19 = &unk_24C2545B8;
    v19[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
    v19[2] = 0x80000009FLL;
    v19[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:159: MARISA_MEMORY_ERROR: new_block.get() == NULL";
  }
  v17 = *((_QWORD *)this + 3);
  v16 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = v16 + 1;
  v18 = *(_QWORD *)(v17 + 8 * v16);
  *(_QWORD *)(v17 + 8 * v16) = result;
  if (v18)
    return (void *)MEMORY[0x20BD185D8](v18, 0x1000C8077774924);
  return result;
}

void sub_209CAB394(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *marisa::Keyset::append_base_block(uint64_t *this)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  _BOOL4 v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *exception;
  _QWORD *v15;
  uint64_t v16;

  v1 = this;
  v2 = this[1];
  if (v2 == this[2])
  {
    if (v2)
      v3 = 2 * v2;
    else
      v3 = 1;
    v4 = v3 >> 61 != 0;
    if (8 * v3 >= 0xFFFFFFFFFFFFFFF0)
      v4 = 1;
    if (v4)
      v5 = -1;
    else
      v5 = 8 * v3 + 16;
    v6 = operator new[](v5, MEMORY[0x24BEDB6B8]);
    if (!v6)
    {
      v16 = 0;
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
      exception[2] = 0x800000081;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:129: MARISA_MEMORY_ERROR: new_blo"
                     "cks.get() == NULL";
    }
    *v6 = 8;
    v6[1] = v3;
    v7 = (uint64_t)(v6 + 2);
    if (v3)
      bzero(v6 + 2, 8 * v3);
    v16 = v7;
    if (v2)
    {
      for (i = 0; i != v2; ++i)
      {
        v9 = v16;
        v10 = *(_QWORD *)(*v1 + 8 * i);
        *(_QWORD *)(*v1 + 8 * i) = *(_QWORD *)(v16 + 8 * i);
        *(_QWORD *)(v9 + 8 * i) = v10;
      }
      v7 = v16;
    }
    v11 = *v1;
    *v1 = v7;
    v16 = v11;
    v1[2] = v3;
    this = marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(&v16);
    v2 = v1[1];
  }
  v12 = *v1;
  v13 = *(_QWORD *)(*v1 + 8 * v2);
  if (!v13)
  {
    this = (uint64_t *)operator new[](0x1000uLL, MEMORY[0x24BEDB6B8]);
    if (!this)
    {
      v15 = __cxa_allocate_exception(0x20uLL);
      *v15 = &unk_24C2545B8;
      v15[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc";
      v15[2] = 0x80000008ALL;
      v15[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/keyset.cc:138: MARISA_MEMORY_ERROR: new_block.get() == NULL";
    }
    *(_QWORD *)(v12 + 8 * v2) = this;
    v13 = *(_QWORD *)(*v1 + 8 * v2);
  }
  v1[1] = v2 + 1;
  v1[9] = v13;
  v1[10] = 4096;
  return this;
}

void sub_209CAB56C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if (*a1)
  {
    v5 = *(_QWORD *)(v2 - 8);
    v4 = v2 - 8;
    v3 = v5;
    if (v5)
    {
      v6 = 8 * v3;
      do
      {
        v7 = *(_QWORD *)(v4 + v6);
        if (v7)
          MEMORY[0x20BD185D8](v7, 0x1000C8077774924);
        v6 -= 8;
      }
      while (v6);
    }
    MEMORY[0x20BD185D8](v4 - 8, 0x10C80436913F5);
  }
  return a1;
}

uint64_t *marisa::scoped_array<marisa::scoped_array<marisa::Key>>::~scoped_array(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if (*a1)
  {
    v5 = *(_QWORD *)(v2 - 8);
    v4 = v2 - 8;
    v3 = v5;
    if (v5)
    {
      v6 = 8 * v3;
      do
      {
        v7 = *(_QWORD *)(v4 + v6);
        if (v7)
          MEMORY[0x20BD185D8](v7, 0x1050C80717B85FCLL);
        v6 -= 8;
      }
      while (v6);
    }
    MEMORY[0x20BD185D8](v4 - 8, 0x20C8093837F09);
  }
  return a1;
}

_QWORD *marisa::Trie::Trie(_QWORD *this)
{
  *this = 0;
  return this;
}

{
  *this = 0;
  return this;
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::build(marisa::grimoire::trie::LoudsTrie **this, marisa::Keyset *a2, unsigned int a3)
{
  marisa::grimoire::trie::LoudsTrie *v6;
  marisa::grimoire::trie::LoudsTrie *v7;
  marisa::grimoire::trie::LoudsTrie *v8;
  _QWORD *exception;
  marisa::grimoire::trie::LoudsTrie *v11;

  v6 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v6)
  {
    v11 = 0;
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x80000000ELL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:14: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v7 = v6;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v6);
  v11 = v7;
  marisa::grimoire::trie::LoudsTrie::build(v7, a2, a3);
  v8 = *this;
  *this = v7;
  v11 = v8;
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v11);
}

void sub_209CAB760(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD185F0](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::mmap(marisa::grimoire::trie::LoudsTrie **this, const char *a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  _QWORD *exception;
  _QWORD *v9;
  _BYTE v10[40];
  marisa::grimoire::trie::LoudsTrie *v11;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x200000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:21: MARISA_NULL_ERROR: filename == NULL";
  }
  v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v4)
  {
    v11 = 0;
    v9 = __cxa_allocate_exception(0x20uLL);
    *v9 = &unk_24C2545B8;
    v9[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v9[2] = 0x800000018;
    v9[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:24: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v5 = v4;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
  v11 = v5;
  marisa::grimoire::io::Mapper::Mapper((uint64_t)v10);
  marisa::grimoire::io::Mapper::open((marisa::grimoire::io::Mapper *)v10, a2);
  marisa::grimoire::trie::LoudsTrie::map(v11, (marisa::grimoire::io::Mapper *)v10);
  v6 = *this;
  *this = v11;
  v11 = v6;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v10);
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v11);
}

void sub_209CAB8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::map(marisa::grimoire::trie::LoudsTrie **this, const void *a2, uint64_t a3)
{
  marisa::grimoire::trie::LoudsTrie *v6;
  marisa::grimoire::trie::LoudsTrie *v7;
  marisa::grimoire::trie::LoudsTrie *v8;
  _QWORD *exception;
  _QWORD *v11;
  _BYTE v12[40];
  marisa::grimoire::trie::LoudsTrie *v13;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x200000021;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:33: MARISA_NULL_ERROR: (ptr == NULL) && (size != 0)";
  }
  v6 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v6)
  {
    v13 = 0;
    v11 = __cxa_allocate_exception(0x20uLL);
    *v11 = &unk_24C2545B8;
    v11[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v11[2] = 0x800000024;
    v11[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:36: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v7 = v6;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v6);
  v13 = v7;
  marisa::grimoire::io::Mapper::Mapper((uint64_t)v12);
  marisa::grimoire::io::Mapper::open((marisa::grimoire::io::Mapper *)v12, a2, a3);
  marisa::grimoire::trie::LoudsTrie::map(v13, (marisa::grimoire::io::Mapper *)v12);
  v8 = *this;
  *this = v13;
  v13 = v8;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v12);
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v13);
}

void sub_209CABA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::load(marisa::grimoire::trie::LoudsTrie **this, const char *a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  _QWORD *exception;
  _QWORD *v9;
  FILE *v10[4];
  marisa::grimoire::trie::LoudsTrie *v11;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x20000002DLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:45: MARISA_NULL_ERROR: filename == NULL";
  }
  v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v4)
  {
    v11 = 0;
    v9 = __cxa_allocate_exception(0x20uLL);
    *v9 = &unk_24C2545B8;
    v9[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v9[2] = 0x800000030;
    v9[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:48: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v5 = v4;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
  v11 = v5;
  marisa::grimoire::io::Reader::Reader((uint64_t)v10);
  marisa::grimoire::io::Reader::open(v10, a2);
  marisa::grimoire::trie::LoudsTrie::read(v11, (marisa::grimoire::io::Reader *)v10);
  v6 = *this;
  *this = v11;
  v11 = v6;
  marisa::grimoire::io::Reader::~Reader(v10);
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v11);
}

void sub_209CABBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::read(marisa::grimoire::trie::LoudsTrie **this, int a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  _QWORD *exception;
  _QWORD *v9;
  FILE *v10[4];
  marisa::grimoire::trie::LoudsTrie *v11;

  if (a2 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x500000039;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:57: MARISA_CODE_ERROR: fd == -1";
  }
  v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v4)
  {
    v11 = 0;
    v9 = __cxa_allocate_exception(0x20uLL);
    *v9 = &unk_24C2545B8;
    v9[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v9[2] = 0x80000003CLL;
    v9[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:60: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v5 = v4;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
  v11 = v5;
  marisa::grimoire::io::Reader::Reader((uint64_t)v10);
  marisa::grimoire::io::Reader::open(v10, a2);
  marisa::grimoire::trie::LoudsTrie::read(v11, (marisa::grimoire::io::Reader *)v10);
  v6 = *this;
  *this = v11;
  v11 = v6;
  marisa::grimoire::io::Reader::~Reader(v10);
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v11);
}

void sub_209CABD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

void marisa::Trie::save(marisa::grimoire::trie::LoudsTrie ***this, const char *a2)
{
  _QWORD *exception;
  const char *v5;
  FILE *v6[4];

  if (!*this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000045;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:69: MARISA_STATE_ERROR: trie_.get() == NULL";
    goto LABEL_6;
  }
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x200000046;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:70: MARISA_NULL_ERROR: filename == NULL";
LABEL_6:
    exception[3] = v5;
  }
  marisa::grimoire::io::Writer::Writer((uint64_t)v6);
  marisa::grimoire::io::Writer::open(v6, a2);
  marisa::grimoire::trie::LoudsTrie::write(*this, (marisa::grimoire::io::Writer *)v6);
  marisa::grimoire::io::Writer::~Writer(v6);
}

void sub_209CABE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
  marisa::grimoire::io::Writer::~Writer(&a9);
  _Unwind_Resume(a1);
}

void marisa::Trie::write(marisa::grimoire::trie::LoudsTrie ***this, int a2)
{
  _QWORD *exception;
  const char *v5;
  FILE *v6[4];

  if (!*this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000004ELL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:78: MARISA_STATE_ERROR: trie_.get() == NULL";
    goto LABEL_6;
  }
  if (a2 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x50000004FLL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:79: MARISA_CODE_ERROR: fd == -1";
LABEL_6:
    exception[3] = v5;
  }
  marisa::grimoire::io::Writer::Writer((uint64_t)v6);
  marisa::grimoire::io::Writer::open(v6, a2);
  marisa::grimoire::trie::LoudsTrie::write(*this, (marisa::grimoire::io::Writer *)v6);
  marisa::grimoire::io::Writer::~Writer(v6);
}

void sub_209CABF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
  marisa::grimoire::io::Writer::~Writer(&a9);
  _Unwind_Resume(a1);
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::lookup(marisa::grimoire::trie::LoudsTrie **this, marisa::Agent *a2)
{
  marisa::grimoire::trie::LoudsTrie *result;

  result = *this;
  if (result)
  {
    if (!*((_QWORD *)a2 + 5))
    {
      marisa::Agent::init_state(a2);
      result = *this;
    }
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::lookup(result, a2);
  }
  return result;
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::reverse_lookup(marisa::grimoire::trie::LoudsTrie **this, marisa::Agent *a2)
{
  marisa::grimoire::trie::LoudsTrie *result;

  result = *this;
  if (result)
  {
    if (!*((_QWORD *)a2 + 5))
    {
      marisa::Agent::init_state(a2);
      result = *this;
    }
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::reverse_lookup(result, a2);
  }
  return result;
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::common_prefix_search(marisa::grimoire::trie::LoudsTrie **this, marisa::Agent *a2)
{
  marisa::grimoire::trie::LoudsTrie *result;

  result = *this;
  if (result)
  {
    if (!*((_QWORD *)a2 + 5))
    {
      marisa::Agent::init_state(a2);
      result = *this;
    }
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::common_prefix_search(result, a2);
  }
  return result;
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::predictive_search(marisa::grimoire::trie::LoudsTrie **this, marisa::Agent *a2)
{
  marisa::grimoire::trie::LoudsTrie *result;

  result = *this;
  if (result)
  {
    if (!*((_QWORD *)a2 + 5))
    {
      marisa::Agent::init_state(a2);
      result = *this;
    }
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::predictive_search(result, a2);
  }
  return result;
}

uint64_t marisa::Trie::num_tries(marisa::Trie *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 1072);
  else
    return 0;
}

uint64_t marisa::Trie::num_keys(marisa::Trie *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 264);
  else
    return 0;
}

uint64_t marisa::Trie::num_nodes(marisa::Trie *this)
{
  if (*(_QWORD *)this)
    return (*(_QWORD *)(*(_QWORD *)this + 48) >> 1) - 1;
  else
    return 0;
}

uint64_t marisa::Trie::tail_mode(marisa::Trie *this)
{
  _QWORD *exception;

  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x100000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:134: MARISA_STATE_ERROR: trie_.get() == NULL";
  }
  return *(unsigned int *)(*(_QWORD *)this + 1084);
}

uint64_t marisa::Trie::node_order(marisa::Trie *this)
{
  _QWORD *exception;

  if (!*(_QWORD *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x10000008BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:139: MARISA_STATE_ERROR: trie_.get() == NULL";
  }
  return *(unsigned int *)(*(_QWORD *)this + 1088);
}

BOOL marisa::Trie::empty(marisa::Trie *this)
{
  return !*(_QWORD *)this || *(_QWORD *)(*(_QWORD *)this + 264) == 0;
}

uint64_t marisa::Trie::size(marisa::Trie *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 264);
  else
    return 0;
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::total_size(marisa::grimoire::trie::LoudsTrie **this)
{
  marisa::grimoire::trie::LoudsTrie *result;

  result = *this;
  if (result)
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::total_size(result);
  return result;
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::io_size(marisa::grimoire::trie::LoudsTrie **this)
{
  marisa::grimoire::trie::LoudsTrie *result;

  result = *this;
  if (result)
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::io_size(result);
  return result;
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::clear(marisa::grimoire::trie::LoudsTrie **this)
{
  marisa::grimoire::trie::LoudsTrie *v2;

  v2 = *this;
  *this = 0;
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v2);
}

uint64_t *marisa::Trie::swap(uint64_t *this, marisa::Trie *a2)
{
  uint64_t v2;

  v2 = *this;
  *this = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  return this;
}

marisa::grimoire::trie::LoudsTrie **marisa::fread(__sFILE *this, __sFILE *a2, marisa::Trie *a3)
{
  _QWORD *exception;
  const char *v5;

  if (!this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x2000000DELL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:222: MARISA_NULL_ERROR: file == NULL";
    goto LABEL_6;
  }
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x2000000DFLL;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:223: MARISA_NULL_ERROR: trie == NULL";
LABEL_6:
    exception[3] = v5;
  }
  return marisa::TrieIO::fread(this, a2, a3);
}

marisa::grimoire::trie::LoudsTrie **marisa::TrieIO::fread(__sFILE *this, __sFILE *a2, marisa::Trie *a3)
{
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  unsigned __int8 *p;
  _QWORD *exception;
  _QWORD *v10;
  FILE *v11[4];
  marisa::grimoire::trie::LoudsTrie *v12;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x2000000B4;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:180: MARISA_NULL_ERROR: trie == NULL";
  }
  v5 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v5)
  {
    v12 = 0;
    v10 = __cxa_allocate_exception(0x20uLL);
    *v10 = &unk_24C2545B8;
    v10[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v10[2] = 0x8000000B8;
    v10[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:184: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v6 = v5;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v5);
  v12 = v6;
  marisa::grimoire::io::Reader::Reader((uint64_t)v11);
  marisa::grimoire::io::Reader::open(v11, this);
  marisa::grimoire::trie::LoudsTrie::read(v12, (marisa::grimoire::io::Reader *)v11);
  p = a2->_p;
  a2->_p = (unsigned __int8 *)v12;
  v12 = (marisa::grimoire::trie::LoudsTrie *)p;
  marisa::grimoire::io::Reader::~Reader(v11);
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v12);
}

void sub_209CAC410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

void marisa::fwrite(__sFILE *this, __sFILE *a2, const marisa::Trie *a3)
{
  _QWORD *exception;

  if (!this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x2000000E4;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:228: MARISA_NULL_ERROR: file == NULL";
  }
  marisa::TrieIO::fwrite(this, a2, a3);
}

void marisa::TrieIO::fwrite(__sFILE *this, __sFILE *a2, const marisa::Trie *a3)
{
  _QWORD *exception;
  const char *v6;
  FILE *v7[4];

  if (!this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x2000000C0;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:192: MARISA_NULL_ERROR: file == NULL";
    goto LABEL_6;
  }
  if (!a2->_p)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x1000000C1;
    v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:193: MARISA_STATE_ERROR: trie.trie_.get() == NULL";
LABEL_6:
    exception[3] = v6;
  }
  marisa::grimoire::io::Writer::Writer((uint64_t)v7);
  marisa::grimoire::io::Writer::open(v7, this);
  marisa::grimoire::trie::LoudsTrie::write((marisa::grimoire::trie::LoudsTrie **)a2->_p, (marisa::grimoire::io::Writer *)v7);
  marisa::grimoire::io::Writer::~Writer(v7);
}

void sub_209CAC58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
  marisa::grimoire::io::Writer::~Writer(&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::read(uint64_t a1, marisa::grimoire::trie::LoudsTrie **a2)
{
  _QWORD *exception;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x2000000E9;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:233: MARISA_NULL_ERROR: trie == NULL";
  }
  return marisa::TrieIO::read(a1, a2);
}

uint64_t marisa::TrieIO::read(uint64_t a1, marisa::grimoire::trie::LoudsTrie **a2)
{
  marisa::grimoire::trie::LoudsTrie *v4;
  marisa::grimoire::trie::LoudsTrie *v5;
  marisa::grimoire::trie::LoudsTrie *v6;
  _QWORD *exception;
  _QWORD *v9;
  FILE *v10[4];
  marisa::grimoire::trie::LoudsTrie *v11;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x2000000C8;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:200: MARISA_NULL_ERROR: trie == NULL";
  }
  v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x24BEDB6B8]);
  if (!v4)
  {
    v11 = 0;
    v9 = __cxa_allocate_exception(0x20uLL);
    *v9 = &unk_24C2545B8;
    v9[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v9[2] = 0x8000000CCLL;
    v9[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:204: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  v5 = v4;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
  v11 = v5;
  marisa::grimoire::io::Reader::Reader((uint64_t)v10);
  marisa::grimoire::io::Reader::open((uint64_t)v10, a1);
  marisa::grimoire::trie::LoudsTrie::read(v11, (marisa::grimoire::io::Reader *)v10);
  v6 = *a2;
  *a2 = v11;
  v11 = v6;
  marisa::grimoire::io::Reader::~Reader(v10);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v11);
  return a1;
}

void sub_209CAC734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

uint64_t marisa::TrieIO::write(uint64_t a1, marisa::grimoire::trie::LoudsTrie ***a2)
{
  _QWORD *exception;
  FILE *v6[4];

  if (!*a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x1000000D5;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:213: MARISA_STATE_ERROR: trie.trie_.get() == NULL";
  }
  marisa::grimoire::io::Writer::Writer((uint64_t)v6);
  marisa::grimoire::io::Writer::open((uint64_t)v6, a1);
  marisa::grimoire::trie::LoudsTrie::write(*a2, (marisa::grimoire::io::Writer *)v6);
  marisa::grimoire::io::Writer::~Writer(v6);
  return a1;
}

void sub_209CAC820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, FILE *a9)
{
  marisa::grimoire::io::Writer::~Writer(&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::io::Reader::Reader(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

void marisa::grimoire::io::Reader::~Reader(FILE **this)
{
  if (*((_BYTE *)this + 24))
    fclose(*this);
}

{
  if (*((_BYTE *)this + 24))
    fclose(*this);
}

FILE *marisa::grimoire::io::Reader::open(FILE **this, const char *a2)
{
  FILE *result;
  int v4;
  _QWORD *exception;
  FILE *v6;
  int v7;
  FILE *v8;
  char v9;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
    exception[2] = 0x20000001BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:27: MARISA_NULL_ERROR: "
                   "filename == NULL";
  }
  v6 = 0;
  v7 = -1;
  v8 = 0;
  v9 = 0;
  marisa::grimoire::io::Reader::open_((marisa::grimoire::io::Reader *)&v6, a2);
  result = *this;
  *this = v6;
  *((_DWORD *)this + 2) = v7;
  this[2] = v8;
  v4 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = v9;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

void sub_209CAC998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, FILE *a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a12)
    fclose(a9);
  _Unwind_Resume(exception_object);
}

FILE *marisa::grimoire::io::Reader::open_(marisa::grimoire::io::Reader *this, const char *__filename)
{
  FILE *result;
  _QWORD *exception;

  result = fopen(__filename, "rb");
  if (!result)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
    exception[2] = 0x90000005ELL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:94: MARISA_IO_ERROR: file == NULL";
  }
  *(_QWORD *)this = result;
  *((_BYTE *)this + 24) = 1;
  return result;
}

uint64_t *marisa::grimoire::io::Reader::swap(uint64_t *this, marisa::grimoire::io::Reader *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *this;
  *this = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  LODWORD(v2) = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v2;
  v3 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v3;
  LOBYTE(v3) = *((_BYTE *)this + 24);
  *((_BYTE *)this + 24) = *((_BYTE *)a2 + 24);
  *((_BYTE *)a2 + 24) = v3;
  return this;
}

FILE *marisa::grimoire::io::Reader::open(FILE **this, __sFILE *a2)
{
  FILE *result;
  int v4;
  _QWORD *exception;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
    exception[2] = 0x200000023;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:35: MARISA_NULL_ERROR: file == NULL";
  }
  result = *this;
  *this = a2;
  *((_DWORD *)this + 2) = -1;
  this[2] = 0;
  v4 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = 0;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

_QWORD *marisa::grimoire::io::Reader::open_(_QWORD *this, __sFILE *a2)
{
  *this = a2;
  return this;
}

FILE *marisa::grimoire::io::Reader::open(FILE **this, int a2)
{
  FILE *result;
  int v4;
  _QWORD *exception;

  if (a2 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
    exception[2] = 0x50000002BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:43: MARISA_CODE_ERROR: fd == -1";
  }
  result = *this;
  *this = 0;
  *((_DWORD *)this + 2) = a2;
  this[2] = 0;
  v4 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = 0;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

uint64_t marisa::grimoire::io::Reader::open_(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8) = a2;
  return this;
}

FILE *marisa::grimoire::io::Reader::open(uint64_t a1, uint64_t a2)
{
  FILE *result;
  int v4;

  result = *(FILE **)a1;
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  *(_QWORD *)(a1 + 16) = a2;
  v4 = *(unsigned __int8 *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = 0;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

uint64_t marisa::grimoire::io::Reader::open_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

FILE *marisa::grimoire::io::Reader::clear(FILE **this)
{
  FILE *result;
  int v3;

  result = *this;
  *this = 0;
  *((_DWORD *)this + 2) = -1;
  this[2] = 0;
  v3 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = 0;
  if (v3)
    return (FILE *)fclose(result);
  return result;
}

uint64_t marisa::grimoire::io::Reader::seek(uint64_t this, size_t __nitems)
{
  size_t v2;
  uint64_t v3;
  size_t v4;
  _QWORD *exception;
  char v6[1024];
  uint64_t v7;

  v2 = __nitems;
  v3 = this;
  v7 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)this && *(_DWORD *)(this + 8) == -1 && !*(_QWORD *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
    exception[2] = 0x100000044;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:68: MARISA_STATE_ERROR: !is_open()";
  }
  if (__nitems)
  {
    if (__nitems > 0x10)
    {
      do
      {
        if (v2 >= 0x400)
          v4 = 1024;
        else
          v4 = v2;
        this = marisa::grimoire::io::Reader::read_data(v3, v6, v4);
        v2 -= v4;
      }
      while (v2);
    }
    else
    {
      return marisa::grimoire::io::Reader::read_data(this, v6, __nitems);
    }
  }
  return this;
}

BOOL marisa::grimoire::io::Reader::is_open(marisa::grimoire::io::Reader *this)
{
  return *(_QWORD *)this || *((_DWORD *)this + 2) != -1 || *((_QWORD *)this + 2) != 0;
}

uint64_t marisa::grimoire::io::Reader::read_data(uint64_t this, char *a2, size_t __nitems)
{
  size_t v3;
  char *v4;
  uint64_t v5;
  FILE *v6;
  size_t v7;
  _QWORD *exception;
  const char *v9;
  _QWORD *v10;

  v3 = __nitems;
  v4 = a2;
  v5 = this;
  v6 = *(FILE **)this;
  if (!*(_QWORD *)this && *(_DWORD *)(this + 8) == -1 && !*(_QWORD *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
    exception[2] = 0x100000071;
    v9 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:113: MARISA_STATE_ERROR: !is_open()";
    goto LABEL_19;
  }
  if (__nitems)
  {
    if (*(_DWORD *)(this + 8) != -1)
    {
      while (1)
      {
        v7 = v3 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v3;
        this = read(*(_DWORD *)(v5 + 8), v4, v7);
        if (this <= 0)
          break;
        v4 += this;
        v3 -= this;
        if (!v3)
          return this;
      }
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
      exception[2] = 0x900000081;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:129: MARISA_IO_ERROR: size_read <= 0";
LABEL_19:
      exception[3] = v9;
    }
    if (v6)
    {
      this = fread(a2, 1uLL, __nitems, v6);
      if (this != v3)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *exception = &unk_24C2545B8;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
        exception[2] = 0x900000086;
        v9 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:134: MARISA_IO_ERROR: ::fread"
             "(buf, 1, size, file_) != size";
        goto LABEL_19;
      }
    }
    else
    {
      this = *(_QWORD *)(this + 16);
      if (this)
      {
        this = std::istream::read();
        if ((*(_BYTE *)(this + *(_QWORD *)(*(_QWORD *)this - 24) + 32) & 5) != 0)
        {
          v10 = __cxa_allocate_exception(0x20uLL);
          *v10 = &unk_24C2545B8;
          v10[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc";
          v10[2] = 0x90000008ALL;
          v10[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/reader.cc:138: MARISA_IO_ERROR: !"
                   "stream_->read(static_cast<char *>(buf), size)";
        }
      }
    }
  }
  return this;
}

void sub_209CACF28()
{
  __break(1u);
}

void sub_209CACF90()
{
  __cxa_end_catch();
  JUMPOUT(0x209CACF98);
}

uint64_t marisa::grimoire::vector::BitVector::rank1(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = a2 >> 9;
  v3 = *((_QWORD *)this + 10);
  v4 = *(unsigned int *)(v3 + 12 * (a2 >> 9));
  switch((a2 >> 6) & 7)
  {
    case 1uLL:
      v5 = *(_DWORD *)(v3 + 12 * v2 + 4) & 0x7F;
      goto LABEL_10;
    case 2uLL:
      v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 7;
      goto LABEL_5;
    case 3uLL:
      v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 15;
LABEL_5:
      v4 += v6;
      break;
    case 4uLL:
      v4 += (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 23;
      break;
    case 5uLL:
      v5 = *(_DWORD *)(v3 + 12 * v2 + 8) & 0x1FF;
      goto LABEL_10;
    case 6uLL:
      v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 9) & 0x1FF;
      goto LABEL_10;
    case 7uLL:
      v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 18) & 0x1FF;
LABEL_10:
      v4 += v5;
      break;
    default:
      break;
  }
  v7 = *(_QWORD *)(*((_QWORD *)this + 2) + 8 * (a2 >> 6)) & ~(-1 << a2);
  v8 = (((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) & 0x3333333333333333);
  return v4 + ((0x101010101010101 * (((v8 >> 4) & 0x707070707070707) + (v8 & 0x707070707070707))) >> 56);
}

unint64_t marisa::grimoire::vector::BitVector::select0(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unint64_t v12;
  marisa::grimoire::vector::_anonymous_namespace_ *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *((_QWORD *)this + 16);
  if ((a2 & 0x1FF) == 0)
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  v5 = *((_QWORD *)this + 10);
  if (v3 + 10 >= v4)
  {
    v7 = v5 + 12 * v3;
    v8 = v3-- << 9;
    v9 = (unsigned int *)(v7 + 12);
    do
    {
      v10 = *v9;
      v9 += 3;
      ++v3;
      v8 += 512;
    }
    while (v8 - v10 <= a2);
  }
  else
  {
    do
    {
      if (((v4 + v3) >> 1 << 9) - *(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2)
        v4 = (v4 + v3) >> 1;
      else
        v3 = (v4 + v3) >> 1;
    }
    while (v3 + 1 < v4);
  }
  v11 = (unsigned int *)(v5 + 12 * v3);
  v12 = v11[1];
  v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)(a2 - (v3 << 9) + *v11);
  v14 = 8 * v3;
  if ((unint64_t)v13 >= 256 - (v12 >> 23))
  {
    v15 = *(unsigned int *)(v5 + 12 * v3 + 8);
    v16 = (v15 >> 9) & 0x1FF;
    if ((unint64_t)v13 >= 384 - v16)
    {
      v18 = (v15 >> 18) & 0x1FF;
      if ((unint64_t)v13 >= 448 - v18)
      {
        v14 |= 7uLL;
        v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v18 - 448);
      }
      else
      {
        v14 |= 6uLL;
        v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v16 - 384);
      }
    }
    else if ((unint64_t)v13 >= 320 - (v15 & 0x1FF))
    {
      v14 |= 5uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v15 & 0x1FF) - 320);
    }
    else
    {
      v14 |= 4uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 23) - 256);
    }
  }
  else if ((unint64_t)v13 >= 128 - (unint64_t)(v12 >> 7))
  {
    v17 = (v12 >> 15);
    if ((unint64_t)v13 >= 192 - v17)
    {
      v14 |= 3uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v17 - 192);
    }
    else
    {
      v14 |= 2uLL;
      v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 7) - 128);
    }
  }
  else if ((unint64_t)v13 >= 64 - (v12 & 0x7F))
  {
    v14 |= 1uLL;
    v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 & 0x7F) - 64);
  }
}

unint64_t marisa::grimoire::vector::`anonymous namespace'::select_bit(marisa::grimoire::vector::_anonymous_namespace_ *this, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (((a3 - ((a3 >> 1) & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((a3 - ((a3 >> 1) & 0x5555555555555555)) & 0x3333333333333333);
  v4 = (v3 + (v3 >> 4)) & 0xF0F0F0F0F0F0F0FLL;
  v5 = __clz(__rbit64(((((0x101010101010101 * v4) | 0x8080808080808080)
                      - 0x101010101010101 * (_QWORD)this
                      - 0x101010101010101) >> 7) & 0x101010101010101));
  return v5
       + a2
                                                                     * ((_QWORD)this
                                                                      - ((unint64_t)(0x101010101010100 * v4) >> v5))
                                                                     + (a3 >> v5)];
}

unint64_t marisa::grimoire::vector::BitVector::select1(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  marisa::grimoire::vector::_anonymous_namespace_ *v16;
  uint64_t v17;
  unint64_t v18;
  marisa::grimoire::vector::_anonymous_namespace_ *v19;
  BOOL v20;
  marisa::grimoire::vector::_anonymous_namespace_ *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  marisa::grimoire::vector::_anonymous_namespace_ *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  marisa::grimoire::vector::_anonymous_namespace_ *v33;
  BOOL v34;

  v2 = *((_QWORD *)this + 22);
  if ((a2 & 0x1FF) == 0)
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  v5 = *((_QWORD *)this + 10);
  if (v3 + 10 >= v4)
  {
    v7 = v5 + 12 * v3--;
    v8 = (unsigned int *)(v7 + 12);
    do
    {
      v9 = *v8;
      v8 += 3;
      ++v3;
    }
    while (v9 <= a2);
  }
  else
  {
    do
    {
      if (*(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2)
        v4 = (v4 + v3) >> 1;
      else
        v3 = (v4 + v3) >> 1;
    }
    while (v3 + 1 < v4);
  }
  v10 = (unsigned int *)(v5 + 12 * v3);
  v11 = v10[1];
  v12 = a2 - *v10;
  v13 = 8 * v3;
  if (v12 >= v11 >> 23)
  {
    v23 = v11 >> 23;
    v24 = *(unsigned int *)(v5 + 12 * v3 + 8);
    v25 = (v24 >> 9) & 0x1FF;
    v26 = (v24 >> 18) & 0x1FF;
    v27 = v13 | 7;
    v28 = v12 >= v26;
    if (v12 < v26)
      v29 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v25);
    else
      v29 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v26);
    if (!v28)
      v27 = v13 | 6;
    v30 = v24 & 0x1FF;
    v31 = v13 | 5;
    v32 = v13 | 4;
    v33 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v23);
    v34 = v12 >= v30;
    if (v12 < v30)
      v21 = v33;
    else
      v21 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v30);
    if (v34)
      v32 = v31;
    if (v12 < v25)
    {
      v22 = v32;
    }
    else
    {
      v21 = v29;
      v22 = v27;
    }
  }
  else
  {
    v14 = v11 >> 7;
    v15 = (v11 >> 15);
    v16 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - (v11 >> 7));
    if (v12 < v15)
    {
      v17 = v13 | 2;
    }
    else
    {
      v16 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v15);
      v17 = v13 | 3;
    }
    v18 = v11 & 0x7F;
    v20 = v12 >= v18;
    v19 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v18);
    if (v20)
      v13 |= 1uLL;
    else
      v19 = (marisa::grimoire::vector::_anonymous_namespace_ *)v12;
    v20 = v12 >= v14;
    if (v12 < v14)
      v21 = v19;
    else
      v21 = v16;
    if (v20)
      v22 = v17;
    else
      v22 = v13;
  }
}

void marisa::grimoire::vector::BitVector::build_index(marisa::grimoire::vector::BitVector *this, const marisa::grimoire::vector::BitVector *a2, int a3, int a4)
{
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  int v18;
  unsigned int v19;
  _DWORD *v20;
  unsigned int v21;
  _DWORD *v22;
  unsigned int v23;
  _DWORD *v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t *v28;
  _DWORD *v29;
  _DWORD *v30;
  int v31;

  v8 = (uint64_t *)((char *)this + 64);
  v9 = *((_QWORD *)a2 + 6);
  if ((v9 & 0x1FF) != 0)
    v10 = (v9 >> 9) + 1;
  else
    v10 = v9 >> 9;
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::resize(v8, v10 + 1);
  v11 = *((_QWORD *)a2 + 6);
  if (v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    do
    {
      if ((v12 & 0x3F) == 0)
        __asm { BR              X12 }
      if (((*(_QWORD *)(*((_QWORD *)a2 + 2) + 8 * (v12 >> 6)) >> (v12 & 0x3F)) & 1) != 0)
      {
        if (a4 && (v13 & 0x1FF) == 0)
        {
          v31 = v12;
          marisa::grimoire::vector::Vector<unsigned int>::push_back((uint64_t *)this + 20, &v31);
        }
        ++v13;
      }
      else
      {
        if (a3 && (v14 & 0x1FF) == 0)
        {
          v31 = v12;
          marisa::grimoire::vector::Vector<unsigned int>::push_back((uint64_t *)this + 14, &v31);
        }
        ++v14;
      }
      ++v12;
      v11 = *((_QWORD *)a2 + 6);
    }
    while (v12 < v11);
    if ((v11 & 0x1FF) != 0)
    {
      v15 = (v11 - 1) >> 9;
      switch(((unint64_t)(v11 - 1) >> 6) & 7)
      {
        case 0uLL:
          v16 = *((_QWORD *)this + 9);
          v17 = (_DWORD *)(v16 + 12 * v15);
          v18 = v13 - *v17;
          v19 = v17[1] & 0xFFFFFF80 | v18 & 0x7F;
          v17[1] = v19;
          goto LABEL_23;
        case 1uLL:
          v16 = *((_QWORD *)this + 9);
          v20 = (_DWORD *)(v16 + 12 * v15);
          v19 = v20[1];
          v18 = v13 - *v20;
LABEL_23:
          v21 = v19 & 0xFFFF807F | (v18 << 7);
          *(_DWORD *)(v16 + 12 * v15 + 4) = v21;
          goto LABEL_25;
        case 2uLL:
          v16 = *((_QWORD *)this + 9);
          v22 = (_DWORD *)(v16 + 12 * v15);
          v21 = v22[1];
          v18 = v13 - *v22;
LABEL_25:
          v23 = v21 & 0xFF807FFF | (v18 << 15);
          *(_DWORD *)(v16 + 12 * v15 + 4) = v23;
          goto LABEL_27;
        case 3uLL:
          v16 = *((_QWORD *)this + 9);
          v24 = (_DWORD *)(v16 + 12 * v15);
          v23 = v24[1];
          v18 = v13 - *v24;
LABEL_27:
          *(_DWORD *)(v16 + 12 * v15 + 4) = v23 & 0x7FFFFF | ((unsigned __int16)v18 << 23);
          goto LABEL_29;
        case 4uLL:
          v16 = *((_QWORD *)this + 9);
          v18 = v13 - *(_DWORD *)(v16 + 12 * v15);
LABEL_29:
          v25 = v16 + 12 * v15;
          v26 = *(_DWORD *)(v25 + 8) & 0xFFFFFE00 | v18 & 0x1FF;
          *(_DWORD *)(v25 + 8) = v26;
          goto LABEL_30;
        case 5uLL:
          v16 = *((_QWORD *)this + 9);
          v29 = (_DWORD *)(v16 + 12 * v15);
          v26 = v29[2];
          v18 = v13 - *v29;
LABEL_30:
          v27 = v26 & 0xFFFC01FF | ((v18 & 0x1FF) << 9);
          *(_DWORD *)(v16 + 12 * v15 + 8) = v27;
          goto LABEL_31;
        case 6uLL:
          v16 = *((_QWORD *)this + 9);
          v30 = (_DWORD *)(v16 + 12 * v15);
          v27 = v30[2];
          v18 = v13 - *v30;
LABEL_31:
          *(_DWORD *)(v16 + 12 * v15 + 8) = v27 & 0xF803FFFF | ((v18 & 0x1FF) << 18);
          break;
        default:
          break;
      }
    }
  }
  else
  {
    v13 = 0;
  }
  *((_QWORD *)this + 6) = v11;
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *(_DWORD *)(*((_QWORD *)this + 9) + 12 * *((_QWORD *)this + 11) - 12) = v13;
  if (a3)
  {
    v31 = *((_QWORD *)a2 + 6);
    marisa::grimoire::vector::Vector<unsigned int>::push_back((uint64_t *)this + 14, &v31);
    marisa::grimoire::vector::Vector<unsigned int>::shrink((_DWORD *)this + 28);
  }
  if (a4)
  {
    v28 = (uint64_t *)((char *)this + 160);
    v31 = *((_QWORD *)a2 + 6);
    marisa::grimoire::vector::Vector<unsigned int>::push_back(v28, &v31);
    marisa::grimoire::vector::Vector<unsigned int>::shrink(v28);
  }
}

uint64_t *marisa::grimoire::vector::Vector<unsigned int>::push_back(uint64_t *result, _DWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = result;
  v4 = result[3];
  v5 = result[4];
  v6 = v4 + 1;
  if (v5 < v4 + 1)
  {
    v7 = 2 * v5;
    if (v5 >> 61)
      v7 = 0x3FFFFFFFFFFFFFFFLL;
    if (v5 <= v6 >> 1)
      v8 = v6;
    else
      v8 = v7;
    result = (uint64_t *)marisa::grimoire::vector::Vector<unsigned int>::realloc(result, v8);
    v4 = v3[3];
    v6 = v4 + 1;
  }
  *(_DWORD *)(v3[1] + 4 * v4) = *a2;
  v3[3] = v6;
  return result;
}

_DWORD *marisa::grimoire::vector::Vector<unsigned int>::shrink(_DWORD *result)
{
  uint64_t v1;
  _QWORD *exception;

  if (*((_BYTE *)result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/vector/vector.h";
    exception[2] = 0x100000064;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/vector/vector.h:100: MARISA_STATE_ERROR: fixed_";
  }
  v1 = *((_QWORD *)result + 3);
  if (v1 != *((_QWORD *)result + 4))
    return marisa::grimoire::vector::Vector<unsigned int>::realloc((uint64_t *)result, v1);
  return result;
}

double marisa::grimoire::trie::Tail::Tail(marisa::grimoire::trie::Tail *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 73) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 73) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 185) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  return result;
}

uint64_t marisa::grimoire::trie::Tail::build(__int128 *a1, uint64_t a2, __int128 *a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t result;
  _QWORD *exception;
  const char *v17;
  _OWORD v18[3];
  _OWORD v19[4];
  __int128 v20;
  _BYTE v21[25];
  __int128 v22;
  _BYTE v23[25];
  __int128 v24;
  _BYTE v25[25];

  if (!a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc";
    exception[2] = 0x20000000DLL;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc:13: MARISA_NULL_ERROR: offsets == NULL";
    goto LABEL_28;
  }
  if (a4 == 0x2000)
    goto LABEL_15;
  if (a4 != 4096)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc";
    exception[2] = 0x500000024;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc:36: MARISA_CODE_ERROR: undefined tail mode";
LABEL_28:
    exception[3] = v17;
  }
  v5 = *(_QWORD *)(a2 + 24);
  if (v5)
  {
    v6 = 0;
    a4 = 4096;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + 8) + 16 * v6;
      v8 = *(unsigned int *)(v7 + 8);
      if ((_DWORD)v8)
        break;
LABEL_11:
      if (++v6 == v5)
        goto LABEL_15;
    }
    v9 = -v8;
    v10 = *(_QWORD *)v7 + 1;
    while (*(_BYTE *)(v10 + v9))
    {
      if (__CFADD__(v9++, 1))
        goto LABEL_11;
    }
    a4 = 0x2000;
  }
  else
  {
    a4 = 4096;
  }
LABEL_15:
  memset(v18, 0, 41);
  memset(v19, 0, 41);
  v22 = 0u;
  memset(v23, 0, sizeof(v23));
  v24 = 0u;
  memset(v25, 0, sizeof(v25));
  v19[3] = 0u;
  v20 = 0u;
  memset(v21, 0, sizeof(v21));
  marisa::grimoire::trie::Tail::build_((uint64_t)v18, a2, a3, a4);
  v12 = *a1;
  *a1 = v18[0];
  v18[0] = v12;
  v13 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v18[1];
  *(_QWORD *)&v18[1] = v13;
  v14 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v18[1] + 8);
  *(_OWORD *)((char *)&v18[1] + 8) = v14;
  LOBYTE(v13) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v18[2]);
  BYTE8(v18[2]) = v13;
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::vector::BitVector *)(a1 + 3), (marisa::grimoire::vector::BitVector *)v19);
  if ((_QWORD)v24)
    MEMORY[0x20BD185D8](v24, 0x1000C8077774924);
  if ((_QWORD)v22)
    MEMORY[0x20BD185D8](v22, 0x1000C8077774924);
  if ((_QWORD)v20)
    MEMORY[0x20BD185D8](v20, 0x1000C8077774924);
  if (*(_QWORD *)&v19[0])
    MEMORY[0x20BD185D8](*(_QWORD *)&v19[0], 0x1000C8077774924);
  result = *(_QWORD *)&v18[0];
  if (*(_QWORD *)&v18[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v18[0], 0x1000C8077774924);
  return result;
}

void sub_209CADBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::Tail::~Tail((marisa::grimoire::trie::Tail *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::Tail::build_(uint64_t a1, uint64_t a2, __int128 *a3, int a4)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t i;
  unint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t result;
  _QWORD *exception;
  _QWORD *v31;
  char v32;
  _QWORD v33[2];
  _OWORD v34[3];

  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 8);
  if (v8)
  {
    v10 = 0;
    v11 = (_DWORD *)(v9 + 12);
    do
    {
      *v11 = v10;
      v11 += 4;
      ++v10;
    }
    while (v8 != v10);
  }
  marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Entry *>(v9, v9 + 16 * v8, 0);
  memset(v34, 0, 41);
  v12 = *(_QWORD *)(a2 + 24);
  LODWORD(v33[0]) = 0;
  marisa::grimoire::vector::Vector<unsigned int>::resize((uint64_t *)v34, v12, v33);
  v33[0] = 0;
  v33[1] = 0;
  v13 = *(_QWORD *)(a2 + 24);
  if (v13)
  {
    v14 = v33;
    do
    {
      --v13;
      v15 = *(_QWORD *)(a2 + 8);
      v16 = v15 + 16 * v13;
      v18 = (unsigned int *)(v16 + 8);
      v17 = *(unsigned int *)(v16 + 8);
      if (!*(_DWORD *)(v16 + 8))
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *exception = &unk_24C2545B8;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc";
        exception[2] = 0x4000000AALL;
        exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc:170: MARISA_RANGE_E"
                       "RROR: current.length() == 0";
      }
      v19 = 0;
      v20 = 0;
      v21 = *((unsigned int *)v14 + 2);
      while (v21 != v20)
      {
        if (*(unsigned __int8 *)(*v14 + v19) != *(unsigned __int8 *)(*(_QWORD *)v16 + v19))
          goto LABEL_13;
        ++v20;
        --v19;
        if (v17 == v20)
          goto LABEL_14;
      }
      v20 = *((unsigned int *)v14 + 2);
LABEL_13:
      if (v20 != v17)
      {
        v22 = *((_QWORD *)&v34[0] + 1);
        goto LABEL_17;
      }
LABEL_14:
      v22 = *((_QWORD *)&v34[0] + 1);
      if ((_DWORD)v21)
      {
        *(_DWORD *)(*((_QWORD *)&v34[0] + 1) + 4 * *(unsigned int *)(v15 + 16 * v13 + 12)) = v21
                                                                                             - v17
                                                                                             + *(_DWORD *)(*((_QWORD *)&v34[0] + 1) + 4 * *((unsigned int *)v14 + 3));
        goto LABEL_29;
      }
LABEL_17:
      *(_DWORD *)(v22 + 4 * *(unsigned int *)(v15 + 16 * v13 + 12)) = *(_QWORD *)(a1 + 24);
      v23 = *v18;
      if ((_DWORD)v23)
      {
        for (i = 0; i < v23; ++i)
        {
          v32 = *(_BYTE *)(*(_QWORD *)v16 - v23 + i + 1);
          marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)a1, &v32);
          v23 = *v18;
        }
        if (a4 != 4096)
        {
          if (v23 >= 2)
          {
            v25 = 1;
            do
            {
              marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 48), 0);
              ++v25;
            }
            while (v25 < *v18);
          }
LABEL_27:
          marisa::grimoire::vector::BitVector::push_back((uint64_t *)(a1 + 48), 1);
          goto LABEL_28;
        }
      }
      else if (a4 != 4096)
      {
        goto LABEL_27;
      }
      v32 = 0;
      marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)a1, &v32);
LABEL_28:
      if (*(_DWORD *)(a1 + 28))
      {
        v31 = __cxa_allocate_exception(0x20uLL);
        *v31 = &unk_24C2545B8;
        v31[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc";
        v31[2] = 0x7000000C0;
        v31[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/tail.cc:192: MARISA_SIZE_ERROR: b"
                 "uf_.size() > MARISA_UINT32_MAX";
      }
LABEL_29:
      v14 = (_QWORD *)v16;
    }
    while (v13);
  }
  marisa::grimoire::vector::Vector<unsigned char>::shrink((_BYTE *)a1);
  v26 = *a3;
  *a3 = v34[0];
  v34[0] = v26;
  v27 = *((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = *(_QWORD *)&v34[1];
  *(_QWORD *)&v34[1] = v27;
  v28 = *(__int128 *)((char *)a3 + 24);
  *(__int128 *)((char *)a3 + 24) = *(_OWORD *)((char *)&v34[1] + 8);
  *(_OWORD *)((char *)&v34[1] + 8) = v28;
  LOBYTE(v27) = *((_BYTE *)a3 + 40);
  *((_BYTE *)a3 + 40) = BYTE8(v34[2]);
  result = v26;
  BYTE8(v34[2]) = v27;
  if ((_QWORD)v26)
    return MEMORY[0x20BD185D8](v26, 0x1000C8077774924);
  return result;
}

void sub_209CADEFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13)
    MEMORY[0x20BD185D8](a13, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t *marisa::grimoire::trie::Tail::swap(marisa::grimoire::trie::Tail *this, marisa::grimoire::trie::Tail *a2)
{
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  return marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::Tail *)((char *)this + 48), (marisa::grimoire::trie::Tail *)((char *)a2 + 48));
}

uint64_t marisa::grimoire::trie::Tail::map(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Mapper *a2)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  __int128 v8[3];
  _OWORD v9[4];
  __int128 v10;
  _BYTE v11[25];
  __int128 v12;
  _BYTE v13[25];
  __int128 v14;
  _BYTE v15[25];

  memset(v8, 0, 41);
  memset(v9, 0, 41);
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  v14 = 0u;
  memset(v15, 0, sizeof(v15));
  v9[3] = 0u;
  v10 = 0u;
  memset(v11, 0, sizeof(v11));
  marisa::grimoire::vector::Vector<char>::map(v8, a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::vector::BitVector *)v9, a2);
  v4 = *(_OWORD *)this;
  *(_OWORD *)this = v8[0];
  v8[0] = v4;
  v5 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v8[1];
  *(_QWORD *)&v8[1] = v5;
  v6 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(__int128 *)((char *)&v8[1] + 8);
  *(__int128 *)((char *)&v8[1] + 8) = v6;
  LOBYTE(v5) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v8[2]);
  BYTE8(v8[2]) = v5;
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::Tail *)((char *)this + 48), (marisa::grimoire::vector::BitVector *)v9);
  if ((_QWORD)v14)
    MEMORY[0x20BD185D8](v14, 0x1000C8077774924);
  if ((_QWORD)v12)
    MEMORY[0x20BD185D8](v12, 0x1000C8077774924);
  if ((_QWORD)v10)
    MEMORY[0x20BD185D8](v10, 0x1000C8077774924);
  if (*(_QWORD *)&v9[0])
    MEMORY[0x20BD185D8](*(_QWORD *)&v9[0], 0x1000C8077774924);
  result = *(_QWORD *)&v8[0];
  if (*(_QWORD *)&v8[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v8[0], 0x1000C8077774924);
  return result;
}

void sub_209CAE0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::Tail::~Tail((marisa::grimoire::trie::Tail *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::Tail::map_(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Mapper *a2)
{
  marisa::grimoire::vector::Vector<char>::map((__int128 *)this, a2);
  return marisa::grimoire::vector::BitVector::map((marisa::grimoire::trie::Tail *)((char *)this + 48), a2);
}

uint64_t marisa::grimoire::trie::Tail::read(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Reader *a2)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  __int128 v8[3];
  _OWORD v9[4];
  __int128 v10;
  _BYTE v11[25];
  __int128 v12;
  _BYTE v13[25];
  __int128 v14;
  _BYTE v15[25];

  memset(v8, 0, 41);
  memset(v9, 0, 41);
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  v14 = 0u;
  memset(v15, 0, sizeof(v15));
  v9[3] = 0u;
  v10 = 0u;
  memset(v11, 0, sizeof(v11));
  marisa::grimoire::vector::Vector<char>::read(v8, a2);
  marisa::grimoire::vector::BitVector::read((marisa::grimoire::vector::BitVector *)v9, a2);
  v4 = *(_OWORD *)this;
  *(_OWORD *)this = v8[0];
  v8[0] = v4;
  v5 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *(_QWORD *)&v8[1];
  *(_QWORD *)&v8[1] = v5;
  v6 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(__int128 *)((char *)&v8[1] + 8);
  *(__int128 *)((char *)&v8[1] + 8) = v6;
  LOBYTE(v5) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = BYTE8(v8[2]);
  BYTE8(v8[2]) = v5;
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::Tail *)((char *)this + 48), (marisa::grimoire::vector::BitVector *)v9);
  if ((_QWORD)v14)
    MEMORY[0x20BD185D8](v14, 0x1000C8077774924);
  if ((_QWORD)v12)
    MEMORY[0x20BD185D8](v12, 0x1000C8077774924);
  if ((_QWORD)v10)
    MEMORY[0x20BD185D8](v10, 0x1000C8077774924);
  if (*(_QWORD *)&v9[0])
    MEMORY[0x20BD185D8](*(_QWORD *)&v9[0], 0x1000C8077774924);
  result = *(_QWORD *)&v8[0];
  if (*(_QWORD *)&v8[0])
    return MEMORY[0x20BD185D8](*(_QWORD *)&v8[0], 0x1000C8077774924);
  return result;
}

void sub_209CAE254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::Tail::~Tail((marisa::grimoire::trie::Tail *)&a9);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::Tail::read_(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Reader *a2)
{
  marisa::grimoire::vector::Vector<char>::read((__int128 *)this, a2);
  return marisa::grimoire::vector::BitVector::read((marisa::grimoire::trie::Tail *)((char *)this + 48), a2);
}

uint64_t marisa::grimoire::trie::Tail::write(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Writer *a2)
{
  marisa::grimoire::vector::Vector<char>::write_((uint64_t)this, a2);
  return marisa::grimoire::vector::BitVector::write_((marisa::grimoire::trie::Tail *)((char *)this + 48), a2);
}

uint64_t marisa::grimoire::trie::Tail::write_(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Writer *a2)
{
  marisa::grimoire::vector::Vector<char>::write_((uint64_t)this, a2);
  return marisa::grimoire::vector::BitVector::write_((marisa::grimoire::trie::Tail *)((char *)this + 48), a2);
}

uint64_t *marisa::grimoire::trie::Tail::restore(uint64_t *this, marisa::Agent *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  _BYTE *v7;

  v3 = a3;
  v4 = this;
  v5 = (uint64_t *)*((_QWORD *)a2 + 5);
  if (this[12])
  {
    do
    {
      this = marisa::grimoire::vector::Vector<char>::push_back(v5, (_BYTE *)(v4[2] + v3));
      v6 = *(_QWORD *)(v4[8] + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v3;
      ++v3;
    }
    while ((v6 & 1) == 0);
  }
  else
  {
    v7 = (_BYTE *)(this[2] + a3);
    if (*v7)
    {
      do
        this = marisa::grimoire::vector::Vector<char>::push_back(v5, v7);
      while (*++v7);
    }
  }
  return this;
}

uint64_t marisa::grimoire::trie::Tail::match(_QWORD *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;

  v3 = a2[5];
  v4 = a1[2];
  if (a1[12])
  {
    v5 = *(_DWORD *)(v3 + 100);
    v6 = *a2;
    v7 = a2[1];
    do
    {
      if (*(unsigned __int8 *)(v4 + a3) != *(unsigned __int8 *)(v6 + v5))
        break;
      *(_DWORD *)(v3 + 100) = ++v5;
      if (((*(_QWORD *)(a1[8] + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
        return 1;
      ++a3;
    }
    while (v7 > v5);
  }
  else
  {
    v12 = v4 + a3;
    v8 = v4 + a3 - *(unsigned int *)(v3 + 100);
    v9 = *a2;
    v10 = a2[1];
    v11 = *(unsigned __int8 *)v12;
    LODWORD(v12) = *(_DWORD *)(v3 + 100);
    while (v11 == *(unsigned __int8 *)(v9 + v12))
    {
      v12 = (v12 + 1);
      *(_DWORD *)(v3 + 100) = v12;
      v11 = *(unsigned __int8 *)(v8 + v12);
      if (!*(_BYTE *)(v8 + v12))
        return 1;
      if (v10 <= v12)
        return 0;
    }
  }
  return 0;
}

BOOL marisa::grimoire::trie::Tail::prefix_match(marisa::grimoire::trie::Tail *this, marisa::Agent *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  unsigned int v7;
  _BYTE *v8;
  int v9;
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  unsigned __int8 *v13;
  int v14;
  unint64_t v15;
  int v16;
  unsigned __int8 *v17;

  v3 = a3;
  v6 = *((_QWORD *)a2 + 5);
  if (*((_QWORD *)this + 12))
  {
    v7 = *(_DWORD *)(v6 + 100);
    while (1)
    {
      v8 = (_BYTE *)(*((_QWORD *)this + 2) + v3);
      v9 = *v8;
      v10 = *(unsigned __int8 *)(*(_QWORD *)a2 + v7);
      v11 = v9 == v10;
      if (v9 != v10)
        break;
      marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v6, v8);
      v7 = *(_DWORD *)(v6 + 100) + 1;
      *(_DWORD *)(v6 + 100) = v7;
      if (((*(_QWORD *)(*((_QWORD *)this + 8) + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
        break;
      ++v3;
      if (*((_QWORD *)a2 + 1) <= (unint64_t)v7)
      {
        do
        {
          marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v6, (_BYTE *)(*((_QWORD *)this + 2) + v3));
          v12 = *(_QWORD *)(*((_QWORD *)this + 8) + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v3;
          ++v3;
        }
        while ((v12 & 1) == 0);
        return 1;
      }
    }
  }
  else
  {
    v15 = *((_QWORD *)this + 2) + a3;
    v13 = (unsigned __int8 *)(v15 - *(unsigned int *)(v6 + 100));
    v14 = *(unsigned __int8 *)v15;
    LODWORD(v15) = *(_DWORD *)(v6 + 100);
    while (1)
    {
      v16 = *(unsigned __int8 *)(*(_QWORD *)a2 + v15);
      v11 = v14 == v16;
      if (v14 != v16)
        break;
      marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v6, &v13[v15]);
      v15 = (*(_DWORD *)(v6 + 100) + 1);
      *(_DWORD *)(v6 + 100) = v15;
      v14 = v13[v15];
      if (!v13[v15])
        break;
      if (*((_QWORD *)a2 + 1) <= v15)
      {
        v17 = &v13[v15];
        do
          marisa::grimoire::vector::Vector<char>::push_back((uint64_t *)v6, v17);
        while (*++v17);
        return 1;
      }
    }
  }
  return v11;
}

uint64_t marisa::grimoire::trie::Tail::clear(marisa::grimoire::trie::Tail *this)
{
  uint64_t result;
  __int128 v2;
  _OWORD v3[4];
  __int128 v4;
  _BYTE v5[25];
  __int128 v6;
  _BYTE v7[25];
  __int128 v8;
  _BYTE v9[25];

  memset(v3, 0, 41);
  v6 = 0u;
  memset(v7, 0, sizeof(v7));
  v8 = 0u;
  memset(v9, 0, sizeof(v9));
  v3[3] = 0u;
  v4 = 0u;
  memset(v5, 0, sizeof(v5));
  v2 = *(_OWORD *)this;
  *(_OWORD *)this = 0u;
  *((_QWORD *)this + 2) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 0;
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::vector::BitVector *)v3, (marisa::grimoire::trie::Tail *)((char *)this + 48));
  if ((_QWORD)v8)
    MEMORY[0x20BD185D8](v8, 0x1000C8077774924);
  if ((_QWORD)v6)
    MEMORY[0x20BD185D8](v6, 0x1000C8077774924);
  if ((_QWORD)v4)
    MEMORY[0x20BD185D8](v4, 0x1000C8077774924);
  if (*(_QWORD *)&v3[0])
    MEMORY[0x20BD185D8](*(_QWORD *)&v3[0], 0x1000C8077774924);
  result = v2;
  if ((_QWORD)v2)
    return MEMORY[0x20BD185D8](v2, 0x1000C8077774924);
  return result;
}

void sub_209CAE67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  marisa::grimoire::trie::Tail::~Tail((marisa::grimoire::trie::Tail *)&a9);
  _Unwind_Resume(a1);
}

uint64_t *marisa::grimoire::vector::Vector<unsigned int>::resize(uint64_t *result, unint64_t a2, _DWORD *a3)
{
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _DWORD *v10;

  v4 = a2;
  v5 = result;
  v6 = result[4];
  if (v6 < a2)
  {
    v7 = 2 * v6;
    if (v6 >> 61)
      v7 = 0x3FFFFFFFFFFFFFFFLL;
    if (v6 > a2 >> 1)
      a2 = v7;
    result = (uint64_t *)marisa::grimoire::vector::Vector<unsigned int>::realloc(result, a2);
  }
  v8 = v5[3];
  v9 = v4 - v8;
  if (v4 > v8)
  {
    v10 = (_DWORD *)(v5[1] + 4 * v8);
    do
    {
      *v10++ = *a3;
      --v9;
    }
    while (v9);
  }
  v5[3] = v4;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<char>::map(__int128 *a1, marisa::grimoire::io::Mapper *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CAE7A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<char>::read(__int128 *a1, marisa::grimoire::io::Reader *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  _OWORD v7[3];

  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<char>::read_((uint64_t)v7, a2);
  v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  v4 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = *(_QWORD *)&v7[1];
  *(_QWORD *)&v7[1] = v4;
  v5 = *(__int128 *)((char *)a1 + 24);
  *(__int128 *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((_BYTE *)a1 + 40);
  *((_BYTE *)a1 + 40) = BYTE8(v7[2]);
  result = v3;
  BYTE8(v7[2]) = v4;
  if ((_QWORD)v3)
    return MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
  return result;
}

void sub_209CAE864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    MEMORY[0x20BD185D8](a9, 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Entry *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;

  v4 = a2;
  v5 = a1;
  v6 = a2 - a1;
  if ((uint64_t)(a2 - a1) < 161)
  {
    v7 = 0;
    goto LABEL_68;
  }
  v7 = 0;
  do
  {
    v8 = marisa::grimoire::algorithm::details::median<marisa::grimoire::trie::Entry>(v5, v5 + 16 * ((unint64_t)v6 >> 5), v4 - 16, a3);
    v9 = v8;
    v10 = v5;
    v11 = v4;
    v12 = v5;
    v13 = v4;
    while (v10 < v11)
    {
      v14 = *(unsigned int *)(v10 + 8);
      v15 = a3 >= v14 ? -1 : *(unsigned __int8 *)(*(_QWORD *)v10 - a3);
      if (v15 > v8)
        break;
      if (v15 == v8)
      {
        v16 = *(_QWORD *)v10;
        v17 = *(_DWORD *)(v10 + 12);
        *(_QWORD *)v10 = *(_QWORD *)v12;
        *(_QWORD *)(v10 + 8) = *(_QWORD *)(v12 + 8);
        *(_QWORD *)v12 = v16;
        *(_DWORD *)(v12 + 8) = v14;
        *(_DWORD *)(v12 + 12) = v17;
        v12 += 16;
      }
LABEL_11:
      v10 += 16;
    }
    if (v10 < v11)
    {
      v18 = v11 - 16;
      do
      {
        v11 = v18;
        v19 = *(unsigned int *)(v18 + 8);
        if (a3 >= v19)
          v20 = -1;
        else
          v20 = *(unsigned __int8 *)(*(_QWORD *)v11 - a3);
        if (v20 < v8)
          break;
        if (v20 == v8)
        {
          v21 = *(_QWORD *)(v13 - 16);
          v13 -= 16;
          v22 = *(_QWORD *)v11;
          v23 = *(_DWORD *)(v11 + 12);
          *(_QWORD *)v11 = v21;
          *(_QWORD *)(v11 + 8) = *(_QWORD *)(v13 + 8);
          *(_QWORD *)v13 = v22;
          *(_DWORD *)(v13 + 8) = v19;
          *(_DWORD *)(v13 + 12) = v23;
        }
        v18 = v11 - 16;
      }
      while (v10 < v11);
    }
    if (v10 < v11)
    {
      v24 = *(_QWORD *)v10;
      *(_QWORD *)v10 = *(_QWORD *)v11;
      v25 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)v11 = v24;
      v26 = *(_QWORD *)(v10 + 8);
      *(_QWORD *)(v10 + 8) = v25;
      *(_QWORD *)(v11 + 8) = v26;
      goto LABEL_11;
    }
    v42 = v7;
    while (v12 > v5)
    {
      v28 = *(_QWORD *)(v12 - 16);
      v12 -= 16;
      v27 = v28;
      v29 = *(_QWORD *)(v10 - 16);
      v10 -= 16;
      *(_QWORD *)v12 = v29;
      v30 = *(_QWORD *)(v10 + 8);
      *(_QWORD *)v10 = v27;
      v31 = *(_QWORD *)(v12 + 8);
      *(_QWORD *)(v12 + 8) = v30;
      *(_QWORD *)(v10 + 8) = v31;
    }
    while (v13 < v4)
    {
      v32 = *(_QWORD *)v13;
      *(_QWORD *)v13 = *(_QWORD *)v11;
      v33 = *(_QWORD *)(v11 + 8);
      *(_QWORD *)v11 = v32;
      v34 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)(v13 + 8) = v33;
      *(_QWORD *)(v11 + 8) = v34;
      v11 += 16;
      v13 += 16;
    }
    v35 = v10 - v5;
    v36 = (uint64_t)(v10 - v5) >> 4;
    v37 = v11 - v10;
    if (v36 <= (uint64_t)(v11 - v10) >> 4)
    {
      v38 = v4 - v11;
      if (v37 >> 4 >= (uint64_t)(v4 - v11) >> 4)
      {
        if (v35 == 16)
        {
          v39 = v42 + 1;
        }
        else
        {
          if (v35 < 17)
            goto LABEL_52;
          v39 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Entry *>(v5, v10, a3) + v42;
        }
        v42 = v39;
LABEL_52:
        if (v38 == 16)
        {
          v7 = v42 + 1;
        }
        else if (v38 < 17)
        {
          v7 = v42;
        }
        else
        {
          v7 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Entry *>(v11, v4, a3) + v42;
        }
        if (v37 == 16)
        {
          ++v7;
        }
        else if (v37 >= 17)
        {
          if (v9 == -1)
          {
            ++v7;
            v5 = v11;
            goto LABEL_63;
          }
          ++a3;
        }
        v5 = v10;
LABEL_63:
        v4 = v11;
        goto LABEL_64;
      }
    }
    if (v37 == 16)
      goto LABEL_31;
    if (v37 < 17)
    {
      v7 = v42;
    }
    else if (v8 == -1)
    {
LABEL_31:
      v7 = v42 + 1;
    }
    else
    {
      v7 = marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Entry *>(v10, v11, a3 + 1) + v42;
    }
    v40 = v4 - v11;
    if (v36 >= (uint64_t)(v4 - v11) >> 4)
    {
      if (v40 == 16)
      {
        ++v7;
      }
      else if (v40 >= 17)
      {
        v7 += marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Entry *>(v11, v4, a3);
      }
      v4 = v10;
    }
    else
    {
      if (v35 == 16)
      {
        ++v7;
      }
      else if (v35 >= 17)
      {
        v7 += marisa::grimoire::algorithm::details::sort<marisa::grimoire::trie::Entry *>(v5, v10, a3);
      }
      v5 = v11;
    }
LABEL_64:
    v6 = v4 - v5;
  }
  while ((uint64_t)(v4 - v5) > 160);
LABEL_68:
  if (v6 >= 17)
    v7 += marisa::grimoire::algorithm::details::insertion_sort<marisa::grimoire::trie::Entry *>(v5, v4, a3);
  return v7;
}

uint64_t marisa::grimoire::algorithm::details::median<marisa::grimoire::trie::Entry>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;

  if (*(unsigned int *)(a1 + 8) <= a4)
    v4 = -1;
  else
    v4 = *(unsigned __int8 *)(*(_QWORD *)a1 - a4);
  if (*(unsigned int *)(a2 + 8) <= a4)
    v5 = -1;
  else
    v5 = *(unsigned __int8 *)(*(_QWORD *)a2 - a4);
  if (*(unsigned int *)(a3 + 8) <= a4)
    v6 = -1;
  else
    v6 = *(unsigned __int8 *)(*(_QWORD *)a3 - a4);
  if (v4 <= v5)
    v7 = v5;
  else
    v7 = v4;
  if (v4 >= v5)
    v4 = v5;
  if (v4 <= v6)
    v4 = v6;
  if (v7 >= v6)
    return v4;
  else
    return v7;
}

uint64_t marisa::grimoire::algorithm::details::insertion_sort<marisa::grimoire::trie::Entry *>(unint64_t a1, unint64_t a2, unint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (_QWORD *)(a1 + 16);
  if (a1 + 16 >= a2)
    return 1;
  v7 = 1;
  do
  {
    v8 = v3;
    if ((unint64_t)v3 <= a1)
    {
      v10 = 0;
    }
    else
    {
      while (1)
      {
        v9 = v8 - 2;
        v10 = marisa::grimoire::algorithm::details::compare<marisa::grimoire::trie::Entry>((uint64_t)(v8 - 2), (uint64_t)v8, a3);
        if (v10 < 1)
          break;
        v11 = *(v8 - 2);
        *(v8 - 2) = *v8;
        v12 = v8[1];
        *v8 = v11;
        v13 = *(v8 - 1);
        *(v8 - 1) = v12;
        v8[1] = v13;
        v8 -= 2;
        if ((unint64_t)v9 <= a1)
        {
          v10 = 1;
          break;
        }
      }
    }
    if (v10)
      ++v7;
    v3 += 2;
  }
  while ((unint64_t)v3 < a2);
  return v7;
}

uint64_t marisa::grimoire::algorithm::details::compare<marisa::grimoire::trie::Entry>(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  uint64_t result;
  unsigned int v12;

  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(unsigned int *)(a2 + 8);
  v5 = v3 - a3;
  if (v3 <= a3)
  {
LABEL_6:
    if (v3 < v4)
      v12 = -1;
    else
      v12 = 1;
    if ((_DWORD)v3 == (_DWORD)v4)
      return 0;
    else
      return v12;
  }
  else
  {
    v6 = v4 - a3;
    v7 = (unsigned __int8 *)(*(_QWORD *)a2 - a3);
    v8 = (unsigned __int8 *)(*(_QWORD *)a1 - a3);
    while (v6)
    {
      v9 = *v8;
      v10 = *v7;
      result = (v9 - v10);
      if (v9 != v10)
        return result;
      --v6;
      --v7;
      --v8;
      if (!--v5)
        goto LABEL_6;
    }
    return 1;
  }
}

uint64_t marisa::grimoire::vector::Vector<char>::read_(uint64_t a1, marisa::grimoire::io::Reader *this)
{
  size_t v4;
  size_t v6;

  v6 = 0;
  marisa::grimoire::io::Reader::read_data((uint64_t)this, (char *)&v6, 8uLL);
  v4 = v6;
  marisa::grimoire::vector::Vector<char>::resize((uint64_t *)a1, v6);
  marisa::grimoire::io::Reader::read<char>((uint64_t)this, *(char **)(a1 + 8), v4);
  return marisa::grimoire::io::Reader::seek((uint64_t)this, -(int)v6 & 7);
}

uint64_t marisa::grimoire::io::Reader::read<char>(uint64_t a1, char *a2, size_t a3)
{
  _QWORD *exception;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/../io/reader.h";
    exception[2] = 0x20000001FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/../io/reader.h:31: MA"
                   "RISA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
  }
  return marisa::grimoire::io::Reader::read_data(a1, a2, a3);
}

uint64_t marisa::grimoire::vector::Vector<char>::write_(uint64_t a1, marisa::grimoire::io::Writer *this)
{
  uint64_t __buf;

  __buf = *(_QWORD *)(a1 + 24);
  marisa::grimoire::io::Writer::write_data((uint64_t)this, (char *)&__buf, 8uLL);
  marisa::grimoire::io::Writer::write<char>((uint64_t)this, *(char **)(a1 + 16), *(_QWORD *)(a1 + 24));
  return marisa::grimoire::io::Writer::seek((uint64_t)this, -*(_DWORD *)(a1 + 24) & 7);
}

uint64_t marisa::grimoire::io::Writer::write<char>(uint64_t a1, char *a2, size_t a3)
{
  _QWORD *exception;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/../io/writer.h";
    exception[2] = 0x20000001ELL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/../io/writer.h:30: MA"
                   "RISA_NULL_ERROR: (objs == NULL) && (num_objs != 0)";
  }
  return marisa::grimoire::io::Writer::write_data(a1, a2, a3);
}

uint64_t marisa::grimoire::io::Writer::Writer(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = -1;
  *(_QWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

void marisa::grimoire::io::Writer::~Writer(FILE **this)
{
  if (*((_BYTE *)this + 24))
    fclose(*this);
}

{
  if (*((_BYTE *)this + 24))
    fclose(*this);
}

FILE *marisa::grimoire::io::Writer::open(FILE **this, const char *a2)
{
  FILE *result;
  int v4;
  _QWORD *exception;
  FILE *v6;
  int v7;
  FILE *v8;
  char v9;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x20000001BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:27: MARISA_NULL_ERROR: "
                   "filename == NULL";
  }
  v6 = 0;
  v7 = -1;
  v8 = 0;
  v9 = 0;
  marisa::grimoire::io::Writer::open_((marisa::grimoire::io::Writer *)&v6, a2);
  result = *this;
  *this = v6;
  *((_DWORD *)this + 2) = v7;
  this[2] = v8;
  v4 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = v9;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

void sub_209CAF0CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, FILE *a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a12)
    fclose(a9);
  _Unwind_Resume(exception_object);
}

FILE *marisa::grimoire::io::Writer::open_(marisa::grimoire::io::Writer *this, const char *__filename)
{
  FILE *result;
  _QWORD *exception;

  result = fopen(__filename, "wb");
  if (!result)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x90000005ELL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:94: MARISA_IO_ERROR: file == NULL";
  }
  *(_QWORD *)this = result;
  *((_BYTE *)this + 24) = 1;
  return result;
}

uint64_t *marisa::grimoire::io::Writer::swap(uint64_t *this, marisa::grimoire::io::Writer *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *this;
  *this = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  LODWORD(v2) = *((_DWORD *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = v2;
  v3 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v3;
  LOBYTE(v3) = *((_BYTE *)this + 24);
  *((_BYTE *)this + 24) = *((_BYTE *)a2 + 24);
  *((_BYTE *)a2 + 24) = v3;
  return this;
}

FILE *marisa::grimoire::io::Writer::open(FILE **this, __sFILE *a2)
{
  FILE *result;
  int v4;
  _QWORD *exception;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x200000023;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:35: MARISA_NULL_ERROR: file == NULL";
  }
  result = *this;
  *this = a2;
  *((_DWORD *)this + 2) = -1;
  this[2] = 0;
  v4 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = 0;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

_QWORD *marisa::grimoire::io::Writer::open_(_QWORD *this, __sFILE *a2)
{
  *this = a2;
  return this;
}

FILE *marisa::grimoire::io::Writer::open(FILE **this, int a2)
{
  FILE *result;
  int v4;
  _QWORD *exception;

  if (a2 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x50000002BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:43: MARISA_CODE_ERROR: fd == -1";
  }
  result = *this;
  *this = 0;
  *((_DWORD *)this + 2) = a2;
  this[2] = 0;
  v4 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = 0;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

uint64_t marisa::grimoire::io::Writer::open_(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8) = a2;
  return this;
}

FILE *marisa::grimoire::io::Writer::open(uint64_t a1, uint64_t a2)
{
  FILE *result;
  int v4;

  result = *(FILE **)a1;
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = -1;
  *(_QWORD *)(a1 + 16) = a2;
  v4 = *(unsigned __int8 *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = 0;
  if (v4)
    return (FILE *)fclose(result);
  return result;
}

uint64_t marisa::grimoire::io::Writer::open_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

FILE *marisa::grimoire::io::Writer::clear(FILE **this)
{
  FILE *result;
  int v3;

  result = *this;
  *this = 0;
  *((_DWORD *)this + 2) = -1;
  this[2] = 0;
  v3 = *((unsigned __int8 *)this + 24);
  *((_BYTE *)this + 24) = 0;
  if (v3)
    return (FILE *)fclose(result);
  return result;
}

uint64_t marisa::grimoire::io::Writer::seek(uint64_t this, size_t __nitems)
{
  size_t v2;
  uint64_t v3;
  size_t v4;
  _QWORD *exception;
  _QWORD __buf[129];

  v2 = __nitems;
  v3 = this;
  __buf[128] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)this && *(_DWORD *)(this + 8) == -1 && !*(_QWORD *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x100000044;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:68: MARISA_STATE_ERROR: !is_open()";
  }
  if (__nitems)
  {
    if (__nitems > 0x10)
    {
      bzero(__buf, 0x400uLL);
      do
      {
        if (v2 >= 0x400)
          v4 = 1024;
        else
          v4 = v2;
        this = marisa::grimoire::io::Writer::write_data(v3, (char *)__buf, v4);
        v2 -= v4;
      }
      while (v2);
    }
    else
    {
      __buf[0] = 0;
      __buf[1] = 0;
      return marisa::grimoire::io::Writer::write_data(this, (char *)__buf, __nitems);
    }
  }
  return this;
}

BOOL marisa::grimoire::io::Writer::is_open(marisa::grimoire::io::Writer *this)
{
  return *(_QWORD *)this || *((_DWORD *)this + 2) != -1 || *((_QWORD *)this + 2) != 0;
}

uint64_t marisa::grimoire::io::Writer::write_data(uint64_t this, char *__buf, size_t __nitems)
{
  size_t v3;
  char *v4;
  uint64_t v5;
  FILE *v6;
  size_t v7;
  _QWORD *exception;
  const char *v9;
  _QWORD *v10;

  v3 = __nitems;
  v4 = __buf;
  v5 = this;
  v6 = *(FILE **)this;
  if (!*(_QWORD *)this && *(_DWORD *)(this + 8) == -1 && !*(_QWORD *)(this + 16))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
    exception[2] = 0x100000071;
    v9 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:113: MARISA_STATE_ERROR: !is_open()";
    goto LABEL_20;
  }
  if (__nitems)
  {
    if (*(_DWORD *)(this + 8) != -1)
    {
      while (1)
      {
        v7 = v3 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v3;
        this = write(*(_DWORD *)(v5 + 8), v4, v7);
        if (this <= 0)
          break;
        v4 += this;
        v3 -= this;
        if (!v3)
          return this;
      }
      exception = __cxa_allocate_exception(0x20uLL);
      *exception = &unk_24C2545B8;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
      exception[2] = 0x900000081;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:129: MARISA_IO_ERROR: size_written <= 0";
LABEL_20:
      exception[3] = v9;
    }
    if (v6)
    {
      if (fwrite(__buf, 1uLL, __nitems, v6) != __nitems)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *exception = &unk_24C2545B8;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
        exception[2] = 0x900000086;
        v9 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:134: MARISA_IO_ERROR: ::fwrit"
             "e(data, 1, size, file_) != size";
        goto LABEL_20;
      }
      this = fflush(*(FILE **)v5);
      if ((_DWORD)this)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *exception = &unk_24C2545B8;
        exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
        exception[2] = 0x900000087;
        v9 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:135: MARISA_IO_ERROR: ::fflush(file_) != 0";
        goto LABEL_20;
      }
    }
    else
    {
      this = *(_QWORD *)(this + 16);
      if (this)
      {
        this = std::ostream::write();
        if ((*(_BYTE *)(this + *(_QWORD *)(*(_QWORD *)this - 24) + 32) & 5) != 0)
        {
          v10 = __cxa_allocate_exception(0x20uLL);
          *v10 = &unk_24C2545B8;
          v10[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc";
          v10[2] = 0x90000008BLL;
          v10[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/writer.cc:139: MARISA_IO_ERROR: !"
                   "stream_->write(static_cast<const char *>(data), size)";
        }
      }
    }
  }
  return this;
}

void sub_209CAF6B0()
{
  __break(1u);
}

void sub_209CAF718()
{
  __cxa_end_catch();
  JUMPOUT(0x209CAF720);
}

double marisa::Agent::Agent(marisa::Agent *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
  marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((_QWORD *)this + 5);
}

{
  marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((_QWORD *)this + 5);
}

_QWORD *marisa::Agent::set_query(_QWORD *this, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *exception;

  if (!a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x20000000DLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:13: MARISA_NULL_ERROR: str == NULL";
  }
  v2 = this[5];
  if (v2)
    *(_DWORD *)(v2 + 108) = 0;
  v3 = 0;
  while (a2[v3++])
    ;
  *this = a2;
  this[1] = v3 - 1;
  return this;
}

_QWORD *marisa::Agent::set_query(_QWORD *this, const char *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *exception;

  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x200000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:21: MARISA_NULL_ERROR: (ptr == NULL)"
                   " && (length != 0)";
  }
  v3 = this[5];
  if (v3)
    *(_DWORD *)(v3 + 108) = 0;
  *this = a2;
  this[1] = a3;
  return this;
}

uint64_t marisa::Agent::set_query(uint64_t this, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 40);
  if (v2)
    *(_DWORD *)(v2 + 108) = 0;
  *(_QWORD *)(this + 16) = a2;
  return this;
}

_QWORD *marisa::Agent::init_state(marisa::Agent *this)
{
  uint64_t *v1;
  _OWORD *v2;
  _QWORD *result;
  _QWORD *exception;
  const char *v5;

  v1 = (uint64_t *)((char *)this + 40);
  if (*((_QWORD *)this + 5))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x100000024;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:36: MARISA_STATE_ERROR: state_.get() != NULL";
    goto LABEL_8;
  }
  v2 = operator new(0x70uLL, MEMORY[0x24BEDB6B8]);
  if (v2)
  {
    *(_OWORD *)((char *)v2 + 25) = 0u;
    *v2 = 0u;
    v2[1] = 0u;
    v2[3] = 0u;
    v2[4] = 0u;
    *(_OWORD *)((char *)v2 + 73) = 0u;
    *((_QWORD *)v2 + 12) = 0;
    *((_QWORD *)v2 + 13) = 0;
  }
  result = marisa::scoped_ptr<marisa::grimoire::trie::State>::reset(v1, (uint64_t)v2);
  if (!*v1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x800000026;
    v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:38: MARISA_MEMORY_ERROR: state_.get() == NULL";
LABEL_8:
    exception[3] = v5;
  }
  return result;
}

_QWORD *marisa::scoped_ptr<marisa::grimoire::trie::State>::reset(uint64_t *a1, uint64_t a2)
{
  _QWORD *exception;
  uint64_t v4;

  if (a2 && *a1 == a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *exception = &unk_24C2545B8;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h";
    exception[2] = 0x600000013;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h:19: MARISA_RESET_ERROR: (ptr"
                   " != NULL) && (ptr == ptr_)";
  }
  v4 = *a1;
  *a1 = a2;
  return marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(&v4);
}

_QWORD *marisa::Agent::clear(marisa::Agent *this)
{
  uint64_t v2;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v2 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  return marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(&v2);
}

uint64_t *marisa::Agent::swap(uint64_t *this, marisa::Agent *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *this;
  v3 = this[1];
  v4 = *((_QWORD *)a2 + 1);
  *this = *(_QWORD *)a2;
  this[1] = v4;
  *(_QWORD *)a2 = v2;
  *((_QWORD *)a2 + 1) = v3;
  v5 = this[2];
  v6 = this[3];
  v7 = *((_QWORD *)a2 + 3);
  this[2] = *((_QWORD *)a2 + 2);
  this[3] = v7;
  *((_QWORD *)a2 + 2) = v5;
  *((_QWORD *)a2 + 3) = v6;
  LODWORD(v5) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v5;
  LODWORD(v5) = *((_DWORD *)this + 9);
  *((_DWORD *)this + 9) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v5;
  v8 = this[5];
  this[5] = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v8;
  return this;
}

_QWORD *marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    v3 = v2[6];
    if (v3)
      MEMORY[0x20BD185D8](v3, 0x1000C8077774924);
    if (*v2)
      MEMORY[0x20BD185D8](*v2, 0x1000C8077774924);
    MEMORY[0x20BD185FC](v2, 0x1070C406A3FAA47);
  }
  return a1;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C2544B0();
}

void operator delete(void *__p)
{
  off_24C2544B8(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  off_24C2544C0(__p, a2);
}

uint64_t operator delete()
{
  return off_24C2544C8();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24C2544D0(__sz, a2);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C2544D8(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24C2544E0(__sz, a2);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

