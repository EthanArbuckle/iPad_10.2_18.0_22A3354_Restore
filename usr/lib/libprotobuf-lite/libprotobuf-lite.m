uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v1;

  v1 = *((_DWORD *)this + 10);
  if (v1 == 0x7FFFFFFF)
    return 0xFFFFFFFFLL;
  else
    return (v1
                        - *((_DWORD *)this + 6)
                        + *((_DWORD *)this + 11)
                        + *((_DWORD *)this + 4)
                        - *((_DWORD *)this + 2));
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32));
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(uint64_t this, int a2)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  BOOL v6;
  int v7;

  *(_DWORD *)(this + 40) = a2;
  v2 = *(_DWORD *)(this + 48);
  v3 = *(_QWORD *)(this + 16) + *(int *)(this + 44);
  *(_QWORD *)(this + 16) = v3;
  if (v2 >= a2)
    v4 = a2;
  else
    v4 = v2;
  v5 = *(_DWORD *)(this + 24);
  v6 = __OFSUB__(v5, v4);
  v7 = v5 - v4;
  if ((v7 < 0) ^ v6 | (v7 == 0))
    v7 = 0;
  else
    *(_QWORD *)(this + 16) = v3 - v7;
  *(_DWORD *)(this + 44) = v7;
  *(_BYTE *)(this + 36) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  return *((_QWORD *)this + 3) - *((int *)this + 12);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  int v11;

  v2 = *((_DWORD *)this + 6);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned int *)this + 10);
  v5 = *((int *)this + 11);
  v6 = v2 - v5 + *((_DWORD *)this + 2) - v3;
  v7 = (v6 ^ 0x7FFFFFFF) < a2 || a2 < 0;
  v8 = v6 + a2;
  if (v7)
    v8 = 0x7FFFFFFF;
  if ((int)v4 < v8)
    v8 = *((_DWORD *)this + 10);
  *((_DWORD *)this + 10) = v8;
  v9 = v3 + v5;
  *((_QWORD *)this + 2) = v9;
  if (*((_DWORD *)this + 12) < v8)
    v8 = *((_DWORD *)this + 12);
  v10 = __OFSUB__(v2, v8);
  v11 = v2 - v8;
  if ((v11 < 0) ^ v10 | (v11 == 0))
    v11 = 0;
  else
    *((_QWORD *)this + 2) = v9 - v11;
  *((_DWORD *)this + 11) = v11;
  return v4;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString(uint64_t a1, std::string *this, std::string::size_type __n)
{
  unsigned int v3;
  std::string *v4;

  if ((__n & 0x80000000) != 0)
    return 0;
  v3 = __n;
  v4 = this;
  if (*(_DWORD *)(a1 + 16) - *(_DWORD *)(a1 + 8) < (int)__n)
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, this, __n);
  std::string::resize(this, __n, 0);
  if (v3)
  {
    if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
    {
      if (!v4->__r_.__value_.__l.__size_)
      {
LABEL_11:
        v4 = 0;
        goto LABEL_12;
      }
      v4 = (std::string *)v4->__r_.__value_.__r.__words[0];
    }
    else if (!*((_BYTE *)&v4->__r_.__value_.__s + 23))
    {
      goto LABEL_11;
    }
LABEL_12:
    memcpy(v4, *(const void **)(a1 + 8), v3);
    *(_QWORD *)(a1 + 8) += v3;
  }
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  uint64_t v3;
  _BYTE v5[32];

  wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5, a2);
  v3 = wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  return v3;
}

void sub_208FE4110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2)
{
  uint64_t v4;
  wireless_diagnostics::google::protobuf::_anonymous_namespace_ *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v11;

  v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 72))(this);
  v5 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)v4;
  v6 = *((_DWORD *)a2 + 4);
  v7 = v6 - v4;
  if (v6 < (int)v4)
  {
LABEL_6:
    v9 = *((_DWORD *)a2 + 5);
    (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedOutputStream *))(*(_QWORD *)this + 80))(this, a2);
    if (*((_BYTE *)a2 + 24))
      return 0;
    LODWORD(a2) = *((_DWORD *)a2 + 5) - *((_DWORD *)a2 + 4) + v6 - v9;
    if ((_DWORD)a2 != (_DWORD)v5)
      goto LABEL_9;
    return 1;
  }
  v8 = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v8 + (int)v4;
  *((_DWORD *)a2 + 4) = v7;
  if (!v8)
  {
    v6 = v7;
    goto LABEL_6;
  }
  a2 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, uint64_t))(*(_QWORD *)this + 88))(this, v8)- v8);
  if (a2 != (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(int)v5)
  {
LABEL_9:
    v11 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 72))(this);
  }
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, signed int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  if (a2 < 0)
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
  else
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2, int a3)
{
  wireless_diagnostics::google::protobuf::_anonymous_namespace_ *v6;
  uint64_t v7;
  int v8;

  v6 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)(*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 72))(this);
  if ((int)v6 <= a3)
  {
    v7 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, void *))(*(_QWORD *)this
                                                                                                  + 88))(this, a2)- (_QWORD)a2;
    if (v7 != (int)v6)
    {
      v8 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 72))(this);
    }
  }
  return (int)v6 <= a3;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *v2;

  *(_QWORD *)this = &off_24C0ED208;
  v2 = (wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v2);
  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8));
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  uint64_t result;

  if (*((_BYTE *)this + 17))
    return 0;
  if (!*((_DWORD *)this + 11))
    return 1;
  if ((*(unsigned int (**)(_QWORD, _QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), *((_QWORD *)this + 4)))
  {
    *((_QWORD *)this + 3) += *((int *)this + 11);
    *((_DWORD *)this + 11) = 0;
    return 1;
  }
  *((_BYTE *)this + 17) = 1;
  *((_DWORD *)this + 11) = 0;
  result = *((_QWORD *)this + 4);
  if (result)
  {
    MEMORY[0x20BD0BE60](result, 0x1000C8077774924);
    result = 0;
    *((_QWORD *)this + 4) = 0;
  }
  return result;
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_24C0ED510;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
  if (*((_BYTE *)this + 16))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  v3 = *((_QWORD *)this + 4);
  if (v3)
    MEMORY[0x20BD0BE60](v3, 0x1000C8077774924);
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(this);
  JUMPOUT(0x20BD0BE78);
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  std::string *v2;
  char *v3;
  std::string *v4;
  char v5;
  std::string v6[2];

  *(_QWORD *)this = &off_24C0ED1E0;
  if (*((_BYTE *)this + 12)
    && !wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(this))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 216);
    v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
    v3 = strerror(*((_DWORD *)this + 4));
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, v3);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(this);
  JUMPOUT(0x20BD0BE78);
}

BOOL wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Write(wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this, char *a2, int a3)
{
  std::string *v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int *v11;
  _BOOL8 result;
  char v13;
  std::string v14[2];

  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 238);
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }
  if (a3 < 1)
    return 1;
  v7 = 0;
  do
  {
    while (1)
    {
      v8 = write(*((_DWORD *)this + 2), &a2[v7], a3 - v7);
      v9 = v8;
      if (v8 < 0)
        break;
      result = v8 != 0;
      v7 += v9;
      if (v9)
        v10 = v7 < a3;
      else
        v10 = 0;
      if (!v10)
        return result;
    }
  }
  while (*__error() == 4);
  v11 = __error();
  result = 0;
  *((_DWORD *)this + 4) = *v11;
  return result;
}

void sub_208FE4634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64(uint64_t this, unint64_t a2)
{
  _BYTE *v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  char __src[10];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(int *)(this + 16) >= 10)
  {
    v2 = *(_BYTE **)(this + 8);
    v3 = a2 >> 28;
    if (HIBYTE(a2))
    {
      if (HIBYTE(a2) >= 0x80)
      {
        v2[9] = -127;
        v4 = 10;
      }
      else
      {
        v4 = 9;
      }
      v2[8] = HIBYTE(a2) | 0x80;
    }
    else
    {
      if (!(_DWORD)v3)
      {
        if (!(a2 >> 14))
        {
          if (a2 < 0x80)
          {
            v4 = 1;
            goto LABEL_24;
          }
          v4 = 2;
LABEL_23:
          v2[1] = (a2 >> 7) | 0x80;
LABEL_24:
          *v2 = a2 | 0x80;
          v2[v4 - 1] &= ~0x80u;
          *(_QWORD *)(this + 8) += v4;
          *(_DWORD *)(this + 16) -= v4;
          return this;
        }
        if (a2 < 0x200000)
        {
          v4 = 3;
          goto LABEL_22;
        }
        v4 = 4;
LABEL_21:
        v2[3] = (a2 >> 21) | 0x80;
LABEL_22:
        v2[2] = (a2 >> 14) | 0x80;
        goto LABEL_23;
      }
      if (!(v3 >> 14))
      {
        if (v3 < 0x80)
        {
          v4 = 5;
LABEL_20:
          v2[4] = v3 | 0x80;
          goto LABEL_21;
        }
        v4 = 6;
LABEL_19:
        v2[5] = (a2 >> 35) | 0x80;
        goto LABEL_20;
      }
      if (v3 < 0x200000)
      {
        v4 = 7;
        goto LABEL_18;
      }
      v4 = 8;
    }
    v2[7] = (a2 >> 49) | 0x80;
LABEL_18:
    v2[6] = (a2 >> 42) | 0x80;
    goto LABEL_19;
  }
  if (a2 < 0x80)
  {
    LODWORD(v5) = 0;
  }
  else
  {
    v5 = 0;
    do
    {
      __src[v5++] = a2 | 0x80;
      v6 = a2 >> 14;
      a2 >>= 7;
    }
    while (v6);
  }
  __src[v5] = a2;
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, __src, (int)v5 + 1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString(uint64_t a1, uint64_t a2)
{
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
  wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(a1, (std::string *)a2);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(uint64_t a1, std::string *a2)
{
  std::string *v2;
  std::string::size_type size;
  wireless_diagnostics::google::protobuf::_anonymous_namespace_ *v5;
  uint64_t v6;
  int v7;

  v2 = a2;
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    size = a2->__r_.__value_.__l.__size_;
  else
    LODWORD(size) = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  v5 = (wireless_diagnostics::google::protobuf::_anonymous_namespace_ *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
  std::string::resize(v2, (int)v5 + (int)size, 0);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
  {
    if (v2->__r_.__value_.__l.__size_)
    {
      v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
      goto LABEL_10;
    }
  }
  else if (*((_BYTE *)&v2->__r_.__value_.__s + 23))
  {
    goto LABEL_10;
  }
  v2 = 0;
LABEL_10:
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 88))(a1, (uint64_t)v2 + (int)size)
     - ((_QWORD)v2
      + (int)size);
  if (v6 != (int)v5)
  {
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
  }
  return 1;
}

unsigned __int8 *wireless_diagnostics::google::protobuf::MessageLite::SerializeWithCachedSizesToArray(wireless_diagnostics::google::protobuf::MessageLite *this, unsigned __int8 *a2)
{
  int v4;
  std::string *v5;
  char v7;
  std::string v8[2];
  _BYTE v9[32];
  _BYTE v10[32];

  v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 96))(this);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream((uint64_t)v10, a2, v4, -1);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v9, (wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *)v10);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *, _BYTE *))(*(_QWORD *)this + 80))(this, v9);
  if (v9[24])
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 225);
    v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: !coded_out.HadError(): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v7, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v9);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream((wireless_diagnostics::google::protobuf::io::ArrayOutputStream *)v10);
  return &a2[v4];
}

void sub_208FE49E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  void *v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v5 = va_arg(va1, void *);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)va1);
  wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream((wireless_diagnostics::google::protobuf::io::ArrayOutputStream *)(v3 - 64));
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  if (*((int *)this + 4) >= 1)
    (*(void (**)(void))(**(_QWORD **)this + 24))();
}

wireless_diagnostics::google::protobuf::io::CodedOutputStream *wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = a2;
  *((_BYTE *)this + 24) = 0;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
  *((_BYTE *)this + 24) = 0;
  return this;
}

{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = a2;
  *((_BYTE *)this + 24) = 0;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
  *((_BYTE *)this + 24) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v4 = 0;
  result = (*(uint64_t (**)(_QWORD, uint64_t *, char *))(**(_QWORD **)this + 16))(*(_QWORD *)this, &v4, (char *)this + 16);
  if ((_DWORD)result)
  {
    v3 = v4;
    *((_DWORD *)this + 5) += *((_DWORD *)this + 4);
  }
  else
  {
    v3 = 0;
    *((_DWORD *)this + 4) = 0;
    *((_BYTE *)this + 24) = 1;
  }
  *((_QWORD *)this + 1) = v3;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayOutputStream::Next(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this, void **a2, int *a3)
{
  uint64_t v3;
  int v4;
  int v5;

  v3 = *((int *)this + 6);
  v4 = *((_DWORD *)this + 4);
  if ((int)v3 >= v4)
  {
    *((_DWORD *)this + 7) = 0;
  }
  else
  {
    v5 = v4 - v3;
    if (v4 - (int)v3 >= *((_DWORD *)this + 5))
      v5 = *((_DWORD *)this + 5);
    *((_DWORD *)this + 7) = v5;
    *a2 = (void *)(*((_QWORD *)this + 1) + v3);
    *a3 = v5;
    *((_DWORD *)this + 6) += *((_DWORD *)this + 7);
  }
  return (int)v3 < v4;
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream(uint64_t this, void *a2, int a3, int a4)
{
  int v4;

  *(_QWORD *)this = &off_24C0ED240;
  *(_QWORD *)(this + 8) = a2;
  if (a4 <= 0)
    v4 = a3;
  else
    v4 = a4;
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

{
  int v4;

  *(_QWORD *)this = &off_24C0ED240;
  *(_QWORD *)(this + 8) = a2;
  if (a4 <= 0)
    v4 = a3;
  else
    v4 = a4;
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::BackUp(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this, int a2)
{
  std::string *v4;
  int v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  std::string *v9;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 346);
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v5 = *((_DWORD *)this + 11);
  if (v5 != *((_DWORD *)this + 10))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 347);
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (buffer_used_) == (buffer_size_): ");
    v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, " BackUp() can only be called after Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v5 = *((_DWORD *)this + 11);
  }
  if (v5 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 349);
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, " Can't back up over more bytes than were returned by the last call to Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v5 = *((_DWORD *)this + 11);
  }
  *((_DWORD *)this + 11) = v5 - a2;
}

void sub_208FE4C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this, void **a2, int *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;

  if (*((_DWORD *)this + 11) != *((_DWORD *)this + 10)
    || (result = wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this),
        (_DWORD)result))
  {
    wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
    v7 = *((_DWORD *)this + 10);
    v8 = *((int *)this + 11);
    *a2 = (void *)(*((_QWORD *)this + 4) + v8);
    *a3 = v7 - v8;
    *((_DWORD *)this + 11) = *((_DWORD *)this + 10);
    return 1;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::AllocateBufferIfNeeded(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;

  if (!*(_QWORD *)(this + 32))
  {
    v1 = this;
    v2 = operator new[]();
    this = *(_QWORD *)(v1 + 32);
    if (this != v2)
    {
      if (this)
        this = MEMORY[0x20BD0BE60](this, 0x1000C8077774924);
      *(_QWORD *)(v1 + 32) = v2;
    }
  }
  return this;
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2)
{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::BackUp((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32), a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Next(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32), a2, a3);
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  unsigned int *v3;
  _BOOL8 result;
  char __dst[4];

  v3 = (unsigned int *)*((_QWORD *)this + 1);
  if (((*((_DWORD *)this + 4) - (_DWORD)v3) & 0xFFFFFFFC) != 0)
  {
    *((_QWORD *)this + 1) = v3 + 1;
  }
  else
  {
    v3 = (unsigned int *)__dst;
    result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, __dst, 4);
    if (!result)
      return result;
  }
  *a2 = *v3;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes(int a1, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  int v5;
  std::string *v6;
  unsigned int v7;
  int v8;
  char *v9;
  int v10;
  char v12;
  std::string v13[2];

  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, (8 * a1) | 2);
  v5 = *(char *)(a2 + 23);
  if (v5 < 0 && *(_QWORD *)(a2 + 8) >> 31)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/wire_format_lite.cc", 292);
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: value.size() <= kint32max: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    LOBYTE(v5) = *(_BYTE *)(a2 + 23);
  }
  if ((v5 & 0x80u) == 0)
    v7 = v5;
  else
    v7 = *(_DWORD *)(a2 + 8);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, v7);
  v8 = *(char *)(a2 + 23);
  if (v8 >= 0)
    v9 = (char *)a2;
  else
    v9 = *(char **)a2;
  if (v8 >= 0)
    v10 = *(unsigned __int8 *)(a2 + 23);
  else
    v10 = *(_DWORD *)(a2 + 8);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(this, v9, v10);
}

void sub_208FE4EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, void *__dst, unsigned __int8 *a4)
{
  int v5;

  v5 = (int)a2;
  memcpy(__dst, this, (int)a2);
  return (uint64_t)__dst + v5;
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream(this);
  JUMPOUT(0x20BD0BE78);
}

{
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *v2;

  *(_QWORD *)this = &off_24C0ED160;
  v2 = (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8);
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32));
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_24C0ED4D0;
  if (*((_BYTE *)this + 16))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  v3 = *((_QWORD *)this + 4);
  if (v3)
    MEMORY[0x20BD0BE60](v3, 0x1000C8077774924);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(this);
  JUMPOUT(0x20BD0BE78);
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  std::string *v2;
  char *v3;
  std::string *v4;
  char v5;
  std::string v6[2];

  *(_QWORD *)this = &off_24C0ED130;
  if (*((_BYTE *)this + 12)
    && !wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(this))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 118);
    v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
    v3 = strerror(*((_DWORD *)this + 4));
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, v3);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(this);
  JUMPOUT(0x20BD0BE78);
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromString(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t *v4;
  _BOOL8 v5;
  std::string *v6;
  _QWORD v8[3];
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  std::string __p;
  std::string v19[2];

  LODWORD(v3) = *((unsigned __int8 *)a2 + 23);
  if ((v3 & 0x80u) == 0)
    v4 = a2;
  else
    v4 = (uint64_t *)*a2;
  if ((v3 & 0x80u) != 0)
    v3 = a2[1];
  v8[0] = 0;
  v8[1] = v4;
  v8[2] = (char *)v4 + (int)v3;
  v9 = v3;
  v10 = 0;
  v11 = 0;
  v12 = v3;
  v13 = xmmword_208FF2EC0;
  v14 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v15 = 0;
  v16 = 0;
  (*(void (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(_QWORD *)a1 + 32))(a1);
  if (!(*(unsigned int (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *, _QWORD *))(*(_QWORD *)a1 + 64))(a1, v8))goto LABEL_12;
  if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(_QWORD *)a1 + 40))(a1) & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v19, (const std::string::value_type *)&__p);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v17, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (_BYTE)v11 != 0;
LABEL_13:
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v8);
  return v5;
}

void sub_208FE51C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  if (a25 < 0)
    operator delete(__p);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)(v25 - 64));
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::IsInitialized(wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  wireless_diagnostics::google::protobuf::internal::ExtensionSet **v1;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet *v7;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet **v8;
  BOOL v9;

  v1 = this + 1;
  v2 = *this;
  if (*this == (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(this + 1))
    return 1;
  while (1)
  {
    if (wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)v2
                                                                                                  + 48)] != 10)
      goto LABEL_14;
    if (*((_BYTE *)v2 + 49))
      break;
    if ((*((_BYTE *)v2 + 50) & 1) == 0)
    {
      v5 = **((_QWORD **)v2 + 5);
      if ((*((_BYTE *)v2 + 50) & 0x10) != 0)
      {
        if (((*(uint64_t (**)(void))(v5 + 56))() & 1) == 0)
          return 0;
      }
      else
      {
        result = (*(uint64_t (**)(void))(v5 + 40))();
        if (!(_DWORD)result)
          return result;
      }
    }
LABEL_14:
    v7 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((_QWORD *)v2 + 1);
    if (v7)
    {
      do
      {
        v8 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v7;
        v7 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        v8 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((_QWORD *)v2 + 2);
        v9 = *v8 == v2;
        v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v8;
      }
      while (!v9);
    }
    v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v8;
    if (v8 == v1)
      return 1;
  }
  v3 = *((_QWORD *)v2 + 5);
  if (*(int *)(v3 + 8) < 1)
    goto LABEL_14;
  v4 = 0;
  while (((*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v3 + 8 * v4) + 40))(*(_QWORD *)(*(_QWORD *)v3 + 8 * v4)) & 1) != 0)
  {
    ++v4;
    v3 = *((_QWORD *)v2 + 5);
    if (v4 >= *(int *)(v3 + 8))
      goto LABEL_14;
  }
  return 0;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2)
{
  unsigned int v3;
  uint64_t v4;
  _QWORD v6[5];
  __int128 v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v6[0] = a2;
  memset(&v6[1], 0, 30);
  v7 = xmmword_208FF2EB0;
  v8 = 0;
  v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v10 = 0;
  v11 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  v3 = wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  if (BYTE4(v6[4]))
    v4 = v3;
  else
    v4 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  return v4;
}

void sub_208FE538C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t result;
  std::string *v5;
  char v6;
  std::string __p;
  std::string v8[2];

  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 32))(this);
  result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(_QWORD *)this + 64))(this, a2);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 40))(this) & 1) != 0)
    {
      return 1;
    }
    else
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
      v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, (const std::string::value_type *)&__p);
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v6, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
      return 0;
    }
  }
  return result;
}

void sub_208FE5460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0)
    operator delete(__p);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, char *a2, int a3)
{
  _BOOL8 v4;
  std::string *v5;
  _QWORD v7[3];
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  std::string __p;
  std::string v18[2];

  v7[0] = 0;
  v7[1] = a2;
  v7[2] = &a2[a3];
  v8 = a3;
  v9 = 0;
  v10 = 0;
  v11 = a3;
  v12 = xmmword_208FF2EC0;
  v13 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v14 = 0;
  v15 = 0;
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 32))(this);
  if (!(*(unsigned int (**)(wireless_diagnostics::google::protobuf::MessageLite *, _QWORD *))(*(_QWORD *)this + 64))(this, v7))
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 40))(this) & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
    v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v18, (const std::string::value_type *)&__p);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v16, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    goto LABEL_7;
  }
  v4 = (_BYTE)v10 != 0;
LABEL_8:
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v7);
  return v4;
}

void sub_208FE559C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  if (a25 < 0)
    operator delete(__p);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)(v25 - 64));
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  std::string *v2;
  std::string *v3;
  char v4;
  std::string v5[2];

  if (*(_QWORD *)this)
    wireless_diagnostics::google::protobuf::io::CodedInputStream::BackUpInputToCurrentPosition(this);
  if (*((_DWORD *)this + 13) == -2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 79);
    v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "The total number of bytes read was ");
    v3 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, *((_DWORD *)this + 6));
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v4, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
}

_DWORD *wireless_diagnostics::google::protobuf::io::CodedInputStream::BackUpInputToCurrentPosition(_DWORD *this)
{
  _DWORD *v1;
  uint64_t v2;
  unsigned int v3;

  if (this[7] + this[11] + this[4] - this[2] >= 1)
  {
    v1 = this;
    this = (_DWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)this + 24))(*(_QWORD *)this);
    v2 = *((_QWORD *)v1 + 1);
    v3 = v1[6] - v1[11] + v2 - v1[4];
    *((_QWORD *)v1 + 2) = v2;
    v1[11] = 0;
    *((_QWORD *)v1 + 3) = v3;
  }
  return this;
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::BackUp(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  std::string *v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  std::string *v9;
  char v10;
  std::string v11[2];

  if (*((_DWORD *)this + 12) || !*((_QWORD *)this + 4))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 257);
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: backup_bytes_ == 0 && buffer_.get() != NULL: ");
    v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v4, " BackUp() can only be called after Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*((_DWORD *)this + 11) < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 259);
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, " Can't back up over more bytes than were returned by the last call to Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 262);
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, " Parameter to BackUp() can't be negative.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 12) = a2;
}

void sub_208FE580C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::BackUp(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2)
{
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::BackUp((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32), a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage(uint64_t result, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

{
  *(_DWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

wireless_diagnostics::google::protobuf::internal::Mutex *wireless_diagnostics::google::protobuf::internal::Mutex::Mutex(wireless_diagnostics::google::protobuf::internal::Mutex *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)operator new();
  *(_QWORD *)this = v2;
  pthread_mutex_init(v2, 0);
  return this;
}

{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)operator new();
  *(_QWORD *)this = v2;
  pthread_mutex_init(v2, 0);
  return this;
}

unint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  char *v2;
  unsigned __int8 *v3;
  unint64_t result;
  int v5;
  BOOL v6;
  unint64_t v7;

  v2 = (char *)*((_QWORD *)this + 1);
  v3 = (unsigned __int8 *)*((_QWORD *)this + 2);
  if (v2 != (char *)v3)
  {
LABEL_4:
    v7 = 0;
    if (v2 >= (char *)v3 || *v2 < 0)
    {
      result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v7);
      if ((_DWORD)result)
        return v7;
    }
    else
    {
      result = *v2;
      *((_QWORD *)this + 1) = v2 + 1;
    }
    return result;
  }
  if (wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this))
  {
    v2 = (char *)*((_QWORD *)this + 1);
    v3 = (unsigned __int8 *)*((_QWORD *)this + 2);
    goto LABEL_4;
  }
  v5 = *((_DWORD *)this + 12);
  result = 0;
  v6 = *((_DWORD *)this + 6) - *((_DWORD *)this + 11) < v5 || *((_DWORD *)this + 10) == v5;
  *((_BYTE *)this + 36) = v6;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString(int a1, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  int v5;
  std::string *v6;
  unsigned int v7;
  int v8;
  char *v9;
  int v10;
  char v12;
  std::string v13[2];

  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, (8 * a1) | 2);
  v5 = *(char *)(a2 + 23);
  if (v5 < 0 && *(_QWORD *)(a2 + 8) >> 31)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/wire_format_lite.cc", 285);
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: value.size() <= kint32max: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    LOBYTE(v5) = *(_BYTE *)(a2 + 23);
  }
  if ((v5 & 0x80u) == 0)
    v7 = v5;
  else
    v7 = *(_DWORD *)(a2 + 8);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)this, v7);
  v8 = *(char *)(a2 + 23);
  if (v8 >= 0)
    v9 = (char *)a2;
  else
    v9 = *(char **)a2;
  if (v8 >= 0)
    v10 = *(unsigned __int8 *)(a2 + 23);
  else
    v10 = *(_DWORD *)(a2 + 8);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(this, v9, v10);
}

