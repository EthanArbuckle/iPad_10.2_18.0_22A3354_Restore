void sub_220F38D48()
{
  void *v0;
  char v1;

  if (v1 < 0)
    operator delete(v0);
  JUMPOUT(0x220F38D94);
}

void sub_220F38D50()
{
  __cxa_end_catch();
  JUMPOUT(0x220F38D68);
}

void sub_220F38D84(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[60];

  *(_QWORD *)(v2 + 8) = v1;
  v8[0] = &v4;
  std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100](v8);
  dmlc::io::FileInfo::~FileInfo((dmlc::io::FileInfo *)&v5);
  dmlc::io::FileInfo::~FileInfo((dmlc::io::FileInfo *)&v6);
  v8[0] = v2;
  std::vector<dmlc::io::URI>::__destroy_vector::operator()[abi:ne180100](v8);
  v8[0] = &v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v8);
  _Unwind_Resume(a1);
}

void sub_220F38D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a67;
  char a72;
  void *__p;
  char a74;

  if (a74 < 0)
    operator delete(__p);
  if (a72 < 0)
    operator delete(a67);
  JUMPOUT(0x220F38E64);
}

void sub_220F38DF4()
{
  JUMPOUT(0x220F38E6CLL);
}

void sub_220F38DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,void *a61,uint64_t a62,int a63)
{
  char a66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void **v71[60];

  if (SLOBYTE(STACK[0x297]) < 0)
    operator delete((void *)STACK[0x280]);
  if (a66 < 0)
    operator delete(a61);
  v71[0] = (void **)&v67;
  std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100](v71);
  dmlc::io::FileInfo::~FileInfo(&v68);
  dmlc::io::FileInfo::~FileInfo(&v69);
  v71[0] = a20;
  std::vector<dmlc::io::URI>::__destroy_vector::operator()[abi:ne180100](v71);
  v71[0] = (void **)&v70;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v71);
  _Unwind_Resume(a1);
}

void sub_220F38E04(_Unwind_Exception *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[60];

  v6[0] = &v2;
  std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100](v6);
  dmlc::io::FileInfo::~FileInfo((dmlc::io::FileInfo *)&v3);
  dmlc::io::FileInfo::~FileInfo((dmlc::io::FileInfo *)&v4);
  std::vector<dmlc::io::URI>::__destroy_vector::operator()[abi:ne180100](v6);
  v6[0] = &v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v6);
  _Unwind_Resume(a1);
}

void sub_220F38E0C()
{
  JUMPOUT(0x220F38E3CLL);
}

void sub_220F38E14(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *__p,uint64_t a58,int a59,__int16 a60,char a61,char a62,uint64_t a63)
{
  void *a64;
  char a69;

  if (a62 < 0)
    operator delete(__p);
  if (SLOBYTE(STACK[0x297]) < 0)
    operator delete((void *)STACK[0x280]);
  if (a69 < 0)
    operator delete(a64);
  JUMPOUT(0x220F38E4CLL);
}

uint64_t (***dmlc::io::InputSplitBase::Read(dmlc::io::InputSplitBase *this, char *a2, uint64_t a3))(_QWORD, char *, uint64_t)
{
  int v6;
  uint64_t (***result)(_QWORD, char *, uint64_t);
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t (***v16)(_QWORD, char *, uint64_t);
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD *v23;
  std::string *Entry;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28[4];

  v28[3] = *(_QWORD **)MEMORY[0x24BDAC8D0];
  v6 = (*(uint64_t (**)(dmlc::io::InputSplitBase *))(*(_QWORD *)this + 88))(this);
  result = (uint64_t (***)(_QWORD, char *, uint64_t))*((_QWORD *)this + 11);
  if (result)
  {
    v8 = *((_QWORD *)this + 7);
    if (*((_QWORD *)this + 6) >= v8)
      return 0;
    v9 = *((_QWORD *)this + 5);
    v10 = v9 + a3;
    v11 = v8 - v9;
    if (v10 > v8)
      a3 = v11;
    if (a3)
    {
      v12 = (**result)(result, a2, a3);
      v13 = *((_QWORD *)this + 5) + v12;
      *((_QWORD *)this + 5) = v13;
      v14 = a3 - v12;
      if (a3 != v12)
      {
        v15 = &a2[v12];
        do
        {
          if (v12)
          {
            v16 = (uint64_t (***)(_QWORD, char *, uint64_t))*((_QWORD *)this + 11);
          }
          else
          {
            if (v6)
            {
              *v15++ = 10;
              --v14;
              v13 = *((_QWORD *)this + 5);
            }
            v17 = *((_QWORD *)this + 12) + 1;
            if (v13 != *(_QWORD *)(*((_QWORD *)this + 2) + 8 * v17))
            {
              dmlc::LogMessage::LogMessage((dmlc::LogMessage *)v28, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/input_split_base.cc");
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28[0], (uint64_t)"curr=", 5);
              v18 = (_QWORD *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)",begin=", 7);
              v19 = (_QWORD *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)",end=", 5);
              v20 = (_QWORD *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)",fileptr=", 9);
              v21 = (_QWORD *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)",fileoffset=", 12);
              std::ostream::operator<<();
              dmlc::LogMessage::~LogMessage((dmlc::LogMessage *)v28);
              if (*((_QWORD *)this + 12))
              {
                v22 = 0;
                do
                {
                  dmlc::LogMessage::LogMessage((dmlc::LogMessage *)v28, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/input_split_base.cc");
                  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28[0], (uint64_t)"offset[", 7);
                  v23 = (_QWORD *)std::ostream::operator<<();
                  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"]=", 2);
                  std::ostream::operator<<();
                  dmlc::LogMessage::~LogMessage((dmlc::LogMessage *)v28);
                  ++v22;
                }
                while (v22 < *((_QWORD *)this + 12));
              }
              Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v28);
              dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/input_split_base.cc");
              v25 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v28);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"file offset not calculated correctly", 36);
              dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v28);
              v17 = *((_QWORD *)this + 12) + 1;
            }
            v26 = *((_QWORD *)this + 8);
            if (v17 >= 0x2E8BA2E8BA2E8BA3 * ((*((_QWORD *)this + 9) - v26) >> 3))
              return (uint64_t (***)(_QWORD, char *, uint64_t))(a3 - v14);
            *((_QWORD *)this + 12) = v17;
            v27 = *((_QWORD *)this + 11);
            if (v27)
            {
              (*(void (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
              v17 = *((_QWORD *)this + 12);
              v26 = *((_QWORD *)this + 8);
            }
            v16 = (uint64_t (***)(_QWORD, char *, uint64_t))(*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1), v26 + 88 * v17, 0);
            *((_QWORD *)this + 11) = v16;
          }
          v12 = (**v16)(v16, v15, v14);
          v15 += v12;
          v13 = *((_QWORD *)this + 5) + v12;
          *((_QWORD *)this + 5) = v13;
          v14 -= v12;
        }
        while (v14);
      }
      return (uint64_t (***)(_QWORD, char *, uint64_t))(a3 - v14);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_220F391A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a9);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::InputSplitBase::ReadChunk(dmlc::io::InputSplitBase *this, char *__dst, unint64_t *a3)
{
  size_t v6;
  std::string *v7;
  size_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t (***v12)(_QWORD, char *, uint64_t);
  unint64_t v13;
  uint64_t (***v14)(_QWORD, char *, uint64_t);
  _BYTE *v16;
  size_t v17;

  v6 = *a3;
  v7 = (std::string *)((char *)this + 168);
  if (*((char *)this + 191) < 0)
  {
    v8 = *((_QWORD *)this + 22);
    if (v6 > v8)
    {
      if (!v8)
      {
        v11 = 0;
        goto LABEL_13;
      }
      v9 = (char *)v7->__r_.__value_.__r.__words[0];
      goto LABEL_8;
    }
LABEL_10:
    *a3 = 0;
    return 1;
  }
  v8 = *((unsigned __int8 *)this + 191);
  if (v6 <= v8)
    goto LABEL_10;
  v9 = (char *)this + 168;
  if (!(_DWORD)v8)
  {
    LOBYTE(v10) = 0;
    goto LABEL_9;
  }
LABEL_8:
  memcpy(__dst, v9, v8);
  v10 = *((char *)this + 191);
  if (v10 < 0)
  {
    v11 = *((_QWORD *)this + 22);
    goto LABEL_13;
  }
LABEL_9:
  v11 = v10;
LABEL_13:
  std::string::resize(v7, 0, 0);
  v12 = dmlc::io::InputSplitBase::Read(this, &__dst[v11], v6 - v11);
  v13 = (unint64_t)v12 + v11;
  if (!v13)
    return 0;
  v14 = v12;
  if ((*(unsigned int (**)(dmlc::io::InputSplitBase *))(*(_QWORD *)this + 88))(this))
  {
    if (v14)
    {
      v6 = v13;
    }
    else
    {
      __dst[v13] = 10;
      v6 = v13 + 1;
    }
  }
  else if (v13 != v6)
  {
    *a3 = v13;
    return 1;
  }
  v16 = (_BYTE *)(*(uint64_t (**)(dmlc::io::InputSplitBase *, char *, char *))(*(_QWORD *)this + 120))(this, __dst, &__dst[v6]);
  *a3 = v16 - __dst;
  std::string::resize(v7, v6 - (v16 - __dst), 0);
  if ((*((char *)this + 191) & 0x80000000) == 0)
  {
    v17 = *((unsigned __int8 *)this + 191);
    if (!*((_BYTE *)this + 191))
      return 1;
    goto LABEL_26;
  }
  v17 = *((_QWORD *)this + 22);
  if (v17)
  {
    v7 = (std::string *)v7->__r_.__value_.__r.__words[0];
LABEL_26:
    memcpy(v7, v16, v17);
  }
  return 1;
}

uint64_t dmlc::io::InputSplitBase::Chunk::Load(dmlc::io::InputSplitBase::Chunk *this, dmlc::io::InputSplitBase *a2, uint64_t a3)
{
  std::vector<unsigned int> *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v5 = (std::vector<unsigned int> *)((char *)this + 16);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 16), a3 + 1);
  v7 = *((_QWORD *)this + 2);
  v6 = *((_QWORD *)this + 3);
  *(_DWORD *)(v6 - 4) = 0;
  v16 = v6 - 4 - v7;
  if (v6 == v7)
    v8 = 0;
  else
    v8 = v7;
  if (!(*(unsigned int (**)(dmlc::io::InputSplitBase *, uint64_t, uint64_t *))(*(_QWORD *)a2 + 72))(a2, v8, &v16))return 0;
  while (1)
  {
    v9 = *((_QWORD *)this + 2);
    v10 = *((_QWORD *)this + 3);
    if (v16)
      break;
    std::vector<unsigned int>::resize(v5, (v10 - v9) >> 1);
    v12 = *((_QWORD *)this + 2);
    v11 = *((_QWORD *)this + 3);
    *(_DWORD *)(v11 - 4) = 0;
    v16 = v11 - 4 - v12;
    if (v11 == v12)
      v13 = 0;
    else
      v13 = v12;
    if (((*(uint64_t (**)(dmlc::io::InputSplitBase *, uint64_t, uint64_t *))(*(_QWORD *)a2 + 72))(a2, v13, &v16) & 1) == 0)return 0;
  }
  if (v10 == v9)
    v9 = 0;
  v15 = v9 + v16;
  *(_QWORD *)this = v9;
  *((_QWORD *)this + 1) = v15;
  return 1;
}

uint64_t dmlc::io::InputSplitBase::Chunk::Append(std::vector<unsigned int> *this, dmlc::io::InputSplitBase *a2, uint64_t a3)
{
  int64_t v6;
  std::vector<unsigned int> *p_end_cap;
  uint64_t v8;
  std::vector<unsigned int>::pointer begin;
  std::vector<unsigned int>::pointer v10;
  unsigned int *value;
  std::vector<unsigned int>::pointer v12;
  std::vector<unsigned int>::pointer v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int *v17;
  uint64_t v18;

  v6 = (char *)this->__end_ - (char *)this->__begin_;
  p_end_cap = (std::vector<unsigned int> *)&this->__end_cap_;
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)&this->__end_cap_, a3 + this[1].__begin_ - this->__end_cap_.__value_);
  v8 = 4 * a3;
  v18 = v8;
  begin = this[1].__begin_;
  *(begin - 1) = 0;
  if (begin == p_end_cap->__begin_)
    v10 = 0;
  else
    v10 = p_end_cap->__begin_;
  if (!(*(unsigned int (**)(dmlc::io::InputSplitBase *, int64_t, uint64_t *))(*(_QWORD *)a2 + 72))(a2, (int64_t)v10 + v6, &v18))return 0;
  while (1)
  {
    value = this->__end_cap_.__value_;
    v12 = this[1].__begin_;
    if (v18)
      break;
    std::vector<unsigned int>::resize(p_end_cap, ((char *)v12 - (char *)value) >> 1);
    v18 = v8;
    v14 = this->__end_cap_.__value_;
    v13 = this[1].__begin_;
    *(v13 - 1) = 0;
    if (v13 == v14)
      v15 = 0;
    else
      v15 = v14;
    if (((*(uint64_t (**)(dmlc::io::InputSplitBase *, int64_t, uint64_t *))(*(_QWORD *)a2 + 72))(a2, (int64_t)v15 + v6, &v18) & 1) == 0)return 0;
  }
  if (v12 == value)
    value = 0;
  v17 = (unsigned int *)((char *)value + v6 + v18);
  this->__begin_ = value;
  this->__end_ = v17;
  return 1;
}

BOOL dmlc::io::InputSplitBase::ExtractNextChunk(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a3;
  v4 = a3[1];
  if (*a3 != v4)
  {
    *a2 = v3;
    a2[1] = v4 - v3;
    *a3 = v4;
  }
  return v3 != v4;
}

void std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 88;
        std::allocator<dmlc::io::FileInfo>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<dmlc::io::URI>::__push_back_slow_path<dmlc::io::URI const&>(int64x2_t *a1, __int128 *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int64x2_t v16;
  uint64_t v17;
  char *v18;
  char *v20;
  int64x2_t v21;
  char *v22;
  int64x2_t *v23;

  v2 = 0x8E38E38E38E38E39 * ((a1->i64[1] - a1->i64[0]) >> 3);
  v3 = v2 + 1;
  if (v2 + 1 > 0x38E38E38E38E38ELL)
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v6 = (_DWORD)a1 + 16;
  if (0x1C71C71C71C71C72 * ((a1[1].i64[0] - a1->i64[0]) >> 3) > v3)
    v3 = 0x1C71C71C71C71C72 * ((a1[1].i64[0] - a1->i64[0]) >> 3);
  if (0x8E38E38E38E38E39 * ((a1[1].i64[0] - a1->i64[0]) >> 3) >= 0x1C71C71C71C71C7)
    v7 = 0x38E38E38E38E38ELL;
  else
    v7 = v3;
  v23 = a1 + 1;
  if (v7)
  {
    if (v7 > 0x38E38E38E38E38ELL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v8 = (char *)operator new(72 * v7);
  }
  else
  {
    v8 = 0;
  }
  v20 = v8;
  v21.i64[0] = (uint64_t)&v8[72 * v2];
  v21.i64[1] = v21.i64[0];
  v22 = &v8[72 * v7];
  std::allocator<dmlc::io::URI>::construct[abi:ne180100]<dmlc::io::URI,dmlc::io::URI const&>(v6, (std::string *)v21.i64[0], a2);
  v9 = a1->i64[0];
  v10 = a1->u64[1];
  v11 = v21.i64[0];
  v12 = v21.i64[0];
  if (v10 == a1->i64[0])
  {
    v16 = vdupq_n_s64(v10);
  }
  else
  {
    do
    {
      v13 = *(_OWORD *)(v10 - 72);
      *(_QWORD *)(v12 - 56) = *(_QWORD *)(v10 - 56);
      *(_OWORD *)(v12 - 72) = v13;
      *(_QWORD *)(v10 - 64) = 0;
      *(_QWORD *)(v10 - 56) = 0;
      *(_QWORD *)(v10 - 72) = 0;
      v14 = *(_OWORD *)(v10 - 48);
      *(_QWORD *)(v12 - 32) = *(_QWORD *)(v10 - 32);
      *(_OWORD *)(v12 - 48) = v14;
      *(_QWORD *)(v10 - 40) = 0;
      *(_QWORD *)(v10 - 32) = 0;
      *(_QWORD *)(v10 - 48) = 0;
      v15 = *(_OWORD *)(v10 - 24);
      *(_QWORD *)(v12 - 8) = *(_QWORD *)(v10 - 8);
      *(_OWORD *)(v12 - 24) = v15;
      v12 -= 72;
      *(_QWORD *)(v10 - 16) = 0;
      *(_QWORD *)(v10 - 8) = 0;
      *(_QWORD *)(v10 - 24) = 0;
      v10 -= 72;
    }
    while (v10 != v9);
    v16 = *a1;
  }
  v17 = v11 + 72;
  a1->i64[0] = v12;
  a1->i64[1] = v11 + 72;
  v21 = v16;
  v18 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v22;
  v22 = v18;
  v20 = (char *)v16.i64[0];
  std::__split_buffer<dmlc::io::URI>::~__split_buffer((uint64_t)&v20);
  return v17;
}

void sub_220F3977C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<dmlc::io::URI>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::allocator<dmlc::io::URI>::construct[abi:ne180100]<dmlc::io::URI,dmlc::io::URI const&>(int a1, std::string *this, __int128 *a3)
{
  __int128 v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;

  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v5 = *a3;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  if (*((char *)a3 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a3 + 3), *((_QWORD *)a3 + 4));
  }
  else
  {
    v6 = *(__int128 *)((char *)a3 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v6;
  }
  v7 = this + 2;
  if (*((char *)a3 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *((const std::string::value_type **)a3 + 6), *((_QWORD *)a3 + 7));
  }
  else
  {
    v8 = a3[3];
    this[2].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 8);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
}

void sub_220F3983C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__split_buffer<dmlc::io::URI>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 16) = i - 72;
    std::allocator<dmlc::io::FileInfo>::destroy[abi:ne180100](v4, i - 72);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x227666F84]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x24BEDB4B0]);
  return this;
}

void sub_220F39908(_Unwind_Exception *a1)
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
  std::__owns_one_state<char> *v12;
  unsigned int v13;
  char *v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v20;
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  std::__owns_one_state<char> *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  std::__owns_one_state<char> *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = (_QWORD *)operator new();
  *v6 = &off_24E6BDAB8;
  v7 = (_QWORD *)operator new();
  v7[1] = v6;
  v8 = (_QWORD *)operator new();
  *v8 = &off_24E6BDB10;
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
    }
  }
  v12 = *(std::__owns_one_state<char> **)(a1 + 40);
  *(_QWORD *)(a1 + 56) = v12;
  v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v13 > 0x3F)
  {
    switch(v13)
    {
      case 0x40u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        v20 = (char *)memchr(a2, 10, a3 - a2);
        if (v20)
          v21 = v20;
        else
          v21 = a3;
        if (v21 == a2)
        {
          v22 = (_QWORD *)operator new();
          v23 = *(_QWORD *)(a1 + 56);
          v24 = *(_QWORD *)(v23 + 8);
          v22[1] = v24;
          *(_QWORD *)(v23 + 8) = v22;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, a2, v21);
        }
        if (v21 != a3)
          ++v21;
        while (v21 != a3)
        {
          v31 = (char *)memchr(v21, 10, a3 - v21);
          if (v31)
            v32 = v31;
          else
            v32 = a3;
          v33 = *(std::__owns_one_state<char> **)(a1 + 56);
          if (v32 == v21)
          {
            v34 = (_QWORD *)operator new();
            v35 = *(_QWORD *)(a1 + 56);
            v36 = *(_QWORD *)(v35 + 8);
            v34[1] = v36;
            *(_QWORD *)(v35 + 8) = v34;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, v21, v32);
          }
          std::basic_regex<char,std::regex_traits<char>>::__push_alternation((std::basic_regex<char> *)a1, v12, v33);
          if (v32 == a3)
            v21 = v32;
          else
            v21 = v32 + 1;
        }
        break;
      case 0x100u:
        v14 = (char *)memchr(a2, 10, a3 - a2);
        if (v14)
          v15 = v14;
        else
          v15 = a3;
        if (v15 == a2)
        {
          v16 = (_QWORD *)operator new();
          v17 = *(_QWORD *)(a1 + 56);
          v18 = *(_QWORD *)(v17 + 8);
          v16[1] = v18;
          *(_QWORD *)(v17 + 8) = v16;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, v15);
        }
        if (v15 != a3)
          ++v15;
        while (v15 != a3)
        {
          v25 = (char *)memchr(v15, 10, a3 - v15);
          if (v25)
            v26 = v25;
          else
            v26 = a3;
          v27 = *(std::__owns_one_state<char> **)(a1 + 56);
          if (v26 == v15)
          {
            v28 = (_QWORD *)operator new();
            v29 = *(_QWORD *)(a1 + 56);
            v30 = *(_QWORD *)(v29 + 8);
            v28[1] = v30;
            *(_QWORD *)(v29 + 8) = v28;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v15, v26);
          }
          std::basic_regex<char,std::regex_traits<char>>::__push_alternation((std::basic_regex<char> *)a1, v12, v27);
          if (v26 == a3)
            v15 = v26;
          else
            v15 = v26 + 1;
        }
        break;
      default:
        goto LABEL_54;
    }
    return a3;
  }
  else if (v13)
  {
    if (v13 != 16)
    {
      if (v13 != 32)
LABEL_54:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, a2, a3);
  }
  else
  {
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, a3);
  }
}

void sub_220F39CC8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F39D34(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  _BYTE *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  std::__owns_one_state<char> *v12;
  _BYTE *v13;
  unsigned __int8 *v14;
  std::__node<char> *v15;
  std::__owns_one_state<char> *v16;
  std::__node<char> *v17;

  end = a1->__end_;
  v7 = a2;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<std::__wrap_iter<char const*>>(a1, v7, a3);
  }
  while (v8 != v7);
  if (v8 == a2)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  if (v8 != a3)
  {
    while (*v8 == 124)
    {
      v12 = a1->__end_;
      v13 = v8 + 1;
      v14 = v8 + 1;
      do
      {
        v8 = v14;
        v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<std::__wrap_iter<char const*>>(a1, v14, a3);
      }
      while (v8 != v14);
      if (v13 == v8)
      {
        v15 = (std::__node<char> *)operator new();
        v16 = a1->__end_;
        v17 = v16->__first_;
        v15[1].__vftable = (std::__node<char>_vtbl *)v17;
        v16->__first_ = v15;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v12);
      if (v8 == a3)
        return a3;
    }
  }
  return v8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v4 = a3;
  if (*a2 == 94)
  {
    v6 = operator new();
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v6 = &off_24E6BDC30;
    *(_QWORD *)(v6 + 8) = v9;
    *(_BYTE *)(v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != v4)
  {
    do
    {
      v10 = v3;
      v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v3, v4);
    }
    while (v10 != v3);
    if (v10 != v4)
    {
      if (v10 + 1 != v4 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = &off_24E6BDC78;
      *(_QWORD *)(v11 + 8) = v14;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__owns_one_state<char> *v9;
  unsigned __int8 *v10;

  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>((uint64_t)a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  v8 = v7;
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124)
      return (char *)v8;
    v9 = a1->__end_;
    v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>((uint64_t)a1, (char *)v8 + 1, a3);
    if (v8 + 1 == v10)
      goto LABEL_9;
    v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3A0A0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::~__end_state()
{
  JUMPOUT(0x227667068);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x227667068);
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
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
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
  JUMPOUT(0x227667068);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
  std::__node<char> *v6;
  std::__node<char> *first;
  std::__node<char> *v8;
  std::__node<char> *v9;
  std::__node<char> *v10;
  std::__node<char> *v11;

  v6 = (std::__node<char> *)operator new();
  first = __sb->__first_;
  v6[1].__vftable = (std::__node<char>_vtbl *)__sa->__first_;
  v6[2].__vftable = (std::__node<char>_vtbl *)first;
  v6->__vftable = (std::__node<char>_vtbl *)&off_24E6BE0F8;
  __sa->__first_ = v6;
  __sb->__first_ = 0;
  v8 = (std::__node<char> *)operator new();
  v9 = this->__end_->__first_;
  v8[1].__vftable = (std::__node<char>_vtbl *)v9;
  __sb->__first_ = v8;
  this->__end_->__first_ = 0;
  v10 = (std::__node<char> *)operator new();
  v11 = __sb->__first_;
  v10->__vftable = (std::__node<char>_vtbl *)&off_24E6BE140;
  v10[1].__vftable = (std::__node<char>_vtbl *)v11;
  this->__end_->__first_ = v10;
  this->__end_ = (std::__owns_one_state<char> *)__sb->__first_;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  int v6;
  int v7;
  char *v8;
  BOOL v9;
  char *v10;
  int v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  uint64_t (**v19)();
  uint64_t v20;
  unsigned __int8 *result;
  int v22;
  BOOL v23;
  unsigned int marked_count;
  std::__owns_one_state<char> *v25;
  unsigned int v26;
  char *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  _BYTE *v30;
  int v31;
  unsigned int v32;
  std::__node<char> *v33;
  std::__owns_one_state<char> *v34;
  std::__node<char> *v35;
  unsigned int v36;
  char *v37;
  char *v38;
  int v39;
  std::basic_regex<char> *v40;
  BOOL v41;
  std::basic_regex<char> *v42;
  BOOL v43;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  int v45;
  std::__bracket_expression<char, std::regex_traits<char>> *v46;
  std::basic_regex<char> *v47;
  std::basic_regex<char> *v48;
  BOOL v49;
  std::basic_regex<char> v50;

  if (a2 == (unsigned __int8 *)a3)
    return a2;
  v6 = (char)*a2;
  v7 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 == (unsigned __int8 *)a3)
        goto LABEL_33;
      v22 = a2[1];
      if (v22 == 66)
      {
        v23 = 1;
      }
      else
      {
        if (v22 != 98)
          goto LABEL_33;
        v23 = 0;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(a1, v23);
      v20 = 2;
      return &a2[v20];
    }
    if (v6 != 94)
      goto LABEL_33;
    v15 = operator new();
    v16 = (a1->__flags_ & 0x5F0) == 1024;
    end = a1->__end_;
    first = end->__first_;
    v19 = &off_24E6BDC30;
LABEL_21:
    *(_QWORD *)v15 = v19;
    *(_QWORD *)(v15 + 8) = first;
    *(_BYTE *)(v15 + 16) = v16;
    end->__first_ = (std::__node<char> *)v15;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    v20 = 1;
    return &a2[v20];
  }
  if (v6 == 36)
  {
    v15 = operator new();
    v16 = (a1->__flags_ & 0x5F0) == 1024;
    end = a1->__end_;
    first = end->__first_;
    v19 = &off_24E6BDC78;
    goto LABEL_21;
  }
  v9 = v6 == 40;
  v8 = (char *)(a2 + 1);
  v9 = !v9 || v8 == a3;
  if (!v9)
  {
    v9 = *v8 == 63;
    v10 = (char *)(a2 + 2);
    if (v9 && v10 != a3)
    {
      v12 = *v10;
      if (v12 == 33)
      {
        std::regex_traits<char>::regex_traits(&v50.__traits_);
        memset(&v50.__flags_, 0, 40);
        v50.__flags_ = a1->__flags_;
        v13 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v50, a2 + 3, a3);
        marked_count = v50.__marked_count_;
        std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(a1, &v50, 1, a1->__marked_count_);
        a1->__marked_count_ += marked_count;
        if (v13 == a3 || *v13 != 41)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      else
      {
        if (v12 != 61)
          goto LABEL_33;
        std::regex_traits<char>::regex_traits(&v50.__traits_);
        memset(&v50.__flags_, 0, 40);
        v50.__flags_ = a1->__flags_;
        v13 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v50, a2 + 3, a3);
        v14 = v50.__marked_count_;
        std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(a1, &v50, 0, a1->__marked_count_);
        a1->__marked_count_ += v14;
        if (v13 == a3 || *v13 != 41)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100]((uint64_t)&v50.__start_);
      std::locale::~locale(&v50.__traits_.__loc_);
      result = (unsigned __int8 *)(v13 + 1);
      if (v13 + 1 != (char *)a2)
        return result;
      v7 = *a2;
    }
  }
LABEL_33:
  v25 = a1->__end_;
  v26 = a1->__marked_count_;
  if ((char)v7 <= 91)
  {
    result = a2;
    switch((char)v7)
    {
      case '$':
      case ')':
        return result;
      case '%':
      case '&':
      case '\'':
      case ',':
      case '-':
        goto LABEL_58;
      case '(':
        if (a2 + 1 == (unsigned __int8 *)a3)
          goto LABEL_97;
        if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
        {
          ++a1->__open_count_;
          v27 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(a1, a2 + 3, a3);
          if (v27 != a3 && *v27 == 41)
          {
            --a1->__open_count_;
            v28 = (unsigned __int8 *)(v27 + 1);
            goto LABEL_95;
          }
LABEL_97:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        }
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
        v36 = a1->__marked_count_;
        ++a1->__open_count_;
        v37 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(a1, a2 + 1, a3);
        if (v37 == a3)
          goto LABEL_97;
        v38 = v37;
        if (*v37 != 41)
          goto LABEL_97;
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, v36);
        --a1->__open_count_;
        v28 = (unsigned __int8 *)(v38 + 1);
        goto LABEL_95;
      case '*':
      case '+':
        goto LABEL_61;
      case '.':
        v33 = (std::__node<char> *)operator new();
        v34 = a1->__end_;
        v35 = v34->__first_;
        v33->__vftable = (std::__node<char>_vtbl *)&off_24E6BDD50;
        v33[1].__vftable = (std::__node<char>_vtbl *)v35;
        v34->__first_ = v33;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
        goto LABEL_59;
      default:
        if ((char)v7 == 91)
        {
          v28 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)a1, (char *)a2, a3);
          goto LABEL_95;
        }
        if ((char)v7 != 63)
          goto LABEL_58;
        goto LABEL_61;
    }
  }
  v29 = ((char)v7 - 92);
  if (v29 > 0x21)
  {
LABEL_58:
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
LABEL_59:
    v28 = a2 + 1;
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v28, (unsigned __int8 *)a3, v25, v26 + 1, a1->__marked_count_ + 1);
  }
  if (((1 << (v7 - 92)) & 0x300000006) != 0)
    return a2;
  if ((char)v7 != 92)
  {
    if (v29 == 31)
LABEL_61:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    goto LABEL_58;
  }
  v28 = a2;
  if (v7 != 92)
    goto LABEL_95;
  v30 = a2 + 1;
  if (a2 + 1 == (unsigned __int8 *)a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v31 = *v30;
  v32 = v31 - 48;
  if (v31 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v32);
LABEL_94:
    v28 = a2 + 2;
    goto LABEL_95;
  }
  if ((v31 - 49) <= 8)
  {
    v28 = a2 + 2;
    if (a2 + 2 == (unsigned __int8 *)a3)
    {
      v28 = (unsigned __int8 *)a3;
    }
    else
    {
      while (1)
      {
        v39 = *v28;
        if ((v39 - 48) > 9)
          break;
        if (v32 >= 0x19999999)
          goto LABEL_98;
        ++v28;
        v32 = v39 + 10 * v32 - 48;
        if (v28 == (unsigned __int8 *)a3)
        {
          v28 = (unsigned __int8 *)a3;
          break;
        }
      }
      if (!v32)
LABEL_98:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
    }
    if (v32 > v26)
      goto LABEL_98;
    std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(a1, v32);
    if (v30 != v28)
      goto LABEL_95;
    LOBYTE(v31) = *v30;
  }
  if ((char)v31 > 99)
  {
    if ((char)v31 == 119)
    {
      v40 = a1;
      v41 = 0;
      goto LABEL_86;
    }
    if ((char)v31 == 115)
    {
      v48 = a1;
      v49 = 0;
      goto LABEL_92;
    }
    if ((char)v31 != 100)
      goto LABEL_87;
    v42 = a1;
    v43 = 0;
LABEL_84:
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v42, v43);
    v45 = started->__mask_ | 0x400;
LABEL_93:
    started->__mask_ = v45;
    goto LABEL_94;
  }
  switch((char)v31)
  {
    case 'D':
      v42 = a1;
      v43 = 1;
      goto LABEL_84;
    case 'S':
      v48 = a1;
      v49 = 1;
LABEL_92:
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v48, v49);
      v45 = started->__mask_ | 0x4000;
      goto LABEL_93;
    case 'W':
      v40 = a1;
      v41 = 1;
LABEL_86:
      v46 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v40, v41);
      v46->__mask_ |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v46, 95);
      goto LABEL_94;
  }
LABEL_87:
  v47 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)(a2 + 1), (std::basic_regex<char> *)a3, 0);
  if (v30 == (_BYTE *)v47)
    v28 = a2;
  else
    v28 = (unsigned __int8 *)v47;
LABEL_95:
  result = a2;
  if (v28 != a2)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v28, (unsigned __int8 *)a3, v25, v26 + 1, a1->__marked_count_ + 1);
  return result;
}

void sub_220F3A998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  size_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  size_t v18;
  BOOL v19;
  BOOL v20;
  std::__owns_one_state<char> *v21;
  BOOL v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  size_t __max;

  if (a2 == a3)
    return a2;
  v6 = a6;
  v7 = a5;
  v10 = a1;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      v13 = a2 + 1;
      if (v11)
        v20 = 1;
      else
        v20 = v13 == a3;
      if (!v20 && *v13 == 63)
      {
        v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    v13 = a2;
    if (v12 != 123)
      return v13;
    v15 = a2 + 1;
    v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(a2 + 1, a3, (int *)&__max);
    if (v15 != v16)
    {
      if (v16 != a3)
      {
        v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              v13 = v16 + 2;
              v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = (int)__max;
LABEL_33:
              v21 = __s;
              v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = (int)__max;
LABEL_45:
            v21 = __s;
            v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        v23 = v16 + 1;
        if (v16 + 1 == a3)
          goto LABEL_58;
        if (*v23 == 125)
        {
          v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            v13 = v16 + 3;
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(v16 + 1, a3, &v27);
        if (v23 != v25 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            v13 = v25 + 1;
            v22 = 1;
            if (!v11 && v13 != a3)
            {
              v26 = v25[1];
              v22 = v26 != 63;
              if (v26 == 63)
                v13 = v25 + 2;
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    v13 = a2 + 1;
    if (v11)
      v19 = 1;
    else
      v19 = v13 == a3;
    if (!v19 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    v14 = 0;
    goto LABEL_36;
  }
  v13 = a2;
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    v14 = 1;
    goto LABEL_36;
  }
  return v13;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
  uint64_t v4;
  std::__node<char> *first;

  v4 = operator new();
  first = this->__end_->__first_;
  *(_QWORD *)v4 = &off_24E6BDCC0;
  *(_QWORD *)(v4 + 8) = first;
  std::locale::locale((std::locale *)(v4 + 16), &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  *(_BYTE *)(v4 + 40) = a2;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  uint64_t v8;
  std::__node<char> *first;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v8 = operator new();
  first = this->__end_->__first_;
  *(_QWORD *)v8 = &off_24E6BDD08;
  *(_QWORD *)(v8 + 8) = first;
  std::locale::locale((std::locale *)(v8 + 16), &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *(_QWORD *)(v8 + 56) = a2->__start_.__ptr_;
  *(_QWORD *)(v8 + 64) = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  *(_QWORD *)(v8 + 72) = a2->__end_;
  *(_DWORD *)(v8 + 80) = a4;
  *(_BYTE *)(v8 + 84) = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3AE40(_Unwind_Exception *a1)
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

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
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

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDCC0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDCC0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x227667068);
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
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BDD08;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BDD08;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x227667068);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  std::vector<std::csub_match>::size_type v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;
  char v8;
  std::vector<std::csub_match>::pointer begin;
  unint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  std::sub_match<const char *> *v15;
  uint64_t v16;
  std::vector<std::csub_match> __p;
  std::vector<std::csub_match>::value_type v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  std::vector<std::csub_match>::value_type v22;
  char v23;
  uint64_t v24;

  v19 = 0;
  v20 = 0;
  v21 = 0;
  memset(&v22, 0, 17);
  v23 = 0;
  v24 = 0;
  memset(&__p, 0, sizeof(__p));
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v5 = *(_QWORD *)(a2 + 16);
  v18.first = *(const char **)(a2 + 24);
  v18.second = v18.first;
  v18.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v18);
  v19 = v5;
  v20 = v5;
  v21 = 0;
  v22 = v18;
  v24 = v5;
  v23 = 1;
  v6 = *(const char **)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v7 = v6 == *(const char **)(a2 + 8);
  else
    v7 = 0;
  v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v11 = 0;
  v12 = *(_DWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a2 + 32);
  v14 = 1;
  do
  {
    v15 = &begin[v14];
    v16 = v13 + 24 * (v12 + v11);
    *(std::pair<const char *, const char *> *)v16 = v15->std::pair<const char *, const char *>;
    *(_BYTE *)(v16 + 16) = v15->matched;
    v14 = (v11 + 2);
    ++v11;
  }
  while (v10 > v14);
LABEL_14:
  operator delete(begin);
}

void sub_220F3B42C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  signed int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  _OWORD *v18;
  const char *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t *v36;
  const char *v37;
  _BYTE v39[56];
  void *__p[2];
  _QWORD v41[4];
  std::vector<std::csub_match>::value_type __x;
  int64x2_t v43;
  unint64_t v44;

  v43 = 0uLL;
  v44 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v41, 0, 21);
    v43.i64[1] = (uint64_t)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(&v43, (uint64_t)v39);
    if (__p[0])
      operator delete(__p[0]);
    if (*(_QWORD *)&v39[32])
      operator delete(*(void **)&v39[32]);
    v36 = a4;
    v12 = v43.i64[1];
    *(_DWORD *)(v43.i64[1] - 96) = 0;
    *(_QWORD *)(v12 - 88) = a2;
    *(_QWORD *)(v12 - 80) = a2;
    *(_QWORD *)(v12 - 72) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v12 - 64), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(v43.i64[1] - 40), *(unsigned int *)(a1 + 32));
    v37 = a3;
    v13 = (_DWORD)a3 - (_DWORD)a2;
    v14 = v43.i64[1];
    *(_QWORD *)(v43.i64[1] - 16) = v6;
    *(_DWORD *)(v14 - 8) = a5;
    *(_BYTE *)(v14 - 4) = a6;
    v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) == 0 && (int)(v15 >> 12) >= v13)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v17 = (_QWORD *)(v14 - 16);
      v16 = *(_QWORD *)(v14 - 16);
      v18 = (_OWORD *)(v14 - 96);
      if (v16)
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v16 + 16))(v16, v14 - 96);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *(const char **)(v14 - 80);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37)
            goto LABEL_16;
          v27 = *v36;
          *(_QWORD *)v27 = a2;
          *(_QWORD *)(v27 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          v28 = *(_QWORD *)(v14 - 64);
          v29 = *(_QWORD *)(v14 - 56) - v28;
          if (v29)
          {
            v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            v32 = 1;
            do
            {
              v33 = v27 + 24 * v32;
              *(_OWORD *)v33 = *((_OWORD *)v31 - 1);
              v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }
            while (v30 > v32++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v20 = v43.i64[1] - 96;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((_QWORD *)(v43.i64[1] - 96));
          v43.i64[1] = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          v21 = *(_OWORD *)(v14 - 80);
          *(_OWORD *)v39 = *v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v39[32], *(__int128 **)(v14 - 64), *(__int128 **)(v14 - 56), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v14 - 56) - *(_QWORD *)(v14 - 64)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v41[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(__int128 **)(v14 - 40), *(__int128 **)(v14 - 32), (uint64_t)(*(_QWORD *)(v14 - 32) - *(_QWORD *)(v14 - 40)) >> 4);
          v22 = *v17;
          *(_QWORD *)((char *)&v41[1] + 5) = *(_QWORD *)(v14 - 11);
          v41[1] = v22;
          (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 96);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v41[1] + 24))(v41[1], 0, v39);
          v23 = v43.i64[1];
          if (v43.i64[1] >= v44)
          {
            v43.i64[1] = (uint64_t)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(&v43, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v39[16];
            *(_OWORD *)v43.i64[1] = *(_OWORD *)v39;
            *(_OWORD *)(v23 + 16) = v24;
            *(_QWORD *)(v23 + 32) = 0;
            *(_QWORD *)(v23 + 40) = 0;
            *(_QWORD *)(v23 + 48) = 0;
            *(_QWORD *)(v23 + 56) = 0;
            *(_OWORD *)(v23 + 32) = *(_OWORD *)&v39[32];
            *(_QWORD *)(v23 + 48) = *(_QWORD *)&v39[48];
            memset(&v39[32], 0, 24);
            *(_QWORD *)(v23 + 64) = 0;
            *(_QWORD *)(v23 + 72) = 0;
            *(_OWORD *)(v23 + 56) = *(_OWORD *)__p;
            *(_QWORD *)(v23 + 72) = v41[0];
            __p[0] = 0;
            __p[1] = 0;
            v41[0] = 0;
            v25 = v41[1];
            *(_QWORD *)(v23 + 85) = *(_QWORD *)((char *)&v41[1] + 5);
            *(_QWORD *)(v23 + 80) = v25;
            v43.i64[1] = v23 + 96;
          }
          if (*(_QWORD *)&v39[32])
          {
            *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }
LABEL_23:
          v14 = v43.i64[1];
          ++v15;
          if (v43.i64[0] != v43.i64[1])
            continue;
          v6 = 0;
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  *(_QWORD *)v39 = &v43;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
  return v6;
}

void sub_220F3B7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  std::__state<char>::~__state(&a13);
  a13 = v18 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  std::vector<std::csub_match>::pointer v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::pair<const char *, const char *> v14;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::size_type v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
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
      this->__end_ = &begin[__n];
    }
    else
    {
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
  }
  else
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
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    v11 = this->__end_;
    v12 = &v11[__n];
    v13 = 24 * __n;
    do
    {
      v14 = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v11->matched = *(_QWORD *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a1);
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

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::pointer begin;
  unint64_t v7;
  unint64_t v8;
  std::sub_match<const char *> *value;
  unint64_t v11;
  std::vector<std::csub_match>::size_type v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  std::sub_match<const char *> *v16;
  std::sub_match<const char *> *v17;
  std::pair<const char *, const char *> *v18;
  std::vector<std::csub_match>::size_type v19;
  std::pair<const char *, const char *> v20;
  std::sub_match<const char *> *v21;
  std::sub_match<const char *> *v22;
  std::vector<std::csub_match>::pointer v23;
  std::pair<const char *, const char *> v24;
  std::sub_match<const char *> *v25;
  std::vector<std::csub_match>::size_type v26;
  std::pair<const char *, const char *> v27;

  begin = this->__begin_;
  end = this->__end_;
  v7 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
  v8 = __sz - v7;
  if (__sz <= v7)
  {
    if (__sz < v7)
      this->__end_ = &begin[__sz];
  }
  else
  {
    value = this->__end_cap_.__value_;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= v8)
    {
      v25 = &end[v8];
      v26 = 24 * __sz - 8 * (((char *)end - (char *)this->__begin_) >> 3);
      do
      {
        v27 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__x->matched;
        end->std::pair<const char *, const char *> = v27;
        ++end;
        v26 -= 24;
      }
      while (v26);
      this->__end_ = v25;
    }
    else
    {
      if (__sz > 0xAAAAAAAAAAAAAAALL)
        std::vector<void *>::__throw_length_error[abi:ne180100]();
      v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
      v12 = 2 * v11;
      if (2 * v11 <= __sz)
        v12 = __sz;
      if (v11 >= 0x555555555555555)
        v13 = 0xAAAAAAAAAAAAAAALL;
      else
        v13 = v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v13);
      v16 = (std::sub_match<const char *> *)&v14[24 * v7];
      v17 = (std::sub_match<const char *> *)&v14[24 * __sz];
      v18 = v16;
      v19 = 24 * __sz - 24 * v7;
      do
      {
        v20 = __x->std::pair<const char *, const char *>;
        v18[1].first = *(const char **)&__x->matched;
        *v18 = v20;
        v18 = (std::pair<const char *, const char *> *)((char *)v18 + 24);
        v19 -= 24;
      }
      while (v19);
      v21 = (std::sub_match<const char *> *)&v14[24 * v15];
      v23 = this->__begin_;
      v22 = this->__end_;
      if (v22 != this->__begin_)
      {
        do
        {
          v24 = v22[-1].std::pair<const char *, const char *>;
          *(_QWORD *)&v16[-1].matched = *(_QWORD *)&v22[-1].matched;
          v16[-1].std::pair<const char *, const char *> = v24;
          --v16;
          --v22;
        }
        while (v22 != v23);
        v22 = this->__begin_;
      }
      this->__begin_ = v16;
      this->__end_ = v17;
      this->__end_cap_.__value_ = v21;
      if (v22)
        operator delete(v22);
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;
  std::vector<std::pair<unsigned long, const char *>>::pointer end;
  std::vector<std::pair<unsigned long, const char *>>::size_type v5;
  std::vector<std::pair<unsigned long, const char *>>::size_type v6;
  std::pair<unsigned long, const char *> *value;
  uint64_t v8;
  std::vector<std::pair<unsigned long, const char *>>::size_type v9;
  unint64_t v10;
  char *v11;
  std::pair<unsigned long, const char *> *v12;
  uint64_t v13;
  std::pair<unsigned long, const char *> *v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;
  std::vector<std::pair<unsigned long, const char *>>::pointer v17;
  std::pair<unsigned long, const char *> *v18;

  begin = this->__begin_;
  end = this->__end_;
  v5 = end - this->__begin_;
  if (__sz <= v5)
  {
    if (__sz >= v5)
      return;
    v18 = &begin[__sz];
    goto LABEL_17;
  }
  v6 = __sz - v5;
  value = this->__end_cap_.__value_;
  if (__sz - v5 <= value - end)
  {
    bzero(this->__end_, 16 * v6);
    v18 = &end[v6];
LABEL_17:
    this->__end_ = v18;
    return;
  }
  if (__sz >> 60)
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v8 = (char *)value - (char *)begin;
  v9 = v8 >> 3;
  if (v8 >> 3 <= __sz)
    v9 = __sz;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v10 = 0xFFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<xgboost::common::WQSummary<float,float>>>(v10);
  v12 = (std::pair<unsigned long, const char *> *)&v11[16 * v5];
  v14 = (std::pair<unsigned long, const char *> *)&v11[16 * v13];
  bzero(v12, 16 * v6);
  v15 = &v12[v6];
  v17 = this->__begin_;
  v16 = this->__end_;
  if (v16 != this->__begin_)
  {
    do
    {
      v12[-1] = v16[-1];
      --v12;
      --v16;
    }
    while (v16 != v17);
    v16 = this->__begin_;
  }
  this->__begin_ = v12;
  this->__end_ = v15;
  this->__end_cap_.__value_ = v14;
  if (v16)
    operator delete(v16);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3BD10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3BD5C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(int64x2_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  __int128 v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  int64x2_t v21;
  char *v22;
  uint64_t v24;
  int64x2_t v25;
  char *v26;
  int64x2_t *v27;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((a1->i64[1] - a1->i64[0]) >> 5);
  v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * ((a1[1].i64[0] - a1->i64[0]) >> 5) > v3)
    v3 = 0x5555555555555556 * ((a1[1].i64[0] - a1->i64[0]) >> 5);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[1].i64[0] - a1->i64[0]) >> 5) >= 0x155555555555555)
    v6 = 0x2AAAAAAAAAAAAAALL;
  else
    v6 = v3;
  v27 = a1 + 1;
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
  v9 = &v7[96 * v2];
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
  v25.i64[1] = (uint64_t)(v9 + 96);
  v26 = v10;
  v15 = a1->i64[0];
  v14 = a1->u64[1];
  if (v14 == a1->i64[0])
  {
    v21 = vdupq_n_s64(v14);
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = &v9[v16];
      v18 = v14 + v16;
      v19 = *(_OWORD *)(v14 + v16 - 80);
      *((_OWORD *)v17 - 6) = *(_OWORD *)(v14 + v16 - 96);
      *((_OWORD *)v17 - 5) = v19;
      *((_QWORD *)v17 - 7) = 0;
      *((_QWORD *)v17 - 6) = 0;
      *((_QWORD *)v17 - 8) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)(v14 + v16 - 64);
      *((_QWORD *)v17 - 6) = *(_QWORD *)(v14 + v16 - 48);
      *(_QWORD *)(v18 - 64) = 0;
      *(_QWORD *)(v18 - 56) = 0;
      *(_QWORD *)(v18 - 48) = 0;
      *((_QWORD *)v17 - 5) = 0;
      *((_QWORD *)v17 - 4) = 0;
      *((_QWORD *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)(v14 + v16 - 40);
      *((_QWORD *)v17 - 3) = *(_QWORD *)(v14 + v16 - 24);
      *(_QWORD *)(v18 - 40) = 0;
      *(_QWORD *)(v18 - 32) = 0;
      *(_QWORD *)(v18 - 24) = 0;
      v20 = *(_QWORD *)(v14 + v16 - 16);
      *(_QWORD *)(v17 - 11) = *(_QWORD *)(v14 + v16 - 11);
      *((_QWORD *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (v14 + v16 != v15);
    v21 = *a1;
    v9 += v16;
    v13 = (char *)v25.i64[1];
    v10 = v26;
  }
  a1->i64[0] = (uint64_t)v9;
  a1->i64[1] = (uint64_t)v13;
  v25 = v21;
  v22 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v10;
  v26 = v22;
  v24 = v21.i64[0];
  std::__split_buffer<std::__state<char>>::~__split_buffer((uint64_t)&v24);
  return v13;
}

void std::allocator<std::__state<char>>::destroy[abi:ne180100](_QWORD *a1)
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
}

uint64_t std::__split_buffer<std::__state<char>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    std::allocator<std::__state<char>>::destroy[abi:ne180100]((_QWORD *)(i - 96));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_220F3C024(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_220F3C094(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<xgboost::common::WQSummary<float,float>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::allocator<std::__state<char>>::destroy[abi:ne180100](v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  uint64_t v5;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  uint64_t v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  uint64_t j;
  int v13;
  char *v14;
  int v15;
  std::string *v16;
  _BYTE *v17;
  char *v18;
  char *v19;
  unint64_t i;
  std::string::size_type size;
  char *v22;
  int v23;
  std::string::size_type v24;
  std::string *v25;
  std::string *v26;
  std::regex_traits<char>::char_class_type classname;
  char v28;
  unint64_t v29;
  char *v30;
  std::string::size_type v31;
  std::string *v32;
  std::string::size_type v33;
  std::string *v34;
  std::string::size_type v35;
  std::string *p_s;
  std::string::size_type v37;
  unint64_t v38;
  __int128 v39;
  std::string::size_type v40;
  std::string *v41;
  uint64_t v42;
  std::string *v43;
  BOOL v44;
  std::string::size_type v45;
  std::string::size_type v46;
  std::string *v47;
  std::string::value_type v48;
  std::string *v49;
  std::string::size_type v50;
  BOOL v51;
  std::string::size_type v52;
  std::string::size_type v53;
  std::string *p_p;
  std::string::value_type v55;
  std::string *v56;
  std::string::size_type v57;
  std::string::size_type v58;
  std::string *v59;
  std::string::size_type v60;
  std::string *v61;
  void *v62;
  std::string::size_type v63;
  std::string::size_type v64;
  std::string *v65;
  std::string::value_type v66;
  std::string *v67;
  std::string *v68;
  std::string::value_type v69;
  std::string *v70;
  std::vector<std::pair<std::string, std::string>> *v72;
  uint64_t v73;
  uint64_t v74;
  std::string __p;
  std::string v76;
  std::string v77;
  std::string v78;
  std::string __s;
  std::string v80;
  std::string v81;
  std::string v82;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_228;
    v5 = (uint64_t)(a2[1] == 94 ? a2 + 2 : a2 + 1);
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if ((char *)v5 == a3)
      goto LABEL_228;
    v7 = (uint64_t)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(_BYTE *)v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if ((char *)v5 == a3)
      goto LABEL_228;
    v72 = (std::vector<std::pair<std::string, std::string>> *)(v7 + 88);
    v73 = v7 + 16;
    v74 = 4 - (_QWORD)a3;
    while (1)
    {
      v8 = (char *)v5;
      if ((char *)v5 == a3)
      {
        v10 = a3;
        goto LABEL_137;
      }
      v9 = *(unsigned __int8 *)v5;
      v10 = (char *)v5;
      if (v9 != 93)
        break;
LABEL_137:
      v5 = (uint64_t)v10;
LABEL_138:
      if (v8 == (char *)v5)
      {
        if (v8 != a3)
        {
          if (*v8 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, 45);
            ++v8;
          }
          if (v8 != a3 && *v8 == 93)
            return v8 + 1;
        }
LABEL_228:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
    memset(&v78, 0, sizeof(v78));
    if ((char *)(v5 + 1) != a3 && v9 == 91)
    {
      v11 = *(unsigned __int8 *)(v5 + 1);
      switch(v11)
      {
        case '.':
          v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, (char *)(v5 + 2), a3, (uint64_t)&v78);
          v5 = *(_DWORD *)(a1 + 24) & 0x1F0;
          size = HIBYTE(v78.__r_.__value_.__r.__words[2]);
          if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            size = v78.__r_.__value_.__l.__size_;
          if (size)
          {
LABEL_34:
            if (v10 != a3)
            {
              v15 = *v10;
              if (v15 != 93)
              {
                v17 = v10 + 1;
                if (v10 + 1 != a3 && v15 == 45 && *v17 != 93)
                {
                  memset(&v77, 0, sizeof(v77));
                  v18 = v10 + 2;
                  if (v10 + 2 != a3 && *v17 == 91 && *v18 == 46)
                  {
                    v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(a1, v10 + 3, a3, (uint64_t)&v77);
                    goto LABEL_141;
                  }
                  if ((v5 | 0x40) == 0x40)
                  {
                    LODWORD(v17) = *v17;
                    if ((_DWORD)v17 == 92)
                    {
                      if ((_DWORD)v5)
                        v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v10 + 2, a3, &v77);
                      else
                        v19 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)(v10 + 2), (std::basic_regex<char> *)a3, &v77, v7);
LABEL_141:
                      v18 = v19;
LABEL_142:
                      v76 = v78;
                      __p = v77;
                      memset(&v77, 0, sizeof(v77));
                      memset(&v78, 0, sizeof(v78));
                      if (*(_BYTE *)(v7 + 170))
                      {
                        if (*(_BYTE *)(v7 + 169))
                        {
                          v44 = (v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                          v45 = HIBYTE(v76.__r_.__value_.__r.__words[2]);
                          if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                            v45 = v76.__r_.__value_.__l.__size_;
                          if (v45)
                          {
                            v46 = 0;
                            do
                            {
                              if (v44)
                                v47 = (std::string *)v76.__r_.__value_.__r.__words[0];
                              else
                                v47 = &v76;
                              v48 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), v47->__r_.__value_.__s.__data_[v46]);
                              if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                v49 = &v76;
                              else
                                v49 = (std::string *)v76.__r_.__value_.__r.__words[0];
                              v49->__r_.__value_.__s.__data_[v46++] = v48;
                              v44 = (v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                              v50 = HIBYTE(v76.__r_.__value_.__r.__words[2]);
                              if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                v50 = v76.__r_.__value_.__l.__size_;
                            }
                            while (v46 < v50);
                          }
                          v51 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                          v52 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                            v52 = __p.__r_.__value_.__l.__size_;
                          if (v52)
                          {
                            v53 = 0;
                            do
                            {
                              if (v51)
                                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                              else
                                p_p = &__p;
                              v55 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), p_p->__r_.__value_.__s.__data_[v53]);
                              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                v56 = &__p;
                              else
                                v56 = (std::string *)__p.__r_.__value_.__r.__words[0];
                              v56->__r_.__value_.__s.__data_[v53++] = v55;
                              v51 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
                              v57 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                v57 = __p.__r_.__value_.__l.__size_;
                            }
                            while (v53 < v57);
                          }
                        }
                        v58 = HIBYTE(v76.__r_.__value_.__r.__words[2]);
                        if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                          v59 = &v76;
                        else
                          v59 = (std::string *)v76.__r_.__value_.__r.__words[0];
                        if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          v58 = v76.__r_.__value_.__l.__size_;
                        std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)&v80, v73, (char *)v59, (char *)v59 + v58);
                        v60 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                          v61 = &__p;
                        else
                          v61 = (std::string *)__p.__r_.__value_.__r.__words[0];
                        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          v60 = __p.__r_.__value_.__l.__size_;
                        std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)&__s, v73, (char *)v61, (char *)v61 + v60);
                        v81 = v80;
                        memset(&v80, 0, sizeof(v80));
                        v82 = __s;
                        memset(&__s, 0, sizeof(__s));
                        std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](v72, (__int128 *)&v81);
                        if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
                          operator delete(v82.__r_.__value_.__l.__data_);
                        if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
                          operator delete(v81.__r_.__value_.__l.__data_);
                        if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
                          operator delete(__s.__r_.__value_.__l.__data_);
                        if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
                        {
                          v62 = (void *)v80.__r_.__value_.__r.__words[0];
                          goto LABEL_212;
                        }
                      }
                      else
                      {
                        v63 = HIBYTE(v76.__r_.__value_.__r.__words[2]);
                        if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          v63 = v76.__r_.__value_.__l.__size_;
                        if (v63 != 1)
                          goto LABEL_231;
                        v64 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          v64 = __p.__r_.__value_.__l.__size_;
                        if (v64 != 1)
LABEL_231:
                          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
                        if (*(_BYTE *)(v7 + 169))
                        {
                          if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                            v65 = &v76;
                          else
                            v65 = (std::string *)v76.__r_.__value_.__r.__words[0];
                          v66 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), v65->__r_.__value_.__s.__data_[0]);
                          if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                            v67 = &v76;
                          else
                            v67 = (std::string *)v76.__r_.__value_.__r.__words[0];
                          v67->__r_.__value_.__s.__data_[0] = v66;
                          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                            v68 = &__p;
                          else
                            v68 = (std::string *)__p.__r_.__value_.__r.__words[0];
                          v69 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), v68->__r_.__value_.__s.__data_[0]);
                          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                            v70 = &__p;
                          else
                            v70 = (std::string *)__p.__r_.__value_.__r.__words[0];
                          v70->__r_.__value_.__s.__data_[0] = v69;
                        }
                        v81 = v76;
                        memset(&v76, 0, sizeof(v76));
                        v82 = __p;
                        memset(&__p, 0, sizeof(__p));
                        std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](v72, (__int128 *)&v81);
                        if (SHIBYTE(v82.__r_.__value_.__r.__words[2]) < 0)
                          operator delete(v82.__r_.__value_.__l.__data_);
                        if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
                        {
                          v62 = (void *)v81.__r_.__value_.__r.__words[0];
LABEL_212:
                          operator delete(v62);
                        }
                      }
                      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                        operator delete(__p.__r_.__value_.__l.__data_);
                      if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
                        operator delete(v76.__r_.__value_.__l.__data_);
                      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
                        operator delete(v77.__r_.__value_.__l.__data_);
                      v28 = 1;
LABEL_134:
                      if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
                        operator delete(v78.__r_.__value_.__l.__data_);
                      v10 = v18;
                      if ((v28 & 1) == 0)
                        goto LABEL_138;
                      goto LABEL_137;
                    }
                  }
                  else
                  {
                    LOBYTE(v17) = *v17;
                  }
                  std::string::operator=(&v77, (std::string::value_type)v17);
                  goto LABEL_142;
                }
              }
            }
            if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
            {
              if (v78.__r_.__value_.__l.__size_)
              {
                if (v78.__r_.__value_.__l.__size_ == 1)
                {
                  v16 = (std::string *)v78.__r_.__value_.__r.__words[0];
LABEL_43:
                  std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, v16->__r_.__value_.__s.__data_[0]);
LABEL_81:
                  v28 = 1;
                  v18 = v10;
                  goto LABEL_134;
                }
                v16 = (std::string *)v78.__r_.__value_.__r.__words[0];
LABEL_80:
                std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v7, v16->__r_.__value_.__s.__data_[0], v16->__r_.__value_.__s.__data_[1]);
                goto LABEL_81;
              }
              operator delete(v78.__r_.__value_.__l.__data_);
            }
            else if (*((_BYTE *)&v78.__r_.__value_.__s + 23))
            {
              v16 = &v78;
              if (HIBYTE(v78.__r_.__value_.__r.__words[2]) == 1)
                goto LABEL_43;
              goto LABEL_80;
            }
            goto LABEL_137;
          }
LABEL_28:
          if ((v5 | 0x40) == 0x40)
          {
            v13 = *v10;
            if (v13 == 92)
            {
              v14 = v10 + 1;
              if ((_DWORD)v5)
              {
                v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v14, a3, &v78);
              }
              else
              {
                v10 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v14, (std::basic_regex<char> *)a3, &v78, v7);
                v5 = 0;
              }
              goto LABEL_34;
            }
          }
          else
          {
            LOBYTE(v13) = *v10;
          }
          std::string::operator=(&v78, v13);
          ++v10;
          goto LABEL_34;
        case ':':
          if ((uint64_t)&a3[-v5 - 2] < 2)
            goto LABEL_227;
          for (i = 0; *(_BYTE *)(v5 + i + 2) != 58 || *(_BYTE *)(v5 + i + 3) != 93; ++i)
          {
            if (!(v74 + v5 + i))
              goto LABEL_227;
          }
          v22 = (char *)(v5 + i + 2);
          if (v22 == a3)
LABEL_227:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
          v23 = *(_DWORD *)(a1 + 24);
          std::string::__init_with_size[abi:ne180100]<char *,char *>(&v81, (char *)(v5 + 2), v22, i);
          v24 = HIBYTE(v81.__r_.__value_.__r.__words[2]);
          if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v25 = &v81;
          else
            v25 = (std::string *)v81.__r_.__value_.__r.__words[0];
          if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v24 = v81.__r_.__value_.__l.__size_;
          (*(void (**)(_QWORD, std::string *, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v25, (char *)v25 + v24);
          if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v26 = &v81;
          else
            v26 = (std::string *)v81.__r_.__value_.__r.__words[0];
          classname = std::__get_classname((const char *)v26, v23 & 1);
          if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v81.__r_.__value_.__l.__data_);
          if (!classname)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
          v28 = 0;
          *(_DWORD *)(v7 + 160) |= classname;
          v29 = v5 + i;
          goto LABEL_133;
        case '=':
          if ((uint64_t)&a3[-v5 - 2] < 2)
            goto LABEL_227;
          for (j = 0; *(_BYTE *)(v5 + j + 2) != 61 || *(_BYTE *)(v5 + j + 3) != 93; ++j)
          {
            if (!(v74 + v5 + j))
              goto LABEL_227;
          }
          v30 = (char *)(v5 + j + 2);
          if (v30 == a3)
            goto LABEL_227;
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)&v80, a1, (char *)(v5 + 2), v30);
          if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
          {
            v31 = v80.__r_.__value_.__l.__size_;
            if (!v80.__r_.__value_.__l.__size_)
LABEL_229:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
            v32 = (std::string *)v80.__r_.__value_.__r.__words[0];
          }
          else
          {
            v31 = HIBYTE(v80.__r_.__value_.__r.__words[2]);
            if (!*((_BYTE *)&v80.__r_.__value_.__s + 23))
              goto LABEL_229;
            v32 = &v80;
          }
          std::string::__init_with_size[abi:ne180100]<char *,char *>(&v81, (char *)v32, (char *)v32 + v31, v31);
          v33 = HIBYTE(v81.__r_.__value_.__r.__words[2]);
          if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v34 = &v81;
          else
            v34 = (std::string *)v81.__r_.__value_.__r.__words[0];
          if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v33 = v81.__r_.__value_.__l.__size_;
          (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16)
                                                                                           + 32))(&__s, *(_QWORD *)(a1 + 16), v34, (char *)v34 + v33);
          v35 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
          if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v35 = __s.__r_.__value_.__l.__size_;
          if (v35 != 1)
          {
            if (v35 == 12)
            {
              p_s = &__s;
              if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
              p_s->__r_.__value_.__s.__data_[11] = p_s->__r_.__value_.__s.__data_[3];
            }
            else if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
            {
              *__s.__r_.__value_.__l.__data_ = 0;
              __s.__r_.__value_.__l.__size_ = 0;
            }
            else
            {
              __s.__r_.__value_.__s.__data_[0] = 0;
              *((_BYTE *)&__s.__r_.__value_.__s + 23) = 0;
            }
          }
          if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v81.__r_.__value_.__l.__data_);
          v37 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
          if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v37 = __s.__r_.__value_.__l.__size_;
          if (v37)
          {
            v38 = *(_QWORD *)(v7 + 144);
            if (v38 >= *(_QWORD *)(v7 + 152))
            {
              v42 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)(v7 + 136), (__int128 *)&__s);
            }
            else
            {
              if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
              {
                std::string::__init_copy_ctor_external(*(std::string **)(v7 + 144), __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
              }
              else
              {
                v39 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
                *(_QWORD *)(v38 + 16) = *((_QWORD *)&__s.__r_.__value_.__l + 2);
                *(_OWORD *)v38 = v39;
              }
              v42 = v38 + 24;
              *(_QWORD *)(v7 + 144) = v38 + 24;
            }
            *(_QWORD *)(v7 + 144) = v42;
          }
          else
          {
            v40 = HIBYTE(v80.__r_.__value_.__r.__words[2]);
            if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v40 = v80.__r_.__value_.__l.__size_;
            if (v40 == 2)
            {
              v43 = &v80;
              if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v43 = (std::string *)v80.__r_.__value_.__r.__words[0];
              std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v7, v43->__r_.__value_.__s.__data_[0], v43->__r_.__value_.__s.__data_[1]);
            }
            else
            {
              if (v40 != 1)
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
              v41 = &v80;
              if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v41 = (std::string *)v80.__r_.__value_.__r.__words[0];
              std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, v41->__r_.__value_.__s.__data_[0]);
            }
          }
          if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__s.__r_.__value_.__l.__data_);
          if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v80.__r_.__value_.__l.__data_);
          v28 = 0;
          v29 = v5 + j;
LABEL_133:
          v5 = v29 + 4;
          v18 = v8;
          goto LABEL_134;
      }
    }
    v5 = *(_DWORD *)(a1 + 24) & 0x1F0;
    v10 = v8;
    goto LABEL_28;
  }
  return a2;
}

void sub_220F3CB88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a34 < 0)
    operator delete(__p);
  if (a40 < 0)
    operator delete(a35);
  _Unwind_Resume(exception_object);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  uint64_t v2;
  unsigned int v3;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v2 = operator new();
    v3 = this->__marked_count_ + 1;
    this->__marked_count_ = v3;
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v2 = &off_24E6BDF90;
    *(_QWORD *)(v2 + 8) = first;
    *(_DWORD *)(v2 + 16) = v3;
    end->__first_ = (std::__node<char> *)v2;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  uint64_t v4;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v4 = operator new();
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v4 = &off_24E6BDFD8;
    *(_QWORD *)(v4 + 8) = first;
    *(_DWORD *)(v4 + 16) = a2;
    end->__first_ = (std::__node<char> *)v4;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3CDD0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3CEAC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4)
{
  std::basic_regex<char> *v4;
  int locale_low;
  std::string *v6;
  std::basic_regex<char>::value_type locale;
  int v8;
  int v9;
  char v10;
  char v11;
  char v12;
  char v13;
  std::string::value_type v14;
  unsigned int v15;
  std::string::value_type v16;
  uint64_t v17;

  v4 = this;
  if (this != a3)
  {
    locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    if (locale_low > 109)
    {
      switch(LOBYTE(this->__traits_.__loc_.__locale_))
      {
        case 'n':
          if (a4)
          {
            v6 = a4;
            locale = 10;
            goto LABEL_50;
          }
          locale = 10;
          goto LABEL_59;
        case 'r':
          if (a4)
          {
            v6 = a4;
            locale = 13;
            goto LABEL_50;
          }
          locale = 13;
          goto LABEL_59;
        case 't':
          if (a4)
          {
            v6 = a4;
            locale = 9;
            goto LABEL_50;
          }
          locale = 9;
          goto LABEL_59;
        case 'u':
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) != a3)
          {
            v8 = BYTE1(this->__traits_.__loc_.__locale_);
            if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38 || (v8 | 0x20u) - 97 < 6)
            {
              v4 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2);
              if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) != a3)
              {
                v9 = LOBYTE(v4->__traits_.__loc_.__locale_);
                if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38 || (v9 | 0x20u) - 97 < 6)
                  goto LABEL_23;
              }
            }
          }
          goto LABEL_64;
        case 'v':
          if (a4)
          {
            v6 = a4;
            locale = 11;
            goto LABEL_50;
          }
          locale = 11;
          break;
        case 'x':
LABEL_23:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) == a3)
            goto LABEL_64;
          v10 = BYTE1(v4->__traits_.__loc_.__locale_);
          v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
            goto LABEL_28;
          v10 |= 0x20u;
          if ((v10 - 97) >= 6u)
            goto LABEL_64;
          v11 = -87;
LABEL_28:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 2) == a3)
            goto LABEL_64;
          v12 = BYTE2(v4->__traits_.__loc_.__locale_);
          v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
            goto LABEL_33;
          v12 |= 0x20u;
          if ((v12 - 97) >= 6u)
            goto LABEL_64;
          v13 = -87;
LABEL_33:
          v14 = v12 + 16 * (v10 + v11) + v13;
          if (a4)
            std::string::operator=(a4, v14);
          else
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v14);
          return (std::basic_regex<char> *)((char *)v4 + 3);
        default:
          goto LABEL_45;
      }
      goto LABEL_59;
    }
    if (locale_low == 48)
    {
      if (a4)
      {
        v6 = a4;
        locale = 0;
        goto LABEL_50;
      }
      locale = 0;
LABEL_59:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, locale);
      return (std::basic_regex<char> *)((char *)v4 + 1);
    }
    if (locale_low != 99)
    {
      if (locale_low == 102)
      {
        if (a4)
        {
          v6 = a4;
          locale = 12;
LABEL_50:
          std::string::operator=(v6, locale);
          return (std::basic_regex<char> *)((char *)v4 + 1);
        }
        locale = 12;
        goto LABEL_59;
      }
LABEL_45:
      v17 = LOBYTE(this->__traits_.__loc_.__locale_);
      if ((_DWORD)v17 != 95 && ((v17 & 0x80) != 0 || (a1->__traits_.__ct_->__tab_[v17] & 0x500) == 0))
      {
        locale = (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_;
        if (a4)
        {
          v6 = a4;
          goto LABEL_50;
        }
        goto LABEL_59;
      }
LABEL_64:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_64;
    if (SBYTE1(this->__traits_.__loc_.__locale_) < 65)
      goto LABEL_64;
    v15 = BYTE1(this->__traits_.__loc_.__locale_);
    if (v15 >= 0x5B && (v15 - 97) > 0x19u)
      goto LABEL_64;
    v16 = v15 & 0x1F;
    if (a4)
      std::string::operator=(a4, v16);
    else
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
    return (std::basic_regex<char> *)((char *)v4 + 2);
  }
  return v4;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  uint64_t v8;
  std::__node<char> *first;
  std::__node<char> *v10;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = operator new();
    first = this->__end_->__first_;
    *(_QWORD *)v8 = &off_24E6BDD98;
    *(_QWORD *)(v8 + 8) = first;
    std::locale::locale((std::locale *)(v8 + 16), &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    *(_BYTE *)(v8 + 40) = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = operator new();
    v10 = this->__end_->__first_;
    *(_QWORD *)v8 = &off_24E6BDDE0;
    *(_QWORD *)(v8 + 8) = v10;
    std::locale::locale((std::locale *)(v8 + 16), &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    *(_BYTE *)(v8 + 40) = v2;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &off_24E6BDE28;
  *(_QWORD *)(v5 + 8) = v7;
  *(_BYTE *)(v5 + 16) = v2;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_220F3D2A4(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  MEMORY[0x227667068](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3D328(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  uint64_t (**v11)();

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
    v11 = &off_24E6BDE70;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)v11;
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
    v11 = &off_24E6BDEB8;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &off_24E6BDF00;
  *(_QWORD *)(v5 + 8) = v7;
  *(_DWORD *)(v5 + 16) = __i;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDD98;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDD98;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x227667068);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDDE0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDDE0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x227667068);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
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

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDE70;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDE70;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x227667068);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDEB8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24E6BDEB8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x227667068);
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
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = v6;
      v10 = *(unsigned __int8 **)(a2 + 16);
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v10++;
        if (v11 != v13)
          break;
        if (!--v9)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
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

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
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
  uint64_t v10;

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
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
  uint64_t v4;
  std::__node<char> *first;
  unsigned int flags_low;
  char v7;
  int v8;
  BOOL v9;
  std::locale v11;
  std::string v12;

  v4 = operator new();
  first = this->__end_->__first_;
  flags_low = LOBYTE(this->__flags_);
  v7 = flags_low & 1;
  v8 = (flags_low >> 3) & 1;
  *(_QWORD *)(v4 + 8) = first;
  std::locale::locale((std::locale *)(v4 + 16), &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  *(_OWORD *)(v4 + 120) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
  *(_OWORD *)(v4 + 152) = 0u;
  *(_BYTE *)(v4 + 168) = __negate;
  *(_BYTE *)(v4 + 169) = v7;
  *(_BYTE *)(v4 + 170) = v8;
  std::locale::locale(&v11, (const std::locale *)(v4 + 16));
  std::locale::name(&v12, &v11);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
  {
    v9 = v12.__r_.__value_.__l.__size_ != 1 || *v12.__r_.__value_.__l.__data_ != 67;
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  else
  {
    v9 = SHIBYTE(v12.__r_.__value_.__r.__words[2]) != 1 || v12.__r_.__value_.__s.__data_[0] != 67;
  }
  std::locale::~locale(&v11);
  *(_BYTE *)(v4 + 171) = v9;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)v4;
  return (std::__bracket_expression<char, std::regex_traits<char>> *)v4;
}

void sub_220F3DC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  void (__cdecl ***v10)(std::__owns_one_state<char> *__hidden);
  std::locale *v11;
  void **v12;
  void (__cdecl **v14)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v15)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v16)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v17)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v14 = v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v15 = v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))*v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  v17 = v10[1];
  if (v17)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v17 + 1))(v17);
  MEMORY[0x227667068](v10, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v19;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return MEMORY[0x227667068](a1, 0x10F1C4061CF1F02);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v2;
  char *current;
  char *last;
  char v6;
  char v7;
  std::string::size_type size;
  int v9;
  uint64_t v10;
  _BOOL4 negate;
  std::string::size_type v12;
  std::string *p_s;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v15;
  uint64_t v16;
  char *p_second;
  std::regex_traits<char> *p_traits;
  std::vector<std::pair<std::string, std::string>>::pointer v20;
  char v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  std::string::size_type v25;
  std::string *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  BOOL v29;
  int v30;
  size_t v31;
  char *v32;
  size_t v33;
  int v34;
  _BOOL4 v35;
  int v36;
  size_t v37;
  char *v38;
  size_t v39;
  int v40;
  BOOL v41;
  char v42;
  std::string::size_type v43;
  unsigned __int8 v44;
  std::vector<char>::pointer v45;
  unint64_t v46;
  int v47;
  std::regex_traits<char>::char_class_type v48;
  char v49;
  int v50;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v52;
  char *v53;
  std::vector<std::pair<std::string, std::string>>::pointer v54;
  std::vector<std::pair<std::string, std::string>>::pointer v55;
  unsigned int v56;
  int64_t v57;
  uint64_t v58;
  unint64_t v59;
  std::string::size_type v60;
  std::string *v61;
  uint64_t v62;
  unsigned __int8 *v63;
  BOOL v64;
  int v65;
  size_t v66;
  char *v67;
  size_t v68;
  int v69;
  _BOOL4 v70;
  int v71;
  size_t v72;
  char *v73;
  size_t v74;
  int v75;
  BOOL v76;
  std::vector<std::string>::pointer v77;
  uint64_t v78;
  int64_t v79;
  unint64_t v80;
  unint64_t v81;
  const void *v82;
  size_t v83;
  std::string::size_type v84;
  uint64_t v85;
  BOOL j;
  std::string *v87;
  std::string::size_type v88;
  int v89;
  std::string *v90;
  uint64_t v91;
  std::string *v92;
  const void *v93;
  size_t v94;
  std::vector<std::string>::pointer v95;
  uint64_t v96;
  int64_t v97;
  unint64_t v98;
  unint64_t v99;
  const void *v100;
  size_t v101;
  std::string::size_type v102;
  uint64_t v103;
  BOOL i;
  std::string *v105;
  std::string::size_type v106;
  int v107;
  std::string *v108;
  uint64_t v109;
  unint64_t v110;
  const void *v111;
  size_t v112;
  std::regex_traits<char>::char_class_type v113;
  int v114;
  std::__node<char> *first;
  int v116;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v119;
  std::regex_traits<char>::char_class_type neg_mask;
  int v121;
  char v122;
  BOOL v123;
  char v124;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v125;
  uint64_t v126;
  uint64_t v127;
  std::string *v128;
  int v129;
  std::string __p;
  __int16 v131;
  std::string v132;
  std::string __s;

  v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v10 = 0;
    negate = this->__negate_;
LABEL_222:
    v129 = negate;
    goto LABEL_223;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_66;
  v6 = *current;
  LOBYTE(v131) = *current;
  v7 = current[1];
  HIBYTE(v131) = v7;
  if (this->__icase_)
  {
    LOBYTE(v131) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(v131) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  *((_BYTE *)&__s.__r_.__value_.__s + 23) = 2;
  LOWORD(__s.__r_.__value_.__l.__data_) = v131;
  __s.__r_.__value_.__s.__data_[2] = 0;
  std::__get_collation_name(&v132, (const char *)&__s);
  __p = v132;
  size = HIBYTE(v132.__r_.__value_.__r.__words[2]);
  v9 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
  if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v132.__r_.__value_.__l.__size_;
  if (size)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v12 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    v12 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      goto LABEL_15;
    p_s = &__s;
  }
  (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, char *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v132, this->__traits_.__col_, p_s, (char *)p_s + v12);
  if (v9 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = v132;
  if ((SHIBYTE(v132.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (HIBYTE(v132.__r_.__value_.__r.__words[2]) != 12 && HIBYTE(v132.__r_.__value_.__r.__words[2]) != 1)
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_175;
  }
  if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
  {
LABEL_175:
    std::string::operator=(&__p, &__s);
    goto LABEL_9;
  }
  *__p.__r_.__value_.__l.__data_ = 0;
  __p.__r_.__value_.__l.__size_ = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
LABEL_15:
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((_BYTE *)&__p.__r_.__value_.__s + 23))
      goto LABEL_17;
LABEL_66:
    v129 = 0;
    v10 = 1;
    goto LABEL_67;
  }
  v43 = __p.__r_.__value_.__l.__size_;
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!v43)
    goto LABEL_66;
LABEL_17:
  begin = this->__digraphs_.__begin_;
  v15 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v15)
  {
    v16 = v15 >> 1;
    if ((unint64_t)(v15 >> 1) <= 1)
      v16 = 1;
    p_second = &begin->second;
    do
    {
      if (v131 == *(p_second - 1) && HIBYTE(v131) == *p_second)
        goto LABEL_250;
      p_second += 2;
      --v16;
    }
    while (v16);
  }
  p_traits = &this->__traits_;
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    v129 = 0;
    goto LABEL_184;
  }
  std::regex_traits<char>::transform<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v131, (char *)&v132);
  v20 = this->__ranges_.__begin_;
  v21 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v22 = (char *)this->__ranges_.__end_ - (char *)v20;
  if (v22)
  {
    v23 = 0;
    v24 = v22 / 48;
    v122 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v25 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    else
      v25 = __s.__r_.__value_.__l.__size_;
    if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v26 = &__s;
    else
      v26 = (std::string *)__s.__r_.__value_.__r.__words[0];
    if (v24 <= 1)
      v27 = 1;
    else
      v27 = v22 / 48;
    v28 = (unsigned __int8 *)&v20->second.__r_.__value_.__r.__words[2] + 7;
    v29 = 1;
    while (1)
    {
      v30 = (char)*(v28 - 24);
      if (v30 >= 0)
        v31 = *(v28 - 24);
      else
        v31 = *(_QWORD *)(v28 - 39);
      if (v30 >= 0)
        v32 = (char *)(v28 - 47);
      else
        v32 = *(char **)(v28 - 47);
      if (v31 >= v25)
        v33 = v25;
      else
        v33 = v31;
      v34 = memcmp(v26, v32, v33);
      v35 = v25 >= v31;
      if (v34)
        v35 = v34 >= 0;
      if (v35)
      {
        v36 = (char)*v28;
        if (v36 >= 0)
          v37 = *v28;
        else
          v37 = *(_QWORD *)(v28 - 15);
        if (v36 >= 0)
          v38 = (char *)(v28 - 23);
        else
          v38 = *(char **)(v28 - 23);
        if (v25 >= v37)
          v39 = v37;
        else
          v39 = v25;
        v40 = memcmp(v38, v26, v39);
        v41 = v37 >= v25;
        if (v40)
          v41 = v40 >= 0;
        if (v41)
          break;
      }
      v29 = ++v23 < v24;
      v28 += 48;
      if (v27 == v23)
      {
        v129 = 0;
        v42 = 1;
        goto LABEL_178;
      }
    }
    v42 = 0;
    v129 = 1;
LABEL_178:
    p_traits = &this->__traits_;
    v21 = v122;
  }
  else
  {
    v29 = 0;
    v129 = 0;
    v42 = 1;
  }
  if (v21 < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (!v29)
  {
LABEL_184:
    if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
      goto LABEL_232;
    std::regex_traits<char>::__transform_primary<char *>((uint64_t)&__s, (uint64_t)p_traits, (char *)&v131, (char *)&v132);
    v95 = this->__equivalences_.__begin_;
    v96 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    v97 = (char *)this->__equivalences_.__end_ - (char *)v95;
    if (v97)
    {
      v98 = 0;
      v99 = v97 / 24;
      v101 = __s.__r_.__value_.__l.__size_;
      v100 = (const void *)__s.__r_.__value_.__r.__words[0];
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v102 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      else
        v102 = __s.__r_.__value_.__l.__size_;
      if (v99 <= 1)
        v103 = 1;
      else
        v103 = v97 / 24;
      for (i = 1; ; i = v98 < v99)
      {
        v105 = &v95[v98];
        v106 = HIBYTE(v105->__r_.__value_.__r.__words[2]);
        v107 = (char)v106;
        if ((v106 & 0x80u) != 0)
          v106 = v105->__r_.__value_.__l.__size_;
        if (v102 != v106)
          goto LABEL_205;
        v108 = v107 >= 0 ? &v95[v98] : (std::string *)v105->__r_.__value_.__r.__words[0];
        if ((v96 & 0x80) == 0)
          break;
        v128 = v95;
        v110 = v99;
        v111 = v100;
        v112 = v101;
        if (!memcmp(v100, v108, v101))
        {
          operator delete(__s.__r_.__value_.__l.__data_);
LABEL_230:
          if (!i)
          {
            v129 = 1;
            goto LABEL_232;
          }
LABEL_250:
          v121 = 1;
LABEL_251:
          v129 = v121;
LABEL_252:
          v10 = 2;
          goto LABEL_223;
        }
        ++v98;
        v101 = v112;
        v100 = v111;
        v99 = v110;
        v95 = v128;
        if (v98 == v103)
          goto LABEL_211;
LABEL_209:
        ;
      }
      if (!(_DWORD)v96)
        goto LABEL_230;
      v109 = 0;
      while (__s.__r_.__value_.__s.__data_[v109] == v108->__r_.__value_.__s.__data_[v109])
      {
        if (v96 == ++v109)
          goto LABEL_230;
      }
LABEL_205:
      if (++v98 == v103)
        goto LABEL_210;
      goto LABEL_209;
    }
LABEL_210:
    if ((v96 & 0x80) != 0)
LABEL_211:
      operator delete(__s.__r_.__value_.__l.__data_);
LABEL_232:
    if ((char)v131 < 0)
    {
      neg_mask = this->__neg_mask_;
    }
    else
    {
      mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      v119 = tab[v131];
      if (((v119 & mask) != 0 || v131 == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(v131) & 0x80000000) == 0
        && ((tab[HIBYTE(v131)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(v131) == 95))
      {
        goto LABEL_250;
      }
      neg_mask = this->__neg_mask_;
      if ((neg_mask & v119) != 0 || v131 == 95 && (neg_mask & 0x80) != 0)
        goto LABEL_249;
    }
    if (SHIBYTE(v131) < 0)
      goto LABEL_250;
    if ((this->__traits_.__ct_->__tab_[HIBYTE(v131)] & neg_mask) == 0)
    {
      v121 = 1;
      if (HIBYTE(v131) != 95 || (neg_mask & 0x80) == 0)
        goto LABEL_251;
    }
LABEL_249:
    v121 = v129;
    goto LABEL_251;
  }
  if ((v42 & 1) == 0)
    goto LABEL_252;
  v10 = 2;
LABEL_67:
  v44 = *v2->__current_;
  v132.__r_.__value_.__s.__data_[0] = v44;
  if (this->__icase_)
  {
    v44 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v44);
    v132.__r_.__value_.__s.__data_[0] = v44;
  }
  v45 = this->__chars_.__begin_;
  v46 = this->__chars_.__end_ - v45;
  if (v46)
  {
    if (v46 <= 1)
      v46 = 1;
    do
    {
      v47 = *v45++;
      if (v47 == v44)
        goto LABEL_221;
    }
    while (--v46);
  }
  v48 = this->__neg_mask_;
  if (v48 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v44 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v44] & v48) == 0)
    {
      v50 = (v48 >> 7) & 1;
      v49 = v44 == 95 ? v50 : 0;
    }
    else
    {
      v49 = 1;
    }
    end = this->__neg_chars_.__end_;
    v52 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v44, end - this->__neg_chars_.__begin_);
    v53 = v52 ? v52 : end;
    if ((v49 & 1) == 0 && v53 == end)
    {
LABEL_221:
      negate = 1;
      goto LABEL_222;
    }
  }
  v54 = this->__ranges_.__begin_;
  v55 = this->__ranges_.__end_;
  if (v54 != v55)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v132, &v132.__r_.__value_.__s.__data_[1]);
      v54 = this->__ranges_.__begin_;
      v55 = this->__ranges_.__end_;
      v56 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v56 = 1;
      *((_BYTE *)&__s.__r_.__value_.__s + 23) = 1;
      LOWORD(__s.__r_.__value_.__l.__data_) = v44;
    }
    v57 = (char *)v55 - (char *)v54;
    if (v57)
    {
      v126 = v10;
      v58 = 0;
      v59 = v57 / 48;
      v124 = v56;
      if ((v56 & 0x80u) == 0)
        v60 = v56;
      else
        v60 = __s.__r_.__value_.__l.__size_;
      if ((v56 & 0x80u) == 0)
        v61 = &__s;
      else
        v61 = (std::string *)__s.__r_.__value_.__r.__words[0];
      if (v59 <= 1)
        v62 = 1;
      else
        v62 = v57 / 48;
      v63 = (unsigned __int8 *)&v54->second.__r_.__value_.__r.__words[2] + 7;
      v64 = 1;
      while (1)
      {
        v65 = (char)*(v63 - 24);
        if (v65 >= 0)
          v66 = *(v63 - 24);
        else
          v66 = *(_QWORD *)(v63 - 39);
        if (v65 >= 0)
          v67 = (char *)(v63 - 47);
        else
          v67 = *(char **)(v63 - 47);
        if (v66 >= v60)
          v68 = v60;
        else
          v68 = v66;
        v69 = memcmp(v61, v67, v68);
        v70 = v60 >= v66;
        if (v69)
          v70 = v69 >= 0;
        if (v70)
        {
          v71 = (char)*v63;
          if (v71 >= 0)
            v72 = *v63;
          else
            v72 = *(_QWORD *)(v63 - 15);
          if (v71 >= 0)
            v73 = (char *)(v63 - 23);
          else
            v73 = *(char **)(v63 - 23);
          if (v60 >= v72)
            v74 = v72;
          else
            v74 = v60;
          v75 = memcmp(v73, v61, v74);
          v76 = v72 >= v60;
          if (v75)
            v76 = v75 >= 0;
          if (v76)
            break;
        }
        v64 = ++v58 < v59;
        v63 += 48;
        if (v62 == v58)
          goto LABEL_140;
      }
      v129 = 1;
LABEL_140:
      v10 = v126;
      if ((v124 & 0x80) == 0)
        goto LABEL_142;
    }
    else
    {
      v64 = 0;
      if ((v56 & 0x80) == 0)
        goto LABEL_142;
    }
    operator delete(__s.__r_.__value_.__l.__data_);
LABEL_142:
    if (v64)
      goto LABEL_223;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_216;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v132, &v132.__r_.__value_.__s.__data_[1]);
  v77 = this->__equivalences_.__begin_;
  v78 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v79 = (char *)this->__equivalences_.__end_ - (char *)v77;
  if (!v79)
  {
    if ((*((_BYTE *)&__s.__r_.__value_.__s + 23) & 0x80) != 0)
      operator delete(__s.__r_.__value_.__l.__data_);
LABEL_216:
    if (v132.__r_.__value_.__s.__data_[0] < 0)
      goto LABEL_223;
    v113 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v132.__r_.__value_.__s.__data_[0]] & v113) == 0)
    {
      v114 = (v113 >> 7) & 1;
      if (v132.__r_.__value_.__s.__data_[0] != 95)
        v114 = 0;
      if (v114 != 1)
        goto LABEL_223;
    }
    goto LABEL_221;
  }
  v127 = v10;
  v80 = 0;
  v81 = v79 / 24;
  v83 = __s.__r_.__value_.__l.__size_;
  v82 = (const void *)__s.__r_.__value_.__r.__words[0];
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v84 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  else
    v84 = __s.__r_.__value_.__l.__size_;
  if (v81 <= 1)
    v85 = 1;
  else
    v85 = v79 / 24;
  for (j = 1; ; j = v80 < v81)
  {
    v87 = &v77[v80];
    v88 = HIBYTE(v87->__r_.__value_.__r.__words[2]);
    v89 = (char)v88;
    if ((v88 & 0x80u) != 0)
      v88 = v87->__r_.__value_.__l.__size_;
    if (v84 == v88)
      break;
LABEL_164:
    if (++v80 == v85)
    {
      if ((v78 & 0x80) != 0)
LABEL_214:
        operator delete(__s.__r_.__value_.__l.__data_);
      v10 = v127;
      goto LABEL_216;
    }
LABEL_168:
    ;
  }
  if (v89 >= 0)
    v90 = &v77[v80];
  else
    v90 = (std::string *)v87->__r_.__value_.__r.__words[0];
  if ((v78 & 0x80) == 0)
  {
    if (!(_DWORD)v78)
    {
LABEL_169:
      v129 = 1;
      v10 = v127;
      if (!j)
        goto LABEL_216;
      goto LABEL_223;
    }
    v91 = 0;
    while (__s.__r_.__value_.__s.__data_[v91] == v90->__r_.__value_.__s.__data_[v91])
    {
      if (v78 == ++v91)
        goto LABEL_169;
    }
    goto LABEL_164;
  }
  v123 = j;
  v125 = v2;
  v92 = v77;
  v93 = v82;
  v94 = v83;
  if (memcmp(v82, v90, v83))
  {
    ++v80;
    v83 = v94;
    v82 = v93;
    v77 = v92;
    v2 = v125;
    if (v80 == v85)
      goto LABEL_214;
    goto LABEL_168;
  }
  operator delete(__s.__r_.__value_.__l.__data_);
  v129 = 1;
  v2 = v125;
  v10 = v127;
  if (!v123)
    goto LABEL_216;
LABEL_223:
  if (v129 == this->__negate_)
  {
    first = 0;
    v116 = -993;
  }
  else
  {
    v2->__current_ += v10;
    first = this->__first_;
    v116 = -995;
  }
  v2->__do_ = v116;
  v2->__node_ = first;
}

void sub_220F3EAD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v5;
  void **v6;
  void *__p[2];
  unsigned __int8 v8;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a3, a4, a4 - a3);
  v5 = v8;
  if ((v8 & 0x80u) == 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if ((v8 & 0x80u) != 0)
    v5 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0)
    operator delete(__p[0]);
}

void sub_220F3EB9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<char *,char *>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a3, a4, a4 - a3);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a1 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a1 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a1;
      else
        v10 = *(_BYTE **)a1;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_220F3ED40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3ED94(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v5;
  char *v6;
  char *v7;
  char *i;
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
  for (i = a2; ; v7 = i)
  {
    v9 = *i++;
    if (v9 == 46 && *i == 93)
      break;
    if (a2 == v5)
      goto LABEL_15;
    ++v6;
    --v5;
  }
  if (v7 == a3)
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)&v13, a1, a2, v6);
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

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4, uint64_t a5)
{
  int locale_low;
  int v8;
  int v9;
  char v10;
  char v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  std::string::value_type v15;
  std::string *v16;
  unint64_t *v18;
  unint64_t v19;
  _BYTE *v20;
  unint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  void *v26;
  unint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  unint64_t v30;
  size_t v31;
  _BYTE *v32;
  uint64_t v33;
  char *v34;
  _BYTE *v35;
  char v36;
  unint64_t v37;
  _BYTE *v38;
  unint64_t v39;
  unint64_t v40;
  size_t v41;
  char *v42;
  char *v43;
  _BYTE *v44;
  char v45;
  _BYTE *v46;
  char v47;

  if (this == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 97)
  {
    if (locale_low <= 82)
    {
      if (LOBYTE(this->__traits_.__loc_.__locale_))
      {
        if (locale_low == 68)
        {
          v8 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_23:
          *(_DWORD *)(a5 + 164) = v8;
          return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
        }
        return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
      }
      v15 = 0;
      v16 = a4;
      goto LABEL_21;
    }
    if (locale_low == 83)
    {
      v8 = *(_DWORD *)(a5 + 164) | 0x4000;
      goto LABEL_23;
    }
    if (locale_low != 87)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
    *(_DWORD *)(a5 + 164) |= 0x500u;
    if (*(_BYTE *)(a5 + 169))
    {
      v10 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a5 + 24) + 40))(*(_QWORD *)(a5 + 24), 95);
      v11 = v10;
      v13 = *(_BYTE **)(a5 + 72);
      v12 = *(_QWORD *)(a5 + 80);
      if ((unint64_t)v13 < v12)
      {
        *v13 = v10;
        v14 = (uint64_t)(v13 + 1);
LABEL_55:
        *(_QWORD *)(a5 + 72) = v14;
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      v27 = *(_QWORD *)(a5 + 64);
      v28 = &v13[-v27];
      v29 = (uint64_t)&v13[-v27 + 1];
      if (v29 >= 0)
      {
        v30 = v12 - v27;
        if (2 * v30 > v29)
          v29 = 2 * v30;
        if (v30 >= 0x3FFFFFFFFFFFFFFFLL)
          v31 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v31 = v29;
        if (v31)
          v32 = operator new(v31);
        else
          v32 = 0;
        v34 = &v32[v31];
        v28[(_QWORD)v32] = v11;
        v14 = (uint64_t)&v28[(_QWORD)v32 + 1];
        if (v13 == (_BYTE *)v27)
        {
          v32 = &v28[(_QWORD)v32];
        }
        else
        {
          v35 = &v13[~v27];
          do
          {
            v36 = *--v13;
            (v35--)[(_QWORD)v32] = v36;
          }
          while (v13 != (_BYTE *)v27);
          v13 = *(_BYTE **)(a5 + 64);
        }
        *(_QWORD *)(a5 + 64) = v32;
        *(_QWORD *)(a5 + 72) = v14;
        *(_QWORD *)(a5 + 80) = v34;
        if (v13)
          operator delete(v13);
        goto LABEL_55;
      }
LABEL_80:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    }
    v18 = (unint64_t *)(a5 + 64);
    v20 = *(_BYTE **)(a5 + 72);
    v19 = *(_QWORD *)(a5 + 80);
    if (*(_BYTE *)(a5 + 170))
    {
      if ((unint64_t)v20 >= v19)
      {
        v21 = *v18;
        v22 = &v20[-*v18];
        v23 = (unint64_t)(v22 + 1);
        if ((uint64_t)(v22 + 1) < 0)
          goto LABEL_80;
        v24 = v19 - v21;
        if (2 * v24 > v23)
          v23 = 2 * v24;
        if (v24 >= 0x3FFFFFFFFFFFFFFFLL)
          v25 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = v23;
        if (v25)
          v26 = operator new(v25);
        else
          v26 = 0;
        v42 = &v22[(_QWORD)v26];
        v43 = (char *)v26 + v25;
        v22[(_QWORD)v26] = 95;
        v33 = (uint64_t)&v22[(_QWORD)v26 + 1];
        if (v20 != (_BYTE *)v21)
        {
          v44 = &v20[~v21];
          do
          {
            v45 = *--v20;
            (v44--)[(_QWORD)v26] = v45;
          }
          while (v20 != (_BYTE *)v21);
LABEL_73:
          v20 = (_BYTE *)*v18;
          goto LABEL_75;
        }
        goto LABEL_74;
      }
    }
    else if ((unint64_t)v20 >= v19)
    {
      v37 = *v18;
      v38 = &v20[-*v18];
      v39 = (unint64_t)(v38 + 1);
      if ((uint64_t)(v38 + 1) < 0)
        goto LABEL_80;
      v40 = v19 - v37;
      if (2 * v40 > v39)
        v39 = 2 * v40;
      if (v40 >= 0x3FFFFFFFFFFFFFFFLL)
        v41 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v41 = v39;
      if (v41)
        v26 = operator new(v41);
      else
        v26 = 0;
      v42 = &v38[(_QWORD)v26];
      v43 = (char *)v26 + v41;
      v38[(_QWORD)v26] = 95;
      v33 = (uint64_t)&v38[(_QWORD)v26 + 1];
      if (v20 != (_BYTE *)v37)
      {
        v46 = &v20[~v37];
        do
        {
          v47 = *--v20;
          (v46--)[(_QWORD)v26] = v47;
        }
        while (v20 != (_BYTE *)v37);
        goto LABEL_73;
      }
LABEL_74:
      v26 = v42;
LABEL_75:
      *(_QWORD *)(a5 + 64) = v26;
      *(_QWORD *)(a5 + 72) = v33;
      *(_QWORD *)(a5 + 80) = v43;
      if (v20)
        operator delete(v20);
      goto LABEL_77;
    }
    *v20 = 95;
    v33 = (uint64_t)(v20 + 1);
LABEL_77:
    *(_QWORD *)(a5 + 72) = v33;
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  if (locale_low <= 114)
  {
    if (locale_low == 98)
    {
      v16 = a4;
      v15 = 8;
LABEL_21:
      std::string::operator=(v16, v15);
      return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    }
    if (locale_low != 100)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
    v9 = *(_DWORD *)(a5 + 160) | 0x400;
LABEL_25:
    *(_DWORD *)(a5 + 160) = v9;
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  if (locale_low == 115)
  {
    v9 = *(_DWORD *)(a5 + 160) | 0x4000;
    goto LABEL_25;
  }
  if (locale_low != 119)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, this, a3, a4);
  *(_DWORD *)(a5 + 160) |= 0x500u;
  std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
  return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3, std::string *this)
{
  int v5;
  std::string *v6;
  std::string::value_type v7;
  char *v8;
  char v9;
  int v10;
  std::string::value_type v11;

  if (a2 == a3)
LABEL_52:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  if (v5 > 97)
  {
    switch(v5)
    {
      case 'n':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        LOBYTE(v5) = 10;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }
        LOBYTE(v5) = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        LOBYTE(v5) = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        LOBYTE(v5) = 11;
        goto LABEL_49;
      default:
        if (v5 == 98)
        {
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v5 != 102)
            goto LABEL_21;
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          LOBYTE(v5) = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if (v5 > 91)
  {
    if (v5 != 92)
    {
      if (v5 != 97)
        goto LABEL_21;
      if (this)
      {
        v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      LOBYTE(v5) = 7;
LABEL_49:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
      return a2 + 1;
    }
LABEL_14:
    if (this)
    {
      v6 = this;
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  if (v5 == 34 || v5 == 47)
    goto LABEL_14;
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30)
    goto LABEL_52;
  v7 = v5 - 48;
  v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30)
      goto LABEL_39;
    v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      goto LABEL_39;
    }
  }
  v8 = a3;
LABEL_39:
  if (this)
    std::string::operator=(this, v7);
  else
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
  return v8;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  _WORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _WORD *v24;
  _WORD *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;

  if (!*(_BYTE *)(a1 + 169))
  {
    v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v8 = *(_WORD **)(a1 + 120);
    v16 = *(_QWORD *)(a1 + 128);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v8 < v16)
        goto LABEL_24;
      v17 = *(_QWORD *)(a1 + 112);
      v18 = (uint64_t)v8 - v17;
      if ((uint64_t)v8 - v17 > -3)
      {
        v19 = v18 >> 1;
        v20 = v16 - v17;
        if (v20 <= (v18 >> 1) + 1)
          v21 = v19 + 1;
        else
          v21 = v20;
        if (v20 >= 0x7FFFFFFFFFFFFFFELL)
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v22 = v21;
        if (v22)
          v22 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v22);
        else
          v23 = 0;
        v25 = (_WORD *)(v22 + 2 * v19);
        v26 = v22 + 2 * v23;
        *v25 = v6;
        v24 = v25 + 1;
        v37 = *(char **)(a1 + 112);
        v27 = *(char **)(a1 + 120);
        if (v27 == v37)
          goto LABEL_46;
        do
        {
          v38 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--v25 = v38;
        }
        while (v27 != v37);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v8 < v16)
        goto LABEL_24;
      v30 = *(_QWORD *)(a1 + 112);
      v31 = (uint64_t)v8 - v30;
      if ((uint64_t)v8 - v30 > -3)
      {
        v32 = v31 >> 1;
        v33 = v16 - v30;
        if (v33 <= (v31 >> 1) + 1)
          v34 = v32 + 1;
        else
          v34 = v33;
        if (v33 >= 0x7FFFFFFFFFFFFFFELL)
          v35 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v35 = v34;
        if (v35)
          v35 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v35);
        else
          v36 = 0;
        v25 = (_WORD *)(v35 + 2 * v32);
        v26 = v35 + 2 * v36;
        *v25 = v6;
        v24 = v25 + 1;
        v39 = *(char **)(a1 + 112);
        v27 = *(char **)(a1 + 120);
        if (v27 == v39)
          goto LABEL_46;
        do
        {
          v40 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--v25 = v40;
        }
        while (v27 != v39);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3) << 8);
  v8 = *(_WORD **)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  if ((unint64_t)v8 < v7)
  {
LABEL_24:
    *v8 = v6;
    v24 = v8 + 1;
    goto LABEL_48;
  }
  v9 = *(_QWORD *)(a1 + 112);
  v10 = (uint64_t)v8 - v9;
  if ((uint64_t)v8 - v9 <= -3)
    goto LABEL_49;
  v11 = v10 >> 1;
  v12 = v7 - v9;
  if (v12 <= (v10 >> 1) + 1)
    v13 = v11 + 1;
  else
    v13 = v12;
  if (v12 >= 0x7FFFFFFFFFFFFFFELL)
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = v13;
  if (v14)
    v14 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v14);
  else
    v15 = 0;
  v25 = (_WORD *)(v14 + 2 * v11);
  v26 = v14 + 2 * v15;
  *v25 = v6;
  v24 = v25 + 1;
  v28 = *(char **)(a1 + 112);
  v27 = *(char **)(a1 + 120);
  if (v27 == v28)
    goto LABEL_46;
  do
  {
    v29 = *((_WORD *)v27 - 1);
    v27 -= 2;
    *--v25 = v29;
  }
  while (v27 != v28);
LABEL_45:
  v27 = *(char **)(a1 + 112);
LABEL_46:
  *(_QWORD *)(a1 + 112) = v25;
  *(_QWORD *)(a1 + 120) = v24;
  *(_QWORD *)(a1 + 128) = v26;
  if (v27)
    operator delete(v27);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v24;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3F610(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a3, a4, a4 - a3);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a1 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a1 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a1 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v13, *(_QWORD *)(a2 + 16), v10, (char *)v10 + size);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  *(std::string *)a1 = v13;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a1 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a1 = 0;
      *(_BYTE *)(a1 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a1 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a1, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_220F3F790(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3F7FC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  unint64_t v5;
  void **v6;
  void *__p[2];
  unsigned __int8 v8;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a3, a4, a4 - a3);
  v5 = v8;
  if ((v8 & 0x80u) == 0)
    v6 = __p;
  else
    v6 = (void **)__p[0];
  if ((v8 & 0x80u) != 0)
    v5 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0)
    operator delete(__p[0]);
}

void sub_220F3F89C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3F8F0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1)
{
  if (a1 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a1);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
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

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
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
  uint64_t v17;
  unsigned int loop_count;
  std::__node<char> *v19;
  std::__node<char> *v20;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = (_QWORD *)operator new();
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new();
  loop_count = this->__loop_count_;
  v19 = __s->__first_;
  *(_QWORD *)v17 = &off_24E6BE020;
  *(_QWORD *)(v17 + 8) = v19;
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = __min;
  *(_QWORD *)(v17 + 32) = __max;
  *(_DWORD *)(v17 + 40) = loop_count;
  *(_DWORD *)(v17 + 44) = v9;
  *(_DWORD *)(v17 + 48) = v8;
  *(_BYTE *)(v17 + 52) = __greedy;
  __s->__first_ = 0;
  v20 = (std::__node<char> *)operator new();
  v20->__vftable = (std::__node<char>_vtbl *)&off_24E6BE0B0;
  v20[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v20;
  this->__end_ = *(std::__owns_one_state<char> **)(v17 + 16);
  __s->__first_ = (std::__node<char> *)v17;
  ++this->__loop_count_;
}

void sub_220F3FBD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(unsigned __int8 *result, unsigned __int8 *a2, int *a3)
{
  int v3;
  int v4;
  int v5;

  if (result != a2)
  {
    v3 = *result;
    if ((v3 & 0xF8) == 0x30 || (v3 & 0xFE) == 0x38)
    {
      v4 = v3 - 48;
      *a3 = v4;
      if (++result == a2)
      {
        return a2;
      }
      else
      {
        while (1)
        {
          v5 = *result;
          if ((v5 & 0xF8) != 0x30 && (v5 & 0xFE) != 0x38)
            break;
          if (v4 >= 214748364)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          v4 = v5 + 10 * v4 - 48;
          *a3 = v4;
          if (++result == a2)
            return a2;
        }
      }
    }
  }
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3FCC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x227666BDC](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F3FD14(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BE080;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BE080;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x227667068);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BE080;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BE080;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x227667068);
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = (_BYTE *)(a2[4] + 24 * v4 + 16);
    do
    {
      *((_QWORD *)v7 - 2) = v5;
      *((_QWORD *)v7 - 1) = v5;
      *v7 = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void std::__repeat_one_loop<char>::~__repeat_one_loop()
{
  JUMPOUT(0x227667068);
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

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BE080;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24E6BE080;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x227667068);
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

void std::__empty_non_own_state<char>::~__empty_non_own_state()
{
  JUMPOUT(0x227667068);
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
  MEMORY[0x227666BDC](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_220F4018C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v3;
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  int v8;
  char *v9;
  char *v10;
  int v12;
  std::__node<char> *v13;
  std::__owns_one_state<char> *v14;
  std::__node<char> *first;
  size_t v16;
  int v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  char *v21;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  char *v25;
  int v26;
  unsigned __int8 *v27;
  size_t v28;
  size_t v29;
  _BOOL4 v30;
  uint64_t v31;
  std::basic_regex<char> *v32;
  int v33;
  int v34;

  v3 = a2;
  if (a2 == a3)
    return v3;
  end = a1->__end_;
  marked_count = a1->__marked_count_;
  v9 = a2 + 1;
  v8 = *a2;
  if (a2 + 1 == a3 && v8 == 36)
    goto LABEL_4;
  if ((v8 - 46) > 0x2E || ((1 << (v8 - 46)) & 0x600000000001) == 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v8);
    goto LABEL_17;
  }
  if (v9 != a3 && v8 == 92)
  {
    v12 = *v9;
    if ((v12 - 36) <= 0x3A && ((1 << (v12 - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v12);
      v10 = v3 + 2;
      goto LABEL_18;
    }
  }
  if (*a2 == 46)
  {
    v13 = (std::__node<char> *)operator new();
    v14 = a1->__end_;
    first = v14->__first_;
    v13->__vftable = (std::__node<char>_vtbl *)&off_24E6BE188;
    v13[1].__vftable = (std::__node<char>_vtbl *)first;
    v14->__first_ = v13;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
LABEL_17:
    v10 = v3 + 1;
    goto LABEL_18;
  }
LABEL_4:
  v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)a1, a2, a3);
LABEL_18:
  if (v3 == v10)
  {
    if (v9 == a3 || *v3 != 92)
      return v3;
    v18 = *v9;
    if (v18 == 40)
    {
      v19 = (uint64_t)(v3 + 2);
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
      v20 = a1->__marked_count_;
      do
      {
        v21 = (char *)v19;
        v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<std::__wrap_iter<char const*>>(a1, v19, a3);
      }
      while (v21 != (char *)v19);
      if (v21 == a3 || v21 + 1 == a3 || *v21 != 92 || v21[1] != 41)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      v10 = v21 + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, v20);
    }
    else
    {
      v30 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, v18);
      v31 = 2;
      if (!v30)
        v31 = 0;
      v10 = &v3[v31];
    }
  }
  if (v10 != v3)
  {
    if (v10 == a3)
      return a3;
    v16 = a1->__marked_count_ + 1;
    v17 = *v10;
    if (v17 == 42)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, end, marked_count + 1, a1->__marked_count_ + 1, 1);
      return ++v10;
    }
    if (v10 + 1 == a3 || v17 != 92 || v10[1] != 123)
      return v10;
    v23 = (unsigned __int8 *)(v10 + 2);
    v34 = 0;
    v24 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(v23, (unsigned __int8 *)a3, &v34);
    if (v23 == v24)
LABEL_48:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    if (v24 != (unsigned __int8 *)a3)
    {
      v25 = (char *)(v24 + 1);
      v26 = *v24;
      if (v26 == 44)
      {
        v33 = -1;
        v27 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<std::__wrap_iter<char const*>>(v24 + 1, (unsigned __int8 *)a3, &v33);
        if (v27 != (unsigned __int8 *)a3 && v27 + 1 != (unsigned __int8 *)a3 && *v27 == 92 && v27[1] == 125)
        {
          v29 = v33;
          v28 = v34;
          if (v33 == -1)
          {
            v29 = -1;
          }
          else if (v33 < v34)
          {
            goto LABEL_48;
          }
          v10 = (char *)&v27[2 * (v27[1] == 125)];
          v32 = a1;
LABEL_58:
          std::basic_regex<char,std::regex_traits<char>>::__push_loop(v32, v28, v29, end, marked_count + 1, v16, 1);
          return v10;
        }
      }
      else if (v25 != a3 && v26 == 92 && *v25 == 125)
      {
        v10 = (char *)(v24 + 2);
        v28 = v34;
        v32 = a1;
        v29 = v34;
        goto LABEL_58;
      }
    }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  }
  return v3;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x227667068);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
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

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  do
  {
    v7 = v6;
    v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (char *)v6, a3);
  }
  while (v7 != v6);
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned __int8 *v11;
  int v12;
  std::basic_regex<char>::value_type v13;
  char *v14;
  _BOOL4 v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (**v25)();
  unsigned int v26;
  char *v27;
  char *v28;

  v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  if (a2 == a3)
  {
LABEL_24:
    v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
    goto LABEL_25;
  }
  v8 = *a2;
  v9 = *a2;
  v10 = (v8 - 36);
  if (v10 > 0x3A)
    goto LABEL_13;
  if (((1 << (v8 - 36)) & 0x5800000080004D1) == 0)
  {
    if (v10 == 5)
    {
      if (*(_DWORD *)(a1 + 36))
        goto LABEL_4;
LABEL_14:
      std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v9);
LABEL_33:
      v11 = (unsigned __int8 *)(a2 + 1);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v11, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
LABEL_13:
    if ((v8 - 123) < 2)
      goto LABEL_4;
    goto LABEL_14;
  }
LABEL_4:
  v11 = (unsigned __int8 *)(a2 + 1);
  if (a2 + 1 == a3 || v9 != 92)
  {
LABEL_22:
    if (v9 == 46)
    {
      v17 = (_QWORD *)operator new();
      v18 = *(_QWORD *)(a1 + 56);
      v19 = *(_QWORD *)(v18 + 8);
      *v17 = &off_24E6BE188;
      v17[1] = v19;
      *(_QWORD *)(v18 + 8) = v17;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v11, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    goto LABEL_24;
  }
  v12 = (char)*v11;
  v13 = *v11;
  if ((v12 - 36) <= 0x3A && ((1 << (v12 - 36)) & 0x5800000080004F1) != 0
    || (v12 - 123) < 3)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v13);
    v11 = (unsigned __int8 *)(a2 + 2);
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v11, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
  {
    v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2 + 1, a3, 0);
  }
  else
  {
    v15 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v13);
    v16 = 2;
    if (!v15)
      v16 = 0;
    v14 = &a2[v16];
  }
  if (v14 == a2)
  {
    v9 = *a2;
    goto LABEL_22;
  }
LABEL_25:
  if (v14 != a2 || v14 == a3)
    goto LABEL_37;
  v20 = *a2;
  switch(v20)
  {
    case '$':
      v21 = operator new();
      v22 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(_QWORD *)(v23 + 8);
      v25 = &off_24E6BDC78;
      goto LABEL_32;
    case '(':
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression((std::basic_regex<char> *)a1);
      v26 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      v27 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(a1, a2 + 1, a3);
      if (v27 == a3 || (v28 = v27, *v27 != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression((std::basic_regex<char> *)a1, v26);
      --*(_DWORD *)(a1 + 36);
      v14 = v28 + 1;
LABEL_37:
      v11 = (unsigned __int8 *)v14;
      if (v14 != a2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(a1, v11, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
      return (unsigned __int8 *)a2;
    case '^':
      v21 = operator new();
      v22 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v23 = *(_QWORD *)(a1 + 56);
      v24 = *(_QWORD *)(v23 + 8);
      v25 = &off_24E6BDC30;
LABEL_32:
      *(_QWORD *)v21 = v25;
      *(_QWORD *)(v21 + 8) = v24;
      *(_BYTE *)(v21 + 16) = v22;
      *(_QWORD *)(v23 + 8) = v21;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      goto LABEL_33;
  }
  return (unsigned __int8 *)a2;
}

__n128 std::deque<std::__state<char>>::push_back(_QWORD *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  _QWORD *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  __int128 v64;
  __n128 result;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  int64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  void *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  _QWORD *v87;

  v4 = (char *)a1[1];
  v5 = (char *)a1[2];
  v6 = (v5 - v4) >> 3;
  if (v5 == v4)
    v7 = 0;
  else
    v7 = 42 * v6 - 1;
  v8 = a1[4];
  v9 = a1[5] + v8;
  if (v7 == v9)
  {
    if (v8 < 0x2A)
    {
      v23 = (char *)a1[3];
      v24 = (uint64_t)&v23[-*a1];
      if (v6 >= v24 >> 3)
      {
        if (v23 == (char *)*a1)
          v25 = 1;
        else
          v25 = v24 >> 2;
        v87 = a1 + 3;
        v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v25);
        v84 = &v83[8 * v6];
        v85 = v84;
        v86 = &v83[8 * v26];
        v82 = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(&v83, &v82);
        v28 = v83;
        v27 = v84;
        v29 = v85;
        v30 = v86;
        v31 = a1[2];
        if (v31 == a1[1])
        {
          v47 = v84;
        }
        else
        {
          do
          {
            if (v27 == v28)
            {
              if (v29 >= v30)
              {
                if (v30 == v27)
                  v37 = 1;
                else
                  v37 = (v30 - v27) >> 2;
                v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v37);
                v28 = v38;
                v32 = &v38[(2 * v37 + 6) & 0xFFFFFFFFFFFFFFF8];
                v41 = v29 - v27;
                v40 = v29 == v27;
                v29 = v32;
                if (!v40)
                {
                  v29 = &v32[v41 & 0xFFFFFFFFFFFFFFF8];
                  v42 = 8 * (v41 >> 3);
                  v43 = v32;
                  v44 = v27;
                  do
                  {
                    v45 = *(_QWORD *)v44;
                    v44 += 8;
                    *(_QWORD *)v43 = v45;
                    v43 += 8;
                    v42 -= 8;
                  }
                  while (v42);
                }
                v30 = &v38[8 * v39];
                if (v27)
                  operator delete(v27);
              }
              else
              {
                v33 = (v30 - v29) >> 3;
                if (v33 >= -1)
                  v34 = v33 + 1;
                else
                  v34 = v33 + 2;
                v35 = v34 >> 1;
                v32 = &v27[8 * (v34 >> 1)];
                v36 = v27;
                if (v29 != v27)
                {
                  memmove(v32, v27, v29 - v27);
                  v36 = v29;
                }
                v29 = &v36[8 * v35];
                v28 = v27;
              }
            }
            else
            {
              v32 = v27;
            }
            v46 = *(_QWORD *)(v31 - 8);
            v31 -= 8;
            *((_QWORD *)v32 - 1) = v46;
            v47 = v32 - 8;
            v27 = v47;
          }
          while (v31 != a1[1]);
        }
        v62 = (char *)*a1;
        *a1 = v28;
        a1[1] = v47;
        a1[2] = v29;
        a1[3] = v30;
        if (v62)
          operator delete(v62);
        goto LABEL_54;
      }
      if (v23 != v5)
      {
        v83 = (char *)operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v83);
LABEL_54:
        v4 = (char *)a1[1];
        v9 = a1[5] + a1[4];
        goto LABEL_55;
      }
      v83 = (char *)operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v83);
      v59 = (_QWORD *)a1[1];
      v5 = (char *)a1[2];
      v61 = *v59;
      v60 = (char *)(v59 + 1);
      v11 = v61;
      a1[1] = v60;
      if (v5 == (char *)a1[3])
      {
        v67 = (uint64_t)&v60[-*a1];
        if ((unint64_t)v60 > *a1)
        {
          v68 = v67 >> 3;
          v15 = v67 >> 3 < -1;
          v69 = (v67 >> 3) + 2;
          if (v15)
            v70 = v69;
          else
            v70 = v68 + 1;
          v71 = -(v70 >> 1);
          v72 = v70 >> 1;
          v73 = &v60[-8 * v72];
          v74 = v5 - v60;
          if (v5 != v60)
          {
            memmove(&v60[-8 * v72], v60, v5 - v60);
            v60 = (char *)a1[1];
          }
          v5 = &v73[v74];
          v22 = &v60[8 * v71];
          goto LABEL_14;
        }
        if (v5 == (char *)*a1)
          v75 = 1;
        else
          v75 = (uint64_t)&v5[-*a1] >> 2;
        v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v75);
        v50 = &v49[8 * (v75 >> 2)];
        v52 = &v49[8 * v76];
        v77 = (uint64_t *)a1[1];
        v5 = v50;
        v78 = a1[2] - (_QWORD)v77;
        if (v78)
        {
          v5 = &v50[v78 & 0xFFFFFFFFFFFFFFF8];
          v79 = 8 * (v78 >> 3);
          v80 = &v49[8 * (v75 >> 2)];
          do
          {
            v81 = *v77++;
            *(_QWORD *)v80 = v81;
            v80 += 8;
            v79 -= 8;
          }
          while (v79);
        }
LABEL_47:
        v58 = (char *)*a1;
        *a1 = v49;
        a1[1] = v50;
        a1[2] = v5;
        a1[3] = v52;
        if (v58)
        {
          operator delete(v58);
          v5 = (char *)a1[2];
        }
      }
    }
    else
    {
      a1[4] = v8 - 42;
      v12 = *(_QWORD *)v4;
      v10 = v4 + 8;
      v11 = v12;
      a1[1] = v10;
      if (v5 == (char *)a1[3])
      {
        v13 = (uint64_t)&v10[-*a1];
        if ((unint64_t)v10 > *a1)
        {
          v14 = v13 >> 3;
          v15 = v13 >> 3 < -1;
          v16 = (v13 >> 3) + 2;
          if (v15)
            v17 = v16;
          else
            v17 = v14 + 1;
          v18 = -(v17 >> 1);
          v19 = v17 >> 1;
          v20 = &v10[-8 * v19];
          v21 = v5 - v10;
          if (v5 != v10)
          {
            memmove(&v10[-8 * v19], v10, v5 - v10);
            v5 = (char *)a1[1];
          }
          v22 = &v5[8 * v18];
          v5 = &v20[v21];
LABEL_14:
          a1[1] = v22;
          a1[2] = v5;
          goto LABEL_50;
        }
        if (v5 == (char *)*a1)
          v48 = 1;
        else
          v48 = (uint64_t)&v5[-*a1] >> 2;
        v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v48);
        v50 = &v49[8 * (v48 >> 2)];
        v52 = &v49[8 * v51];
        v53 = (uint64_t *)a1[1];
        v5 = v50;
        v54 = a1[2] - (_QWORD)v53;
        if (v54)
        {
          v5 = &v50[v54 & 0xFFFFFFFFFFFFFFF8];
          v55 = 8 * (v54 >> 3);
          v56 = &v49[8 * (v48 >> 2)];
          do
          {
            v57 = *v53++;
            *(_QWORD *)v56 = v57;
            v56 += 8;
            v55 -= 8;
          }
          while (v55);
        }
        goto LABEL_47;
      }
    }
LABEL_50:
    *(_QWORD *)v5 = v11;
    a1[2] += 8;
    goto LABEL_54;
  }
LABEL_55:
  v63 = *(_QWORD *)&v4[8 * (v9 / 0x2A)] + 96 * (v9 % 0x2A);
  v64 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v63 = *(_OWORD *)a2;
  *(_OWORD *)(v63 + 16) = v64;
  *(_QWORD *)(v63 + 40) = 0;
  *(_QWORD *)(v63 + 48) = 0;
  *(_QWORD *)(v63 + 32) = 0;
  *(_OWORD *)(v63 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v63 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v63 + 56) = 0;
  *(_QWORD *)(v63 + 64) = 0;
  *(_QWORD *)(v63 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v63 + 56) = result;
  *(_QWORD *)(v63 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v66 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v63 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v63 + 80) = v66;
  ++a1[5];
  return result;
}

void sub_220F40E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  void *v10;

  operator delete(v10);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::deque<std::__state<char>>::pop_back(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[5] + a1[4] - 1;
  std::allocator<std::__state<char>>::destroy[abi:ne180100]((_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v2 / 0x2A))
                                                                     + 96 * (v2 % 0x2A)));
  v3 = a1[2];
  v4 = v3 == a1[1];
  v5 = 42 * ((v3 - a1[1]) >> 3) - 1;
  v7 = a1[4];
  v6 = a1[5];
  a1[5] = v6 - 1;
  if (v4)
    v5 = 0;
  if ((unint64_t)(v5 - (v6 + v7) - 83) <= 0xFFFFFFFFFFFFFFABLL)
  {
    operator delete(*(void **)(v3 - 8));
    a1[2] -= 8;
  }
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(_QWORD *a1, _QWORD *a2)
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
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v16);
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

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, _QWORD *a2)
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
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v11);
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

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  void **v5;
  char *v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    v3 = *(void ***)(a1 + 8);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = &v2[v4 / 0x2A];
    v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    v7 = (unint64_t)v2[(*(_QWORD *)(a1 + 40) + v4) / 0x2A] + 96 * ((*(_QWORD *)(a1 + 40) + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        std::allocator<std::__state<char>>::destroy[abi:ne180100](v6);
        v6 += 96;
        if (v6 - (_BYTE *)*v5 == 4032)
        {
          v8 = (char *)v5[1];
          ++v5;
          v6 = v8;
        }
      }
      while (v6 != (char *)v7);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
  }
  *(_QWORD *)(a1 + 40) = 0;
  v9 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v9 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v10 = v9 >> 3;
  if (v10 == 1)
  {
    v11 = 21;
    goto LABEL_14;
  }
  if (v10 == 2)
  {
    v11 = 42;
LABEL_14:
    *(_QWORD *)(a1 + 32) = v11;
  }
  if (v2 != v3)
  {
    do
    {
      v12 = *v2++;
      operator delete(v12);
    }
    while (v2 != v3);
    v14 = *(_QWORD *)(a1 + 8);
    v13 = *(_QWORD *)(a1 + 16);
    if (v13 != v14)
      *(_QWORD *)(a1 + 16) = v13 + ((v14 - v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::vector<dmlc::io::FileInfo>::__push_back_slow_path<dmlc::io::FileInfo const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  void *v10;
  std::string *v11;
  std::string::value_type *v12;
  char *v13;
  uint64_t *v14;

  v3 = 0x2E8BA2E8BA2E8BA3 * ((a1[1] - *a1) >> 3);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x2E8BA2E8BA2E8BALL)
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  if (0x5D1745D1745D1746 * ((a1[2] - *a1) >> 3) > v4)
    v4 = 0x5D1745D1745D1746 * ((a1[2] - *a1) >> 3);
  if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((a1[2] - *a1) >> 3)) >= 0x1745D1745D1745DLL)
    v6 = 0x2E8BA2E8BA2E8BALL;
  else
    v6 = v4;
  v14 = a1 + 2;
  if (v6)
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::io::FileInfo>>((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  v10 = v7;
  v11 = (std::string *)&v7[88 * v3];
  v13 = &v7[88 * v6];
  std::allocator<dmlc::io::FileInfo>::construct[abi:ne180100]<dmlc::io::FileInfo,dmlc::io::FileInfo const&>((_DWORD)a1 + 16, v11, a2);
  v12 = &v11[3].__r_.__value_.__s.__data_[16];
  std::vector<dmlc::io::FileInfo>::__swap_out_circular_buffer(a1, &v10);
  v8 = a1[1];
  std::__split_buffer<dmlc::io::FileInfo>::~__split_buffer(&v10);
  return v8;
}

void sub_220F413A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<dmlc::io::FileInfo>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void std::allocator<dmlc::io::FileInfo>::construct[abi:ne180100]<dmlc::io::FileInfo,dmlc::io::FileInfo const&>(int a1, std::string *this, __int128 *a3)
{
  __int128 v5;
  __int128 v6;
  std::string *v7;
  __int128 v8;
  std::string::size_type v9;

  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v5 = *a3;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  if (*((char *)a3 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a3 + 3), *((_QWORD *)a3 + 4));
  }
  else
  {
    v6 = *(__int128 *)((char *)a3 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v6;
  }
  v7 = this + 2;
  if (*((char *)a3 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *((const std::string::value_type **)a3 + 6), *((_QWORD *)a3 + 7));
  }
  else
  {
    v8 = a3[3];
    this[2].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 8);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  v9 = *((_QWORD *)a3 + 9);
  LODWORD(this[3].__r_.__value_.__r.__words[1]) = *((_DWORD *)a3 + 20);
  this[3].__r_.__value_.__r.__words[0] = v9;
}

void sub_220F41478(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

double xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::JsonTypedArray(_QWORD *a1)
{
  double result;

  *(_QWORD *)&result = 0x700000000;
  a1[1] = 0x700000000;
  *a1 = &unk_24E6B8A30;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

{
  double result;

  *(_QWORD *)&result = 0x700000000;
  a1[1] = 0x700000000;
  *a1 = &unk_24E6B8A30;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

__n128 xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::JsonTypedArray(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1->n128_u64[1] = 0x700000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6B8A30;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[1] = 0x700000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6B8A30;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

BOOL xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::operator==(uint64_t a1, _DWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;

  if (a2[3] == 7
    && (v3 = xgboost::Cast<xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7> const,xgboost::Value const>(a2),
        v4 = *(_QWORD *)(a1 + 16),
        v5 = *(_QWORD *)(a1 + 24),
        v6 = (v5 - v4) >> 2,
        v7 = v3[2],
        v6 == (v3[3] - v7) >> 2))
  {
    if (v5 == v4)
    {
      return 1;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      if (v6 <= 1)
        v10 = 1;
      else
        v10 = v6;
      do
      {
        v11 = *(float *)(v4 + 4 * v9);
        v12 = *(float *)(v7 + 4 * v9);
        if (fabsf(v11) == INFINITY)
        {
          if (fabsf(v12) != INFINITY)
            return v8;
        }
        else if ((float)(v12 - v11) != 0.0)
        {
          return v8;
        }
        v8 = ++v9 >= v6;
      }
      while (v10 != v9);
    }
  }
  else
  {
    return 0;
  }
  return v8;
}

uint64_t xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::GetArray(uint64_t a1)
{
  return a1 + 16;
}

{
  return a1 + 16;
}

{
  return a1 + 16;
}

uint64_t xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::Set(uint64_t result, uint64_t a2, float a3)
{
  *(float *)(*(_QWORD *)(result + 16) + 4 * a2) = a3;
  return result;
}

uint64_t xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::Size(uint64_t a1)
{
  return (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 2;
}

uint64_t xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 32))(a2, a1);
}

BOOL xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::IsClassOf(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12) == 7;
}

double xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::JsonTypedArray(_QWORD *a1)
{
  double result;

  *(_QWORD *)&result = 0x800000000;
  a1[1] = 0x800000000;
  *a1 = &unk_24E6BD8E0;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

{
  double result;

  *(_QWORD *)&result = 0x800000000;
  a1[1] = 0x800000000;
  *a1 = &unk_24E6BD8E0;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

__n128 xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::JsonTypedArray(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1->n128_u64[1] = 0x800000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6BD8E0;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[1] = 0x800000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6BD8E0;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

BOOL xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::operator==(uint64_t a1, _DWORD *lpsrc)
{
  _QWORD *v3;
  const void *v4;
  size_t v5;
  const void *v6;
  char *v7;

  if (lpsrc[3] == 8
  {
    return memcmp(v6, v4, v5) == 0;
  }
  else
  {
    return 0;
  }
}

uint64_t xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::GetArray(uint64_t a1)
{
  return a1 + 16;
}

{
  return a1 + 16;
}

{
  return a1 + 16;
}

uint64_t xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::Set(uint64_t result, uint64_t a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(result + 16) + a2) = a3;
  return result;
}

uint64_t xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::Size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
}

uint64_t xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 40))(a2, a1);
}

BOOL xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::IsClassOf(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12) == 8;
}

double xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::JsonTypedArray(_QWORD *a1)
{
  double result;

  *(_QWORD *)&result = 0x900000000;
  a1[1] = 0x900000000;
  *a1 = &unk_24E6BD928;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

{
  double result;

  *(_QWORD *)&result = 0x900000000;
  a1[1] = 0x900000000;
  *a1 = &unk_24E6BD928;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

__n128 xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::JsonTypedArray(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1->n128_u64[1] = 0x900000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6BD928;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[1] = 0x900000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6BD928;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

BOOL xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::operator==(uint64_t a1, _DWORD *lpsrc)
{
  _QWORD *v3;
  const void *v4;
  size_t v5;
  const void *v6;
  char *v7;

  if (lpsrc[3] == 9
  {
    return memcmp(v6, v4, v5) == 0;
  }
  else
  {
    return 0;
  }
}

uint64_t xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::GetArray(uint64_t a1)
{
  return a1 + 16;
}

{
  return a1 + 16;
}

{
  return a1 + 16;
}

uint64_t xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::Set(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(_QWORD *)(result + 16) + 4 * a2) = a3;
  return result;
}

uint64_t xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::Size(uint64_t a1)
{
  return (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 2;
}

uint64_t xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 48))(a2, a1);
}

BOOL xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::IsClassOf(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12) == 9;
}

double xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::JsonTypedArray(_QWORD *a1)
{
  double result;

  *(_QWORD *)&result = 0xA00000000;
  a1[1] = 0xA00000000;
  *a1 = &unk_24E6BD970;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

{
  double result;

  *(_QWORD *)&result = 0xA00000000;
  a1[1] = 0xA00000000;
  *a1 = &unk_24E6BD970;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  return result;
}

__n128 xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::JsonTypedArray(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1->n128_u64[1] = 0xA00000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6BD970;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[1] = 0xA00000000;
  a1->n128_u64[0] = (unint64_t)&unk_24E6BD970;
  a1[1].n128_u64[1] = 0;
  a1[2].n128_u64[0] = 0;
  a1[1].n128_u64[0] = 0;
  result = a2[1];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a2[1].n128_u64[0] = 0;
  a2[1].n128_u64[1] = 0;
  a2[2].n128_u64[0] = 0;
  return result;
}

BOOL xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::operator==(uint64_t a1, _DWORD *lpsrc)
{
  _QWORD *v3;
  const void *v4;
  size_t v5;
  const void *v6;
  char *v7;

  if (lpsrc[3] == 10
  {
    return memcmp(v6, v4, v5) == 0;
  }
  else
  {
    return 0;
  }
}

uint64_t xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::GetArray(uint64_t a1)
{
  return a1 + 16;
}

{
  return a1 + 16;
}

{
  return a1 + 16;
}

uint64_t xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::Set(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(result + 16) + 8 * a2) = a3;
  return result;
}

uint64_t xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::Size(uint64_t a1)
{
  return (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
}

uint64_t xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 56))(a2, a1);
}

BOOL xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::IsClassOf(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12) == 10;
}

uint64_t xgboost::JsonWriter::Save(uint64_t a1, _QWORD *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, a1);
}

void xgboost::JsonWriter::Visit(_QWORD *a1, uint64_t a2)
{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int v28;
  unint64_t *v29;
  unint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  _BYTE *v34;
  unint64_t v35;
  unint64_t v36;
  size_t v37;
  char *v38;
  char *v39;
  _BYTE *v40;
  _BYTE *v41;
  char v42;
  unint64_t *v43;
  unint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  unint64_t v47;
  _BYTE *v48;
  unint64_t v49;
  unint64_t v50;
  size_t v51;
  unint64_t v52;
  char *v53;
  _BYTE *v54;
  char v55;
  uint64_t v56;

  v4 = (unint64_t *)a1[1];
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
LABEL_70:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 91;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 91;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v17)
  {
    v18 = 0;
    v19 = v17 >> 3;
    v20 = v19 - 1;
    if (v19 <= 1)
      v21 = 1;
    else
      v21 = v19;
    do
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8 * v18);
      v56 = v22;
      if (v22)
      {
        v23 = (unsigned int *)(v22 + 8);
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }
      (*(void (**)(_QWORD *, uint64_t *))(*a1 + 16))(a1, &v56);
      v25 = v56;
      if (v56)
      {
        v26 = (unsigned int *)(v56 + 8);
        do
        {
          v27 = __ldxr(v26);
          v28 = v27 - 1;
        }
        while (__stlxr(v28, v26));
        if (!v28)
        {
          __dmb(9u);
          (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
        }
      }
      if (v18 != v20)
      {
        v29 = (unint64_t *)a1[1];
        v31 = (_BYTE *)v29[1];
        v30 = v29[2];
        if ((unint64_t)v31 >= v30)
        {
          v33 = *v29;
          v34 = &v31[-*v29];
          v35 = (unint64_t)(v34 + 1);
          if ((uint64_t)(v34 + 1) < 0)
            goto LABEL_70;
          v36 = v30 - v33;
          if (2 * v36 > v35)
            v35 = 2 * v36;
          if (v36 >= 0x3FFFFFFFFFFFFFFFLL)
            v37 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v37 = v35;
          if (v37)
            v38 = (char *)operator new(v37);
          else
            v38 = 0;
          v39 = &v34[(_QWORD)v38];
          v40 = &v34[(_QWORD)v38];
          *v40 = 44;
          v32 = v40 + 1;
          if (v31 != (_BYTE *)v33)
          {
            v41 = &v31[~v33];
            do
            {
              v42 = *--v31;
              (v41--)[(_QWORD)v38] = v42;
            }
            while (v31 != (_BYTE *)v33);
            v31 = (_BYTE *)*v29;
            v39 = v38;
          }
          *v29 = (unint64_t)v39;
          v29[1] = (unint64_t)v32;
          v29[2] = (unint64_t)&v38[v37];
          if (v31)
            operator delete(v31);
        }
        else
        {
          *v31 = 44;
          v32 = v31 + 1;
        }
        v29[1] = (unint64_t)v32;
      }
      ++v18;
    }
    while (v18 != v21);
  }
  v43 = (unint64_t *)a1[1];
  v45 = (_BYTE *)v43[1];
  v44 = v43[2];
  if ((unint64_t)v45 >= v44)
  {
    v47 = *v43;
    v48 = &v45[-*v43];
    v49 = (unint64_t)(v48 + 1);
    if ((uint64_t)(v48 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v50 = v44 - v47;
    if (2 * v50 > v49)
      v49 = 2 * v50;
    if (v50 >= 0x3FFFFFFFFFFFFFFFLL)
      v51 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v51 = v49;
    if (v51)
      v52 = (unint64_t)operator new(v51);
    else
      v52 = 0;
    v53 = (char *)(v52 + v51);
    v48[v52] = 93;
    v46 = (uint64_t)&v48[v52 + 1];
    if (v45 == (_BYTE *)v47)
    {
      v52 += (unint64_t)v48;
    }
    else
    {
      v54 = &v45[~v47];
      do
      {
        v55 = *--v45;
        (v54--)[v52] = v55;
      }
      while (v45 != (_BYTE *)v47);
      v45 = (_BYTE *)*v43;
    }
    *v43 = v52;
    v43[1] = v46;
    v43[2] = (unint64_t)v53;
    if (v45)
      operator delete(v45);
  }
  else
  {
    *v45 = 93;
    v46 = (uint64_t)(v45 + 1);
  }
  v43[1] = v46;
}

{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (**v22)(xgboost::JsonNumber *__hidden);
  int v23;
  uint64_t v24;
  unsigned int *v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t *v31;
  unint64_t v32;
  _BYTE *v33;
  _BYTE *v34;
  unint64_t v35;
  _BYTE *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void (**v40)(xgboost::JsonNumber *__hidden);
  unint64_t v41;
  size_t v42;
  char *v43;
  char *v44;
  _BYTE *v45;
  _BYTE *v46;
  char v47;
  unint64_t *v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  unint64_t v52;
  _BYTE *v53;
  unint64_t v54;
  unint64_t v55;
  size_t v56;
  unint64_t v57;
  char *v58;
  _BYTE *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;

  v4 = (unint64_t *)a1[1];
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
LABEL_71:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 91;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 91;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v17)
  {
    v18 = 0;
    v19 = v17 >> 2;
    v20 = v19 - 1;
    if (v19 <= 1)
      v21 = 1;
    else
      v21 = v19;
    v22 = &off_24E6BE348;
    v61 = v21;
    do
    {
      v23 = *(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v18);
      v24 = operator new();
      *(_QWORD *)v24 = v22;
      *(_DWORD *)(v24 + 16) = v23;
      v62 = v24;
      *(_QWORD *)(v24 + 8) = 0x100000000;
      v25 = (unsigned int *)(v24 + 8);
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
      (*(void (**)(_QWORD *, uint64_t *))(*a1 + 16))(a1, &v62);
      v27 = v62;
      if (v62)
      {
        v28 = (unsigned int *)(v62 + 8);
        do
        {
          v29 = __ldxr(v28);
          v30 = v29 - 1;
        }
        while (__stlxr(v30, v28));
        if (!v30)
        {
          __dmb(9u);
          (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
        }
      }
      if (v18 != v20)
      {
        v31 = (unint64_t *)a1[1];
        v33 = (_BYTE *)v31[1];
        v32 = v31[2];
        if ((unint64_t)v33 >= v32)
        {
          v35 = *v31;
          v36 = &v33[-*v31];
          v37 = (unint64_t)(v36 + 1);
          if ((uint64_t)(v36 + 1) < 0)
            goto LABEL_71;
          v38 = v20;
          v39 = a2;
          v40 = v22;
          v41 = v32 - v35;
          if (2 * v41 > v37)
            v37 = 2 * v41;
          if (v41 >= 0x3FFFFFFFFFFFFFFFLL)
            v42 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v42 = v37;
          if (v42)
            v43 = (char *)operator new(v42);
          else
            v43 = 0;
          v44 = &v36[(_QWORD)v43];
          v45 = &v36[(_QWORD)v43];
          *v45 = 44;
          v34 = v45 + 1;
          if (v33 != (_BYTE *)v35)
          {
            v46 = &v33[~v35];
            do
            {
              v47 = *--v33;
              (v46--)[(_QWORD)v43] = v47;
            }
            while (v33 != (_BYTE *)v35);
            v33 = (_BYTE *)*v31;
            v44 = v43;
          }
          *v31 = (unint64_t)v44;
          v31[1] = (unint64_t)v34;
          v31[2] = (unint64_t)&v43[v42];
          if (v33)
            operator delete(v33);
          v22 = v40;
          a2 = v39;
          v20 = v38;
          v21 = v61;
        }
        else
        {
          *v33 = 44;
          v34 = v33 + 1;
        }
        v31[1] = (unint64_t)v34;
      }
      ++v18;
    }
    while (v18 != v21);
  }
  v48 = (unint64_t *)a1[1];
  v50 = (_BYTE *)v48[1];
  v49 = v48[2];
  if ((unint64_t)v50 >= v49)
  {
    v52 = *v48;
    v53 = &v50[-*v48];
    v54 = (unint64_t)(v53 + 1);
    if ((uint64_t)(v53 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v55 = v49 - v52;
    if (2 * v55 > v54)
      v54 = 2 * v55;
    if (v55 >= 0x3FFFFFFFFFFFFFFFLL)
      v56 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v56 = v54;
    if (v56)
      v57 = (unint64_t)operator new(v56);
    else
      v57 = 0;
    v58 = (char *)(v57 + v56);
    v53[v57] = 93;
    v51 = (uint64_t)&v53[v57 + 1];
    if (v50 == (_BYTE *)v52)
    {
      v57 += (unint64_t)v53;
    }
    else
    {
      v59 = &v50[~v52];
      do
      {
        v60 = *--v50;
        (v59--)[v57] = v60;
      }
      while (v50 != (_BYTE *)v52);
      v50 = (_BYTE *)*v48;
    }
    *v48 = v57;
    v48[1] = v51;
    v48[2] = (unint64_t)v58;
    if (v50)
      operator delete(v50);
  }
  else
  {
    *v50 = 93;
    v51 = (uint64_t)(v50 + 1);
  }
  v48[1] = v51;
}

{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (**v21)(xgboost::JsonInteger *__hidden);
  uint64_t v22;
  _QWORD *v23;
  unsigned int *v24;
  unsigned int v25;
  _QWORD *v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t *v30;
  unint64_t v31;
  _BYTE *v32;
  _BYTE *v33;
  unint64_t v34;
  _BYTE *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (**v39)(xgboost::JsonInteger *__hidden);
  unint64_t v40;
  size_t v41;
  char *v42;
  char *v43;
  _BYTE *v44;
  _BYTE *v45;
  char v46;
  unint64_t *v47;
  unint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  unint64_t v51;
  _BYTE *v52;
  unint64_t v53;
  unint64_t v54;
  size_t v55;
  unint64_t v56;
  char *v57;
  _BYTE *v58;
  char v59;
  uint64_t v60;
  _QWORD *v61;

  v4 = (unint64_t *)a1[1];
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
LABEL_71:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 91;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 91;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v17)
  {
    v18 = 0;
    v19 = v17 - 1;
    if (v17 <= 1)
      v20 = 1;
    else
      v20 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
    v21 = &off_24E6BE3A8;
    v60 = v20;
    do
    {
      v22 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) + v18);
      v23 = (_QWORD *)operator new();
      *v23 = v21;
      v23[2] = v22;
      v61 = v23;
      v23[1] = 0x200000000;
      v24 = (unsigned int *)(v23 + 1);
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
      (*(void (**)(_QWORD *, _QWORD **))(*a1 + 16))(a1, &v61);
      v26 = v61;
      if (v61)
      {
        v27 = (unsigned int *)(v61 + 1);
        do
        {
          v28 = __ldxr(v27);
          v29 = v28 - 1;
        }
        while (__stlxr(v29, v27));
        if (!v29)
        {
          __dmb(9u);
          (*(void (**)(_QWORD *))(*v26 + 8))(v26);
        }
      }
      if (v18 != v19)
      {
        v30 = (unint64_t *)a1[1];
        v32 = (_BYTE *)v30[1];
        v31 = v30[2];
        if ((unint64_t)v32 >= v31)
        {
          v34 = *v30;
          v35 = &v32[-*v30];
          v36 = (unint64_t)(v35 + 1);
          if ((uint64_t)(v35 + 1) < 0)
            goto LABEL_71;
          v37 = v19;
          v38 = a2;
          v39 = v21;
          v40 = v31 - v34;
          if (2 * v40 > v36)
            v36 = 2 * v40;
          if (v40 >= 0x3FFFFFFFFFFFFFFFLL)
            v41 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v41 = v36;
          if (v41)
            v42 = (char *)operator new(v41);
          else
            v42 = 0;
          v43 = &v35[(_QWORD)v42];
          v44 = &v35[(_QWORD)v42];
          *v44 = 44;
          v33 = v44 + 1;
          if (v32 != (_BYTE *)v34)
          {
            v45 = &v32[~v34];
            do
            {
              v46 = *--v32;
              (v45--)[(_QWORD)v42] = v46;
            }
            while (v32 != (_BYTE *)v34);
            v32 = (_BYTE *)*v30;
            v43 = v42;
          }
          *v30 = (unint64_t)v43;
          v30[1] = (unint64_t)v33;
          v30[2] = (unint64_t)&v42[v41];
          if (v32)
            operator delete(v32);
          v21 = v39;
          a2 = v38;
          v19 = v37;
          v20 = v60;
        }
        else
        {
          *v32 = 44;
          v33 = v32 + 1;
        }
        v30[1] = (unint64_t)v33;
      }
      ++v18;
    }
    while (v18 != v20);
  }
  v47 = (unint64_t *)a1[1];
  v49 = (_BYTE *)v47[1];
  v48 = v47[2];
  if ((unint64_t)v49 >= v48)
  {
    v51 = *v47;
    v52 = &v49[-*v47];
    v53 = (unint64_t)(v52 + 1);
    if ((uint64_t)(v52 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v54 = v48 - v51;
    if (2 * v54 > v53)
      v53 = 2 * v54;
    if (v54 >= 0x3FFFFFFFFFFFFFFFLL)
      v55 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v55 = v53;
    if (v55)
      v56 = (unint64_t)operator new(v55);
    else
      v56 = 0;
    v57 = (char *)(v56 + v55);
    v52[v56] = 93;
    v50 = (uint64_t)&v52[v56 + 1];
    if (v49 == (_BYTE *)v51)
    {
      v56 += (unint64_t)v52;
    }
    else
    {
      v58 = &v49[~v51];
      do
      {
        v59 = *--v49;
        (v58--)[v56] = v59;
      }
      while (v49 != (_BYTE *)v51);
      v49 = (_BYTE *)*v47;
    }
    *v47 = v56;
    v47[1] = v50;
    v47[2] = (unint64_t)v57;
    if (v49)
      operator delete(v49);
  }
  else
  {
    *v49 = 93;
    v50 = (uint64_t)(v49 + 1);
  }
  v47[1] = v50;
}

{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (**v22)(xgboost::JsonInteger *__hidden);
  uint64_t v23;
  _QWORD *v24;
  unsigned int *v25;
  unsigned int v26;
  _QWORD *v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t *v31;
  unint64_t v32;
  _BYTE *v33;
  _BYTE *v34;
  unint64_t v35;
  _BYTE *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void (**v40)(xgboost::JsonInteger *__hidden);
  unint64_t v41;
  size_t v42;
  char *v43;
  char *v44;
  _BYTE *v45;
  _BYTE *v46;
  char v47;
  unint64_t *v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  unint64_t v52;
  _BYTE *v53;
  unint64_t v54;
  unint64_t v55;
  size_t v56;
  unint64_t v57;
  char *v58;
  _BYTE *v59;
  char v60;
  uint64_t v61;
  _QWORD *v62;

  v4 = (unint64_t *)a1[1];
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
LABEL_71:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 91;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 91;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v17)
  {
    v18 = 0;
    v19 = v17 >> 2;
    v20 = v19 - 1;
    if (v19 <= 1)
      v21 = 1;
    else
      v21 = v19;
    v22 = &off_24E6BE3A8;
    v61 = v21;
    do
    {
      v23 = *(int *)(*(_QWORD *)(a2 + 16) + 4 * v18);
      v24 = (_QWORD *)operator new();
      *v24 = v22;
      v24[2] = v23;
      v62 = v24;
      v24[1] = 0x200000000;
      v25 = (unsigned int *)(v24 + 1);
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
      (*(void (**)(_QWORD *, _QWORD **))(*a1 + 16))(a1, &v62);
      v27 = v62;
      if (v62)
      {
        v28 = (unsigned int *)(v62 + 1);
        do
        {
          v29 = __ldxr(v28);
          v30 = v29 - 1;
        }
        while (__stlxr(v30, v28));
        if (!v30)
        {
          __dmb(9u);
          (*(void (**)(_QWORD *))(*v27 + 8))(v27);
        }
      }
      if (v18 != v20)
      {
        v31 = (unint64_t *)a1[1];
        v33 = (_BYTE *)v31[1];
        v32 = v31[2];
        if ((unint64_t)v33 >= v32)
        {
          v35 = *v31;
          v36 = &v33[-*v31];
          v37 = (unint64_t)(v36 + 1);
          if ((uint64_t)(v36 + 1) < 0)
            goto LABEL_71;
          v38 = v20;
          v39 = a2;
          v40 = v22;
          v41 = v32 - v35;
          if (2 * v41 > v37)
            v37 = 2 * v41;
          if (v41 >= 0x3FFFFFFFFFFFFFFFLL)
            v42 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v42 = v37;
          if (v42)
            v43 = (char *)operator new(v42);
          else
            v43 = 0;
          v44 = &v36[(_QWORD)v43];
          v45 = &v36[(_QWORD)v43];
          *v45 = 44;
          v34 = v45 + 1;
          if (v33 != (_BYTE *)v35)
          {
            v46 = &v33[~v35];
            do
            {
              v47 = *--v33;
              (v46--)[(_QWORD)v43] = v47;
            }
            while (v33 != (_BYTE *)v35);
            v33 = (_BYTE *)*v31;
            v44 = v43;
          }
          *v31 = (unint64_t)v44;
          v31[1] = (unint64_t)v34;
          v31[2] = (unint64_t)&v43[v42];
          if (v33)
            operator delete(v33);
          v22 = v40;
          a2 = v39;
          v20 = v38;
          v21 = v61;
        }
        else
        {
          *v33 = 44;
          v34 = v33 + 1;
        }
        v31[1] = (unint64_t)v34;
      }
      ++v18;
    }
    while (v18 != v21);
  }
  v48 = (unint64_t *)a1[1];
  v50 = (_BYTE *)v48[1];
  v49 = v48[2];
  if ((unint64_t)v50 >= v49)
  {
    v52 = *v48;
    v53 = &v50[-*v48];
    v54 = (unint64_t)(v53 + 1);
    if ((uint64_t)(v53 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v55 = v49 - v52;
    if (2 * v55 > v54)
      v54 = 2 * v55;
    if (v55 >= 0x3FFFFFFFFFFFFFFFLL)
      v56 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v56 = v54;
    if (v56)
      v57 = (unint64_t)operator new(v56);
    else
      v57 = 0;
    v58 = (char *)(v57 + v56);
    v53[v57] = 93;
    v51 = (uint64_t)&v53[v57 + 1];
    if (v50 == (_BYTE *)v52)
    {
      v57 += (unint64_t)v53;
    }
    else
    {
      v59 = &v50[~v52];
      do
      {
        v60 = *--v50;
        (v59--)[v57] = v60;
      }
      while (v50 != (_BYTE *)v52);
      v50 = (_BYTE *)*v48;
    }
    *v48 = v57;
    v48[1] = v51;
    v48[2] = (unint64_t)v58;
    if (v50)
      operator delete(v50);
  }
  else
  {
    *v50 = 93;
    v51 = (uint64_t)(v50 + 1);
  }
  v48[1] = v51;
}

{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (**v22)(xgboost::JsonInteger *__hidden);
  uint64_t v23;
  _QWORD *v24;
  unsigned int *v25;
  unsigned int v26;
  _QWORD *v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t *v31;
  unint64_t v32;
  _BYTE *v33;
  _BYTE *v34;
  unint64_t v35;
  _BYTE *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void (**v40)(xgboost::JsonInteger *__hidden);
  unint64_t v41;
  size_t v42;
  char *v43;
  char *v44;
  _BYTE *v45;
  _BYTE *v46;
  char v47;
  unint64_t *v48;
  unint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  unint64_t v52;
  _BYTE *v53;
  unint64_t v54;
  unint64_t v55;
  size_t v56;
  unint64_t v57;
  char *v58;
  _BYTE *v59;
  char v60;
  uint64_t v61;
  _QWORD *v62;

  v4 = (unint64_t *)a1[1];
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
LABEL_71:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 91;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 91;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v17)
  {
    v18 = 0;
    v19 = v17 >> 3;
    v20 = v19 - 1;
    if (v19 <= 1)
      v21 = 1;
    else
      v21 = v19;
    v22 = &off_24E6BE3A8;
    v61 = v21;
    do
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8 * v18);
      v24 = (_QWORD *)operator new();
      *v24 = v22;
      v24[2] = v23;
      v62 = v24;
      v24[1] = 0x200000000;
      v25 = (unsigned int *)(v24 + 1);
      do
        v26 = __ldxr(v25);
      while (__stxr(v26 + 1, v25));
      (*(void (**)(_QWORD *, _QWORD **))(*a1 + 16))(a1, &v62);
      v27 = v62;
      if (v62)
      {
        v28 = (unsigned int *)(v62 + 1);
        do
        {
          v29 = __ldxr(v28);
          v30 = v29 - 1;
        }
        while (__stlxr(v30, v28));
        if (!v30)
        {
          __dmb(9u);
          (*(void (**)(_QWORD *))(*v27 + 8))(v27);
        }
      }
      if (v18 != v20)
      {
        v31 = (unint64_t *)a1[1];
        v33 = (_BYTE *)v31[1];
        v32 = v31[2];
        if ((unint64_t)v33 >= v32)
        {
          v35 = *v31;
          v36 = &v33[-*v31];
          v37 = (unint64_t)(v36 + 1);
          if ((uint64_t)(v36 + 1) < 0)
            goto LABEL_71;
          v38 = v20;
          v39 = a2;
          v40 = v22;
          v41 = v32 - v35;
          if (2 * v41 > v37)
            v37 = 2 * v41;
          if (v41 >= 0x3FFFFFFFFFFFFFFFLL)
            v42 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v42 = v37;
          if (v42)
            v43 = (char *)operator new(v42);
          else
            v43 = 0;
          v44 = &v36[(_QWORD)v43];
          v45 = &v36[(_QWORD)v43];
          *v45 = 44;
          v34 = v45 + 1;
          if (v33 != (_BYTE *)v35)
          {
            v46 = &v33[~v35];
            do
            {
              v47 = *--v33;
              (v46--)[(_QWORD)v43] = v47;
            }
            while (v33 != (_BYTE *)v35);
            v33 = (_BYTE *)*v31;
            v44 = v43;
          }
          *v31 = (unint64_t)v44;
          v31[1] = (unint64_t)v34;
          v31[2] = (unint64_t)&v43[v42];
          if (v33)
            operator delete(v33);
          v22 = v40;
          a2 = v39;
          v20 = v38;
          v21 = v61;
        }
        else
        {
          *v33 = 44;
          v34 = v33 + 1;
        }
        v31[1] = (unint64_t)v34;
      }
      ++v18;
    }
    while (v18 != v21);
  }
  v48 = (unint64_t *)a1[1];
  v50 = (_BYTE *)v48[1];
  v49 = v48[2];
  if ((unint64_t)v50 >= v49)
  {
    v52 = *v48;
    v53 = &v50[-*v48];
    v54 = (unint64_t)(v53 + 1);
    if ((uint64_t)(v53 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v55 = v49 - v52;
    if (2 * v55 > v54)
      v54 = 2 * v55;
    if (v55 >= 0x3FFFFFFFFFFFFFFFLL)
      v56 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v56 = v54;
    if (v56)
      v57 = (unint64_t)operator new(v56);
    else
      v57 = 0;
    v58 = (char *)(v57 + v56);
    v53[v57] = 93;
    v51 = (uint64_t)&v53[v57 + 1];
    if (v50 == (_BYTE *)v52)
    {
      v57 += (unint64_t)v53;
    }
    else
    {
      v59 = &v50[~v52];
      do
      {
        v60 = *--v50;
        (v59--)[v57] = v60;
      }
      while (v50 != (_BYTE *)v52);
      v50 = (_BYTE *)*v48;
    }
    *v48 = v57;
    v48[1] = v51;
    v48[2] = (unint64_t)v58;
    if (v50)
      operator delete(v50);
  }
  else
  {
    *v50 = 93;
    v51 = (uint64_t)(v50 + 1);
  }
  v48[1] = v51;
}

void xgboost::JsonWriter::Visit(_QWORD *a1, _QWORD *a2)
{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  __int128 *v17;
  __int128 *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  unint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  char *v30;
  char *v31;
  _BYTE *v32;
  _BYTE *v33;
  char v34;
  uint64_t v35;
  unsigned int *v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int v41;
  unint64_t *v42;
  unint64_t v43;
  _BYTE *v44;
  _BYTE *v45;
  unint64_t v46;
  _BYTE *v47;
  unint64_t v48;
  unint64_t v49;
  size_t v50;
  char *v51;
  char *v52;
  _BYTE *v53;
  _BYTE *v54;
  char v55;
  __int128 *v56;
  __int128 *v57;
  BOOL v58;
  unint64_t *v59;
  unint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  unint64_t v63;
  _BYTE *v64;
  unint64_t v65;
  unint64_t v66;
  size_t v67;
  unint64_t v68;
  char *v69;
  _BYTE *v70;
  char v71;
  uint64_t v72;
  _QWORD v73[4];
  char v74;

  v4 = (unint64_t *)a1[1];
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 123;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 123;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = (__int128 *)a2[2];
  v18 = (__int128 *)(a2 + 3);
  if (v17 != (__int128 *)(a2 + 3))
  {
    v19 = 0;
    v20 = a2[4] - 1;
    do
    {
      xgboost::JsonString::JsonString(v73, v17 + 2);
      (*(void (**)(_QWORD *, _QWORD *))(*a1 + 96))(a1, v73);
      v21 = (unint64_t *)a1[1];
      v23 = (_BYTE *)v21[1];
      v22 = v21[2];
      if ((unint64_t)v23 >= v22)
      {
        v25 = *v21;
        v26 = &v23[-*v21];
        v27 = (unint64_t)(v26 + 1);
        if ((uint64_t)(v26 + 1) < 0)
          std::vector<void *>::__throw_length_error[abi:ne180100]();
        v28 = v22 - v25;
        if (2 * v28 > v27)
          v27 = 2 * v28;
        if (v28 >= 0x3FFFFFFFFFFFFFFFLL)
          v29 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
          v30 = (char *)operator new(v29);
        else
          v30 = 0;
        v31 = &v26[(_QWORD)v30];
        v32 = &v26[(_QWORD)v30];
        *v32 = 58;
        v24 = v32 + 1;
        if (v23 != (_BYTE *)v25)
        {
          v33 = &v23[~v25];
          do
          {
            v34 = *--v23;
            (v33--)[(_QWORD)v30] = v34;
          }
          while (v23 != (_BYTE *)v25);
          v23 = (_BYTE *)*v21;
          v31 = v30;
        }
        *v21 = (unint64_t)v31;
        v21[1] = (unint64_t)v24;
        v21[2] = (unint64_t)&v30[v29];
        if (v23)
          operator delete(v23);
      }
      else
      {
        *v23 = 58;
        v24 = v23 + 1;
      }
      v21[1] = (unint64_t)v24;
      v35 = *((_QWORD *)v17 + 7);
      v72 = v35;
      if (v35)
      {
        v36 = (unsigned int *)(v35 + 8);
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
      }
      (*(void (**)(_QWORD *, uint64_t *))(*a1 + 16))(a1, &v72);
      v38 = v72;
      if (v72)
      {
        v39 = (unsigned int *)(v72 + 8);
        do
        {
          v40 = __ldxr(v39);
          v41 = v40 - 1;
        }
        while (__stlxr(v41, v39));
        if (!v41)
        {
          __dmb(9u);
          (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
        }
      }
      if (v19 != v20)
      {
        v42 = (unint64_t *)a1[1];
        v44 = (_BYTE *)v42[1];
        v43 = v42[2];
        if ((unint64_t)v44 >= v43)
        {
          v46 = *v42;
          v47 = &v44[-*v42];
          v48 = (unint64_t)(v47 + 1);
          if ((uint64_t)(v47 + 1) < 0)
            std::vector<void *>::__throw_length_error[abi:ne180100]();
          v49 = v43 - v46;
          if (2 * v49 > v48)
            v48 = 2 * v49;
          if (v49 >= 0x3FFFFFFFFFFFFFFFLL)
            v50 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v50 = v48;
          if (v50)
            v51 = (char *)operator new(v50);
          else
            v51 = 0;
          v52 = &v47[(_QWORD)v51];
          v53 = &v47[(_QWORD)v51];
          *v53 = 44;
          v45 = v53 + 1;
          if (v44 != (_BYTE *)v46)
          {
            v54 = &v44[~v46];
            do
            {
              v55 = *--v44;
              (v54--)[(_QWORD)v51] = v55;
            }
            while (v44 != (_BYTE *)v46);
            v44 = (_BYTE *)*v42;
            v52 = v51;
          }
          *v42 = (unint64_t)v52;
          v42[1] = (unint64_t)v45;
          v42[2] = (unint64_t)&v51[v50];
          if (v44)
            operator delete(v44);
        }
        else
        {
          *v44 = 44;
          v45 = v44 + 1;
        }
        v42[1] = (unint64_t)v45;
      }
      v73[0] = off_24E6BE2B8;
      if (v74 < 0)
        operator delete((void *)v73[2]);
      v56 = (__int128 *)*((_QWORD *)v17 + 1);
      if (v56)
      {
        do
        {
          v57 = v56;
          v56 = *(__int128 **)v56;
        }
        while (v56);
      }
      else
      {
        do
        {
          v57 = (__int128 *)*((_QWORD *)v17 + 2);
          v58 = *(_QWORD *)v57 == (_QWORD)v17;
          v17 = v57;
        }
        while (!v58);
      }
      ++v19;
      v17 = v57;
    }
    while (v57 != v18);
  }
  v59 = (unint64_t *)a1[1];
  v61 = (_BYTE *)v59[1];
  v60 = v59[2];
  if ((unint64_t)v61 >= v60)
  {
    v63 = *v59;
    v64 = &v61[-*v59];
    v65 = (unint64_t)(v64 + 1);
    if ((uint64_t)(v64 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v66 = v60 - v63;
    if (2 * v66 > v65)
      v65 = 2 * v66;
    if (v66 >= 0x3FFFFFFFFFFFFFFFLL)
      v67 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v67 = v65;
    if (v67)
      v68 = (unint64_t)operator new(v67);
    else
      v68 = 0;
    v69 = (char *)(v68 + v67);
    v64[v68] = 125;
    v62 = (uint64_t)&v64[v68 + 1];
    if (v61 == (_BYTE *)v63)
    {
      v68 += (unint64_t)v64;
    }
    else
    {
      v70 = &v61[~v63];
      do
      {
        v71 = *--v61;
        (v70--)[v68] = v71;
      }
      while (v61 != (_BYTE *)v63);
      v61 = (_BYTE *)*v59;
    }
    *v59 = v68;
    v59[1] = v62;
    v59[2] = (unint64_t)v69;
    if (v61)
      operator delete(v61);
  }
  else
  {
    *v61 = 125;
    v62 = (uint64_t)(v61 + 1);
  }
  v59[1] = v62;
}

void sub_220F43278(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void xgboost::Json::~Json(unsigned int **this)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  v1 = *this;
  if (v1)
  {
    v2 = v1 + 2;
    do
    {
      v3 = __ldxr(v2);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, v2));
    if (!v4)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v1 + 8))(v1);
    }
  }
}

void xgboost::JsonString::~JsonString(void **this)
{
  *this = off_24E6BE2B8;
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

{
  *this = off_24E6BE2B8;
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
  JUMPOUT(0x227667068);
}

void *xgboost::JsonWriter::Visit(xgboost::JsonWriter *this, const xgboost::JsonNumber *a2)
{
  uint64_t *v3;
  int v4;
  std::vector<char> *v5;
  std::vector<char>::pointer begin;
  unint64_t v7;
  unint64_t v8;
  _BYTE __src[16];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = &v11;
  v4 = xgboost::detail::ToCharsFloatImpl((xgboost::detail *)__src, *((float *)a2 + 4), (char *)a2);
  if (&__src[v4] < (_BYTE *)&v11)
    v3 = (uint64_t *)&__src[v4];
  v5 = (std::vector<char> *)*((_QWORD *)this + 1);
  begin = v5->__begin_;
  v7 = v5->__end_ - v5->__begin_;
  v8 = (char *)v3 + v7 - __src;
  if (v3 != (uint64_t *)__src && v8 >= v7)
  {
    std::vector<char>::__append(v5, (char *)v3 - __src);
    begin = (std::vector<char>::pointer)**((_QWORD **)this + 1);
  }
  else if (v8 < v7)
  {
    v5->__end_ = &begin[v8];
  }
  return memcpy(&begin[v7], __src, (char *)v3 - __src);
}

void *xgboost::JsonWriter::Visit(xgboost::JsonWriter *this, const xgboost::JsonInteger *a2)
{
  uint64_t v3;
  xgboost::detail *p_src;
  char *v5;
  int v6;
  std::string *Entry;
  _QWORD *v8;
  _QWORD *v9;
  std::vector<char>::size_type v10;
  std::vector<char> *v11;
  std::vector<char>::pointer begin;
  unint64_t v13;
  char v15;
  char __src;
  _BYTE v17[20];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)a2 + 2);
  if (v3)
  {
    p_src = (xgboost::detail *)&__src;
    if (v3 < 0)
    {
      __src = 45;
      p_src = (xgboost::detail *)v17;
      v3 = -v3;
    }
    v5 = xgboost::detail::ToCharsUnsignedImpl(p_src, (xgboost::detail *)&v18, (char *)v3);
    if (v6)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v15);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
      v8 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v15);
      v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"Check failed: ret.ec == std::errc()", 35);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v15);
    }
  }
  else
  {
    __src = 48;
    v5 = v17;
  }
  v10 = v5 - &__src;
  v11 = (std::vector<char> *)*((_QWORD *)this + 1);
  begin = v11->__begin_;
  v13 = v11->__end_ - v11->__begin_;
  if (v13 >= v13 + v10)
  {
    if (v13 > v13 + v10)
      v11->__end_ = &begin[v13 + v10];
  }
  else
  {
    std::vector<char>::__append(v11, v10);
    begin = (std::vector<char>::pointer)**((_QWORD **)this + 1);
  }
  return memcpy(&begin[v13], &__src, v10);
}

void sub_220F43570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9, char a10)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a10);
  _Unwind_Resume(a1);
}

std::vector<char> *xgboost::JsonWriter::Visit(uint64_t a1)
{
  std::vector<char> *result;
  std::vector<char>::pointer begin;
  unint64_t v4;

  result = *(std::vector<char> **)(a1 + 8);
  begin = result->__begin_;
  v4 = result->__end_ - result->__begin_;
  if (v4 > 0xFFFFFFFFFFFFFFFBLL)
  {
    result->__end_ = &begin[v4 + 4];
  }
  else
  {
    std::vector<char>::__append(result, 4uLL);
    result = *(std::vector<char> **)(a1 + 8);
    begin = result->__begin_;
  }
  begin[v4] = 110;
  result->__begin_[v4 + 1] = 117;
  result->__begin_[v4 + 2] = 108;
  result->__begin_[v4 + 3] = 108;
  return result;
}

void xgboost::JsonWriter::Visit(xgboost::JsonWriter *this, const xgboost::JsonString *a2)
{
  unint64_t v3;
  char **v4;
  unint64_t v5;
  char *v6;
  int v7;
  const std::string::value_type *v8;
  unint64_t v9;
  char *v10;
  std::vector<char> *v11;
  std::vector<char>::pointer begin;
  unint64_t v13;
  std::vector<char>::size_type size;
  std::string *v15;
  size_t v16;
  std::string v18;
  std::string::value_type __str[8];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  memset(&v18, 0, sizeof(v18));
  std::string::push_back(&v18, 34);
  v3 = 0;
  v4 = (char **)((char *)a2 + 16);
  while (1)
  {
    v5 = *((char *)a2 + 39) < 0 ? *((_QWORD *)a2 + 3) : *((unsigned __int8 *)a2 + 39);
    if (v3 >= v5)
      break;
    v6 = (char *)a2 + 16;
    if ((*((_BYTE *)a2 + 39) & 0x80) != 0)
      v6 = *v4;
    v7 = v6[v3];
    switch(v7)
    {
      case 8:
        v8 = "\\b";
        goto LABEL_29;
      case 9:
        v8 = "\\t";
        goto LABEL_29;
      case 10:
        v8 = "\\n";
        goto LABEL_29;
      case 11:
        goto LABEL_14;
      case 12:
        v8 = "\\f";
        goto LABEL_29;
      case 13:
        v8 = "\\r";
        goto LABEL_29;
      default:
        if (v7 == 34)
        {
          v8 = "\\\"";
LABEL_29:
          std::string::append(&v18, v8);
          goto LABEL_30;
        }
        if (v7 == 92)
        {
          if ((*((_BYTE *)a2 + 39) & 0x80) != 0)
            v9 = *((_QWORD *)a2 + 3);
          else
            v9 = *((unsigned __int8 *)a2 + 39);
          v8 = "\\\\";
          if (v3 < v9)
          {
            v10 = (char *)a2 + 16;
            if ((*((_BYTE *)a2 + 39) & 0x80) != 0)
              v10 = *v4;
            if (v10[v3 + 1] == 117)
              v8 = "\\";
            else
              v8 = "\\\\";
          }
          goto LABEL_29;
        }
LABEL_14:
        if ((char)v7 > 0x1F)
        {
          std::string::push_back(&v18, v7);
        }
        else
        {
          snprintf(__str, 8uLL, "\\u%04x", (char)v7);
          std::string::append(&v18, __str);
        }
LABEL_30:
        ++v3;
        break;
    }
  }
  std::string::push_back(&v18, 34);
  v11 = (std::vector<char> *)*((_QWORD *)this + 1);
  begin = v11->__begin_;
  v13 = v11->__end_ - v11->__begin_;
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  else
    size = v18.__r_.__value_.__l.__size_;
  if (v13 >= size + v13)
  {
    if (v13 > size + v13)
      v11->__end_ = &begin[size + v13];
  }
  else
  {
    std::vector<char>::__append(v11, size);
    begin = (std::vector<char>::pointer)**((_QWORD **)this + 1);
  }
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v15 = &v18;
  else
    v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  else
    v16 = v18.__r_.__value_.__l.__size_;
  memcpy(&begin[v13], v15, v16);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
}

void sub_220F43894(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::vector<char> *xgboost::JsonWriter::Visit(uint64_t a1, uint64_t a2)
{
  std::vector<char> *result;
  std::vector<char>::pointer begin;
  unint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = *(std::vector<char> **)(a1 + 8);
  begin = result->__begin_;
  v5 = result->__end_ - result->__begin_;
  if (*(_BYTE *)(a2 + 16))
  {
    if (v5 > 0xFFFFFFFFFFFFFFFBLL)
    {
      result->__end_ = &begin[v5 + 4];
    }
    else
    {
      std::vector<char>::__append(result, 4uLL);
      result = *(std::vector<char> **)(a1 + 8);
      begin = result->__begin_;
    }
    begin[v5] = 116;
    v6 = 117;
    v7 = 114;
    v8 = 3;
    v9 = 2;
    v10 = 1;
  }
  else
  {
    if (v5 > 0xFFFFFFFFFFFFFFFALL)
    {
      result->__end_ = &begin[v5 + 5];
    }
    else
    {
      std::vector<char>::__append(result, 5uLL);
      result = *(std::vector<char> **)(a1 + 8);
      begin = result->__begin_;
    }
    begin[v5] = 102;
    v6 = 115;
    result->__begin_[v5 + 1] = 97;
    v7 = 108;
    v8 = 4;
    v9 = 3;
    v10 = 2;
  }
  result->__begin_[v10 + v5] = v7;
  result->__begin_[v9 + v5] = v6;
  result->__begin_[v8 + v5] = 101;
  return result;
}

_QWORD *xgboost::Value::TypeStr@<X0>(xgboost::Value *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;

  v4 = *((int *)this + 3);
  if (v4 > 0xA)
    v5 = (char *)&str_23;
  else
    v5 = off_24E6BE6B8[v4];
  return std::string::basic_string[abi:ne180100]<0>(a2, v5);
}

uint64_t *xgboost::DummyJsonObject(xgboost *this)
{
  unsigned __int8 v1;
  _QWORD *v3;
  unsigned int *v4;
  unsigned int v5;

  v1 = atomic_load((unsigned __int8 *)&qword_253F370A8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_253F370A8))
  {
    v3 = (_QWORD *)operator new();
    v3[1] = 0x600000000;
    v4 = (unsigned int *)(v3 + 1);
    *v3 = &off_24E6BE408;
    _MergedGlobals_15 = (uint64_t)v3;
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    __cxa_atexit((void (*)(void *))xgboost::Json::~Json, &_MergedGlobals_15, &dword_220DF6000);
    __cxa_guard_release(&qword_253F370A8);
  }
  return &_MergedGlobals_15;
}

void sub_220F43A9C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_253F370A8);
  _Unwind_Resume(a1);
}

uint64_t *xgboost::Value::operator[](xgboost::Value *a1)
{
  std::string *Entry;
  _QWORD *v3;
  _QWORD *v4;
  void **v5;
  uint64_t v6;
  _QWORD *v7;
  xgboost *v8;
  void *__p[2];
  unsigned __int8 v11;
  char v12;

  Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v12);
  dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
  v3 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v12);
  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"Object of type ", 15);
  xgboost::Value::TypeStr(a1, __p);
  if ((v11 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v11 & 0x80u) == 0)
    v6 = v11;
  else
    v6 = (uint64_t)__p[1];
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)" can not be indexed by string.", 30);
  if ((char)v11 < 0)
    operator delete(__p[0]);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v12);
  xgboost::DummyJsonObject(v8);
  return &_MergedGlobals_15;
}

{
  std::string *Entry;
  _QWORD *v3;
  _QWORD *v4;
  void **v5;
  uint64_t v6;
  _QWORD *v7;
  xgboost *v8;
  void *__p[2];
  unsigned __int8 v11;
  char v12;

  Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v12);
  dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
  v3 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v12);
  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"Object of type ", 15);
  xgboost::Value::TypeStr(a1, __p);
  if ((v11 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v11 & 0x80u) == 0)
    v6 = v11;
  else
    v6 = (uint64_t)__p[1];
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v5, v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)" can not be indexed by Integer.", 31);
  if ((char)v11 < 0)
    operator delete(__p[0]);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v12);
  xgboost::DummyJsonObject(v8);
  return &_MergedGlobals_15;
}

void sub_220F43B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a18);
  _Unwind_Resume(a1);
}

void sub_220F43C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a18);
  _Unwind_Resume(a1);
}

_QWORD *xgboost::JsonObject::JsonObject(_QWORD *a1, uint64_t a2)
{
  a1[1] = 0x300000000;
  *a1 = &off_24E6BE1D0;
  a1[4] = 0;
  a1[3] = 0;
  a1[2] = a1 + 3;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::swap((uint64_t *)(a2 + 16), (uint64_t)(a1 + 2));
  return a1;
}

{
  a1[1] = 0x300000000;
  *a1 = &off_24E6BE1D0;
  a1[4] = 0;
  a1[3] = 0;
  a1[2] = a1 + 3;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::swap((uint64_t *)(a2 + 16), (uint64_t)(a1 + 2));
  return a1;
}

_QWORD *xgboost::JsonObject::JsonObject(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  result[1] = 0x300000000;
  *result = &off_24E6BE1D0;
  result[2] = *a2;
  v2 = a2 + 1;
  v3 = a2[1];
  result[3] = v3;
  v4 = result + 3;
  v5 = a2[2];
  result[4] = v5;
  if (v5)
  {
    *(_QWORD *)(v3 + 16) = v4;
    *a2 = v2;
    *v2 = 0;
    a2[2] = 0;
  }
  else
  {
    result[2] = v4;
  }
  return result;
}

{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  result[1] = 0x300000000;
  *result = &off_24E6BE1D0;
  result[2] = *a2;
  v2 = a2 + 1;
  v3 = a2[1];
  result[3] = v3;
  v4 = result + 3;
  v5 = a2[2];
  result[4] = v5;
  if (v5)
  {
    *(_QWORD *)(v3 + 16) = v4;
    *a2 = v2;
    *v2 = 0;
    a2[2] = 0;
  }
  else
  {
    result[2] = v4;
  }
  return result;
}

uint64_t xgboost::JsonObject::operator==(_QWORD *a1, _DWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const void **v11;
  unsigned __int8 *v12;
  uint64_t result;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  _QWORD *v17;
  _QWORD *v18;

  if (a2[3] == 3)
  {
    v3 = xgboost::Cast<xgboost::JsonObject const,xgboost::Value const>(a2);
    if (a1[4] == v3[4])
    {
      v4 = (_QWORD *)a1[2];
      v5 = a1 + 3;
      if (v4 == v5)
        return 1;
      v6 = (_QWORD *)v3[2];
      while (1)
      {
        v7 = *((unsigned __int8 *)v4 + 55);
        if ((v7 & 0x80u) == 0)
          v8 = *((unsigned __int8 *)v4 + 55);
        else
          v8 = v4[5];
        v9 = *((unsigned __int8 *)v6 + 55);
        v10 = (char)v9;
        if ((v9 & 0x80u) != 0)
          v9 = v6[5];
        if (v8 != v9)
          break;
        v11 = (const void **)(v4 + 4);
        if (v10 >= 0)
          v12 = (unsigned __int8 *)(v6 + 4);
        else
          v12 = (unsigned __int8 *)v6[4];
        if ((v7 & 0x80) != 0)
        {
          if (memcmp(*v11, v12, v4[5]))
            return 0;
        }
        else if (*((_BYTE *)v4 + 55))
        {
          while (*(unsigned __int8 *)v11 == *v12)
          {
            v11 = (const void **)((char *)v11 + 1);
            ++v12;
            if (!--v7)
              goto LABEL_20;
          }
          return 0;
        }
LABEL_20:
        result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)v4[7] + 40))(v4[7], v6[7]);
        if ((_DWORD)result)
        {
          v14 = (_QWORD *)v4[1];
          v15 = v4;
          if (v14)
          {
            do
            {
              v4 = v14;
              v14 = (_QWORD *)*v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              v4 = (_QWORD *)v15[2];
              v16 = *v4 == (_QWORD)v15;
              v15 = v4;
            }
            while (!v16);
          }
          v17 = (_QWORD *)v6[1];
          if (v17)
          {
            do
            {
              v18 = v17;
              v17 = (_QWORD *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              v18 = (_QWORD *)v6[2];
              v16 = *v18 == (_QWORD)v6;
              v6 = v18;
            }
            while (!v16);
          }
          result = 1;
          v6 = v18;
          if (v4 != v5)
            continue;
        }
        return result;
      }
    }
  }
  return 0;
}

uint64_t xgboost::JsonObject::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 64))(a2, a1);
}

uint64_t xgboost::JsonString::operator==(uint64_t a1, _DWORD *a2)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const void **v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  BOOL v19;
  uint64_t result;

  if (a2[3])
    return 0;
  v3 = (unsigned __int8 *)xgboost::Cast<xgboost::JsonString const,xgboost::Value const>(a2);
  v4 = v3[39];
  if ((v4 & 0x80u) == 0)
    v5 = v3[39];
  else
    v5 = *((_QWORD *)v3 + 3);
  v6 = *(unsigned __int8 *)(a1 + 39);
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a1 + 24);
  if (v5 != v6)
    return 0;
  v8 = (const void **)(v3 + 16);
  v11 = *(unsigned __int8 **)(a1 + 16);
  v10 = (unsigned __int8 *)(a1 + 16);
  v9 = v11;
  if (v7 >= 0)
    v12 = v10;
  else
    v12 = v9;
  if ((v4 & 0x80) != 0)
    return memcmp(*v8, v12, *((_QWORD *)v3 + 3)) == 0;
  if (!v3[39])
    return 1;
  v13 = v4 - 1;
  do
  {
    v15 = *(unsigned __int8 *)v8;
    v8 = (const void **)((char *)v8 + 1);
    v14 = v15;
    v17 = *v12++;
    v16 = v17;
    v19 = v13-- != 0;
    result = v14 == v16;
  }
  while (v14 == v16 && v19);
  return result;
}

uint64_t xgboost::JsonString::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 96))(a2, a1);
}

double xgboost::JsonArray::JsonArray(_QWORD *a1, _QWORD *a2)
{
  double result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)&result = 0x400000000;
  a1[1] = 0x400000000;
  *a1 = off_24E6BE218;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  v3 = a2[2];
  a2[2] = 0;
  a1[2] = v3;
  v4 = a2[3];
  a2[3] = a1[3];
  a1[3] = v4;
  v5 = a2[4];
  a2[4] = a1[4];
  a1[4] = v5;
  return result;
}

{
  double result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)&result = 0x400000000;
  a1[1] = 0x400000000;
  *a1 = off_24E6BE218;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  v3 = a2[2];
  a2[2] = 0;
  a1[2] = v3;
  v4 = a2[3];
  a2[3] = a1[3];
  a1[3] = v4;
  v5 = a2[4];
  a2[4] = a1[4];
  a1[4] = v5;
  return result;
}

uint64_t xgboost::JsonArray::operator==(uint64_t a1, _DWORD *a2)
{
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  BOOL v11;

  if (a2[3] != 4)
    return 0;
  v3 = xgboost::Cast<xgboost::JsonArray const,xgboost::Value const>(a2);
  v5 = a1 + 16;
  v4 = *(uint64_t **)(a1 + 16);
  v6 = v3[2];
  v7 = v3[3];
  if (*(_QWORD *)(v5 + 8) - (_QWORD)v4 != v7 - v6)
    return 0;
  if (v6 == v7)
    return 1;
  v8 = v6 + 8;
  do
  {
    v9 = *v4++;
    result = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v8 - 8) + 40))(*(_QWORD *)(v8 - 8), v9);
    if ((_DWORD)result)
      v11 = v8 == v7;
    else
      v11 = 1;
    v8 += 8;
  }
  while (!v11);
  return result;
}

uint64_t xgboost::JsonArray::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 24))(a2, a1);
}

BOOL xgboost::JsonNumber::operator==(uint64_t a1, _DWORD *a2)
{
  float v3;
  float v4;

  if (a2[3] != 1)
    return 0;
  v3 = *((float *)xgboost::Cast<xgboost::JsonNumber const,xgboost::Value const>(a2) + 4);
  v4 = *(float *)(a1 + 16);
  if (fabsf(v4) == INFINITY)
    return fabsf(v3) == INFINITY;
  else
    return (float)(v4 - v3) == 0.0;
}

uint64_t xgboost::JsonNumber::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, a1);
}

BOOL xgboost::JsonInteger::operator==(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;

  if (a2[3] != 2)
    return 0;
  v2 = *(_QWORD *)(a1 + 16);
  return v2 == *((_QWORD *)xgboost::Cast<xgboost::JsonInteger const,xgboost::Value const>(a2) + 2);
}

uint64_t xgboost::JsonInteger::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, a1);
}

BOOL xgboost::JsonNull::operator==(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a2 + 12) == 6;
}

uint64_t xgboost::JsonNull::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 88))(a2, a1);
}

BOOL xgboost::JsonBoolean::operator==(uint64_t a1, _DWORD *a2)
{
  int v2;

  if (a2[3] != 5)
    return 0;
  v2 = *(unsigned __int8 *)(a1 + 16);
  return v2 == *((unsigned __int8 *)xgboost::Cast<xgboost::JsonBoolean const,xgboost::Value const>(a2) + 16);
}

uint64_t xgboost::JsonBoolean::Save(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 104))(a2, a1);
}

unsigned int *xgboost::JsonReader::Parse@<X0>(xgboost::JsonReader *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  int v12;
  _QWORD *v13;
  unsigned int *result;
  unsigned int v15;
  uint64_t (**v16)(xgboost::JsonReader *);
  void *__p[2];
  char v18;

  v4 = MEMORY[0x24BDAC740];
  while (1)
  {
    v5 = *((_QWORD *)this + 3);
    v6 = *((_QWORD *)this + 1);
    if (v6 < v5)
    {
      v7 = *((_QWORD *)this + 2);
      while (1)
      {
        v8 = *(unsigned __int8 *)(v7 + v6);
        v9 = v8 > 0x20;
        v10 = (1 << v8) & 0x100002600;
        if (v9 || v10 == 0)
          break;
        *((_QWORD *)this + 1) = ++v6;
        if (v5 == v6)
          goto LABEL_29;
      }
    }
    if (v6 == v5)
      break;
    v12 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + v6);
    if (v12 > 122)
    {
      if (v12 == 255)
        break;
      if (v12 == 123)
      {
        v16 = (uint64_t (**)(xgboost::JsonReader *))(*(_QWORD *)this + 8);
        return (unsigned int *)(*v16)(this);
      }
    }
    else
    {
      if (v12 == 45)
        goto LABEL_32;
      if (v12 == 91)
      {
        v16 = (uint64_t (**)(xgboost::JsonReader *))(*(_QWORD *)this + 16);
        return (unsigned int *)(*v16)(this);
      }
    }
    if (((char)v12 & 0x80000000) == 0 && (*(_DWORD *)(v4 + 4 * (char)v12 + 60) & 0x400) != 0)
    {
LABEL_32:
      v16 = (uint64_t (**)(xgboost::JsonReader *))(*(_QWORD *)this + 24);
      return (unsigned int *)(*v16)(this);
    }
    if (v12 > 0x65u)
    {
      switch(v12)
      {
        case 'f':
          goto LABEL_33;
        case 'n':
          v16 = (uint64_t (**)(xgboost::JsonReader *))(*(_QWORD *)this + 40);
          return (unsigned int *)(*v16)(this);
        case 't':
LABEL_33:
          v16 = (uint64_t (**)(xgboost::JsonReader *))(*(_QWORD *)this + 32);
          return (unsigned int *)(*v16)(this);
      }
    }
    else
    {
      if (v12 == 34)
      {
        v16 = *(uint64_t (***)(xgboost::JsonReader *))this;
        return (unsigned int *)(*v16)(this);
      }
      if (v12 == 73 || v12 == 78)
        goto LABEL_32;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "Unknown construct");
    xgboost::JsonReader::Error((unint64_t *)this, (uint64_t)__p);
    if (v18 < 0)
      operator delete(__p[0]);
  }
LABEL_29:
  v13 = (_QWORD *)operator new();
  *v13 = &off_24E6BE408;
  *a2 = v13;
  v13[1] = 0x600000000;
  result = (unsigned int *)(v13 + 1);
  do
    v15 = __ldxr(result);
  while (__stxr(v15 + 1, result));
  return result;
}

void sub_220F44500(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *xgboost::JsonReader::SkipSpaces(_QWORD *this)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  uint64_t v6;

  v1 = this[3];
  v2 = this[1];
  if (v2 < v1)
  {
    v3 = this[2];
    do
    {
      v4 = *(unsigned __int8 *)(v3 + v2);
      v5 = v4 > 0x20;
      v6 = (1 << v4) & 0x100002600;
      if (v5 || v6 == 0)
        break;
      this[1] = ++v2;
    }
    while (v1 != v2);
  }
  return this;
}

uint64_t xgboost::JsonReader::Error(unint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::string *v8;
  __int128 v9;
  std::string *p_p;
  std::string::size_type size;
  uint64_t v12;
  std::string *Entry;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  std::string *v20;
  std::string::size_type v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  int v30;
  const std::string::value_type *v31;
  std::string *v32;
  std::string::size_type v33;
  unint64_t v34;
  unint64_t v35;
  std::string *v36;
  _QWORD *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  std::string v43;
  std::string __p;
  _QWORD v45[13];
  char v46;
  uint64_t v47;

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v45);
  v4 = xgboost::StringView::substr((xgboost::StringView *)(a1 + 2), 0);
  v6 = v5;
  if (v5)
  {
    v7 = v4;
    do
    {
      std::ostream::put();
      ++v7;
      --v6;
    }
    while (v6);
  }
  std::to_string(&v43, a1[1]);
  v8 = std::string::insert(&v43, 0, ", around character position: ");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  std::string::append((std::string *)a2, (const std::string::value_type *)p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  std::string::push_back((std::string *)a2, 10);
  v12 = a1[1];
  if (!v12)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v43);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
    v14 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v43);
    v15 = *(char *)(a2 + 23);
    if (v15 >= 0)
      v16 = a2;
    else
      v16 = *(_QWORD *)a2;
    if (v15 >= 0)
      v17 = *(unsigned __int8 *)(a2 + 23);
    else
      v17 = *(_QWORD *)(a2 + 8);
    v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, v16, v17);
    v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)", \"", 3);
    std::stringbuf::str();
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &__p;
    else
      v20 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v21 = __p.__r_.__value_.__l.__size_;
    v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, v21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)" \"", 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v43);
    v12 = a1[1];
  }
  if (v12 >= 8)
    v23 = v12 - 8;
  else
    v23 = 0;
  v24 = v12 + 8;
  if (v24 >= a1[3])
    v25 = a1[3];
  else
    v25 = v24;
  v26 = xgboost::StringView::substr((xgboost::StringView *)(a1 + 2), v23);
  v28 = v27;
  memset(&__p, 0, sizeof(__p));
  if (v27)
  {
    v29 = (_BYTE *)v26;
    do
    {
      v30 = *v29;
      if (*v29)
      {
        if (v30 != 10)
        {
          std::string::push_back(&__p, v30);
          goto LABEL_44;
        }
        v31 = "\\n";
      }
      else
      {
        v31 = "\\0";
      }
      std::string::append(&__p, v31);
LABEL_44:
      ++v29;
      --v28;
    }
    while (v28);
  }
  std::string::append((std::string *)a2, "    ");
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v32 = &__p;
  else
    v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v33 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v33 = __p.__r_.__value_.__l.__size_;
  std::string::append((std::string *)a2, (const std::string::value_type *)v32, v33);
  std::string::push_back((std::string *)a2, 10);
  std::string::append((std::string *)a2, "    ");
  while (v23 < a1[1] - 1)
  {
    std::string::push_back((std::string *)a2, 126);
    ++v23;
  }
  std::string::push_back((std::string *)a2, 94);
  v34 = a1[1];
  v35 = v25 - v34;
  if (v25 > v34)
  {
    do
    {
      std::string::push_back((std::string *)a2, 126);
      --v35;
    }
    while (v35);
  }
  v36 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v43);
  dmlc::LogMessageFatal::Entry::Init(v36, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
  v37 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v43);
  v38 = *(char *)(a2 + 23);
  if (v38 >= 0)
    v39 = a2;
  else
    v39 = *(_QWORD *)a2;
  if (v38 >= 0)
    v40 = *(unsigned __int8 *)(a2 + 23);
  else
    v40 = *(_QWORD *)(a2 + 8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, v39, v40);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v43);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v45[0] = *MEMORY[0x24BEDB7F0];
  v41 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v45 + *(_QWORD *)(v45[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v45[2] = v41;
  v45[3] = MEMORY[0x24BEDB848] + 16;
  if (v46 < 0)
    operator delete((void *)v45[11]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x227666FE4](&v47);
}

void sub_220F44918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a10);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a22);
  _Unwind_Resume(a1);
}

unint64_t xgboost::StringView::substr(xgboost::StringView *this, unint64_t a2)
{
  std::string *Entry;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  unint64_t v15;

  v15 = a2;
  if (*((_QWORD *)this + 1) < a2)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned long>(&v14);
    if (v14)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v13);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/xgboost/string_view.h");
      v4 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v13);
      v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)"Check failed: ", 14);
      v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"beg <= size_", 12);
      v7 = *(char *)(v14 + 23);
      if (v7 >= 0)
        v8 = v14;
      else
        v8 = *(_QWORD *)v14;
      if (v7 >= 0)
        v9 = *(unsigned __int8 *)(v14 + 23);
      else
        v9 = *(_QWORD *)(v14 + 8);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, v8, v9);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v13);
      v11 = v14;
      v14 = 0;
      if (v11)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v14, v11);
    }
  }
  return *(_QWORD *)this + v15;
}

void sub_220F44ACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14)
{
  uint64_t v15;

  v15 = a14;
  a14 = 0;
  if (v15)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a14, v15);
  _Unwind_Resume(exception_object);
}

void xgboost::ParseStr(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  std::string::size_type v3;
  uint64_t *v4;
  std::string v5;

  v1 = *((unsigned __int8 *)a1 + 23);
  v2 = (char)v1;
  if ((v1 & 0x80u) != 0)
    v1 = a1[1];
  if (v1)
  {
    v3 = 0;
    if (v2 >= 0)
      v4 = a1;
    else
      v4 = (uint64_t *)*a1;
    while (!v3 || *((_BYTE *)v4 + v3) != 34 || *((_BYTE *)v4 + v3 - 1) == 92)
    {
      if (v1 == ++v3)
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    v3 = 0;
  }
  memset(&v5, 0, sizeof(v5));
  std::string::resize(&v5, v3, 0);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5.__r_.__value_.__l.__data_);
}

void sub_220F44B9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t xgboost::JsonReader::ParseString@<X0>(xgboost::JsonReader *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  const std::string::value_type *v9;
  std::string::size_type v10;
  char v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  unsigned int v15;
  void *__p[2];
  char v19;
  std::string v20;
  _QWORD v21[11];
  char v22;
  uint64_t v23;
  _QWORD v24[4];

  v24[2] = *MEMORY[0x24BDAC8D0];
  xgboost::JsonReader::GetConsecutiveChar(this, 0x22u);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v21);
  memset(&v20, 0, sizeof(v20));
  while (1)
  {
    while (1)
    {
      v3 = *((_QWORD *)this + 1);
      v4 = *((_QWORD *)this + 3);
      if (v3 != v4)
        break;
      v6 = 255;
LABEL_5:
      std::string::push_back(&v20, v6);
      if (v6 == 10 || v6 == 255 || v6 == 13)
        xgboost::JsonReader::Expect(this, 34, (char)v6);
    }
    v5 = *((_QWORD *)this + 2);
    v6 = *(unsigned __int8 *)(v5 + v3);
    v7 = v3 + 1;
    *((_QWORD *)this + 1) = v3 + 1;
    if (v6 != 92)
      break;
    if (v7 == v4)
    {
LABEL_15:
      std::string::basic_string[abi:ne180100]<0>(__p, "Unknown escape");
      xgboost::JsonReader::Error((unint64_t *)this, (uint64_t)__p);
      if (v19 < 0)
        operator delete(__p[0]);
    }
    else
    {
      v8 = *(char *)(v5 + v7);
      *((_QWORD *)this + 1) = v3 + 2;
      v9 = "\r";
      switch(v8)
      {
        case 'n':
          v9 = "\n";
          goto LABEL_20;
        case 'o':
        case 'p':
        case 'q':
        case 's':
          goto LABEL_15;
        case 'r':
          goto LABEL_20;
        case 't':
          v9 = "\t";
          goto LABEL_20;
        case 'u':
          std::string::push_back(&v20, 92);
          std::string::push_back(&v20, 117);
          continue;
        default:
          if (v8 == 34)
          {
            v9 = "\"";
          }
          else
          {
            if (v8 != 92)
              goto LABEL_15;
            v9 = "\\";
          }
LABEL_20:
          std::string::append(&v20, v9);
          break;
      }
    }
  }
  if (v6 != 34)
    goto LABEL_5;
  v24[0] = v20.__r_.__value_.__l.__size_;
  v10 = v20.__r_.__value_.__r.__words[0];
  *(_QWORD *)((char *)v24 + 7) = *(std::string::size_type *)((char *)&v20.__r_.__value_.__r.__words[1] + 7);
  v11 = HIBYTE(v20.__r_.__value_.__r.__words[2]);
  memset(&v20, 0, sizeof(v20));
  v12 = operator new();
  *(_DWORD *)(v12 + 8) = 0;
  v13 = (unsigned int *)(v12 + 8);
  *(_DWORD *)(v12 + 12) = 0;
  *(_QWORD *)v12 = off_24E6BE2B8;
  v14 = v24[0];
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = v14;
  *(_QWORD *)(v12 + 31) = *(_QWORD *)((char *)v24 + 7);
  *(_BYTE *)(v12 + 39) = v11;
  *a2 = v12;
  do
    v15 = __ldxr(v13);
  while (__stxr(v15 + 1, v13));
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  v21[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v21 + *(_QWORD *)(v21[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v21[1] = MEMORY[0x24BEDB848] + 16;
  if (v22 < 0)
    operator delete((void *)v21[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x227666FE4](&v23);
}

void sub_220F44E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  void *v22;
  int v23;

  if (v23 < 0)
    operator delete(v22);
  if (a21 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a22);
  _Unwind_Resume(a1);
}

void xgboost::JsonReader::GetConsecutiveChar(xgboost::JsonReader *this, unsigned __int8 a2)
{
  uint64_t v2;
  int v3;

  v2 = *((_QWORD *)this + 1);
  if (v2 == *((_QWORD *)this + 3))
  {
    v3 = 255;
  }
  else
  {
    v3 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + v2);
    *((_QWORD *)this + 1) = v2 + 1;
  }
  if (v3 != a2)
    xgboost::JsonReader::Expect(this, a2, (char)v3);
}

void xgboost::JsonReader::Expect(xgboost::JsonReader *this, std::string::value_type a2, int a3)
{
  std::string *v6;
  const std::string::value_type *v7;
  std::string *v8;
  __int128 v9;
  void **v10;
  std::string::size_type v11;
  std::string v12;
  std::string v13;
  void *__p[2];
  int64_t v15;
  std::string v16;

  v6 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v16, "Expecting: \"");
  std::string::push_back(v6, a2);
  std::string::append(&v16, "\", got: \"");
  if (!a3)
  {
    v7 = "\\0\"";
    goto LABEL_5;
  }
  if (a3 == -1)
  {
    v7 = "EOF\"";
LABEL_5:
    std::string::append(&v16, v7);
    goto LABEL_16;
  }
  *((_BYTE *)&v13.__r_.__value_.__s + 23) = 1;
  LOWORD(v13.__r_.__value_.__l.__data_) = a3;
  v8 = std::string::append(&v13, " \"");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v15 = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (v15 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  if (v15 >= 0)
    v11 = HIBYTE(v15);
  else
    v11 = (std::string::size_type)__p[1];
  std::string::append(&v16, (const std::string::value_type *)v10, v11);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
LABEL_16:
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v12, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
  else
    v12 = v16;
  xgboost::JsonReader::Error((unint64_t *)this, (uint64_t)&v12);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
}

void sub_220F4507C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (a26 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (*(char *)(v26 - 33) < 0)
    operator delete(*(void **)(v26 - 56));
  _Unwind_Resume(exception_object);
}

void xgboost::JsonReader::ParseNull(xgboost::JsonReader *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  std::string::value_type v6;
  std::string *v7;
  _QWORD *v8;
  unsigned int *v9;
  unsigned int v10;
  void *__p[2];
  char v12;
  std::string v13;

  *((_BYTE *)&v13.__r_.__value_.__s + 23) = 1;
  LOWORD(v13.__r_.__value_.__l.__data_) = xgboost::JsonReader::GetNextNonSpaceChar(this);
  v4 = 3;
  do
  {
    v5 = *((_QWORD *)this + 1);
    if (v5 == *((_QWORD *)this + 3))
    {
      v6 = -1;
    }
    else
    {
      v6 = *(_BYTE *)(*((_QWORD *)this + 2) + v5);
      *((_QWORD *)this + 1) = v5 + 1;
    }
    std::string::push_back(&v13, v6);
    --v4;
  }
  while (v4);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v13.__r_.__value_.__l.__size_ == 4)
    {
      v7 = (std::string *)v13.__r_.__value_.__r.__words[0];
LABEL_12:
      if (LODWORD(v7->__r_.__value_.__l.__data_) == 1819047278)
        goto LABEL_15;
    }
  }
  else if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) == 4)
  {
    v7 = &v13;
    goto LABEL_12;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Expecting null value \"null\"");
  xgboost::JsonReader::Error((unint64_t *)this, (uint64_t)__p);
  if (v12 < 0)
    operator delete(__p[0]);
LABEL_15:
  v8 = (_QWORD *)operator new();
  v8[1] = 0x600000000;
  v9 = (unsigned int *)(v8 + 1);
  *v8 = &off_24E6BE408;
  *a2 = v8;
  do
    v10 = __ldxr(v9);
  while (__stxr(v10 + 1, v9));
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
}

void sub_220F45224(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

uint64_t xgboost::JsonReader::GetNextNonSpaceChar(xgboost::JsonReader *this)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  uint64_t v6;
  char v8;

  v1 = *((_QWORD *)this + 3);
  v2 = *((_QWORD *)this + 1);
  if (v2 < v1)
  {
    v3 = *((_QWORD *)this + 2);
    while (1)
    {
      v4 = *(unsigned __int8 *)(v3 + v2);
      v5 = v4 > 0x20;
      v6 = (1 << v4) & 0x100002600;
      if (v5 || v6 == 0)
        break;
      *((_QWORD *)this + 1) = ++v2;
      if (v1 == v2)
        return -1;
    }
  }
  if (v2 == v1)
  {
    return -1;
  }
  else
  {
    v8 = *(_BYTE *)(*((_QWORD *)this + 2) + v2);
    *((_QWORD *)this + 1) = v2 + 1;
  }
  return v8;
}

void xgboost::JsonReader::ParseArray(xgboost::JsonReader *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void **v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void **v14;
  void **v15;
  void **v16;
  unsigned int *v17;
  unsigned int v18;
  int NextNonSpaceChar;
  char v20;
  void **v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int *v26;
  __int128 v27;
  _QWORD *v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int *v31;
  __int128 v32;
  _QWORD *v33;
  unsigned int v34;
  __int128 v35;
  _QWORD v36[2];
  void **v37;
  void (**v38)(xgboost::JsonArray *__hidden);
  uint64_t v39;
  __int128 v40;
  _QWORD *v41;

  v35 = 0uLL;
  v36[0] = 0;
  xgboost::JsonReader::GetConsecutiveChar(this, 0x5Bu);
  while (1)
  {
    v4 = *((_QWORD *)this + 1);
    if (v4 != *((_QWORD *)this + 3) && *(_BYTE *)(*((_QWORD *)this + 2) + v4) == 93)
      break;
    xgboost::JsonReader::Parse(this, &v37);
    v5 = *((_QWORD *)&v35 + 1);
    if (*((_QWORD *)&v35 + 1) >= v36[0])
    {
      v10 = (uint64_t)(*((_QWORD *)&v35 + 1) - v35) >> 3;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<xgboost::Json>::__throw_length_error[abi:ne180100]();
      v12 = v36[0] - v35;
      if ((uint64_t)(v36[0] - v35) >> 2 > v11)
        v11 = v12 >> 2;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      v41 = v36;
      if (v13)
        v14 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)v36, v13);
      else
        v14 = 0;
      v15 = &v14[v10];
      v38 = (void (**)(xgboost::JsonArray *__hidden))v14;
      v39 = (uint64_t)v15;
      *((_QWORD *)&v40 + 1) = &v14[v13];
      v16 = v37;
      *v15 = v37;
      if (v16)
      {
        v17 = (unsigned int *)(v16 + 1);
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      *(_QWORD *)&v40 = v15 + 1;
      std::vector<xgboost::Json>::__swap_out_circular_buffer((uint64_t *)&v35, &v38);
      v9 = *((_QWORD *)&v35 + 1);
      std::__split_buffer<xgboost::Json>::~__split_buffer((uint64_t)&v38);
    }
    else
    {
      v6 = v37;
      **((_QWORD **)&v35 + 1) = v37;
      if (v6)
      {
        v7 = (unsigned int *)(v6 + 1);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      v9 = v5 + 8;
    }
    *((_QWORD *)&v35 + 1) = v9;
    NextNonSpaceChar = xgboost::JsonReader::GetNextNonSpaceChar(this);
    if (NextNonSpaceChar != 44)
    {
      if (NextNonSpaceChar == 93)
      {
        v20 = 0;
        goto LABEL_27;
      }
      xgboost::JsonReader::Expect(this, 44, NextNonSpaceChar);
    }
    v20 = 1;
LABEL_27:
    v21 = v37;
    if (v37)
    {
      v22 = (unsigned int *)(v37 + 1);
      do
      {
        v23 = __ldxr(v22);
        v24 = v23 - 1;
      }
      while (__stlxr(v24, v22));
      if (!v24)
      {
        __dmb(9u);
        (*((void (**)(void **))*v21 + 1))(v21);
      }
    }
    if ((v20 & 1) == 0)
    {
      v39 = 0x400000000;
      v38 = off_24E6BE218;
      v40 = v35;
      v41 = (_QWORD *)v36[0];
      v35 = 0uLL;
      v36[0] = 0;
      v25 = operator new();
      *(_QWORD *)(v25 + 8) = 0x400000000;
      v26 = (unsigned int *)(v25 + 8);
      *(_QWORD *)v25 = off_24E6BE218;
      v27 = v40;
      v40 = 0uLL;
      *(_OWORD *)(v25 + 16) = v27;
      v28 = v41;
      v41 = 0;
      *(_QWORD *)(v25 + 32) = v28;
      *a2 = v25;
      do
        v29 = __ldxr(v26);
      while (__stxr(v29 + 1, v26));
      goto LABEL_38;
    }
  }
  xgboost::JsonReader::GetConsecutiveChar(this, 0x5Du);
  v39 = 0x400000000;
  v38 = off_24E6BE218;
  v40 = v35;
  v41 = (_QWORD *)v36[0];
  v35 = 0uLL;
  v36[0] = 0;
  v30 = operator new();
  *(_QWORD *)(v30 + 8) = 0x400000000;
  v31 = (unsigned int *)(v30 + 8);
  *(_QWORD *)v30 = off_24E6BE218;
  v32 = v40;
  v40 = 0uLL;
  *(_OWORD *)(v30 + 16) = v32;
  v33 = v41;
  v41 = 0;
  *(_QWORD *)(v30 + 32) = v33;
  *a2 = v30;
  do
    v34 = __ldxr(v31);
  while (__stxr(v34 + 1, v31));
LABEL_38:
  v37 = (void **)&v40;
  v38 = off_24E6BE218;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100](&v37);
  v38 = (void (**)(xgboost::JsonArray *__hidden))&v35;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
}

void sub_220F455E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13)
{
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100](&a13);
  a13 = (void **)&a9;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

void xgboost::JsonArray::~JsonArray(xgboost::JsonArray *this)
{
  void **v1;

  *(_QWORD *)this = off_24E6BE218;
  v1 = (void **)((char *)this + 16);
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v2;

  *(_QWORD *)this = off_24E6BE218;
  v2 = (void **)((char *)this + 16);
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100](&v2);
  MEMORY[0x227667068](this, 0x10A1C405897D53FLL);
}

void xgboost::JsonReader::ParseObject(xgboost::JsonReader *this@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  __int128 *v11;
  __int128 *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  int v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _DWORD *v24;
  std::string *Entry;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  int v29;
  _DWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _DWORD *v36;
  int NextNonSpaceChar;
  uint64_t *v38;
  unsigned int *v39;
  int v40;
  char v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  _DWORD *v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int v48;
  _QWORD *v49;
  uint64_t v50;
  _DWORD *v51;
  uint64_t *v52;
  _QWORD *v53;
  uint64_t v54;
  const void **v55;
  uint64_t v56;
  uint64_t *v57;
  _QWORD *v58;
  uint64_t v59;
  void *__p;
  char v61;
  uint64_t v62;

  xgboost::JsonReader::GetConsecutiveChar(this, 0x7Bu);
  v53 = 0;
  v54 = 0;
  v52 = (uint64_t *)&v53;
  v4 = *((_QWORD *)this + 3);
  v5 = *((_QWORD *)this + 1);
  if (v5 < v4)
  {
    v6 = *((_QWORD *)this + 2);
    while (1)
    {
      v7 = *(unsigned __int8 *)(v6 + v5);
      v8 = v7 > 0x20;
      v9 = (1 << v7) & 0x100002600;
      if (v8 || v9 == 0)
        break;
      *((_QWORD *)this + 1) = ++v5;
      if (v4 == v5)
        goto LABEL_13;
    }
  }
  if (v5 == v4 || *(_BYTE *)(*((_QWORD *)this + 2) + v5) != 125)
  {
LABEL_13:
    v49 = a2;
    v11 = (__int128 *)*MEMORY[0x24BEDB800];
    v12 = *(__int128 **)(MEMORY[0x24BEDB800] + 24);
    v13 = MEMORY[0x24BEDB848] + 16;
    while (1)
    {
      v14 = *((_QWORD *)this + 3);
      v15 = *((_QWORD *)this + 1);
      if (v15 < v14)
      {
        v16 = *((_QWORD *)this + 2);
        while (1)
        {
          v17 = *(unsigned __int8 *)(v16 + v15);
          v8 = v17 > 0x20;
          v18 = (1 << v17) & 0x100002600;
          if (v8 || v18 == 0)
            break;
          *((_QWORD *)this + 1) = ++v15;
          if (v14 == v15)
            goto LABEL_26;
        }
      }
      if (v15 == v14)
        break;
      v20 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + v15);
      if (v20 == 255)
        break;
      if (v20 != 34)
        goto LABEL_38;
LABEL_39:
      (**(void (***)(_DWORD **__return_ptr, xgboost::JsonReader *))this)(&v51, this);
      NextNonSpaceChar = xgboost::JsonReader::GetNextNonSpaceChar(this);
      if (NextNonSpaceChar != 58)
        xgboost::JsonReader::Expect(this, 58, NextNonSpaceChar);
      xgboost::JsonReader::Parse(this, &v50);
      v55 = (const void **)((char *)xgboost::Cast<xgboost::JsonString const,xgboost::Value const>(v51) + 16);
      v38 = std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v52, v55, (uint64_t)&std::piecewise_construct, (__int128 **)&v55);
      v39 = (unsigned int *)v38[7];
      v38[7] = v50;
      v50 = (uint64_t)v39;
      v40 = xgboost::JsonReader::GetNextNonSpaceChar(this);
      if (v40 != 44)
      {
        if (v40 == 125)
        {
          v41 = 0;
          if (v39)
            goto LABEL_47;
          goto LABEL_51;
        }
        xgboost::JsonReader::Expect(this, 44, v40);
        v39 = (unsigned int *)v50;
      }
      v41 = 1;
      if (v39)
      {
LABEL_47:
        v42 = v39 + 2;
        do
        {
          v43 = __ldxr(v42);
          v44 = v43 - 1;
        }
        while (__stlxr(v44, v42));
        if (!v44)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v39 + 8))(v39);
        }
      }
LABEL_51:
      v45 = v51;
      if (v51)
      {
        v46 = v51 + 2;
        do
        {
          v47 = __ldxr(v46);
          v48 = v47 - 1;
        }
        while (__stlxr(v48, v46));
        if (!v48)
        {
          __dmb(9u);
          (*(void (**)(_DWORD *))(*(_QWORD *)v45 + 8))(v45);
        }
      }
      if ((v41 & 1) == 0)
      {
        v56 = 0x300000000;
        v55 = (const void **)&off_24E6BE1D0;
        v57 = v52;
        v58 = v53;
        v59 = v54;
        if (v54)
        {
          v53[2] = &v58;
          v52 = (uint64_t *)&v53;
          v53 = 0;
          v54 = 0;
        }
        else
        {
          v57 = (uint64_t *)&v58;
        }
        xgboost::Json::Json(v49, (uint64_t)&v55);
        goto LABEL_61;
      }
    }
LABEL_26:
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v55);
    v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v55, (uint64_t)" (", 2);
    LOBYTE(v50) = -1;
    v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)&v50, 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)" vs. ", 5);
    v23 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)") ", 2);
    v24 = (_DWORD *)operator new();
    std::stringbuf::str();
    v51 = v24;
    v55 = (const void **)v11;
    *(const void ***)((char *)&v55 + *((_QWORD *)v11 - 3)) = (const void **)v12;
    v56 = v13;
    if (v61 < 0)
      operator delete(__p);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x227666FE4](&v62);
    if (v51)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
      v26 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
      v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"Check failed: ", 14);
      v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"ch != -1", 8);
      v29 = *((char *)v51 + 23);
      v30 = v29 >= 0 ? v51 : *(_DWORD **)v51;
      v31 = v29 >= 0 ? *((unsigned __int8 *)v51 + 23) : *((_QWORD *)v51 + 1);
      v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)v30, v31);
      v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)"cursor_.Pos(): ", 15);
      v34 = (_QWORD *)std::ostream::operator<<();
      v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)", ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)"raw_str_.size():", 16);
      std::ostream::operator<<();
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v55);
      v36 = v51;
      v51 = 0;
      if (v36)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v51, (uint64_t)v36);
    }
    LOBYTE(v20) = -1;
LABEL_38:
    xgboost::JsonReader::Expect(this, 34, (char)v20);
    goto LABEL_39;
  }
  xgboost::JsonReader::GetConsecutiveChar(this, 0x7Du);
  v56 = 0x300000000;
  v55 = (const void **)&off_24E6BE1D0;
  v57 = v52;
  v58 = v53;
  v59 = v54;
  if (v54)
  {
    v53[2] = &v58;
    v52 = (uint64_t *)&v53;
    v53 = 0;
    v54 = 0;
  }
  else
  {
    v57 = (uint64_t *)&v58;
  }
  xgboost::Json::Json(a2, (uint64_t)&v55);
LABEL_61:
  v55 = (const void **)&off_24E6BE1D0;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&v57, v58);
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&v52, v53);
}

void sub_220F45BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, _QWORD *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20)
{
  uint64_t v20;

  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy(v20, a20);
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&a13, a14);
  _Unwind_Resume(a1);
}

void xgboost::JsonObject::~JsonObject(xgboost::JsonObject *this)
{
  *(_QWORD *)this = &off_24E6BE1D0;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)this + 16, *((_QWORD **)this + 3));
}

{
  *(_QWORD *)this = &off_24E6BE1D0;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)this + 16, *((_QWORD **)this + 3));
  JUMPOUT(0x227667068);
}

unsigned int *xgboost::JsonReader::ParseNumber@<X0>(xgboost::JsonReader *this@<X0>, float *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  char *v6;
  int v7;
  int v8;
  int v9;
  char *v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  unsigned int *result;
  unsigned int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  char *v24;
  int v25;
  const char *v26;
  uint64_t v27;
  _QWORD *v28;
  unsigned int v29;
  int v30;
  int v31;
  float v32;
  unsigned int *v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  void *__p[2];
  char v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = *((_QWORD *)this + 1);
  v6 = (char *)(*((_QWORD *)this + 2) + v5);
  v7 = *v6;
  switch(v7)
  {
    case 'N':
      xgboost::JsonReader::GetConsecutiveChar(this, 0x4Eu);
      xgboost::JsonReader::GetConsecutiveChar(this, 0x61u);
      xgboost::JsonReader::GetConsecutiveChar(this, 0x4Eu);
      v35 = operator new();
      *(_QWORD *)v35 = &off_24E6BE348;
      *(_DWORD *)(v35 + 16) = 2143289344;
      *a3 = v35;
      *(_QWORD *)(v35 + 8) = 0x100000000;
      result = (unsigned int *)(v35 + 8);
      do
        v36 = __ldxr(result);
      while (__stxr(v36 + 1, result));
      return result;
    case '-':
      v8 = 1;
      goto LABEL_6;
    case '+':
      v8 = 0;
LABEL_6:
      v10 = v6 + 1;
      v9 = v6[1];
      goto LABEL_8;
  }
  v8 = 0;
  v9 = *v6;
  v10 = (char *)(*((_QWORD *)this + 2) + v5);
LABEL_8:
  if (v9 == 48)
  {
    v16 = *++v10;
    v9 = v16;
  }
  else if (v9 == 73)
  {
    v11 = 0;
    *((_QWORD *)this + 1) = ((_DWORD)v10 - (_DWORD)v6) + v5;
    v39[0] = 0x7974696E69666E49;
    do
      xgboost::JsonReader::GetConsecutiveChar(this, *((_BYTE *)v39 + v11++));
    while (v11 != 8);
    if (v8)
      v12 = -INFINITY;
    else
      v12 = INFINITY;
    v13 = operator new();
    *(_QWORD *)v13 = &off_24E6BE348;
    *(float *)(v13 + 16) = v12;
    *a3 = v13;
    *(_QWORD *)(v13 + 8) = 0x100000000;
    result = (unsigned int *)(v13 + 8);
    do
      v15 = __ldxr(result);
    while (__stxr(v15 + 1, result));
    return result;
  }
  if ((v9 - 48) > 9)
  {
    v17 = 0;
  }
  else
  {
    v17 = 0;
    do
    {
      v17 = 10 * v17 + v9 - 48;
      v18 = *++v10;
      v9 = v18;
    }
    while ((v18 - 48) < 0xA);
  }
  if (v9 == 46)
  {
    v20 = *++v10;
    v19 = v20;
    if ((v20 - 48) <= 9)
    {
      do
      {
        v17 = v19 - 48 + 10 * v17;
        v21 = *++v10;
        v19 = v21;
      }
      while ((v21 - 48) < 0xA);
    }
  }
  else
  {
    v19 = v9;
  }
  if ((v19 | 0x20) == 0x65)
  {
    v22 = v10[1];
    if (v22 == 45 || v22 == 43)
    {
      v25 = v10[2];
      v24 = v10 + 2;
      v23 = v25;
    }
    else
    {
      v23 = v10[1];
      v24 = v10 + 1;
    }
    if ((v23 - 48) > 9)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "Expecting digit");
      xgboost::JsonReader::Error((unint64_t *)this, (uint64_t)__p);
      if (v38 < 0)
        operator delete(__p[0]);
    }
    else
    {
      do
        v30 = *++v24;
      while ((v30 - 48) < 0xA);
    }
    v26 = (const char *)(v24 - v6);
    *((_QWORD *)this + 1) += ((_DWORD)v24 - (_DWORD)v6);
    goto LABEL_42;
  }
  v26 = (const char *)(v10 - v6);
  *((_QWORD *)this + 1) = v5 + ((_DWORD)v10 - (_DWORD)v6);
  if (v9 == 46)
  {
LABEL_42:
    LODWORD(v39[0]) = 0;
    xgboost::detail::FromCharFloatImpl(v6, v26, (float *)v39, a2);
    if (v31)
    {
      v32 = strtof(v6, 0);
      *(float *)v39 = v32;
    }
    else
    {
      v32 = *(float *)v39;
    }
    result = (unsigned int *)operator new();
    *((_QWORD *)result + 1) = 0x100000000;
    v33 = result + 2;
    *(_QWORD *)result = &off_24E6BE348;
    *((float *)result + 4) = v32;
    *a3 = (uint64_t)result;
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
    return result;
  }
  if (v8)
    v27 = -v17;
  else
    v27 = v17;
  v28 = (_QWORD *)operator new();
  *v28 = &off_24E6BE3A8;
  v28[2] = v27;
  *a3 = (uint64_t)v28;
  v28[1] = 0x200000000;
  result = (unsigned int *)(v28 + 1);
  do
    v29 = __ldxr(result);
  while (__stxr(v29 + 1, result));
  return result;
}

void sub_220F460C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void xgboost::JsonReader::ParseBoolean(xgboost::JsonReader *this@<X0>, uint64_t *a2@<X8>)
{
  int NextNonSpaceChar;
  unsigned __int8 v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  void *__p;
  char v10;
  void *v11;
  char v12;

  NextNonSpaceChar = xgboost::JsonReader::GetNextNonSpaceChar(this);
  std::string::basic_string[abi:ne180100]<0>(&v11, "true");
  std::string::basic_string[abi:ne180100]<0>(&__p, "false");
  if (NextNonSpaceChar == 116)
  {
    xgboost::JsonReader::GetConsecutiveChar(this, 0x72u);
    v5 = 117;
  }
  else
  {
    xgboost::JsonReader::GetConsecutiveChar(this, 0x61u);
    xgboost::JsonReader::GetConsecutiveChar(this, 0x6Cu);
    v5 = 115;
  }
  xgboost::JsonReader::GetConsecutiveChar(this, v5);
  xgboost::JsonReader::GetConsecutiveChar(this, 0x65u);
  v6 = operator new();
  *(_QWORD *)(v6 + 8) = 0x500000000;
  v7 = (unsigned int *)(v6 + 8);
  *(_QWORD *)v6 = &off_24E6BE468;
  *(_BYTE *)(v6 + 16) = NextNonSpaceChar == 116;
  *a2 = v6;
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  if (v10 < 0)
    operator delete(__p);
  if (v12 < 0)
    operator delete(v11);
}

void sub_220F4620C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void xgboost::Json::Load(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, unsigned int **a4@<X8>)
{
  unsigned int *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  unsigned int *v14;
  uint64_t (**v15)(xgboost::JsonReader *__hidden);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = (unsigned int *)operator new();
  *((_QWORD *)v8 + 1) = 0x600000000;
  v9 = v8 + 2;
  *(_QWORD *)v8 = &off_24E6BE408;
  *a4 = v8;
  do
    v10 = __ldxr(v9);
  while (__stxr(v10 + 1, v9));
  if ((a3 & 4) != 0)
  {
    v17 = a1;
    v18 = a2;
    v15 = off_24E6BE5C0;
    v16 = 0;
    xgboost::UBJReader::Parse((xgboost::UBJReader *)&v15, (uint64_t *)&v14);
    *a4 = v14;
    v14 = v8;
    do
    {
      v13 = __ldxr(v9);
      v12 = --v13 == 0;
    }
    while (__stlxr(v13, v9));
  }
  else
  {
    v15 = off_24E6BE4C8;
    v16 = 0;
    v17 = a1;
    v18 = a2;
    xgboost::JsonReader::Parse((xgboost::JsonReader *)&v15, &v14);
    *a4 = v14;
    v14 = v8;
    do
    {
      v11 = __ldxr(v9);
      v12 = --v11 == 0;
    }
    while (__stlxr(v11, v9));
  }
  if (v12)
  {
    __dmb(9u);
    (*(void (**)(unsigned int *))(*(_QWORD *)v8 + 8))(v8);
  }
}

void sub_220F46364(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v4;
  unsigned int v5;

  do
  {
    v4 = __ldxr(v2);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, v2));
  if (!v5)
  {
    __dmb(9u);
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t xgboost::Json::Load(xgboost::Json *this, xgboost::JsonReader *a2)
{
  return (*(uint64_t (**)(xgboost::Json *))(*(_QWORD *)this + 64))(this);
}

void xgboost::Json::Dump(unsigned int **a1, std::string *a2, char a3)
{
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  _BYTE *v10;
  unsigned int *v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;

  v12 = 0;
  v13 = 0;
  v14 = 0;
  v4 = *a1;
  v11 = v4;
  if (v4)
  {
    v5 = v4 + 2;
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  xgboost::Json::Dump(&v11, &v12, a3);
  if (v4)
  {
    v7 = v4 + 2;
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 8))(v4);
    }
  }
  std::string::resize(a2, v13 - v12, 0);
  v10 = v12;
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    a2 = (std::string *)a2->__r_.__value_.__r.__words[0];
  if (v13 != v12)
  {
    memmove(a2, v12, v13 - v12);
    v10 = v12;
  }
  if (v10)
  {
    v13 = v10;
    operator delete(v10);
  }
}

void sub_220F46480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t xgboost::Json::Dump(unsigned int **a1, _QWORD *a2, char a3)
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  uint64_t result;
  unsigned int *v7;
  unsigned int v8;
  BOOL v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  void (**v14)(xgboost::UBJWriter *__hidden);
  _QWORD *v15;

  a2[1] = *a2;
  if ((a3 & 4) != 0)
  {
    v14 = &off_24E6BE630;
    v15 = a2;
    v3 = *a1;
    if (*a1)
    {
      v10 = v3 + 2;
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    result = (*(uint64_t (**)(unsigned int *, void (***)(xgboost::UBJWriter *__hidden)))(*(_QWORD *)v3 + 16))(v3, &v14);
    v12 = v3 + 2;
    do
    {
      v13 = __ldxr(v12);
      v9 = --v13 == 0;
    }
    while (__stlxr(v13, v12));
  }
  else
  {
    v14 = &off_24E6BE530;
    v15 = a2;
    v3 = *a1;
    if (*a1)
    {
      v4 = v3 + 2;
      do
        v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
    }
    result = (*(uint64_t (**)(unsigned int *, void (***)(xgboost::UBJWriter *__hidden)))(*(_QWORD *)v3 + 16))(v3, &v14);
    v7 = v3 + 2;
    do
    {
      v8 = __ldxr(v7);
      v9 = --v8 == 0;
    }
    while (__stlxr(v8, v7));
  }
  if (v9)
  {
    __dmb(9u);
    return (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v3 + 8))(v3);
  }
  return result;
}

void sub_220F465BC(_Unwind_Exception *exception_object)
{
  unsigned int *v1;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = v1 + 2;
  do
  {
    v4 = __ldxr(v3);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, v3));
  if (!v5)
  {
    __dmb(9u);
    (*(void (**)(unsigned int *))(*(_QWORD *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t xgboost::UBJWriter::Save(uint64_t a1, _QWORD *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, a1);
}

uint64_t xgboost::Json::Dump(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  uint64_t result;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v2 = *a1;
  v9 = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)a2 + 16))(a2, &v9);
  result = v9;
  if (v9)
  {
    v6 = (unsigned int *)(v9 + 8);
    do
    {
      v7 = __ldxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
    {
      __dmb(9u);
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    }
  }
  return result;
}

void sub_220F466B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned int *a10)
{
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  if (a10)
  {
    v11 = a10 + 2;
    do
    {
      v12 = __ldxr(v11);
      v13 = v12 - 1;
    }
    while (__stlxr(v13, v11));
    if (!v13)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)a10 + 8))(a10);
    }
  }
  _Unwind_Resume(exception_object);
}

void xgboost::UBJReader::ParseArray(xgboost::UBJReader *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  std::string::size_type v13;
  std::string::size_type v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unsigned int *v21;
  __int128 v22;
  std::string::value_type *v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  char v38;
  uint64_t v39;
  unsigned int *v40;
  unsigned int v41;
  _DWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int *v47;
  unsigned int v48;
  std::string *Entry;
  _QWORD *v50;
  std::string *v51;
  __int128 v52;
  std::string *v53;
  __int128 v54;
  void **v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  std::string::size_type size;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  _QWORD *v72;
  unsigned int *v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  std::string::size_type v80;
  uint64_t v81;
  std::string::value_type v82;
  uint64_t v83;
  unsigned int *v84;
  unsigned int v85;
  _DWORD *v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  unsigned int *v91;
  unsigned int v92;
  std::string::size_type v93;
  unsigned int *v94;
  unsigned int *v95;
  unsigned int *v96;
  unsigned int v97;
  unsigned int v98;
  uint64_t i;
  unsigned int *v100;
  unsigned int *v101;
  unsigned int v102;
  unsigned int v103;
  std::string v104;
  std::string v105;
  char v106;
  void *__p[2];
  __int128 v108;
  std::string::value_type *v109;

  v4 = *((_QWORD *)this + 1);
  v5 = *((_QWORD *)this + 3);
  if (v4 == v5)
  {
    memset(&v105, 0, sizeof(v105));
    goto LABEL_3;
  }
  v25 = *((_QWORD *)this + 2);
  v26 = *(unsigned __int8 *)(v25 + v4);
  if (v26 != 36)
  {
LABEL_65:
    memset(&v105, 0, sizeof(v105));
    if (v26 == 35)
    {
      v57 = *((_QWORD *)this + 1);
      if (v57 != *((_QWORD *)this + 3))
        *((_QWORD *)this + 1) = v57 + 1;
      xgboost::JsonReader::GetConsecutiveChar(this, 0x4Cu);
      v58 = 0;
      v59 = *((_QWORD *)this + 1);
      v60 = *(void **)(*((_QWORD *)this + 2) + v59);
      *((_QWORD *)this + 1) = v59 + 8;
      __p[0] = v60;
      v61 = 7;
      do
      {
        v62 = *((_BYTE *)__p + v61);
        *((_BYTE *)__p + v61) = *((_BYTE *)__p + v58);
        *((_BYTE *)__p + v58++) = v62;
        --v61;
      }
      while (v58 != 4);
      v63 = (uint64_t)__p[0];
      size = v105.__r_.__value_.__l.__size_;
      v65 = (uint64_t)(v105.__r_.__value_.__l.__size_ - v105.__r_.__value_.__r.__words[0]) >> 3;
      if (__p[0] <= (void *)v65)
      {
        if (__p[0] < (void *)v65)
        {
          v93 = v105.__r_.__value_.__r.__words[0] + 8 * (uint64_t)__p[0];
          while (size != v93)
          {
            v95 = *(unsigned int **)(size - 8);
            size -= 8;
            v94 = v95;
            if (v95)
            {
              v96 = v94 + 2;
              do
              {
                v97 = __ldxr(v96);
                v98 = v97 - 1;
              }
              while (__stlxr(v98, v96));
              if (!v98)
              {
                __dmb(9u);
                (*(void (**)(unsigned int *))(*(_QWORD *)v94 + 8))(v94);
              }
            }
          }
          v105.__r_.__value_.__l.__size_ = v93;
        }
      }
      else if ((char *)__p[0] - v65 <= (void *)((uint64_t)(v105.__r_.__value_.__r.__words[2]
                                                         - v105.__r_.__value_.__l.__size_) >> 3))
      {
        std::vector<xgboost::Json>::__construct_at_end(&v105, (uint64_t)__p[0] - v65);
      }
      else
      {
        if ((unint64_t)__p[0] >> 61)
          std::vector<xgboost::Json>::__throw_length_error[abi:ne180100]();
        v66 = (uint64_t)(v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0]) >> 2;
        if ((void *)v66 <= __p[0])
          v66 = (unint64_t)__p[0];
        if (v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8)
          v67 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v67 = v66;
        v109 = &v105.__r_.__value_.__s.__data_[16];
        v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v105.__r_.__value_.__r.__words[2], v67);
        v69 = &v68[8 * v65];
        __p[0] = v68;
        __p[1] = v69;
        *(_QWORD *)&v108 = v69;
        *((_QWORD *)&v108 + 1) = &v68[8 * v70];
        v71 = &v68[8 * v63];
        do
        {
          v72 = (_QWORD *)operator new();
          v72[1] = 0x600000000;
          v73 = (unsigned int *)(v72 + 1);
          *v72 = &off_24E6BE408;
          *(_QWORD *)v69 = v72;
          do
            v74 = __ldxr(v73);
          while (__stxr(v74 + 1, v73));
          v69 += 8;
        }
        while (v69 != v71);
        *(_QWORD *)&v108 = v71;
        std::vector<xgboost::Json>::__swap_out_circular_buffer((uint64_t *)&v105, __p);
        std::__split_buffer<xgboost::Json>::~__split_buffer((uint64_t)__p);
      }
      if (v63 >= 1)
      {
        for (i = 0; i != v63; ++i)
        {
          xgboost::UBJReader::Parse(this, (uint64_t *)__p);
          v100 = *(unsigned int **)(v105.__r_.__value_.__r.__words[0] + 8 * i);
          *(void **)(v105.__r_.__value_.__r.__words[0] + 8 * i) = __p[0];
          __p[0] = v100;
          if (v100)
          {
            v101 = v100 + 2;
            do
            {
              v102 = __ldxr(v101);
              v103 = v102 - 1;
            }
            while (__stlxr(v103, v101));
            if (!v103)
            {
              __dmb(9u);
              (*(void (**)(unsigned int *))(*(_QWORD *)v100 + 8))(v100);
            }
          }
        }
      }
      goto LABEL_24;
    }
    if (v26 == 93)
    {
LABEL_23:
      xgboost::JsonReader::GetConsecutiveChar(this, 0x5Du);
LABEL_24:
      __p[1] = (void *)0x400000000;
      __p[0] = off_24E6BE218;
      v109 = 0;
      v108 = 0uLL;
      std::vector<xgboost::Json>::__init_with_size[abi:ne180100]<xgboost::Json*,xgboost::Json*>((uint64_t *)&v108, (uint64_t *)v105.__r_.__value_.__l.__data_, (uint64_t *)v105.__r_.__value_.__l.__size_, (uint64_t)(v105.__r_.__value_.__l.__size_ - v105.__r_.__value_.__r.__words[0]) >> 3);
      v20 = operator new();
      *(_QWORD *)(v20 + 8) = 0x400000000;
      v21 = (unsigned int *)(v20 + 8);
      *(_QWORD *)v20 = off_24E6BE218;
      v22 = v108;
      v108 = 0uLL;
      *(_OWORD *)(v20 + 16) = v22;
      v23 = v109;
      v109 = 0;
      *(_QWORD *)(v20 + 32) = v23;
      *a2 = v20;
      do
        v24 = __ldxr(v21);
      while (__stxr(v24 + 1, v21));
      __p[0] = off_24E6BE218;
      v104.__r_.__value_.__r.__words[0] = (std::string::size_type)&v108;
      std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)&v104);
      __p[0] = &v105;
      std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      return;
    }
    do
    {
LABEL_3:
      xgboost::UBJReader::Parse(this, (uint64_t *)&v104);
      v6 = (_QWORD *)v105.__r_.__value_.__l.__size_;
      if (v105.__r_.__value_.__l.__size_ >= v105.__r_.__value_.__r.__words[2])
      {
        v7 = (uint64_t)(v105.__r_.__value_.__l.__size_ - v105.__r_.__value_.__r.__words[0]) >> 3;
        v8 = v7 + 1;
        if ((unint64_t)(v7 + 1) >> 61)
          std::vector<xgboost::Json>::__throw_length_error[abi:ne180100]();
        v9 = v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0];
        if ((uint64_t)(v105.__r_.__value_.__r.__words[2] - v105.__r_.__value_.__r.__words[0]) >> 2 > v8)
          v8 = v9 >> 2;
        if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
          v10 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v10 = v8;
        v109 = &v105.__r_.__value_.__s.__data_[16];
        if (v10)
          v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v105.__r_.__value_.__r.__words[2], v10);
        else
          v11 = 0;
        v12 = &v11[8 * v7];
        __p[0] = v11;
        __p[1] = v12;
        *((_QWORD *)&v108 + 1) = &v11[8 * v10];
        *(_QWORD *)v12 = 0;
        *(_QWORD *)v12 = v104.__r_.__value_.__r.__words[0];
        v104.__r_.__value_.__r.__words[0] = 0;
        *(_QWORD *)&v108 = v12 + 8;
        std::vector<xgboost::Json>::__swap_out_circular_buffer((uint64_t *)&v105, __p);
        v13 = v105.__r_.__value_.__l.__size_;
        std::__split_buffer<xgboost::Json>::~__split_buffer((uint64_t)__p);
        v14 = v104.__r_.__value_.__r.__words[0];
        v105.__r_.__value_.__l.__size_ = v13;
        if (v104.__r_.__value_.__r.__words[0])
        {
          v15 = (unsigned int *)(v104.__r_.__value_.__r.__words[0] + 8);
          do
          {
            v16 = __ldxr(v15);
            v17 = v16 - 1;
          }
          while (__stlxr(v17, v15));
          if (!v17)
          {
            __dmb(9u);
            (*(void (**)(std::string::size_type))(*(_QWORD *)v14 + 8))(v14);
          }
        }
      }
      else
      {
        *(_QWORD *)v105.__r_.__value_.__l.__size_ = 0;
        *v6 = v104.__r_.__value_.__r.__words[0];
        v105.__r_.__value_.__l.__size_ = (std::string::size_type)(v6 + 1);
      }
      v18 = *((_QWORD *)this + 1);
      if (v18 == *((_QWORD *)this + 3))
        v19 = 255;
      else
        v19 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + v18);
    }
    while (v19 != 93);
    goto LABEL_23;
  }
  *((_QWORD *)this + 1) = v4 + 1;
  if (v4 + 1 == v5)
  {
    v27 = -1;
  }
  else
  {
    v27 = *(_BYTE *)(v25 + v4 + 1);
    *((_QWORD *)this + 1) = v4 + 2;
  }
  xgboost::JsonReader::GetConsecutiveChar(this, 0x23u);
  xgboost::JsonReader::GetConsecutiveChar(this, 0x4Cu);
  v28 = 0;
  v30 = *((_QWORD *)this + 1);
  v29 = *((_QWORD *)this + 2);
  v31 = *(void **)(v29 + v30);
  v32 = v30 + 8;
  *((_QWORD *)this + 1) = v32;
  __p[0] = v31;
  v33 = 7;
  do
  {
    v34 = *((_BYTE *)__p + v33);
    *((_BYTE *)__p + v33) = *((_BYTE *)__p + v28);
    *((_BYTE *)__p + v28++) = v34;
    --v33;
  }
  while (v28 != 4);
  v35 = (uint64_t)__p[0];
  if (v32 == *((_QWORD *)this + 3))
    v26 = 255;
  else
    v26 = *(unsigned __int8 *)(v29 + v32);
  if (v27 > 99)
  {
    if (v27 == 108)
    {
      xgboost::JsonTypedArray<int,(xgboost::Value::ValueKind)9>::JsonTypedArray((uint64_t)__p, (std::vector<int>::size_type)__p[0]);
      if (v35 >= 1)
      {
        v86 = (_DWORD *)v108;
        v88 = *((_QWORD *)this + 1);
        v87 = *((_QWORD *)this + 2);
        do
        {
          v89 = *(_DWORD *)(v87 + v88);
          v88 += 4;
          *((_QWORD *)this + 1) = v88;
          *v86++ = bswap32(v89);
          --v35;
        }
        while (v35);
      }
      v90 = operator new();
      *(_QWORD *)(v90 + 8) = 0x900000000;
      v91 = (unsigned int *)(v90 + 8);
      *(_QWORD *)v90 = &unk_24E6BD928;
      *(_OWORD *)(v90 + 16) = v108;
      *(_QWORD *)(v90 + 32) = v109;
      *a2 = v90;
      do
        v92 = __ldxr(v91);
      while (__stxr(v92 + 1, v91));
    }
    else
    {
      if (v27 != 100)
      {
LABEL_52:
        Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v106);
        dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
        v50 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v106);
        *((_BYTE *)&v104.__r_.__value_.__s + 23) = 1;
        LOWORD(v104.__r_.__value_.__l.__data_) = v27;
        v52 = *(_OWORD *)&v51->__r_.__value_.__l.__data_;
        v105.__r_.__value_.__r.__words[2] = v51->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v105.__r_.__value_.__l.__data_ = v52;
        v51->__r_.__value_.__l.__size_ = 0;
        v51->__r_.__value_.__r.__words[2] = 0;
        v51->__r_.__value_.__r.__words[0] = 0;
        v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
        *(_QWORD *)&v108 = *((_QWORD *)&v53->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v54;
        v53->__r_.__value_.__l.__size_ = 0;
        v53->__r_.__value_.__r.__words[2] = 0;
        v53->__r_.__value_.__r.__words[0] = 0;
        if ((SBYTE7(v108) & 0x80u) == 0)
          v55 = __p;
        else
          v55 = (void **)__p[0];
        if ((SBYTE7(v108) & 0x80u) == 0)
          v56 = BYTE7(v108);
        else
          v56 = (uint64_t)__p[1];
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v50, (uint64_t)v55, v56);
        if (SBYTE7(v108) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v105.__r_.__value_.__l.__data_);
        if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v104.__r_.__value_.__l.__data_);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v106);
        goto LABEL_65;
      }
      xgboost::JsonTypedArray<float,(xgboost::Value::ValueKind)7>::JsonTypedArray(__p, (unint64_t)__p[0]);
      if (v35 >= 1)
      {
        v42 = (_DWORD *)v108;
        v44 = *((_QWORD *)this + 1);
        v43 = *((_QWORD *)this + 2);
        do
        {
          v45 = *(_DWORD *)(v43 + v44);
          v44 += 4;
          *((_QWORD *)this + 1) = v44;
          *v42++ = bswap32(v45);
          --v35;
        }
        while (v35);
      }
      v46 = operator new();
      *(_QWORD *)(v46 + 8) = 0x700000000;
      v47 = (unsigned int *)(v46 + 8);
      *(_QWORD *)v46 = &unk_24E6B8A30;
      *(_OWORD *)(v46 + 16) = v108;
      *(_QWORD *)(v46 + 32) = v109;
      *a2 = v46;
      do
        v48 = __ldxr(v47);
      while (__stxr(v48 + 1, v47));
    }
  }
  else
  {
    if (v27 != 76)
    {
      if (v27 == 85)
      {
        xgboost::JsonTypedArray<unsigned char,(xgboost::Value::ValueKind)8>::JsonTypedArray((uint64_t)__p, (std::vector<char>::size_type)__p[0]);
        if (v35 >= 1)
        {
          for (j = 0; j != v35; ++j)
          {
            v37 = *((_QWORD *)this + 1);
            v38 = *(_BYTE *)(*((_QWORD *)this + 2) + v37);
            *((_QWORD *)this + 1) = v37 + 1;
            *(_BYTE *)(v108 + j) = v38;
          }
        }
        v39 = operator new();
        *(_QWORD *)(v39 + 8) = 0x800000000;
        v40 = (unsigned int *)(v39 + 8);
        *(_QWORD *)v39 = &unk_24E6BD8E0;
        *(_OWORD *)(v39 + 16) = v108;
        *(_QWORD *)(v39 + 32) = v109;
        *a2 = v39;
        do
          v41 = __ldxr(v40);
        while (__stxr(v41 + 1, v40));
        return;
      }
      goto LABEL_52;
    }
    xgboost::JsonTypedArray<long long,(xgboost::Value::ValueKind)10>::JsonTypedArray(__p, (unint64_t)__p[0]);
    if (v35 >= 1)
    {
      v75 = 0;
      v76 = v108;
      v78 = *((_QWORD *)this + 1);
      v77 = *((_QWORD *)this + 2);
      do
      {
        v79 = 0;
        v80 = *(_QWORD *)(v77 + v78);
        v78 += 8;
        *((_QWORD *)this + 1) = v78;
        v105.__r_.__value_.__r.__words[0] = v80;
        v81 = 7;
        do
        {
          v82 = v105.__r_.__value_.__s.__data_[v81];
          v105.__r_.__value_.__s.__data_[v81] = v105.__r_.__value_.__s.__data_[v79];
          v105.__r_.__value_.__s.__data_[v79++] = v82;
          --v81;
        }
        while (v79 != 4);
        *(_QWORD *)(v76 + 8 * v75++) = v105.__r_.__value_.__r.__words[0];
      }
      while (v75 != v35);
    }
    v83 = operator new();
    *(_QWORD *)(v83 + 8) = 0xA00000000;
    v84 = (unsigned int *)(v83 + 8);
    *(_QWORD *)v83 = &unk_24E6BD970;
    *(_OWORD *)(v83 + 16) = v108;
    *(_QWORD *)(v83 + 32) = v109;
    *a2 = v83;
    do
      v85 = __ldxr(v84);
    while (__stxr(v85 + 1, v84));
  }
}

void sub_220F46FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32)
{
  std::__split_buffer<xgboost::Json>::~__split_buffer((uint64_t)&__p);
  a10 = &a16;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void xgboost::UBJReader::Parse(xgboost::UBJReader *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t i;
  _QWORD *v4;
  unsigned int *v5;
  unsigned int v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  std::string *Entry;
  _QWORD *v12;
  std::string *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned int *v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  _QWORD *v24;
  unsigned int *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD *v32;
  unsigned int *v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int *v36;
  unsigned int v37;
  uint64_t v38;
  _QWORD *v39;
  unsigned int *v40;
  unsigned int v41;
  _QWORD *v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int *v48;
  unsigned int v49;
  uint64_t v50;
  _QWORD *v51;
  unsigned int *v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  _QWORD *v56;
  unsigned int *v57;
  unsigned int v58;
  uint64_t v59;
  unsigned int *v60;
  unsigned int v61;
  void *__p[2];
  char v63;
  _QWORD v64[2];
  std::string v65;
  std::string v66;

  for (i = *((_QWORD *)this + 1); i != *((_QWORD *)this + 3); i = *((_QWORD *)this + 1))
  {
    v8 = *((_QWORD *)this + 2);
    v9 = *(char *)(v8 + i);
    if (v9 == -1)
      break;
    v10 = i + 1;
    *((_QWORD *)this + 1) = i + 1;
    if (v9 <= 99)
    {
      switch(v9)
      {
        case 'C':
          v15 = *(char *)(v8 + v10);
          *((_QWORD *)this + 1) = i + 2;
          v16 = (_QWORD *)operator new();
          *v16 = &off_24E6BE3A8;
          v16[2] = v15;
          *a2 = (uint64_t)v16;
          v16[1] = 0x200000000;
          v17 = (unsigned int *)(v16 + 1);
          do
            v18 = __ldxr(v17);
          while (__stxr(v18 + 1, v17));
          return;
        case 'D':
          Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v64);
          dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
          v12 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v64);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"f64 is not supported.", 21);
          dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v64);
          goto LABEL_9;
        case 'F':
          v19 = operator new();
          *(_QWORD *)v19 = &off_24E6BE468;
          *(_BYTE *)(v19 + 16) = 1;
          *a2 = v19;
          *(_QWORD *)(v19 + 8) = 0x500000000;
          v20 = (unsigned int *)(v19 + 8);
          do
            v21 = __ldxr(v20);
          while (__stxr(v21 + 1, v20));
          return;
        case 'H':
LABEL_9:
          v13 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v64);
          dmlc::LogMessageFatal::Entry::Init(v13, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/json.cc");
          v14 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v64);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"High precision number is not supported.", 39);
          dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v64);
          goto LABEL_10;
        case 'I':
          v22 = *(unsigned __int16 *)(v8 + v10);
          *((_QWORD *)this + 1) = i + 3;
          v23 = (__int16)(bswap32(v22) >> 16);
          v24 = (_QWORD *)operator new();
          *v24 = &off_24E6BE3A8;
          v24[2] = v23;
          *a2 = (uint64_t)v24;
          v24[1] = 0x200000000;
          v25 = (unsigned int *)(v24 + 1);
          do
            v26 = __ldxr(v25);
          while (__stxr(v26 + 1, v25));
          return;
        case 'L':
          v27 = 0;
          v28 = *(_QWORD *)(v8 + v10);
          *((_QWORD *)this + 1) = i + 9;
          v64[0] = v28;
          v29 = 7;
          do
          {
            v30 = *((_BYTE *)v64 + v29);
            *((_BYTE *)v64 + v29) = *((_BYTE *)v64 + v27);
            *((_BYTE *)v64 + v27++) = v30;
            --v29;
          }
          while (v27 != 4);
          v31 = v64[0];
          v32 = (_QWORD *)operator new();
          *v32 = &off_24E6BE3A8;
          v32[2] = v31;
          *a2 = (uint64_t)v32;
          v32[1] = 0x200000000;
          v33 = (unsigned int *)(v32 + 1);
          do
            v34 = __ldxr(v33);
          while (__stxr(v34 + 1, v33));
          return;
        case 'S':
          xgboost::UBJReader::DecodeStr(this, (uint64_t)&v66);
          v64[0] = off_24E6BE2B8;
          v64[1] = 0;
          if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v65, v66.__r_.__value_.__l.__data_, v66.__r_.__value_.__l.__size_);
          else
            v65 = v66;
          v59 = operator new();
          *(_DWORD *)(v59 + 8) = 0;
          v60 = (unsigned int *)(v59 + 8);
          *(_DWORD *)(v59 + 12) = 0;
          *(_QWORD *)v59 = off_24E6BE2B8;
          *(std::string *)(v59 + 16) = v65;
          *a2 = v59;
          do
            v61 = __ldxr(v60);
          while (__stxr(v61 + 1, v60));
          if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v66.__r_.__value_.__l.__data_);
          return;
        case 'T':
          v35 = operator new();
          *(_QWORD *)v35 = &off_24E6BE468;
          *(_BYTE *)(v35 + 16) = 1;
          *a2 = v35;
          *(_QWORD *)(v35 + 8) = 0x500000000;
          v36 = (unsigned int *)(v35 + 8);
          do
            v37 = __ldxr(v36);
          while (__stxr(v37 + 1, v36));
          return;
        case 'U':
          v38 = *(unsigned __int8 *)(v8 + v10);
          *((_QWORD *)this + 1) = i + 2;
          v39 = (_QWORD *)operator new();
          *v39 = &off_24E6BE3A8;
          v39[2] = v38;
          *a2 = (uint64_t)v39;
          v39[1] = 0x200000000;
          v40 = (unsigned int *)(v39 + 1);
          do
            v41 = __ldxr(v40);
          while (__stxr(v41 + 1, v40));
          return;
        case 'Z':
          v42 = (_QWORD *)operator new();
          *v42 = &off_24E6BE408;
          *a2 = (uint64_t)v42;
          v42[1] = 0x600000000;
          v43 = (unsigned int *)(v42 + 1);
          do
            v44 = __ldxr(v43);
          while (__stxr(v44 + 1, v43));
          return;
        case '[':
          (*(void (**)(xgboost::UBJReader *))(*(_QWORD *)this + 16))(this);
          return;
        default:
          goto LABEL_10;
      }
    }
    if (v9 > 107)
    {
      if (v9 == 108)
      {
        v54 = *(_DWORD *)(v8 + v10);
        *((_QWORD *)this + 1) = i + 5;
        v55 = (int)bswap32(v54);
        v56 = (_QWORD *)operator new();
        *v56 = &off_24E6BE3A8;
        v56[2] = v55;
        *a2 = (uint64_t)v56;
        v56[1] = 0x200000000;
        v57 = (unsigned int *)(v56 + 1);
        do
          v58 = __ldxr(v57);
        while (__stxr(v58 + 1, v57));
        return;
      }
      if (v9 == 123)
      {
        (*(void (**)(xgboost::UBJReader *))(*(_QWORD *)this + 8))(this);
        return;
      }
    }
    else
    {
      if (v9 == 100)
      {
        v45 = *(_DWORD *)(v8 + v10);
        *((_QWORD *)this + 1) = i + 5;
        v46 = bswap32(v45);
        v47 = operator new();
        *(_QWORD *)v47 = &off_24E6BE348;
        *(_DWORD *)(v47 + 16) = v46;
        *a2 = v47;
        *(_QWORD *)(v47 + 8) = 0x100000000;
        v48 = (unsigned int *)(v47 + 8);
        do
          v49 = __ldxr(v48);
        while (__stxr(v49 + 1, v48));
        return;
      }
      if (v9 == 105)
      {
        v50 = *(char *)(v8 + v10);
        *((_QWORD *)this + 1) = i + 2;
        v51 = (_QWORD *)operator new();
        *v51 = &off_24E6BE3A8;
        v51[2] = v50;
        *a2 = (uint64_t)v51;
        v51[1] = 0x200000000;
        v52 = (unsigned int *)(v51 + 1);
        do
          v53 = __ldxr(v52);
        while (__stxr(v53 + 1, v52));
        return;
      }
    }
LABEL_10:
    std::string::basic_string[abi:ne180100]<0>(__p, "Unknown construct");
    xgboost::JsonReader::Error((unint64_t *)this, (uint64_t)__p);
    if (v63 < 0)
      operator delete(__p[0]);
  }
  v4 = (_QWORD *)operator new();
  *v4 = &off_24E6BE408;
  *a2 = (uint64_t)v4;
  v4[1] = 0x600000000;
  v5 = (unsigned int *)(v4 + 1);
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
}

void sub_220F4773C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *xgboost::UBJReader::DecodeStr@<X0>(xgboost::UBJReader *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  std::string::size_type v6;
  uint64_t v7;
  char v8;
  std::string::size_type v9;
  void *v10;
  void *result;
  std::string::size_type __n;

  xgboost::JsonReader::GetConsecutiveChar(this, 0x4Cu);
  v4 = 0;
  v5 = *((_QWORD *)this + 1);
  v6 = *(_QWORD *)(*((_QWORD *)this + 2) + v5);
  *((_QWORD *)this + 1) = v5 + 8;
  __n = v6;
  v7 = 7;
  do
  {
    v8 = *((_BYTE *)&__n + v7);
    *((_BYTE *)&__n + v7) = *((_BYTE *)&__n + v4);
    *((_BYTE *)&__n + v4++) = v8;
    --v7;
  }
  while (v4 != 4);
  v9 = __n;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  std::string::resize((std::string *)a2, v9, 0);
  if (*(char *)(a2 + 23) >= 0)
    v10 = (void *)a2;
  else
    v10 = *(void **)a2;
  result = memcpy(v10, (const void *)(*((_QWORD *)this + 2) + *((_QWORD *)this + 1)), v9);
  *((_QWORD *)this + 1) += v9;
  return result;
}

void sub_220F4786C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void xgboost::UBJReader::ParseObject(xgboost::UBJReader *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  uint64_t **v6;
  char *v7;
  std::string *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  void (**v17)(xgboost::JsonObject *__hidden);
  uint64_t v18;
  uint64_t **v19;
  _QWORD *v20[2];
  uint64_t v21;
  void *__p[2];
  uint64_t v23;
  uint64_t **v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;

  v4 = *((_QWORD *)this + 1);
  if (v4 == *((_QWORD *)this + 3))
  {
    v25 = 0;
    v26 = 0;
    v24 = &v25;
  }
  else
  {
    v5 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + v4);
    v25 = 0;
    v26 = 0;
    v24 = &v25;
    if (v5 == 125)
      goto LABEL_22;
  }
  do
  {
    xgboost::UBJReader::DecodeStr(this, (uint64_t)__p);
    xgboost::UBJReader::Parse(this, &v21);
    v6 = (uint64_t **)std::__tree<std::__value_type<std::string,dmlc::parameter::FieldAccessEntry *>,std::__map_value_compare<std::string,std::__value_type<std::string,dmlc::parameter::FieldAccessEntry *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dmlc::parameter::FieldAccessEntry *>>>::__find_equal<std::string>((uint64_t)&v24, &v27, (const void **)__p);
    if (!*v6)
    {
      v7 = (char *)operator new(0x40uLL);
      v17 = (void (**)(xgboost::JsonObject *__hidden))v7;
      v18 = (uint64_t)&v25;
      LOBYTE(v19) = 0;
      v8 = (std::string *)(v7 + 32);
      if (SHIBYTE(v23) < 0)
      {
        std::string::__init_copy_ctor_external(v8, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        v9 = (uint64_t *)v17;
      }
      else
      {
        *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
        *((_QWORD *)v7 + 6) = v23;
        v9 = (uint64_t *)v7;
      }
      *((_QWORD *)v7 + 7) = v21;
      v21 = 0;
      LOBYTE(v19) = 1;
      v10 = v27;
      *v9 = 0;
      v9[1] = 0;
      v9[2] = v10;
      *v6 = v9;
      if (*v24)
      {
        v24 = (uint64_t **)*v24;
        v9 = *v6;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v25, v9);
      v26 = (_QWORD *)((char *)v26 + 1);
      v17 = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,xgboost::Json>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,xgboost::Json>,void *>>>>::reset[abi:ne180100]((uint64_t)&v17, 0);
    }
    v11 = v21;
    if (v21)
    {
      v12 = (unsigned int *)(v21 + 8);
      do
      {
        v13 = __ldxr(v12);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, v12));
      if (!v14)
      {
        __dmb(9u);
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
      }
    }
    v15 = *((_QWORD *)this + 1);
    if (v15 == *((_QWORD *)this + 3))
      v16 = 255;
    else
      v16 = *(unsigned __int8 *)(*((_QWORD *)this + 2) + v15);
    if (SHIBYTE(v23) < 0)
      operator delete(__p[0]);
  }
  while (v16 != 125);
LABEL_22:
  xgboost::JsonReader::GetConsecutiveChar(this, 0x7Du);
  v18 = 0x300000000;
  v17 = &off_24E6BE1D0;
  v19 = v24;
  v20[0] = v25;
  v20[1] = v26;
  if (v26)
  {
    v25[2] = (uint64_t)v20;
    v24 = &v25;
    v25 = 0;
    v26 = 0;
  }
  else
  {
    v19 = v20;
  }
  xgboost::Json::Json(a2, (uint64_t)&v17);
  v17 = &off_24E6BE1D0;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&v19, v20[0]);
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&v24, v25);
}

void sub_220F47AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,_QWORD *a23)
{
  uint64_t v23;

  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy(v23, a13);
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&a22, a23);
  _Unwind_Resume(a1);
}

void xgboost::UBJWriter::Visit(xgboost::UBJWriter *this, const xgboost::JsonArray *a2)
{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  unint64_t v28;
  char *v29;
  _BYTE *v30;
  char v31;
  unint64_t *v32;
  unint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  unint64_t v36;
  _BYTE *v37;
  unint64_t v38;
  unint64_t v39;
  size_t v40;
  unint64_t v41;
  char *v42;
  _BYTE *v43;
  char v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  unsigned int *v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int *v51;
  unsigned int v52;
  unsigned int v53;
  uint64_t v54;

  v4 = (unint64_t *)*((_QWORD *)this + 1);
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
      goto LABEL_67;
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 91;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 91;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v18 = *((_QWORD *)a2 + 2);
  v17 = *((_QWORD *)a2 + 3);
  v19 = (unint64_t *)*((_QWORD *)this + 1);
  v21 = (_BYTE *)v19[1];
  v20 = v19[2];
  if ((unint64_t)v21 >= v20)
  {
    v23 = *v19;
    v24 = &v21[-*v19];
    v25 = (unint64_t)(v24 + 1);
    if ((uint64_t)(v24 + 1) < 0)
      goto LABEL_67;
    v26 = v20 - v23;
    if (2 * v26 > v25)
      v25 = 2 * v26;
    if (v26 >= 0x3FFFFFFFFFFFFFFFLL)
      v27 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v27 = v25;
    if (v27)
      v28 = (unint64_t)operator new(v27);
    else
      v28 = 0;
    v29 = (char *)(v28 + v27);
    v24[v28] = 35;
    v22 = (uint64_t)&v24[v28 + 1];
    if (v21 == (_BYTE *)v23)
    {
      v28 += (unint64_t)v24;
    }
    else
    {
      v30 = &v21[~v23];
      do
      {
        v31 = *--v21;
        (v30--)[v28] = v31;
      }
      while (v21 != (_BYTE *)v23);
      v21 = (_BYTE *)*v19;
    }
    *v19 = v28;
    v19[1] = v22;
    v19[2] = (unint64_t)v29;
    if (v21)
      operator delete(v21);
  }
  else
  {
    *v21 = 35;
    v22 = (uint64_t)(v21 + 1);
  }
  v19[1] = v22;
  v32 = (unint64_t *)*((_QWORD *)this + 1);
  v34 = (_BYTE *)v32[1];
  v33 = v32[2];
  if ((unint64_t)v34 < v33)
  {
    *v34 = 76;
    v35 = (uint64_t)(v34 + 1);
    goto LABEL_55;
  }
  v36 = *v32;
  v37 = &v34[-*v32];
  v38 = (unint64_t)(v37 + 1);
  if ((uint64_t)(v37 + 1) < 0)
LABEL_67:
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v39 = v33 - v36;
  if (2 * v39 > v38)
    v38 = 2 * v39;
  if (v39 >= 0x3FFFFFFFFFFFFFFFLL)
    v40 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v40 = v38;
  if (v40)
    v41 = (unint64_t)operator new(v40);
  else
    v41 = 0;
  v42 = (char *)(v41 + v40);
  v37[v41] = 76;
  v35 = (uint64_t)&v37[v41 + 1];
  if (v34 == (_BYTE *)v36)
  {
    v41 += (unint64_t)v37;
  }
  else
  {
    v43 = &v34[~v36];
    do
    {
      v44 = *--v34;
      (v43--)[v41] = v44;
    }
    while (v34 != (_BYTE *)v36);
    v34 = (_BYTE *)*v32;
  }
  *v32 = v41;
  v32[1] = v35;
  v32[2] = (unint64_t)v42;
  if (v34)
    operator delete(v34);
LABEL_55:
  v32[1] = v35;
  v46 = (uint64_t *)*((_QWORD *)a2 + 2);
  v45 = (uint64_t *)*((_QWORD *)a2 + 3);
  while (v46 != v45)
  {
    v47 = *v46;
    v54 = v47;
    if (v47)
    {
      v48 = (unsigned int *)(v47 + 8);
      do
        v49 = __ldxr(v48);
      while (__stxr(v49 + 1, v48));
    }
    (*(void (**)(xgboost::UBJWriter *, uint64_t *))(*(_QWORD *)this + 16))(this, &v54);
    v50 = v54;
    if (v54)
    {
      v51 = (unsigned int *)(v54 + 8);
      do
      {
        v52 = __ldxr(v51);
        v53 = v52 - 1;
      }
      while (__stlxr(v53, v51));
      if (!v53)
      {
        __dmb(9u);
        (*(void (**)(uint64_t))(*(_QWORD *)v50 + 8))(v50);
      }
    }
    ++v46;
  }
}

void xgboost::`anonymous namespace'::WritePrimitive<long long>(uint64_t a1, std::vector<char> *this)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  std::vector<char>::pointer begin;
  unint64_t v8;
  uint64_t v9;

  v3 = 0;
  v9 = a1;
  v4 = 7;
  do
  {
    v5 = *((_BYTE *)&v9 + v4);
    *((_BYTE *)&v9 + v4) = *((_BYTE *)&v9 + v3);
    *((_BYTE *)&v9 + v3++) = v5;
    --v4;
  }
  while (v3 != 4);
  v6 = v9;
  begin = this->__begin_;
  v8 = this->__end_ - this->__begin_;
  if (v8 > 0xFFFFFFFFFFFFFFF7)
  {
    this->__end_ = &begin[v8 + 8];
  }
  else
  {
    std::vector<char>::__append(this, 8uLL);
    begin = this->__begin_;
  }
  *(_QWORD *)&begin[v8] = v6;
}

void xgboost::UBJWriter::Visit(uint64_t a1, uint64_t a2)
{
  std::vector<char> *v3;
  char *value;
  std::vector<char>::pointer end;
  char *v6;
  std::vector<char>::pointer begin;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  char *v16;
  char *v17;
  std::vector<char>::pointer v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  char *v23;
  char *v24;
  char *v25;
  char v26;
  char *v27;
  char *v28;
  std::vector<char>::pointer v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  size_t v33;
  char *v34;
  char *v35;
  char *v36;
  char v37;
  char *v38;
  char *v39;
  std::vector<char>::pointer v40;
  int64_t v41;
  unint64_t v42;
  unint64_t v43;
  size_t v44;
  char *v45;
  char *v46;
  char *v47;
  char v48;
  char *v49;
  uint64_t v50;
  std::vector<char>::pointer v51;
  int64_t v52;
  unint64_t v53;
  unint64_t v54;
  size_t v55;
  char *v56;
  char *v57;
  char *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  std::vector<char>::size_type v63;
  uint64_t v64;
  uint64_t v65;

  v3 = *(std::vector<char> **)(a1 + 8);
  end = v3->__end_;
  value = v3->__end_cap_.__value_;
  if (end >= value)
  {
    begin = v3->__begin_;
    v8 = end - v3->__begin_;
    v9 = v8 + 1;
    if (v8 + 1 < 0)
      goto LABEL_101;
    v10 = value - begin;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)operator new(v11);
    else
      v12 = 0;
    v13 = &v12[v11];
    v12[v8] = 91;
    v6 = &v12[v8 + 1];
    if (end == begin)
    {
      v12 += v8;
    }
    else
    {
      v14 = &end[~(unint64_t)begin];
      do
      {
        v15 = *--end;
        (v14--)[(_QWORD)v12] = v15;
      }
      while (end != begin);
      end = v3->__begin_;
    }
    v3->__begin_ = v12;
    v3->__end_ = v6;
    v3->__end_cap_.__value_ = v13;
    if (end)
      operator delete(end);
  }
  else
  {
    *end = 91;
    v6 = end + 1;
  }
  v3->__end_ = v6;
  v16 = v3->__end_cap_.__value_;
  if (v6 < v16)
  {
    *v6 = 36;
    v17 = v6 + 1;
    goto LABEL_37;
  }
  v18 = v3->__begin_;
  v19 = v6 - v3->__begin_;
  v20 = v19 + 1;
  if (v19 + 1 < 0)
    goto LABEL_101;
  v21 = v16 - v18;
  if (2 * v21 > v20)
    v20 = 2 * v21;
  if (v21 >= 0x3FFFFFFFFFFFFFFFLL)
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v22 = v20;
  if (v22)
    v23 = (char *)operator new(v22);
  else
    v23 = 0;
  v24 = &v23[v22];
  v23[v19] = 36;
  v17 = &v23[v19 + 1];
  if (v6 == v18)
  {
    v3->__begin_ = &v23[v19];
    v3->__end_ = v17;
    v3->__end_cap_.__value_ = v24;
LABEL_36:
    operator delete(v6);
    goto LABEL_37;
  }
  v25 = &v6[~(unint64_t)v18];
  do
  {
    v26 = *--v6;
    (v25--)[(_QWORD)v23] = v26;
  }
  while (v6 != v18);
  v6 = v3->__begin_;
  v3->__begin_ = v23;
  v3->__end_ = v17;
  v3->__end_cap_.__value_ = v24;
  if (v6)
    goto LABEL_36;
LABEL_37:
  v3->__end_ = v17;
  v27 = v3->__end_cap_.__value_;
  if (v17 < v27)
  {
    *v17 = 100;
    v28 = v17 + 1;
    goto LABEL_55;
  }
  v29 = v3->__begin_;
  v30 = v17 - v3->__begin_;
  v31 = v30 + 1;
  if (v30 + 1 < 0)
    goto LABEL_101;
  v32 = v27 - v29;
  if (2 * v32 > v31)
    v31 = 2 * v32;
  if (v32 >= 0x3FFFFFFFFFFFFFFFLL)
    v33 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v33 = v31;
  if (v33)
    v34 = (char *)operator new(v33);
  else
    v34 = 0;
  v35 = &v34[v33];
  v34[v30] = 100;
  v28 = &v34[v30 + 1];
  if (v17 == v29)
  {
    v3->__begin_ = &v34[v30];
    v3->__end_ = v28;
    v3->__end_cap_.__value_ = v35;
LABEL_54:
    operator delete(v17);
    goto LABEL_55;
  }
  v36 = &v17[~(unint64_t)v29];
  do
  {
    v37 = *--v17;
    (v36--)[(_QWORD)v34] = v37;
  }
  while (v17 != v29);
  v17 = v3->__begin_;
  v3->__begin_ = v34;
  v3->__end_ = v28;
  v3->__end_cap_.__value_ = v35;
  if (v17)
    goto LABEL_54;
LABEL_55:
  v3->__end_ = v28;
  v38 = v3->__end_cap_.__value_;
  if (v28 < v38)
  {
    *v28 = 35;
    v39 = v28 + 1;
    goto LABEL_73;
  }
  v40 = v3->__begin_;
  v41 = v28 - v3->__begin_;
  v42 = v41 + 1;
  if (v41 + 1 < 0)
    goto LABEL_101;
  v43 = v38 - v40;
  if (2 * v43 > v42)
    v42 = 2 * v43;
  if (v43 >= 0x3FFFFFFFFFFFFFFFLL)
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v44 = v42;
  if (v44)
    v45 = (char *)operator new(v44);
  else
    v45 = 0;
  v46 = &v45[v44];
  v45[v41] = 35;
  v39 = &v45[v41 + 1];
  if (v28 == v40)
  {
    v3->__begin_ = &v45[v41];
    v3->__end_ = v39;
    v3->__end_cap_.__value_ = v46;
LABEL_72:
    operator delete(v28);
    goto LABEL_73;
  }
  v47 = &v28[~(unint64_t)v40];
  do
  {
    v48 = *--v28;
    (v47--)[(_QWORD)v45] = v48;
  }
  while (v28 != v40);
  v28 = v3->__begin_;
  v3->__begin_ = v45;
  v3->__end_ = v39;
  v3->__end_cap_.__value_ = v46;
  if (v28)
    goto LABEL_72;
LABEL_73:
  v3->__end_ = v39;
  v49 = v3->__end_cap_.__value_;
  if (v39 < v49)
  {
    *v39 = 76;
    v50 = (uint64_t)(v39 + 1);
    goto LABEL_91;
  }
  v51 = v3->__begin_;
  v52 = v39 - v3->__begin_;
  v53 = v52 + 1;
  if (v52 + 1 < 0)
LABEL_101:
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v54 = v49 - v51;
  if (2 * v54 > v53)
    v53 = 2 * v54;
  if (v54 >= 0x3FFFFFFFFFFFFFFFLL)
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v55 = v53;
  if (v55)
    v56 = (char *)operator new(v55);
  else
    v56 = 0;
  v57 = &v56[v55];
  v56[v52] = 76;
  v50 = (uint64_t)&v56[v52 + 1];
  if (v39 == v51)
  {
    v3->__begin_ = &v56[v52];
    v3->__end_ = (std::vector<char>::pointer)v50;
    v3->__end_cap_.__value_ = v57;
LABEL_90:
    operator delete(v39);
    goto LABEL_91;
  }
  v58 = &v39[~(unint64_t)v51];
  do
  {
    v59 = *--v39;
    (v58--)[(_QWORD)v56] = v59;
  }
  while (v39 != v51);
  v39 = v3->__begin_;
  v3->__begin_ = v56;
  v3->__end_ = (std::vector<char>::pointer)v50;
  v3->__end_cap_.__value_ = v57;
  if (v39)
    goto LABEL_90;
LABEL_91:
  v3->__end_ = (std::vector<char>::pointer)v50;
  v61 = *(_QWORD *)(a2 + 16);
  v60 = *(_QWORD *)(a2 + 24);
  v62 = v3->__end_ - v3->__begin_;
  v63 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v62 >= v63 + v62)
  {
    if (v62 > v63 + v62)
      v3->__end_ = &v3->__begin_[v63 + v62];
  }
  else
  {
    std::vector<char>::__append(v3, v63);
  }
  if (v60 != v61)
  {
    v64 = 0;
    if ((unint64_t)((v60 - v61) >> 2) <= 1)
      v65 = 1;
    else
      v65 = (v60 - v61) >> 2;
    do
    {
      *(_DWORD *)&v3->__begin_[4 * v64 + v62] = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v64));
      ++v64;
    }
    while (v65 != v64);
  }
}

{
  std::vector<char> *v3;
  char *value;
  std::vector<char>::pointer end;
  char *v6;
  std::vector<char>::pointer begin;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  char *v16;
  char *v17;
  std::vector<char>::pointer v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  char *v23;
  char *v24;
  char *v25;
  char v26;
  char *v27;
  char *v28;
  std::vector<char>::pointer v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  size_t v33;
  char *v34;
  char *v35;
  char *v36;
  char v37;
  char *v38;
  char *v39;
  std::vector<char>::pointer v40;
  int64_t v41;
  unint64_t v42;
  unint64_t v43;
  size_t v44;
  char *v45;
  char *v46;
  char *v47;
  char v48;
  char *v49;
  uint64_t v50;
  std::vector<char>::pointer v51;
  int64_t v52;
  unint64_t v53;
  unint64_t v54;
  size_t v55;
  char *v56;
  char *v57;
  char *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  std::vector<char>::size_type v63;
  uint64_t v64;
  uint64_t v65;

  v3 = *(std::vector<char> **)(a1 + 8);
  end = v3->__end_;
  value = v3->__end_cap_.__value_;
  if (end >= value)
  {
    begin = v3->__begin_;
    v8 = end - v3->__begin_;
    v9 = v8 + 1;
    if (v8 + 1 < 0)
      goto LABEL_101;
    v10 = value - begin;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)operator new(v11);
    else
      v12 = 0;
    v13 = &v12[v11];
    v12[v8] = 91;
    v6 = &v12[v8 + 1];
    if (end == begin)
    {
      v12 += v8;
    }
    else
    {
      v14 = &end[~(unint64_t)begin];
      do
      {
        v15 = *--end;
        (v14--)[(_QWORD)v12] = v15;
      }
      while (end != begin);
      end = v3->__begin_;
    }
    v3->__begin_ = v12;
    v3->__end_ = v6;
    v3->__end_cap_.__value_ = v13;
    if (end)
      operator delete(end);
  }
  else
  {
    *end = 91;
    v6 = end + 1;
  }
  v3->__end_ = v6;
  v16 = v3->__end_cap_.__value_;
  if (v6 < v16)
  {
    *v6 = 36;
    v17 = v6 + 1;
    goto LABEL_37;
  }
  v18 = v3->__begin_;
  v19 = v6 - v3->__begin_;
  v20 = v19 + 1;
  if (v19 + 1 < 0)
    goto LABEL_101;
  v21 = v16 - v18;
  if (2 * v21 > v20)
    v20 = 2 * v21;
  if (v21 >= 0x3FFFFFFFFFFFFFFFLL)
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v22 = v20;
  if (v22)
    v23 = (char *)operator new(v22);
  else
    v23 = 0;
  v24 = &v23[v22];
  v23[v19] = 36;
  v17 = &v23[v19 + 1];
  if (v6 == v18)
  {
    v3->__begin_ = &v23[v19];
    v3->__end_ = v17;
    v3->__end_cap_.__value_ = v24;
LABEL_36:
    operator delete(v6);
    goto LABEL_37;
  }
  v25 = &v6[~(unint64_t)v18];
  do
  {
    v26 = *--v6;
    (v25--)[(_QWORD)v23] = v26;
  }
  while (v6 != v18);
  v6 = v3->__begin_;
  v3->__begin_ = v23;
  v3->__end_ = v17;
  v3->__end_cap_.__value_ = v24;
  if (v6)
    goto LABEL_36;
LABEL_37:
  v3->__end_ = v17;
  v27 = v3->__end_cap_.__value_;
  if (v17 < v27)
  {
    *v17 = 85;
    v28 = v17 + 1;
    goto LABEL_55;
  }
  v29 = v3->__begin_;
  v30 = v17 - v3->__begin_;
  v31 = v30 + 1;
  if (v30 + 1 < 0)
    goto LABEL_101;
  v32 = v27 - v29;
  if (2 * v32 > v31)
    v31 = 2 * v32;
  if (v32 >= 0x3FFFFFFFFFFFFFFFLL)
    v33 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v33 = v31;
  if (v33)
    v34 = (char *)operator new(v33);
  else
    v34 = 0;
  v35 = &v34[v33];
  v34[v30] = 85;
  v28 = &v34[v30 + 1];
  if (v17 == v29)
  {
    v3->__begin_ = &v34[v30];
    v3->__end_ = v28;
    v3->__end_cap_.__value_ = v35;
LABEL_54:
    operator delete(v17);
    goto LABEL_55;
  }
  v36 = &v17[~(unint64_t)v29];
  do
  {
    v37 = *--v17;
    (v36--)[(_QWORD)v34] = v37;
  }
  while (v17 != v29);
  v17 = v3->__begin_;
  v3->__begin_ = v34;
  v3->__end_ = v28;
  v3->__end_cap_.__value_ = v35;
  if (v17)
    goto LABEL_54;
LABEL_55:
  v3->__end_ = v28;
  v38 = v3->__end_cap_.__value_;
  if (v28 < v38)
  {
    *v28 = 35;
    v39 = v28 + 1;
    goto LABEL_73;
  }
  v40 = v3->__begin_;
  v41 = v28 - v3->__begin_;
  v42 = v41 + 1;
  if (v41 + 1 < 0)
    goto LABEL_101;
  v43 = v38 - v40;
  if (2 * v43 > v42)
    v42 = 2 * v43;
  if (v43 >= 0x3FFFFFFFFFFFFFFFLL)
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v44 = v42;
  if (v44)
    v45 = (char *)operator new(v44);
  else
    v45 = 0;
  v46 = &v45[v44];
  v45[v41] = 35;
  v39 = &v45[v41 + 1];
  if (v28 == v40)
  {
    v3->__begin_ = &v45[v41];
    v3->__end_ = v39;
    v3->__end_cap_.__value_ = v46;
LABEL_72:
    operator delete(v28);
    goto LABEL_73;
  }
  v47 = &v28[~(unint64_t)v40];
  do
  {
    v48 = *--v28;
    (v47--)[(_QWORD)v45] = v48;
  }
  while (v28 != v40);
  v28 = v3->__begin_;
  v3->__begin_ = v45;
  v3->__end_ = v39;
  v3->__end_cap_.__value_ = v46;
  if (v28)
    goto LABEL_72;
LABEL_73:
  v3->__end_ = v39;
  v49 = v3->__end_cap_.__value_;
  if (v39 < v49)
  {
    *v39 = 76;
    v50 = (uint64_t)(v39 + 1);
    goto LABEL_91;
  }
  v51 = v3->__begin_;
  v52 = v39 - v3->__begin_;
  v53 = v52 + 1;
  if (v52 + 1 < 0)
LABEL_101:
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v54 = v49 - v51;
  if (2 * v54 > v53)
    v53 = 2 * v54;
  if (v54 >= 0x3FFFFFFFFFFFFFFFLL)
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v55 = v53;
  if (v55)
    v56 = (char *)operator new(v55);
  else
    v56 = 0;
  v57 = &v56[v55];
  v56[v52] = 76;
  v50 = (uint64_t)&v56[v52 + 1];
  if (v39 == v51)
  {
    v3->__begin_ = &v56[v52];
    v3->__end_ = (std::vector<char>::pointer)v50;
    v3->__end_cap_.__value_ = v57;
LABEL_90:
    operator delete(v39);
    goto LABEL_91;
  }
  v58 = &v39[~(unint64_t)v51];
  do
  {
    v59 = *--v39;
    (v58--)[(_QWORD)v56] = v59;
  }
  while (v39 != v51);
  v39 = v3->__begin_;
  v3->__begin_ = v56;
  v3->__end_ = (std::vector<char>::pointer)v50;
  v3->__end_cap_.__value_ = v57;
  if (v39)
    goto LABEL_90;
LABEL_91:
  v3->__end_ = (std::vector<char>::pointer)v50;
  v61 = *(_QWORD *)(a2 + 16);
  v60 = *(_QWORD *)(a2 + 24);
  v62 = v3->__end_ - v3->__begin_;
  v63 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v62 >= v63 + v62)
  {
    if (v62 > v63 + v62)
      v3->__end_ = &v3->__begin_[v63 + v62];
  }
  else
  {
    std::vector<char>::__append(v3, v63);
  }
  if (v60 != v61)
  {
    v64 = 0;
    if ((unint64_t)(v60 - v61) <= 1)
      v65 = 1;
    else
      v65 = v60 - v61;
    do
    {
      v3->__begin_[v62 + v64] = *(_BYTE *)(*(_QWORD *)(a2 + 16) + v64);
      ++v64;
    }
    while (v65 != v64);
  }
}

{
  std::vector<char> *v3;
  char *value;
  std::vector<char>::pointer end;
  char *v6;
  std::vector<char>::pointer begin;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  char *v16;
  char *v17;
  std::vector<char>::pointer v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  char *v23;
  char *v24;
  char *v25;
  char v26;
  char *v27;
  char *v28;
  std::vector<char>::pointer v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  size_t v33;
  char *v34;
  char *v35;
  char *v36;
  char v37;
  char *v38;
  char *v39;
  std::vector<char>::pointer v40;
  int64_t v41;
  unint64_t v42;
  unint64_t v43;
  size_t v44;
  char *v45;
  char *v46;
  char *v47;
  char v48;
  char *v49;
  uint64_t v50;
  std::vector<char>::pointer v51;
  int64_t v52;
  unint64_t v53;
  unint64_t v54;
  size_t v55;
  char *v56;
  char *v57;
  char *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  std::vector<char>::size_type v63;
  uint64_t v64;
  uint64_t v65;

  v3 = *(std::vector<char> **)(a1 + 8);
  end = v3->__end_;
  value = v3->__end_cap_.__value_;
  if (end >= value)
  {
    begin = v3->__begin_;
    v8 = end - v3->__begin_;
    v9 = v8 + 1;
    if (v8 + 1 < 0)
      goto LABEL_101;
    v10 = value - begin;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)operator new(v11);
    else
      v12 = 0;
    v13 = &v12[v11];
    v12[v8] = 91;
    v6 = &v12[v8 + 1];
    if (end == begin)
    {
      v12 += v8;
    }
    else
    {
      v14 = &end[~(unint64_t)begin];
      do
      {
        v15 = *--end;
        (v14--)[(_QWORD)v12] = v15;
      }
      while (end != begin);
      end = v3->__begin_;
    }
    v3->__begin_ = v12;
    v3->__end_ = v6;
    v3->__end_cap_.__value_ = v13;
    if (end)
      operator delete(end);
  }
  else
  {
    *end = 91;
    v6 = end + 1;
  }
  v3->__end_ = v6;
  v16 = v3->__end_cap_.__value_;
  if (v6 < v16)
  {
    *v6 = 36;
    v17 = v6 + 1;
    goto LABEL_37;
  }
  v18 = v3->__begin_;
  v19 = v6 - v3->__begin_;
  v20 = v19 + 1;
  if (v19 + 1 < 0)
    goto LABEL_101;
  v21 = v16 - v18;
  if (2 * v21 > v20)
    v20 = 2 * v21;
  if (v21 >= 0x3FFFFFFFFFFFFFFFLL)
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v22 = v20;
  if (v22)
    v23 = (char *)operator new(v22);
  else
    v23 = 0;
  v24 = &v23[v22];
  v23[v19] = 36;
  v17 = &v23[v19 + 1];
  if (v6 == v18)
  {
    v3->__begin_ = &v23[v19];
    v3->__end_ = v17;
    v3->__end_cap_.__value_ = v24;
LABEL_36:
    operator delete(v6);
    goto LABEL_37;
  }
  v25 = &v6[~(unint64_t)v18];
  do
  {
    v26 = *--v6;
    (v25--)[(_QWORD)v23] = v26;
  }
  while (v6 != v18);
  v6 = v3->__begin_;
  v3->__begin_ = v23;
  v3->__end_ = v17;
  v3->__end_cap_.__value_ = v24;
  if (v6)
    goto LABEL_36;
LABEL_37:
  v3->__end_ = v17;
  v27 = v3->__end_cap_.__value_;
  if (v17 < v27)
  {
    *v17 = 108;
    v28 = v17 + 1;
    goto LABEL_55;
  }
  v29 = v3->__begin_;
  v30 = v17 - v3->__begin_;
  v31 = v30 + 1;
  if (v30 + 1 < 0)
    goto LABEL_101;
  v32 = v27 - v29;
  if (2 * v32 > v31)
    v31 = 2 * v32;
  if (v32 >= 0x3FFFFFFFFFFFFFFFLL)
    v33 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v33 = v31;
  if (v33)
    v34 = (char *)operator new(v33);
  else
    v34 = 0;
  v35 = &v34[v33];
  v34[v30] = 108;
  v28 = &v34[v30 + 1];
  if (v17 == v29)
  {
    v3->__begin_ = &v34[v30];
    v3->__end_ = v28;
    v3->__end_cap_.__value_ = v35;
LABEL_54:
    operator delete(v17);
    goto LABEL_55;
  }
  v36 = &v17[~(unint64_t)v29];
  do
  {
    v37 = *--v17;
    (v36--)[(_QWORD)v34] = v37;
  }
  while (v17 != v29);
  v17 = v3->__begin_;
  v3->__begin_ = v34;
  v3->__end_ = v28;
  v3->__end_cap_.__value_ = v35;
  if (v17)
    goto LABEL_54;
LABEL_55:
  v3->__end_ = v28;
  v38 = v3->__end_cap_.__value_;
  if (v28 < v38)
  {
    *v28 = 35;
    v39 = v28 + 1;
    goto LABEL_73;
  }
  v40 = v3->__begin_;
  v41 = v28 - v3->__begin_;
  v42 = v41 + 1;
  if (v41 + 1 < 0)
    goto LABEL_101;
  v43 = v38 - v40;
  if (2 * v43 > v42)
    v42 = 2 * v43;
  if (v43 >= 0x3FFFFFFFFFFFFFFFLL)
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v44 = v42;
  if (v44)
    v45 = (char *)operator new(v44);
  else
    v45 = 0;
  v46 = &v45[v44];
  v45[v41] = 35;
  v39 = &v45[v41 + 1];
  if (v28 == v40)
  {
    v3->__begin_ = &v45[v41];
    v3->__end_ = v39;
    v3->__end_cap_.__value_ = v46;
LABEL_72:
    operator delete(v28);
    goto LABEL_73;
  }
  v47 = &v28[~(unint64_t)v40];
  do
  {
    v48 = *--v28;
    (v47--)[(_QWORD)v45] = v48;
  }
  while (v28 != v40);
  v28 = v3->__begin_;
  v3->__begin_ = v45;
  v3->__end_ = v39;
  v3->__end_cap_.__value_ = v46;
  if (v28)
    goto LABEL_72;
LABEL_73:
  v3->__end_ = v39;
  v49 = v3->__end_cap_.__value_;
  if (v39 < v49)
  {
    *v39 = 76;
    v50 = (uint64_t)(v39 + 1);
    goto LABEL_91;
  }
  v51 = v3->__begin_;
  v52 = v39 - v3->__begin_;
  v53 = v52 + 1;
  if (v52 + 1 < 0)
LABEL_101:
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v54 = v49 - v51;
  if (2 * v54 > v53)
    v53 = 2 * v54;
  if (v54 >= 0x3FFFFFFFFFFFFFFFLL)
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v55 = v53;
  if (v55)
    v56 = (char *)operator new(v55);
  else
    v56 = 0;
  v57 = &v56[v55];
  v56[v52] = 76;
  v50 = (uint64_t)&v56[v52 + 1];
  if (v39 == v51)
  {
    v3->__begin_ = &v56[v52];
    v3->__end_ = (std::vector<char>::pointer)v50;
    v3->__end_cap_.__value_ = v57;
LABEL_90:
    operator delete(v39);
    goto LABEL_91;
  }
  v58 = &v39[~(unint64_t)v51];
  do
  {
    v59 = *--v39;
    (v58--)[(_QWORD)v56] = v59;
  }
  while (v39 != v51);
  v39 = v3->__begin_;
  v3->__begin_ = v56;
  v3->__end_ = (std::vector<char>::pointer)v50;
  v3->__end_cap_.__value_ = v57;
  if (v39)
    goto LABEL_90;
LABEL_91:
  v3->__end_ = (std::vector<char>::pointer)v50;
  v61 = *(_QWORD *)(a2 + 16);
  v60 = *(_QWORD *)(a2 + 24);
  v62 = v3->__end_ - v3->__begin_;
  v63 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v62 >= v63 + v62)
  {
    if (v62 > v63 + v62)
      v3->__end_ = &v3->__begin_[v63 + v62];
  }
  else
  {
    std::vector<char>::__append(v3, v63);
  }
  if (v60 != v61)
  {
    v64 = 0;
    if ((unint64_t)((v60 - v61) >> 2) <= 1)
      v65 = 1;
    else
      v65 = (v60 - v61) >> 2;
    do
    {
      *(_DWORD *)&v3->__begin_[4 * v64 + v62] = bswap32(*(_DWORD *)(*(_QWORD *)(a2 + 16) + 4 * v64));
      ++v64;
    }
    while (v65 != v64);
  }
}

{
  std::vector<char> *v3;
  char *value;
  std::vector<char>::pointer end;
  char *v6;
  std::vector<char>::pointer begin;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  char *v16;
  char *v17;
  std::vector<char>::pointer v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  char *v23;
  char *v24;
  char *v25;
  char v26;
  char *v27;
  char *v28;
  std::vector<char>::pointer v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  size_t v33;
  char *v34;
  char *v35;
  char *v36;
  char v37;
  char *v38;
  char *v39;
  std::vector<char>::pointer v40;
  int64_t v41;
  unint64_t v42;
  unint64_t v43;
  size_t v44;
  char *v45;
  char *v46;
  char *v47;
  char v48;
  char *v49;
  uint64_t v50;
  std::vector<char>::pointer v51;
  int64_t v52;
  unint64_t v53;
  unint64_t v54;
  size_t v55;
  char *v56;
  char *v57;
  char *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  std::vector<char>::size_type v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;

  v3 = *(std::vector<char> **)(a1 + 8);
  end = v3->__end_;
  value = v3->__end_cap_.__value_;
  if (end >= value)
  {
    begin = v3->__begin_;
    v8 = end - v3->__begin_;
    v9 = v8 + 1;
    if (v8 + 1 < 0)
      goto LABEL_103;
    v10 = value - begin;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)operator new(v11);
    else
      v12 = 0;
    v13 = &v12[v11];
    v12[v8] = 91;
    v6 = &v12[v8 + 1];
    if (end == begin)
    {
      v12 += v8;
    }
    else
    {
      v14 = &end[~(unint64_t)begin];
      do
      {
        v15 = *--end;
        (v14--)[(_QWORD)v12] = v15;
      }
      while (end != begin);
      end = v3->__begin_;
    }
    v3->__begin_ = v12;
    v3->__end_ = v6;
    v3->__end_cap_.__value_ = v13;
    if (end)
      operator delete(end);
  }
  else
  {
    *end = 91;
    v6 = end + 1;
  }
  v3->__end_ = v6;
  v16 = v3->__end_cap_.__value_;
  if (v6 < v16)
  {
    *v6 = 36;
    v17 = v6 + 1;
    goto LABEL_37;
  }
  v18 = v3->__begin_;
  v19 = v6 - v3->__begin_;
  v20 = v19 + 1;
  if (v19 + 1 < 0)
    goto LABEL_103;
  v21 = v16 - v18;
  if (2 * v21 > v20)
    v20 = 2 * v21;
  if (v21 >= 0x3FFFFFFFFFFFFFFFLL)
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v22 = v20;
  if (v22)
    v23 = (char *)operator new(v22);
  else
    v23 = 0;
  v24 = &v23[v22];
  v23[v19] = 36;
  v17 = &v23[v19 + 1];
  if (v6 == v18)
  {
    v3->__begin_ = &v23[v19];
    v3->__end_ = v17;
    v3->__end_cap_.__value_ = v24;
LABEL_36:
    operator delete(v6);
    goto LABEL_37;
  }
  v25 = &v6[~(unint64_t)v18];
  do
  {
    v26 = *--v6;
    (v25--)[(_QWORD)v23] = v26;
  }
  while (v6 != v18);
  v6 = v3->__begin_;
  v3->__begin_ = v23;
  v3->__end_ = v17;
  v3->__end_cap_.__value_ = v24;
  if (v6)
    goto LABEL_36;
LABEL_37:
  v3->__end_ = v17;
  v27 = v3->__end_cap_.__value_;
  if (v17 < v27)
  {
    *v17 = 76;
    v28 = v17 + 1;
    goto LABEL_55;
  }
  v29 = v3->__begin_;
  v30 = v17 - v3->__begin_;
  v31 = v30 + 1;
  if (v30 + 1 < 0)
    goto LABEL_103;
  v32 = v27 - v29;
  if (2 * v32 > v31)
    v31 = 2 * v32;
  if (v32 >= 0x3FFFFFFFFFFFFFFFLL)
    v33 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v33 = v31;
  if (v33)
    v34 = (char *)operator new(v33);
  else
    v34 = 0;
  v35 = &v34[v33];
  v34[v30] = 76;
  v28 = &v34[v30 + 1];
  if (v17 == v29)
  {
    v3->__begin_ = &v34[v30];
    v3->__end_ = v28;
    v3->__end_cap_.__value_ = v35;
LABEL_54:
    operator delete(v17);
    goto LABEL_55;
  }
  v36 = &v17[~(unint64_t)v29];
  do
  {
    v37 = *--v17;
    (v36--)[(_QWORD)v34] = v37;
  }
  while (v17 != v29);
  v17 = v3->__begin_;
  v3->__begin_ = v34;
  v3->__end_ = v28;
  v3->__end_cap_.__value_ = v35;
  if (v17)
    goto LABEL_54;
LABEL_55:
  v3->__end_ = v28;
  v38 = v3->__end_cap_.__value_;
  if (v28 < v38)
  {
    *v28 = 35;
    v39 = v28 + 1;
    goto LABEL_73;
  }
  v40 = v3->__begin_;
  v41 = v28 - v3->__begin_;
  v42 = v41 + 1;
  if (v41 + 1 < 0)
    goto LABEL_103;
  v43 = v38 - v40;
  if (2 * v43 > v42)
    v42 = 2 * v43;
  if (v43 >= 0x3FFFFFFFFFFFFFFFLL)
    v44 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v44 = v42;
  if (v44)
    v45 = (char *)operator new(v44);
  else
    v45 = 0;
  v46 = &v45[v44];
  v45[v41] = 35;
  v39 = &v45[v41 + 1];
  if (v28 == v40)
  {
    v3->__begin_ = &v45[v41];
    v3->__end_ = v39;
    v3->__end_cap_.__value_ = v46;
LABEL_72:
    operator delete(v28);
    goto LABEL_73;
  }
  v47 = &v28[~(unint64_t)v40];
  do
  {
    v48 = *--v28;
    (v47--)[(_QWORD)v45] = v48;
  }
  while (v28 != v40);
  v28 = v3->__begin_;
  v3->__begin_ = v45;
  v3->__end_ = v39;
  v3->__end_cap_.__value_ = v46;
  if (v28)
    goto LABEL_72;
LABEL_73:
  v3->__end_ = v39;
  v49 = v3->__end_cap_.__value_;
  if (v39 < v49)
  {
    *v39 = 76;
    v50 = (uint64_t)(v39 + 1);
    goto LABEL_91;
  }
  v51 = v3->__begin_;
  v52 = v39 - v3->__begin_;
  v53 = v52 + 1;
  if (v52 + 1 < 0)
LABEL_103:
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v54 = v49 - v51;
  if (2 * v54 > v53)
    v53 = 2 * v54;
  if (v54 >= 0x3FFFFFFFFFFFFFFFLL)
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v55 = v53;
  if (v55)
    v56 = (char *)operator new(v55);
  else
    v56 = 0;
  v57 = &v56[v55];
  v56[v52] = 76;
  v50 = (uint64_t)&v56[v52 + 1];
  if (v39 == v51)
  {
    v3->__begin_ = &v56[v52];
    v3->__end_ = (std::vector<char>::pointer)v50;
    v3->__end_cap_.__value_ = v57;
LABEL_90:
    operator delete(v39);
    goto LABEL_91;
  }
  v58 = &v39[~(unint64_t)v51];
  do
  {
    v59 = *--v39;
    (v58--)[(_QWORD)v56] = v59;
  }
  while (v39 != v51);
  v39 = v3->__begin_;
  v3->__begin_ = v56;
  v3->__end_ = (std::vector<char>::pointer)v50;
  v3->__end_cap_.__value_ = v57;
  if (v39)
    goto LABEL_90;
LABEL_91:
  v3->__end_ = (std::vector<char>::pointer)v50;
  v61 = *(_QWORD *)(a2 + 16);
  v60 = *(_QWORD *)(a2 + 24);
  v62 = v3->__end_ - v3->__begin_;
  v63 = *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16);
  if (v62 >= v63 + v62)
  {
    if (v62 > v63 + v62)
      v3->__end_ = &v3->__begin_[v63 + v62];
  }
  else
  {
    std::vector<char>::__append(v3, v63);
  }
  if (v60 != v61)
  {
    v64 = 0;
    if ((unint64_t)((v60 - v61) >> 3) <= 1)
      v65 = 1;
    else
      v65 = (v60 - v61) >> 3;
    do
    {
      v66 = 0;
      v69 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 8 * v64);
      v67 = 7;
      do
      {
        v68 = *((_BYTE *)&v69 + v67);
        *((_BYTE *)&v69 + v67) = *((_BYTE *)&v69 + v66);
        *((_BYTE *)&v69 + v66++) = v68;
        --v67;
      }
      while (v66 != 4);
      *(_QWORD *)&v3->__begin_[v62] = v69;
      v62 += 8;
      ++v64;
    }
    while (v64 != v65);
  }
}

void xgboost::UBJWriter::Visit(xgboost::UBJWriter *this, const xgboost::JsonObject *a2)
{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  const void **v17;
  char *v18;
  char *v19;
  unsigned int *v20;
  unsigned int v21;
  char *v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  char *v26;
  char *v27;
  BOOL v28;
  unint64_t *v29;
  unint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  _BYTE *v34;
  unint64_t v35;
  unint64_t v36;
  size_t v37;
  unint64_t v38;
  char *v39;
  _BYTE *v40;
  char v41;
  char *v42;

  v4 = (unint64_t *)*((_QWORD *)this + 1);
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 123;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 123;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = (const void **)*((_QWORD *)a2 + 2);
  v18 = (char *)a2 + 24;
  if (v17 != (const void **)v18)
  {
    do
    {
      v19 = (char *)v17[7];
      v42 = v19;
      if (v19)
      {
        v20 = (unsigned int *)(v19 + 8);
        do
          v21 = __ldxr(v20);
        while (__stxr(v21 + 1, v20));
      }
      (*(void (**)(xgboost::UBJWriter *, char **))(*(_QWORD *)this + 16))(this, &v42);
      v22 = v42;
      if (v42)
      {
        v23 = (unsigned int *)(v42 + 8);
        do
        {
          v24 = __ldxr(v23);
          v25 = v24 - 1;
        }
        while (__stlxr(v25, v23));
        if (!v25)
        {
          __dmb(9u);
          (*(void (**)(char *))(*(_QWORD *)v22 + 8))(v22);
        }
      }
      v26 = (char *)v17[1];
      if (v26)
      {
        do
        {
          v27 = v26;
          v26 = *(char **)v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          v27 = (char *)v17[2];
          v28 = *(_QWORD *)v27 == (_QWORD)v17;
          v17 = (const void **)v27;
        }
        while (!v28);
      }
      v17 = (const void **)v27;
    }
    while (v27 != v18);
  }
  v29 = (unint64_t *)*((_QWORD *)this + 1);
  v31 = (_BYTE *)v29[1];
  v30 = v29[2];
  if ((unint64_t)v31 >= v30)
  {
    v33 = *v29;
    v34 = &v31[-*v29];
    v35 = (unint64_t)(v34 + 1);
    if ((uint64_t)(v34 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v36 = v30 - v33;
    if (2 * v36 > v35)
      v35 = 2 * v36;
    if (v36 >= 0x3FFFFFFFFFFFFFFFLL)
      v37 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v37 = v35;
    if (v37)
      v38 = (unint64_t)operator new(v37);
    else
      v38 = 0;
    v39 = (char *)(v38 + v37);
    v34[v38] = 125;
    v32 = (uint64_t)&v34[v38 + 1];
    if (v31 == (_BYTE *)v33)
    {
      v38 += (unint64_t)v34;
    }
    else
    {
      v40 = &v31[~v33];
      do
      {
        v41 = *--v31;
        (v40--)[v38] = v41;
      }
      while (v31 != (_BYTE *)v33);
      v31 = (_BYTE *)*v29;
    }
    *v29 = v38;
    v29[1] = v32;
    v29[2] = (unint64_t)v39;
    if (v31)
      operator delete(v31);
  }
  else
  {
    *v31 = 125;
    v32 = (uint64_t)(v31 + 1);
  }
  v29[1] = v32;
}

void *xgboost::`anonymous namespace'::EncodeStr(std::vector<char> *this, const void **a2)
{
  char *value;
  std::vector<char>::pointer end;
  char *v6;
  std::vector<char>::pointer begin;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  uint64_t v16;
  std::vector<char>::pointer v17;
  unint64_t v18;
  std::vector<char>::size_type v19;
  int v20;
  const void *v21;
  size_t v22;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (end >= value)
  {
    begin = this->__begin_;
    v8 = end - this->__begin_;
    v9 = v8 + 1;
    if (v8 + 1 < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v10 = value - begin;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)operator new(v11);
    else
      v12 = 0;
    v13 = &v12[v11];
    v12[v8] = 76;
    v6 = &v12[v8 + 1];
    if (end == begin)
    {
      v12 += v8;
    }
    else
    {
      v14 = &end[~(unint64_t)begin];
      do
      {
        v15 = *--end;
        (v14--)[(_QWORD)v12] = v15;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v12;
    this->__end_ = v6;
    this->__end_cap_.__value_ = v13;
    if (end)
      operator delete(end);
  }
  else
  {
    *end = 76;
    v6 = end + 1;
  }
  this->__end_ = v6;
  if (*((char *)a2 + 23) >= 0)
    v16 = *((unsigned __int8 *)a2 + 23);
  else
    v16 = (uint64_t)a2[1];
  v17 = this->__begin_;
  v18 = this->__end_ - this->__begin_;
  if (*((char *)a2 + 23) >= 0)
    v19 = *((unsigned __int8 *)a2 + 23);
  else
    v19 = (std::vector<char>::size_type)a2[1];
  if (v18 >= v19 + v18)
  {
    if (v18 > v19 + v18)
      this->__end_ = &v17[v19 + v18];
  }
  else
  {
    std::vector<char>::__append(this, v19);
    v17 = this->__begin_;
  }
  v20 = *((char *)a2 + 23);
  if (v20 >= 0)
    v21 = a2;
  else
    v21 = *a2;
  if (v20 >= 0)
    v22 = *((unsigned __int8 *)a2 + 23);
  else
    v22 = (size_t)a2[1];
  return memcpy(&v17[v18], v21, v22);
}

void xgboost::UBJWriter::Visit(xgboost::UBJWriter *this, const xgboost::JsonNumber *a2)
{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  unsigned int v17;
  std::vector<char> *v18;
  std::vector<char>::pointer begin;
  unint64_t v20;

  v4 = (unint64_t *)*((_QWORD *)this + 1);
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 100;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 100;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  v17 = *((_DWORD *)a2 + 4);
  v18 = (std::vector<char> *)*((_QWORD *)this + 1);
  begin = v18->__begin_;
  v20 = v18->__end_ - v18->__begin_;
  if (v20 > 0xFFFFFFFFFFFFFFFBLL)
  {
    v18->__end_ = &begin[v20 + 4];
  }
  else
  {
    std::vector<char>::__append(v18, 4uLL);
    begin = v18->__begin_;
  }
  *(_DWORD *)&begin[v20] = bswap32(v17);
}

void xgboost::UBJWriter::Visit(xgboost::UBJWriter *this, const xgboost::JsonInteger *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE *v33;
  unint64_t v34;
  unint64_t v35;
  size_t v36;
  unint64_t v37;
  unint64_t v38;
  _BYTE *v39;
  unint64_t v40;
  unint64_t v41;
  size_t v42;
  unint64_t v43;
  char *v44;
  _BYTE *v45;
  char v46;
  std::vector<char> *v47;
  std::vector<char>::pointer begin;
  unint64_t v49;
  char *v50;
  _BYTE *v51;
  char v52;
  std::vector<char> *v53;
  char *v54;
  int64_t v55;
  char *v56;
  _BYTE *v57;
  char v58;
  char *v59;
  _BYTE *v60;
  char v61;
  std::vector<char> *v62;
  std::vector<char>::pointer v63;
  unint64_t v64;

  v3 = *((_QWORD *)a2 + 2);
  if (v3 < -127)
  {
    if ((unint64_t)v3 > 0xFFFFFFFFFFFF8000)
    {
LABEL_10:
      v12 = (unint64_t *)*((_QWORD *)this + 1);
      v14 = (_BYTE *)v12[1];
      v13 = v12[2];
      if ((unint64_t)v14 >= v13)
      {
        v16 = *v12;
        v17 = &v14[-*v12];
        v18 = (unint64_t)(v17 + 1);
        if ((uint64_t)(v17 + 1) < 0)
          goto LABEL_92;
        v19 = v13 - v16;
        if (2 * v19 > v18)
          v18 = 2 * v19;
        if (v19 >= 0x3FFFFFFFFFFFFFFFLL)
          v20 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v20 = v18;
        if (v20)
          v21 = (unint64_t)operator new(v20);
        else
          v21 = 0;
        v44 = (char *)(v21 + v20);
        v17[v21] = 73;
        v15 = (uint64_t)&v17[v21 + 1];
        if (v14 == (_BYTE *)v16)
        {
          v21 += (unint64_t)v17;
        }
        else
        {
          v45 = &v14[~v16];
          do
          {
            v46 = *--v14;
            (v45--)[v21] = v46;
          }
          while (v14 != (_BYTE *)v16);
          v14 = (_BYTE *)*v12;
        }
        *v12 = v21;
        v12[1] = v15;
        v12[2] = (unint64_t)v44;
        if (v14)
          operator delete(v14);
      }
      else
      {
        *v14 = 73;
        v15 = (uint64_t)(v14 + 1);
      }
      v12[1] = v15;
      v47 = (std::vector<char> *)*((_QWORD *)this + 1);
      begin = v47->__begin_;
      v49 = v47->__end_ - v47->__begin_;
      if (v49 > 0xFFFFFFFFFFFFFFFDLL)
      {
        v47->__end_ = &begin[v49 + 2];
      }
      else
      {
        std::vector<char>::__append(v47, 2uLL);
        begin = v47->__begin_;
      }
      *(_WORD *)&begin[v49] = bswap32(v3) >> 16;
      return;
    }
    if ((unint64_t)v3 <= 0xFFFFFFFF80000000)
    {
LABEL_29:
      v28 = (unint64_t *)*((_QWORD *)this + 1);
      v30 = (_BYTE *)v28[1];
      v29 = v28[2];
      if ((unint64_t)v30 >= v29)
      {
        v38 = *v28;
        v39 = &v30[-*v28];
        v40 = (unint64_t)(v39 + 1);
        if ((uint64_t)(v39 + 1) < 0)
          goto LABEL_92;
        v41 = v29 - v38;
        if (2 * v41 > v40)
          v40 = 2 * v41;
        if (v41 >= 0x3FFFFFFFFFFFFFFFLL)
          v42 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v42 = v40;
        if (v42)
          v43 = (unint64_t)operator new(v42);
        else
          v43 = 0;
        v59 = (char *)(v43 + v42);
        v39[v43] = 76;
        v31 = (uint64_t)&v39[v43 + 1];
        if (v30 == (_BYTE *)v38)
        {
          v43 += (unint64_t)v39;
        }
        else
        {
          v60 = &v30[~v38];
          do
          {
            v61 = *--v30;
            (v60--)[v43] = v61;
          }
          while (v30 != (_BYTE *)v38);
          v30 = (_BYTE *)*v28;
        }
        *v28 = v43;
        v28[1] = v31;
        v28[2] = (unint64_t)v59;
        if (v30)
          operator delete(v30);
      }
      else
      {
        *v30 = 76;
        v31 = (uint64_t)(v30 + 1);
      }
      v28[1] = v31;
      return;
    }
  }
  else
  {
    if (v3 <= 126)
    {
      v4 = (unint64_t *)*((_QWORD *)this + 1);
      v6 = (_BYTE *)v4[1];
      v5 = v4[2];
      if ((unint64_t)v6 < v5)
      {
        *v6 = 105;
        v7 = (uint64_t)(v6 + 1);
LABEL_67:
        v4[1] = v7;
        v53 = (std::vector<char> *)*((_QWORD *)this + 1);
        v54 = v53->__begin_;
        v55 = v53->__end_ - v53->__begin_;
        if (v55 == -1)
        {
          v53->__end_ = v54;
        }
        else
        {
          std::vector<char>::__append(v53, 1uLL);
          v54 = v53->__begin_;
        }
        v54[v55] = v3;
        return;
      }
      v22 = *v4;
      v23 = &v6[-*v4];
      v24 = (unint64_t)(v23 + 1);
      if ((uint64_t)(v23 + 1) >= 0)
      {
        v25 = v5 - v22;
        if (2 * v25 > v24)
          v24 = 2 * v25;
        if (v25 >= 0x3FFFFFFFFFFFFFFFLL)
          v26 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v26 = v24;
        if (v26)
          v27 = (unint64_t)operator new(v26);
        else
          v27 = 0;
        v50 = (char *)(v27 + v26);
        v23[v27] = 105;
        v7 = (uint64_t)&v23[v27 + 1];
        if (v6 == (_BYTE *)v22)
        {
          v27 += (unint64_t)v23;
        }
        else
        {
          v51 = &v6[~v22];
          do
          {
            v52 = *--v6;
            (v51--)[v27] = v52;
          }
          while (v6 != (_BYTE *)v22);
          v6 = (_BYTE *)*v4;
        }
        *v4 = v27;
        v4[1] = v7;
        v4[2] = (unint64_t)v50;
        if (v6)
          operator delete(v6);
        goto LABEL_67;
      }
LABEL_92:
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    }
    if ((unint64_t)v3 <= 0x7FFE)
      goto LABEL_10;
    if ((unint64_t)v3 > 0x7FFFFFFE)
      goto LABEL_29;
  }
  v8 = (unint64_t *)*((_QWORD *)this + 1);
  v10 = (_BYTE *)v8[1];
  v9 = v8[2];
  if ((unint64_t)v10 >= v9)
  {
    v32 = *v8;
    v33 = &v10[-*v8];
    v34 = (unint64_t)(v33 + 1);
    if ((uint64_t)(v33 + 1) < 0)
      goto LABEL_92;
    v35 = v9 - v32;
    if (2 * v35 > v34)
      v34 = 2 * v35;
    if (v35 >= 0x3FFFFFFFFFFFFFFFLL)
      v36 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v36 = v34;
    if (v36)
      v37 = (unint64_t)operator new(v36);
    else
      v37 = 0;
    v56 = (char *)(v37 + v36);
    v33[v37] = 108;
    v11 = (uint64_t)&v33[v37 + 1];
    if (v10 == (_BYTE *)v32)
    {
      v37 += (unint64_t)v33;
    }
    else
    {
      v57 = &v10[~v32];
      do
      {
        v58 = *--v10;
        (v57--)[v37] = v58;
      }
      while (v10 != (_BYTE *)v32);
      v10 = (_BYTE *)*v8;
    }
    *v8 = v37;
    v8[1] = v11;
    v8[2] = (unint64_t)v56;
    if (v10)
      operator delete(v10);
  }
  else
  {
    *v10 = 108;
    v11 = (uint64_t)(v10 + 1);
  }
  v8[1] = v11;
  v62 = (std::vector<char> *)*((_QWORD *)this + 1);
  v63 = v62->__begin_;
  v64 = v62->__end_ - v62->__begin_;
  if (v64 > 0xFFFFFFFFFFFFFFFBLL)
  {
    v62->__end_ = &v63[v64 + 4];
  }
  else
  {
    std::vector<char>::__append(v62, 4uLL);
    v63 = v62->__begin_;
  }
  *(_DWORD *)&v63[v64] = bswap32(v3);
}

void xgboost::UBJWriter::Visit(xgboost::UBJWriter *this, const xgboost::JsonNull *a2)
{
  unint64_t *v2;
  unint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  _BYTE *v13;
  char v14;

  v2 = (unint64_t *)*((_QWORD *)this + 1);
  v4 = (_BYTE *)v2[1];
  v3 = v2[2];
  if ((unint64_t)v4 >= v3)
  {
    v6 = *v2;
    v7 = &v4[-*v2];
    v8 = (unint64_t)(v7 + 1);
    if ((uint64_t)(v7 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v9 = v3 - v6;
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = (char *)(v11 + v10);
    v7[v11] = 90;
    v5 = (uint64_t)&v7[v11 + 1];
    if (v4 == (_BYTE *)v6)
    {
      v11 += (unint64_t)v7;
    }
    else
    {
      v13 = &v4[~v6];
      do
      {
        v14 = *--v4;
        (v13--)[v11] = v14;
      }
      while (v4 != (_BYTE *)v6);
      v4 = (_BYTE *)*v2;
    }
    *v2 = v11;
    v2[1] = v5;
    v2[2] = (unint64_t)v12;
    if (v4)
      operator delete(v4);
  }
  else
  {
    *v4 = 90;
    v5 = (uint64_t)(v4 + 1);
  }
  v2[1] = v5;
}

void *xgboost::UBJWriter::Visit(xgboost::UBJWriter *this, const void **a2)
{
  unint64_t *v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;

  v4 = (unint64_t *)*((_QWORD *)this + 1);
  v6 = (_BYTE *)v4[1];
  v5 = v4[2];
  if ((unint64_t)v6 >= v5)
  {
    v8 = *v4;
    v9 = &v6[-*v4];
    v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (unint64_t)operator new(v12);
    else
      v13 = 0;
    v14 = (char *)(v13 + v12);
    v9[v13] = 83;
    v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      v15 = &v6[~v8];
      do
      {
        v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (_BYTE *)v8);
      v6 = (_BYTE *)*v4;
    }
    *v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *v6 = 83;
    v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
}

void xgboost::UBJWriter::Visit(xgboost::UBJWriter *this, const xgboost::JsonBoolean *a2)
{
  _QWORD *v2;
  char v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v2 = (_QWORD *)*((_QWORD *)this + 1);
  if (*((_BYTE *)a2 + 16))
    v3 = 84;
  else
    v3 = 70;
  v5 = (char *)v2[1];
  v4 = v2[2];
  if ((unint64_t)v5 >= v4)
  {
    v7 = (char *)*v2;
    v8 = &v5[-*v2];
    v9 = (unint64_t)(v8 + 1);
    if ((uint64_t)(v8 + 1) < 0)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v10 = v4 - (_QWORD)v7;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)operator new(v11);
    else
      v12 = 0;
    v13 = &v12[v11];
    v8[(_QWORD)v12] = v3;
    v6 = (uint64_t)&v8[(_QWORD)v12 + 1];
    if (v5 == v7)
    {
      v12 = &v8[(_QWORD)v12];
    }
    else
    {
      v14 = &v5[~(unint64_t)v7];
      do
      {
        v15 = *--v5;
        (v14--)[(_QWORD)v12] = v15;
      }
      while (v5 != v7);
      v5 = (char *)*v2;
    }
    *v2 = v12;
    v2[1] = v6;
    v2[2] = v13;
    if (v5)
      operator delete(v5);
  }
  else
  {
    *v5 = v3;
    v6 = (uint64_t)(v5 + 1);
  }
  v2[1] = v6;
}

uint64_t *xgboost::JsonArray::operator[](xgboost::Value *a1)
{
  xgboost::Value::operator[](a1);
  return &_MergedGlobals_15;
}

uint64_t xgboost::JsonArray::operator[](uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (a2 >= (unint64_t)((*(_QWORD *)(a1 + 24) - v2) >> 3))
    std::vector<xgboost::Json>::__throw_out_of_range[abi:ne180100]();
  return v2 + 8 * a2;
}

uint64_t *xgboost::JsonObject::operator[](uint64_t a1, __int128 *a2)
{
  __int128 *v3;

  v3 = a2;
  return std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(a1 + 16), (const void **)a2, (uint64_t)&std::piecewise_construct, &v3)+ 7;
}

uint64_t *xgboost::JsonObject::operator[](xgboost::Value *a1)
{
  xgboost::Value::operator[](a1);
  return &_MergedGlobals_15;
}

void xgboost::JsonNumber::~JsonNumber(xgboost::JsonNumber *this)
{
  JUMPOUT(0x227667068);
}

void xgboost::JsonInteger::~JsonInteger(xgboost::JsonInteger *this)
{
  JUMPOUT(0x227667068);
}

void xgboost::JsonNull::~JsonNull(xgboost::JsonNull *this)
{
  JUMPOUT(0x227667068);
}

void xgboost::JsonBoolean::~JsonBoolean(xgboost::JsonBoolean *this)
{
  JUMPOUT(0x227667068);
}

void xgboost::JsonReader::~JsonReader(xgboost::JsonReader *this)
{
  JUMPOUT(0x227667068);
}

void xgboost::JsonWriter::~JsonWriter(xgboost::JsonWriter *this)
{
  JUMPOUT(0x227667068);
}

void xgboost::UBJReader::~UBJReader(xgboost::UBJReader *this)
{
  JUMPOUT(0x227667068);
}

void xgboost::UBJWriter::~UBJWriter(xgboost::UBJWriter *this)
{
  JUMPOUT(0x227667068);
}

_QWORD *xgboost::Json::Json(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  unsigned int *v5;
  unsigned int v6;

  v4 = (_QWORD *)operator new();
  v4[1] = 0x300000000;
  v5 = (unsigned int *)(v4 + 1);
  *v4 = &off_24E6BE1D0;
  v4[4] = 0;
  v4[3] = 0;
  v4[2] = v4 + 3;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::swap((uint64_t *)(a2 + 16), (uint64_t)(v4 + 2));
  *a1 = v4;
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 + 1, v5));
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::swap(uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *result;
  *result = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  v5 = result[1];
  v4 = result[2];
  v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v4;
  if (result[2])
    result = (uint64_t *)(*v3 + 16);
  *result = (uint64_t)v3;
  v6 = (_QWORD *)(*(_QWORD *)(a2 + 8) + 16);
  if (!v4)
    v6 = (_QWORD *)a2;
  *v6 = a2 + 8;
  return result;
}

uint64_t dmlc::io::FileSystem::ListDirectoryRecursive(uint64_t a1, __int128 *a2, uint64_t *a3)
{
  __int128 *v5;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  std::string v14;
  std::string v15;
  std::string __p;
  uint64_t v17;
  int v18;
  __int128 *v19;
  __int128 *v20;
  uint64_t v21;
  _OWORD v22[2];
  int64x2_t v23;

  v23 = 0u;
  memset(v22, 0, sizeof(v22));
  std::deque<dmlc::io::URI>::push_back(v22, a2);
  while (v23.i64[1])
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    (*(void (**)(uint64_t, unint64_t, __int128 **))(*(_QWORD *)a1 + 24))(a1, *(_QWORD *)(*((_QWORD *)&v22[0] + 1) + 8 * (v23.i64[0] / 0x38uLL)) + 72 * (v23.i64[0] % 0x38uLL), &v19);
    std::allocator<dmlc::io::FileInfo>::destroy[abi:ne180100]((uint64_t)&v23.i64[1], *(_QWORD *)(*((_QWORD *)&v22[0] + 1) + 8 * (v23.i64[0] / 0x38uLL)) + 72 * (v23.i64[0] % 0x38uLL));
    v23 = vaddq_s64(v23, (int64x2_t)xmmword_220F5EF90);
    if (v23.i64[0] >= 0x70uLL)
    {
      operator delete(**((void ***)&v22[0] + 1));
      *((_QWORD *)&v22[0] + 1) += 8;
      v23.i64[0] -= 56;
    }
    v5 = v19;
    v6 = v20;
    while (v5 != v6)
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v14, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
      }
      else
      {
        v7 = *v5;
        v14.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
        *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v7;
      }
      if (*((char *)v5 + 47) < 0)
      {
        std::string::__init_copy_ctor_external(&v15, *((const std::string::value_type **)v5 + 3), *((_QWORD *)v5 + 4));
      }
      else
      {
        v8 = *(__int128 *)((char *)v5 + 24);
        v15.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 5);
        *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v8;
      }
      if (*((char *)v5 + 71) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v5 + 6), *((_QWORD *)v5 + 7));
      }
      else
      {
        v9 = v5[3];
        __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 8);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
      }
      v10 = *((_QWORD *)v5 + 9);
      v18 = *((_DWORD *)v5 + 20);
      v17 = v10;
      if (v18 == 1)
      {
        std::deque<dmlc::io::URI>::push_back(v22, (__int128 *)&v14);
      }
      else
      {
        v11 = a3[1];
        if (v11 >= a3[2])
        {
          v12 = std::vector<dmlc::io::FileInfo>::__push_back_slow_path<dmlc::io::FileInfo const&>(a3, (__int128 *)&v14);
        }
        else
        {
          std::allocator<dmlc::io::FileInfo>::construct[abi:ne180100]<dmlc::io::FileInfo,dmlc::io::FileInfo const&>((_DWORD)a3 + 16, (std::string *)a3[1], (__int128 *)&v14);
          v12 = v11 + 88;
          a3[1] = v11 + 88;
        }
        a3[1] = v12;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v15.__r_.__value_.__l.__data_);
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      v5 = (__int128 *)((char *)v5 + 88);
    }
    v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v19;
    std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  }
  return std::deque<dmlc::io::URI>::~deque[abi:ne180100]((uint64_t)v22);
}

void sub_220F4A3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,char a33)
{
  std::deque<dmlc::io::URI>::~deque[abi:ne180100]((uint64_t)&a33);
  _Unwind_Resume(a1);
}

void dmlc::TemporaryDirectory::RecursiveDelete(uint64_t a1, char *a2)
{
  char *v2;
  const dmlc::io::URI *v4;
  uint64_t *Instance;
  __int128 *v6;
  __int128 *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  std::string *p_p;
  int v13;
  std::error_code *v14;
  std::string *Entry;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  std::string *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  const std::__fs::filesystem::path *v28;
  _QWORD *v29;
  std::string *v30;
  std::string::size_type size;
  _QWORD *v32;
  const char *v33;
  _QWORD *v34;
  _QWORD *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  std::string v44;
  std::string v45;
  std::string __p;
  uint64_t v47;
  int v48;
  __int128 *v49;
  __int128 *v50;
  uint64_t v51;
  void *v52[2];
  char v53;
  void *v54;
  char v55;
  void *v56;
  char v57;
  uint64_t v58;
  int v59;
  int v60;
  stat v61;
  uint64_t v62;

  v2 = a2;
  v62 = *MEMORY[0x24BDAC8D0];
  if (a2[23] < 0)
    a2 = *(char **)a2;
  dmlc::io::URI::URI((dmlc::io::URI *)v52, a2);
  Instance = dmlc::io::FileSystem::GetInstance((dmlc::io::FileSystem *)v52, v4);
  v49 = 0;
  v50 = 0;
  v51 = 0;
  (*(void (**)(uint64_t *, void **, __int128 **))(*Instance + 24))(Instance, v52, &v49);
  v6 = v49;
  for (i = v50; v6 != i; v6 = (__int128 *)((char *)v6 + 88))
  {
    if (*((char *)v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v44, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
    }
    else
    {
      v8 = *v6;
      v44.__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
      *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v8;
    }
    if (*((char *)v6 + 47) < 0)
    {
      std::string::__init_copy_ctor_external(&v45, *((const std::string::value_type **)v6 + 3), *((_QWORD *)v6 + 4));
    }
    else
    {
      v9 = *(__int128 *)((char *)v6 + 24);
      v45.__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 5);
      *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v9;
    }
    if (*((char *)v6 + 71) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v6 + 6), *((_QWORD *)v6 + 7));
    }
    else
    {
      v10 = v6[3];
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 8);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v10;
    }
    v11 = *((_QWORD *)v6 + 9);
    v48 = *((_DWORD *)v6 + 20);
    v47 = v11;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v13 = lstat((const char *)p_p, &v61);
    v59 = 0;
    v60 = v13;
    if (v13)
    {
      dmlc::LogCheckFormat<int,int>(&v58);
      if (v58)
      {
        Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v60);
        dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/filesystem.h");
        v16 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v60);
        v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"Check failed: ", 14);
        v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"lstat(path.c_str(), &sb) == 0", 29);
        v19 = *(char *)(v58 + 23);
        v20 = v19 >= 0 ? v58 : *(_QWORD *)v58;
        v21 = v19 >= 0 ? *(unsigned __int8 *)(v58 + 23) : *(_QWORD *)(v58 + 8);
        v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, v20, v21);
        v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"dmlc::TemporaryDirectory::IsSymlink(): Unable to read file attributes", 69);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v60);
        v14 = (std::error_code *)v58;
        v58 = 0;
        if (v14)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v58, (uint64_t)v14);
      }
    }
    if ((v61.st_mode & 0xF000) == 0xA000)
    {
      v24 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v61);
      dmlc::LogMessageFatal::Entry::Init(v24, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/filesys.cc");
      v25 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v61);
      v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"Check failed: !IsSymlink(info.path.name)", 40);
      v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"Symlink not supported in TemporaryDirectory", 43);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v61);
    }
    if (v48 == 1)
    {
      dmlc::TemporaryDirectory::RecursiveDelete(a1, &__p);
    }
    else
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = (const std::__fs::filesystem::path *)&__p;
      else
        v28 = (const std::__fs::filesystem::path *)__p.__r_.__value_.__r.__words[0];
      if (remove(v28, v14))
      {
        dmlc::LogMessage::LogMessage((dmlc::LogMessage *)&v61, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/filesys.cc");
        v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)&v61.st_dev, (uint64_t)"Couldn't remove file ", 21);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v30 = &__p;
        else
          v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          size = __p.__r_.__value_.__l.__size_;
        v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)v30, size);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"; you may want to remove it manually",
          36);
        dmlc::LogMessage::~LogMessage((dmlc::LogMessage *)&v61);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v45.__r_.__value_.__l.__data_);
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (v2[23] >= 0)
    v33 = v2;
  else
    v33 = *(const char **)v2;
  if (rmdir(v33))
  {
    dmlc::LogMessage::LogMessage((dmlc::LogMessage *)&v61, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/filesys.cc");
    v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)&v61.st_dev, (uint64_t)"~TemporaryDirectory(): ", 23);
    v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)"Could not remove temporary directory ", 37);
    v36 = v2[23];
    if (v36 >= 0)
      v37 = (uint64_t)v2;
    else
      v37 = *(_QWORD *)v2;
    if (v36 >= 0)
      v38 = v2[23];
    else
      v38 = *((_QWORD *)v2 + 1);
    v39 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, v37, v38);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)"; you may want to remove it manually",
      36);
  }
  else
  {
    if (!*(_BYTE *)(a1 + 24))
      goto LABEL_68;
    dmlc::LogMessage::LogMessage((dmlc::LogMessage *)&v61, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/filesys.cc");
    v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)&v61.st_dev, (uint64_t)"Successfully deleted temporary directory ", 41);
    v41 = v2[23];
    if (v41 >= 0)
      v42 = (uint64_t)v2;
    else
      v42 = *(_QWORD *)v2;
    if (v41 >= 0)
      v43 = v2[23];
    else
      v43 = *((_QWORD *)v2 + 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, v42, v43);
  }
  dmlc::LogMessage::~LogMessage((dmlc::LogMessage *)&v61);
LABEL_68:
  *(_QWORD *)&v61.st_dev = &v49;
  std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
  if (v57 < 0)
    operator delete(v56);
  if (v55 < 0)
    operator delete(v54);
  if (v53 < 0)
    operator delete(v52[0]);
}

void sub_220F4A8D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,char a41,__int16 a42,char a43,char a44)
{
  a9 = &a27;
  std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  dmlc::io::FileInfo::~FileInfo(&a30);
  _Unwind_Resume(a1);
}

uint64_t std::deque<dmlc::io::URI>::~deque[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  void **v3;
  void **v4;
  unint64_t v5;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (_QWORD *)(a1 + 40);
  v3 = *(void ***)(a1 + 8);
  v4 = *(void ***)(a1 + 16);
  if (v4 == v3)
  {
    v4 = *(void ***)(a1 + 8);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = &v3[v5 / 0x38];
    v7 = (uint64_t)*v6 + 72 * (v5 % 0x38);
    v8 = (unint64_t)v3[(*(_QWORD *)(a1 + 40) + v5) / 0x38] + 72 * ((*(_QWORD *)(a1 + 40) + v5) % 0x38);
    if (v7 != v8)
    {
      do
      {
        std::allocator<dmlc::io::FileInfo>::destroy[abi:ne180100]((uint64_t)v2, v7);
        v7 += 72;
        if (v7 - (_QWORD)*v6 == 4032)
        {
          v9 = (uint64_t)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != v8);
      v3 = *(void ***)(a1 + 8);
      v4 = *(void ***)(a1 + 16);
    }
  }
  *v2 = 0;
  v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      v4 = *(void ***)(a1 + 16);
      v3 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v3;
      v10 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 28;
    goto LABEL_14;
  }
  if (v11 == 2)
  {
    v12 = 56;
LABEL_14:
    *(_QWORD *)(a1 + 32) = v12;
  }
  if (v3 != v4)
  {
    do
    {
      v13 = *v3++;
      operator delete(v13);
    }
    while (v3 != v4);
    v15 = *(_QWORD *)(a1 + 8);
    v14 = *(_QWORD *)(a1 + 16);
    if (v14 != v15)
      *(_QWORD *)(a1 + 16) = v14 + ((v15 - v14 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::deque<dmlc::io::URI>::push_back(_QWORD *a1, __int128 *a2)
{
  __int128 *v2;
  _QWORD *v4;
  char *v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  std::string *v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  int64_t v74;
  void *v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  BOOL v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;

  v2 = a2;
  v4 = a1 + 5;
  v5 = (char *)a1[1];
  v6 = (char *)a1[2];
  v7 = (v6 - v5) >> 3;
  if (v6 == v5)
    v8 = 0;
  else
    v8 = 56 * v7 - 1;
  v9 = a1[4];
  if (v8 != a1[5] + v9)
    goto LABEL_38;
  v10 = v9 >= 0x38;
  v11 = v9 - 56;
  if (v10)
  {
    a1[4] = v11;
    v14 = *(_QWORD *)v5;
    v12 = v5 + 8;
    v13 = v14;
    a1[1] = v12;
    if (v6 == (char *)a1[3])
    {
      v15 = (uint64_t)&v12[-*a1];
      if ((unint64_t)v12 <= *a1)
      {
        if (v6 == (char *)*a1)
          v41 = 1;
        else
          v41 = (uint64_t)&v6[-*a1] >> 2;
        v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v41);
        v44 = &v42[8 * (v41 >> 2)];
        v45 = (uint64_t *)a1[1];
        v6 = v44;
        v46 = a1[2] - (_QWORD)v45;
        if (v46)
        {
          v6 = &v44[v46 & 0xFFFFFFFFFFFFFFF8];
          v47 = 8 * (v46 >> 3);
          v48 = &v42[8 * (v41 >> 2)];
          do
          {
            v49 = *v45++;
            *(_QWORD *)v48 = v49;
            v48 += 8;
            v47 -= 8;
          }
          while (v47);
        }
        v50 = (char *)*a1;
        *a1 = v42;
        a1[1] = v44;
        a1[2] = v6;
        a1[3] = &v42[8 * v43];
        if (v50)
        {
          operator delete(v50);
          v6 = (char *)a1[2];
        }
      }
      else
      {
        v16 = v15 >> 3;
        v17 = v15 >> 3 < -1;
        v18 = (v15 >> 3) + 2;
        if (v17)
          v19 = v18;
        else
          v19 = v16 + 1;
        v20 = -(v19 >> 1);
        v21 = v19 >> 1;
        v22 = &v12[-8 * v21];
        v23 = v6 - v12;
        if (v6 != v12)
        {
          memmove(&v12[-8 * v21], v12, v6 - v12);
          v6 = (char *)a1[1];
        }
        v24 = &v6[8 * v20];
        v6 = &v22[v23];
        a1[1] = v24;
        a1[2] = &v22[v23];
      }
    }
    *(_QWORD *)v6 = v13;
  }
  else
  {
    v25 = (char *)a1[3];
    v26 = (char *)*a1;
    v27 = (uint64_t)&v25[-*a1];
    if (v7 >= v27 >> 3)
    {
      v30 = v27 >> 2;
      if (v25 == v26)
        v31 = 1;
      else
        v31 = v30;
      v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v31);
      v34 = v33;
      v35 = operator new(0xFC0uLL);
      v36 = &v32[8 * v7];
      v37 = &v32[8 * v34];
      if (v7 == v34)
      {
        v38 = 8 * v7;
        if (v6 - v5 < 1)
        {
          v75 = v35;
          v76 = v38 >> 2;
          if (v6 == v5)
            v77 = 1;
          else
            v77 = v76;
          v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v77);
          v36 = &v78[8 * (v77 >> 2)];
          v37 = &v78[8 * v79];
          if (v32)
            operator delete(v32);
          v32 = v78;
          v35 = v75;
        }
        else
        {
          v39 = v38 >> 3;
          if (v39 >= -1)
            v40 = v39 + 1;
          else
            v40 = v39 + 2;
          v36 -= 8 * (v40 >> 1);
        }
      }
      *(_QWORD *)v36 = v35;
      v6 = v36 + 8;
      for (i = a1[2]; i != a1[1]; i -= 8)
      {
        if (v36 == v32)
        {
          if (v6 >= v37)
          {
            if (v37 == v32)
              v85 = 1;
            else
              v85 = (v37 - v32) >> 2;
            v86 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v85);
            v88 = v86;
            v36 = &v86[(2 * v85 + 6) & 0xFFFFFFFFFFFFFFF8];
            v90 = v6 - v32;
            v89 = v6 == v32;
            v6 = v36;
            if (!v89)
            {
              v6 = &v36[v90 & 0xFFFFFFFFFFFFFFF8];
              v91 = 8 * (v90 >> 3);
              v92 = v36;
              v93 = v32;
              do
              {
                v94 = *(_QWORD *)v93;
                v93 += 8;
                *(_QWORD *)v92 = v94;
                v92 += 8;
                v91 -= 8;
              }
              while (v91);
            }
            v37 = &v86[8 * v87];
            if (v32)
              operator delete(v32);
            v32 = v88;
          }
          else
          {
            v81 = (v37 - v6) >> 3;
            if (v81 >= -1)
              v82 = v81 + 1;
            else
              v82 = v81 + 2;
            v83 = v82 >> 1;
            v36 = &v32[8 * (v82 >> 1)];
            v84 = v32;
            if (v6 != v32)
            {
              memmove(v36, v32, v6 - v32);
              v84 = v6;
            }
            v6 = &v84[8 * v83];
          }
        }
        v95 = *(_QWORD *)(i - 8);
        *((_QWORD *)v36 - 1) = v95;
        v36 -= 8;
      }
      v96 = (char *)*a1;
      *a1 = v32;
      a1[1] = v36;
      a1[2] = v6;
      a1[3] = v37;
      v2 = a2;
      if (v96)
      {
        operator delete(v96);
        v6 = (char *)a1[2];
      }
      goto LABEL_37;
    }
    v28 = operator new(0xFC0uLL);
    v29 = v28;
    if (v25 == v6)
    {
      if (v5 == v26)
      {
        if (v6 == v5)
          v53 = 1;
        else
          v53 = (v25 - v5) >> 2;
        v54 = 2 * v53;
        v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v53);
        v5 = &v55[(v54 + 6) & 0xFFFFFFFFFFFFFFF8];
        v57 = (uint64_t *)a1[1];
        v58 = v5;
        v59 = a1[2] - (_QWORD)v57;
        if (v59)
        {
          v58 = &v5[v59 & 0xFFFFFFFFFFFFFFF8];
          v60 = 8 * (v59 >> 3);
          v61 = &v55[(v54 + 6) & 0xFFFFFFFFFFFFFFF8];
          do
          {
            v62 = *v57++;
            *(_QWORD *)v61 = v62;
            v61 += 8;
            v60 -= 8;
          }
          while (v60);
        }
        v63 = (char *)*a1;
        *a1 = v55;
        a1[1] = v5;
        a1[2] = v58;
        a1[3] = &v55[8 * v56];
        if (v63)
        {
          operator delete(v63);
          v5 = (char *)a1[1];
        }
      }
      *((_QWORD *)v5 - 1) = v29;
      v64 = (char *)a1[1];
      v65 = (char *)a1[2];
      a1[1] = v64 - 8;
      v66 = *((_QWORD *)v64 - 1);
      a1[1] = v64;
      if (v65 == (char *)a1[3])
      {
        v67 = (uint64_t)&v64[-*a1];
        if ((unint64_t)v64 <= *a1)
        {
          if (v65 == (char *)*a1)
            v97 = 1;
          else
            v97 = (uint64_t)&v65[-*a1] >> 2;
          v98 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v97);
          v100 = &v98[8 * (v97 >> 2)];
          v101 = (uint64_t *)a1[1];
          v65 = v100;
          v102 = a1[2] - (_QWORD)v101;
          if (v102)
          {
            v65 = &v100[v102 & 0xFFFFFFFFFFFFFFF8];
            v103 = 8 * (v102 >> 3);
            v104 = &v98[8 * (v97 >> 2)];
            do
            {
              v105 = *v101++;
              *(_QWORD *)v104 = v105;
              v104 += 8;
              v103 -= 8;
            }
            while (v103);
          }
          v106 = (char *)*a1;
          *a1 = v98;
          a1[1] = v100;
          a1[2] = v65;
          a1[3] = &v98[8 * v99];
          if (v106)
          {
            operator delete(v106);
            v65 = (char *)a1[2];
          }
        }
        else
        {
          v68 = v67 >> 3;
          v17 = v67 >> 3 < -1;
          v69 = (v67 >> 3) + 2;
          if (v17)
            v70 = v69;
          else
            v70 = v68 + 1;
          v71 = -(v70 >> 1);
          v72 = v70 >> 1;
          v73 = &v64[-8 * v72];
          v74 = v65 - v64;
          if (v65 != v64)
          {
            memmove(&v64[-8 * v72], v64, v65 - v64);
            v64 = (char *)a1[1];
          }
          v65 = &v73[v74];
          a1[1] = &v64[8 * v71];
          a1[2] = &v73[v74];
        }
      }
      *(_QWORD *)v65 = v66;
    }
    else
    {
      *(_QWORD *)v6 = v28;
    }
  }
  v6 = (char *)(a1[2] + 8);
  a1[2] = v6;
LABEL_37:
  v5 = (char *)a1[1];
LABEL_38:
  if (v6 == v5)
  {
    v52 = 0;
  }
  else
  {
    v51 = a1[5] + a1[4];
    v52 = (std::string *)(*(_QWORD *)&v5[8 * (v51 / 0x38)] + 72 * (v51 % 0x38));
  }
  std::allocator<dmlc::io::URI>::construct[abi:ne180100]<dmlc::io::URI,dmlc::io::URI const&>((int)v4, v52, v2);
  ++*v4;
}

void sub_220F4B054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v1);
  if (v2)
    operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t xgboost::gbm::GBTreeModel::Save(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  std::string *Entry;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;

  v5 = a1 + 16;
  v4 = *(_DWORD *)(a1 + 16);
  v20 = (*(_QWORD *)(a1 + 184) - *(_QWORD *)(a1 + 176)) >> 3;
  v21 = v4;
  if (v4 != v20)
  {
    dmlc::LogCheckFormat<int,int>(&v19);
    if (v19)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v21);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/gbm/gbtree_model.cc");
      v7 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v21);
      v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"Check failed: ", 14);
      v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"param.num_trees == static_cast<int32_t>(trees.size())", 53);
      v10 = *(char *)(v19 + 23);
      if (v10 >= 0)
        v11 = v19;
      else
        v11 = *(_QWORD *)v19;
      if (v10 >= 0)
        v12 = *(unsigned __int8 *)(v19 + 23);
      else
        v12 = *(_QWORD *)(v19 + 8);
      v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v21);
      v14 = v19;
      v19 = 0;
      if (v14)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v19, v14);
    }
  }
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a2 + 8))(a2, v5, 160);
  v16 = *(uint64_t **)(a1 + 176);
  v17 = *(uint64_t **)(a1 + 184);
  while (v16 != v17)
  {
    v18 = *v16++;
    result = xgboost::RegTree::Save(v18, a2);
  }
  if (*(_QWORD *)(a1 + 232) != *(_QWORD *)(a1 + 224))
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 8))(a2);
  return result;
}

void sub_220F4B1C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
  uint64_t v12;

  v12 = a9;
  a9 = 0;
  if (v12)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a9, v12);
  _Unwind_Resume(exception_object);
}

void xgboost::gbm::GBTreeModel::Load(uint64_t a1, uint64_t (***a2)(_QWORD, uint64_t, uint64_t))
{
  std::string *Entry;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  int64x2_t *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int i;
  xgboost::RegTree *v25;
  unint64_t v26;
  xgboost::RegTree **v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  xgboost::RegTree **v34;
  char *v35;
  _QWORD *v36;
  _QWORD *v37;
  xgboost::RegTree *v38;
  int64x2_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  std::string *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64x2_t v56;
  char *v57;
  uint64_t v58;

  v54 = (**a2)(a2, a1 + 16, 160);
  if (v54 != 160)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned long>(&v55);
    if (v55)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/gbm/gbtree_model.cc");
      v5 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
      v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"Check failed: ", 14);
      v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"fi->Read(&param, sizeof(param)) == sizeof(param)", 48);
      v8 = *(char *)(v55 + 23);
      v9 = v8 >= 0 ? v55 : *(_QWORD *)v55;
      v10 = v8 >= 0 ? *(unsigned __int8 *)(v55 + 23) : *(_QWORD *)(v55 + 8);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, v9, v10);
      v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"GBTree: invalid model file", 26);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v54);
      v13 = v55;
      v55 = 0;
      if (v13)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v55, v13);
    }
  }
  v15 = *(_QWORD **)(a1 + 176);
  v16 = *(_QWORD **)(a1 + 184);
  v14 = (int64x2_t *)(a1 + 176);
  while (v16 != v15)
  {
    v18 = *--v16;
    v17 = v18;
    *v16 = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  }
  *(_QWORD *)(a1 + 184) = v15;
  v19 = *(_QWORD **)(a1 + 200);
  v20 = *(_QWORD **)(a1 + 208);
  while (v20 != v19)
  {
    v22 = *--v20;
    v21 = v22;
    *v20 = 0;
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  }
  *(_QWORD *)(a1 + 208) = v19;
  v23 = *(_DWORD *)(a1 + 16);
  if (v23 >= 1)
  {
    for (i = 0; i < v23; ++i)
    {
      v25 = (xgboost::RegTree *)operator new();
      xgboost::RegTree::RegTree(v25);
      xgboost::RegTree::Load((uint64_t)v25, a2);
      v27 = *(xgboost::RegTree ***)(a1 + 184);
      v26 = *(_QWORD *)(a1 + 192);
      if ((unint64_t)v27 >= v26)
      {
        v29 = ((uint64_t)v27 - v14->i64[0]) >> 3;
        if ((unint64_t)(v29 + 1) >> 61)
          std::vector<void *>::__throw_length_error[abi:ne180100]();
        v30 = v26 - v14->i64[0];
        v31 = v30 >> 2;
        if (v30 >> 2 <= (unint64_t)(v29 + 1))
          v31 = v29 + 1;
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
          v32 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v32 = v31;
        v58 = a1 + 192;
        if (v32)
          v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>(a1 + 192, v32);
        else
          v33 = 0;
        v34 = (xgboost::RegTree **)&v33[8 * v29];
        v35 = &v33[8 * v32];
        v57 = v35;
        *v34 = v25;
        v28 = v34 + 1;
        v56.i64[1] = (uint64_t)(v34 + 1);
        v37 = *(_QWORD **)(a1 + 176);
        v36 = *(_QWORD **)(a1 + 184);
        if (v36 == v37)
        {
          v39 = vdupq_n_s64((unint64_t)v36);
        }
        else
        {
          do
          {
            v38 = (xgboost::RegTree *)*--v36;
            *v36 = 0;
            *--v34 = v38;
          }
          while (v36 != v37);
          v39 = *v14;
          v28 = (_QWORD *)v56.i64[1];
          v35 = v57;
        }
        *(_QWORD *)(a1 + 176) = v34;
        *(_QWORD *)(a1 + 184) = v28;
        v56 = v39;
        v40 = *(char **)(a1 + 192);
        *(_QWORD *)(a1 + 192) = v35;
        v57 = v40;
        v55 = v39.i64[0];
        std::__split_buffer<std::unique_ptr<xgboost::RegTree>>::~__split_buffer((uint64_t)&v55);
      }
      else
      {
        *v27 = v25;
        v28 = v27 + 1;
      }
      *(_QWORD *)(a1 + 184) = v28;
      v23 = *(_DWORD *)(a1 + 16);
    }
  }
  std::vector<int>::resize((std::vector<int> *)(a1 + 224), v23);
  v41 = *(int *)(a1 + 16);
  if ((_DWORD)v41)
  {
    v42 = *(_QWORD *)(a1 + 232) == *(_QWORD *)(a1 + 224) ? 0 : *(_QWORD *)(a1 + 224);
    v43 = (**a2)(a2, v42, 4 * v41);
    v53 = 4 * *(int *)(a1 + 16);
    v54 = v43;
    if (v43 != v53)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>(&v55);
      if (v55)
      {
        v44 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
        dmlc::LogMessageFatal::Entry::Init(v44, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/gbm/gbtree_model.cc");
        v45 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
        v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"Check failed: ", 14);
        v47 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v46, (uint64_t)"fi->Read(dmlc::BeginPtr(tree_info), sizeof(int32_t) * param.num_trees) == sizeof(int32_t) * param.num_trees", 107);
        v48 = *(char *)(v55 + 23);
        v49 = v48 >= 0 ? v55 : *(_QWORD *)v55;
        v50 = v48 >= 0 ? *(unsigned __int8 *)(v55 + 23) : *(_QWORD *)(v55 + 8);
        v51 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v47, v49, v50);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v54);
        v52 = v55;
        v55 = 0;
        if (v52)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v55, v52);
      }
    }
  }
}

void sub_220F4B590(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  uint64_t v13;

  v13 = a12;
  a12 = 0;
  if (v13)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a12, v13);
  _Unwind_Resume(exception_object);
}

void xgboost::gbm::GBTreeModel::SaveModel(xgboost::gbm::GBTreeModel *this, xgboost::Json *a2)
{
  xgboost::gbm::GBTreeModelParam *v4;
  uint64_t v5;
  std::string *Entry;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *ptr;
  unsigned int **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unsigned int *v23;
  _QWORD *v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int **v27;
  unsigned int *v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  std::string *v38;
  _QWORD *v39;
  _QWORD *v40;
  xgboost::Json *v41;
  void *v42[2];
  char v43;
  _QWORD v44[3];
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];
  void *__p[2];
  _QWORD **v49;
  _QWORD *v50;
  uint64_t v51;
  std::exception_ptr v52;
  std::mutex v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = (xgboost::gbm::GBTreeModel *)((char *)this + 16);
  v5 = (*((_QWORD *)this + 23) - *((_QWORD *)this + 22)) >> 3;
  LODWORD(__p[0]) = *((_DWORD *)this + 4);
  LODWORD(v47[0]) = v5;
  if (LODWORD(__p[0]) != (_DWORD)v5)
  {
    dmlc::LogCheckFormat<int,int>((uint64_t *)&v52);
    if (v52.__ptr_)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/gbm/gbtree_model.cc");
      v7 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
      v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"Check failed: ", 14);
      v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"param.num_trees == static_cast<int>(trees.size())", 49);
      v10 = *((char *)v52.__ptr_ + 23);
      v11 = v10 >= 0 ? v52.__ptr_ : *(void **)v52.__ptr_;
      v12 = v10 >= 0 ? *((unsigned __int8 *)v52.__ptr_ + 23) : *((_QWORD *)v52.__ptr_ + 1);
      v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)v11, v12);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)__p);
      ptr = v52.__ptr_;
      v52.__ptr_ = 0;
      if (ptr)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v52, (uint64_t)ptr);
    }
  }
  xgboost::ToJson<xgboost::gbm::GBTreeModelParam>(v4, (uint64_t)&v52);
  std::string::basic_string[abi:ne180100]<0>(__p, "gbtree_model_param");
  v15 = (unsigned int **)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)a2 + 24))(*(_QWORD *)a2, __p);
  xgboost::Json::operator=(v15, (uint64_t)&v52);
  if (SHIBYTE(v49) < 0)
    operator delete(__p[0]);
  v52.__ptr_ = &off_24E6BE1D0;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)v53.__m_.__opaque, *(_QWORD **)&v53.__m_.__opaque[8]);
  std::vector<xgboost::Json>::vector(&v45, (uint64_t)(*((_QWORD *)this + 23) - *((_QWORD *)this + 22)) >> 3);
  if (!*((_QWORD *)this + 31))
  {
    v38 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v52);
    dmlc::LogMessageFatal::Entry::Init(v38, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/gbm/gbtree_model.cc");
    v39 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v52);
    v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)"Check failed: ctx_", 18);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v52);
  }
  v17 = *((_QWORD *)this + 22);
  v16 = *((_QWORD *)this + 23);
  v41 = a2;
  v52.__ptr_ = 0;
  v53.__m_.__sig = 850045863;
  memset(v53.__m_.__opaque, 0, sizeof(v53.__m_.__opaque));
  v18 = v16 - v17;
  if (v18)
  {
    v19 = 0;
    v20 = v18 >> 3;
    do
    {
      v21 = *((_QWORD *)this + 22);
      __p[1] = (void *)0x300000000;
      __p[0] = &off_24E6BE1D0;
      v50 = 0;
      v51 = 0;
      v49 = &v50;
      v22 = (_QWORD *)operator new();
      v22[1] = 0x300000000;
      v23 = (unsigned int *)(v22 + 1);
      *v22 = &off_24E6BE1D0;
      v24 = v50;
      v22[2] = v49;
      v22[3] = v24;
      v25 = v51;
      v50 = 0;
      v51 = 0;
      v22[4] = v25;
      v49 = &v50;
      if (!v25)
        v24 = v22;
      v24[2] = v22 + 3;
      v42[0] = v22;
      do
        v26 = __ldxr(v23);
      while (__stxr(v26 + 1, v23));
      __p[0] = &off_24E6BE1D0;
      std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&v49, v50);
      (*(void (**)(_QWORD, void **))(**(_QWORD **)(v21 + 8 * v19) + 24))(*(_QWORD *)(v21 + 8 * v19), v42);
      v47[1] = 0x200000000;
      v47[0] = &off_24E6BE3A8;
      v47[2] = v19;
      std::string::basic_string[abi:ne180100]<0>(__p, "id");
      v27 = (unsigned int **)(*(uint64_t (**)(void *, void **))(*(_QWORD *)v42[0] + 24))(v42[0], __p);
      xgboost::Json::operator=(v27, (uint64_t)v47);
      if (SHIBYTE(v49) < 0)
        operator delete(__p[0]);
      v28 = *(unsigned int **)(v45 + 8 * v19);
      *(void **)(v45 + 8 * v19) = v42[0];
      v42[0] = v28;
      if (v28)
      {
        v29 = v28 + 2;
        do
        {
          v30 = __ldxr(v29);
          v31 = v30 - 1;
        }
        while (__stlxr(v31, v29));
        if (!v31)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v28 + 8))(v28);
        }
      }
      ++v19;
    }
    while (v19 != v20);
  }
  dmlc::OMPException::Rethrow(&v52);
  std::mutex::~mutex(&v53);
  std::exception_ptr::~exception_ptr(&v52);
  std::vector<xgboost::Json>::vector(__p, (uint64_t)(*((_QWORD *)this + 29) - *((_QWORD *)this + 28)) >> 2);
  v32 = *((_QWORD *)this + 28);
  if (*((_QWORD *)this + 29) != v32)
  {
    v33 = 0;
    v34 = 0;
    do
    {
      v35 = *(int *)(v32 + 4 * v34);
      v44[1] = 0x200000000;
      v44[0] = &off_24E6BE3A8;
      v44[2] = v35;
      xgboost::Json::operator=((unsigned int **)((char *)__p[0] + v33), (uint64_t)v44);
      ++v34;
      v32 = *((_QWORD *)this + 28);
      v33 += 8;
    }
    while (v34 < (*((_QWORD *)this + 29) - v32) >> 2);
  }
  v53.__m_.__sig = 0x400000000;
  v52.__ptr_ = off_24E6BE218;
  *(_OWORD *)v53.__m_.__opaque = v45;
  *(_QWORD *)&v53.__m_.__opaque[16] = v46;
  v45 = 0uLL;
  v46 = 0;
  std::string::basic_string[abi:ne180100]<0>(v42, "trees");
  v36 = (uint64_t *)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)v41 + 24))(*(_QWORD *)v41, v42);
  xgboost::Json::operator=(v36, (uint64_t)&v52);
  if (v43 < 0)
    operator delete(v42[0]);
  v52.__ptr_ = off_24E6BE218;
  v42[0] = v53.__m_.__opaque;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
  v53.__m_.__sig = 0x400000000;
  v52.__ptr_ = off_24E6BE218;
  *(_OWORD *)v53.__m_.__opaque = *(_OWORD *)__p;
  *(_QWORD *)&v53.__m_.__opaque[16] = v49;
  __p[0] = 0;
  __p[1] = 0;
  v49 = 0;
  std::string::basic_string[abi:ne180100]<0>(v42, "tree_info");
  v37 = (uint64_t *)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)v41 + 24))(*(_QWORD *)v41, v42);
  xgboost::Json::operator=(v37, (uint64_t)&v52);
  if (v43 < 0)
    operator delete(v42[0]);
  v52.__ptr_ = off_24E6BE218;
  v42[0] = v53.__m_.__opaque;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
  v52.__ptr_ = __p;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
  v52.__ptr_ = &v45;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
}

void sub_220F4BC6C(_Unwind_Exception *a1)
{
  std::mutex *v2;
  uint64_t v3;
  std::exception_ptr v4[25];

  std::mutex::~mutex(v2);
  std::exception_ptr::~exception_ptr(v4);
  v4[0].__ptr_ = &v3;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)v4);
  _Unwind_Resume(a1);
}

void sub_220F4BCD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,_QWORD *a33)
{
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&a32, a33);
  JUMPOUT(0x220F4BDA4);
}

void sub_220F4BCDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)va);
  JUMPOUT(0x220F4BCE8);
}

void sub_220F4BD10(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  uint64_t v33;

  if (a18 < 0)
    operator delete(__p);
  a33 = v33 + 16;
  std::vector<xgboost::Json>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  JUMPOUT(0x220F4BD84);
}

void sub_220F4BD40(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,_QWORD *a36)
{
  if (a30 < 0)
    operator delete(__p);
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&a35, a36);
  JUMPOUT(0x220F4BDA4);
}

void sub_220F4BD78()
{
  JUMPOUT(0x220F4BDA4);
}

void xgboost::gbm::GBTreeModel::LoadModel(xgboost::gbm::GBTreeModel *this, const xgboost::Json *a2)
{
  _DWORD **v4;
  xgboost::gbm::GBTreeModelParam *v5;
  const void **v6;
  const void ***v7;
  char *v8;
  uint64_t *v9;
  const void **v10;
  const void ***v11;
  BOOL v12;
  void *v13;
  int *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD **v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD **v31;
  unint64_t v32;
  uint64_t v33;
  xgboost::RegTree *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _DWORD **v38;
  _QWORD *v39;
  uint64_t v40;
  std::string *Entry;
  _QWORD *v42;
  _QWORD *v43;
  const xgboost::Json *v44;
  std::vector<std::pair<std::string, std::string>> v45;
  void *__p[2];
  char v47;
  std::exception_ptr v48;
  std::exception_ptr v49;
  std::mutex v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(__p, "gbtree_model_param");
  v4 = (_DWORD **)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)a2 + 24))(*(_QWORD *)a2, __p);
  v5 = (xgboost::gbm::GBTreeModelParam *)xgboost::Cast<xgboost::JsonObject const,xgboost::Value const>(*v4);
  v50.__m_.__sig = 0;
  *(_QWORD *)v50.__m_.__opaque = 0;
  v49.__ptr_ = &v50;
  v6 = (const void **)*((_QWORD *)v5 + 2);
  v7 = (const void ***)((char *)v5 + 24);
  if (v6 != (const void **)((char *)v5 + 24))
  {
    do
    {
      v8 = (char *)xgboost::Cast<xgboost::JsonString const,xgboost::Value const>(v6[7]);
      v48.__ptr_ = v6 + 4;
      v9 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v49, v6 + 4, (uint64_t)&std::piecewise_construct, (__int128 **)&v48);
      v5 = (xgboost::gbm::GBTreeModelParam *)std::string::operator=((std::string *)(v9 + 7), (const std::string *)(v8 + 16));
      v10 = (const void **)v6[1];
      if (v10)
      {
        do
        {
          v11 = (const void ***)v10;
          v10 = (const void **)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (const void ***)v6[2];
          v12 = *v11 == v6;
          v6 = (const void **)v11;
        }
        while (!v12);
      }
      v6 = (const void **)v11;
    }
    while (v11 != v7);
  }
  memset(&v45, 0, sizeof(v45));
  v13 = xgboost::gbm::GBTreeModelParam::__MANAGER__(v5);
  v14 = (int *)((char *)this + 16);
  dmlc::parameter::ParamManager::RunUpdate<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>>>((uint64_t)v13, (uint64_t)this + 16, v49.__ptr_, &v50, 0, &v45, 0);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v49, v50.__m_.__sig);
  v49.__ptr_ = &v45;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
  if (v47 < 0)
    operator delete(__p[0]);
  v15 = (_QWORD *)*((_QWORD *)this + 22);
  v16 = (_QWORD *)*((_QWORD *)this + 23);
  while (v16 != v15)
  {
    v18 = *--v16;
    v17 = v18;
    *v16 = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  }
  *((_QWORD *)this + 23) = v15;
  v19 = (_QWORD *)*((_QWORD *)this + 25);
  v20 = (_QWORD *)*((_QWORD *)this + 26);
  while (v20 != v19)
  {
    v22 = *--v20;
    v21 = v22;
    *v20 = 0;
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  }
  *((_QWORD *)this + 26) = v19;
  std::string::basic_string[abi:ne180100]<0>(&v49, "trees");
  v23 = (_DWORD **)(*(uint64_t (**)(_QWORD, std::exception_ptr *))(**(_QWORD **)a2 + 24))(*(_QWORD *)a2, &v49);
  v24 = xgboost::Cast<xgboost::JsonArray const,xgboost::Value const>(*v23);
  if (v50.__m_.__opaque[7] < 0)
    operator delete(v49.__ptr_);
  std::vector<std::unique_ptr<xgboost::RegTree>>::resize((uint64_t)this + 176, (uint64_t)(v24[3] - v24[2]) >> 3);
  if (!*((_QWORD *)this + 31))
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v49);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/gbm/gbtree_model.cc");
    v42 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v49);
    v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"Check failed: ctx_", 18);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v49);
  }
  v26 = v24[2];
  v25 = v24[3];
  v44 = a2;
  v49.__ptr_ = 0;
  v50.__m_.__sig = 850045863;
  memset(v50.__m_.__opaque, 0, sizeof(v50.__m_.__opaque));
  v27 = v25 - v26;
  if (v27)
  {
    v28 = 0;
    v29 = v27 >> 3;
    do
    {
      v30 = v24[2];
      std::string::basic_string[abi:ne180100]<0>(__p, "id");
      v31 = (_DWORD **)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)(v30 + v28) + 24))(*(_QWORD *)(v30 + v28), __p);
      v32 = *((_QWORD *)xgboost::Cast<xgboost::JsonInteger const,xgboost::Value const>(*v31) + 2);
      if (v47 < 0)
        operator delete(__p[0]);
      v33 = *((_QWORD *)this + 22);
      if (v32 >= (*((_QWORD *)this + 23) - v33) >> 3)
        goto LABEL_32;
      v34 = (xgboost::RegTree *)operator new();
      xgboost::RegTree::RegTree(v34);
      v35 = *(_QWORD *)(v33 + 8 * v32);
      *(_QWORD *)(v33 + 8 * v32) = v34;
      if (v35)
        (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
      v36 = *((_QWORD *)this + 22);
      if (v32 >= (*((_QWORD *)this + 23) - v36) >> 3)
LABEL_32:
        std::vector<xgboost::detail::GradientPairInternal<float>>::__throw_out_of_range[abi:ne180100]();
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v36 + 8 * v32) + 16))(*(_QWORD *)(v36 + 8 * v32), v24[2] + v28);
      v28 += 8;
      --v29;
    }
    while (v29);
  }
  dmlc::OMPException::Rethrow(&v49);
  std::mutex::~mutex(&v50);
  std::exception_ptr::~exception_ptr(&v49);
  v37 = (_QWORD *)((char *)this + 224);
  std::vector<int>::resize((std::vector<int> *)((char *)this + 224), *((int *)this + 4));
  std::string::basic_string[abi:ne180100]<0>(&v49, "tree_info");
  v38 = (_DWORD **)(*(uint64_t (**)(_QWORD, std::exception_ptr *))(**(_QWORD **)v44 + 24))(*(_QWORD *)v44, &v49);
  v39 = xgboost::Cast<xgboost::JsonArray const,xgboost::Value const>(*v38);
  if (v50.__m_.__opaque[7] < 0)
    operator delete(v49.__ptr_);
  if (*v14 >= 1)
  {
    v40 = 0;
    do
    {
      *(_DWORD *)(*v37 + 4 * v40) = *((_QWORD *)xgboost::Cast<xgboost::JsonInteger const,xgboost::Value const>(*(_DWORD **)(v39[2] + 8 * v40))
                                    + 2);
      ++v40;
    }
    while (v40 < *v14);
  }
}

void sub_220F4C2B0(_Unwind_Exception *a1)
{
  std::mutex *v2;
  std::exception_ptr v3;

  std::mutex::~mutex(v2);
  std::exception_ptr::~exception_ptr(&v3);
  _Unwind_Resume(a1);
}

void sub_220F4C308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void xgboost::data::GradientIndexPageSource::Fetch(xgboost::data::GradientIndexPageSource *this)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t *v18;
  unint64_t *v19;
  unint64_t *v20;
  unint64_t v21;
  int v22;
  std::string *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  int v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  xgboost::GHistIndexMatrix *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t *v47;
  unint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  unint64_t *v51;
  unint64_t *v52;
  unint64_t *v53;
  unint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  std::string *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  int v65;
  void *v66;
  uint64_t v67;
  _QWORD *v68;
  void *v69;
  uint64_t *v70;
  char *v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  std::string *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  int v86;
  void *v87;
  uint64_t v88;
  _QWORD *v89;
  void *v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t *v93;
  std::__thread_struct *v94;
  char *v95;
  int v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t *v99;
  unint64_t *v100;
  unint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  _QWORD *v104;
  char *v105;
  std::string *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  int v111;
  void *v112;
  uint64_t v113;
  _QWORD *v114;
  _QWORD *v115;
  void *v116;
  std::string *v117;
  _QWORD *v118;
  _QWORD *v119;
  _QWORD *v120;
  int v121;
  void *v122;
  uint64_t v123;
  _QWORD *v124;
  _QWORD *v125;
  void *v126;
  __int128 v127;
  std::__shared_weak_count *v128;
  unint64_t *p_shared_owners;
  unint64_t v130;
  unint64_t *v131;
  std::string *Entry;
  _QWORD *v133;
  _QWORD *v134;
  std::string *v135;
  _QWORD *v136;
  _QWORD *v137;
  unint64_t v138[2];
  pthread_t v139;
  std::__shared_weak_count *v140;
  unint64_t v141;
  uint64_t v142;
  void *v143[2];
  char v144;
  void *__p[2];
  char v146;

  if (*((_BYTE *)this + 88))
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
    v133 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
    v134 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v133, (uint64_t)"Check failed: !at_end_", 22);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v134, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)__p);
  }
  if (**((_BYTE **)this + 14))
  {
    v2 = *((_QWORD *)this + 16);
    if (v2)
    {
      *((_QWORD *)this + 16) = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
      v3 = *((_QWORD *)this + 17);
      v4 = *((unsigned int *)this + 27);
      v6 = *(_QWORD **)v3;
      v5 = *(_QWORD **)(v3 + 8);
      v7 = ((uint64_t)v5 - *(_QWORD *)v3) >> 3;
      if (v4 <= v7)
      {
        if (v4 < v7)
        {
          v50 = &v6[v4];
          while (v5 != v50)
          {
            v52 = (unint64_t *)*--v5;
            v51 = v52;
            if (v52)
            {
              v53 = v51 + 1;
              do
                v54 = __ldaxr(v53);
              while (__stlxr(v54 - 1, v53));
              if (!v54)
                (*(void (**)(unint64_t *))(*v51 + 16))(v51);
            }
          }
          *(_QWORD *)(v3 + 8) = v50;
        }
      }
      else
      {
        v8 = v4 - v7;
        v9 = *(_QWORD *)(v3 + 16);
        if (v4 - v7 <= (v9 - (uint64_t)v5) >> 3)
        {
          bzero(*(void **)(v3 + 8), 8 * v8);
          *(_QWORD *)(v3 + 8) = &v5[v8];
        }
        else
        {
          v10 = v9 - (_QWORD)v6;
          if (v10 >> 2 > v4)
            v4 = v10 >> 2;
          if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
            v11 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v11 = v4;
          if (v11 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v12 = (char *)operator new(8 * v11);
          v13 = &v12[8 * v7];
          v14 = &v12[8 * v11];
          bzero(v13, 8 * v8);
          v15 = &v13[8 * v8];
          if (v5 == v6)
          {
            *(_QWORD *)v3 = v13;
            *(_QWORD *)(v3 + 8) = v15;
            *(_QWORD *)(v3 + 16) = v14;
          }
          else
          {
            do
            {
              v16 = *--v5;
              *((_QWORD *)v13 - 1) = v16;
              v13 -= 8;
              *v5 = 0;
            }
            while (v5 != v6);
            v5 = *(_QWORD **)v3;
            v17 = *(_QWORD **)(v3 + 8);
            *(_QWORD *)v3 = v13;
            *(_QWORD *)(v3 + 8) = v15;
            *(_QWORD *)(v3 + 16) = v14;
            while (v17 != v5)
            {
              v19 = (unint64_t *)*--v17;
              v18 = v19;
              if (v19)
              {
                v20 = v18 + 1;
                do
                  v21 = __ldaxr(v20);
                while (__stlxr(v21 - 1, v20));
                if (!v21)
                  (*(void (**)(unint64_t *))(*v18 + 16))(v18);
              }
            }
          }
          if (v5)
            operator delete(v5);
        }
      }
    }
    LODWORD(v76) = *((_DWORD *)this + 27);
    if (v76 >= 4)
      v76 = 4;
    else
      v76 = v76;
    v142 = v76;
    LODWORD(v143[0]) = 0;
    if (!(_DWORD)v76)
    {
      dmlc::LogCheckFormat<unsigned long,int>((uint64_t *)__p);
      if (__p[0])
      {
        v107 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        dmlc::LogMessageFatal::Entry::Init(v107, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
        v108 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        v109 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v108, (uint64_t)"Check failed: ", 14);
        v110 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v109, (uint64_t)"n_prefetch_batches > 0", 22);
        v111 = *((char *)__p[0] + 23);
        v112 = v111 >= 0 ? __p[0] : *(void **)__p[0];
        v113 = v111 >= 0 ? *((unsigned __int8 *)__p[0] + 23) : *((_QWORD *)__p[0] + 1);
        v114 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v110, (uint64_t)v112, v113);
        v115 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v114, (uint64_t)": ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v115, (uint64_t)"total batches:", 14);
        std::ostream::operator<<();
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v143);
        v116 = __p[0];
        __p[0] = 0;
        if (v116)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__p, (uint64_t)v116);
      }
    }
    v77 = *((unsigned int *)this + 26);
    v141 = v77;
    v78 = (char *)v142;
    if (v142)
    {
      v79 = 0;
      do
      {
        v80 = v77 % *((unsigned int *)this + 27);
        v141 = v80;
        v81 = **((_QWORD **)this + 17);
        if (v80 >= (*(_QWORD *)(*((_QWORD *)this + 17) + 8) - v81) >> 3)
          std::vector<xgboost::detail::GradientPairInternal<float>>::__throw_out_of_range[abi:ne180100]();
        if (!*(_QWORD *)(v81 + 8 * v80))
        {
          v143[0] = (void *)((uint64_t)(*(_QWORD *)(*((_QWORD *)this + 14) + 64)
                                     - *(_QWORD *)(*((_QWORD *)this + 14) + 56)) >> 3);
          if ((void *)v80 >= v143[0])
          {
            dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)__p);
            if (__p[0])
            {
              v82 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
              dmlc::LogMessageFatal::Entry::Init(v82, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
              v83 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
              v84 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v83, (uint64_t)"Check failed: ", 14);
              v85 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v84, (uint64_t)"fetch_it < cache_info_->offset.size()", 37);
              v86 = *((char *)__p[0] + 23);
              v87 = v86 >= 0 ? __p[0] : *(void **)__p[0];
              v88 = v86 >= 0 ? *((unsigned __int8 *)__p[0] + 23) : *((_QWORD *)__p[0] + 1);
              v89 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v85, (uint64_t)v87, v88);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v89, (uint64_t)": ", 2);
              dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v143);
              v90 = __p[0];
              __p[0] = 0;
              if (v90)
                std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__p, (uint64_t)v90);
            }
          }
          v91 = v141;
          v92 = operator new();
          *(_QWORD *)(v92 + 8) = 0;
          v93 = (unint64_t *)(v92 + 8);
          *(_QWORD *)(v92 + 16) = 0;
          *(_QWORD *)(v92 + 24) = 850045863;
          *(_OWORD *)(v92 + 32) = 0u;
          *(_OWORD *)(v92 + 48) = 0u;
          *(_OWORD *)(v92 + 64) = 0u;
          *(_QWORD *)(v92 + 80) = 0;
          *(_QWORD *)(v92 + 88) = 1018212795;
          *(_OWORD *)(v92 + 96) = 0u;
          *(_OWORD *)(v92 + 112) = 0u;
          *(_OWORD *)(v92 + 124) = 0u;
          *(_QWORD *)v92 = &off_24E6BE7D8;
          *(_QWORD *)(v92 + 160) = v91;
          *(_QWORD *)(v92 + 168) = this;
          v94 = (std::__thread_struct *)operator new();
          std::__thread_struct::__thread_struct(v94);
          __p[0] = v94;
          v95 = (char *)operator new();
          __p[0] = 0;
          *(_QWORD *)v95 = v94;
          *(_OWORD *)(v95 + 8) = xmmword_220F620A0;
          *((_QWORD *)v95 + 3) = v92;
          v143[0] = v95;
          v96 = pthread_create(&v139, 0, (void *(__cdecl *)(void *))std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,void (std::__async_assoc_state<std::shared_ptr<xgboost::GHistIndexMatrix>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::ReadCache(void)::{lambda(void)#1}>>::*)(void),std::__async_assoc_state<std::shared_ptr<xgboost::GHistIndexMatrix>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::ReadCache(void)::{lambda(void)#1}>>*>>, v95);
          if (v96)
          {
            std::__throw_system_error(v96, "thread constructor failed");
            __break(1u);
            return;
          }
          v143[0] = 0;
          std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,void (std::__async_assoc_state<std::shared_ptr<xgboost::CSCPage>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::CSCPage>::ReadCache(void)::{lambda(void)#1}>>::*)(void),std::__async_assoc_state<std::shared_ptr<xgboost::CSCPage>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::CSCPage>::ReadCache(void)::{lambda(void)#1}>>*>>::reset[abi:ne180100]((uint64_t **)v143);
          std::thread::detach((std::thread *)&v139);
          std::thread::~thread((std::thread *)&v139);
          std::__assoc_sub_state::__attach_future[abi:ne180100](v92);
          do
            v97 = __ldaxr(v93);
          while (__stlxr(v97 - 1, v93));
          if (!v97)
            (*(void (**)(uint64_t))(*(_QWORD *)v92 + 16))(v92);
          v98 = **((_QWORD **)this + 17);
          if (v141 >= (*(_QWORD *)(*((_QWORD *)this + 17) + 8) - v98) >> 3)
            std::vector<xgboost::detail::GradientPairInternal<float>>::__throw_out_of_range[abi:ne180100]();
          v99 = *(unint64_t **)(v98 + 8 * v141);
          *(_QWORD *)(v98 + 8 * v141) = v92;
          if (v99)
          {
            v100 = v99 + 1;
            do
              v101 = __ldaxr(v100);
            while (__stlxr(v101 - 1, v100));
            if (!v101)
              (*(void (**)(unint64_t *))(*v99 + 16))(v99);
          }
          v80 = v141;
          v78 = (char *)v142;
        }
        ++v79;
        v77 = v80 + 1;
        v141 = v77;
      }
      while (v79 < (unint64_t)v78);
    }
    v102 = *((_QWORD *)this + 17);
    v103 = *(_QWORD **)v102;
    v104 = *(_QWORD **)(v102 + 8);
    if (v103 == v104)
    {
      v105 = 0;
    }
    else
    {
      v105 = 0;
      do
      {
        if (*v103++)
          ++v105;
      }
      while (v103 != v104);
    }
    v143[0] = v105;
    if (v105 != v78)
    {
      dmlc::LogCheckFormat<long,unsigned long>((uint64_t *)__p);
      if (__p[0])
      {
        v117 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        dmlc::LogMessageFatal::Entry::Init(v117, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
        v118 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        v119 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v118, (uint64_t)"Check failed: ", 14);
        v120 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v119, (uint64_t)"std::count_if (ring_->cbegin(), ring_->cend(), [](auto const& f) { return f.valid(); }) == n_prefetch_batches",
                 108);
        v121 = *((char *)__p[0] + 23);
        v122 = v121 >= 0 ? __p[0] : *(void **)__p[0];
        v123 = v121 >= 0 ? *((unsigned __int8 *)__p[0] + 23) : *((_QWORD *)__p[0] + 1);
        v124 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v120, (uint64_t)v122, v123);
        v125 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v124, (uint64_t)": ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v125, (uint64_t)"Sparse DMatrix assumes forward iteration.", 41);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v143);
        v126 = __p[0];
        __p[0] = 0;
        if (v126)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__p, (uint64_t)v126);
      }
    }
    std::future<std::shared_ptr<xgboost::GHistIndexMatrix>>::get((uint64_t *)(**((_QWORD **)this + 17) + 8 * *((unsigned int *)this + 26)), __p);
    v127 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    v128 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
    *(_OWORD *)((char *)this + 72) = v127;
    if (v128)
    {
      p_shared_owners = (unint64_t *)&v128->__shared_owners_;
      do
        v130 = __ldaxr(p_shared_owners);
      while (__stlxr(v130 - 1, p_shared_owners));
      if (!v130)
      {
        ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
        std::__shared_weak_count::__release_weak(v128);
      }
    }
    v73 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v131 = (unint64_t *)((char *)__p[1] + 8);
      do
        v75 = __ldaxr(v131);
      while (__stlxr(v75 - 1, v131));
      goto LABEL_159;
    }
  }
  else
  {
    v22 = *((_DWORD *)this + 26);
    if (v22 && !*((_BYTE *)this + 160))
    {
      xgboost::data::SparsePageSource::operator++(*((_QWORD *)this + 18));
      v22 = *((_DWORD *)this + 26);
    }
    LODWORD(v143[0]) = *(_DWORD *)(*((_QWORD *)this + 18) + 104);
    if (v22 != LODWORD(v143[0]))
    {
      dmlc::LogCheckFormat<unsigned int,unsigned int>((uint64_t *)__p);
      if (__p[0])
      {
        v23 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        dmlc::LogMessageFatal::Entry::Init(v23, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/gradient_index_page_source.cc");
        v24 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"Check failed: ", 14);
        v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"count_ == source_->Iter()", 25);
        v27 = *((char *)__p[0] + 23);
        v28 = v27 >= 0 ? __p[0] : *(void **)__p[0];
        v29 = v27 >= 0 ? *((unsigned __int8 *)__p[0] + 23) : *((_QWORD *)__p[0] + 1);
        v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)v28, v29);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v143);
        v31 = __p[0];
        __p[0] = 0;
        if (v31)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__p, (uint64_t)v31);
      }
    }
    (*(void (**)(pthread_t *__return_ptr))(**((_QWORD **)this + 18) + 40))(&v139);
    v32 = (xgboost::GHistIndexMatrix *)operator new();
    xgboost::GHistIndexMatrix::GHistIndexMatrix(v32);
    std::shared_ptr<xgboost::GHistIndexMatrix>::reset[abi:ne180100]<xgboost::GHistIndexMatrix,void>((_QWORD *)this + 9, (uint64_t)v32);
    v33 = **((_QWORD **)this + 22);
    v34 = *(_QWORD *)(*((_QWORD *)this + 22) + 8);
    LODWORD(v142) = 0;
    v35 = v34 - v33;
    v143[0] = (void *)(v35 >> 2);
    if (!v35)
    {
      dmlc::LogCheckFormat<unsigned long,int>((uint64_t *)__p);
      if (__p[0])
      {
        v61 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        dmlc::LogMessageFatal::Entry::Init(v61, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/gradient_index_page_source.cc");
        v62 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v143);
        v63 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v62, (uint64_t)"Check failed: ", 14);
        v64 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v63, (uint64_t)"cuts_.Values().size() != 0", 26);
        v65 = *((char *)__p[0] + 23);
        v66 = v65 >= 0 ? __p[0] : *(void **)__p[0];
        v67 = v65 >= 0 ? *((unsigned __int8 *)__p[0] + 23) : *((_QWORD *)__p[0] + 1);
        v68 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v64, (uint64_t)v66, v67);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v68, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v143);
        v69 = __p[0];
        __p[0] = 0;
        if (v69)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__p, (uint64_t)v69);
      }
    }
    v36 = *((_QWORD *)this + 9);
    v37 = *((_QWORD *)this + 27);
    v138[0] = *((_QWORD *)this + 26);
    v138[1] = v37;
    xgboost::GHistIndexMatrix::Init(v36, (std::mutex **)v139, v138, (xgboost::data::GradientIndexPageSource *)((char *)this + 168), *((_DWORD *)this + 51), *((_BYTE *)this + 200), *((_DWORD *)this + 24), *((double *)this + 28));
    if (**((_BYTE **)this + 14))
    {
      v135 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
      dmlc::LogMessageFatal::Entry::Init(v135, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
      v136 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
      v137 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v136, (uint64_t)"Check failed: !cache_info_->written", 35);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v137, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)__p);
    }
    std::chrono::steady_clock::now();
    std::chrono::steady_clock::now();
    std::string::basic_string[abi:ne180100]<0>(__p, "raw");
    v38 = xgboost::data::CreatePageFormat<xgboost::GHistIndexMatrix>((uint64_t)__p);
    if (v146 < 0)
      operator delete(__p[0]);
    v39 = *((_QWORD *)this + 16);
    if (!v39)
    {
      xgboost::data::Cache::ShardName(*((xgboost::data::Cache **)this + 14), (uint64_t)__p);
      if (v146 >= 0)
        v40 = __p;
      else
        v40 = (void **)__p[0];
      v41 = dmlc::Stream::Create((dmlc::Stream *)v40, "w", 0);
      v42 = *((_QWORD *)this + 16);
      *((_QWORD *)this + 16) = v41;
      if (v42)
        (*(void (**)(uint64_t))(*(_QWORD *)v42 + 24))(v42);
      if (v146 < 0)
        operator delete(__p[0]);
      v39 = *((_QWORD *)this + 16);
    }
    v43 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v38 + 24))(v38, *((_QWORD *)this + 9), v39);
    std::chrono::steady_clock::now();
    if (*(int *)(dmlc::ThreadLocalStore<xgboost::GlobalConfiguration>::Get(void)::inst() + 4) >= 2)
    {
      std::string::basic_string[abi:ne180100]<0>(v143, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
      xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)__p, (uint64_t)v143, 164, 2);
      v44 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, (uint64_t)" MB written in ", 15);
      v45 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)" seconds.", 9);
      xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)__p);
      if (v144 < 0)
        operator delete(v143[0]);
    }
    v46 = (_QWORD *)*((_QWORD *)this + 14);
    v47 = (uint64_t *)v46[8];
    v48 = v46[9];
    if ((unint64_t)v47 >= v48)
    {
      v55 = (uint64_t *)v46[7];
      v56 = v47 - v55;
      if ((unint64_t)(v56 + 1) >> 61)
        std::vector<void *>::__throw_length_error[abi:ne180100]();
      v57 = v48 - (_QWORD)v55;
      v58 = (uint64_t)(v48 - (_QWORD)v55) >> 2;
      if (v58 <= v56 + 1)
        v58 = v56 + 1;
      if (v57 >= 0x7FFFFFFFFFFFFFF8)
        v59 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v59 = v58;
      if (v59)
      {
        v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)(v46 + 9), v59);
        v55 = (uint64_t *)v46[7];
        v47 = (uint64_t *)v46[8];
      }
      else
      {
        v60 = 0;
      }
      v70 = (uint64_t *)&v60[8 * v56];
      v71 = &v60[8 * v59];
      *v70 = v43;
      v49 = v70 + 1;
      while (v47 != v55)
      {
        v72 = *--v47;
        *--v70 = v72;
      }
      v46[7] = v70;
      v46[8] = v49;
      v46[9] = v71;
      if (v55)
        operator delete(v55);
    }
    else
    {
      *v47 = v43;
      v49 = v47 + 1;
    }
    v46[8] = v49;
    (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
    v73 = v140;
    if (v140)
    {
      v74 = (unint64_t *)&v140->__shared_owners_;
      do
        v75 = __ldaxr(v74);
      while (__stlxr(v75 - 1, v74));
LABEL_159:
      if (!v75)
      {
        ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
        std::__shared_weak_count::__release_weak(v73);
      }
    }
  }
}

void sub_220F4D1DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)va);
  JUMPOUT(0x220F4D1E8);
}

void sub_220F4D204()
{
  __cxa_end_catch();
  JUMPOUT(0x220F4D20CLL);
}

void xgboost::data::GradientIndexPageSource::~GradientIndexPageSource(xgboost::data::GradientIndexPageSource *this)
{
  *(_QWORD *)this = &off_24E6BE888;
  xgboost::HostDeviceVector<float>::~HostDeviceVector((uint64_t *)this + 24);
  xgboost::HostDeviceVector<unsigned int>::~HostDeviceVector((uint64_t *)this + 23);
  xgboost::HostDeviceVector<float>::~HostDeviceVector((uint64_t *)this + 22);
  *(_QWORD *)this = &unk_24E6BA550;
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100]((uint64_t)this + 144);
  xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::~SparsePageSourceImpl((uint64_t)this);
}

{
  *(_QWORD *)this = &off_24E6BE888;
  xgboost::HostDeviceVector<float>::~HostDeviceVector((uint64_t *)this + 24);
  xgboost::HostDeviceVector<unsigned int>::~HostDeviceVector((uint64_t *)this + 23);
  xgboost::HostDeviceVector<float>::~HostDeviceVector((uint64_t *)this + 22);
  *(_QWORD *)this = &unk_24E6BA550;
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100]((uint64_t)this + 144);
  xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::~SparsePageSourceImpl((uint64_t)this);
  JUMPOUT(0x227667068);
}

void std::__async_assoc_state<std::shared_ptr<xgboost::GHistIndexMatrix>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::ReadCache(void)::{lambda(void)#1}>>::~__async_assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x227667068);
}

uint64_t std::__async_assoc_state<std::shared_ptr<xgboost::GHistIndexMatrix>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::ReadCache(void)::{lambda(void)#1}>>::__on_zero_shared(uint64_t a1)
{
  std::__assoc_sub_state::wait((std::__assoc_sub_state *)a1);
  if ((*(_BYTE *)(a1 + 136) & 1) != 0)
    std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100](a1 + 144);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

void std::__async_assoc_state<std::shared_ptr<xgboost::GHistIndexMatrix>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::ReadCache(void)::{lambda(void)#1}>>::__execute(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  dmlc::SeekStream *v6;
  uint64_t v7;
  std::string *Entry;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  __n128 v18;
  _QWORD *v19;
  uint64_t v20;
  std::string *v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24[2];
  char v25;
  void *__p[2];
  char v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  void *v31[2];
  char v32;

  std::chrono::steady_clock::now();
  std::chrono::steady_clock::now();
  std::string::basic_string[abi:ne180100]<0>(__p, "raw");
  v2 = xgboost::data::CreatePageFormat<xgboost::GHistIndexMatrix>((uint64_t)__p);
  if (v27 < 0)
    operator delete(__p[0]);
  xgboost::data::Cache::ShardName(*(xgboost::data::Cache **)(*(_QWORD *)(a1 + 168) + 112), (uint64_t)v31);
  v30 = 0;
  v3 = *(_QWORD *)(a1 + 160);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 168) + 112);
  v5 = *(_QWORD *)(v4 + 56);
  if (v3 >= (*(_QWORD *)(v4 + 64) - v5) >> 3)
    std::vector<unsigned long>::__throw_out_of_range[abi:ne180100]();
  v30 = *(void **)(v5 + 8 * v3);
  if (v32 >= 0)
    v6 = (dmlc::SeekStream *)v31;
  else
    v6 = (dmlc::SeekStream *)v31[0];
  v7 = dmlc::SeekStream::CreateForRead(v6, 0);
  (*(void (**)(uint64_t, void *))(*(_QWORD *)v7 + 32))(v7, v30);
  v24[0] = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 40))(v7);
  if (v24[0] != v30)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)__p);
    if (__p[0])
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v24);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
      v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v24);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: ", 14);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"fi->Tell() == offset", 20);
      v12 = *((char *)__p[0] + 23);
      v13 = v12 >= 0 ? __p[0] : *(void **)__p[0];
      v14 = v12 >= 0 ? *((unsigned __int8 *)__p[0] + 23) : *((_QWORD *)__p[0] + 1);
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v13, v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v24);
      v16 = __p[0];
      __p[0] = 0;
      if (v16)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__p, (uint64_t)v16);
    }
  }
  v17 = operator new(0xE0uLL);
  v17[1] = 0;
  v17[2] = 0;
  *v17 = &off_24E6BE838;
  xgboost::GHistIndexMatrix::GHistIndexMatrix((xgboost::GHistIndexMatrix *)(v17 + 3));
  v28 = v17 + 3;
  v29 = v17;
  if (((*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v2 + 16))(v2, v17 + 3, v7) & 1) == 0)
  {
    v21 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
    dmlc::LogMessageFatal::Entry::Init(v21, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
    v22 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
    v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"Check failed: fmt->Read(page.get(), fi.get())", 45);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)__p);
  }
  if (*(int *)(dmlc::ThreadLocalStore<xgboost::GlobalConfiguration>::Get(void)::inst(v18) + 4) >= 2)
  {
    std::string::basic_string[abi:ne180100]<0>(v24, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_source.h");
    xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)__p, (uint64_t)v24, 141, 2);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Read a page in ", 15);
    v19 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" seconds.", 9);
    xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)__p);
    if (v25 < 0)
      operator delete(v24[0]);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  if (v32 < 0)
    operator delete(v31[0]);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 136) & 1) != 0
    || (__p[0] = 0, v20 = *(_QWORD *)(a1 + 16), std::exception_ptr::~exception_ptr((std::exception_ptr *)__p), v20))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_QWORD *)(a1 + 144) = v17 + 3;
  *(_QWORD *)(a1 + 152) = v17;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock((std::mutex *)(a1 + 24));
}

void sub_220F4D704(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  std::__assoc_sub_state *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::exception_ptr v28;

  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a18);
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100](v26 - 96);
  (*(void (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
  if (*(char *)(v26 - 49) < 0)
    operator delete(*(void **)(v26 - 72));
  if (v24)
    (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
  __cxa_begin_catch(a1);
  std::current_exception();
  v28.__ptr_ = &a9;
  std::__assoc_sub_state::set_exception(v23, v28);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&a9);
  __cxa_end_catch();
  JUMPOUT(0x220F4D68CLL);
}

void sub_220F4D858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::exception_ptr a9)
{
  std::exception_ptr::~exception_ptr(&a9);
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t xgboost::data::CreatePageFormat<xgboost::GHistIndexMatrix>(uint64_t a1)
{
  __int128 *v2;
  const void **v3;
  char *v4;
  uint64_t v5;
  const void **v6;
  _BOOL4 v7;
  char **v8;
  _QWORD *v9;
  uint64_t v10;
  std::string *Entry;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  const void *v16;
  uint64_t v17;
  char v18;

  dmlc::Registry<xgboost::data::SparsePageFormatReg<xgboost::GHistIndexMatrix>>::Get();
  v2 = dmlc::Registry<xgboost::data::SparsePageFormatReg<xgboost::GHistIndexMatrix>>::Get();
  v3 = (const void **)v2 + 7;
  v4 = (char *)*((_QWORD *)v2 + 7);
  if (!v4)
    goto LABEL_11;
  v5 = (uint64_t)(v2 + 4);
  v6 = (const void **)v2 + 7;
  do
  {
    v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)v4 + 4, (const void **)a1);
    v8 = (char **)(v4 + 8);
    if (!v7)
    {
      v8 = (char **)v4;
      v6 = (const void **)v4;
    }
    v4 = *v8;
  }
  while (*v8);
  if (v6 == v3
    || std::less<std::string>::operator()[abi:ne180100](v5, (const void **)a1, v6 + 4)
    || (v9 = v6[7]) == 0)
  {
LABEL_11:
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v18);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_writer.h");
    v13 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v18);
    v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"Unknown format type ", 20);
    v15 = *(char *)(a1 + 23);
    if (v15 >= 0)
      v16 = (const void *)a1;
    else
      v16 = *(const void **)a1;
    if (v15 >= 0)
      v17 = *(unsigned __int8 *)(a1 + 23);
    else
      v17 = *(_QWORD *)(a1 + 8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v16, v17);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v18);
    return 0;
  }
  else
  {
    v10 = v9[12];
    if (!v10)
      std::__throw_bad_function_call[abi:ne180100]();
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 48))(v10);
  }
}

void sub_220F4D994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<xgboost::GHistIndexMatrix>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24E6BE838;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<xgboost::GHistIndexMatrix>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24E6BE838;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x227667068);
}

void std::__shared_ptr_emplace<xgboost::GHistIndexMatrix>::__on_zero_shared(uint64_t a1)
{
  xgboost::GHistIndexMatrix::~GHistIndexMatrix((xgboost::GHistIndexMatrix *)(a1 + 24));
}

uint64_t std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,void (std::__async_assoc_state<std::shared_ptr<xgboost::GHistIndexMatrix>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::ReadCache(void)::{lambda(void)#1}>>::*)(void),std::__async_assoc_state<std::shared_ptr<xgboost::GHistIndexMatrix>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::GHistIndexMatrix>::ReadCache(void)::{lambda(void)#1}>>*>>(uint64_t *a1)
{
  std::__thread_specific_ptr<std::__thread_struct> *v2;
  const void *v3;
  uint64_t v4;
  void (*v5)(_QWORD *);
  _QWORD *v6;
  uint64_t *v8;

  v8 = a1;
  v2 = std::__thread_local_data();
  v3 = (const void *)*a1;
  *a1 = 0;
  pthread_setspecific(v2->__key_, v3);
  v4 = a1[2];
  v5 = (void (*)(_QWORD *))a1[1];
  v6 = (_QWORD *)(a1[3] + (v4 >> 1));
  if ((v4 & 1) != 0)
    v5 = *(void (**)(_QWORD *))(*v6 + v5);
  v5(v6);
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,void (std::__async_assoc_state<std::shared_ptr<xgboost::CSCPage>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::CSCPage>::ReadCache(void)::{lambda(void)#1}>>::*)(void),std::__async_assoc_state<std::shared_ptr<xgboost::CSCPage>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::CSCPage>::ReadCache(void)::{lambda(void)#1}>>*>>::reset[abi:ne180100](&v8);
  return 0;
}

void sub_220F4DA5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,void (std::__async_assoc_state<std::shared_ptr<xgboost::CSCPage>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::CSCPage>::ReadCache(void)::{lambda(void)#1}>>::*)(void),std::__async_assoc_state<std::shared_ptr<xgboost::CSCPage>,std::__async_func<xgboost::data::SparsePageSourceImpl<xgboost::CSCPage>::ReadCache(void)::{lambda(void)#1}>>*>>::reset[abi:ne180100]((uint64_t **)va);
  _Unwind_Resume(a1);
}

uint64_t xgboost::metric::__dmlc_registry_file_tag_survival_metric__(xgboost::metric *this)
{
  return 0;
}

void xgboost::metric::AFTNLogLikDispatcher::~AFTNLogLikDispatcher(xgboost::metric::AFTNLogLikDispatcher *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_24E6BE948;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_24E6BE948;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  JUMPOUT(0x227667068);
}

void xgboost::metric::AFTNLogLikDispatcher::LoadConfig(xgboost::metric::AFTNLogLikDispatcher *this, const xgboost::Json *a2)
{
  _DWORD **v4;
  void *__p[2];
  char v6;
  std::vector<std::pair<std::string, std::string>> v7;
  std::vector<std::pair<std::string, std::string>> *v8;

  std::string::basic_string[abi:ne180100]<0>(__p, "aft_loss_param");
  v4 = (_DWORD **)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)a2 + 24))(*(_QWORD *)a2, __p);
  xgboost::FromJson<xgboost::common::AFTParam>(v4, (xgboost::metric::AFTNLogLikDispatcher *)((char *)this + 16), &v7);
  v8 = &v7;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_220F4DC50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void xgboost::metric::AFTNLogLikDispatcher::SaveConfig(xgboost::metric::AFTNLogLikDispatcher *this, xgboost::Json *a2)
{
  char *v4;
  uint64_t *v5;
  unsigned int **v6;
  void *__p[2];
  char v8;
  void *v9[2];
  uint64_t v10;
  _QWORD v11[2];
  void *v12[2];
  uint64_t v13;

  v4 = (char *)(*(uint64_t (**)(xgboost::metric::AFTNLogLikDispatcher *))(*(_QWORD *)this + 48))(this);
  std::string::basic_string[abi:ne180100]<0>(v9, v4);
  v11[1] = 0;
  *(_OWORD *)v12 = *(_OWORD *)v9;
  v13 = v10;
  v9[0] = 0;
  v9[1] = 0;
  v10 = 0;
  v11[0] = off_24E6BE2B8;
  std::string::basic_string[abi:ne180100]<0>(__p, "name");
  v5 = (uint64_t *)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)a2 + 24))(*(_QWORD *)a2, __p);
  xgboost::Json::operator=(v5, (uint64_t)v11);
  if (v8 < 0)
    operator delete(__p[0]);
  v11[0] = off_24E6BE2B8;
  if (SHIBYTE(v13) < 0)
    operator delete(v12[0]);
  if (SHIBYTE(v10) < 0)
    operator delete(v9[0]);
  xgboost::ToJson<xgboost::common::AFTParam>((xgboost::metric::AFTNLogLikDispatcher *)((char *)this + 16), (uint64_t)v11);
  std::string::basic_string[abi:ne180100]<0>(v9, "aft_loss_param");
  v6 = (unsigned int **)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)a2 + 24))(*(_QWORD *)a2, v9);
  xgboost::Json::operator=(v6, (uint64_t)v11);
  if (SHIBYTE(v10) < 0)
    operator delete(v9[0]);
  v11[0] = &off_24E6BE1D0;
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)v12, (_QWORD *)v12[1]);
}

void sub_220F4DDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,void *__p,_QWORD *a25,int a26,__int16 a27,char a28,char a29)
{
  std::__tree<std::__value_type<std::string,xgboost::Json>,std::__map_value_compare<std::string,std::__value_type<std::string,xgboost::Json>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,xgboost::Json>>>::destroy((uint64_t)&__p, a25);
  _Unwind_Resume(a1);
}

uint64_t xgboost::metric::AFTNLogLikDispatcher::Configure(uint64_t a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (**v8)();
  uint64_t v9;
  std::string *Entry;
  _QWORD *v11;
  uint64_t v13[3];
  void **v14;

  xgboost::XGBoostParameter<xgboost::common::AFTParam>::UpdateAllowUnknown<std::vector<std::pair<std::string,std::string>>>((xgboost::common::AFTParam *)(a1 + 16), a2, v13);
  v14 = (void **)v13;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](&v14);
  v4 = *(_DWORD *)(a1 + 20);
  if (v4 == 2)
  {
    v5 = operator new();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    v8 = &off_24E6BEA68;
  }
  else if (v4 == 1)
  {
    v5 = operator new();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    v8 = &off_24E6BEA08;
  }
  else
  {
    if (v4)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v14);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v11 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"Unknown probability distribution", 32);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v14);
      return (*(uint64_t (**)(_QWORD, uint64_t *))(**(_QWORD **)(a1 + 32) + 32))(*(_QWORD *)(a1 + 32), a2);
    }
    v5 = operator new();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    v8 = &off_24E6BE9A8;
  }
  *(_BYTE *)(v5 + 16) = 0;
  *(_BYTE *)(v5 + 28) = 0;
  *(_DWORD *)(v5 + 40) = -1;
  *(_QWORD *)v5 = v8;
  *(_QWORD *)(v5 + 8) = v7;
  v9 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  return (*(uint64_t (**)(_QWORD, uint64_t *))(**(_QWORD **)(a1 + 32) + 32))(*(_QWORD *)(a1 + 32), a2);
}

void sub_220F4DF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)va);
  _Unwind_Resume(a1);
}

uint64_t xgboost::metric::AFTNLogLikDispatcher::Eval(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  std::string *Entry;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  char v14;

  v8 = *(_QWORD *)(a1 + 32);
  if (!v8)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v14);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v11 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v14);
    v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"Check failed: metric_", 21);
    v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)": ", 2);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"AFT metric must be configured first, with distribution type and scale", 69);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v14);
    v8 = *(_QWORD *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v8 + 40))(v8, a2, a3, a4);
}

void sub_220F4E064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

const char *xgboost::metric::AFTNLogLikDispatcher::Name(xgboost::metric::AFTNLogLikDispatcher *this)
{
  return "aft-nloglik";
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::NormalDistribution>>::~EvalEWiseSurvivalBase()
{
  JUMPOUT(0x227667068);
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::NormalDistribution>>::Configure(uint64_t a1, uint64_t *a2)
{
  int v3;
  uint64_t v4;
  std::string *Entry;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8[3];
  void **v9;

  xgboost::XGBoostParameter<xgboost::common::AFTParam>::UpdateAllowUnknown<std::vector<std::pair<std::string,std::string>>>((xgboost::common::AFTParam *)(a1 + 16), a2, v8);
  v9 = (void **)v8;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](&v9);
  v3 = *(_DWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 36) = v3;
  if (!v4)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v8);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v6 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v8);
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v8);
  }
}

void sub_220F4E140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a9);
  _Unwind_Resume(a1);
}

double xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::NormalDistribution>>::Eval(float *a1, float ***a2, _QWORD *a3, int a4)
{
  float *v7;
  std::string *Entry;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *ptr;
  std::string *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  int v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  _QWORD *v29;
  std::string *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  int v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  float **v39;
  float **v40;
  float **v41;
  float **v42;
  uint64_t v43;
  float *v44;
  float *v45;
  float *v46;
  float *v47;
  float *v48;
  double v49;
  long double *v50;
  float *v51;
  double *v52;
  double v53;
  float v54;
  long double v55;
  float v56;
  long double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double *v64;
  double v65;
  double *v66;
  double v67;
  void *Engine;
  double v69;
  std::string *v71;
  _QWORD *v72;
  _QWORD *v73;
  int v74;
  uint64_t v75;
  double *v76;
  void *__p;
  float *v78;
  uint64_t v79;
  std::exception_ptr v80;
  std::mutex v81;
  uint64_t v82;

  v7 = a1;
  v82 = *MEMORY[0x24BDAC8D0];
  __p = (void *)((*a2)[1] - **a2);
  v75 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
  if (__p != (void *)v75)
  {
    a1 = (float *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v80);
    if (v80.__ptr_)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: ", 14);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"preds.Size() == info.labels_lower_bound_.Size()", 47);
      v12 = *((char *)v80.__ptr_ + 23);
      v13 = v12 >= 0 ? v80.__ptr_ : *(void **)v80.__ptr_;
      v14 = v12 >= 0 ? *((unsigned __int8 *)v80.__ptr_ + 23) : *((_QWORD *)v80.__ptr_ + 1);
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v13, v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      ptr = v80.__ptr_;
      v80.__ptr_ = 0;
      if (ptr)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v80, (uint64_t)ptr);
    }
  }
  __p = (void *)((*a2)[1] - **a2);
  v75 = (uint64_t)(*(_QWORD *)(a3[14] + 8) - *(_QWORD *)a3[14]) >> 2;
  if (__p != (void *)v75)
  {
    a1 = (float *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v80);
    if (v80.__ptr_)
    {
      v17 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(v17, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v18 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Check failed: ", 14);
      v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"preds.Size() == info.labels_upper_bound_.Size()", 47);
      v21 = *((char *)v80.__ptr_ + 23);
      v22 = v21 >= 0 ? v80.__ptr_ : *(void **)v80.__ptr_;
      v23 = v21 >= 0 ? *((unsigned __int8 *)v80.__ptr_ + 23) : *((_QWORD *)v80.__ptr_ + 1);
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v22, v23);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      v25 = v80.__ptr_;
      v80.__ptr_ = 0;
      if (v25)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v80, (uint64_t)v25);
    }
  }
  v26 = *((_QWORD *)v7 + 1);
  if (!v26)
  {
    v71 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v80);
    dmlc::LogMessageFatal::Entry::Init(v71, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v72 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v80);
    v73 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v72, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v73, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v80);
    v26 = *((_QWORD *)v7 + 1);
  }
  v27 = 0.0;
  v28 = 0.0;
  if ((*(_DWORD *)(v26 + 24) & 0x80000000) != 0)
  {
    v29 = (_QWORD *)a3[14];
    v79 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
    __p = (void *)((uint64_t)(v29[1] - *v29) >> 2);
    if ((void *)v79 != __p)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v80);
      if (v80.__ptr_)
      {
        v30 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        dmlc::LogMessageFatal::Entry::Init(v30, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
        v31 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"Check failed: ", 14);
        v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"ndata == labels_upper_bound.Size()", 34);
        v34 = *((char *)v80.__ptr_ + 23);
        v35 = v34 >= 0 ? v80.__ptr_ : *(void **)v80.__ptr_;
        v36 = v34 >= 0 ? *((unsigned __int8 *)v80.__ptr_ + 23) : *((_QWORD *)v80.__ptr_ + 1);
        v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)v35, v36);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
        v38 = v80.__ptr_;
        v80.__ptr_ = 0;
        if (v38)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v80, (uint64_t)v38);
      }
    }
    v40 = (float **)a3[13];
    v39 = (float **)a3[14];
    v41 = (float **)a3[9];
    v42 = *a2;
    v80.__ptr_ = 0;
    std::vector<double>::vector(&__p, 1uLL, &v80);
    v74 = a4;
    v80.__ptr_ = 0;
    std::vector<double>::vector(&v75, 1uLL, &v80);
    v43 = v79;
    v80.__ptr_ = 0;
    v81.__m_.__sig = 850045863;
    memset(v81.__m_.__opaque, 0, sizeof(v81.__m_.__opaque));
    if (v79)
    {
      v44 = *v41;
      v45 = v41[1];
      v46 = *v40;
      v47 = *v39;
      v48 = *v42;
      v49 = v7[9];
      v50 = (long double *)__p;
      v51 = v44;
      v52 = (double *)v75;
      do
      {
        v53 = 1.0;
        if (v44 != v45)
          v53 = *v51;
        v54 = *v46;
        v55 = *v46;
        v56 = *v47;
        v57 = *v47;
        v58 = *v48;
        v59 = log(v55);
        v60 = log(v57);
        if (v54 == v56)
        {
          v61 = exp((v59 - v58) / v49 * ((v59 - v58) / v49) * -0.5) / 2.50662827 / (v49 * v55);
        }
        else
        {
          v62 = 1.0;
          if (fabs(v57) != INFINITY)
            v62 = (erf((v60 - v58) / v49 / 1.41421356) + 1.0) * 0.5;
          v63 = 0.0;
          if (v54 > 0.0)
            v63 = (erf((v59 - v58) / v49 / 1.41421356) + 1.0) * 0.5;
          v61 = v62 - v63;
        }
        *v50 = *v50 - log(fmax(v61, 1.0e-12)) * v53;
        ++v48;
        *v52 = v53 + *v52;
        ++v47;
        ++v46;
        ++v51;
        --v43;
      }
      while (v43);
    }
    dmlc::OMPException::Rethrow(&v80);
    std::mutex::~mutex(&v81);
    std::exception_ptr::~exception_ptr(&v80);
    a1 = (float *)__p;
    v28 = 0.0;
    v27 = 0.0;
    a4 = v74;
    if (__p != v78)
    {
      v64 = (double *)__p;
      do
      {
        v65 = *v64++;
        v27 = v27 + v65;
      }
      while (v64 != (double *)v78);
    }
    if ((double *)v75 != v76)
    {
      v28 = 0.0;
      v66 = (double *)v75;
      do
      {
        v67 = *v66++;
        v28 = v28 + v67;
      }
      while (v66 != v76);
    }
    if (v75)
    {
      v76 = (double *)v75;
      operator delete((void *)v75);
      a1 = (float *)__p;
    }
    if (a1)
    {
      v78 = a1;
      operator delete(a1);
    }
  }
  v80.__ptr_ = *(void **)&v27;
  *(double *)&v81.__m_.__sig = v28;
  if (a4)
  {
    Engine = rabit::engine::GetEngine((rabit::engine *)a1);
    (*(void (**)(void *, std::exception_ptr *, uint64_t, uint64_t, double (*)(double *, double *, int), _QWORD, _QWORD))(*(_QWORD *)Engine + 8))(Engine, &v80, 8, 2, rabit::op::Reducer<rabit::op::Sum,double>, 0, 0);
    v27 = *(double *)&v80.__ptr_;
    v28 = *(double *)&v81.__m_.__sig;
  }
  v69 = 1.0;
  if (v28 != 0.0)
    v69 = v28;
  return v27 / v69;
}

void sub_220F4E778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,std::exception_ptr a22)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a22);
  _Unwind_Resume(a1);
}

const char *xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::NormalDistribution>>::Name()
{
  return "aft-nloglik";
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::LogisticDistribution>>::~EvalEWiseSurvivalBase()
{
  JUMPOUT(0x227667068);
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::LogisticDistribution>>::Configure(uint64_t a1, uint64_t *a2)
{
  int v3;
  uint64_t v4;
  std::string *Entry;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8[3];
  void **v9;

  xgboost::XGBoostParameter<xgboost::common::AFTParam>::UpdateAllowUnknown<std::vector<std::pair<std::string,std::string>>>((xgboost::common::AFTParam *)(a1 + 16), a2, v8);
  v9 = (void **)v8;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](&v9);
  v3 = *(_DWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 36) = v3;
  if (!v4)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v8);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v6 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v8);
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v8);
  }
}

void sub_220F4E900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a9);
  _Unwind_Resume(a1);
}

double xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::LogisticDistribution>>::Eval(float *a1, float ***a2, _QWORD *a3, int a4)
{
  float *v7;
  std::string *Entry;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *ptr;
  std::string *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  int v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  _QWORD *v29;
  std::string *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  int v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  float **v39;
  float **v40;
  float **v41;
  float **v42;
  uint64_t v43;
  float *v44;
  float *v45;
  float *v46;
  float *v47;
  float *v48;
  double v49;
  long double *v50;
  double *v51;
  float *v52;
  double v53;
  float v54;
  long double v55;
  float v56;
  long double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double *v69;
  double v70;
  double *v71;
  double v72;
  void *Engine;
  double v74;
  std::string *v76;
  _QWORD *v77;
  _QWORD *v78;
  int v79;
  uint64_t v80;
  double *v81;
  void *__p;
  float *v83;
  uint64_t v84;
  std::exception_ptr v85;
  std::mutex v86;
  uint64_t v87;

  v7 = a1;
  v87 = *MEMORY[0x24BDAC8D0];
  __p = (void *)((*a2)[1] - **a2);
  v80 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
  if (__p != (void *)v80)
  {
    a1 = (float *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v85);
    if (v85.__ptr_)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: ", 14);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"preds.Size() == info.labels_lower_bound_.Size()", 47);
      v12 = *((char *)v85.__ptr_ + 23);
      v13 = v12 >= 0 ? v85.__ptr_ : *(void **)v85.__ptr_;
      v14 = v12 >= 0 ? *((unsigned __int8 *)v85.__ptr_ + 23) : *((_QWORD *)v85.__ptr_ + 1);
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v13, v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      ptr = v85.__ptr_;
      v85.__ptr_ = 0;
      if (ptr)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v85, (uint64_t)ptr);
    }
  }
  __p = (void *)((*a2)[1] - **a2);
  v80 = (uint64_t)(*(_QWORD *)(a3[14] + 8) - *(_QWORD *)a3[14]) >> 2;
  if (__p != (void *)v80)
  {
    a1 = (float *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v85);
    if (v85.__ptr_)
    {
      v17 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(v17, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v18 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Check failed: ", 14);
      v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"preds.Size() == info.labels_upper_bound_.Size()", 47);
      v21 = *((char *)v85.__ptr_ + 23);
      v22 = v21 >= 0 ? v85.__ptr_ : *(void **)v85.__ptr_;
      v23 = v21 >= 0 ? *((unsigned __int8 *)v85.__ptr_ + 23) : *((_QWORD *)v85.__ptr_ + 1);
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v22, v23);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      v25 = v85.__ptr_;
      v85.__ptr_ = 0;
      if (v25)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v85, (uint64_t)v25);
    }
  }
  v26 = *((_QWORD *)v7 + 1);
  if (!v26)
  {
    v76 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v85);
    dmlc::LogMessageFatal::Entry::Init(v76, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v77 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v85);
    v78 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v77, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v78, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v85);
    v26 = *((_QWORD *)v7 + 1);
  }
  v27 = 0.0;
  v28 = 0.0;
  if ((*(_DWORD *)(v26 + 24) & 0x80000000) != 0)
  {
    v29 = (_QWORD *)a3[14];
    v84 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
    __p = (void *)((uint64_t)(v29[1] - *v29) >> 2);
    if ((void *)v84 != __p)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v85);
      if (v85.__ptr_)
      {
        v30 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        dmlc::LogMessageFatal::Entry::Init(v30, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
        v31 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"Check failed: ", 14);
        v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"ndata == labels_upper_bound.Size()", 34);
        v34 = *((char *)v85.__ptr_ + 23);
        v35 = v34 >= 0 ? v85.__ptr_ : *(void **)v85.__ptr_;
        v36 = v34 >= 0 ? *((unsigned __int8 *)v85.__ptr_ + 23) : *((_QWORD *)v85.__ptr_ + 1);
        v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)v35, v36);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
        v38 = v85.__ptr_;
        v85.__ptr_ = 0;
        if (v38)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v85, (uint64_t)v38);
      }
    }
    v40 = (float **)a3[13];
    v39 = (float **)a3[14];
    v41 = (float **)a3[9];
    v42 = *a2;
    v85.__ptr_ = 0;
    std::vector<double>::vector(&__p, 1uLL, &v85);
    v79 = a4;
    v85.__ptr_ = 0;
    std::vector<double>::vector(&v80, 1uLL, &v85);
    v43 = v84;
    v85.__ptr_ = 0;
    v86.__m_.__sig = 850045863;
    memset(v86.__m_.__opaque, 0, sizeof(v86.__m_.__opaque));
    if (v84)
    {
      v44 = *v41;
      v45 = v41[1];
      v46 = *v40;
      v47 = *v39;
      v48 = *v42;
      v49 = v7[9];
      v50 = (long double *)__p;
      v51 = (double *)v80;
      v52 = v44;
      do
      {
        v53 = 1.0;
        if (v44 != v45)
          v53 = *v52;
        v54 = *v46;
        v55 = *v46;
        v56 = *v47;
        v57 = *v47;
        v58 = *v48;
        v59 = log(v55);
        v60 = log(v57);
        if (v54 == v56)
        {
          v61 = exp((v59 - v58) / v49);
          v62 = 0.0;
          if (v61 != INFINITY && v61 * v61 != INFINITY)
            v62 = v61 / ((v61 + 1.0) * (v61 + 1.0));
          v64 = v62 / (v49 * v55);
        }
        else
        {
          v65 = 1.0;
          if (fabs(v57) != INFINITY)
          {
            v66 = exp((v60 - v58) / v49);
            if (v66 != INFINITY)
              v65 = v66 / (v66 + 1.0);
          }
          v67 = 0.0;
          if (v54 > 0.0)
          {
            v68 = exp((v59 - v58) / v49);
            v67 = 1.0;
            if (v68 != INFINITY)
              v67 = v68 / (v68 + 1.0);
          }
          v64 = v65 - v67;
        }
        *v50 = *v50 - log(fmax(v64, 1.0e-12)) * v53;
        ++v48;
        *v51 = v53 + *v51;
        ++v47;
        ++v46;
        ++v52;
        --v43;
      }
      while (v43);
    }
    dmlc::OMPException::Rethrow(&v85);
    std::mutex::~mutex(&v86);
    std::exception_ptr::~exception_ptr(&v85);
    a1 = (float *)__p;
    v28 = 0.0;
    v27 = 0.0;
    if (__p != v83)
    {
      v69 = (double *)__p;
      do
      {
        v70 = *v69++;
        v27 = v27 + v70;
      }
      while (v69 != (double *)v83);
    }
    a4 = v79;
    if ((double *)v80 != v81)
    {
      v28 = 0.0;
      v71 = (double *)v80;
      do
      {
        v72 = *v71++;
        v28 = v28 + v72;
      }
      while (v71 != v81);
    }
    if (v80)
    {
      v81 = (double *)v80;
      operator delete((void *)v80);
      a1 = (float *)__p;
    }
    if (a1)
    {
      v83 = a1;
      operator delete(a1);
    }
  }
  v85.__ptr_ = *(void **)&v27;
  *(double *)&v86.__m_.__sig = v28;
  if (a4)
  {
    Engine = rabit::engine::GetEngine((rabit::engine *)a1);
    (*(void (**)(void *, std::exception_ptr *, uint64_t, uint64_t, double (*)(double *, double *, int), _QWORD, _QWORD))(*(_QWORD *)Engine + 8))(Engine, &v85, 8, 2, rabit::op::Reducer<rabit::op::Sum,double>, 0, 0);
    v27 = *(double *)&v85.__ptr_;
    v28 = *(double *)&v86.__m_.__sig;
  }
  v74 = 1.0;
  if (v28 != 0.0)
    v74 = v28;
  return v27 / v74;
}

void sub_220F4EF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, std::exception_ptr a20)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a20);
  _Unwind_Resume(a1);
}

const char *xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::LogisticDistribution>>::Name()
{
  return "aft-nloglik";
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::ExtremeDistribution>>::~EvalEWiseSurvivalBase()
{
  JUMPOUT(0x227667068);
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::ExtremeDistribution>>::Configure(uint64_t a1, uint64_t *a2)
{
  int v3;
  uint64_t v4;
  std::string *Entry;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8[3];
  void **v9;

  xgboost::XGBoostParameter<xgboost::common::AFTParam>::UpdateAllowUnknown<std::vector<std::pair<std::string,std::string>>>((xgboost::common::AFTParam *)(a1 + 16), a2, v8);
  v9 = (void **)v8;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](&v9);
  v3 = *(_DWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 36) = v3;
  if (!v4)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v8);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v6 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v8);
    v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v8);
  }
}

void sub_220F4F0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a9);
  _Unwind_Resume(a1);
}

double xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::ExtremeDistribution>>::Eval(float *a1, float ***a2, _QWORD *a3, int a4)
{
  float *v7;
  std::string *Entry;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *ptr;
  std::string *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  int v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  _QWORD *v29;
  std::string *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  int v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  float **v39;
  float **v40;
  float **v41;
  float **v42;
  uint64_t v43;
  float *v44;
  float *v45;
  float *v46;
  float *v47;
  float *v48;
  double v49;
  long double *v50;
  double *v51;
  float *v52;
  double v53;
  float v54;
  long double v55;
  float v56;
  long double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  long double v65;
  double v66;
  long double v67;
  double *v68;
  double v69;
  double *v70;
  double v71;
  void *Engine;
  double v73;
  std::string *v75;
  _QWORD *v76;
  _QWORD *v77;
  int v78;
  uint64_t v79;
  double *v80;
  void *__p;
  float *v82;
  uint64_t v83;
  std::exception_ptr v84;
  std::mutex v85;
  uint64_t v86;

  v7 = a1;
  v86 = *MEMORY[0x24BDAC8D0];
  __p = (void *)((*a2)[1] - **a2);
  v79 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
  if (__p != (void *)v79)
  {
    a1 = (float *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v84);
    if (v84.__ptr_)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: ", 14);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"preds.Size() == info.labels_lower_bound_.Size()", 47);
      v12 = *((char *)v84.__ptr_ + 23);
      v13 = v12 >= 0 ? v84.__ptr_ : *(void **)v84.__ptr_;
      v14 = v12 >= 0 ? *((unsigned __int8 *)v84.__ptr_ + 23) : *((_QWORD *)v84.__ptr_ + 1);
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v13, v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      ptr = v84.__ptr_;
      v84.__ptr_ = 0;
      if (ptr)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v84, (uint64_t)ptr);
    }
  }
  __p = (void *)((*a2)[1] - **a2);
  v79 = (uint64_t)(*(_QWORD *)(a3[14] + 8) - *(_QWORD *)a3[14]) >> 2;
  if (__p != (void *)v79)
  {
    a1 = (float *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v84);
    if (v84.__ptr_)
    {
      v17 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(v17, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v18 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Check failed: ", 14);
      v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"preds.Size() == info.labels_upper_bound_.Size()", 47);
      v21 = *((char *)v84.__ptr_ + 23);
      v22 = v21 >= 0 ? v84.__ptr_ : *(void **)v84.__ptr_;
      v23 = v21 >= 0 ? *((unsigned __int8 *)v84.__ptr_ + 23) : *((_QWORD *)v84.__ptr_ + 1);
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v22, v23);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      v25 = v84.__ptr_;
      v84.__ptr_ = 0;
      if (v25)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v84, (uint64_t)v25);
    }
  }
  v26 = *((_QWORD *)v7 + 1);
  if (!v26)
  {
    v75 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v84);
    dmlc::LogMessageFatal::Entry::Init(v75, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v76 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v84);
    v77 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v76, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v77, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v84);
    v26 = *((_QWORD *)v7 + 1);
  }
  v27 = 0.0;
  v28 = 0.0;
  if ((*(_DWORD *)(v26 + 24) & 0x80000000) != 0)
  {
    v29 = (_QWORD *)a3[14];
    v83 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
    __p = (void *)((uint64_t)(v29[1] - *v29) >> 2);
    if ((void *)v83 != __p)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v84);
      if (v84.__ptr_)
      {
        v30 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        dmlc::LogMessageFatal::Entry::Init(v30, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
        v31 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"Check failed: ", 14);
        v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"ndata == labels_upper_bound.Size()", 34);
        v34 = *((char *)v84.__ptr_ + 23);
        v35 = v34 >= 0 ? v84.__ptr_ : *(void **)v84.__ptr_;
        v36 = v34 >= 0 ? *((unsigned __int8 *)v84.__ptr_ + 23) : *((_QWORD *)v84.__ptr_ + 1);
        v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)v35, v36);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
        v38 = v84.__ptr_;
        v84.__ptr_ = 0;
        if (v38)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v84, (uint64_t)v38);
      }
    }
    v40 = (float **)a3[13];
    v39 = (float **)a3[14];
    v41 = (float **)a3[9];
    v42 = *a2;
    v84.__ptr_ = 0;
    std::vector<double>::vector(&__p, 1uLL, &v84);
    v78 = a4;
    v84.__ptr_ = 0;
    std::vector<double>::vector(&v79, 1uLL, &v84);
    v43 = v83;
    v84.__ptr_ = 0;
    v85.__m_.__sig = 850045863;
    memset(v85.__m_.__opaque, 0, sizeof(v85.__m_.__opaque));
    if (v83)
    {
      v44 = *v41;
      v45 = v41[1];
      v46 = *v40;
      v47 = *v39;
      v48 = *v42;
      v49 = v7[9];
      v50 = (long double *)__p;
      v51 = (double *)v79;
      v52 = v44;
      do
      {
        v53 = 1.0;
        if (v44 != v45)
          v53 = *v52;
        v54 = *v46;
        v55 = *v46;
        v56 = *v47;
        v57 = *v47;
        v58 = *v48;
        v59 = log(v55);
        v60 = log(v57);
        if (v54 == v56)
        {
          v61 = exp((v59 - v58) / v49);
          v62 = 0.0;
          if (v61 != INFINITY)
            v62 = v61 * exp(-v61);
          v63 = v62 / (v49 * v55);
        }
        else
        {
          v64 = 1.0;
          if (fabs(v57) != INFINITY)
          {
            v65 = exp((v60 - v58) / v49);
            v64 = 1.0 - exp(-v65);
          }
          v66 = 0.0;
          if (v54 > 0.0)
          {
            v67 = exp((v59 - v58) / v49);
            v66 = 1.0 - exp(-v67);
          }
          v63 = v64 - v66;
        }
        *v50 = *v50 - log(fmax(v63, 1.0e-12)) * v53;
        ++v48;
        *v51 = v53 + *v51;
        ++v47;
        ++v46;
        ++v52;
        --v43;
      }
      while (v43);
    }
    dmlc::OMPException::Rethrow(&v84);
    std::mutex::~mutex(&v85);
    std::exception_ptr::~exception_ptr(&v84);
    a1 = (float *)__p;
    v28 = 0.0;
    v27 = 0.0;
    if (__p != v82)
    {
      v68 = (double *)__p;
      do
      {
        v69 = *v68++;
        v27 = v27 + v69;
      }
      while (v68 != (double *)v82);
    }
    a4 = v78;
    if ((double *)v79 != v80)
    {
      v28 = 0.0;
      v70 = (double *)v79;
      do
      {
        v71 = *v70++;
        v28 = v28 + v71;
      }
      while (v70 != v80);
    }
    if (v79)
    {
      v80 = (double *)v79;
      operator delete((void *)v79);
      a1 = (float *)__p;
    }
    if (a1)
    {
      v82 = a1;
      operator delete(a1);
    }
  }
  v84.__ptr_ = *(void **)&v27;
  *(double *)&v85.__m_.__sig = v28;
  if (a4)
  {
    Engine = rabit::engine::GetEngine((rabit::engine *)a1);
    (*(void (**)(void *, std::exception_ptr *, uint64_t, uint64_t, double (*)(double *, double *, int), _QWORD, _QWORD))(*(_QWORD *)Engine + 8))(Engine, &v84, 8, 2, rabit::op::Reducer<rabit::op::Sum,double>, 0, 0);
    v27 = *(double *)&v84.__ptr_;
    v28 = *(double *)&v85.__m_.__sig;
  }
  v73 = 1.0;
  if (v28 != 0.0)
    v73 = v28;
  return v27 / v73;
}

void sub_220F4F6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, std::exception_ptr a20)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a20);
  _Unwind_Resume(a1);
}

const char *xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalAFTNLogLik<xgboost::common::ExtremeDistribution>>::Name()
{
  return "aft-nloglik";
}

uint64_t std::__function::__func<xgboost::metric::$_1,std::allocator<xgboost::metric::$_1>,xgboost::Metric * ()(char const*)>::operator()()
{
  uint64_t result;

  result = operator new();
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)result = &off_24E6BEB48;
  *(_DWORD *)(result + 20) = -1;
  return result;
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalIntervalRegressionAccuracy>::~EvalEWiseSurvivalBase()
{
  JUMPOUT(0x227667068);
}

void xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalIntervalRegressionAccuracy>::Configure(uint64_t a1)
{
  std::string *Entry;
  _QWORD *v2;
  _QWORD *v3;
  char v4;

  if (!*(_QWORD *)(a1 + 8))
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v4);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v2 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v4);
    v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v4);
  }
}

void sub_220F4F8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

double xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalIntervalRegressionAccuracy>::Eval(_QWORD *a1, float ***a2, _QWORD *a3, int a4)
{
  _QWORD *v7;
  std::string *Entry;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *ptr;
  std::string *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  int v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  _QWORD *v29;
  std::string *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  int v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  float **v39;
  float **v40;
  float **v41;
  float **v42;
  uint64_t v43;
  float *v44;
  float *v45;
  float *v46;
  float *v47;
  float *v48;
  double *v49;
  double *v50;
  float *v51;
  double v52;
  float v53;
  double v54;
  float v55;
  double v56;
  float v57;
  double v58;
  double v60;
  double *v61;
  double v62;
  double *v63;
  double v64;
  void *Engine;
  double v66;
  std::string *v68;
  _QWORD *v69;
  _QWORD *v70;
  int v71;
  uint64_t v72;
  double *v73;
  void *__p;
  void *v75;
  uint64_t v76;
  std::exception_ptr v77;
  std::mutex v78;
  uint64_t v79;

  v7 = a1;
  v79 = *MEMORY[0x24BDAC8D0];
  __p = (void *)((*a2)[1] - **a2);
  v72 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
  if (__p != (void *)v72)
  {
    a1 = (_QWORD *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v77);
    if (v77.__ptr_)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: ", 14);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"preds.Size() == info.labels_lower_bound_.Size()", 47);
      v12 = *((char *)v77.__ptr_ + 23);
      v13 = v12 >= 0 ? v77.__ptr_ : *(void **)v77.__ptr_;
      v14 = v12 >= 0 ? *((unsigned __int8 *)v77.__ptr_ + 23) : *((_QWORD *)v77.__ptr_ + 1);
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v13, v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      ptr = v77.__ptr_;
      v77.__ptr_ = 0;
      if (ptr)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v77, (uint64_t)ptr);
    }
  }
  __p = (void *)((*a2)[1] - **a2);
  v72 = (uint64_t)(*(_QWORD *)(a3[14] + 8) - *(_QWORD *)a3[14]) >> 2;
  if (__p != (void *)v72)
  {
    a1 = (_QWORD *)dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v77);
    if (v77.__ptr_)
    {
      v17 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(v17, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
      v18 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"Check failed: ", 14);
      v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"preds.Size() == info.labels_upper_bound_.Size()", 47);
      v21 = *((char *)v77.__ptr_ + 23);
      v22 = v21 >= 0 ? v77.__ptr_ : *(void **)v77.__ptr_;
      v23 = v21 >= 0 ? *((unsigned __int8 *)v77.__ptr_ + 23) : *((_QWORD *)v77.__ptr_ + 1);
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v22, v23);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      v25 = v77.__ptr_;
      v77.__ptr_ = 0;
      if (v25)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v77, (uint64_t)v25);
    }
  }
  v26 = v7[1];
  if (!v26)
  {
    v68 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v77);
    dmlc::LogMessageFatal::Entry::Init(v68, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
    v69 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v77);
    v70 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v69, (uint64_t)"Check failed: tparam_", 21);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v70, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v77);
    v26 = v7[1];
  }
  v27 = 0.0;
  v28 = 0.0;
  if ((*(_DWORD *)(v26 + 24) & 0x80000000) != 0)
  {
    v29 = (_QWORD *)a3[14];
    v76 = (uint64_t)(*(_QWORD *)(a3[13] + 8) - *(_QWORD *)a3[13]) >> 2;
    __p = (void *)((uint64_t)(v29[1] - *v29) >> 2);
    if ((void *)v76 != __p)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)&v77);
      if (v77.__ptr_)
      {
        v30 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        dmlc::LogMessageFatal::Entry::Init(v30, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/metric/survival_metric.cu");
        v31 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
        v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"Check failed: ", 14);
        v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"ndata == labels_upper_bound.Size()", 34);
        v34 = *((char *)v77.__ptr_ + 23);
        v35 = v34 >= 0 ? v77.__ptr_ : *(void **)v77.__ptr_;
        v36 = v34 >= 0 ? *((unsigned __int8 *)v77.__ptr_ + 23) : *((_QWORD *)v77.__ptr_ + 1);
        v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)v35, v36);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
        v38 = v77.__ptr_;
        v77.__ptr_ = 0;
        if (v38)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v77, (uint64_t)v38);
      }
    }
    v39 = (float **)a3[13];
    v40 = (float **)a3[14];
    v41 = (float **)a3[9];
    v42 = *a2;
    v77.__ptr_ = 0;
    std::vector<double>::vector(&__p, 1uLL, &v77);
    v71 = a4;
    v77.__ptr_ = 0;
    std::vector<double>::vector(&v72, 1uLL, &v77);
    v43 = v76;
    v77.__ptr_ = 0;
    v78.__m_.__sig = 850045863;
    memset(v78.__m_.__opaque, 0, sizeof(v78.__m_.__opaque));
    if (v76)
    {
      v44 = *v41;
      v45 = v41[1];
      v46 = *v39;
      v47 = *v40;
      v48 = *v42;
      v49 = (double *)__p;
      v50 = (double *)v72;
      v51 = *v41;
      do
      {
        v52 = 1.0;
        if (v44 != v45)
          v52 = *v51;
        v53 = *v46++;
        v54 = v53;
        v55 = *v47++;
        v56 = v55;
        v57 = *v48++;
        v58 = exp(v57);
        if (v58 > v56 || v58 < v54)
          v60 = 0.0;
        else
          v60 = 1.0;
        *v49 = *v49 + v60 * v52;
        *v50 = v52 + *v50;
        ++v51;
        --v43;
      }
      while (v43);
    }
    dmlc::OMPException::Rethrow(&v77);
    std::mutex::~mutex(&v78);
    std::exception_ptr::~exception_ptr(&v77);
    a1 = __p;
    v28 = 0.0;
    v27 = 0.0;
    a4 = v71;
    if (__p != v75)
    {
      v61 = (double *)__p;
      do
      {
        v62 = *v61++;
        v27 = v27 + v62;
      }
      while (v61 != v75);
    }
    if ((double *)v72 != v73)
    {
      v28 = 0.0;
      v63 = (double *)v72;
      do
      {
        v64 = *v63++;
        v28 = v28 + v64;
      }
      while (v63 != v73);
    }
    if (v72)
    {
      v73 = (double *)v72;
      operator delete((void *)v72);
      a1 = __p;
    }
    if (a1)
    {
      v75 = a1;
      operator delete(a1);
    }
  }
  v77.__ptr_ = *(void **)&v27;
  *(double *)&v78.__m_.__sig = v28;
  if (a4)
  {
    Engine = rabit::engine::GetEngine((rabit::engine *)a1);
    (*(void (**)(void *, std::exception_ptr *, uint64_t, uint64_t, double (*)(double *, double *, int), _QWORD, _QWORD))(*(_QWORD *)Engine + 8))(Engine, &v77, 8, 2, rabit::op::Reducer<rabit::op::Sum,double>, 0, 0);
    v27 = *(double *)&v77.__ptr_;
    v28 = *(double *)&v78.__m_.__sig;
  }
  v66 = 1.0;
  if (v28 != 0.0)
    v66 = v28;
  return v27 / v66;
}

void sub_220F4FE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, std::exception_ptr a18)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a18);
  _Unwind_Resume(a1);
}

const char *xgboost::metric::EvalEWiseSurvivalBase<xgboost::metric::EvalIntervalRegressionAccuracy>::Name()
{
  return "interval-regression-accuracy";
}

void xgboost::tree::CPUHistMakerTrainParam::__DECLARE__(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void **v4;
  std::string __p;
  std::string __str;

  std::string::basic_string[abi:ne180100]<0>(&__p, "single_precision_histogram");
  v3 = operator new();
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)v3 = 0u;
  *(_QWORD *)v3 = &unk_24E6BBA60;
  std::string::operator=((std::string *)(v3 + 24), &__p);
  if (*(char *)(v3 + 71) < 0)
  {
    if (*(_QWORD *)(v3 + 56))
      goto LABEL_8;
  }
  else if (*(_BYTE *)(v3 + 71))
  {
    goto LABEL_8;
  }
  std::string::basic_string[abi:ne180100]<0>(&__str, "BOOLean");
  v4 = (void **)(v3 + 48);
  if (*(char *)(v3 + 71) < 0)
    operator delete(*v4);
  *(_OWORD *)v4 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
  *(_QWORD *)(v3 + 64) = *((_QWORD *)&__str.__r_.__value_.__l + 2);
LABEL_8:
  *(_QWORD *)(v3 + 96) = 1;
  dmlc::parameter::ParamManager::AddEntry(a2, (const void **)&__p.__r_.__value_.__l.__data_, v3);
  *(_BYTE *)(v3 + 104) = 0;
  *(_BYTE *)(v3 + 8) = 1;
  std::string::basic_string[abi:ne180100]<0>(&__str, "Use single precision to build histograms.");
  std::string::operator=((std::string *)(v3 + 72), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_220F50044(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

char *XGBGetLastError()
{
  uint64_t (*v0)(_QWORD);
  char *result;
  _QWORD *v2;

  {
    v2 = (_QWORD *)dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst(&dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst);
    *v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
    _tlv_atexit((void (__cdecl *)(void *))XGBAPIErrorEntry::~XGBAPIErrorEntry, v2);
  }
  result = (char *)dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst(&dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst);
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

void XGBAPISetLastError(const char *a1)
{
  uint64_t (*v1)(_QWORD);
  _QWORD *v2;

  {
    v2 = (_QWORD *)dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst(&dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst);
    *v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
    _tlv_atexit((void (__cdecl *)(void *))XGBAPIErrorEntry::~XGBAPIErrorEntry, v2);
  }
  dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst(&dmlc::ThreadLocalStore<XGBAPIErrorEntry>::Get(void)::inst);
  JUMPOUT(0x227666C18);
}

void XGBAPIErrorEntry::~XGBAPIErrorEntry(void **this)
{
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

uint64_t xgboost::data::__dmlc_registry_file_tag_sparse_page_raw_format__(xgboost::data *this)
{
  return 0;
}

void std::__function::__func<xgboost::data::$_0,std::allocator<xgboost::data::$_0>,xgboost::data::SparsePageFormat<xgboost::SparsePage> * ()(void)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<xgboost::data::$_0,std::allocator<xgboost::data::$_0>,xgboost::data::SparsePageFormat<xgboost::SparsePage> * ()(void)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24E6BEBB8;
  return result;
}

void std::__function::__func<xgboost::data::$_0,std::allocator<xgboost::data::$_0>,xgboost::data::SparsePageFormat<xgboost::SparsePage> * ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24E6BEBB8;
}

_QWORD *std::__function::__func<xgboost::data::$_0,std::allocator<xgboost::data::$_0>,xgboost::data::SparsePageFormat<xgboost::SparsePage> * ()(void)>::operator()()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_24E6BEC38;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  return result;
}

uint64_t std::__function::__func<xgboost::data::$_0,std::allocator<xgboost::data::$_0>,xgboost::data::SparsePageFormat<xgboost::SparsePage> * ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<xgboost::data::$_0,std::allocator<xgboost::data::$_0>,xgboost::data::SparsePageFormat<xgboost::SparsePage> * ()(void)>::target_type()
{
}

_QWORD *xgboost::data::SparsePageRawFormat<xgboost::SparsePage>::~SparsePageRawFormat(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24E6BEC38;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void xgboost::data::SparsePageRawFormat<xgboost::SparsePage>::~SparsePageRawFormat(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24E6BEC38;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x227667068);
}

uint64_t xgboost::data::SparsePageRawFormat<xgboost::SparsePage>::Read(uint64_t a1, uint64_t **a2, uint64_t (***a3)(_QWORD, unint64_t *, uint64_t))
{
  unint64_t **v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  std::string *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  std::string *Entry;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v5 = (unint64_t **)*a2;
  v37 = 0;
  if ((**a3)(a3, &v37, 8) != 8)
    return 0;
  v6 = v37;
  std::vector<unsigned long>::resize((uint64_t)v5, v37);
  if (v37)
  {
    if ((**a3)(a3, *v5, 8 * v6) != 8 * v6)
      return 0;
  }
  v7 = a2[1];
  v8 = **a2;
  v9 = (*a2)[1];
  LODWORD(v35) = 0;
  v10 = v9 - v8;
  v36 = v10 >> 3;
  if (!v10)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned int>((uint64_t *)&v37);
    if (v37)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v36);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
      v26 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v36);
      v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"Check failed: ", 14);
      v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"page->offset.Size() != 0U", 25);
      v29 = *(char *)(v37 + 23);
      v30 = v29 >= 0 ? v37 : *(_QWORD *)v37;
      v31 = v29 >= 0 ? *(unsigned __int8 *)(v37 + 23) : *(_QWORD *)(v37 + 8);
      v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, v30, v31);
      v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)"Invalid SparsePage file", 23);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v36);
      v34 = v37;
      v37 = 0;
      if (v34)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v37, v34);
    }
  }
  std::vector<xgboost::Entry>::resize((uint64_t)v7, *(v5[1] - 1));
  v11 = *a2[1];
  v12 = a2[1][1];
  if (v12 != v11)
  {
    v13 = v7[1] == *v7 ? 0 : (unint64_t *)*v7;
    v37 = (**a3)(a3, v13, v12 - v11);
    v35 = a2[1][1] - *a2[1];
    if (v37 != v35)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>(&v36);
      if (v36)
      {
        v14 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v35);
        dmlc::LogMessageFatal::Entry::Init(v14, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
        v15 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v35);
        v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"Check failed: ", 14);
        v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"n_bytes == (page->data).Size() * sizeof(Entry)", 46);
        v18 = *(char *)(v36 + 23);
        if (v18 >= 0)
          v19 = v36;
        else
          v19 = *(_QWORD *)v36;
        if (v18 >= 0)
          v20 = *(unsigned __int8 *)(v36 + 23);
        else
          v20 = *(_QWORD *)(v36 + 8);
        v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, v19, v20);
        v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)": ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"Invalid SparsePage file", 23);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v35);
        v23 = v36;
        v36 = 0;
        if (v23)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v36, v23);
      }
    }
  }
  (**a3)(a3, (unint64_t *)a2 + 2, 8);
  return 1;
}

void sub_220F505D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13;

  v13 = a11;
  a11 = 0;
  if (v13)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a11, v13);
  _Unwind_Resume(exception_object);
}

unint64_t xgboost::data::SparsePageRawFormat<xgboost::SparsePage>::Write(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  std::string *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::string *Entry;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = (uint64_t **)*a2;
  v6 = a2[1];
  v8 = (uint64_t *)**a2;
  v7 = (uint64_t *)(*a2)[1];
  if (v7 == v8 || (v9 = *v8, v10 = a2[1], v9))
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
    v28 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
    v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)"Check failed: page.offset.Size() != 0 && offset_vec[0] == 0", 59);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v31);
    v7 = v5[1];
    v10 = a2[1];
  }
  v30 = (v10[1] - *v10) >> 3;
  if (*(v7 - 1) != v30)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned long>(&v31);
    if (v31)
    {
      v11 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v30);
      dmlc::LogMessageFatal::Entry::Init(v11, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
      v12 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v30);
      v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"Check failed: ", 14);
      v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"offset_vec.back() == page.data.Size()", 37);
      v15 = *(char *)(v31 + 23);
      v16 = v15 >= 0 ? v31 : *(_QWORD *)v31;
      v17 = v15 >= 0 ? *(unsigned __int8 *)(v31 + 23) : *(_QWORD *)(v31 + 8);
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, v16, v17);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v30);
      v19 = v31;
      v31 = 0;
      if (v19)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v31, v19);
    }
  }
  v31 = v5[1] - *v5;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a3 + 8))(a3, &v31, 8);
  if (v31)
    (*(void (**)(uint64_t, uint64_t *, int64_t))(*(_QWORD *)a3 + 8))(a3, *v5, (char *)v5[1] - (char *)*v5);
  v21 = **a2;
  v20 = (*a2)[1];
  v23 = *a2[1];
  v22 = a2[1][1];
  v24 = v22 - v23;
  if (v22 != v23)
  {
    if (v6[1] == *v6)
      v25 = 0;
    else
      v25 = *v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a3 + 8))(a3, v25, v24);
  }
  (*(void (**)(uint64_t, uint64_t **, uint64_t))(*(_QWORD *)a3 + 8))(a3, a2 + 2, 8);
  return ((v20 - v21 + v24) & 0xFFFFFFFFFFFFFFF8) + 16;
}

void sub_220F50838(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<xgboost::data::$_1,std::allocator<xgboost::data::$_1>,xgboost::data::SparsePageFormat<xgboost::CSCPage> * ()(void)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<xgboost::data::$_1,std::allocator<xgboost::data::$_1>,xgboost::data::SparsePageFormat<xgboost::CSCPage> * ()(void)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24E6BECA0;
  return result;
}

void std::__function::__func<xgboost::data::$_1,std::allocator<xgboost::data::$_1>,xgboost::data::SparsePageFormat<xgboost::CSCPage> * ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24E6BECA0;
}

_QWORD *std::__function::__func<xgboost::data::$_1,std::allocator<xgboost::data::$_1>,xgboost::data::SparsePageFormat<xgboost::CSCPage> * ()(void)>::operator()()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_24E6BED20;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  return result;
}

uint64_t std::__function::__func<xgboost::data::$_1,std::allocator<xgboost::data::$_1>,xgboost::data::SparsePageFormat<xgboost::CSCPage> * ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<xgboost::data::$_1,std::allocator<xgboost::data::$_1>,xgboost::data::SparsePageFormat<xgboost::CSCPage> * ()(void)>::target_type()
{
}

_QWORD *xgboost::data::SparsePageRawFormat<xgboost::CSCPage>::~SparsePageRawFormat(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24E6BED20;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void xgboost::data::SparsePageRawFormat<xgboost::CSCPage>::~SparsePageRawFormat(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24E6BED20;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x227667068);
}

uint64_t xgboost::data::SparsePageRawFormat<xgboost::CSCPage>::Read(uint64_t a1, uint64_t **a2, uint64_t (***a3)(_QWORD, unint64_t *, uint64_t))
{
  unint64_t **v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  std::string *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  std::string *Entry;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v5 = (unint64_t **)*a2;
  v37 = 0;
  if ((**a3)(a3, &v37, 8) != 8)
    return 0;
  v6 = v37;
  std::vector<unsigned long>::resize((uint64_t)v5, v37);
  if (v37)
  {
    if ((**a3)(a3, *v5, 8 * v6) != 8 * v6)
      return 0;
  }
  v7 = a2[1];
  v8 = **a2;
  v9 = (*a2)[1];
  LODWORD(v35) = 0;
  v10 = v9 - v8;
  v36 = v10 >> 3;
  if (!v10)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned int>((uint64_t *)&v37);
    if (v37)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v36);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
      v26 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v36);
      v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"Check failed: ", 14);
      v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"page->offset.Size() != 0U", 25);
      v29 = *(char *)(v37 + 23);
      v30 = v29 >= 0 ? v37 : *(_QWORD *)v37;
      v31 = v29 >= 0 ? *(unsigned __int8 *)(v37 + 23) : *(_QWORD *)(v37 + 8);
      v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, v30, v31);
      v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)"Invalid SparsePage file", 23);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v36);
      v34 = v37;
      v37 = 0;
      if (v34)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v37, v34);
    }
  }
  std::vector<xgboost::Entry>::resize((uint64_t)v7, *(v5[1] - 1));
  v11 = *a2[1];
  v12 = a2[1][1];
  if (v12 != v11)
  {
    v13 = v7[1] == *v7 ? 0 : (unint64_t *)*v7;
    v37 = (**a3)(a3, v13, v12 - v11);
    v35 = a2[1][1] - *a2[1];
    if (v37 != v35)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>(&v36);
      if (v36)
      {
        v14 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v35);
        dmlc::LogMessageFatal::Entry::Init(v14, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
        v15 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v35);
        v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"Check failed: ", 14);
        v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"n_bytes == (page->data).Size() * sizeof(Entry)", 46);
        v18 = *(char *)(v36 + 23);
        if (v18 >= 0)
          v19 = v36;
        else
          v19 = *(_QWORD *)v36;
        if (v18 >= 0)
          v20 = *(unsigned __int8 *)(v36 + 23);
        else
          v20 = *(_QWORD *)(v36 + 8);
        v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, v19, v20);
        v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)": ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"Invalid SparsePage file", 23);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v35);
        v23 = v36;
        v36 = 0;
        if (v23)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v36, v23);
      }
    }
  }
  (**a3)(a3, (unint64_t *)a2 + 2, 8);
  return 1;
}

void sub_220F50C68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13;

  v13 = a11;
  a11 = 0;
  if (v13)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a11, v13);
  _Unwind_Resume(exception_object);
}

unint64_t xgboost::data::SparsePageRawFormat<xgboost::CSCPage>::Write(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  std::string *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::string *Entry;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = (uint64_t **)*a2;
  v6 = a2[1];
  v8 = (uint64_t *)**a2;
  v7 = (uint64_t *)(*a2)[1];
  if (v7 == v8 || (v9 = *v8, v10 = a2[1], v9))
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
    v28 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
    v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)"Check failed: page.offset.Size() != 0 && offset_vec[0] == 0", 59);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v31);
    v7 = v5[1];
    v10 = a2[1];
  }
  v30 = (v10[1] - *v10) >> 3;
  if (*(v7 - 1) != v30)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned long>(&v31);
    if (v31)
    {
      v11 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v30);
      dmlc::LogMessageFatal::Entry::Init(v11, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
      v12 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v30);
      v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"Check failed: ", 14);
      v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"offset_vec.back() == page.data.Size()", 37);
      v15 = *(char *)(v31 + 23);
      v16 = v15 >= 0 ? v31 : *(_QWORD *)v31;
      v17 = v15 >= 0 ? *(unsigned __int8 *)(v31 + 23) : *(_QWORD *)(v31 + 8);
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, v16, v17);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v30);
      v19 = v31;
      v31 = 0;
      if (v19)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v31, v19);
    }
  }
  v31 = v5[1] - *v5;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a3 + 8))(a3, &v31, 8);
  if (v31)
    (*(void (**)(uint64_t, uint64_t *, int64_t))(*(_QWORD *)a3 + 8))(a3, *v5, (char *)v5[1] - (char *)*v5);
  v21 = **a2;
  v20 = (*a2)[1];
  v23 = *a2[1];
  v22 = a2[1][1];
  v24 = v22 - v23;
  if (v22 != v23)
  {
    if (v6[1] == *v6)
      v25 = 0;
    else
      v25 = *v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a3 + 8))(a3, v25, v24);
  }
  (*(void (**)(uint64_t, uint64_t **, uint64_t))(*(_QWORD *)a3 + 8))(a3, a2 + 2, 8);
  return ((v20 - v21 + v24) & 0xFFFFFFFFFFFFFFF8) + 16;
}

void sub_220F50ECC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<xgboost::data::$_2,std::allocator<xgboost::data::$_2>,xgboost::data::SparsePageFormat<xgboost::SortedCSCPage> * ()(void)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<xgboost::data::$_2,std::allocator<xgboost::data::$_2>,xgboost::data::SparsePageFormat<xgboost::SortedCSCPage> * ()(void)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24E6BED88;
  return result;
}

void std::__function::__func<xgboost::data::$_2,std::allocator<xgboost::data::$_2>,xgboost::data::SparsePageFormat<xgboost::SortedCSCPage> * ()(void)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24E6BED88;
}

_QWORD *std::__function::__func<xgboost::data::$_2,std::allocator<xgboost::data::$_2>,xgboost::data::SparsePageFormat<xgboost::SortedCSCPage> * ()(void)>::operator()()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_24E6BEE08;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  return result;
}

uint64_t std::__function::__func<xgboost::data::$_2,std::allocator<xgboost::data::$_2>,xgboost::data::SparsePageFormat<xgboost::SortedCSCPage> * ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<xgboost::data::$_2,std::allocator<xgboost::data::$_2>,xgboost::data::SparsePageFormat<xgboost::SortedCSCPage> * ()(void)>::target_type()
{
}

_QWORD *xgboost::data::SparsePageRawFormat<xgboost::SortedCSCPage>::~SparsePageRawFormat(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24E6BEE08;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void xgboost::data::SparsePageRawFormat<xgboost::SortedCSCPage>::~SparsePageRawFormat(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24E6BEE08;
  v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x227667068);
}

uint64_t xgboost::data::SparsePageRawFormat<xgboost::SortedCSCPage>::Read(uint64_t a1, uint64_t **a2, uint64_t (***a3)(_QWORD, unint64_t *, uint64_t))
{
  unint64_t **v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  std::string *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  std::string *Entry;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v5 = (unint64_t **)*a2;
  v37 = 0;
  if ((**a3)(a3, &v37, 8) != 8)
    return 0;
  v6 = v37;
  std::vector<unsigned long>::resize((uint64_t)v5, v37);
  if (v37)
  {
    if ((**a3)(a3, *v5, 8 * v6) != 8 * v6)
      return 0;
  }
  v7 = a2[1];
  v8 = **a2;
  v9 = (*a2)[1];
  LODWORD(v35) = 0;
  v10 = v9 - v8;
  v36 = v10 >> 3;
  if (!v10)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned int>((uint64_t *)&v37);
    if (v37)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v36);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
      v26 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v36);
      v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"Check failed: ", 14);
      v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"page->offset.Size() != 0U", 25);
      v29 = *(char *)(v37 + 23);
      v30 = v29 >= 0 ? v37 : *(_QWORD *)v37;
      v31 = v29 >= 0 ? *(unsigned __int8 *)(v37 + 23) : *(_QWORD *)(v37 + 8);
      v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, v30, v31);
      v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)"Invalid SparsePage file", 23);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v36);
      v34 = v37;
      v37 = 0;
      if (v34)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v37, v34);
    }
  }
  std::vector<xgboost::Entry>::resize((uint64_t)v7, *(v5[1] - 1));
  v11 = *a2[1];
  v12 = a2[1][1];
  if (v12 != v11)
  {
    v13 = v7[1] == *v7 ? 0 : (unint64_t *)*v7;
    v37 = (**a3)(a3, v13, v12 - v11);
    v35 = a2[1][1] - *a2[1];
    if (v37 != v35)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned long>(&v36);
      if (v36)
      {
        v14 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v35);
        dmlc::LogMessageFatal::Entry::Init(v14, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
        v15 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v35);
        v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"Check failed: ", 14);
        v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"n_bytes == (page->data).Size() * sizeof(Entry)", 46);
        v18 = *(char *)(v36 + 23);
        if (v18 >= 0)
          v19 = v36;
        else
          v19 = *(_QWORD *)v36;
        if (v18 >= 0)
          v20 = *(unsigned __int8 *)(v36 + 23);
        else
          v20 = *(_QWORD *)(v36 + 8);
        v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, v19, v20);
        v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)": ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"Invalid SparsePage file", 23);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v35);
        v23 = v36;
        v36 = 0;
        if (v23)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v36, v23);
      }
    }
  }
  (**a3)(a3, (unint64_t *)a2 + 2, 8);
  return 1;
}

void sub_220F512FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13;

  v13 = a11;
  a11 = 0;
  if (v13)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a11, v13);
  _Unwind_Resume(exception_object);
}

unint64_t xgboost::data::SparsePageRawFormat<xgboost::SortedCSCPage>::Write(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  std::string *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::string *Entry;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = (uint64_t **)*a2;
  v6 = a2[1];
  v8 = (uint64_t *)**a2;
  v7 = (uint64_t *)(*a2)[1];
  if (v7 == v8 || (v9 = *v8, v10 = a2[1], v9))
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
    v28 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
    v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)"Check failed: page.offset.Size() != 0 && offset_vec[0] == 0", 59);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v31);
    v7 = v5[1];
    v10 = a2[1];
  }
  v30 = (v10[1] - *v10) >> 3;
  if (*(v7 - 1) != v30)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned long>(&v31);
    if (v31)
    {
      v11 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v30);
      dmlc::LogMessageFatal::Entry::Init(v11, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/data/sparse_page_raw_format.cc");
      v12 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v30);
      v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"Check failed: ", 14);
      v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"offset_vec.back() == page.data.Size()", 37);
      v15 = *(char *)(v31 + 23);
      v16 = v15 >= 0 ? v31 : *(_QWORD *)v31;
      v17 = v15 >= 0 ? *(unsigned __int8 *)(v31 + 23) : *(_QWORD *)(v31 + 8);
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, v16, v17);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v30);
      v19 = v31;
      v31 = 0;
      if (v19)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v31, v19);
    }
  }
  v31 = v5[1] - *v5;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a3 + 8))(a3, &v31, 8);
  if (v31)
    (*(void (**)(uint64_t, uint64_t *, int64_t))(*(_QWORD *)a3 + 8))(a3, *v5, (char *)v5[1] - (char *)*v5);
  v21 = **a2;
  v20 = (*a2)[1];
  v23 = *a2[1];
  v22 = a2[1][1];
  v24 = v22 - v23;
  if (v22 != v23)
  {
    if (v6[1] == *v6)
      v25 = 0;
    else
      v25 = *v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a3 + 8))(a3, v25, v24);
  }
  (*(void (**)(uint64_t, uint64_t **, uint64_t))(*(_QWORD *)a3 + 8))(a3, a2 + 2, 8);
  return ((v20 - v21 + v24) & 0xFFFFFFFFFFFFFFF8) + 16;
}

void sub_220F51560(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)va);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::RecordIOSplitter::SeekRecordBegin(uint64_t a1, uint64_t (***a2)(_QWORD, uint64_t *, uint64_t))
{
  uint64_t v3;
  std::string *Entry;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  char v9;
  uint64_t v10;

  v10 = 0;
  v3 = 0;
  while ((**a2)(a2, (uint64_t *)((char *)&v10 + 4), 4))
  {
    if (HIDWORD(v10) == -824761590)
    {
      if (!(**a2)(a2, &v10, 4))
      {
        Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v9);
        dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
        v5 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v9);
        v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"Check failed: fi->Read(&lrec, sizeof(lrec)) != 0", 48);
        v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)": ", 2);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"invalid record io format", 24);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v9);
      }
      if (!(v10 >> 30))
        return v3;
      v3 += 8;
    }
    else
    {
      v3 += 4;
    }
  }
  return v3;
}

void sub_220F516D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a12);
  _Unwind_Resume(a1);
}

const char *dmlc::io::RecordIOSplitter::FindLastRecordBegin(dmlc::io::RecordIOSplitter *this, const char *a2, const char *a3)
{
  const char *v4;
  std::string *Entry;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  std::string *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  std::string *v23;
  _QWORD *v24;
  _QWORD *v25;
  const char *v26;
  uint64_t v28;
  uint64_t v29;

  v4 = a2;
  v28 = a2 & 3;
  if ((a2 & 3) != 0)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned int>(&v29);
    if (v29)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v28);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
      v6 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v28);
      v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"Check failed: ", 14);
      v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"(reinterpret_cast<size_t>(begin) & 3UL) == 0U", 45);
      v9 = *(char *)(v29 + 23);
      v10 = v9 >= 0 ? v29 : *(_QWORD *)v29;
      v11 = v9 >= 0 ? *(unsigned __int8 *)(v29 + 23) : *(_QWORD *)(v29 + 8);
      v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, v10, v11);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v28);
      v13 = v29;
      v29 = 0;
      if (v13)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v29, v13);
    }
  }
  v28 = a3 & 3;
  if ((a3 & 3) != 0)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned int>(&v29);
    if (v29)
    {
      v14 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v28);
      dmlc::LogMessageFatal::Entry::Init(v14, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
      v15 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v28);
      v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"Check failed: ", 14);
      v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"(reinterpret_cast<size_t>(end) & 3UL) == 0U", 43);
      v18 = *(char *)(v29 + 23);
      v19 = v18 >= 0 ? v29 : *(_QWORD *)v29;
      v20 = v18 >= 0 ? *(unsigned __int8 *)(v29 + 23) : *(_QWORD *)(v29 + 8);
      v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, v19, v20);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v28);
      v22 = v29;
      v29 = 0;
      if (v22)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v29, v22);
    }
  }
  if (v4 + 8 > a3)
  {
    v23 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v29);
    dmlc::LogMessageFatal::Entry::Init(v23, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
    v24 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v29);
    v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"Check failed: p >= pbegin + 2", 29);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v29);
  }
  v26 = a3 - 8;
  if (a3 - 8 != v4)
  {
    while (*(_DWORD *)v26 != -824761590 || *((_DWORD *)v26 + 1) >> 30)
    {
      v26 -= 4;
      if (v26 == v4)
        return v4;
    }
    return v26;
  }
  return v4;
}

void sub_220F51914(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  uint64_t v13;

  v13 = a12;
  a12 = 0;
  if (v13)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a12, v13);
  _Unwind_Resume(exception_object);
}

BOOL dmlc::io::RecordIOSplitter::ExtractNextRecord(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v6;
  std::string *Entry;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  std::string *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  std::string *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  std::string *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  unsigned int v37;
  std::string *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _DWORD *v42;
  std::string *v43;
  _QWORD *v44;
  _QWORD *v45;
  std::string *v46;
  _QWORD *v47;
  _QWORD *v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v3 = *a3;
  v53 = a3[1];
  if (*a3 != v53)
  {
    LOBYTE(v6) = *a3;
    if (v3 + 8 > v53)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
      v8 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
      v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"Check failed: chunk->begin + 2 * sizeof(uint32_t) <= chunk->end", 63);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Invalid RecordIO Format", 23);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v55);
      v6 = *a3;
    }
    v54 = v6 & 3;
    if ((v6 & 3) != 0)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned int>(&v55);
      if (v55)
      {
        v11 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
        dmlc::LogMessageFatal::Entry::Init(v11, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
        v12 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
        v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"Check failed: ", 14);
        v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"(reinterpret_cast<size_t>(chunk->begin) & 3UL) == 0U", 52);
        v15 = *(char *)(v55 + 23);
        v16 = v15 >= 0 ? v55 : *(_QWORD *)v55;
        v17 = v15 >= 0 ? *(unsigned __int8 *)(v55 + 23) : *(_QWORD *)(v55 + 8);
        v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, v16, v17);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v54);
        v19 = v55;
        v55 = 0;
        if (v19)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v55, v19);
      }
    }
    v54 = a3[1] & 3;
    if (v54)
    {
      dmlc::LogCheckFormat<unsigned long,unsigned int>(&v55);
      if (v55)
      {
        v20 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
        dmlc::LogMessageFatal::Entry::Init(v20, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
        v21 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v54);
        v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"Check failed: ", 14);
        v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"(reinterpret_cast<size_t>(chunk->end) & 3UL) == 0U", 50);
        v24 = *(char *)(v55 + 23);
        v25 = v24 >= 0 ? v55 : *(_QWORD *)v55;
        v26 = v24 >= 0 ? *(unsigned __int8 *)(v55 + 23) : *(_QWORD *)(v55 + 8);
        v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, v25, v26);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v54);
        v28 = v55;
        v55 = 0;
        if (v28)
          std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&v55, v28);
      }
    }
    v29 = *(_DWORD *)(*a3 + 4);
    v30 = v29 & 0x1FFFFFFF;
    v31 = *a3 + 8;
    *a2 = v31;
    v32 = v31 + (((_DWORD)v30 + 3) & 0x3FFFFFFC);
    *a3 = v32;
    if (v32 > a3[1])
    {
      v33 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
      dmlc::LogMessageFatal::Entry::Init(v33, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
      v34 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
      v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)"Check failed: chunk->begin <= chunk->end", 40);
      v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)"Invalid RecordIO Format", 23);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v55);
    }
    v37 = v29 >> 29;
    a2[1] = v30;
    if (v37)
    {
      if (v37 == 1
        || (v38 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55),
            dmlc::LogMessageFatal::Entry::Init(v38, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc"), v39 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55), v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)"Check failed: cflag == 1U", 25), v41 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)": ", 2), std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)"Invalid RecordIO Format", 23), dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v55), v37 != 3))
      {
        v42 = (_DWORD *)*a3;
        do
        {
          if ((unint64_t)(v42 + 2) > a3[1])
          {
            v43 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
            dmlc::LogMessageFatal::Entry::Init(v43, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
            v44 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
            v45 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, (uint64_t)"Check failed: chunk->begin + 2 * sizeof(uint32_t) <= chunk->end", 63);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)": ", 2);
            dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v55);
            v42 = (_DWORD *)*a3;
          }
          if (*v42 != -824761590)
          {
            v46 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
            dmlc::LogMessageFatal::Entry::Init(v46, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/recordio_split.cc");
            v47 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v55);
            v48 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v47, (uint64_t)"Check failed: p[0] == RecordIOWriter::kMagic", 44);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v48, (uint64_t)": ", 2);
            dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v55);
          }
          v49 = v42[1];
          *(_DWORD *)(*a2 + a2[1]) = -824761590;
          v50 = a2[1] + 4;
          a2[1] = v50;
          v51 = v49 & 0x1FFFFFFF;
          if ((v49 & 0x1FFFFFFF) != 0)
          {
            memmove((void *)(*a2 + v50), (const void *)(*a3 + 8), v49 & 0x1FFFFFFF);
            a2[1] += v51;
          }
          v42 = (_DWORD *)(*a3 + (((_DWORD)v51 + 3) & 0x3FFFFFFCu) + 8);
          *a3 = (unint64_t)v42;
        }
        while (v49 >> 29 != 3);
      }
    }
  }
  return v3 != v53;
}

void sub_220F51DD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  uint64_t v13;

  v13 = a12;
  a12 = 0;
  if (v13)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a12, v13);
  _Unwind_Resume(exception_object);
}

void dmlc::io::RecordIOSplitter::~RecordIOSplitter(dmlc::io::RecordIOSplitter *this)
{
  dmlc::io::InputSplitBase::~InputSplitBase(this);
  JUMPOUT(0x227667068);
}

void sub_220F51EA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227667068](v1, 0x10B3C40F1CB0773);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::RecordIOSplitter::IsTextParser(dmlc::io::RecordIOSplitter *this)
{
  return 0;
}

uint64_t xgboost::common::ColumnSampler::ColSample@<X0>(uint64_t result@<X0>, std::vector<unsigned int> ***a2@<X1>, std::vector<unsigned int> ***a3@<X8>, float a4@<S0>)
{
  std::vector<unsigned int> **v7;
  std::vector<unsigned int> **v8;
  uint64_t v9;
  const void **v10;
  std::vector<unsigned int>::pointer end;
  std::vector<unsigned int>::pointer begin;
  uint64_t v13;
  int v14;
  std::vector<unsigned int>::size_type v15;
  std::vector<unsigned int> **v16;
  uint64_t v17;
  std::vector<unsigned int> *v18;
  std::string *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v29;
  unint64_t v30;
  uint64_t v31;
  float v32;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v33;
  float v34;
  unint64_t v35;
  std::string *Entry;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  std::vector<unsigned int>::size_type v45;
  _BYTE *v46;
  unint64_t *v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  std::vector<unsigned int>::pointer v56;
  std::vector<unsigned int>::pointer v57;
  uint64_t *v58;
  uint64_t v59;
  std::vector<unsigned int> *v60;
  unsigned int *v61;
  std::vector<unsigned int> v62;
  unint64_t v63[2];
  uint64_t v64;
  unint64_t *v65;
  std::vector<unsigned int>::value_type __x[2];
  uint64_t v67;
  uint64_t v68;

  v7 = *a2;
  if (a4 == 1.0)
  {
    v8 = a2[1];
    *a3 = v7;
    a3[1] = v8;
    *a2 = 0;
    a2[1] = 0;
    return result;
  }
  v9 = result;
  v10 = (const void **)*v7;
  begin = (*v7)->__begin_;
  end = (*v7)->__end_;
  LODWORD(v62.__begin_) = 0;
  v13 = (char *)end - (char *)begin;
  v64 = v13 >> 2;
  if (!v13)
  {
    dmlc::LogCheckFormat<unsigned long,int>((uint64_t *)__x);
    if (*(_QWORD *)__x)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v64);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/random.cc");
      v37 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v64);
      v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"Check failed: ", 14);
      v39 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v38, (uint64_t)"features.size() > 0", 19);
      v40 = *(char *)(*(_QWORD *)__x + 23);
      v41 = v40 >= 0 ? *(_QWORD *)__x : **(_QWORD **)__x;
      v42 = v40 >= 0 ? *(unsigned __int8 *)(*(_QWORD *)__x + 23) : *(_QWORD *)(*(_QWORD *)__x + 8);
      v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, v41, v42);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v64);
      v44 = *(_QWORD *)__x;
      *(_QWORD *)__x = 0;
      if (v44)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__x, v44);
    }
  }
  v14 = (int)(float)((float)(unint64_t)(((_BYTE *)v10[1] - (_BYTE *)*v10) >> 2) * a4);
  if (v14 <= 1)
    v15 = 1;
  else
    v15 = v14;
  _ZNSt3__115allocate_sharedB8ne180100IN7xgboost16HostDeviceVectorIjEENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(a3);
  v16 = *a3;
  v17 = *(_QWORD *)(v9 + 48) - *(_QWORD *)(v9 + 40);
  if (!v17)
  {
    v45 = ((_BYTE *)v10[1] - (_BYTE *)*v10) >> 2;
    __x[0] = 0;
    std::vector<unsigned int>::resize(*v16, v45, __x);
    v46 = v10[1];
    if (v46 != *v10)
      memmove((*v16)->__begin_, *v10, v46 - (_BYTE *)*v10);
    std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<unsigned int *>,std::__wrap_iter<unsigned int *>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u> &>((unint64_t)(*v16)->__begin_, (uint64_t)(*v16)->__end_, v9 + 80);
    __x[0] = 0;
    std::vector<unsigned int>::resize(*v16, v15, __x);
    return std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
  }
  v18 = **a2;
  v64 = v18->__end_ - v18->__begin_;
  v68 = v17 >> 2;
  if (v64 != v17 >> 2)
  {
    dmlc::LogCheckFormat<unsigned long,unsigned long>((uint64_t *)__x);
    if (*(_QWORD *)__x)
    {
      v19 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v64);
      dmlc::LogMessageFatal::Entry::Init(v19, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/common/random.h");
      v20 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v64);
      v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)"Check failed: ", 14);
      v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"array.size() == weights.size()", 30);
      v23 = *(char *)(*(_QWORD *)__x + 23);
      v24 = v23 >= 0 ? *(_QWORD *)__x : **(_QWORD **)__x;
      v25 = v23 >= 0 ? *(unsigned __int8 *)(*(_QWORD *)__x + 23) : *(_QWORD *)(*(_QWORD *)__x + 8);
      v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, v24, v25);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v64);
      v27 = *(_QWORD *)__x;
      *(_QWORD *)__x = 0;
      if (v27)
        std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)__x, v27);
    }
  }
  std::vector<float>::vector(__x, (uint64_t)(*(_QWORD *)(v9 + 48) - *(_QWORD *)(v9 + 40)) >> 2);
  v28 = dmlc::ThreadLocalStore<xgboost::common::RandomThreadLocalEntry>::Get();
  if (v18->__end_ == v18->__begin_)
  {
    v35 = *(_QWORD *)__x;
  }
  else
  {
    v29 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)v28;
    v30 = 0;
    do
    {
      v31 = *(_QWORD *)(v9 + 40);
      if (v30 >= (*(_QWORD *)(v9 + 48) - v31) >> 2)
        std::vector<xgboost::detail::GradientPairInternal<float>>::__throw_out_of_range[abi:ne180100]();
      v32 = *(float *)(v31 + 4 * v30);
      v33 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(v29);
      if (v32 < 0.000001)
        v32 = 0.000001;
      v34 = logf((float)((float)v33 * 2.3283e-10) + 0.0);
      v35 = *(_QWORD *)__x;
      *(float *)(*(_QWORD *)__x + 4 * v30++) = v34 / v32;
    }
    while (v30 < v18->__end_ - v18->__begin_);
  }
  v63[0] = (uint64_t)(v67 - v35) >> 2;
  v63[1] = v35;
  std::vector<unsigned long>::vector(&v64, v63[0]);
  v47 = (unint64_t *)v64;
  v48 = v65;
  if ((unint64_t *)v64 != v65)
  {
    v49 = 0;
    v50 = (unint64_t *)v64;
    do
      *v50++ = v49++;
    while (v50 != v48);
  }
  v68 = (uint64_t)v63;
  if ((char *)v48 - (char *)v47 < 1025)
  {
    v51 = 0;
    v53 = 0;
  }
  else
  {
    v51 = (unint64_t *)std::get_temporary_buffer[abi:ne180100]<unsigned long>(v48 - v47);
    v53 = v52;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(v47, v48, (unint64_t **)&v68, v48 - v47, v51, v53);
  if (v51)
    operator delete(v51);
  std::vector<unsigned long>::resize((uint64_t)&v64, v15);
  std::vector<unsigned int>::vector(&v62, ((uint64_t)v65 - v64) >> 3);
  v54 = (unint64_t *)v64;
  if (v65 != (unint64_t *)v64)
  {
    v55 = ((uint64_t)v65 - v64) >> 3;
    v56 = v18->__begin_;
    v57 = v62.__begin_;
    if (v55 <= 1)
      v55 = 1;
    v58 = (uint64_t *)v64;
    do
    {
      v59 = *v58++;
      *v57++ = v56[v59];
      --v55;
    }
    while (v55);
    goto LABEL_53;
  }
  if (v65)
  {
LABEL_53:
    v65 = v54;
    operator delete(v54);
  }
  if (*(_QWORD *)__x)
  {
    v67 = *(_QWORD *)__x;
    operator delete(*(void **)__x);
  }
  v60 = *v16;
  v61 = (*v16)->__begin_;
  if (v61)
  {
    v60->__end_ = v61;
    operator delete(v61);
    v60->__begin_ = 0;
    v60->__end_ = 0;
    v60->__end_cap_.__value_ = 0;
  }
  *v60 = v62;
  return std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
}

void sub_220F5236C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  uint64_t v19;
  uint64_t v21;

  v21 = (uint64_t)a18;
  a18 = 0;
  if (v21)
    std::default_delete<std::string>::operator()[abi:ne180100]((uint64_t)&a18, v21);
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100](v19);
  _Unwind_Resume(a1);
}

unint64_t *std::__stable_sort<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(unint64_t *result, unint64_t *a2, unint64_t **a3, unint64_t a4, unint64_t *a5, uint64_t a6)
{
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  float v21;
  uint64_t v22;
  unint64_t *v23;
  char *v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t *v29;
  char *v30;
  unint64_t *v31;
  unint64_t *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  float v37;
  float v38;
  uint64_t v39;
  char v40;
  unint64_t *v41;
  uint64_t v42;

  if (a4 >= 2)
  {
    v8 = (char *)result;
    if (a4 == 2)
    {
      v9 = *(a2 - 1);
      v10 = **a3;
      if (v10 > v9)
      {
        v11 = *result;
        if (v10 > *result)
        {
          if (*(float *)((*a3)[1] + 4 * v9) > *(float *)((*a3)[1] + 4 * v11))
          {
            *result = v9;
            *(a2 - 1) = v11;
          }
          return result;
        }
      }
LABEL_44:
      std::terminate();
    }
    if ((uint64_t)a4 > 128)
    {
      v25 = (char *)a5;
      v26 = a4 >> 1;
      v27 = &result[a4 >> 1];
      v28 = a4 >> 1;
      if ((uint64_t)a4 <= a6)
      {
        std::__stable_sort_move<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(result, v27, a3, v28, a5);
        v29 = (unint64_t *)&v25[8 * v26];
        result = std::__stable_sort_move<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>((unint64_t *)&v8[8 * (a4 >> 1)], a2, a3, a4 - (a4 >> 1), v29);
        v30 = &v25[8 * a4];
        v31 = *a3;
        v32 = v29;
        while (v32 != (unint64_t *)v30)
        {
          v33 = v32;
          v34 = *v32;
          if (*v31 <= v34)
            goto LABEL_44;
          v35 = *(_QWORD *)v25;
          if (*v31 <= *(_QWORD *)v25)
            goto LABEL_44;
          v36 = v31[1];
          v37 = *(float *)(v36 + 4 * v34);
          v38 = *(float *)(v36 + 4 * v35);
          if (v37 > v38)
            v35 = v34;
          v25 += 8 * (v37 <= v38);
          v32 = &v33[v37 > v38];
          *(_QWORD *)v8 = v35;
          v8 += 8;
          if (v25 == (char *)v29)
          {
            if (v32 != (unint64_t *)v30)
            {
              v39 = 0;
              if (v37 > v38)
                v40 = 1;
              else
                v40 = 2;
              v41 = &v33[v40 & 1];
              do
              {
                *(_QWORD *)&v8[v39 * 8] = v41[v39];
                ++v39;
              }
              while (&v41[v39] != (unint64_t *)v30);
            }
            return result;
          }
        }
        if (v25 != (char *)v29)
        {
          v42 = 0;
          do
          {
            *(_QWORD *)&v8[v42] = *(_QWORD *)&v25[v42];
            v42 += 8;
          }
          while (&v25[v42] != (char *)v29);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(result, v27, a3, v28, a5, a6);
        std::__stable_sort<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(&v8[8 * (a4 >> 1)], a2, a3, a4 - (a4 >> 1), v25, a6);
        return (unint64_t *)std::__inplace_merge<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float const,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float const,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(v8, &v8[8 * (a4 >> 1)], (char *)a2, a3, a4 >> 1, a4 - (a4 >> 1), v25, a6);
      }
    }
    else if (result != a2)
    {
      v13 = result + 1;
      if (result + 1 != a2)
      {
        v14 = 0;
        v15 = *a3;
        v16 = result;
        while (1)
        {
          v17 = v13;
          v18 = *v13;
          if (*v15 <= v18)
            goto LABEL_44;
          v19 = *v16;
          if (*v15 <= *v16)
            goto LABEL_44;
          v20 = v15[1];
          v21 = *(float *)(v20 + 4 * v18);
          if (v21 > *(float *)(v20 + 4 * v19))
          {
            v22 = v14;
            while (1)
            {
              *(unint64_t *)((char *)result + v22 + 8) = v19;
              if (!v22)
                break;
              if (*v15 <= v18)
                goto LABEL_44;
              v19 = *(unint64_t *)((char *)result + v22 - 8);
              if (*v15 <= v19)
                goto LABEL_44;
              v22 -= 8;
              if (v21 <= *(float *)(v20 + 4 * v19))
              {
                v23 = (unint64_t *)((char *)result + v22 + 8);
                goto LABEL_21;
              }
            }
            v23 = result;
LABEL_21:
            *v23 = v18;
          }
          v13 = v17 + 1;
          v14 += 8;
          v16 = v17;
          if (v17 + 1 == a2)
            return result;
        }
      }
    }
  }
  return result;
}

unint64_t *std::__stable_sort_move<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(unint64_t *result, unint64_t *a2, unint64_t **a3, unint64_t a4, unint64_t *a5)
{
  unint64_t *v5;
  unint64_t *v7;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  unint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t *v27;
  unint64_t *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  float v33;
  float v34;
  uint64_t v35;
  unint64_t *v36;
  uint64_t v37;

  if (a4)
  {
    v5 = a5;
    v7 = result;
    if (a4 == 1)
    {
LABEL_10:
      *v5 = *v7;
      return result;
    }
    if (a4 == 2)
    {
      v10 = *(a2 - 1);
      v11 = **a3;
      if (v11 > v10 && v11 > *result)
      {
        v12 = (*a3)[1];
        v13 = *(float *)(v12 + 4 * v10);
        v14 = *(float *)(v12 + 4 * *result);
        if (v13 <= v14)
          v10 = *result;
        *a5 = v10;
        v5 = a5 + 1;
        if (v13 <= v14)
          v7 = a2 - 1;
        goto LABEL_10;
      }
LABEL_46:
      std::terminate();
    }
    if ((uint64_t)a4 > 8)
    {
      v26 = &result[a4 >> 1];
      std::__stable_sort<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(result, v26, a3, a4 >> 1, a5, a4 >> 1);
      result = (unint64_t *)std::__stable_sort<std::_ClassicAlgPolicy,std::vector<unsigned long> xgboost::common::ArgSort<unsigned long,xgboost::common::Span<float,18446744073709551615ul>,float,std::greater<void>>(xgboost::common::Span<float,18446744073709551615ul> const&,std::greater<void>)::{lambda(unsigned long const&,unsigned long const&)#1} &,std::__wrap_iter<unsigned long *>>(&v7[a4 >> 1], a2, a3, a4 - (a4 >> 1), &v5[a4 >> 1], a4 - (a4 >> 1));
      v27 = *a3;
      v28 = &v7[a4 >> 1];
      while (v28 != a2)
      {
        v29 = v28;
        v30 = *v28;
        if (*v27 <= v30)
          goto LABEL_46;
        v31 = *v7;
        if (*v27 <= *v7)
          goto LABEL_46;
        v32 = v27[1];
        v33 = *(float *)(v32 + 4 * v30);
        v34 = *(float *)(v32 + 4 * v31);
        if (v33 > v34)
          v31 = v30;
        v28 = &v29[v33 > v34];
        v7 += v33 <= v34;
        *v5++ = v31;
        if (v7 == v26)
        {
          if (v28 != a2)
          {
            v35 = 0;
            v36 = &v29[v33 > v34];
            do
            {
              v5[v35] = v36[v35];
              ++v35;
            }
            while (&v36[v35] != a2);
          }
          return result;
        }
      }
      if (v7 != v26)
      {
        v37 = 0;
        do
        {
          v5[v37] = v7[v37];
          ++v37;
        }
        while (&v7[v37] != v26);
      }
    }
    else if (result != a2)
    {
      v15 = *a3;
      v16 = (uint64_t *)(result + 1);
      *a5 = *result;
      if (result + 1 != a2)
      {
        v17 = 0;
        v18 = (uint64_t *)a5;
        while (1)
        {
          v19 = *v16;
          if (*v15 <= *v16)
            goto LABEL_46;
          v20 = *v18;
          if (*v15 <= *v18)
            goto LABEL_46;
          v21 = v18 + 1;
          v22 = v15[1];
          if (*(float *)(v22 + 4 * v19) <= *(float *)(v22 + 4 * v20))
          {
            *v21 = v19;
          }
          else
          {
            v18[1] = v20;
            v23 = a5;
            if (v18 != (uint64_t *)a5)
            {
              v24 = v17;
              while (1)
              {
                if (*v15 <= *v16)
                  goto LABEL_46;
                v25 = *(unint64_t *)((char *)a5 + v24 - 8);
                if (*v15 <= v25)
                  goto LABEL_46;
                if (*(float *)(v22 + 4 * *v16) <= *(float *)(v22 + 4 * v25))
                  break;
                *(unint64_t *)((char *)a5 + v24) = v25;
                v24 -= 8;
                if (!v24)
                {
                  v23 = a5;
                  goto LABEL_28;
                }
              }
              v23 = (unint64_t *)((char *)a5 + v24);
            }
LABEL_28:
            *v23 = *v16;
          }
          ++v16;
          v17 += 8;
          v18 = v21;
          if (v16 == (uint64_t *)a2)
            return result;
        }
      }
    }
  }
  return result;
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::vector<unsigned int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_220F529D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

rabit::engine::AllreduceBase *rabit::engine::AllreduceBase::AllreduceBase(rabit::engine::AllreduceBase *this)
{
  std::vector<std::string> *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  std::string *v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  std::string *v18;
  _QWORD *v19;
  char *v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  std::string *v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  std::string *v34;
  char *v36;
  std::__split_buffer<std::string> __v;

  *(_QWORD *)this = &off_24E6BEF18;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  v2 = (std::vector<std::string> *)((char *)this + 104);
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *(_OWORD *)((char *)this + 152) = 0u;
  v3 = (char *)this + 152;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_WORD *)this + 142) = 0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 36) = 1800;
  *((_WORD *)this + 148) = 0;
  v36 = (char *)this + 128;
  MEMORY[0x227666C18]((char *)this + 176);
  *((_DWORD *)this + 56) = 9000;
  MEMORY[0x227666C18](v3, &unk_220F8364E);
  *(_QWORD *)((char *)this + 228) = 0x3E800002332;
  *((_QWORD *)this + 34) = 0xFFFFFFFF00000000;
  *((_DWORD *)this + 70) = 5;
  *((_BYTE *)this + 16) = 0;
  *((_DWORD *)this + 3) = 0;
  *((_OWORD *)this + 16) = xmmword_220F66750;
  MEMORY[0x227666C18](v36, "NULL");
  *((_QWORD *)this + 7) = 0;
  MEMORY[0x227666C18]((char *)this + 200, "worker");
  (*(void (**)(rabit::engine::AllreduceBase *, const char *, const char *))(*(_QWORD *)this + 136))(this, "rabit_reduce_buffer", "256MB");
  v4 = *((_QWORD *)this + 15);
  v5 = *((_QWORD *)this + 14);
  if (v5 >= v4)
  {
    v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (unint64_t)v2->__begin_) >> 3);
    if (v7 + 1 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_56;
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - (unint64_t)v2->__begin_) >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= v7 + 1)
      v9 = v7 + 1;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)((char *)this + 120);
    if (v10)
      v11 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<unsigned long>>>((uint64_t)this + 120, v10);
    else
      v11 = 0;
    __v.__first_ = v11;
    __v.__begin_ = v11 + v7;
    __v.__end_cap_.__value_ = &v11[v10];
    std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, "DMLC_TASK_ID");
    __v.__end_ = __v.__begin_ + 1;
    std::vector<std::string>::__swap_out_circular_buffer(v2, &__v);
    v6 = (_QWORD *)*((_QWORD *)this + 14);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(*((_QWORD **)this + 14), "DMLC_TASK_ID");
    v6 = (_QWORD *)(v5 + 24);
    *((_QWORD *)this + 14) = v6;
  }
  *((_QWORD *)this + 14) = v6;
  v12 = *((_QWORD *)this + 15);
  if ((unint64_t)v6 >= v12)
  {
    v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v6 - (char *)v2->__begin_) >> 3);
    if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_56;
    v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (unint64_t)v2->__begin_) >> 3);
    v16 = 2 * v15;
    if (2 * v15 <= v14 + 1)
      v16 = v14 + 1;
    if (v15 >= 0x555555555555555)
      v17 = 0xAAAAAAAAAAAAAAALL;
    else
      v17 = v16;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)((char *)this + 120);
    if (v17)
      v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<unsigned long>>>((uint64_t)this + 120, v17);
    else
      v18 = 0;
    __v.__first_ = v18;
    __v.__begin_ = v18 + v14;
    __v.__end_ = __v.__begin_;
    __v.__end_cap_.__value_ = &v18[v17];
    std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, "DMLC_ROLE");
    ++__v.__end_;
    std::vector<std::string>::__swap_out_circular_buffer(v2, &__v);
    v13 = (_QWORD *)*((_QWORD *)this + 14);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v6, "DMLC_ROLE");
    v13 = v6 + 3;
    *((_QWORD *)this + 14) = v13;
  }
  *((_QWORD *)this + 14) = v13;
  if ((unint64_t)v13 >= *((_QWORD *)this + 15))
  {
    v19 = (_QWORD *)std::vector<std::string>::__emplace_back_slow_path<char const(&)[17]>((uint64_t *)v2, "DMLC_NUM_ATTEMPT");
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v13, "DMLC_NUM_ATTEMPT");
    v19 = v13 + 3;
    *((_QWORD *)this + 14) = v19;
  }
  *((_QWORD *)this + 14) = v19;
  if ((unint64_t)v19 >= *((_QWORD *)this + 15))
  {
    v20 = (char *)std::vector<std::string>::__emplace_back_slow_path<char const(&)[17]>((uint64_t *)v2, "DMLC_TRACKER_URI");
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v19, "DMLC_TRACKER_URI");
    v20 = (char *)(v19 + 3);
    *((_QWORD *)this + 14) = v20;
  }
  *((_QWORD *)this + 14) = v20;
  v21 = *((_QWORD *)this + 15);
  if ((unint64_t)v20 >= v21)
  {
    v23 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (char *)v2->__begin_) >> 3);
    if (v23 + 1 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_56;
    v24 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - (unint64_t)v2->__begin_) >> 3);
    v25 = 2 * v24;
    if (2 * v24 <= v23 + 1)
      v25 = v23 + 1;
    if (v24 >= 0x555555555555555)
      v26 = 0xAAAAAAAAAAAAAAALL;
    else
      v26 = v25;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)((char *)this + 120);
    if (v26)
      v27 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<unsigned long>>>((uint64_t)this + 120, v26);
    else
      v27 = 0;
    __v.__first_ = v27;
    __v.__begin_ = v27 + v23;
    __v.__end_ = __v.__begin_;
    __v.__end_cap_.__value_ = &v27[v26];
    std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, "DMLC_TRACKER_PORT");
    ++__v.__end_;
    std::vector<std::string>::__swap_out_circular_buffer(v2, &__v);
    v22 = (char *)*((_QWORD *)this + 14);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v20, "DMLC_TRACKER_PORT");
    v22 = v20 + 24;
    *((_QWORD *)this + 14) = v22;
  }
  *((_QWORD *)this + 14) = v22;
  v28 = *((_QWORD *)this + 15);
  if ((unint64_t)v22 < v28)
  {
    std::string::basic_string[abi:ne180100]<0>(v22, "DMLC_WORKER_CONNECT_RETRY");
    v29 = v22 + 24;
    *((_QWORD *)this + 14) = v22 + 24;
    goto LABEL_55;
  }
  v30 = 0xAAAAAAAAAAAAAAABLL * ((v22 - (char *)v2->__begin_) >> 3);
  if (v30 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_56:
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - (unint64_t)v2->__begin_) >> 3);
  v32 = 2 * v31;
  if (2 * v31 <= v30 + 1)
    v32 = v30 + 1;
  if (v31 >= 0x555555555555555)
    v33 = 0xAAAAAAAAAAAAAAALL;
  else
    v33 = v32;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)((char *)this + 120);
  if (v33)
    v34 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<unsigned long>>>((uint64_t)this + 120, v33);
  else
    v34 = 0;
  __v.__first_ = v34;
  __v.__begin_ = v34 + v30;
  __v.__end_ = __v.__begin_;
  __v.__end_cap_.__value_ = &v34[v33];
  std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, "DMLC_WORKER_CONNECT_RETRY");
  ++__v.__end_;
  std::vector<std::string>::__swap_out_circular_buffer(v2, &__v);
  v29 = (_QWORD *)*((_QWORD *)this + 14);
  std::__split_buffer<std::string>::~__split_buffer(&__v);
LABEL_55:
  *((_QWORD *)this + 14) = v29;
  return this;
}

void sub_220F52F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, std::__split_buffer<std::string> *a4, void **a5, void **a6, ...)
{
  uint64_t v6;
  void **v7;
  void **v8;
  uint64_t v9;
  void **v10;
  void *v12;
  va_list va;

  va_start(va, a6);
  *(_QWORD *)(v6 + 112) = v9;
  if (*(char *)(v6 + 223) < 0)
    operator delete(*v8);
  if (*(char *)(v6 + 199) < 0)
    operator delete(*a5);
  if (*(char *)(v6 + 175) < 0)
    operator delete(*v7);
  if (*(char *)(v6 + 151) < 0)
    operator delete(*a6);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v12 = *v10;
  if (*v10)
  {
    *(_QWORD *)(v6 + 72) = v12;
    operator delete(v12);
  }
  std::vector<rabit::engine::AllreduceBase::LinkRecord>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t rabit::engine::AllreduceBase::Init(rabit::engine::AllreduceBase *this, int a2, const char **a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  const char *v17;
  char *v18;
  char *v19;
  int v20;
  int v21;
  int v22;
  std::string *Entry;
  _QWORD *v25;
  std::string *v26;
  _BOOL8 v27;
  const char *v28;
  std::string *v29;
  void **v30;
  __int128 v32;
  uint64_t v33;
  std::string v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = *((_QWORD *)this + 13);
  v7 = *((_QWORD *)this + 14);
  while (v6 != v7)
  {
    if (*(char *)(v6 + 23) < 0)
    {
      v9 = *(const char **)v6;
      v10 = getenv(*(const char **)v6);
      if (!v10)
        goto LABEL_9;
      v8 = v10;
LABEL_8:
      (*(void (**)(rabit::engine::AllreduceBase *, const char *, char *))(*(_QWORD *)this + 136))(this, v9, v8);
      goto LABEL_9;
    }
    v8 = getenv((const char *)v6);
    v9 = (const char *)v6;
    if (v8)
      goto LABEL_8;
LABEL_9:
    v6 += 24;
  }
  if (a2 >= 1)
  {
    v11 = a2;
    do
    {
      if (sscanf(*a3, "%[^=]=%s", &v34, &v32) == 2)
        (*(void (**)(rabit::engine::AllreduceBase *, std::string *, __int128 *))(*(_QWORD *)this + 136))(this, &v34, &v32);
      ++a3;
      --v11;
    }
    while (v11);
  }
  v13 = getenv("mapred_tip_id");
  if (!v13)
    v13 = getenv("mapreduce_task_id");
  if (*((_BYTE *)this + 16))
    rabit::utils::Check((rabit::utils *)(v13 != 0), "hadoop_mode is set but cannot find mapred_task_id", v12);
  if (v13)
  {
    (*(void (**)(rabit::engine::AllreduceBase *, const char *, char *))(*(_QWORD *)this + 136))(this, "rabit_task_id", v13);
    (*(void (**)(rabit::engine::AllreduceBase *, const char *, const char *))(*(_QWORD *)this + 136))(this, "rabit_hadoop_mode", "1");
  }
  v14 = getenv("mapred_task_id");
  if (v14)
  {
    v15 = strrchr(v14, 95);
    LODWORD(v34.__r_.__value_.__l.__data_) = 0;
    if (v15)
    {
      v16 = v15 + 1;
      if (sscanf(v15 + 1, "%d", &v34) == 1)
        (*(void (**)(rabit::engine::AllreduceBase *, const char *, char *))(*(_QWORD *)this + 136))(this, "rabit_num_trial", v16);
    }
  }
  v18 = getenv("mapred_map_tasks");
  if (!v18)
    v18 = getenv("mapreduce_job_maps");
  if (*((_BYTE *)this + 16))
    rabit::utils::Check((rabit::utils *)(v18 != 0), "hadoop_mode is set but cannot find mapred_map_tasks", v17);
  if (v18)
    (*(void (**)(rabit::engine::AllreduceBase *, const char *, char *))(*(_QWORD *)this + 136))(this, "rabit_world_size", v18);
  v19 = (char *)this + 200;
  v20 = *((char *)this + 223);
  if (v20 < 0)
  {
    if (*((_QWORD *)this + 26) != 6)
      goto LABEL_40;
    v19 = *(char **)v19;
  }
  else if (v20 != 6)
  {
    goto LABEL_40;
  }
  v21 = *(_DWORD *)v19;
  v22 = *((unsigned __int16 *)v19 + 2);
  if (v21 != 1802661751 || v22 != 29285)
  {
LABEL_40:
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v34);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc");
    v25 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v34);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"Rabit Module currently only work with dmlc worker", 49);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v34);
  }
  *((_DWORD *)this + 68) = -1;
  rabit::utils::Assert((rabit::utils *)(*((_QWORD *)this + 5) == *((_QWORD *)this + 4)), "can only call Init once", v17);
  memset(&v34, 0, sizeof(v34));
  std::string::resize(&v34, 0x100uLL, 0);
  if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = &v34;
  else
    v26 = (std::string *)v34.__r_.__value_.__r.__words[0];
  v27 = gethostname((char *)v26, 0x100uLL) != -1;
  rabit::utils::Check((rabit::utils *)v27, "fail to get host name", v28);
  if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v29 = &v34;
  else
    v29 = (std::string *)v34.__r_.__value_.__r.__words[0];
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)v29);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  v30 = (void **)((char *)this + 152);
  if (*((char *)this + 175) < 0)
    operator delete(*v30);
  *(_OWORD *)v30 = v32;
  *((_QWORD *)this + 21) = v33;
  return rabit::engine::AllreduceBase::ReConnectLinks(this, "start");
}

void sub_220F5338C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *__p,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
  _Unwind_Resume(a1);
}

uint64_t rabit::engine::AllreduceBase::ReConnectLinks(rabit::engine::AllreduceBase *this, char *a2)
{
  rabit::engine::AllreduceBase *v3;
  _QWORD *v4;
  int v5;
  int v6;
  __n128 v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  char *v14;
  ssize_t v15;
  const char *v16;
  ssize_t v17;
  int *v18;
  char *v19;
  const char *v20;
  unint64_t v21;
  char *v22;
  ssize_t v23;
  const char *v24;
  ssize_t v25;
  int *v26;
  char *v27;
  const char *v28;
  unint64_t v29;
  char *v30;
  ssize_t v31;
  const char *v32;
  ssize_t v33;
  int *v34;
  char *v35;
  const char *v36;
  const char *v37;
  int v38;
  _BOOL8 v40;
  int v41;
  std::string *Entry;
  _QWORD *v43;
  _QWORD *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t *v50;
  ssize_t v51;
  const char *v52;
  ssize_t v53;
  int *v54;
  char *v55;
  const char *v56;
  int v57;
  unint64_t v58;
  void **v59;
  ssize_t v60;
  const char *v61;
  ssize_t v62;
  int *v63;
  char *v64;
  const char *v65;
  int v66;
  uint64_t *v67;
  uint64_t **i;
  uint64_t **v69;
  int v70;
  _DWORD *v71;
  uint64_t *v72;
  unint64_t v73;
  char *v74;
  ssize_t v75;
  const char *v76;
  ssize_t v77;
  int *v78;
  char *v79;
  const char *v80;
  unint64_t v81;
  uint64_t *v82;
  ssize_t v83;
  const char *v84;
  ssize_t v85;
  int *v86;
  char *v87;
  const char *v88;
  const char *v89;
  int v90;
  int *v91;
  char *v92;
  const char *v93;
  int v94;
  unsigned int v95;
  int *v96;
  char *v97;
  const char *v98;
  int *v99;
  int *v100;
  int v101;
  int *v102;
  char *v103;
  const char *v104;
  int v106;
  char *v107;
  _DWORD *v108;
  char *v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  int *v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  int *v120;
  const char *v121;
  ssize_t v122;
  int *v123;
  char *v124;
  const char *v125;
  char *v126;
  char *v127;
  unint64_t v128;
  char *v129;
  const char *v130;
  ssize_t v131;
  int *v132;
  char *v133;
  const char *v134;
  unint64_t v135;
  int *v136;
  ssize_t v137;
  const char *v138;
  ssize_t v139;
  int *v140;
  char *v141;
  const char *v142;
  unint64_t v143;
  int *v144;
  ssize_t v145;
  const char *v146;
  ssize_t v147;
  int *v148;
  char *v149;
  const char *v150;
  int v151;
  unint64_t v152;
  sockaddr *v153;
  ssize_t v154;
  const char *v155;
  ssize_t v156;
  int *v157;
  char *v158;
  const char *v159;
  unint64_t v160;
  unint64_t v161;
  std::string *v162;
  ssize_t v163;
  const char *v164;
  ssize_t v165;
  int *v166;
  char *v167;
  const char *v168;
  std::string::size_type size;
  unint64_t v170;
  int *v171;
  ssize_t v172;
  const char *v173;
  ssize_t v174;
  int *v175;
  char *v176;
  const char *v177;
  unint64_t v178;
  int *v179;
  ssize_t v180;
  const char *v181;
  ssize_t v182;
  int *v183;
  char *v184;
  const char *v185;
  int *v186;
  char *v187;
  const char *v188;
  std::string *v189;
  unint64_t v190;
  char *v191;
  const char *v192;
  ssize_t v193;
  int *v194;
  char *v195;
  const char *v196;
  unint64_t v197;
  char *v198;
  ssize_t v199;
  const char *v200;
  ssize_t v201;
  int *v202;
  char *v203;
  const char *v204;
  const char *v205;
  const char *v206;
  _DWORD *v207;
  _DWORD *v208;
  uint64_t v209;
  int *v210;
  char *v211;
  const char *v212;
  unint64_t v213;
  int *v214;
  const char *v215;
  ssize_t v216;
  int *v217;
  char *v218;
  const char *v219;
  unint64_t v220;
  unsigned int *v221;
  rabit::engine::AllreduceBase *v222;
  const char *v223;
  ssize_t v224;
  int *v225;
  char *v226;
  const char *v227;
  int *v228;
  char *v229;
  const char *v230;
  int j;
  int v232;
  int *v233;
  char *v234;
  const char *v235;
  unint64_t v236;
  char *v237;
  const char *v238;
  ssize_t v239;
  int *v240;
  char *v241;
  const char *v242;
  unint64_t v243;
  char *v244;
  ssize_t v245;
  const char *v246;
  ssize_t v247;
  int *v248;
  char *v249;
  const char *v250;
  const char *v251;
  _DWORD *v252;
  _DWORD *v253;
  uint64_t v254;
  const char *v255;
  int *v256;
  char *v257;
  const char *v258;
  int *v259;
  int *v260;
  const char *v261;
  const char *v262;
  char *v263;
  int v264;
  int *v265;
  char *v266;
  const char *v267;
  _BOOL4 v269;
  int v270;
  int *v271;
  char *v272;
  const char *v273;
  int *v274;
  char *v275;
  const char *v276;
  int v277;
  int *v278;
  char *v279;
  const char *v280;
  uint64_t *v281;
  int k;
  int v283;
  const char *v284;
  int **v285;
  char *v286;
  unint64_t v287;
  _QWORD *v288;
  const char *v289;
  _QWORD *v290;
  uint64_t v291;
  unint64_t v292;
  uint64_t v293;
  unint64_t v294;
  char *v295;
  int **v296;
  int *v297;
  rabit::engine::AllreduceBase *v298;
  rabit::engine::AllreduceBase *v299;
  _BOOL8 v300;
  const char *v301;
  unint64_t v302;
  const char *v303;
  unint64_t v304;
  _DWORD *v306;
  uint64_t v307;
  int64x2_t *v308;
  char *v309;
  rabit::engine::AllreduceBase *v310;
  std::string v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  unsigned int v318;
  uint64_t v319;
  uint64_t v320;
  void *__p;
  uint64_t *v322;
  uint64_t v323;
  void *v324[2];
  char v325;
  __int128 v326;
  __int128 v327;
  uint64_t v328;
  int v329;
  int v330;
  sockaddr v331;
  sockaddr v332;
  _QWORD v333[3];

  v3 = this;
  v333[1] = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)((char *)this + 176);
  v5 = *((char *)this + 199);
  if (v5 < 0)
  {
    if (*((_QWORD *)this + 23) != 4)
      goto LABEL_7;
    v4 = (_QWORD *)*v4;
  }
  else if (v5 != 4)
  {
    goto LABEL_7;
  }
  if (*(_DWORD *)v4 == 1280070990)
  {
    *((_QWORD *)this + 34) = 0x100000000;
    return 1;
  }
LABEL_7:
  v6 = rabit::engine::AllreduceBase::ConnectTracker(this);
  v330 = v6;
  v307 = dmlc::ThreadLocalStore<xgboost::GlobalConfiguration>::Get(void)::inst(v7);
  if (*(int *)(v307 + 4) >= 2)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc");
    xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)v324, (uint64_t)&__p, 276, 2);
    v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v324, (uint64_t)"task ", 5);
    v9 = *((char *)v3 + 151);
    v10 = v9 >= 0 ? (uint64_t)v3 + 128 : *((_QWORD *)v3 + 16);
    v11 = v9 >= 0 ? *((unsigned __int8 *)v3 + 151) : *((_QWORD *)v3 + 17);
    v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, v10, v11);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" connected to the tracker", 25);
    xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)v324);
    if (SHIBYTE(v323) < 0)
      operator delete(__p);
  }
  std::string::basic_string[abi:ne180100]<0>(v324, a2);
  rabit::utils::TCPSocket::SendStr(&v330, (char **)v324);
  if (v325 < 0)
    operator delete(v324[0]);
  v13 = 0;
  v322 = 0;
  v323 = 0;
  v320 = 0;
  __p = &v322;
  v319 = 0;
  v14 = (char *)&v319 + 4;
  do
  {
    v15 = recv(v6, v14, 4 - v13, 64);
    v17 = v15;
    if (v15 == -1)
    {
      if (*__error() == 35)
        break;
      v18 = __error();
      v19 = strerror(*v18);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v20, "RecvAll", v19);
    }
    else if (!v15)
    {
      break;
    }
    v14 += v17;
    v13 += v17;
  }
  while (v13 < 4);
  rabit::utils::Assert((rabit::utils *)(v13 == 4), "ReConnectLink failure 4", v16);
  v21 = 0;
  v22 = (char *)v3 + 24;
  v306 = (_DWORD *)((char *)v3 + 24);
  do
  {
    v23 = recv(v6, v22, 4 - v21, 64);
    v25 = v23;
    if (v23 == -1)
    {
      if (*__error() == 35)
        break;
      v26 = __error();
      v27 = strerror(*v26);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v28, "RecvAll", v27);
    }
    else if (!v23)
    {
      break;
    }
    v22 += v25;
    v21 += v25;
  }
  while (v21 < 4);
  rabit::utils::Assert((rabit::utils *)(v21 == 4), "ReConnectLink failure 4", v24);
  v29 = 0;
  v30 = (char *)v3 + 276;
  do
  {
    v31 = recv(v6, v30, 4 - v29, 64);
    v33 = v31;
    if (v31 == -1)
    {
      if (*__error() == 35)
        break;
      v34 = __error();
      v35 = strerror(*v34);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v36, "RecvAll", v35);
    }
    else if (!v31)
    {
      break;
    }
    v30 += v33;
    v29 += v33;
  }
  while (v29 < 4);
  rabit::utils::Assert((rabit::utils *)(v29 == 4), "ReConnectLink failure 4", v32);
  v38 = *((_DWORD *)v3 + 68);
  v40 = v38 == -1 || HIDWORD(v319) == v38;
  rabit::utils::Assert((rabit::utils *)v40, "must keep rank to same if the node already have one", v37);
  v41 = HIDWORD(v319);
  v309 = (char *)v3 + 272;
  *((_DWORD *)v3 + 68) = HIDWORD(v319);
  if (v41 == -1)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v324);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc");
    v43 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v324);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)"tracker got overwhelmed and not able to assign correct rank", 59);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v324);
  }
  xgboost::BaseLogger::BaseLogger((xgboost::BaseLogger *)v324);
  v329 = 4;
  v44 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v324, (uint64_t)"task ", 5);
  v45 = *((char *)v3 + 151);
  if (v45 >= 0)
    v46 = (uint64_t)v3 + 128;
  else
    v46 = *((_QWORD *)v3 + 16);
  if (v45 >= 0)
    v47 = *((unsigned __int8 *)v3 + 151);
  else
    v47 = *((_QWORD *)v3 + 17);
  v48 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v44, v46, v47);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v48, (uint64_t)" got new rank ", 14);
  std::ostream::operator<<();
  xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)v324);
  v49 = 0;
  v50 = &v319;
  do
  {
    v51 = recv(v6, v50, 4 - v49, 64);
    v53 = v51;
    if (v51 == -1)
    {
      if (*__error() == 35)
        break;
      v54 = __error();
      v55 = strerror(*v54);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v56, "RecvAll", v55);
    }
    else if (!v51)
    {
      break;
    }
    v50 = (uint64_t *)((char *)v50 + v53);
    v49 += v53;
  }
  while (v49 < 4);
  rabit::utils::Assert((rabit::utils *)(v49 == 4), "ReConnectLink failure 4", v52);
  v310 = v3;
  if ((int)v319 > 0)
  {
    v57 = 0;
    do
    {
      v58 = 0;
      LODWORD(v324[0]) = 0;
      v59 = v324;
      do
      {
        v60 = recv(v6, v59, 4 - v58, 64);
        v62 = v60;
        if (v60 == -1)
        {
          if (*__error() == 35)
            break;
          v63 = __error();
          v64 = strerror(*v63);
          rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v65, "RecvAll", v64);
        }
        else if (!v60)
        {
          break;
        }
        v59 = (void **)((char *)v59 + v62);
        v58 += v62;
      }
      while (v58 < 4);
      rabit::utils::Assert((rabit::utils *)(v58 == 4), "ReConnectLink failure 4", v61);
      v66 = (int)v324[0];
      v67 = v322;
      for (i = &v322; ; v67 = *i)
      {
        v69 = i;
        if (!v67)
          break;
        while (1)
        {
          i = (uint64_t **)v67;
          v70 = *((_DWORD *)v67 + 7);
          if (v70 > SLODWORD(v324[0]))
            break;
          if (v70 >= SLODWORD(v324[0]))
          {
            v71 = i;
            goto LABEL_80;
          }
          v67 = i[1];
          if (!v67)
          {
            v69 = i + 1;
            goto LABEL_77;
          }
        }
      }
LABEL_77:
      v71 = operator new(0x28uLL);
      v71[7] = v66;
      v71[8] = 0;
      *(_QWORD *)v71 = 0;
      *((_QWORD *)v71 + 1) = 0;
      *((_QWORD *)v71 + 2) = i;
      *v69 = (uint64_t *)v71;
      v72 = (uint64_t *)v71;
      if (*(_QWORD *)__p)
      {
        __p = *(void **)__p;
        v72 = *v69;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v322, v72);
      ++v323;
LABEL_80:
      v3 = v310;
      v71[8] = 1;
      ++v57;
    }
    while (v57 < (int)v319);
  }
  v73 = 0;
  v74 = (char *)&v320 + 4;
  do
  {
    v75 = recv(v6, v74, 4 - v73, 64);
    v77 = v75;
    if (v75 == -1)
    {
      if (*__error() == 35)
        break;
      v78 = __error();
      v79 = strerror(*v78);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v80, "RecvAll", v79);
    }
    else if (!v75)
    {
      break;
    }
    v74 += v77;
    v73 += v77;
  }
  while (v73 < 4);
  rabit::utils::Assert((rabit::utils *)(v73 == 4), "ReConnectLink failure 4", v76);
  v81 = 0;
  v82 = &v320;
  do
  {
    v83 = recv(v6, v82, 4 - v81, 64);
    v85 = v83;
    if (v83 == -1)
    {
      if (*__error() == 35)
        break;
      v86 = __error();
      v87 = strerror(*v86);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v88, "RecvAll", v87);
    }
    else if (!v83)
    {
      break;
    }
    v82 = (uint64_t *)((char *)v82 + v85);
    v81 += v85;
  }
  while (v81 < 4);
  rabit::utils::Assert((rabit::utils *)(v81 == 4), "ReConnectLink failure 4", v84);
  v90 = socket(2, 1, 0);
  if (v90 == -1)
  {
    v91 = __error();
    v92 = strerror(*v91);
    rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v93, "Create", v92);
  }
  v318 = 0;
  v94 = *((_DWORD *)v3 + 58);
  if (v94 < 1)
  {
LABEL_103:
    v95 = -1;
  }
  else
  {
    v95 = *((_DWORD *)v3 + 57);
    while (1)
    {
      rabit::utils::SockAddr::SockAddr((rabit::utils::SockAddr *)&v332, "0.0.0.0", v95);
      if (!bind(v90, &v332, 0x10u))
        break;
      if (*__error() != 48)
      {
        v96 = __error();
        v97 = strerror(*v96);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v98, "TryBindHost", v97);
      }
      ++v95;
      if (!--v94)
        goto LABEL_103;
    }
  }
  v318 = v95;
  rabit::utils::Check((rabit::utils *)(v95 != -1), "ReConnectLink fail to bind the ports specified", v89);
  listen(v90, 16);
  v316 = 0;
  v317 = 0;
  v308 = (int64x2_t *)((char *)v3 + 32);
  v315 = 1;
  do
  {
    *(_QWORD *)&v332.sa_len = 0;
    *(_QWORD *)&v332.sa_data[6] = 0;
    v333[0] = 0;
    v99 = (int *)*((_QWORD *)v310 + 4);
    v100 = (int *)*((_QWORD *)v310 + 5);
    if (v99 == v100)
    {
      v118 = 0;
      v117 = 0;
    }
    else
    {
      do
      {
        v101 = *v99;
        if (*v99 != -1)
        {
          LODWORD(v311.__r_.__value_.__l.__data_) = 0;
          *(_DWORD *)&v331.sa_len = 4;
          if (getsockopt(v101, 0xFFFF, 4103, &v311, (socklen_t *)&v331.sa_len))
          {
            v102 = __error();
            v103 = strerror(*v102);
            rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v104, "GetSockError", v103);
          }
          if (LODWORD(v311.__r_.__value_.__l.__data_) == 4 || LODWORD(v311.__r_.__value_.__l.__data_) == 9)
          {
            if (*v99 != -1)
            {
              close(*v99);
              *v99 = -1;
            }
          }
          else
          {
            v106 = v99[1];
            v107 = *(char **)&v332.sa_data[6];
            if (*(_QWORD *)&v332.sa_data[6] >= v333[0])
            {
              v109 = *(char **)&v332.sa_len;
              v110 = (uint64_t)(*(_QWORD *)&v332.sa_data[6] - *(_QWORD *)&v332.sa_len) >> 2;
              v111 = v110 + 1;
              if ((unint64_t)(v110 + 1) >> 62)
                std::vector<xgboost::TreeUpdaterReg const*>::__throw_length_error[abi:ne180100]();
              v112 = v333[0] - *(_QWORD *)&v332.sa_len;
              if ((uint64_t)(v333[0] - *(_QWORD *)&v332.sa_len) >> 1 > v111)
                v111 = v112 >> 1;
              if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFFCLL)
                v113 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v113 = v111;
              if (v113)
              {
                v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v333, v113);
                v109 = *(char **)&v332.sa_len;
                v107 = *(char **)&v332.sa_data[6];
              }
              else
              {
                v114 = 0;
              }
              v115 = (int *)&v114[4 * v110];
              *v115 = v106;
              v108 = v115 + 1;
              while (v107 != v109)
              {
                v116 = *((_DWORD *)v107 - 1);
                v107 -= 4;
                *--v115 = v116;
              }
              *(_QWORD *)&v332.sa_len = v115;
              *(_QWORD *)&v332.sa_data[6] = v108;
              v333[0] = &v114[4 * v113];
              if (v109)
                operator delete(v109);
            }
            else
            {
              **(_DWORD **)&v332.sa_data[6] = v106;
              v108 = v107 + 4;
            }
            *(_QWORD *)&v332.sa_data[6] = v108;
          }
        }
        v99 += 16;
      }
      while (v99 != v100);
      v118 = *(_QWORD *)&v332.sa_len;
      v117 = *(_QWORD *)&v332.sa_data[6];
      v6 = v330;
    }
    v119 = 0;
    v314 = (unint64_t)(v117 - v118) >> 2;
    v120 = &v314;
    do
    {
      v122 = send(v6, v120, 4 - v119, 0);
      if (v122 == -1)
      {
        if (*__error() == 35)
          break;
        v123 = __error();
        v124 = strerror(*v123);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v125, "SendAll", v124);
      }
      v120 = (int *)((char *)v120 + v122);
      v119 += v122;
    }
    while (v119 < 4);
    rabit::utils::Assert((rabit::utils *)(v119 == 4), "ReConnectLink failure 5", v121);
    v126 = *(char **)&v332.sa_len;
    v127 = *(char **)&v332.sa_data[6];
    while (v126 != v127)
    {
      v128 = 0;
      v129 = v126;
      do
      {
        v131 = send(v6, v129, 4 - v128, 0);
        if (v131 == -1)
        {
          if (*__error() == 35)
            break;
          v132 = __error();
          v133 = strerror(*v132);
          rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v134, "SendAll", v133);
        }
        v129 += v131;
        v128 += v131;
      }
      while (v128 < 4);
      rabit::utils::Assert((rabit::utils *)(v128 == 4), "ReConnectLink failure 6", v130);
      v126 += 4;
    }
    v135 = 0;
    v136 = &v317;
    do
    {
      v137 = recv(v6, v136, 4 - v135, 64);
      v139 = v137;
      if (v137 == -1)
      {
        if (*__error() == 35)
          break;
        v140 = __error();
        v141 = strerror(*v140);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v142, "RecvAll", v141);
      }
      else if (!v137)
      {
        break;
      }
      v136 = (int *)((char *)v136 + v139);
      v135 += v139;
    }
    while (v135 < 4);
    rabit::utils::Assert((rabit::utils *)(v135 == 4), "ReConnectLink failure 7", v138);
    v143 = 0;
    v144 = &v316;
    do
    {
      v145 = recv(v6, v144, 4 - v143, 64);
      v147 = v145;
      if (v145 == -1)
      {
        if (*__error() == 35)
          break;
        v148 = __error();
        v149 = strerror(*v148);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v150, "RecvAll", v149);
      }
      else if (!v145)
      {
        break;
      }
      v144 = (int *)((char *)v144 + v147);
      v143 += v147;
    }
    while (v143 < 4);
    rabit::utils::Assert((rabit::utils *)(v143 == 4), "ReConnectLink failure 8", v146);
    v315 = 0;
    if (v317 >= 1)
    {
      v151 = 0;
      v6 = v330;
      do
      {
        v152 = 0;
        LODWORD(v324[0]) = -1;
        v326 = 0u;
        v327 = 0u;
        v328 = 0;
        v312 = 0;
        v313 = 0;
        memset(&v311, 0, sizeof(v311));
        v153 = &v331;
        *(_DWORD *)&v331.sa_len = 0;
        do
        {
          v154 = recv(v6, v153, 4 - v152, 64);
          v156 = v154;
          if (v154 == -1)
          {
            if (*__error() == 35)
              break;
            v157 = __error();
            v158 = strerror(*v157);
            rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v159, "RecvAll", v158);
          }
          else if (!v154)
          {
            break;
          }
          v153 = (sockaddr *)((char *)v153 + v156);
          v152 += v156;
        }
        while (v152 < 4);
        rabit::utils::Assert((rabit::utils *)(v152 == 4), "error during send RecvStr", v155);
        std::string::resize(&v311, *(int *)&v331.sa_len, 0);
        v160 = *(int *)&v331.sa_len;
        if (*(_DWORD *)&v331.sa_len)
        {
          v161 = 0;
          if ((v311.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v162 = &v311;
          else
            v162 = (std::string *)v311.__r_.__value_.__r.__words[0];
          do
          {
            v163 = recv(v6, v162, v160 - v161, 64);
            v165 = v163;
            if (v163 == -1)
            {
              if (*__error() == 35)
                break;
              v166 = __error();
              v167 = strerror(*v166);
              rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v168, "RecvAll", v167);
            }
            else if (!v163)
            {
              break;
            }
            v162 = (std::string *)((char *)v162 + v165);
            v161 += v165;
          }
          while (v161 < v160);
          size = HIBYTE(v311.__r_.__value_.__r.__words[2]);
          if ((v311.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            size = v311.__r_.__value_.__l.__size_;
          rabit::utils::Assert((rabit::utils *)(v161 == size), "error during send SendStr", v164);
        }
        v170 = 0;
        v171 = &v313;
        do
        {
          v172 = recv(v6, v171, 4 - v170, 64);
          v174 = v172;
          if (v172 == -1)
          {
            if (*__error() == 35)
              break;
            v175 = __error();
            v176 = strerror(*v175);
            rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v177, "RecvAll", v176);
          }
          else if (!v172)
          {
            break;
          }
          v171 = (int *)((char *)v171 + v174);
          v170 += v174;
        }
        while (v170 < 4);
        rabit::utils::Assert((rabit::utils *)(v170 == 4), "ReConnectLink failure 9", v173);
        v178 = 0;
        v179 = &v312;
        do
        {
          v180 = recv(v6, v179, 4 - v178, 64);
          v182 = v180;
          if (v180 == -1)
          {
            if (*__error() == 35)
              break;
            v183 = __error();
            v184 = strerror(*v183);
            rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v185, "RecvAll", v184);
          }
          else if (!v180)
          {
            break;
          }
          v179 = (int *)((char *)v179 + v182);
          v178 += v182;
        }
        while (v178 < 4);
        rabit::utils::Assert((rabit::utils *)(v178 == 4), "ReConnectLink failure 10", v181);
        LODWORD(v324[0]) = socket(2, 1, 0);
        if (LODWORD(v324[0]) == -1)
        {
          v186 = __error();
          v187 = strerror(*v186);
          rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v188, "Create", v187);
        }
        if ((v311.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v189 = &v311;
        else
          v189 = (std::string *)v311.__r_.__value_.__r.__words[0];
        rabit::utils::SockAddr::SockAddr((rabit::utils::SockAddr *)&v331, (const char *)v189, v313);
        if (connect((int)v324[0], &v331, 0x10u))
        {
          ++v315;
          if (LODWORD(v324[0]) == -1)
          {
            v210 = __error();
            v211 = strerror(*v210);
            rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v212, "Socket::Close double close the socket or close without create", v211);
          }
          else
          {
            close((int)v324[0]);
            LODWORD(v324[0]) = -1;
          }
        }
        else
        {
          v190 = 0;
          v191 = v309;
          do
          {
            v193 = send((int)v324[0], v191, 4 - v190, 0);
            if (v193 == -1)
            {
              if (*__error() == 35)
                break;
              v194 = __error();
              v195 = strerror(*v194);
              rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v196, "SendAll", v195);
            }
            v191 += v193;
            v190 += v193;
          }
          while (v190 < 4);
          rabit::utils::Assert((rabit::utils *)(v190 == 4), "ReConnectLink failure 12", v192);
          v197 = 0;
          v198 = (char *)v324 + 4;
          do
          {
            v199 = recv((int)v324[0], v198, 4 - v197, 64);
            v201 = v199;
            if (v199 == -1)
            {
              if (*__error() == 35)
                break;
              v202 = __error();
              v203 = strerror(*v202);
              rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v204, "RecvAll", v203);
            }
            else if (!v199)
            {
              break;
            }
            v198 += v201;
            v197 += v201;
          }
          while (v197 < 4);
          rabit::utils::Assert((rabit::utils *)(v197 == 4), "ReConnectLink failure 13", v200);
          rabit::utils::Check((rabit::utils *)(v312 == HIDWORD(v324[0])), "ReConnectLink failure, link rank inconsistent", v205);
          v208 = (_DWORD *)*((_QWORD *)v310 + 4);
          v207 = (_DWORD *)*((_QWORD *)v310 + 5);
          if (v208 == v207)
          {
LABEL_222:
            if ((unint64_t)v207 >= *((_QWORD *)v310 + 6))
            {
              v209 = std::vector<rabit::engine::AllreduceBase::LinkRecord>::__push_back_slow_path<rabit::engine::AllreduceBase::LinkRecord const&>(v308, (uint64_t)v324);
            }
            else
            {
              std::vector<rabit::engine::AllreduceBase::LinkRecord>::__construct_one_at_end[abi:ne180100]<rabit::engine::AllreduceBase::LinkRecord const&>((uint64_t)v308, (__int128 *)v324);
              v209 = (uint64_t)(v207 + 16);
            }
            *((_QWORD *)v310 + 5) = v209;
          }
          else
          {
            while (v208[1] != v312)
            {
              v208 += 16;
              if (v208 == v207)
                goto LABEL_222;
            }
            rabit::utils::Assert((rabit::utils *)(*v208 == -1), "Override a link that is active", v206);
            *v208 = v324[0];
          }
        }
        if (SHIBYTE(v311.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v311.__r_.__value_.__l.__data_);
        if ((_QWORD)v327)
        {
          *((_QWORD *)&v327 + 1) = v327;
          operator delete((void *)v327);
        }
        ++v151;
      }
      while (v151 < v317);
    }
    v213 = 0;
    v214 = &v315;
    do
    {
      v216 = send(v6, v214, 4 - v213, 0);
      if (v216 == -1)
      {
        if (*__error() == 35)
          break;
        v217 = __error();
        v218 = strerror(*v217);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v219, "SendAll", v218);
      }
      v214 = (int *)((char *)v214 + v216);
      v213 += v216;
    }
    while (v213 < 4);
    rabit::utils::Assert((rabit::utils *)(v213 == 4), "ReConnectLink failure 14", v215);
    if (*(_QWORD *)&v332.sa_len)
    {
      *(_QWORD *)&v332.sa_data[6] = *(_QWORD *)&v332.sa_len;
      operator delete(*(void **)&v332.sa_len);
    }
  }
  while (v315);
  v220 = 0;
  v221 = &v318;
  v222 = v310;
  do
  {
    v224 = send(v6, v221, 4 - v220, 0);
    if (v224 == -1)
    {
      if (*__error() == 35)
        break;
      v225 = __error();
      v226 = strerror(*v225);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v227, "SendAll", v226);
    }
    v221 = (unsigned int *)((char *)v221 + v224);
    v220 += v224;
  }
  while (v220 < 4);
  rabit::utils::Assert((rabit::utils *)(v220 == 4), "ReConnectLink failure 14", v223);
  if (v6 == -1)
  {
    v228 = __error();
    v229 = strerror(*v228);
    rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v230, "Socket::Close double close the socket or close without create", v229);
  }
  else
  {
    close(v6);
    v330 = -1;
  }
  if (v316 >= 1)
  {
    for (j = 0; j < v316; ++j)
    {
      LODWORD(v324[0]) = -1;
      v326 = 0u;
      v327 = 0u;
      v328 = 0;
      v232 = accept(v90, 0, 0);
      if (v232 == -1)
      {
        v233 = __error();
        v234 = strerror(*v233);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v235, "Accept", v234);
      }
      v236 = 0;
      LODWORD(v324[0]) = v232;
      v237 = v309;
      do
      {
        v239 = send((int)v324[0], v237, 4 - v236, 0);
        if (v239 == -1)
        {
          if (*__error() == 35)
            break;
          v240 = __error();
          v241 = strerror(*v240);
          rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v242, "SendAll", v241);
        }
        v237 += v239;
        v236 += v239;
      }
      while (v236 < 4);
      rabit::utils::Assert((rabit::utils *)(v236 == 4), "ReConnectLink failure 15", v238);
      v243 = 0;
      v244 = (char *)v324 + 4;
      do
      {
        v245 = recv((int)v324[0], v244, 4 - v243, 64);
        v247 = v245;
        if (v245 == -1)
        {
          if (*__error() == 35)
            break;
          v248 = __error();
          v249 = strerror(*v248);
          rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v250, "RecvAll", v249);
        }
        else if (!v245)
        {
          break;
        }
        v244 += v247;
        v243 += v247;
      }
      while (v243 < 4);
      rabit::utils::Assert((rabit::utils *)(v243 == 4), "ReConnectLink failure 15", v246);
      v222 = v310;
      v253 = (_DWORD *)*((_QWORD *)v310 + 4);
      v252 = (_DWORD *)*((_QWORD *)v310 + 5);
      if (v253 == v252)
      {
LABEL_268:
        if ((unint64_t)v252 >= *((_QWORD *)v310 + 6))
        {
          v254 = std::vector<rabit::engine::AllreduceBase::LinkRecord>::__push_back_slow_path<rabit::engine::AllreduceBase::LinkRecord const&>(v308, (uint64_t)v324);
        }
        else
        {
          std::vector<rabit::engine::AllreduceBase::LinkRecord>::__construct_one_at_end[abi:ne180100]<rabit::engine::AllreduceBase::LinkRecord const&>((uint64_t)v308, (__int128 *)v324);
          v254 = (uint64_t)(v252 + 16);
        }
        *((_QWORD *)v310 + 5) = v254;
      }
      else
      {
        while (v253[1] != HIDWORD(v324[0]))
        {
          v253 += 16;
          if (v253 == v252)
            goto LABEL_268;
        }
        rabit::utils::Assert((rabit::utils *)(*v253 == -1), "Override a link that is active", v251);
        *v253 = v324[0];
      }
      if ((_QWORD)v327)
      {
        *((_QWORD *)&v327 + 1) = v327;
        operator delete((void *)v327);
      }
    }
  }
  if (v90 == -1)
  {
    v256 = __error();
    v257 = strerror(*v256);
    rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v258, "Socket::Close double close the socket or close without create", v257);
  }
  else
  {
    close(v90);
  }
  *((_DWORD *)v222 + 5) = -1;
  *((_QWORD *)v222 + 9) = *((_QWORD *)v222 + 8);
  v259 = (int *)*((_QWORD *)v222 + 4);
  v260 = (int *)*((_QWORD *)v222 + 5);
  if (v259 != v260)
  {
    v261 = "ReConnectLink: bad socket";
    v262 = "SetNonBlock-1";
    v263 = "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc";
    do
    {
      v264 = *v259;
      if (*v259 == -1)
      {
        v269 = 1;
      }
      else
      {
        *(_DWORD *)&v332.sa_len = 0;
        LODWORD(v311.__r_.__value_.__l.__data_) = 4;
        if (getsockopt(v264, 0xFFFF, 4103, &v332, (socklen_t *)&v311))
        {
          v265 = __error();
          v266 = strerror(*v265);
          rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v267, "GetSockError", v266);
        }
        v269 = *(_DWORD *)&v332.sa_len == 9 || *(_DWORD *)&v332.sa_len == 4;
      }
      rabit::utils::Assert((rabit::utils *)!v269, v261, v255);
      v270 = fcntl(*v259, 3, 0);
      if (v270 == -1)
      {
        v271 = __error();
        v272 = strerror(*v271);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v273, v262, v272);
      }
      if (fcntl(*v259, 4, v270 | 4u) == -1)
      {
        v274 = __error();
        v275 = strerror(*v274);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v276, "SetNonBlock-2", v275);
      }
      v277 = *v259;
      *(_DWORD *)&v332.sa_len = 1;
      if (setsockopt(v277, 0xFFFF, 8, &v332, 4u) < 0)
      {
        v278 = __error();
        v279 = strerror(*v278);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v280, "SetKeepAlive", v279);
      }
      if (*((_BYTE *)v310 + 297))
      {
        if (*(int *)(v307 + 4) >= 1)
        {
          std::string::basic_string[abi:ne180100]<0>(&v332, v263);
          xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)v324, (uint64_t)&v332, 426, 1);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v324, (uint64_t)"tcp no delay is not implemented on non unix platforms", 53);
          xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)v324);
          if (SHIBYTE(v333[0]) < 0)
            operator delete(*(void **)&v332.sa_len);
        }
      }
      v281 = v322;
      for (k = v259[1]; v281; v281 = (uint64_t *)*v281)
      {
        v283 = *((_DWORD *)v281 + 7);
        if (k >= v283)
        {
          if (v283 >= k)
          {
            v284 = v261;
            v285 = (int **)*((_QWORD *)v310 + 9);
            if (k == *((_DWORD *)v310 + 6))
              *((_DWORD *)v310 + 5) = ((unint64_t)v285 - *((_QWORD *)v310 + 8)) >> 3;
            v286 = v263;
            v287 = *((_QWORD *)v310 + 10);
            if ((unint64_t)v285 >= v287)
            {
              v289 = v262;
              v290 = (_QWORD *)*((_QWORD *)v310 + 8);
              v291 = v285 - (int **)v290;
              v292 = v291 + 1;
              if ((unint64_t)(v291 + 1) >> 61)
                std::vector<void *>::__throw_length_error[abi:ne180100]();
              v293 = v287 - (_QWORD)v290;
              if (v293 >> 2 > v292)
                v292 = v293 >> 2;
              if ((unint64_t)v293 >= 0x7FFFFFFFFFFFFFF8)
                v294 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v294 = v292;
              if (v294)
              {
                if (v294 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v295 = (char *)operator new(8 * v294);
              }
              else
              {
                v295 = 0;
              }
              v296 = (int **)&v295[8 * v291];
              *v296 = v259;
              v288 = v296 + 1;
              if (v285 == v290)
              {
                v298 = v310;
              }
              else
              {
                do
                {
                  v297 = *--v285;
                  *--v296 = v297;
                }
                while (v285 != v290);
                v298 = v310;
                v285 = (int **)*((_QWORD *)v310 + 8);
              }
              *((_QWORD *)v298 + 8) = v296;
              *((_QWORD *)v298 + 9) = v288;
              *((_QWORD *)v298 + 10) = &v295[8 * v294];
              v262 = v289;
              if (v285)
                operator delete(v285);
            }
            else
            {
              *v285 = v259;
              v288 = v285 + 1;
            }
            *((_QWORD *)v310 + 9) = v288;
            k = v259[1];
            v263 = v286;
            v261 = v284;
            break;
          }
          ++v281;
        }
      }
      if (k == HIDWORD(v320))
        *((_QWORD *)v310 + 11) = v259;
      if (k == (_DWORD)v320)
        *((_QWORD *)v310 + 12) = v259;
      v259 += 16;
    }
    while (v259 != v260);
  }
  if (*v306 == -1)
  {
    v300 = 1;
    v299 = v310;
  }
  else
  {
    v299 = v310;
    v300 = *((_DWORD *)v310 + 5) != -1;
  }
  rabit::utils::Assert((rabit::utils *)v300, "cannot find parent in the link", v255);
  v302 = HIDWORD(v320) == -1 || *((_QWORD *)v299 + 11) != 0;
  rabit::utils::Assert((rabit::utils *)v302, "cannot find prev ring in the link", v301);
  v304 = (_DWORD)v320 == -1 || *((_QWORD *)v299 + 12) != 0;
  rabit::utils::Assert((rabit::utils *)v304, "cannot find next ring in the link", v303);
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::destroy(v322);
  return 1;
}

void sub_220F54C0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48)
{
  void *v50;
  __n128 v51;
  _QWORD *v52;
  const char *v53;
  size_t v54;

  if (a38 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v50 = __cxa_begin_catch(exception_object);
    if (*(int *)(dmlc::ThreadLocalStore<xgboost::GlobalConfiguration>::Get(void)::inst(v51) + 4) >= 1)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc");
      xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)&a39, (uint64_t)&__p, 446, 1);
      v52 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a39, (uint64_t)"failed in ReconnectLink ", 24);
      v53 = (const char *)(*(uint64_t (**)(void *))(*(_QWORD *)v50 + 16))(v50);
      v54 = strlen(v53);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v52, (uint64_t)v53, v54);
      xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)&a39);
      if (a38 < 0)
        operator delete(__p);
    }
    __cxa_end_catch();
    JUMPOUT(0x220F54BB4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t rabit::engine::AllreduceBase::Shutdown(rabit::engine::AllreduceBase *this)
{
  uint64_t *i;
  int *v3;
  int *v4;
  _DWORD *v5;
  int v6;
  int v7;
  int *v8;
  char *v9;
  const char *v10;
  int v12[6];
  void *__p[2];
  char v14;

  v3 = (int *)*((_QWORD *)this + 4);
  v4 = (int *)*((_QWORD *)this + 5);
  for (i = (uint64_t *)((char *)this + 32); v3 != v4; v3 += 16)
  {
    if (*v3 != -1)
    {
      close(*v3);
      *v3 = -1;
    }
  }
  std::vector<rabit::engine::AllreduceBase::LinkRecord>::__clear[abi:ne180100](i);
  *((_QWORD *)this + 9) = *((_QWORD *)this + 8);
  v5 = (_DWORD *)((char *)this + 176);
  v6 = *((char *)this + 199);
  if ((v6 & 0x80000000) == 0)
  {
    if (v6 != 4)
      goto LABEL_11;
LABEL_10:
    if (*v5 == 1280070990)
      return 1;
    goto LABEL_11;
  }
  if (*((_QWORD *)this + 23) == 4)
  {
    v5 = *(_DWORD **)v5;
    goto LABEL_10;
  }
LABEL_11:
  v7 = rabit::engine::AllreduceBase::ConnectTracker(this);
  v12[0] = v7;
  std::string::basic_string[abi:ne180100]<0>(__p, "shutdown");
  rabit::utils::TCPSocket::SendStr(v12, (char **)__p);
  if (v14 < 0)
    operator delete(__p[0]);
  if (v7 == -1)
  {
    v8 = __error();
    v9 = strerror(*v8);
    rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v10, "Socket::Close double close the socket or close without create", v9);
  }
  else
  {
    close(v7);
  }
  return 1;
}

void sub_220F55014(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v25;
  __n128 v26;
  _QWORD *v27;
  const char *v28;
  size_t v29;

  if (a23 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v25 = __cxa_begin_catch(exception_object);
    if (*(int *)(dmlc::ThreadLocalStore<xgboost::GlobalConfiguration>::Get(void)::inst(v26) + 4) >= 1)
    {
      std::string::basic_string[abi:ne180100]<0>(&a12, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc");
      xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)&__p, (uint64_t)&a12, 139, 1);
      v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)"Failed to shutdown due to", 25);
      v28 = (const char *)(*(uint64_t (**)(void *))(*(_QWORD *)v25 + 16))(v25);
      v29 = strlen(v28);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)v28, v29);
      xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)&__p);
      if (a17 < 0)
        operator delete(a12);
    }
    __cxa_end_catch();
    JUMPOUT(0x220F54FFCLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t rabit::engine::AllreduceBase::ConnectTracker(rabit::engine::AllreduceBase *this)
{
  uint64_t v2;
  __n128 v3;
  int *v4;
  char *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  unsigned int i;
  const char *v10;
  int v11;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  int v19;
  rabit::engine::AllreduceBase *v20;
  uint64_t v21;
  _QWORD *v22;
  int *v23;
  char *v24;
  const char *v25;
  unint64_t v26;
  int *v27;
  const char *v28;
  ssize_t v29;
  int *v30;
  char *v31;
  const char *v32;
  unint64_t v33;
  int *v34;
  ssize_t v35;
  const char *v36;
  ssize_t v37;
  int *v38;
  char *v39;
  const char *v40;
  const char *v41;
  unint64_t v42;
  char *v43;
  const char *v44;
  ssize_t v45;
  int *v46;
  char *v47;
  const char *v48;
  unint64_t v49;
  char *v50;
  const char *v51;
  ssize_t v52;
  int *v53;
  char *v54;
  const char *v55;
  void *__p[2];
  char v58;
  int v59;
  int v60;
  sockaddr v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v59 = 65433;
  v2 = socket(2, 1, 0);
  v60 = v2;
  if ((_DWORD)v2 == -1)
  {
    v4 = __error();
    v5 = strerror(*v4);
    rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v6, "Create", v5);
  }
  v7 = dmlc::ThreadLocalStore<xgboost::GlobalConfiguration>::Get(void)::inst(v3);
  v8 = 1;
  for (i = 2; ; i += 2)
  {
    v10 = (char *)this + 176;
    if (*((char *)this + 199) < 0)
      v10 = (const char *)*((_QWORD *)this + 22);
    rabit::utils::SockAddr::SockAddr((rabit::utils::SockAddr *)&v61, v10, *((_DWORD *)this + 56));
    if (!connect(v2, &v61, 0x10u))
      break;
    v11 = *(_DWORD *)(v7 + 4);
    if (v8 >= *((_DWORD *)this + 70))
    {
      if (v11 >= 1)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc");
        xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)&v61, (uint64_t)__p, 237, 1);
        v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v61, (uint64_t)"Connect to (failed): [", 22);
        v19 = *((char *)this + 199);
        v20 = v19 >= 0
            ? (rabit::engine::AllreduceBase *)((char *)this + 176)
            : (rabit::engine::AllreduceBase *)*((_QWORD *)this + 22);
        v21 = v19 >= 0 ? *((unsigned __int8 *)this + 199) : *((_QWORD *)this + 23);
        v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v20, v21);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"]\n", 2);
        xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)&v61);
        if (v58 < 0)
          operator delete(__p[0]);
      }
      v23 = __error();
      v24 = strerror(*v23);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v25, "Connect", v24);
      break;
    }
    if (v11 >= 1)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/allreduce_base.cc");
      xgboost::ConsoleLogger::ConsoleLogger((xgboost::BaseLogger *)&v61, (uint64_t)__p, 240, 1);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v61, (uint64_t)"Retry connect to ip(retry time ", 31);
      v12 = (_QWORD *)std::ostream::operator<<();
      v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"): [", 4);
      v14 = *((char *)this + 199);
      if (v14 >= 0)
        v15 = (char *)this + 176;
      else
        v15 = (char *)*((_QWORD *)this + 22);
      if (v14 >= 0)
        v16 = *((unsigned __int8 *)this + 199);
      else
        v16 = *((_QWORD *)this + 23);
      v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"]\n", 2);
      xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)&v61);
      if (v58 < 0)
        operator delete(__p[0]);
    }
    sleep(i);
    ++v8;
  }
  v26 = 0;
  v27 = &v59;
  do
  {
    v29 = send(v2, v27, 4 - v26, 0);
    if (v29 == -1)
    {
      if (*__error() == 35)
        break;
      v30 = __error();
      v31 = strerror(*v30);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v32, "SendAll", v31);
    }
    v27 = (int *)((char *)v27 + v29);
    v26 += v29;
  }
  while (v26 < 4);
  rabit::utils::Assert((rabit::utils *)(v26 == 4), "ReConnectLink failure 1", v28);
  v33 = 0;
  v34 = &v59;
  do
  {
    v35 = recv(v2, v34, 4 - v33, 64);
    v37 = v35;
    if (v35 == -1)
    {
      if (*__error() == 35)
        break;
      v38 = __error();
      v39 = strerror(*v38);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v40, "RecvAll", v39);
    }
    else if (!v35)
    {
      break;
    }
    v34 = (int *)((char *)v34 + v37);
    v33 += v37;
  }
  while (v33 < 4);
  rabit::utils::Assert((rabit::utils *)(v33 == 4), "ReConnectLink failure 2", v36);
  rabit::utils::Check((rabit::utils *)(v59 == 65433), "sync::Invalid tracker message, init failure", v41);
  v42 = 0;
  v43 = (char *)this + 272;
  do
  {
    v45 = send(v2, v43, 4 - v42, 0);
    if (v45 == -1)
    {
      if (*__error() == 35)
        break;
      v46 = __error();
      v47 = strerror(*v46);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v48, "SendAll", v47);
    }
    v43 += v45;
    v42 += v45;
  }
  while (v42 < 4);
  rabit::utils::Assert((rabit::utils *)(v42 == 4), "ReConnectLink failure 3", v44);
  v49 = 0;
  v50 = (char *)this + 276;
  do
  {
    v52 = send(v2, v50, 4 - v49, 0);
    if (v52 == -1)
    {
      if (*__error() == 35)
        break;
      v53 = __error();
      v54 = strerror(*v53);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v55, "SendAll", v54);
    }
    v50 += v52;
    v49 += v52;
  }
  while (v49 < 4);
  rabit::utils::Assert((rabit::utils *)(v49 == 4), "ReConnectLink failure 3", v51);
  rabit::utils::TCPSocket::SendStr(&v60, (char **)this + 16);
  return v2;
}

void sub_220F555FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void rabit::utils::TCPSocket::SendStr(int *a1, char **a2)
{
  unint64_t v4;
  char *v5;
  int *v6;
  const char *v7;
  ssize_t v8;
  int *v9;
  char *v10;
  const char *v11;
  const char *v12;
  char *v13;
  char v14;
  char *v15;
  unint64_t v16;
  char *v17;
  char *v18;
  ssize_t v19;
  int *v20;
  char *v21;
  const char *v22;
  int v23;

  v4 = 0;
  LODWORD(v5) = *((unsigned __int8 *)a2 + 23);
  if ((char)v5 < 0)
    v5 = a2[1];
  v23 = (int)v5;
  v6 = &v23;
  do
  {
    v8 = send(*a1, v6, 4 - v4, 0);
    if (v8 == -1)
    {
      if (*__error() == 35)
        break;
      v9 = __error();
      v10 = strerror(*v9);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v11, "SendAll", v10);
    }
    v6 = (int *)((char *)v6 + v8);
    v4 += v8;
  }
  while (v4 < 4);
  rabit::utils::Assert((rabit::utils *)(v4 == 4), "error during send SendStr", v7);
  if (v23)
  {
    v13 = (char *)*((unsigned __int8 *)a2 + 23);
    v14 = (char)v13;
    v15 = a2[1];
    v16 = 0;
    if ((char)v13 >= 0)
      v17 = (char *)*((unsigned __int8 *)a2 + 23);
    else
      v17 = a2[1];
    if (v17)
    {
      if ((char)v13 >= 0)
        v18 = (char *)a2;
      else
        v18 = *a2;
      do
      {
        v19 = send(*a1, v18, (size_t)&v17[-v16], 0);
        if (v19 == -1)
        {
          if (*__error() == 35)
            break;
          v20 = __error();
          v21 = strerror(*v20);
          rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v22, "SendAll", v21);
        }
        v18 += v19;
        v16 += v19;
      }
      while (v16 < (unint64_t)v17);
      v13 = (char *)*((unsigned __int8 *)a2 + 23);
      v15 = a2[1];
      v14 = *((_BYTE *)a2 + 23);
    }
    if (v14 < 0)
      v13 = v15;
    rabit::utils::Assert((rabit::utils *)(v16 == (_QWORD)v13), "error during send SendStr", v12);
  }
}

void rabit::engine::AllreduceBase::TrackerPrint(uint64_t a1, char *a2)
{
  _QWORD *v3;
  int v4;
  int v5;
  int *v6;
  char *v7;
  const char *v8;
  uint64_t *v9;
  void *__p[2];
  char v11;
  int v12;

  v3 = (_QWORD *)(a1 + 176);
  v4 = *(char *)(a1 + 199);
  if (v4 < 0)
  {
    if (*(_QWORD *)(a1 + 184) != 4)
      goto LABEL_7;
    v3 = (_QWORD *)*v3;
  }
  else if (v4 != 4)
  {
    goto LABEL_7;
  }
  if (*(_DWORD *)v3 == 1280070990)
  {
    if (a2[23] >= 0)
      v9 = (uint64_t *)a2;
    else
      v9 = *(uint64_t **)a2;
    rabit::utils::Printf((rabit::utils *)a1, a2, v9);
    return;
  }
LABEL_7:
  v5 = rabit::engine::AllreduceBase::ConnectTracker((rabit::engine::AllreduceBase *)a1);
  v12 = v5;
  std::string::basic_string[abi:ne180100]<0>(__p, "print");
  rabit::utils::TCPSocket::SendStr(&v12, (char **)__p);
  if (v11 < 0)
    operator delete(__p[0]);
  rabit::utils::TCPSocket::SendStr(&v12, (char **)a2);
  if (v5 == -1)
  {
    v6 = __error();
    v7 = strerror(*v6);
    rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v8, "Socket::Close double close the socket or close without create", v7);
  }
  else
  {
    close(v5);
  }
}

void sub_220F558CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void rabit::utils::Printf(rabit::utils *this, const char *a2, ...)
{
  void *v2;
  _QWORD v3[33];
  int v4;
  va_list v5;
  va_list va;

  va_start(va, a2);
  v2 = operator new(0x1008uLL);
  bzero(v2, 0x1001uLL);
  va_copy(v5, va);
  vsnprintf((char *)v2, 0x1000uLL, "%s", va);
  xgboost::BaseLogger::BaseLogger((xgboost::BaseLogger *)v3);
  v4 = 4;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)v2, 4096);
  xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)v3);
  operator delete(v2);
}

void sub_220F55974(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  xgboost::ConsoleLogger::~ConsoleLogger((xgboost::ConsoleLogger *)va);
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t rabit::engine::AllreduceBase::SetParam(rabit::engine::AllreduceBase *this, const char *__s1, const char *a3)
{
  BOOL v6;
  int v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  int v15;
  const char *v16;
  uint64_t result;
  uint64_t v18;
  char v19;

  if (!strcmp(__s1, "rabit_tracker_uri"))
    MEMORY[0x227666C18]((char *)this + 176, a3);
  if (!strcmp(__s1, "rabit_tracker_port"))
    *((_DWORD *)this + 56) = atoi(a3);
  if (!strcmp(__s1, "rabit_task_id"))
    MEMORY[0x227666C18]((char *)this + 128, a3);
  if (!strcmp(__s1, "DMLC_TRACKER_URI"))
    MEMORY[0x227666C18]((char *)this + 176, a3);
  if (!strcmp(__s1, "DMLC_TRACKER_PORT"))
    *((_DWORD *)this + 56) = atoi(a3);
  if (!strcmp(__s1, "DMLC_TASK_ID"))
    MEMORY[0x227666C18]((char *)this + 128, a3);
  if (!strcmp(__s1, "DMLC_ROLE"))
    MEMORY[0x227666C18]((char *)this + 200, a3);
  if (!strcmp(__s1, "rabit_world_size"))
    *((_DWORD *)this + 69) = atoi(a3);
  if (!strcmp(__s1, "rabit_hadoop_mode"))
  {
    v6 = !strcasecmp(a3, "true") || atoi(a3) != 0;
    *((_BYTE *)this + 16) = v6;
  }
  if (!strcmp(__s1, "rabit_tree_reduce_minsize"))
    *((_QWORD *)this + 33) = atoi(a3);
  if (!strcmp(__s1, "rabit_reduce_ring_mincount"))
  {
    v7 = atoi(a3);
    *((_QWORD *)this + 32) = v7;
    rabit::utils::Assert((rabit::utils *)(v7 != 0), "rabit_reduce_ring_mincount should be greater than 0", v8);
  }
  if (!strcmp(__s1, "rabit_reduce_buffer"))
  {
    v19 = 0;
    v18 = 0;
    v9 = sscanf(a3, "%lu%c", &v18, &v19);
    v11 = v18;
    if (v9 != 1)
    {
      if (v9 != 2)
      {
        rabit::utils::Error((rabit::utils *)"invalid format for %s,shhould be {integer}{unit}, unit can be {B, KB, MB, GB}", v10, __s1);
LABEL_34:
        v11 = 0;
        goto LABEL_35;
      }
      if (v19 > 74)
      {
        if (v19 == 77)
        {
          v11 = v18 << 20;
          goto LABEL_35;
        }
        if (v19 == 75)
        {
          v11 = v18 << 10;
          goto LABEL_35;
        }
LABEL_62:
        rabit::utils::Error((rabit::utils *)"invalid format for %s", v10, __s1);
        goto LABEL_34;
      }
      if (v19 != 66)
      {
        if (v19 == 71)
        {
          v11 = v18 << 30;
          goto LABEL_35;
        }
        goto LABEL_62;
      }
    }
LABEL_35:
    *((_QWORD *)this + 30) = (unint64_t)(v11 + 7) >> 3;
  }
  if (!strcmp(__s1, "DMLC_WORKER_CONNECT_RETRY"))
    *((_DWORD *)this + 70) = atoi(a3);
  if (!strcmp(__s1, "rabit_bootstrap_cache"))
  {
    v12 = !strcasecmp(a3, "true") || atoi(a3) != 0;
    *((_BYTE *)this + 284) = v12;
  }
  if (!strcmp(__s1, "rabit_debug"))
  {
    v13 = !strcasecmp(a3, "true") || atoi(a3) != 0;
    *((_BYTE *)this + 285) = v13;
  }
  if (!strcmp(__s1, "rabit_timeout"))
  {
    v14 = !strcasecmp(a3, "true") || atoi(a3) != 0;
    *((_BYTE *)this + 296) = v14;
  }
  if (!strcmp(__s1, "rabit_timeout_sec"))
  {
    v15 = atoi(a3);
    *((_QWORD *)this + 36) = v15;
    rabit::utils::Assert((rabit::utils *)(v15 >= 0), "rabit_timeout_sec should be non negative second", v16);
  }
  result = strcmp(__s1, "rabit_enable_tcp_no_delay");
  if (!(_DWORD)result)
  {
    result = strcmp(a3, "true");
    *((_BYTE *)this + 297) = (_DWORD)result == 0;
  }
  return result;
}

uint64_t rabit::engine::AllreduceBase::TryAllreduce(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, void (*a5)(unint64_t, unint64_t, unint64_t, unint64_t *))
{
  if (*(_QWORD *)(a1 + 256) >= a4)
    return rabit::engine::AllreduceBase::TryAllreduceTree(a1, (uint64_t)a2, a3, a4, (void (*)(unint64_t, const char *, unint64_t, unint64_t *))a5);
  else
    return rabit::engine::AllreduceBase::TryAllreduceRing(a1, a2, a3, a4, a5);
}

uint64_t rabit::engine::AllreduceBase::TryAllreduceRing(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, void (*a5)(unint64_t, unint64_t, unint64_t, unint64_t *))
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  const char *v14;
  unint64_t v15;
  unint64_t v16;

  result = rabit::engine::AllreduceBase::TryReduceScatterRing(a1, (uint64_t)a2, a3, a4, a5);
  if (!(_DWORD)result)
  {
    v10 = (a4 + *(int *)(a1 + 276) - 1) / *(int *)(a1 + 276);
    v11 = v10 * *(int *)(a1 + 272);
    if (v11 >= a4)
      v12 = a4;
    else
      v12 = v10 * *(int *)(a1 + 272);
    v13 = v10 + v11;
    if (v13 >= a4)
      v13 = a4;
    v14 = (const char *)(v13 * a3);
    v15 = v10 * *(int *)(*(_QWORD *)(a1 + 88) + 4);
    v16 = v10 + v15;
    if (v16 >= a4)
      v16 = a4;
    if (v15 >= a4)
      v15 = a4;
    return rabit::engine::AllreduceBase::TryAllgatherRing((rabit::engine::AllreduceBase *)a1, a2, (const char *)(a4 * a3), (const char *)(v12 * a3), v14, (v16 - v15) * a3);
  }
  return result;
}

uint64_t rabit::engine::AllreduceBase::TryAllreduceTree(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(unint64_t, const char *, unint64_t, unint64_t *))
{
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  unint64_t v17;
  uint64_t v18;
  const char *v19;
  _BOOL4 v21;
  char v22;
  int v23;
  _QWORD *v24;
  int v25;
  _QWORD *v26;
  int v27;
  _QWORD *v28;
  uint64_t v29;
  int v30;
  _QWORD *v31;
  const char *v32;
  int v33;
  _QWORD *v34;
  int v35;
  _QWORD *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t *v40;
  rabit::engine::AllreduceBase::LinkRecord *v41;
  unint64_t v42;
  int v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  const char *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  unint64_t v60;
  ssize_t v61;
  int v62;
  uint64_t *v63;
  const char *v64;
  const char *v65;
  unint64_t v66;
  ssize_t v67;
  const char *v68;
  ssize_t v69;
  int64_t v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  ssize_t v74;
  int v75;
  int *v76;
  int *v77;
  char *v78;
  const char *v79;
  int v81;
  unint64_t v82;
  const char *v83;
  const char *v84;
  unint64_t v86;
  const char *v87;
  unint64_t v90;
  __int128 v91;
  __int128 v92;
  int v93;

  v5 = 0;
  if (!a4)
    return v5;
  v7 = *(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 64);
  if (!v7)
    return v5;
  v8 = v7 >> 3;
  if ((int)(v7 >> 3) <= 0)
  {
    v91 = 0u;
    v92 = 0u;
    v93 = 1065353216;
    goto LABEL_103;
  }
  v10 = 0;
  v11 = (const char *)(a4 * a3);
  v82 = *(_QWORD *)(a1 + 264) / a3 * a3;
  v12 = (v7 >> 3);
  do
  {
    v13 = *(_QWORD *)(a1 + 64);
    if (v10 != *(_DWORD *)(a1 + 20))
    {
      rabit::engine::AllreduceBase::LinkRecord::InitBuffer(*(rabit::engine::AllreduceBase::LinkRecord **)(v13 + 8 * v10), a3, a4, *(_QWORD *)(a1 + 240));
      v13 = *(_QWORD *)(a1 + 64);
    }
    v14 = *(_QWORD *)(v13 + 8 * v10);
    *(_QWORD *)(v14 + 8) = 0;
    *(_QWORD *)(v14 + 16) = 0;
    ++v10;
  }
  while (v12 != v10);
  v87 = 0;
  v15 = 0;
  v81 = v8;
  if ((_DWORD)v8 == (*(_DWORD *)(a1 + 20) != -1))
    v16 = v11;
  else
    v16 = 0;
  v91 = 0uLL;
  v92 = 0uLL;
  v93 = 1065353216;
  v17 = v82;
LABEL_12:
  v18 = 0;
  v19 = v16;
  v86 = (unint64_t)v15;
  v21 = v15 != v11 && v15 < v16;
  v22 = 1;
  do
  {
    while (1)
    {
      if (v18 == *(_DWORD *)(a1 + 20))
      {
        if (v11 != v87)
        {
          LODWORD(v90) = **(_DWORD **)(*(_QWORD *)(a1 + 64) + 8 * v18);
          v23 = v90;
          v24 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v91, v90, &v90);
          *((_DWORD *)v24 + 5) = v23;
          *((_WORD *)v24 + 12) |= 1u;
          LODWORD(v90) = **(_DWORD **)(*(_QWORD *)(a1 + 64) + 8 * v18);
          v25 = v90;
          v26 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v91, v90, &v90);
          v22 = 0;
          *((_DWORD *)v26 + 5) = v25;
          *((_WORD *)v26 + 12) |= 2u;
        }
        if (v21)
        {
          LODWORD(v90) = **(_DWORD **)(*(_QWORD *)(a1 + 64) + 8 * v18);
          v27 = v90;
          v28 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v91, v90, &v90);
          *((_DWORD *)v28 + 5) = v27;
          *((_WORD *)v28 + 12) |= 4u;
        }
        break;
      }
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v18);
      if (*(const char **)(v29 + 8) != v11)
      {
        LODWORD(v90) = *(_DWORD *)v29;
        v30 = v90;
        v31 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v91, v90, &v90);
        *((_DWORD *)v31 + 5) = v30;
        *((_WORD *)v31 + 12) |= 1u;
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v18);
      }
      v32 = *(const char **)(v29 + 16);
      if (v32 == v11)
        break;
      if (v32 < v87)
      {
        LODWORD(v90) = *(_DWORD *)v29;
        v33 = v90;
        v34 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v91, v90, &v90);
        *((_DWORD *)v34 + 5) = v33;
        *((_WORD *)v34 + 12) |= 4u;
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v18);
      }
      LODWORD(v90) = *(_DWORD *)v29;
      v35 = v90;
      v36 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v91, v90, &v90);
      v22 = 0;
      *((_DWORD *)v36 + 5) = v35;
      *((_WORD *)v36 + 12) |= 2u;
      if (++v18 == v12)
        goto LABEL_34;
    }
    ++v18;
  }
  while (v18 != v12);
  if ((v22 & 1) != 0)
  {
LABEL_103:
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)&v91);
    return 0;
  }
LABEL_34:
  rabit::utils::PollHelper::Poll((float *)&v91, *(_QWORD *)(a1 + 288));
  v38 = 0;
  v39 = v19;
  do
  {
    if (v38 != *(_DWORD *)(a1 + 20))
    {
      v40 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::find<int>(v91, *((unint64_t *)&v91 + 1), **(_DWORD **)(*(_QWORD *)(a1 + 64) + 8 * v38));
      if (v40)
      {
        if ((v40[3] & 1) != 0)
        {
          while (1)
          {
            v41 = *(rabit::engine::AllreduceBase::LinkRecord **)(*(_QWORD *)(a1 + 64) + 8 * v38);
            v42 = *((_QWORD *)v41 + 1);
            if (v42 >= (unint64_t)v11 || v42 - (unint64_t)v19 >= v17)
              break;
            v5 = rabit::engine::AllreduceBase::LinkRecord::ReadToRingBuffer(v41, v86, v11);
            if ((_DWORD)v5)
              goto LABEL_115;
          }
        }
      }
    }
    ++v38;
  }
  while (v38 != v12);
  v44 = *(_DWORD *)(a1 + 20);
  if (v81 > (v44 != -1))
  {
    v45 = 0;
    v46 = 0;
    v47 = (unint64_t)v11;
    do
    {
      if (v45 != *(_DWORD *)(a1 + 20))
      {
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v45);
        if (*(_QWORD *)(v48 + 8) < v47)
          v47 = *(_QWORD *)(v48 + 8);
        if (v46)
          v49 = v46 == *(_QWORD *)(v48 + 32);
        else
          v49 = 1;
        rabit::utils::Assert((rabit::utils *)v49, "buffer size inconsistent", v37);
        v46 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v45) + 32);
      }
      ++v45;
    }
    while (v12 != v45);
    rabit::utils::Assert((rabit::utils *)(v46 != 0), "must assign buffer_size", v37);
    v39 = v19;
    v51 = v47 / a3 * a3;
    if (v51 < (unint64_t)v11)
      v51 = v51 / v17 * v17;
    if ((unint64_t)v19 < v51)
    {
      do
      {
        v52 = (unint64_t)v39 % v46;
        v53 = v51;
        v54 = v51 - (_QWORD)v39;
        if (v54 >= v46 - (unint64_t)v39 % v46)
          v55 = v46 - (unint64_t)v39 % v46;
        else
          v55 = v54;
        rabit::utils::Assert((rabit::utils *)(v55 % a3 == 0), "Allreduce: size check", v50);
        v56 = 0;
        v83 = v39;
        v57 = &v39[a2];
        do
        {
          if (v56 != *(_DWORD *)(a1 + 20))
          {
            v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v56) + 24);
            v90 = a3;
            a5(v58 + v52, v57, v55 / a3, &v90);
          }
          ++v56;
        }
        while (v12 != v56);
        v39 = &v83[v55];
        v51 = v53;
      }
      while ((unint64_t)&v83[v55] < v53);
    }
    v44 = *(_DWORD *)(a1 + 20);
    v17 = v82;
  }
  v59 = v39;
  v84 = v39;
  v60 = v86;
  if (v44 == -1)
    goto LABEL_93;
  if ((unint64_t)v39 > v86)
  {
    v61 = send(**(_DWORD **)(*(_QWORD *)(a1 + 64) + 8 * v44), (const void *)(a2 + v86), (size_t)&v39[-v86], 0);
    if (v61 == -1)
    {
      v62 = *__error();
      if (v62 && v62 != 35)
      {
        if (v62 == 54)
          v5 = 1;
        else
          v5 = 3;
        goto LABEL_112;
      }
    }
    else
    {
      v60 = v61 + v86;
    }
  }
  v63 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::find<int>(v91, *((unint64_t *)&v91 + 1), **(_DWORD **)(*(_QWORD *)(a1 + 64) + 8 * *(int *)(a1 + 20)));
  if (!v63
    || (v63[3] & 1) == 0
    || (v64 = (const char *)(v11 - v87), v11 <= v87)
    || (v17 >= (unint64_t)v64 ? (v65 = (const char *)(v11 - v87)) : (v65 = (const char *)v17), !v65))
  {
LABEL_92:
    v59 = (const char *)v60;
    v39 = v87;
LABEL_93:
    v38 = 0;
    while (1)
    {
      if (v38 != *(_DWORD *)(a1 + 20))
      {
        v72 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v38);
        v73 = *(_QWORD *)(v72 + 16);
        if ((unint64_t)v39 > v73)
        {
          v74 = send(*(_DWORD *)v72, (const void *)(a2 + v73), (size_t)&v39[-v73], 0);
          if (v74 == -1)
          {
            v75 = *__error();
            if (v75 && v75 != 35)
            {
              if (v75 == 54)
                v5 = 1;
              else
                v5 = 3;
              goto LABEL_115;
            }
          }
          else
          {
            *(_QWORD *)(v72 + 16) += v74;
          }
        }
      }
      if (v12 == ++v38)
      {
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)&v91);
        v91 = 0u;
        v92 = 0u;
        v87 = v39;
        v15 = v59;
        v93 = 1065353216;
        v16 = v84;
        goto LABEL_12;
      }
    }
  }
  v66 = 0;
  while (1)
  {
    v67 = recv(**(_DWORD **)(*(_QWORD *)(a1 + 64) + 8 * *(int *)(a1 + 20)), (void *)&v87[a2], v11 - v87, 0);
    v69 = v67;
    if (v67 != -1)
      break;
    v71 = *__error();
    if (v71 && v71 != 35)
    {
      if (v71 == 54)
        v5 = 1;
      else
        v5 = 3;
LABEL_112:
      v38 = *(int *)(a1 + 20);
      goto LABEL_115;
    }
LABEL_91:
    if (v66 >= (unint64_t)v65)
      goto LABEL_92;
  }
  if (v67)
  {
    v87 += v67;
    rabit::utils::Assert((rabit::utils *)((unint64_t)v87 <= v60), "Allreduce: boundary error", v68);
    v66 += v69;
    while (v66 > (unint64_t)v65)
    {
      v70 = v64 - v65;
      if (v17 < v64 - v65)
        v70 = v17;
      v65 += v70;
    }
    goto LABEL_91;
  }
  v76 = *(int **)(*(_QWORD *)(a1 + 64) + 8 * *(int *)(a1 + 20));
  if (*v76 == -1)
  {
    v77 = __error();
    v78 = strerror(*v77);
    rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v79, "Socket::Close double close the socket or close without create", v78);
  }
  else
  {
    close(*v76);
    *v76 = -1;
  }
  v38 = *(int *)(a1 + 20);
  v5 = 2;
LABEL_115:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v38);
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)&v91);
  return v5;
}

void sub_220F56590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void rabit::engine::AllreduceBase::LinkRecord::InitBuffer(rabit::engine::AllreduceBase::LinkRecord *this, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;

  v6 = a3 * a2 + 7;
  if (a4 >= v6 >> 3)
    v7 = v6 >> 3;
  else
    v7 = a4;
  std::vector<unsigned long>::resize((uint64_t)this + 40, v7);
  v8 = ((*((_QWORD *)this + 6) - *((_QWORD *)this + 5)) & 0xFFFFFFFFFFFFFFF8) / a2 * a2;
  *((_QWORD *)this + 4) = v8;
  rabit::utils::Assert((rabit::utils *)(v8 >= a2), "too large type_nbytes=%lu, buffer_size=%lu", v9, a2, v8);
  if (*((_QWORD *)this + 6) == *((_QWORD *)this + 5))
    v10 = 0;
  else
    v10 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 3) = v10;
}

void rabit::utils::PollHelper::Poll(float *a1, int a2)
{
  unint64_t v3;
  pollfd *v4;
  uint64_t v5;
  pollfd *v6;
  _QWORD *v7;
  char *v8;
  pollfd v9;
  pollfd *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  pollfd *v15;
  pollfd v16;
  int v17;
  pollfd *v18;
  int revents;
  int events;
  unint64_t fd;
  int8x8_t v22;
  uint8x8_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t **v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  std::string *Entry;
  _QWORD *v37;
  int *v38;
  char *v39;
  const char *v40;
  char v42;

  v3 = *((_QWORD *)a1 + 3);
  if (v3)
  {
    if (v3 >> 61)
      std::vector<void *>::__throw_length_error[abi:ne180100]();
    v4 = (pollfd *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v3);
    v6 = &v4[v5];
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (_QWORD *)*((_QWORD *)a1 + 2);
  if (v7)
  {
    v8 = (char *)v4;
    do
    {
      v9 = *(pollfd *)((char *)v7 + 20);
      if (v8 >= (char *)v6)
      {
        v11 = (v8 - (char *)v4) >> 3;
        v12 = v11 + 1;
        if ((unint64_t)(v11 + 1) >> 61)
          std::vector<void *>::__throw_length_error[abi:ne180100]();
        if (((char *)v6 - (char *)v4) >> 2 > v12)
          v12 = ((char *)v6 - (char *)v4) >> 2;
        if ((unint64_t)((char *)v6 - (char *)v4) >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v12;
        if (v13)
          v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v13);
        else
          v14 = 0;
        v15 = (pollfd *)(v13 + 8 * v11);
        *v15 = v9;
        v10 = v15 + 1;
        while (v8 != (char *)v4)
        {
          v16 = (pollfd)*((_QWORD *)v8 - 1);
          v8 -= 8;
          v15[-1] = v16;
          --v15;
        }
        v6 = (pollfd *)(v13 + 8 * v14);
        if (v4)
          operator delete(v4);
        v4 = v15;
      }
      else
      {
        *(pollfd *)v8 = v9;
        v10 = (pollfd *)(v8 + 8);
      }
      v7 = (_QWORD *)*v7;
      v8 = (char *)v10;
    }
    while (v7);
  }
  else
  {
    v10 = v4;
  }
  v17 = poll(v4, (unint64_t)((char *)v10 - (char *)v4) >> 3, 1000 * a2);
  if (v17)
  {
    if (v17 < 0)
    {
      v38 = __error();
      v39 = strerror(*v38);
      rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v40, "Poll", v39);
    }
    else if (v4 != v10)
    {
      v18 = v4;
      do
      {
        revents = (unsigned __int16)v18->revents;
        events = (unsigned __int16)v18->events;
        fd = v18->fd;
        if ((events & revents) != 0)
        {
          *((_WORD *)std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1, fd, v18)+ 12) = events & revents;
          goto LABEL_33;
        }
        v22 = *(int8x8_t *)(a1 + 2);
        if (v22)
        {
          v23 = (uint8x8_t)vcnt_s8(v22);
          v23.i16[0] = vaddlv_u8(v23);
          if (v23.u32[0] > 1uLL)
          {
            v24 = v18->fd;
            if (*(_QWORD *)&v22 <= fd)
              v24 = fd % *(_QWORD *)&v22;
          }
          else
          {
            v24 = (*(_QWORD *)&v22 - 1) & fd;
          }
          v25 = *(_QWORD *)a1;
          v26 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v24);
          if (v26)
          {
            v27 = *v26;
            if (*v26)
            {
              v28 = *(_QWORD *)&v22 - 1;
              do
              {
                v29 = v27[1];
                if (v29 == fd)
                {
                  if (*((_DWORD *)v27 + 4) == (_DWORD)fd)
                  {
                    if (v23.u32[0] > 1uLL)
                    {
                      if (*(_QWORD *)&v22 <= fd)
                        fd %= *(_QWORD *)&v22;
                    }
                    else
                    {
                      fd &= v28;
                    }
                    v30 = *v27;
                    v31 = *(uint64_t **)(v25 + 8 * fd);
                    do
                    {
                      v32 = v31;
                      v31 = (uint64_t *)*v31;
                    }
                    while (v31 != v27);
                    if (v32 == (uint64_t *)(a1 + 4))
                      goto LABEL_70;
                    v33 = v32[1];
                    if (v23.u32[0] > 1uLL)
                    {
                      if (v33 >= *(_QWORD *)&v22)
                        v33 %= *(_QWORD *)&v22;
                    }
                    else
                    {
                      v33 &= v28;
                    }
                    if (v33 == fd)
                    {
LABEL_72:
                      if (v30)
                      {
                        v34 = *(_QWORD *)(v30 + 8);
                        goto LABEL_74;
                      }
                    }
                    else
                    {
LABEL_70:
                      if (!v30)
                        goto LABEL_71;
                      v34 = *(_QWORD *)(v30 + 8);
                      if (v23.u32[0] > 1uLL)
                      {
                        v35 = *(_QWORD *)(v30 + 8);
                        if (v34 >= *(_QWORD *)&v22)
                          v35 = v34 % *(_QWORD *)&v22;
                      }
                      else
                      {
                        v35 = v34 & v28;
                      }
                      if (v35 != fd)
                      {
LABEL_71:
                        *(_QWORD *)(v25 + 8 * fd) = 0;
                        v30 = *v27;
                        goto LABEL_72;
                      }
LABEL_74:
                      if (v23.u32[0] > 1uLL)
                      {
                        if (v34 >= *(_QWORD *)&v22)
                          v34 %= *(_QWORD *)&v22;
                      }
                      else
                      {
                        v34 &= v28;
                      }
                      if (v34 != fd)
                      {
                        *(_QWORD *)(*(_QWORD *)a1 + 8 * v34) = v32;
                        v30 = *v27;
                      }
                    }
                    *v32 = v30;
                    *v27 = 0;
                    --*((_QWORD *)a1 + 3);
                    operator delete(v27);
                    break;
                  }
                }
                else
                {
                  if (v23.u32[0] > 1uLL)
                  {
                    if (v29 >= *(_QWORD *)&v22)
                      v29 %= *(_QWORD *)&v22;
                  }
                  else
                  {
                    v29 &= v28;
                  }
                  if (v29 != v24)
                    break;
                }
                v27 = (uint64_t *)*v27;
              }
              while (v27);
            }
          }
        }
LABEL_33:
        ++v18;
      }
      while (v18 != v10);
    }
  }
  else
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v42);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/rabit/src/rabit/internal/socket.h");
    v37 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v42);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"Poll timeout", 12);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v42);
  }
  if (v4)
    operator delete(v4);
}

void sub_220F56A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a17);
  if (v17)
    operator delete(v17);
  _Unwind_Resume(a1);
}

uint64_t rabit::engine::AllreduceBase::LinkRecord::ReadToRingBuffer(rabit::engine::AllreduceBase::LinkRecord *this, uint64_t a2, const char *a3)
{
  const char *v6;
  unint64_t v7;
  const char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const char *v12;
  size_t v13;
  size_t v14;
  ssize_t v15;
  ssize_t v16;
  uint64_t result;
  int *v18;
  int v19;
  int *v20;
  char *v21;
  const char *v22;

  rabit::utils::Assert((rabit::utils *)(*((_QWORD *)this + 3) != 0), "ReadToRingBuffer: buffer not allocated", a3);
  rabit::utils::Assert((rabit::utils *)(*((_QWORD *)this + 1) <= (unint64_t)a3), "ReadToRingBuffer: max_size_read check", v6);
  v7 = *((_QWORD *)this + 1) - a2;
  rabit::utils::Assert((rabit::utils *)(v7 <= *((_QWORD *)this + 4)), "Allreduce: boundary check", v8);
  v9 = *((_QWORD *)this + 1);
  v10 = *((_QWORD *)this + 4);
  v11 = v9 % v10;
  v12 = &a3[-v9];
  if ((unint64_t)v12 >= v10 - v7)
    v12 = (const char *)(v10 - v7);
  v13 = v10 - v11;
  if ((unint64_t)v12 >= v13)
    v14 = v13;
  else
    v14 = (size_t)v12;
  if (!v14)
    return 0;
  v15 = recv(*(_DWORD *)this, (void *)(*((_QWORD *)this + 3) + v11), v14, 0);
  if (v15 == -1)
  {
    v18 = __error();
    result = 0;
    v19 = *v18;
    if (v19 && v19 != 35)
    {
      if (v19 == 54)
        return 1;
      else
        return 3;
    }
  }
  else
  {
    v16 = v15;
    if (v15)
    {
      result = 0;
      *((_QWORD *)this + 1) += v16;
    }
    else
    {
      if (*(_DWORD *)this == -1)
      {
        v20 = __error();
        v21 = strerror(*v20);
        rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v22, "Socket::Close double close the socket or close without create", v21);
      }
      else
      {
        close(*(_DWORD *)this);
        *(_DWORD *)this = -1;
      }
      return 2;
    }
  }
  return result;
}

uint64_t rabit::engine::AllreduceBase::TryBroadcast(rabit::engine::AllreduceBase *this, char *a2, const char *a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  _QWORD *v25;
  __int16 v26;
  uint64_t v27;
  const char *v28;
  int v29;
  int v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t *v35;
  const char *v36;
  ssize_t v37;
  int v38;
  int v39;
  uint64_t *v40;
  const char *v41;
  ssize_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  ssize_t v47;
  int v48;
  int v49;
  int *v50;
  char *v51;
  const char *v52;
  char *v54;
  __int128 v55;
  __int128 v56;
  int v57;
  int v58;

  v4 = 0;
  if (!a3 || *((_QWORD *)this + 9) == *((_QWORD *)this + 8))
    return v4;
  v8 = a4;
  rabit::utils::Check((rabit::utils *)(*((_DWORD *)this + 69) > (int)a4), "Broadcast: root should be smaller than world size", a3);
  v9 = *((_QWORD *)this + 9) - *((_QWORD *)this + 8);
  if ((int)(v9 >> 3) <= 0)
  {
    v55 = 0u;
    v56 = 0u;
    v57 = 1065353216;
    goto LABEL_60;
  }
  v10 = 0;
  v11 = (v9 >> 3);
  v12 = 8 * v11;
  do
  {
    v13 = *(_QWORD *)(*((_QWORD *)this + 8) + v10);
    *(_QWORD *)(v13 + 8) = 0;
    *(_QWORD *)(v13 + 16) = 0;
    v10 += 8;
  }
  while (v12 != v10);
  v54 = a2;
  v14 = *((unsigned int *)this + 68);
  v55 = 0u;
  v56 = 0u;
  v57 = 1065353216;
  if (v14 == v8)
    v15 = a3;
  else
    v15 = 0;
  if (v14 == v8)
    v16 = 0xFFFFFFFFLL;
  else
    v16 = 4294967294;
  while (2)
  {
    v17 = 0;
    v18 = 8 * v16;
    v19 = 1;
    do
    {
      if (v16 == 4294967294)
      {
        v58 = **(_DWORD **)(*((_QWORD *)this + 8) + v17);
        v20 = v58;
        v21 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v55, v58, &v58);
        *((_DWORD *)v21 + 5) = v20;
        *((_WORD *)v21 + 12) |= 1u;
        if (v18 == v17)
        {
          v19 = 0;
          v22 = *((_QWORD *)this + 8);
LABEL_17:
          v23 = *(_QWORD *)(v22 + 8 * v16);
          if (*(const char **)(v23 + 8) == a3)
            goto LABEL_24;
          v58 = *(_DWORD *)v23;
          v24 = v58;
          v25 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v55, v58, &v58);
          v19 = 0;
          *((_DWORD *)v25 + 5) = v24;
          v26 = *((_WORD *)v25 + 12) | 1;
LABEL_22:
          *((_WORD *)v25 + 12) = v26;
          goto LABEL_24;
        }
      }
      else
      {
        v22 = *((_QWORD *)this + 8);
        if (v18 == v17)
          goto LABEL_17;
        v27 = *(_QWORD *)(v22 + v17);
        v28 = *(const char **)(v27 + 16);
        if (v28 == a3)
          goto LABEL_24;
        if (v28 < v15)
        {
          v58 = *(_DWORD *)v27;
          v29 = v58;
          v25 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v55, v58, &v58);
          v19 = 0;
          *((_DWORD *)v25 + 5) = v29;
          v26 = *((_WORD *)v25 + 12) | 4;
          goto LABEL_22;
        }
      }
      v19 = 0;
LABEL_24:
      v58 = **(_DWORD **)(*((_QWORD *)this + 8) + v17);
      v30 = v58;
      v31 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v55, v58, &v58);
      *((_DWORD *)v31 + 5) = v30;
      *((_WORD *)v31 + 12) |= 2u;
      v17 += 8;
    }
    while (v12 != v17);
    if ((v19 & 1) != 0)
    {
LABEL_60:
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)&v55);
      return 0;
    }
    rabit::utils::PollHelper::Poll((float *)&v55, *((_QWORD *)this + 36));
    if (v16 == 4294967294)
    {
      v16 = 0;
      v32 = *((_QWORD *)this + 8);
      while (1)
      {
        v33 = *(_QWORD *)(v32 + 8 * v16);
        v34 = *(_DWORD *)v33;
        v35 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::find<int>(v55, *((unint64_t *)&v55 + 1), *(_DWORD *)v33);
        if (v35 && (v35[3] & 1) != 0)
        {
          v36 = *(const char **)(v33 + 8);
          if (a3 != v36)
          {
            v37 = recv(v34, (void *)&v36[(_QWORD)v54], a3 - v36, 0);
            if (v37 == -1)
            {
              v38 = *__error();
              if (v38 && v38 != 35)
              {
                if (v38 == 54)
                  v4 = 1;
                else
                  v4 = 3;
                goto LABEL_72;
              }
            }
            else
            {
              if (!v37)
              {
                v49 = *(_DWORD *)v33;
                if (*(_DWORD *)v33 != -1)
                  goto LABEL_66;
LABEL_70:
                v50 = __error();
                v51 = strerror(*v50);
                rabit::utils::Error((rabit::utils *)"Socket %s Error:%s", v52, "Socket::Close double close the socket or close without create", v51);
                goto LABEL_71;
              }
              *(_QWORD *)(v33 + 8) += v37;
            }
          }
          v32 = *((_QWORD *)this + 8);
          v15 = *(const char **)(*(_QWORD *)(v32 + 8 * v16) + 8);
          if (v15)
          {
            v16 = v16;
            goto LABEL_50;
          }
        }
        if (v11 == ++v16)
        {
          v16 = 4294967294;
          goto LABEL_50;
        }
      }
    }
    if ((v16 & 0x80000000) == 0)
    {
      v33 = *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v16);
      v39 = *(_DWORD *)v33;
      v40 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::find<int>(v55, *((unint64_t *)&v55 + 1), *(_DWORD *)v33);
      if (v40)
      {
        if ((v40[3] & 1) != 0)
        {
          v41 = *(const char **)(v33 + 8);
          if (a3 != v41)
          {
            v42 = recv(v39, (void *)&v41[(_QWORD)v54], a3 - v41, 0);
            if (v42 == -1)
            {
              v43 = *__error();
              if (v43 && v43 != 35)
              {
                if (v43 == 54)
                  v4 = 1;
                else
                  v4 = 3;
                goto LABEL_72;
              }
            }
            else
            {
              if (!v42)
              {
                v49 = *(_DWORD *)v33;
                if (*(_DWORD *)v33 == -1)
                  goto LABEL_70;
LABEL_66:
                close(v49);
                *(_DWORD *)v33 = -1;
LABEL_71:
                v4 = 2;
                goto LABEL_72;
              }
              *(_QWORD *)(v33 + 8) += v42;
            }
          }
          v15 = *(const char **)(*(_QWORD *)(*((_QWORD *)this + 8) + 8 * v16) + 8);
        }
      }
    }
LABEL_50:
    v44 = 0;
LABEL_51:
    if (v16 == v44)
      goto LABEL_57;
    v45 = *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v44);
    v46 = *(_QWORD *)(v45 + 16);
    if ((unint64_t)v15 <= v46)
      goto LABEL_57;
    v47 = send(*(_DWORD *)v45, &v54[v46], (size_t)&v15[-v46], 0);
    if (v47 != -1)
    {
      *(_QWORD *)(v45 + 16) += v47;
      goto LABEL_57;
    }
    v48 = *__error();
    if (!v48 || v48 == 35)
    {
LABEL_57:
      if (v11 == ++v44)
      {
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)&v55);
        v55 = 0u;
        v56 = 0u;
        v57 = 1065353216;
        continue;
      }
      goto LABEL_51;
    }
    break;
  }
  if (v48 == 54)
    v4 = 1;
  else
    v4 = 3;
  v16 = v44;
LABEL_72:
  *((_QWORD *)this + 7) = *(_QWORD *)(*((_QWORD *)this + 8) + 8 * v16);
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)&v55);
  return v4;
}

void sub_220F57078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t rabit::engine::AllreduceBase::TryAllgatherRing(rabit::engine::AllreduceBase *this, void *a2, const char *a3, const char *a4, const char *a5, uint64_t a6)
{
  int *v11;
  int v12;
  int v13;
  rabit::utils *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  int v18;
  _QWORD *v19;
  char v20;
  int v21;
  _QWORD *v22;
  int v23;
  uint64_t *v24;
  size_t v25;
  ssize_t v26;
  int v27;
  char v28;
  const char *v29;
  size_t v30;
  ssize_t v31;
  uint64_t v32;
  uint64_t v34;
  int *v35;
  _OWORD v36[2];
  int v37;
  int v38;

  v11 = (int *)*((_QWORD *)this + 12);
  v12 = *((_DWORD *)this + 68);
  v13 = *((_DWORD *)this + 69);
  v35 = (int *)*((_QWORD *)this + 11);
  if (v11[1] == (v12 + 1) % v13)
    v14 = (rabit::utils *)(v12 == (*(_DWORD *)(*((_QWORD *)this + 11) + 4) + 1) % v13);
  else
    v14 = 0;
  rabit::utils::Assert(v14, "need to assume rank structure", a3, a2);
  v15 = &a3[(_QWORD)a4];
  v16 = &a3[(_QWORD)a4 - a6];
  while (1)
  {
    v17 = a5;
    memset(v36, 0, sizeof(v36));
    v37 = 1065353216;
    if (v15 == a5)
    {
      if (a4 == v16)
      {
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)v36);
        return 0;
      }
    }
    else
    {
      v38 = *v11;
      v18 = v38;
      v19 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v36, v38, &v38);
      *((_DWORD *)v19 + 5) = v18;
      *((_WORD *)v19 + 12) |= 1u;
      if (a4 == v16)
      {
        v20 = 1;
        goto LABEL_13;
      }
    }
    if (a4 >= v17)
    {
      v20 = 0;
    }
    else
    {
      v38 = *v35;
      v21 = v38;
      v22 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v36, v38, &v38);
      v20 = 0;
      *((_DWORD *)v22 + 5) = v21;
      *((_WORD *)v22 + 12) |= 4u;
    }
LABEL_13:
    rabit::utils::PollHelper::Poll((float *)v36, *((_QWORD *)this + 36));
    a5 = v15;
    if (v15 != v17)
    {
      v23 = *v11;
      v24 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::find<int>(*(uint64_t *)&v36[0], *((unint64_t *)&v36[0] + 1), *v11);
      if (v24 && (v24[3] & 1) != 0)
      {
        if (&v15[-((unint64_t)v17 / (unint64_t)a3 * (_QWORD)a3)] <= a3)
          v25 = v15 - v17;
        else
          v25 = (size_t)&a3[-((unint64_t)v17 % (unint64_t)a3)];
        v26 = recv(v23, (void *)(v34 + (unint64_t)v17 % (unint64_t)a3), v25, 0);
        if (v26 != -1)
        {
          a5 = &v17[v26];
          goto LABEL_24;
        }
        v27 = *__error();
        if (v27)
        {
          a5 = v17;
          if (v27 != 35)
            goto LABEL_40;
          goto LABEL_24;
        }
      }
      a5 = v17;
    }
LABEL_24:
    v28 = a4 >= a5 ? 1 : v20;
    if ((v28 & 1) == 0)
    {
      if (v16 >= a5)
        v29 = a5;
      else
        v29 = v16;
      if (&v29[-((unint64_t)a4 / (unint64_t)a3 * (_QWORD)a3)] <= a3)
        v30 = v29 - a4;
      else
        v30 = (size_t)&a3[-((unint64_t)a4 % (unint64_t)a3)];
      v31 = send(*v35, (const void *)(v34 + (unint64_t)a4 % (unint64_t)a3), v30, 0);
      if (v31 != -1)
      {
        a4 += v31;
        goto LABEL_38;
      }
      v27 = *__error();
      if (v27)
      {
        if (v27 != 35)
          break;
      }
    }
LABEL_38:
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)v36);
  }
  v11 = v35;
LABEL_40:
  v32 = 3;
  if (v27 == 54)
    v32 = 1;
  *((_QWORD *)this + 7) = v11;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)v36);
  return v32;
}

void sub_220F57338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t rabit::engine::AllreduceBase::TryReduceScatterRing(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, void (*a5)(unint64_t, unint64_t, unint64_t, unint64_t *))
{
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  int v11;
  rabit::utils *v12;
  const char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  const char *v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  _QWORD *v26;
  char v27;
  int v28;
  _QWORD *v29;
  uint64_t *v30;
  const char *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  size_t v39;
  ssize_t v40;
  int v41;
  uint64_t v42;
  int *v44;
  uint64_t v45;
  const char *v46;
  unint64_t v47;
  unint64_t v50;
  _OWORD v51[2];
  int v52;

  v7 = a1;
  v8 = *(int **)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 96);
  v10 = *(_DWORD *)(a1 + 272);
  v11 = *(_DWORD *)(a1 + 276);
  if (*(_DWORD *)(v9 + 4) == (v10 + 1) % v11)
    v12 = (rabit::utils *)(v10 == (v8[1] + 1) % v11);
  else
    v12 = 0;
  rabit::utils::Assert(v12, "need to assume rank structure", (const char *)a3);
  v14 = a4 * a3;
  v15 = (a4 + *(int *)(v7 + 276) - 1) / *(int *)(v7 + 276);
  v16 = v15 * *(int *)(v9 + 4);
  if (v16 >= a4)
    v17 = a4;
  else
    v17 = v15 * *(int *)(v9 + 4);
  v18 = v17 * a3;
  v19 = v15 + v16;
  if (v19 >= a4)
    v19 = a4;
  v20 = v19 * a3;
  v21 = v15 * *(int *)(v7 + 272);
  if (v21 >= a4)
    v21 = a4;
  v22 = (const char *)(v18 + v14);
  v23 = v21 * a3;
  v47 = v21 * a3 + v14;
  if (v47 > v18 + v14)
  {
    rabit::utils::Assert((rabit::utils *)(v18 <= v23), "write ptr boundary check", v13);
    v47 = v23;
  }
  rabit::engine::AllreduceBase::LinkRecord::InitBuffer((rabit::engine::AllreduceBase::LinkRecord *)v9, a3, v15, *(_QWORD *)(v7 + 240));
  *(_QWORD *)(v9 + 8) = v20;
  v24 = v20;
  v45 = v7;
  v46 = (const char *)(v18 + v14);
  v44 = v8;
  while (1)
  {
    memset(v51, 0, sizeof(v51));
    v52 = 1065353216;
    if ((const char *)v24 == v22)
    {
      if (v18 == v47)
      {
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)v51);
        return 0;
      }
LABEL_19:
      if (v18 >= v20)
      {
        v27 = 0;
      }
      else
      {
        LODWORD(v50) = *v8;
        v28 = v50;
        v29 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v51, v50, &v50);
        v27 = 0;
        *((_DWORD *)v29 + 5) = v28;
        *((_WORD *)v29 + 12) |= 4u;
      }
      goto LABEL_22;
    }
    LODWORD(v50) = *(_DWORD *)v9;
    v25 = v50;
    v26 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v51, v50, &v50);
    *((_DWORD *)v26 + 5) = v25;
    *((_WORD *)v26 + 12) |= 1u;
    if (v18 != v47)
      goto LABEL_19;
    v27 = 1;
LABEL_22:
    rabit::utils::PollHelper::Poll((float *)v51, *(_QWORD *)(v7 + 288));
    v22 = v46;
    if ((const char *)v24 == v46)
    {
      v24 = (unint64_t)v46;
    }
    else
    {
      v30 = std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::find<int>(*(uint64_t *)&v51[0], *((unint64_t *)&v51[0] + 1), *(_DWORD *)v9);
      if (v30 && (v30[3] & 1) != 0)
      {
        v42 = rabit::engine::AllreduceBase::LinkRecord::ReadToRingBuffer((rabit::engine::AllreduceBase::LinkRecord *)v9, v20, v46);
        if ((_DWORD)v42)
        {
          v8 = (int *)v9;
          goto LABEL_55;
        }
        v24 = *(_QWORD *)(v9 + 8);
        rabit::utils::Assert((rabit::utils *)(v24 <= (unint64_t)v46), "[%d] read_ptr boundary check", v31, *(unsigned int *)(v7 + 272));
        v32 = v24 / a3 * a3;
        if (v20 < v32)
        {
          v33 = *(_QWORD *)(v9 + 32);
          do
          {
            v34 = v33 - v20 % v33;
            if (v32 - v20 < v34)
              v34 = v32 - v20;
            if (v14 - v20 % v14 >= v34)
              v35 = v34;
            else
              v35 = v14 - v20 % v14;
            v36 = *(_QWORD *)(v9 + 24);
            v50 = a3;
            a5(v36 + v20 % v33, a2 + v20 % v14, v35 / a3, &v50);
            v20 += v35;
          }
          while (v20 < v32);
          v8 = v44;
          v7 = v45;
        }
        v22 = v46;
      }
    }
    v37 = v18 >= v20 ? 1 : v27;
    if ((v37 & 1) == 0)
    {
      v38 = v47;
      if (v47 >= v20)
        v38 = v20;
      if (v38 - v18 / v14 * v14 <= v14)
        v39 = v38 - v18;
      else
        v39 = v14 - v18 % v14;
      v40 = send(*v8, (const void *)(a2 + v18 % v14), v39, 0);
      if (v40 != -1)
      {
        v18 += v40;
        goto LABEL_50;
      }
      v41 = *__error();
      if (v41)
      {
        if (v41 != 35)
          break;
      }
    }
LABEL_50:
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)v51);
  }
  if (v41 == 54)
    v42 = 1;
  else
    v42 = 3;
LABEL_55:
  *(_QWORD *)(v7 + 56) = v8;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)v51);
  return v42;
}

void sub_220F576E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void rabit::engine::AllreduceBase::Allgather(rabit::engine::AllreduceBase *this, void *a2, const char *a3, const char *a4, const char *a5, uint64_t a6)
{
  int v6;
  _BOOL8 v8;
  const char *v9;

  v6 = *((_DWORD *)this + 69);
  if (v6 != -1 && v6 != 1)
  {
    v8 = rabit::engine::AllreduceBase::TryAllgatherRing(this, a2, a3, a4, a5, a6) == 0;
    rabit::utils::Assert((rabit::utils *)v8, "AllgatherRing failed", v9);
  }
}

void rabit::engine::AllreduceBase::Allreduce(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, void (*a5)(unint64_t, unint64_t, unint64_t, unint64_t *), void (*a6)(uint64_t), uint64_t a7)
{
  int v12;
  _BOOL8 v14;
  const char *v15;

  if (a6)
    a6(a7);
  v12 = *(_DWORD *)(a1 + 276);
  if (v12 != -1 && v12 != 1)
  {
    v14 = rabit::engine::AllreduceBase::TryAllreduce(a1, a2, a3, a4, a5) == 0;
    rabit::utils::Assert((rabit::utils *)v14, "Allreduce failed", v15);
  }
}

void rabit::engine::AllreduceBase::Broadcast(rabit::engine::AllreduceBase *this, char *a2, const char *a3, unsigned int a4)
{
  int v4;
  _BOOL8 v6;
  const char *v7;

  v4 = *((_DWORD *)this + 69);
  if (v4 != -1 && v4 != 1)
  {
    v6 = rabit::engine::AllreduceBase::TryBroadcast(this, a2, a3, a4) == 0;
    rabit::utils::Assert((rabit::utils *)v6, "Broadcast failed", v7);
  }
}

uint64_t rabit::engine::AllreduceBase::LoadCheckPoint()
{
  return 0;
}

uint64_t rabit::engine::AllreduceBase::CheckPoint(uint64_t result)
{
  ++*(_DWORD *)(result + 12);
  return result;
}

uint64_t rabit::engine::AllreduceBase::LazyCheckPoint(uint64_t result)
{
  ++*(_DWORD *)(result + 12);
  return result;
}

uint64_t rabit::engine::AllreduceBase::VersionNumber(rabit::engine::AllreduceBase *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t rabit::engine::AllreduceBase::GetRingPrevRank(rabit::engine::AllreduceBase *this)
{
  return *(unsigned int *)(*((_QWORD *)this + 11) + 4);
}

uint64_t rabit::engine::AllreduceBase::GetRank(rabit::engine::AllreduceBase *this)
{
  return *((unsigned int *)this + 68);
}

uint64_t rabit::engine::AllreduceBase::GetWorldSize(rabit::engine::AllreduceBase *this)
{
  unsigned int v1;

  v1 = *((_DWORD *)this + 69);
  if (v1 == -1)
    return 1;
  else
    return v1;
}

BOOL rabit::engine::AllreduceBase::IsDistributed(rabit::engine::AllreduceBase *this)
{
  _DWORD *v1;
  int v2;

  v1 = (_DWORD *)((char *)this + 176);
  v2 = *((char *)this + 199);
  if ((v2 & 0x80000000) == 0)
  {
    if (v2 != 4)
      return 1;
    return *v1 != 1280070990;
  }
  if (*((_QWORD *)this + 23) == 4)
  {
    v1 = *(_DWORD **)v1;
    return *v1 != 1280070990;
  }
  return 1;
}

void rabit::engine::AllreduceBase::GetHost(rabit::engine::AllreduceBase *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 175) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 19), *((_QWORD *)this + 20));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 152);
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)this + 21);
  }
}

rabit::utils::SockAddr *rabit::utils::SockAddr::SockAddr(rabit::utils::SockAddr *this, const char *a2, unsigned int a3)
{
  const char *v6;
  BOOL v7;
  uint64_t v8;
  const char *v9;
  addrinfo *v10;
  addrinfo *v12;
  addrinfo v13;

  memset(&v13, 0, sizeof(v13));
  v13.ai_family = 2;
  v13.ai_protocol = 1;
  v12 = 0;
  if (getaddrinfo(a2, 0, &v13, &v12))
    v7 = 1;
  else
    v7 = v12 == 0;
  v8 = !v7;
  rabit::utils::Check((rabit::utils *)v8, "cannot obtain address of %s", v6, a2);
  rabit::utils::Check((rabit::utils *)(v12->ai_family == 2), "Does not support IPv6", v9);
  v10 = v12;
  memcpy(this, v12->ai_addr, v12->ai_addrlen);
  *((_WORD *)this + 1) = bswap32(a3) >> 16;
  freeaddrinfo(v10);
  return this;
}

_QWORD *std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(float *a1, int a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  int8x8_t prime;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint8x8_t v23;
  unint64_t v24;
  uint8x8_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v33;

  v6 = a2;
  v7 = *((_QWORD *)a1 + 1);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2;
      if (v7 <= a2)
        v3 = a2 % v7;
    }
    else
    {
      v3 = (v7 - 1) & a2;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x20uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  *(_QWORD *)((char *)v10 + 20) = 0;
  v12 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v13 = a1[8];
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      prime = (int8x8_t)v16;
    else
      prime = (int8x8_t)v15;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v7 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v7)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v7)
    {
      v24 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (v25 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        v24 = std::__next_prime(v24);
      }
      else
      {
        v26 = 1 << -(char)__clz(v24 - 1);
        if (v24 >= 2)
          v24 = v26;
      }
      if (*(_QWORD *)&prime <= v24)
        prime = (int8x8_t)v24;
      if (*(_QWORD *)&prime >= v7)
      {
        v7 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v18 = operator new(8 * *(_QWORD *)&prime);
          v19 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v18;
          if (v19)
            operator delete(v19);
          v20 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v20++) = 0;
          while (*(_QWORD *)&prime != v20);
          v21 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v21)
          {
            v22 = v21[1];
            v23 = (uint8x8_t)vcnt_s8(prime);
            v23.i16[0] = vaddlv_u8(v23);
            if (v23.u32[0] > 1uLL)
            {
              if (v22 >= *(_QWORD *)&prime)
                v22 %= *(_QWORD *)&prime;
            }
            else
            {
              v22 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = a1 + 4;
            v27 = (_QWORD *)*v21;
            if (*v21)
            {
              do
              {
                v28 = v27[1];
                if (v23.u32[0] > 1uLL)
                {
                  if (v28 >= *(_QWORD *)&prime)
                    v28 %= *(_QWORD *)&prime;
                }
                else
                {
                  v28 &= *(_QWORD *)&prime - 1;
                }
                if (v28 != v22)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v28))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v21;
                    goto LABEL_55;
                  }
                  *v21 = *v27;
                  *v27 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v28);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v28) = v27;
                  v27 = v21;
                }
                v28 = v22;
LABEL_55:
                v21 = v27;
                v27 = (_QWORD *)*v27;
                v22 = v28;
              }
              while (v27);
            }
          }
          v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        v33 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v33)
          operator delete(v33);
        v7 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v29 = *(_QWORD **)a1;
  v30 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v30)
  {
    *v10 = *v30;
LABEL_72:
    *v30 = v10;
    goto LABEL_73;
  }
  *v10 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v10;
  v29[v3] = a1 + 4;
  if (*v10)
  {
    v31 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v31 >= v7)
        v31 %= v7;
    }
    else
    {
      v31 &= v7 - 1;
    }
    v30 = (_QWORD *)(*(_QWORD *)a1 + 8 * v31);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
  return v10;
}

void sub_220F57DA4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,pollfd>,std::__unordered_map_hasher<int,std::__hash_value_type<int,pollfd>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,pollfd>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,pollfd>>>::find<int>(uint64_t a1, unint64_t a2, int a3)
{
  uint8x8_t v3;
  unint64_t v4;
  uint64_t **v5;
  uint64_t *result;
  unint64_t v7;

  if (!a2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a3;
    if (a3 >= a2)
      v4 = a3 % a2;
  }
  else
  {
    v4 = (a2 - 1) & a3;
  }
  v5 = *(uint64_t ***)(a1 + 8 * v4);
  if (!v5)
    return 0;
  for (result = *v5; result; result = (uint64_t *)*result)
  {
    v7 = result[1];
    if (v7 == a3)
    {
      if (*((_DWORD *)result + 4) == a3)
        return result;
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= a2)
          v7 %= a2;
      }
      else
      {
        v7 &= a2 - 1;
      }
      if (v7 != v4)
        return 0;
    }
  }
  return result;
}

void std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::destroy(*a1);
    std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

_QWORD *std::vector<rabit::engine::AllreduceBase::LinkRecord>::__construct_one_at_end[abi:ne180100]<rabit::engine::AllreduceBase::LinkRecord const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _QWORD *result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)(v3 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v3 = v4;
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  result = std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>((_QWORD *)(v3 + 40), *((const void **)a2 + 5), *((_QWORD *)a2 + 6), (uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 3);
  *(_QWORD *)(a1 + 8) = v3 + 64;
  return result;
}

void sub_220F57EF4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<rabit::engine::AllreduceBase::LinkRecord>::__push_back_slow_path<rabit::engine::AllreduceBase::LinkRecord const&>(int64x2_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  char *v9;
  __int128 v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  int64x2_t v19;
  char *v20;
  char *v22;
  int64x2_t v23;
  char *v24;
  int64x2_t *v25;

  v2 = (a1->i64[1] - a1->i64[0]) >> 6;
  v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) >> 58)
    std::vector<void *>::__throw_length_error[abi:ne180100]();
  v6 = a1[1].i64[0] - a1->i64[0];
  if (v6 >> 5 > v3)
    v3 = v6 >> 5;
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFC0)
    v7 = 0x3FFFFFFFFFFFFFFLL;
  else
    v7 = v3;
  v25 = a1 + 1;
  if (v7)
  {
    if (v7 >> 58)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v8 = (char *)operator new(v7 << 6);
  }
  else
  {
    v8 = 0;
  }
  v9 = &v8[64 * v2];
  v22 = v8;
  v23.i64[0] = (uint64_t)v9;
  v23.i64[1] = (uint64_t)v9;
  v24 = &v8[64 * v7];
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v10;
  v11 = *(const void **)(a2 + 40);
  *((_QWORD *)v9 + 4) = *(_QWORD *)(a2 + 32);
  *((_QWORD *)v9 + 6) = 0;
  *((_QWORD *)v9 + 7) = 0;
  v12 = *(_QWORD *)(a2 + 48);
  *((_QWORD *)v9 + 5) = 0;
  std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>((_QWORD *)v9 + 5, v11, v12, (v12 - (uint64_t)v11) >> 3);
  v13 = v23.i64[0];
  v14 = v23.i64[1] + 64;
  v23.i64[1] += 64;
  v16 = a1->i64[0];
  v15 = a1->u64[1];
  if (v15 == a1->i64[0])
  {
    v19 = vdupq_n_s64(v15);
  }
  else
  {
    do
    {
      v17 = *(_OWORD *)(v15 - 48);
      v18 = *(_QWORD *)(v15 - 32);
      *(_OWORD *)(v13 - 64) = *(_OWORD *)(v15 - 64);
      *(_OWORD *)(v13 - 48) = v17;
      *(_QWORD *)(v13 - 32) = v18;
      *(_QWORD *)(v13 - 24) = 0;
      *(_QWORD *)(v13 - 16) = 0;
      *(_QWORD *)(v13 - 8) = 0;
      *(_OWORD *)(v13 - 24) = *(_OWORD *)(v15 - 24);
      *(_QWORD *)(v13 - 8) = *(_QWORD *)(v15 - 8);
      v13 -= 64;
      *(_QWORD *)(v15 - 24) = 0;
      *(_QWORD *)(v15 - 16) = 0;
      *(_QWORD *)(v15 - 8) = 0;
      v15 -= 64;
    }
    while (v15 != v16);
    v19 = *a1;
    v14 = v23.i64[1];
  }
  a1->i64[0] = v13;
  a1->i64[1] = v14;
  v23 = v19;
  v20 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v24;
  v24 = v20;
  v22 = (char *)v19.i64[0];
  std::__split_buffer<rabit::engine::AllreduceBase::LinkRecord>::~__split_buffer((uint64_t)&v22);
  return v14;
}

void sub_220F58060(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<rabit::engine::AllreduceBase::LinkRecord>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<rabit::engine::AllreduceBase::LinkRecord>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    *(_QWORD *)(a1 + 16) = v2 - 64;
    v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(_QWORD *)(v2 - 16) = v4;
      operator delete(v4);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 64;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t *dmlc::io::FileSystem::GetInstance(dmlc::io::FileSystem *this, const dmlc::io::URI *a2)
{
  int v3;
  dmlc::io::FileSystem *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  dmlc::io::FileSystem *v9;
  int *v13;
  int v15;
  int v16;
  std::string *v18;
  _QWORD *v19;
  dmlc::io::FileSystem *v20;
  uint64_t *v21;
  unsigned __int8 v22;
  std::string *v26;
  _QWORD *v27;
  std::string *v28;
  _QWORD *v29;
  std::string *Entry;
  _QWORD *v31;
  void **v32;
  uint64_t v33;
  void *__p[2];
  unsigned __int8 v36;
  char v37;

  v3 = *((unsigned __int8 *)this + 23);
  if (*((char *)this + 23) < 0)
  {
    v5 = *((_QWORD *)this + 1);
    if (v5)
    {
      if (v5 != 7)
      {
        if (v5 != 9)
          goto LABEL_44;
        v4 = *(dmlc::io::FileSystem **)this;
LABEL_10:
        v6 = *(_QWORD *)v4;
        v7 = *((unsigned __int8 *)v4 + 8);
        if (v6 != 0x2F3A736677656976 || v7 != 47)
        {
          if ((v3 & 0x80) == 0)
            goto LABEL_15;
LABEL_43:
          v5 = *((_QWORD *)this + 1);
LABEL_44:
          if (v5 == 5)
          {
            if (**(_DWORD **)this != 792343411 || *(_BYTE *)(*(_QWORD *)this + 4) != 47)
              goto LABEL_78;
            goto LABEL_72;
          }
          if (v5 != 7)
          {
            if (v5 != 8)
            {
LABEL_74:
              if (v5 != 8)
              {
LABEL_78:
                Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v37);
                dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io.cc");
                v31 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v37);
                std::operator+<char>();
                if ((v36 & 0x80u) == 0)
                  v32 = __p;
                else
                  v32 = (void **)__p[0];
                if ((v36 & 0x80u) == 0)
                  v33 = v36;
                else
                  v33 = (uint64_t)__p[1];
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)v32, v33);
                if ((char)v36 < 0)
                  operator delete(__p[0]);
                dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v37);
                return 0;
              }
              v20 = *(dmlc::io::FileSystem **)this;
LABEL_76:
              if (*(_QWORD *)v20 == 0x2F2F3A6572757A61)
              {
                v28 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
                dmlc::LogMessageFatal::Entry::Init(v28, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io.cc");
                v29 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)"Please compile with DMLC_USE_AZURE=1 to use Azure", 49);
                dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)__p);
              }
              goto LABEL_78;
            }
            v9 = *(dmlc::io::FileSystem **)this;
LABEL_48:
            if (*(_QWORD *)v9 != 0x2F2F3A7370747468)
            {
              if ((v3 & 0x80) == 0)
                goto LABEL_50;
LABEL_73:
              v5 = *((_QWORD *)this + 1);
              goto LABEL_74;
            }
LABEL_72:
            v26 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
            dmlc::LogMessageFatal::Entry::Init(v26, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io.cc");
            v27 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"Please compile with DMLC_USE_S3=1 to use S3", 43);
            dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)__p);
            v3 = *((unsigned __int8 *)this + 23);
            if ((v3 & 0x80) == 0)
              goto LABEL_50;
            goto LABEL_73;
          }
LABEL_55:
          if (**(_DWORD **)this != 1886680168 || *(_DWORD *)(*(_QWORD *)this + 3) != 791624304)
            goto LABEL_78;
          goto LABEL_72;
        }
LABEL_42:
        v18 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
        dmlc::LogMessageFatal::Entry::Init(v18, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io.cc");
        v19 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"Please compile with DMLC_USE_HDFS=1 to use hdfs", 47);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)__p);
        v3 = *((unsigned __int8 *)this + 23);
        if ((v3 & 0x80) == 0)
          goto LABEL_15;
        goto LABEL_43;
      }
      v13 = *(int **)this;
      if (**(_DWORD **)this != 1701603686 || *(_DWORD *)(*(_QWORD *)this + 3) != 791624293)
      {
        v15 = *v13;
        v16 = *(int *)((char *)v13 + 3);
        if (v15 != 1936090216 || v16 != 791624307)
          goto LABEL_55;
        goto LABEL_42;
      }
    }
  }
  else if (*((_BYTE *)this + 23))
  {
    if (v3 != 7)
    {
      v4 = this;
      if (v3 != 9)
      {
LABEL_15:
        if (v3 == 5)
        {
          if (*(_DWORD *)this != 792343411 || *((_BYTE *)this + 4) != 47)
            goto LABEL_78;
          goto LABEL_72;
        }
        if (v3 != 7)
        {
          v9 = this;
          if (v3 != 8)
          {
LABEL_50:
            v20 = this;
            if (v3 != 8)
              goto LABEL_78;
            goto LABEL_76;
          }
          goto LABEL_48;
        }
LABEL_27:
        if (*(_DWORD *)this != 1886680168 || *(_DWORD *)((char *)this + 3) != 791624304)
          goto LABEL_78;
        goto LABEL_72;
      }
      goto LABEL_10;
    }
    if (*(_DWORD *)this != 1701603686 || *(_DWORD *)((char *)this + 3) != 791624293)
    {
      if (*(_DWORD *)this != 1936090216 || *(_DWORD *)((char *)this + 3) != 791624307)
        goto LABEL_27;
      goto LABEL_42;
    }
  }
  v21 = &_MergedGlobals_17;
  v22 = atomic_load((unsigned __int8 *)&qword_253F370D0);
  if ((v22 & 1) == 0 && __cxa_guard_acquire(&qword_253F370D0))
  {
    _MergedGlobals_17 = (uint64_t)&unk_24E6B8660;
    __cxa_guard_release(&qword_253F370D0);
  }
  return v21;
}

void sub_220F584A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
  _Unwind_Resume(a1);
}

std::string::size_type dmlc::InputSplit::Create(dmlc::InputSplit *this, const char *a2, uint64_t a3, const char *a4, const char *a5)
{
  BOOL v6;

  return dmlc::InputSplit::Create(this, 0, a2, a3, a4, 0, 0, 256, 0, v6);
}

std::string::size_type dmlc::InputSplit::Create(dmlc::InputSplit *this, char *a2, const char *a3, uint64_t a4, const char *a5, const char *a6, int a7, uint64_t a8, BOOL a9, BOOL a10)
{
  int v12;
  char v17;
  char *v18;
  void **v19;
  std::string *Entry;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  char *v24;
  std::string *v25;
  _QWORD *v26;
  _QWORD *v27;
  size_t v28;
  uint64_t v29;
  std::string::size_type v30;
  void **v31;
  std::string *v32;
  FILE *v33;
  std::string *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  size_t v39;
  std::string::size_type v40;
  const dmlc::io::URI *v41;
  uint64_t *Instance;
  int v43;
  char *v44;
  char *v45;
  const dmlc::io::URI *v46;
  uint64_t *v47;
  char *v48;
  char *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t i;
  int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t j;
  int v57;
  const dmlc::io::URI *v58;
  uint64_t *v59;
  int v60;
  char *v61;
  char *v62;
  std::string *v63;
  _QWORD *v64;
  unint64_t v65;
  _QWORD *v66;
  char *v67;
  dmlc::SeekStream **v68;
  dmlc::SeekStream *v69;
  uint64_t v70;
  std::string *v71;
  uint64_t v72;
  dmlc::Stream *v73;
  uint64_t v74;
  void **v75;
  uint64_t v76;
  std::string __p;
  void *v79;
  char v80;
  void *v81;
  char v82;
  void *v83[2];
  char v84;
  _QWORD *v85[3];
  void *v86[2];
  unsigned __int8 v87;
  void *v88;
  std::string::size_type v89;
  char v90;
  _QWORD v91[5];
  char v92;
  std::string v93;
  std::string *v94;
  uint64_t v95;

  v12 = (int)a6;
  v95 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)this);
  dmlc::io::URISpec::URISpec((uint64_t)v83, &__p, (uint64_t)a3, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v17 = v84;
  v18 = (char *)v83[0];
  if (v84 >= 0)
    v19 = v83;
  else
    v19 = (void **)v83[0];
  if (strcmp((const char *)v19, "stdin"))
  {
    if (a3 >= a4)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io.cc");
      v21 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"Check failed: part < nsplit", 27);
      v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": ", 2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"invalid input parameter for InputSplit::Create", 46);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
      v17 = v84;
      v18 = (char *)v83[0];
    }
    if (v17 >= 0)
      v24 = (char *)v83;
    else
      v24 = v18;
    dmlc::io::URI::URI((dmlc::io::URI *)&__p, v24);
    if (!strcmp(a5, "text"))
    {
      v40 = operator new();
      Instance = dmlc::io::FileSystem::GetInstance((dmlc::io::FileSystem *)&__p, v41);
      v43 = v84;
      v44 = (char *)v83[0];
      dmlc::io::InputSplitBase::InputSplitBase((dmlc::io::InputSplitBase *)v40);
      if (v43 >= 0)
        v45 = (char *)v83;
      else
        v45 = v44;
      *(_QWORD *)v40 = &unk_24E6BA900;
      dmlc::io::InputSplitBase::Init((dmlc::io::InputSplitBase *)v40, (dmlc::io::FileSystem *)Instance, v45, 1uLL, 0);
      (*(void (**)(std::string::size_type, const char *, uint64_t))(*(_QWORD *)v40 + 64))(v40, a3, a4);
    }
    else if (!strcmp(a5, "indexed_recordio"))
    {
      if (!a2)
      {
        v63 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v88);
        dmlc::LogMessageFatal::Entry::Init(v63, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io.cc");
        v64 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v88);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v64, (uint64_t)"need to pass index file to use IndexedRecordIO", 46);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v88);
        goto LABEL_54;
      }
      std::string::basic_string[abi:ne180100]<0>(&v93, a2);
      dmlc::io::URISpec::URISpec((uint64_t)&v88, &v93, (uint64_t)a3, a4);
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v93.__r_.__value_.__l.__data_);
      v40 = operator new();
      v47 = dmlc::io::FileSystem::GetInstance((dmlc::io::FileSystem *)&__p, v46);
      if (v84 >= 0)
        v48 = (char *)v83;
      else
        v48 = (char *)v83[0];
      if (v90 >= 0)
        v49 = (char *)&v88;
      else
        v49 = (char *)v88;
      dmlc::io::InputSplitBase::InputSplitBase((dmlc::io::InputSplitBase *)v40);
      *(_QWORD *)v40 = &off_24E6B8788;
      *(_OWORD *)(v40 + 192) = 0u;
      *(_OWORD *)(v40 + 208) = 0u;
      *(_OWORD *)(v40 + 224) = 0u;
      *(_DWORD *)(v40 + 288) = 111;
      v50 = 5489;
      *(_DWORD *)(v40 + 296) = 5489;
      v51 = 1;
      for (i = 75; i != 698; ++i)
      {
        v53 = 1812433253 * (v50 ^ (v50 >> 30));
        v50 = v53 + v51;
        *(_DWORD *)(v40 + 4 * i) = i + v53 - 74;
        ++v51;
      }
      *(_QWORD *)(v40 + 2792) = 0;
      *(_BYTE *)(v40 + 240) = v12;
      if (v12)
      {
        v54 = a7 + 111;
        *(_DWORD *)(v40 + 296) = a7 + 111;
        v55 = 1;
        for (j = 75; j != 698; ++j)
        {
          v57 = 1812433253 * (v54 ^ (v54 >> 30));
          v54 = v57 + v55;
          *(_DWORD *)(v40 + 4 * j) = j + v57 - 74;
          ++v55;
        }
        *(_QWORD *)(v40 + 2792) = 0;
      }
      *(_QWORD *)(v40 + 272) = a8;
      dmlc::io::InputSplitBase::Init((dmlc::io::InputSplitBase *)v40, (dmlc::io::FileSystem *)v47, v48, 4uLL, 0);
      std::string::basic_string[abi:ne180100]<0>(&v93, v49);
      (*(void (**)(std::string::size_type, uint64_t *, std::string *))(*(_QWORD *)v40 + 128))(v40, v47, &v93);
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v93.__r_.__value_.__l.__data_);
      (*(void (**)(std::string::size_type, const char *, uint64_t))(*(_QWORD *)v40 + 64))(v40, a3, a4);
      if (v92 < 0)
        operator delete((void *)v91[3]);
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v91, (_QWORD *)v91[1]);
      if (v90 < 0)
        operator delete(v88);
    }
    else
    {
      if (strcmp(a5, "recordio"))
      {
        v25 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v88);
        dmlc::LogMessageFatal::Entry::Init(v25, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io.cc");
        v26 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v88);
        v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"unknown input split type ", 25);
        v28 = strlen(a5);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)a5, v28);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v88);
LABEL_54:
        v40 = 0;
        goto LABEL_55;
      }
      v40 = operator new();
      v59 = dmlc::io::FileSystem::GetInstance((dmlc::io::FileSystem *)&__p, v58);
      v60 = v84;
      v61 = (char *)v83[0];
      dmlc::io::InputSplitBase::InputSplitBase((dmlc::io::InputSplitBase *)v40);
      if (v60 >= 0)
        v62 = (char *)v83;
      else
        v62 = v61;
      *(_QWORD *)v40 = &unk_24E6BEE70;
      dmlc::io::InputSplitBase::Init((dmlc::io::InputSplitBase *)v40, (dmlc::io::FileSystem *)v59, v62, 4uLL, a9);
      (*(void (**)(std::string::size_type, const char *, uint64_t))(*(_QWORD *)v40 + 64))(v40, a3, a4);
    }
LABEL_55:
    v65 = v87;
    if ((v87 & 0x80u) != 0)
      v65 = (unint64_t)v86[1];
    if (v65)
    {
      v66 = (_QWORD *)operator new();
      v30 = (std::string::size_type)v66;
      if ((v87 & 0x80u) == 0)
        v67 = (char *)v86;
      else
        v67 = (char *)v86[0];
      *v66 = &off_24E6BF240;
      v66[1] = 0x200000;
      v68 = (dmlc::SeekStream **)(v66 + 2);
      std::string::basic_string[abi:ne180100]<0>(v66 + 2, v67);
      *(_QWORD *)(v30 + 40) = 0;
      *(_QWORD *)(v30 + 48) = 0;
      *(_QWORD *)(v30 + 56) = v40;
      *(_QWORD *)(v30 + 64) = 0;
      *(_QWORD *)(v30 + 80) = &off_24E6BF0D0;
      *(_QWORD *)(v30 + 72) = 0;
      *(_QWORD *)(v30 + 88) = 0;
      *(_QWORD *)(v30 + 96) = 0;
      *(_QWORD *)(v30 + 112) = 0;
      *(_OWORD *)(v30 + 128) = xmmword_220F5EF80;
      *(_OWORD *)(v30 + 144) = 0u;
      *(_OWORD *)(v30 + 160) = 0u;
      *(_OWORD *)(v30 + 176) = 0u;
      *(_QWORD *)(v30 + 192) = 0;
      *(_QWORD *)(v30 + 200) = 850045863;
      *(_OWORD *)(v30 + 256) = 0u;
      *(_OWORD *)(v30 + 240) = 0u;
      *(_OWORD *)(v30 + 224) = 0u;
      *(_OWORD *)(v30 + 208) = 0u;
      *(_QWORD *)(v30 + 272) = 1018212795;
      *(_OWORD *)(v30 + 280) = 0u;
      *(_OWORD *)(v30 + 296) = 0u;
      *(_QWORD *)(v30 + 312) = 0;
      *(_QWORD *)(v30 + 320) = 1018212795;
      *(_OWORD *)(v30 + 328) = 0u;
      *(_OWORD *)(v30 + 344) = 0u;
      *(_OWORD *)(v30 + 360) = 0u;
      *(_OWORD *)(v30 + 376) = 0u;
      *(_OWORD *)(v30 + 392) = 0u;
      *(_OWORD *)(v30 + 408) = 0u;
      *(_OWORD *)(v30 + 424) = 0u;
      *(_OWORD *)(v30 + 440) = 0u;
      *(_OWORD *)(v30 + 456) = 0u;
      *(_QWORD *)(v30 + 472) = 0;
      v69 = (dmlc::SeekStream *)v68;
      if (*(char *)(v30 + 39) < 0)
        v69 = *v68;
      v70 = dmlc::SeekStream::CreateForRead(v69, (const char *)1);
      *(_QWORD *)(v30 + 48) = v70;
      if (v70)
      {
        v88 = &off_24E6BF2B0;
        v89 = v30;
        v91[0] = &v88;
        v93.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24E6BF330;
        v93.__r_.__value_.__l.__size_ = v30;
        v94 = &v93;
        dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Init(v30 + 80, (uint64_t)&v88, (uint64_t)&v93);
      }
      else
      {
        v73 = (dmlc::Stream *)v68;
        if (*(char *)(v30 + 39) < 0)
          v73 = *v68;
        *(_QWORD *)(v30 + 40) = dmlc::Stream::Create(v73, "w", 0);
        v74 = operator new();
        *(_QWORD *)(v74 + 8) = 0;
        *(_QWORD *)(v74 + 16) = 0;
        *(_QWORD *)v74 = &off_24E6BF0D0;
        *(_QWORD *)(v74 + 32) = 0;
        *(_OWORD *)(v74 + 80) = 0u;
        *(_OWORD *)(v74 + 96) = 0u;
        *(_QWORD *)(v74 + 112) = 0;
        *(_QWORD *)(v74 + 120) = 850045863;
        *(_OWORD *)(v74 + 128) = 0u;
        *(_OWORD *)(v74 + 144) = 0u;
        *(_OWORD *)(v74 + 160) = 0u;
        *(_OWORD *)(v74 + 176) = 0u;
        *(_QWORD *)(v74 + 192) = 1018212795;
        *(_OWORD *)(v74 + 200) = 0u;
        *(_OWORD *)(v74 + 216) = 0u;
        *(_QWORD *)(v74 + 240) = 1018212795;
        *(_QWORD *)(v74 + 232) = 0;
        *(_QWORD *)(v74 + 392) = 0;
        *(_OWORD *)(v74 + 376) = 0u;
        *(_OWORD *)(v74 + 360) = 0u;
        *(_OWORD *)(v74 + 344) = 0u;
        *(_OWORD *)(v74 + 328) = 0u;
        *(_OWORD *)(v74 + 312) = 0u;
        *(_OWORD *)(v74 + 296) = 0u;
        *(_OWORD *)(v74 + 280) = 0u;
        *(_OWORD *)(v74 + 264) = 0u;
        *(_OWORD *)(v74 + 248) = 0u;
        *(_QWORD *)(v30 + 72) = v74;
        *(_OWORD *)(v74 + 48) = xmmword_220F667A0;
        *(_OWORD *)(v74 + 64) = 0u;
        v88 = &off_24E6BF3B0;
        v89 = v30;
        v91[0] = &v88;
        v93.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24E6BF430;
        v93.__r_.__value_.__l.__size_ = (std::string::size_type)dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::NotImplemented;
        v94 = &v93;
        dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Init(v74, (uint64_t)&v88, (uint64_t)&v93);
      }
      v71 = v94;
      if (v94 != &v93)
        goto LABEL_71;
    }
    else
    {
      v30 = operator new();
      *(_QWORD *)v30 = &off_24E6BF060;
      *(_QWORD *)(v30 + 8) = 0x200000;
      *(_QWORD *)(v30 + 16) = a8;
      *(_QWORD *)(v30 + 24) = v40;
      *(_QWORD *)(v30 + 32) = &off_24E6BF0D0;
      *(_QWORD *)(v30 + 40) = 0;
      *(_QWORD *)(v30 + 48) = 0;
      *(_QWORD *)(v30 + 64) = 0;
      *(_OWORD *)(v30 + 112) = 0u;
      *(_OWORD *)(v30 + 128) = 0u;
      *(_QWORD *)(v30 + 144) = 0;
      *(_QWORD *)(v30 + 152) = 850045863;
      *(_OWORD *)(v30 + 160) = 0u;
      *(_OWORD *)(v30 + 176) = 0u;
      *(_OWORD *)(v30 + 192) = 0u;
      *(_OWORD *)(v30 + 208) = 0u;
      *(_QWORD *)(v30 + 224) = 1018212795;
      *(_OWORD *)(v30 + 248) = 0u;
      *(_OWORD *)(v30 + 232) = 0u;
      *(_QWORD *)(v30 + 264) = 0;
      *(_QWORD *)(v30 + 272) = 1018212795;
      *(_OWORD *)(v30 + 424) = 0u;
      *(_OWORD *)(v30 + 408) = 0u;
      *(_OWORD *)(v30 + 392) = 0u;
      *(_OWORD *)(v30 + 376) = 0u;
      *(_OWORD *)(v30 + 360) = 0u;
      *(_OWORD *)(v30 + 344) = 0u;
      *(_OWORD *)(v30 + 328) = 0u;
      *(_OWORD *)(v30 + 312) = 0u;
      *(_OWORD *)(v30 + 296) = 0u;
      *(_OWORD *)(v30 + 280) = 0u;
      *(_OWORD *)(v30 + 80) = xmmword_220F667B0;
      *(_OWORD *)(v30 + 96) = 0u;
      v88 = &off_24E6BF130;
      v89 = v30;
      v91[0] = &v88;
      v93.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24E6BF1C0;
      v93.__r_.__value_.__l.__size_ = v40;
      v94 = &v93;
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Init(v30 + 32, (uint64_t)&v88, (uint64_t)&v93);
      v71 = v94;
      if (v94 != &v93)
      {
LABEL_71:
        if (!v71)
          goto LABEL_74;
        v72 = 5;
LABEL_73:
        (*(void (**)(void))(v71->__r_.__value_.__r.__words[0] + 8 * v72))();
LABEL_74:
        v75 = (void **)v91[0];
        if ((void **)v91[0] == &v88)
        {
          v76 = 4;
          v75 = &v88;
        }
        else
        {
          if (!v91[0])
          {
LABEL_79:
            if (v82 < 0)
              operator delete(v81);
            if (v80 < 0)
              operator delete(v79);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            goto LABEL_85;
          }
          v76 = 5;
        }
        (*((void (**)(void))*v75 + v76))();
        goto LABEL_79;
      }
    }
    v72 = 4;
    v71 = &v93;
    goto LABEL_73;
  }
  v29 = operator new();
  v30 = v29;
  if (v84 >= 0)
    v31 = v83;
  else
    v31 = (void **)v83[0];
  *(_QWORD *)v29 = &off_24E6BEFE0;
  *(_BYTE *)(v29 + 16) = 0;
  *(_OWORD *)(v29 + 24) = 0u;
  v32 = (std::string *)(v29 + 48);
  *(_OWORD *)(v29 + 40) = 0u;
  *(_OWORD *)(v29 + 56) = 0u;
  *(_QWORD *)(v29 + 80) = 0;
  *(_QWORD *)(v29 + 88) = 0;
  *(_QWORD *)(v29 + 72) = 0x40000;
  if (!strcmp((const char *)v31, "stdin"))
  {
    *(_BYTE *)(v30 + 16) = 1;
    *(_QWORD *)(v30 + 8) = *MEMORY[0x24BDAC8E0];
  }
  else
  {
    v33 = fopen((const char *)v31, "rb");
    *(_QWORD *)(v30 + 8) = v33;
    if (!v33)
    {
      v34 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      dmlc::LogMessageFatal::Entry::Init(v34, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/single_file_split.h");
      v35 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&__p);
      v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)"Check failed: fp_ != NULL", 25);
      v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)": ", 2);
      v38 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"SingleFileSplit: fail to open ", 30);
      v39 = strlen((const char *)v31);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v38, (uint64_t)v31, v39);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&__p);
    }
  }
  std::string::resize(v32, 0x40000uLL, 0);
LABEL_85:
  if ((char)v87 < 0)
    operator delete(v86[0]);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v85, v85[1]);
  if (v84 < 0)
    operator delete(v83[0]);
  return v30;
}

void sub_220F58F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  dmlc::io::InputSplitBase *v31;
  void **v32;
  uint64_t v33;
  void *v35;
  void *v36;

  if (*(char *)(v33 - 105) < 0)
    operator delete(*(void **)(v33 - 128));
  v35 = (void *)*((_QWORD *)v31 + 27);
  if (v35)
  {
    *((_QWORD *)v31 + 28) = v35;
    operator delete(v35);
  }
  v36 = *v32;
  if (*v32)
  {
    *((_QWORD *)v31 + 25) = v36;
    operator delete(v36);
  }
  dmlc::io::InputSplitBase::~InputSplitBase(v31);
  MEMORY[0x227667068](v31, 0x10B3C408F76FF71);
  dmlc::io::URISpec::~URISpec(&a28);
  dmlc::io::FileInfo::~FileInfo(&a10);
  dmlc::io::URISpec::~URISpec(&a19);
  _Unwind_Resume(a1);
}

void sub_220F59234(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  JUMPOUT(0x220F5922CLL);
}

void sub_220F5924C()
{
  JUMPOUT(0x220F5922CLL);
}

void sub_220F59254(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)va);
  JUMPOUT(0x220F59224);
}

uint64_t dmlc::Stream::Create(dmlc::Stream *this, const char *a2, const char *a3)
{
  const dmlc::io::URI *v5;
  uint64_t *Instance;
  uint64_t v7;
  void *v9[2];
  char v10;
  void *v11;
  char v12;
  void *__p;
  char v14;

  dmlc::io::URI::URI((dmlc::io::URI *)v9, (char *)this);
  Instance = dmlc::io::FileSystem::GetInstance((dmlc::io::FileSystem *)v9, v5);
  v7 = (*(uint64_t (**)(uint64_t *, void **, const char *, const char *))(*Instance + 40))(Instance, v9, a2, a3);
  if (v14 < 0)
    operator delete(__p);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9[0]);
  return v7;
}

void sub_220F59300(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  dmlc::io::FileInfo::~FileInfo((void **)va);
  _Unwind_Resume(a1);
}

uint64_t dmlc::SeekStream::CreateForRead(dmlc::SeekStream *this, const char *a2)
{
  const dmlc::io::URI *v3;
  uint64_t *Instance;
  uint64_t v5;
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *__p;
  char v12;

  dmlc::io::URI::URI((dmlc::io::URI *)v7, (char *)this);
  Instance = dmlc::io::FileSystem::GetInstance((dmlc::io::FileSystem *)v7, v3);
  v5 = (*(uint64_t (**)(uint64_t *, void **, const char *))(*Instance + 48))(Instance, v7, a2);
  if (v12 < 0)
    operator delete(__p);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
  return v5;
}

void sub_220F59398(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  dmlc::io::FileInfo::~FileInfo((void **)va);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::SingleFileSplit::HintChunkSize(uint64_t this, unint64_t a2)
{
  unint64_t v2;

  v2 = *(_QWORD *)(this + 72);
  if (v2 <= a2)
    v2 = a2;
  *(_QWORD *)(this + 72) = v2;
  return this;
}

off_t dmlc::io::SingleFileSplit::GetTotalSize(FILE **this)
{
  int v1;
  stat v3;

  v1 = fileno(this[1]);
  fstat(v1, &v3);
  return v3.st_size;
}

uint64_t dmlc::io::SingleFileSplit::BeforeFirst(FILE **this)
{
  return fseek(this[1], 0, 0);
}

BOOL dmlc::io::SingleFileSplit::NextRecord(std::string *this, unsigned __int8 **a2)
{
  unsigned __int8 *size;
  unsigned __int8 *v5;
  _BOOL8 result;
  unsigned __int8 *v7;
  int v8;
  int v10;

  size = (unsigned __int8 *)this[3].__r_.__value_.__l.__size_;
  v5 = (unsigned __int8 *)this[3].__r_.__value_.__r.__words[2];
  if (size == v5)
  {
    result = dmlc::io::SingleFileSplit::LoadChunk(this);
    if (!result)
      return result;
    size = (unsigned __int8 *)this[3].__r_.__value_.__l.__size_;
    v5 = (unsigned __int8 *)this[3].__r_.__value_.__r.__words[2];
  }
  if (size != v5)
  {
    v7 = size;
    while (1)
    {
      v8 = *v7;
      if (v8 == 10 || v8 == 13)
        break;
      if (++v7 == v5)
      {
        v7 = v5;
        break;
      }
    }
    while (v7 != v5)
    {
      v10 = *v7;
      if (v10 != 13 && v10 != 10)
      {
        v5 = v7;
        break;
      }
      ++v7;
    }
  }
  *a2 = size;
  a2[1] = (unsigned __int8 *)(v5 - size);
  this[3].__r_.__value_.__l.__size_ = (std::string::size_type)v5;
  return 1;
}

BOOL dmlc::io::SingleFileSplit::NextChunk(std::string *this, std::string::size_type *a2)
{
  std::string::size_type v4;
  std::string::size_type size;
  _BOOL8 result;

  size = this[3].__r_.__value_.__l.__size_;
  v4 = this[3].__r_.__value_.__r.__words[2];
  if (size == v4)
  {
    result = dmlc::io::SingleFileSplit::LoadChunk(this);
    if (!result)
      return result;
    size = this[3].__r_.__value_.__l.__size_;
    v4 = this[3].__r_.__value_.__r.__words[2];
  }
  *a2 = size;
  a2[1] = v4 - size;
  this[3].__r_.__value_.__l.__size_ = v4;
  return 1;
}

void dmlc::io::SingleFileSplit::~SingleFileSplit(dmlc::io::SingleFileSplit *this)
{
  dmlc::io::SingleFileSplit::~SingleFileSplit(this);
  JUMPOUT(0x227667068);
}

{
  *(_QWORD *)this = &off_24E6BEFE0;
  if (!*((_BYTE *)this + 16))
    fclose(*((FILE **)this + 1));
  if (*((char *)this + 71) < 0)
    operator delete(*((void **)this + 6));
  if (*((char *)this + 47) < 0)
    operator delete(*((void **)this + 3));
}

uint64_t dmlc::io::SingleFileSplit::ResetPartition(dmlc::io::SingleFileSplit *this, int a2, int a3)
{
  std::string *Entry;
  _QWORD *v5;
  _QWORD *v6;
  char v8;

  if (a2 || a3 != 1)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v8);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/single_file_split.h");
    v5 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v8);
    v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"Check failed: part_index == 0 && num_parts == 1", 47);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)": ", 2);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v8);
  }
  return (*(uint64_t (**)(dmlc::io::SingleFileSplit *))(*(_QWORD *)this + 16))(this);
}

void sub_220F59598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

size_t dmlc::io::SingleFileSplit::Read(FILE **this, void *__ptr, size_t a3)
{
  return fread(__ptr, 1uLL, a3, this[1]);
}

void dmlc::io::SingleFileSplit::Write(dmlc::io::SingleFileSplit *this, const void *a2)
{
  std::string *Entry;
  _QWORD *v3;
  char v4;

  Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v4);
  dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/single_file_split.h");
  v3 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"InputSplit do not support write", 31);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v4);
}

void sub_220F59618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

BOOL dmlc::io::SingleFileSplit::LoadChunk(std::string *this)
{
  std::string *v2;
  std::string::size_type size;
  std::string::size_type v4;
  std::string *v5;
  std::string::size_type v6;
  size_t v7;
  std::string *v8;
  size_t v9;
  std::string *v10;
  std::string::size_type v11;
  uint64_t v12;
  std::string::size_type v13;
  size_t v14;
  size_t v15;
  int v16;
  BOOL v17;
  std::string *v18;
  int64_t v19;
  size_t v20;
  std::string *v21;
  std::string *data;

  v2 = this + 2;
  if (SHIBYTE(this[2].__r_.__value_.__r.__words[2]) < 0)
    size = this[2].__r_.__value_.__l.__size_;
  else
    size = HIBYTE(this[2].__r_.__value_.__r.__words[2]);
  v4 = this[3].__r_.__value_.__r.__words[0];
  if (size < v4)
    std::string::resize(this + 2, v4, 0);
  v5 = this + 1;
  while (1)
  {
    LODWORD(v6) = SHIBYTE(this[2].__r_.__value_.__r.__words[2]);
    if ((v6 & 0x80000000) != 0)
    {
      v7 = this[2].__r_.__value_.__l.__size_;
      v8 = v7 ? (std::string *)this[2].__r_.__value_.__r.__words[0] : 0;
    }
    else
    {
      v7 = HIBYTE(this[2].__r_.__value_.__r.__words[2]);
      v8 = *((_BYTE *)&this[2].__r_.__value_.__s + 23) ? v2 : 0;
    }
    if (SHIBYTE(this[1].__r_.__value_.__r.__words[2]) < 0)
    {
      v9 = this[1].__r_.__value_.__l.__size_;
      if (v7 <= v9)
        goto LABEL_44;
      if (!v9)
      {
LABEL_23:
        v11 = 0;
        goto LABEL_25;
      }
      v10 = (std::string *)v5->__r_.__value_.__r.__words[0];
    }
    else
    {
      v9 = HIBYTE(this[1].__r_.__value_.__r.__words[2]);
      if (v7 <= v9)
        goto LABEL_44;
      v10 = this + 1;
      if (!(_DWORD)v9)
        goto LABEL_23;
    }
    memcpy(v8, v10, v9);
    v11 = SHIBYTE(this[1].__r_.__value_.__r.__words[2]) < 0
        ? this[1].__r_.__value_.__l.__size_
        : HIBYTE(this[1].__r_.__value_.__r.__words[2]);
LABEL_25:
    std::string::resize(this + 1, 0, 0);
    v12 = (*(uint64_t (**)(std::string *, char *, size_t))(this->__r_.__value_.__r.__words[0] + 72))(this, (char *)v8 + v11, v7 - v11);
    v13 = v12 + v11;
    if (!(v12 + v11))
      return v13 != 0;
    if (v13 != v7)
      break;
    v14 = v7;
    while (1)
    {
      v15 = v14 - 1;
      if (v14 == 1)
        break;
      v16 = v8->__r_.__value_.__s.__data_[v14 - 1];
      v17 = v16 == 13 || v16 == 10;
      v14 = v15;
      if (v17)
      {
        v18 = (std::string *)((char *)&v8->__r_.__value_.__l.__data_ + v15 + 1);
        goto LABEL_36;
      }
    }
    v18 = v8;
LABEL_36:
    v19 = (char *)v18 - (char *)v8;
    std::string::resize(this + 1, v7 - v19, 0);
    if (SHIBYTE(this[1].__r_.__value_.__r.__words[2]) < 0)
    {
      v20 = this[1].__r_.__value_.__l.__size_;
      if (v20)
      {
        v21 = (std::string *)v5->__r_.__value_.__r.__words[0];
        goto LABEL_41;
      }
    }
    else
    {
      v20 = HIBYTE(this[1].__r_.__value_.__r.__words[2]);
      if (*((_BYTE *)&this[1].__r_.__value_.__s + 23))
      {
        v21 = this + 1;
LABEL_41:
        memcpy(v21, v18, v20);
      }
    }
    if (v19)
      goto LABEL_49;
    LOBYTE(v6) = *((_BYTE *)&this[2].__r_.__value_.__s + 23);
LABEL_44:
    if ((v6 & 0x80) != 0)
      v6 = this[2].__r_.__value_.__l.__size_;
    else
      v6 = v6;
    std::string::resize(v2, 2 * v6, 0);
  }
  v19 = v12 + v11;
LABEL_49:
  if (SHIBYTE(this[2].__r_.__value_.__r.__words[2]) < 0)
  {
    if (this[2].__r_.__value_.__l.__size_)
      data = (std::string *)this[2].__r_.__value_.__l.__data_;
    else
      data = 0;
  }
  else if (*((_BYTE *)&this[2].__r_.__value_.__s + 23))
  {
    data = v2;
  }
  else
  {
    data = 0;
  }
  this[3].__r_.__value_.__l.__size_ = (std::string::size_type)data;
  this[3].__r_.__value_.__r.__words[2] = (std::string::size_type)data + v19;
  return v13 != 0;
}

dmlc::io::InputSplitBase *dmlc::io::InputSplitBase::InputSplitBase(dmlc::io::InputSplitBase *this)
{
  *(_QWORD *)this = &off_24E6BDA00;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_OWORD *)this + 5) = 0u;
  std::vector<unsigned int>::vector((std::vector<unsigned int> *)((char *)this + 128), 0x200001uLL);
  *(_OWORD *)((char *)this + 152) = xmmword_220F667C0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 23) = 0;
  *((_QWORD *)this + 21) = 0;
  return this;
}

void sub_220F59900(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  void **v3;
  void **v4;
  void *v6;
  va_list va;

  va_start(va, a2);
  v4 = v3;
  std::vector<dmlc::io::FileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  v6 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v2 + 24) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(a1);
}

void dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::mutex *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  std::__thread_struct *v10;
  _QWORD *v11;
  void *ptr;
  _QWORD *v13;
  uint64_t v14;
  int v15;
  std::thread v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::thread v20[2];
  std::exception_ptr v21;
  _QWORD v22[3];
  _QWORD *v23;
  _QWORD v24[3];
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  atomic_store(0, (unsigned int *)(a1 + 24));
  atomic_store(0, (unsigned __int8 *)(a1 + 28));
  atomic_store(0, (unsigned __int8 *)(a1 + 40));
  v6 = (std::mutex *)(a1 + 120);
  std::mutex::lock((std::mutex *)(a1 + 120));
  v21.__ptr_ = 0;
  std::exception_ptr::operator=((std::exception_ptr *)(a1 + 392), &v21);
  std::exception_ptr::~exception_ptr(&v21);
  std::mutex::unlock(v6);
  v21.__ptr_ = (void *)a1;
  v7 = v22;
  std::__function::__value_func<xgboost::ObjFunction * ()(void)>::__value_func[abi:ne180100]((uint64_t)v22, a2);
  v8 = v24;
  std::__function::__value_func<xgboost::ObjFunction * ()(void)>::__value_func[abi:ne180100]((uint64_t)v24, a3);
  v9 = (_QWORD *)operator new();
  v10 = (std::__thread_struct *)operator new();
  std::__thread_struct::__thread_struct(v10);
  v11 = (_QWORD *)operator new();
  v20[1].__t_ = 0;
  ptr = v21.__ptr_;
  v13 = v23;
  *v11 = v10;
  v11[1] = ptr;
  if (!v13)
    goto LABEL_4;
  if (v13 != v22)
  {
    v13 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v13 + 16))(v13);
LABEL_4:
    v11[5] = v13;
    goto LABEL_6;
  }
  v11[5] = v11 + 2;
  (*(void (**)(_QWORD *, _QWORD *))(v22[0] + 24))(v22, v11 + 2);
LABEL_6:
  v14 = (uint64_t)v25;
  if (!v25)
  {
LABEL_9:
    v11[9] = v14;
    goto LABEL_11;
  }
  if (v25 != v24)
  {
    v14 = (*(uint64_t (**)(void))(*v25 + 16))();
    goto LABEL_9;
  }
  v11[9] = v11 + 6;
  (*(void (**)(_QWORD *))(v24[0] + 24))(v24);
LABEL_11:
  v15 = pthread_create(&v20[0].__t_, 0, (void *(__cdecl *)(void *))std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Init(std::function<BOOL ()(dmlc::io::InputSplitBase::Chunk**)>,std::function<void ()(void)>)::{lambda(void)#1}>>, v11);
  if (v15)
  {
    std::__throw_system_error(v15, "thread constructor failed");
    __break(1u);
  }
  v16.__t_ = (std::__libcpp_thread_t)v20;
  dmlc::ScopedThread::ScopedThread(v9, v16);
  v17 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v9;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  std::thread::~thread(v20);
  if (v25 == v24)
  {
    v18 = 4;
  }
  else
  {
    if (!v25)
      goto LABEL_19;
    v18 = 5;
    v8 = v25;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v18))(v8);
LABEL_19:
  if (v23 == v22)
  {
    v19 = 4;
  }
  else
  {
    if (!v23)
      return;
    v19 = 5;
    v7 = v23;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v19))(v7);
}

void sub_220F59B9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v8 = va_arg(va1, _QWORD);
  v6 = (_QWORD *)v3[5];
  if (v6 == v4)
  {
    v7 = 4;
  }
  else
  {
    if (!v6)
      goto LABEL_6;
    v7 = 5;
    v4 = (_QWORD *)v3[5];
  }
  (*(void (**)(_QWORD *))(*v4 + 8 * v7))(v4);
LABEL_6:
  std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](v3, 0);
  MEMORY[0x227667068](v3, 0x1020C40EDC32A07);
  std::unique_ptr<std::__thread_struct>::reset[abi:ne180100]((uint64_t *)va, 0);
  MEMORY[0x227667068](v2, 0xA1C40BD48D6D6);
  dmlc::ThreadedIter<dmlc::data::RowBlockContainer<unsigned int,float>>::Init(std::function<BOOL ()(dmlc::data::RowBlockContainer<unsigned int,float>**)>,std::function<void ()(void)>)::{lambda(void)#1}::~function(va1);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::ThreadedInputSplit::HintChunkSize(uint64_t this, unint64_t a2)
{
  unint64_t v2;

  v2 = a2 >> 2;
  if (a2 >> 2 <= *(_QWORD *)(this + 8))
    v2 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = v2;
  return this;
}

uint64_t dmlc::io::ThreadedInputSplit::GetTotalSize(dmlc::io::ThreadedInputSplit *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 3) + 8))(*((_QWORD *)this + 3));
}

void dmlc::io::ThreadedInputSplit::BeforeFirst(dmlc::io::ThreadedInputSplit *this)
{
  char *v2;
  unsigned __int8 v3;

  v2 = (char *)this + 32;
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::BeforeFirst((uint64_t)this + 32);
  if (*((_QWORD *)this + 54))
  {
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet((uint64_t)v2);
    std::mutex::lock((std::mutex *)((char *)this + 88));
    std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)this + 47, (_QWORD *)this + 54);
    *((_QWORD *)this + 54) = 0;
    if (*((_DWORD *)this + 55))
    {
      v3 = atomic_load((unsigned __int8 *)this + 72);
      std::mutex::unlock((std::mutex *)((char *)this + 88));
      if ((v3 & 1) == 0)
        std::condition_variable::notify_one((std::condition_variable *)((char *)this + 224));
    }
    else
    {
      std::mutex::unlock((std::mutex *)((char *)this + 88));
    }
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet((uint64_t)v2);
  }
}

void sub_220F59D98(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::ThreadedInputSplit::NextRecord(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = (_QWORD *)(a1 + 432);
  if (!*(_QWORD *)(a1 + 432) && !dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(a1 + 32, v4))
    return 0;
  do
  {
    v5 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(a1 + 24) + 80))(*(_QWORD *)(a1 + 24), a2, *(_QWORD *)(a1 + 432));
    if ((v5 & 1) != 0)
      break;
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1 + 32);
    std::mutex::lock((std::mutex *)(a1 + 88));
    std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(a1 + 376), v4);
    *(_QWORD *)(a1 + 432) = 0;
    if (*(_DWORD *)(a1 + 220))
    {
      v6 = atomic_load((unsigned __int8 *)(a1 + 72));
      std::mutex::unlock((std::mutex *)(a1 + 88));
      if ((v6 & 1) == 0)
        std::condition_variable::notify_one((std::condition_variable *)(a1 + 224));
    }
    else
    {
      std::mutex::unlock((std::mutex *)(a1 + 88));
    }
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1 + 32);
  }
  while ((dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(a1 + 32, v4) & 1) != 0);
  return v5;
}

void sub_220F59EAC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::ThreadedInputSplit::NextChunk(uint64_t a1, _QWORD *a2)
{
  uint64_t **v4;
  uint64_t result;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  v4 = (uint64_t **)(a1 + 432);
  if (*(_QWORD *)(a1 + 432)
    || (result = dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(a1 + 32, v4), (_DWORD)result))
  {
    while (1)
    {
      v6 = *v4;
      v8 = **v4;
      v7 = (*v4)[1];
      if (v8 != v7)
        break;
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1 + 32);
      std::mutex::lock((std::mutex *)(a1 + 88));
      std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(a1 + 376), v4);
      *(_QWORD *)(a1 + 432) = 0;
      if (*(_DWORD *)(a1 + 220))
      {
        v9 = atomic_load((unsigned __int8 *)(a1 + 72));
        std::mutex::unlock((std::mutex *)(a1 + 88));
        if ((v9 & 1) == 0)
          std::condition_variable::notify_one((std::condition_variable *)(a1 + 224));
      }
      else
      {
        std::mutex::unlock((std::mutex *)(a1 + 88));
      }
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1 + 32);
      if ((dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(a1 + 32, v4) & 1) == 0)
        return 0;
    }
    *a2 = v8;
    a2[1] = v7 - v8;
    *v6 = v7;
    return 1;
  }
  return result;
}

void sub_220F59FB4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void dmlc::io::ThreadedInputSplit::~ThreadedInputSplit(dmlc::io::ThreadedInputSplit *this)
{
  dmlc::io::ThreadedInputSplit::~ThreadedInputSplit(this);
  JUMPOUT(0x227667068);
}

{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  *(_QWORD *)this = &off_24E6BF060;
  v2 = (char *)this + 32;
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Destroy((uint64_t)this + 32);
  v3 = *((_QWORD *)this + 54);
  if (v3)
  {
    v4 = *(void **)(v3 + 16);
    if (v4)
    {
      *(_QWORD *)(v3 + 24) = v4;
      operator delete(v4);
    }
    MEMORY[0x227667068](v3, 0x10C40512A2CE0);
  }
  v5 = *((_QWORD *)this + 3);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 56))(v5);
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::~ThreadedIter((uint64_t)v2);
}

void sub_220F5A000(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227667068](v1, 0x10A1C408D47FA16);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::ThreadedInputSplit::ResetPartition(dmlc::io::ThreadedInputSplit *this)
{
  (*(void (**)(_QWORD))(**((_QWORD **)this + 3) + 64))(*((_QWORD *)this + 3));
  return (*(uint64_t (**)(dmlc::io::ThreadedInputSplit *))(*(_QWORD *)this + 16))(this);
}

void dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::~ThreadedIter(uint64_t a1)
{
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::~ThreadedIter(a1);
  JUMPOUT(0x227667068);
}

void sub_220F5A090(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227667068](v1, 0x10A1C40326A7956);
  _Unwind_Resume(a1);
}

void dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::BeforeFirst(uint64_t a1)
{
  unsigned int v2;
  unsigned __int8 v3;
  std::string *Entry;
  _QWORD *v5;
  _QWORD *v6;
  unsigned __int8 v7;
  std::string *v8;
  _QWORD *v9;
  _QWORD *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  _BOOL4 v14;
  char v15;
  std::unique_lock<std::mutex> __lk;

  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1);
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 56);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (*(_QWORD *)(a1 + 288))
  {
    std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(a1 + 344), (_QWORD *)(a1 + 288));
    *(_QWORD *)(a1 + 288) = 0;
  }
  v2 = atomic_load((unsigned int *)(a1 + 24));
  if (v2 != 2)
  {
    atomic_store(1u, (unsigned int *)(a1 + 24));
    v3 = atomic_load((unsigned __int8 *)(a1 + 28));
    if ((v3 & 1) != 0)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v15);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/threadediter.h");
      v5 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v15);
      v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"Check failed: !producer_sig_processed_.load(std::memory_order_acquire)", 70);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v15);
    }
    if (*(_DWORD *)(a1 + 188))
      std::condition_variable::notify_one((std::condition_variable *)(a1 + 192));
    v7 = atomic_load((unsigned __int8 *)(a1 + 28));
    if ((v7 & 1) != 0)
    {
      v8 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v15);
      dmlc::LogMessageFatal::Entry::Init(v8, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/threadediter.h");
      v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v15);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: !producer_sig_processed_.load(std::memory_order_acquire)", 70);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v15);
    }
    v11 = atomic_load((unsigned __int8 *)(a1 + 28));
    if ((v11 & 1) == 0)
    {
      do
      {
        std::condition_variable::wait((std::condition_variable *)(a1 + 240), &__lk);
        v12 = atomic_load((unsigned __int8 *)(a1 + 28));
      }
      while ((v12 & 1) == 0);
    }
    atomic_store(0, (unsigned __int8 *)(a1 + 28));
    if (*(_DWORD *)(a1 + 188))
    {
      v13 = atomic_load((unsigned __int8 *)(a1 + 40));
      v14 = (v13 & 1) == 0;
    }
    else
    {
      v14 = 0;
    }
    std::unique_lock<std::mutex>::unlock(&__lk);
    if (v14)
      std::condition_variable::notify_one((std::condition_variable *)(a1 + 192));
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1);
  }
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);
}

void sub_220F5A254(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, std::mutex *a14, char a15)
{
  if (a15)
    std::mutex::unlock(a14);
  _Unwind_Resume(exception_object);
}

uint64_t dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(uint64_t a1)
{
  _QWORD *v2;
  unsigned __int8 v3;

  v2 = (_QWORD *)(a1 + 288);
  if (*(_QWORD *)(a1 + 288))
  {
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1);
    std::mutex::lock((std::mutex *)(a1 + 56));
    std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(a1 + 344), v2);
    *(_QWORD *)(a1 + 288) = 0;
    if (*(_DWORD *)(a1 + 188))
    {
      v3 = atomic_load((unsigned __int8 *)(a1 + 40));
      std::mutex::unlock((std::mutex *)(a1 + 56));
      if ((v3 & 1) == 0)
        std::condition_variable::notify_one((std::condition_variable *)(a1 + 192));
    }
    else
    {
      std::mutex::unlock((std::mutex *)(a1 + 56));
    }
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1);
  }
  return dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(a1, v2);
}

void sub_220F5A334(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Value(uint64_t a1)
{
  uint64_t result;
  std::string *Entry;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  char v7;

  result = *(_QWORD *)(a1 + 288);
  if (!result)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v7);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/threadediter.h");
    v4 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v7);
    v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)"Check failed: out_data_ != NULL", 31);
    v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)": ", 2);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"Calling Value at beginning or end?", 34);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v7);
    return *(_QWORD *)(a1 + 288);
  }
  return result;
}

void sub_220F5A3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

void dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(uint64_t a1)
{
  std::mutex *v2;
  std::exception_ptr v3;
  std::exception_ptr v4;
  std::exception_ptr v5;

  v5.__ptr_ = 0;
  v2 = (std::mutex *)(a1 + 120);
  std::mutex::lock((std::mutex *)(a1 + 120));
  if (*(_QWORD *)(a1 + 392))
    std::exception_ptr::operator=(&v5, (const std::exception_ptr *)(a1 + 392));
  std::mutex::unlock(v2);
  if (v5.__ptr_)
  {
    std::exception_ptr::exception_ptr(&v4, &v5);
    v3.__ptr_ = &v4;
    std::rethrow_exception(v3);
    __break(1u);
  }
  else
  {
    std::exception_ptr::~exception_ptr(&v5);
  }
}

void sub_220F5A460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, std::exception_ptr a14, std::exception_ptr a15)
{
  void *v17;
  std::string *Entry;
  _QWORD *v19;
  const char *v20;
  size_t v21;

  std::exception_ptr::~exception_ptr(&a14);
  if (a2 == 1)
  {
    v17 = __cxa_begin_catch(a1);
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&a13);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/threadediter.h");
    v19 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&a13);
    v20 = (const char *)(*(uint64_t (**)(void *))(*(_QWORD *)v17 + 16))(v17);
    v21 = strlen(v20);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, v21);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
    __cxa_end_catch();
    JUMPOUT(0x220F5A430);
  }
  std::exception_ptr::~exception_ptr(&a15);
  _Unwind_Resume(a1);
}

void std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  int64_t v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t i;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  BOOL v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;

  v4 = (char *)a1[1];
  v5 = (char *)a1[2];
  v6 = v5 - v4;
  if (v5 == v4)
    v7 = 0;
  else
    v7 = ((v5 - v4) << 6) - 1;
  v9 = a1[4];
  v8 = a1[5];
  v10 = v8 + v9;
  if (v7 == v8 + v9)
  {
    if (v9 < 0x200)
    {
      v24 = v6 >> 3;
      v25 = (char *)a1[3];
      v26 = (char *)*a1;
      v27 = (uint64_t)&v25[-*a1];
      if (v6 >> 3 >= (unint64_t)(v27 >> 3))
      {
        v30 = v27 >> 2;
        if (v25 == v26)
          v31 = 1;
        else
          v31 = v30;
        v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v31);
        v34 = v33;
        v35 = operator new(0x1000uLL);
        v36 = &v32[8 * v24];
        v37 = &v32[8 * v34];
        if (v24 == v34)
        {
          v38 = 8 * v24;
          if (v6 < 1)
          {
            v73 = v35;
            v74 = v38 >> 2;
            if (v5 == v4)
              v75 = 1;
            else
              v75 = v74;
            v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v75);
            v36 = &v76[8 * (v75 >> 2)];
            v37 = &v76[8 * v77];
            if (v32)
              operator delete(v32);
            v32 = v76;
            v35 = v73;
          }
          else
          {
            v39 = v38 >> 3;
            if (v39 >= -1)
              v40 = v39 + 1;
            else
              v40 = v39 + 2;
            v36 -= 8 * (v40 >> 1);
          }
        }
        *(_QWORD *)v36 = v35;
        v78 = v36 + 8;
        for (i = a1[2]; i != a1[1]; i -= 8)
        {
          if (v36 == v32)
          {
            if (v78 >= v37)
            {
              if (v37 == v32)
                v84 = 1;
              else
                v84 = (v37 - v32) >> 2;
              v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v84);
              v87 = v85;
              v36 = &v85[(2 * v84 + 6) & 0xFFFFFFFFFFFFFFF8];
              v89 = v78 - v32;
              v88 = v78 == v32;
              v78 = v36;
              if (!v88)
              {
                v78 = &v36[v89 & 0xFFFFFFFFFFFFFFF8];
                v90 = 8 * (v89 >> 3);
                v91 = v36;
                v92 = (uint64_t *)v32;
                do
                {
                  v93 = *v92++;
                  *(_QWORD *)v91 = v93;
                  v91 += 8;
                  v90 -= 8;
                }
                while (v90);
              }
              v37 = &v85[8 * v86];
              if (v32)
                operator delete(v32);
              v32 = v87;
            }
            else
            {
              v80 = (v37 - v78) >> 3;
              if (v80 >= -1)
                v81 = v80 + 1;
              else
                v81 = v80 + 2;
              v82 = v81 >> 1;
              v36 = &v32[8 * (v81 >> 1)];
              v83 = v32;
              if (v78 != v32)
              {
                memmove(v36, v32, v78 - v32);
                v83 = v78;
              }
              v78 = &v83[8 * v82];
            }
          }
          v94 = *(_QWORD *)(i - 8);
          *((_QWORD *)v36 - 1) = v94;
          v36 -= 8;
        }
        v95 = (char *)*a1;
        *a1 = v32;
        a1[1] = v36;
        a1[2] = v78;
        a1[3] = v37;
        if (v95)
          operator delete(v95);
        goto LABEL_36;
      }
      v28 = operator new(0x1000uLL);
      v29 = v28;
      if (v25 == v5)
      {
        if (v4 == v26)
        {
          if (v5 == v4)
            v51 = 1;
          else
            v51 = (v25 - v4) >> 2;
          v52 = 2 * v51;
          v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v51);
          v4 = &v53[(v52 + 6) & 0xFFFFFFFFFFFFFFF8];
          v55 = (uint64_t *)a1[1];
          v56 = v4;
          v57 = a1[2] - (_QWORD)v55;
          if (v57)
          {
            v56 = &v4[v57 & 0xFFFFFFFFFFFFFFF8];
            v58 = 8 * (v57 >> 3);
            v59 = &v53[(v52 + 6) & 0xFFFFFFFFFFFFFFF8];
            do
            {
              v60 = *v55++;
              *(_QWORD *)v59 = v60;
              v59 += 8;
              v58 -= 8;
            }
            while (v58);
          }
          v61 = (char *)*a1;
          *a1 = v53;
          a1[1] = v4;
          a1[2] = v56;
          a1[3] = &v53[8 * v54];
          if (v61)
          {
            operator delete(v61);
            v4 = (char *)a1[1];
          }
        }
        *((_QWORD *)v4 - 1) = v29;
        v62 = (char *)a1[1];
        v63 = (char *)a1[2];
        a1[1] = v62 - 8;
        v64 = *((_QWORD *)v62 - 1);
        a1[1] = v62;
        if (v63 == (char *)a1[3])
        {
          v65 = (uint64_t)&v62[-*a1];
          if ((unint64_t)v62 <= *a1)
          {
            if (v63 == (char *)*a1)
              v96 = 1;
            else
              v96 = (uint64_t)&v63[-*a1] >> 2;
            v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v96);
            v99 = &v97[8 * (v96 >> 2)];
            v100 = (uint64_t *)a1[1];
            v63 = v99;
            v101 = a1[2] - (_QWORD)v100;
            if (v101)
            {
              v63 = &v99[v101 & 0xFFFFFFFFFFFFFFF8];
              v102 = 8 * (v101 >> 3);
              v103 = &v97[8 * (v96 >> 2)];
              do
              {
                v104 = *v100++;
                *(_QWORD *)v103 = v104;
                v103 += 8;
                v102 -= 8;
              }
              while (v102);
            }
            v105 = (char *)*a1;
            *a1 = v97;
            a1[1] = v99;
            a1[2] = v63;
            a1[3] = &v97[8 * v98];
            if (v105)
            {
              operator delete(v105);
              v63 = (char *)a1[2];
            }
          }
          else
          {
            v66 = v65 >> 3;
            v16 = v65 >> 3 < -1;
            v67 = (v65 >> 3) + 2;
            if (v16)
              v68 = v67;
            else
              v68 = v66 + 1;
            v69 = -(v68 >> 1);
            v70 = v68 >> 1;
            v71 = &v62[-8 * v70];
            v72 = v63 - v62;
            if (v63 != v62)
            {
              memmove(&v62[-8 * v70], v62, v63 - v62);
              v62 = (char *)a1[1];
            }
            v63 = &v71[v72];
            a1[1] = &v62[8 * v69];
            a1[2] = &v71[v72];
          }
        }
        *(_QWORD *)v63 = v64;
      }
      else
      {
        *(_QWORD *)v5 = v28;
      }
    }
    else
    {
      a1[4] = v9 - 512;
      v13 = *(_QWORD *)v4;
      v11 = v4 + 8;
      v12 = v13;
      a1[1] = v11;
      if (v5 == (char *)a1[3])
      {
        v14 = (uint64_t)&v11[-*a1];
        if ((unint64_t)v11 <= *a1)
        {
          if (v5 == (char *)*a1)
            v41 = 1;
          else
            v41 = (uint64_t)&v5[-*a1] >> 2;
          v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> **>>(v41);
          v44 = &v42[8 * (v41 >> 2)];
          v45 = (uint64_t *)a1[1];
          v5 = v44;
          v46 = a1[2] - (_QWORD)v45;
          if (v46)
          {
            v5 = &v44[v46 & 0xFFFFFFFFFFFFFFF8];
            v47 = 8 * (v46 >> 3);
            v48 = &v42[8 * (v41 >> 2)];
            do
            {
              v49 = *v45++;
              *(_QWORD *)v48 = v49;
              v48 += 8;
              v47 -= 8;
            }
            while (v47);
          }
          v50 = (char *)*a1;
          *a1 = v42;
          a1[1] = v44;
          a1[2] = v5;
          a1[3] = &v42[8 * v43];
          if (v50)
          {
            operator delete(v50);
            v5 = (char *)a1[2];
          }
        }
        else
        {
          v15 = v14 >> 3;
          v16 = v14 >> 3 < -1;
          v17 = (v14 >> 3) + 2;
          if (v16)
            v18 = v17;
          else
            v18 = v15 + 1;
          v19 = -(v18 >> 1);
          v20 = v18 >> 1;
          v21 = &v11[-8 * v20];
          v22 = v5 - v11;
          if (v5 != v11)
          {
            memmove(&v11[-8 * v20], v11, v5 - v11);
            v5 = (char *)a1[1];
          }
          v23 = &v5[8 * v19];
          v5 = &v21[v22];
          a1[1] = v23;
          a1[2] = &v21[v22];
        }
      }
      *(_QWORD *)v5 = v12;
    }
    a1[2] += 8;
LABEL_36:
    v4 = (char *)a1[1];
    v8 = a1[5];
    v10 = a1[4] + v8;
  }
  *(_QWORD *)(*(_QWORD *)&v4[(v10 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v10 & 0x1FF)) = *a2;
  a1[5] = v8 + 1;
}

void sub_220F5A9D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  if (v1)
    operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(uint64_t a1, _QWORD *a2)
{
  unsigned int *v2;
  unsigned int v3;
  uint64_t v4;
  std::string *Entry;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  unsigned __int8 v14;
  unint64_t v15;
  unsigned __int8 v16;
  _BOOL4 v17;
  unsigned __int8 v19;
  std::string *v20;
  _QWORD *v21;
  _QWORD *v22;
  char v23;
  std::unique_lock<std::mutex> __lk;

  v2 = (unsigned int *)(a1 + 24);
  v3 = atomic_load((unsigned int *)(a1 + 24));
  if (v3 == 2)
    return 0;
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1);
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 56);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 56));
  if (atomic_load(v2))
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v23);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/threadediter.h");
    v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v23);
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: producer_sig_.load(std::memory_order_acquire) == kProduce", 71);
    v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"Make sure you call BeforeFirst not inconcurrent with Next!", 58);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v23);
  }
  v12 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a1 + 184) = v12 + 1;
  v13 = *(_QWORD *)(a1 + 336);
  if (v13)
  {
LABEL_9:
    *(_DWORD *)(a1 + 184) = v12;
  }
  else
  {
    while (1)
    {
      v14 = atomic_load((unsigned __int8 *)(a1 + 40));
      if ((v14 & 1) != 0)
        break;
      std::condition_variable::wait((std::condition_variable *)(a1 + 240), &__lk);
      v13 = *(_QWORD *)(a1 + 336);
      if (v13)
      {
        v12 = *(_DWORD *)(a1 + 184) - 1;
        goto LABEL_9;
      }
    }
    v13 = *(_QWORD *)(a1 + 336);
    --*(_DWORD *)(a1 + 184);
    if (!v13)
    {
      v19 = atomic_load((unsigned __int8 *)(a1 + 40));
      if ((v19 & 1) == 0)
      {
        v20 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v23);
        dmlc::LogMessageFatal::Entry::Init(v20, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/threadediter.h");
        v21 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v23);
        v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"Check failed: produce_end_.load(std::memory_order_acquire)", 58);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)": ", 2);
        dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v23);
      }
      std::unique_lock<std::mutex>::unlock(&__lk);
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1);
      v4 = 0;
      goto LABEL_18;
    }
  }
  v15 = *(_QWORD *)(a1 + 328);
  *a2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 304) + ((v15 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v15 & 0x1FF));
  *(_QWORD *)(a1 + 328) = v15 + 1;
  *(_QWORD *)(a1 + 336) = v13 - 1;
  if (v15 + 1 >= 0x400)
  {
    operator delete(**(void ***)(a1 + 304));
    *(_QWORD *)(a1 + 304) += 8;
    *(_QWORD *)(a1 + 328) -= 512;
  }
  if (*(_DWORD *)(a1 + 188))
  {
    v16 = atomic_load((unsigned __int8 *)(a1 + 40));
    v17 = (v16 & 1) == 0;
  }
  else
  {
    v17 = 0;
  }
  std::unique_lock<std::mutex>::unlock(&__lk);
  if (v17)
    std::condition_variable::notify_one((std::condition_variable *)(a1 + 192));
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(a1);
  v4 = 1;
LABEL_18:
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);
  return v4;
}

void sub_220F5AC34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, std::mutex *a14, char a15)
{
  if (a15)
    std::mutex::unlock(a14);
  _Unwind_Resume(exception_object);
}

uint64_t std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Init(std::function<BOOL ()(dmlc::io::InputSplitBase::Chunk**)>,std::function<void ()(void)>)::{lambda(void)#1}>>(uint64_t *a1)
{
  std::__thread_specific_ptr<std::__thread_struct> *v2;
  const void *v3;
  uint64_t v4;
  unsigned __int8 v6;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void **v15;
  unint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  _QWORD *v19;
  int v20;
  std::unique_lock<std::mutex> __lk;
  uint64_t v23;
  uint64_t *v24;

  v2 = std::__thread_local_data();
  v3 = (const void *)*a1;
  *a1 = 0;
  pthread_setspecific(v2->__key_, v3);
  v4 = a1[1];
  do
  {
    v23 = 0;
    __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v4 + 56);
    __lk.__owns_ = 1;
    std::mutex::lock((std::mutex *)(v4 + 56));
    ++*(_DWORD *)(v4 + 188);
    while (!atomic_load((unsigned int *)(v4 + 24)))
    {
      v6 = atomic_load((unsigned __int8 *)(v4 + 40));
      if ((v6 & 1) == 0 && (*(_QWORD *)(v4 + 336) < *(_QWORD *)(v4 + 48) || *(_QWORD *)(v4 + 384)))
        break;
      std::condition_variable::wait((std::condition_variable *)(v4 + 192), &__lk);
    }
    --*(_DWORD *)(v4 + 188);
    v8 = atomic_load((unsigned int *)(v4 + 24));
    if (v8)
    {
      v9 = atomic_load((unsigned int *)(v4 + 24));
      if (v9 == 1)
      {
        v10 = a1[9];
        if (!v10)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 48))(v10);
        if (*(_QWORD *)(v4 + 336))
        {
          v11 = *(_QWORD *)(v4 + 328);
          do
          {
            std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(v4 + 344), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 304) + ((v11 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v11 & 0x1FF)));
            v12 = *(_QWORD *)(v4 + 336) - 1;
            v11 = *(_QWORD *)(v4 + 328) + 1;
            *(_QWORD *)(v4 + 328) = v11;
            *(_QWORD *)(v4 + 336) = v12;
            if (v11 >= 0x400)
            {
              operator delete(**(void ***)(v4 + 304));
              *(_QWORD *)(v4 + 304) += 8;
              v12 = *(_QWORD *)(v4 + 336);
              v11 = *(_QWORD *)(v4 + 328) - 512;
              *(_QWORD *)(v4 + 328) = v11;
            }
          }
          while (v12);
        }
        atomic_store(0, (unsigned __int8 *)(v4 + 40));
        atomic_store(1u, (unsigned __int8 *)(v4 + 28));
        atomic_store(0, (unsigned int *)(v4 + 24));
        std::unique_lock<std::mutex>::unlock(&__lk);
        v13 = 2;
      }
      else
      {
        v13 = 1;
        atomic_store(1u, (unsigned __int8 *)(v4 + 28));
        atomic_store(1u, (unsigned __int8 *)(v4 + 40));
        std::unique_lock<std::mutex>::unlock(&__lk);
      }
      std::condition_variable::notify_all((std::condition_variable *)(v4 + 240));
    }
    else
    {
      v14 = *(_QWORD *)(v4 + 384);
      if (v14
        && (v15 = *(void ***)(v4 + 352),
            v16 = *(_QWORD *)(v4 + 376),
            v23 = (*(_QWORD **)((char *)v15 + ((v16 >> 6) & 0x3FFFFFFFFFFFFF8)))[v16 & 0x1FF],
            ++v16,
            *(_QWORD *)(v4 + 376) = v16,
            *(_QWORD *)(v4 + 384) = v14 - 1,
            v16 >= 0x400))
      {
        operator delete(*v15);
        v13 = 0;
        *(_QWORD *)(v4 + 352) += 8;
        *(_QWORD *)(v4 + 376) -= 512;
      }
      else
      {
        v13 = 0;
      }
    }
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);
    if (!v8)
    {
      v24 = &v23;
      v17 = a1[5];
      if (!v17)
        std::__throw_bad_function_call[abi:ne180100]();
      atomic_store((*(uint64_t (**)(uint64_t, uint64_t **))(*(_QWORD *)v17 + 48))(v17, &v24) ^ 1, (unsigned __int8 *)(v4 + 40));
      std::mutex::lock((std::mutex *)(v4 + 56));
      v18 = atomic_load((unsigned __int8 *)(v4 + 40));
      v19 = (_QWORD *)(v4 + 296);
      if ((v18 & 1) == 0 || (v19 = (_QWORD *)(v4 + 344), v23))
        std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back(v19, &v23);
      v20 = *(_DWORD *)(v4 + 184);
      std::mutex::unlock((std::mutex *)(v4 + 56));
      if (v20)
        std::condition_variable::notify_all((std::condition_variable *)(v4 + 240));
      v13 = 0;
    }
  }
  while (v13 != 1);
  std::default_delete<std::tuple<std::unique_ptr<std::__thread_struct>,dmlc::ThreadedIter<dmlc::data::RowBlockContainer<unsigned int,float>>::Init(std::function<BOOL ()(dmlc::data::RowBlockContainer<unsigned int,float>**)>,std::function<void ()(void)>)::{lambda(void)#1}>>::operator()[abi:ne180100](a1);
  return 0;
}

void sub_220F5AF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, uint64_t a10, int64x2_t *a11, std::unique_lock<std::mutex> a12)
{
  uint64_t *v12;
  std::condition_variable *v13;
  uint64_t v14;
  _QWORD *v15;
  std::mutex *v16;
  uint64_t v17;
  unsigned int v20;
  unsigned int v21;
  int v22;

  std::mutex::unlock(v16);
  if (a2 != 1)
  {
    if (v12)
      std::default_delete<std::tuple<std::unique_ptr<std::__thread_struct>,dmlc::ThreadedIter<dmlc::data::RowBlockContainer<unsigned int,float>>::Init(std::function<BOOL ()(dmlc::data::RowBlockContainer<unsigned int,float>**)>,std::function<void ()(void)>)::{lambda(void)#1}>>::operator()[abi:ne180100](v12);
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  std::mutex::lock((std::mutex *)(v17 + 120));
  if (!*(_QWORD *)(v17 + 392))
  {
    std::current_exception();
    std::exception_ptr::operator=((std::exception_ptr *)(v17 + 392), (const std::exception_ptr *)&a12);
    std::exception_ptr::~exception_ptr((std::exception_ptr *)&a12);
  }
  std::mutex::unlock((std::mutex *)(v17 + 120));
  a12.__m_ = v16;
  a12.__owns_ = 1;
  std::mutex::lock(v16);
  v20 = atomic_load((unsigned int *)(v17 + 24));
  if (v20 == 1)
  {
    while (*(_QWORD *)(v17 + 336))
    {
      std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back(v15, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v17 + 304) + ((*(_QWORD *)(v17 + 328) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*(_QWORD *)(v17 + 328) & 0x1FFLL)));
      *a11 = vaddq_s64(*a11, (int64x2_t)xmmword_220F5EF90);
      std::deque<dmlc::data::RowBlockContainer<unsigned int,float> *,std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> *>>::__maybe_remove_front_spare[abi:ne180100](v14);
    }
    atomic_store(1u, (unsigned __int8 *)(v17 + 40));
    atomic_store(1u, (unsigned __int8 *)(v17 + 28));
    std::unique_lock<std::mutex>::unlock(&a12);
  }
  else
  {
    v21 = atomic_load((unsigned int *)(v17 + 24));
    if (v21
      || (atomic_store(1u, (unsigned __int8 *)(v17 + 40)),
          v22 = *(_DWORD *)(v17 + 184),
          std::unique_lock<std::mutex>::unlock(&a12),
          !v22))
    {
LABEL_10:
      if (a12.__owns_)
        std::mutex::unlock(a12.__m_);
      __cxa_end_catch();
      JUMPOUT(0x220F5AF30);
    }
  }
  std::condition_variable::notify_all(v13);
  goto LABEL_10;
}

void std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24E6BF130;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24E6BF130;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::operator()(uint64_t a1, uint64_t **a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  std::vector<unsigned int>::size_type v5;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  v4 = **a2;
  if (!v4)
  {
    v4 = operator new();
    v5 = *(_QWORD *)(v2 + 8) + 1;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    std::vector<unsigned int>::vector((std::vector<unsigned int> *)(v4 + 16), v5);
    *v3 = v4;
  }
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(v2 + 24) + 104))(*(_QWORD *)(v2 + 24), v4, *(_QWORD *)(v2 + 16));
}

void sub_220F5B20C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227667068](v1, 0x10C40512A2CE0);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::target_type()
{
}

void std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24E6BF1C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24E6BF1C0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));
}

uint64_t std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1},std::allocator<dmlc::io::ThreadedInputSplit::ThreadedInputSplit(dmlc::io::InputSplitBase *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

uint64_t dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::~ThreadedIter(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = &off_24E6BF0D0;
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Destroy(a1);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(a1 + 392));
  std::deque<dmlc::data::RowBlockContainer<unsigned int,float> *,std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> *>>::~deque[abi:ne180100](a1 + 344);
  std::deque<dmlc::data::RowBlockContainer<unsigned int,float> *,std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> *>>::~deque[abi:ne180100](a1 + 296);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 240));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 192));
  std::mutex::~mutex((std::mutex *)(a1 + 120));
  std::mutex::~mutex((std::mutex *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100](a1 + 8);
  return a1;
}

void sub_220F5B3C0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v3;

  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v1 + 392));
  std::deque<dmlc::data::RowBlockContainer<unsigned int,float> *,std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> *>>::~deque[abi:ne180100](v1 + 344);
  std::deque<dmlc::data::RowBlockContainer<unsigned int,float> *,std::allocator<dmlc::data::RowBlockContainer<unsigned int,float> *>>::~deque[abi:ne180100](v1 + 296);
  std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 240));
  std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 192));
  std::mutex::~mutex((std::mutex *)(v1 + 120));
  std::mutex::~mutex((std::mutex *)(v1 + 56));
  v3 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  std::shared_ptr<xgboost::BatchIteratorImpl<xgboost::SparsePage>>::~shared_ptr[abi:ne180100](v1 + 8);
  _Unwind_Resume(a1);
}

void dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Destroy(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  void *v15;

  if (*(_QWORD *)(a1 + 32))
  {
    std::mutex::lock((std::mutex *)(a1 + 56));
    atomic_store(2u, (unsigned int *)(a1 + 24));
    if (*(_DWORD *)(a1 + 188))
      std::condition_variable::notify_one((std::condition_variable *)(a1 + 192));
    std::mutex::unlock((std::mutex *)(a1 + 56));
    v2 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  v3 = *(_QWORD *)(a1 + 384);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 376);
    do
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 352) + ((v4 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v4 & 0x1FF));
      if (v5)
      {
        v6 = *(void **)(v5 + 16);
        if (v6)
        {
          *(_QWORD *)(v5 + 24) = v6;
          operator delete(v6);
        }
        MEMORY[0x227667068](v5, 0x10C40512A2CE0);
        v4 = *(_QWORD *)(a1 + 376);
        v3 = *(_QWORD *)(a1 + 384);
      }
      --v3;
      *(_QWORD *)(a1 + 376) = ++v4;
      *(_QWORD *)(a1 + 384) = v3;
      if (v4 >= 0x400)
      {
        operator delete(**(void ***)(a1 + 352));
        *(_QWORD *)(a1 + 352) += 8;
        v3 = *(_QWORD *)(a1 + 384);
        v4 = *(_QWORD *)(a1 + 376) - 512;
        *(_QWORD *)(a1 + 376) = v4;
      }
    }
    while (v3);
  }
  v7 = *(_QWORD *)(a1 + 336);
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 328);
    do
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 304) + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF));
      if (v9)
      {
        v10 = *(void **)(v9 + 16);
        if (v10)
        {
          *(_QWORD *)(v9 + 24) = v10;
          operator delete(v10);
        }
        MEMORY[0x227667068](v9, 0x10C40512A2CE0);
        v8 = *(_QWORD *)(a1 + 328);
        v7 = *(_QWORD *)(a1 + 336);
      }
      --v7;
      *(_QWORD *)(a1 + 328) = ++v8;
      *(_QWORD *)(a1 + 336) = v7;
      if (v8 >= 0x400)
      {
        operator delete(**(void ***)(a1 + 304));
        *(_QWORD *)(a1 + 304) += 8;
        v7 = *(_QWORD *)(a1 + 336);
        v8 = *(_QWORD *)(a1 + 328) - 512;
        *(_QWORD *)(a1 + 328) = v8;
      }
    }
    while (v7);
  }
  if (*(_QWORD *)(a1 + 8))
  {
    v11 = *(std::__shared_weak_count **)(a1 + 16);
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  v14 = *(_QWORD *)(a1 + 288);
  if (v14)
  {
    v15 = *(void **)(v14 + 16);
    if (v15)
    {
      *(_QWORD *)(v14 + 24) = v15;
      operator delete(v15);
    }
    MEMORY[0x227667068](v14, 0x10C40512A2CE0);
    *(_QWORD *)(a1 + 288) = 0;
  }
}

void sub_220F5B6B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::~ThreadedIter(v1);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::CachedInputSplit::HintChunkSize(uint64_t this, unint64_t a2)
{
  unint64_t v2;

  v2 = a2 >> 2;
  if (a2 >> 2 <= *(_QWORD *)(this + 8))
    v2 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = v2;
  return this;
}

uint64_t dmlc::io::CachedInputSplit::GetTotalSize(dmlc::io::CachedInputSplit *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 7) + 8))(*((_QWORD *)this + 7));
}

void dmlc::io::CachedInputSplit::BeforeFirst(dmlc::io::CachedInputSplit *this)
{
  uint64_t v2;
  _QWORD *v3;
  unsigned __int8 v4;
  int v5;
  uint64_t v6;
  unsigned __int8 v7;
  char v8;
  uint64_t v9;
  dmlc::SeekStream *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  std::string *Entry;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unsigned __int8 v20;
  _QWORD v21[3];
  _QWORD *v22;
  _QWORD v23[3];
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 9);
  if (!v2)
  {
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::BeforeFirst((uint64_t)this + 80);
    goto LABEL_33;
  }
  v3 = (_QWORD *)((char *)this + 64);
  if (*((_QWORD *)this + 8))
  {
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(*((_QWORD *)this + 9));
    std::mutex::lock((std::mutex *)(v2 + 56));
    std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(v2 + 344), (_QWORD *)this + 8);
    *v3 = 0;
    if (*(_DWORD *)(v2 + 188))
    {
      v4 = atomic_load((unsigned __int8 *)(v2 + 40));
      std::mutex::unlock((std::mutex *)(v2 + 56));
      if ((v4 & 1) == 0)
        std::condition_variable::notify_one((std::condition_variable *)(v2 + 192));
    }
    else
    {
      std::mutex::unlock((std::mutex *)(v2 + 56));
    }
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(v2);
    v2 = *((_QWORD *)this + 9);
  }
  v5 = dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(v2, (_QWORD *)this + 8);
  v6 = *((_QWORD *)this + 9);
  if (v5)
  {
    do
    {
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(v6);
      std::mutex::lock((std::mutex *)(v6 + 56));
      std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(v6 + 344), (_QWORD *)this + 8);
      *v3 = 0;
      if (*(_DWORD *)(v6 + 188))
      {
        v7 = atomic_load((unsigned __int8 *)(v6 + 40));
        std::mutex::unlock((std::mutex *)(v6 + 56));
        if ((v7 & 1) == 0)
          std::condition_variable::notify_one((std::condition_variable *)(v6 + 192));
      }
      else
      {
        std::mutex::unlock((std::mutex *)(v6 + 56));
      }
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(v6);
      v8 = dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(*((_QWORD *)this + 9), (_QWORD *)this + 8);
      v6 = *((_QWORD *)this + 9);
    }
    while ((v8 & 1) != 0);
  }
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v9 = *((_QWORD *)this + 5);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 5) = 0;
  v10 = (dmlc::io::CachedInputSplit *)((char *)this + 16);
  if (*((char *)this + 39) < 0)
    v10 = *(dmlc::SeekStream **)v10;
  v11 = dmlc::SeekStream::CreateForRead(v10, (const char *)1);
  *((_QWORD *)this + 6) = v11;
  if (!v11)
  {
    Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v23);
    dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/cached_input_split.h");
    v15 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)v23);
    v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"Check failed: this->InitCachedIter()", 36);
    v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)": ", 2);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"Failed to initialize CachedIter", 31);
    dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)v23);
    goto LABEL_33;
  }
  v23[0] = &off_24E6BF2B0;
  v23[1] = this;
  v24 = v23;
  v21[0] = &off_24E6BF330;
  v21[1] = this;
  v22 = v21;
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Init((uint64_t)this + 80, (uint64_t)v23, (uint64_t)v21);
  v12 = v22;
  if (v22 == v21)
  {
    v13 = 4;
    v12 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_28;
    v13 = 5;
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_28:
  v18 = v24;
  if (v24 == v23)
  {
    v19 = 4;
    v18 = v23;
  }
  else
  {
    if (!v24)
      goto LABEL_33;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_33:
  if (*((_QWORD *)this + 8))
  {
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet((uint64_t)this + 80);
    std::mutex::lock((std::mutex *)((char *)this + 136));
    std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)this + 53, (_QWORD *)this + 8);
    *((_QWORD *)this + 8) = 0;
    if (*((_DWORD *)this + 67))
    {
      v20 = atomic_load((unsigned __int8 *)this + 120);
      std::mutex::unlock((std::mutex *)((char *)this + 136));
      if ((v20 & 1) == 0)
        std::condition_variable::notify_one((std::condition_variable *)((char *)this + 272));
    }
    else
    {
      std::mutex::unlock((std::mutex *)((char *)this + 136));
    }
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet((uint64_t)this + 80);
  }
}

void sub_220F5BA04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v19 = a13;
  if (a13 == v17)
  {
    v20 = 4;
    v19 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  v21 = a17;
  if (a17 == &a14)
  {
    v22 = 4;
    v21 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

uint64_t dmlc::io::CachedInputSplit::NextRecord(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = (_QWORD *)(a1 + 64);
  if (*(_QWORD *)(a1 + 72))
    v5 = *(_QWORD *)(a1 + 72);
  else
    v5 = a1 + 80;
  if (!*(_QWORD *)(a1 + 64) && !dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(v5, v4))
    return 0;
  do
  {
    v6 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(a1 + 56) + 80))(*(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 64));
    if ((v6 & 1) != 0)
      break;
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(v5);
    std::mutex::lock((std::mutex *)(v5 + 56));
    std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(v5 + 344), v4);
    *v4 = 0;
    if (*(_DWORD *)(v5 + 188))
    {
      v7 = atomic_load((unsigned __int8 *)(v5 + 40));
      std::mutex::unlock((std::mutex *)(v5 + 56));
      if ((v7 & 1) == 0)
        std::condition_variable::notify_one((std::condition_variable *)(v5 + 192));
    }
    else
    {
      std::mutex::unlock((std::mutex *)(v5 + 56));
    }
    dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(v5);
  }
  while ((dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(v5, v4) & 1) != 0);
  return v6;
}

void sub_220F5BBB8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t dmlc::io::CachedInputSplit::NextChunk(uint64_t a1, _QWORD *a2)
{
  uint64_t **v3;
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  v3 = (uint64_t **)(a1 + 64);
  if (*(_QWORD *)(a1 + 72))
    v4 = *(_QWORD *)(a1 + 72);
  else
    v4 = a1 + 80;
  if (*(_QWORD *)(a1 + 64)
    || (result = dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(v4, v3), (_DWORD)result))
  {
    while (1)
    {
      v6 = *v3;
      v8 = **v3;
      v7 = (*v3)[1];
      if (v8 != v7)
        break;
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(v4);
      std::mutex::lock((std::mutex *)(v4 + 56));
      std::deque<dmlc::io::InputSplitBase::Chunk *>::push_back((_QWORD *)(v4 + 344), v3);
      *v3 = 0;
      if (*(_DWORD *)(v4 + 188))
      {
        v9 = atomic_load((unsigned __int8 *)(v4 + 40));
        std::mutex::unlock((std::mutex *)(v4 + 56));
        if ((v9 & 1) == 0)
          std::condition_variable::notify_one((std::condition_variable *)(v4 + 192));
      }
      else
      {
        std::mutex::unlock((std::mutex *)(v4 + 56));
      }
      dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::ThrowExceptionIfSet(v4);
      if ((dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Next(v4, v3) & 1) == 0)
        return 0;
    }
    *a2 = v8;
    a2[1] = v7 - v8;
    *v6 = v7;
    return 1;
  }
  return result;
}

void sub_220F5BCC4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void dmlc::io::CachedInputSplit::~CachedInputSplit(dmlc::io::CachedInputSplit *this)
{
  dmlc::io::CachedInputSplit::~CachedInputSplit(this);
  JUMPOUT(0x227667068);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_24E6BF240;
  v2 = *((_QWORD *)this + 9);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 5);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::Destroy((uint64_t)this + 80);
  v4 = *((_QWORD *)this + 8);
  if (v4)
  {
    v5 = *(void **)(v4 + 16);
    if (v5)
    {
      *(_QWORD *)(v4 + 24) = v5;
      operator delete(v5);
    }
    MEMORY[0x227667068](v4, 0x10C40512A2CE0);
  }
  v6 = *((_QWORD *)this + 7);
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 56))(v6);
  v7 = *((_QWORD *)this + 6);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
  dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::~ThreadedIter((uint64_t)this + 80);
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

void sub_220F5BD10(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227667068](v1, 0x10B3C4005E97F15);
  _Unwind_Resume(a1);
}

void dmlc::io::CachedInputSplit::ResetPartition(dmlc::io::CachedInputSplit *this)
{
  std::string *Entry;
  _QWORD *v2;
  char v3;

  Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v3);
  dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/cached_input_split.h");
  v2 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)"ResetPartition is not supported in CachedInputSplit", 51);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v3);
}

void sub_220F5BD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

void std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24E6BF2B0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24E6BF2B0;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::operator()(uint64_t a1, uint64_t **a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  std::vector<unsigned int>::size_type v5;
  uint64_t v6;
  uint64_t v7;
  std::string *Entry;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::string *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char v31;
  char v32;
  unint64_t v33;

  v2 = *a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = **a2;
  if (!v4)
  {
    v4 = operator new();
    v5 = *(_QWORD *)(v3 + 8) + 1;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    std::vector<unsigned int>::vector((std::vector<unsigned int> *)(v4 + 16), v5);
    *v2 = v4;
  }
  v33 = 0;
  v6 = (***(uint64_t (****)(_QWORD, unint64_t *, uint64_t))(v3 + 48))(*(_QWORD *)(v3 + 48), &v33, 8);
  v7 = v6;
  if (v6)
  {
    if (v6 != 8)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v32);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/cached_input_split.h");
      v9 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v32);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"Check failed: nread == sizeof(size)", 35);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2);
      v12 = *(char *)(v3 + 39);
      if (v12 >= 0)
        v13 = v3 + 16;
      else
        v13 = *(_QWORD *)(v3 + 16);
      if (v12 >= 0)
        v14 = *(unsigned __int8 *)(v3 + 39);
      else
        v14 = *(_QWORD *)(v3 + 24);
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, v13, v14);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" has invalid cache file format", 30);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v32);
    }
    std::vector<unsigned int>::resize((std::vector<unsigned int> *)(v4 + 16), (v33 >> 3) + 1);
    if (*(_QWORD *)(v4 + 24) == *(_QWORD *)(v4 + 16))
      v16 = 0;
    else
      v16 = *(_QWORD *)(v4 + 16);
    v17 = v16 + v33;
    *(_QWORD *)v4 = v16;
    *(_QWORD *)(v4 + 8) = v17;
    v18 = (***(uint64_t (****)(_QWORD))(v3 + 48))(*(_QWORD *)(v3 + 48));
    if (v18 != v33)
    {
      v19 = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
      dmlc::LogMessageFatal::Entry::Init(v19, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/io/cached_input_split.h");
      v20 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v31);
      v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)"Check failed: fi_->Read(p->begin, size) == size", 47);
      v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)": ", 2);
      v25 = *(_QWORD *)(v3 + 16);
      v24 = v3 + 16;
      v23 = v25;
      v26 = *(char *)(v24 + 23);
      if (v26 >= 0)
        v27 = v24;
      else
        v27 = v23;
      if (v26 >= 0)
        v28 = *(unsigned __int8 *)(v24 + 23);
      else
        v28 = *(_QWORD *)(v24 + 8);
      v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, v27, v28);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)" has invalid cache file format", 30);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v31);
    }
  }
  return v7 != 0;
}

void sub_220F5BFE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227667068](v1, 0x10C40512A2CE0);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::target_type()
{
}

void std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1}>,void ()(void)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24E6BF330;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24E6BF330;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 48) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 48), 0);
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1},std::allocator<dmlc::io::CachedInputSplit::InitCachedIter(void)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void dmlc::ThreadedIter<dmlc::io::InputSplitBase::Chunk>::NotImplemented()
{
  std::string *Entry;
  _QWORD *v1;
  char v2;

  Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v2);
  dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/dmlc/src/dmlc/threadediter.h");
  v1 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v2);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)"BeforeFirst is not supported", 28);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v2);
}

void sub_220F5C198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a13);
  _Unwind_Resume(a1);
}

void std::__function::__func<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24E6BF3B0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24E6BF3B0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::operator()(uint64_t a1, uint64_t **a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  std::vector<unsigned int>::size_type v5;
  uint64_t v6;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  v4 = **a2;
  if (!v4)
  {
    v4 = operator new();
    v5 = *(_QWORD *)(v2 + 8) + 1;
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    std::vector<unsigned int>::vector((std::vector<unsigned int> *)(v4 + 16), v5);
    *v3 = v4;
  }
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(v2 + 56) + 96))(*(_QWORD *)(v2 + 56), v4);
  if ((_DWORD)v6)
  {
    v8 = *(_QWORD *)(v4 + 8) - *(_QWORD *)v4;
    (*(void (**)(_QWORD, uint64_t *, uint64_t))(**(_QWORD **)(v2 + 40) + 8))(*(_QWORD *)(v2 + 40), &v8, 8);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)(v2 + 40) + 8))(*(_QWORD *)(v2 + 40), *(_QWORD *)v4, v8);
  }
  return v6;
}

void sub_220F5C2E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x227667068](v1, 0x10C40512A2CE0);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1},std::allocator<dmlc::io::CachedInputSplit::InitPreprocIter(void)::{lambda(dmlc::io::InputSplitBase::Chunk **)#1}>,BOOL ()(dmlc::io::InputSplitBase::Chunk **)>::target_type()
{
}

void std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::~__func()
{
  JUMPOUT(0x227667068);
}

_QWORD *std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24E6BF430;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24E6BF430;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<void (*)(void),std::allocator<void (*)(void)>,void ()(void)>::target_type()
{
}

void sub_220F5C4DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 39) < 0)
    operator delete(*(void **)(v1 + 16));
  _Unwind_Resume(exception_object);
}

uint64_t dmlc::Registry<xgboost::ObjFunctionReg>::~Registry(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void **v11;

  v3 = *(_QWORD **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 != *(_QWORD *)a1)
  {
    v4 = 0;
    while (1)
    {
      v5 = v3[v4];
      if (v5)
        break;
LABEL_16:
      if (++v4 >= (unint64_t)((v2 - (uint64_t)v3) >> 3))
        goto LABEL_17;
    }
    if (*(char *)(v5 + 127) < 0)
      operator delete(*(void **)(v5 + 104));
    v6 = *(_QWORD **)(v5 + 96);
    if (v6 == (_QWORD *)(v5 + 72))
    {
      v6 = (_QWORD *)(v5 + 72);
      v7 = 4;
    }
    else
    {
      if (!v6)
      {
LABEL_11:
        v11 = (void **)(v5 + 48);
        std::vector<dmlc::ParamFieldInfo>::__destroy_vector::operator()[abi:ne180100](&v11);
        if (*(char *)(v5 + 47) < 0)
          operator delete(*(void **)(v5 + 24));
        if (*(char *)(v5 + 23) < 0)
          operator delete(*(void **)v5);
        MEMORY[0x227667068](v5, 0x1032C40EA5FD255);
        v3 = *(_QWORD **)a1;
        v2 = *(_QWORD *)(a1 + 8);
        goto LABEL_16;
      }
      v7 = 5;
    }
    (*(void (**)(void))(*v6 + 8 * v7))();
    goto LABEL_11;
  }
LABEL_17:
  std::mutex::~mutex((std::mutex *)(a1 + 72));
  std::__tree<std::__value_type<std::string,dmlc::ParserFactoryReg<unsigned int,float> *>,std::__map_value_compare<std::string,std::__value_type<std::string,dmlc::ParserFactoryReg<unsigned int,float> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dmlc::ParserFactoryReg<unsigned int,float> *>>>::destroy(*(char **)(a1 + 56));
  v8 = *(void **)(a1 + 24);
  if (v8)
  {
    *(_QWORD *)(a1 + 32) = v8;
    operator delete(v8);
  }
  v9 = *(_QWORD **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v9;
    operator delete(v9);
  }
  return a1;
}

uint64_t xgboost::ObjFunction::Create(const void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  _BOOL4 v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD *v11;
  uint64_t **v12;
  uint64_t **v13;
  std::string *Entry;
  _QWORD *v15;
  _QWORD *v16;
  int v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *__p[2];
  unsigned __int8 v32;
  char v33;
  _QWORD v34[3];
  _QWORD v35[10];
  char v36;
  uint64_t v37;

  dmlc::Registry<xgboost::ObjFunctionReg>::Get();
  dmlc::Registry<xgboost::ObjFunctionReg>::Get();
  v4 = qword_253F37180;
  if (!qword_253F37180)
    goto LABEL_11;
  v5 = &qword_253F37180;
  do
  {
    v6 = std::less<std::string>::operator()[abi:ne180100]((uint64_t)&qword_253F37188, (const void **)(v4 + 32), a1);
    v7 = (uint64_t *)(v4 + 8);
    if (!v6)
    {
      v7 = (uint64_t *)v4;
      v5 = (uint64_t *)v4;
    }
    v4 = *v7;
  }
  while (*v7);
  if (v5 == &qword_253F37180
    || std::less<std::string>::operator()[abi:ne180100]((uint64_t)&qword_253F37188, a1, (const void **)v5 + 4)
    || (v8 = v5[7]) == 0)
  {
LABEL_11:
    v11 = v34;
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v34);
    dmlc::Registry<xgboost::ObjFunctionReg>::Get();
    v12 = (uint64_t **)qword_253F37160;
    v13 = (uint64_t **)xmmword_253F37168;
    if (qword_253F37160 != (_QWORD)xmmword_253F37168)
      goto LABEL_29;
    while (1)
    {
      Entry = (std::string *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v33);
      dmlc::LogMessageFatal::Entry::Init(Entry, "/Library/Caches/com.apple.xbs/Sources/CoreML/xgboost/src/objective/objective.cc");
      v15 = (_QWORD *)dmlc::LogMessageFatal::GetEntry((dmlc::LogMessageFatal *)&v33);
      v17 = *((char *)a1 + 23);
      if (v17 >= 0)
        v18 = a1;
      else
        v18 = (void *)*a1;
      if (v17 >= 0)
        v19 = *((unsigned __int8 *)a1 + 23);
      else
        v19 = (uint64_t)a1[1];
      v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v18, v19);
      a1 = (const void **)v35;
      std::stringbuf::str();
      if ((v32 & 0x80u) == 0)
        v22 = __p;
      else
        v22 = (void **)__p[0];
      if ((v32 & 0x80u) == 0)
        v23 = v32;
      else
        v23 = (uint64_t)__p[1];
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)v22, v23);
      if ((char)v32 < 0)
        operator delete(__p[0]);
      dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&v33);
      v11 = (_QWORD *)MEMORY[0x24BEDB7F0];
      v34[0] = *MEMORY[0x24BEDB7F0];
      v24 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
      *(_QWORD *)((char *)v34 + *(_QWORD *)(v34[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
      v34[2] = v24;
      v35[0] = MEMORY[0x24BEDB848] + 16;
      if (v36 < 0)
        operator delete((void *)v35[8]);
      std::streambuf::~streambuf();
      std::iostream::~basic_iostream();
      MEMORY[0x227666FE4](&v37);
      __break(1u);
LABEL_29:
      v25 = v11 + 2;
      do
      {
        v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"Objective candidate: ", 21);
        v27 = *((char *)*v12 + 23);
        if (v27 >= 0)
          v28 = (uint64_t)*v12;
        else
          v28 = **v12;
        if (v27 >= 0)
          v29 = *((unsigned __int8 *)*v12 + 23);
        else
          v29 = (*v12)[1];
        v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v28, v29);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)"\n", 1);
        ++v12;
      }
      while (v12 != v13);
    }
  }
  v9 = *(_QWORD *)(v8 + 96);
  if (!v9)
    std::__throw_bad_function_call[abi:ne180100]();
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 48))(v9);
  *(_QWORD *)(result + 8) = a2;
  return result;
}

void sub_220F5C888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, char a20)
{
  if (a15 < 0)
    operator delete(__p);
  dmlc::LogMessageFatal::~LogMessageFatal((dmlc::LogMessageFatal *)&a19);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void xgboost::GlobalConfiguration::__DECLARE__(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  std::string __p;
  std::string __str;

  std::string::basic_string[abi:ne180100]<0>(&__p, "verbosity");
  v3 = operator new();
  *(_BYTE *)(v3 + 8) = 0;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_WORD *)(v3 + 108) = 0;
  *(_QWORD *)v3 = &unk_24E6B5E08;
  *(_BYTE *)(v3 + 120) = 0;
  *(_QWORD *)(v3 + 136) = 0;
  *(_QWORD *)(v3 + 128) = v3 + 136;
  *(_QWORD *)(v3 + 160) = 0;
  *(_QWORD *)(v3 + 144) = 0;
  *(_QWORD *)(v3 + 152) = v3 + 160;
  *(_QWORD *)(v3 + 168) = 0;
  std::string::operator=((std::string *)(v3 + 24), &__p);
  if (*(char *)(v3 + 71) < 0)
  {
    if (*(_QWORD *)(v3 + 56))
      goto LABEL_8;
  }
  else if (*(_BYTE *)(v3 + 71))
  {
    goto LABEL_8;
  }
  std::string::basic_string[abi:ne180100]<0>(&__str, "int");
  v4 = (void **)(v3 + 48);
  if (*(char *)(v3 + 71) < 0)
    operator delete(*v4);
  *(_OWORD *)v4 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
  *(_QWORD *)(v3 + 64) = *((_QWORD *)&__str.__r_.__value_.__l + 2);
LABEL_8:
  *(_QWORD *)(v3 + 96) = 4;
  dmlc::parameter::ParamManager::AddEntry(a2, (const void **)&__p.__r_.__value_.__l.__data_, v3);
  v5 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v3 + 72))(v3, 0, 3);
  *(_DWORD *)(v5 + 104) = 1;
  *(_BYTE *)(v5 + 8) = 1;
  std::string::basic_string[abi:ne180100]<0>(&__str, "Flag to print out detailed breakdown of runtime.");
  std::string::operator=((std::string *)(v5 + 72), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::string::basic_string[abi:ne180100]<0>(&__p, "use_rmm");
  v6 = operator new();
  *(_OWORD *)(v6 + 80) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)v6 = 0u;
  *(_QWORD *)v6 = &unk_24E6BBA60;
  std::string::operator=((std::string *)(v6 + 24), &__p);
  if (*(char *)(v6 + 71) < 0)
  {
    if (*(_QWORD *)(v6 + 56))
      goto LABEL_19;
  }
  else if (*(_BYTE *)(v6 + 71))
  {
    goto LABEL_19;
  }
  std::string::basic_string[abi:ne180100]<0>(&__str, "BOOLean");
  v7 = (void **)(v6 + 48);
  if (*(char *)(v6 + 71) < 0)
    operator delete(*v7);
  *(_OWORD *)v7 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
  *(_QWORD *)(v6 + 64) = *((_QWORD *)&__str.__r_.__value_.__l + 2);
LABEL_19:
  *(_QWORD *)(v6 + 96) = 8;
  dmlc::parameter::ParamManager::AddEntry(a2, (const void **)&__p.__r_.__value_.__l.__data_, v6);
  *(_BYTE *)(v6 + 104) = 0;
  *(_BYTE *)(v6 + 8) = 1;
  std::string::basic_string[abi:ne180100]<0>(&__str, "Whether to use RAPIDS Memory Manager to allocate GPU memory in XGBoost");
  std::string::operator=((std::string *)(v6 + 72), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_220F5CB54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void xgboost::tree::QuantileHistMaker::Builder<double>::InitRoot(_QWORD *a1@<X0>, float32x2_t **a4@<X3>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a5@<X8>)
{
  __ZN7xgboost4tree17QuantileHistMaker7BuilderIdE8InitRootEPNS_7DMatrixEPNS_7RegTreeERKNSt3__16vectorINS_6detail20GradientPairInternalIfEENS8_9allocatorISC_EEEE(a1, a2, a3, a4, a5);
}

void xgboost::tree::QuantileHistMaker::Builder<float>::InitRoot(_QWORD *a1@<X0>, float32x2_t **a4@<X3>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a5@<X8>)
{
  __ZN7xgboost4tree17QuantileHistMaker7BuilderIfE8InitRootEPNS_7DMatrixEPNS_7RegTreeERKNSt3__16vectorINS_6detail20GradientPairInternalIfEENS8_9allocatorISC_EEEE(a1, a2, a3, a4, a5);
}

void xgboost::common::SketchContainerImpl<xgboost::common::WQuantileSketch<float,float>>::LoadBalance(std::vector<unsigned int> *a4@<X8>, uint64_t a1@<X0>, unsigned int a2@<W1>, unint64_t a3@<X2>)
{
  __ZN7xgboost6common19SketchContainerImplINS0_15WQuantileSketchIffEEE11LoadBalanceERKNS_10SparsePageEjm(a1, a2, a3, a4);
}

void xgboost::common::SketchContainerImpl<xgboost::common::WQuantileSketch<float,float>>::CalcColumnSize(uint64_t **a1@<X0>, uint64_t *a4@<X8>, unsigned int a2@<W1>, unint64_t a3@<X2>)
{
  __ZN7xgboost6common19SketchContainerImplINS0_15WQuantileSketchIffEEE14CalcColumnSizeERKNS_10SparsePageEjm(a1, a2, a3, a4);
}

void xgboost::common::SketchContainerImpl<xgboost::common::WXQuantileSketch<float,float>>::LoadBalance(std::vector<unsigned int> *a4@<X8>, uint64_t a1@<X0>, unsigned int a2@<W1>, unint64_t a3@<X2>)
{
  __ZN7xgboost6common19SketchContainerImplINS0_16WXQuantileSketchIffEEE11LoadBalanceERKNS_10SparsePageEjm(a1, a2, a3, a4);
}

void xgboost::common::SketchContainerImpl<xgboost::common::WXQuantileSketch<float,float>>::CalcColumnSize(uint64_t **a1@<X0>, uint64_t *a4@<X8>, unsigned int a2@<W1>, unint64_t a3@<X2>)
{
  __ZN7xgboost6common19SketchContainerImplINS0_16WXQuantileSketchIffEEE14CalcColumnSizeERKNS_10SparsePageEjm(a1, a2, a3, a4);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x24BEDA978](this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B8](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
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
  return (std::logic_error *)MEMORY[0x24BEDAA90](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::exception_ptr *__cdecl std::exception_ptr::operator=(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB28](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB50](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
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

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x24BEDAC10](this, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return (std::string::iterator)MEMORY[0x24BEDAC78](this, __pos.__i_, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDACA0](this, __pos, __n1, __s);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x24BEDACA8](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAD08](this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
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

uint64_t std::istream::get()
{
  return MEMORY[0x24BEDAE08]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x24BEDAE10]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
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

uint64_t std::istream::getline()
{
  return MEMORY[0x24BEDAE58]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE88]();
}

{
  return MEMORY[0x24BEDAE90]();
}

{
  return MEMORY[0x24BEDAE98]();
}

{
  return MEMORY[0x24BEDAEA8]();
}

{
  return MEMORY[0x24BEDAEC0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
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
  return MEMORY[0x24BEDAF18]();
}

{
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF58]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF78]();
}

{
  return MEMORY[0x24BEDAF80]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x24BEDB038](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
  MEMORY[0x24BEDB040](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

void std::__assoc_sub_state::wait(std::__assoc_sub_state *this)
{
  MEMORY[0x24BEDB0D8](this);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
  MEMORY[0x24BEDB100](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB110](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
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

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x24BEDB198]();
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

BOOL std::mutex::try_lock(std::mutex *this)
{
  return MEMORY[0x24BEDB378](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return MEMORY[0x24BEDB3B0]();
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x24BEDB3B8]();
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x24BEDB3C0]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
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

void std::thread::join(std::thread *this)
{
  MEMORY[0x24BEDB468](this);
}

void std::thread::detach(std::thread *this)
{
  MEMORY[0x24BEDB470](this);
}

void std::thread::~thread(std::thread *this)
{
  MEMORY[0x24BEDB478](this);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x24BEDB660](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24E6B4640(__p);
}

uint64_t operator delete()
{
  return off_24E6B4648();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E6B4650(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24E6B4658(__sz, a2);
}

uint64_t operator new()
{
  return off_24E6B4660();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x24BEDB920](lpmangled, lpout, lpoutlen, lpstatus);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _tlv_atexit(void (__cdecl *termFunc)(void *), void *objAddr)
{
  MEMORY[0x24BDACF10](termFunc, objAddr);
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x24BDAD268](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
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

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

long double erf(long double __x)
{
  long double result;

  MEMORY[0x24BDAE1A8](__x);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x24BDAE650](a1, a2);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

float lgammaf(float a1)
{
  float result;

  MEMORY[0x24BDAEA60](a1);
  return result;
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float log1pf(float a1)
{
  float result;

  MEMORY[0x24BDAEAC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

double nan(const char *a1)
{
  double result;

  MEMORY[0x24BDAEFF8](a1);
  return result;
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x24BDAF5D8](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

float strtof(const char *a1, char **a2)
{
  float result;

  MEMORY[0x24BDAFFE0](a1, a2);
  return result;
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

