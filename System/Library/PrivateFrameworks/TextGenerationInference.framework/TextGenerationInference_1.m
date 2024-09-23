void sub_2480144CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_248014588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_24801465C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_248014738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<unsigned long long>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::rep(uint64_t a1)
{
  return google::protobuf::RepeatedField<unsigned long long>::elements(a1) - 8;
}

int *google::protobuf::RepeatedField<unsigned long long>::operator=(int *a1, int *a2)
{
  if (a1 != a2)
  {
    *a1 = 0;
    google::protobuf::RepeatedField<unsigned long long>::MergeFrom(a1, a2);
  }
  return a1;
}

void google::protobuf::RepeatedField<unsigned long long>::CopyFrom(int *a1, int *a2)
{
  if (a2 != a1)
  {
    *a1 = 0;
    google::protobuf::RepeatedField<unsigned long long>::MergeFrom(a1, a2);
  }
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::RepeatedField(uint64_t a1, __n128 *a2)
{
  unint64_t *v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (a2->n128_u32[1])
    v4 = (unint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2) - 8);
  else
    v4 = &a2->n128_u64[1];
  if (*v4)
  {
    if (a2 != (__n128 *)a1)
    {
      *(_DWORD *)a1 = 0;
      google::protobuf::RepeatedField<unsigned long long>::MergeFrom((int *)a1, (int *)a2);
    }
  }
  else
  {
    google::protobuf::RepeatedField<unsigned long long>::InternalSwap(a1, a2);
  }
  return a1;
}

{
  unint64_t *v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (a2->n128_u32[1])
    v4 = (unint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2) - 8);
  else
    v4 = &a2->n128_u64[1];
  if (*v4)
  {
    if (a2 != (__n128 *)a1)
    {
      *(_DWORD *)a1 = 0;
      google::protobuf::RepeatedField<unsigned long long>::MergeFrom((int *)a1, (int *)a2);
    }
  }
  else
  {
    google::protobuf::RepeatedField<unsigned long long>::InternalSwap(a1, a2);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::GetArena(uint64_t a1)
{
  uint64_t v1;

  if (*(_DWORD *)(a1 + 4))
    v1 = google::protobuf::RepeatedField<unsigned long long>::elements(a1) - 8;
  else
    v1 = a1 + 8;
  return *(_QWORD *)v1;
}

__n128 google::protobuf::RepeatedField<unsigned long long>::InternalSwap(uint64_t a1, __n128 *a2)
{
  std::string *v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  std::string *v8;
  unint64_t v9;
  unint64_t v10;
  __n128 result;
  char v12;
  std::string v13[2];

  if ((__n128 *)a1 == a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1459);
    v4 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: this != other: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 4))
    v5 = (uint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements(a1) - 8);
  else
    v5 = (uint64_t *)(a1 + 8);
  v6 = *v5;
  if (a2->n128_u32[1])
    v7 = (unint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2) - 8);
  else
    v7 = &a2->n128_u64[1];
  if (v6 != *v7)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1460);
    v8 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: GetArena() == other->GetArena(): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  result = *a2;
  *(__n128 *)a1 = *a2;
  a2->n128_u64[0] = v9;
  a2->n128_u64[1] = v10;
  return result;
}

void sub_2480149B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

int *google::protobuf::RepeatedField<unsigned long long>::operator=(int *a1, __n128 *a2)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t *v6;

  if (a1 != (int *)a2)
  {
    if (a1[1])
      v4 = (uint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
    else
      v4 = (uint64_t *)(a1 + 2);
    v5 = *v4;
    if (a2->n128_u32[1])
      v6 = (unint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2) - 8);
    else
      v6 = &a2->n128_u64[1];
    if (v5 == *v6)
    {
      google::protobuf::RepeatedField<unsigned long long>::InternalSwap((uint64_t)a1, a2);
    }
    else
    {
      *a1 = 0;
      google::protobuf::RepeatedField<unsigned long long>::MergeFrom(a1, (int *)a2);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_248014B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::at(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1308);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1309);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1315);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1316);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_248014C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void sub_248014D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Set(_DWORD *a1, int a2, uint64_t *a3)
{
  std::string *v6;
  std::string *v7;
  uint64_t v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1329);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1330);
    v7 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v8 = *a3;
  result = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
  *(_QWORD *)(result + 8 * a2) = v8;
  return result;
}

void sub_248014DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Add(int *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  if ((_DWORD)v3 == a1[1])
  {
    v5 = v3 + 1;
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a1, v3 + 1);
    result = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
    *(_QWORD *)(result + 8 * v3) = v4;
  }
  else
  {
    result = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
    *(_QWORD *)(result + 8 * v3) = v4;
    v5 = v3 + 1;
  }
  *a1 = v5;
  return result;
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::Add(int *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  if ((_DWORD)v2 == a1[1])
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a1, v2 + 1);
  result = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * v2;
  *a1 = v2 + 1;
  return result;
}

void google::protobuf::RepeatedField<unsigned long long>::RemoveLast(int *a1)
{
  int v2;
  std::string *v3;
  char v4;
  std::string v5[2];

  v2 = *a1;
  if (*a1 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1384);
    v3 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
    v2 = *a1;
  }
  *a1 = v2 - 1;
}

void sub_248014F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::ExtractSubrange(int *a1, int a2, int a3, _QWORD *a4)
{
  int v6;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  uint64_t v11;
  int v12;
  int i;
  uint64_t *v14;
  char v15;
  std::string v16[2];

  v6 = a2;
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1391);
    v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    if ((a3 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((a3 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1392);
  v9 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (num) >= (0): ");
  google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v9->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
LABEL_6:
  if (a3 + v6 > *a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1393);
    v10 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start + num) <= (this->current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
  }
  if (a4 && a3 >= 1)
  {
    v11 = a3;
    v12 = v6;
    do
    {
      *a4++ = *(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(a1, v12++);
      --v11;
    }
    while (v11);
  }
  if (a3 >= 1)
  {
    for (i = *a1; a3 + v6 < *a1; ++v6)
    {
      v14 = (uint64_t *)google::protobuf::RepeatedField<unsigned long long>::Get(a1, a3 + v6);
      google::protobuf::RepeatedField<unsigned long long>::Set(a1, v6, v14);
      i = *a1;
    }
    if (i >= 1)
      *a1 = i - a3;
  }
}

void sub_248015108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::Truncate(int *a1, int a2)
{
  int v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v4 = *a1;
  if (*a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
    v5 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (new_size) <= (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
    v4 = *a1;
  }
  if (v4 >= 1)
    *a1 = a2;
}

void sub_2480151B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<unsigned long long>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_2480152D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::AddAlreadyReserved(int *a1, uint64_t *a2)
{
  std::string *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  std::string v9[2];

  if (*a1 >= a1[1])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1266);
    v4 = google::protobuf::internal::LogMessage::operator<<(v9, "CHECK failed: (current_size_) < (total_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v8, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }
  v5 = *a2;
  result = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
  v7 = *a1;
  *a1 = v7 + 1;
  *(_QWORD *)(result + 8 * v7) = v5;
  return result;
}

void sub_248015380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::AddAlreadyReserved(int *a1)
{
  std::string *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  std::string v7[2];

  if (*a1 >= a1[1])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1272);
    v2 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (current_size_) < (total_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  v3 = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
  v4 = *a1;
  *a1 = v4 + 1;
  return v3 + 8 * v4;
}

void sub_24801541C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::Resize(int *a1, int a2, _QWORD *a3)
{
  std::string *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1291);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (new_size) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*a1 < a2)
  {
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a1, a2);
    v7 = (_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * *a1);
    v8 = google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) + 8 * a2 - (_QWORD)v7;
    if (v8 >= 1)
    {
      v9 = ((unint64_t)v8 >> 3) + 1;
      do
      {
        *v7++ = *a3;
        --v9;
      }
      while (v9 > 1);
    }
  }
  *a1 = a2;
}

void sub_248015508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::Swap(int *a1, __n128 *a2)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  __n128 v9;

  if (a1 != (int *)a2)
  {
    if (a1[1])
      v4 = (uint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
    else
      v4 = (uint64_t *)(a1 + 2);
    v5 = *v4;
    if (a2->n128_u32[1])
      v6 = (unint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2) - 8);
    else
      v6 = &a2->n128_u64[1];
    if (v5 == *v6)
    {
      google::protobuf::RepeatedField<unsigned long long>::InternalSwap((uint64_t)a1, a2);
    }
    else
    {
      if (a2->n128_u32[1])
        v7 = (unint64_t *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a2) - 8);
      else
        v7 = &a2->n128_u64[1];
      v8 = *v7;
      v9.n128_u64[0] = 0;
      v9.n128_u64[1] = v8;
      google::protobuf::RepeatedField<unsigned long long>::MergeFrom((int *)&v9, a1);
      *a1 = 0;
      google::protobuf::RepeatedField<unsigned long long>::MergeFrom(a1, (int *)a2);
      if (&v9 != a2)
        google::protobuf::RepeatedField<unsigned long long>::InternalSwap((uint64_t)a2, &v9);
      google::protobuf::RepeatedField<unsigned long long>::~RepeatedField((uint64_t)&v9);
    }
  }
}

void sub_24801561C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  google::protobuf::RepeatedField<unsigned long long>::~RepeatedField((uint64_t)&a9);
  _Unwind_Resume(a1);
}

double google::protobuf::RepeatedField<unsigned long long>::UnsafeArenaSwap(uint64_t a1, __n128 *a2)
{
  double result;

  if ((__n128 *)a1 != a2)
    *(_QWORD *)&result = google::protobuf::RepeatedField<unsigned long long>::InternalSwap(a1, a2).n128_u64[0];
  return result;
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::SwapElements(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v6 = google::protobuf::RepeatedField<unsigned long long>::elements(a1);
  result = google::protobuf::RepeatedField<unsigned long long>::elements(a1);
  v8 = *(_QWORD *)(v6 + 8 * a2);
  *(_QWORD *)(v6 + 8 * a2) = *(_QWORD *)(result + 8 * a3);
  *(_QWORD *)(result + 8 * a3) = v8;
  return result;
}

unint64_t google::protobuf::RepeatedField<unsigned long long>::SpaceUsedExcludingSelf(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  std::string *v3;
  char v5;
  std::string v6[2];

  v1 = *(unsigned int *)(a1 + 4);
  if ((int)v1 <= 0)
    v2 = 0;
  else
    v2 = 8 * v1 + 8;
  if (v2 >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/message_lite.h", 113);
    v3 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: (size) <= (static_cast<size_t>(2147483647)): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  return v2;
}

void sub_248015708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::erase(int *a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  std::string *v12;
  char v14;
  std::string v15[2];

  v4 = (_BYTE *)(a2 + 8);
  v5 = *((_QWORD *)a1 + 1);
  v6 = a2 - v5;
  v7 = *a1;
  v8 = (_BYTE *)(v5 + 8 * v7);
  v9 = v5 + 8 * (int)((unint64_t)v6 >> 3);
  v10 = v8 - v4;
  if (v8 != v4)
  {
    memmove((void *)(v5 + 8 * (int)((unint64_t)v6 >> 3)), v4, v8 - v4);
    v5 = *((_QWORD *)a1 + 1);
    LODWORD(v7) = *a1;
  }
  v11 = (unint64_t)(v9 + v10 - v5) >> 3;
  if ((int)v7 < (int)v11)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
    v12 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) <= (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    LODWORD(v7) = *a1;
  }
  if ((int)v7 >= 1)
    *a1 = v11;
  return *((_QWORD *)a1 + 1) + 8 * (int)(v6 >> 3);
}

void sub_2480157F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned long long>::erase(int *a1, _BYTE *a2, _BYTE *__src)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  std::string *v11;
  uint64_t v12;
  char v14;
  std::string v15[2];

  v4 = *((_QWORD *)a1 + 1);
  v5 = (uint64_t)&a2[-v4];
  if (a2 == __src)
  {
    v12 = (int)(v5 >> 3);
  }
  else
  {
    v6 = *a1;
    v7 = (_BYTE *)(v4 + 8 * v6);
    v8 = v4 + 8 * (int)((unint64_t)v5 >> 3);
    v9 = v7 - __src;
    if (v7 != __src)
    {
      memmove((void *)(v4 + 8 * (int)((unint64_t)v5 >> 3)), __src, v7 - __src);
      v4 = *((_QWORD *)a1 + 1);
      LODWORD(v6) = *a1;
    }
    v10 = (unint64_t)(v8 + v9 - v4) >> 3;
    if ((int)v6 < (int)v10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
      v11 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) <= (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
      LODWORD(v6) = *a1;
    }
    v12 = (int)(v5 >> 3);
    if ((int)v6 >= 1)
      *a1 = v10;
  }
  return *((_QWORD *)a1 + 1) + 8 * v12;
}

void sub_2480158EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::RepeatedField(uint64_t a1, int *a2)
{
  int v4;
  std::string *v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v10;
  std::string v11[2];

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = *a2;
  if (v4)
  {
    google::protobuf::RepeatedField<float>::Reserve((int *)a1, v4);
    google::protobuf::RepeatedField<float>::AddNAlreadyReserved(a1, *a2);
    if (*(int *)a1 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
      v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    }
    v6 = (void *)google::protobuf::RepeatedField<float>::elements(a1);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<float>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
  return a1;
}

void sub_248015A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 4 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0x7FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_248015BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 4 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_248015C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

void sub_248015D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

void sub_248015E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<float>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<float>::rep(uint64_t a1)
{
  return google::protobuf::RepeatedField<float>::elements(a1) - 8;
}

int *google::protobuf::RepeatedField<float>::operator=(int *a1, int *a2)
{
  if (a1 != a2)
  {
    *a1 = 0;
    google::protobuf::RepeatedField<float>::MergeFrom(a1, a2);
  }
  return a1;
}

void google::protobuf::RepeatedField<float>::CopyFrom(int *a1, int *a2)
{
  if (a2 != a1)
  {
    *a1 = 0;
    google::protobuf::RepeatedField<float>::MergeFrom(a1, a2);
  }
}

uint64_t google::protobuf::RepeatedField<float>::RepeatedField(uint64_t a1, __n128 *a2)
{
  unint64_t *v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (a2->n128_u32[1])
    v4 = (unint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a2) - 8);
  else
    v4 = &a2->n128_u64[1];
  if (*v4)
  {
    if (a2 != (__n128 *)a1)
    {
      *(_DWORD *)a1 = 0;
      google::protobuf::RepeatedField<float>::MergeFrom((int *)a1, (int *)a2);
    }
  }
  else
  {
    google::protobuf::RepeatedField<float>::InternalSwap(a1, a2);
  }
  return a1;
}

{
  unint64_t *v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (a2->n128_u32[1])
    v4 = (unint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a2) - 8);
  else
    v4 = &a2->n128_u64[1];
  if (*v4)
  {
    if (a2 != (__n128 *)a1)
    {
      *(_DWORD *)a1 = 0;
      google::protobuf::RepeatedField<float>::MergeFrom((int *)a1, (int *)a2);
    }
  }
  else
  {
    google::protobuf::RepeatedField<float>::InternalSwap(a1, a2);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<float>::GetArena(uint64_t a1)
{
  uint64_t v1;

  if (*(_DWORD *)(a1 + 4))
    v1 = google::protobuf::RepeatedField<float>::elements(a1) - 8;
  else
    v1 = a1 + 8;
  return *(_QWORD *)v1;
}

__n128 google::protobuf::RepeatedField<float>::InternalSwap(uint64_t a1, __n128 *a2)
{
  std::string *v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  std::string *v8;
  unint64_t v9;
  unint64_t v10;
  __n128 result;
  char v12;
  std::string v13[2];

  if ((__n128 *)a1 == a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1459);
    v4 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: this != other: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 4))
    v5 = (uint64_t *)(google::protobuf::RepeatedField<float>::elements(a1) - 8);
  else
    v5 = (uint64_t *)(a1 + 8);
  v6 = *v5;
  if (a2->n128_u32[1])
    v7 = (unint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a2) - 8);
  else
    v7 = &a2->n128_u64[1];
  if (v6 != *v7)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1460);
    v8 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: GetArena() == other->GetArena(): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  result = *a2;
  *(__n128 *)a1 = *a2;
  a2->n128_u64[0] = v9;
  a2->n128_u64[1] = v10;
  return result;
}

void sub_2480160B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

int *google::protobuf::RepeatedField<float>::operator=(int *a1, __n128 *a2)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t *v6;

  if (a1 != (int *)a2)
  {
    if (a1[1])
      v4 = (uint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
    else
      v4 = (uint64_t *)(a1 + 2);
    v5 = *v4;
    if (a2->n128_u32[1])
      v6 = (unint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a2) - 8);
    else
      v6 = &a2->n128_u64[1];
    if (v5 == *v6)
    {
      google::protobuf::RepeatedField<float>::InternalSwap((uint64_t)a1, a2);
    }
    else
    {
      *a1 = 0;
      google::protobuf::RepeatedField<float>::MergeFrom(a1, (int *)a2);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<float>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_24801625C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::at(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1308);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1309);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1315);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1316);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2;
}

void sub_248016338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void sub_248016414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Set(_DWORD *a1, int a2, int *a3)
{
  std::string *v6;
  std::string *v7;
  int v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1329);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1330);
    v7 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v8 = *a3;
  result = google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
  *(_DWORD *)(result + 4 * a2) = v8;
  return result;
}

void sub_248016508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::Add(int *a1, int *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  if ((_DWORD)v3 == a1[1])
  {
    v5 = v3 + 1;
    google::protobuf::RepeatedField<float>::Reserve(a1, v3 + 1);
    result = google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
    *(_DWORD *)(result + 4 * v3) = v4;
  }
  else
  {
    result = google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
    *(_DWORD *)(result + 4 * v3) = v4;
    v5 = v3 + 1;
  }
  *a1 = v5;
  return result;
}

uint64_t google::protobuf::RepeatedField<float>::Add(int *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  if ((_DWORD)v2 == a1[1])
    google::protobuf::RepeatedField<float>::Reserve(a1, v2 + 1);
  result = google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * v2;
  *a1 = v2 + 1;
  return result;
}

void google::protobuf::RepeatedField<float>::RemoveLast(int *a1)
{
  int v2;
  std::string *v3;
  char v4;
  std::string v5[2];

  v2 = *a1;
  if (*a1 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1384);
    v3 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
    v2 = *a1;
  }
  *a1 = v2 - 1;
}

void sub_248016660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::ExtractSubrange(int *a1, int a2, int a3, _DWORD *a4)
{
  int v6;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  uint64_t v11;
  int v12;
  int i;
  int *v14;
  char v15;
  std::string v16[2];

  v6 = a2;
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1391);
    v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    if ((a3 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((a3 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1392);
  v9 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (num) >= (0): ");
  google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v9->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
LABEL_6:
  if (a3 + v6 > *a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1393);
    v10 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start + num) <= (this->current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
  }
  if (a4 && a3 >= 1)
  {
    v11 = a3;
    v12 = v6;
    do
    {
      *a4++ = *(_DWORD *)google::protobuf::RepeatedField<float>::Get(a1, v12++);
      --v11;
    }
    while (v11);
  }
  if (a3 >= 1)
  {
    for (i = *a1; a3 + v6 < *a1; ++v6)
    {
      v14 = (int *)google::protobuf::RepeatedField<float>::Get(a1, a3 + v6);
      google::protobuf::RepeatedField<float>::Set(a1, v6, v14);
      i = *a1;
    }
    if (i >= 1)
      *a1 = i - a3;
  }
}

void sub_24801681C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::Truncate(int *a1, int a2)
{
  int v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v4 = *a1;
  if (*a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
    v5 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (new_size) <= (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
    v4 = *a1;
  }
  if (v4 >= 1)
    *a1 = a2;
}

void sub_2480168C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<float>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<float>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<float>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_2480169E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::AddAlreadyReserved(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  std::string v9[2];

  if (*a1 >= a1[1])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1266);
    v4 = google::protobuf::internal::LogMessage::operator<<(v9, "CHECK failed: (current_size_) < (total_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v8, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }
  v5 = *a2;
  result = google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
  v7 = *a1;
  *a1 = v7 + 1;
  *(_DWORD *)(result + 4 * v7) = v5;
  return result;
}

void sub_248016A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::AddAlreadyReserved(int *a1)
{
  std::string *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  std::string v7[2];

  if (*a1 >= a1[1])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1272);
    v2 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (current_size_) < (total_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  v3 = google::protobuf::RepeatedField<float>::elements((uint64_t)a1);
  v4 = *a1;
  *a1 = v4 + 1;
  return v3 + 4 * v4;
}

void sub_248016B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::Resize(int *a1, int a2, _DWORD *a3)
{
  std::string *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1291);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (new_size) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*a1 < a2)
  {
    google::protobuf::RepeatedField<float>::Reserve(a1, a2);
    v7 = (_DWORD *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * *a1);
    v8 = google::protobuf::RepeatedField<float>::elements((uint64_t)a1) + 4 * a2 - (_QWORD)v7;
    if (v8 >= 1)
    {
      v9 = ((unint64_t)v8 >> 2) + 1;
      do
      {
        *v7++ = *a3;
        --v9;
      }
      while (v9 > 1);
    }
  }
  *a1 = a2;
}

void sub_248016C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<float>::Swap(int *a1, __n128 *a2)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  __n128 v9;

  if (a1 != (int *)a2)
  {
    if (a1[1])
      v4 = (uint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a1) - 8);
    else
      v4 = (uint64_t *)(a1 + 2);
    v5 = *v4;
    if (a2->n128_u32[1])
      v6 = (unint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a2) - 8);
    else
      v6 = &a2->n128_u64[1];
    if (v5 == *v6)
    {
      google::protobuf::RepeatedField<float>::InternalSwap((uint64_t)a1, a2);
    }
    else
    {
      if (a2->n128_u32[1])
        v7 = (unint64_t *)(google::protobuf::RepeatedField<float>::elements((uint64_t)a2) - 8);
      else
        v7 = &a2->n128_u64[1];
      v8 = *v7;
      v9.n128_u64[0] = 0;
      v9.n128_u64[1] = v8;
      google::protobuf::RepeatedField<float>::MergeFrom((int *)&v9, a1);
      *a1 = 0;
      google::protobuf::RepeatedField<float>::MergeFrom(a1, (int *)a2);
      if (&v9 != a2)
        google::protobuf::RepeatedField<float>::InternalSwap((uint64_t)a2, &v9);
      google::protobuf::RepeatedField<float>::~RepeatedField((uint64_t)&v9);
    }
  }
}

void sub_248016D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  google::protobuf::RepeatedField<float>::~RepeatedField((uint64_t)&a9);
  _Unwind_Resume(a1);
}

double google::protobuf::RepeatedField<float>::UnsafeArenaSwap(uint64_t a1, __n128 *a2)
{
  double result;

  if ((__n128 *)a1 != a2)
    *(_QWORD *)&result = google::protobuf::RepeatedField<float>::InternalSwap(a1, a2).n128_u64[0];
  return result;
}

float google::protobuf::RepeatedField<float>::SwapElements(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  float result;

  v6 = google::protobuf::RepeatedField<float>::elements(a1);
  v7 = google::protobuf::RepeatedField<float>::elements(a1);
  result = *(float *)(v6 + 4 * a2);
  *(_DWORD *)(v6 + 4 * a2) = *(_DWORD *)(v7 + 4 * a3);
  *(float *)(v7 + 4 * a3) = result;
  return result;
}

unint64_t google::protobuf::RepeatedField<float>::SpaceUsedExcludingSelf(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  std::string *v3;
  char v5;
  std::string v6[2];

  v1 = *(unsigned int *)(a1 + 4);
  if ((int)v1 <= 0)
    v2 = 0;
  else
    v2 = 4 * v1 + 8;
  if (v2 >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/message_lite.h", 113);
    v3 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: (size) <= (static_cast<size_t>(2147483647)): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  return v2;
}

void sub_248016E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::erase(int *a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  std::string *v12;
  char v14;
  std::string v15[2];

  v4 = (_BYTE *)(a2 + 4);
  v5 = *((_QWORD *)a1 + 1);
  v6 = a2 - v5;
  v7 = *a1;
  v8 = (_BYTE *)(v5 + 4 * v7);
  v9 = v5 + 4 * (int)((unint64_t)v6 >> 2);
  v10 = v8 - v4;
  if (v8 != v4)
  {
    memmove((void *)(v5 + 4 * (int)((unint64_t)v6 >> 2)), v4, v8 - v4);
    v5 = *((_QWORD *)a1 + 1);
    LODWORD(v7) = *a1;
  }
  v11 = (unint64_t)(v9 + v10 - v5) >> 2;
  if ((int)v7 < (int)v11)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
    v12 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) <= (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    LODWORD(v7) = *a1;
  }
  if ((int)v7 >= 1)
    *a1 = v11;
  return *((_QWORD *)a1 + 1) + 4 * (int)(v6 >> 2);
}

void sub_248016F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<float>::erase(int *a1, _BYTE *a2, _BYTE *__src)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  std::string *v11;
  uint64_t v12;
  char v14;
  std::string v15[2];

  v4 = *((_QWORD *)a1 + 1);
  v5 = (uint64_t)&a2[-v4];
  if (a2 == __src)
  {
    v12 = (int)(v5 >> 2);
  }
  else
  {
    v6 = *a1;
    v7 = (_BYTE *)(v4 + 4 * v6);
    v8 = v4 + 4 * (int)((unint64_t)v5 >> 2);
    v9 = v7 - __src;
    if (v7 != __src)
    {
      memmove((void *)(v4 + 4 * (int)((unint64_t)v5 >> 2)), __src, v7 - __src);
      v4 = *((_QWORD *)a1 + 1);
      LODWORD(v6) = *a1;
    }
    v10 = (unint64_t)(v8 + v9 - v4) >> 2;
    if ((int)v6 < (int)v10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
      v11 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) <= (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
      LODWORD(v6) = *a1;
    }
    v12 = (int)(v5 >> 2);
    if ((int)v6 >= 1)
      *a1 = v10;
  }
  return *((_QWORD *)a1 + 1) + 4 * v12;
}

void sub_248017008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::RepeatedField(uint64_t a1, int *a2)
{
  int v4;
  std::string *v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v10;
  std::string v11[2];

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = *a2;
  if (v4)
  {
    google::protobuf::RepeatedField<double>::Reserve((int *)a1, v4);
    google::protobuf::RepeatedField<double>::AddNAlreadyReserved(a1, *a2);
    if (*(int *)a1 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
      v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    }
    v6 = (void *)google::protobuf::RepeatedField<double>::elements(a1);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<double>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
  return a1;
}

void sub_24801712C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *AlignedNoHook;
  void *v14;
  char v15;
  std::string v16[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
          }
          v9 = 0x7FFFFFFF;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (_QWORD *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
    if (a1[1])
      goto LABEL_4;
  }
  v6 = *((_QWORD *)a1 + 1);
  if (a2 >= 4)
  {
    v7 = 0;
LABEL_13:
    v10 = 2 * v7;
    if (v10 <= a2)
      v9 = a2;
    else
      v9 = v10;
    goto LABEL_16;
  }
LABEL_11:
  v9 = 4;
LABEL_16:
  v11 = 8 * v9;
  if (v6)
  {
    v12 = (v11 + 15) & 0xFFFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v12);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v12);
  }
  else
  {
    AlignedNoHook = operator new(v11 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_2480172EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::AddNAlreadyReserved(uint64_t a1, int a2)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)(a1 + 4) - *(_DWORD *)a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1278);
    v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (total_size_ - current_size_) >= (n): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, *(_DWORD *)(a1 + 4));
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, ", ");
    v8 = google::protobuf::internal::LogMessage::operator<<(v7, *(_DWORD *)a1);
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v4 = *(_DWORD *)a1;
  }
  result = *(_QWORD *)(a1 + 8) + 8 * v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_2480173A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Mutable(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1322);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1323);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

void sub_24801747C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Get(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1301);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

void sub_248017558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<double>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<double>::rep(uint64_t a1)
{
  return google::protobuf::RepeatedField<double>::elements(a1) - 8;
}

int *google::protobuf::RepeatedField<double>::operator=(int *a1, int *a2)
{
  if (a1 != a2)
  {
    *a1 = 0;
    google::protobuf::RepeatedField<double>::MergeFrom(a1, a2);
  }
  return a1;
}

void google::protobuf::RepeatedField<double>::CopyFrom(int *a1, int *a2)
{
  if (a2 != a1)
  {
    *a1 = 0;
    google::protobuf::RepeatedField<double>::MergeFrom(a1, a2);
  }
}

uint64_t google::protobuf::RepeatedField<double>::RepeatedField(uint64_t a1, __n128 *a2)
{
  unint64_t *v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (a2->n128_u32[1])
    v4 = (unint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a2) - 8);
  else
    v4 = &a2->n128_u64[1];
  if (*v4)
  {
    if (a2 != (__n128 *)a1)
    {
      *(_DWORD *)a1 = 0;
      google::protobuf::RepeatedField<double>::MergeFrom((int *)a1, (int *)a2);
    }
  }
  else
  {
    google::protobuf::RepeatedField<double>::InternalSwap(a1, a2);
  }
  return a1;
}

{
  unint64_t *v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (a2->n128_u32[1])
    v4 = (unint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a2) - 8);
  else
    v4 = &a2->n128_u64[1];
  if (*v4)
  {
    if (a2 != (__n128 *)a1)
    {
      *(_DWORD *)a1 = 0;
      google::protobuf::RepeatedField<double>::MergeFrom((int *)a1, (int *)a2);
    }
  }
  else
  {
    google::protobuf::RepeatedField<double>::InternalSwap(a1, a2);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<double>::GetArena(uint64_t a1)
{
  uint64_t v1;

  if (*(_DWORD *)(a1 + 4))
    v1 = google::protobuf::RepeatedField<double>::elements(a1) - 8;
  else
    v1 = a1 + 8;
  return *(_QWORD *)v1;
}

__n128 google::protobuf::RepeatedField<double>::InternalSwap(uint64_t a1, __n128 *a2)
{
  std::string *v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  std::string *v8;
  unint64_t v9;
  unint64_t v10;
  __n128 result;
  char v12;
  std::string v13[2];

  if ((__n128 *)a1 == a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1459);
    v4 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: this != other: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 4))
    v5 = (uint64_t *)(google::protobuf::RepeatedField<double>::elements(a1) - 8);
  else
    v5 = (uint64_t *)(a1 + 8);
  v6 = *v5;
  if (a2->n128_u32[1])
    v7 = (unint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a2) - 8);
  else
    v7 = &a2->n128_u64[1];
  if (v6 != *v7)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1460);
    v8 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: GetArena() == other->GetArena(): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  v9 = *(_QWORD *)a1;
  v10 = *(_QWORD *)(a1 + 8);
  result = *a2;
  *(__n128 *)a1 = *a2;
  a2->n128_u64[0] = v9;
  a2->n128_u64[1] = v10;
  return result;
}

void sub_2480177D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

int *google::protobuf::RepeatedField<double>::operator=(int *a1, __n128 *a2)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t *v6;

  if (a1 != (int *)a2)
  {
    if (a1[1])
      v4 = (uint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
    else
      v4 = (uint64_t *)(a1 + 2);
    v5 = *v4;
    if (a2->n128_u32[1])
      v6 = (unint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a2) - 8);
    else
      v6 = &a2->n128_u64[1];
    if (v5 == *v6)
    {
      google::protobuf::RepeatedField<double>::InternalSwap((uint64_t)a1, a2);
    }
    else
    {
      *a1 = 0;
      google::protobuf::RepeatedField<double>::MergeFrom(a1, (int *)a2);
    }
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<double>::elements(uint64_t a1)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  if (*(int *)(a1 + 4) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 352);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (total_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(a1 + 8);
}

void sub_248017978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::at(_DWORD *a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1308);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1309);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1315);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1316);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2;
}

void sub_248017A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void sub_248017B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Set(_DWORD *a1, int a2, uint64_t *a3)
{
  std::string *v6;
  std::string *v7;
  uint64_t v8;
  uint64_t result;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1329);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*a1 <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1330);
    v7 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v8 = *a3;
  result = google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
  *(_QWORD *)(result + 8 * a2) = v8;
  return result;
}

void sub_248017C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::Add(int *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  if ((_DWORD)v3 == a1[1])
  {
    v5 = v3 + 1;
    google::protobuf::RepeatedField<double>::Reserve(a1, v3 + 1);
    result = google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
    *(_QWORD *)(result + 8 * v3) = v4;
  }
  else
  {
    result = google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
    *(_QWORD *)(result + 8 * v3) = v4;
    v5 = v3 + 1;
  }
  *a1 = v5;
  return result;
}

uint64_t google::protobuf::RepeatedField<double>::Add(int *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  if ((_DWORD)v2 == a1[1])
    google::protobuf::RepeatedField<double>::Reserve(a1, v2 + 1);
  result = google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * v2;
  *a1 = v2 + 1;
  return result;
}

void google::protobuf::RepeatedField<double>::RemoveLast(int *a1)
{
  int v2;
  std::string *v3;
  char v4;
  std::string v5[2];

  v2 = *a1;
  if (*a1 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1384);
    v3 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
    v2 = *a1;
  }
  *a1 = v2 - 1;
}

void sub_248017D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::ExtractSubrange(int *a1, int a2, int a3, _QWORD *a4)
{
  int v6;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  uint64_t v11;
  int v12;
  int i;
  uint64_t *v14;
  char v15;
  std::string v16[2];

  v6 = a2;
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1391);
    v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    if ((a3 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((a3 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1392);
  v9 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (num) >= (0): ");
  google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v9->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
LABEL_6:
  if (a3 + v6 > *a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1393);
    v10 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start + num) <= (this->current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
  }
  if (a4 && a3 >= 1)
  {
    v11 = a3;
    v12 = v6;
    do
    {
      *a4++ = *(_QWORD *)google::protobuf::RepeatedField<double>::Get(a1, v12++);
      --v11;
    }
    while (v11);
  }
  if (a3 >= 1)
  {
    for (i = *a1; a3 + v6 < *a1; ++v6)
    {
      v14 = (uint64_t *)google::protobuf::RepeatedField<double>::Get(a1, a3 + v6);
      google::protobuf::RepeatedField<double>::Set(a1, v6, v14);
      i = *a1;
    }
    if (i >= 1)
      *a1 = i - a3;
  }
}

void sub_248017F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::Truncate(int *a1, int a2)
{
  int v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v4 = *a1;
  if (*a1 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
    v5 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (new_size) <= (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
    v4 = *a1;
  }
  if (v4 >= 1)
    *a1 = a2;
}

void sub_248017FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::MergeFrom(int *a1, int *a2)
{
  std::string *v4;
  int v5;
  void *v6;
  std::string *v7;
  const void *v8;
  char v9;
  std::string v10[2];

  if (a2 == a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1415);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (&other) != (this): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (*a2)
  {
    v5 = *a1;
    google::protobuf::RepeatedField<double>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<double>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<double>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_248018104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::AddAlreadyReserved(int *a1, uint64_t *a2)
{
  std::string *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  std::string v9[2];

  if (*a1 >= a1[1])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1266);
    v4 = google::protobuf::internal::LogMessage::operator<<(v9, "CHECK failed: (current_size_) < (total_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v8, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }
  v5 = *a2;
  result = google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
  v7 = *a1;
  *a1 = v7 + 1;
  *(_QWORD *)(result + 8 * v7) = v5;
  return result;
}

void sub_2480181B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::AddAlreadyReserved(int *a1)
{
  std::string *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  std::string v7[2];

  if (*a1 >= a1[1])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1272);
    v2 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (current_size_) < (total_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  v3 = google::protobuf::RepeatedField<double>::elements((uint64_t)a1);
  v4 = *a1;
  *a1 = v4 + 1;
  return v3 + 8 * v4;
}

void sub_248018254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::Resize(int *a1, int a2, _QWORD *a3)
{
  std::string *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1291);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (new_size) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*a1 < a2)
  {
    google::protobuf::RepeatedField<double>::Reserve(a1, a2);
    v7 = (_QWORD *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * *a1);
    v8 = google::protobuf::RepeatedField<double>::elements((uint64_t)a1) + 8 * a2 - (_QWORD)v7;
    if (v8 >= 1)
    {
      v9 = ((unint64_t)v8 >> 3) + 1;
      do
      {
        *v7++ = *a3;
        --v9;
      }
      while (v9 > 1);
    }
  }
  *a1 = a2;
}

void sub_248018340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<double>::Swap(int *a1, __n128 *a2)
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  __n128 v9;

  if (a1 != (int *)a2)
  {
    if (a1[1])
      v4 = (uint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a1) - 8);
    else
      v4 = (uint64_t *)(a1 + 2);
    v5 = *v4;
    if (a2->n128_u32[1])
      v6 = (unint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a2) - 8);
    else
      v6 = &a2->n128_u64[1];
    if (v5 == *v6)
    {
      google::protobuf::RepeatedField<double>::InternalSwap((uint64_t)a1, a2);
    }
    else
    {
      if (a2->n128_u32[1])
        v7 = (unint64_t *)(google::protobuf::RepeatedField<double>::elements((uint64_t)a2) - 8);
      else
        v7 = &a2->n128_u64[1];
      v8 = *v7;
      v9.n128_u64[0] = 0;
      v9.n128_u64[1] = v8;
      google::protobuf::RepeatedField<double>::MergeFrom((int *)&v9, a1);
      *a1 = 0;
      google::protobuf::RepeatedField<double>::MergeFrom(a1, (int *)a2);
      if (&v9 != a2)
        google::protobuf::RepeatedField<double>::InternalSwap((uint64_t)a2, &v9);
      google::protobuf::RepeatedField<double>::~RepeatedField((uint64_t)&v9);
    }
  }
}

void sub_248018454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  google::protobuf::RepeatedField<double>::~RepeatedField((uint64_t)&a9);
  _Unwind_Resume(a1);
}

double google::protobuf::RepeatedField<double>::UnsafeArenaSwap(uint64_t a1, __n128 *a2)
{
  double result;

  if ((__n128 *)a1 != a2)
    *(_QWORD *)&result = google::protobuf::RepeatedField<double>::InternalSwap(a1, a2).n128_u64[0];
  return result;
}

double google::protobuf::RepeatedField<double>::SwapElements(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  double result;

  v6 = google::protobuf::RepeatedField<double>::elements(a1);
  v7 = google::protobuf::RepeatedField<double>::elements(a1);
  result = *(double *)(v6 + 8 * a2);
  *(_QWORD *)(v6 + 8 * a2) = *(_QWORD *)(v7 + 8 * a3);
  *(double *)(v7 + 8 * a3) = result;
  return result;
}

unint64_t google::protobuf::RepeatedField<double>::SpaceUsedExcludingSelf(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  std::string *v3;
  char v5;
  std::string v6[2];

  v1 = *(unsigned int *)(a1 + 4);
  if ((int)v1 <= 0)
    v2 = 0;
  else
    v2 = 8 * v1 + 8;
  if (v2 >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/message_lite.h", 113);
    v3 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: (size) <= (static_cast<size_t>(2147483647)): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  return v2;
}

void sub_248018540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::erase(int *a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  std::string *v12;
  char v14;
  std::string v15[2];

  v4 = (_BYTE *)(a2 + 8);
  v5 = *((_QWORD *)a1 + 1);
  v6 = a2 - v5;
  v7 = *a1;
  v8 = (_BYTE *)(v5 + 8 * v7);
  v9 = v5 + 8 * (int)((unint64_t)v6 >> 3);
  v10 = v8 - v4;
  if (v8 != v4)
  {
    memmove((void *)(v5 + 8 * (int)((unint64_t)v6 >> 3)), v4, v8 - v4);
    v5 = *((_QWORD *)a1 + 1);
    LODWORD(v7) = *a1;
  }
  v11 = (unint64_t)(v9 + v10 - v5) >> 3;
  if ((int)v7 < (int)v11)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
    v12 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) <= (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    LODWORD(v7) = *a1;
  }
  if ((int)v7 >= 1)
    *a1 = v11;
  return *((_QWORD *)a1 + 1) + 8 * (int)(v6 >> 3);
}

void sub_24801862C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<double>::erase(int *a1, _BYTE *a2, _BYTE *__src)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  std::string *v11;
  uint64_t v12;
  char v14;
  std::string v15[2];

  v4 = *((_QWORD *)a1 + 1);
  v5 = (uint64_t)&a2[-v4];
  if (a2 == __src)
  {
    v12 = (int)(v5 >> 3);
  }
  else
  {
    v6 = *a1;
    v7 = (_BYTE *)(v4 + 8 * v6);
    v8 = v4 + 8 * (int)((unint64_t)v5 >> 3);
    v9 = v7 - __src;
    if (v7 != __src)
    {
      memmove((void *)(v4 + 8 * (int)((unint64_t)v5 >> 3)), __src, v7 - __src);
      v4 = *((_QWORD *)a1 + 1);
      LODWORD(v6) = *a1;
    }
    v10 = (unint64_t)(v8 + v9 - v4) >> 3;
    if ((int)v6 < (int)v10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1609);
      v11 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) <= (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
      LODWORD(v6) = *a1;
    }
    v12 = (int)(v5 >> 3);
    if ((int)v6 >= 1)
      *a1 = v10;
  }
  return *((_QWORD *)a1 + 1) + 8 * v12;
}

void sub_248018724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *google::protobuf::RepeatedPtrField<std::string>::RepeatedPtrField(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

_QWORD *google::protobuf::RepeatedPtrField<std::string>::RepeatedPtrField(_QWORD *result, uint64_t a2)
{
  result[1] = 0;
  result[2] = 0;
  *result = a2;
  return result;
}

_QWORD *google::protobuf::RepeatedPtrField<std::string>::RepeatedPtrField(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a1, a2);
  return a1;
}

{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a1, a2);
  return a1;
}

void sub_248018780(_Unwind_Exception *a1)
{
  google::protobuf::internal::ArenaImpl **v1;

  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(v1);
  _Unwind_Resume(a1);
}

void sub_2480187C4(_Unwind_Exception *a1)
{
  google::protobuf::internal::ArenaImpl **v1;

  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(v1);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedPtrField<std::string>::~RepeatedPtrField(google::protobuf::internal::ArenaImpl **a1)
{
  google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1);
  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(a1);
}

void google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(_QWORD *a1)
{
  unsigned int *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    v3 = (uint64_t *)(v2 + 2);
    v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        v5 = *v3;
        if (*v3)
        {
          if (*(char *)(v5 + 23) < 0)
            operator delete(*(void **)v5);
          MEMORY[0x249596C64](v5, 0x1012C40EC159624);
        }
        ++v3;
        --v4;
      }
      while (v4);
      v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1);
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1, a2);
  }
  return a1;
}

void google::protobuf::RepeatedPtrField<std::string>::CopyFrom(uint64_t a1, uint64_t a2)
{
  if (a2 != a1)
  {
    google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1);
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1, a2);
  }
}

google::protobuf::internal::RepeatedPtrFieldBase *google::protobuf::RepeatedPtrField<std::string>::RepeatedPtrField(google::protobuf::internal::RepeatedPtrFieldBase *this, google::protobuf::internal::RepeatedPtrFieldBase *a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  if (*(_QWORD *)a2)
  {
    if (a2 != this)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this);
      google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this, (uint64_t)a2);
    }
  }
  else
  {
    google::protobuf::internal::RepeatedPtrFieldBase::InternalSwap(this, a2);
  }
  return this;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  if (*(_QWORD *)a2)
  {
    if (a2 != this)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this);
      google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this, (uint64_t)a2);
    }
  }
  else
  {
    google::protobuf::internal::RepeatedPtrFieldBase::InternalSwap(this, a2);
  }
  return this;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::GetArena(uint64_t a1)
{
  return *(_QWORD *)a1;
}

google::protobuf::internal::RepeatedPtrFieldBase *google::protobuf::RepeatedPtrField<std::string>::operator=(google::protobuf::internal::RepeatedPtrFieldBase *this, google::protobuf::internal::RepeatedPtrFieldBase *a2)
{
  if (this != a2)
  {
    if (*(_QWORD *)this == *(_QWORD *)a2)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalSwap(this, a2);
    }
    else
    {
      google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this);
      google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this, (uint64_t)a2);
    }
  }
  return this;
}

BOOL google::protobuf::RepeatedPtrField<std::string>::empty(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) == 0;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

_QWORD *google::protobuf::RepeatedPtrField<std::string>::Add(uint64_t *a1)
{
  int *v2;
  int v3;
  int v4;
  _QWORD *result;
  BOOL v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (int *)a1[2];
  if (!v2)
  {
    v3 = *((_DWORD *)a1 + 2);
    v4 = *((_DWORD *)a1 + 3);
LABEL_6:
    v6 = __OFSUB__(v4, v3);
    v7 = v4 - v3;
    if (v7 < 0 == v6)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)a1, v7 + 1);
      v2 = (int *)a1[2];
    }
    goto LABEL_8;
  }
  v3 = *((_DWORD *)a1 + 2);
  v4 = *v2;
  if (v3 < *v2)
  {
    *((_DWORD *)a1 + 2) = v3 + 1;
    return *(_QWORD **)&v2[2 * v3 + 2];
  }
  if (v4 == *((_DWORD *)a1 + 3))
    goto LABEL_6;
LABEL_8:
  ++*v2;
  v8 = *a1;
  if (*a1)
  {
    if ((*(_BYTE *)(v8 + 24) & 1) != 0)
    result = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v8, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
  }
  else
  {
    result = (_QWORD *)operator new();
  }
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  v9 = a1[2];
  v10 = *((int *)a1 + 2);
  *((_DWORD *)a1 + 2) = v10 + 1;
  *(_QWORD *)(v9 + 8 * v10 + 8) = result;
  return result;
}

__n128 google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<std::string>::TypeHandler,(void *)0>(uint64_t *a1, __n128 *a2)
{
  int *v4;
  int v5;
  int v6;
  uint64_t v7;
  __n128 result;
  uint64_t v9;
  __n128 *AlignedAndAddCleanup;
  uint64_t v11;
  uint64_t v12;

  v4 = (int *)a1[2];
  if (!v4)
  {
    v5 = *((_DWORD *)a1 + 2);
    v6 = *((_DWORD *)a1 + 3);
LABEL_8:
    if (v5 <= v6)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)a1, v6 - v5 + 1);
      v4 = (int *)a1[2];
    }
    goto LABEL_10;
  }
  v5 = *((_DWORD *)a1 + 2);
  v6 = *v4;
  if (v5 < *v4)
  {
    *((_DWORD *)a1 + 2) = v5 + 1;
    v7 = *(_QWORD *)&v4[2 * v5 + 2];
    if (*(char *)(v7 + 23) < 0)
      operator delete(*(void **)v7);
    result = *a2;
    *(_QWORD *)(v7 + 16) = a2[1].n128_u64[0];
    *(__n128 *)v7 = result;
    a2[1].n128_u8[7] = 0;
    a2->n128_u8[0] = 0;
    return result;
  }
  if (v6 == *((_DWORD *)a1 + 3))
    goto LABEL_8;
LABEL_10:
  ++*v4;
  v9 = *a1;
  if (*a1)
  {
    if ((*(_BYTE *)(v9 + 24) & 1) != 0)
    AlignedAndAddCleanup = (__n128 *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v9, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
  }
  else
  {
    AlignedAndAddCleanup = (__n128 *)operator new();
  }
  result = *a2;
  AlignedAndAddCleanup[1].n128_u64[0] = a2[1].n128_u64[0];
  *AlignedAndAddCleanup = result;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  a2->n128_u64[0] = 0;
  v11 = a1[2];
  v12 = *((int *)a1 + 2);
  *((_DWORD *)a1 + 2) = v12 + 1;
  *(_QWORD *)(v11 + 8 * v12 + 8) = AlignedAndAddCleanup;
  return result;
}

uint64_t google::protobuf::internal::RepeatedPtrFieldBase::at<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(uint64_t a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1713);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1714);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2 + 8);
}

{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1720);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1721);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2 + 8);
}

void sub_248018D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void sub_248018E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedPtrField<std::string>::RemoveLast(uint64_t a1)
{
  int v2;
  std::string *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  std::string v8[2];

  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1773);
    v3 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
    v2 = *(_DWORD *)(a1 + 8);
  }
  v4 = *(_QWORD *)(a1 + 16);
  v5 = v2 - 1;
  *(_DWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(v4 + 8 * v5 + 8);
  if (*(char *)(v6 + 23) < 0)
  {
    **(_BYTE **)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0;
  }
  else
  {
    *(_BYTE *)v6 = 0;
    *(_BYTE *)(v6 + 23) = 0;
  }
}

void sub_248018F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedPtrField<std::string>::DeleteSubrange(google::protobuf::internal::RepeatedPtrFieldBase *this, int a2, int a3)
{
  std::string *v6;
  std::string *v7;
  std::string *v8;
  int v9;
  int v10;
  char v11;
  std::string v12[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2209);
    v6 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: (start) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
    if ((a3 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((a3 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2210);
  v7 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: (num) >= (0): ");
  google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v7->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
LABEL_6:
  if (a3 + a2 > *((_DWORD *)this + 2))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2211);
    v8 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: (start + num) <= (size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
  }
  if (a3 >= 1)
  {
    v9 = a2;
    v10 = a3;
    do
    {
      google::protobuf::internal::RepeatedPtrFieldBase::Delete<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this, v9++);
      --v10;
    }
    while (v10);
  }
  google::protobuf::RepeatedPtrField<std::string>::ExtractSubrangeInternal(this, a2, a3, 0);
}

void sub_248019088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::RepeatedPtrFieldBase::Delete<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(uint64_t a1, int a2)
{
  std::string *v4;
  std::string *v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  std::string v9[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1734);
    v4 = google::protobuf::internal::LogMessage::operator<<(v9, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v8, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1735);
    v5 = google::protobuf::internal::LogMessage::operator<<(v9, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v8, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2 + 8);
  if (v6)
    v7 = *(_QWORD *)a1 == 0;
  else
    v7 = 0;
  if (v7)
  {
    if (*(char *)(v6 + 23) < 0)
      operator delete(*(void **)v6);
    MEMORY[0x249596C64](v6, 0x1012C40EC159624);
  }
}

void sub_2480191A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned int *google::protobuf::RepeatedPtrField<std::string>::Reserve(unsigned int *result, int a2)
{
  unsigned int v2;
  BOOL v3;
  int v4;

  v2 = result[2];
  v3 = __OFSUB__(a2, v2);
  v4 = a2 - v2;
  if (!((v4 < 0) ^ v3 | (v4 == 0)))
    return google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)result, v4);
  return result;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::Capacity(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::mutable_data(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
    return v1 + 8;
  else
    return 0;
}

double google::protobuf::RepeatedPtrField<std::string>::Swap(_QWORD *a1, google::protobuf::internal::RepeatedPtrFieldBase *a2)
{
  double result;

  if (a1 != (_QWORD *)a2)
  {
    if (*(_QWORD *)a2 == *a1)
      *(_QWORD *)&result = google::protobuf::internal::RepeatedPtrFieldBase::InternalSwap((google::protobuf::internal::RepeatedPtrFieldBase *)a1, a2).n128_u64[0];
    else
      google::protobuf::internal::RepeatedPtrFieldBase::SwapFallback<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1, a2);
  }
  return result;
}

double google::protobuf::RepeatedPtrField<std::string>::UnsafeArenaSwap(google::protobuf::internal::RepeatedPtrFieldBase *this, google::protobuf::internal::RepeatedPtrFieldBase *a2)
{
  double result;

  if (this != a2)
    *(_QWORD *)&result = google::protobuf::internal::RepeatedPtrFieldBase::InternalSwap(this, a2).n128_u64[0];
  return result;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::SwapElements(uint64_t result, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 16) + 8;
  v4 = *(_QWORD *)(v3 + 8 * a2);
  *(_QWORD *)(v3 + 8 * a2) = *(_QWORD *)(v3 + 8 * a3);
  *(_QWORD *)(v3 + 8 * a3) = v4;
  return result;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::end(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
    v2 = v1 + 8;
  else
    v2 = 0;
  return v2 + 8 * *(int *)(a1 + 8);
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::rbegin(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
    v2 = v1 + 8;
  else
    v2 = 0;
  return v2 + 8 * *(int *)(a1 + 8);
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::rend(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
    return v1 + 8;
  else
    return 0;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::SpaceUsedExcludingSelfLong(uint64_t a1)
{
  uint64_t v1;
  int *v2;
  uint64_t v4;

  v1 = 8 * *(int *)(a1 + 12);
  v2 = *(int **)(a1 + 16);
  if (v2)
  {
    if (*v2 >= 1)
    {
      v4 = 0;
      do
      {
        v1 += google::protobuf::internal::StringSpaceUsedExcludingSelfLong(*(_QWORD *)&v2[2 * v4++ + 2]) + 24;
        v2 = *(int **)(a1 + 16);
      }
      while (v4 < *v2);
    }
    v1 += 8;
  }
  return v1;
}

unint64_t google::protobuf::RepeatedPtrField<std::string>::SpaceUsedExcludingSelf(uint64_t a1)
{
  unint64_t v1;
  int *v2;
  uint64_t v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  v1 = 8 * *(int *)(a1 + 12);
  v2 = *(int **)(a1 + 16);
  if (v2)
  {
    if (*v2 >= 1)
    {
      v4 = 0;
      do
      {
        v1 += google::protobuf::internal::StringSpaceUsedExcludingSelfLong(*(_QWORD *)&v2[2 * v4++ + 2]) + 24;
        v2 = *(int **)(a1 + 16);
      }
      while (v4 < *v2);
    }
    v1 += 8;
  }
  if (v1 >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/message_lite.h", 113);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (size) <= (static_cast<size_t>(2147483647)): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return v1;
}

void sub_2480193D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(unsigned int *result, uint64_t a2)
{
  unsigned int *v3;
  int *v4;
  int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  uint64_t v12;

  v3 = result;
  v4 = (int *)*((_QWORD *)result + 2);
  if (!v4)
  {
    v7 = result[2];
    v5 = result[3];
    if (v7 > v5)
    {
      v4 = 0;
LABEL_16:
      v11 = *v4 + 1;
LABEL_17:
      *v4 = v11;
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v5 = result[2];
  v6 = result[3];
  v7 = v5;
  if (v5 == v6)
  {
LABEL_14:
    result = google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)result, v5 - v7 + 1);
LABEL_15:
    v4 = (int *)*((_QWORD *)v3 + 2);
    goto LABEL_16;
  }
  v8 = *v4;
  if ((_DWORD)v8 != v6)
  {
    if (v5 >= (int)v8)
    {
      v11 = v8 + 1;
      goto LABEL_17;
    }
    *(_QWORD *)&v4[2 * v8 + 2] = *(_QWORD *)&v4[2 * v5 + 2];
    goto LABEL_15;
  }
  v9 = *(_QWORD *)&v4[2 * v5 + 2];
  if (v9)
    v10 = *(_QWORD *)result == 0;
  else
    v10 = 0;
  if (v10)
  {
    if (*(char *)(v9 + 23) < 0)
      operator delete(*(void **)v9);
    result = (unsigned int *)MEMORY[0x249596C64](v9, 0x1012C40EC159624);
    v4 = (int *)*((_QWORD *)v3 + 2);
  }
LABEL_18:
  v12 = (int)v3[2];
  v3[2] = v12 + 1;
  *(_QWORD *)&v4[2 * v12 + 2] = a2;
  return result;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::UnsafeArenaReleaseLast(uint64_t a1)
{
  int v2;
  std::string *v3;
  int *v4;
  uint64_t v5;
  int *v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12;
  std::string v13[2];

  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2040);
    v3 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    v2 = *(_DWORD *)(a1 + 8);
  }
  v4 = *(int **)(a1 + 16);
  v5 = v2 - 1;
  *(_DWORD *)(a1 + 8) = v5;
  v6 = &v4[2 * v5];
  v9 = *((_QWORD *)v6 + 1);
  v8 = v6 + 2;
  result = v9;
  v10 = *v4;
  v11 = *v4 - 1;
  *v4 = v11;
  if (v2 < v10)
    *v8 = *(_QWORD *)&v4[2 * v11 + 2];
  return result;
}

void sub_2480195A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedPtrField<std::string>::ExtractSubrangeInternal(google::protobuf::internal::RepeatedPtrFieldBase *this, int a2, int a3, uint64_t *a4)
{
  std::string *v8;
  std::string *v9;
  std::string *v10;
  uint64_t v11;
  int v12;
  const std::string *v13;
  std::string *v14;
  char v15;
  std::string v16[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2231);
    v8 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    if ((a3 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((a3 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2232);
  v9 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (num) >= (0): ");
  google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v9->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
LABEL_6:
  if (a3 + a2 > *((_DWORD *)this + 2))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2233);
    v10 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (start + num) <= (size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
  }
  if (a3 >= 1)
  {
    if (a4)
    {
      v11 = a3;
      v12 = a2;
      if (*(_QWORD *)this)
      {
        do
        {
          v13 = (const std::string *)google::protobuf::internal::RepeatedPtrFieldBase::Mutable<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this, v12);
          v14 = (std::string *)operator new();
          v14->__r_.__value_.__l.__size_ = 0;
          v14->__r_.__value_.__r.__words[2] = 0;
          v14->__r_.__value_.__r.__words[0] = 0;
          std::string::operator=(v14, v13);
          *a4++ = (uint64_t)v14;
          ++v12;
          --v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          *a4++ = google::protobuf::internal::RepeatedPtrFieldBase::Mutable<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this, v12++);
          --v11;
        }
        while (v11);
      }
    }
    google::protobuf::internal::RepeatedPtrFieldBase::CloseGap((uint64_t)this, a2, a3);
  }
}

{
  std::string *v8;
  std::string *v9;
  std::string *v10;
  char v11;
  std::string v12[2];

  if (*(_QWORD *)this)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2268);
    v8 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: GetArena() == NULL: ");
    v9 = google::protobuf::internal::LogMessage::operator<<(v8, "ExtractSubrange() when arena is non-NULL is only supported when ");
    v10 = google::protobuf::internal::LogMessage::operator<<(v9, "the Element type supplies a MergeFrom() operation to make copies.");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
  }
  google::protobuf::RepeatedPtrField<std::string>::UnsafeArenaExtractSubrange(this, a2, a3, a4);
}

void sub_24801976C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedPtrField<std::string>::UnsafeArenaExtractSubrange(google::protobuf::internal::RepeatedPtrFieldBase *this, int a2, int a3, uint64_t *a4)
{
  std::string *v8;
  std::string *v9;
  std::string *v10;
  uint64_t v11;
  int v12;
  char v13;
  std::string v14[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2277);
    v8 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (start) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    if ((a3 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((a3 & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2278);
  v9 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (num) >= (0): ");
  google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v9->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
LABEL_6:
  if (a3 + a2 > *((_DWORD *)this + 2))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2279);
    v10 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (start + num) <= (size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }
  if (a3 >= 1)
  {
    if (a4)
    {
      v11 = a3;
      v12 = a2;
      do
      {
        *a4++ = google::protobuf::internal::RepeatedPtrFieldBase::Mutable<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)this, v12++);
        --v11;
      }
      while (v11);
    }
    google::protobuf::internal::RepeatedPtrFieldBase::CloseGap((uint64_t)this, a2, a3);
  }
}

void sub_2480198E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::RepeatedPtrFieldBase::CloseGap(uint64_t this, int a2, int a3)
{
  int *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(int **)(this + 16);
  if (v3)
  {
    LODWORD(v4) = a3 + a2;
    LODWORD(v5) = *v3;
    if (a3 + a2 < *v3)
    {
      v4 = (int)v4;
      do
      {
        *(_QWORD *)((char *)&v3[2 * v4] + 8 - 8 * a3) = *(_QWORD *)&v3[2 * v4 + 2];
        ++v4;
        v3 = *(int **)(this + 16);
        v5 = *v3;
      }
      while (v4 < v5);
    }
    *(_DWORD *)(this + 8) -= a3;
    *v3 = v5 - a3;
  }
  return this;
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::ClearedCount(uint64_t a1)
{
  _DWORD *v1;

  v1 = *(_DWORD **)(a1 + 16);
  if (v1)
    return (*v1 - *(_DWORD *)(a1 + 8));
  else
    return 0;
}

void google::protobuf::internal::RepeatedPtrFieldBase::AddCleared<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  std::string *v5;
  int *v6;
  int v7;
  int v8;
  uint64_t v9;
  char v10;
  std::string v11[2];

  if (*(_QWORD *)a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2059);
    v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: GetArena() == NULL: ");
    v5 = google::protobuf::internal::LogMessage::operator<<(v4, "AddCleared() can only be used on a RepeatedPtrField not on an arena.");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v6 = *(int **)(a1 + 16);
  if (v6)
  {
    v7 = *v6;
    if (*v6 != *(_DWORD *)(a1 + 12))
      goto LABEL_9;
  }
  else
  {
    v7 = *(_DWORD *)(a1 + 12);
  }
  v8 = *(_DWORD *)(a1 + 8);
  if (v8 <= v7)
  {
    google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)a1, v7 - v8 + 1);
    v6 = *(int **)(a1 + 16);
  }
LABEL_9:
  v9 = *v6;
  *v6 = v9 + 1;
  *(_QWORD *)&v6[2 * v9 + 2] = a2;
}

void sub_248019A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::RepeatedPtrFieldBase::ReleaseCleared<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(uint64_t a1)
{
  std::string *v2;
  std::string *v3;
  std::string *v4;
  std::string *v5;
  int *v6;
  std::string *v7;
  int v8;
  std::string *v9;
  uint64_t v10;
  char v12;
  std::string v13[2];

  if (*(_QWORD *)a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2071);
    v2 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: GetArena() == NULL: ");
    v3 = google::protobuf::internal::LogMessage::operator<<(v2, "ReleaseCleared() can only be used on a RepeatedPtrField not on ");
    v4 = google::protobuf::internal::LogMessage::operator<<(v3, "an arena.");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    if (*(_QWORD *)a1)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2074);
      v5 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: GetArena() == NULL: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v5->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    }
  }
  v6 = *(int **)(a1 + 16);
  if (!v6)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2075);
    v7 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: rep_ != NULL: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    v6 = *(int **)(a1 + 16);
  }
  v8 = *v6;
  if (*v6 <= *(_DWORD *)(a1 + 8))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2076);
    v9 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: (rep_->allocated_size) > (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
    v6 = *(int **)(a1 + 16);
    v8 = *v6;
  }
  v10 = v8 - 1;
  *v6 = v10;
  return *(_QWORD *)&v6[2 * v10 + 2];
}

void sub_248019BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::erase(google::protobuf::internal::RepeatedPtrFieldBase *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *((_QWORD *)a1 + 2);
  if (v3)
    v4 = v3 + 8;
  else
    v4 = 0;
  v5 = a2 - v4;
  google::protobuf::RepeatedPtrField<std::string>::DeleteSubrange(a1, (unint64_t)(a2 - v4) >> 3, ((unint64_t)(a2 - v4 + 8) >> 3) - ((unint64_t)(a2 - v4) >> 3));
  v6 = *((_QWORD *)a1 + 2);
  if (v6)
    v7 = v6 + 8;
  else
    v7 = 0;
  return v7 + (v5 << 29 >> 29);
}

uint64_t google::protobuf::RepeatedPtrField<std::string>::erase(google::protobuf::internal::RepeatedPtrFieldBase *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *((_QWORD *)a1 + 2);
  if (v4)
    v5 = v4 + 8;
  else
    v5 = 0;
  v6 = a2 - v5;
  google::protobuf::RepeatedPtrField<std::string>::DeleteSubrange(a1, (unint64_t)(a2 - v5) >> 3, ((unint64_t)(a3 - v5) >> 3) - ((unint64_t)(a2 - v5) >> 3));
  v7 = *((_QWORD *)a1 + 2);
  if (v7)
    v8 = v7 + 8;
  else
    v8 = 0;
  return v8 + (v6 << 29 >> 29);
}

void sub_248019D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend(google::protobuf::internal::RepeatedPtrFieldBase *this, int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int *v5;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int *AlignedNoHook;
  uint64_t v13;

  v2 = *((_DWORD *)this + 2);
  v3 = *((_DWORD *)this + 3);
  v4 = v2 + a2;
  v5 = (unsigned int *)*((_QWORD *)this + 2);
  if (v3 < v2 + a2)
  {
    v7 = *(_QWORD *)this;
    v8 = 2 * v3;
    if (2 * v3 <= v4)
      v8 = v4;
    if (v8 <= 4)
      v9 = 4;
    else
      v9 = v8;
    v10 = 8 * v9;
    if (v7)
    {
      v11 = (v10 + 15) & 0x7FFFFFFF8;
      if ((*(_BYTE *)(v7 + 24) & 1) != 0)
        (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v7 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 32), MEMORY[0x24BEDB778], v11);
      AlignedNoHook = (unsigned int *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v7, v11);
    }
    else
    {
      AlignedNoHook = (unsigned int *)operator new(v10 + 8);
    }
    *((_QWORD *)this + 2) = AlignedNoHook;
    *((_DWORD *)this + 3) = v9;
    if (v5 && (v13 = *v5, (int)v13 >= 1))
    {
      memcpy(AlignedNoHook + 2, v5 + 2, 8 * v13);
      AlignedNoHook = (unsigned int *)*((_QWORD *)this + 2);
      *AlignedNoHook = *v5;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      *AlignedNoHook = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        AlignedNoHook = (unsigned int *)*((_QWORD *)this + 2);
      }
    }
    v2 = *((_DWORD *)this + 2);
    v5 = AlignedNoHook;
  }
  return &v5[2 * v2 + 2];
}

_QWORD *google::protobuf::internal::RepeatedPtrFieldBase::AddWeak(google::protobuf::internal::RepeatedPtrFieldBase *this, const google::protobuf::MessageLite *a2)
{
  int *v4;
  int v5;
  int v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (int *)*((_QWORD *)this + 2);
  if (!v4)
  {
    v5 = *((_DWORD *)this + 2);
    v6 = *((_DWORD *)this + 3);
LABEL_6:
    if (v5 <= v6)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend(this, v6 - v5 + 1);
      v4 = (int *)*((_QWORD *)this + 2);
    }
    goto LABEL_8;
  }
  v5 = *((_DWORD *)this + 2);
  v6 = *v4;
  if (v5 < *v4)
  {
    *((_DWORD *)this + 2) = v5 + 1;
    return *(_QWORD **)&v4[2 * v5 + 2];
  }
  if (v6 == *((_DWORD *)this + 3))
    goto LABEL_6;
LABEL_8:
  ++*v4;
  v8 = *(_QWORD *)this;
  if (a2)
  {
    result = (_QWORD *)(*(uint64_t (**)(const google::protobuf::MessageLite *, _QWORD))(*(_QWORD *)a2 + 32))(a2, *(_QWORD *)this);
  }
  else
  {
    if (v8)
    {
      if ((*(_BYTE *)(v8 + 24) & 1) != 0)
      result = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v8, (google::protobuf::internal::SerialArena::Block *)0x28, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::internal::ImplicitWeakMessage>);
      result[1] = v8;
    }
    else
    {
      result = (_QWORD *)operator new();
      result[1] = 0;
    }
    *result = off_25197CD28;
    result[3] = 0;
    result[4] = 0;
    result[2] = 0;
  }
  v9 = *((_QWORD *)this + 2);
  v10 = *((int *)this + 2);
  *((_DWORD *)this + 2) = v10 + 1;
  *(_QWORD *)(v9 + 8 * v10 + 8) = result;
  return result;
}

void google::protobuf::internal::RepeatedPtrFieldBase::SwapFallback<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(_QWORD *a1, google::protobuf::internal::RepeatedPtrFieldBase *a2)
{
  unint64_t v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v4 = *(_QWORD *)a2;
  if (*(_QWORD *)a2 == *a1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1685);
    v5 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: other->GetArena() != GetArena(): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
    v4 = *(_QWORD *)a2;
  }
  v7[0].__r_.__value_.__r.__words[2] = 0;
  *(_OWORD *)&v7[0].__r_.__value_.__l.__data_ = v4;
  google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)v7, (uint64_t)a1);
  google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a1);
  google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)a1, (uint64_t)a2);
  google::protobuf::internal::RepeatedPtrFieldBase::InternalSwap(a2, (google::protobuf::internal::RepeatedPtrFieldBase *)v7);
  google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v7);
  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase((google::protobuf::internal::ArenaImpl **)v7);
}

void sub_24801A0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedInternal<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(unsigned int *result, uint64_t a2)
{
  int *v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;

  if (*(_QWORD *)result)
    return google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedSlowWithCopy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(result, a2, 0, *(google::protobuf::internal::ArenaImpl **)result);
  v2 = (int *)*((_QWORD *)result + 2);
  if (!v2)
    return google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedSlowWithCopy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(result, a2, 0, *(google::protobuf::internal::ArenaImpl **)result);
  v3 = *v2;
  if ((int)v3 >= (int)result[3])
    return google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedSlowWithCopy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(result, a2, 0, *(google::protobuf::internal::ArenaImpl **)result);
  v4 = v2 + 2;
  v5 = (int)result[2];
  if ((int)v5 < (int)v3)
    *(_QWORD *)&v4[2 * v3] = *(_QWORD *)&v4[2 * v5];
  *(_QWORD *)&v4[2 * v5] = a2;
  result[2] = v5 + 1;
  ++**((_DWORD **)result + 2);
  return result;
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedSlowWithCopy<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(unsigned int *a1, uint64_t a2, google::protobuf::internal::ArenaImpl *a3, google::protobuf::internal::ArenaImpl *this)
{
  std::string *AlignedAndAddCleanup;
  uint64_t v9;

  if (!a3 && this)
  {
    google::protobuf::Arena::Own<std::string>(this, (void *)a2);
LABEL_9:
    v9 = a2;
    return google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1, v9);
  }
  if (this == a3)
    goto LABEL_9;
  if (this)
  {
    if ((*((_BYTE *)this + 24) & 1) != 0)
    AlignedAndAddCleanup = (std::string *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup(this, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::string>);
  }
  else
  {
    AlignedAndAddCleanup = (std::string *)operator new();
  }
  v9 = (uint64_t)AlignedAndAddCleanup;
  AlignedAndAddCleanup->__r_.__value_.__r.__words[0] = 0;
  AlignedAndAddCleanup->__r_.__value_.__l.__size_ = 0;
  AlignedAndAddCleanup->__r_.__value_.__r.__words[2] = 0;
  std::string::operator=(AlignedAndAddCleanup, (const std::string *)a2);
  if (!a3)
  {
    if (*(char *)(a2 + 23) < 0)
      operator delete(*(void **)a2);
    MEMORY[0x249596C64](a2, 0x1012C40EC159624);
  }
  return google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(a1, v9);
}

google::protobuf::internal::ArenaImpl *google::protobuf::Arena::Own<std::string>(google::protobuf::internal::ArenaImpl *result, void *a2)
{
  if (a2)
    return google::protobuf::internal::ArenaImpl::AddCleanup(result, a2, (void (*)(void *))google::protobuf::internal::arena_delete_object<std::string>);
  return result;
}

uint64_t google::protobuf::internal::arena_delete_object<std::string>(uint64_t result)
{
  if (result)
  {
    if (*(char *)(result + 23) < 0)
      operator delete(*(void **)result);
    JUMPOUT(0x249596C64);
  }
  return result;
}

std::string *google::protobuf::internal::RepeatedPtrFieldBase::ReleaseLastInternal<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(uint64_t a1)
{
  int v2;
  std::string *v3;
  int *v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;
  const std::string *v8;
  const std::string *v9;
  int v10;
  int v11;
  std::string *v12;
  char v14;
  std::string v15[2];

  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 2040);
    v3 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v2 = *(_DWORD *)(a1 + 8);
  }
  v4 = *(int **)(a1 + 16);
  v5 = v2 - 1;
  *(_DWORD *)(a1 + 8) = v5;
  v6 = &v4[2 * v5];
  v9 = (const std::string *)*((_QWORD *)v6 + 1);
  v7 = v6 + 2;
  v8 = v9;
  v10 = *v4;
  v11 = *v4 - 1;
  *v4 = v11;
  if (v2 < v10)
    *v7 = *(_QWORD *)&v4[2 * v11 + 2];
  if (*(_QWORD *)a1)
  {
    v12 = (std::string *)operator new();
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    std::string::operator=(v12, v8);
    return v12;
  }
  return (std::string *)v8;
}

void sub_24801A380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::util::Status::Status(uint64_t this)
{
  *(_DWORD *)this = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  return this;
}

uint64_t google::protobuf::util::Status::Status(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[0] = a3;
  v9[1] = a4;
  *(_DWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  v5 = a1 + 8;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  if (a2)
  {
    google::protobuf::StringPiece::ToString((google::protobuf::StringPiece *)v9, &v7);
    if (*(char *)(a1 + 31) < 0)
      operator delete(*(void **)v5);
    *(_OWORD *)v5 = v7;
    *(_QWORD *)(v5 + 16) = v8;
  }
  return a1;
}

void sub_24801A41C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

google::protobuf::util::Status *google::protobuf::util::Status::Status(google::protobuf::util::Status *this, const google::protobuf::util::Status *a2)
{
  std::string *v3;
  __int128 v4;

  *(_DWORD *)this = *(_DWORD *)a2;
  v3 = (std::string *)((char *)this + 8);
  if (*((char *)a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *((const std::string::value_type **)a2 + 1), *((_QWORD *)a2 + 2));
  }
  else
  {
    v4 = *(_OWORD *)((char *)a2 + 8);
    v3->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 3);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return this;
}

uint64_t google::protobuf::util::Status::operator=(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  std::string::operator=((std::string *)(a1 + 8), (const std::string *)(a2 + 8));
  return a1;
}

uint64_t google::protobuf::util::Status::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const void **v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v16;
  uint64_t result;

  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    return 0;
  v2 = *(unsigned __int8 *)(a1 + 31);
  if ((v2 & 0x80u) == 0)
    v3 = *(unsigned __int8 *)(a1 + 31);
  else
    v3 = *(_QWORD *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a2 + 31);
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(a2 + 16);
  if (v3 != v4)
    return 0;
  v6 = (const void **)(a1 + 8);
  v9 = *(unsigned __int8 **)(a2 + 8);
  v7 = (unsigned __int8 *)(a2 + 8);
  v8 = v9;
  if (v5 < 0)
    v7 = v8;
  if ((v2 & 0x80) != 0)
    return memcmp(*v6, v7, *(_QWORD *)(a1 + 16)) == 0;
  if (!*(_BYTE *)(a1 + 31))
    return 1;
  v10 = v2 - 1;
  do
  {
    v12 = *(unsigned __int8 *)v6;
    v6 = (const void **)((char *)v6 + 1);
    v11 = v12;
    v14 = *v7++;
    v13 = v14;
    v16 = v10-- != 0;
    result = v11 == v13;
  }
  while (v11 == v13 && v16);
  return result;
}

void google::protobuf::util::Status::ToString(google::protobuf::util::Status *this@<X0>, _QWORD *a2@<X8>)
{
  unsigned int v3;
  uint64_t v5;
  char *v6;
  char *v7;
  std::string *v8;
  __int128 v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  std::string v15;
  std::string v16;

  v3 = *(_DWORD *)this;
  if (!*(_DWORD *)this)
  {
    v6 = "OK";
LABEL_24:
    std::string::basic_string[abi:ne180100]<0>(a2, v6);
    return;
  }
  if (*((char *)this + 31) < 0)
    v5 = *((_QWORD *)this + 2);
  else
    v5 = *((unsigned __int8 *)this + 31);
  if (!v5)
  {
    if (v3 > 0x10)
      v6 = "UNKNOWN";
    else
      v6 = off_25197CEA8[v3 - 1];
    goto LABEL_24;
  }
  if (v3 > 0x10)
    v7 = "UNKNOWN";
  else
    v7 = off_25197CEA8[v3 - 1];
  std::string::basic_string[abi:ne180100]<0>(&v15, v7);
  v8 = std::string::append(&v15, ":");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = *((char *)this + 31);
  if (v10 >= 0)
    v11 = (char *)this + 8;
  else
    v11 = (const std::string::value_type *)*((_QWORD *)this + 1);
  if (v10 >= 0)
    v12 = *((unsigned __int8 *)this + 31);
  else
    v12 = *((_QWORD *)this + 2);
  v13 = std::string::append(&v16, v11, v12);
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  a2[2] = *((_QWORD *)&v13->__r_.__value_.__l + 2);
  *(_OWORD *)a2 = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
}

void sub_24801A6A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

_QWORD *google::protobuf::util::operator<<(_QWORD *a1, google::protobuf::util::Status *this)
{
  void **v3;
  uint64_t v4;
  void *__p[2];
  unsigned __int8 v7;

  google::protobuf::util::Status::ToString(this, __p);
  if ((v7 & 0x80u) == 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  if ((v7 & 0x80u) == 0)
    v4 = v7;
  else
    v4 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v3, v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_24801A740(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::StringAppendV(std::string *a1, char *__format, va_list a3)
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
    return MEMORY[0x249596C40](v7, 0x1000C8077774924);
  }
  else if ((result & 0x80000000) == 0)
  {
    return (uint64_t)std::string::append(a1, __str, result);
  }
  return result;
}

uint64_t google::protobuf::StringPrintf@<X0>(google::protobuf *this@<X0>, std::string *a2@<X8>, ...)
{
  va_list va;

  va_start(va, a2);
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return google::protobuf::StringAppendV(a2, (char *)this, va);
}

void sub_24801A8A8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::SStringPrintf(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
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
  google::protobuf::StringAppendV((std::string *)a1, a2, &a9);
  return a1;
}

uint64_t google::protobuf::StringAppendF(std::string *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return google::protobuf::StringAppendV(a1, a2, &a9);
}

uint64_t google::protobuf::StringPrintfVector@<X0>(google::protobuf *this@<X0>, uint64_t **a2@<X1>, std::string *a3@<X8>)
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
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringprintf.cc", 149);
    v9 = google::protobuf::internal::LogMessage::operator<<((std::string *)&v19, "CHECK failed: (v.size()) <= (kStringPrintfVectorMaxArgs): ");
    v10 = google::protobuf::internal::LogMessage::operator<<(v9, "StringPrintfVector currently only supports up to ");
    v11 = google::protobuf::internal::LogMessage::operator<<(v10, 32);
    v12 = google::protobuf::internal::LogMessage::operator<<(v11, " arguments. ");
    v13 = google::protobuf::internal::LogMessage::operator<<(v12, "Feel free to add support for more if you need it.");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19);
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
    memset_pattern16((char *)&v19 + ((8 * v7) & 0x7FFFFFFF8), &off_25197CF30, ((248 - 8 * v7) & 0x7FFFFFFF8) + 8);
  return google::protobuf::StringPrintf(this, a3, v19, v20, v21, v22, v23, v24, v25, v26, (_QWORD)v27, *((_QWORD *)&v27 + 1), (_QWORD)v28, *((_QWORD *)&v28 + 1), (_QWORD)v29, *((_QWORD *)&v29 + 1), (_QWORD)v30, *((_QWORD *)&v30 + 1), (_QWORD)v31,
           *((_QWORD *)&v31 + 1),
           (_QWORD)v32,
           *((_QWORD *)&v32 + 1),
           (_QWORD)v33,
           *((_QWORD *)&v33 + 1),
           (_QWORD)v34,
           *((_QWORD *)&v34 + 1));
}

void sub_24801AB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43)
{
  google::protobuf::internal::LogMessage::~LogMessage(&a43);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::operator<<(uint64_t a1)
{
  std::ostream::write();
  return a1;
}

void google::protobuf::StringPiece::LogFatalSizeTooBig(google::protobuf::StringPiece *this, const std::string::value_type *a2, const char *a3)
{
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  char v9;
  std::string v10[2];

  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 49);
  v5 = google::protobuf::internal::LogMessage::operator<<(v10, "size too big: ");
  v6 = google::protobuf::internal::LogMessage::operator<<(v5, (uint64_t)this);
  v7 = google::protobuf::internal::LogMessage::operator<<(v6, " details: ");
  v8 = google::protobuf::internal::LogMessage::operator<<(v7, a2);
  google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v8->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
}

void sub_24801AC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *google::protobuf::StringPiece::StringPiece(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::string *v7;
  std::string *v8;
  char v10;
  std::string v11[2];

  *a1 = a2 + a4;
  a1[1] = a3 - a4;
  if (a4 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 54);
    v7 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (0) <= (pos): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (a3 < a4)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 55);
    v8 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (pos) <= (x.length_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_24801ACE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *google::protobuf::StringPiece::StringPiece(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  char v14;
  std::string v15[2];

  v9 = a3 - a4;
  if (a3 - a4 >= a5)
    v9 = a5;
  *a1 = a2 + a4;
  a1[1] = v9;
  if (a4 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 62);
    v10 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (0) <= (pos): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  }
  if (a3 < a4)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 63);
    v11 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (pos) <= (x.length_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  }
  if (a5 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/stringpiece.cc", 64);
    v12 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (len) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_24801AE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::StringPiece::CopyToString()
{
  JUMPOUT(0x2495969D0);
}

std::string *google::protobuf::StringPiece::AppendToString(uint64_t a1, std::string *this)
{
  return std::string::append(this, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
}

uint64_t google::protobuf::StringPiece::Consume(const void **a1, const void *a2, int64_t a3)
{
  char *v3;
  char *v4;
  char *v7;

  v3 = (char *)a1[1];
  v4 = &v3[-a3];
  if ((uint64_t)v3 < a3)
    return 0;
  v7 = (char *)*a1;
  if (memcmp(*a1, a2, a3))
    return 0;
  *a1 = &v7[a3];
  a1[1] = v4;
  return 1;
}

uint64_t google::protobuf::StringPiece::ConsumeFromEnd(_QWORD *a1, const void *a2, int64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = v3 - a3;
  if (v3 < a3 || memcmp((const void *)(*a1 + v4), a2, a3))
    return 0;
  a1[1] = v4;
  return 1;
}

size_t google::protobuf::StringPiece::copy(google::protobuf::StringPiece *this, char *__dst, size_t a3, uint64_t a4)
{
  size_t v4;

  if (*((_QWORD *)this + 1) - a4 >= a3)
    v4 = a3;
  else
    v4 = *((_QWORD *)this + 1) - a4;
  memcpy(__dst, (const void *)(*(_QWORD *)this + a4), v4);
  return v4;
}

BOOL google::protobuf::StringPiece::contains(_QWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  return google::protobuf::StringPiece::find(a1, a2, a3, 0) != -1;
}

uint64_t google::protobuf::StringPiece::find(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unsigned __int8 *v8;

  v4 = a1[1];
  if (v4 >= 1 && v4 >= a4)
  {
    v8 = std::__search_impl[abi:ne180100]<char const*,char const*,char const*,char const*,std::__equal_to,std::__identity,std::__identity>((unsigned __int8 *)(*a1 + a4), *a1 + v4, a2, &a2[a3]);
    if ((unsigned __int8 *)(*a1 + a1[1]) == v8)
      return -1;
    else
      return (uint64_t)&v8[-*a1];
  }
  else if (v4 | a4 | a3)
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

uint64_t google::protobuf::StringPiece::find(google::protobuf::StringPiece *this, int a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  void *v7;

  v3 = *((_QWORD *)this + 1);
  if (v3 < 1 || v3 <= a3)
    return -1;
  v6 = *(_QWORD *)this;
  v7 = memchr((void *)(*(_QWORD *)this + a3), a2, v3 - a3);
  if (v7)
    return (uint64_t)v7 - v6;
  else
    return -1;
}

uint64_t google::protobuf::StringPiece::rfind(unsigned __int8 **a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  unsigned __int8 *v4;
  unint64_t v5;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned __int8 *v14;

  v4 = a1[1];
  v5 = (unint64_t)&v4[-a3];
  if ((uint64_t)v4 < a3)
    return -1;
  if (a3)
  {
    v7 = *a1;
    if (v5 >= a4)
      v5 = a4;
    v8 = &v7[a3 + v5];
    if (v7 == v8)
      return -1;
    v9 = *a1;
    v10 = v8;
    do
    {
      if (*v9 == *a2)
      {
        v11 = 1;
        while (a3 != v11)
        {
          if (&v9[v11] == v8)
            goto LABEL_17;
          v12 = v9[v11];
          v13 = a2[v11++];
          if (v12 != v13)
            goto LABEL_9;
        }
        v10 = v9;
      }
LABEL_9:
      ++v9;
    }
    while (v9 != v8);
LABEL_17:
    v14 = (unsigned __int8 *)(v10 - v7);
    if (v10 == v8)
      return -1;
    else
      return (uint64_t)v14;
  }
  else if ((unint64_t)v4 >= a4)
  {
    return a4;
  }
  else
  {
    return (uint64_t)a1[1];
  }
}

uint64_t google::protobuf::StringPiece::rfind(google::protobuf::StringPiece *this, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;

  v3 = *((_QWORD *)this + 1);
  if (v3 < 1)
    return -1;
  if (v3 - 1 >= a3)
    result = a3;
  else
    result = v3 - 1;
  v6 = *(_QWORD *)this;
  while (*(unsigned __int8 *)(v6 + result) != a2)
  {
    if (result-- <= 0)
      return -1;
  }
  return result;
}

uint64_t google::protobuf::StringPiece::find_first_of(google::protobuf::StringPiece *a1, unsigned __int8 *a2, uint64_t a3, int64_t a4)
{
  uint64_t v4;
  unsigned int v7;
  _OWORD v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *((_QWORD *)a1 + 1);
  if (v4 < 1 || a3 < 1)
    return -1;
  if (a3 == 1)
    return google::protobuf::StringPiece::find(a1, (char)*a2, a4);
  memset(v8, 0, sizeof(v8));
  do
  {
    v7 = *a2++;
    *((_BYTE *)v8 + v7) = 1;
    --a3;
  }
  while (a3);
  if (v4 <= a4)
    return -1;
  while (!*((_BYTE *)v8 + *(unsigned __int8 *)(*(_QWORD *)a1 + a4)))
  {
    if (v4 == ++a4)
      return -1;
  }
  return a4;
}

uint64_t google::protobuf::StringPiece::find_first_not_of(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v5;
  _OWORD v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  if (v4 < 1)
    return -1;
  if (a3 < 1)
    return 0;
  if (a3 != 1)
  {
    memset(v7, 0, sizeof(v7));
    do
    {
      v5 = *a2++;
      *((_BYTE *)v7 + v5) = 1;
      --a3;
    }
    while (a3);
    if (v4 > a4)
    {
      while (*((_BYTE *)v7 + *(unsigned __int8 *)(*a1 + a4)))
      {
        if (v4 == ++a4)
          return -1;
      }
      return a4;
    }
    return -1;
  }
  if (v4 <= (unint64_t)a4)
    return -1;
  while (*(unsigned __int8 *)(*a1 + a4) == *a2)
  {
    if (v4 == ++a4)
      return -1;
  }
  return a4;
}

unint64_t google::protobuf::StringPiece::find_first_not_of(google::protobuf::StringPiece *this, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3;

  v3 = *((_QWORD *)this + 1);
  if (v3 < 1 || v3 <= a3)
    return -1;
  while (*(unsigned __int8 *)(*(_QWORD *)this + a3) == a2)
  {
    if (v3 == ++a3)
      return -1;
  }
  return a3;
}

uint64_t google::protobuf::StringPiece::find_last_of(uint64_t *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t result;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  _OWORD v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  v6 = v4 < 1;
  v5 = v4 - 1;
  v6 = v6 || a3 < 1;
  if (v6)
    return -1;
  if (a3 == 1)
  {
    if (v5 >= a4)
      result = a4;
    else
      result = v5;
    v9 = *a1;
    while (*(unsigned __int8 *)(v9 + result) != *a2)
    {
      v6 = result-- < 1;
      if (v6)
        return -1;
    }
    return result;
  }
  memset(v12, 0, sizeof(v12));
  do
  {
    v10 = *a2++;
    *((_BYTE *)v12 + v10) = 1;
    --a3;
  }
  while (a3);
  result = v5 >= a4 ? a4 : v5;
  if (result < 0)
    return -1;
  v11 = *a1;
  while (!*((_BYTE *)v12 + *(unsigned __int8 *)(v11 + result)))
  {
    v6 = result-- <= 0;
    if (v6)
      return -1;
  }
  return result;
}

uint64_t google::protobuf::StringPiece::find_last_not_of(uint64_t *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  _OWORD v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  v5 = v4 < 1;
  v6 = v4 - 1;
  if (v5)
    return -1;
  if (v6 >= a4)
    result = a4;
  else
    result = v6;
  if (a3 < 1)
    return result;
  if (a3 != 1)
  {
    memset(v12, 0, sizeof(v12));
    do
    {
      v10 = *a2++;
      *((_BYTE *)v12 + v10) = 1;
      --a3;
    }
    while (a3);
    if ((result & 0x8000000000000000) == 0)
    {
      v11 = *a1;
      while (*((_BYTE *)v12 + *(unsigned __int8 *)(v11 + result)))
      {
        v5 = result-- <= 0;
        if (v5)
          return -1;
      }
      return result;
    }
    return -1;
  }
  v9 = *a1;
  while (*(unsigned __int8 *)(v9 + result) == *a2)
  {
    v5 = result-- < 1;
    if (v5)
      return -1;
  }
  return result;
}

uint64_t google::protobuf::StringPiece::find_last_not_of(google::protobuf::StringPiece *this, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;

  v3 = *((_QWORD *)this + 1);
  if (v3 < 1)
    return -1;
  if (v3 - 1 >= a3)
    result = a3;
  else
    result = v3 - 1;
  v6 = *(_QWORD *)this;
  while (*(unsigned __int8 *)(v6 + result) == a2)
  {
    if (result-- <= 0)
      return -1;
  }
  return result;
}

unint64_t google::protobuf::StringPiece::substr(google::protobuf::StringPiece *this, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = *((_QWORD *)this + 1);
  if (v3 >= a2)
    v4 = a2;
  else
    v4 = *((_QWORD *)this + 1);
  v5 = v3 - v4;
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  if ((v6 & 0x8000000000000000) != 0)
    google::protobuf::MessageLite::ParseFromArray();
  return *(_QWORD *)this + v4;
}

unsigned __int8 *std::__search_impl[abi:ne180100]<char const*,char const*,char const*,char const*,std::__equal_to,std::__identity,std::__identity>(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  int v14;

  v4 = a4 - a3;
  if (a4 == a3)
    return a1;
  v5 = a2;
  if (a2 - (uint64_t)a1 >= v4)
  {
    v6 = a2 - v4 + 1;
    if ((unsigned __int8 *)v6 != a1)
    {
      v9 = *a3;
      v7 = a3 + 1;
      v8 = v9;
      while (*a1 != v8)
      {
LABEL_9:
        if (++a1 == (unsigned __int8 *)v6)
          return (unsigned __int8 *)v5;
      }
      v10 = a1 + 1;
      v11 = v7;
      while (v11 != a4)
      {
        v13 = *v10++;
        v12 = v13;
        v14 = *v11++;
        if (v12 != v14)
          goto LABEL_9;
      }
      return a1;
    }
  }
  return (unsigned __int8 *)v5;
}

uint64_t google::protobuf::internal::UTF8GenericScan(unsigned int *a1, _BYTE *a2, int a3, _DWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  _DWORD *v11;
  unint64_t v12;
  _DWORD *v13;
  _DWORD *v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  _BYTE *v20;

  *a4 = 0;
  if (!a3)
    return 241;
  v4 = (unint64_t)&a2[a3];
  if (a3 >= 7)
    v5 = v4 - 7;
  else
    v5 = (unint64_t)a2;
  v6 = *((_QWORD *)a1 + 4) + *a1;
  v7 = *((_QWORD *)a1 + 7);
  v8 = a2;
  while (2)
  {
    v9 = v8 & 7;
    if ((v8 & 7) != 0 && (unint64_t)v8 < v4)
    {
      v10 = (_BYTE)v8 + 1;
      while (!*(_BYTE *)(v7 + *v8))
      {
        ++v8;
        v9 = v10 & 7;
        if ((v10 & 7) != 0)
        {
          ++v10;
          if ((unint64_t)v8 < v4)
            continue;
        }
        goto LABEL_12;
      }
LABEL_20:
      v11 = v8;
      goto LABEL_21;
    }
LABEL_12:
    if (v9 || (unint64_t)v8 >= v5)
      goto LABEL_20;
    v11 = v8 + 4;
    while (1)
    {
      v12 = *(v11 - 1);
      if (((((_DWORD)v12 - a1[6]) | ((_DWORD)v12 + a1[7]) | (*v11 - a1[6]) | (*v11 + a1[7])) & 0x80808080) != 0)
        break;
LABEL_18:
      v13 = v11 + 2;
      v14 = v11 + 1;
      v11 += 2;
      if ((unint64_t)v14 >= v5)
      {
        v11 = v13 - 1;
        goto LABEL_21;
      }
    }
    if (!(*(unsigned __int8 *)(v7 + BYTE1(v12)) | *(unsigned __int8 *)(v7 + v12) | *(unsigned __int8 *)(v7 + BYTE2(v12)) | *(unsigned __int8 *)(v7 + (v12 >> 24))))
    {
      if (*(unsigned __int8 *)(v7 + BYTE1(*v11)) | *(unsigned __int8 *)(v7 + *v11) | *(unsigned __int8 *)(v7 + BYTE2(*v11)) | *(unsigned __int8 *)(v7 + ((unint64_t)*v11 >> 24)))
        goto LABEL_21;
      goto LABEL_18;
    }
    --v11;
LABEL_21:
    if ((unint64_t)v11 < v4)
    {
      v15 = v4 - (_QWORD)v11;
      v16 = (char *)v11 - 1;
      v17 = *((_QWORD *)a1 + 4) + *a1;
      v8 = v11;
      while (1)
      {
        v18 = *(unsigned __int8 *)(v17 + *v8);
        if (v18 > 0xEF)
          break;
        ++v8;
        v17 = v6 + (int)((_DWORD)v18 << a1[4]);
        ++v16;
        if (!--v15)
        {
          LODWORD(v8) = v4;
          goto LABEL_32;
        }
      }
      if (a1[1] <= (int)v17 - (int)v6)
      {
        do
        {
          v8 = v16;
          if (v16 <= a2)
            break;
          --v16;
        }
        while ((*v8 & 0xC0) == 0x80);
      }
      if ((_DWORD)v18 != 253)
        goto LABEL_42;
      continue;
    }
    break;
  }
  LODWORD(v8) = (_DWORD)v11;
  LODWORD(v17) = a1[8] + *a1;
LABEL_32:
  if (a1[1] <= (int)v17 - (int)v6)
  {
    if ((unint64_t)v11 <= v4)
      v19 = (_DWORD *)v4;
    else
      v19 = v11;
    v20 = (char *)v19 - 1;
    do
    {
      v8 = v20;
      if (v20 <= a2)
        break;
      --v20;
    }
    while ((*v8 & 0xC0) == 0x80);
    v18 = 240;
  }
  else
  {
    v18 = 241;
  }
LABEL_42:
  *a4 = (_DWORD)v8 - (_DWORD)a2;
  return v18;
}

uint64_t google::protobuf::internal::UTF8GenericScanFastAscii(unsigned int *a1, char *a2, int a3, _DWORD *a4)
{
  char *v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  int64_t v13;
  uint64_t result;
  int v15;

  *a4 = 0;
  if (!a3)
    return 241;
  v8 = &a2[a3];
  if (a3 >= 7)
    v9 = (unint64_t)(v8 - 7);
  else
    v9 = (unint64_t)a2;
  v15 = 0;
  v10 = a2;
  do
  {
    v11 = v10 & 7;
    if ((v10 & 7) != 0 && v10 < v8)
    {
      v12 = (_BYTE)v10 + 1;
      while ((*v10 & 0x80000000) == 0)
      {
        ++v10;
        v11 = v12 & 7;
        if ((v12 & 7) != 0)
        {
          ++v12;
          if (v10 < v8)
            continue;
        }
        goto LABEL_12;
      }
    }
    else
    {
LABEL_12:
      if (!v11)
      {
        while ((unint64_t)v10 < v9 && ((*((_DWORD *)v10 + 1) | *(_DWORD *)v10) & 0x80808080) == 0)
          v10 += 8;
      }
    }
    if (v10 < v8)
    {
      v13 = v8 - v10;
      while ((*v10 & 0x80000000) == 0)
      {
        ++v10;
        if (!--v13)
        {
          v10 = v8;
          break;
        }
      }
    }
    result = google::protobuf::internal::UTF8GenericScan(a1, &a2[(int)v10 - (int)a2], a3 - ((int)v10 - (int)a2), &v15);
    v10 += v15;
  }
  while ((_DWORD)result == 253);
  *a4 = (_DWORD)v10 - (_DWORD)a2;
  return result;
}

BOOL google::protobuf::internal::IsStructurallyValidUTF8(google::protobuf::internal *this, const char *a2)
{
  int v2;
  int v4;

  v2 = (int)a2;
  v4 = 0;
  google::protobuf::internal::UTF8GenericScanFastAscii(google::protobuf::internal::utf8acceptnonsurrogates_obj, (char *)this, (int)a2, &v4);
  return v4 == v2;
}

uint64_t google::protobuf::internal::UTF8SpnStructurallyValid(char *a1, int a2)
{
  unsigned int v3;

  v3 = 0;
  google::protobuf::internal::UTF8GenericScanFastAscii(google::protobuf::internal::utf8acceptnonsurrogates_obj, a1, a2, &v3);
  return v3;
}

char *google::protobuf::internal::UTF8CoerceToStructurallyValid(char *a1, int a2, char *a3, char a4)
{
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  int __len;
  int __len_4;

  v7 = a1;
  __len = 0;
  google::protobuf::internal::UTF8GenericScanFastAscii(google::protobuf::internal::utf8acceptnonsurrogates_obj, a1, a2, &__len);
  v8 = __len;
  if (__len != a2)
  {
    memmove(a3, v7, __len);
    if (a2 > v8)
    {
      v9 = &v7[a2];
      v10 = &v7[v8];
      v11 = &a3[v8];
      do
      {
        *v11 = a4;
        v12 = v10 + 1;
        if (v9 - (v10 + 1) < 0)
          google::protobuf::MessageLite::ParseFromArray();
        v13 = v11 + 1;
        __len_4 = 0;
        google::protobuf::internal::UTF8GenericScanFastAscii(google::protobuf::internal::utf8acceptnonsurrogates_obj, v10 + 1, (_DWORD)v9 - ((_DWORD)v10 + 1), &__len_4);
        v14 = __len_4;
        memmove(v13, v12, __len_4);
        v10 = &v12[v14];
        v11 = &v13[v14];
      }
      while (&v12[v14] < v9);
    }
    return a3;
  }
  return v7;
}

char *google::protobuf::ReplaceCharacters(char *__s1, char *__s2, char a3)
{
  char *v6;
  char *i;
  char *result;
  char *v9;

  v6 = __s1;
  if (__s1[23] < 0)
    v6 = *(char **)__s1;
  for (i = v6; ; i = result + 1)
  {
    result = strpbrk(i, __s2);
    if (!result)
      break;
    v9 = __s1;
    if (__s1[23] < 0)
      v9 = *(char **)__s1;
    v9[result - v6] = a3;
  }
  return result;
}

std::string *google::protobuf::StripWhitespace(std::string *this)
{
  std::string *v1;
  std::string::size_type size;
  std::string::size_type v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v1 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    size = this->__r_.__value_.__l.__size_;
  else
    LODWORD(size) = HIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((int)size < 1)
  {
    if ((_DWORD)size)
      return this;
    goto LABEL_22;
  }
  v3 = 0;
  while (1)
  {
    this = (std::string *)std::string::at(v1, v3);
    v4 = this->__r_.__value_.__s.__data_[0];
    if ((v4 - 9) >= 5 && v4 != 32)
      break;
    if (size == ++v3)
      goto LABEL_22;
  }
  if ((_DWORD)size == (_DWORD)v3)
  {
LABEL_22:
    if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    {
      *v1->__r_.__value_.__l.__data_ = 0;
      v1->__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v1->__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&v1->__r_.__value_.__s + 23) = 0;
    }
    return this;
  }
  if ((_DWORD)v3)
  {
    this = std::string::erase(v1, 0, v3);
    LODWORD(size) = size - v3;
  }
  v5 = (size - 1);
  if ((int)size >= 1)
  {
    v6 = 0;
    while (1)
    {
      this = (std::string *)std::string::at(v1, v5 + v6);
      v7 = this->__r_.__value_.__s.__data_[0];
      if ((v7 - 9) >= 5 && v7 != 32)
        break;
      --v6;
      if (v5 + v6 + 1 <= 0)
        return this;
    }
    if ((_DWORD)v6)
      return std::string::erase(v1, (v5 + v6 + 1), 0xFFFFFFFFFFFFFFFFLL);
  }
  return this;
}

std::string *google::protobuf::StringReplace(std::string *__str, uint64_t a2, uint64_t a3, char a4, std::string *this)
{
  std::string *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::string::size_type v11;
  std::string::size_type v12;
  char v13;
  std::string::size_type size;
  std::string *v15;
  std::string::size_type v16;
  char *v17;
  int64_t v18;
  std::string::size_type v19;
  char *v20;
  char *v21;
  int64_t v22;
  int v23;
  int64_t v24;
  char *v25;
  char *v26;
  int v27;
  const std::string::value_type *v28;
  std::string::size_type v29;
  uint64_t v30;
  std::string::size_type v31;
  int v33;
  std::string *v34;
  std::string::size_type v35;
  std::string::size_type v37;

  v5 = this;
  v7 = *(unsigned __int8 *)(a2 + 23);
  v8 = *(_QWORD *)(a2 + 8);
  if ((v7 & 0x80u) == 0)
    v9 = *(unsigned __int8 *)(a2 + 23);
  else
    v9 = *(_QWORD *)(a2 + 8);
  if (v9)
  {
    v11 = 0;
    while (1)
    {
      v12 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
      v13 = v12;
      size = __str->__r_.__value_.__l.__size_;
      v15 = (v12 & 0x80u) == 0 ? __str : (std::string *)__str->__r_.__value_.__r.__words[0];
      v16 = (v12 & 0x80u) == 0 ? HIBYTE(__str->__r_.__value_.__r.__words[2]) : __str->__r_.__value_.__l.__size_;
      v17 = (v7 & 0x80u) == 0 ? (char *)a2 : *(char **)a2;
      v18 = (v7 & 0x80u) == 0 ? v7 : v8;
      if (v16 < v11)
        break;
      v19 = v11;
      if (v18)
      {
        v20 = (char *)v15 + v11;
        v21 = (char *)v15 + v16;
        v22 = v16 - v11;
        if ((uint64_t)(v16 - v11) < v18)
          break;
        v37 = __str->__r_.__value_.__l.__size_;
        v23 = *v17;
        while (1)
        {
          v24 = v22 - v18;
          if (v24 == -1 || (v25 = (char *)memchr(v20, v23, v24 + 1)) == 0)
          {
LABEL_41:
            v5 = this;
            size = v37;
            v13 = v12;
            goto LABEL_42;
          }
          v26 = v25;
          if (!memcmp(v25, v17, v18))
            break;
          v20 = v26 + 1;
          v22 = v21 - (v26 + 1);
          if (v22 < v18)
            goto LABEL_41;
        }
        v5 = this;
        size = v37;
        v13 = v12;
        if (v26 == v21)
          break;
        v19 = v26 - (char *)v15;
      }
      if (v19 == -1)
        break;
      std::string::append(v5, __str, v11, v19 - v11);
      v27 = *(char *)(a3 + 23);
      if (v27 >= 0)
        v28 = (const std::string::value_type *)a3;
      else
        v28 = *(const std::string::value_type **)a3;
      if (v27 >= 0)
        v29 = *(unsigned __int8 *)(a3 + 23);
      else
        v29 = *(_QWORD *)(a3 + 8);
      std::string::append(v5, v28, v29);
      v7 = *(unsigned __int8 *)(a2 + 23);
      v8 = *(_QWORD *)(a2 + 8);
      if ((v7 & 0x80u) == 0)
        v30 = *(unsigned __int8 *)(a2 + 23);
      else
        v30 = *(_QWORD *)(a2 + 8);
      v11 = v30 + v19;
      if ((a4 & 1) == 0)
      {
        v12 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
        size = __str->__r_.__value_.__l.__size_;
        v13 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
        break;
      }
    }
LABEL_42:
    if (v13 >= 0)
      v31 = v12;
    else
      v31 = size;
    return std::string::append(v5, __str, v11, v31 - v11);
  }
  else
  {
    v33 = SHIBYTE(__str->__r_.__value_.__r.__words[2]);
    if (v33 >= 0)
      v34 = __str;
    else
      v34 = (std::string *)__str->__r_.__value_.__r.__words[0];
    if (v33 >= 0)
      v35 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
    else
      v35 = __str->__r_.__value_.__l.__size_;
    return std::string::append(this, (const std::string::value_type *)v34, v35);
  }
}

std::string *google::protobuf::StringReplace@<X0>(std::string *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  return google::protobuf::StringReplace(a1, a2, a3, a4, a5);
}

void sub_24801BF00(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void google::protobuf::SplitStringUsing(unsigned __int8 *__src, uint64_t a2, char *__s, std::vector<std::string> *a4)
{
  int v7;
  size_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t first_not_of;
  uint64_t v12;
  size_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t first_of;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  char *v24;
  char *v25;
  unsigned __int8 *v26;
  char *v27;
  int v28;
  std::vector<std::string> *v29;
  std::vector<std::string> *v30;
  uint64_t v31;
  void *__p[2];
  char v33;
  _QWORD v34[2];

  v34[0] = __src;
  v34[1] = a2;
  v7 = *__s;
  if (*__s && !__s[1])
  {
    if (a2)
    {
      v23 = __src;
      v24 = (char *)&__src[a2];
      v25 = (char *)&__src[a2];
      do
      {
        if (*v23 == v7)
        {
          v26 = v23 + 1;
        }
        else
        {
          v27 = (char *)(v23 + 1);
          while (v27 != v24)
          {
            v28 = *v27++;
            if (v28 == v7)
            {
              v26 = (unsigned __int8 *)(v27 - 1);
              goto LABEL_27;
            }
          }
          v26 = (unsigned __int8 *)v25;
LABEL_27:
          std::string::basic_string[abi:ne180100](__p, v23, v26 - v23);
          v30 = a4;
          std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v30, (__int128 *)__p);
          if (v33 < 0)
            operator delete(__p[0]);
        }
        v23 = v26;
      }
      while (v26 != (unsigned __int8 *)v24);
    }
  }
  else
  {
    v8 = strlen(__s);
    v10 = v8;
    if ((v8 & 0x8000000000000000) != 0)
      google::protobuf::StringPiece::LogFatalSizeTooBig((google::protobuf::StringPiece *)v8, "size_t to int conversion", v9);
    first_not_of = google::protobuf::StringPiece::find_first_not_of(v34, (unsigned __int8 *)__s, v10, 0);
    if (first_not_of != -1)
    {
      v12 = first_not_of;
      while (1)
      {
        v13 = strlen(__s);
        v15 = v13;
        if ((v13 & 0x8000000000000000) != 0)
          google::protobuf::StringPiece::LogFatalSizeTooBig((google::protobuf::StringPiece *)v13, "size_t to int conversion", v14);
        first_of = google::protobuf::StringPiece::find_first_of((google::protobuf::StringPiece *)v34, (unsigned __int8 *)__s, v15, v12);
        if (first_of == -1)
          break;
        v17 = first_of;
        v30 = (std::vector<std::string> *)google::protobuf::StringPiece::substr((google::protobuf::StringPiece *)v34, v12, first_of - v12);
        v31 = v18;
        google::protobuf::StringPiece::ToString((google::protobuf::StringPiece *)&v30, __p);
        v29 = a4;
        std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v29, (__int128 *)__p);
        if (v33 < 0)
          operator delete(__p[0]);
        v19 = strlen(__s);
        v21 = v19;
        if ((v19 & 0x8000000000000000) != 0)
          google::protobuf::StringPiece::LogFatalSizeTooBig((google::protobuf::StringPiece *)v19, "size_t to int conversion", v20);
        v12 = google::protobuf::StringPiece::find_first_not_of(v34, (unsigned __int8 *)__s, v21, v17);
        if (v12 == -1)
          return;
      }
      v30 = (std::vector<std::string> *)google::protobuf::StringPiece::substr((google::protobuf::StringPiece *)v34, v12, 0xFFFFFFFFFFFFFFFFLL);
      v31 = v22;
      google::protobuf::StringPiece::ToString((google::protobuf::StringPiece *)&v30, __p);
      v29 = a4;
      std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v29, (__int128 *)__p);
      if (v33 < 0)
        operator delete(__p[0]);
    }
  }
}

void sub_24801C13C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void google::protobuf::SplitStringAllowEmpty(uint64_t a1, uint64_t a2, char *__s, std::vector<std::string> *a4)
{
  uint64_t first_of;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::vector<std::string> *v11;
  unint64_t v12;
  uint64_t v13;
  void *__p[2];
  char v15;
  unsigned __int8 *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[0] = a1;
  v18[1] = a2;
  google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)&v16, __s);
  first_of = google::protobuf::StringPiece::find_first_of((google::protobuf::StringPiece *)v18, v16, v17, 0);
  if (first_of == -1)
  {
    v8 = 0;
  }
  else
  {
    v7 = first_of;
    v8 = 0;
    do
    {
      v12 = google::protobuf::StringPiece::substr((google::protobuf::StringPiece *)v18, v8, v7 - v8);
      v13 = v9;
      google::protobuf::StringPiece::ToString((google::protobuf::StringPiece *)&v12, __p);
      v11 = a4;
      std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v11, (__int128 *)__p);
      if (v15 < 0)
        operator delete(__p[0]);
      v8 = v7 + 1;
      google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)&v16, __s);
      v7 = google::protobuf::StringPiece::find_first_of((google::protobuf::StringPiece *)v18, v16, v17, v7 + 1);
    }
    while (v7 != -1);
  }
  v12 = google::protobuf::StringPiece::substr((google::protobuf::StringPiece *)v18, v8, 0xFFFFFFFFFFFFFFFFLL);
  v13 = v10;
  google::protobuf::StringPiece::ToString((google::protobuf::StringPiece *)&v12, __p);
  v11 = a4;
  std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](&v11, (__int128 *)__p);
  if (v15 < 0)
    operator delete(__p[0]);
}

void sub_24801C27C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void google::protobuf::JoinStrings(uint64_t *a1, char *__s, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  std::string *v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  char v18;
  std::string v19[2];

  v5 = *a1;
  v6 = a1[1];
  if (!a3)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 264);
    v7 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: result != nullptr: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
  if (*(char *)(a3 + 23) < 0)
  {
    **(_BYTE **)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 23) = 0;
  }
  v8 = strlen(__s);
  if (v6 == v5)
  {
    std::string::reserve((std::string *)a3, 0);
  }
  else
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = v5;
    do
    {
      if (v10)
        v13 = v8;
      else
        v13 = 0;
      if (*(char *)(v12 + 23) < 0)
        v14 = *(_QWORD *)(v5 + 8 + v10);
      else
        LODWORD(v14) = *(unsigned __int8 *)(v12 + 23);
      v11 += v13 + v14;
      v12 += 24;
      v10 += 24;
    }
    while (v12 != v6);
    std::string::reserve((std::string *)a3, v11);
    v15 = 0;
    do
    {
      if (v15)
        std::string::append((std::string *)a3, __s, v9);
      v16 = (const std::string::value_type *)(v5 + v15);
      if (*(char *)(v5 + v15 + 23) < 0)
      {
        v16 = *(const std::string::value_type **)(v5 + v15);
        v17 = *(_QWORD *)(v5 + v15 + 8);
      }
      else
      {
        v17 = *(unsigned __int8 *)(v5 + v15 + 23);
      }
      std::string::append((std::string *)a3, v16, v17);
      v15 += 24;
    }
    while (v5 + v15 != v6);
  }
}

void sub_24801C3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::UnescapeCEscapeSequences(google::protobuf *this, char *a2, char *a3)
{
  return google::protobuf::UnescapeCEscapeSequences((unsigned __int8 *)this, (unsigned __int8 *)a2, 0);
}

uint64_t google::protobuf::UnescapeCEscapeSequences(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  std::string *v5;
  std::string *v6;
  unsigned __int8 *i;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 v11;
  char v12;
  unsigned __int8 v13;
  int v14;
  char v15;
  unsigned int v16;
  unsigned __int8 *v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned int v21;
  char v22;
  char v24;
  std::string v25[2];

  if (a3)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 316);
    v5 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: errors == nullptr: ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, "Error reporting not implemented.");
    google::protobuf::internal::LogFinisher::operator=((int)&v24, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
  }
  if (a1 == a2)
  {
    for (i = a1; *i && *i != 92; ++i)
      ;
    a1 = i;
  }
  else
  {
    i = a2;
  }
  while (1)
  {
    v8 = *a1;
    if (v8 != 92)
    {
      if (!*a1)
        goto LABEL_59;
      goto LABEL_57;
    }
    v9 = a1 + 1;
    v8 = (char)a1[1];
    if (v8 <= 62)
      break;
    if (v8 > 97)
    {
      switch(a1[1])
      {
        case 'n':
          LOBYTE(v8) = 10;
          goto LABEL_56;
        case 'o':
        case 'p':
        case 'q':
        case 's':
        case 'u':
        case 'w':
          goto LABEL_58;
        case 'r':
          LOBYTE(v8) = 13;
          goto LABEL_56;
        case 't':
          LOBYTE(v8) = 9;
          goto LABEL_56;
        case 'v':
          LOBYTE(v8) = 11;
          goto LABEL_56;
        case 'x':
          goto LABEL_30;
        default:
          if (v8 == 102)
          {
            LOBYTE(v8) = 12;
          }
          else
          {
            if (v8 != 98)
              goto LABEL_58;
            LOBYTE(v8) = 8;
          }
          break;
      }
      goto LABEL_56;
    }
    if (v8 > 91)
    {
      if (v8 != 92)
      {
        if (v8 != 97)
          goto LABEL_58;
        LOBYTE(v8) = 7;
      }
LABEL_56:
      a1 = v9;
LABEL_57:
      *i++ = v8;
      v9 = a1;
      goto LABEL_58;
    }
    if (v8 == 63)
      goto LABEL_56;
    if (v8 != 88)
      goto LABEL_58;
LABEL_30:
    if ((a1[2] - 48) < 0xAu || (v16 = a1[2] - 65, v16 <= 0x25) && ((1 << v16) & 0x3F0000003FLL) != 0)
    {
      LOBYTE(v8) = 0;
      v17 = a1 + 1;
      while (1)
      {
        v19 = *++v17;
        v18 = v19;
        if ((v19 - 48) >= 0xAu
          && (v18 - 65 > 0x25 || ((1 << (v18 - 65)) & 0x3F0000003FLL) == 0))
        {
          break;
        }
        v21 = v18;
        v22 = v18 + 9;
        if (v21 <= 0x39)
          v22 = v21;
        v9 = v17;
        LOBYTE(v8) = v22 & 0xF | (16 * v8);
      }
      goto LABEL_56;
    }
LABEL_58:
    a1 = v9 + 1;
  }
  if (v8 > 47)
  {
    if ((v8 - 48) >= 8)
      goto LABEL_58;
    LOBYTE(v8) = v8 - 48;
    v11 = a1[2];
    v10 = a1 + 2;
    v12 = v11 + 8 * v8 - 48;
    if ((v11 & 0xF8) == 0x30)
    {
      v9 = v10;
      LOBYTE(v8) = v12;
    }
    v13 = v9[1];
    v14 = v13 & 0xF8;
    v15 = v13 + 8 * v8 - 48;
    if (v14 == 48)
      a1 = v9 + 1;
    else
      a1 = v9;
    if (v14 == 48)
      LOBYTE(v8) = v15;
    goto LABEL_57;
  }
  if (v8 == 34 || v8 == 39)
    goto LABEL_56;
  if (a1[1])
    goto LABEL_58;
LABEL_59:
  *i = 0;
  return ((_DWORD)i - (_DWORD)a2);
}

void sub_24801C6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::UnescapeCEscapeString(uint64_t a1, uint64_t a2)
{
  return google::protobuf::UnescapeCEscapeString(a1, a2, 0);
}

uint64_t google::protobuf::UnescapeCEscapeString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  std::string *v9;
  char v11;
  std::string v12[2];

  v6 = (unsigned __int8 *)operator new[]();
  if (*(char *)(a1 + 23) >= 0)
    v7 = (unsigned __int8 *)a1;
  else
    v7 = *(unsigned __int8 **)a1;
  v8 = google::protobuf::UnescapeCEscapeSequences(v7, v6, a3);
  if (!a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 456);
    v9 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: dest: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
  }
  MEMORY[0x2495969D0](a2, v6, (int)v8);
  MEMORY[0x249596C40](v6, 0x1000C8077774924);
  return v8;
}

void sub_24801C7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  MEMORY[0x249596C40](v3, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void google::protobuf::UnescapeCEscapeString(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int v6;

  v4 = (unsigned __int8 *)operator new[]();
  if (*(char *)(a1 + 23) >= 0)
    v5 = (unsigned __int8 *)a1;
  else
    v5 = *(unsigned __int8 **)a1;
  v6 = google::protobuf::UnescapeCEscapeSequences(v5, v4, 0);
  std::string::basic_string[abi:ne180100](a2, v4, v6);
  JUMPOUT(0x249596C40);
}

void sub_24801C888(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x249596C40](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::CEscapeInternal(google::protobuf *this, const char *a2, uint64_t a3, char *a4, int a5, char a6)
{
  int v6;
  char v9;
  unsigned __int8 *v10;
  char v11;
  uint64_t v12;
  const char *v13;
  unsigned __int8 *v14;
  int v15;

  v6 = (int)a4;
  if ((int)a2 >= 1)
  {
    v9 = a5;
    v10 = (unsigned __int8 *)this;
    v11 = 0;
    LODWORD(v12) = 0;
    if (a5)
      v13 = "\\x%02x";
    else
      v13 = "\\%03o";
    v14 = (unsigned __int8 *)this + (int)a2;
    while (1)
    {
      if (v6 - (int)v12 < 2)
        return 0xFFFFFFFFLL;
      v15 = (char)*v10;
      if (v15 > 33)
      {
        switch(v15)
        {
          case '"':
            v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 8796;
            goto LABEL_20;
          case '\'':
            v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 10076;
            goto LABEL_20;
          case '\\':
            v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 23644;
            goto LABEL_20;
        }
      }
      else
      {
        switch(v15)
        {
          case 9:
            v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 29788;
            goto LABEL_20;
          case 10:
            v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 28252;
            goto LABEL_20;
          case 13:
            v11 = 0;
            *(_WORD *)(a3 + (int)v12) = 29276;
LABEL_20:
            v12 = (v12 + 2);
            goto LABEL_21;
        }
      }
      if (v15 < 0 && (a6 & 1) != 0
        || (v15 - 32) <= 0x5E
        && ((v11 & 1) == 0
         || (v15 - 48) >= 0xA
         && (*v10 - 65 > 0x25 || ((1 << (v15 - 65)) & 0x3F0000003FLL) == 0)))
      {
        v11 = 0;
        *(_BYTE *)(a3 + (int)v12) = v15;
        v12 = (v12 + 1);
      }
      else
      {
        if ((v6 - v12) < 4)
          return 0xFFFFFFFFLL;
        sprintf((char *)(a3 + (int)v12), v13, *v10);
        v12 = (v12 + 4);
        v11 = v9;
      }
LABEL_21:
      if (++v10 >= v14)
        goto LABEL_34;
    }
  }
  v12 = 0;
LABEL_34:
  if ((int)v12 >= v6)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(a3 + (int)v12) = 0;
  return v12;
}

void google::protobuf::CEscapeAndAppend(const std::string::value_type *a1, int64_t a2, std::string *a3)
{
  uint64_t v6;
  uint64_t v7;
  std::string::size_type size;
  uint64_t v9;
  _BYTE *v10;
  unsigned int v11;
  const std::string::value_type *v12;
  int64_t v13;
  const std::string::value_type *v14;
  int64_t v15;

  v12 = a1;
  v13 = a2;
  v14 = a1;
  v15 = a2;
  if (a2 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
      v7 += google::protobuf::CEscapedLength(google::protobuf::StringPiece)::c_escaped_len[google::protobuf::StringPiece::operator[](&v14, v6++)];
    while (v15 > v6);
  }
  if (v7 == a2)
  {
    std::string::append(a3, a1, a2);
    return;
  }
  if (SHIBYTE(a3->__r_.__value_.__r.__words[2]) < 0)
    size = a3->__r_.__value_.__l.__size_;
  else
    size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  std::string::resize(a3, size + v7, 0);
  if (SHIBYTE(a3->__r_.__value_.__r.__words[2]) < 0)
    a3 = (std::string *)a3->__r_.__value_.__r.__words[0];
  if (a2 >= 1)
  {
    v9 = 0;
    v10 = (char *)a3 + size;
    do
    {
      v11 = google::protobuf::StringPiece::operator[](&v12, v9);
      if (v11 > 0x21u)
      {
        switch(v11)
        {
          case '"':
            *(_WORD *)v10 = 8796;
            v10 += 2;
            break;
          case '\'':
            *(_WORD *)v10 = 10076;
            v10 += 2;
            break;
          case '\\':
            *(_WORD *)v10 = 23644;
            v10 += 2;
            break;
          default:
LABEL_28:
            if (v11 - 32 >= 0x5F)
            {
              *v10 = 92;
              v10[1] = (v11 >> 6) | 0x30;
              v10[2] = (v11 >> 3) & 7 | 0x30;
              v10[3] = v11 & 7 | 0x30;
              v10 += 4;
            }
            else
            {
              *v10++ = v11;
            }
            break;
        }
      }
      else
      {
        switch(v11)
        {
          case 9u:
            *(_WORD *)v10 = 29788;
            v10 += 2;
            break;
          case 0xAu:
            *(_WORD *)v10 = 28252;
            v10 += 2;
            break;
          case 0xDu:
            *(_WORD *)v10 = 29276;
            v10 += 2;
            break;
          default:
            goto LABEL_28;
        }
      }
      ++v9;
    }
    while (v13 > v9);
  }
}

uint64_t google::protobuf::StringPiece::operator[](_QWORD *a1, uint64_t a2)
{
  if (a2 < 0)
    google::protobuf::StringPiece::operator[]();
  if (a1[1] <= a2)
    google::protobuf::StringPiece::operator[]();
  return *(char *)(*a1 + a2);
}

void google::protobuf::CEscape(uint64_t *a1@<X0>, const char *a2@<X2>, std::string *a3@<X8>)
{
  const std::string::value_type *v4[2];

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  google::protobuf::StringPiece::StringPiece<std::allocator<char>>(v4, a1, a2);
  google::protobuf::CEscapeAndAppend(v4[0], (int64_t)v4[1], a3);
}

void sub_24801CCE0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::strings::Utf8SafeCEscape@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  int v4;
  char *v5;
  void *v6;
  char v7;
  google::protobuf *v8;
  const char *v9;
  int v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v4 = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = *(_DWORD *)(a1 + 8);
  v5 = (char *)((4 * v4) | 1u);
  v6 = (void *)operator new[]();
  v7 = *(_BYTE *)(a1 + 23);
  if (v7 >= 0)
    v8 = (google::protobuf *)a1;
  else
    v8 = *(google::protobuf **)a1;
  if (v7 >= 0)
    v9 = (const char *)*(unsigned __int8 *)(a1 + 23);
  else
    v9 = (const char *)*(unsigned int *)(a1 + 8);
  v10 = google::protobuf::CEscapeInternal(v8, v9, (uint64_t)v6, v5, 0, 1);
  if (v10 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 608);
    v11 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (len) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100](a2, v6, v10);
  return MEMORY[0x249596C40](v6, 0x1000C8077774924);
}

void sub_24801CE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  MEMORY[0x249596C40](v3, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::strings::CHexEscape@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  int v4;
  char *v5;
  void *v6;
  char v7;
  google::protobuf *v8;
  const char *v9;
  int v10;
  std::string *v11;
  char v13;
  std::string v14[2];

  v4 = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = *(_DWORD *)(a1 + 8);
  v5 = (char *)((4 * v4) | 1u);
  v6 = (void *)operator new[]();
  v7 = *(_BYTE *)(a1 + 23);
  if (v7 >= 0)
    v8 = (google::protobuf *)a1;
  else
    v8 = *(google::protobuf **)a1;
  if (v7 >= 0)
    v9 = (const char *)*(unsigned __int8 *)(a1 + 23);
  else
    v9 = (const char *)*(unsigned int *)(a1 + 8);
  v10 = google::protobuf::CEscapeInternal(v8, v9, (uint64_t)v6, v5, 1, 0);
  if (v10 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 617);
    v11 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (len) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100](a2, v6, v10);
  return MEMORY[0x249596C40](v6, 0x1000C8077774924);
}

void sub_24801CF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  MEMORY[0x249596C40](v3, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::strto32_adaptor(google::protobuf *this, char **a2, char **a3)
{
  int v3;
  int v6;
  uint64_t v7;
  int v10;
  int *v11;
  int v12;
  int *v13;

  v3 = (int)a3;
  v6 = *__error();
  *__error() = 0;
  v7 = strtol((const char *)this, a2, v3);
  if (*__error() == 34 && v7 == 0x8000000000000000)
    return 0x80000000;
  if (*__error() == 34 && v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFLL;
  v10 = *__error();
  v11 = __error();
  if (!v10 && v7 <= (uint64_t)0xFFFFFFFF7FFFFFFFLL)
  {
    *v11 = 34;
    return 0x80000000;
  }
  v12 = *v11;
  v13 = __error();
  if (!v12 && v7 >= 0x80000000)
  {
    *v13 = 34;
    return 0x7FFFFFFFLL;
  }
  if (!*v13)
    *__error() = v6;
  return v7;
}

unint64_t google::protobuf::strtou32_adaptor(google::protobuf *this, char **a2, char **a3)
{
  int v3;
  int v6;
  unint64_t v7;
  int v9;
  int *v10;

  v3 = (int)a3;
  v6 = *__error();
  *__error() = 0;
  v7 = strtoul((const char *)this, a2, v3);
  if (*__error() == 34 && v7 == -1)
    return 0xFFFFFFFFLL;
  v9 = *__error();
  v10 = __error();
  if (!v9 && HIDWORD(v7))
  {
    *v10 = 34;
    return 0xFFFFFFFFLL;
  }
  if (!*v10)
    *__error() = v6;
  return v7;
}

_BYTE *google::protobuf::FastInt64ToBuffer(unint64_t this, _BYTE *a2, char *a3)
{
  unint64_t v3;
  _BYTE *result;
  BOOL v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v3 = this;
  a2[21] = 0;
  if ((this & 0x8000000000000000) != 0)
  {
    if (this < 0xFFFFFFFFFFFFFFF7)
    {
      v7 = -10 - this;
      result = a2 + 19;
      a2[20] = (v7 % 0xA) | 0x30;
      v8 = v7 / 0xA + 1;
      do
      {
        *result-- = (v8 % 0xA) | 0x30;
        v9 = v8 > 9;
        v8 /= 0xAuLL;
      }
      while (v9);
    }
    else
    {
      v6 = 48 - this;
      result = a2 + 19;
      a2[20] = v6;
    }
    *result = 45;
  }
  else
  {
    result = a2 + 21;
    do
    {
      *--result = (v3 % 0xA) | 0x30;
      v5 = v3 >= 0xA;
      v3 /= 0xAuLL;
    }
    while (v5);
  }
  return result;
}

_BYTE *google::protobuf::FastInt32ToBuffer(google::protobuf *this, _BYTE *a2, char *a3)
{
  unsigned int v3;
  _BYTE *result;
  BOOL v5;
  char v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;

  v3 = this;
  a2[11] = 0;
  if ((this & 0x80000000) != 0)
  {
    if (this < 0xFFFFFFF7)
    {
      v7 = -10 - (_DWORD)this;
      v8 = (-10 - (int)this) / 0xAu;
      result = a2 + 9;
      a2[10] = (v7 % 0xA) | 0x30;
      v9 = v8 + 1;
      do
      {
        *result-- = (v9 % 0xA) | 0x30;
        v10 = v9 > 9;
        v9 /= 0xAu;
      }
      while (v10);
    }
    else
    {
      v6 = 48 - (_BYTE)this;
      result = a2 + 9;
      a2[10] = v6;
    }
    *result = 45;
  }
  else
  {
    result = a2 + 11;
    do
    {
      *--result = (v3 % 0xA) | 0x30;
      v5 = v3 >= 0xA;
      v3 /= 0xAu;
    }
    while (v5);
  }
  return result;
}

uint64_t google::protobuf::FastHexToBuffer(google::protobuf *this, uint64_t a2, char *a3)
{
  int v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  uint64_t v8;
  BOOL v9;
  char v11;
  std::string v12[2];

  v4 = (int)this;
  if ((this & 0x80000000) != 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v12, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 887);
    v5 = google::protobuf::internal::LogMessage::operator<<(v12, "CHECK failed: i >= 0: ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, "FastHexToBuffer() wants non-negative integers, not ");
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, v4);
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v12[0].__r_.__value_.__l.__data_);
  }
  *(_BYTE *)(a2 + 21) = 0;
  v8 = a2 + 21;
  do
  {
    *(_BYTE *)--v8 = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[v4 & 0xF];
    v9 = v4 <= 15;
    v4 = v4 >> 4;
  }
  while (!v9);
  return v8;
}

void sub_24801D31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::InternalFastHexToBuffer(unint64_t this, uint64_t a2, char *a3)
{
  unint64_t v3;

  *(_BYTE *)(a2 + (int)a3) = 0;
  if ((int)a3 >= 1)
  {
    v3 = a3 + 1;
    do
    {
      *(_BYTE *)(a2 + (v3 - 2)) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[this & 0xF];
      this >>= 4;
      --v3;
    }
    while (v3 > 1);
  }
  return a2;
}

uint64_t google::protobuf::FastHex64ToBuffer(unint64_t this, uint64_t a2, char *a3)
{
  uint64_t v3;
  unint64_t v4;

  *(_BYTE *)(a2 + 16) = 0;
  v3 = 15;
  do
  {
    *(_BYTE *)(a2 + v3) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[this & 0xF];
    this >>= 4;
    v4 = v3-- + 1;
  }
  while (v4 > 1);
  return a2;
}

uint64_t google::protobuf::FastHex32ToBuffer(google::protobuf *this, uint64_t a2, char *a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = this;
  *(_BYTE *)(a2 + 8) = 0;
  v4 = 7;
  do
  {
    *(_BYTE *)(a2 + v4) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[v3 & 0xF];
    v3 >>= 4;
    v5 = v4-- + 1;
  }
  while (v5 > 1);
  return a2;
}

_BYTE *google::protobuf::FastUInt32ToBufferLeft(google::protobuf *this, _BYTE *a2, char *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE *v7;

  if (this >= 0x3B9ACA00)
  {
    v3 = this / 0x5F5E100uLL;
    *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v3];
    a2 += 2;
    goto LABEL_3;
  }
  if (this > 0x63)
  {
    if (this >> 4 <= 0x270)
    {
      if (this <= 0x3E7)
      {
        LODWORD(v6) = (unsigned __int16)this / 0x64u;
        *a2++ = v6 + 48;
        goto LABEL_9;
      }
LABEL_8:
      v6 = this / 0x64uLL;
      *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v6];
      a2 += 2;
LABEL_9:
      LODWORD(this) = (_DWORD)this - 100 * v6;
      goto LABEL_10;
    }
    if (this < 0xF4240)
    {
      if (this >> 5 <= 0xC34)
      {
        LODWORD(v5) = this / 0x2710;
        *a2++ = this / 0x2710 + 48;
        goto LABEL_7;
      }
LABEL_6:
      v5 = this / 0x2710uLL;
      *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v5];
      a2 += 2;
LABEL_7:
      LODWORD(this) = (_DWORD)this - 10000 * v5;
      goto LABEL_8;
    }
    if (this < 0x5F5E100)
    {
      if (this <= 0x98967F)
      {
        LODWORD(v4) = this / 0xF4240;
        *a2++ = this / 0xF4240 + 48;
        goto LABEL_5;
      }
LABEL_4:
      v4 = this / 0xF4240uLL;
      *(_WORD *)a2 = google::protobuf::two_ASCII_digits[v4];
      a2 += 2;
LABEL_5:
      LODWORD(this) = (_DWORD)this - 1000000 * v4;
      goto LABEL_6;
    }
    LODWORD(v3) = this / 0x5F5E100;
    *a2++ = this / 0x5F5E100 + 48;
LABEL_3:
    LODWORD(this) = (_DWORD)this - 100000000 * v3;
    goto LABEL_4;
  }
  if (this <= 9)
  {
    *a2 = (_BYTE)this + 48;
    v7 = a2 + 1;
    goto LABEL_11;
  }
LABEL_10:
  *(_WORD *)a2 = google::protobuf::two_ASCII_digits[this];
  v7 = a2 + 2;
LABEL_11:
  *v7 = 0;
  return v7;
}

_BYTE *google::protobuf::FastInt32ToBufferLeft(google::protobuf *this, _BYTE *a2, char *a3)
{
  if ((this & 0x80000000) != 0)
  {
    *a2++ = 45;
    this = (google::protobuf *)-(int)this;
  }
  return google::protobuf::FastUInt32ToBufferLeft(this, a2, a3);
}

_BYTE *google::protobuf::FastUInt64ToBufferLeft(google::protobuf *this, _BYTE *a2, char *a3)
{
  int v3;
  unint64_t v5;
  _WORD *v6;
  unsigned int v7;
  std::string *v8;
  unsigned int v9;
  char v10;
  std::string v11[2];

  v3 = (int)this;
  if (!((unint64_t)this >> 32))
    return google::protobuf::FastUInt32ToBufferLeft(this, a2, a3);
  v5 = (unint64_t)this / 0x3B9ACA00;
  v6 = (_WORD *)google::protobuf::FastUInt64ToBufferLeft((google::protobuf *)((unint64_t)this / 0x3B9ACA00), (unint64_t)a2, a3);
  v7 = v3 - 1000000000 * v5;
  if (v7 >= 0x3B9ACA00)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1068);
    v8 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (digits) < (100): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  *v6 = google::protobuf::two_ASCII_digits[v7 / 0x989680];
  v6[1] = google::protobuf::two_ASCII_digits[v7 % 0x989680 / 0x186A0uLL];
  v9 = v7 % 0x989680 % 0x186A0;
  v6[2] = google::protobuf::two_ASCII_digits[v9 / 0x3E8uLL];
  v9 %= 0x3E8u;
  v6[3] = google::protobuf::two_ASCII_digits[v9 / 0xAuLL];
  v6[4] = (v9 % 0xA + 48);
  return (char *)v6 + 9;
}

void sub_24801D6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_BYTE *google::protobuf::FastInt64ToBufferLeft(uint64_t this, _BYTE *a2, char *a3)
{
  if (this < 0)
  {
    *a2++ = 45;
    this = -this;
  }
  return google::protobuf::FastUInt64ToBufferLeft((google::protobuf *)this, a2, a3);
}

_QWORD *google::protobuf::SimpleItoa@<X0>(google::protobuf *this@<X0>, char *a2@<X2>, _QWORD *a3@<X8>)
{
  char *v4;
  _BYTE v6[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = google::protobuf::FastInt32ToBuffer(this, v6, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v4;
  char v6[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = google::protobuf::FastUInt32ToBufferLeft(this, v6, a2);
  return std::string::__init_with_size[abi:ne180100]<char const*,char const*>(a3, v6, v4, v4 - v6);
}

{
  char *v4;
  _BYTE v6[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = google::protobuf::FastInt64ToBuffer((unint64_t)this, v6, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v4);
}

{
  char *v4;
  char v6[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = google::protobuf::FastUInt64ToBufferLeft(this, v6, a2);
  return std::string::__init_with_size[abi:ne180100]<char const*,char const*>(a3, v6, v4, v4 - v6);
}

_QWORD *google::protobuf::SimpleDtoa@<X0>(double a1@<D0>, char *a2@<X1>, _QWORD *a3@<X8>)
{
  char __s[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  google::protobuf::DoubleToBuffer((google::protobuf *)__s, a1, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, __s);
}

google::protobuf *google::protobuf::DoubleToBuffer(google::protobuf *this, double a2, char *a3)
{
  int v5;
  char **v7;
  std::string *v8;
  char *v9;
  std::string *v10;
  char v11;
  double v12;
  std::string v13[2];

  if (a2 == INFINITY)
  {
    v5 = 6712937;
LABEL_5:
    *(_DWORD *)this = v5;
    return this;
  }
  if (a2 == -INFINITY)
  {
    *((_BYTE *)this + 4) = 0;
    v5 = 1718511917;
    goto LABEL_5;
  }
  if ((snprintf((char *)this, 0x20uLL, "%.*g", 15, a2) - 32) <= 0xFFFFFFE0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1265);
    v8 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kDoubleToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  v12 = 0.0;
  v12 = google::protobuf::internal::NoLocaleStrtod(this, 0, v7);
  if (v12 != a2 && (snprintf((char *)this, 0x20uLL, "%.*g", 17, a2) - 32) <= 0xFFFFFFE0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1279);
    v10 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kDoubleToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  google::protobuf::DelocalizeRadix(this, v9);
  return this;
}

void sub_24801DAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *google::protobuf::SimpleFtoa@<X0>(float a1@<S0>, char *a2@<X1>, _QWORD *a3@<X8>)
{
  char v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  google::protobuf::FloatToBuffer((google::protobuf *)v6, a1, a2);
  return std::string::basic_string[abi:ne180100]<0>(a3, v6);
}

google::protobuf *google::protobuf::FloatToBuffer(google::protobuf *this, float a2, char *a3)
{
  int v5;
  float *v7;
  std::string *v8;
  char *v9;
  std::string *v10;
  char v11;
  char v12[4];
  std::string v13[2];

  if (a2 == INFINITY)
  {
    v5 = 6712937;
LABEL_5:
    *(_DWORD *)this = v5;
    return this;
  }
  if (a2 == -INFINITY)
  {
    *((_BYTE *)this + 4) = 0;
    v5 = 1718511917;
    goto LABEL_5;
  }
  if ((snprintf((char *)this, 0x18uLL, "%.*g", 6, a2) - 24) <= 0xFFFFFFE8)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1383);
    v8 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kFloatToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)v12, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  *(float *)v12 = 0.0;
  if ((!google::protobuf::safe_strtof(this, (float *)v12, v7) || *(float *)v12 != a2)
    && (snprintf((char *)this, 0x18uLL, "%.*g", 9, a2) - 24) <= 0xFFFFFFE8)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1391);
    v10 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: snprintf_result > 0 && snprintf_result < kFloatToBufferSize: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v11, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
  google::protobuf::DelocalizeRadix(this, v9);
  return this;
}

void sub_24801DCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

char *google::protobuf::DelocalizeRadix(google::protobuf *this, char *a2)
{
  char *result;
  const char *i;
  int v5;
  int v7;
  unsigned __int8 *v8;
  const char *v9;
  int v10;
  BOOL v11;
  size_t v13;

  result = strchr((char *)this, 46);
  if (!result)
  {
    for (i = (char *)this + 2; ; ++i)
    {
      v5 = *((unsigned __int8 *)i - 2);
      if ((v5 - 48) >= 0xA
        && ((v5 - 43) > 0x3A || ((1 << (v5 - 43)) & 0x400000004000005) == 0))
      {
        break;
      }
    }
    if (*(i - 2))
    {
      v8 = (unsigned __int8 *)(i - 1);
      v7 = *((unsigned __int8 *)i - 1);
      *((_BYTE *)i - 2) = 46;
      if ((v7 - 48) >= 0xA
        && ((v7 - 43) > 0x3A || ((1 << (v7 - 43)) & 0x400000004000005) == 0))
      {
        if (v7)
        {
          do
          {
            v9 = i;
            v10 = *(unsigned __int8 *)i;
            if ((v10 - 48) < 0xA)
              break;
            ++i;
            v11 = (v10 - 43) > 0x3A || ((1 << (v10 - 43)) & 0x400000004000005) == 0;
          }
          while (v11 && v10 != 0);
          v13 = strlen(v9) + 1;
          return (char *)memmove(v8, v9, v13);
        }
      }
    }
  }
  return result;
}

double google::protobuf::internal::NoLocaleStrtod(google::protobuf::internal *this, char *a2, char **a3)
{
  double v5;
  char *v6;
  int v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  size_t v11;
  const std::string::value_type *v12;
  std::string *v13;
  char v14;
  int v15;
  int v16;
  std::string v18;
  char *v19;
  char v20;
  std::string v21[2];
  char __str;
  std::string::value_type v23[15];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v5 = strtod((const char *)this, &v19);
  v6 = v19;
  if (a2)
    *(_QWORD *)a2 = v19;
  if (*v6 == 46)
  {
    v7 = snprintf(&__str, 0x10uLL, "%.1f", 1.5);
    if (__str != 49)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2425);
      v8 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (temp[0]) == ('1'): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v8->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    if (v23[v7 - 2] != 53)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2426);
      v9 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (temp[size - 1]) == ('5'): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v9->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    if (v7 >= 7)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v21, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2427);
      v10 = google::protobuf::internal::LogMessage::operator<<(v21, "CHECK failed: (size) <= (6): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v20, (const char **)&v10->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v21[0].__r_.__value_.__l.__data_);
    }
    memset(&v18, 0, sizeof(v18));
    v11 = strlen((const char *)this);
    std::string::reserve(&v18, v11 + v7 - 3);
    std::string::append[abi:ne180100]<char const*,0>(&v18, (char *)this, v6);
    std::string::append(&v18, v23, v7 - 2);
    v12 = v6 + 1;
    v13 = &v18;
    std::string::append(&v18, v12);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v13 = (std::string *)v18.__r_.__value_.__r.__words[0];
    v21[0].__r_.__value_.__r.__words[0] = 0;
    v5 = strtod((const char *)v13, &v21[0].__r_.__value_.__l.__data_);
    v14 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    if (a2 && (int64_t)(v21[0].__r_.__value_.__r.__words[0] - (_QWORD)v13) > v19 - (char *)this)
    {
      v15 = strlen((const char *)this);
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
      else
        v16 = v18.__r_.__value_.__r.__words[1];
      *(_QWORD *)a2 = (char *)this + v21[0].__r_.__value_.__r.__words[0] - ((_QWORD)v13 + v16 - v15);
    }
    if (v14 < 0)
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  return v5;
}

void sub_24801E050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, void *a19)
{
  google::protobuf::internal::LogMessage::~LogMessage(&a19);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::safe_strtob(unsigned __int8 *a1, uint64_t a2, char *a3)
{
  std::string *v6;
  std::string *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  char v20;
  int v21;
  _BOOL4 v22;
  uint64_t result;
  const char *v24;
  unsigned __int8 *v25;
  uint64_t v26;
  char v27;
  int v28;
  char v29;
  char v30;
  int v31;
  char v32;
  unsigned __int8 *v33[2];
  unsigned __int8 *v34[2];
  unsigned __int8 *v35[2];
  unsigned __int8 *v36[2];
  char v37;
  std::string v38[2];

  if (!a3)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v38, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1305);
    v6 = google::protobuf::internal::LogMessage::operator<<(v38, "CHECK failed: value != nullptr: ");
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, "nullptr output BOOLean given.");
    google::protobuf::internal::LogFinisher::operator=((int)&v37, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v38[0].__r_.__value_.__l.__data_);
  }
  switch(a2)
  {
    case 1:
      v8 = 0;
      while (1)
      {
        v9 = a1[v8];
        if ((v9 - 65) < 0x1A)
          LOBYTE(v9) = v9 + 32;
        v10 = aT[v8];
        if ((v10 - 65) < 0x1A)
          LOBYTE(v10) = v10 + 32;
        if (v9 != v10)
          break;
        if (a2 == ++v8)
          goto LABEL_40;
      }
      if (a2 == 1)
        goto LABEL_33;
      if (a2 == 5)
        goto LABEL_49;
      if (a2 != 3)
        goto LABEL_44;
      goto LABEL_23;
    case 3:
LABEL_23:
      v14 = 0;
      while (1)
      {
        v15 = a1[v14];
        if ((v15 - 65) < 0x1A)
          LOBYTE(v15) = v15 + 32;
        v16 = aYes[v14];
        if ((v16 - 65) < 0x1A)
          LOBYTE(v16) = v16 + 32;
        if (v15 != v16)
          break;
        if (a2 == ++v14)
          goto LABEL_40;
      }
      if (a2 == 5)
      {
LABEL_49:
        v24 = "false";
        v25 = a1;
        v26 = a2;
        while (1)
        {
          v28 = *v25++;
          v27 = v28;
          v29 = v28 + 32;
          if ((v28 - 65) < 0x1A)
            v27 = v29;
          v31 = *(unsigned __int8 *)v24++;
          v30 = v31;
          v32 = v31 + 32;
          if ((v31 - 65) < 0x1A)
            v30 = v32;
          if (v27 != v30)
            goto LABEL_44;
          if (!--v26)
            goto LABEL_56;
        }
      }
      if (a2 != 1)
        goto LABEL_44;
LABEL_33:
      v17 = 0;
      while (1)
      {
        v18 = a1[v17];
        if ((v18 - 65) < 0x1A)
          LOBYTE(v18) = v18 + 32;
        v19 = aY[v17];
        if ((v19 - 65) < 0x1A)
          LOBYTE(v19) = v19 + 32;
        if (v18 != v19)
          break;
        if (a2 == ++v17)
          goto LABEL_40;
      }
      v21 = *a1;
      if ((v21 - 65) < 0x1A)
        LOBYTE(v21) = v21 + 32;
      if (v21 != 49)
        goto LABEL_44;
      goto LABEL_40;
    case 4:
      v11 = 0;
      break;
    case 5:
      goto LABEL_49;
    default:
      goto LABEL_44;
  }
  while (1)
  {
    v12 = a1[v11];
    if ((v12 - 65) < 0x1A)
      LOBYTE(v12) = v12 + 32;
    v13 = aTrue[v11];
    if ((v13 - 65) < 0x1A)
      LOBYTE(v13) = v13 + 32;
    if (v12 != v13)
      break;
    if (++v11 == 4)
    {
LABEL_40:
      v20 = 1;
      goto LABEL_57;
    }
  }
LABEL_44:
  google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v36, "f");
  if (google::protobuf::CaseEqual(a1, a2, v36[0], (uint64_t)v36[1])
    || (google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v35, "no"),
        google::protobuf::CaseEqual(a1, a2, v35[0], (uint64_t)v35[1]))
    || (google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v34, "n"),
        google::protobuf::CaseEqual(a1, a2, v34[0], (uint64_t)v34[1])))
  {
LABEL_56:
    v20 = 0;
  }
  else
  {
    google::protobuf::StringPiece::StringPiece((google::protobuf::StringPiece *)v33, "0");
    v22 = google::protobuf::CaseEqual(a1, a2, v33[0], (uint64_t)v33[1]);
    v20 = 0;
    result = 0;
    if (!v22)
      return result;
  }
LABEL_57:
  *a3 = v20;
  return 1;
}

void sub_24801E3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::CaseEqual(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  unsigned __int8 v4;
  int v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 v9;
  int v10;

  if (a2 != a4)
    return 0;
  if (a2)
  {
    while (1)
    {
      v5 = *a1++;
      v4 = v5;
      v6 = v5 + 32;
      if ((v5 - 65) < 0x1A)
        v4 = v6;
      v8 = *a3++;
      v7 = v8;
      v9 = v8 + 32;
      if ((v8 - 65) < 0x1A)
        v7 = v9;
      v10 = v4 - v7;
      if (v10)
        break;
      if (!--a2)
        goto LABEL_9;
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  return v10 == 0;
}

BOOL google::protobuf::safe_strtof(google::protobuf *this, float *a2, float *a3)
{
  char *v6;

  v6 = 0;
  *__error() = 0;
  *a2 = strtof((const char *)this, &v6);
  return *(_BYTE *)this && !*v6 && *__error() == 0;
}

BOOL google::protobuf::safe_strtod(google::protobuf *this, double *a2, char **a3)
{
  google::protobuf *i;
  int v5;
  char v7[8];

  *(_QWORD *)v7 = 0;
  *a2 = google::protobuf::internal::NoLocaleStrtod(this, v7, a3);
  i = this;
  if (*(google::protobuf **)v7 != this)
  {
    for (i = *(google::protobuf **)v7; ; *(_QWORD *)v7 = i)
    {
      v5 = *(unsigned __int8 *)i;
      if ((v5 - 9) >= 5 && v5 != 32)
        break;
      i = (google::protobuf *)((char *)i + 1);
    }
  }
  return *(_BYTE *)this && *(_BYTE *)i == 0;
}

uint64_t google::protobuf::safe_strto32(uint64_t a1, int *a2)
{
  uint64_t v3;
  std::string __p;

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  v3 = google::protobuf::safe_int_internal<int>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

void sub_24801E5B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_int_internal<int>(std::string *__str, int *a2)
{
  std::string *v4;
  int64_t size;
  char *v6;
  std::string *v7;
  uint64_t v8;
  int v9;
  int v10;
  std::string *v11;
  uint64_t v12;
  std::string __p;
  std::string v15;
  char v16;

  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    v4 = __str;
    size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  v6 = (char *)v4 + size;
  v7 = v4;
  if (size >= 1)
  {
    v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32)
        break;
      v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6)
      return 0;
    v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1))
      return 0;
  }
  v11 = __str;
  if ((*((_BYTE *)&__str->__r_.__value_.__s + 23) & 0x80) != 0)
    v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (_QWORD)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str->__r_.__value_.__l.__data_);
  *__str = v15;
  if (v10 == 45)
    return google::protobuf::safe_parse_negative_int<int>((unsigned __int8 *)__str, a2);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  else
    __p = *__str;
  v12 = google::protobuf::safe_parse_positive_int<int>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v12;
}

void sub_24801E748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_strtou32(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  std::string __p;

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  v3 = google::protobuf::safe_uint_internal<unsigned int>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

void sub_24801E7D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_uint_internal<unsigned int>(std::string *__str, unsigned int *a2)
{
  std::string *v4;
  int64_t size;
  char *v6;
  std::string *v7;
  uint64_t v8;
  int v9;
  int v10;
  std::string *v11;
  uint64_t v12;
  std::string __p;
  std::string v15;
  char v16;

  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    v4 = __str;
    size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  v6 = (char *)v4 + size;
  v7 = v4;
  if (size >= 1)
  {
    v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32)
        break;
      v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6)
      return 0;
    v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1))
      return 0;
  }
  v11 = __str;
  if ((*((_BYTE *)&__str->__r_.__value_.__s + 23) & 0x80) != 0)
    v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (_QWORD)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str->__r_.__value_.__l.__data_);
  *__str = v15;
  if (v10 == 45)
    return 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  else
    __p = *__str;
  v12 = google::protobuf::safe_parse_positive_int<unsigned int>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v12;
}

void sub_24801E950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_strto64(uint64_t a1, int64_t *a2)
{
  uint64_t v3;
  std::string __p;

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  v3 = google::protobuf::safe_int_internal<long long>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

void sub_24801E9DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_int_internal<long long>(std::string *__str, int64_t *a2)
{
  std::string *v4;
  int64_t size;
  char *v6;
  std::string *v7;
  uint64_t v8;
  int v9;
  int v10;
  std::string *v11;
  uint64_t v12;
  std::string __p;
  std::string v15;
  char v16;

  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    v4 = __str;
    size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  v6 = (char *)v4 + size;
  v7 = v4;
  if (size >= 1)
  {
    v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32)
        break;
      v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6)
      return 0;
    v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1))
      return 0;
  }
  v11 = __str;
  if ((*((_BYTE *)&__str->__r_.__value_.__s + 23) & 0x80) != 0)
    v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (_QWORD)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str->__r_.__value_.__l.__data_);
  *__str = v15;
  if (v10 == 45)
    return google::protobuf::safe_parse_negative_int<long long>((unsigned __int8 *)__str, a2);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  else
    __p = *__str;
  v12 = google::protobuf::safe_parse_positive_int<long long>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v12;
}

void sub_24801EB6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_strtou64(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;
  std::string __p;

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  v3 = google::protobuf::safe_uint_internal<unsigned long long>(&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

void sub_24801EBF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::safe_uint_internal<unsigned long long>(std::string *__str, unint64_t *a2)
{
  std::string *v4;
  int64_t size;
  char *v6;
  std::string *v7;
  uint64_t v8;
  int v9;
  int v10;
  std::string *v11;
  uint64_t v12;
  std::string __p;
  std::string v15;
  char v16;

  *a2 = 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
    size = __str->__r_.__value_.__l.__size_;
  }
  else
  {
    v4 = __str;
    size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  v6 = (char *)v4 + size;
  v7 = v4;
  if (size >= 1)
  {
    v7 = v4;
    do
    {
      if (v7->__r_.__value_.__s.__data_[0] != 32)
        break;
      v7 = (std::string *)((char *)v7 + 1);
    }
    while (v7 < (std::string *)v6);
  }
  v8 = (uint64_t)v4->__r_.__value_.__r.__words + size + 1;
  do
  {
    if (v7 >= (std::string *)v6)
      return 0;
    v9 = *--v6;
    --v8;
  }
  while (v9 == 32);
  v10 = v7->__r_.__value_.__s.__data_[0];
  if (v10 == 45 || v10 == 43)
  {
    v7 = (std::string *)((char *)v7 + 1);
    if (v7 >= (std::string *)(v6 + 1))
      return 0;
  }
  v11 = __str;
  if ((*((_BYTE *)&__str->__r_.__value_.__s + 23) & 0x80) != 0)
    v11 = (std::string *)__str->__r_.__value_.__r.__words[0];
  std::string::basic_string(&v15, __str, (char *)v7 - (char *)v11, v8 - (_QWORD)v7, (std::allocator<char> *)&v16);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str->__r_.__value_.__l.__data_);
  *__str = v15;
  if (v10 == 45)
    return 0;
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, __str->__r_.__value_.__l.__data_, __str->__r_.__value_.__l.__size_);
  else
    __p = *__str;
  v12 = google::protobuf::safe_parse_positive_int<unsigned long long>((unsigned __int8 *)&__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v12;
}

void sub_24801ED74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *google::protobuf::strings::AlphaNum::AlphaNum(_QWORD *result, unint64_t a2, char a3)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = 0;
  v4 = (1 << (4 * a3 - 4)) | a2;
  do
  {
    *((_BYTE *)result + v3 + 47) = google::protobuf::strings::AlphaNum::AlphaNum(google::protobuf::strings::Hex)::hexdigits[a2 & 0xF];
    a2 >>= 4;
    --v3;
    v5 = v4 > 0xF;
    v4 >>= 4;
  }
  while (v5);
  *result = (char *)result + v3 + 48;
  result[1] = -v3;
  return result;
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  std::string *v6;
  size_t v7;
  char *v8;
  size_t v9;
  std::string::size_type size;
  std::string *v11;
  char v12;
  std::string v13[2];

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a3, *(_QWORD *)(a2 + 8) + *(_QWORD *)(a1 + 8), 0);
  if ((a3->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = a3;
  else
    v6 = (std::string *)a3->__r_.__value_.__r.__words[0];
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    memcpy(v6, *(const void **)a1, v7);
    v8 = (char *)v6 + *(_QWORD *)(a1 + 8);
  }
  else
  {
    v8 = (char *)v6;
  }
  v9 = *(_QWORD *)(a2 + 8);
  if (v9)
  {
    memcpy(v8, *(const void **)a2, v9);
    v8 += *(_QWORD *)(a2 + 8);
  }
  size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = a3->__r_.__value_.__l.__size_;
  if (v8 != (char *)v6 + size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v13, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1477);
    v11 = google::protobuf::internal::LogMessage::operator<<(v13, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v12, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v13[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801EEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  std::string *v8;
  size_t v9;
  char *v10;
  size_t v11;
  size_t v12;
  std::string::size_type size;
  std::string *v14;
  char v15;
  std::string v16[2];

  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a4, *(_QWORD *)(a2 + 8) + *(_QWORD *)(a1 + 8) + *(_QWORD *)(a3 + 8), 0);
  if ((a4->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = a4;
  else
    v8 = (std::string *)a4->__r_.__value_.__r.__words[0];
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    memcpy(v8, *(const void **)a1, v9);
    v10 = (char *)v8 + *(_QWORD *)(a1 + 8);
  }
  else
  {
    v10 = (char *)v8;
  }
  v11 = *(_QWORD *)(a2 + 8);
  if (v11)
  {
    memcpy(v10, *(const void **)a2, v11);
    v10 += *(_QWORD *)(a2 + 8);
  }
  v12 = *(_QWORD *)(a3 + 8);
  if (v12)
  {
    memcpy(v10, *(const void **)a3, v12);
    v10 += *(_QWORD *)(a3 + 8);
  }
  size = HIBYTE(a4->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = a4->__r_.__value_.__l.__size_;
  if (v10 != (char *)v8 + size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1487);
    v14 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801F050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char *v10;
  char *v11;
  uint64_t v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  *(_QWORD *)a5 = 0;
  *(_QWORD *)(a5 + 8) = 0;
  *(_QWORD *)(a5 + 16) = 0;
  std::string::resize((std::string *)a5, *(_QWORD *)(a2 + 8) + *(_QWORD *)(a1 + 8) + *(_QWORD *)(a3 + 8) + *(_QWORD *)(a4 + 8), 0);
  if (*(char *)(a5 + 23) >= 0)
    v10 = (char *)a5;
  else
    v10 = *(char **)a5;
  v11 = google::protobuf::Append4(v10, a1, a2, a3, a4);
  v12 = *(unsigned __int8 *)(a5 + 23);
  if ((v12 & 0x80u) != 0)
    v12 = *(_QWORD *)(a5 + 8);
  if (v11 != &v10[v12])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1497);
    v13 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801F17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

char *google::protobuf::Append4(char *__dst, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v8;
  size_t v9;
  size_t v11;
  size_t v12;
  size_t v13;

  v8 = __dst;
  v9 = *(_QWORD *)(a2 + 8);
  if (v9)
  {
    memcpy(__dst, *(const void **)a2, v9);
    v8 += *(_QWORD *)(a2 + 8);
  }
  v11 = *(_QWORD *)(a3 + 8);
  if (v11)
  {
    memcpy(v8, *(const void **)a3, v11);
    v8 += *(_QWORD *)(a3 + 8);
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12)
  {
    memcpy(v8, *(const void **)a4, v12);
    v8 += *(_QWORD *)(a4 + 8);
  }
  v13 = *(_QWORD *)(a5 + 8);
  if (v13)
  {
    memcpy(v8, *(const void **)a5, v13);
    v8 += *(_QWORD *)(a5 + 8);
  }
  return v8;
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char *v12;
  char *v13;
  char *v14;
  size_t v15;
  uint64_t v16;
  std::string *v17;
  char v18;
  std::string v19[2];

  *(_QWORD *)a6 = 0;
  *(_QWORD *)(a6 + 8) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  std::string::resize((std::string *)a6, *(_QWORD *)(a2 + 8) + *(_QWORD *)(a1 + 8) + *(_QWORD *)(a3 + 8) + *(_QWORD *)(a4 + 8) + *(_QWORD *)(a5 + 8), 0);
  if (*(char *)(a6 + 23) >= 0)
    v12 = (char *)a6;
  else
    v12 = *(char **)a6;
  v13 = google::protobuf::Append4(v12, a1, a2, a3, a4);
  v14 = v13;
  v15 = *(_QWORD *)(a5 + 8);
  if (v15)
  {
    memcpy(v13, *(const void **)a5, v15);
    v14 += *(_QWORD *)(a5 + 8);
  }
  v16 = *(unsigned __int8 *)(a6 + 23);
  if ((v16 & 0x80u) != 0)
    v16 = *(_QWORD *)(a6 + 8);
  if (v14 != &v12[v16])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1508);
    v17 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801F38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char *v14;
  char *v15;
  char *v16;
  size_t v17;
  size_t v18;
  uint64_t v19;
  std::string *v20;
  char v21;
  std::string v22[2];

  *(_QWORD *)a7 = 0;
  *(_QWORD *)(a7 + 8) = 0;
  *(_QWORD *)(a7 + 16) = 0;
  std::string::resize((std::string *)a7, *(_QWORD *)(a2 + 8)+ *(_QWORD *)(a1 + 8)+ *(_QWORD *)(a3 + 8)+ *(_QWORD *)(a4 + 8)+ *(_QWORD *)(a5 + 8)+ *(_QWORD *)(a6 + 8), 0);
  if (*(char *)(a7 + 23) >= 0)
    v14 = (char *)a7;
  else
    v14 = *(char **)a7;
  v15 = google::protobuf::Append4(v14, a1, a2, a3, a4);
  v16 = v15;
  v17 = *(_QWORD *)(a5 + 8);
  if (v17)
  {
    memcpy(v15, *(const void **)a5, v17);
    v16 += *(_QWORD *)(a5 + 8);
  }
  v18 = *(_QWORD *)(a6 + 8);
  if (v18)
  {
    memcpy(v16, *(const void **)a6, v18);
    v16 += *(_QWORD *)(a6 + 8);
  }
  v19 = *(unsigned __int8 *)(a7 + 23);
  if ((v19 & 0x80u) != 0)
    v19 = *(_QWORD *)(a7 + 8);
  if (v16 != &v14[v19])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v22, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1520);
    v20 = google::protobuf::internal::LogMessage::operator<<(v22, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v21, (const char **)&v20->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v22[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801F514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char *v16;
  char *v17;
  char *v18;
  size_t v19;
  size_t v20;
  size_t v21;
  uint64_t v22;
  std::string *v23;
  char v24;
  std::string v25[2];

  *(_QWORD *)a8 = 0;
  *(_QWORD *)(a8 + 8) = 0;
  *(_QWORD *)(a8 + 16) = 0;
  std::string::resize((std::string *)a8, *(_QWORD *)(a2 + 8)+ *(_QWORD *)(a1 + 8)+ *(_QWORD *)(a3 + 8)+ *(_QWORD *)(a4 + 8)+ *(_QWORD *)(a5 + 8)+ *(_QWORD *)(a6 + 8)+ *(_QWORD *)(a7 + 8), 0);
  if (*(char *)(a8 + 23) >= 0)
    v16 = (char *)a8;
  else
    v16 = *(char **)a8;
  v17 = google::protobuf::Append4(v16, a1, a2, a3, a4);
  v18 = v17;
  v19 = *(_QWORD *)(a5 + 8);
  if (v19)
  {
    memcpy(v17, *(const void **)a5, v19);
    v18 += *(_QWORD *)(a5 + 8);
  }
  v20 = *(_QWORD *)(a6 + 8);
  if (v20)
  {
    memcpy(v18, *(const void **)a6, v20);
    v18 += *(_QWORD *)(a6 + 8);
  }
  v21 = *(_QWORD *)(a7 + 8);
  if (v21)
  {
    memcpy(v18, *(const void **)a7, v21);
    v18 += *(_QWORD *)(a7 + 8);
  }
  v22 = *(unsigned __int8 *)(a8 + 23);
  if ((v22 & 0x80u) != 0)
    v22 = *(_QWORD *)(a8 + 8);
  if (v18 != &v16[v22])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1534);
    v23 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v24, (const char **)&v23->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801F6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  std::string *v22;
  char v23;
  std::string v24[2];

  *(_QWORD *)a9 = 0;
  *(_QWORD *)(a9 + 8) = 0;
  *(_QWORD *)(a9 + 16) = 0;
  std::string::resize((std::string *)a9, *(_QWORD *)(a2 + 8)+ *(_QWORD *)(a1 + 8)+ *(_QWORD *)(a3 + 8)+ *(_QWORD *)(a4 + 8)+ *(_QWORD *)(a5 + 8)+ *(_QWORD *)(a6 + 8)+ *(_QWORD *)(a7 + 8)+ *(_QWORD *)(a8 + 8), 0);
  if (*(char *)(a9 + 23) >= 0)
    v18 = (char *)a9;
  else
    v18 = *(char **)a9;
  v19 = google::protobuf::Append4(v18, a1, a2, a3, a4);
  v20 = google::protobuf::Append4(v19, a5, a6, a7, a8);
  v21 = *(unsigned __int8 *)(a9 + 23);
  if ((v21 & 0x80u) != 0)
    v21 = *(_QWORD *)(a9 + 8);
  if (v20 != &v18[v21])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1547);
    v22 = google::protobuf::internal::LogMessage::operator<<(v24, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v22->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801F84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

void google::protobuf::StrCat(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  size_t v22;
  uint64_t v23;
  std::string *v24;
  char v26;
  std::string v27[2];

  *(_QWORD *)a9 = 0;
  *(_QWORD *)(a9 + 8) = 0;
  *(_QWORD *)(a9 + 16) = 0;
  std::string::resize((std::string *)a9, *(_QWORD *)(a2 + 8)+ *(_QWORD *)(a1 + 8)+ *(_QWORD *)(a3 + 8)+ *(_QWORD *)(a4 + 8)+ *(_QWORD *)(a5 + 8)+ *(_QWORD *)(a6 + 8)+ *(_QWORD *)(a7 + 8)+ *(_QWORD *)(a8 + 8)+ *(_QWORD *)(a10 + 8), 0);
  if (*(char *)(a9 + 23) >= 0)
    v18 = (char *)a9;
  else
    v18 = *(char **)a9;
  v19 = google::protobuf::Append4(v18, a1, a2, a3, a4);
  v20 = google::protobuf::Append4(v19, a5, a6, a7, a8);
  v21 = v20;
  v22 = *(_QWORD *)(a10 + 8);
  if (v22)
  {
    memcpy(v20, *(const void **)a10, v22);
    v21 += *(_QWORD *)(a10 + 8);
  }
  v23 = *(unsigned __int8 *)(a9 + 23);
  if ((v23 & 0x80u) != 0)
    v23 = *(_QWORD *)(a9 + 8);
  if (v21 != &v18[v23])
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v27, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1561);
    v24 = google::protobuf::internal::LogMessage::operator<<(v27, "CHECK failed: (out) == (begin + result.size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v26, (const char **)&v24->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v27[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801F9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  _Unwind_Resume(a1);
}

std::string *google::protobuf::StrAppend(std::string *this, uint64_t a2)
{
  const std::string::value_type *v4;
  std::string::size_type size;
  const std::string::value_type *v6;
  std::string *v7;
  char v9;
  std::string v10[2];

  v4 = *(const std::string::value_type **)a2;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    size = this->__r_.__value_.__l.__size_;
    v6 = &v4[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v6 = (const std::string::value_type *)(v4 - (const std::string::value_type *)this);
  }
  if ((unint64_t)v6 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1574);
    v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    v4 = *(const std::string::value_type **)a2;
  }
  return std::string::append(this, v4, *(_QWORD *)(a2 + 8));
}

void sub_24801FAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::StrAppend(std::string *this, uint64_t a2, uint64_t a3)
{
  _BYTE *v6;
  int v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  _BYTE *v11;
  std::string::size_type v12;
  std::string::size_type v13;
  std::string *v14;
  std::string::size_type v15;
  std::string *v16;
  char *v17;
  size_t v18;
  size_t v19;
  std::string::size_type v20;
  std::string *v21;
  char v22;
  std::string v23[2];

  v6 = *(_BYTE **)a2;
  v7 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v7 < 0)
  {
    size = this->__r_.__value_.__l.__size_;
    v9 = (std::string::size_type)&v6[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = v6 - (_BYTE *)this;
  }
  if (v9 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1579);
    v10 = google::protobuf::internal::LogMessage::operator<<(v23, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v22, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v23[0].__r_.__value_.__l.__data_);
    LOBYTE(v7) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  v11 = *(_BYTE **)a3;
  if ((v7 & 0x80) != 0)
  {
    v13 = this->__r_.__value_.__l.__size_;
    v12 = (std::string::size_type)&v11[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    v12 = v11 - (_BYTE *)this;
    v13 = v7;
  }
  if (v12 <= v13)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1580);
    v14 = google::protobuf::internal::LogMessage::operator<<(v23, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v22, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v23[0].__r_.__value_.__l.__data_);
    LOBYTE(v7) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v7 & 0x80) != 0)
    v15 = this->__r_.__value_.__l.__size_;
  else
    v15 = v7;
  std::string::resize(this, *(_QWORD *)(a2 + 8) + v15 + *(_QWORD *)(a3 + 8), 0);
  v16 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v16 = (std::string *)this->__r_.__value_.__r.__words[0];
  v17 = (char *)v16 + v15;
  v18 = *(_QWORD *)(a2 + 8);
  if (v18)
  {
    memcpy(v17, *(const void **)a2, v18);
    v17 += *(_QWORD *)(a2 + 8);
  }
  v19 = *(_QWORD *)(a3 + 8);
  if (v19)
  {
    memcpy(v17, *(const void **)a3, v19);
    v17 += *(_QWORD *)(a3 + 8);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v20 = this->__r_.__value_.__l.__size_;
  else
    v20 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v17 != (char *)v16 + v20)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v23, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1585);
    v21 = google::protobuf::internal::LogMessage::operator<<(v23, "CHECK failed: (out) == (begin + result->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v22, (const char **)&v21->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v23[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801FCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::StrAppend(std::string *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v8;
  int v9;
  std::string::size_type size;
  std::string::size_type v11;
  std::string *v12;
  _BYTE *v13;
  std::string::size_type v14;
  std::string::size_type v15;
  std::string *v16;
  _BYTE *v17;
  std::string::size_type v18;
  std::string::size_type v19;
  std::string *v20;
  std::string::size_type v21;
  std::string *v22;
  char *v23;
  size_t v24;
  size_t v25;
  size_t v26;
  std::string::size_type v27;
  std::string *v28;
  char v29;
  std::string v30[2];

  v8 = *(_BYTE **)a2;
  v9 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v9 < 0)
  {
    size = this->__r_.__value_.__l.__size_;
    v11 = (std::string::size_type)&v8[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v11 = v8 - (_BYTE *)this;
  }
  if (v11 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1590);
    v12 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v12->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
    LOBYTE(v9) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  v13 = *(_BYTE **)a3;
  if ((v9 & 0x80) != 0)
  {
    v15 = this->__r_.__value_.__l.__size_;
    v14 = (std::string::size_type)&v13[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    v14 = v13 - (_BYTE *)this;
    v15 = v9;
  }
  if (v14 <= v15)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1591);
    v16 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v16->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
    LOBYTE(v9) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  v17 = *(_BYTE **)a4;
  if ((v9 & 0x80) != 0)
  {
    v19 = this->__r_.__value_.__l.__size_;
    v18 = (std::string::size_type)&v17[-this->__r_.__value_.__r.__words[0]];
  }
  else
  {
    v18 = v17 - (_BYTE *)this;
    v19 = v9;
  }
  if (v18 <= v19)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1592);
    v20 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (uintptr_t((c).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v20->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
    LOBYTE(v9) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v9 & 0x80) != 0)
    v21 = this->__r_.__value_.__l.__size_;
  else
    v21 = v9;
  std::string::resize(this, *(_QWORD *)(a2 + 8) + *(_QWORD *)(a4 + 8) + v21 + *(_QWORD *)(a3 + 8), 0);
  v22 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v22 = (std::string *)this->__r_.__value_.__r.__words[0];
  v23 = (char *)v22 + v21;
  v24 = *(_QWORD *)(a2 + 8);
  if (v24)
  {
    memcpy(v23, *(const void **)a2, v24);
    v23 += *(_QWORD *)(a2 + 8);
  }
  v25 = *(_QWORD *)(a3 + 8);
  if (v25)
  {
    memcpy(v23, *(const void **)a3, v25);
    v23 += *(_QWORD *)(a3 + 8);
  }
  v26 = *(_QWORD *)(a4 + 8);
  if (v26)
  {
    memcpy(v23, *(const void **)a4, v26);
    v23 += *(_QWORD *)(a4 + 8);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v27 = this->__r_.__value_.__l.__size_;
  else
    v27 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v23 != (char *)v22 + v27)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v30, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1598);
    v28 = google::protobuf::internal::LogMessage::operator<<(v30, "CHECK failed: (out) == (begin + result->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v29, (const char **)&v28->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v30[0].__r_.__value_.__l.__data_);
  }
}

void sub_24801FF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::StrAppend(std::string *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10;
  int v11;
  std::string::size_type size;
  std::string::size_type v13;
  std::string *v14;
  uint64_t v15;
  std::string::size_type v16;
  std::string::size_type v17;
  std::string *v18;
  uint64_t v19;
  std::string::size_type v20;
  std::string::size_type v21;
  std::string *v22;
  uint64_t v23;
  std::string::size_type v24;
  std::string::size_type v25;
  std::string *v26;
  std::string::size_type v27;
  std::string *v28;
  char *v29;
  std::string::size_type v30;
  std::string *v31;
  char v32;
  std::string v33[2];

  v10 = *a2;
  v11 = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v11 < 0)
  {
    size = this->__r_.__value_.__l.__size_;
    v13 = v10 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v13 = v10 - (_QWORD)this;
  }
  if (v13 <= size)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1603);
    v14 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((a).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  v15 = *a3;
  if ((v11 & 0x80) != 0)
  {
    v17 = this->__r_.__value_.__l.__size_;
    v16 = v15 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v16 = v15 - (_QWORD)this;
    v17 = v11;
  }
  if (v16 <= v17)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1604);
    v18 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((b).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v18->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  v19 = *a4;
  if ((v11 & 0x80) != 0)
  {
    v21 = this->__r_.__value_.__l.__size_;
    v20 = v19 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v20 = v19 - (_QWORD)this;
    v21 = v11;
  }
  if (v20 <= v21)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1605);
    v22 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((c).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v22->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  v23 = *a5;
  if ((v11 & 0x80) != 0)
  {
    v25 = this->__r_.__value_.__l.__size_;
    v24 = v23 - this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v24 = v23 - (_QWORD)this;
    v25 = v11;
  }
  if (v24 <= v25)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1606);
    v26 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (uintptr_t((d).data() - (*result).data())) > (uintptr_t((*result).size())): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v26->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    LOBYTE(v11) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v11 & 0x80) != 0)
    v27 = this->__r_.__value_.__l.__size_;
  else
    v27 = v11;
  std::string::resize(this, a2[1] + a4[1] + a5[1] + v27 + a3[1], 0);
  v28 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v28 = (std::string *)this->__r_.__value_.__r.__words[0];
  v29 = google::protobuf::Append4((char *)v28 + v27, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v30 = this->__r_.__value_.__l.__size_;
  else
    v30 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  if (v29 != (char *)v28 + v30)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1611);
    v31 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: (out) == (begin + result->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v32, (const char **)&v31->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
  }
}

void sub_248020234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::GlobalReplaceSubstring(uint64_t a1, uint64_t a2, std::string *this)
{
  std::string *v6;
  std::string::size_type v7;
  const std::string::value_type *v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char *v13;
  int v14;
  std::string::size_type v15;
  const std::string::value_type *v16;
  int v17;
  std::string::size_type v18;
  std::string::size_type size;
  std::string::size_type v20;
  __int128 v21;
  char v23;
  std::string v24;

  if (!this)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1616);
    v6 = google::protobuf::internal::LogMessage::operator<<(&v24, "CHECK failed: s != nullptr: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (!this->__r_.__value_.__l.__size_)
      return 0;
  }
  else if (!*((_BYTE *)&this->__r_.__value_.__s + 23))
  {
    return 0;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    v7 = *(_QWORD *)(a1 + 8);
    if (v7)
    {
      memset(&v24, 0, sizeof(v24));
      v8 = *(const std::string::value_type **)a1;
      goto LABEL_12;
    }
    return 0;
  }
  v7 = *(unsigned __int8 *)(a1 + 23);
  if (!*(_BYTE *)(a1 + 23))
    return 0;
  memset(&v24, 0, sizeof(v24));
  v8 = (const std::string::value_type *)a1;
LABEL_12:
  v9 = std::string::find(this, v8, 0, v7);
  if (v9 == -1)
  {
    v10 = 0;
  }
  else
  {
    v11 = 0;
    LODWORD(v10) = 0;
    do
    {
      std::string::append(&v24, this, v11, v9 - v11);
      v12 = *(unsigned __int8 *)(a2 + 23);
      if ((v12 & 0x80u) == 0)
        v13 = (char *)a2;
      else
        v13 = *(char **)a2;
      if ((v12 & 0x80u) != 0)
        v12 = *(_QWORD *)(a2 + 8);
      std::string::append[abi:ne180100]<std::__wrap_iter<char const*>,0>(&v24, v13, &v13[v12]);
      v14 = *(char *)(a1 + 23);
      if (v14 >= 0)
        v15 = *(unsigned __int8 *)(a1 + 23);
      else
        v15 = *(_QWORD *)(a1 + 8);
      if (v14 >= 0)
        v16 = (const std::string::value_type *)a1;
      else
        v16 = *(const std::string::value_type **)a1;
      v17 = v15 + v9;
      v18 = (int)v15 + v9;
      v9 = std::string::find(this, v16, v18, v15);
      v10 = (v10 + 1);
      v11 = v17;
    }
    while (v9 != -1);
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      size = this->__r_.__value_.__l.__size_;
    else
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::append(&v24, this, v18, size - v18);
    v20 = this->__r_.__value_.__r.__words[2];
    v21 = *(_OWORD *)&this->__r_.__value_.__l.__data_;
    *this = v24;
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v21;
    v24.__r_.__value_.__r.__words[2] = v20;
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  return v10;
}

void sub_248020448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<std::__wrap_iter<char const*>,0>(std::string *this, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  _BYTE *v15;
  char v16;
  std::string::size_type v17;
  void *__p[2];
  unsigned __int8 v20;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v14 = this;
    if ((v6 & 0x80) != 0)
      v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    v15 = (char *)v14 + size;
    while (v4 != a3)
    {
      v16 = *v4++;
      *v15++ = v16;
    }
    *v15 = 0;
    v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v17;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
  }
  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    if ((v20 & 0x80u) == 0)
      v13 = v20;
    else
      v13 = (std::string::size_type)__p[1];
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0)
      operator delete(__p[0]);
  }
  return this;
}

void sub_2480205D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::CalculateBase64EscapedLen(google::protobuf *this, int a2)
{
  uint64_t v2;
  unsigned int v3;
  int v4;

  v2 = (4 * ((int)this / 3));
  if ((int)this % 3)
  {
    v3 = v2 | 3;
    v4 = v2 + 4;
    if (a2)
      v3 = v2 + 4;
    LODWORD(v2) = v2 | 2;
    if (a2)
      LODWORD(v2) = v4;
    if ((int)this % 3 == 1)
      v2 = v2;
    else
      v2 = v3;
  }
  if ((int)v2 < (int)this)
    google::protobuf::CalculateBase64EscapedLen();
  return v2;
}

uint64_t google::protobuf::CalculateBase64EscapedLen(google::protobuf *this)
{
  return google::protobuf::CalculateBase64EscapedLen(this, 1);
}

uint64_t google::protobuf::Base64UnescapeInternal(google::protobuf *this, const char *a2, uint64_t a3, char *a4, uint64_t a5, const signed __int8 *a6)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  google::protobuf *v11;
  google::protobuf *v12;
  int v13;
  google::protobuf *v14;
  int v15;
  google::protobuf *v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  google::protobuf *v31;
  google::protobuf *v32;
  int v33;
  google::protobuf *v34;
  int v35;
  google::protobuf *v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  google::protobuf *v44;
  int v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  _BYTE *v51;
  int v52;
  uint64_t result;
  std::string *v54;
  std::string *v55;
  _BYTE *v56;
  int v57;
  int v58;
  unsigned int v59;
  char v61;
  std::string v62[2];

  if (!a3)
  {
    if ((int)a2 >= 4)
    {
      v7 = 0;
      LODWORD(v27) = 0;
      while (*(_BYTE *)this)
      {
        if (!*((_BYTE *)this + 1))
          break;
        if (!*((_BYTE *)this + 2))
          break;
        v7 = (*(char *)(a5 + *((unsigned __int8 *)this + 1)) << 12) | (*(char *)(a5 + *(unsigned __int8 *)this) << 18) | (*(char *)(a5 + *((unsigned __int8 *)this + 2)) << 6) | *(char *)(a5 + *((unsigned __int8 *)this + 3));
        if ((v7 & 0x80000000) != 0)
          break;
        LODWORD(v8) = 0;
        LODWORD(a2) = (_DWORD)a2 - 4;
        this = (google::protobuf *)((char *)this + 4);
        v9 = -1;
LABEL_75:
        v28 = 0;
        LODWORD(v27) = v27 + 3;
        if ((int)a2 <= 3)
          goto LABEL_114;
      }
      v30 = (_DWORD)a2 + 1;
      v31 = (google::protobuf *)((char *)this + 1);
      v32 = (google::protobuf *)((char *)this + 2);
      v33 = (_DWORD)a2 - 1;
      v34 = (google::protobuf *)((char *)this + 3);
      v35 = (_DWORD)a2 - 2;
      v36 = (google::protobuf *)((char *)this + 4);
      v37 = (int)a2;
      while (1)
      {
        v38 = *((unsigned __int8 *)v31 - 1);
        v9 = *(char *)(a5 + v38);
        if ((v9 & 0x80000000) == 0)
          break;
        this = v31;
        if ((v38 - 9) >= 5 && (_DWORD)v38 != 32)
        {
          LODWORD(a2) = v30 - 2;
          goto LABEL_104;
        }
        v31 = (google::protobuf *)((char *)v31 + 1);
        --v30;
        --v37;
        v32 = (google::protobuf *)((char *)v32 + 1);
        --v33;
        v34 = (google::protobuf *)((char *)v34 + 1);
        --v35;
        v36 = (google::protobuf *)((char *)v36 + 1);
        if (v30 <= 4)
        {
          LODWORD(a2) = 3;
LABEL_104:
          v28 = 0;
          LODWORD(v8) = v38;
          goto LABEL_114;
        }
      }
      while (1)
      {
        v40 = *((unsigned __int8 *)v32 - 1);
        v9 = *(char *)(a5 + v40);
        if ((v9 & 0x80000000) == 0)
          break;
        v39 = v37;
        this = v32;
        if ((v40 - 9) < 5 || (_DWORD)v40 == 32)
        {
          v32 = (google::protobuf *)((char *)v32 + 1);
          --v37;
          --v33;
          v34 = (google::protobuf *)((char *)v34 + 1);
          --v35;
          v36 = (google::protobuf *)((char *)v36 + 1);
          if (v37 > 3)
            continue;
        }
        LODWORD(a2) = v39 - 2;
        v28 = 1;
        LODWORD(v8) = v40;
        goto LABEL_114;
      }
      while (1)
      {
        v23 = *((unsigned __int8 *)v34 - 1);
        v9 = *(char *)(a5 + v23);
        if ((v9 & 0x80000000) == 0)
          break;
        v41 = v33;
        this = v34;
        if ((v23 - 9) < 5 || (_DWORD)v23 == 32)
        {
          v34 = (google::protobuf *)((char *)v34 + 1);
          --v33;
          --v35;
          v36 = (google::protobuf *)((char *)v36 + 1);
          if (v33 > 2)
            continue;
        }
        LODWORD(a2) = v41 - 2;
        v28 = 2;
LABEL_111:
        LODWORD(v8) = v23;
        goto LABEL_114;
      }
      do
      {
        v42 = v35;
        this = v36;
        v8 = *((unsigned __int8 *)v36 - 1);
        v9 = *(unsigned __int8 *)(a5 + v8);
        if ((*(char *)(a5 + v8) & 0x80000000) == 0)
        {
          LODWORD(a2) = v35 - 2;
          goto LABEL_75;
        }
        if ((v8 - 9) >= 5 && (_DWORD)v8 != 32)
          break;
        v36 = (google::protobuf *)((char *)v36 + 1);
        --v35;
      }
      while (v35 > 1);
      v9 = (char)v9;
      LODWORD(a2) = v42 - 2;
      v28 = 3;
      goto LABEL_114;
    }
LABEL_77:
    v7 = 0;
    v28 = 0;
    LODWORD(v27) = 0;
    goto LABEL_78;
  }
  if ((int)a2 < 4)
    goto LABEL_77;
  v6 = 0;
  v7 = 0;
  while (*(_BYTE *)this)
  {
    if (!*((_BYTE *)this + 1))
      break;
    if (!*((_BYTE *)this + 2))
      break;
    v7 = (*(char *)(a5 + *((unsigned __int8 *)this + 1)) << 12) | (*(char *)(a5 + *(unsigned __int8 *)this) << 18) | (*(char *)(a5 + *((unsigned __int8 *)this + 2)) << 6) | *(char *)(a5 + *((unsigned __int8 *)this + 3));
    if ((v7 & 0x80000000) != 0)
      break;
    LODWORD(v8) = 0;
    LODWORD(a2) = (_DWORD)a2 - 4;
    this = (google::protobuf *)((char *)this + 4);
    v9 = -1;
LABEL_37:
    v27 = v6 + 3;
    if ((int)v6 + 3 > (int)a4)
      return 0xFFFFFFFFLL;
    v28 = 0;
    v29 = a3 + v6;
    *(_WORD *)(v29 + 1) = bswap32(v7) >> 16;
    v7 >>= 16;
    *(_BYTE *)v29 = v7;
    v6 = v27;
    if ((int)a2 <= 3)
      goto LABEL_114;
  }
  v10 = (_DWORD)a2 + 1;
  v11 = (google::protobuf *)((char *)this + 1);
  v12 = (google::protobuf *)((char *)this + 2);
  v13 = (_DWORD)a2 - 1;
  v14 = (google::protobuf *)((char *)this + 3);
  v15 = (_DWORD)a2 - 2;
  v16 = (google::protobuf *)((char *)this + 4);
  v17 = (int)a2;
  while (1)
  {
    this = v11;
    v18 = *((unsigned __int8 *)v11 - 1);
    v19 = *(unsigned __int8 *)(a5 + v18);
    if ((*(char *)(a5 + v18) & 0x80000000) == 0)
      break;
    if ((v18 - 9) >= 5 && (_DWORD)v18 != 32)
    {
      LODWORD(a2) = v10 - 2;
      goto LABEL_100;
    }
    v11 = (google::protobuf *)((char *)v11 + 1);
    --v10;
    --v17;
    v12 = (google::protobuf *)((char *)v12 + 1);
    --v13;
    v14 = (google::protobuf *)((char *)v14 + 1);
    --v15;
    v16 = (google::protobuf *)((char *)v16 + 1);
    if (v10 <= 4)
    {
      LODWORD(a2) = 3;
LABEL_100:
      v28 = 0;
      v9 = (char)v19;
      LODWORD(v27) = v6;
      LODWORD(v8) = v18;
      goto LABEL_114;
    }
  }
  while (1)
  {
    this = v12;
    v21 = *((unsigned __int8 *)v12 - 1);
    v22 = *(unsigned __int8 *)(a5 + v21);
    if ((*(char *)(a5 + v21) & 0x80000000) == 0)
      break;
    v20 = v17;
    if ((v21 - 9) < 5 || (_DWORD)v21 == 32)
    {
      v12 = (google::protobuf *)((char *)v12 + 1);
      --v17;
      --v13;
      v14 = (google::protobuf *)((char *)v14 + 1);
      --v15;
      v16 = (google::protobuf *)((char *)v16 + 1);
      if (v17 > 3)
        continue;
    }
    v9 = (char)v22;
    LODWORD(a2) = v20 - 2;
    v28 = 1;
    LODWORD(v27) = v6;
    LODWORD(v8) = v21;
    v7 = *(unsigned __int8 *)(a5 + v18);
    goto LABEL_114;
  }
  v7 = v22 | (v19 << 6);
  while (1)
  {
    this = v14;
    v23 = *((unsigned __int8 *)v14 - 1);
    v24 = *(unsigned __int8 *)(a5 + v23);
    if ((*(char *)(a5 + v23) & 0x80000000) == 0)
      break;
    v25 = v13;
    if ((v23 - 9) < 5 || (_DWORD)v23 == 32)
    {
      v14 = (google::protobuf *)((char *)v14 + 1);
      --v13;
      --v15;
      v16 = (google::protobuf *)((char *)v16 + 1);
      if (v13 > 2)
        continue;
    }
    v9 = (char)v24;
    LODWORD(a2) = v25 - 2;
    v28 = 2;
    LODWORD(v27) = v6;
    goto LABEL_111;
  }
  v7 = v24 | (v7 << 6);
  do
  {
    v26 = v15;
    this = v16;
    v8 = *((unsigned __int8 *)v16 - 1);
    v9 = *(unsigned __int8 *)(a5 + v8);
    if ((*(char *)(a5 + v8) & 0x80000000) == 0)
    {
      v7 = v9 | (v7 << 6);
      LODWORD(a2) = v15 - 2;
      goto LABEL_37;
    }
    if ((v8 - 9) >= 5 && (_DWORD)v8 != 32)
      break;
    v16 = (google::protobuf *)((char *)v16 + 1);
    --v15;
  }
  while (v15 > 1);
  v9 = (char)v9;
  LODWORD(a2) = v26 - 2;
  v28 = 3;
  LODWORD(v27) = v6;
LABEL_114:
  if ((v9 & 0x80000000) == 0)
    goto LABEL_115;
  if ((_DWORD)v8 == 61 || (_DWORD)v8 == 46)
    goto LABEL_124;
  if ((_DWORD)v8)
  {
    if ((v8 - 9) >= 5 && (_DWORD)v8 != 32)
      return 0xFFFFFFFFLL;
LABEL_115:
    if ((_DWORD)v8 != 61 && (_DWORD)v8 != 46)
      goto LABEL_78;
LABEL_124:
    v43 = (_DWORD)a2 + 1;
    v44 = (google::protobuf *)((char *)this - 1);
    goto LABEL_125;
  }
LABEL_78:
  if ((int)a2 >= 1)
  {
LABEL_79:
    v43 = (int)a2;
    while (1)
    {
      v44 = this;
      v46 = *(unsigned __int8 *)this;
      this = (google::protobuf *)((char *)this + 1);
      v45 = v46;
      v47 = *(char *)(a5 + v46);
      if ((v47 & 0x80000000) == 0)
      {
        v49 = v47 | (v7 << 6);
        if (++v28 == 4)
        {
          if (a3)
          {
            if ((int)v27 + 3 > (int)a4)
              return 0xFFFFFFFFLL;
            v28 = 0;
            v50 = v7 << 6;
            v51 = (_BYTE *)(a3 + (int)v27);
            v51[2] = v49;
            v51[1] = BYTE1(v50);
            *v51 = BYTE2(v50);
            LODWORD(v27) = v27 + 3;
            v7 = 0;
          }
          else
          {
            v28 = 0;
            v7 = 0;
            LODWORD(v27) = v27 + 3;
          }
        }
        else
        {
          v7 = v49;
        }
        this = (google::protobuf *)((char *)v44 + 1);
        LODWORD(a2) = v43 - 1;
        if (v43 < 2)
        {
LABEL_107:
          v44 = (google::protobuf *)((char *)v44 + 1);
          --v43;
          goto LABEL_125;
        }
        goto LABEL_79;
      }
      if ((v45 - 9) >= 5)
      {
        if (v45 > 45)
        {
          if (v45 == 46 || v45 == 61)
            goto LABEL_125;
          return 0xFFFFFFFFLL;
        }
        if (v45 != 32)
        {
          if (v45)
            return 0xFFFFFFFFLL;
          goto LABEL_107;
        }
      }
      v48 = v43--;
      if (v48 <= 1)
      {
        if ((int)a2 >= 1)
          v52 = 1;
        else
          v52 = (int)a2;
        v43 = v52 - 1;
        v44 = (google::protobuf *)((char *)v44 + 1);
        goto LABEL_125;
      }
    }
  }
  v43 = (int)a2;
  v44 = this;
LABEL_125:
  result = 0xFFFFFFFFLL;
  switch(v28)
  {
    case 0:
      break;
    case 1:
      return result;
    case 2:
      if (!a3)
        goto LABEL_129;
      if ((int)v27 >= (int)a4)
        return result;
      *(_BYTE *)(a3 + (int)v27) = v7 >> 4;
LABEL_129:
      LODWORD(v27) = v27 + 1;
      v28 = 2;
      break;
    case 3:
      if (!a3)
        goto LABEL_134;
      if ((int)v27 + 2 > (int)a4)
        return result;
      v56 = (_BYTE *)(a3 + (int)v27);
      v56[1] = v7 >> 2;
      *v56 = v7 >> 10;
LABEL_134:
      v28 = 1;
      LODWORD(v27) = v27 + 2;
      break;
    default:
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v62, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 1930);
      v54 = google::protobuf::internal::LogMessage::operator<<(v62, "This can't happen; base64 decoder state = ");
      v55 = google::protobuf::internal::LogMessage::operator<<(v54, v28);
      google::protobuf::internal::LogFinisher::operator=((int)&v61, (const char **)&v55->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v62[0].__r_.__value_.__l.__data_);
      v28 = 0;
      break;
  }
  if (v43 >= 1)
  {
    v57 = 0;
    v58 = v43 + 1;
    while (1)
    {
      v59 = *(unsigned __int8 *)v44;
      if (v59 > 0x3D)
        return 0xFFFFFFFFLL;
      if (((1 << v59) & 0x100003E00) == 0)
      {
        if (((1 << v59) & 0x2000400000000000) == 0)
        {
          if (!*(_BYTE *)v44)
            goto LABEL_144;
          return 0xFFFFFFFFLL;
        }
        ++v57;
      }
      v44 = (google::protobuf *)((char *)v44 + 1);
      if (--v58 <= 1)
        goto LABEL_144;
    }
  }
  v57 = 0;
LABEL_144:
  if (v57 == v28 || v57 == 0)
    return v27;
  else
    return 0xFFFFFFFFLL;
}

void sub_248020DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::WebSafeBase64Unescape(google::protobuf *this, const char *a2, uint64_t a3, char *a4, int a5, const signed __int8 *a6)
{
  return google::protobuf::Base64UnescapeInternal(this, a2, a3, a4, (uint64_t)&google::protobuf::kUnWebSafeBase64, a6);
}

BOOL google::protobuf::Base64Unescape@<W0>(google::protobuf *a1@<X0>, const char *a2@<X1>, std::string *a3@<X2>, int a4@<W8>)
{
  return google::protobuf::Base64UnescapeInternal(a3, a1, a2, (uint64_t)&google::protobuf::kUnBase64, a4);
}

BOOL google::protobuf::Base64UnescapeInternal@<W0>(std::string *this@<X2>, google::protobuf *a2@<X0>, const char *a3@<X1>, uint64_t a4@<X3>, int a5@<W8>)
{
  char *v9;
  const signed __int8 *v10;
  std::string *v11;
  int v12;
  int v13;
  std::string *v14;
  char v16;
  std::string v17[2];

  v9 = (char *)(3 * ((int)a3 / 4) + a3 - (a5 & 0xFFFFFFFC));
  std::string::resize(this, (int)v9, 0);
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_)
    {
      v11 = (std::string *)this->__r_.__value_.__r.__words[0];
      goto LABEL_7;
    }
  }
  else
  {
    v11 = this;
    if (*((_BYTE *)&this->__r_.__value_.__s + 23))
      goto LABEL_7;
  }
  v11 = 0;
LABEL_7:
  v12 = google::protobuf::Base64UnescapeInternal(a2, a3, (uint64_t)v11, v9, a4, v10);
  v13 = v12;
  if (v12 < 0)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      *this->__r_.__value_.__l.__data_ = 0;
      this->__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      this->__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&this->__r_.__value_.__s + 23) = 0;
    }
  }
  else
  {
    if (v12 > (int)v9)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2073);
      v14 = google::protobuf::internal::LogMessage::operator<<(v17, "CHECK failed: (len) <= (dest_len): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v16, (const char **)&v14->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v17[0].__r_.__value_.__l.__data_);
    }
    std::string::erase(this, v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  return v13 >= 0;
}

void sub_248020F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::WebSafeBase64Unescape@<W0>(google::protobuf *a1@<X0>, const char *a2@<X1>, std::string *a3@<X2>, int a4@<W8>)
{
  return google::protobuf::Base64UnescapeInternal(a3, a1, a2, (uint64_t)&google::protobuf::kUnWebSafeBase64, a4);
}

uint64_t google::protobuf::Base64EscapeInternal(google::protobuf *this, const unsigned __int8 *a2, _BYTE *a3, char *a4, uint64_t a5, const char *a6)
{
  uint64_t result;
  int v7;
  char *v8;
  _BYTE *i;
  unsigned int v10;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  std::string *v15;
  std::string *v16;
  unint64_t v17;
  char v18;
  char v19;
  unint64_t v20;
  char v21;
  std::string v22[2];

  if ((int)a2 < 1 || 3 * (int)a4 < 4 * (int)a2)
    return 0;
  v7 = (int)a3;
  v8 = (char *)this + a2;
  for (i = a3; this < (google::protobuf *)(v8 - 3); i += 4)
  {
    v10 = *(_DWORD *)this;
    this = (google::protobuf *)((char *)this + 3);
    v11 = bswap32(v10);
    *i = *(_BYTE *)(a5 + (v11 >> 26));
    i[1] = *(_BYTE *)(a5 + ((v11 >> 20) & 0x3F));
    i[2] = *(_BYTE *)(a5 + ((v11 >> 14) & 0x3F));
    i[3] = *(_BYTE *)(a5 + ((v11 >> 8) & 0x3F));
  }
  v12 = (_DWORD)v8 - (_DWORD)this;
  v13 = (_DWORD)a3 + (_DWORD)a4 - (_DWORD)i;
  switch(v12)
  {
    case 0:
      goto LABEL_22;
    case 1:
      if (v13 < 2)
        return 0;
      v14 = *(unsigned __int8 *)this;
      *i = *(_BYTE *)(a5 + (v14 >> 2));
      i[1] = *(_BYTE *)(a5 + 16 * (v14 & 3));
      if (!(_DWORD)a6)
      {
        LODWORD(i) = (_DWORD)i + 2;
        goto LABEL_22;
      }
      if (v13 < 4)
        return 0;
      *((_WORD *)i + 1) = 15677;
      goto LABEL_19;
    case 2:
      if (v13 < 3)
        return 0;
      v17 = bswap32(*(unsigned __int16 *)this);
      *i = *(_BYTE *)(a5 + ((unint64_t)WORD1(v17) >> 10));
      i[1] = *(_BYTE *)(a5 + ((v17 >> 20) & 0x3F));
      i[2] = *(_BYTE *)(a5 + ((v17 >> 14) & 0x3CLL));
      if ((_DWORD)a6)
      {
        if (v13 < 4)
          return 0;
        v18 = 61;
LABEL_18:
        i[3] = v18;
LABEL_19:
        LODWORD(i) = (_DWORD)i + 4;
      }
      else
      {
        LODWORD(i) = (_DWORD)i + 3;
      }
LABEL_22:
      result = ((_DWORD)i - v7);
      break;
    case 3:
      if (v13 < 4)
        return 0;
      v19 = *(_BYTE *)this;
      v20 = bswap32(*(unsigned __int16 *)((char *)this + 1));
      *i = *(_BYTE *)(a5 + (*(_BYTE *)this >> 2));
      i[1] = *(_BYTE *)(a5 + ((unint64_t)(WORD1(v20) & 0xFFFCFFFF | ((v19 & 3) << 16)) >> 12));
      i[2] = *(_BYTE *)(a5 + ((v20 >> 22) & 0x3F));
      v18 = *(_BYTE *)(a5 + ((v20 >> 16) & 0x3F));
      goto LABEL_18;
    default:
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v22, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2181);
      v15 = google::protobuf::internal::LogMessage::operator<<(v22, "Logic problem? szsrc = ");
      v16 = google::protobuf::internal::LogMessage::operator<<(v15, v12);
      google::protobuf::internal::LogFinisher::operator=((int)&v21, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v22[0].__r_.__value_.__l.__data_);
      goto LABEL_22;
  }
  return result;
}

void sub_248021154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::Base64Escape(google::protobuf *this, const unsigned __int8 *a2, _BYTE *a3, char *a4)
{
  return google::protobuf::Base64EscapeInternal(this, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", (const char *)1);
}

uint64_t google::protobuf::WebSafeBase64Escape(google::protobuf *this, const unsigned __int8 *a2, _BYTE *a3, char *a4, char *a5)
{
  return google::protobuf::Base64EscapeInternal(this, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_", a5);
}

std::string *google::protobuf::Base64EscapeInternal(google::protobuf *a1, google::protobuf *this, uint64_t a3, const char *a4, uint64_t a5)
{
  int v10;
  char *v11;
  _BYTE *v12;
  int v13;
  std::string *v14;
  char v16;
  std::string v17[2];

  v10 = google::protobuf::CalculateBase64EscapedLen(this, (int)a4);
  std::string::resize((std::string *)a3, v10, 0);
  if (*(char *)(a3 + 23) < 0)
  {
    v11 = *(char **)(a3 + 8);
    if (v11)
      v12 = *(_BYTE **)a3;
    else
      v12 = 0;
  }
  else
  {
    v11 = (char *)*(unsigned __int8 *)(a3 + 23);
    if (*(_BYTE *)(a3 + 23))
      v12 = (_BYTE *)a3;
    else
      v12 = 0;
  }
  v13 = google::protobuf::Base64EscapeInternal(a1, (const unsigned __int8 *)this, v12, v11, a5, a4);
  if (v10 != v13)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v17, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/strutil.cc", 2213);
    v14 = google::protobuf::internal::LogMessage::operator<<(v17, "CHECK failed: (calc_escaped_size) == (escaped_len): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v16, (const char **)&v14->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v17[0].__r_.__value_.__l.__data_);
  }
  return std::string::erase((std::string *)a3, v13, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_248021288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

std::string *google::protobuf::Base64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3, const char *a4)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
}

std::string *google::protobuf::WebSafeBase64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3, const char *a4)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, a4, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

std::string *google::protobuf::Base64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, (const char *)1, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
}

std::string *google::protobuf::WebSafeBase64Escape(google::protobuf *a1, google::protobuf *a2, uint64_t a3)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, 0, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

std::string *google::protobuf::WebSafeBase64EscapeWithPadding(google::protobuf *a1, google::protobuf *a2, uint64_t a3)
{
  return google::protobuf::Base64EscapeInternal(a1, a2, a3, (const char *)1, (uint64_t)"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
}

uint64_t google::protobuf::EncodeAsUTF8Char(unint64_t this, void *a2, char *a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  int v9;

  if (this >= 0x80)
  {
    if (WORD1(this))
      v5 = (16 * this) & 0x3F0000 | this & 0x3F | (((this >> 18) & 7) << 24) | (((this >> 6) & 0x3F) << 8) | 0xF0808080;
    else
      v5 = (4 * (_WORD)this) & 0x3F00 | this & 0x3F | ((unsigned __int16)this >> 12 << 16) | 0xE08080;
    if (WORD1(this))
      v6 = 4;
    else
      v6 = 3;
    v7 = this > 0x7FF;
    if (this <= 0x7FF)
      this = (4 * (_WORD)this) & 0x1F00 | this & 0x3F | 0xC080;
    else
      this = v5;
    if (v7)
      v4 = v6;
    else
      v4 = 2;
  }
  else
  {
    v4 = 1;
  }
  v9 = google::protobuf::ghtonl((google::protobuf *)this);
  memcpy(a2, (char *)&v9 - v4 + 4, v4);
  return v4;
}

uint64_t google::protobuf::UTF8FirstLetterNumBytes(google::protobuf *this, const char *a2)
{
  if ((_DWORD)a2)
    return google::protobuf::kUTF8LenTbl[*(unsigned __int8 *)this];
  else
    return 0;
}

void google::protobuf::CleanStringLineEndings(uint64_t a1, std::string *this, int a3)
{
  int v5;
  const std::string::value_type *v6;
  std::string::size_type v7;
  std::string *p_p;
  std::string::size_type size;
  std::string __p;

  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_)
      goto LABEL_3;
  }
  else if (*((_BYTE *)&this->__r_.__value_.__s + 23))
  {
LABEL_3:
    if (*(char *)(a1 + 23) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    else
      __p = *(std::string *)a1;
    google::protobuf::CleanStringLineEndings(&__p, a3);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    std::string::append(this, (const std::string::value_type *)p_p, size);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    return;
  }
  v5 = *(char *)(a1 + 23);
  if (v5 >= 0)
    v6 = (const std::string::value_type *)a1;
  else
    v6 = *(const std::string::value_type **)a1;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(a1 + 23);
  else
    v7 = *(_QWORD *)(a1 + 8);
  std::string::append(this, v6, v7);
  google::protobuf::CleanStringLineEndings(this, a3);
}

void sub_2480214CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void google::protobuf::CleanStringLineEndings(std::string *this, int a2)
{
  std::string *v2;
  int64_t size;
  std::string *v4;
  int64_t v5;
  int64_t v6;
  char v7;
  _BYTE *v8;
  int v9;
  std::string::size_type v10;

  v2 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    v4 = (std::string *)this->__r_.__value_.__r.__words[0];
    size = this->__r_.__value_.__l.__size_;
  }
  else
  {
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v4 = this;
  }
  if (size < 1)
  {
    v5 = 0;
    goto LABEL_37;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    if ((v7 & 1) != 0)
    {
      v8 = (char *)v4 + v6;
      v9 = v4->__r_.__value_.__s.__data_[v6];
      if (v9 != 10)
      {
        if (v9 == 13)
        {
          v4->__r_.__value_.__s.__data_[v5++] = 10;
LABEL_18:
          v7 = 1;
LABEL_27:
          ++v6;
          continue;
        }
        v4->__r_.__value_.__s.__data_[v5++] = 10;
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    v8 = (char *)v4 + v6;
    if (v6 + 8 >= size)
    {
      LOBYTE(v10) = *v8;
LABEL_16:
      if (v10 != 10)
      {
        if (v10 == 13)
          goto LABEL_18;
LABEL_23:
        if (v6 == v5)
        {
          v7 = 0;
          v5 = v6 + 1;
          goto LABEL_27;
        }
        v7 = 0;
        v4->__r_.__value_.__s.__data_[v5] = *v8;
LABEL_26:
        ++v5;
        goto LABEL_27;
      }
LABEL_19:
      if (v6 != v5)
        v4->__r_.__value_.__s.__data_[v5] = 10;
      v7 = 0;
      goto LABEL_26;
    }
    v10 = *(_QWORD *)v8;
    if (((*(_QWORD *)v8 - 0xE0E0E0E0E0E0E0ELL) & ~*(_QWORD *)v8 & 0x8080808080808080) != 0)
      goto LABEL_16;
    if (v5 != v6)
      *(std::string::size_type *)((char *)v4->__r_.__value_.__r.__words + v5) = v10;
    v7 = 0;
    v5 += 8;
    v6 += 8;
  }
  while (v6 < size);
  if ((v7 & 1) != 0 || a2 && v5 >= 1 && v4->__r_.__value_.__s.__data_[v5 - 1] != 10)
  {
    std::string::resize(this, v5 + 1, 0);
    if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
      v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
    v2->__r_.__value_.__s.__data_[v5] = 10;
    return;
  }
LABEL_37:
  if (v5 < size)
    std::string::resize(this, v5, 0);
}

google::protobuf::StringPiece *google::protobuf::StringPiece::StringPiece(google::protobuf::StringPiece *this, const char *__s)
{
  size_t v3;
  const char *v4;
  size_t v5;

  *(_QWORD *)this = __s;
  *((_QWORD *)this + 1) = 0;
  if (__s)
  {
    v3 = strlen(__s);
    v5 = v3;
    if ((v3 & 0x8000000000000000) != 0)
      google::protobuf::StringPiece::LogFatalSizeTooBig((google::protobuf::StringPiece *)v3, "size_t to int conversion", v4);
    *((_QWORD *)this + 1) = v5;
  }
  return this;
}

std::vector<std::string> **std::back_insert_iterator<std::vector<std::string>>::operator=[abi:ne180100](std::vector<std::string> **a1, __int128 *a2)
{
  std::vector<std::string> *v4;
  std::vector<std::string>::pointer end;
  std::vector<std::string> *v6;
  std::allocator<std::string> *p_end_cap;
  std::string *v8;
  std::string *value;
  __int128 v10;
  std::string *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  std::string *v16;
  std::string *v17;
  __int128 v18;
  std::__split_buffer<std::string> __v;

  v4 = *a1;
  end = (*a1)->__end_;
  v6 = *a1;
  value = v6->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::string> *)&v6->__end_cap_;
  v8 = value;
  if (end >= value)
  {
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v4->__begin_) >> 3);
    v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)v4->__begin_) >> 3);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 >= 0x555555555555555)
      v15 = 0xAAAAAAAAAAAAAAALL;
    else
      v15 = v13;
    __v.__end_cap_.__value_ = p_end_cap;
    if (v15)
      v16 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v15);
    else
      v16 = 0;
    v17 = v16 + v12;
    __v.__first_ = v16;
    __v.__begin_ = v17;
    __v.__end_cap_.__value_ = &v16[v15];
    v18 = *a2;
    v17->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    __v.__end_ = v17 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(v4, &__v);
    v11 = v4->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else
  {
    v10 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v11 = end + 1;
    v4->__end_ = end + 1;
  }
  v4->__end_ = v11;
  return a1;
}

void sub_2480217F8(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::safe_parse_positive_int<int>(unsigned __int8 *a1, int *a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  uint64_t result;

  if ((char)a1[23] < 0)
  {
    v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    v2 = *((_QWORD *)v3 + 1);
  }
  else
  {
    v2 = a1[23];
  }
  if (v2 < 1)
  {
    v4 = 0;
LABEL_12:
    result = 1;
  }
  else
  {
    v4 = 0;
    v5 = &a1[v2];
    while (1)
    {
      v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6)
        break;
      if (v4 > 214748364 || (v7 = 10 * v4, v7 > -2147483601 - v6))
      {
        result = 0;
        v4 = 0x7FFFFFFF;
        goto LABEL_15;
      }
      v4 = v7 + v6 - 48;
      if (++a1 >= v5)
        goto LABEL_12;
    }
    result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t google::protobuf::safe_parse_negative_int<int>(unsigned __int8 *a1, int *a2)
{
  int v2;
  BOOL v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  uint64_t result;

  v2 = (char)a1[23];
  v3 = v2 < 0;
  if (v2 >= 0)
    v4 = a1;
  else
    v4 = *(unsigned __int8 **)a1;
  if (v3)
    v5 = *((_QWORD *)a1 + 1);
  else
    v5 = a1[23];
  if (v5 < 1)
  {
    v6 = 0;
LABEL_15:
    result = 1;
  }
  else
  {
    v6 = 0;
    v7 = &v4[v5];
    while (1)
    {
      v8 = *v4;
      if ((v8 - 58) < 0xFFFFFFF6)
        break;
      if (v6 < -214748364 || (v9 = 10 * v6, v9 < v8 + 2147483600))
      {
        result = 0;
        v6 = 0x80000000;
        goto LABEL_18;
      }
      v6 = v9 - v8 + 48;
      if (++v4 >= v7)
        goto LABEL_15;
    }
    result = 0;
  }
LABEL_18:
  *a2 = v6;
  return result;
}

uint64_t google::protobuf::safe_parse_positive_int<unsigned int>(unsigned __int8 *a1, unsigned int *a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned int v4;
  unsigned __int8 *v5;
  int v6;
  unsigned int v7;
  uint64_t result;

  if ((char)a1[23] < 0)
  {
    v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    v2 = *((_QWORD *)v3 + 1);
  }
  else
  {
    v2 = a1[23];
  }
  if (v2 < 1)
  {
    v4 = 0;
LABEL_12:
    result = 1;
  }
  else
  {
    v4 = 0;
    v5 = &a1[v2];
    while (1)
    {
      v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6)
        break;
      if (v4 > 0x19999999 || (v7 = 10 * v4, v7 > 47 - v6))
      {
        result = 0;
        v4 = -1;
        goto LABEL_15;
      }
      v4 = v7 + v6 - 48;
      if (++a1 >= v5)
        goto LABEL_12;
    }
    result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t google::protobuf::safe_parse_positive_int<long long>(unsigned __int8 *a1, uint64_t *a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  if ((char)a1[23] < 0)
  {
    v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    v2 = *((_QWORD *)v3 + 1);
  }
  else
  {
    v2 = a1[23];
  }
  if (v2 < 1)
  {
    v4 = 0;
LABEL_12:
    result = 1;
  }
  else
  {
    v4 = 0;
    v5 = &a1[v2];
    while (1)
    {
      v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6)
        break;
      if (v4 > 0xCCCCCCCCCCCCCCCLL || (v7 = 10 * v4, v8 = (v6 - 48), v7 > (v8 ^ 0x7FFFFFFFFFFFFFFFLL)))
      {
        result = 0;
        v4 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_15;
      }
      v4 = v8 + v7;
      if (++a1 >= v5)
        goto LABEL_12;
    }
    result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

uint64_t google::protobuf::safe_parse_negative_int<long long>(unsigned __int8 *a1, int64_t *a2)
{
  int v2;
  BOOL v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int64_t v6;
  unsigned __int8 *v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t result;

  v2 = (char)a1[23];
  v3 = v2 < 0;
  if (v2 >= 0)
    v4 = a1;
  else
    v4 = *(unsigned __int8 **)a1;
  if (v3)
    v5 = *((_QWORD *)a1 + 1);
  else
    v5 = a1[23];
  if (v5 < 1)
  {
    v6 = 0;
LABEL_15:
    result = 1;
  }
  else
  {
    v6 = 0;
    v7 = &v4[v5];
    while (1)
    {
      v8 = *v4;
      if ((v8 - 58) < 0xFFFFFFF6)
        break;
      if (v6 < (uint64_t)0xF333333333333334
        || (v9 = v8 - 48, v10 = 10 * v6, v10 < (uint64_t)(v9 | 0x8000000000000000)))
      {
        result = 0;
        v6 = 0x8000000000000000;
        goto LABEL_18;
      }
      v6 = v10 - v9;
      if (++v4 >= v7)
        goto LABEL_15;
    }
    result = 0;
  }
LABEL_18:
  *a2 = v6;
  return result;
}

uint64_t google::protobuf::safe_parse_positive_int<unsigned long long>(unsigned __int8 *a1, unint64_t *a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t result;

  if ((char)a1[23] < 0)
  {
    v3 = a1;
    a1 = *(unsigned __int8 **)a1;
    v2 = *((_QWORD *)v3 + 1);
  }
  else
  {
    v2 = a1[23];
  }
  if (v2 < 1)
  {
    v4 = 0;
LABEL_12:
    result = 1;
  }
  else
  {
    v4 = 0;
    v5 = &a1[v2];
    while (1)
    {
      v6 = *a1;
      if ((v6 - 58) < 0xFFFFFFF6)
        break;
      if (v4 > 0x1999999999999999 || (v7 = v6 - 48, v8 = 10 * v4, __CFADD__(v8, v7)))
      {
        result = 0;
        v4 = -1;
        goto LABEL_15;
      }
      v4 = v7 + v8;
      if (++a1 >= v5)
        goto LABEL_12;
    }
    result = 0;
  }
LABEL_15:
  *a2 = v4;
  return result;
}

void google::protobuf::StringPiece::operator[]()
{
  __assert_rtn("operator[]", "stringpiece.h", 276, "0 <= i");
}

{
  __assert_rtn("operator[]", "stringpiece.h", 277, "i < length_");
}

void google::protobuf::CalculateBase64EscapedLen()
{
  __assert_rtn("CalculateBase64EscapedLen", "strutil.cc", 1683, "len >= input_len");
}

uint64_t google::protobuf::internal::WireFormatLite::SkipField(google::protobuf::internal::WireFormatLite *this, google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  uint64_t result;
  int v4;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  int v10;
  unsigned __int8 *v11;
  int v12;
  BOOL v13;
  int v14;
  char v15;
  uint64_t Varint32Fallback;
  unsigned int v17;
  unint64_t v18;

  if (a2 < 8)
    return 0;
  v4 = (int)a2;
  result = 0;
  switch(a2 & 7)
  {
    case 0:
      v6 = *(char **)this;
      if (*(_QWORD *)this < *((_QWORD *)this + 1) && (*v6 & 0x80000000) == 0)
      {
        v7 = (uint64_t)(v6 + 1);
        goto LABEL_22;
      }
      google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this);
      return v15 & 1;
    case 1:
      v18 = 0;
      if ((int)(*((_DWORD *)this + 2) - *(_QWORD *)this) >= 8)
      {
        v7 = *(_QWORD *)this + 8;
        goto LABEL_22;
      }
      return google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((unint64_t **)this, &v18);
    case 2:
      v9 = *(char **)this;
      v8 = *((_QWORD *)this + 1);
      if (*(_QWORD *)this >= v8)
      {
        v10 = 0;
      }
      else
      {
        v10 = *v9;
        if ((*v9 & 0x80000000) == 0)
        {
          v11 = (unsigned __int8 *)(v9 + 1);
          *(_QWORD *)this = v11;
          goto LABEL_12;
        }
      }
      Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v10);
      if ((Varint32Fallback & 0x8000000080000000) != 0)
        return 0;
      v10 = Varint32Fallback;
      v11 = *(unsigned __int8 **)this;
      v8 = *((_QWORD *)this + 1);
LABEL_12:
      if (v10 <= (int)v8 - (int)v11)
      {
        v7 = (uint64_t)&v11[v10];
        goto LABEL_22;
      }
      return google::protobuf::io::CodedInputStream::SkipFallback(this, v10, (int)v8 - (int)v11);
    case 3:
      v12 = *((_DWORD *)this + 13);
      v13 = __OFSUB__(v12--, 1);
      *((_DWORD *)this + 13) = v12;
      if (v12 < 0 != v13)
        return 0;
      result = google::protobuf::internal::WireFormatLite::SkipMessage((char **)this, a2, a3);
      if ((_DWORD)result)
      {
        v14 = *((_DWORD *)this + 13);
        if (v14 < *((_DWORD *)this + 14))
          *((_DWORD *)this + 13) = v14 + 1;
        return *((_DWORD *)this + 8) == (v4 & 0xFFFFFFF8 | 4);
      }
      return result;
    case 5:
      v17 = 0;
      if ((int)(*((_DWORD *)this + 2) - *(_QWORD *)this) < 4)
        return google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((unsigned int **)this, &v17);
      v7 = *(_QWORD *)this + 4;
LABEL_22:
      *(_QWORD *)this = v7;
      return 1;
    default:
      return result;
  }
}

uint64_t google::protobuf::internal::WireFormatLite::SkipMessage(char **this, google::protobuf::io::CodedInputStream *a2, unsigned int a3)
{
  char *v4;
  unint64_t TagFallback;
  BOOL v6;
  uint64_t v7;

  do
  {
    v4 = *this;
    if (*this >= this[1])
    {
      LODWORD(TagFallback) = 0;
    }
    else
    {
      TagFallback = *v4;
      if ((*v4 & 0x80000000) == 0)
      {
        *this = v4 + 1;
        goto LABEL_6;
      }
    }
    TagFallback = google::protobuf::io::CodedInputStream::ReadTagFallback((google::protobuf::io::CodedInputStream *)this, TagFallback);
LABEL_6:
    *((_DWORD *)this + 8) = TagFallback;
    if ((_DWORD)TagFallback)
      v6 = (TagFallback & 7) == 4;
    else
      v6 = 1;
    v7 = v6;
  }
  while (!v6
       && (google::protobuf::internal::WireFormatLite::SkipField((google::protobuf::internal::WireFormatLite *)this, (google::protobuf::io::CodedInputStream *)TagFallback, a3) & 1) != 0);
  return v7;
}

BOOL google::protobuf::internal::WireFormatLite::SkipField(google::protobuf::internal::WireFormatLite *this, google::protobuf::io::CodedInputStream *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  _BOOL8 v4;
  unsigned int v5;
  char *v8;
  unint64_t v9;
  std::string::size_type *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t Varint32Fallback;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t Varint64Fallback;
  char v24;
  char *v25;
  char *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  BOOL v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  std::string::size_type v35;
  char *v36;
  unsigned int v37;
  unsigned int v38;
  int data;
  unsigned int v40;
  unsigned int v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v46;
  char *v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  char *v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  std::string *p_p;
  int v56;
  uint64_t v57;
  uint64_t v58;
  unsigned __int8 *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  std::string __p;

  if (a2 < 8)
    return 0;
  v5 = a2;
  v4 = 0;
  switch(a2 & 7)
  {
    case 0:
      v8 = *(char **)this;
      if (*(_QWORD *)this >= *((_QWORD *)this + 1) || *v8 < 0)
      {
        Varint64Fallback = google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this);
        if ((v24 & 1) == 0)
          return 0;
        v9 = Varint64Fallback;
      }
      else
      {
        v9 = *v8;
        *(_QWORD *)this = v8 + 1;
      }
      v25 = (char *)*((_QWORD *)a3 + 8);
      if (*(_QWORD *)a3 <= (unint64_t)v25)
        v25 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v25);
      if (v5 > 0x7F)
      {
        *v25 = v5 | 0x80;
        v27 = v5 >> 7;
        if (v5 >> 14)
        {
          v26 = v25 + 2;
          do
          {
            *(v26 - 1) = v27 | 0x80;
            v40 = v27 >> 7;
            ++v26;
            v41 = v27 >> 14;
            v27 >>= 7;
          }
          while (v41);
          *(v26 - 1) = v40;
        }
        else
        {
          v25[1] = v27;
          v26 = v25 + 2;
        }
      }
      else
      {
        *v25 = v5;
        v26 = v25 + 1;
      }
      *((_QWORD *)a3 + 8) = v26;
      if (*(_QWORD *)a3 <= (unint64_t)v26)
        v26 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v26);
      if (v9 > 0x7F)
      {
        *v26 = v9 | 0x80;
        v42 = v9 >> 7;
        if (v9 >> 14)
        {
          v36 = v26 + 2;
          do
          {
            *(v36 - 1) = v42 | 0x80;
            v43 = v42 >> 7;
            ++v36;
            v44 = v42 >> 14;
            v42 >>= 7;
          }
          while (v44);
          *(v36 - 1) = v43;
        }
        else
        {
          v26[1] = v42;
          v36 = v26 + 2;
        }
      }
      else
      {
        *v26 = v9;
        v36 = v26 + 1;
      }
      goto LABEL_72;
    case 1:
      __p.__r_.__value_.__r.__words[0] = 0;
      v10 = *(std::string::size_type **)this;
      if ((int)(*((_DWORD *)this + 2) - *(_QWORD *)this) < 8)
      {
        if (!google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((unint64_t **)this, (unint64_t *)&__p))return 0;
      }
      else
      {
        __p.__r_.__value_.__r.__words[0] = *v10;
        *(_QWORD *)this = v10 + 1;
      }
      v11 = (char *)*((_QWORD *)a3 + 8);
      if (*(_QWORD *)a3 <= (unint64_t)v11)
        v11 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v11);
      if (v5 > 0x7F)
      {
        *v11 = v5 | 0x80;
        v21 = v5 >> 7;
        if (v5 >> 14)
        {
          v12 = v11 + 2;
          do
          {
            *(v12 - 1) = v21 | 0x80;
            v33 = v21 >> 7;
            ++v12;
            v34 = v21 >> 14;
            v21 >>= 7;
          }
          while (v34);
          *(v12 - 1) = v33;
        }
        else
        {
          v11[1] = v21;
          v12 = v11 + 2;
        }
      }
      else
      {
        *v11 = v5;
        v12 = v11 + 1;
      }
      *((_QWORD *)a3 + 8) = v12;
      v35 = __p.__r_.__value_.__r.__words[0];
      if (*(_QWORD *)a3 <= (unint64_t)v12)
        v12 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v12);
      *(_QWORD *)v12 = v35;
      v36 = v12 + 8;
      goto LABEL_72;
    case 2:
      v13 = *(char **)this;
      if (*(_QWORD *)this >= *((_QWORD *)this + 1))
      {
        LODWORD(Varint32Fallback) = 0;
      }
      else
      {
        Varint32Fallback = *v13;
        if ((*v13 & 0x80000000) == 0)
        {
          *(_QWORD *)this = v13 + 1;
          goto LABEL_78;
        }
      }
      Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, Varint32Fallback);
      if (Varint32Fallback < 0)
        return 0;
LABEL_78:
      v46 = (char *)*((_QWORD *)a3 + 8);
      if (*(_QWORD *)a3 <= (unint64_t)v46)
      {
        v60 = Varint32Fallback;
        v61 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v46);
        Varint32Fallback = v60;
        v46 = v61;
      }
      if (v5 > 0x7F)
      {
        *v46 = v5 | 0x80;
        v48 = v5 >> 7;
        if (v5 >> 14)
        {
          v47 = v46 + 2;
          do
          {
            *(v47 - 1) = v48 | 0x80;
            v49 = v48 >> 7;
            ++v47;
            v50 = v48 >> 14;
            v48 >>= 7;
          }
          while (v50);
          *(v47 - 1) = v49;
        }
        else
        {
          v46[1] = v48;
          v47 = v46 + 2;
        }
      }
      else
      {
        *v46 = v5;
        v47 = v46 + 1;
      }
      *((_QWORD *)a3 + 8) = v47;
      if (*(_QWORD *)a3 <= (unint64_t)v47)
      {
        v62 = Varint32Fallback;
        v63 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v47);
        Varint32Fallback = v62;
        v47 = v63;
      }
      if (Varint32Fallback > 0x7F)
      {
        *v47 = Varint32Fallback | 0x80;
        v52 = Varint32Fallback >> 7;
        if (Varint32Fallback >> 14)
        {
          v51 = v47 + 2;
          do
          {
            *(v51 - 1) = v52 | 0x80;
            v53 = v52 >> 7;
            ++v51;
            v54 = v52 >> 14;
            v52 >>= 7;
          }
          while (v54);
          *(v51 - 1) = v53;
        }
        else
        {
          v47[1] = v52;
          v51 = v47 + 2;
        }
      }
      else
      {
        *v47 = Varint32Fallback;
        v51 = v47 + 1;
      }
      *((_QWORD *)a3 + 8) = v51;
      memset(&__p, 0, sizeof(__p));
      v4 = google::protobuf::io::CodedInputStream::ReadString(this, &__p, Varint32Fallback);
      if (v4)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v56 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v56 = __p.__r_.__value_.__r.__words[1];
        v57 = *((_QWORD *)a3 + 8);
        if (*(_QWORD *)a3 - v57 < v56)
        {
          v59 = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)p_p, v56, *((unsigned __int8 **)a3 + 8));
        }
        else
        {
          v58 = v56;
          memcpy(*((void **)a3 + 8), p_p, v56);
          v59 = (unsigned __int8 *)(v57 + v58);
        }
        *((_QWORD *)a3 + 8) = v59;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      return v4;
    case 3:
      v15 = (char *)*((_QWORD *)a3 + 8);
      if (*(_QWORD *)a3 <= (unint64_t)v15)
        v15 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v15);
      if (v5 > 0x7F)
      {
        *v15 = v5 | 0x80;
        v20 = v5 >> 7;
        if (v5 >> 14)
        {
          v16 = v15 + 2;
          do
          {
            *(v16 - 1) = v20 | 0x80;
            v28 = v20 >> 7;
            ++v16;
            v29 = v20 >> 14;
            v20 >>= 7;
          }
          while (v29);
          *(v16 - 1) = v28;
        }
        else
        {
          v15[1] = v20;
          v16 = v15 + 2;
        }
      }
      else
      {
        *v15 = v5;
        v16 = v15 + 1;
      }
      *((_QWORD *)a3 + 8) = v16;
      v30 = *((_DWORD *)this + 13);
      v31 = __OFSUB__(v30--, 1);
      *((_DWORD *)this + 13) = v30;
      if (v30 < 0 != v31
        || !google::protobuf::internal::WireFormatLite::SkipMessage((char **)this, (char **)a3, a3, a4))
      {
        return 0;
      }
      v32 = *((_DWORD *)this + 13);
      if (v32 < *((_DWORD *)this + 14))
        *((_DWORD *)this + 13) = v32 + 1;
      return *((_DWORD *)this + 8) == (v5 & 0xFFFFFFF8 | 4);
    case 5:
      LODWORD(__p.__r_.__value_.__l.__data_) = 0;
      v17 = *(char **)this;
      if ((int)(*((_DWORD *)this + 2) - *(_QWORD *)this) < 4)
      {
        if (!google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((unsigned int **)this, (unsigned int *)&__p))return 0;
      }
      else
      {
        LODWORD(__p.__r_.__value_.__l.__data_) = *(_DWORD *)v17;
        *(_QWORD *)this = v17 + 4;
      }
      v18 = (char *)*((_QWORD *)a3 + 8);
      if (*(_QWORD *)a3 <= (unint64_t)v18)
        v18 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v18);
      if (v5 > 0x7F)
      {
        *v18 = v5 | 0x80;
        v22 = v5 >> 7;
        if (v5 >> 14)
        {
          v19 = v18 + 2;
          do
          {
            *(v19 - 1) = v22 | 0x80;
            v37 = v22 >> 7;
            ++v19;
            v38 = v22 >> 14;
            v22 >>= 7;
          }
          while (v38);
          *(v19 - 1) = v37;
        }
        else
        {
          v18[1] = v22;
          v19 = v18 + 2;
        }
      }
      else
      {
        *v18 = v5;
        v19 = v18 + 1;
      }
      *((_QWORD *)a3 + 8) = v19;
      data = (int)__p.__r_.__value_.__l.__data_;
      if (*(_QWORD *)a3 <= (unint64_t)v19)
        v19 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a3, v19);
      *(_DWORD *)v19 = data;
      v36 = v19 + 4;
LABEL_72:
      *((_QWORD *)a3 + 8) = v36;
      v4 = 1;
      break;
    default:
      return v4;
  }
  return v4;
}

void sub_248022414(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL google::protobuf::internal::WireFormatLite::SkipMessage(char **this, char **a2, google::protobuf::io::CodedOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  char *v6;
  unint64_t TagFallback;
  _BOOL8 v8;
  char *v9;
  char *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  while (1)
  {
    v6 = *this;
    if (*this >= this[1])
    {
      LODWORD(TagFallback) = 0;
    }
    else
    {
      TagFallback = *v6;
      if ((*v6 & 0x80000000) == 0)
      {
        *this = v6 + 1;
        goto LABEL_6;
      }
    }
    TagFallback = google::protobuf::io::CodedInputStream::ReadTagFallback((google::protobuf::io::CodedInputStream *)this, TagFallback);
LABEL_6:
    *((_DWORD *)this + 8) = TagFallback;
    v8 = (_DWORD)TagFallback == 0;
    if (!(_DWORD)TagFallback)
      return v8;
    if ((TagFallback & 7) == 4)
      break;
    if ((google::protobuf::internal::WireFormatLite::SkipField((google::protobuf::internal::WireFormatLite *)this, (google::protobuf::io::CodedInputStream *)TagFallback, (google::protobuf::io::EpsCopyOutputStream *)a2, a4) & 1) == 0)return v8;
  }
  v9 = a2[8];
  if (*a2 <= v9)
    v9 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback((google::protobuf::io::EpsCopyOutputStream *)a2, v9);
  if (TagFallback > 0x7F)
  {
    *v9 = TagFallback | 0x80;
    v11 = TagFallback >> 7;
    if (TagFallback >> 14)
    {
      v10 = v9 + 2;
      do
      {
        *(v10 - 1) = v11 | 0x80;
        v12 = v11 >> 7;
        ++v10;
        v13 = v11 >> 14;
        v11 >>= 7;
      }
      while (v13);
      *(v10 - 1) = v12;
    }
    else
    {
      v9[1] = v11;
      v10 = v9 + 2;
    }
  }
  else
  {
    *v9 = TagFallback;
    v10 = v9 + 1;
  }
  a2[8] = v10;
  return 1;
}

uint64_t google::protobuf::internal::FieldSkipper::SkipField(google::protobuf::internal::FieldSkipper *this, google::protobuf::io::CodedInputStream *a2, google::protobuf::io::CodedInputStream *a3)
{
  return google::protobuf::internal::WireFormatLite::SkipField(a2, a3, a3);
}

uint64_t google::protobuf::internal::FieldSkipper::SkipMessage(google::protobuf::internal::FieldSkipper *this, char **a2, unsigned int a3)
{
  return google::protobuf::internal::WireFormatLite::SkipMessage(a2, (google::protobuf::io::CodedInputStream *)a2, a3);
}

BOOL google::protobuf::internal::CodedOutputStreamFieldSkipper::SkipField(google::protobuf::io::EpsCopyOutputStream **this, google::protobuf::io::CodedInputStream *a2, google::protobuf::io::CodedInputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  return google::protobuf::internal::WireFormatLite::SkipField(a2, a3, this[1], a4);
}

BOOL google::protobuf::internal::CodedOutputStreamFieldSkipper::SkipMessage(char ***this, char **a2, google::protobuf::io::CodedOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  return google::protobuf::internal::WireFormatLite::SkipMessage(a2, this[1], a3, a4);
}

char *google::protobuf::internal::CodedOutputStreamFieldSkipper::SkipUnknownEnum(char *this, unsigned int a2, unsigned int a3)
{
  char *v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  google::protobuf::io::EpsCopyOutputStream *v12;
  char *v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v5 = this;
  v6 = (_QWORD *)*((_QWORD *)this + 1);
  v7 = (char *)v6[8];
  if (*v6 <= (unint64_t)v7)
  {
    this = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(*((google::protobuf::io::EpsCopyOutputStream **)this + 1), v7);
    v7 = this;
  }
  if (a2 > 0x7F)
  {
    *v7 = a2 | 0x80;
    v9 = a2 >> 7;
    if (a2 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = a2;
    v8 = v7 + 1;
  }
  v6[8] = v8;
  v12 = (google::protobuf::io::EpsCopyOutputStream *)*((_QWORD *)v5 + 1);
  v13 = (char *)*((_QWORD *)v12 + 8);
  if (*(_QWORD *)v12 <= (unint64_t)v13)
  {
    this = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(v12, v13);
    v13 = this;
  }
  if (a3 > 0x7F)
  {
    *v13 = a3 | 0x80;
    v15 = (unint64_t)(int)a3 >> 7;
    if (a3 >> 14)
    {
      v14 = v13 + 2;
      do
      {
        *(v14 - 1) = v15 | 0x80;
        v16 = v15 >> 7;
        ++v14;
        v17 = v15 >> 14;
        v15 >>= 7;
      }
      while (v17);
      *(v14 - 1) = v16;
    }
    else
    {
      v13[1] = v15;
      v14 = v13 + 2;
    }
  }
  else
  {
    *v13 = a3;
    v14 = v13 + 1;
  }
  *((_QWORD *)v12 + 8) = v14;
  return this;
}

uint64_t google::protobuf::internal::WireFormatLite::ReadPackedEnumPreserveUnknowns(char **this, unsigned int a2, unsigned int (*a3)(uint64_t), char **a4, int *a5)
{
  char *v10;
  int v11;
  uint64_t Varint32Fallback;
  unsigned int v13;
  char v14;
  int v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char *v20;
  char *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  char *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  int v30;

  v10 = *this;
  if (*this >= this[1])
  {
    v11 = 0;
  }
  else
  {
    v11 = *v10;
    if ((*v10 & 0x80000000) == 0)
    {
      *this = v10 + 1;
      goto LABEL_6;
    }
  }
  Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, v11);
  v11 = Varint32Fallback;
  if (Varint32Fallback < 0)
    return 0;
LABEL_6:
  v30 = google::protobuf::io::CodedInputStream::PushLimit((google::protobuf::io::CodedInputStream *)this, v11);
  if ((int)google::protobuf::io::CodedInputStream::BytesUntilLimit((google::protobuf::io::CodedInputStream *)this) >= 1)
  {
    v13 = 8 * a2;
    v14 = (8 * a2) | 0x80;
    v15 = (a2 >> 4) & 0x1FFFFFF;
    while (1)
    {
      v16 = *this;
      if (*this >= this[1])
        break;
      v17 = *v16;
      if (*v16 < 0)
        goto LABEL_12;
      *this = v16 + 1;
LABEL_13:
      if (a3 && !a3(v17))
      {
        v20 = a4[8];
        if (*a4 <= v20)
          v20 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback((google::protobuf::io::EpsCopyOutputStream *)a4, a4[8]);
        if (v13 > 0x7F)
        {
          *v20 = v14;
          if (v13 >= 0x4000)
          {
            v21 = v20 + 2;
            v22 = v15;
            do
            {
              *(v21 - 1) = v22 | 0x80;
              v23 = v22 >> 7;
              ++v21;
              v24 = v22 >> 14;
              v22 >>= 7;
            }
            while (v24);
            *(v21 - 1) = v23;
          }
          else
          {
            v20[1] = v13 >> 7;
            v21 = v20 + 2;
          }
        }
        else
        {
          v21 = v20 + 1;
          *v20 = v13;
        }
        a4[8] = v21;
        if (*a4 <= v21)
          v21 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback((google::protobuf::io::EpsCopyOutputStream *)a4, v21);
        if (v17 > 0x7F)
        {
          *v21 = v17 | 0x80;
          v26 = v17 >> 7;
          if (v17 >> 14)
          {
            v25 = v21 + 2;
            do
            {
              *(v25 - 1) = v26 | 0x80;
              v27 = v26 >> 7;
              ++v25;
              v28 = v26 >> 14;
              v26 >>= 7;
            }
            while (v28);
            *(v25 - 1) = v27;
          }
          else
          {
            v21[1] = v26;
            v25 = v21 + 2;
          }
        }
        else
        {
          *v21 = v17;
          v25 = v21 + 1;
        }
        a4[8] = v25;
      }
      else
      {
        v18 = *a5;
        if ((_DWORD)v18 == a5[1])
        {
          v19 = v18 + 1;
          google::protobuf::RepeatedField<int>::Reserve(a5, v18 + 1);
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a5) + 4 * v18) = v17;
        }
        else
        {
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a5) + 4 * v18) = v17;
          v19 = v18 + 1;
        }
        *a5 = v19;
      }
      if ((int)google::protobuf::io::CodedInputStream::BytesUntilLimit((google::protobuf::io::CodedInputStream *)this) <= 0)
        goto LABEL_39;
    }
    LODWORD(v17) = 0;
LABEL_12:
    v17 = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, v17);
    if (v17 < 0)
      return 0;
    goto LABEL_13;
  }
LABEL_39:
  google::protobuf::io::CodedInputStream::PopLimit((uint64_t)this, v30);
  return 1;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteFloatArray(google::protobuf::internal::WireFormatLite *this, const float *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  unsigned __int8 *v5;
  int64_t v6;
  unsigned __int8 *result;

  v5 = (unsigned __int8 *)*((_QWORD *)a3 + 8);
  v6 = 4 * (int)a2;
  if (*(_QWORD *)a3 - (_QWORD)v5 < v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)this, v6, v5);
  }
  else
  {
    memcpy(*((void **)a3 + 8), this, v6);
    result = &v5[v6];
  }
  *((_QWORD *)a3 + 8) = result;
  return result;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteDoubleArray(google::protobuf::internal::WireFormatLite *this, const double *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  unsigned __int8 *v5;
  int64_t v6;
  unsigned __int8 *result;

  v5 = (unsigned __int8 *)*((_QWORD *)a3 + 8);
  v6 = 8 * (int)a2;
  if (*(_QWORD *)a3 - (_QWORD)v5 < v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)this, v6, v5);
  }
  else
  {
    memcpy(*((void **)a3 + 8), this, v6);
    result = &v5[v6];
  }
  *((_QWORD *)a3 + 8) = result;
  return result;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteBoolArray(google::protobuf::internal::WireFormatLite *this, const BOOL *a2, google::protobuf::io::EpsCopyOutputStream *a3, google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *result;

  v5 = *((_QWORD *)a3 + 8);
  if (*(_QWORD *)a3 - v5 < (int)a2)
  {
    result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(a3, (char *)this, (int)a2, *((unsigned __int8 **)a3 + 8));
  }
  else
  {
    v6 = (int)a2;
    memcpy(*((void **)a3 + 8), this, (int)a2);
    result = (unsigned __int8 *)(v5 + v6);
  }
  *((_QWORD *)a3 + 8) = result;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteInt32(char *result, unsigned int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  char *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v5 = 8 * (_DWORD)result;
  v6 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    v6 = result;
  }
  if (v5 > 0x7F)
  {
    *v6 = v5 | 0x80;
    v8 = v5 >> 7;
    if (v5 >> 14)
    {
      v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        v9 = v8 >> 7;
        ++v7;
        v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      v7 = v6 + 2;
    }
  }
  else
  {
    *v6 = v5;
    v7 = v6 + 1;
  }
  *((_QWORD *)this + 8) = v7;
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (a2 > 0x7F)
  {
    *v7 = a2 | 0x80;
    v12 = (unint64_t)(int)a2 >> 7;
    if (a2 >> 14)
    {
      v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        v13 = v12 >> 7;
        ++v11;
        v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      v11 = v7 + 2;
    }
  }
  else
  {
    *v7 = a2;
    v11 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v11;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteInt64(char *result, unint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  char *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v5 = 8 * (_DWORD)result;
  v6 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    v6 = result;
  }
  if (v5 > 0x7F)
  {
    *v6 = v5 | 0x80;
    v8 = v5 >> 7;
    if (v5 >> 14)
    {
      v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        v9 = v8 >> 7;
        ++v7;
        v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      v7 = v6 + 2;
    }
  }
  else
  {
    *v6 = v5;
    v7 = v6 + 1;
  }
  *((_QWORD *)this + 8) = v7;
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (a2 > 0x7F)
  {
    *v7 = a2 | 0x80;
    v12 = a2 >> 7;
    if (a2 >> 14)
    {
      v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        v13 = v12 >> 7;
        ++v11;
        v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      v11 = v7 + 2;
    }
  }
  else
  {
    *v7 = a2;
    v11 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v11;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteUInt32(char *result, unsigned int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  char *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  v5 = 8 * (_DWORD)result;
  v6 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    v6 = result;
  }
  if (v5 > 0x7F)
  {
    *v6 = v5 | 0x80;
    v8 = v5 >> 7;
    if (v5 >> 14)
    {
      v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        v9 = v8 >> 7;
        ++v7;
        v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      v7 = v6 + 2;
    }
  }
  else
  {
    *v6 = v5;
    v7 = v6 + 1;
  }
  *((_QWORD *)this + 8) = v7;
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (a2 > 0x7F)
  {
    *v7 = a2 | 0x80;
    v12 = a2 >> 7;
    if (a2 >> 14)
    {
      v11 = v7 + 2;
      do
      {
        *(v11 - 1) = v12 | 0x80;
        v13 = v12 >> 7;
        ++v11;
        v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
      *(v11 - 1) = v13;
    }
    else
    {
      v7[1] = v12;
      v11 = v7 + 2;
    }
  }
  else
  {
    *v7 = a2;
    v11 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v11;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteSInt32(char *result, int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  char *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  v5 = 8 * (_DWORD)result;
  v6 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    v6 = result;
  }
  if (v5 > 0x7F)
  {
    *v6 = v5 | 0x80;
    v8 = v5 >> 7;
    if (v5 >> 14)
    {
      v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        v9 = v8 >> 7;
        ++v7;
        v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      v7 = v6 + 2;
    }
  }
  else
  {
    *v6 = v5;
    v7 = v6 + 1;
  }
  *((_QWORD *)this + 8) = v7;
  v11 = (2 * a2) ^ (a2 >> 31);
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (v11 > 0x7F)
  {
    *v7 = v11 | 0x80;
    v13 = v11 >> 7;
    if (v11 >> 14)
    {
      v12 = v7 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        v14 = v13 >> 7;
        ++v12;
        v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v7[1] = v13;
      v12 = v7 + 2;
    }
  }
  else
  {
    *v7 = v11;
    v12 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v12;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteSInt64(char *result, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  char *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = 8 * (_DWORD)result;
  v6 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    v6 = result;
  }
  if (v5 > 0x7F)
  {
    *v6 = v5 | 0x80;
    v8 = v5 >> 7;
    if (v5 >> 14)
    {
      v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        v9 = v8 >> 7;
        ++v7;
        v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      v7 = v6 + 2;
    }
  }
  else
  {
    *v6 = v5;
    v7 = v6 + 1;
  }
  *((_QWORD *)this + 8) = v7;
  v11 = (2 * a2) ^ (a2 >> 63);
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (v11 > 0x7F)
  {
    *v7 = v11 | 0x80;
    v13 = v11 >> 7;
    if (v11 >> 14)
    {
      v12 = v7 + 2;
      do
      {
        *(v12 - 1) = v13 | 0x80;
        v14 = v13 >> 7;
        ++v12;
        v15 = v13 >> 14;
        v13 >>= 7;
      }
      while (v15);
      *(v12 - 1) = v14;
    }
    else
    {
      v7[1] = v13;
      v12 = v7 + 2;
    }
  }
  else
  {
    *v7 = v11;
    v12 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v12;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteFixed32(char *result, int a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  int v5;
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  v5 = (int)result;
  v6 = (8 * (_DWORD)result) | 5;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  if (*(_QWORD *)this <= (unint64_t)v8)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    v8 = result;
  }
  *(_DWORD *)v8 = a2;
  *((_QWORD *)this + 8) = v8 + 4;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteFixed64(char *result, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  int v5;
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  v5 = (int)result;
  v6 = (8 * (_DWORD)result) | 1;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  if (*(_QWORD *)this <= (unint64_t)v8)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    v8 = result;
  }
  *(_QWORD *)v8 = a2;
  *((_QWORD *)this + 8) = v8 + 8;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteFloat(char *result, google::protobuf::io::EpsCopyOutputStream *this, float a3)
{
  int v5;
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  v5 = (int)result;
  v6 = (8 * (_DWORD)result) | 5;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  if (*(_QWORD *)this <= (unint64_t)v8)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    v8 = result;
  }
  *(float *)v8 = a3;
  *((_QWORD *)this + 8) = v8 + 4;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteDouble(char *result, google::protobuf::io::EpsCopyOutputStream *this, double a3)
{
  int v5;
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  v5 = (int)result;
  v6 = (8 * (_DWORD)result) | 1;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * v5) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  if (*(_QWORD *)this <= (unint64_t)v8)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
    v8 = result;
  }
  *(double *)v8 = a3;
  *((_QWORD *)this + 8) = v8 + 8;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteBool(char *result, char a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  char *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v5 = 8 * (_DWORD)result;
  v6 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v6)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v6);
    v6 = result;
  }
  if (v5 > 0x7F)
  {
    *v6 = v5 | 0x80;
    v8 = v5 >> 7;
    if (v5 >> 14)
    {
      v7 = v6 + 2;
      do
      {
        *(v7 - 1) = v8 | 0x80;
        v9 = v8 >> 7;
        ++v7;
        v10 = v8 >> 14;
        v8 >>= 7;
      }
      while (v10);
      *(v7 - 1) = v9;
    }
    else
    {
      v6[1] = v8;
      v7 = v6 + 2;
    }
  }
  else
  {
    *v6 = v5;
    v7 = v6 + 1;
  }
  *((_QWORD *)this + 8) = v7;
  if (*(_QWORD *)this <= (unint64_t)v7)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
    v7 = result;
  }
  *v7 = a2;
  *((_QWORD *)this + 8) = v7 + 1;
  return result;
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteString(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  std::string *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *result;
  char v24;
  std::string v25[2];

  v6 = (8 * a1) | 2;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
    v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  v12 = *(char *)(a2 + 23);
  if (v12 < 0 && *(_QWORD *)(a2 + 8) >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 482);
    v13 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v24, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *(_BYTE *)(a2 + 23);
    v8 = (char *)*((_QWORD *)this + 8);
  }
  if ((v12 & 0x80u) == 0)
    LODWORD(v14) = v12;
  else
    v14 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)this <= (unint64_t)v8)
    v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  if (v14 > 0x7F)
  {
    *v8 = v14 | 0x80;
    v16 = v14 >> 7;
    if (v14 >> 14)
    {
      v15 = (unsigned __int8 *)(v8 + 2);
      do
      {
        *(v15 - 1) = v16 | 0x80;
        v17 = v16 >> 7;
        ++v15;
        v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      v15 = (unsigned __int8 *)(v8 + 2);
    }
  }
  else
  {
    *v8 = v14;
    v15 = (unsigned __int8 *)(v8 + 1);
  }
  *((_QWORD *)this + 8) = v15;
  v19 = *(char *)(a2 + 23);
  if (v19 >= 0)
    v20 = (char *)a2;
  else
    v20 = *(char **)a2;
  if (v19 >= 0)
    LODWORD(v21) = *(unsigned __int8 *)(a2 + 23);
  else
    v21 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)this - (_QWORD)v15 < (int)v21)
  {
    result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(this, v20, v21, v15);
  }
  else
  {
    v22 = (int)v21;
    memcpy(v15, v20, (int)v21);
    result = &v15[v22];
  }
  *((_QWORD *)this + 8) = result;
  return result;
}

void sub_248023608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteStringMaybeAliased(int a1, void **a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  std::string *v13;
  void *v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 *result;
  char v23;
  std::string v24[2];

  v6 = (8 * a1) | 2;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
    v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  v12 = *((char *)a2 + 23);
  if (v12 < 0 && (unint64_t)a2[1] >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 491);
    v13 = google::protobuf::internal::LogMessage::operator<<(v24, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *((_BYTE *)a2 + 23);
    v8 = (char *)*((_QWORD *)this + 8);
  }
  if ((v12 & 0x80u) == 0)
    LODWORD(v14) = v12;
  else
    v14 = a2[1];
  if (*(_QWORD *)this <= (unint64_t)v8)
    v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  if (v14 > 0x7F)
  {
    *v8 = v14 | 0x80;
    v16 = v14 >> 7;
    if (v14 >> 14)
    {
      v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        v17 = v16 >> 7;
        ++v15;
        v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      v15 = v8 + 2;
    }
  }
  else
  {
    *v8 = (char)v14;
    v15 = v8 + 1;
  }
  *((_QWORD *)this + 8) = v15;
  v19 = *((char *)a2 + 23);
  if (v19 >= 0)
    v20 = a2;
  else
    v20 = *a2;
  if (v19 >= 0)
    v21 = *((unsigned __int8 *)a2 + 23);
  else
    v21 = *((unsigned int *)a2 + 2);
  result = google::protobuf::io::EpsCopyOutputStream::WriteRawMaybeAliased(this, v20, v21, v15);
  *((_QWORD *)this + 8) = result;
  return result;
}

void sub_2480237E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteBytes(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  std::string *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *result;
  char v24;
  std::string v25[2];

  v6 = (8 * a1) | 2;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
    v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  v12 = *(char *)(a2 + 23);
  if (v12 < 0 && *(_QWORD *)(a2 + 8) >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 498);
    v13 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v24, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *(_BYTE *)(a2 + 23);
    v8 = (char *)*((_QWORD *)this + 8);
  }
  if ((v12 & 0x80u) == 0)
    LODWORD(v14) = v12;
  else
    v14 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)this <= (unint64_t)v8)
    v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  if (v14 > 0x7F)
  {
    *v8 = v14 | 0x80;
    v16 = v14 >> 7;
    if (v14 >> 14)
    {
      v15 = (unsigned __int8 *)(v8 + 2);
      do
      {
        *(v15 - 1) = v16 | 0x80;
        v17 = v16 >> 7;
        ++v15;
        v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      v15 = (unsigned __int8 *)(v8 + 2);
    }
  }
  else
  {
    *v8 = v14;
    v15 = (unsigned __int8 *)(v8 + 1);
  }
  *((_QWORD *)this + 8) = v15;
  v19 = *(char *)(a2 + 23);
  if (v19 >= 0)
    v20 = (char *)a2;
  else
    v20 = *(char **)a2;
  if (v19 >= 0)
    LODWORD(v21) = *(unsigned __int8 *)(a2 + 23);
  else
    v21 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)this - (_QWORD)v15 < (int)v21)
  {
    result = google::protobuf::io::EpsCopyOutputStream::WriteRawFallback(this, v20, v21, v15);
  }
  else
  {
    v22 = (int)v21;
    memcpy(v15, v20, (int)v21);
    result = &v15[v22];
  }
  *((_QWORD *)this + 8) = result;
  return result;
}

void sub_2480239F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::WireFormatLite::WriteBytesMaybeAliased(int a1, void **a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  std::string *v13;
  void *v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 *result;
  char v23;
  std::string v24[2];

  v6 = (8 * a1) | 2;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
    v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, *((char **)this + 8));
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  v12 = *((char *)a2 + 23);
  if (v12 < 0 && (unint64_t)a2[1] >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v24, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 506);
    v13 = google::protobuf::internal::LogMessage::operator<<(v24, "CHECK failed: (value.size()) <= (kint32max): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v13->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v24[0].__r_.__value_.__l.__data_);
    LOBYTE(v12) = *((_BYTE *)a2 + 23);
    v8 = (char *)*((_QWORD *)this + 8);
  }
  if ((v12 & 0x80u) == 0)
    LODWORD(v14) = v12;
  else
    v14 = a2[1];
  if (*(_QWORD *)this <= (unint64_t)v8)
    v8 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v8);
  if (v14 > 0x7F)
  {
    *v8 = v14 | 0x80;
    v16 = v14 >> 7;
    if (v14 >> 14)
    {
      v15 = v8 + 2;
      do
      {
        *(v15 - 1) = v16 | 0x80;
        v17 = v16 >> 7;
        ++v15;
        v18 = v16 >> 14;
        v16 >>= 7;
      }
      while (v18);
      *(v15 - 1) = v17;
    }
    else
    {
      v8[1] = v16;
      v15 = v8 + 2;
    }
  }
  else
  {
    *v8 = (char)v14;
    v15 = v8 + 1;
  }
  *((_QWORD *)this + 8) = v15;
  v19 = *((char *)a2 + 23);
  if (v19 >= 0)
    v20 = a2;
  else
    v20 = *a2;
  if (v19 >= 0)
    v21 = *((unsigned __int8 *)a2 + 23);
  else
    v21 = *((unsigned int *)a2 + 2);
  result = google::protobuf::io::EpsCopyOutputStream::WriteRawMaybeAliased(this, v20, v21, v15);
  *((_QWORD *)this + 8) = result;
  return result;
}

void sub_248023BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

char *google::protobuf::internal::WireFormatLite::WriteGroup(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  unsigned int v6;
  char *v7;
  unsigned int v8;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  char *result;
  char *v14;
  unsigned int v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;

  v5 = 8 * a1;
  v6 = (8 * a1) | 3;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
    v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
  v8 = v5 >> 7;
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    if (v6 >> 14)
    {
      v9 = v7 + 2;
      v10 = v5 >> 7;
      do
      {
        *(v9 - 1) = v10 | 0x80;
        v11 = v10 >> 7;
        ++v9;
        v12 = v10 >> 14;
        v10 >>= 7;
      }
      while (v12);
      *(v9 - 1) = v11;
    }
    else
    {
      v7[1] = v8;
      v9 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v9 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v9;
  result = (char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 96))(a2);
  v14 = result;
  *((_QWORD *)this + 8) = result;
  v15 = v5 | 4;
  if (*(_QWORD *)this <= (unint64_t)result)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, result);
    v14 = result;
  }
  if (v15 > 0x7F)
  {
    *v14 = v5 | 0x84;
    if (v15 >> 14)
    {
      v16 = v14 + 2;
      do
      {
        *(v16 - 1) = v8 | 0x80;
        v17 = v8 >> 7;
        ++v16;
        v18 = v8 >> 14;
        v8 >>= 7;
      }
      while (v18);
      *(v16 - 1) = v17;
    }
    else
    {
      v14[1] = v8;
      v16 = v14 + 2;
    }
  }
  else
  {
    *v14 = v15;
    v16 = v14 + 1;
  }
  *((_QWORD *)this + 8) = v16;
  return result;
}

uint64_t google::protobuf::internal::WireFormatLite::WriteMessage(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v6;
  char *v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  char *v13;
  char *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t result;

  v6 = (8 * a1) | 2;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
    v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    v9 = (8 * a1) >> 7;
    if (v6 >> 14)
    {
      v8 = v7 + 2;
      do
      {
        *(v8 - 1) = v9 | 0x80;
        v10 = v9 >> 7;
        ++v8;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
      *(v8 - 1) = v10;
    }
    else
    {
      v7[1] = v9;
      v8 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v8;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 80))(a2);
  v13 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v13)
    v13 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v13);
  if (v12 > 0x7F)
  {
    *v13 = v12 | 0x80;
    v15 = v12 >> 7;
    if (v12 >> 14)
    {
      v14 = v13 + 2;
      do
      {
        *(v14 - 1) = v15 | 0x80;
        v16 = v15 >> 7;
        ++v14;
        v17 = v15 >> 14;
        v15 >>= 7;
      }
      while (v17);
      *(v14 - 1) = v16;
    }
    else
    {
      v13[1] = v15;
      v14 = v13 + 2;
    }
  }
  else
  {
    *v13 = v12;
    v14 = v13 + 1;
  }
  *((_QWORD *)this + 8) = v14;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 96))(a2);
  *((_QWORD *)this + 8) = result;
  return result;
}

uint64_t google::protobuf::internal::WireFormatLite::WriteSubMessageMaybeToArray(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 96))(a2, *(_QWORD *)(a3 + 64));
  *(_QWORD *)(a3 + 64) = result;
  return result;
}

char *google::protobuf::internal::WireFormatLite::WriteGroupMaybeToArray(int a1, uint64_t a2, google::protobuf::io::EpsCopyOutputStream *this)
{
  unsigned int v5;
  unsigned int v6;
  char *v7;
  unsigned int v8;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  char *result;
  char *v14;
  unsigned int v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;

  v5 = 8 * a1;
  v6 = (8 * a1) | 3;
  v7 = (char *)*((_QWORD *)this + 8);
  if (*(_QWORD *)this <= (unint64_t)v7)
    v7 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, v7);
  v8 = v5 >> 7;
  if (v6 > 0x7F)
  {
    *v7 = v6 | 0x80;
    if (v6 >> 14)
    {
      v9 = v7 + 2;
      v10 = v5 >> 7;
      do
      {
        *(v9 - 1) = v10 | 0x80;
        v11 = v10 >> 7;
        ++v9;
        v12 = v10 >> 14;
        v10 >>= 7;
      }
      while (v12);
      *(v9 - 1) = v11;
    }
    else
    {
      v7[1] = v8;
      v9 = v7 + 2;
    }
  }
  else
  {
    *v7 = v6;
    v9 = v7 + 1;
  }
  *((_QWORD *)this + 8) = v9;
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 80))(a2);
  result = (char *)(*(uint64_t (**)(uint64_t, _QWORD, google::protobuf::io::EpsCopyOutputStream *))(*(_QWORD *)a2 + 96))(a2, *((_QWORD *)this + 8), this);
  v14 = result;
  *((_QWORD *)this + 8) = result;
  v15 = v5 | 4;
  if (*(_QWORD *)this <= (unint64_t)result)
  {
    result = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(this, result);
    v14 = result;
  }
  if (v15 > 0x7F)
  {
    *v14 = v5 | 0x84;
    if (v15 >> 14)
    {
      v16 = v14 + 2;
      do
      {
        *(v16 - 1) = v8 | 0x80;
        v17 = v8 >> 7;
        ++v16;
        v18 = v8 >> 14;
        v8 >>= 7;
      }
      while (v18);
      *(v16 - 1) = v17;
    }
    else
    {
      v14[1] = v8;
      v16 = v14 + 2;
    }
  }
  else
  {
    *v14 = v15;
    v16 = v14 + 1;
  }
  *((_QWORD *)this + 8) = v16;
  return result;
}

BOOL google::protobuf::internal::WireFormatLite::ReadBytes(char **this, std::string *a2)
{
  char *v4;
  uint64_t Varint32Fallback;

  v4 = *this;
  if (*this >= this[1])
  {
    LODWORD(Varint32Fallback) = 0;
  }
  else
  {
    Varint32Fallback = *v4;
    if ((*v4 & 0x80000000) == 0)
    {
      *this = v4 + 1;
      return google::protobuf::io::CodedInputStream::ReadString((google::protobuf::io::CodedInputStream *)this, a2, Varint32Fallback);
    }
  }
  Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, Varint32Fallback);
  if ((Varint32Fallback & 0x8000000000000000) == 0)
    return google::protobuf::io::CodedInputStream::ReadString((google::protobuf::io::CodedInputStream *)this, a2, Varint32Fallback);
  return 0;
}

BOOL google::protobuf::internal::WireFormatLite::ReadBytes(char **this, std::string **a2)
{
  std::string *v3;
  char *v5;
  uint64_t Varint32Fallback;

  v3 = *a2;
  if (*a2 == (std::string *)&google::protobuf::internal::fixed_address_empty_string)
  {
    v3 = (std::string *)operator new();
    v3->__r_.__value_.__l.__size_ = 0;
    v3->__r_.__value_.__r.__words[2] = 0;
    v3->__r_.__value_.__r.__words[0] = 0;
    *a2 = v3;
  }
  v5 = *this;
  if (*this >= this[1])
  {
    LODWORD(Varint32Fallback) = 0;
  }
  else
  {
    Varint32Fallback = *v5;
    if ((*v5 & 0x80000000) == 0)
    {
      *this = v5 + 1;
      return google::protobuf::io::CodedInputStream::ReadString((google::protobuf::io::CodedInputStream *)this, v3, Varint32Fallback);
    }
  }
  Varint32Fallback = google::protobuf::io::CodedInputStream::ReadVarint32Fallback((google::protobuf::io::CodedInputStream *)this, Varint32Fallback);
  if ((Varint32Fallback & 0x8000000000000000) == 0)
    return google::protobuf::io::CodedInputStream::ReadString((google::protobuf::io::CodedInputStream *)this, v3, Varint32Fallback);
  return 0;
}

void google::protobuf::internal::PrintUTF8ErrorLog(google::protobuf::internal *this, const char *a2, const char *a3)
{
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  char v14;
  std::string v15[2];
  std::string __p;
  void *v17[2];
  uint64_t v18;

  v17[0] = 0;
  v17[1] = 0;
  v18 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&unk_248034BB6);
  if (this)
  {
    google::protobuf::StringPrintf((google::protobuf *)" '%s'", v15, this);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v15[0];
  }
  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/wire_format_lite.cc", 577);
  v5 = google::protobuf::internal::LogMessage::operator<<(v15, "String field");
  v6 = google::protobuf::internal::LogMessage::operator<<(v5, (const std::string::value_type *)&__p);
  v7 = google::protobuf::internal::LogMessage::operator<<(v6, " contains invalid ");
  v8 = google::protobuf::internal::LogMessage::operator<<(v7, "UTF-8 data when ");
  v9 = google::protobuf::internal::LogMessage::operator<<(v8, a2);
  v10 = google::protobuf::internal::LogMessage::operator<<(v9, " a protocol ");
  v11 = google::protobuf::internal::LogMessage::operator<<(v10, "buffer. Use the 'bytes' type if you intend to send raw ");
  v12 = google::protobuf::internal::LogMessage::operator<<(v11, "bytes. ");
  v13 = google::protobuf::internal::LogMessage::operator<<(v12, (const std::string::value_type *)v17);
  google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v18) < 0)
    operator delete(v17[0]);
}

void sub_248024274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  uint64_t v22;

  if (a22 < 0)
    operator delete(__p);
  if (*(char *)(v22 - 17) < 0)
    operator delete(*(void **)(v22 - 40));
  _Unwind_Resume(exception_object);
}

BOOL google::protobuf::internal::WireFormatLite::VerifyUtf8String(google::protobuf::internal *a1, const char *a2, int a3, google::protobuf::internal *a4)
{
  _BOOL8 IsStructurallyValidUTF8;
  const char *v7;
  const char *v8;

  IsStructurallyValidUTF8 = google::protobuf::internal::IsStructurallyValidUTF8(a1, a2);
  if (!IsStructurallyValidUTF8)
  {
    v7 = "serializing";
    if (a3 != 1)
      v7 = 0;
    if (a3)
      v8 = v7;
    else
      v8 = "parsing";
    google::protobuf::internal::PrintUTF8ErrorLog(a4, v8, 0);
  }
  return IsStructurallyValidUTF8;
}

uint64_t google::protobuf::internal::WireFormatLite::Int32Size(int *a1)
{
  int v1;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v1 = *a1;
  if (*a1 < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(a1, v3);
    if (v5 < 0)
      v6 = 10;
    else
      v6 = (9 * (__clz(v5 | 1) ^ 0x1F) + 73) >> 6;
    v4 += v6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::UInt32Size(int *a1)
{
  int v1;
  int v3;
  uint64_t v4;

  v1 = *a1;
  if (*a1 < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 += (9 * (__clz(*(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(a1, v3++) | 1) ^ 0x1F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::SInt32Size(int *a1)
{
  int v1;
  int v3;
  uint64_t v4;
  int *v5;

  v1 = *a1;
  if (*a1 < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = (int *)google::protobuf::RepeatedField<int>::Get(a1, v3);
    v4 += (9 * (__clz((2 * *v5) ^ (*v5 >> 31) | 1) ^ 0x1F) + 73) >> 6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::Int64Size(int *a1)
{
  int v1;
  int v3;
  uint64_t v4;

  v1 = *a1;
  if (*a1 < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 += (9 * (__clz(*(_QWORD *)google::protobuf::RepeatedField<long long>::Get(a1, v3++) | 1) ^ 0x3F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::UInt64Size(int *a1)
{
  int v1;
  int v3;
  uint64_t v4;

  v1 = *a1;
  if (*a1 < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 += (9 * (__clz(*(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(a1, v3++) | 1) ^ 0x3F) + 73) >> 6;
  while (v1 != v3);
  return v4;
}

uint64_t google::protobuf::internal::WireFormatLite::SInt64Size(int *a1)
{
  int v1;
  int v3;
  uint64_t v4;
  uint64_t *v5;

  v1 = *a1;
  if (*a1 < 1)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(a1, v3);
    v4 += (9 * (__clz((2 * *v5) ^ (*v5 >> 63) | 1) ^ 0x3F) + 73) >> 6;
    ++v3;
  }
  while (v1 != v3);
  return v4;
}

void google::protobuf::internal::FieldSkipper::~FieldSkipper(google::protobuf::internal::FieldSkipper *this)
{
  JUMPOUT(0x249596C64);
}

void google::protobuf::internal::CodedOutputStreamFieldSkipper::~CodedOutputStreamFieldSkipper(google::protobuf::internal::CodedOutputStreamFieldSkipper *this)
{
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::ArrayInputStream::ArrayInputStream(uint64_t this, const void *a2, int a3, int a4)
{
  int v4;

  *(_QWORD *)this = &off_25197D028;
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

BOOL google::protobuf::io::ArrayInputStream::Next(google::protobuf::io::ArrayInputStream *this, const void **a2, int *a3)
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

void google::protobuf::io::ArrayInputStream::BackUp(google::protobuf::io::ArrayInputStream *this, int a2)
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
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 80);
    v5 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 82);
    v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 83);
    v8 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((_QWORD *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_2480247D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::io::ArrayInputStream::Skip(google::protobuf::io::ArrayInputStream *this, int a2)
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
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 89);
    v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
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

void sub_248024880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ArrayInputStream::ByteCount(google::protobuf::io::ArrayInputStream *this)
{
  return *((int *)this + 6);
}

uint64_t google::protobuf::io::ArrayOutputStream::ArrayOutputStream(uint64_t this, void *a2, int a3, int a4)
{
  int v4;

  *(_QWORD *)this = &off_25197D068;
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

BOOL google::protobuf::io::ArrayOutputStream::Next(google::protobuf::io::ArrayOutputStream *this, void **a2, int *a3)
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

void google::protobuf::io::ArrayOutputStream::BackUp(google::protobuf::io::ArrayOutputStream *this, int a2)
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
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 127);
    v5 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (last_returned_size_) > (0): ");
    v6 = google::protobuf::internal::LogMessage::operator<<(v5, "BackUp() can only be called after a successful Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    v4 = *((_DWORD *)this + 7);
  }
  if (v4 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 129);
    v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) <= (last_returned_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 130);
    v8 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  *((_QWORD *)this + 3) = (*((_DWORD *)this + 6) - a2);
}

void sub_248024A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ArrayOutputStream::ByteCount(google::protobuf::io::ArrayOutputStream *this)
{
  return *((int *)this + 6);
}

_QWORD *google::protobuf::io::StringOutputStream::StringOutputStream(_QWORD *result, uint64_t a2)
{
  *result = &off_25197D0B0;
  result[1] = a2;
  return result;
}

uint64_t google::protobuf::io::StringOutputStream::Next(google::protobuf::io::StringOutputStream *this, void **a2, int *a3)
{
  uint64_t v6;
  std::string *v7;
  unint64_t v8;
  unint64_t v9;
  std::string::size_type v10;
  uint64_t **v11;
  uint64_t v12;
  char v14;
  std::string v15[2];

  v6 = *((_QWORD *)this + 1);
  if (!v6)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 142);
    v7 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: target_ != NULL: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    v6 = *((_QWORD *)this + 1);
  }
  if (*(char *)(v6 + 23) < 0)
  {
    v8 = *(_QWORD *)(v6 + 8);
    v9 = (*(_QWORD *)(v6 + 16) & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v8 < v9)
      goto LABEL_8;
  }
  else
  {
    v8 = *(unsigned __int8 *)(v6 + 23);
    if (*(unsigned __int8 *)(v6 + 23) < 0x16u)
    {
      v9 = 22;
      goto LABEL_8;
    }
  }
  v9 = 2 * v8;
LABEL_8:
  if (v8 + 0x7FFFFFFF < v9)
    v9 = v8 + 0x7FFFFFFF;
  if (v9 <= 0x10)
    v10 = 16;
  else
    v10 = v9;
  std::string::resize((std::string *)v6, v10, 0);
  v11 = (uint64_t **)*((_QWORD *)this + 1);
  if (*((char *)v11 + 23) < 0)
    v11 = (uint64_t **)*v11;
  *a2 = (char *)v11 + v8;
  v12 = *((_QWORD *)this + 1);
  if (*(char *)(v12 + 23) < 0)
    v12 = *(_QWORD *)(v12 + 8);
  else
    LODWORD(v12) = *(unsigned __int8 *)(v12 + 23);
  *a3 = v12 - v8;
  return 1;
}

void sub_248024B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::io::StringOutputStream::BackUp(google::protobuf::io::StringOutputStream *this, int a2)
{
  std::string *v4;
  uint64_t v5;
  std::string *v6;
  uint64_t v7;
  unint64_t v8;
  std::string *v9;
  char v10;
  std::string v11[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 169);
    v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v5 = *((_QWORD *)this + 1);
  if (!v5)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 170);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: target_ != NULL: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v5 = *((_QWORD *)this + 1);
  }
  LODWORD(v7) = *(char *)(v5 + 23);
  if ((v7 & 0x80000000) != 0)
    v8 = *(_QWORD *)(v5 + 8);
  else
    v8 = *(unsigned __int8 *)(v5 + 23);
  if (v8 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 171);
    v9 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (target_->size()): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v5 = *((_QWORD *)this + 1);
    LOBYTE(v7) = *(_BYTE *)(v5 + 23);
  }
  if ((v7 & 0x80) != 0)
    v7 = *(_QWORD *)(v5 + 8);
  else
    v7 = v7;
  std::string::resize((std::string *)v5, v7 - a2, 0);
}

void sub_248024CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::StringOutputStream::ByteCount(google::protobuf::io::StringOutputStream *this)
{
  uint64_t v1;
  std::string *v3;
  char v5;
  std::string v6[2];

  v1 = *((_QWORD *)this + 1);
  if (!v1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 176);
    v3 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: target_ != NULL: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
    v1 = *((_QWORD *)this + 1);
  }
  if (*(char *)(v1 + 23) < 0)
    return *(_QWORD *)(v1 + 8);
  else
    return *(unsigned __int8 *)(v1 + 23);
}

void sub_248024D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingInputStream::Skip(google::protobuf::io::CopyingInputStream *this)
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

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor(uint64_t result, uint64_t a2, int a3)
{
  int v3;

  *(_QWORD *)result = &off_25197D0F8;
  *(_QWORD *)(result + 8) = a2;
  *(_WORD *)(result + 16) = 0;
  if (a3 <= 0)
    v3 = 0x2000;
  else
    v3 = a3;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_DWORD *)(result + 48) = 0;
  *(_DWORD *)(result + 40) = v3;
  return result;
}

void google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_25197D0F8;
  if (*((_BYTE *)this + 16))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  v3 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3)
    MEMORY[0x249596C40](v3, 0x1000C8077774924);
}

{
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(this);
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::Next(google::protobuf::io::CopyingInputStreamAdaptor *this, const void **a2, int *a3)
{
  uint64_t v7;
  int v8;
  const void *v9;

  if (*((_BYTE *)this + 17))
    return 0;
  google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
  v7 = *((unsigned int *)this + 12);
  if ((int)v7 < 1)
  {
    v8 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), *((_QWORD *)this + 4), *((unsigned int *)this + 10));
    *((_DWORD *)this + 11) = v8;
    if (v8 <= 0)
    {
      if (v8 < 0)
        *((_BYTE *)this + 17) = 1;
      google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(this);
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

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;

  if (!*(_QWORD *)(this + 32))
  {
    v1 = this;
    v2 = operator new[]();
    this = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 32) = v2;
    if (this)
      JUMPOUT(0x249596C40);
  }
  return this;
}

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::FreeBuffer(google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  std::string *v2;
  uint64_t result;
  char v4;
  std::string v5[2];

  if (*((_DWORD *)this + 12))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 292);
    v2 = google::protobuf::internal::LogMessage::operator<<(v5, "CHECK failed: (backup_bytes_) == (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 11) = 0;
  result = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (result)
    return MEMORY[0x249596C40](result, 0x1000C8077774924);
  return result;
}

void sub_2480250A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::io::CopyingInputStreamAdaptor::BackUp(google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
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
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 248);
    v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: backup_bytes_ == 0 && buffer_.get() != NULL: ");
    v5 = google::protobuf::internal::LogMessage::operator<<(v4, " BackUp() can only be called after Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (*((_DWORD *)this + 11) < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 250);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, " Can't back up over more bytes than were returned by the last call to Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 253);
    v8 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    v9 = google::protobuf::internal::LogMessage::operator<<(v8, " Parameter to BackUp() can't be negative.");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  *((_DWORD *)this + 12) = a2;
}

void sub_2480251E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::io::CopyingInputStreamAdaptor::Skip(google::protobuf::io::CopyingInputStreamAdaptor *this, int a2)
{
  std::string *v4;
  int v6;
  uint64_t v7;
  int v8;
  char v9;
  std::string v10[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 259);
    v4 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
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

void sub_2480252D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingInputStreamAdaptor::ByteCount(google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  return *((_QWORD *)this + 3) - *((int *)this + 12);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor(uint64_t result, uint64_t a2, int a3)
{
  int v3;

  *(_QWORD *)result = &off_25197D138;
  *(_QWORD *)(result + 8) = a2;
  *(_WORD *)(result + 16) = 0;
  if (a3 <= 0)
    v3 = 0x2000;
  else
    v3 = a3;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = v3;
  *(_DWORD *)(result + 44) = 0;
  return result;
}

void google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_25197D138;
  google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
  if (*((_BYTE *)this + 16))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  v3 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3)
    MEMORY[0x249596C40](v3, 0x1000C8077774924);
}

{
  google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(this);
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(google::protobuf::io::CopyingOutputStreamAdaptor *this)
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
  *((_QWORD *)this + 4) = 0;
  if (result)
  {
    MEMORY[0x249596C40](result, 0x1000C8077774924);
    return 0;
  }
  return result;
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::Next(google::protobuf::io::CopyingOutputStreamAdaptor *this, void **a2, int *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;

  if (*((_DWORD *)this + 11) != *((_DWORD *)this + 10)
    || (result = google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this), (_DWORD)result))
  {
    google::protobuf::io::CopyingInputStreamAdaptor::AllocateBufferIfNeeded((uint64_t)this);
    v7 = *((_DWORD *)this + 10);
    v8 = *((int *)this + 11);
    *a2 = (void *)(*((_QWORD *)this + 4) + v8);
    *a3 = v7 - v8;
    *((_DWORD *)this + 11) = *((_DWORD *)this + 10);
    return 1;
  }
  return result;
}

void google::protobuf::io::CopyingOutputStreamAdaptor::BackUp(google::protobuf::io::CopyingOutputStreamAdaptor *this, int a2)
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
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 331);
    v4 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
  }
  v5 = *((_DWORD *)this + 11);
  if (v5 != *((_DWORD *)this + 10))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 332);
    v6 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (buffer_used_) == (buffer_size_): ");
    v7 = google::protobuf::internal::LogMessage::operator<<(v6, " BackUp() can only be called after Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v5 = *((_DWORD *)this + 11);
  }
  if (v5 < a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 334);
    v8 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: (count) <= (buffer_used_): ");
    v9 = google::protobuf::internal::LogMessage::operator<<(v8, " Can't back up over more bytes than were returned by the last call to Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    v5 = *((_DWORD *)this + 11);
  }
  *((_DWORD *)this + 11) = v5 - a2;
}

void sub_2480255E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return *((_QWORD *)this + 3) + *((int *)this + 11);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::WriteAliasedRaw(google::protobuf::io::CopyingOutputStreamAdaptor *this, char *a2, uint64_t a3)
{
  uint64_t v3;
  int v6;
  uint64_t result;
  std::string *v8;
  int __n;
  std::string __n_4[2];

  v3 = a3;
  if (*((_DWORD *)this + 10) > (int)a3)
  {
    __n_4[0].__r_.__value_.__r.__words[0] = 0;
    __n = 0;
    v6 = (*(uint64_t (**)(google::protobuf::io::CopyingOutputStreamAdaptor *, std::string *, int *))(*(_QWORD *)this + 16))(this, __n_4, &__n);
    result = 0;
    if (!v6)
      return result;
    while ((int)v3 > __n)
    {
      memcpy(__n_4[0].__r_.__value_.__l.__data_, a2, __n);
      a2 += __n;
      LODWORD(v3) = v3 - __n;
      if (((*(uint64_t (**)(google::protobuf::io::CopyingOutputStreamAdaptor *, std::string *, int *))(*(_QWORD *)this + 16))(this, __n_4, &__n) & 1) == 0)return 0;
    }
    memcpy(__n_4[0].__r_.__value_.__l.__data_, a2, (int)v3);
    (*(void (**)(google::protobuf::io::CopyingOutputStreamAdaptor *, _QWORD))(*(_QWORD *)this + 24))(this, (__n - v3));
    return 1;
  }
  result = google::protobuf::io::CopyingOutputStreamAdaptor::WriteBuffer(this);
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(_QWORD, char *, uint64_t))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), a2, v3);
    if ((_DWORD)result)
    {
      if (*((_DWORD *)this + 11))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)__n_4, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl_lite.cc", 350);
        v8 = google::protobuf::internal::LogMessage::operator<<(__n_4, "CHECK failed: (buffer_used_) == (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&__n, (const char **)&v8->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&__n_4[0].__r_.__value_.__l.__data_);
      }
      *((_QWORD *)this + 3) += (int)v3;
      return 1;
    }
  }
  return result;
}

void sub_248025770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::FreeBuffer(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  uint64_t result;

  *((_DWORD *)this + 11) = 0;
  result = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (result)
    JUMPOUT(0x249596C40);
  return result;
}

_QWORD *google::protobuf::io::LimitingInputStream::LimitingInputStream(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  *a1 = &off_25197D180;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
  return a1;
}

void google::protobuf::io::LimitingInputStream::~LimitingInputStream(google::protobuf::io::LimitingInputStream *this)
{
  *(_QWORD *)this = &off_25197D180;
  if ((*((_QWORD *)this + 2) & 0x8000000000000000) != 0)
    (*(void (**)(_QWORD, _QWORD))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1), -*((_DWORD *)this + 4));
}

{
  google::protobuf::io::LimitingInputStream::~LimitingInputStream(this);
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::LimitingInputStream::Next(google::protobuf::io::LimitingInputStream *this, const void **a2, int *a3)
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

uint64_t google::protobuf::io::LimitingInputStream::BackUp(google::protobuf::io::LimitingInputStream *this, uint64_t a2)
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

BOOL google::protobuf::io::LimitingInputStream::Skip(google::protobuf::io::LimitingInputStream *this, uint64_t a2)
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

uint64_t google::protobuf::io::LimitingInputStream::ByteCount(google::protobuf::io::LimitingInputStream *this)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *((_QWORD *)this + 2);
  v3 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 40))(*((_QWORD *)this + 1));
  if (v2 < 0)
    v3 += *((_QWORD *)this + 2);
  return v3 - *((_QWORD *)this + 3);
}

void google::protobuf::io::ArrayInputStream::~ArrayInputStream(google::protobuf::io::ArrayInputStream *this)
{
  JUMPOUT(0x249596C64);
}

void google::protobuf::io::ArrayOutputStream::~ArrayOutputStream(google::protobuf::io::ArrayOutputStream *this)
{
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::ZeroCopyOutputStream::AllowsAliasing(google::protobuf::io::ZeroCopyOutputStream *this)
{
  return 0;
}

void google::protobuf::io::StringOutputStream::~StringOutputStream(google::protobuf::io::StringOutputStream *this)
{
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::CopyingOutputStreamAdaptor::AllowsAliasing(google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::SetFlag(uint64_t result, int a2, int a3)
{
  int v3;
  int v4;
  int v5;

  v3 = *(_DWORD *)(result + 8);
  v4 = v3 & ~a2;
  v5 = v3 | a2;
  if (!a3)
    v5 = v4;
  *(_DWORD *)(result + 8) = v5;
  return result;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::MemoryMappedNormalizerSpec(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;

  *(_QWORD *)a1 = &off_25197D290;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFE | (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2))
    v4 = 2;
  else
    v4 = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFD | v4;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 32))(a2))
    v5 = 4;
  else
    v5 = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFFB | v5;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2))
    v6 = 8;
  else
    v6 = 0;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a1 + 8) & 0xFFFFFFF7 | v6;
  return a1;
}

void sentencepiece::MemoryMappedNormalizerSpec::Serialize(sentencepiece::MemoryMappedNormalizerSpec *this@<X0>, uint64_t a2@<X8>)
{
  int v3;
  _DWORD *v4;

  v3 = *((_DWORD *)this + 2);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  std::string::resize((std::string *)a2, 4uLL, 0);
  if (*(char *)(a2 + 23) >= 0)
    v4 = (_DWORD *)a2;
  else
    v4 = *(_DWORD **)a2;
  *v4 = v3;
}

void sub_248025B9C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sentencepiece::PieceTypeInfo::Serialize(sentencepiece::PieceTypeInfo *this@<X0>, uint64_t a2@<X8>)
{
  char v3;
  _BYTE *v4;

  v3 = *(_BYTE *)this;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  std::string::resize((std::string *)a2, 1uLL, 0);
  if (*(char *)(a2 + 23) >= 0)
    v4 = (_BYTE *)a2;
  else
    v4 = *(_BYTE **)a2;
  *v4 = v3;
}

void sub_248025C04(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t sentencepiece::MemoryMappedModelProto::MemoryMappedModelProto(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  uint64_t *v6;
  _DWORD *v8;

  *(_QWORD *)a1 = &off_25197D2D0;
  *(_QWORD *)(a1 + 16) = &off_25197D290;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = &off_25197D290;
  *(_DWORD *)(a1 + 40) = 0;
  v6 = (uint64_t *)(a1 + 88);
  sentencepiece::util::Status::Status((_QWORD *)(a1 + 88));
  sentencepiece::MemoryMappedModelProto::Init(a1, a2, a3, (sentencepiece::util::Status *)&v8);
  sentencepiece::util::Status::operator=(v6, &v8);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  return a1;
}

void sub_248025CB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  sentencepiece::util::Status *v2;
  va_list va;

  va_start(va, a2);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)va);
  sentencepiece::util::Status::~Status(v2);
  _Unwind_Resume(a1);
}

_QWORD *sentencepiece::MemoryMappedModelProto::Init@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, unint64_t a3@<X2>, sentencepiece::util::Status *a4@<X8>)
{
  _QWORD *result;
  int v7;
  unint64_t v8;
  _QWORD *v9;
  int v10;
  int v11;
  int v12;
  _DWORD *v13;
  unint64_t v14;

  v13 = a2;
  v14 = a3;
  v12 = 0;
  result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(a2, a3, &v12, a4);
  if (!*(_QWORD *)a4)
  {
    sentencepiece::util::Status::~Status(a4);
    result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
    if (!*(_QWORD *)a4)
    {
      sentencepiece::util::Status::~Status(a4);
      *(_DWORD *)(a1 + 8) = v12;
      v11 = 0;
      result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(v13, v14, &v11, a4);
      if (!*(_QWORD *)a4)
      {
        sentencepiece::util::Status::~Status(a4);
        result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
        if (!*(_QWORD *)a4)
        {
          sentencepiece::util::Status::~Status(a4);
          *(_DWORD *)(a1 + 24) = v11;
          v10 = 0;
          result = sentencepiece::mmap_util::DecodePrefix<unsigned int>(v13, v14, &v10, a4);
          if (!*(_QWORD *)a4)
          {
            sentencepiece::util::Status::~Status(a4);
            result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
            if (!*(_QWORD *)a4)
            {
              sentencepiece::util::Status::~Status(a4);
              v7 = v10;
              *(_DWORD *)(a1 + 48) = 0;
              *(_DWORD *)(a1 + 40) = v7;
              result = sentencepiece::mmap_util::DecodePrefix<int>(v13, v14, (_DWORD *)(a1 + 48), a4);
              if (!*(_QWORD *)a4)
              {
                sentencepiece::util::Status::~Status(a4);
                result = sentencepiece::mmap_util::RemovePrefix(&v13, 4uLL, a4);
                if (!*(_QWORD *)a4)
                {
                  sentencepiece::util::Status::~Status(a4);
                  *(_QWORD *)(a1 + 56) = v13;
                  v8 = sentencepiece::mmap_util::RoundUp((sentencepiece::mmap_util *)*(int *)(a1 + 48), 4uLL);
                  result = sentencepiece::mmap_util::RemovePrefix(&v13, v8, a4);
                  if (!*(_QWORD *)a4)
                  {
                    sentencepiece::util::Status::~Status(a4);
                    *(_QWORD *)(a1 + 64) = v13;
                    result = sentencepiece::mmap_util::RemovePrefix(&v13, 4 * *(int *)(a1 + 48), a4);
                    if (!*(_QWORD *)a4)
                    {
                      sentencepiece::util::Status::~Status(a4);
                      *(_QWORD *)(a1 + 72) = v13;
                      result = sentencepiece::mmap_util::RemovePrefix(&v13, 4 * *(int *)(a1 + 48) + 20, a4);
                      if (!*(_QWORD *)a4)
                      {
                        sentencepiece::util::Status::~Status(a4);
                        *(_QWORD *)(a1 + 80) = v13;
                        return sentencepiece::util::Status::Status(v9);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sentencepiece::GetPieceTypeInfo(uint64_t a1, uint64_t a2)
{
  sentencepiece::logging *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1) & 1) != 0)
    return 1;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 112))(a1, a2) & 1) != 0)
    return 2;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 120))(a1, a2) & 1) != 0)
    return 3;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 128))(a1, a2) & 1) != 0)
    return 4;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 136))(a1, a2) & 1) != 0)
    return 5;
  v5 = (sentencepiece::logging *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 144))(a1, a2);
  if ((v5 & 1) == 0)
  {
    if ((int)sentencepiece::logging::GetMinLogLevel(v5) <= 2)
    {
      v15 = 0;
      v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB310], (uint64_t)"mmap_model_proto.cc", 19);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"(", 1);
      v7 = (_QWORD *)std::ostream::operator<<();
      v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)") ", 2);
      v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"LOG(", 4);
      v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"ERROR", 5);
      v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)") ", 2);
      v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"Unknown piece type: ", 20);
      v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 88))(a1, a2);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, v13, v14);
      sentencepiece::error::Die::~Die((sentencepiece::error::Die *)&v15);
    }
    return 1;
  }
  return 6;
}

void sub_248026080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  sentencepiece::error::Die::~Die((sentencepiece::error::Die *)&a13);
  _Unwind_Resume(a1);
}

void sentencepiece::GetMemoryMappableString(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  std::string *v9;
  std::string *v10;
  std::string::size_type size;
  uint64_t v12;
  std::string *v13;
  std::string::size_type v14;
  uint64_t v15;
  std::string *v16;
  std::string::size_type v17;
  int v18;
  std::string *v19;
  std::string *v20;
  std::string::size_type v21;
  uint64_t v22;
  uint64_t i;
  std::string *v24;
  std::string::size_type v25;
  uint64_t j;
  float v27;
  std::string *v28;
  std::string *v29;
  std::string::size_type v30;
  std::string::value_type *v31;
  std::string::size_type v32;
  std::string::value_type *v33;
  std::string::size_type v34;
  std::string::value_type *v35;
  std::string::size_type v36;
  std::string::value_type *v37;
  std::string::size_type v38;
  std::string::value_type *v39;
  std::string::size_type v40;
  uint64_t v41;
  std::string::value_type *v42;
  std::string::size_type v43;
  std::string *v44;
  std::string::size_type v45;
  std::string *v46[2];
  void *__p;
  _BYTE *v48;
  uint64_t v49;
  _BYTE v50[16];
  _BYTE v51[16];
  std::string v52;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  memset(&v52, 0, sizeof(v52));
  std::string::resize(&v52, 4uLL, 0);
  v7 = v4 | 2;
  if (!v5)
    v7 = v4;
  v8 = v7 | (v6 << 30);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v52;
  else
    v9 = (std::string *)v52.__r_.__value_.__r.__words[0];
  LODWORD(v9->__r_.__value_.__l.__data_) = v8;
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = &v52;
  else
    v10 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  else
    size = v52.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)v10, size);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 152))(a1);
  sentencepiece::MemoryMappedNormalizerSpec::MemoryMappedNormalizerSpec((uint64_t)v51, v12);
  sentencepiece::MemoryMappedNormalizerSpec::Serialize((sentencepiece::MemoryMappedNormalizerSpec *)v51, (uint64_t)&v52);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v13 = &v52;
  else
    v13 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v14 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  else
    v14 = v52.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)v13, v14);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(a1);
  sentencepiece::MemoryMappedNormalizerSpec::MemoryMappedNormalizerSpec((uint64_t)v50, v15);
  sentencepiece::MemoryMappedNormalizerSpec::Serialize((sentencepiece::MemoryMappedNormalizerSpec *)v50, (uint64_t)&v52);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = &v52;
  else
    v16 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v17 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  else
    v17 = v52.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)v16, v17);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  memset(&v52, 0, sizeof(v52));
  std::string::resize(&v52, 4uLL, 0);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = &v52;
  else
    v19 = (std::string *)v52.__r_.__value_.__r.__words[0];
  LODWORD(v19->__r_.__value_.__l.__data_) = v18;
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v52;
  else
    v20 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v21 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  else
    v21 = v52.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)v20, v21);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  v22 = v18;
  if (v18)
  {
    for (i = 0; i != v18; ++i)
    {
      LOBYTE(__p) = sentencepiece::GetPieceTypeInfo(a1, i);
      sentencepiece::PieceTypeInfo::Serialize((sentencepiece::PieceTypeInfo *)&__p, (uint64_t)&v52);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v24 = &v52;
      else
        v24 = (std::string *)v52.__r_.__value_.__r.__words[0];
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v25 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
      else
        v25 = v52.__r_.__value_.__l.__size_;
      std::string::append(a2, (const std::string::value_type *)v24, v25);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v52.__r_.__value_.__l.__data_);
    }
  }
  sentencepiece::mmap_util::Padding(a2);
  if (v18)
  {
    for (j = 0; j != v18; ++j)
    {
      v27 = (*(float (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 96))(a1, j);
      memset(&v52, 0, sizeof(v52));
      std::string::resize(&v52, 4uLL, 0);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = &v52;
      else
        v28 = (std::string *)v52.__r_.__value_.__r.__words[0];
      *(float *)&v28->__r_.__value_.__l.__data_ = v27;
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = &v52;
      else
        v29 = (std::string *)v52.__r_.__value_.__r.__words[0];
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v30 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
      else
        v30 = v52.__r_.__value_.__l.__size_;
      std::string::append(a2, (const std::string::value_type *)v29, v30);
      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v52.__r_.__value_.__l.__data_);
    }
  }
  memset(&v52, 0, sizeof(v52));
  __p = 0;
  v48 = 0;
  v49 = 0;
  v46[0] = &v52;
  v46[1] = (std::string *)&__p;
  v31 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v31, v32);
  v33 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v33, v34);
  v35 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v35, v36);
  v37 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v37, v38);
  v39 = (std::string::value_type *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
  sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v39, v40);
  if (v18)
  {
    v41 = 0;
    do
    {
      v42 = (std::string::value_type *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 88))(a1, v41);
      sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(v46, v42, v43);
      ++v41;
    }
    while (v22 != v41);
  }
  std::string::append(a2, (const std::string::value_type *)__p, v48 - (_BYTE *)__p);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v44 = &v52;
  else
    v44 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v45 = HIBYTE(v52.__r_.__value_.__r.__words[2]);
  else
    v45 = v52.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)v44, v45);
  if (__p)
  {
    v48 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
}

void sub_248026528(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  if (a23 < 0)
    operator delete(__p);
  if (*(char *)(v23 + 23) < 0)
    operator delete(*(void **)v23);
  _Unwind_Resume(exception_object);
}

void sentencepiece::GetMemoryMappableString(sentencepiece::ModelProtoBase const&)::$_0::operator()(std::string **a1, std::string::value_type *__s, std::string::size_type __n)
{
  std::string *v6;
  std::string::size_type size;
  unint64_t v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  int v19;

  v6 = a1[1];
  if (SHIBYTE((*a1)->__r_.__value_.__r.__words[2]) < 0)
    size = (*a1)->__r_.__value_.__l.__size_;
  else
    LODWORD(size) = HIBYTE((*a1)->__r_.__value_.__r.__words[2]);
  v8 = v6->__r_.__value_.__r.__words[2];
  v9 = (_DWORD *)v6->__r_.__value_.__l.__size_;
  if ((unint64_t)v9 >= v8)
  {
    v11 = (_DWORD *)v6->__r_.__value_.__r.__words[0];
    v12 = (uint64_t)((uint64_t)v9 - v6->__r_.__value_.__r.__words[0]) >> 2;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 62)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 1 > v13)
      v13 = v14 >> 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL)
      v15 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v6->__r_.__value_.__r.__words[2], v15);
      v11 = (_DWORD *)v6->__r_.__value_.__r.__words[0];
      v9 = (_DWORD *)v6->__r_.__value_.__l.__size_;
    }
    else
    {
      v16 = 0;
    }
    v17 = &v16[4 * v12];
    v18 = &v16[4 * v15];
    *(_DWORD *)v17 = size;
    v10 = v17 + 4;
    while (v9 != v11)
    {
      v19 = *--v9;
      *((_DWORD *)v17 - 1) = v19;
      v17 -= 4;
    }
    v6->__r_.__value_.__r.__words[0] = (std::string::size_type)v17;
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)v10;
    v6->__r_.__value_.__r.__words[2] = (std::string::size_type)v18;
    if (v11)
      operator delete(v11);
  }
  else
  {
    *v9 = size;
    v10 = v9 + 1;
  }
  v6->__r_.__value_.__l.__size_ = (std::string::size_type)v10;
  std::string::append(*a1, __s, __n);
  std::string::push_back(*a1, 0);
}

void sentencepiece::MemoryMappedNormalizerSpec::~MemoryMappedNormalizerSpec(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  JUMPOUT(0x249596C64);
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::add_dummy_prefix(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return *((_DWORD *)this + 2) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::remove_extra_whitespaces(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 1) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::escape_whitespaces(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 2) & 1;
}

uint64_t sentencepiece::MemoryMappedNormalizerSpec::add_suffix_space(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  return (*((unsigned __int8 *)this + 8) >> 3) & 1;
}

void sentencepiece::MemoryMappedModelProto::~MemoryMappedModelProto(sentencepiece::MemoryMappedModelProto *this)
{
  *(_QWORD *)this = &off_25197D2D0;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
}

{
  *(_QWORD *)this = &off_25197D2D0;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
  JUMPOUT(0x249596C64);
}

uint64_t sentencepiece::MemoryMappedModelProto::PieceSize(sentencepiece::MemoryMappedModelProto *this)
{
  return *((unsigned int *)this + 12);
}

const char *sentencepiece::MemoryMappedModelProto::UnkSurface(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + **((unsigned int **)this + 9));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::UnkPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 4));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::BosPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 8));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::EosPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 12));
  strlen(v1);
  return v1;
}

const char *sentencepiece::MemoryMappedModelProto::PadPiece(sentencepiece::MemoryMappedModelProto *this)
{
  const char *v1;

  v1 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 16));
  strlen(v1);
  return v1;
}

uint64_t sentencepiece::MemoryMappedModelProto::ByteFallback(sentencepiece::MemoryMappedModelProto *this)
{
  return *((_DWORD *)this + 2) & 1;
}

uint64_t sentencepiece::MemoryMappedModelProto::HasUnkSurface(sentencepiece::MemoryMappedModelProto *this)
{
  return (*((unsigned __int8 *)this + 8) >> 1) & 1;
}

uint64_t sentencepiece::MemoryMappedModelProto::GetModelType(sentencepiece::MemoryMappedModelProto *this)
{
  return *((_DWORD *)this + 2) >> 30;
}

const char *sentencepiece::MemoryMappedModelProto::IdToPiece(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  const char *v2;

  v2 = (const char *)(*((_QWORD *)this + 10) + *(unsigned int *)(*((_QWORD *)this + 9) + 4 * (a2 + 5)));
  strlen(v2);
  return v2;
}

float sentencepiece::MemoryMappedModelProto::GetScore(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(float *)(*((_QWORD *)this + 8) + 4 * a2);
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsNormal(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 1;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUnknown(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 2;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsControl(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 3;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUnused(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 4;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsUserDefined(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 5;
}

BOOL sentencepiece::MemoryMappedModelProto::PieceIsByte(sentencepiece::MemoryMappedModelProto *this, int a2)
{
  return *(_BYTE *)(*((_QWORD *)this + 7) + a2) == 6;
}

uint64_t sentencepiece::MemoryMappedModelProto::NormalizerSpec(sentencepiece::MemoryMappedModelProto *this)
{
  return (uint64_t)this + 16;
}

uint64_t sentencepiece::MemoryMappedModelProto::DenormalizerSpec(sentencepiece::MemoryMappedModelProto *this)
{
  return (uint64_t)this + 32;
}

google::protobuf::io::FileInputStream *google::protobuf::io::FileInputStream::FileInputStream(google::protobuf::io::FileInputStream *this, int a2, int a3)
{
  *((_QWORD *)this + 1) = &off_25197D3F8;
  *(_QWORD *)this = &off_25197D3B8;
  *((_DWORD *)this + 4) = a2;
  *((_WORD *)this + 10) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_BYTE *)this + 28) = 0;
  google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)this + 32, (uint64_t)this + 8, a3);
  return this;
}

void sub_2480269DC(_Unwind_Exception *a1)
{
  google::protobuf::io::FileInputStream::CopyingFileInputStream *v1;

  google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v1);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileInputStream::CopyingFileInputStream::CopyingFileInputStream(uint64_t this, int a2)
{
  *(_QWORD *)this = &off_25197D3F8;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  *(_BYTE *)(this + 20) = 0;
  return this;
}

BOOL google::protobuf::io::FileInputStream::Close(google::protobuf::io::FileInputStream *this)
{
  return google::protobuf::io::FileInputStream::CopyingFileInputStream::Close((google::protobuf::io::FileInputStream *)((char *)this + 8));
}

BOOL google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  std::string *v2;
  int v3;
  char v5;
  std::string v6[2];

  if (*((_BYTE *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 117);
    v2 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((_BYTE *)this + 13) = 1;
  if (v3)
    *((_DWORD *)this + 4) = *__error();
  return v3 == 0;
}

void sub_248026AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileInputStream::Next(google::protobuf::io::FileInputStream *this, const void **a2, int *a3)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Next((google::protobuf::io::FileInputStream *)((char *)this + 32), a2, a3);
}

void google::protobuf::io::FileInputStream::BackUp(google::protobuf::io::FileInputStream *this, int a2)
{
  google::protobuf::io::CopyingInputStreamAdaptor::BackUp((google::protobuf::io::FileInputStream *)((char *)this + 32), a2);
}

BOOL google::protobuf::io::FileInputStream::Skip(google::protobuf::io::FileInputStream *this, int a2)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Skip((google::protobuf::io::FileInputStream *)((char *)this + 32), a2);
}

uint64_t google::protobuf::io::FileInputStream::ByteCount(google::protobuf::io::FileInputStream *this)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((google::protobuf::io::FileInputStream *)((char *)this + 32));
}

void google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(google::protobuf::io::FileInputStream::CopyingFileInputStream *this)
{
  std::string *v2;
  char *v3;
  std::string *v4;
  char v5;
  std::string v6[2];

  *(_QWORD *)this = &off_25197D3F8;
  if (*((_BYTE *)this + 12))
  {
    if (!google::protobuf::io::FileInputStream::CopyingFileInputStream::Close(this))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 111);
      v2 = google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
      v3 = strerror(*((_DWORD *)this + 4));
      v4 = google::protobuf::internal::LogMessage::operator<<(v2, v3);
      google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
    }
  }
}

{
  google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(this);
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::`anonymous namespace'::close_no_eintr(google::protobuf::io::_anonymous_namespace_ *this)
{
  int v1;
  uint64_t v2;

  v1 = (int)this;
  do
    v2 = close(v1);
  while ((v2 & 0x80000000) != 0 && *__error() == 4);
  return v2;
}

ssize_t google::protobuf::io::FileInputStream::CopyingFileInputStream::Read(google::protobuf::io::FileInputStream::CopyingFileInputStream *this, void *a2, int a3)
{
  std::string *v6;
  ssize_t v7;
  char v9;
  std::string v10[2];

  if (*((_BYTE *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 132);
    v6 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
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

void sub_248026CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileInputStream::CopyingFileInputStream::Skip(google::protobuf::io::FileInputStream::CopyingFileInputStream *this, uint64_t a2)
{
  std::string *v4;
  char v6;
  std::string v7[2];

  if (*((_BYTE *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 148);
    v4 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  if (*((_BYTE *)this + 20) || lseek(*((_DWORD *)this + 2), (int)a2, 1) == -1)
  {
    *((_BYTE *)this + 20) = 1;
    return google::protobuf::io::CopyingInputStream::Skip(this);
  }
  return a2;
}

void sub_248026D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::FileOutputStream::FileOutputStream(google::protobuf::io::FileOutputStream *this, int a2)
{
  uint64_t result;

  *(_QWORD *)this = &off_25197D428;
  result = google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)this, (uint64_t)this + 48, -1);
  *(_QWORD *)result = &off_25197D428;
  *(_QWORD *)(result + 48) = &off_25197D470;
  *(_DWORD *)(result + 56) = a2;
  *(_WORD *)(result + 60) = 0;
  *(_DWORD *)(result + 64) = 0;
  return result;
}

uint64_t google::protobuf::io::FileOutputStream::CopyingFileOutputStream::CopyingFileOutputStream(uint64_t this, int a2)
{
  *(_QWORD *)this = &off_25197D470;
  *(_DWORD *)(this + 8) = a2;
  *(_WORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

uint64_t google::protobuf::io::FileOutputStream::Close(google::protobuf::io::FileOutputStream *this)
{
  unsigned int v2;

  v2 = google::protobuf::io::CopyingOutputStreamAdaptor::Flush(this);
  return google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close((google::protobuf::io::FileOutputStream *)((char *)this + 48)) & v2;
}

BOOL google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  std::string *v2;
  int v3;
  char v5;
  std::string v6[2];

  if (*((_BYTE *)this + 13))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 194);
    v2 = google::protobuf::internal::LogMessage::operator<<(v6, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
  }
  *((_BYTE *)this + 13) = 1;
  if (v3)
    *((_DWORD *)this + 4) = *__error();
  return v3 == 0;
}

void sub_248026EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::io::FileOutputStream::~FileOutputStream(google::protobuf::io::FileOutputStream *this)
{
  *(_QWORD *)this = &off_25197D428;
  google::protobuf::io::CopyingOutputStreamAdaptor::Flush(this);
  google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream((google::protobuf::io::FileOutputStream *)((char *)this + 48));
  google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(this);
}

{
  google::protobuf::io::FileOutputStream::~FileOutputStream(this);
  JUMPOUT(0x249596C64);
}

void google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this)
{
  std::string *v2;
  char *v3;
  std::string *v4;
  char v5;
  std::string v6[2];

  *(_QWORD *)this = &off_25197D470;
  if (*((_BYTE *)this + 12))
  {
    if (!google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Close(this))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 188);
      v2 = google::protobuf::internal::LogMessage::operator<<(v6, "close() failed: ");
      v3 = strerror(*((_DWORD *)this + 4));
      v4 = google::protobuf::internal::LogMessage::operator<<(v2, v3);
      google::protobuf::internal::LogFinisher::operator=((int)&v5, (const char **)&v4->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v6[0].__r_.__value_.__l.__data_);
    }
  }
}

{
  google::protobuf::io::FileOutputStream::CopyingFileOutputStream::~CopyingFileOutputStream(this);
  JUMPOUT(0x249596C64);
}

BOOL google::protobuf::io::FileOutputStream::CopyingFileOutputStream::Write(google::protobuf::io::FileOutputStream::CopyingFileOutputStream *this, char *a2, int a3)
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
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 210);
    v6 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: !is_closed_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v6->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
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

void sub_2480270EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *google::protobuf::io::IstreamInputStream::IstreamInputStream(_QWORD *a1, uint64_t a2, int a3)
{
  *a1 = &off_25197D498;
  a1[1] = &off_25197D4D8;
  a1[2] = a2;
  google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor((uint64_t)(a1 + 3), (uint64_t)(a1 + 1), a3);
  return a1;
}

_QWORD *google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::CopyingIstreamInputStream(_QWORD *result, uint64_t a2)
{
  *result = &off_25197D4D8;
  result[1] = a2;
  return result;
}

uint64_t google::protobuf::io::IstreamInputStream::Next(google::protobuf::io::IstreamInputStream *this, const void **a2, int *a3)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Next((google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2, a3);
}

void google::protobuf::io::IstreamInputStream::BackUp(google::protobuf::io::IstreamInputStream *this, int a2)
{
  google::protobuf::io::CopyingInputStreamAdaptor::BackUp((google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2);
}

BOOL google::protobuf::io::IstreamInputStream::Skip(google::protobuf::io::IstreamInputStream *this, int a2)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::Skip((google::protobuf::io::IstreamInputStream *)((char *)this + 24), a2);
}

uint64_t google::protobuf::io::IstreamInputStream::ByteCount(google::protobuf::io::IstreamInputStream *this)
{
  return google::protobuf::io::CopyingInputStreamAdaptor::ByteCount((google::protobuf::io::IstreamInputStream *)((char *)this + 24));
}

void google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::~CopyingIstreamInputStream(google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this)
{
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream::Read(google::protobuf::io::IstreamInputStream::CopyingIstreamInputStream *this, void *a2)
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

_QWORD *google::protobuf::io::OstreamOutputStream::OstreamOutputStream(_QWORD *a1, uint64_t a2, int a3)
{
  *a1 = &off_25197D508;
  a1[1] = &off_25197D550;
  a1[2] = a2;
  google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor((uint64_t)(a1 + 3), (uint64_t)(a1 + 1), a3);
  return a1;
}

_QWORD *google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::CopyingOstreamOutputStream(_QWORD *result, uint64_t a2)
{
  *result = &off_25197D550;
  result[1] = a2;
  return result;
}

void google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(google::protobuf::io::OstreamOutputStream *this)
{
  google::protobuf::io::CopyingOutputStreamAdaptor *v1;

  *(_QWORD *)this = &off_25197D508;
  v1 = (google::protobuf::io::OstreamOutputStream *)((char *)this + 24);
  google::protobuf::io::CopyingOutputStreamAdaptor::Flush((google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
  google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(v1);
}

{
  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream(this);
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::OstreamOutputStream::Next(google::protobuf::io::OstreamOutputStream *this, void **a2, int *a3)
{
  return google::protobuf::io::CopyingOutputStreamAdaptor::Next((google::protobuf::io::OstreamOutputStream *)((char *)this + 24), a2, a3);
}

void google::protobuf::io::OstreamOutputStream::BackUp(google::protobuf::io::OstreamOutputStream *this, int a2)
{
  google::protobuf::io::CopyingOutputStreamAdaptor::BackUp((google::protobuf::io::OstreamOutputStream *)((char *)this + 24), a2);
}

uint64_t google::protobuf::io::OstreamOutputStream::ByteCount(google::protobuf::io::OstreamOutputStream *this)
{
  return google::protobuf::io::CopyingOutputStreamAdaptor::ByteCount((google::protobuf::io::OstreamOutputStream *)((char *)this + 24));
}

void google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::~CopyingOstreamOutputStream(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this)
{
  JUMPOUT(0x249596C64);
}

BOOL google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream::Write(google::protobuf::io::OstreamOutputStream::CopyingOstreamOutputStream *this, const void *a2)
{
  std::ostream::write();
  return *(_DWORD *)(*((_QWORD *)this + 1) + *(_QWORD *)(**((_QWORD **)this + 1) - 24) + 32) == 0;
}

uint64_t google::protobuf::io::ConcatenatingInputStream::ConcatenatingInputStream(uint64_t result, uint64_t a2, int a3)
{
  *(_QWORD *)result = &off_25197D578;
  *(_QWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t google::protobuf::io::ConcatenatingInputStream::Next(google::protobuf::io::ConcatenatingInputStream *this, const void **a2, int *a3)
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

void google::protobuf::io::ConcatenatingInputStream::BackUp(google::protobuf::io::ConcatenatingInputStream *this)
{
  std::string *v1;
  char v2;
  std::string v3[2];

  if (*((int *)this + 4) < 1)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v3, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 327);
    v1 = google::protobuf::internal::LogMessage::operator<<(v3, "Can't BackUp() after failed Next().");
    google::protobuf::internal::LogFinisher::operator=((int)&v2, (const char **)&v1->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v3[0].__r_.__value_.__l.__data_);
  }
  else
  {
    (*(void (**)(_QWORD))(***((_QWORD ***)this + 1) + 24))(**((_QWORD **)this + 1));
  }
}

void sub_248027478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ConcatenatingInputStream::Skip(google::protobuf::io::ConcatenatingInputStream *this, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::string *v9;
  int v10;
  BOOL v11;
  char v13;
  std::string v14[2];

  if (*((int *)this + 4) < 1)
    return 0;
  v4 = (_QWORD *)*((_QWORD *)this + 1);
  do
  {
    v5 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v4 + 40))(*v4);
    v6 = (*(uint64_t (**)(_QWORD, uint64_t))(***((_QWORD ***)this + 1) + 32))(**((_QWORD **)this + 1), a2);
    if ((v6 & 1) != 0)
      break;
    v7 = v5 + (int)a2;
    v8 = (*(uint64_t (**)(_QWORD))(***((_QWORD ***)this + 1) + 40))(**((_QWORD **)this + 1));
    if (v7 <= v8)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v14, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream_impl.cc", 341);
      v9 = google::protobuf::internal::LogMessage::operator<<(v14, "CHECK failed: (final_byte_count) < (target_byte_count): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v13, (const char **)&v9->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v14[0].__r_.__value_.__l.__data_);
    }
    a2 = (v7 - v8);
    *((_QWORD *)this + 3) += v8;
    v4 = (_QWORD *)(*((_QWORD *)this + 1) + 8);
    *((_QWORD *)this + 1) = v4;
    v10 = *((_DWORD *)this + 4);
    v11 = __OFSUB__(v10--, 1);
    *((_DWORD *)this + 4) = v10;
  }
  while (!((v10 < 0) ^ v11 | (v10 == 0)));
  return v6;
}

void sub_2480275AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::io::ConcatenatingInputStream::ByteCount(google::protobuf::io::ConcatenatingInputStream *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 3);
  if (*((_DWORD *)this + 4))
    v1 += (*(uint64_t (**)(_QWORD))(***((_QWORD ***)this + 1) + 40))(**((_QWORD **)this + 1));
  return v1;
}

void google::protobuf::io::FileInputStream::~FileInputStream(google::protobuf::io::FileInputStream *this)
{
  google::protobuf::io::FileInputStream::CopyingFileInputStream *v1;

  *(_QWORD *)this = &off_25197D3B8;
  v1 = (google::protobuf::io::FileInputStream *)((char *)this + 8);
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::FileInputStream *)((char *)this + 32));
  google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v1);
}

{
  google::protobuf::io::FileInputStream::CopyingFileInputStream *v1;

  *(_QWORD *)this = &off_25197D3B8;
  v1 = (google::protobuf::io::FileInputStream *)((char *)this + 8);
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::FileInputStream *)((char *)this + 32));
  google::protobuf::io::FileInputStream::CopyingFileInputStream::~CopyingFileInputStream(v1);
  JUMPOUT(0x249596C64);
}

void google::protobuf::io::IstreamInputStream::~IstreamInputStream(google::protobuf::io::IstreamInputStream *this)
{
  *(_QWORD *)this = &off_25197D498;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::IstreamInputStream *)((char *)this + 24));
}

{
  *(_QWORD *)this = &off_25197D498;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::IstreamInputStream *)((char *)this + 24));
  JUMPOUT(0x249596C64);
}

void google::protobuf::io::ConcatenatingInputStream::~ConcatenatingInputStream(google::protobuf::io::ConcatenatingInputStream *this)
{
  JUMPOUT(0x249596C64);
}

uint64_t google::protobuf::io::ZeroCopyOutputStream::WriteAliasedRaw(google::protobuf::io::ZeroCopyOutputStream *this, const void *a2)
{
  std::string *v2;
  char v4;
  std::string v5[2];

  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/zero_copy_stream.cc", 47);
  v2 = google::protobuf::internal::LogMessage::operator<<(v5, "This ZeroCopyOutputStream doesn't support aliasing. Reaching here usually means a ZeroCopyOutputStream implementation bug.");
  google::protobuf::internal::LogFinisher::operator=((int)&v4, (const char **)&v2->__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
  return 0;
}

void sub_24802777C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void TGITextGenerationInferenceUtils::spanForVector<int>()
{
  __assert_rtn("spanForVector", "TGITextGenerationInferenceUtils.hpp", 102, "*expectedSize <= vec.size()");
}

void TGITextGenerationInferenceModel::createWithConfiguration(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_247FAC000, a2, OS_LOG_TYPE_ERROR, "Failed to create text generator model: %s", (uint8_t *)&v4, 0xCu);
}

void TGITextGenerationInferenceUtils::sliceAtIndex<unsigned char>()
{
  __assert_rtn("sliceAtIndex", "TGITextGenerationInferenceUtils.hpp", 114, "index < nSlices");
}

{
  __assert_rtn("sliceAtIndex", "TGITextGenerationInferenceUtils.hpp", 113, "size > 0 && nSlices > 0 && size % nSlices == 0");
}

void TGITextGenerationInferenceModel::setModelStepStateForIndex()
{
  __assert_rtn("setModelStepStateForIndex", "TGITextGenerationInferenceModel.cpp", 231, "isSpanEqualToVector(Span<TGDTokenIDType>(modelStepState.m_tokenIDs.Data(), lastTokenIndex), m_tokenIDs)");
}

{
  __assert_rtn("setModelStepStateForIndex", "TGITextGenerationInferenceModel.cpp", 227, "numTokens < maxStateLength");
}

void TGITextGenerationInferenceModel::run()
{
  __assert_rtn("run", "TGITextGenerationInferenceModel.cpp", 260, "numTokens < maxStateLength");
}

void _ZN31TGITextGenerationInferenceUtils4fillIDF16_EEvN4E5RT4SpanIT_Lm18446744073709551615EEERKS3_mmNSt3__18optionalImEE_cold_1()
{
  __assert_rtn("fill", "TGITextGenerationInferenceUtils.hpp", 27, "beginSlice < *endSlice");
}

void _ZN31TGITextGenerationInferenceUtils4fillIDF16_EEvN4E5RT4SpanIT_Lm18446744073709551615EEERKS3_mmNSt3__18optionalImEE_cold_2()
{
  __assert_rtn("fill", "TGITextGenerationInferenceUtils.hpp", 26, "*endSlice <= nSlices");
}

void TGITextGenerationInferenceUtils::spanForVector<unsigned char>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0("spanForVector", "TGITextGenerationInferenceUtils.hpp", a3, "*expectedSize <= vec.size()");
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x24BE2F420](this);
}

uint64_t E5RT::TensorDataType::TensorDataType()
{
  return MEMORY[0x24BE2F478]();
}

{
  return MEMORY[0x24BE2F480]();
}

void E5RT::TensorDataType::~TensorDataType(E5RT::TensorDataType *this)
{
  MEMORY[0x24BE2F488](this);
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x24BE2F498]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x24BE2F4A8](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x24BE2F4B0](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPortRef()
{
  return MEMORY[0x24BE2F538]();
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPortRef()
{
  return MEMORY[0x24BE2F540]();
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x24BE2F558]();
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x24BE2F5B8]();
}

uint64_t E5RT::operator!=()
{
  return MEMORY[0x24BE2F5C8]();
}

uint64_t E5RT::TensorDescriptor::AllocateMemory()
{
  return MEMORY[0x24BE2F628]();
}

uint64_t E5RT::TensorDescriptor::GetNumElements(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x24BE2F630](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x24BE2F638](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorDataTypeRef(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x24BE2F650](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x24BE2F668](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x24BE2F6A8](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x24BE2F6B0](this);
}

uint64_t E5RT::IOPort::GetPortDescriptorRef(E5RT::IOPort *this)
{
  return MEMORY[0x24BE2F6D0](this);
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x24BEDA9A8](this, __s, __pos, __n);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA00](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA10](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x24BEDAC10](this, __n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC48](this, __str, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC60](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC90](this, __pos, __n, __c);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
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

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE90]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
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
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF80]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x24BEDAFD8](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x24BEDAFE0](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x24BEDAFE8](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
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
  return off_25197AB18();
}

void operator delete(void *__p)
{
  off_25197AB20(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_25197AB28(__p, a2);
}

uint64_t operator delete()
{
  return off_25197AB30();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_25197AB38(__sz);
}

uint64_t operator new[]()
{
  return off_25197AB40();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25197AB48(__sz);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_25197AB50(__sz, a2);
}

uint64_t operator new()
{
  return off_25197AB58();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

long double expm1(long double __x)
{
  long double result;

  MEMORY[0x24BDAE290](__x);
  return result;
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
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

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x24BEDD010](dest, src, copyHelper);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x24BDAF248](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFF90](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

float strtof(const char *a1, char **a2)
{
  float result;

  MEMORY[0x24BDAFFE0](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