void sub_208FE5A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  unsigned int v6;

  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 2);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 96))(a2);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6);
  return (*(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)a2 + 80))(a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(uint64_t this, unsigned int a2)
{
  _BYTE *v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  char __src[5];

  if (*(int *)(this + 16) < 5)
  {
    if (a2 < 0x80)
    {
      LODWORD(v4) = 0;
    }
    else
    {
      v4 = 0;
      do
      {
        __src[v4++] = a2 | 0x80;
        v5 = a2 >> 14;
        a2 >>= 7;
      }
      while (v5);
    }
    __src[v4] = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, __src, (int)v4 + 1);
  }
  else
  {
    v2 = *(_BYTE **)(this + 8);
    *v2 = a2 | 0x80;
    if (a2 < 0x80)
    {
      *v2 = a2 & 0x7F;
      v3 = (_DWORD)v2 + 1;
    }
    else
    {
      v2[1] = (a2 >> 7) | 0x80;
      if (a2 < 0x4000)
      {
        v2[1] = (a2 >> 7) & 0x7F;
        v3 = (_DWORD)v2 + 2;
      }
      else
      {
        v2[2] = (a2 >> 14) | 0x80;
        if (a2 < 0x200000)
        {
          v2[2] = (a2 >> 14) & 0x7F;
          v3 = (_DWORD)v2 + 3;
        }
        else
        {
          v2[3] = (a2 >> 21) | 0x80;
          if (a2 >> 28)
          {
            v2[4] = a2 >> 28;
            v3 = (_DWORD)v2 + 5;
          }
          else
          {
            v3 = (_DWORD)v2 + 4;
            v2[3] = (a2 >> 21) & 0x7F;
          }
        }
      }
    }
    v6 = v3 - (_DWORD)v2;
    *(_QWORD *)(this + 8) += v6;
    *(_DWORD *)(this + 16) -= v6;
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, char *__src, int a3)
{
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t result;

  while (1)
  {
    v6 = *((int *)this + 4);
    v7 = (void *)*((_QWORD *)this + 1);
    if ((int)v6 >= a3)
      break;
    memcpy(v7, __src, v6);
    v8 = *((int *)this + 4);
    a3 -= v8;
    __src += v8;
    result = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    if ((result & 1) == 0)
      return result;
  }
  result = (uint64_t)memcpy(v7, __src, a3);
  *((_QWORD *)this + 1) += a3;
  *((_DWORD *)this + 4) -= a3;
  return result;
}

unint64_t *wireless_diagnostics::google::protobuf::GoogleOnceInitImpl(unint64_t *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  uint64_t v5;

  v2 = *result;
  __dmb(0xBu);
  if (v2 != 2)
  {
    v3 = (uint64_t *)result;
    do
    {
      while (!__ldaxr(result))
      {
        if (!__stlxr(1uLL, result))
        {
          result = (unint64_t *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
          __dmb(0xBu);
          *v3 = 2;
          return result;
        }
      }
      __clrex();
    }
    while (!*result);
    if (*result == 1)
    {
      do
      {
        result = (unint64_t *)sched_yield();
        v5 = *v3;
        __dmb(0xBu);
      }
      while (v5 == 1);
    }
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::FunctionClosure0::Run(uint64_t (**this)(void))
{
  int v2;
  uint64_t result;

  v2 = *((unsigned __int8 *)this + 16);
  result = this[1]();
  if (this)
  {
    if (v2)
      return (*((uint64_t (**)(uint64_t (**)(void)))*this + 1))(this);
  }
  return result;
}

void wireless_diagnostics::google::protobuf::internal::OnShutdown(wireless_diagnostics::google::protobuf::internal *this, void (*a2)(void))
{
  uint64_t v3;
  pthread_mutex_t **v4;
  void **v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];
  char v20;

  v3 = wireless_diagnostics::google::protobuf::internal::shutdown_functions_init;
  __dmb(0xBu);
  if (v3 != 2)
  {
    v19[0] = &off_24C0ED5D0;
    v19[1] = wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions;
    v20 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl((unint64_t *)&wireless_diagnostics::google::protobuf::internal::shutdown_functions_init, (uint64_t)v19);
  }
  v4 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex);
  v5 = (void **)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
  v6 = *(_QWORD **)(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 8);
  v7 = *(_QWORD *)(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 16);
  if ((unint64_t)v6 >= v7)
  {
    v9 = ((uint64_t)v6 - *(_QWORD *)wireless_diagnostics::google::protobuf::internal::shutdown_functions) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<void (*)(void)>::__throw_length_error[abi:ne180100]();
    v10 = v7 - *(_QWORD *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(void)>>(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 16, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = this;
    v8 = v14 + 8;
    v17 = (char *)*v5;
    v16 = (char *)v5[1];
    if (v16 != *v5)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = (char *)*v5;
    }
    *v5 = v14;
    v5[1] = v8;
    v5[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v6 = this;
    v8 = v6 + 1;
  }
  v5[1] = v8;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v4);
}

void sub_208FE5EA4(_Unwind_Exception *a1)
{
  pthread_mutex_t **v1;

  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v1);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(pthread_mutex_t **this)
{
  int v1;
  int v2;
  char *v3;
  int v4;
  const char *v5;
  int v6;
  std::string __p;

  v1 = pthread_mutex_unlock(*this);
  if (v1)
  {
    v2 = v1;
    v4 = 3;
    v5 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    v6 = 312;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, "pthread_mutex_unlock: ");
    v3 = strerror(v2);
    std::string::append(&__p, v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_208FE5F58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::Lock(pthread_mutex_t **this)
{
  int v1;
  int v2;
  char *v3;
  int v4;
  const char *v5;
  int v6;
  std::string __p;

  v1 = pthread_mutex_lock(*this);
  if (v1)
  {
    v2 = v1;
    v4 = 3;
    v5 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    v6 = 305;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, "pthread_mutex_lock: ");
    v3 = strerror(v2);
    std::string::append(&__p, v3);
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_208FE6010(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions(wireless_diagnostics::google::protobuf::internal *this)
{
  _QWORD *v1;
  _QWORD *v2;
  pthread_mutex_t *v3;
  uint64_t result;

  v1 = (_QWORD *)operator new();
  v1[1] = 0;
  v1[2] = 0;
  *v1 = 0;
  wireless_diagnostics::google::protobuf::internal::shutdown_functions = (uint64_t)v1;
  v2 = (_QWORD *)operator new();
  v3 = (pthread_mutex_t *)operator new();
  *v2 = v3;
  result = pthread_mutex_init(v3, 0);
  wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex = (uint64_t)v2;
  return result;
}

void sub_208FE60B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD0BE78](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  unint64_t *v3;
  _BOOL8 result;
  char v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (unint64_t *)*((_QWORD *)this + 1);
  if (((*((_DWORD *)this + 4) - (_DWORD)v3) & 0xFFFFFFF8) != 0)
  {
    *((_QWORD *)this + 1) = v3 + 1;
  }
  else
  {
    v3 = (unint64_t *)v5;
    result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, v5, 8);
    if (!result)
      return result;
  }
  *a2 = *v3;
  return 1;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, char *__dst, int a3)
{
  int v6;
  const void *v7;
  int v8;
  BOOL v9;

  while (1)
  {
    v6 = a3;
    v7 = (const void *)*((_QWORD *)this + 1);
    v8 = *((_QWORD *)this + 2) - (_DWORD)v7;
    v9 = __OFSUB__(a3, v8);
    a3 -= v8;
    if ((a3 < 0) ^ v9 | (a3 == 0))
      break;
    memcpy(__dst, v7, v8);
    __dst += v8;
    *((_QWORD *)this + 1) += v8;
    if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0)
      return v6 <= v8;
  }
  memcpy(__dst, v7, v6);
  *((_QWORD *)this + 1) += v6;
  return v6 <= v8;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  std::string *v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  int v24;
  char v25;
  int v26;
  uint64_t v27;
  std::string v28[2];

  v2 = *((_DWORD *)this + 11);
  if (v2 > 0 || *((int *)this + 7) > 0 || (v3 = *((_DWORD *)this + 6), v3 == *((_DWORD *)this + 10)))
  {
    v4 = *((_DWORD *)this + 6) - v2;
    v5 = *((_DWORD *)this + 12);
    if (v4 >= v5 && v5 != *((_DWORD *)this + 10))
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PrintTotalBytesLimitError(this);
    return 0;
  }
  else
  {
    v8 = *((_DWORD *)this + 13);
    if ((v8 & 0x80000000) == 0 && v3 >= v8)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 506);
      v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v28, "Reading dangerously large protocol message.  If the message turns out to be larger than ");
      v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, *((_DWORD *)this + 12));
      v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, " bytes, parsing will be halted for security reasons.  To increase the limit (or to disable these warnings), see CodedInputStream::SetTotalBytesLimit() in google/protobuf/io/coded_stream.h.");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v27, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
      *((_DWORD *)this + 13) = -2;
    }
    v27 = 0;
    v26 = 0;
    v12 = *(_QWORD *)this;
    do
    {
      v6 = (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(_QWORD *)v12 + 16))(v12, &v27, &v26);
      if (!(_DWORD)v6)
      {
        *((_QWORD *)this + 1) = 0;
        *((_QWORD *)this + 2) = 0;
        return v6;
      }
      v13 = v26;
    }
    while (!v26);
    v14 = v27 + v26;
    *((_QWORD *)this + 1) = v27;
    *((_QWORD *)this + 2) = v14;
    if (v13 < 0)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 523);
      v15 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (buffer_size) >= (0): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v25, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v15);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
      v13 = v26;
    }
    v16 = *((_DWORD *)this + 6);
    v17 = v16 - (v13 ^ 0x7FFFFFFF);
    if (v16 <= (v13 ^ 0x7FFFFFFF))
    {
      v19 = v13 + v16;
      v18 = *((_QWORD *)this + 2);
    }
    else
    {
      *((_DWORD *)this + 7) = v17;
      v18 = *((_QWORD *)this + 2) - v17;
      *((_QWORD *)this + 2) = v18;
      v19 = 0x7FFFFFFF;
    }
    *((_DWORD *)this + 6) = v19;
    v20 = *((_DWORD *)this + 10);
    v21 = v18 + *((int *)this + 11);
    *((_QWORD *)this + 2) = v21;
    v22 = *((_DWORD *)this + 12);
    if (v22 >= v20)
      v22 = v20;
    v23 = __OFSUB__(v19, v22);
    v24 = v19 - v22;
    if ((v24 < 0) ^ v23 | (v24 == 0))
      v24 = 0;
    else
      *((_QWORD *)this + 2) = v21 - v24;
    *((_DWORD *)this + 11) = v24;
  }
  return v6;
}

void sub_208FE63EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, const void **a2, int *a3)
{
  uint64_t v7;
  int v8;
  const void *v9;

  if (*((_BYTE *)this + 17))
    return 0;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
  v7 = *((unsigned int *)this + 12);
  if ((int)v7 < 1)
  {
    v8 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), *((_QWORD *)this + 4), *((unsigned int *)this + 10));
    *((_DWORD *)this + 11) = v8;
    if (v8 <= 0)
    {
      if (v8 < 0)
        *((_BYTE *)this + 17) = 1;
      wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(this);
      return 0;
    }
    v9 = (const void *)*((_QWORD *)this + 4);
    *((_QWORD *)this + 3) += v8;
    *a3 = v8;
    *a2 = v9;
  }
  else
  {
    *a2 = (const void *)(*((_QWORD *)this + 4) + *((int *)this + 11) - v7);
    *a3 = v7;
    *((_DWORD *)this + 12) = 0;
  }
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;

  if (!*(_QWORD *)(this + 32))
  {
    v1 = this;
    v2 = operator new[]();
    this = *(_QWORD *)(v1 + 32);
    if (this != v2)
    {
      if (this)
        this = MEMORY[0x20BD0BE60](this, 0x1000C8077774924);
      *(_QWORD *)(v1 + 32) = v2;
    }
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::Next(wireless_diagnostics::google::protobuf::io::FileInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32), a2, a3);
}

ssize_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Read(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this, void *a2, int a3)
{
  std::string *v6;
  ssize_t v7;
  char v9;
  std::string v10[2];

  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 139);
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  while (1)
  {
    v7 = read(*((_DWORD *)this + 2), a2, a3);
    if ((v7 & 0x80000000) == 0)
      break;
    if (*__error() != 4)
    {
      *((_DWORD *)this + 4) = *__error();
      return v7;
    }
  }
  return v7;
}

void sub_208FE65F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  std::string *v2;
  uint64_t result;
  char v4;
  std::string v5[2];

  if (*((_DWORD *)this + 12))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 302);
    v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (backup_bytes_) == (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v4, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 11) = 0;
  result = *((_QWORD *)this + 4);
  if (result)
  {
    result = MEMORY[0x20BD0BE60](result, 0x1000C8077774924);
    *((_QWORD *)this + 4) = 0;
  }
  return result;
}

void sub_208FE6694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete(uint64_t result)
{
  if (result)
  {
    if (*(char *)(result + 23) < 0)
      operator delete(*(void **)result);
    JUMPOUT(0x20BD0BE78);
  }
  return result;
}

int *wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(int *this, int a2)
{
  int v2;
  int *v3;
  const void *v4;
  int v5;

  v2 = this[4];
  if (v2 < a2)
  {
    v3 = this;
    v4 = *(const void **)this;
    v5 = 2 * v2;
    if (v5 <= a2)
      v5 = a2;
    if (v5 <= 4)
      v5 = 4;
    this[4] = v5;
    this = (int *)operator new[]();
    *(_QWORD *)v3 = this;
    if (v4)
    {
      memcpy(this, v4, 8 * v3[3]);
      JUMPOUT(0x20BD0BE60);
    }
  }
  return this;
}

_QWORD *wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  result[1] = 0;
  result[2] = 0;
  *result = 0;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString(uint64_t a1, std::string *this)
{
  unint64_t v4;
  char *v5;
  unsigned int v6;
  unsigned __int8 *v7;
  int v8;
  _BOOL8 result;
  unsigned int v10;

  v10 = 0;
  v5 = *(char **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v5 < v4 && (*v5 & 0x80000000) == 0)
  {
    v6 = *v5;
    v10 = v6;
    v7 = (unsigned __int8 *)(v5 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    goto LABEL_7;
  }
  v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, &v10);
  result = 0;
  if (v8)
  {
    v6 = v10;
    if ((v10 & 0x80000000) == 0)
    {
      v7 = *(unsigned __int8 **)(a1 + 8);
      v4 = *(_QWORD *)(a1 + 16);
LABEL_7:
      if ((int)v6 > (int)v4 - (int)v7)
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, this, v6);
      std::string::resize(this, v6, 0);
      if (!v6)
        return 1;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      {
        if (!this->__r_.__value_.__l.__size_)
        {
LABEL_15:
          this = 0;
          goto LABEL_16;
        }
        this = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      else if (!*((_BYTE *)&this->__r_.__value_.__s + 23))
      {
        goto LABEL_15;
      }
LABEL_16:
      memcpy(this, *(const void **)(a1 + 8), v6);
      *(_QWORD *)(a1 + 8) += v6;
      return 1;
    }
  }
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes(uint64_t a1, std::string *this)
{
  unint64_t v4;
  char *v5;
  unsigned int v6;
  unsigned __int8 *v7;
  int v8;
  _BOOL8 result;
  unsigned int v10;

  v10 = 0;
  v5 = *(char **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v5 < v4 && (*v5 & 0x80000000) == 0)
  {
    v6 = *v5;
    v10 = v6;
    v7 = (unsigned __int8 *)(v5 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    goto LABEL_7;
  }
  v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, &v10);
  result = 0;
  if (v8)
  {
    v6 = v10;
    if ((v10 & 0x80000000) == 0)
    {
      v7 = *(unsigned __int8 **)(a1 + 8);
      v4 = *(_QWORD *)(a1 + 16);
LABEL_7:
      if ((int)v6 > (int)v4 - (int)v7)
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)a1, this, v6);
      std::string::resize(this, v6, 0);
      if (!v6)
        return 1;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      {
        if (!this->__r_.__value_.__l.__size_)
        {
LABEL_15:
          this = 0;
          goto LABEL_16;
        }
        this = (std::string *)this->__r_.__value_.__r.__words[0];
      }
      else if (!*((_BYTE *)&this->__r_.__value_.__s + 23))
      {
        goto LABEL_15;
      }
LABEL_16:
      memcpy(this, *(const void **)(a1 + 8), v6);
      *(_QWORD *)(a1 + 8) += v6;
      return 1;
    }
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  unint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v14;

  v4 = (_BYTE *)*((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  if ((int)v3 - (int)v4 <= 9 && (v3 <= (unint64_t)v4 || *(char *)(v3 - 1) < 0))
  {
    v14 = 0;
    v8 = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v14);
    if ((_DWORD)v8)
      *a2 = v14;
  }
  else
  {
    v5 = (uint64_t)(v4 + 1);
    v6 = *v4 & 0x7F;
    if ((*v4 & 0x80) != 0)
    {
      v7 = (char)v4[1];
      v6 = *v4 & 0x7F | ((v7 & 0x7F) << 7);
      if (v7 < 0)
      {
        v9 = (char)v4[2];
        v6 = v6 & 0xFFE03FFF | ((v9 & 0x7F) << 14);
        if (v9 < 0)
        {
          v10 = (char)v4[3];
          v6 = v6 & 0xF01FFFFF | ((v10 & 0x7F) << 21);
          if (v10 < 0)
          {
            v11 = (char)v4[4];
            v6 |= v11 << 28;
            if (v11 < 0)
            {
              v12 = 0;
              while ((char)v4[v12 + 5] < 0)
              {
                v8 = 0;
                if ((_DWORD)++v12 == 5)
                  return v8;
              }
              v5 = (uint64_t)&v4[v12 + 6];
            }
            else
            {
              v5 = (uint64_t)(v4 + 5);
            }
          }
          else
          {
            v5 = (uint64_t)(v4 + 4);
          }
        }
        else
        {
          v5 = (uint64_t)(v4 + 3);
        }
      }
      else
      {
        v5 = (uint64_t)(v4 + 2);
      }
    }
    *a2 = v6;
    *((_QWORD *)this + 1) = v5;
    return 1;
  }
  return v8;
}

BOOL wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadStringFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, std::string *a2, int a3)
{
  int v6;
  const std::string::value_type *v7;
  int v8;
  BOOL v9;

  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
  {
    if (a2->__r_.__value_.__l.__size_)
    {
      *a2->__r_.__value_.__l.__data_ = 0;
      a2->__r_.__value_.__l.__size_ = 0;
    }
  }
  else if (*((_BYTE *)&a2->__r_.__value_.__s + 23))
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    *((_BYTE *)&a2->__r_.__value_.__s + 23) = 0;
  }
  while (1)
  {
    v6 = a3;
    v7 = (const std::string::value_type *)*((_QWORD *)this + 1);
    v8 = *((_QWORD *)this + 2) - (_DWORD)v7;
    v9 = __OFSUB__(a3, v8);
    a3 -= v8;
    if ((a3 < 0) ^ v9 | (a3 == 0))
      break;
    if (v8)
    {
      std::string::append(a2, v7, v8);
      v7 = (const std::string::value_type *)*((_QWORD *)this + 1);
    }
    *((_QWORD *)this + 1) = &v7[v8];
    if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0)
      return v6 <= v8;
  }
  std::string::append(a2, v7, v6);
  *((_QWORD *)this + 1) += v6;
  return v6 <= v8;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  _BYTE *v2;
  unint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v2 = (_BYTE *)*((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  if ((int)v3 - (int)v2 <= 9 && (v3 <= (unint64_t)v2 || *(char *)(v3 - 1) < 0))
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Slow(this, a2);
  v4 = (_DWORD)v2 + 1;
  v5 = *v2 & 0x7F;
  if ((*v2 & 0x80) == 0)
  {
    v6 = 0;
    v7 = 0;
LABEL_25:
    *((_QWORD *)this + 1) = &v2[v4 - (int)v2];
    *a2 = v5 | ((unint64_t)v6 << 28) | (v7 << 56);
    return 1;
  }
  v9 = (char)v2[1];
  v5 = *v2 & 0x7F | ((v9 & 0x7F) << 7);
  if ((v9 & 0x80000000) == 0)
  {
    v6 = 0;
    v7 = 0;
    v4 = (_DWORD)v2 + 2;
    goto LABEL_25;
  }
  v10 = (char)v2[2];
  v5 = v5 & 0xFFE03FFF | ((v10 & 0x7F) << 14);
  if ((v10 & 0x80000000) == 0)
  {
    v6 = 0;
    v7 = 0;
    v4 = (_DWORD)v2 + 3;
    goto LABEL_25;
  }
  v11 = (char)v2[3];
  v5 = v5 & 0xF01FFFFF | ((v11 & 0x7F) << 21);
  if ((v11 & 0x80000000) == 0)
  {
    v6 = 0;
    v7 = 0;
    v4 = (_DWORD)v2 + 4;
    goto LABEL_25;
  }
  v6 = v2[4] & 0x7F;
  if ((v2[4] & 0x80) == 0)
  {
    v7 = 0;
    v4 = (_DWORD)v2 + 5;
    goto LABEL_25;
  }
  v12 = (char)v2[5];
  v6 = v2[4] & 0x7F | ((v12 & 0x7F) << 7);
  if ((v12 & 0x80000000) == 0)
  {
    v7 = 0;
    v4 = (_DWORD)v2 + 6;
    goto LABEL_25;
  }
  v13 = (char)v2[6];
  v6 = v6 & 0xFFE03FFF | ((v13 & 0x7F) << 14);
  if ((v13 & 0x80000000) == 0)
  {
    v7 = 0;
    v4 = (_DWORD)v2 + 7;
    goto LABEL_25;
  }
  v14 = (char)v2[7];
  v6 = v6 & 0xF01FFFFF | ((v14 & 0x7F) << 21);
  if ((v14 & 0x80000000) == 0)
  {
    v7 = 0;
    v4 = (_DWORD)v2 + 8;
    goto LABEL_25;
  }
  v7 = v2[8] & 0x7F;
  if ((v2[8] & 0x80) == 0)
  {
    v4 = (_DWORD)v2 + 9;
    goto LABEL_25;
  }
  v15 = (char)v2[9];
  if ((v15 & 0x80000000) == 0)
  {
    v4 = (_DWORD)v2 + 10;
    v7 = v2[8] & 0x7F | ((v15 & 0x7F) << 7);
    goto LABEL_25;
  }
  return 0;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Slow(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  char *v6;
  char v7;

  v4 = 0;
  v5 = 0;
  while (v4 != 10)
  {
    while (1)
    {
      v6 = (char *)*((_QWORD *)this + 1);
      if (v6 != *((char **)this + 2))
        break;
      if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this) & 1) == 0)
        return 0;
    }
    v7 = *v6;
    v5 |= (unint64_t)(*v6 & 0x7F) << (7 * v4);
    *((_QWORD *)this + 1) = v6 + 1;
    ++v4;
    if ((v7 & 0x80) == 0)
    {
      *a2 = v5;
      return 1;
    }
  }
  return 0;
}

unint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  uint64_t v1;
  _BYTE *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;

  v2 = (_BYTE *)*((_QWORD *)this + 1);
  v1 = *((_QWORD *)this + 2);
  v3 = v1 - (_DWORD)v2;
  if ((int)v1 - (int)v2 > 9)
    goto LABEL_4;
  if (v3 >= 1)
  {
    if ((*(char *)(v1 - 1) & 0x80000000) == 0)
    {
LABEL_4:
      v4 = (uint64_t)(v2 + 1);
      v5 = *v2 & 0x7F;
      if ((*v2 & 0x80) != 0)
      {
        v6 = (char)v2[1];
        v5 = *v2 & 0x7F | ((v6 & 0x7F) << 7);
        if (v6 < 0)
        {
          v8 = (char)v2[2];
          v5 = v5 & 0xFFE03FFF | ((v8 & 0x7F) << 14);
          if (v8 < 0)
          {
            v12 = (char)v2[3];
            v5 = v5 & 0xF01FFFFF | ((v12 & 0x7F) << 21);
            if (v12 < 0)
            {
              v13 = (char)v2[4];
              v5 = v5 | (v13 << 28);
              if (v13 < 0)
              {
                v14 = 0;
                while ((char)v2[v14 + 5] < 0)
                {
                  v11 = 0;
                  if ((_DWORD)++v14 == 5)
                    return v11;
                }
                v4 = (uint64_t)&v2[v14 + 6];
              }
              else
              {
                v4 = (uint64_t)(v2 + 5);
              }
            }
            else
            {
              v4 = (uint64_t)(v2 + 4);
            }
          }
          else
          {
            v4 = (uint64_t)(v2 + 3);
          }
        }
        else
        {
          v4 = (uint64_t)(v2 + 2);
        }
      }
      *((_QWORD *)this + 1) = v4;
      return v5;
    }
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  }
  if (v3)
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  v9 = *((_DWORD *)this + 11);
  v10 = *((_DWORD *)this + 6);
  if (v9 <= 0 && v10 != *((_DWORD *)this + 10))
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  if (v10 - v9 >= *((_DWORD *)this + 12))
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagSlow(this);
  v11 = 0;
  *((_BYTE *)this + 36) = 1;
  return v11;
}

_QWORD *wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSet(_QWORD *this)
{
  this[2] = 0;
  this[1] = 0;
  *this = this + 1;
  return this;
}

{
  this[2] = 0;
  this[1] = 0;
  *this = this + 1;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  int v1;
  int v2;
  unsigned int v3;

  if (this >> 28)
    v1 = 5;
  else
    v1 = 4;
  if (this >= 0x200000)
    v2 = v1;
  else
    v2 = 3;
  if (this >= 0x4000)
    v3 = v2;
  else
    v3 = 2;
  if (this >= 0x80)
    return v3;
  else
    return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(unint64_t this)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;

  if ((this & 0x8000000000000000) == 0)
    v1 = 9;
  else
    v1 = 10;
  if (HIBYTE(this))
    v2 = v1;
  else
    v2 = 8;
  if (this >> 49)
    v3 = v2;
  else
    v3 = 7;
  if (this >> 42)
    v4 = v3;
  else
    v4 = 6;
  if (this >> 28)
    v5 = 5;
  else
    v5 = 4;
  if (this >= 0x200000)
    v6 = v5;
  else
    v6 = 3;
  if (this >= 0x4000)
    v7 = v6;
  else
    v7 = 2;
  if (this >= 0x80)
    v8 = v7;
  else
    v8 = 1;
  if (this >> 35)
    return v4;
  else
    return v8;
}

_BYTE *wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, _BYTE *a2, unsigned __int8 *a3)
{
  _BYTE *v3;

  *a2 = this | 0x80;
  if (this < 0x80)
  {
    *a2 = this & 0x7F;
    return a2 + 1;
  }
  else
  {
    a2[1] = (this >> 7) | 0x80;
    if (this < 0x4000)
    {
      a2[1] = (this >> 7) & 0x7F;
      return a2 + 2;
    }
    else
    {
      a2[2] = (this >> 14) | 0x80;
      if (this < 0x200000)
      {
        a2[2] = (this >> 14) & 0x7F;
        return a2 + 3;
      }
      else
      {
        a2[3] = (this >> 21) | 0x80;
        if (this >> 28)
        {
          a2[4] = this >> 28;
          return a2 + 5;
        }
        else
        {
          v3 = a2 + 4;
          a2[3] = (this >> 21) & 0x7F;
        }
      }
    }
  }
  return v3;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::~ExtensionSet(wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  wireless_diagnostics::google::protobuf::internal::ExtensionSet **v2;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet *v3;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet *v4;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet **v5;
  BOOL v6;

  v2 = this + 1;
  v3 = *this;
  if (*this != (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(this + 1))
  {
    do
    {
      wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Free((int *)v3 + 10);
      v4 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((_QWORD *)v3 + 1);
      if (v4)
      {
        do
        {
          v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v4;
          v4 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((_QWORD *)v3 + 2);
          v6 = *v5 == v3;
          v3 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v5;
        }
        while (!v6);
      }
      v3 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v5;
    }
    while (v5 != v2);
  }
  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy((uint64_t)this, this[1]);
}

void std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

wireless_diagnostics::google::protobuf::io::FileInputStream *wireless_diagnostics::google::protobuf::io::FileInputStream::FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2, int a3)
{
  *((_QWORD *)this + 1) = &off_24C0ED130;
  *(_QWORD *)this = &off_24C0ED160;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_BYTE *)this + 28) = 0;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)this + 32, (wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8), a3);
  return this;
}

void sub_208FE70E8(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *v1;
  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *v2;

  wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(v1);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor(uint64_t this, wireless_diagnostics::google::protobuf::io::CopyingInputStream *a2, int a3)
{
  int v3;

  *(_QWORD *)this = &off_24C0ED4D0;
  *(_QWORD *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0)
    v3 = 0x2000;
  else
    v3 = a3;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_DWORD *)(this + 44) = 0;
  *(_DWORD *)(this + 48) = 0;
  *(_DWORD *)(this + 40) = v3;
  return this;
}

{
  int v3;

  *(_QWORD *)this = &off_24C0ED4D0;
  *(_QWORD *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0)
    v3 = 0x2000;
  else
    v3 = a3;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_DWORD *)(this + 44) = 0;
  *(_DWORD *)(this + 48) = 0;
  *(_DWORD *)(this + 40) = v3;
  return this;
}

_BYTE *wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(unint64_t this, _BYTE *a2, unsigned __int8 *a3)
{
  unint64_t v3;
  unsigned int v4;

  v3 = this >> 28;
  if (HIBYTE(this))
  {
    if (HIBYTE(this) >= 0x80)
    {
      a2[9] = -127;
      v4 = 10;
    }
    else
    {
      v4 = 9;
    }
    a2[8] = HIBYTE(this) | 0x80;
    goto LABEL_10;
  }
  if ((_DWORD)v3)
  {
    if (!(v3 >> 14))
    {
      if (v3 < 0x80)
      {
        v4 = 5;
LABEL_13:
        a2[4] = v3 | 0x80;
        goto LABEL_14;
      }
      v4 = 6;
LABEL_12:
      a2[5] = (this >> 35) | 0x80;
      goto LABEL_13;
    }
    if (v3 < 0x200000)
    {
      v4 = 7;
      goto LABEL_11;
    }
    v4 = 8;
LABEL_10:
    a2[7] = (this >> 49) | 0x80;
LABEL_11:
    a2[6] = (this >> 42) | 0x80;
    goto LABEL_12;
  }
  if (this >> 14)
  {
    if (this < 0x200000)
    {
      v4 = 3;
      goto LABEL_15;
    }
    v4 = 4;
LABEL_14:
    a2[3] = (this >> 21) | 0x80;
LABEL_15:
    a2[2] = (this >> 14) | 0x80;
    goto LABEL_16;
  }
  if (this < 0x80)
  {
    v4 = 1;
    goto LABEL_17;
  }
  v4 = 2;
LABEL_16:
  a2[1] = (this >> 7) | 0x80;
LABEL_17:
  *a2 = this | 0x80;
  a2[v4 - 1] &= ~0x80u;
  return &a2[v4];
}

uint64_t _GLOBAL__sub_I_generated_message_util_cc()
{
  wireless_diagnostics::google::protobuf::internal::kEmptyString = 0;
  *(_QWORD *)algn_253CF81D8 = 0;
  qword_253CF81E0 = 0;
  return __cxa_atexit(MEMORY[0x24BEDACF0], &wireless_diagnostics::google::protobuf::internal::kEmptyString, &dword_208FE3000);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Flush(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ByteSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet **this)
{
  wireless_diagnostics::google::protobuf::internal::ExtensionSet **v1;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet *v2;
  uint64_t v3;
  int v4;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet *v5;
  wireless_diagnostics::google::protobuf::internal::ExtensionSet **v6;
  BOOL v7;

  v1 = this + 1;
  v2 = *this;
  if (*this == (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(this + 1))
    return 0;
  LODWORD(v3) = 0;
  do
  {
    v4 = wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::ByteSize((uint64_t **)v2 + 5, *((_DWORD *)v2 + 8));
    v5 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((_QWORD *)v2 + 1);
    if (v5)
    {
      do
      {
        v6 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v5;
        v5 = *(wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        v6 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((_QWORD *)v2 + 2);
        v7 = *v6 == v2;
        v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v6;
      }
      while (!v7);
    }
    v3 = (v4 + v3);
    v2 = (wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v6;
  }
  while (v6 != v1);
  return v3;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(uint64_t this, int a2)
{
  int __src;

  if (*(_DWORD *)(this + 16) < 4u)
  {
    __src = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, (char *)&__src, 4);
  }
  else
  {
    **(_DWORD **)(this + 8) = a2;
    *(_QWORD *)(this + 8) += 4;
    *(_DWORD *)(this + 16) -= 4;
  }
  return this;
}

wireless_diagnostics::google::protobuf::io::FileOutputStream *wireless_diagnostics::google::protobuf::io::FileOutputStream::FileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2, int a3)
{
  *(_QWORD *)this = &off_24C0ED208;
  *((_QWORD *)this + 1) = &off_24C0ED1E0;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)this + 32, (wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8), a3);
  return this;
}

void sub_208FE73B4(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *v1;
  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *v2;

  wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(v1);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor(uint64_t this, wireless_diagnostics::google::protobuf::io::CopyingOutputStream *a2, int a3)
{
  int v3;

  *(_QWORD *)this = &off_24C0ED510;
  *(_QWORD *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0)
    v3 = 0x2000;
  else
    v3 = a3;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_DWORD *)(this + 40) = v3;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

{
  int v3;

  *(_QWORD *)this = &off_24C0ED510;
  *(_QWORD *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 0;
  if (a3 <= 0)
    v3 = 0x2000;
  else
    v3 = a3;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_DWORD *)(this + 40) = v3;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, wireless_diagnostics::google::protobuf::internal *a2, const std::string::value_type *a3, const char *a4)
{
  const std::string::value_type *v7;
  std::string::size_type v8;
  const std::string::value_type *p_p;
  std::string::size_type v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  const std::string::value_type *v13;
  std::string::size_type v14;
  void *__p;
  std::string::size_type v16;
  unsigned __int8 v17;
  void *v18;
  std::string::size_type v19;
  unsigned __int8 v20;
  int v21;
  const char *v22;
  int v23;
  std::string v24;
  char __str[127];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if ((int)a2 > 2005000)
  {
    v21 = 3;
    v22 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    v23 = 62;
    memset(&v24, 0, sizeof(v24));
    std::string::append(&v24, "This program requires version ");
    wireless_diagnostics::google::protobuf::internal::VersionString(a2, &v18);
    if ((v20 & 0x80u) == 0)
      v7 = (const std::string::value_type *)&v18;
    else
      v7 = (const std::string::value_type *)v18;
    if ((v20 & 0x80u) == 0)
      v8 = v20;
    else
      v8 = v19;
    std::string::append(&v24, v7, v8);
    std::string::append(&v24, " of the Protocol Buffer runtime library, but the installed version is ");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 2, 5, 0);
    v26 = 0;
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    if ((v17 & 0x80u) == 0)
      p_p = (const std::string::value_type *)&__p;
    else
      p_p = (const std::string::value_type *)__p;
    if ((v17 & 0x80u) == 0)
      v10 = v17;
    else
      v10 = v16;
    std::string::append(&v24, p_p, v10);
    std::string::append(&v24, ".  Please update your library.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v24, a3);
    std::string::append(&v24, "\".)");
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v21);
    if ((char)v17 < 0)
      operator delete(__p);
    if ((char)v20 < 0)
      operator delete(v18);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
  }
  if ((int)this < 2005000)
  {
    v21 = 3;
    v22 = "/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/common.cc";
    v23 = 73;
    memset(&v24, 0, sizeof(v24));
    std::string::append(&v24, "This program was compiled against version ");
    wireless_diagnostics::google::protobuf::internal::VersionString(this, &v18);
    if ((v20 & 0x80u) == 0)
      v11 = (const std::string::value_type *)&v18;
    else
      v11 = (const std::string::value_type *)v18;
    if ((v20 & 0x80u) == 0)
      v12 = v20;
    else
      v12 = v19;
    std::string::append(&v24, v11, v12);
    std::string::append(&v24, " of the Protocol Buffer runtime library, which is not compatible with the installed version (");
    snprintf(__str, 0x80uLL, "%d.%d.%d", 2, 5, 0);
    v26 = 0;
    std::string::basic_string[abi:ne180100]<0>(&__p, __str);
    if ((v17 & 0x80u) == 0)
      v13 = (const std::string::value_type *)&__p;
    else
      v13 = (const std::string::value_type *)__p;
    if ((v17 & 0x80u) == 0)
      v14 = v17;
    else
      v14 = v16;
    std::string::append(&v24, v13, v14);
    std::string::append(&v24, ").  Contact the program author for an update.  If you compiled the program yourself, make sure that your headers are from the same version of Protocol Buffers as your link-time library.  (Version verification failed in \"");
    std::string::append(&v24, a3);
    std::string::append(&v24, "\".)");
    wireless_diagnostics::google::protobuf::internal::LogMessage::Finish((wireless_diagnostics::google::protobuf::internal::LogMessage *)&v21);
    if ((char)v17 < 0)
      operator delete(__p);
    if ((char)v20 < 0)
      operator delete(v18);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
  }
}

void sub_208FE76F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a17 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a32 < 0)
    operator delete(a27);
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::GetDirectBufferPointer(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, const void **a2, int *a3)
{
  const void *v6;
  uint64_t result;

  v6 = (const void *)*((_QWORD *)this + 1);
  if (*((_DWORD *)this + 4) == (_DWORD)v6)
  {
    result = wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this);
    if (!(_DWORD)result)
      return result;
    v6 = (const void *)*((_QWORD *)this + 1);
  }
  *a2 = v6;
  *a3 = *((_DWORD *)this + 4) - *((_DWORD *)this + 2);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  uint64_t result;
  int v9;
  int v10;
  uint64_t v11;

  if ((a2 & 0x80000000) == 0)
  {
    v4 = *((_QWORD *)this + 1);
    v3 = (_QWORD *)((char *)this + 8);
    v5 = *((_QWORD *)this + 2) - v4;
    v6 = __OFSUB__(a2, (_DWORD)v5);
    v7 = a2 - v5;
    if ((v7 < 0) ^ v6 | (v7 == 0))
    {
      *v3 = v4 + a2;
      return 1;
    }
    if (*((int *)this + 11) >= 1)
    {
      result = 0;
      *v3 = v4 + (int)v5;
      return result;
    }
    *v3 = 0;
    *((_QWORD *)this + 2) = 0;
    v9 = *((_DWORD *)this + 10);
    if (*((_DWORD *)this + 12) < v9)
      v9 = *((_DWORD *)this + 12);
    v10 = *((_DWORD *)this + 6);
    v11 = (v9 - v10);
    if ((int)v11 >= v7)
    {
      *((_DWORD *)this + 6) = v10 + v7;
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)this + 32))(*(_QWORD *)this);
    }
    if ((int)v11 >= 1)
    {
      *((_DWORD *)this + 6) = v9;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)this + 32))(*(_QWORD *)this, v11);
    }
  }
  return 0;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::Clear(uint64_t **this)
{
  uint64_t **v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;

  v1 = this + 1;
  v2 = *this;
  if (*this != (uint64_t *)(this + 1))
  {
    do
    {
      this = wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear((uint64_t **)v2 + 5);
      v3 = (uint64_t *)v2[1];
      if (v3)
      {
        do
        {
          v4 = v3;
          v3 = (uint64_t *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          v4 = (uint64_t *)v2[2];
          v5 = *v4 == (_QWORD)v2;
          v2 = v4;
        }
        while (!v5);
      }
      v2 = v4;
    }
    while (v4 != (uint64_t *)v1);
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedExtensionFinder::Find(uint64_t a1, unsigned int a2, _OWORD *a3)
{
  uint64_t *v4;
  __int128 v5;
  _QWORD v7[2];

    return 0;
  v7[0] = *(_QWORD *)(a1 + 8);
  v7[1] = a2;
  if (!v4)
    return 0;
  v5 = *((_OWORD *)v4 + 3);
  *a3 = *((_OWORD *)v4 + 2);
  a3[1] = v5;
  return 1;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, int a3, char a4, char a5)
{
  char v7;
  unsigned int v8;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  std::string v16[2];

  v7 = a3;
  v8 = a2;
  switch(a3)
  {
    case 14:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 116);
      v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (type) != (WireFormatLite::TYPE_ENUM): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
LABEL_7:
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
      break;
    case 11:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 117);
      v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (type) != (WireFormatLite::TYPE_MESSAGE): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
      goto LABEL_7;
    case 10:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 118);
      v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (type) != (WireFormatLite::TYPE_GROUP): ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v12);
      goto LABEL_7;
  }
  LOBYTE(v13) = v7;
  BYTE1(v13) = a4;
  BYTE2(v13) = a5;
  v14 = 0;
}

void sub_208FE7A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::`anonymous namespace'::Register(uint64_t a1, unsigned int a2, __int128 *a3)
{
  uint64_t v6;
  __int128 v7;
  char v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  char v14;
  void *__p[2];
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  __dmb(0xBu);
  if (v6 != 2)
  {
    *(_QWORD *)&v17 = &off_24C0ED5D0;
    LOBYTE(v18) = 0;
    wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0((wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *)&v17);
  }
  *(_QWORD *)&v17 = a1;
  *((_QWORD *)&v17 + 1) = a2;
  v7 = a3[1];
  v18 = *a3;
  v19 = v7;
  if ((v8 & 1) == 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 86);
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<((std::string *)&v17, "Multiple extension registrations for type \"");
    (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)a1 + 16))(__p, a1);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, (const std::string::value_type *)__p);
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "\", field number ");
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, a2);
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, ".");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    if (v16 < 0)
      operator delete(__p[0]);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v17);
  }
}

void sub_208FE7BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0)
    operator delete(__p);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterEnumExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, int a3, char a4, char a5, uint64_t a6, BOOL (*a7)(int))
{
  char v10;
  unsigned int v11;
  std::string *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  std::string v18[2];

  v10 = a3;
  v11 = a2;
  if (a3 != 14)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 140);
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: (type) == (WireFormatLite::TYPE_ENUM): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v17, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
  }
  LOBYTE(v14) = v10;
  BYTE1(v14) = a4;
  BYTE2(v14) = a5;
  *((_QWORD *)&v14 + 1) = wireless_diagnostics::google::protobuf::internal::CallNoArgValidityFunc;
  v15 = a6;
  v16 = 0;
}

void sub_208FE7CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::CallNoArgValidityFunc(wireless_diagnostics::google::protobuf::internal *this, const void *a2)
{
  return ((uint64_t (*)(const void *))this)(a2);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RegisterMessageExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::MessageLite *a2, char a3, char a4, char a5, uint64_t a6, const wireless_diagnostics::google::protobuf::MessageLite *a7)
{
  unsigned int v11;
  std::string *v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  std::string v17[2];

  v11 = a2;
  if ((a3 & 0xFE) != 0xA)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 153);
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v17, "CHECK failed: type == WireFormatLite::TYPE_MESSAGE || type == WireFormatLite::TYPE_GROUP: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v16, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v17[0].__r_.__value_.__l.__data_);
  }
  LOBYTE(v14) = a3;
  BYTE1(v14) = a4;
  BYTE2(v14) = a5;
  *((_QWORD *)&v14 + 1) = a6;
  v15 = 0;
}

void sub_208FE7DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

int *wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Free(int *this)
{
  int v1;
  int *v2;

  v1 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)this
                                                                                                + 8)];
  if (*((_BYTE *)this + 9))
  {
    switch(*((_BYTE *)this + 8))
    {
      case 1:
        if (!*(_QWORD *)this)
          return this;
        if (**(_QWORD **)this)
          goto LABEL_22;
        goto LABEL_33;
      case 2:
        if (!*(_QWORD *)this)
          return this;
        if (**(_QWORD **)this)
LABEL_22:
          MEMORY[0x20BD0BE60]();
        goto LABEL_33;
      case 3:
      case 4:
      case 6:
      case 0x10:
      case 0x12:
        if (!*(_QWORD *)this)
          return this;
        if (**(_QWORD **)this)
          goto LABEL_26;
        goto LABEL_33;
      case 5:
      case 7:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x11:
        if (!*(_QWORD *)this)
          return this;
        if (**(_QWORD **)this)
          goto LABEL_26;
        goto LABEL_33;
      case 8:
        if (!*(_QWORD *)this)
          return this;
        if (**(_QWORD **)this)
LABEL_26:
          MEMORY[0x20BD0BE60]();
        break;
      case 9:
      case 0xC:
        if (!*(_QWORD *)this)
          return this;
        wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(*(int **)this);
        break;
      case 0xA:
      case 0xB:
        if (!*(_QWORD *)this)
          return this;
        wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(*(uint64_t **)this);
        break;
      default:
        return this;
    }
    goto LABEL_33;
  }
  if (v1 == 10)
  {
    this = *(int **)this;
    if (this)
      return (int *)(*(uint64_t (**)(int *))(*(_QWORD *)this + 8))(this);
  }
  else if (v1 == 9)
  {
    v2 = *(int **)this;
    if (*(_QWORD *)this)
    {
      if (*((char *)v2 + 23) < 0)
        operator delete(*(void **)v2);
LABEL_33:
      JUMPOUT(0x20BD0BE78);
    }
  }
  return this;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::Has(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  int v6;
  BOOL v7;
  char **v8;

  v4 = (char *)*((_QWORD *)this + 1);
  v2 = (char *)this + 8;
  v3 = v4;
  if (!v4)
    return 0;
  v5 = v2;
  do
  {
    v6 = *((_DWORD *)v3 + 8);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (char **)v3;
    else
      v8 = (char **)(v3 + 8);
    if (!v7)
      v5 = v3;
    v3 = *v8;
  }
  while (*v8);
  return v5 != v2 && *((_DWORD *)v5 + 8) <= a2 && (v5[50] & 1) == 0;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::NumExtensions(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  BOOL v7;

  v3 = *(char **)this;
  v1 = (char *)this + 8;
  v2 = v3;
  if (v3 == v1)
    return 0;
  LODWORD(v4) = 0;
  do
  {
    if ((v2[50] & 1) != 0)
      v4 = v4;
    else
      v4 = (v4 + 1);
    v5 = (char *)*((_QWORD *)v2 + 1);
    if (v5)
    {
      do
      {
        v6 = v5;
        v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        v6 = (char *)*((_QWORD *)v2 + 2);
        v7 = *(_QWORD *)v6 == (_QWORD)v2;
        v2 = v6;
      }
      while (!v7);
    }
    v2 = v6;
  }
  while (v6 != v1);
  return v4;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  int v6;
  BOOL v7;
  char **v8;

  v4 = (char *)*((_QWORD *)this + 1);
  v2 = (char *)this + 8;
  v3 = v4;
  if (!v4)
    return 0;
  v5 = v2;
  do
  {
    v6 = *((_DWORD *)v3 + 8);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (char **)v3;
    else
      v8 = (char **)(v3 + 8);
    if (!v7)
      v5 = v3;
    v3 = *v8;
  }
  while (*v8);
  if (v5 != v2 && *((_DWORD *)v5 + 8) <= a2)
    return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::GetSize((wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *)(v5 + 40));
  else
    return 0;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::GetSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this)
{
  uint64_t result;
  std::string *v2;
  char v3;
  std::string v4[2];

  switch(*((_BYTE *)this + 8))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
    case 0x12:
      result = *(unsigned int *)(*(_QWORD *)this + 8);
      break;
    default:
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v4, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 1415);
      v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v4, "Can't get here.");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v3, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v4[0].__r_.__value_.__l.__data_);
      result = 0;
      break;
  }
  return result;
}

void sub_208FE8148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionType(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  int v6;
  BOOL v7;
  char **v8;
  std::string *v9;
  std::string *v11;
  char v12;
  std::string v13[2];

  v4 = (char *)*((_QWORD *)this + 1);
  v2 = (char *)this + 8;
  v3 = v4;
  if (!v4)
    goto LABEL_11;
  v5 = v2;
  do
  {
    v6 = *((_DWORD *)v3 + 8);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (char **)v3;
    else
      v8 = (char **)(v3 + 8);
    if (!v7)
      v5 = v3;
    v3 = *v8;
  }
  while (*v8);
  if (v5 != v2 && *((_DWORD *)v5 + 8) <= a2)
  {
    if ((v5[50] & 1) != 0)
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 208);
      v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "Don't lookup extension types if they aren't present (2). ");
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    }
    return v5[48];
  }
  else
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 204);
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v13, "Don't lookup extension types if they aren't present (1). ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v12, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    return 0;
  }
}

void sub_208FE8248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::ClearExtension(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  uint64_t **result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t *v8;

  v4 = *((_QWORD *)this + 1);
  result = (uint64_t **)((char *)this + 8);
  v3 = v4;
  if (v4)
  {
    v5 = (uint64_t)result;
    do
    {
      v6 = *(_DWORD *)(v3 + 32);
      v7 = v6 < a2;
      if (v6 >= a2)
        v8 = (uint64_t *)v3;
      else
        v8 = (uint64_t *)(v3 + 8);
      if (!v7)
        v5 = v3;
      v3 = *v8;
    }
    while (*v8);
    if ((uint64_t **)v5 != result && *(_DWORD *)(v5 + 32) <= a2)
      return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear((uint64_t **)(v5 + 40));
  }
  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::Clear(uint64_t **this)
{
  uint64_t **v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;

  v1 = this;
  if (*((_BYTE *)this + 9))
  {
    switch(*((_BYTE *)this + 8))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
        *((_DWORD *)*this + 2) = 0;
        break;
      case 9:
      case 0xC:
        this = (uint64_t **)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)*this);
        break;
      case 0xA:
      case 0xB:
        v6 = (uint64_t)*this;
        if (*((int *)*this + 2) >= 1)
        {
          v7 = 0;
          do
          {
            this = (uint64_t **)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)v6 + 8 * v7) + 32))(*(_QWORD *)(*(_QWORD *)v6 + 8 * v7));
            ++v7;
          }
          while (v7 < *(int *)(v6 + 8));
        }
        *(_DWORD *)(v6 + 8) = 0;
        break;
      default:
        return this;
    }
  }
  else if ((*((_BYTE *)this + 10) & 1) == 0)
  {
    v2 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[*((unsigned __int8 *)this
                                                                                                  + 8)];
    if (v2 == 10)
    {
      v4 = **this;
      if ((*((_BYTE *)this + 10) & 0x10) != 0)
        v5 = *(uint64_t (**)(void))(v4 + 88);
      else
        v5 = *(uint64_t (**)(void))(v4 + 32);
      this = (uint64_t **)v5();
    }
    else if (v2 == 9)
    {
      v3 = (uint64_t)*this;
      if (*((char *)*this + 23) < 0)
      {
        **(_BYTE **)v3 = 0;
        *(_QWORD *)(v3 + 8) = 0;
      }
      else
      {
        *(_BYTE *)v3 = 0;
        *(_BYTE *)(v3 + 23) = 0;
      }
    }
    *((_BYTE *)v1 + 10) = *((_BYTE *)v1 + 10) & 0xF0 | 1;
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0)
      return *((unsigned int *)v6 + 10);
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32(uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::MaybeNewExtension(uint64_t **a1, int a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t **v6;
  char v7;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = 0;
  v11 = 0;
  v12 = 0;
  v9 = a2;
  v6 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v9, (uint64_t)&v9);
  *a4 = v6 + 5;
  v6[7] = a3;
  return v7 != 0;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 298);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(unsigned int *)(**((_QWORD **)v6 + 5) + 4 * a3);
}

void sub_208FE85B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 298);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(_DWORD *)(**((_QWORD **)v8 + 5) + 4 * a3) = a4;
}

void sub_208FE8690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a6;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(_DWORD *)(v15 + 4 * v14) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0)
      return *((_QWORD *)v6 + 5);
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64(uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  result[5] = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 299);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(_QWORD *)(**((_QWORD **)v6 + 5) + 8 * a3);
}

void sub_208FE88F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 299);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(_QWORD *)(**((_QWORD **)v8 + 5) + 8 * a3) = a4;
}

void sub_208FE89D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a6;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(_QWORD *)(v15 + 8 * v14) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0)
      return *((unsigned int *)v6 + 10);
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32(uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 300);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(unsigned int *)(**((_QWORD **)v6 + 5) + 4 * a3);
}

void sub_208FE8C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt32(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 300);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(_DWORD *)(**((_QWORD **)v8 + 5) + 4 * a3) = a4;
}

void sub_208FE8D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a6;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(_DWORD *)(v15 + 4 * v14) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetUInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0)
      return *((_QWORD *)v6 + 5);
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64(uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  result[5] = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedUInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 301);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(_QWORD *)(**((_QWORD **)v6 + 5) + 8 * a3);
}

void sub_208FE8F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedUInt64(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 301);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(_QWORD *)(**((_QWORD **)v8 + 5) + 8 * a3) = a4;
}

void sub_208FE905C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a6;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(_QWORD *)(v15 + 8 * v14) = a5;
  return result;
}

float wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetFloat(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, float a3)
{
  char *v3;
  char *v4;
  char *v5;
  float *v6;
  int v7;
  BOOL v8;
  char **v9;
  float result;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = (float *)v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = (float *)v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != (float *)v3 && *((_DWORD *)v6 + 8) <= a2 && (*((_BYTE *)v6 + 50) & 1) == 0)
      return v6[10];
  }
  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat(uint64_t **a1, int a2, char a3, uint64_t *a4, float a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a4;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  *((float *)result + 10) = a5;
  return result;
}

float wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedFloat(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 302);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(float *)(**((_QWORD **)v6 + 5) + 4 * a3);
}

void sub_208FE92BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedFloat(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, float a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 302);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(float *)(**((_QWORD **)v8 + 5) + 4 * a3) = a4;
}

void sub_208FE939C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, float a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a5;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(float *)(v15 + 4 * v14) = a6;
  return result;
}

double wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetDouble(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, double a3)
{
  char *v3;
  char *v4;
  char *v5;
  double *v6;
  int v7;
  BOOL v8;
  char **v9;
  double result;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = (double *)v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = (double *)v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != (double *)v3 && *((_DWORD *)v6 + 8) <= a2 && (*((_BYTE *)v6 + 50) & 1) == 0)
      return v6[5];
  }
  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble(uint64_t **a1, int a2, char a3, uint64_t *a4, double a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a4;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  *((double *)result + 5) = a5;
  return result;
}

double wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedDouble(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 303);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(double *)(**((_QWORD **)v6 + 5) + 8 * a3);
}

void sub_208FE95FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedDouble(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, double a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 303);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(double *)(**((_QWORD **)v8 + 5) + 8 * a3) = a4;
}

void sub_208FE96DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble(uint64_t **a1, int a2, char a3, char a4, uint64_t a5, double a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a5;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(double *)(v15 + 8 * v14) = a6;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetBool(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0)
      return v6[40] != 0;
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool(uint64_t **a1, int a2, char a3, char a4, uint64_t *a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  *((_BYTE *)result + 40) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedBool(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 304);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(unsigned __int8 *)(**((_QWORD **)v6 + 5) + a3);
}

void sub_208FE9948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedBool(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, char a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 304);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(_BYTE *)(**((_QWORD **)v8 + 5) + a3) = a4;
}

void sub_208FE9A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool(uint64_t **a1, int a2, char a3, char a4, char a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a6;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(_BYTE *)(v15 + v14) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  char *v3;
  char *v4;
  char *v5;
  int v6;
  BOOL v7;
  char **v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v4 = (char *)this + 8;
  v3 = (char *)*((_QWORD *)this + 1);
  if (!v3)
    goto LABEL_11;
  v5 = (char *)this + 8;
  do
  {
    v6 = *((_DWORD *)v3 + 8);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (char **)v3;
    else
      v8 = (char **)(v3 + 8);
    if (!v7)
      v5 = v3;
    v3 = *v8;
  }
  while (*v8);
  if (v5 == v4 || *((_DWORD *)v5 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 312);
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, "no extension numbered ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, a2);
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v5 = v4;
  }
  return *((_QWORD *)v5 + 5);
}

void sub_208FE9BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetEnum(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (v5)
  {
    v6 = v3;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (char **)v4;
      else
        v9 = (char **)(v4 + 8);
      if (!v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *((_DWORD *)v6 + 8) <= a2 && (v6[50] & 1) == 0)
      return *((unsigned int *)v6 + 10);
  }
  return a3;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum(uint64_t **a1, int a2, char a3, int a4, uint64_t *a5)
{
  uint64_t **result;
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  result[7] = a5;
  if (v9)
  {
    *((_BYTE *)result + 48) = a3;
    *((_BYTE *)result + 49) = 0;
  }
  *((_BYTE *)result + 50) &= 0xF0u;
  *((_DWORD *)result + 10) = a4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedEnum(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 346);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(unsigned int *)(**((_QWORD **)v6 + 5) + 4 * a3);
}

void sub_208FE9D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetRepeatedEnum(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 353);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v14, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  *(_DWORD *)(**((_QWORD **)v8 + 5) + 4 * a3) = a4;
}

void sub_208FE9E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum(uint64_t **a1, int a2, char a3, char a4, int a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  result = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v11 = result;
  *(_QWORD *)(result + 56) = a6;
  if (v12)
  {
    *(_BYTE *)(result + 48) = a3;
    *(_BYTE *)(result + 49) = 1;
    *(_BYTE *)(result + 51) = a4;
    result = operator new();
    v13 = (_DWORD *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(v11 + 40) = result;
  }
  else
  {
    v13 = *(_DWORD **)(result + 40);
  }
  v14 = v13[2];
  if (v14 == v13[3])
  {
    result = (uint64_t)wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v13, v14 + 1);
    v14 = v13[2];
  }
  v15 = *(_QWORD *)v13;
  v13[2] = v14 + 1;
  *(_DWORD *)(v15 + 4 * v14) = a5;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetString(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t *v9;

  v5 = *(_QWORD *)(a1 + 8);
  v3 = a1 + 8;
  v4 = v5;
  if (v5)
  {
    v6 = v3;
    do
    {
      v7 = *(_DWORD *)(v4 + 32);
      v8 = v7 < a2;
      if (v7 >= a2)
        v9 = (uint64_t *)v4;
      else
        v9 = (uint64_t *)(v4 + 8);
      if (!v8)
        v6 = v4;
      v4 = *v9;
    }
    while (*v9);
    if (v6 != v3 && *(_DWORD *)(v6 + 32) <= a2 && (*(_BYTE *)(v6 + 50) & 1) == 0)
      return *(_QWORD *)(v6 + 40);
  }
  return a3;
}

uint64_t *wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(uint64_t **a1, int a2, char a3, uint64_t *a4)
{
  uint64_t **v6;
  uint64_t **v7;
  char v8;
  uint64_t *result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v10 = a2;
  v6 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v10, (uint64_t)&v10);
  v7 = v6;
  v6[7] = a4;
  if (v8)
  {
    *((_BYTE *)v6 + 48) = a3;
    *((_BYTE *)v6 + 49) = 0;
    result = (uint64_t *)operator new();
    result[1] = 0;
    result[2] = 0;
    *result = 0;
    v7[5] = result;
  }
  else
  {
    result = v6[5];
  }
  *((_BYTE *)v7 + 50) &= 0xF0u;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedString(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 407);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(_QWORD *)(**((_QWORD **)v6 + 5) + 8 * a3);
}

void sub_208FEA0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedString(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 414);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(_QWORD *)(**((_QWORD **)v6 + 5) + 8 * a3);
}

void sub_208FEA1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString(uint64_t **a1, int a2, char a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  v6 = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v7 = v6;
  *(_QWORD *)(v6 + 56) = a4;
  if (v8)
  {
    *(_BYTE *)(v6 + 48) = a3;
    *(_BYTE *)(v6 + 49) = 1;
    *(_BYTE *)(v6 + 51) = 0;
    v6 = operator new();
    v9 = (int *)v6;
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0;
    *(_DWORD *)(v6 + 16) = 0;
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(int **)(v6 + 40);
  }
  v10 = v9[3];
  v11 = v9[2];
  if ((int)v11 >= v10)
  {
    if (v10 == v9[4])
    {
      v6 = (uint64_t)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v9, v10 + 1);
      v10 = v9[3];
    }
    v9[3] = v10 + 1;
    result = wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New((wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)v6);
    v14 = *(_QWORD *)v9;
    v15 = v9[2];
    v9[2] = v15 + 1;
    *(_QWORD *)(v14 + 8 * v15) = result;
  }
  else
  {
    v12 = *(_QWORD *)v9;
    v9[2] = v11 + 1;
    return *(_QWORD **)(v12 + 8 * v11);
  }
  return result;
}

const wireless_diagnostics::google::protobuf::MessageLite *wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;

  v5 = (char *)*((_QWORD *)this + 1);
  v3 = (char *)this + 8;
  v4 = v5;
  if (!v5)
    return a3;
  v6 = v3;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v3 || *((_DWORD *)v6 + 8) > a2)
    return a3;
  if ((v6[50] & 0x10) == 0)
    return (const wireless_diagnostics::google::protobuf::MessageLite *)*((_QWORD *)v6 + 5);
  return (const wireless_diagnostics::google::protobuf::MessageLite *)(*(uint64_t (**)(_QWORD, const wireless_diagnostics::google::protobuf::MessageLite *))(**((_QWORD **)v6 + 5) + 24))(*((_QWORD *)v6 + 5), a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage(uint64_t **a1, int a2, char a3, uint64_t a4, uint64_t *a5)
{
  uint64_t **v8;
  uint64_t **v9;
  char v10;
  uint64_t result;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v14 = 0;
  v15 = 0;
  v16 = 0;
  v13 = a2;
  v8 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v13, (uint64_t)&v13);
  v9 = v8;
  v8[7] = a5;
  if (v10)
  {
    *((_BYTE *)v8 + 48) = a3;
    *((_BYTE *)v8 + 49) = 0;
    *((_BYTE *)v8 + 50) &= 0xFu;
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a4 + 24))(a4);
    v9[5] = (uint64_t *)result;
    *((_BYTE *)v9 + 50) &= 0xF0u;
  }
  else
  {
    v12 = *((_BYTE *)v8 + 50);
    *((_BYTE *)v8 + 50) = v12 & 0xF0;
    result = (uint64_t)v8[5];
    if ((v12 & 0x10) != 0)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)result + 32))(result, a4);
  }
  return result;
}

uint64_t **wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetAllocatedMessage(uint64_t **a1, int a2, char a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t **result;
  uint64_t **v9;
  char v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v12 = a2;
    result = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v12, (uint64_t)&v12);
    v9 = result;
    result[7] = a4;
    if (v10)
    {
      *((_BYTE *)result + 48) = a3;
      *((_BYTE *)result + 49) = 0;
      *((_BYTE *)result + 50) &= 0xFu;
    }
    else
    {
      v11 = *((_BYTE *)result + 50);
      result = (uint64_t **)result[5];
      if ((v11 & 0x10) != 0)
      {
        result = (uint64_t **)((uint64_t (*)(uint64_t **, uint64_t *))(*result)[5])(result, a5);
        goto LABEL_5;
      }
      if (result)
        result = (uint64_t **)((uint64_t (*)(uint64_t **))(*result)[1])(result);
    }
    v9[5] = a5;
LABEL_5:
    *((_BYTE *)v9 + 50) &= 0xF0u;
    return result;
  }
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ClearExtension((wireless_diagnostics::google::protobuf::internal::ExtensionSet *)a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  char *v3;
  char *v5;
  int v6;
  BOOL v7;
  char **v8;
  uint64_t v9;
  uint64_t v11;
  int v12;

  v12 = a2;
  v3 = (char *)*((_QWORD *)this + 1);
  if (!v3)
    return 0;
  v5 = (char *)this + 8;
  do
  {
    v6 = *((_DWORD *)v3 + 8);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (char **)v3;
    else
      v8 = (char **)(v3 + 8);
    if (!v7)
      v5 = v3;
    v3 = *v8;
  }
  while (*v8);
  if (v5 == (char *)this + 8 || *((_DWORD *)v5 + 8) > a2)
    return 0;
  v9 = *((_QWORD *)v5 + 5);
  if ((v5[50] & 0x10) != 0)
  {
    v9 = (*(uint64_t (**)(_QWORD, const wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)v9 + 48))(*((_QWORD *)v5 + 5), a3);
    v11 = *((_QWORD *)v5 + 5);
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  }
  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__erase_unique<int>((uint64_t)this, &v12);
  return v9;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::GetRepeatedMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 539);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(_QWORD *)(**((_QWORD **)v6 + 5) + 8 * a3);
}

void sub_208FEA604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableRepeatedMessage(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3)
{
  char *v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char **v9;
  std::string *v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (!v4)
    goto LABEL_11;
  v6 = (char *)this + 8;
  do
  {
    v7 = *((_DWORD *)v4 + 8);
    v8 = v7 < a2;
    if (v7 >= a2)
      v9 = (char **)v4;
    else
      v9 = (char **)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v5 || *((_DWORD *)v6 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 546);
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: iter != extensions_.end(): ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v13, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v11);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    v6 = v5;
  }
  return *(_QWORD *)(**((_QWORD **)v6 + 5) + 8 * a3);
}

void sub_208FEA6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage(uint64_t **a1, int a2, char a3, uint64_t a4, uint64_t *a5)
{
  uint64_t **v8;
  uint64_t **v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = a2;
  v8 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(a1, &v16, (uint64_t)&v16);
  v9 = v8;
  v8[7] = a5;
  if (v10)
  {
    *((_BYTE *)v8 + 48) = a3;
    *((_BYTE *)v8 + 49) = 1;
    v11 = operator new();
    *(_QWORD *)v11 = 0;
    *(_QWORD *)(v11 + 8) = 0;
    *(_DWORD *)(v11 + 16) = 0;
    v9[5] = (uint64_t *)v11;
  }
  else
  {
    v11 = (uint64_t)v8[5];
  }
  v12 = *(int *)(v11 + 8);
  if ((int)v12 >= *(_DWORD *)(v11 + 12)
    || (v13 = *(_QWORD *)v11, *(_DWORD *)(v11 + 8) = v12 + 1, (v14 = *(_QWORD *)(v13 + 8 * v12)) == 0))
  {
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a4 + 24))(a4);
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>((int *)v9[5], v14);
  }
  return v14;
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::RemoveLast(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  char *v2;
  char *v3;
  char *v4;
  int v5;
  BOOL v6;
  char **v7;
  std::string *v8;
  std::string *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  std::string v18[2];

  v3 = (char *)this + 8;
  v2 = (char *)*((_QWORD *)this + 1);
  if (!v2)
    goto LABEL_11;
  v4 = (char *)this + 8;
  do
  {
    v5 = *((_DWORD *)v2 + 8);
    v6 = v5 < a2;
    if (v5 >= a2)
      v7 = (char **)v2;
    else
      v7 = (char **)(v2 + 8);
    if (!v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == v3 || *((_DWORD *)v4 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 585);
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v18, "CHECK failed: iter != extensions_.end(): ");
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v17, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v18[0].__r_.__value_.__l.__data_);
    v4 = v3;
  }
  switch(v4[48])
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      --*(_DWORD *)(*((_QWORD *)v4 + 5) + 8);
      break;
    case 9:
    case 12:
      v10 = (uint64_t *)*((_QWORD *)v4 + 5);
      v11 = *v10;
      v12 = *((int *)v10 + 2) - 1;
      *((_DWORD *)v10 + 2) = v12;
      v13 = *(_QWORD *)(v11 + 8 * v12);
      if (*(char *)(v13 + 23) < 0)
      {
        **(_BYTE **)v13 = 0;
        *(_QWORD *)(v13 + 8) = 0;
      }
      else
      {
        *(_BYTE *)v13 = 0;
        *(_BYTE *)(v13 + 23) = 0;
      }
      break;
    case 10:
    case 11:
      v14 = (uint64_t *)*((_QWORD *)v4 + 5);
      v15 = *v14;
      v16 = *((int *)v14 + 2) - 1;
      *((_DWORD *)v14 + 2) = v16;
      (*(void (**)(_QWORD))(**(_QWORD **)(v15 + 8 * v16) + 32))(*(_QWORD *)(v15 + 8 * v16));
      break;
    default:
      return;
  }
}

void sub_208FEA920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ReleaseLast(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2)
{
  char *v2;
  char *v3;
  char *v4;
  int v5;
  BOOL v6;
  char **v7;
  std::string *v8;
  std::string *v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t result;
  char v15;
  std::string v16[2];

  v3 = (char *)this + 8;
  v2 = (char *)*((_QWORD *)this + 1);
  if (!v2)
    goto LABEL_11;
  v4 = (char *)this + 8;
  do
  {
    v5 = *((_DWORD *)v2 + 8);
    v6 = v5 < a2;
    if (v5 >= a2)
      v7 = (char **)v2;
    else
      v7 = (char **)(v2 + 8);
    if (!v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == v3 || *((_DWORD *)v4 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 626);
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: iter != extensions_.end(): ");
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v8, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v15, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    v4 = v3;
  }
  v10 = (uint64_t *)*((_QWORD *)v4 + 5);
  v11 = *v10;
  v12 = *((_DWORD *)v10 + 3);
  v13 = *((int *)v10 + 2);
  *((_DWORD *)v10 + 2) = v13 - 1;
  result = *(_QWORD *)(v11 + 8 * (v13 - 1));
  *((_DWORD *)v10 + 3) = v12 - 1;
  if ((int)v13 < v12)
    *(_QWORD *)(v11 + 8 * (v13 - 1)) = *(_QWORD *)(v11 + 8 * (v12 - 1));
  return result;
}

void sub_208FEAA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SwapElements(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, int a4)
{
  char *v6;
  char *v7;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char v23;
  char v24;
  std::string v25[2];

  v7 = (char *)this + 8;
  v6 = (char *)*((_QWORD *)this + 1);
  if (!v6)
    goto LABEL_11;
  v8 = (char *)this + 8;
  do
  {
    v9 = *((_DWORD *)v6 + 8);
    v10 = v9 < a2;
    if (v9 >= a2)
      v11 = (char **)v6;
    else
      v11 = (char **)(v6 + 8);
    if (!v10)
      v8 = v6;
    v6 = *v11;
  }
  while (*v11);
  if (v8 == v7 || *((_DWORD *)v8 + 8) > a2)
  {
LABEL_11:
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 636);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: iter != extensions_.end(): ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Index out-of-bounds (field is empty).");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v24, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    v8 = v7;
  }
  switch(v8[48])
  {
    case 1:
      v18 = **((_QWORD **)v8 + 5);
      v19 = *(_QWORD *)(v18 + 8 * a3);
      *(_QWORD *)(v18 + 8 * a3) = *(_QWORD *)(v18 + 8 * a4);
      *(_QWORD *)(v18 + 8 * a4) = v19;
      break;
    case 2:
      v20 = **((_QWORD **)v8 + 5);
      v21 = *(_DWORD *)(v20 + 4 * a3);
      *(_DWORD *)(v20 + 4 * a3) = *(_DWORD *)(v20 + 4 * a4);
      *(_DWORD *)(v20 + 4 * a4) = v21;
      break;
    case 3:
    case 4:
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 16:
    case 18:
      v14 = **((_QWORD **)v8 + 5);
      v15 = *(_QWORD *)(v14 + 8 * a3);
      *(_QWORD *)(v14 + 8 * a3) = *(_QWORD *)(v14 + 8 * a4);
      *(_QWORD *)(v14 + 8 * a4) = v15;
      break;
    case 5:
    case 7:
    case 13:
    case 14:
    case 15:
    case 17:
      v16 = **((_QWORD **)v8 + 5);
      v17 = *(_DWORD *)(v16 + 4 * a3);
      *(_DWORD *)(v16 + 4 * a3) = *(_DWORD *)(v16 + 4 * a4);
      *(_DWORD *)(v16 + 4 * a4) = v17;
      break;
    case 8:
      v22 = **((_QWORD **)v8 + 5);
      v23 = *(_BYTE *)(v22 + a3);
      *(_BYTE *)(v22 + a3) = *(_BYTE *)(v22 + a4);
      *(_BYTE *)(v22 + a4) = v23;
      break;
    default:
      return;
  }
}

void sub_208FEABA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MergeFrom(uint64_t this, const wireless_diagnostics::google::protobuf::internal::ExtensionSet **a2)
{
  const wireless_diagnostics::google::protobuf::internal::ExtensionSet **v2;
  const wireless_diagnostics::google::protobuf::internal::ExtensionSet *v3;
  uint64_t **v4;
  int v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  int v12;
  _DWORD *v13;
  void *v14;
  const void *v15;
  size_t v16;
  const wireless_diagnostics::google::protobuf::internal::ExtensionSet *v17;
  const wireless_diagnostics::google::protobuf::internal::ExtensionSet **v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const std::string *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  std::string *v35;
  uint64_t v36;
  uint64_t v37;
  const std::string *v38;
  std::string *v39;
  int v40;
  uint64_t *v41;
  uint64_t **v42;
  uint64_t **v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v2 = a2 + 1;
  v3 = *a2;
  if (*a2 != (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)(a2 + 1))
  {
    v4 = (uint64_t **)this;
    while (1)
    {
      if (*((_BYTE *)v3 + 49))
      {
        v5 = *((_DWORD *)v3 + 8);
        v6 = *((_QWORD *)v3 + 7);
        v53 = 0;
        v54 = 0;
        v55 = 0;
        v52 = v5;
        this = (uint64_t)std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(v4, &v52, (uint64_t)&v52);
        v8 = this;
        *(_QWORD *)(this + 56) = v6;
        if (v7)
        {
          *(_BYTE *)(this + 48) = *((_BYTE *)v3 + 48);
          *(_BYTE *)(this + 51) = *((_BYTE *)v3 + 51);
          *(_BYTE *)(this + 49) = 1;
        }
        switch(*((_BYTE *)v3 + 48))
        {
          case 1:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v9 = *((_QWORD *)v3 + 5);
            v12 = *(_DWORD *)(v9 + 8);
            if (v12)
              goto LABEL_29;
            break;
          case 2:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v9 = *((_QWORD *)v3 + 5);
            v10 = *(_DWORD *)(v9 + 8);
            if (v10)
              goto LABEL_33;
            break;
          case 3:
          case 0x10:
          case 0x12:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v9 = *((_QWORD *)v3 + 5);
            v12 = *(_DWORD *)(v9 + 8);
            if (v12)
              goto LABEL_29;
            break;
          case 4:
          case 6:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v9 = *((_QWORD *)v3 + 5);
            v12 = *(_DWORD *)(v9 + 8);
            if (v12)
            {
LABEL_29:
              v13 = *(_DWORD **)(v8 + 40);
              wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(v13, v13[2] + v12);
              v14 = (void *)(*(_QWORD *)v13 + 8 * (int)v13[2]);
              v15 = *(const void **)v9;
              v16 = 8 * *(int *)(v9 + 8);
              goto LABEL_34;
            }
            break;
          case 5:
          case 0xE:
          case 0xF:
          case 0x11:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v9 = *((_QWORD *)v3 + 5);
            v10 = *(_DWORD *)(v9 + 8);
            if (v10)
              goto LABEL_33;
            break;
          case 7:
          case 0xD:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v9 = *((_QWORD *)v3 + 5);
            v10 = *(_DWORD *)(v9 + 8);
            if (v10)
            {
LABEL_33:
              v13 = *(_DWORD **)(v8 + 40);
              wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(v13, v13[2] + v10);
              v14 = (void *)(*(_QWORD *)v13 + 4 * (int)v13[2]);
              v15 = *(const void **)v9;
              v16 = 4 * *(int *)(v9 + 8);
              goto LABEL_34;
            }
            break;
          case 8:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v9 = *((_QWORD *)v3 + 5);
            v20 = *(_DWORD *)(v9 + 8);
            if (v20)
            {
              v13 = *(_DWORD **)(v8 + 40);
              wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(v13, v13[2] + v20);
              v14 = (void *)(*(_QWORD *)v13 + (int)v13[2]);
              v15 = *(const void **)v9;
              v16 = *(int *)(v9 + 8);
LABEL_34:
              this = (uint64_t)memcpy(v14, v15, v16);
              v13[2] += *(_DWORD *)(v9 + 8);
            }
            break;
          case 9:
          case 0xC:
            if (v7)
            {
              v21 = operator new();
              *(_QWORD *)v21 = 0;
              *(_QWORD *)(v21 + 8) = 0;
              *(_DWORD *)(v21 + 16) = 0;
              *(_QWORD *)(v8 + 40) = v21;
            }
            else
            {
              v21 = *(_QWORD *)(this + 40);
            }
            v29 = *((_QWORD *)v3 + 5);
            this = (uint64_t)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)v21, *(_DWORD *)(v29 + 8) + *(_DWORD *)(v21 + 8));
            if (*(int *)(v29 + 8) >= 1)
            {
              v30 = 0;
              do
              {
                v31 = *(const std::string **)(*(_QWORD *)v29 + 8 * v30);
                v32 = *(_DWORD *)(v21 + 12);
                v33 = *(int *)(v21 + 8);
                if ((int)v33 >= v32)
                {
                  if (v32 == *(_DWORD *)(v21 + 16))
                  {
                    this = (uint64_t)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)v21, v32 + 1);
                    v32 = *(_DWORD *)(v21 + 12);
                  }
                  *(_DWORD *)(v21 + 12) = v32 + 1;
                  v35 = (std::string *)wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New((wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)this);
                  v36 = *(_QWORD *)v21;
                  v37 = *(int *)(v21 + 8);
                  *(_DWORD *)(v21 + 8) = v37 + 1;
                  *(_QWORD *)(v36 + 8 * v37) = v35;
                }
                else
                {
                  v34 = *(_QWORD *)v21;
                  *(_DWORD *)(v21 + 8) = v33 + 1;
                  v35 = *(std::string **)(v34 + 8 * v33);
                }
                this = (uint64_t)std::string::operator=(v35, v31);
                ++v30;
              }
              while (v30 < *(int *)(v29 + 8));
            }
            break;
          case 0xA:
          case 0xB:
            if (v7)
            {
              this = operator new();
              *(_QWORD *)this = 0;
              *(_QWORD *)(this + 8) = 0;
              *(_DWORD *)(this + 16) = 0;
              *(_QWORD *)(v8 + 40) = this;
            }
            v22 = *((_QWORD *)v3 + 5);
            if (*(int *)(v22 + 8) >= 1)
            {
              v23 = 0;
              do
              {
                v24 = *(_QWORD *)(*(_QWORD *)v22 + 8 * v23);
                v25 = *(uint64_t **)(v8 + 40);
                v26 = *((int *)v25 + 2);
                if ((int)v26 >= *((_DWORD *)v25 + 3)
                  || (v27 = *v25, *((_DWORD *)v25 + 2) = v26 + 1, (v28 = *(_QWORD *)(v27 + 8 * v26)) == 0))
                {
                  v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
                  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(*(int **)(v8 + 40), v28);
                }
                this = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v28 + 56))(v28, v24);
                ++v23;
              }
              while (v23 < *(int *)(v22 + 8));
            }
            break;
          default:
            goto LABEL_35;
        }
        goto LABEL_35;
      }
      if ((*((_BYTE *)v3 + 50) & 1) == 0)
        break;
LABEL_35:
      v17 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)*((_QWORD *)v3 + 1);
      if (v17)
      {
        do
        {
          v18 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v17;
          v17 = *(const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet **)*((_QWORD *)v3 + 2);
          v19 = *v18 == v3;
          v3 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v18;
        }
        while (!v19);
      }
      v3 = (const wireless_diagnostics::google::protobuf::internal::ExtensionSet *)v18;
      if (v18 == v2)
        return this;
    }
    v11 = *((_BYTE *)v3 + 48);
    switch(v11)
    {
      case 1:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 7), *((double *)v3 + 5));
        goto LABEL_35;
      case 2:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 7), *((float *)v3 + 10));
        goto LABEL_35;
      case 3:
      case 16:
      case 18:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 5), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 4:
      case 6:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 5), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 5:
      case 15:
      case 17:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32(v4, *((_DWORD *)v3 + 8), v11, *((_DWORD *)v3 + 10), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 7:
      case 13:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32(v4, *((_DWORD *)v3 + 8), v11, *((_DWORD *)v3 + 10), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 8:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool(v4, *((_DWORD *)v3 + 8), v11, *((_BYTE *)v3 + 40), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      case 9:
      case 12:
        v38 = (const std::string *)*((_QWORD *)v3 + 5);
        v39 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(v4, *((_DWORD *)v3 + 8), v11, *((uint64_t **)v3 + 7));
        this = (uint64_t)std::string::operator=(v39, v38);
        goto LABEL_35;
      case 10:
      case 11:
        v40 = *((_DWORD *)v3 + 8);
        v41 = (uint64_t *)*((_QWORD *)v3 + 7);
        v53 = 0;
        v54 = 0;
        v55 = 0;
        v52 = v40;
        v42 = std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(v4, &v52, (uint64_t)&v52);
        v43 = v42;
        v42[7] = v41;
        if (v44)
        {
          *((_BYTE *)v42 + 48) = *((_BYTE *)v3 + 48);
          *((_BYTE *)v42 + 51) = *((_BYTE *)v3 + 51);
          *((_BYTE *)v42 + 49) = 0;
          v45 = *((_BYTE *)v42 + 50) & 0xF;
          if ((*((_BYTE *)v3 + 50) & 0x10) == 0)
          {
            *((_BYTE *)v42 + 50) = v45;
            v46 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)v3 + 5) + 24))(*((_QWORD *)v3 + 5));
            v43[5] = (uint64_t *)v46;
LABEL_85:
            this = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v46 + 56))(v46, *((_QWORD *)v3 + 5));
            goto LABEL_87;
          }
          *((_BYTE *)v42 + 50) = v45 | 0x10;
          v50 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)v3 + 5) + 16))(*((_QWORD *)v3 + 5));
          v43[5] = (uint64_t *)v50;
          this = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v50 + 80))(v50, *((_QWORD *)v3 + 5));
        }
        else
        {
          v47 = v42[5];
          v48 = *((_QWORD *)v3 + 5);
          if ((*((_BYTE *)v3 + 50) & 0x10) != 0)
          {
            if ((*((_BYTE *)v42 + 50) & 0x10) != 0)
            {
              this = (*(uint64_t (**)(uint64_t *, uint64_t))(*v47 + 80))(v47, v48);
            }
            else
            {
              v51 = (*(uint64_t (**)(_QWORD, uint64_t *))(*(_QWORD *)v48 + 24))(*((_QWORD *)v3 + 5), v42[5]);
              this = (*(uint64_t (**)(uint64_t *, uint64_t))(*v47 + 56))(v47, v51);
            }
            goto LABEL_87;
          }
          v49 = *v47;
          if ((*((_BYTE *)v42 + 50) & 0x10) != 0)
          {
            v46 = (*(uint64_t (**)(uint64_t *, uint64_t))(v49 + 32))(v42[5], v48);
            goto LABEL_85;
          }
          this = (*(uint64_t (**)(uint64_t *, uint64_t))(v49 + 56))(v47, v48);
        }
LABEL_87:
        *((_BYTE *)v43 + 50) &= 0xF0u;
        goto LABEL_35;
      case 14:
        this = (uint64_t)wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum(v4, *((_DWORD *)v3 + 8), v11, *((_DWORD *)v3 + 10), *((uint64_t **)v3 + 7));
        goto LABEL_35;
      default:
        goto LABEL_35;
    }
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::FindExtensionInfoFromTag(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int *a4, unsigned __int8 *a5)
{
  char v6;
  int v7;
  BOOL v8;
  int v9;

  v6 = a2;
  *a4 = a2 >> 3;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a3 + 16))(a3))
  {
    v7 = v6 & 7;
    if (a5[2])
      v8 = v7 == 2;
    else
      v8 = v7 == wireless_diagnostics::google::protobuf::internal::WireFormatLite::kWireTypeForFieldType[*a5];
    v9 = !v8;
  }
  else
  {
    v9 = 1;
  }
  return v9 ^ 1u;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(uint64_t **this, uint64_t a2, char **a3, wireless_diagnostics::google::protobuf::internal::ExtensionFinder *a4, wireless_diagnostics::google::protobuf::internal::FieldSkipper *a5)
{
  wireless_diagnostics::google::protobuf::internal::WireFormatLite *v9;
  int v10;
  _BYTE v12[32];

  v9 = (wireless_diagnostics::google::protobuf::internal::WireFormatLite *)(a2 >> 3);
  if ((*(unsigned int (**)(wireless_diagnostics::google::protobuf::internal::ExtensionFinder *, wireless_diagnostics::google::protobuf::internal::WireFormatLite *, _BYTE *))(*(_QWORD *)a4 + 16))(a4, v9, v12))
  {
    v10 = a2 & 7;
    if (v12[2])
    {
      if (v10 == 2)
        return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo(this, v9, (uint64_t)v12, a3, (uint64_t)a5);
    }
    else if (v10 == wireless_diagnostics::google::protobuf::internal::WireFormatLite::kWireTypeForFieldType[v12[0]])
    {
      return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo(this, v9, (uint64_t)v12, a3, (uint64_t)a5);
    }
  }
  return (*(uint64_t (**)(wireless_diagnostics::google::protobuf::internal::FieldSkipper *, char **, uint64_t))(*(_QWORD *)a5 + 16))(a5, a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo(uint64_t **a1, wireless_diagnostics::google::protobuf::internal::WireFormatLite *a2, uint64_t a3, char **this, uint64_t a5)
{
  char *v9;
  unsigned int v10;
  uint64_t result;
  int v12;
  std::string *v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  int v25;
  char *v26;
  uint64_t v27;
  char *v28;
  std::string::size_type v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t **v32;
  int v33;
  char v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t **v37;
  int v38;
  char v39;
  int data;
  uint64_t *v41;
  uint64_t **v42;
  int v43;
  char v44;
  int v45;
  uint64_t *v46;
  uint64_t **v47;
  int v48;
  char v49;
  uint64_t *v50;
  std::string *v51;
  uint64_t v52;
  uint64_t *v53;
  wireless_diagnostics::google::protobuf::io::CodedInputStream *v54;
  wireless_diagnostics::google::protobuf::MessageLite *v55;
  uint64_t v56;
  uint64_t *v57;
  wireless_diagnostics::google::protobuf::io::CodedInputStream *v58;
  wireless_diagnostics::google::protobuf::MessageLite *v59;
  uint64_t *v60;
  std::string *v61;
  uint64_t data_low;
  char v64;
  std::string v65[2];
  unsigned int v66;

  if (!*(_BYTE *)(a3 + 2))
  {
    switch(*(_BYTE *)a3)
    {
      case 1:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!(_DWORD)result)
          return result;
        if (*(_BYTE *)(a3 + 1))
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble(a1, (int)a2, 1, 0, *(_QWORD *)(a3 + 24), *(double *)&v65[0].__r_.__value_.__l.__data_);
        else
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetDouble(a1, (int)a2, 1, *(uint64_t **)(a3 + 24), *(double *)&v65[0].__r_.__value_.__l.__data_);
        return 1;
      case 2:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        if (*(_BYTE *)(a3 + 1))
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat(a1, (int)a2, 2, 0, *(_QWORD *)(a3 + 24), *(float *)&v65[0].__r_.__value_.__l.__data_);
        else
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetFloat(a1, (int)a2, 2, *(uint64_t **)(a3 + 24), *(float *)&v65[0].__r_.__value_.__l.__data_);
        return 1;
      case 3:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!(_DWORD)result)
          return result;
        v30 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v31 = *(uint64_t **)(a3 + 24);
        v32 = a1;
        v33 = (int)a2;
        v34 = 3;
        if (!*(_BYTE *)(a3 + 1))
          goto LABEL_110;
        goto LABEL_152;
      case 4:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!(_DWORD)result)
          return result;
        v35 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v36 = *(uint64_t **)(a3 + 24);
        v37 = a1;
        v38 = (int)a2;
        v39 = 4;
        if (!*(_BYTE *)(a3 + 1))
          goto LABEL_113;
        goto LABEL_119;
      case 5:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        data = (int)v65[0].__r_.__value_.__l.__data_;
        v41 = *(uint64_t **)(a3 + 24);
        v42 = a1;
        v43 = (int)a2;
        v44 = 5;
        if (!*(_BYTE *)(a3 + 1))
          goto LABEL_116;
        goto LABEL_149;
      case 6:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!(_DWORD)result)
          return result;
        v35 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v36 = *(uint64_t **)(a3 + 24);
        v37 = a1;
        v38 = (int)a2;
        v39 = 6;
        if (*(_BYTE *)(a3 + 1))
LABEL_119:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(v37, v38, v39, 0, (uint64_t)v35, (uint64_t)v36);
        else
LABEL_113:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt64(v37, v38, v39, v35, v36);
        return 1;
      case 7:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        v45 = (int)v65[0].__r_.__value_.__l.__data_;
        v46 = *(uint64_t **)(a3 + 24);
        v47 = a1;
        v48 = (int)a2;
        v49 = 7;
        if (*(_BYTE *)(a3 + 1))
          goto LABEL_122;
        goto LABEL_136;
      case 8:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        if (*(_BYTE *)(a3 + 1))
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool(a1, (int)a2, 8, 0, LODWORD(v65[0].__r_.__value_.__l.__data_) != 0, *(_QWORD *)(a3 + 24));
        else
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetBool(a1, (int)a2, 8, LODWORD(v65[0].__r_.__value_.__l.__data_) != 0, *(uint64_t **)(a3 + 24));
        return 1;
      case 9:
        v50 = *(uint64_t **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1))
          v51 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString(a1, (int)a2, 9, (uint64_t)v50);
        else
          v51 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(a1, (int)a2, 9, v50);
        return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString((uint64_t)this, v51);
      case 0xA:
        v52 = *(_QWORD *)(a3 + 8);
        v53 = *(uint64_t **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1))
          v54 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage(a1, (int)a2, 10, v52, v53);
        else
          v54 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage(a1, (int)a2, 10, v52, v53);
        return (wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadGroup(a2, this, v54, v55) & 1) != 0;
      case 0xB:
        v56 = *(_QWORD *)(a3 + 8);
        v57 = *(uint64_t **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1))
          v58 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddMessage(a1, (int)a2, 11, v56, v57);
        else
          v58 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableMessage(a1, (int)a2, 11, v56, v57);
        result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)this, v58, v59);
        if ((_DWORD)result)
          return 1;
        return result;
      case 0xC:
        v60 = *(uint64_t **)(a3 + 24);
        if (*(_BYTE *)(a3 + 1))
          v61 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddString(a1, (int)a2, 12, (uint64_t)v60);
        else
          v61 = (std::string *)wireless_diagnostics::google::protobuf::internal::ExtensionSet::MutableString(a1, (int)a2, 12, v60);
        return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes((uint64_t)this, v61);
      case 0xD:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        v45 = (int)v65[0].__r_.__value_.__l.__data_;
        v46 = *(uint64_t **)(a3 + 24);
        v47 = a1;
        v48 = (int)a2;
        v49 = 13;
        if (*(_BYTE *)(a3 + 1))
LABEL_122:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(v47, v48, v49, 0, v45, (uint64_t)v46);
        else
LABEL_136:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetUInt32(v47, v48, v49, v45, v46);
        return 1;
      case 0xE:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        data_low = LODWORD(v65[0].__r_.__value_.__l.__data_);
        if (((*(uint64_t (**)(_QWORD, _QWORD))(a3 + 8))(*(_QWORD *)(a3 + 16), LODWORD(v65[0].__r_.__value_.__l.__data_)) & 1) != 0)
        {
          if (*(_BYTE *)(a3 + 1))
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum(a1, (int)a2, 14, 0, data_low, *(_QWORD *)(a3 + 24));
          else
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetEnum(a1, (int)a2, 14, data_low, *(uint64_t **)(a3 + 24));
        }
        else
        {
          (*(void (**)(uint64_t, wireless_diagnostics::google::protobuf::internal::WireFormatLite *, uint64_t))(*(_QWORD *)a5 + 32))(a5, a2, data_low);
        }
        return 1;
      case 0xF:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        data = (int)v65[0].__r_.__value_.__l.__data_;
        v41 = *(uint64_t **)(a3 + 24);
        v42 = a1;
        v43 = (int)a2;
        v44 = 15;
        if (!*(_BYTE *)(a3 + 1))
          goto LABEL_116;
        goto LABEL_149;
      case 0x10:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!(_DWORD)result)
          return result;
        v30 = (uint64_t *)v65[0].__r_.__value_.__r.__words[0];
        v31 = *(uint64_t **)(a3 + 24);
        v32 = a1;
        v33 = (int)a2;
        v34 = 16;
        if (!*(_BYTE *)(a3 + 1))
          goto LABEL_110;
        goto LABEL_152;
      case 0x11:
        LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65);
        if (!(_DWORD)result)
          return result;
        data = -(v65[0].__r_.__value_.__s.__data_[0] & 1) ^ (LODWORD(v65[0].__r_.__value_.__l.__data_) >> 1);
        v41 = *(uint64_t **)(a3 + 24);
        v42 = a1;
        v43 = (int)a2;
        v44 = 17;
        if (*(_BYTE *)(a3 + 1))
LABEL_149:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(v42, v43, v44, 0, data, (uint64_t)v41);
        else
LABEL_116:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt32(v42, v43, v44, data, v41);
        break;
      case 0x12:
        v65[0].__r_.__value_.__r.__words[0] = 0;
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65);
        if (!(_DWORD)result)
          return result;
        v30 = (uint64_t *)(-(uint64_t)(v65[0].__r_.__value_.__s.__data_[0] & 1) ^ (v65[0].__r_.__value_.__r.__words[0] >> 1));
        v31 = *(uint64_t **)(a3 + 24);
        v32 = a1;
        v33 = (int)a2;
        v34 = 18;
        if (*(_BYTE *)(a3 + 1))
LABEL_152:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(v32, v33, v34, 0, (uint64_t)v30, (uint64_t)v31);
        else
LABEL_110:
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::SetInt64(v32, v33, v34, v30, v31);
        break;
      default:
        return 1;
    }
    return 1;
  }
  v66 = 0;
  v9 = this[1];
  if (v9 < this[2] && (*v9 & 0x80000000) == 0)
  {
    v10 = *v9;
    v66 = v10;
    this[1] = v9 + 1;
LABEL_11:
    v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, v10);
    switch(*(_BYTE *)a3)
    {
      case 1:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0;
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddDouble(a1, (int)a2, 1, 1, *(_QWORD *)(a3 + 24), *(double *)&v65[0].__r_.__value_.__l.__data_);
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 2:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        while (1)
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddFloat(a1, (int)a2, 2, 1, *(_QWORD *)(a3 + 24), *(float *)&v65[0].__r_.__value_.__l.__data_);
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0)
            goto LABEL_13;
        }
      case 3:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          v20 = this[1];
          if (v20 >= this[2] || *v20 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0;
            v21 = v65[0].__r_.__value_.__r.__words[0];
          }
          else
          {
            v21 = *v20;
            this[1] = v20 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(a1, (int)a2, 3, 1, v21, *(_QWORD *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 4:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          v22 = this[1];
          if (v22 >= this[2] || *v22 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0;
            v23 = v65[0].__r_.__value_.__r.__words[0];
          }
          else
          {
            v23 = *v22;
            v65[0].__r_.__value_.__r.__words[0] = v23;
            this[1] = v22 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(a1, (int)a2, 4, 1, v23, *(_QWORD *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 5:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          v14 = this[1];
          if (v14 >= this[2] || *v14 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
            v15 = (int)v65[0].__r_.__value_.__l.__data_;
          }
          else
          {
            v15 = *v14;
            this[1] = v14 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(a1, (int)a2, 5, 1, v15, *(_QWORD *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 6:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        while (1)
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0;
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt64(a1, (int)a2, 6, 1, (uint64_t)v65[0].__r_.__value_.__l.__data_, *(_QWORD *)(a3 + 24));
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0)
            goto LABEL_13;
        }
      case 7:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        while (1)
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(a1, (int)a2, 7, 1, (int)v65[0].__r_.__value_.__l.__data_, *(_QWORD *)(a3 + 24));
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0)
            goto LABEL_13;
        }
      case 8:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          v24 = this[1];
          if (v24 >= this[2] || *v24 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
            v25 = (int)v65[0].__r_.__value_.__l.__data_;
          }
          else
          {
            v25 = *v24;
            this[1] = v24 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddBool(a1, (int)a2, 8, 1, v25 != 0, *(_QWORD *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v65, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 943);
        v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v65, "Non-primitive types can't be packed.");
        wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v64, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
        wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v65[0].__r_.__value_.__l.__data_);
        goto LABEL_13;
      case 0xD:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          v16 = this[1];
          if (v16 >= this[2] || *v16 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
            v17 = (int)v65[0].__r_.__value_.__l.__data_;
          }
          else
          {
            v17 = *v16;
            LODWORD(v65[0].__r_.__value_.__l.__data_) = v17;
            this[1] = v16 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddUInt32(a1, (int)a2, 13, 1, v17, *(_QWORD *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0xE:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          v26 = this[1];
          if (v26 >= this[2] || *v26 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
            v27 = LODWORD(v65[0].__r_.__value_.__l.__data_);
          }
          else
          {
            v27 = *v26;
            this[1] = v26 + 1;
          }
          if ((*(unsigned int (**)(_QWORD, uint64_t))(a3 + 8))(*(_QWORD *)(a3 + 16), v27))
            wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddEnum(a1, (int)a2, 14, 1, v27, *(_QWORD *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0xF:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        while (1)
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(a1, (int)a2, 15, 1, (int)v65[0].__r_.__value_.__l.__data_, *(_QWORD *)(a3 + 24));
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0)
            goto LABEL_13;
        }
      case 0x10:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        while (1)
        {
          v65[0].__r_.__value_.__r.__words[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0;
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(a1, (int)a2, 16, 1, (uint64_t)v65[0].__r_.__value_.__l.__data_, *(_QWORD *)(a3 + 24));
          if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) <= 0)
            goto LABEL_13;
        }
      case 0x11:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        do
        {
          LODWORD(v65[0].__r_.__value_.__l.__data_) = 0;
          v18 = this[1];
          if (v18 >= this[2] || *v18 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unsigned int *)v65))return 0;
            v19 = v65[0].__r_.__value_.__l.__data_;
          }
          else
          {
            v19 = *v18;
            this[1] = v18 + 1;
          }
          wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt32(a1, (int)a2, 17, 1, -(v19 & 1) ^ (v19 >> 1), *(_QWORD *)(a3 + 24));
        }
        while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
        goto LABEL_13;
      case 0x12:
        if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) < 1)
          goto LABEL_13;
        break;
      default:
        goto LABEL_13;
    }
    do
    {
      v65[0].__r_.__value_.__r.__words[0] = 0;
      v28 = this[1];
      if (v28 >= this[2] || *v28 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, (unint64_t *)v65))return 0;
        v29 = v65[0].__r_.__value_.__r.__words[0];
      }
      else
      {
        v29 = *v28;
        this[1] = v28 + 1;
      }
      wireless_diagnostics::google::protobuf::internal::ExtensionSet::AddInt64(a1, (int)a2, 18, 1, -(uint64_t)(v29 & 1) ^ (v29 >> 1), *(_QWORD *)(a3 + 24));
    }
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this) > 0);
LABEL_13:
    wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v12);
    return 1;
  }
  if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)this, &v66))
  {
    v10 = v66;
    goto LABEL_11;
  }
  return 0;
}

void sub_208FEC02C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v2 >= *((_QWORD *)this + 2) || (char)*v2 < 0)
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, a2);
  *a2 = *v2;
  *((_QWORD *)this + 1) = v2 + 1;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadGroup(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, _DWORD *a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *a3, wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  int v4;
  int v5;
  int v7;
  uint64_t result;
  int v9;
  BOOL v10;
  int v11;

  v4 = a2[14];
  v5 = a2[15];
  a2[14] = v4 + 1;
  if (v4 >= v5)
    return 0;
  v7 = (int)this;
  result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(_QWORD *)a3 + 64))(a3);
  if ((_DWORD)result)
  {
    v9 = a2[14];
    v10 = __OFSUB__(v9, 1);
    v11 = v9 - 1;
    if (v11 < 0 == v10)
      a2[14] = v11;
    return a2[8] == ((8 * v7) | 4);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::MessageLite *a3)
{
  char *v5;
  uint64_t result;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  unsigned int v13;

  v13 = 0;
  v5 = (char *)*((_QWORD *)this + 1);
  if ((unint64_t)v5 >= *((_QWORD *)this + 2) || *v5 < 0)
  {
    result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v13);
    if (!(_DWORD)result)
      return result;
  }
  else
  {
    v13 = *v5;
    *((_QWORD *)this + 1) = v5 + 1;
  }
  v7 = *((_DWORD *)this + 14);
  v8 = *((_DWORD *)this + 15);
  *((_DWORD *)this + 14) = v7 + 1;
  if (v7 >= v8)
    return 0;
  v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, v13);
  result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::io::CodedInputStream *, wireless_diagnostics::google::protobuf::internal::WireFormatLite *))(*(_QWORD *)a2 + 64))(a2, this);
  if (!(_DWORD)result)
    return result;
  if (!*((_BYTE *)this + 36))
    return 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v9);
  v10 = *((_DWORD *)this + 14);
  v11 = __OFSUB__(v10, 1);
  v12 = v10 - 1;
  if (v12 < 0 == v11)
    *((_DWORD *)this + 14) = v12;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(uint64_t **this, uint64_t a2, char **a3, const wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  _QWORD v5[2];
  void *v6;

  v6 = &unk_24C0ED570;
  v5[0] = &off_24C0ED5F8;
  v5[1] = a4;
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(this, a2, a3, (wireless_diagnostics::google::protobuf::internal::ExtensionFinder *)v5, (wireless_diagnostics::google::protobuf::internal::FieldSkipper *)&v6);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizes(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  char *v4;
  char *v5;
  char *v8;
  int v9;
  BOOL v10;
  char **v11;
  wireless_diagnostics::google::protobuf::internal::WireFormatLite *v12;
  char *v13;
  char *v14;
  BOOL v15;

  v5 = (char *)this + 8;
  v4 = (char *)*((_QWORD *)this + 1);
  if (v4)
  {
    v8 = (char *)this + 8;
    do
    {
      v9 = *((_DWORD *)v4 + 8);
      v10 = v9 < a2;
      if (v9 >= a2)
        v11 = (char **)v4;
      else
        v11 = (char **)(v4 + 8);
      if (!v10)
        v8 = v4;
      v4 = *v11;
    }
    while (*v11);
    if (v8 != v5)
    {
      do
      {
        v12 = (wireless_diagnostics::google::protobuf::internal::WireFormatLite *)*((unsigned int *)v8 + 8);
        if ((int)v12 >= a3)
          break;
        wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::SerializeFieldWithCachedSizes((wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *)(v8 + 40), v12, a4, a4);
        v13 = (char *)*((_QWORD *)v8 + 1);
        if (v13)
        {
          do
          {
            v14 = v13;
            v13 = *(char **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            v14 = (char *)*((_QWORD *)v8 + 2);
            v15 = *(_QWORD *)v14 == (_QWORD)v8;
            v8 = v14;
          }
          while (!v15);
        }
        v8 = v14;
      }
      while (v14 != v5);
    }
  }
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::SerializeFieldWithCachedSizes(wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension *this, wireless_diagnostics::google::protobuf::internal::WireFormatLite *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  std::string *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  std::string v76[2];

  if (*((_BYTE *)this + 9))
  {
    if (*((_BYTE *)this + 11))
    {
      if (*((_DWORD *)this + 3))
      {
        wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)a2) | 2);
        wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, *((_DWORD *)this + 3));
        switch(*((_BYTE *)this + 8))
        {
          case 1:
            v19 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v20 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, *(_QWORD *)(*v19 + 8 * v20++));
                v19 = *(_QWORD **)this;
              }
              while (v20 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 2:
            v21 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v22 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, *(_DWORD *)(*v21 + 4 * v22++));
                v21 = *(_QWORD **)this;
              }
              while (v22 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 3:
            v23 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v24 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, *(_QWORD *)(*v23 + 8 * v24++));
                v23 = *(_QWORD **)this;
              }
              while (v24 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 4:
            v25 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v26 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, *(_QWORD *)(*v25 + 8 * v26++));
                v25 = *(_QWORD **)this;
              }
              while (v26 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 5:
            v10 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v11 = 0;
              do
              {
                v12 = *(int *)(*v10 + 4 * v11);
                if ((v12 & 0x80000000) != 0)
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, v12);
                else
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v12);
                ++v11;
                v10 = *(_QWORD **)this;
              }
              while (v11 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 6:
            v27 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v28 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, *(_QWORD *)(*v27 + 8 * v28++));
                v27 = *(_QWORD **)this;
              }
              while (v28 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 7:
            v29 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v30 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, *(_DWORD *)(*v29 + 4 * v30++));
                v29 = *(_QWORD **)this;
              }
              while (v30 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 8:
            v31 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v32 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, *(unsigned __int8 *)(*v31 + v32++));
                v31 = *(_QWORD **)this;
              }
              while (v32 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 9:
          case 0xA:
          case 0xB:
          case 0xC:
            wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v76, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 1182);
            v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v76, "Non-primitive types can't be packed.");
            wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v75, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
            wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v76[0].__r_.__value_.__l.__data_);
            break;
          case 0xD:
            v13 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v14 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, *(_DWORD *)(*v13 + 4 * v14++));
                v13 = *(_QWORD **)this;
              }
              while (v14 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 0xE:
            v33 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v34 = 0;
              do
              {
                v35 = *(int *)(*v33 + 4 * v34);
                if ((v35 & 0x80000000) != 0)
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, v35);
                else
                  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v35);
                ++v34;
                v33 = *(_QWORD **)this;
              }
              while (v34 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 0xF:
            v15 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v16 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, *(_DWORD *)(*v15 + 4 * v16++));
                v15 = *(_QWORD **)this;
              }
              while (v16 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 0x10:
            v36 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v37 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, *(_QWORD *)(*v36 + 8 * v37++));
                v36 = *(_QWORD **)this;
              }
              while (v37 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 0x11:
            v17 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v18 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (2 * *(_DWORD *)(*v17 + 4 * v18)) ^ (*(int *)(*v17 + 4 * v18) >> 31));
                ++v18;
                v17 = *(_QWORD **)this;
              }
              while (v18 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          case 0x12:
            v38 = *(_QWORD **)this;
            if (*(int *)(*(_QWORD *)this + 8) >= 1)
            {
              v39 = 0;
              do
              {
                wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, (2 * *(_QWORD *)(*v38 + 8 * v39)) ^ (*(uint64_t *)(*v38 + 8 * v39) >> 63));
                ++v39;
                v38 = *(_QWORD **)this;
              }
              while (v39 < *(int *)(*(_QWORD *)this + 8));
            }
            break;
          default:
            return;
        }
      }
    }
    else
    {
      switch(*((_BYTE *)this + 8))
      {
        case 1:
          v8 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v9 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(a2, a3, *(double *)(*v8 + 8 * v9++), a3);
              v8 = *(_QWORD **)this;
            }
            while (v9 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 2:
          v40 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v41 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(a2, a3, *(float *)(*v40 + 4 * v41++), a3);
              v40 = *(_QWORD **)this;
            }
            while (v41 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 3:
          v42 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v43 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(a2, *(_QWORD *)(*v42 + 8 * v43++), a3, a4);
              v42 = *(_QWORD **)this;
            }
            while (v43 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 4:
          v44 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v45 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(a2, *(_QWORD *)(*v44 + 8 * v45++), a3, a4);
              v44 = *(_QWORD **)this;
            }
            while (v45 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 5:
          v46 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v47 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(a2, *(_DWORD *)(*v46 + 4 * v47++), a3, a4);
              v46 = *(_QWORD **)this;
            }
            while (v47 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 6:
          v48 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v49 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(a2, *(_QWORD *)(*v48 + 8 * v49++), a3, a4);
              v48 = *(_QWORD **)this;
            }
            while (v49 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 7:
          v50 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v51 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32(a2, *(_DWORD *)(*v50 + 4 * v51++), a3, a4);
              v50 = *(_QWORD **)this;
            }
            while (v51 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 8:
          v52 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v53 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(a2, *(unsigned __int8 *)(*v52 + v53++), a3, a4);
              v52 = *(_QWORD **)this;
            }
            while (v53 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 9:
          v54 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v55 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString((int)a2, *(_QWORD *)(*v54 + 8 * v55++), a3);
              v54 = *(_QWORD **)this;
            }
            while (v55 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0xA:
          v56 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v57 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup(a2, *(_QWORD *)(*v56 + 8 * v57++), a3, a4);
              v56 = *(_QWORD **)this;
            }
            while (v57 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0xB:
          v58 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v59 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(a2, *(_QWORD *)(*v58 + 8 * v59++), a3, a4);
              v58 = *(_QWORD **)this;
            }
            while (v59 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0xC:
          v60 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v61 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes((int)a2, *(_QWORD *)(*v60 + 8 * v61++), a3);
              v60 = *(_QWORD **)this;
            }
            while (v61 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0xD:
          v62 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v63 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(a2, *(_DWORD *)(*v62 + 4 * v63++), a3, a4);
              v62 = *(_QWORD **)this;
            }
            while (v63 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0xE:
          v64 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v65 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(a2, *(_DWORD *)(*v64 + 4 * v65++), a3, a4);
              v64 = *(_QWORD **)this;
            }
            while (v65 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0xF:
          v66 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v67 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32(a2, *(_DWORD *)(*v66 + 4 * v67++), a3, a4);
              v66 = *(_QWORD **)this;
            }
            while (v67 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0x10:
          v68 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v69 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64(a2, *(_QWORD *)(*v68 + 8 * v69++), a3, a4);
              v68 = *(_QWORD **)this;
            }
            while (v69 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0x11:
          v70 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v71 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(a2, *(_DWORD *)(*v70 + 4 * v71++), a3, a4);
              v70 = *(_QWORD **)this;
            }
            while (v71 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        case 0x12:
          v72 = *(_QWORD **)this;
          if (*(int *)(*(_QWORD *)this + 8) >= 1)
          {
            v73 = 0;
            do
            {
              wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(a2, *(_QWORD *)(*v72 + 8 * v73++), a3, a4);
              v72 = *(_QWORD **)this;
            }
            while (v73 < *(int *)(*(_QWORD *)this + 8));
          }
          break;
        default:
          return;
      }
    }
  }
  else if ((*((_BYTE *)this + 10) & 1) == 0)
  {
    switch(*((_BYTE *)this + 8))
    {
      case 1:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(a2, a3, *(double *)this, a3);
        break;
      case 2:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(a2, a3, *(float *)this, a3);
        break;
      case 3:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(a2, *(_QWORD *)this, a3, a4);
        break;
      case 4:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(a2, *(_QWORD *)this, a3, a4);
        break;
      case 5:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 6:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(a2, *(_QWORD *)this, a3, a4);
        break;
      case 7:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 8:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(a2, *(unsigned __int8 *)this, a3, a4);
        break;
      case 9:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString((int)a2, *(_QWORD *)this, a3);
        break;
      case 0xA:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup(a2, *(_QWORD *)this, a3, a4);
        break;
      case 0xB:
        v74 = *(_QWORD *)this;
        if ((*((_BYTE *)this + 10) & 0x10) != 0)
          (*(void (**)(_QWORD, wireless_diagnostics::google::protobuf::internal::WireFormatLite *, wireless_diagnostics::google::protobuf::io::CodedOutputStream *))(*(_QWORD *)v74 + 104))(*(_QWORD *)this, a2, a3);
        else
          wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(a2, v74, a3, a4);
        break;
      case 0xC:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes((int)a2, *(_QWORD *)this, a3);
        break;
      case 0xD:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0xE:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0xF:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0x10:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64(a2, *(_QWORD *)this, a3, a4);
        break;
      case 0x11:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(a2, *(_DWORD *)this, a3, a4);
        break;
      case 0x12:
        wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(a2, *(_QWORD *)this, a3, a4);
        break;
      default:
        return;
    }
  }
}

void sub_208FECE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension::ByteSize(uint64_t **this, int a2)
{
  int v4;
  std::string *v5;
  unint64_t v6;
  int v7;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v8;
  int v9;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v10;
  int v11;
  int v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v20;
  int v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v28;
  int v29;
  uint64_t *v30;
  uint64_t v31;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v32;
  int v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  int v37;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v38;
  int v39;
  unint64_t v40;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v41;
  int v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  int v47;
  uint64_t v48;
  uint64_t *v49;
  int v50;
  uint64_t v51;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v52;
  int v53;
  uint64_t *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  char v59;
  uint64_t v60;
  unint64_t v61;
  int v62;
  uint64_t *v63;
  int v64;
  uint64_t v65;
  uint64_t *v66;
  int v67;
  uint64_t v68;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v69;
  int v70;
  int v71;
  uint64_t *v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  char v77;
  uint64_t v78;
  unint64_t v79;
  int v80;
  uint64_t *v81;
  int v82;
  uint64_t v83;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v84;
  int v85;
  uint64_t *v86;
  int v87;
  uint64_t v88;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v89;
  int v90;
  uint64_t *v91;
  int v92;
  uint64_t v93;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v94;
  int v95;
  uint64_t *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t (*v100)(void);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream *v102;
  int v103;
  int v104;
  char v105;
  std::string v106[2];

  if (*((_BYTE *)this + 9))
  {
    v4 = *((unsigned __int8 *)this + 8);
    if (*((_BYTE *)this + 11))
    {
      switch(*((_BYTE *)this + 8))
      {
        case 1:
        case 6:
        case 0x10:
          v6 = (8 * *((_DWORD *)*this + 2));
          goto LABEL_67;
        case 2:
        case 7:
        case 0xF:
          v6 = (4 * *((_DWORD *)*this + 2));
          goto LABEL_67;
        case 3:
          v22 = *this;
          if (*((int *)*this + 2) < 1)
            goto LABEL_5;
          v23 = 0;
          LODWORD(v6) = 0;
          do
          {
            v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(_QWORD *)(*v22 + 8 * v23++))
               + v6;
            v22 = *this;
          }
          while (v23 < *((int *)*this + 2));
          goto LABEL_67;
        case 4:
          v24 = *this;
          if (*((int *)*this + 2) < 1)
            goto LABEL_5;
          v25 = 0;
          LODWORD(v6) = 0;
          do
          {
            v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(_QWORD *)(*v24 + 8 * v25++))
               + v6;
            v24 = *this;
          }
          while (v25 < *((int *)*this + 2));
          goto LABEL_67;
        case 5:
          v26 = *this;
          if (*((int *)*this + 2) < 1)
            goto LABEL_5;
          v27 = 0;
          LODWORD(v6) = 0;
          do
          {
            v28 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v26 + 4 * v27);
            if ((v28 & 0x80000000) != 0)
            {
              v29 = 10;
            }
            else if (v28 >= 0x80)
            {
              v29 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v28);
              v26 = *this;
            }
            else
            {
              v29 = 1;
            }
            v6 = (v29 + v6);
            ++v27;
          }
          while (v27 < *((int *)v26 + 2));
          goto LABEL_67;
        case 8:
          v6 = *((unsigned int *)*this + 2);
          goto LABEL_67;
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
          wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v106, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/extension_set.cc", 1294);
          v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v106, "Non-primitive types can't be packed.");
          wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v105, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
          wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v106[0].__r_.__value_.__l.__data_);
          goto LABEL_5;
        case 0xD:
          v14 = *this;
          if (*((int *)*this + 2) < 1)
            goto LABEL_5;
          v15 = 0;
          LODWORD(v6) = 0;
          do
          {
            v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v14 + 4 * v15);
            if (v16 >= 0x80)
            {
              v17 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16);
              v14 = *this;
            }
            else
            {
              v17 = 1;
            }
            v6 = (v17 + v6);
            ++v15;
          }
          while (v15 < *((int *)v14 + 2));
          goto LABEL_67;
        case 0xE:
          v30 = *this;
          if (*((int *)*this + 2) < 1)
            goto LABEL_5;
          v31 = 0;
          LODWORD(v6) = 0;
          do
          {
            v32 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v30 + 4 * v31);
            if ((v32 & 0x80000000) != 0)
            {
              v33 = 10;
            }
            else if (v32 >= 0x80)
            {
              v33 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v32);
              v30 = *this;
            }
            else
            {
              v33 = 1;
            }
            v6 = (v33 + v6);
            ++v31;
          }
          while (v31 < *((int *)v30 + 2));
          goto LABEL_67;
        case 0x11:
          v18 = *this;
          if (*((int *)*this + 2) < 1)
            goto LABEL_5;
          v19 = 0;
          LODWORD(v6) = 0;
          do
          {
            v20 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *(_DWORD *)(*v18 + 4 * v19)) ^ (*(int *)(*v18 + 4 * v19) >> 31));
            if (v20 >= 0x80)
            {
              v21 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v20);
              v18 = *this;
            }
            else
            {
              v21 = 1;
            }
            v6 = (v21 + v6);
            ++v19;
          }
          while (v19 < *((int *)v18 + 2));
          goto LABEL_67;
        case 0x12:
          v34 = *this;
          if (*((int *)*this + 2) < 1)
            goto LABEL_5;
          v35 = 0;
          LODWORD(v6) = 0;
          do
          {
            v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64((2 * *(_QWORD *)(*v34 + 8 * v35)) ^ (*(uint64_t *)(*v34 + 8 * v35) >> 63))
               + v6;
            ++v35;
            v34 = *this;
          }
          while (v35 < *((int *)*this + 2));
LABEL_67:
          *((_DWORD *)this + 3) = v6;
          if ((int)v6 >= 1)
          {
            if (v6 >= 0x80)
              v36 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v6);
            else
              v36 = 1;
            v37 = v36 + v6;
            v38 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((8 * a2) | 2u);
            if (v38 >= 0x80)
              v39 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v38);
            else
              v39 = 1;
            v6 = (v37 + v39);
          }
          break;
        default:
LABEL_5:
          v6 = 0;
          *((_DWORD *)this + 3) = 0;
          break;
      }
    }
    else
    {
      v10 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(8 * a2);
      if (v10 >= 0x80)
        v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v10);
      else
        v11 = 1;
      v12 = v11 << (v4 == 10);
      switch(*((_BYTE *)this + 8))
      {
        case 1:
        case 6:
        case 0x10:
          v13 = v12 + 8;
          goto LABEL_21;
        case 2:
        case 7:
        case 0xF:
          v13 = v12 + 4;
LABEL_21:
          v6 = (*((_DWORD *)*this + 2) * v13);
          break;
        case 3:
          v43 = *this;
          v44 = *((_DWORD *)*this + 2);
          v6 = (v44 * v12);
          if (v44 >= 1)
          {
            v45 = 0;
            do
            {
              v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(_QWORD *)(*v43 + 8 * v45++))
                 + v6;
              v43 = *this;
            }
            while (v45 < *((int *)*this + 2));
          }
          break;
        case 4:
          v46 = *this;
          v47 = *((_DWORD *)*this + 2);
          v6 = (v47 * v12);
          if (v47 >= 1)
          {
            v48 = 0;
            do
            {
              v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*(_QWORD *)(*v46 + 8 * v48++))
                 + v6;
              v46 = *this;
            }
            while (v48 < *((int *)*this + 2));
          }
          break;
        case 5:
          v49 = *this;
          v50 = *((_DWORD *)*this + 2);
          v6 = (v50 * v12);
          if (v50 >= 1)
          {
            v51 = 0;
            do
            {
              v52 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v49 + 4 * v51);
              if ((v52 & 0x80000000) != 0)
              {
                v53 = 10;
              }
              else if (v52 >= 0x80)
              {
                v53 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v52);
                v49 = *this;
              }
              else
              {
                v53 = 1;
              }
              v6 = (v53 + v6);
              ++v51;
            }
            while (v51 < *((int *)v49 + 2));
          }
          break;
        case 8:
          v6 = (*((_DWORD *)*this + 2) + *((_DWORD *)*this + 2) * v12);
          break;
        case 9:
          v54 = *this;
          v55 = *((_DWORD *)*this + 2);
          v6 = (v55 * v12);
          if (v55 >= 1)
          {
            v56 = 0;
            do
            {
              v57 = *(_QWORD *)(*v54 + 8 * v56);
              v58 = *(unsigned __int8 *)(v57 + 23);
              v59 = v58;
              v60 = *(_QWORD *)(v57 + 8);
              if ((v58 & 0x80u) == 0)
                v61 = *(unsigned __int8 *)(v57 + 23);
              else
                v61 = v60;
              if (v61 >= 0x80)
              {
                v62 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v61);
                v58 = *(unsigned __int8 *)(v57 + 23);
                v60 = *(_QWORD *)(v57 + 8);
                v54 = *this;
                v59 = *(_BYTE *)(v57 + 23);
              }
              else
              {
                v62 = 1;
              }
              if (v59 < 0)
                v58 = v60;
              v6 = (v62 + v6 + v58);
              ++v56;
            }
            while (v56 < *((int *)v54 + 2));
          }
          break;
        case 0xA:
          v63 = *this;
          v64 = *((_DWORD *)*this + 2);
          v6 = (v64 * v12);
          if (v64 >= 1)
          {
            v65 = 0;
            do
            {
              v6 = (*(unsigned int (**)(_QWORD))(**(_QWORD **)(*v63 + 8 * v65) + 72))(*(_QWORD *)(*v63 + 8 * v65))
                 + v6;
              ++v65;
              v63 = *this;
            }
            while (v65 < *((int *)*this + 2));
          }
          break;
        case 0xB:
          v66 = *this;
          v67 = *((_DWORD *)*this + 2);
          v6 = (v67 * v12);
          if (v67 >= 1)
          {
            v68 = 0;
            do
            {
              v69 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(*v66 + 8 * v68) + 72))(*(_QWORD *)(*v66 + 8 * v68));
              v70 = (int)v69;
              if (v69 >= 0x80)
                v71 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v69);
              else
                v71 = 1;
              v6 = (v70 + v6 + v71);
              ++v68;
              v66 = *this;
            }
            while (v68 < *((int *)*this + 2));
          }
          break;
        case 0xC:
          v72 = *this;
          v73 = *((_DWORD *)*this + 2);
          v6 = (v73 * v12);
          if (v73 >= 1)
          {
            v74 = 0;
            do
            {
              v75 = *(_QWORD *)(*v72 + 8 * v74);
              v76 = *(unsigned __int8 *)(v75 + 23);
              v77 = v76;
              v78 = *(_QWORD *)(v75 + 8);
              if ((v76 & 0x80u) == 0)
                v79 = *(unsigned __int8 *)(v75 + 23);
              else
                v79 = v78;
              if (v79 >= 0x80)
              {
                v80 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v79);
                v76 = *(unsigned __int8 *)(v75 + 23);
                v78 = *(_QWORD *)(v75 + 8);
                v72 = *this;
                v77 = *(_BYTE *)(v75 + 23);
              }
              else
              {
                v80 = 1;
              }
              if (v77 < 0)
                v76 = v78;
              v6 = (v80 + v6 + v76);
              ++v74;
            }
            while (v74 < *((int *)v72 + 2));
          }
          break;
        case 0xD:
          v81 = *this;
          v82 = *((_DWORD *)*this + 2);
          v6 = (v82 * v12);
          if (v82 >= 1)
          {
            v83 = 0;
            do
            {
              v84 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v81 + 4 * v83);
              if (v84 >= 0x80)
              {
                v85 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v84);
                v81 = *this;
              }
              else
              {
                v85 = 1;
              }
              v6 = (v85 + v6);
              ++v83;
            }
            while (v83 < *((int *)v81 + 2));
          }
          break;
        case 0xE:
          v86 = *this;
          v87 = *((_DWORD *)*this + 2);
          v6 = (v87 * v12);
          if (v87 >= 1)
          {
            v88 = 0;
            do
            {
              v89 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*v86 + 4 * v88);
              if ((v89 & 0x80000000) != 0)
              {
                v90 = 10;
              }
              else if (v89 >= 0x80)
              {
                v90 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v89);
                v86 = *this;
              }
              else
              {
                v90 = 1;
              }
              v6 = (v90 + v6);
              ++v88;
            }
            while (v88 < *((int *)v86 + 2));
          }
          break;
        case 0x11:
          v91 = *this;
          v92 = *((_DWORD *)*this + 2);
          v6 = (v92 * v12);
          if (v92 >= 1)
          {
            v93 = 0;
            do
            {
              v94 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *(_DWORD *)(*v91 + 4 * v93)) ^ (*(int *)(*v91 + 4 * v93) >> 31));
              if (v94 >= 0x80)
              {
                v95 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v94);
                v91 = *this;
              }
              else
              {
                v95 = 1;
              }
              v6 = (v95 + v6);
              ++v93;
            }
            while (v93 < *((int *)v91 + 2));
          }
          break;
        case 0x12:
          v96 = *this;
          v97 = *((_DWORD *)*this + 2);
          v6 = (v97 * v12);
          if (v97 >= 1)
          {
            v98 = 0;
            do
            {
              v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64((2 * *(_QWORD *)(*v96 + 8 * v98)) ^ (*(uint64_t *)(*v96 + 8 * v98) >> 63))
                 + v6;
              ++v98;
              v96 = *this;
            }
            while (v98 < *((int *)*this + 2));
          }
          break;
        default:
          return 0;
      }
    }
  }
  else if ((*((_BYTE *)this + 10) & 1) != 0)
  {
    return 0;
  }
  else
  {
    v7 = *((unsigned __int8 *)this + 8);
    v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(8 * a2);
    if (v8 >= 0x80)
      v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
    else
      v9 = 1;
    v6 = (v9 << (v7 == 10));
    switch(*((_BYTE *)this + 8))
    {
      case 1:
      case 6:
      case 0x10:
        return (v6 + 8);
      case 2:
      case 7:
      case 0xF:
        return (v6 + 4);
      case 3:
      case 4:
        v40 = (unint64_t)*this;
        goto LABEL_169;
      case 5:
      case 0xE:
        v41 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)this;
        if ((v41 & 0x80000000) == 0)
          goto LABEL_165;
        v42 = 10;
        goto LABEL_170;
      case 8:
        return (v6 + 1);
      case 9:
      case 0xC:
        v42 = wireless_diagnostics::google::protobuf::internal::WireFormatLite::StringSize((uint64_t)*this);
        goto LABEL_170;
      case 0xA:
        v42 = (*(uint64_t (**)(uint64_t *))(**this + 72))(*this);
        goto LABEL_170;
      case 0xB:
        v99 = **this;
        if ((*((_BYTE *)this + 10) & 0x10) != 0)
          v100 = *(uint64_t (**)(void))(v99 + 64);
        else
          v100 = *(uint64_t (**)(void))(v99 + 72);
        v102 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v100();
        v103 = (int)v102;
        if (v102 >= 0x80)
          v104 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v102);
        else
          v104 = 1;
        return (v103 + v6 + v104);
      case 0xD:
        v41 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)this;
        goto LABEL_165;
      case 0x11:
        v41 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *(_DWORD *)this) ^ (*(int *)this >> 31));
LABEL_165:
        if (v41 >= 0x80)
          v42 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v41);
        else
          v42 = 1;
        goto LABEL_170;
      case 0x12:
        v40 = (2 * (_QWORD)*this) ^ ((uint64_t)*this >> 63);
LABEL_169:
        v42 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(v40);
LABEL_170:
        v6 = (v42 + v6);
        break;
      default:
        return v6;
    }
  }
  return v6;
}

void sub_208FED73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::StringSize(uint64_t a1)
{
  int v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  int v6;

  v2 = *(unsigned __int8 *)(a1 + 23);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 8);
  if ((v2 & 0x80u) == 0)
    v5 = *(unsigned __int8 *)(a1 + 23);
  else
    v5 = v4;
  if (v5 >= 0x80)
  {
    v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
    v2 = *(unsigned __int8 *)(a1 + 23);
    v4 = *(_QWORD *)(a1 + 8);
    v3 = *(_BYTE *)(a1 + 23);
  }
  else
  {
    v6 = 1;
  }
  if (v3 < 0)
    v2 = v4;
  return (v6 + v2);
}

void wireless_diagnostics::google::protobuf::internal::GeneratedExtensionFinder::~GeneratedExtensionFinder(wireless_diagnostics::google::protobuf::internal::GeneratedExtensionFinder *this)
{
  JUMPOUT(0x20BD0BE78);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::find<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>(_QWORD *a1, uint64_t a2)
{
  int8x8_t v2;
  uint64_t v3;
  unint64_t v4;
  uint8x8_t v5;
  uint64_t v6;
  uint64_t **v7;
  uint64_t *result;
  unint64_t v9;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *(int *)(a2 + 8);
  v4 = v3 - *(_QWORD *)a2 + (*(_QWORD *)a2 << 16);
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = v3 - *(_QWORD *)a2 + (*(_QWORD *)a2 << 16);
    if (v4 >= *(_QWORD *)&v2)
      v6 = v4 % *(_QWORD *)&v2;
  }
  else
  {
    v6 = (*(_QWORD *)&v2 - 1) & v4;
  }
  v7 = *(uint64_t ***)(*a1 + 8 * v6);
  if (!v7)
    return 0;
  for (result = *v7; result; result = (uint64_t *)*result)
  {
    v9 = result[1];
    if (v4 == v9)
    {
      if (result[2] == *(_QWORD *)a2 && *((_DWORD *)result + 6) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v5.u32[0] > 1uLL)
      {
        if (v9 >= *(_QWORD *)&v2)
          v9 %= *(_QWORD *)&v2;
      }
      else
      {
        v9 &= *(_QWORD *)&v2 - 1;
      }
      if (v9 != v6)
        return 0;
    }
  }
  return result;
}

void wireless_diagnostics::google::protobuf::internal::`anonymous namespace'::InitRegistry(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *this)
{
  uint64_t v1;
  void (*v2)(void);

  v1 = operator new();
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_DWORD *)(v1 + 32) = 1065353216;
}

uint64_t wireless_diagnostics::google::protobuf::internal::`anonymous namespace'::DeleteRegistry(wireless_diagnostics::google::protobuf::internal::_anonymous_namespace_ *this)
{
  uint64_t result;
  uint64_t v2;

  {
    result = MEMORY[0x20BD0BE78](v2, 0x10A0C408EF24B1CLL);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

_QWORD *std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__emplace_unique_key_args<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::pair<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int> const,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  __int128 v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v6 = *(int *)(a2 + 8);
  v7 = v6 - *(_QWORD *)a2 + (*(_QWORD *)a2 << 16);
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v3 = v6 - *(_QWORD *)a2 + (*(_QWORD *)a2 << 16);
      if (v7 >= v8)
        v3 = v7 % v8;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *(_QWORD *)a2 && *((_DWORD *)v11 + 6) == (_DWORD)v6)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v3)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x40uLL);
  *v11 = 0;
  v11[1] = v7;
  v14 = a3[1];
  *((_OWORD *)v11 + 1) = *a3;
  *((_OWORD *)v11 + 2) = v14;
  *((_OWORD *)v11 + 3) = a3[2];
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__rehash<true>(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v3 = v7 % v8;
      else
        v3 = v7;
    }
    else
    {
      v3 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *v11 = *v22;
LABEL_42:
    *v22 = v11;
    goto LABEL_43;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v21 + 8 * v3) = a1 + 16;
  if (*v11)
  {
    v23 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8)
        v23 %= v8;
    }
    else
    {
      v23 &= v8 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_208FEDB80(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::__unordered_map_hasher<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::__unordered_map_equal<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>,std::equal_to<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,wireless_diagnostics::google::protobuf::hash<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>>,true>,std::allocator<std::__hash_value_type<std::pair<wireless_diagnostics::google::protobuf::MessageLite const*,int>,wireless_diagnostics::google::protobuf::internal::ExtensionInfo>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v2 >= *((_QWORD *)this + 2) || (char)*v2 < 0)
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, a2);
  *a2 = *v2;
  *((_QWORD *)this + 1) = v2 + 1;
  return 1;
}

_DWORD *wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(_DWORD *result, int a2)
{
  int v2;
  _DWORD *v3;
  const void *v4;
  int v5;

  v2 = result[3];
  if (v2 < a2)
  {
    v3 = result;
    v4 = *(const void **)result;
    v5 = 2 * v2;
    if (v5 <= a2)
      v5 = a2;
    if (v5 <= 4)
      v5 = 4;
    result[3] = v5;
    result = (_DWORD *)operator new[]();
    *(_QWORD *)v3 = result;
    if (v4)
    {
      memcpy(result, v4, 4 * (int)v3[2]);
      JUMPOUT(0x20BD0BE60);
    }
  }
  return result;
}

_DWORD *wireless_diagnostics::google::protobuf::RepeatedField<long long>::Reserve(_DWORD *result, int a2)
{
  int v2;
  _DWORD *v3;
  const void *v4;
  int v5;

  v2 = result[3];
  if (v2 < a2)
  {
    v3 = result;
    v4 = *(const void **)result;
    v5 = 2 * v2;
    if (v5 <= a2)
      v5 = a2;
    if (v5 <= 4)
      v5 = 4;
    result[3] = v5;
    result = (_DWORD *)operator new[]();
    *(_QWORD *)v3 = result;
    if (v4)
    {
      memcpy(result, v4, 8 * (int)v3[2]);
      JUMPOUT(0x20BD0BE60);
    }
  }
  return result;
}

_DWORD *wireless_diagnostics::google::protobuf::RepeatedField<BOOL>::Reserve(_DWORD *result, int a2)
{
  int v2;
  _DWORD *v3;
  const void *v4;
  int v5;
  int v6;

  v2 = result[3];
  if (v2 < a2)
  {
    v3 = result;
    v4 = *(const void **)result;
    v5 = 2 * v2;
    if (v5 <= a2)
      v5 = a2;
    if (v5 <= 4)
      v6 = 4;
    else
      v6 = v5;
    v3[3] = v6;
    result = (_DWORD *)operator new[]();
    *(_QWORD *)v3 = result;
    if (v4)
    {
      memcpy(result, v4, (int)v3[2]);
      JUMPOUT(0x20BD0BE60);
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__erase_unique<int>(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 < v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (!v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32))
    return 0;
  std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__remove_node_pointer((uint64_t **)a1, (uint64_t *)v4);
  operator delete((void *)v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

int *wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::AddAllocated<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(int *this, uint64_t a2)
{
  int *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = this;
  v4 = this[2];
  v5 = this[4];
  if ((_DWORD)v4 == v5)
  {
    this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(this, (int)v4 + 1);
    v6 = v3[3] + 1;
LABEL_9:
    v3[3] = v6;
    goto LABEL_10;
  }
  v7 = this[3];
  if ((_DWORD)v7 != v5)
  {
    if ((int)v4 < (int)v7)
      *(_QWORD *)(*(_QWORD *)this + 8 * v7) = *(_QWORD *)(*(_QWORD *)this + 8 * v4);
    v6 = v7 + 1;
    goto LABEL_9;
  }
  this = *(int **)(*(_QWORD *)this + 8 * v4);
  if (this)
    this = (int *)(*(uint64_t (**)(int *))(*(_QWORD *)this + 8))(this);
LABEL_10:
  v8 = *(_QWORD *)v3;
  v9 = v3[2];
  v3[2] = v9 + 1;
  *(_QWORD *)(v8 + 8 * v9) = a2;
  return this;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::swap(uint64_t *result, uint64_t a2)
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

uint64_t **std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  char *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (char *)operator new(0x40uLL);
    *((_DWORD *)v10 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 8);
    *((_QWORD *)v10 + 7) = *(_QWORD *)(a3 + 24);
    std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__insert_node_at(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *std::__tree<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,wireless_diagnostics::google::protobuf::internal::ExtensionSet::Extension>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Clear<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (*(int *)(result + 8) >= 1)
  {
    v1 = 0;
    do
    {
      v2 = *(_QWORD *)(*(_QWORD *)result + 8 * v1);
      if (*(char *)(v2 + 23) < 0)
      {
        **(_BYTE **)v2 = 0;
        *(_QWORD *)(v2 + 8) = 0;
      }
      else
      {
        *(_BYTE *)v2 = 0;
        *(_BYTE *)(v2 + 23) = 0;
      }
      ++v1;
    }
    while (v1 < *(int *)(result + 8));
  }
  *(_DWORD *)(result + 8) = 0;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(int *a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1[3] >= 1)
  {
    v2 = 0;
    do
      wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete(*(_QWORD *)(*(_QWORD *)a1
                                                                                                + 8 * v2++));
    while (v2 < a1[3]);
  }
  result = *(_QWORD *)a1;
  if (*(_QWORD *)a1)
    JUMPOUT(0x20BD0BE60);
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Destroy<wireless_diagnostics::google::protobuf::RepeatedPtrField<wireless_diagnostics::google::protobuf::MessageLite>::TypeHandler>(uint64_t *a1)
{
  int v2;
  uint64_t i;
  uint64_t v4;
  uint64_t result;

  v2 = *((_DWORD *)a1 + 3);
  if (v2 >= 1)
  {
    for (i = 0; i < v2; ++i)
    {
      v4 = *(_QWORD *)(*a1 + 8 * i);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
        v2 = *((_DWORD *)a1 + 3);
      }
    }
  }
  result = *a1;
  if (*a1)
    JUMPOUT(0x20BD0BE60);
  return result;
}

_QWORD *wireless_diagnostics::google::protobuf::MessageLite::InitializationErrorString@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "(cannot determine missing fields for lite message)");
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::MergeFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t result;
  std::string *v4;
  char v5;
  std::string __p;
  std::string v7[2];

  result = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(_QWORD *)this + 64))(this, a2);
  if ((_DWORD)result)
  {
    if (((*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 40))(this) & 1) != 0)
    {
      return 1;
    }
    else
    {
      wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 124);
      v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, (const std::string::value_type *)&__p);
      wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
      return 0;
    }
  }
  return result;
}

void sub_208FEE9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0)
    operator delete(__p);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 32))(this);
  return (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, wireless_diagnostics::google::protobuf::io::CodedInputStream *))(*(_QWORD *)this + 64))(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2)
{
  unsigned int v3;
  uint64_t v4;
  _QWORD v6[5];
  __int128 v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v6[0] = a2;
  memset(&v6[1], 0, 30);
  v7 = xmmword_208FF2EB0;
  v8 = 0;
  v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v10 = 0;
  v11 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 32))(this);
  v3 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, _QWORD *))(*(_QWORD *)this
                                                                                                  + 64))(this, v6);
  if (BYTE4(v6[4]))
    v4 = v3;
  else
    v4 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v6);
  return v4;
}

void sub_208FEEAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParseFromBoundedZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, int a3)
{
  int v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[5];
  __int128 v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = a2;
  memset(&v9[1], 0, 30);
  v10 = xmmword_208FF2EB0;
  v11 = 0;
  v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v13 = 0;
  v14 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9, a3);
  v5 = wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  if (BYTE4(v9[4]))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6 == 1
    && wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9) == 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  return v7;
}

void sub_208FEEBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromBoundedZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, int a3)
{
  int v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[5];
  __int128 v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = a2;
  memset(&v9[1], 0, 30);
  v10 = xmmword_208FF2EB0;
  v11 = 0;
  v12 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v13 = 0;
  v14 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9, a3);
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 32))(this);
  v5 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, _QWORD *))(*(_QWORD *)this
                                                                                                  + 64))(this, v9);
  if (BYTE4(v9[4]))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6 == 1
    && wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9) == 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9);
  return v7;
}

void sub_208FEEC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromString(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t *v4;
  unsigned int v5;
  uint64_t v6;
  _QWORD v8[3];
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  LODWORD(v3) = *((unsigned __int8 *)a2 + 23);
  if ((v3 & 0x80u) == 0)
    v4 = a2;
  else
    v4 = (uint64_t *)*a2;
  if ((v3 & 0x80u) != 0)
    v3 = a2[1];
  v8[0] = 0;
  v8[1] = v4;
  v8[2] = (char *)v4 + (int)v3;
  v9 = v3;
  v10 = 0;
  v11 = 0;
  v12 = v3;
  v13 = xmmword_208FF2EC0;
  v14 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v15 = 0;
  v16 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
  v5 = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a1 + 64))(a1, v8);
  if ((_BYTE)v11)
    v6 = v5;
  else
    v6 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v8);
  return v6;
}

void sub_208FEED48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParsePartialFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, char *a2, int a3)
{
  unsigned int v4;
  uint64_t v5;
  _QWORD v7[3];
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v7[0] = 0;
  v7[1] = a2;
  v7[2] = &a2[a3];
  v8 = a3;
  v9 = 0;
  v10 = 0;
  v11 = a3;
  v12 = xmmword_208FF2EC0;
  v13 = wireless_diagnostics::google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v14 = 0;
  v15 = 0;
  (*(void (**)(wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)this + 32))(this);
  v4 = (*(uint64_t (**)(wireless_diagnostics::google::protobuf::MessageLite *, _QWORD *))(*(_QWORD *)this
                                                                                                  + 64))(this, v7);
  if ((_BYTE)v10)
    v5 = v4;
  else
    v5 = 0;
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v7);
  return v5;
}

void sub_208FEEDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&a9);
  _Unwind_Resume(a1);
}

void wireless_diagnostics::google::protobuf::`anonymous namespace'::InitializationErrorMessage(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this@<X0>, std::string *a2@<X8>)
{
  const std::string::value_type *p_p;
  std::string::size_type v7;
  const std::string::value_type *v8;
  std::string::size_type v9;
  void *__p;
  std::string::size_type v11;
  unsigned __int8 v12;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::append(a2, "Can't ");
  std::string::append(a2, "parse");
  std::string::append(a2, " message of type \"");
  (*(void (**)(void **__return_ptr, wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(_QWORD *)this + 16))(&__p, this);
  if ((v12 & 0x80u) == 0)
    p_p = (const std::string::value_type *)&__p;
  else
    p_p = (const std::string::value_type *)__p;
  if ((v12 & 0x80u) == 0)
    v7 = v12;
  else
    v7 = v11;
  std::string::append(a2, p_p, v7);
  if ((char)v12 < 0)
    operator delete(__p);
  std::string::append(a2, "\" because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, wireless_diagnostics::google::protobuf::_anonymous_namespace_ *))(*(_QWORD *)this + 48))(&__p, this);
  if ((v12 & 0x80u) == 0)
    v8 = (const std::string::value_type *)&__p;
  else
    v8 = (const std::string::value_type *)__p;
  if ((v12 & 0x80u) == 0)
    v9 = v12;
  else
    v9 = v11;
  std::string::append(a2, v8, v9);
  if ((char)v12 < 0)
    operator delete(__p);
}

void sub_208FEEF10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

void wireless_diagnostics::google::protobuf::`anonymous namespace'::ByteSizeConsistencyError(wireless_diagnostics::google::protobuf::_anonymous_namespace_ *this, int a2, int a3)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  std::string *v9;
  char v10;
  std::string v11[2];

  v4 = (int)this;
  if ((_DWORD)this != a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 64);
    v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (byte_size_before_serialization) == (byte_size_after_serialization): ");
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "Protocol message was modified concurrently during serialization.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (a3 != v4)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 66);
    v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (bytes_produced_by_serialization) == (byte_size_before_serialization): ");
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "Byte size calculation and serialization were inconsistent.  This may indicate a bug in protocol buffers or it may be caused by concurrent modification of the message.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/message_lite.cc", 70);
  v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "This shouldn't be called if all the sizes are equal.");
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
}

void sub_208FEF054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToZeroCopyStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *a2)
{
  uint64_t v3;
  _BYTE v5[32];

  wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5, a2);
  v3 = wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToCodedStream(this, (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v5);
  return v3;
}

void sub_208FEF0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)&a9);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::AppendToString(uint64_t a1, std::string *a2)
{
  wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(a1, a2);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialToString(uint64_t a1, uint64_t a2)
{
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
  wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString(a1, (std::string *)a2);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString@<X0>(wireless_diagnostics::google::protobuf::MessageLite *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString((uint64_t)this, a2);
}

void sub_208FEF154(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializePartialAsString@<X0>(wireless_diagnostics::google::protobuf::MessageLite *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return wireless_diagnostics::google::protobuf::MessageLite::AppendPartialToString((uint64_t)this, a2);
}

void sub_208FEF19C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
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
  __cxa_throw(exception, (struct type_info *)off_24C0ECD18, MEMORY[0x24BEDAAF0]);
}

void sub_208FEF2B8(_Unwind_Exception *a1)
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

uint64_t wireless_diagnostics::google::protobuf::io::ArrayInputStream::ArrayInputStream(uint64_t this, const void *a2, int a3, int a4)
{
  int v4;

  *(_QWORD *)this = &off_24C0ED1A0;
  *(_QWORD *)(this + 8) = a2;
  if (a4 <= 0)
    v4 = a3;
  else
    v4 = a4;
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

{
  int v4;

  *(_QWORD *)this = &off_24C0ED1A0;
  *(_QWORD *)(this + 8) = a2;
  if (a4 <= 0)
    v4 = a3;
  else
    v4 = a4;
  *(_DWORD *)(this + 16) = a3;
  *(_DWORD *)(this + 20) = v4;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::ArrayInputStream::~ArrayInputStream(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
  JUMPOUT(0x20BD0BE78);
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayInputStream::Next(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, const void **a2, int *a3)
{
  uint64_t v3;
  int v4;
  int v5;

  v3 = *((int *)this + 6);
  v4 = *((_DWORD *)this + 4);
  if ((int)v3 >= v4)
  {
    *((_DWORD *)this + 7) = 0;
  }
  else
  {
    v5 = v4 - v3;
    if (v4 - (int)v3 >= *((_DWORD *)this + 5))
      v5 = *((_DWORD *)this + 5);
    *((_DWORD *)this + 7) = v5;
    *a2 = (const void *)(*((_QWORD *)this + 1) + v3);
    *a3 = v5;
    *((_DWORD *)this + 6) += *((_DWORD *)this + 7);
  }
  return (int)v3 < v4;
}

void wireless_diagnostics::google::protobuf::io::ArrayInputStream::BackUp(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  char v9;
  std::string v10[2];

  v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 80);
    v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 82);
    v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 83);
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((_QWORD *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_208FEF4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::io::ArrayInputStream::Skip(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this, int a2)
{
  std::string *v4;
  int v5;
  int v6;
  int v7;
  _BOOL8 result;
  int v9;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 89);
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v10, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v5 = *((_DWORD *)this + 4);
  v6 = *((_DWORD *)this + 6);
  v7 = v5 - v6;
  result = v5 - v6 >= a2;
  v9 = v6 + a2;
  if (v7 >= a2)
    v5 = v9;
  *((_DWORD *)this + 6) = v5;
  *((_DWORD *)this + 7) = 0;
  return result;
}

void sub_208FEF570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::ArrayInputStream *this)
{
  return *((int *)this + 6);
}

void wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
  JUMPOUT(0x20BD0BE78);
}

void wireless_diagnostics::google::protobuf::io::ArrayOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  char v9;
  std::string v10[2];

  v4 = *((_DWORD *)this + 7);
  if (v4 <= 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 133);
    v5 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    v6 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v6);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 135);
    v7 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 136);
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((_QWORD *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_208FEF6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this)
{
  return *((int *)this + 6);
}

_QWORD *wireless_diagnostics::google::protobuf::io::StringOutputStream::StringOutputStream(_QWORD *result, uint64_t a2)
{
  *result = &off_24C0ED318;
  result[1] = a2;
  return result;
}

{
  *result = &off_24C0ED318;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::StringOutputStream::~StringOutputStream(wireless_diagnostics::google::protobuf::io::StringOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::io::StringOutputStream::Next(wireless_diagnostics::google::protobuf::io::StringOutputStream *this, void **a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  std::string::size_type v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  v6 = *((_QWORD *)this + 1);
  if (*(char *)(v6 + 23) < 0)
  {
    v7 = *(_QWORD *)(v6 + 8);
    v9 = (int)v7;
    v8 = (*(_QWORD *)(v6 + 16) & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if ((int)v7 < v8)
      goto LABEL_10;
  }
  else
  {
    LODWORD(v7) = *(unsigned __int8 *)(v6 + 23);
    if (v7 < 0x16)
    {
      v8 = 22;
      v9 = *(unsigned __int8 *)(v6 + 23);
      goto LABEL_10;
    }
    v9 = *(unsigned __int8 *)(v6 + 23);
  }
  if (2 * (int)v7 <= 16)
    v8 = 16;
  else
    v8 = (2 * v7);
LABEL_10:
  std::string::resize((std::string *)v6, v8, 0);
  v10 = (uint64_t *)*((_QWORD *)this + 1);
  if (*((char *)v10 + 23) < 0)
  {
    if (v10[1])
    {
      v10 = (uint64_t *)*v10;
      goto LABEL_16;
    }
  }
  else if (*((_BYTE *)v10 + 23))
  {
    goto LABEL_16;
  }
  v10 = 0;
LABEL_16:
  *a2 = (char *)v10 + v9;
  v11 = *((_QWORD *)this + 1);
  if (*(char *)(v11 + 23) < 0)
    v11 = *(_QWORD *)(v11 + 8);
  else
    LODWORD(v11) = *(unsigned __int8 *)(v11 + 23);
  *a3 = v11 - v7;
  return 1;
}

void wireless_diagnostics::google::protobuf::io::StringOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::StringOutputStream *this, int a2)
{
  std::string *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::string *v8;
  char v9;
  std::string v10[2];

  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 177);
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  v5 = *((_QWORD *)this + 1);
  LODWORD(v6) = *(char *)(v5 + 23);
  if ((v6 & 0x80000000) != 0)
    v7 = *(_QWORD *)(v5 + 8);
  else
    v7 = *(unsigned __int8 *)(v5 + 23);
  if (v7 < a2)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 178);
    v8 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (target_->size()): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    v5 = *((_QWORD *)this + 1);
    LOBYTE(v6) = *(_BYTE *)(v5 + 23);
  }
  if ((v6 & 0x80) != 0)
    v6 = *(_QWORD *)(v5 + 8);
  else
    v6 = v6;
  std::string::resize((std::string *)v5, v6 - a2, 0);
}

void sub_208FEF934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::StringOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::StringOutputStream *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  if (*(char *)(v1 + 23) < 0)
    return *(_QWORD *)(v1 + 8);
  else
    return *(unsigned __int8 *)(v1 + 23);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStream::Skip(wireless_diagnostics::google::protobuf::io::CopyingInputStream *this)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  int v10;
  _BYTE v12[4096];
  uint64_t v13;

  v1 = MEMORY[0x24BDAC7A8](this);
  v3 = v2;
  v4 = v1;
  v5 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  do
  {
    v6 = v5;
    v7 = __OFSUB__(v3, (_DWORD)v5);
    v8 = v3 - v5;
    if ((v8 < 0) ^ v7 | (v8 == 0))
      break;
    v9 = v8 >= 4096 ? 4096 : v8;
    v10 = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)v4 + 16))(v4, v12, v9);
    v5 = (v10 + v6);
  }
  while (v10 > 0);
  return v6;
}

BOOL wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  std::string *v4;
  int v6;
  uint64_t v7;
  int v8;
  char v9;
  std::string v10[2];

  if (a2 < 0)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl_lite.cc", 269);
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v9, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*((_BYTE *)this + 17))
    return 0;
  v6 = *((_DWORD *)this + 12);
  if (v6 >= a2)
  {
    *((_DWORD *)this + 12) = v6 - a2;
    return 1;
  }
  else
  {
    v7 = (a2 - v6);
    *((_DWORD *)this + 12) = 0;
    v8 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), v7);
    *((_QWORD *)this + 3) += v8;
    return v8 == (_DWORD)v7;
  }
}

void sub_208FEFB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return *((_QWORD *)this + 3) + *((int *)this + 11);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::FreeBuffer(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  uint64_t result;

  *((_DWORD *)this + 11) = 0;
  result = *((_QWORD *)this + 4);
  if (result)
  {
    result = MEMORY[0x20BD0BE60](result, 0x1000C8077774924);
    *((_QWORD *)this + 4) = 0;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::StringAppendV(std::string *a1, char *__format, va_list a3)
{
  uint64_t result;
  int v6;
  char *v7;
  int v8;
  char __str[1024];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = vsnprintf(__str, 0x400uLL, __format, a3);
  v6 = result;
  if ((int)result > 1023)
  {
    v7 = (char *)operator new[]();
    v8 = vsnprintf(v7, (v6 + 1), __format, a3);
    if ((v8 & 0x80000000) == 0 && v8 <= v6)
      std::string::append(a1, v7, v8);
    return MEMORY[0x20BD0BE60](v7, 0x1000C8077774924);
  }
  else if ((result & 0x80000000) == 0)
  {
    return (uint64_t)std::string::append(a1, __str, result);
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::StringPrintf@<X0>(wireless_diagnostics::google::protobuf *this@<X0>, std::string *a2@<X8>, ...)
{
  va_list va;

  va_start(va, a2);
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return wireless_diagnostics::google::protobuf::StringAppendV(a2, (char *)this, va);
}

void sub_208FEFD4C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::SStringPrintf(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(char *)(a1 + 23) < 0)
  {
    **(_BYTE **)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a1 = 0;
    *(_BYTE *)(a1 + 23) = 0;
  }
  wireless_diagnostics::google::protobuf::StringAppendV((std::string *)a1, a2, &a9);
  return a1;
}

uint64_t wireless_diagnostics::google::protobuf::StringAppendF(std::string *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return wireless_diagnostics::google::protobuf::StringAppendV(a1, a2, &a9);
}

uint64_t wireless_diagnostics::google::protobuf::StringPrintfVector@<X0>(wireless_diagnostics::google::protobuf *this@<X0>, uint64_t **a2@<X1>, std::string *a3@<X8>)
{
  uint64_t *v5;
  uint64_t *v6;
  unint64_t v7;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  __int128 *v15;
  uint64_t *v16;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  v6 = a2[1];
  v7 = ((char *)v6 - (char *)*a2) / 24;
  if (v7 >= 0x21)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/stubs/stringprintf.cc", 142);
    v9 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<((std::string *)&v19, "CHECK failed: (v.size()) <= (kStringPrintfVectorMaxArgs): ");
    v10 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v9, "StringPrintfVector currently only supports up to ");
    v11 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v10, 32);
    v12 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v11, " arguments. ");
    v13 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v12, "Feel free to add support for more if you need it.");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v18, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v19);
    v5 = *a2;
    v6 = a2[1];
    v7 = ((char *)v6 - (char *)*a2) / 24;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (v6 != v5)
  {
    if (v7 <= 1)
      v14 = 1;
    else
      v14 = v7;
    v15 = &v19;
    do
    {
      v16 = v5;
      if (*((char *)v5 + 23) < 0)
        v16 = (uint64_t *)*v5;
      *(_QWORD *)v15 = v16;
      v15 = (__int128 *)((char *)v15 + 8);
      v5 += 3;
      --v14;
    }
    while (v14);
  }
  if ((v7 & 0xFFFFFFE0) == 0)
    memset_pattern16((char *)&v19 + ((8 * v7) & 0x7FFFFFFF8), &off_24C0ED610, ((248 - 8 * v7) & 0x7FFFFFFF8) + 8);
  return wireless_diagnostics::google::protobuf::StringPrintf(this, a3, v19, v20, v21, v22, v23, v24, v25, v26, (_QWORD)v27, *((_QWORD *)&v27 + 1), (_QWORD)v28, *((_QWORD *)&v28 + 1), (_QWORD)v29, *((_QWORD *)&v29 + 1), (_QWORD)v30, *((_QWORD *)&v30 + 1), (_QWORD)v31,
           *((_QWORD *)&v31 + 1),
           (_QWORD)v32,
           *((_QWORD *)&v32 + 1),
           (_QWORD)v33,
           *((_QWORD *)&v33 + 1),
           (_QWORD)v34,
           *((_QWORD *)&v34 + 1));
}

void sub_208FEFFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43)
{
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(&a43);
  _Unwind_Resume(a1);
}

int32x2_t *wireless_diagnostics::google::protobuf::io::CodedInputStream::SetTotalBytesLimit(int32x2_t *this, unsigned int a2, __int32 a3)
{
  __int32 v3;
  int32x2_t v4;
  int v5;
  uint64_t v6;
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v9;
  int v10;
  BOOL v11;
  int v12;

  v3 = this[3].i32[0];
  v4 = this[2];
  v5 = this[5].i32[0];
  v6 = this[5].i32[1];
  v7.i32[0] = v3 - v6 + this[1].i32[0] - v4.i32[0];
  v7.i32[1] = a3;
  v8 = vmax_s32(v7, (int32x2_t)(a2 | 0xFFFFFFFF00000000));
  this[6] = v8;
  v9 = (int32x2_t)(*(_QWORD *)&v4 + v6);
  this[2] = v9;
  v10 = v8.i32[0];
  if (v8.i32[0] >= v5)
    v10 = v5;
  v11 = __OFSUB__(v3, v10);
  v12 = v3 - v10;
  if ((v12 < 0) ^ v11 | (v12 == 0))
    v12 = 0;
  else
    this[2] = (int32x2_t)(*(_QWORD *)&v9 - v12);
  this[5].i32[1] = v12;
  return this;
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::PrintTotalBytesLimitError(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  std::string *v2;
  std::string *v3;
  std::string *v4;
  char v5;
  std::string v6[2];

  wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/coded_stream.cc", 172);
  v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "A protocol message was rejected because it was too big (more than ");
  v3 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v2, *((_DWORD *)this + 12));
  v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v3, " bytes).  To increase the limit (or to disable these warnings), see CodedInputStream::SetTotalBytesLimit() in google/protobuf/io/coded_stream.h.");
  wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
}

void sub_208FF00E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Slow(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  uint64_t result;
  unint64_t v4;

  v4 = 0;
  result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v4);
  if ((_DWORD)result)
    *a2 = v4;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, int a2)
{
  int v3;
  int v4;
  char v5;

  if (a2 < 0)
    return 0;
  while (1)
  {
    v3 = *((_DWORD *)this + 4);
    v4 = a2 - v3;
    if (a2 <= v3)
      break;
    v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    a2 = v4;
    if ((v5 & 1) == 0)
      return 0;
  }
  *((_QWORD *)this + 1) += a2;
  *((_DWORD *)this + 4) = v3 - a2;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::GetDirectBufferPointer(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, void **a2, int *a3)
{
  int v6;
  uint64_t result;

  v6 = *((_DWORD *)this + 4);
  if (!v6)
  {
    result = wireless_diagnostics::google::protobuf::io::CodedOutputStream::Refresh(this);
    if (!(_DWORD)result)
      return result;
    v6 = *((_DWORD *)this + 4);
  }
  *a2 = (void *)*((_QWORD *)this + 1);
  *a3 = v6;
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64(uint64_t this, uint64_t a2)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(this + 16) < 8u)
  {
    v2[0] = a2;
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRaw((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)this, (char *)v2, 8);
  }
  else
  {
    **(_QWORD **)(this + 8) = a2;
    *(_QWORD *)(this + 8) += 8;
    *(_DWORD *)(this + 16) -= 8;
  }
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::CopyingFileInputStream(uint64_t this, int a2)
{
  *(_QWORD *)this = &off_24C0ED130;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 20) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_24C0ED130;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 20) = 0;
  return this;
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::Close(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 8));
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  std::string *v2;
  int v3;
  char v5;
  std::string v6[2];

  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 124);
    v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((_BYTE *)this + 13) = 1;
  if (v3)
    *((_DWORD *)this + 4) = *__error();
  return v3 == 0;
}

void sub_208FF0374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL wireless_diagnostics::google::protobuf::io::FileInputStream::Skip(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip((wireless_diagnostics::google::protobuf::io::FileInputStream *)((char *)this + 32), a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::`anonymous namespace'::close_no_eintr(wireless_diagnostics::google::protobuf::io::_anonymous_namespace_ *this)
{
  int v1;
  uint64_t v2;

  v1 = (int)this;
  do
    v2 = close(v1);
  while ((v2 & 0x80000000) != 0 && *__error() == 4);
  return v2;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream::Skip(wireless_diagnostics::google::protobuf::io::FileInputStream::CopyingFileInputStream *this, uint64_t a2)
{
  std::string *v4;
  char v6;
  std::string v7[2];

  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 155);
    v4 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v6, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  if (*((_BYTE *)this + 20) || lseek(*((_DWORD *)this + 2), (int)a2, 1) == -1)
  {
    *((_BYTE *)this + 20) = 1;
    return wireless_diagnostics::google::protobuf::io::CopyingInputStream::Skip(this);
  }
  return a2;
}

void sub_208FF04C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::CopyingFileOutputStream(uint64_t this, int a2)
{
  *(_QWORD *)this = &off_24C0ED1E0;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_24C0ED1E0;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Close(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  unsigned int v2;

  v2 = wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
  return wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 8)) & v2;
}

BOOL wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(wireless_diagnostics::google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  std::string *v2;
  int v3;
  char v5;
  std::string v6[2];

  if (*((_BYTE *)this + 13))
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 222);
    v2 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v5, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v2);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((_BYTE *)this + 13) = 1;
  if (v3)
    *((_DWORD *)this + 4) = *__error();
  return v3 == 0;
}

void sub_208FF05E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::FileOutputStream *)((char *)this + 32));
}

_QWORD *wireless_diagnostics::google::protobuf::io::IstreamInputStream::IstreamInputStream(_QWORD *a1, uint64_t a2, int a3)
{
  *a1 = &off_24C0ED2D8;
  a1[1] = &off_24C0ED2A8;
  a1[2] = a2;
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)(a1 + 3), (wireless_diagnostics::google::protobuf::io::CopyingInputStream *)(a1 + 1), a3);
  return a1;
}

void sub_208FF069C(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *v1;
  wireless_diagnostics::google::protobuf::io::CopyingInputStream *v2;

  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(v1);
  _Unwind_Resume(a1);
}

_QWORD *wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::CopyingIstreamInputStream(_QWORD *result, uint64_t a2)
{
  *result = &off_24C0ED2A8;
  result[1] = a2;
  return result;
}

{
  *result = &off_24C0ED2A8;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::~IstreamInputStream(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CopyingInputStream *v2;

  *(_QWORD *)this = &off_24C0ED2D8;
  v2 = (wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 8);
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24));
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::IstreamInputStream::~IstreamInputStream(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::Next(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2, a3);
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::BackUp(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, int a2)
{
  wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::BackUp((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2);
}

BOOL wireless_diagnostics::google::protobuf::io::IstreamInputStream::Skip(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::Skip((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::IstreamInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::IstreamInputStream *)((char *)this + 24));
}

void wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::~CopyingIstreamInputStream(wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::Read(wireless_diagnostics::google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this, void *a2)
{
  uint64_t v3;
  uint64_t result;
  int v5;
  int v6;
  int v7;
  BOOL v8;

  std::istream::read();
  v3 = *((_QWORD *)this + 1);
  result = *(unsigned int *)(v3 + 8);
  if (!(_DWORD)result)
  {
    v5 = *(_DWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 - 24) + 32);
    v6 = v5 & 5;
    v7 = v5 & 2;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
      return 0xFFFFFFFFLL;
  }
  return result;
}

_QWORD *wireless_diagnostics::google::protobuf::io::OstreamOutputStream::OstreamOutputStream(_QWORD *a1, uint64_t a2, int a3)
{
  *a1 = &off_24C0ED3E0;
  a1[1] = &off_24C0ED3B8;
  a1[2] = a2;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)(a1 + 3), (wireless_diagnostics::google::protobuf::io::CopyingOutputStream *)(a1 + 1), a3);
  return a1;
}

void sub_208FF0844(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream *v1;
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream *v2;

  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(v2);
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(v1);
  _Unwind_Resume(a1);
}

_QWORD *wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::CopyingOstreamOutputStream(_QWORD *result, uint64_t a2)
{
  *result = &off_24C0ED3B8;
  result[1] = a2;
  return result;
}

{
  *result = &off_24C0ED3B8;
  result[1] = a2;
  return result;
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *v2;

  *(_QWORD *)this = &off_24C0ED3E0;
  v2 = (wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v2);
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 8));
  wireless_diagnostics::google::protobuf::io::ZeroCopyOutputStream::~ZeroCopyOutputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::io::OstreamOutputStream::Next(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this, void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Next((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24), a2, a3);
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this, int a2)
{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::BackUp((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24), a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::OstreamOutputStream::ByteCount(wireless_diagnostics::google::protobuf::io::OstreamOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((wireless_diagnostics::google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
}

void wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::~CopyingOstreamOutputStream(wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this)
{
  wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(this);
  JUMPOUT(0x20BD0BE78);
}

BOOL wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::Write(wireless_diagnostics::google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this, const void *a2)
{
  std::ostream::write();
  return *(_DWORD *)(*((_QWORD *)this + 1) + *(_QWORD *)(**((_QWORD **)this + 1) - 24) + 32) == 0;
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::ConcatenatingInputStream(uint64_t this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *const *a2, int a3)
{
  *(_QWORD *)this = &off_24C0ED490;
  *(_QWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 16) = a3;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_24C0ED490;
  *(_QWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 16) = a3;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

void wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::~ConcatenatingInputStream(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::Next(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this, const void **a2, int *a3)
{
  _QWORD *v6;
  uint64_t v7;
  int v8;
  BOOL v9;

  if (*((int *)this + 4) < 1)
    return 0;
  v6 = (_QWORD *)*((_QWORD *)this + 1);
  do
  {
    v7 = (*(uint64_t (**)(_QWORD, const void **, int *))(*(_QWORD *)*v6 + 16))(*v6, a2, a3);
    if ((v7 & 1) != 0)
      break;
    *((_QWORD *)this + 3) += (*(uint64_t (**)(_QWORD))(***((_QWORD ***)this + 1) + 40))(**((_QWORD **)this + 1));
    v6 = (_QWORD *)(*((_QWORD *)this + 1) + 8);
    *((_QWORD *)this + 1) = v6;
    v8 = *((_DWORD *)this + 4);
    v9 = __OFSUB__(v8--, 1);
    *((_DWORD *)this + 4) = v8;
  }
  while (!((v8 < 0) ^ v9 | (v8 == 0)));
  return v7;
}

void wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::BackUp(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  std::string *v1;
  char v2;
  std::string v3[2];

  if (*((int *)this + 4) < 1)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage((uint64_t)v3, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AWDMetrics_protobuf/google/protobuf/io/zero_copy_stream_impl.cc", 378);
    v1 = wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(v3, "Can't BackUp() after failed Next().");
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=((uint64_t)&v2, (wireless_diagnostics::google::protobuf::internal::LogMessage *)v1);
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)&v3[0].__r_.__value_.__l.__data_);
  }
  else
  {
    (*(void (**)(_QWORD))(***((_QWORD ***)this + 1) + 24))(**((_QWORD **)this + 1));
  }
}

void sub_208FF0B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::Skip(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this, uint64_t a2)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v9;

  if (*((int *)this + 4) < 1)
    return 0;
  v4 = (_QWORD *)*((_QWORD *)this + 1);
  do
  {
    v5 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v4 + 40))(*v4);
    v6 = (*(uint64_t (**)(_QWORD, uint64_t))(***((_QWORD ***)this + 1) + 32))(**((_QWORD **)this + 1), a2);
    if ((v6 & 1) != 0)
      break;
    v7 = (*(uint64_t (**)(_QWORD))(***((_QWORD ***)this + 1) + 40))(**((_QWORD **)this + 1));
    a2 = (v5 + a2 - v7);
    *((_QWORD *)this + 3) += v7;
    v4 = (_QWORD *)(*((_QWORD *)this + 1) + 8);
    *((_QWORD *)this + 1) = v4;
    v8 = *((_DWORD *)this + 4);
    v9 = __OFSUB__(v8--, 1);
    *((_DWORD *)this + 4) = v8;
  }
  while (!((v8 < 0) ^ v9 | (v8 == 0)));
  return v6;
}

uint64_t wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::ConcatenatingInputStream *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 3);
  if (*((_DWORD *)this + 4))
    v1 += (*(uint64_t (**)(_QWORD))(***((_QWORD ***)this + 1) + 40))(**((_QWORD **)this + 1));
  return v1;
}

_QWORD *wireless_diagnostics::google::protobuf::io::LimitingInputStream::LimitingInputStream(_QWORD *this, wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream *a2, uint64_t a3)
{
  *this = &off_24C0ED378;
  this[1] = a2;
  this[2] = a3;
  return this;
}

{
  *this = &off_24C0ED378;
  this[1] = a2;
  this[2] = a3;
  return this;
}

void wireless_diagnostics::google::protobuf::io::LimitingInputStream::~LimitingInputStream(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this)
{
  *(_QWORD *)this = &off_24C0ED378;
  if ((*((_QWORD *)this + 2) & 0x8000000000000000) != 0)
    (*(void (**)(_QWORD, _QWORD))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), -*((_DWORD *)this + 4));
  wireless_diagnostics::google::protobuf::io::ZeroCopyInputStream::~ZeroCopyInputStream(this);
}

{
  wireless_diagnostics::google::protobuf::io::LimitingInputStream::~LimitingInputStream(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::Next(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, const void **a2, int *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  if (*((uint64_t *)this + 2) < 1)
    return 0;
  result = (*(uint64_t (**)(_QWORD, const void **))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), a2);
  if ((_DWORD)result)
  {
    v6 = *a3;
    v7 = *((_QWORD *)this + 2) - v6;
    *((_QWORD *)this + 2) = v7;
    if (v7 < 0)
      *a3 = v6 + v7;
    return 1;
  }
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::BackUp(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, uint64_t a2)
{
  int v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;

  v2 = a2;
  v6 = (char *)this + 8;
  v4 = *((_QWORD *)this + 1);
  v5 = *((_QWORD *)v6 + 1);
  if (v5 < 0)
  {
    v8 = (int)a2;
    result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 24))(v4, (a2 - v5));
  }
  else
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 24))(v4, a2);
    v8 = *((_QWORD *)this + 2) + v2;
  }
  *((_QWORD *)this + 2) = v8;
  return result;
}

BOOL wireless_diagnostics::google::protobuf::io::LimitingInputStream::Skip(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;

  v4 = *((_QWORD *)this + 2);
  v5 = v4 >= (int)a2;
  if (v4 < (int)a2)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)this + 1) + 32))(*((_QWORD *)this + 1));
      v6 = 0;
      goto LABEL_6;
    }
    return 0;
  }
  if (!(*(unsigned int (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 32))(*((_QWORD *)this + 1), a2))
    return 0;
  v6 = *((_QWORD *)this + 2) - (int)a2;
LABEL_6:
  *((_QWORD *)this + 2) = v6;
  return v5;
}

uint64_t wireless_diagnostics::google::protobuf::io::LimitingInputStream::ByteCount(wireless_diagnostics::google::protobuf::io::LimitingInputStream *this)
{
  uint64_t v2;
  uint64_t result;

  v2 = *((_QWORD *)this + 2);
  result = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 40))(*((_QWORD *)this + 1));
  if (v2 < 0)
    result += *((_QWORD *)this + 2);
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t result;
  char *v5;
  char *v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  int v13;
  unsigned int v14[2];

  result = 0;
  switch(a2 & 7)
  {
    case 0:
      *(_QWORD *)v14 = 0;
      v5 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v5 >= *((_QWORD *)this + 2) || *v5 < 0)
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, (unint64_t *)v14);
      *((_QWORD *)this + 1) = v5 + 1;
      return 1;
    case 1:
      *(_QWORD *)v14 = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v14);
    case 2:
      v14[0] = 0;
      v6 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v6 >= *((_QWORD *)this + 2) || *v6 < 0)
      {
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v14);
        if (!(_DWORD)result)
          return result;
        v7 = v14[0];
      }
      else
      {
        v7 = *v6;
        v14[0] = v7;
        *((_QWORD *)this + 1) = v6 + 1;
      }
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this, v7);
    case 3:
      v8 = *((_DWORD *)this + 14);
      v9 = *((_DWORD *)this + 15);
      *((_DWORD *)this + 14) = v8 + 1;
      if (v8 >= v9)
        return 0;
      v10 = (int)a2;
      result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(this, a2, a3);
      if ((_DWORD)result)
      {
        v11 = *((_DWORD *)this + 14);
        v12 = __OFSUB__(v11, 1);
        v13 = v11 - 1;
        if (v13 < 0 == v12)
          *((_DWORD *)this + 14) = v13;
        return *((_DWORD *)this + 8) == (v10 & 0xFFFFFFF8 | 4);
      }
      return result;
    case 5:
      v14[0] = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v14);
    default:
      return result;
  }
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  char *v4;
  unint64_t TagFallback;
  BOOL v6;
  uint64_t v7;

  do
  {
    v4 = (char *)*((_QWORD *)this + 1);
    if ((unint64_t)v4 >= *((_QWORD *)this + 2) || *v4 < 0)
    {
      TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
      *((_DWORD *)this + 8) = TagFallback;
    }
    else
    {
      TagFallback = *v4;
      *((_DWORD *)this + 8) = TagFallback;
      *((_QWORD *)this + 1) = v4 + 1;
    }
    if ((_DWORD)TagFallback)
      v6 = (TagFallback & 7) == 4;
    else
      v6 = 1;
    v7 = v6;
  }
  while (!v6
       && (wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(this, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) != 0);
  return v7;
}

uint64_t wireless_diagnostics::google::protobuf::internal::FieldSkipper::SkipField(wireless_diagnostics::google::protobuf::internal::FieldSkipper *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, a3, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::FieldSkipper::SkipMessage(wireless_diagnostics::google::protobuf::internal::FieldSkipper *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipMessage(a2, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int (*a2)(uint64_t), _DWORD *a3)
{
  char *v6;
  unsigned int v7;
  uint64_t result;
  int v9;
  char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;

  v14 = 0;
  v6 = (char *)*((_QWORD *)this + 1);
  if ((unint64_t)v6 >= *((_QWORD *)this + 2) || *v6 < 0)
  {
    result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v14);
    if (!(_DWORD)result)
      return result;
    v7 = v14;
  }
  else
  {
    v7 = *v6;
    v14 = v7;
    *((_QWORD *)this + 1) = v6 + 1;
  }
  v9 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, v7);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) >= 1)
  {
    do
    {
      v15 = 0;
      v10 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v10 >= *((_QWORD *)this + 2) || *v10 < 0)
      {
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v15);
        if (!(_DWORD)result)
          return result;
        v11 = v15;
      }
      else
      {
        v11 = *v10;
        *((_QWORD *)this + 1) = v10 + 1;
      }
      if (a2(v11))
      {
        v12 = a3[2];
        if (v12 == a3[3])
        {
          wireless_diagnostics::google::protobuf::RepeatedField<int>::Reserve(a3, v12 + 1);
          v12 = a3[2];
        }
        v13 = *(_QWORD *)a3;
        a3[2] = v12 + 1;
        *(_DWORD *)(v13 + 4 * v12) = v11;
      }
    }
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) > 0);
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v9);
  return 1;
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, signed int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  if (a2 < 0)
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
  else
    return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, unint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (2 * a2) ^ (a2 >> 31));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, 8 * (_DWORD)this);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64((uint64_t)a3, (2 * a2) ^ (a2 >> 63));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 5);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 1);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 5);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSFixed64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 1);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a3, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a2, (8 * (_DWORD)this) | 5);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32((uint64_t)a2, SLODWORD(a3));
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a2, (8 * (_DWORD)this) | 1);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64((uint64_t)a2, *(uint64_t *)&a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroup(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v6;

  v6 = (int)this;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 3);
  (*(void (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)a2 + 80))(a2, a3);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * v6) | 4u);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteGroupMaybeToArray(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  int v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  uint64_t v11;

  v6 = 8 * (_DWORD)this;
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 3);
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 96))(a2);
  v8 = *((_DWORD *)a3 + 4);
  v9 = __OFSUB__(v8, v7);
  v10 = v8 - v7;
  if (v10 < 0 != v9 || (v11 = *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 1) = v11 + v7, *((_DWORD *)a3 + 4) = v10, !v11))
    (*(void (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)a2 + 80))(a2, a3);
  else
    (*(void (**)(uint64_t))(*(_QWORD *)a2 + 88))(a2);
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6 | 4u);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  signed int v6;
  int v7;
  BOOL v8;
  int v9;
  const wireless_diagnostics::google::protobuf::MessageLite *v10;
  uint64_t (*v11)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *);
  uint64_t v12;

  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, (8 * (_DWORD)this) | 2);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 96))(a2);
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32((uint64_t)a3, v6);
  v7 = *((_DWORD *)a3 + 4);
  v8 = __OFSUB__(v7, v6);
  v9 = v7 - v6;
  if (v9 < 0 != v8
    || (v10 = (const wireless_diagnostics::google::protobuf::MessageLite *)*((_QWORD *)a3 + 1),
        *((_QWORD *)a3 + 1) = (char *)v10 + v6,
        *((_DWORD *)a3 + 4) = v9,
        !v10))
  {
    v11 = *(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)a2 + 80);
    v12 = a2;
    v10 = a3;
  }
  else
  {
    v11 = *(uint64_t (**)(uint64_t, const wireless_diagnostics::google::protobuf::MessageLite *))(*(_QWORD *)a2 + 88);
    v12 = a2;
  }
  return v11(v12, v10);
}

void wireless_diagnostics::google::protobuf::internal::FieldSkipper::~FieldSkipper(wireless_diagnostics::google::protobuf::internal::FieldSkipper *this)
{
  JUMPOUT(0x20BD0BE78);
}

double wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  double result;
  uint64_t v5;

  if (a1 != a2)
  {
    v2 = *a1;
    v3 = *((_DWORD *)a1 + 4);
    *a1 = *a2;
    result = *((double *)a2 + 1);
    *a2 = v2;
    v5 = a1[1];
    *((double *)a1 + 1) = result;
    *((_DWORD *)a1 + 4) = *((_DWORD *)a2 + 4);
    a2[1] = v5;
    *((_DWORD *)a2 + 4) = v3;
  }
  return result;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, const std::string::value_type *a2)
{
  std::string::append(a1 + 1, a2);
  return a1;
}

{
  std::string *v3;
  std::string::size_type v4;
  std::string::size_type v5;

  v3 = a1 + 1;
  v4 = *((_QWORD *)a2 + 1);
  if (a2[23] >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    v5 = v4;
  }
  std::string::append(v3, a2, v5);
  return a1;
}

_QWORD *wireless_diagnostics::google::protobuf::internal::VersionString@<X0>(wireless_diagnostics::google::protobuf::internal *this@<X0>, _QWORD *a2@<X8>)
{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%d.%d.%d", (int)this / 1000000, (int)this / 1000 % 1000, (int)this % 1000);
  __str[127] = 0;
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=(uint64_t a1, wireless_diagnostics::google::protobuf::internal::LogMessage *a2)
{
  wireless_diagnostics::google::protobuf::internal::LogMessage::Finish(a2);
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(void **this)
{
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
}

{
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
}

uint64_t wireless_diagnostics::google::protobuf::internal::DefaultLogHandler(int a1, const char *a2, int a3, uint64_t a4)
{
  FILE **v4;
  const char *v5;

  v4 = (FILE **)MEMORY[0x24BDAC8D8];
  if (*(char *)(a4 + 23) >= 0)
    v5 = (const char *)a4;
  else
    v5 = *(const char **)a4;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "[libprotobuf %s %s:%d] %s\n", (&wireless_diagnostics::google::protobuf::internal::DefaultLogHandler(wireless_diagnostics::google::protobuf::LogLevel,char const*,int,std::string const&)::level_names)[a1], a2, a3, v5);
  return fflush(*v4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::DeleteLogSilencerCount(wireless_diagnostics::google::protobuf::internal *this)
{
  uint64_t result;

  result = wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  if (wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_)
  {
    wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
    result = MEMORY[0x20BD0BE78]();
  }
  wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_ = 0;
  return result;
}

void wireless_diagnostics::google::protobuf::internal::InitLogSilencerCount(wireless_diagnostics::google::protobuf::internal *this)
{
  _QWORD *v1;
  pthread_mutex_t *v2;
  void (*v3)(void);

  v1 = (_QWORD *)operator new();
  v2 = (pthread_mutex_t *)operator new();
  *v1 = v2;
  pthread_mutex_init(v2, 0);
  wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_ = (uint64_t)v1;
  wireless_diagnostics::google::protobuf::internal::OnShutdown((wireless_diagnostics::google::protobuf::internal *)wireless_diagnostics::google::protobuf::internal::DeleteLogSilencerCount, v3);
}

void sub_208FF17F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD0BE78](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

unint64_t *wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(wireless_diagnostics::google::protobuf::internal *this)
{
  uint64_t v1;
  unint64_t *result;
  _QWORD v3[2];
  char v4;

  v1 = wireless_diagnostics::google::protobuf::internal::log_silencer_count_init_;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v3[0] = &off_24C0ED5D0;
    v3[1] = wireless_diagnostics::google::protobuf::internal::InitLogSilencerCount;
    v4 = 0;
    return wireless_diagnostics::google::protobuf::GoogleOnceInitImpl((unint64_t *)&wireless_diagnostics::google::protobuf::internal::log_silencer_count_init_, (uint64_t)v3);
  }
  return result;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, std::string::value_type a2)
{
  std::string::value_type __s[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  __s[0] = a2;
  __s[1] = 0;
  __s[127] = 0;
  std::string::append(a1 + 1, __s);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, int a2)
{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%d", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%u", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, uint64_t a2)
{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%ld", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%lu", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

std::string *wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<(std::string *a1, double a2)
{
  char __str[128];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x80uLL, "%g", a2);
  __str[127] = 0;
  std::string::append(a1 + 1, __str);
  return a1;
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::Finish(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
  int v2;
  pthread_mutex_t **v3;
  int v4;
  void *exception;

  if (*(_DWORD *)this == 3)
  {
    v2 = 3;
  }
  else
  {
    wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(this);
    v3 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
    wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
    v4 = wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
    wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v3);
    if (v4 > 0)
      goto LABEL_6;
    v2 = *(_DWORD *)this;
  }
  wireless_diagnostics::google::protobuf::internal::log_handler_(v2, *((const char **)this + 1), *((_DWORD *)this + 4), (uint64_t)this + 24);
LABEL_6:
  if (*(_DWORD *)this == 3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    wireless_diagnostics::google::protobuf::FatalException::FatalException(exception, *((_QWORD *)this + 1), *((unsigned int *)this + 4), (char *)this + 24);
  }
}

void sub_208FF1C50(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t (*wireless_diagnostics::google::protobuf::SetLogHandler(uint64_t (*a1)()))()
{
  uint64_t (*v1)();
  uint64_t (*v2)();

  v1 = wireless_diagnostics::google::protobuf::internal::log_handler_;
  if (a1)
    v2 = a1;
  else
    v2 = wireless_diagnostics::google::protobuf::internal::NullLogHandler;
  wireless_diagnostics::google::protobuf::internal::log_handler_ = v2;
  if (v1 == wireless_diagnostics::google::protobuf::internal::NullLogHandler)
    return 0;
  else
    return v1;
}

wireless_diagnostics::google::protobuf::LogSilencer *wireless_diagnostics::google::protobuf::LogSilencer::LogSilencer(wireless_diagnostics::google::protobuf::LogSilencer *this)
{
  pthread_mutex_t **v2;

  wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(this);
  v2 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
  ++wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v2);
  return this;
}

void wireless_diagnostics::google::protobuf::LogSilencer::~LogSilencer(wireless_diagnostics::google::protobuf::LogSilencer *this)
{
  pthread_mutex_t **v1;

  wireless_diagnostics::google::protobuf::internal::InitLogSilencerCountOnce(this);
  v1 = (pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Lock((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::log_silencer_count_mutex_);
  --wireless_diagnostics::google::protobuf::internal::log_silencer_count_;
  wireless_diagnostics::google::protobuf::internal::Mutex::Unlock(v1);
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
  JUMPOUT(0x20BD0BE78);
}

void wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex(pthread_mutex_t **this)
{
  pthread_mutex_destroy(*this);
  if (*this)
    MEMORY[0x20BD0BE78](*this, 0x1000C40FA0F61DDLL);
}

uint64_t wireless_diagnostics::google::protobuf::ghtonl(wireless_diagnostics::google::protobuf *this)
{
  return bswap32(this);
}

void wireless_diagnostics::google::protobuf::ShutdownProtobufLibrary(wireless_diagnostics::google::protobuf *this)
{
  uint64_t v1;
  _QWORD *v2;
  void (**v3)(void);
  unint64_t v4;
  _QWORD v5[2];
  char v6;

  v1 = wireless_diagnostics::google::protobuf::internal::shutdown_functions_init;
  __dmb(0xBu);
  if (v1 != 2)
  {
    v5[0] = &off_24C0ED5D0;
    v5[1] = wireless_diagnostics::google::protobuf::internal::InitShutdownFunctions;
    v6 = 0;
    wireless_diagnostics::google::protobuf::GoogleOnceInitImpl((unint64_t *)&wireless_diagnostics::google::protobuf::internal::shutdown_functions_init, (uint64_t)v5);
  }
  v2 = (_QWORD *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
  if (wireless_diagnostics::google::protobuf::internal::shutdown_functions)
  {
    v3 = *(void (***)(void))(wireless_diagnostics::google::protobuf::internal::shutdown_functions + 8);
    if (v3 != *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions)
    {
      v4 = 0;
      v3 = *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions;
      do
      {
        v3[v4++]();
        v2 = (_QWORD *)wireless_diagnostics::google::protobuf::internal::shutdown_functions;
        v3 = *(void (***)(void))wireless_diagnostics::google::protobuf::internal::shutdown_functions;
      }
      while (v4 < (uint64_t)(v2[1] - *v2) >> 3);
    }
    if (v3)
    {
      v2[1] = v3;
      operator delete(v3);
    }
    MEMORY[0x20BD0BE78](v2, 0x80C40D6874129);
    wireless_diagnostics::google::protobuf::internal::shutdown_functions = 0;
    if (wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex)
    {
      wireless_diagnostics::google::protobuf::internal::Mutex::~Mutex((pthread_mutex_t **)wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex);
      MEMORY[0x20BD0BE78]();
    }
    wireless_diagnostics::google::protobuf::internal::shutdown_functions_mutex = 0;
  }
}

void wireless_diagnostics::google::protobuf::FatalException::~FatalException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&off_24C0ED108;
  if (SHIBYTE(this[5].__vftable) < 0)
    operator delete(this[3].__vftable);
  std::exception::~exception(this);
}

{
  wireless_diagnostics::google::protobuf::FatalException::~FatalException(this);
  JUMPOUT(0x20BD0BE78);
}

uint64_t wireless_diagnostics::google::protobuf::FatalException::what(wireless_diagnostics::google::protobuf::FatalException *this)
{
  uint64_t result;

  result = (uint64_t)this + 24;
  if (*((char *)this + 47) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t wireless_diagnostics::google::protobuf::FatalException::FatalException(uint64_t a1, uint64_t a2, int a3, __int128 *a4)
{
  std::string *v5;
  __int128 v6;

  *(_QWORD *)a1 = &off_24C0ED108;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  v5 = (std::string *)(a1 + 24);
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v6 = *a4;
    v5->__r_.__value_.__r.__words[2] = *((_QWORD *)a4 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return a1;
}

void sub_208FF1FCC(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
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

void std::vector<void (*)(void)>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void (*)(void)>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

double wireless_diagnostics::google::protobuf::internal::Infinity(wireless_diagnostics::google::protobuf::internal *this)
{
  return INFINITY;
}

double wireless_diagnostics::google::protobuf::internal::NaN(wireless_diagnostics::google::protobuf::internal *this)
{
  return NAN;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
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
  return off_24C0ECD30();
}

void operator delete(void *__p)
{
  off_24C0ECD38(__p);
}

uint64_t operator delete()
{
  return off_24C0ECD40();
}

uint64_t operator new[]()
{
  return off_24C0ECD48();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C0ECD50(__sz);
}

uint64_t operator new()
{
  return off_24C0ECD58();
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

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
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

int sched_yield(void)
{
  return MEMORY[0x24BDAFC68]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

