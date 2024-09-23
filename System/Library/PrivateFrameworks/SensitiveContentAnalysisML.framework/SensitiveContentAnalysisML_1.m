void sub_245C80170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::AddMessage(google::protobuf::internal::ExtensionSet *this, int a2, int a3, const google::protobuf::MessageLite *a4, const FieldDescriptor *a5)
{
  uint64_t **v9;
  unsigned __int8 *v10;
  char v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  _QWORD *AlignedAndAddCleanup;
  std::string *v16;
  uint64_t v17;
  std::string *v18;
  std::string *v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  std::string v26[2];

  v9 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
  v10 = (unsigned __int8 *)v9;
  v9[2] = (uint64_t *)&a5->MangledTypeName;
  if (v11)
  {
    *((_BYTE *)v9 + 8) = a3;
    if ((a3 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v12 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[a3] != 10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 762);
      v13 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: (cpp_type(extension->type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    v10[9] = 1;
    v14 = *(_QWORD *)this;
    if (*(_QWORD *)this)
    {
      if ((*(_BYTE *)(v14 + 24) & 1) != 0)
      AlignedAndAddCleanup = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v14, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>>);
      AlignedAndAddCleanup[2] = 0;
      *AlignedAndAddCleanup = v14;
    }
    else
    {
      AlignedAndAddCleanup = (_QWORD *)operator new();
      AlignedAndAddCleanup[2] = 0;
      *AlignedAndAddCleanup = 0;
    }
    AlignedAndAddCleanup[1] = 0;
    *(_QWORD *)v10 = AlignedAndAddCleanup;
  }
  else
  {
    if (!*((_BYTE *)v9 + 9))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      v16 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: ((*extension).is_repeated ? REPEATED_FIELD : OPTIONAL_FIELD) == (REPEATED_FIELD): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v16->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    v17 = v10[8];
    if ((v17 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v18 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v18->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
    if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v17] != 10)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 767);
      v19 = google::protobuf::internal::LogMessage::operator<<(v26, "CHECK failed: (cpp_type((*extension).type)) == (WireFormatLite::CPPTYPE_MESSAGE): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v25, (const char **)&v19->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v26[0].__r_.__value_.__l.__data_);
    }
  }
  v20 = *(_QWORD *)v10;
  v21 = *(_DWORD **)(*(_QWORD *)v10 + 16);
  if (!v21
    || (v22 = *(int *)(v20 + 8), (int)v22 >= *v21)
    || (*(_DWORD *)(v20 + 8) = v22 + 1, (v23 = *(_QWORD *)&v21[2 * v22 + 2]) == 0))
  {
    v23 = (*(uint64_t (**)(const google::protobuf::MessageLite *, _QWORD))(*(_QWORD *)a4 + 32))(a4, *(_QWORD *)this);
    google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedInternal<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(*(unsigned int **)v10, v23);
  }
  return v23;
}

void sub_245C80458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::Clear(google::protobuf::internal::ExtensionSet *this)
{
  _QWORD *v1;
  uint64_t v2;
  google::protobuf::internal::ExtensionSet::Extension *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  v1 = (_QWORD *)*((_QWORD *)this + 2);
  if (*((unsigned __int16 *)this + 4) >= 0x101u)
  {
    v6 = (_QWORD *)*v1;
    v4 = v1 + 1;
    v5 = v6;
    if (v6 != v4)
    {
      do
      {
        google::protobuf::internal::ExtensionSet::Extension::Clear((google::protobuf::internal::ExtensionSet::Extension *)(v5 + 5));
        v7 = (_QWORD *)v5[1];
        if (v7)
        {
          do
          {
            v8 = v7;
            v7 = (_QWORD *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (_QWORD *)v5[2];
            v9 = *v8 == (_QWORD)v5;
            v5 = v8;
          }
          while (!v9);
        }
        v5 = v8;
      }
      while (v8 != v4);
    }
  }
  else if (*((_WORD *)this + 5))
  {
    v2 = 32 * *((unsigned __int16 *)this + 5);
    v3 = (google::protobuf::internal::ExtensionSet::Extension *)(v1 + 1);
    do
    {
      google::protobuf::internal::ExtensionSet::Extension::Clear(v3);
      v3 = (google::protobuf::internal::ExtensionSet::Extension *)((char *)v3 + 32);
      v2 -= 32;
    }
    while (v2);
  }
}

void google::protobuf::internal::ExtensionSet::MergeFrom(google::protobuf::internal::ExtensionSet *this, const google::protobuf::internal::ExtensionSet *a2)
{
  unsigned int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  char *v13;
  unint64_t v14;
  int *v15;
  int *v16;
  const google::protobuf::internal::ExtensionSet::Extension *v17;
  int v18;

  if (*((unsigned __int16 *)this + 4) <= 0x100u)
  {
    v4 = *((unsigned __int16 *)a2 + 4);
    v5 = (char *)*((_QWORD *)this + 2);
    v6 = *((unsigned __int16 *)this + 5);
    v7 = &v5[32 * v6];
    v8 = *((_QWORD *)a2 + 2);
    if (v4 > 0x100)
    {
    }
    else
    {
      v9 = *((unsigned __int16 *)a2 + 5);
      v10 = v8 + 32 * v9;
      v12 = (_DWORD)v6 == 0;
      v11 = 0;
      v12 = v12 || (_DWORD)v9 == 0;
      if (!v12)
      {
        do
        {
          if (*(_DWORD *)v5 == *(_DWORD *)v8)
            v13 = v5 + 32;
          else
            v13 = v5;
          if (*(_DWORD *)v5 < *(_DWORD *)v8)
          {
            v5 += 32;
          }
          else
          {
            v8 += 32;
            v5 = v13;
          }
          ++v11;
        }
        while (v5 != v7 && v8 != v10);
      }
      v14 = v11 + ((v10 - v8) >> 5) + ((v7 - v5) >> 5);
    }
    google::protobuf::internal::ExtensionSet::GrowCapacity(this, v14);
  }
  v15 = (int *)*((_QWORD *)a2 + 2);
  if (*((unsigned __int16 *)a2 + 4) >= 0x101u)
  {
    google::protobuf::internal::ExtensionSet::ForEach<std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>,google::protobuf::internal::ExtensionSet::MergeFrom(google::protobuf::internal::ExtensionSet const&)::$_0>(*(_QWORD **)v15, (_QWORD *)v15 + 1, this);
  }
  else if (*((_WORD *)a2 + 5))
  {
    v16 = &v15[8 * *((unsigned __int16 *)a2 + 5)];
    do
    {
      v17 = (const google::protobuf::internal::ExtensionSet::Extension *)(v15 + 2);
      v18 = *v15;
      v15 += 8;
      google::protobuf::internal::ExtensionSet::InternalExtensionMergeFrom(this, v18, v17);
    }
    while (v15 != v16);
  }
}

_QWORD *google::protobuf::internal::ExtensionSet::GrowCapacity(_QWORD *this, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t **v9;
  uint64_t *v10;
  char *v11;
  char *v12;
  __int128 v13;
  BOOL v14;
  int v15;
  __int128 v16;
  uint64_t v17;

  v2 = *((unsigned __int16 *)this + 4);
  if (v2 <= 0x100 && v2 < a2)
  {
    v4 = this;
    do
    {
      if ((_WORD)v2)
        LOWORD(v2) = 4 * v2;
      else
        LOWORD(v2) = 1;
    }
    while ((unsigned __int16)v2 < a2);
    v5 = (char *)this[2];
    v6 = *((unsigned __int16 *)this + 5);
    v7 = *this;
    if ((unsigned __int16)v2 < 0x101u)
    {
      v8 = 32 * (unsigned __int16)v2;
      if (v7)
      {
        if ((*(_BYTE *)(v7 + 24) & 1) != 0)
        {
          v8 = 32 * (unsigned __int16)v2;
        }
        this = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v7, v8);
      }
      else
      {
        this = operator new[](v8);
      }
      v9 = (uint64_t **)this;
      if ((_DWORD)v6)
        this = memmove(this, v5, 32 * v6);
    }
    else
    {
      if (v7)
      {
        if ((*(_BYTE *)(v7 + 24) & 1) != 0)
        this = google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v7, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<std::map<int,google::protobuf::internal::ExtensionSet::Extension>>);
      }
      else
      {
        this = (_QWORD *)operator new();
      }
      v9 = (uint64_t **)this;
      this[1] = 0;
      v10 = this + 1;
      this[2] = 0;
      *this = this + 1;
      if ((_DWORD)v6)
      {
        v11 = &v5[32 * v6];
        v12 = v5;
        do
        {
          v15 = *(_DWORD *)v12;
          v13 = *(_OWORD *)(v12 + 8);
          v17 = *((_QWORD *)v12 + 3);
          v16 = v13;
          this = std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_hint_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(v9, v10, &v15, &v15);
          v10 = this;
          v12 += 32;
        }
        while (v12 != v11);
      }
    }
    if (*v4)
      v14 = 1;
    else
      v14 = v5 == 0;
    if (!v14)
      this = (_QWORD *)MEMORY[0x249544F34](v5, 0x1062C802AB6010CLL);
    *((_WORD *)v4 + 4) = v2;
    v4[2] = v9;
    if ((unsigned __int16)v2 >= 0x101u)
      *((_WORD *)v4 + 5) = 0;
  }
  return this;
}

uint64_t google::protobuf::internal::`anonymous namespace'::SizeOfUnion<google::protobuf::internal::ExtensionSet::KeyValue *,std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>>(char *a1, char *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  int v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;

  v4 = 0;
  if (a1 != a2 && a3 != a4)
  {
    v4 = 0;
    do
    {
      v5 = *((_DWORD *)a3 + 8);
      if (*(_DWORD *)a1 >= v5)
      {
        if (*(_DWORD *)a1 == v5)
        {
          a1 += 32;
          v6 = (_QWORD *)a3[1];
          if (v6)
          {
            do
            {
              a3 = v6;
              v6 = (_QWORD *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              v7 = a3;
              a3 = (_QWORD *)a3[2];
            }
            while ((_QWORD *)*a3 != v7);
          }
        }
        else
        {
          v8 = (_QWORD *)a3[1];
          if (v8)
          {
            do
            {
              a3 = v8;
              v8 = (_QWORD *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              v9 = a3;
              a3 = (_QWORD *)a3[2];
            }
            while ((_QWORD *)*a3 != v9);
          }
        }
      }
      else
      {
        a1 += 32;
      }
      ++v4;
    }
    while (a1 != a2 && a3 != a4);
  }
  if (a3 == a4)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      v11 = (_QWORD *)a3[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (_QWORD *)a3[2];
          v13 = *v12 == (_QWORD)a3;
          a3 = v12;
        }
        while (!v13);
      }
      ++v10;
      a3 = v12;
    }
    while (v12 != a4);
  }
  return v4 + ((a2 - a1) >> 5) + v10;
}

void google::protobuf::internal::ExtensionSet::InternalExtensionMergeFrom(google::protobuf::internal::ExtensionSet *this, int a2, const google::protobuf::internal::ExtensionSet::Extension *a3)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int **v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  std::string *v12;
  std::string *v13;
  std::string *v14;
  std::string *v15;
  uint64_t v16;
  std::string *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t AlignedAndAddCleanup;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int *v33;
  uint64_t v34;
  unsigned int *v35;
  int v36;
  __int128 *v37;
  __int128 v38;
  uint64_t *v39;
  uint64_t **v40;
  uint64_t **v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int *v49;
  _DWORD *v50;
  uint64_t v51;
  uint64_t v52;
  std::string *v53;
  std::string *v54;
  std::string *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  std::string __p;
  char v62;
  std::string v63[2];

  if (*((_BYTE *)a3 + 9))
  {
    v6 = (uint64_t *)*((_QWORD *)a3 + 2);
    v7 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
    v8 = (unsigned int **)v7;
    v7[2] = v6;
    v10 = v9;
    if (v9)
    {
      *((_BYTE *)v7 + 8) = *((_BYTE *)a3 + 8);
      *((_BYTE *)v7 + 11) = *((_BYTE *)a3 + 11);
      *((_BYTE *)v7 + 9) = 1;
    }
    else
    {
      if (*((unsigned __int8 *)v7 + 8) != *((unsigned __int8 *)a3 + 8))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 931);
        v13 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: (extension->type) == (other_extension.type): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
      }
      if (*((unsigned __int8 *)v8 + 11) != *((unsigned __int8 *)a3 + 11))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 932);
        v14 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v14->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
      }
      if (!*((_BYTE *)v8 + 9))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 933);
        v15 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: extension->is_repeated: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v15->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
      }
    }
    v16 = *((unsigned __int8 *)a3 + 8);
    if ((v16 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v17 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v17->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
    }
    switch(v16)
    {
      case 1:
        if (v10)
        {
          v26 = *(_QWORD *)this;
          if (v26)
          {
            if ((*(_BYTE *)(v26 + 24) & 1) != 0)
            AlignedAndAddCleanup = (uint64_t)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v26, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<double>>);
            *(_QWORD *)AlignedAndAddCleanup = 0;
            *(_QWORD *)(AlignedAndAddCleanup + 8) = v26;
          }
          else
          {
            AlignedAndAddCleanup = operator new();
            *(_QWORD *)AlignedAndAddCleanup = 0;
            *(_QWORD *)(AlignedAndAddCleanup + 8) = 0;
          }
          *v8 = (unsigned int *)AlignedAndAddCleanup;
        }
        else
        {
          AlignedAndAddCleanup = (uint64_t)*v8;
        }
        google::protobuf::RepeatedField<double>::MergeFrom((int *)AlignedAndAddCleanup, *(int **)a3);
        break;
      case 2:
        if (v10)
        {
          v28 = *(_QWORD *)this;
          if (v28)
          {
            if ((*(_BYTE *)(v28 + 24) & 1) != 0)
            v29 = (uint64_t)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v28, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<float>>);
            *(_QWORD *)v29 = 0;
            *(_QWORD *)(v29 + 8) = v28;
          }
          else
          {
            v29 = operator new();
            *(_QWORD *)v29 = 0;
            *(_QWORD *)(v29 + 8) = 0;
          }
          *v8 = (unsigned int *)v29;
        }
        else
        {
          v29 = (uint64_t)*v8;
        }
        google::protobuf::RepeatedField<float>::MergeFrom((int *)v29, *(int **)a3);
        break;
      case 3:
      case 16:
      case 18:
        if (v10)
        {
          v20 = *(_QWORD *)this;
          if (v20)
          {
            if ((*(_BYTE *)(v20 + 24) & 1) != 0)
            v21 = (uint64_t)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v20, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<long long>>);
            *(_QWORD *)v21 = 0;
            *(_QWORD *)(v21 + 8) = v20;
          }
          else
          {
            v21 = operator new();
            *(_QWORD *)v21 = 0;
            *(_QWORD *)(v21 + 8) = 0;
          }
          *v8 = (unsigned int *)v21;
        }
        else
        {
          v21 = (uint64_t)*v8;
        }
        google::protobuf::RepeatedField<long long>::MergeFrom((int *)v21, *(int **)a3);
        break;
      case 4:
      case 6:
        if (v10)
        {
          v24 = *(_QWORD *)this;
          if (v24)
          {
            if ((*(_BYTE *)(v24 + 24) & 1) != 0)
            v25 = (uint64_t)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v24, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned long long>>);
            *(_QWORD *)v25 = 0;
            *(_QWORD *)(v25 + 8) = v24;
          }
          else
          {
            v25 = operator new();
            *(_QWORD *)v25 = 0;
            *(_QWORD *)(v25 + 8) = 0;
          }
          *v8 = (unsigned int *)v25;
        }
        else
        {
          v25 = (uint64_t)*v8;
        }
        google::protobuf::RepeatedField<unsigned long long>::MergeFrom((int *)v25, *(int **)a3);
        break;
      case 5:
      case 14:
      case 15:
      case 17:
        if (v10)
        {
          v18 = *(_QWORD *)this;
          if (v18)
          {
            if ((*(_BYTE *)(v18 + 24) & 1) != 0)
            v19 = (uint64_t)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v18, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<int>>);
            *(_QWORD *)v19 = 0;
            *(_QWORD *)(v19 + 8) = v18;
          }
          else
          {
            v19 = operator new();
            *(_QWORD *)v19 = 0;
            *(_QWORD *)(v19 + 8) = 0;
          }
          *v8 = (unsigned int *)v19;
        }
        else
        {
          v19 = (uint64_t)*v8;
        }
        google::protobuf::RepeatedField<int>::MergeFrom((int *)v19, *(int **)a3);
        break;
      case 7:
      case 13:
        if (v10)
        {
          v22 = *(_QWORD *)this;
          if (v22)
          {
            if ((*(_BYTE *)(v22 + 24) & 1) != 0)
            v23 = (uint64_t)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v22, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<unsigned int>>);
            *(_QWORD *)v23 = 0;
            *(_QWORD *)(v23 + 8) = v22;
          }
          else
          {
            v23 = operator new();
            *(_QWORD *)v23 = 0;
            *(_QWORD *)(v23 + 8) = 0;
          }
          *v8 = (unsigned int *)v23;
        }
        else
        {
          v23 = (uint64_t)*v8;
        }
        google::protobuf::RepeatedField<unsigned int>::MergeFrom((int *)v23, *(int **)a3);
        break;
      case 8:
        if (v10)
        {
          v30 = *(_QWORD *)this;
          if (v30)
          {
            if ((*(_BYTE *)(v30 + 24) & 1) != 0)
            v31 = (uint64_t)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v30, (google::protobuf::internal::SerialArena::Block *)0x10, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedField<BOOL>>);
            *(_QWORD *)v31 = 0;
            *(_QWORD *)(v31 + 8) = v30;
          }
          else
          {
            v31 = operator new();
            *(_QWORD *)v31 = 0;
            *(_QWORD *)(v31 + 8) = 0;
          }
          *v8 = (unsigned int *)v31;
        }
        else
        {
          v31 = (uint64_t)*v8;
        }
        google::protobuf::RepeatedField<BOOL>::MergeFrom((int *)v31, *(int **)a3);
        break;
      case 9:
      case 12:
        if (v10)
        {
          v32 = *(_QWORD *)this;
          if (v32)
          {
            if ((*(_BYTE *)(v32 + 24) & 1) != 0)
            v33 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v32, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<std::string>>);
            *((_QWORD *)v33 + 2) = 0;
            *(_QWORD *)v33 = v32;
          }
          else
          {
            v33 = (unsigned int *)operator new();
            *((_QWORD *)v33 + 2) = 0;
            *(_QWORD *)v33 = 0;
          }
          *((_QWORD *)v33 + 1) = 0;
          *v8 = v33;
        }
        else
        {
          v33 = *v8;
        }
        google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)v33, *(_QWORD *)a3);
        break;
      case 10:
      case 11:
        if (v10)
        {
          v34 = *(_QWORD *)this;
          if (*(_QWORD *)this)
          {
            if ((*(_BYTE *)(v34 + 24) & 1) != 0)
            v35 = (unsigned int *)google::protobuf::internal::ArenaImpl::AllocateAlignedAndAddCleanup((google::protobuf::internal::ArenaImpl *)v34, (google::protobuf::internal::SerialArena::Block *)0x18, (void (*)(void *))google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>>);
            *((_QWORD *)v35 + 2) = 0;
            *(_QWORD *)v35 = v34;
          }
          else
          {
            v35 = (unsigned int *)operator new();
            *((_QWORD *)v35 + 2) = 0;
            *(_QWORD *)v35 = 0;
          }
          *((_QWORD *)v35 + 1) = 0;
          *v8 = v35;
        }
        v45 = *(_QWORD *)a3;
        if (*(int *)(v45 + 8) >= 1)
        {
          v46 = 0;
          do
          {
            v47 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v45, v46);
            v48 = v47;
            v49 = *v8;
            v50 = (_DWORD *)*((_QWORD *)*v8 + 2);
            if (!v50
              || (v51 = (int)v49[2], (int)v51 >= *v50)
              || (v49[2] = v51 + 1, (v52 = *(_QWORD *)&v50[2 * v51 + 2]) == 0))
            {
              v52 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v47 + 32))(v47, *(_QWORD *)this);
              google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedInternal<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(*v8, v52);
            }
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v52 + 64))(v52, v48);
            ++v46;
          }
          while (v46 < *(_DWORD *)(v45 + 8));
        }
        break;
      default:
        return;
    }
    return;
  }
  if ((*((_BYTE *)a3 + 10) & 1) != 0)
    return;
  v11 = *((unsigned __int8 *)a3 + 8);
  if ((v11 - 19) <= 0xFFFFFFED)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    v12 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v12->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
  }
  switch(v11)
  {
    case 1:
      google::protobuf::internal::ExtensionSet::SetDouble(this, a2, *((unsigned __int8 *)a3 + 8), *(double *)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    case 2:
      google::protobuf::internal::ExtensionSet::SetFloat(this, a2, *((unsigned __int8 *)a3 + 8), *(float *)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    case 3:
    case 16:
    case 18:
      google::protobuf::internal::ExtensionSet::SetInt64(this, a2, *((unsigned __int8 *)a3 + 8), *(uint64_t **)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    case 4:
    case 6:
      google::protobuf::internal::ExtensionSet::SetUInt64(this, a2, *((unsigned __int8 *)a3 + 8), *(uint64_t **)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    case 5:
    case 15:
    case 17:
      google::protobuf::internal::ExtensionSet::SetInt32(this, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    case 7:
    case 13:
      google::protobuf::internal::ExtensionSet::SetUInt32(this, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    case 8:
      google::protobuf::internal::ExtensionSet::SetBool(this, a2, *((unsigned __int8 *)a3 + 8), *(_BYTE *)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    case 9:
    case 12:
      v36 = *((unsigned __int8 *)a3 + 8);
      v37 = *(__int128 **)a3;
      if (*(char *)(*(_QWORD *)a3 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v37, *((_QWORD *)v37 + 1));
      }
      else
      {
        v38 = *v37;
        __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v37 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v38;
      }
      google::protobuf::internal::ExtensionSet::SetString(this, a2, v36, (__n128 *)&__p, *((FieldDescriptor **)a3 + 2));
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      return;
    case 10:
    case 11:
      v39 = (uint64_t *)*((_QWORD *)a3 + 2);
      v40 = google::protobuf::internal::ExtensionSet::Insert(this, a2);
      v41 = v40;
      v40[2] = v39;
      if (v42)
      {
        *((_BYTE *)v40 + 8) = *((_BYTE *)a3 + 8);
        *((_BYTE *)v40 + 11) = *((_BYTE *)a3 + 11);
        *((_BYTE *)v40 + 9) = 0;
        v43 = *((_BYTE *)v40 + 10) & 0xF;
        if ((*((_BYTE *)a3 + 10) & 0x10) != 0)
        {
          *((_BYTE *)v40 + 10) = v43 | 0x10;
          v59 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)a3 + 16))(*(_QWORD *)a3, *(_QWORD *)this);
          *v41 = (uint64_t *)v59;
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v59 + 104))(v59, *(_QWORD *)a3);
          goto LABEL_135;
        }
        *((_BYTE *)v40 + 10) = v43;
        v44 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)a3 + 32))(*(_QWORD *)a3, *(_QWORD *)this);
        *v41 = (uint64_t *)v44;
        goto LABEL_133;
      }
      if (*((unsigned __int8 *)v40 + 8) != *((unsigned __int8 *)a3 + 8))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1026);
        v53 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: (extension->type) == (other_extension.type): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v53->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
      }
      if (*((unsigned __int8 *)v41 + 11) != *((unsigned __int8 *)a3 + 11))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1027);
        v54 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: (extension->is_packed) == (other_extension.is_packed): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v54->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
      }
      if (*((_BYTE *)v41 + 9))
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v63, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1028);
        v55 = google::protobuf::internal::LogMessage::operator<<(v63, "CHECK failed: !extension->is_repeated: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v62, (const char **)&v55->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v63[0].__r_.__value_.__l.__data_);
      }
      v56 = *v41;
      v57 = *(_QWORD *)a3;
      if ((*((_BYTE *)a3 + 10) & 0x10) == 0)
      {
        v58 = *v56;
        if ((*((_BYTE *)v41 + 10) & 0x10) == 0)
        {
          (*(void (**)(uint64_t *, uint64_t))(v58 + 64))(v56, v57);
          goto LABEL_135;
        }
        v44 = (*(uint64_t (**)(uint64_t *, uint64_t))(v58 + 32))(*v41, v57);
LABEL_133:
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v44 + 64))(v44, *(_QWORD *)a3);
        goto LABEL_135;
      }
      if ((*((_BYTE *)v41 + 10) & 0x10) != 0)
      {
        (*(void (**)(uint64_t *, uint64_t))(*v56 + 104))(v56, v57);
      }
      else
      {
        v60 = (*(uint64_t (**)(_QWORD, uint64_t *))(*(_QWORD *)v57 + 24))(*(_QWORD *)a3, *v41);
        (*(void (**)(uint64_t *, uint64_t))(*v56 + 64))(v56, v60);
      }
LABEL_135:
      *((_BYTE *)v41 + 10) &= 0xF0u;
      return;
    case 14:
      google::protobuf::internal::ExtensionSet::SetEnum(this, a2, *((unsigned __int8 *)a3 + 8), *(_DWORD *)a3, *((const FieldDescriptor **)a3 + 2));
      return;
    default:
      return;
  }
}

void sub_245C81434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16)
{
  google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

__n128 google::protobuf::internal::ExtensionSet::SetString(google::protobuf::internal::ExtensionSet *a1, int a2, int a3, __n128 *a4, FieldDescriptor *a5)
{
  uint64_t v6;
  __n128 *v7;
  __n128 result;

  v6 = google::protobuf::internal::ExtensionSet::MutableString(a1, a2, a3, a5);
  v7 = (__n128 *)v6;
  if (*(char *)(v6 + 23) < 0)
    operator delete(*(void **)v6);
  result = *a4;
  v7[1].n128_u64[0] = a4[1].n128_u64[0];
  *v7 = result;
  a4[1].n128_u8[7] = 0;
  a4->n128_u8[0] = 0;
  return result;
}

void google::protobuf::internal::ExtensionSet::Swap(google::protobuf::internal::ExtensionSet *this, google::protobuf::internal::ExtensionSet *a2)
{
  __int16 v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  if (*(_QWORD *)this == *(_QWORD *)a2)
  {
    v4 = *((_WORD *)this + 4);
    *((_WORD *)this + 4) = *((_WORD *)a2 + 4);
    *((_WORD *)a2 + 4) = v4;
    v5 = *((_WORD *)this + 5);
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((_WORD *)a2 + 5) = v5;
    v6 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a2 + 2) = v6;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    google::protobuf::internal::ExtensionSet::MergeFrom((google::protobuf::internal::ExtensionSet *)&v7, a2);
    google::protobuf::internal::ExtensionSet::Clear(a2);
    google::protobuf::internal::ExtensionSet::MergeFrom(a2, this);
    google::protobuf::internal::ExtensionSet::Clear(this);
    google::protobuf::internal::ExtensionSet::MergeFrom(this, (const google::protobuf::internal::ExtensionSet *)&v7);
    google::protobuf::internal::ExtensionSet::~ExtensionSet((google::protobuf::internal::ExtensionSet *)&v7);
  }
}

void sub_245C815A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  google::protobuf::internal::ExtensionSet::~ExtensionSet((google::protobuf::internal::ExtensionSet *)va);
  _Unwind_Resume(a1);
}

uint64_t **google::protobuf::internal::ExtensionSet::Insert(google::protobuf::internal::ExtensionSet *this, int a2)
{
  unsigned int v3;
  uint64_t **v4;
  uint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t **v11;
  int v12;
  uint64_t **result;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *((unsigned __int16 *)this + 4);
  v4 = (uint64_t **)*((_QWORD *)this + 2);
  if (v3 >= 0x101)
  {
    *((_QWORD *)&v14 + 1) = 0;
    v15 = 0;
    v16 = 0;
    LODWORD(v14) = a2;
    return std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(v4, (int *)&v14, &v14)+ 5;
  }
  v6 = *((unsigned __int16 *)this + 5);
  v7 = &v4[4 * v6];
  if (!*((_WORD *)this + 5))
  {
    if (!*((_WORD *)this + 4))
      goto LABEL_18;
    LOWORD(v6) = 0;
LABEL_17:
    *((_WORD *)this + 5) = v6 + 1;
    *(_DWORD *)v7 = a2;
    v7[1] = 0;
    result = v7 + 1;
    v7[2] = 0;
    v7[3] = 0;
    return result;
  }
  v8 = *((unsigned __int16 *)this + 5);
  do
  {
    v9 = v8 >> 1;
    v10 = &v4[4 * (v8 >> 1)];
    v12 = *(_DWORD *)v10;
    v11 = v10 + 4;
    v8 += ~(v8 >> 1);
    if (v12 < a2)
      v4 = v11;
    else
      v8 = v9;
  }
  while (v8);
  if (v4 != v7)
  {
    if (*(_DWORD *)v4 == a2)
      return v4 + 1;
    if (v6 < v3)
    {
      memmove(v4 + 4, v4, (char *)v7 - (char *)v4);
      LOWORD(v6) = *((_WORD *)this + 5);
      v7 = v4;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v6 < v3)
    goto LABEL_17;
LABEL_18:
  google::protobuf::internal::ExtensionSet::GrowCapacity(this, v6 + 1);
  return (uint64_t **)google::protobuf::internal::ExtensionSet::Insert(this, a2);
}

uint64_t google::protobuf::internal::ExtensionSet::IsInitialized(google::protobuf::internal::ExtensionSet *this)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t IsInitialized;
  google::protobuf::internal::ExtensionSet::Extension *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;

  v1 = (_QWORD *)*((_QWORD *)this + 2);
  if (*((unsigned __int16 *)this + 4) >= 0x101u)
  {
    v8 = (_QWORD *)*v1;
    v7 = v1 + 1;
    v6 = v8;
    if (v8 == v7)
    {
      return 1;
    }
    else
    {
      do
      {
        IsInitialized = google::protobuf::internal::ExtensionSet::Extension::IsInitialized((google::protobuf::internal::ExtensionSet::Extension *)(v6 + 5));
        if (!(_DWORD)IsInitialized)
          break;
        v9 = (_QWORD *)v6[1];
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = (_QWORD *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (_QWORD *)v6[2];
            v11 = *v10 == (_QWORD)v6;
            v6 = v10;
          }
          while (!v11);
        }
        v6 = v10;
      }
      while (v10 != v7);
    }
  }
  else
  {
    while (1)
    {
      v3 = *((_QWORD *)this + 2) + 32 * *((unsigned __int16 *)this + 5);
      IsInitialized = v1 == (_QWORD *)v3;
      if (v1 == (_QWORD *)v3)
        break;
      v5 = (google::protobuf::internal::ExtensionSet::Extension *)(v1 + 1);
      if (!google::protobuf::internal::ExtensionSet::Extension::IsInitialized(v5))
        break;
      v1 = (_QWORD *)((char *)v5 + 24);
      if (*((unsigned __int16 *)this + 4) > 0x100u)
        google::protobuf::internal::ExtensionSet::IsInitialized();
    }
  }
  return IsInitialized;
}

uint64_t google::protobuf::internal::ExtensionSet::Extension::IsInitialized(google::protobuf::internal::ExtensionSet::Extension *this)
{
  uint64_t v2;
  std::string *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  std::string v10[2];

  v2 = *((unsigned __int8 *)this + 8);
  if ((v2 - 19) <= 0xFFFFFFED)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    v3 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v3->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
  }
  if (google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v2] != 10)
    return 1;
  if (*((_BYTE *)this + 9))
  {
    v4 = *(_QWORD *)this;
    if (*(int *)(*(_QWORD *)this + 8) >= 1)
    {
      v5 = 0;
      while (1)
      {
        v6 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v4, v5);
        if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6) & 1) == 0)
          break;
        ++v5;
        v4 = *(_QWORD *)this;
        if (v5 >= *(_DWORD *)(*(_QWORD *)this + 8))
          return 1;
      }
      return 0;
    }
    return 1;
  }
  if ((*((_BYTE *)this + 10) & 1) != 0)
    return 1;
  v7 = **(_QWORD **)this;
  if ((*((_BYTE *)this + 10) & 0x10) != 0)
    return ((*(uint64_t (**)(void))(v7 + 72))() & 1) != 0;
  result = (*(uint64_t (**)(void))(v7 + 48))();
  if ((_DWORD)result)
    return 1;
  return result;
}

void sub_245C818D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::FindExtensionInfoFromFieldNumber(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, _BYTE *a6)
{
  uint64_t result;
  uint64_t v10;
  std::string *v11;
  unsigned int v12;
  std::string *v13;
  char v14;
  std::string v15[2];

  result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(*(_QWORD *)a4 + 16))(a4, a3, a5);
  if ((_DWORD)result)
  {
    v10 = *a5;
    if ((v10 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
    }
    v12 = google::protobuf::internal::WireFormatLite::kWireTypeForFieldType[v10];
    *a6 = 0;
    if (a2 == 2 && a5[1])
    {
      if (v12 > 5)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 82);
        v13 = google::protobuf::internal::LogMessage::operator<<(v15, "can't reach here.");
        google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
      }
      else
      {
        result = 1;
        if (((1 << v12) & 0x1C) == 0)
        {
          *a6 = 1;
          return result;
        }
      }
    }
    return v12 == a2;
  }
  return result;
}

void sub_245C81A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ExtensionSet::ParseField(google::protobuf::internal::ExtensionSet *a1, unint64_t a2, google::protobuf::internal *a3, uint64_t a4, uint64_t *a5, int32x2_t *a6)
{
  unsigned int v9;
  unint64_t v11;
  std::string *v13;
  unsigned __int8 v14[39];
  unsigned __int8 v15;
  _QWORD v16[2];

  v9 = a2;
  v16[0] = &off_2516E35F8;
  v16[1] = a4;
  v11 = a2 >> 3;
  v15 = 0;
  if ((google::protobuf::internal::ExtensionSet::FindExtensionInfoFromFieldNumber((uint64_t)a1, a2 & 7, a2 >> 3, (uint64_t)v16, v14, &v15) & 1) != 0)return (unsigned __int8 *)google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo<std::string>(a1, v11, v15, (uint64_t)v14, a5, a3, a6);
  if ((*a5 & 1) != 0)
    v13 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
  else
    v13 = (std::string *)google::protobuf::internal::InternalMetadata::mutable_unknown_fields_slow<std::string>(a5);
  return google::protobuf::internal::UnknownFieldParse(v9, v13, a3, (google::protobuf::internal::ParseContext *)a6);
}

google::protobuf::internal *google::protobuf::internal::ExtensionSet::ParseFieldWithExtensionInfo<std::string>(google::protobuf::internal::ExtensionSet *this, int a2, int a3, uint64_t a4, uint64_t *a5, google::protobuf::internal *a6, int32x2_t *a7)
{
  google::protobuf::internal *v8;
  int v11;
  google::protobuf::internal::ExtensionSet *v12;
  std::string *v13;
  const FieldDescriptor *v14;
  uint64_t v15;
  uint64_t *v16;
  google::protobuf::internal::ParseContext *v17;
  google::protobuf::internal *result;
  uint64_t *v19;
  google::protobuf::internal::ParseContext *v20;
  uint64_t *v21;
  google::protobuf::internal::ParseContext *v22;
  uint64_t *v23;
  google::protobuf::internal::ParseContext *v24;
  int v25;
  const google::protobuf::MessageLite *v26;
  const FieldDescriptor *v27;
  google::protobuf::MessageLite *v28;
  int v29;
  int v30;
  const FieldDescriptor *v31;
  int v32;
  unint64_t v33;
  uint64_t *v34;
  google::protobuf::internal::ParseContext *v35;
  uint64_t *v36;
  google::protobuf::internal::ParseContext *v37;
  uint64_t *v38;
  google::protobuf::internal::ParseContext *v39;
  uint64_t *v40;
  google::protobuf::internal::ParseContext *v41;
  uint64_t *v42;
  google::protobuf::internal::ParseContext *v43;
  uint64_t *v44;
  google::protobuf::internal::ParseContext *v45;
  uint64_t *v46;
  google::protobuf::internal::ParseContext *v47;
  uint64_t *v48;
  google::protobuf::internal::ParseContext *v49;
  uint64_t *v50;
  google::protobuf::internal::ParseContext *v51;
  double v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  const FieldDescriptor *v57;
  int v58;
  int v59;
  const FieldDescriptor *v60;
  int v61;
  unint64_t v62;
  const google::protobuf::MessageLite *v63;
  const FieldDescriptor *v64;
  uint64_t v65;
  unint64_t v66;
  int v67;
  const FieldDescriptor *v68;
  int v69;
  unint64_t v70;
  std::string *v71;
  int v72;
  std::string::value_type *v73;
  char *SizeFallback;
  int v75;
  int v76;
  int v77;
  const FieldDescriptor *v78;
  int v79;
  int v80;
  int v81;
  const FieldDescriptor *v82;
  int v83;
  const FieldDescriptor *v84;
  int v85;
  int v86;
  int v87;
  BOOL v88;
  uint64_t v89;
  __int32 v90;
  int v91;
  const FieldDescriptor *v92;
  int v93;
  int v94;
  int v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  std::string *v100;
  char v101;
  std::string v102;
  uint64_t *v103;
  int v104;

  v8 = a6;
  v11 = a2;
  v12 = this;
  if (a3)
  {
    switch(*(_BYTE *)a4)
    {
      case 1:
        v34 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 1, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedDoubleParser((google::protobuf::internal *)v34, v8, (const char *)a7, v35);
        break;
      case 2:
        v36 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 2, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedFloatParser((google::protobuf::internal *)v36, v8, (const char *)a7, v37);
        break;
      case 3:
        v38 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 3, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedInt64Parser((google::protobuf::internal *)v38, v8, (const char *)a7, v39);
        break;
      case 4:
        v40 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 4, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedUInt64Parser((google::protobuf::internal *)v40, v8, (const char *)a7, v41);
        break;
      case 5:
        v16 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 5, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedInt32Parser((google::protobuf::internal *)v16, v8, (const char *)a7, v17);
        break;
      case 6:
        v42 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 6, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedFixed64Parser((google::protobuf::internal *)v42, v8, (const char *)a7, v43);
        break;
      case 7:
        v44 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 7, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedFixed32Parser((google::protobuf::internal *)v44, v8, (const char *)a7, v45);
        break;
      case 8:
        v46 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 8, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedBoolParser((google::protobuf::internal *)v46, v8, (const char *)a7, v47);
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v102, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/extension_set_inl.h", 79);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v102, "Non-primitive types can't be packed.");
        google::protobuf::internal::LogFinisher::operator=((int)&v101, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v102.__r_.__value_.__l.__data_);
        return v8;
      case 0xD:
        v19 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 13, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedUInt32Parser((google::protobuf::internal *)v19, v8, (const char *)a7, v20);
        break;
      case 0xE:
        v102.__r_.__value_.__r.__words[0] = (std::string::size_type)google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 14, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        *(_OWORD *)&v102.__r_.__value_.__r.__words[1] = *(_OWORD *)(a4 + 8);
        v103 = a5;
        v104 = v11;
        return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>((uint64_t)a7, v8, (uint64_t)&v102);
      case 0xF:
        v21 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 15, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedSFixed32Parser((google::protobuf::internal *)v21, v8, (const char *)a7, v22);
        break;
      case 0x10:
        v48 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 16, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedSFixed64Parser((google::protobuf::internal *)v48, v8, (const char *)a7, v49);
        break;
      case 0x11:
        v23 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 17, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedSInt32Parser((google::protobuf::internal *)v23, v8, (const char *)a7, v24);
        break;
      case 0x12:
        v50 = google::protobuf::internal::ExtensionSet::MutableRawRepeatedField(this, a2, 18, *(_BYTE *)(a4 + 2), *(const FieldDescriptor **)(a4 + 24));
        result = (google::protobuf::internal *)google::protobuf::internal::PackedSInt64Parser((google::protobuf::internal *)v50, v8, (const char *)a7, v51);
        break;
      default:
        return v8;
    }
    return result;
  }
  switch(*(_BYTE *)a4)
  {
    case 1:
      v8 = (google::protobuf::internal *)((char *)a6 + 8);
      v52 = *(double *)a6;
      if (*(_BYTE *)(a4 + 1))
        google::protobuf::internal::ExtensionSet::AddDouble(this, a2, 1, *(unsigned __int8 *)(a4 + 2), v52, *(const FieldDescriptor **)(a4 + 24));
      else
        google::protobuf::internal::ExtensionSet::SetDouble(this, a2, 1, v52, *(const FieldDescriptor **)(a4 + 24));
      return v8;
    case 2:
      v8 = (google::protobuf::internal *)((char *)a6 + 4);
      v53 = *(float *)a6;
      if (*(_BYTE *)(a4 + 1))
        google::protobuf::internal::ExtensionSet::AddFloat(this, a2, 2, *(unsigned __int8 *)(a4 + 2), v53, *(const FieldDescriptor **)(a4 + 24));
      else
        google::protobuf::internal::ExtensionSet::SetFloat(this, a2, 2, v53, *(const FieldDescriptor **)(a4 + 24));
      return v8;
    case 3:
      v54 = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v80 = v54 + (*((unsigned __int8 *)a6 + 1) << 7);
        v54 = (v80 - 128);
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v80 - 128));
          if (!v8)
            return v8;
          v54 = v97;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v67 = *(unsigned __int8 *)(a4 + 2);
        v68 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v69 = 3;
        goto LABEL_136;
      }
      v92 = *(const FieldDescriptor **)(a4 + 24);
      this = v12;
      a2 = v11;
      v93 = 3;
      goto LABEL_138;
    case 4:
      v55 = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v81 = v55 + (*((unsigned __int8 *)a6 + 1) << 7);
        v55 = (v81 - 128);
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v81 - 128));
          if (!v8)
            return v8;
          v55 = v98;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v56 = *(unsigned __int8 *)(a4 + 2);
        v57 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v58 = 4;
        goto LABEL_117;
      }
      v82 = *(const FieldDescriptor **)(a4 + 24);
      this = v12;
      a2 = v11;
      v83 = 4;
      goto LABEL_119;
    case 5:
      v25 = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v76 = v25 + (*((unsigned __int8 *)a6 + 1) << 7);
        v25 = v76 - 128;
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v76 - 128));
          if (!v8)
            return v8;
          v25 = v94;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v30 = *(unsigned __int8 *)(a4 + 2);
        v31 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v32 = 5;
        goto LABEL_104;
      }
      v78 = *(const FieldDescriptor **)(a4 + 24);
      this = v12;
      a2 = v11;
      v79 = 5;
      v95 = v25;
      goto LABEL_107;
    case 6:
      v8 = (google::protobuf::internal *)((char *)a6 + 8);
      v55 = *(_QWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v56 = *(unsigned __int8 *)(a4 + 2);
        v57 = *(const FieldDescriptor **)(a4 + 24);
        v58 = 6;
LABEL_117:
        google::protobuf::internal::ExtensionSet::AddUInt64(this, a2, v58, v56, v55, v57);
      }
      else
      {
        v82 = *(const FieldDescriptor **)(a4 + 24);
        v83 = 6;
LABEL_119:
        google::protobuf::internal::ExtensionSet::SetUInt64(this, a2, v83, (uint64_t *)v55, v82);
      }
      return v8;
    case 7:
      v8 = (google::protobuf::internal *)((char *)a6 + 4);
      v29 = *(_DWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v59 = *(unsigned __int8 *)(a4 + 2);
        v60 = *(const FieldDescriptor **)(a4 + 24);
        v61 = 7;
        goto LABEL_98;
      }
      v84 = *(const FieldDescriptor **)(a4 + 24);
      v85 = 7;
      v86 = *(_DWORD *)a6;
      goto LABEL_100;
    case 8:
      v62 = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v62 = v62 + (*((unsigned __int8 *)a6 + 1) << 7) - 128;
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, v62);
          if (!v8)
            return v8;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      if (*(_BYTE *)(a4 + 1))
        google::protobuf::internal::ExtensionSet::AddBool(v12, v11, 8, *(unsigned __int8 *)(a4 + 2), v62 != 0, *(const FieldDescriptor **)(a4 + 24));
      else
        google::protobuf::internal::ExtensionSet::SetBool(v12, v11, 8, v62 != 0, *(const FieldDescriptor **)(a4 + 24));
      return v8;
    case 9:
    case 0xC:
      v14 = *(const FieldDescriptor **)(a4 + 24);
      if (*(_BYTE *)(a4 + 1))
        v15 = (uint64_t)google::protobuf::internal::ExtensionSet::AddString(this, a2, 9, v14);
      else
        v15 = google::protobuf::internal::ExtensionSet::MutableString(this, a2, 9, v14);
      v71 = (std::string *)v15;
      v72 = *(unsigned __int8 *)v8;
      if ((*(char *)v8 & 0x80000000) == 0)
      {
        v73 = (char *)v8 + 1;
        return google::protobuf::internal::EpsCopyInputStream::ReadString((uint64_t)a7, v73, v72, v71);
      }
      SizeFallback = google::protobuf::internal::ReadSizeFallback(v8, (const char *)*(unsigned __int8 *)v8);
      if (SizeFallback)
      {
        v73 = SizeFallback;
        v72 = v75;
        return google::protobuf::internal::EpsCopyInputStream::ReadString((uint64_t)a7, v73, v72, v71);
      }
      return 0;
    case 0xA:
      v63 = *(const google::protobuf::MessageLite **)(a4 + 8);
      v64 = *(const FieldDescriptor **)(a4 + 24);
      if (*(_BYTE *)(a4 + 1))
        v65 = google::protobuf::internal::ExtensionSet::AddMessage(this, a2, 10, v63, v64);
      else
        v65 = (uint64_t)google::protobuf::internal::ExtensionSet::MutableMessage(this, a2, 10, v63, v64);
      v87 = a7[11].i32[0];
      v88 = __OFSUB__(v87--, 1);
      a7[11].i32[0] = v87;
      if (v87 < 0 != v88)
        return 0;
      ++a7[11].i32[1];
      v89 = (*(uint64_t (**)(uint64_t, google::protobuf::internal *, int32x2_t *))(*(_QWORD *)v65 + 88))(v65, v8, a7);
      a7[11] = vadd_s32(a7[11], (int32x2_t)0xFFFFFFFF00000001);
      v90 = a7[10].i32[0];
      a7[10].i32[0] = 0;
      if (v90 == ((8 * v11) | 3))
        return (google::protobuf::internal *)v89;
      else
        return 0;
    case 0xB:
      v26 = *(const google::protobuf::MessageLite **)(a4 + 8);
      v27 = *(const FieldDescriptor **)(a4 + 24);
      if (*(_BYTE *)(a4 + 1))
        v28 = (google::protobuf::MessageLite *)google::protobuf::internal::ExtensionSet::AddMessage(this, a2, 11, v26, v27);
      else
        v28 = (google::protobuf::MessageLite *)google::protobuf::internal::ExtensionSet::MutableMessage(this, a2, 11, v26, v27);
      return (google::protobuf::internal *)google::protobuf::internal::ParseContext::ParseMessage((google::protobuf::internal::ParseContext *)a7, v28, (const char *)v8);
    case 0xD:
      v29 = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v77 = v29 + (*((unsigned __int8 *)a6 + 1) << 7);
        v29 = v77 - 128;
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v77 - 128));
          if (!v8)
            return v8;
          v29 = v96;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      if (*(_BYTE *)(a4 + 1))
      {
        v59 = *(unsigned __int8 *)(a4 + 2);
        v60 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v61 = 13;
LABEL_98:
        google::protobuf::internal::ExtensionSet::AddUInt32(this, a2, v61, v59, v29, v60);
      }
      else
      {
        v84 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v85 = 13;
        v86 = v29;
LABEL_100:
        google::protobuf::internal::ExtensionSet::SetUInt32(this, a2, v85, v86, v84);
      }
      return v8;
    case 0xE:
      v66 = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v91 = v66 + (*((unsigned __int8 *)a6 + 1) << 7);
        v66 = (v91 - 128);
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, (v91 - 128));
          if (!v8)
            return v8;
          v66 = v99;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      if (((*(uint64_t (**)(_QWORD, unint64_t))(a4 + 8))(*(_QWORD *)(a4 + 16), v66) & 1) != 0)
      {
        if (*(_BYTE *)(a4 + 1))
          google::protobuf::internal::ExtensionSet::AddEnum(v12, v11, 14, *(unsigned __int8 *)(a4 + 2), v66, *(const FieldDescriptor **)(a4 + 24));
        else
          google::protobuf::internal::ExtensionSet::SetEnum(v12, v11, 14, v66, *(const FieldDescriptor **)(a4 + 24));
      }
      else
      {
        if ((*a5 & 1) != 0)
          v100 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
        else
          v100 = (std::string *)google::protobuf::internal::InternalMetadata::mutable_unknown_fields_slow<std::string>(a5);
        google::protobuf::internal::WriteVarint(v11, v66, v100);
      }
      return v8;
    case 0xF:
      v8 = (google::protobuf::internal *)((char *)a6 + 4);
      v25 = *(_DWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v30 = *(unsigned __int8 *)(a4 + 2);
        v31 = *(const FieldDescriptor **)(a4 + 24);
        v32 = 15;
        goto LABEL_104;
      }
      v78 = *(const FieldDescriptor **)(a4 + 24);
      v79 = 15;
      goto LABEL_106;
    case 0x10:
      v8 = (google::protobuf::internal *)((char *)a6 + 8);
      v54 = *(_QWORD *)a6;
      if (*(_BYTE *)(a4 + 1))
      {
        v67 = *(unsigned __int8 *)(a4 + 2);
        v68 = *(const FieldDescriptor **)(a4 + 24);
        v69 = 16;
        goto LABEL_136;
      }
      v92 = *(const FieldDescriptor **)(a4 + 24);
      v93 = 16;
      goto LABEL_138;
    case 0x11:
      LODWORD(v33) = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v33 = v33 + (*((unsigned __int8 *)a6 + 1) << 7) - 128;
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, v33);
          if (!v8)
            return v8;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      v25 = -(v33 & 1) ^ (v33 >> 1);
      if (*(_BYTE *)(a4 + 1))
      {
        v30 = *(unsigned __int8 *)(a4 + 2);
        v31 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v32 = 17;
LABEL_104:
        google::protobuf::internal::ExtensionSet::AddInt32(this, a2, v32, v30, v25, v31);
      }
      else
      {
        v78 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v79 = 17;
LABEL_106:
        v95 = v25;
LABEL_107:
        google::protobuf::internal::ExtensionSet::SetInt32(this, a2, v79, v95, v78);
      }
      return v8;
    case 0x12:
      v70 = *(unsigned __int8 *)a6;
      if (*(char *)a6 < 0)
      {
        v70 = v70 + (*((unsigned __int8 *)a6 + 1) << 7) - 128;
        if (*((char *)a6 + 1) < 0)
        {
          v8 = (google::protobuf::internal *)google::protobuf::internal::VarintParseSlow64(a6, v70);
          if (!v8)
            return v8;
        }
        else
        {
          v8 = (google::protobuf::internal *)((char *)a6 + 2);
        }
      }
      else
      {
        v8 = (google::protobuf::internal *)((char *)a6 + 1);
      }
      v54 = -(uint64_t)(v70 & 1) ^ (v70 >> 1);
      if (*(_BYTE *)(a4 + 1))
      {
        v67 = *(unsigned __int8 *)(a4 + 2);
        v68 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v69 = 18;
LABEL_136:
        google::protobuf::internal::ExtensionSet::AddInt64(this, a2, v69, v67, v54, v68);
      }
      else
      {
        v92 = *(const FieldDescriptor **)(a4 + 24);
        this = v12;
        a2 = v11;
        v93 = 18;
LABEL_138:
        google::protobuf::internal::ExtensionSet::SetInt64(this, a2, v93, (uint64_t *)v54, v92);
      }
      return v8;
    default:
      return v8;
  }
}

void sub_245C82648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ExtensionSet::_InternalSerialize(google::protobuf::internal::ExtensionSet *this, signed int a2, int a3, unsigned __int8 *a4, google::protobuf::io::EpsCopyOutputStream *a5)
{
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  signed int v13;
  uint64_t v14;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  int **v19;
  int v20;
  BOOL v21;
  uint64_t *v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int *v25;
  BOOL v26;

  v7 = (unsigned int *)*((_QWORD *)this + 2);
  if (*((unsigned __int16 *)this + 4) >= 0x101u)
  {
    v18 = *((_QWORD *)v7 + 1);
    v17 = v7 + 2;
    v16 = v18;
    if (v18)
    {
      v19 = (int **)v17;
      do
      {
        v20 = *(_DWORD *)(v16 + 32);
        v21 = v20 < a2;
        if (v20 >= a2)
          v22 = (uint64_t *)v16;
        else
          v22 = (uint64_t *)(v16 + 8);
        if (!v21)
          v19 = (int **)v16;
        v16 = *v22;
      }
      while (*v22);
      if (v19 != (int **)v17)
      {
        do
        {
          v23 = *((unsigned int *)v19 + 8);
          if ((int)v23 >= a3)
            break;
          a4 = google::protobuf::internal::ExtensionSet::Extension::InternalSerializeFieldWithCachedSizesToArray(v19 + 5, v23, (char *)a4, a5);
          v24 = (unsigned int *)v19[1];
          if (v24)
          {
            do
            {
              v25 = v24;
              v24 = *(unsigned int **)v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              v25 = (unsigned int *)v19[2];
              v26 = *(_QWORD *)v25 == (_QWORD)v19;
              v19 = (int **)v25;
            }
            while (!v26);
          }
          v19 = (int **)v25;
        }
        while (v25 != v17);
      }
    }
  }
  else
  {
    v8 = *((unsigned __int16 *)this + 5);
    if (*((_WORD *)this + 5))
    {
      v9 = &v7[8 * v8];
      do
      {
        v10 = v8 >> 1;
        v11 = &v7[8 * (v8 >> 1)];
        v13 = *v11;
        v12 = v11 + 8;
        v8 += ~(v8 >> 1);
        if (v13 < a2)
          v7 = v12;
        else
          v8 = v10;
      }
      while (v8);
      while (v7 != v9)
      {
        v14 = *v7;
        if ((int)v14 >= a3)
          break;
        a4 = google::protobuf::internal::ExtensionSet::Extension::InternalSerializeFieldWithCachedSizesToArray((int **)v7 + 1, v14, (char *)a4, a5);
        v7 += 8;
      }
    }
  }
  return a4;
}

unsigned __int8 *google::protobuf::internal::ExtensionSet::Extension::InternalSerializeFieldWithCachedSizesToArray(int **this, uint64_t a2, char *a3, google::protobuf::io::EpsCopyOutputStream *a4)
{
  char *v5;
  unsigned int v8;
  _BYTE *v9;
  int v10;
  std::string *v11;
  int *v12;
  unsigned int v13;
  unsigned int v14;
  int **v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  std::string *v19;
  int *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  char v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  _QWORD *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  std::string *v40;
  std::string *v41;
  int *v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int *v48;
  int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  int *v54;
  int v55;
  int *v56;
  int v57;
  int *v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  int *v63;
  int v64;
  int *v65;
  int v66;
  int *v67;
  int v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int *v73;
  int v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  int *v79;
  int v80;
  int *v81;
  int v82;
  int *v83;
  int v84;
  int *v85;
  int v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  int *v91;
  int v92;
  int *v93;
  int v94;
  uint64_t *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  int *v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  char v105;
  int v106;
  _DWORD *v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  int *v111;
  int v112;
  unsigned int v113;
  char v114;
  unsigned int v115;
  unint64_t v116;
  _BYTE *v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  int *v124;
  int v125;
  unsigned int v126;
  char v127;
  unsigned int v128;
  unint64_t v129;
  _BYTE *v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  int *v137;
  int v138;
  unsigned int v139;
  char v140;
  unsigned int v141;
  unint64_t v142;
  _BYTE *v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  int *v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  char v154;
  unsigned int v155;
  unsigned int v156;
  uint64_t v157;
  _QWORD *v158;
  unsigned int v159;
  unsigned int v160;
  unsigned int v161;
  int *v162;
  int v163;
  unsigned int v164;
  unsigned int v165;
  unsigned int v166;
  char v167;
  int v168;
  _DWORD *v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  int *v173;
  int v174;
  unsigned int v175;
  char v176;
  unsigned int v177;
  char v178;
  _BYTE *v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  uint64_t v183;
  int v184;
  unsigned int v185;
  uint64_t v186;
  unsigned int v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int64_t v191;
  _BYTE *v192;
  unsigned int v193;
  unsigned int v194;
  unsigned int v195;
  char *v196;
  const void *v197;
  uint64_t v198;
  int v199;
  unsigned int v200;
  char v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  char v205;
  uint64_t v206;
  char *v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  char *v211;
  unsigned int v212;
  unsigned int v213;
  unsigned int v214;
  uint64_t v215;
  int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  char v220;
  uint64_t v221;
  uint64_t v222;
  _BYTE *v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  unsigned int v227;
  _BYTE *v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int v231;
  uint64_t v232;
  int v233;
  unsigned int v234;
  uint64_t v235;
  unsigned int v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int64_t v240;
  _BYTE *v241;
  unsigned int v242;
  unsigned int v243;
  unsigned int v244;
  char *v245;
  const void *v246;
  int *v247;
  int v248;
  unsigned int v249;
  char v250;
  unsigned int v251;
  unsigned int v252;
  _BYTE *v253;
  unsigned int v254;
  unsigned int v255;
  unsigned int v256;
  unsigned int v257;
  unsigned int v258;
  unsigned int v259;
  int *v260;
  int v261;
  unsigned int v262;
  char v263;
  unsigned int v264;
  unint64_t v265;
  _BYTE *v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  unint64_t v270;
  unint64_t v271;
  unint64_t v272;
  int *v273;
  int v274;
  unsigned int v275;
  unsigned int v276;
  unsigned int v277;
  char v278;
  int v279;
  _DWORD *v280;
  unsigned int v281;
  unsigned int v282;
  unsigned int v283;
  int *v284;
  int v285;
  unsigned int v286;
  unsigned int v287;
  char v288;
  unsigned int v289;
  unsigned int v290;
  uint64_t v291;
  _QWORD *v292;
  unsigned int v293;
  unsigned int v294;
  unsigned int v295;
  int *v296;
  int v297;
  unsigned int v298;
  char v299;
  unsigned int v300;
  int v301;
  _BYTE *v302;
  unsigned int v303;
  unsigned int v304;
  unsigned int v305;
  unsigned int v306;
  unsigned int v307;
  unsigned int v308;
  unsigned int v309;
  int *v310;
  int v311;
  unsigned int v312;
  char v313;
  unsigned int v314;
  uint64_t v315;
  _BYTE *v316;
  unsigned int v317;
  unsigned int v318;
  unsigned int v319;
  unint64_t v320;
  unint64_t v321;
  unint64_t v322;
  unint64_t v323;
  unsigned int v324;
  unsigned int v325;
  unsigned int v326;
  unsigned int *v327;
  unsigned int v328;
  unsigned int v329;
  unint64_t v330;
  unsigned int v331;
  char *v332;
  unsigned int v333;
  unsigned int v334;
  unsigned int v335;
  unsigned int v336;
  unsigned int v337;
  unsigned int v338;
  int *v339;
  int64_t v340;
  int *v341;
  unsigned int v342;
  unsigned int v343;
  unsigned int v344;
  char *v345;
  int *v346;
  unsigned int v347;
  _BYTE *v348;
  unsigned int v349;
  unsigned int v350;
  int v351;
  unsigned int v352;
  uint64_t v353;
  unsigned int v354;
  unsigned int v355;
  unsigned int v356;
  unsigned int v357;
  unsigned int v358;
  unsigned int v360;
  unsigned int v361;
  unsigned int v362;
  unsigned int v363;
  unsigned int v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  unsigned int v369;
  unsigned int v370;
  _BYTE *v371;
  unsigned int v372;
  unsigned int v373;
  unsigned int v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  unsigned int v379;
  unsigned int v380;
  unsigned int v381;
  unint64_t v382;
  unint64_t v383;
  unint64_t v384;
  unsigned int v385;
  unsigned int v386;
  unint64_t v387;
  unsigned int v388;
  unsigned int v389;
  unint64_t v390;
  unsigned int v391;
  unsigned int v392;
  unsigned int v393;
  unsigned int v394;
  unsigned int v395;
  unsigned int v396;
  unsigned int v397;
  unsigned int v398;
  unsigned int v399;
  unsigned int v400;
  unsigned int v401;
  unsigned int v402;
  unsigned int v403;
  unsigned int v404;
  unsigned int v405;
  unsigned int v406;
  unsigned int v407;
  unsigned int v408;
  unint64_t v409;
  unint64_t v410;
  unsigned int v411;
  unsigned int v412;
  unsigned int v413;
  unint64_t v414;
  unsigned int v415;
  unsigned int v416;
  unint64_t v417;
  unint64_t v418;
  unsigned int v419;
  char *v420;
  unsigned int v421;
  unsigned int v422;
  unsigned int v423;
  _BYTE *v424;
  unsigned int v425;
  unsigned int v426;
  unsigned int v427;
  unsigned int v429;
  unsigned int v430;
  char v431;
  std::string v432[2];

  v5 = a3;
  if (*((_BYTE *)this + 9))
  {
    if (*((_BYTE *)this + 11))
    {
      if (*((_DWORD *)this + 3))
      {
        if (*(_QWORD *)a4 <= (unint64_t)a3)
          v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, a3);
        v8 = (8 * a2) | 2;
        if (v8 > 0x7F)
        {
          *v5 = (8 * a2) | 0x82;
          v32 = (8 * a2) >> 7;
          if (v8 >> 14)
          {
            v9 = v5 + 2;
            do
            {
              *(v9 - 1) = v32 | 0x80;
              v33 = v32 >> 7;
              ++v9;
              v34 = v32 >> 14;
              v32 >>= 7;
            }
            while (v34);
            *(v9 - 1) = v33;
          }
          else
          {
            v5[1] = v32;
            v9 = v5 + 2;
          }
        }
        else
        {
          *v5 = v8;
          v9 = v5 + 1;
        }
        v35 = *((int *)this + 3);
        if (v35 > 0x7F)
        {
          *v9 = v35 | 0x80;
          v36 = v35 >> 7;
          if (v35 >> 14)
          {
            v5 = v9 + 2;
            do
            {
              *(v5 - 1) = v36 | 0x80;
              v37 = v36 >> 7;
              ++v5;
              v38 = v36 >> 14;
              v36 >>= 7;
            }
            while (v38);
            *(v5 - 1) = v37;
          }
          else
          {
            v9[1] = v36;
            v5 = v9 + 2;
          }
        }
        else
        {
          *v9 = v35;
          v5 = v9 + 1;
        }
        v39 = *((unsigned __int8 *)this + 8);
        if ((v39 - 19) <= 0xFFFFFFED)
        {
          google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
          v40 = google::protobuf::internal::LogMessage::operator<<(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
          google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v40->__r_.__value_.__l.__data_);
          google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
        }
        switch(v39)
        {
          case 1:
            v63 = *this;
            if (**this >= 1)
            {
              v64 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v63 = *this;
                }
                *(_QWORD *)v5 = *(_QWORD *)google::protobuf::RepeatedField<double>::Get(v63, v64);
                v5 += 8;
                ++v64;
                v63 = *this;
              }
              while (v64 < **this);
            }
            break;
          case 2:
            v65 = *this;
            if (**this >= 1)
            {
              v66 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v65 = *this;
                }
                *(_DWORD *)v5 = *(_DWORD *)google::protobuf::RepeatedField<float>::Get(v65, v66);
                v5 += 4;
                ++v66;
                v65 = *this;
              }
              while (v66 < **this);
            }
            break;
          case 3:
            v67 = *this;
            if (**this >= 1)
            {
              v68 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v67 = *this;
                }
                v69 = *(_QWORD *)google::protobuf::RepeatedField<long long>::Get(v67, v68);
                if (v69 > 0x7F)
                {
                  *v5 = v69 | 0x80;
                  v70 = v69 >> 7;
                  if (v69 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v70 | 0x80;
                      v71 = v70 >> 7;
                      ++v5;
                      v72 = v70 >> 14;
                      v70 >>= 7;
                    }
                    while (v72);
                    *(v5 - 1) = v71;
                  }
                  else
                  {
                    v5[1] = v70;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v69;
                }
                ++v68;
                v67 = *this;
              }
              while (v68 < **this);
            }
            break;
          case 4:
            v73 = *this;
            if (**this >= 1)
            {
              v74 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v73 = *this;
                }
                v75 = *(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(v73, v74);
                if (v75 > 0x7F)
                {
                  *v5 = v75 | 0x80;
                  v76 = v75 >> 7;
                  if (v75 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v76 | 0x80;
                      v77 = v76 >> 7;
                      ++v5;
                      v78 = v76 >> 14;
                      v76 >>= 7;
                    }
                    while (v78);
                    *(v5 - 1) = v77;
                  }
                  else
                  {
                    v5[1] = v76;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v75;
                }
                ++v74;
                v73 = *this;
              }
              while (v74 < **this);
            }
            break;
          case 5:
            v42 = *this;
            if (**this >= 1)
            {
              v43 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v42 = *this;
                }
                v44 = *(int *)google::protobuf::RepeatedField<int>::Get(v42, v43);
                if (v44 > 0x7F)
                {
                  *v5 = v44 | 0x80;
                  v45 = v44 >> 7;
                  if (v44 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v45 | 0x80;
                      v46 = v45 >> 7;
                      ++v5;
                      v47 = v45 >> 14;
                      v45 >>= 7;
                    }
                    while (v47);
                    *(v5 - 1) = v46;
                  }
                  else
                  {
                    v5[1] = v45;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v44;
                }
                ++v43;
                v42 = *this;
              }
              while (v43 < **this);
            }
            break;
          case 6:
            v79 = *this;
            if (**this >= 1)
            {
              v80 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v79 = *this;
                }
                *(_QWORD *)v5 = *(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(v79, v80);
                v5 += 8;
                ++v80;
                v79 = *this;
              }
              while (v80 < **this);
            }
            break;
          case 7:
            v81 = *this;
            if (**this >= 1)
            {
              v82 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v81 = *this;
                }
                *(_DWORD *)v5 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v81, v82);
                v5 += 4;
                ++v82;
                v81 = *this;
              }
              while (v82 < **this);
            }
            break;
          case 8:
            v83 = *this;
            if (**this >= 1)
            {
              v84 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v83 = *this;
                }
                *v5++ = *(_BYTE *)google::protobuf::RepeatedField<BOOL>::Get(v83, v84++);
                v83 = *this;
              }
              while (v84 < **this);
            }
            break;
          case 9:
          case 10:
          case 11:
          case 12:
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1966);
            v41 = google::protobuf::internal::LogMessage::operator<<(v432, "Non-primitive types can't be packed.");
            google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v41->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
            break;
          case 13:
            v48 = *this;
            if (**this >= 1)
            {
              v49 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v48 = *this;
                }
                v50 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v48, v49);
                if (v50 > 0x7F)
                {
                  *v5 = v50 | 0x80;
                  v51 = v50 >> 7;
                  if (v50 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v51 | 0x80;
                      v52 = v51 >> 7;
                      ++v5;
                      v53 = v51 >> 14;
                      v51 >>= 7;
                    }
                    while (v53);
                    *(v5 - 1) = v52;
                  }
                  else
                  {
                    v5[1] = v51;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v50;
                }
                ++v49;
                v48 = *this;
              }
              while (v49 < **this);
            }
            break;
          case 14:
            v85 = *this;
            if (**this >= 1)
            {
              v86 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v85 = *this;
                }
                v87 = *(int *)google::protobuf::RepeatedField<int>::Get(v85, v86);
                if (v87 > 0x7F)
                {
                  *v5 = v87 | 0x80;
                  v88 = v87 >> 7;
                  if (v87 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v88 | 0x80;
                      v89 = v88 >> 7;
                      ++v5;
                      v90 = v88 >> 14;
                      v88 >>= 7;
                    }
                    while (v90);
                    *(v5 - 1) = v89;
                  }
                  else
                  {
                    v5[1] = v88;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v87;
                }
                ++v86;
                v85 = *this;
              }
              while (v86 < **this);
            }
            break;
          case 15:
            v54 = *this;
            if (**this >= 1)
            {
              v55 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v54 = *this;
                }
                *(_DWORD *)v5 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(v54, v55);
                v5 += 4;
                ++v55;
                v54 = *this;
              }
              while (v55 < **this);
            }
            break;
          case 16:
            v91 = *this;
            if (**this >= 1)
            {
              v92 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v91 = *this;
                }
                *(_QWORD *)v5 = *(_QWORD *)google::protobuf::RepeatedField<long long>::Get(v91, v92);
                v5 += 8;
                ++v92;
                v91 = *this;
              }
              while (v92 < **this);
            }
            break;
          case 17:
            v56 = *this;
            if (**this >= 1)
            {
              v57 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v56 = *this;
                }
                v58 = (int *)google::protobuf::RepeatedField<int>::Get(v56, v57);
                v59 = (2 * *v58) ^ (*v58 >> 31);
                if (v59 > 0x7F)
                {
                  *v5 = v59 | 0x80;
                  v60 = v59 >> 7;
                  if (v59 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v60 | 0x80;
                      v61 = v60 >> 7;
                      ++v5;
                      v62 = v60 >> 14;
                      v60 >>= 7;
                    }
                    while (v62);
                    *(v5 - 1) = v61;
                  }
                  else
                  {
                    v5[1] = v60;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v59;
                }
                ++v57;
                v56 = *this;
              }
              while (v57 < **this);
            }
            break;
          case 18:
            v93 = *this;
            if (**this >= 1)
            {
              v94 = 0;
              do
              {
                if (*(_QWORD *)a4 <= (unint64_t)v5)
                {
                  v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
                  v93 = *this;
                }
                v95 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(v93, v94);
                v96 = (2 * *v95) ^ (*v95 >> 63);
                if (v96 > 0x7F)
                {
                  *v5 = v96 | 0x80;
                  v97 = v96 >> 7;
                  if (v96 >> 14)
                  {
                    v5 += 2;
                    do
                    {
                      *(v5 - 1) = v97 | 0x80;
                      v98 = v97 >> 7;
                      ++v5;
                      v99 = v97 >> 14;
                      v97 >>= 7;
                    }
                    while (v99);
                    *(v5 - 1) = v98;
                  }
                  else
                  {
                    v5[1] = v97;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v96;
                }
                ++v94;
                v93 = *this;
              }
              while (v94 < **this);
            }
            break;
          default:
            return (unsigned __int8 *)v5;
        }
      }
      return (unsigned __int8 *)v5;
    }
    v18 = *((unsigned __int8 *)this + 8);
    if ((v18 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v19 = google::protobuf::internal::LogMessage::operator<<(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v19->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
    }
    switch(v18)
    {
      case 1:
        v20 = *this;
        if (**this >= 1)
        {
          v21 = 0;
          v22 = 8 * a2;
          v23 = (8 * a2) | 1;
          v24 = (8 * a2) | 0x81;
          v25 = (a2 >> 4) & 0x1FFFFFF;
          v26 = v22 >> 7;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v20 = *this;
            }
            v27 = *(_QWORD *)google::protobuf::RepeatedField<double>::Get(v20, v21);
            if (v23 > 0x7F)
            {
              *v5 = v24;
              if (v23 >= 0x4000)
              {
                v28 = v5 + 2;
                v29 = v25;
                do
                {
                  *((_BYTE *)v28 - 1) = v29 | 0x80;
                  v30 = v29 >> 7;
                  v28 = (_QWORD *)((char *)v28 + 1);
                  v31 = v29 >> 14;
                  v29 >>= 7;
                }
                while (v31);
                *((_BYTE *)v28 - 1) = v30;
              }
              else
              {
                v5[1] = v26;
                v28 = v5 + 2;
              }
            }
            else
            {
              *v5 = v23;
              v28 = v5 + 1;
            }
            *v28 = v27;
            v5 = (char *)(v28 + 1);
            ++v21;
            v20 = *this;
          }
          while (v21 < **this);
        }
        return (unsigned __int8 *)v5;
      case 2:
        v100 = *this;
        if (**this >= 1)
        {
          v101 = 0;
          v102 = (8 * a2) | 5;
          v103 = (a2 >> 4) & 0x1FFFFFF;
          v104 = (8 * a2) >> 7;
          v105 = (8 * a2) | 0x85;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v100 = *this;
            }
            v106 = *(_DWORD *)google::protobuf::RepeatedField<float>::Get(v100, v101);
            if (v102 > 0x7F)
            {
              *v5 = v105;
              if (v102 >= 0x4000)
              {
                v107 = v5 + 2;
                v108 = v103;
                do
                {
                  *((_BYTE *)v107 - 1) = v108 | 0x80;
                  v109 = v108 >> 7;
                  v107 = (_DWORD *)((char *)v107 + 1);
                  v110 = v108 >> 14;
                  v108 >>= 7;
                }
                while (v110);
                *((_BYTE *)v107 - 1) = v109;
              }
              else
              {
                v5[1] = v104;
                v107 = v5 + 2;
              }
            }
            else
            {
              *v5 = v102;
              v107 = v5 + 1;
            }
            *v107 = v106;
            v5 = (char *)(v107 + 1);
            ++v101;
            v100 = *this;
          }
          while (v101 < **this);
        }
        return (unsigned __int8 *)v5;
      case 3:
        v111 = *this;
        if (**this >= 1)
        {
          v112 = 0;
          v113 = 8 * a2;
          v114 = (8 * a2) | 0x80;
          v115 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v111 = *this;
            }
            v116 = *(_QWORD *)google::protobuf::RepeatedField<long long>::Get(v111, v112);
            if (v113 > 0x7F)
            {
              *v5 = v114;
              if (v113 >= 0x4000)
              {
                v117 = v5 + 2;
                v118 = v115;
                do
                {
                  *(v117 - 1) = v118 | 0x80;
                  v119 = v118 >> 7;
                  ++v117;
                  v120 = v118 >> 14;
                  v118 >>= 7;
                }
                while (v120);
                *(v117 - 1) = v119;
              }
              else
              {
                v5[1] = v113 >> 7;
                v117 = v5 + 2;
              }
            }
            else
            {
              v117 = v5 + 1;
              *v5 = v113;
            }
            if (v116 > 0x7F)
            {
              *v117 = v116 | 0x80;
              v121 = v116 >> 7;
              if (v116 >> 14)
              {
                v5 = v117 + 2;
                do
                {
                  *(v5 - 1) = v121 | 0x80;
                  v122 = v121 >> 7;
                  ++v5;
                  v123 = v121 >> 14;
                  v121 >>= 7;
                }
                while (v123);
                *(v5 - 1) = v122;
              }
              else
              {
                v117[1] = v121;
                v5 = v117 + 2;
              }
            }
            else
            {
              *v117 = v116;
              v5 = v117 + 1;
            }
            ++v112;
            v111 = *this;
          }
          while (v112 < **this);
        }
        return (unsigned __int8 *)v5;
      case 4:
        v124 = *this;
        if (**this >= 1)
        {
          v125 = 0;
          v126 = 8 * a2;
          v127 = (8 * a2) | 0x80;
          v128 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v124 = *this;
            }
            v129 = *(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(v124, v125);
            if (v126 > 0x7F)
            {
              *v5 = v127;
              if (v126 >= 0x4000)
              {
                v130 = v5 + 2;
                v131 = v128;
                do
                {
                  *(v130 - 1) = v131 | 0x80;
                  v132 = v131 >> 7;
                  ++v130;
                  v133 = v131 >> 14;
                  v131 >>= 7;
                }
                while (v133);
                *(v130 - 1) = v132;
              }
              else
              {
                v5[1] = v126 >> 7;
                v130 = v5 + 2;
              }
            }
            else
            {
              v130 = v5 + 1;
              *v5 = v126;
            }
            if (v129 > 0x7F)
            {
              *v130 = v129 | 0x80;
              v134 = v129 >> 7;
              if (v129 >> 14)
              {
                v5 = v130 + 2;
                do
                {
                  *(v5 - 1) = v134 | 0x80;
                  v135 = v134 >> 7;
                  ++v5;
                  v136 = v134 >> 14;
                  v134 >>= 7;
                }
                while (v136);
                *(v5 - 1) = v135;
              }
              else
              {
                v130[1] = v134;
                v5 = v130 + 2;
              }
            }
            else
            {
              *v130 = v129;
              v5 = v130 + 1;
            }
            ++v125;
            v124 = *this;
          }
          while (v125 < **this);
        }
        return (unsigned __int8 *)v5;
      case 5:
        v137 = *this;
        if (**this >= 1)
        {
          v138 = 0;
          v139 = 8 * a2;
          v140 = (8 * a2) | 0x80;
          v141 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v137 = *this;
            }
            v142 = *(int *)google::protobuf::RepeatedField<int>::Get(v137, v138);
            if (v139 > 0x7F)
            {
              *v5 = v140;
              if (v139 >= 0x4000)
              {
                v143 = v5 + 2;
                v144 = v141;
                do
                {
                  *(v143 - 1) = v144 | 0x80;
                  v145 = v144 >> 7;
                  ++v143;
                  v146 = v144 >> 14;
                  v144 >>= 7;
                }
                while (v146);
                *(v143 - 1) = v145;
              }
              else
              {
                v5[1] = v139 >> 7;
                v143 = v5 + 2;
              }
            }
            else
            {
              v143 = v5 + 1;
              *v5 = v139;
            }
            if (v142 > 0x7F)
            {
              *v143 = v142 | 0x80;
              v147 = v142 >> 7;
              if (v142 >> 14)
              {
                v5 = v143 + 2;
                do
                {
                  *(v5 - 1) = v147 | 0x80;
                  v148 = v147 >> 7;
                  ++v5;
                  v149 = v147 >> 14;
                  v147 >>= 7;
                }
                while (v149);
                *(v5 - 1) = v148;
              }
              else
              {
                v143[1] = v147;
                v5 = v143 + 2;
              }
            }
            else
            {
              *v143 = v142;
              v5 = v143 + 1;
            }
            ++v138;
            v137 = *this;
          }
          while (v138 < **this);
        }
        return (unsigned __int8 *)v5;
      case 6:
        v150 = *this;
        if (**this >= 1)
        {
          v151 = 0;
          v152 = 8 * a2;
          v153 = (8 * a2) | 1;
          v154 = (8 * a2) | 0x81;
          v155 = (a2 >> 4) & 0x1FFFFFF;
          v156 = v152 >> 7;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v150 = *this;
            }
            v157 = *(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(v150, v151);
            if (v153 > 0x7F)
            {
              *v5 = v154;
              if (v153 >= 0x4000)
              {
                v158 = v5 + 2;
                v159 = v155;
                do
                {
                  *((_BYTE *)v158 - 1) = v159 | 0x80;
                  v160 = v159 >> 7;
                  v158 = (_QWORD *)((char *)v158 + 1);
                  v161 = v159 >> 14;
                  v159 >>= 7;
                }
                while (v161);
                *((_BYTE *)v158 - 1) = v160;
              }
              else
              {
                v5[1] = v156;
                v158 = v5 + 2;
              }
            }
            else
            {
              *v5 = v153;
              v158 = v5 + 1;
            }
            *v158 = v157;
            v5 = (char *)(v158 + 1);
            ++v151;
            v150 = *this;
          }
          while (v151 < **this);
        }
        return (unsigned __int8 *)v5;
      case 7:
        v162 = *this;
        if (**this >= 1)
        {
          v163 = 0;
          v164 = (8 * a2) | 5;
          v165 = (a2 >> 4) & 0x1FFFFFF;
          v166 = (8 * a2) >> 7;
          v167 = (8 * a2) | 0x85;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v162 = *this;
            }
            v168 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v162, v163);
            if (v164 > 0x7F)
            {
              *v5 = v167;
              if (v164 >= 0x4000)
              {
                v169 = v5 + 2;
                v170 = v165;
                do
                {
                  *((_BYTE *)v169 - 1) = v170 | 0x80;
                  v171 = v170 >> 7;
                  v169 = (_DWORD *)((char *)v169 + 1);
                  v172 = v170 >> 14;
                  v170 >>= 7;
                }
                while (v172);
                *((_BYTE *)v169 - 1) = v171;
              }
              else
              {
                v5[1] = v166;
                v169 = v5 + 2;
              }
            }
            else
            {
              *v5 = v164;
              v169 = v5 + 1;
            }
            *v169 = v168;
            v5 = (char *)(v169 + 1);
            ++v163;
            v162 = *this;
          }
          while (v163 < **this);
        }
        return (unsigned __int8 *)v5;
      case 8:
        v173 = *this;
        if (**this >= 1)
        {
          v174 = 0;
          v175 = 8 * a2;
          v176 = (8 * a2) | 0x80;
          v177 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v173 = *this;
            }
            v178 = *(_BYTE *)google::protobuf::RepeatedField<BOOL>::Get(v173, v174);
            if (v175 > 0x7F)
            {
              *v5 = v176;
              if (v175 >= 0x4000)
              {
                v179 = v5 + 2;
                v180 = v177;
                do
                {
                  *(v179 - 1) = v180 | 0x80;
                  v181 = v180 >> 7;
                  ++v179;
                  v182 = v180 >> 14;
                  v180 >>= 7;
                }
                while (v182);
                *(v179 - 1) = v181;
              }
              else
              {
                v5[1] = v175 >> 7;
                v179 = v5 + 2;
              }
            }
            else
            {
              *v5 = v175;
              v179 = v5 + 1;
            }
            *v179 = v178;
            v5 = v179 + 1;
            ++v174;
            v173 = *this;
          }
          while (v174 < **this);
        }
        return (unsigned __int8 *)v5;
      case 9:
        v183 = (uint64_t)*this;
        if ((*this)[2] < 1)
          return (unsigned __int8 *)v5;
        v184 = 0;
        v185 = 8 * a2;
        v186 = 4;
        if (((a2 >> 25) & 0xF) != 0)
          v186 = 5;
        v187 = (8 * a2) | 2;
        v188 = 1;
        if (v185 >= 0x80)
          v188 = 2;
        if (v185 < 0x200000)
          v186 = 3;
        if (v185 >= 0x4000)
          v189 = v186;
        else
          v189 = v188;
        v429 = v185 >> 7;
        while (1)
        {
          if (*(_QWORD *)a4 <= (unint64_t)v5)
          {
            v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
            v183 = (uint64_t)*this;
          }
          v190 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v183, v184);
          if (*(char *)(v190 + 23) < 0)
          {
            v191 = *(_QWORD *)(v190 + 8);
            if (v191 > 127)
              goto LABEL_326;
          }
          else
          {
            v191 = *(unsigned __int8 *)(v190 + 23);
          }
          if ((uint64_t)(*(_QWORD *)a4 + ~(unint64_t)&v5[v189] + 16) >= v191)
          {
            if (v187 > 0x7F)
            {
              *v5 = (8 * a2) | 0x82;
              if (v187 >= 0x4000)
              {
                v192 = v5 + 2;
                v193 = (a2 >> 4) & 0x1FFFFFF;
                do
                {
                  *(v192 - 1) = v193 | 0x80;
                  v194 = v193 >> 7;
                  ++v192;
                  v195 = v193 >> 14;
                  v193 >>= 7;
                }
                while (v195);
                *(v192 - 1) = v194;
              }
              else
              {
                v5[1] = v429;
                v192 = v5 + 2;
              }
            }
            else
            {
              v192 = v5 + 1;
              *v5 = v187;
            }
            *v192 = v191;
            v196 = v192 + 1;
            if (*(char *)(v190 + 23) >= 0)
              v197 = (const void *)v190;
            else
              v197 = *(const void **)v190;
            memcpy(v196, v197, v191);
            v5 = &v196[v191];
            goto LABEL_324;
          }
LABEL_326:
          v5 = (char *)google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, v190, v5);
LABEL_324:
          ++v184;
          v183 = (uint64_t)*this;
          if (v184 >= (*this)[2])
            return (unsigned __int8 *)v5;
        }
      case 10:
        v198 = (uint64_t)*this;
        if ((*this)[2] >= 1)
        {
          v199 = 0;
          v200 = (8 * a2) | 3;
          v201 = (8 * a2) | 0x83;
          v202 = (a2 >> 4) & 0x1FFFFFF;
          v203 = (8 * a2) | 4;
          v204 = (8 * a2) >> 7;
          v205 = (8 * a2) | 0x84;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v198 = (uint64_t)*this;
            }
            v206 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v198, v199);
            if (v200 > 0x7F)
            {
              *v5 = v201;
              if (v200 >= 0x4000)
              {
                v207 = v5 + 2;
                v208 = v202;
                do
                {
                  *(v207 - 1) = v208 | 0x80;
                  v209 = v208 >> 7;
                  ++v207;
                  v210 = v208 >> 14;
                  v208 >>= 7;
                }
                while (v210);
                *(v207 - 1) = v209;
              }
              else
              {
                v5[1] = v204;
                v207 = v5 + 2;
              }
            }
            else
            {
              v207 = v5 + 1;
              *v5 = v200;
            }
            v211 = (char *)(*(uint64_t (**)(uint64_t, char *, google::protobuf::io::EpsCopyOutputStream *))(*(_QWORD *)v206 + 96))(v206, v207, a4);
            if (*(_QWORD *)a4 <= (unint64_t)v211)
              v211 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v211);
            if (v203 > 0x7F)
            {
              *v211 = v205;
              if (v203 >= 0x4000)
              {
                v5 = v211 + 2;
                v212 = v202;
                do
                {
                  *(v5 - 1) = v212 | 0x80;
                  v213 = v212 >> 7;
                  ++v5;
                  v214 = v212 >> 14;
                  v212 >>= 7;
                }
                while (v214);
                *(v5 - 1) = v213;
              }
              else
              {
                v211[1] = v204;
                v5 = v211 + 2;
              }
            }
            else
            {
              v5 = v211 + 1;
              *v211 = v203;
            }
            ++v199;
            v198 = (uint64_t)*this;
          }
          while (v199 < (*this)[2]);
        }
        return (unsigned __int8 *)v5;
      case 11:
        v215 = (uint64_t)*this;
        if ((*this)[2] >= 1)
        {
          v216 = 0;
          v217 = (8 * a2) | 2;
          v218 = (a2 >> 4) & 0x1FFFFFF;
          v219 = (8 * a2) >> 7;
          v220 = (8 * a2) | 0x82;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v215 = (uint64_t)*this;
            }
            v221 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v215, v216);
            v222 = v221;
            if (v217 > 0x7F)
            {
              *v5 = v220;
              if (v217 >= 0x4000)
              {
                v223 = v5 + 2;
                v224 = v218;
                do
                {
                  *(v223 - 1) = v224 | 0x80;
                  v225 = v224 >> 7;
                  ++v223;
                  v226 = v224 >> 14;
                  v224 >>= 7;
                }
                while (v226);
                *(v223 - 1) = v225;
              }
              else
              {
                v5[1] = v219;
                v223 = v5 + 2;
              }
            }
            else
            {
              v223 = v5 + 1;
              *v5 = v217;
            }
            v227 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v221 + 80))(v221);
            if (v227 > 0x7F)
            {
              *v223 = v227 | 0x80;
              v229 = v227 >> 7;
              if (v227 >> 14)
              {
                v228 = v223 + 2;
                do
                {
                  *(v228 - 1) = v229 | 0x80;
                  v230 = v229 >> 7;
                  ++v228;
                  v231 = v229 >> 14;
                  v229 >>= 7;
                }
                while (v231);
                *(v228 - 1) = v230;
              }
              else
              {
                v223[1] = v229;
                v228 = v223 + 2;
              }
            }
            else
            {
              *v223 = v227;
              v228 = v223 + 1;
            }
            v5 = (char *)(*(uint64_t (**)(uint64_t, _BYTE *, google::protobuf::io::EpsCopyOutputStream *))(*(_QWORD *)v222 + 96))(v222, v228, a4);
            ++v216;
            v215 = (uint64_t)*this;
          }
          while (v216 < (*this)[2]);
        }
        return (unsigned __int8 *)v5;
      case 12:
        v232 = (uint64_t)*this;
        if ((*this)[2] < 1)
          return (unsigned __int8 *)v5;
        v233 = 0;
        v234 = 8 * a2;
        v235 = 4;
        if (((a2 >> 25) & 0xF) != 0)
          v235 = 5;
        v236 = (8 * a2) | 2;
        v237 = 1;
        if (v234 >= 0x80)
          v237 = 2;
        if (v234 < 0x200000)
          v235 = 3;
        if (v234 >= 0x4000)
          v238 = v235;
        else
          v238 = v237;
        v430 = v234 >> 7;
        break;
      case 13:
        v247 = *this;
        if (**this >= 1)
        {
          v248 = 0;
          v249 = 8 * a2;
          v250 = (8 * a2) | 0x80;
          v251 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v247 = *this;
            }
            v252 = *(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v247, v248);
            if (v249 > 0x7F)
            {
              *v5 = v250;
              if (v249 >= 0x4000)
              {
                v253 = v5 + 2;
                v254 = v251;
                do
                {
                  *(v253 - 1) = v254 | 0x80;
                  v255 = v254 >> 7;
                  ++v253;
                  v256 = v254 >> 14;
                  v254 >>= 7;
                }
                while (v256);
                *(v253 - 1) = v255;
              }
              else
              {
                v5[1] = v249 >> 7;
                v253 = v5 + 2;
              }
            }
            else
            {
              v253 = v5 + 1;
              *v5 = v249;
            }
            if (v252 > 0x7F)
            {
              *v253 = v252 | 0x80;
              v257 = v252 >> 7;
              if (v252 >> 14)
              {
                v5 = v253 + 2;
                do
                {
                  *(v5 - 1) = v257 | 0x80;
                  v258 = v257 >> 7;
                  ++v5;
                  v259 = v257 >> 14;
                  v257 >>= 7;
                }
                while (v259);
                *(v5 - 1) = v258;
              }
              else
              {
                v253[1] = v257;
                v5 = v253 + 2;
              }
            }
            else
            {
              *v253 = v252;
              v5 = v253 + 1;
            }
            ++v248;
            v247 = *this;
          }
          while (v248 < **this);
        }
        return (unsigned __int8 *)v5;
      case 14:
        v260 = *this;
        if (**this >= 1)
        {
          v261 = 0;
          v262 = 8 * a2;
          v263 = (8 * a2) | 0x80;
          v264 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v260 = *this;
            }
            v265 = *(int *)google::protobuf::RepeatedField<int>::Get(v260, v261);
            if (v262 > 0x7F)
            {
              *v5 = v263;
              if (v262 >= 0x4000)
              {
                v266 = v5 + 2;
                v267 = v264;
                do
                {
                  *(v266 - 1) = v267 | 0x80;
                  v268 = v267 >> 7;
                  ++v266;
                  v269 = v267 >> 14;
                  v267 >>= 7;
                }
                while (v269);
                *(v266 - 1) = v268;
              }
              else
              {
                v5[1] = v262 >> 7;
                v266 = v5 + 2;
              }
            }
            else
            {
              v266 = v5 + 1;
              *v5 = v262;
            }
            if (v265 > 0x7F)
            {
              *v266 = v265 | 0x80;
              v270 = v265 >> 7;
              if (v265 >> 14)
              {
                v5 = v266 + 2;
                do
                {
                  *(v5 - 1) = v270 | 0x80;
                  v271 = v270 >> 7;
                  ++v5;
                  v272 = v270 >> 14;
                  v270 >>= 7;
                }
                while (v272);
                *(v5 - 1) = v271;
              }
              else
              {
                v266[1] = v270;
                v5 = v266 + 2;
              }
            }
            else
            {
              *v266 = v265;
              v5 = v266 + 1;
            }
            ++v261;
            v260 = *this;
          }
          while (v261 < **this);
        }
        return (unsigned __int8 *)v5;
      case 15:
        v273 = *this;
        if (**this >= 1)
        {
          v274 = 0;
          v275 = (8 * a2) | 5;
          v276 = (a2 >> 4) & 0x1FFFFFF;
          v277 = (8 * a2) >> 7;
          v278 = (8 * a2) | 0x85;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v273 = *this;
            }
            v279 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(v273, v274);
            if (v275 > 0x7F)
            {
              *v5 = v278;
              if (v275 >= 0x4000)
              {
                v280 = v5 + 2;
                v281 = v276;
                do
                {
                  *((_BYTE *)v280 - 1) = v281 | 0x80;
                  v282 = v281 >> 7;
                  v280 = (_DWORD *)((char *)v280 + 1);
                  v283 = v281 >> 14;
                  v281 >>= 7;
                }
                while (v283);
                *((_BYTE *)v280 - 1) = v282;
              }
              else
              {
                v5[1] = v277;
                v280 = v5 + 2;
              }
            }
            else
            {
              *v5 = v275;
              v280 = v5 + 1;
            }
            *v280 = v279;
            v5 = (char *)(v280 + 1);
            ++v274;
            v273 = *this;
          }
          while (v274 < **this);
        }
        return (unsigned __int8 *)v5;
      case 16:
        v284 = *this;
        if (**this >= 1)
        {
          v285 = 0;
          v286 = 8 * a2;
          v287 = (8 * a2) | 1;
          v288 = (8 * a2) | 0x81;
          v289 = (a2 >> 4) & 0x1FFFFFF;
          v290 = v286 >> 7;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v284 = *this;
            }
            v291 = *(_QWORD *)google::protobuf::RepeatedField<long long>::Get(v284, v285);
            if (v287 > 0x7F)
            {
              *v5 = v288;
              if (v287 >= 0x4000)
              {
                v292 = v5 + 2;
                v293 = v289;
                do
                {
                  *((_BYTE *)v292 - 1) = v293 | 0x80;
                  v294 = v293 >> 7;
                  v292 = (_QWORD *)((char *)v292 + 1);
                  v295 = v293 >> 14;
                  v293 >>= 7;
                }
                while (v295);
                *((_BYTE *)v292 - 1) = v294;
              }
              else
              {
                v5[1] = v290;
                v292 = v5 + 2;
              }
            }
            else
            {
              *v5 = v287;
              v292 = v5 + 1;
            }
            *v292 = v291;
            v5 = (char *)(v292 + 1);
            ++v285;
            v284 = *this;
          }
          while (v285 < **this);
        }
        return (unsigned __int8 *)v5;
      case 17:
        v296 = *this;
        if (**this >= 1)
        {
          v297 = 0;
          v298 = 8 * a2;
          v299 = (8 * a2) | 0x80;
          v300 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v296 = *this;
            }
            v301 = *(_DWORD *)google::protobuf::RepeatedField<int>::Get(v296, v297);
            if (v298 > 0x7F)
            {
              *v5 = v299;
              if (v298 >= 0x4000)
              {
                v302 = v5 + 2;
                v303 = v300;
                do
                {
                  *(v302 - 1) = v303 | 0x80;
                  v304 = v303 >> 7;
                  ++v302;
                  v305 = v303 >> 14;
                  v303 >>= 7;
                }
                while (v305);
                *(v302 - 1) = v304;
              }
              else
              {
                v5[1] = v298 >> 7;
                v302 = v5 + 2;
              }
            }
            else
            {
              v302 = v5 + 1;
              *v5 = v298;
            }
            v306 = (2 * v301) ^ (v301 >> 31);
            if (v306 > 0x7F)
            {
              *v302 = v306 | 0x80;
              v307 = v306 >> 7;
              if (v306 >> 14)
              {
                v5 = v302 + 2;
                do
                {
                  *(v5 - 1) = v307 | 0x80;
                  v308 = v307 >> 7;
                  ++v5;
                  v309 = v307 >> 14;
                  v307 >>= 7;
                }
                while (v309);
                *(v5 - 1) = v308;
              }
              else
              {
                v302[1] = v307;
                v5 = v302 + 2;
              }
            }
            else
            {
              *v302 = v306;
              v5 = v302 + 1;
            }
            ++v297;
            v296 = *this;
          }
          while (v297 < **this);
        }
        return (unsigned __int8 *)v5;
      case 18:
        v310 = *this;
        if (**this >= 1)
        {
          v311 = 0;
          v312 = 8 * a2;
          v313 = (8 * a2) | 0x80;
          v314 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(_QWORD *)a4 <= (unint64_t)v5)
            {
              v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
              v310 = *this;
            }
            v315 = *(_QWORD *)google::protobuf::RepeatedField<long long>::Get(v310, v311);
            if (v312 > 0x7F)
            {
              *v5 = v313;
              if (v312 >= 0x4000)
              {
                v316 = v5 + 2;
                v317 = v314;
                do
                {
                  *(v316 - 1) = v317 | 0x80;
                  v318 = v317 >> 7;
                  ++v316;
                  v319 = v317 >> 14;
                  v317 >>= 7;
                }
                while (v319);
                *(v316 - 1) = v318;
              }
              else
              {
                v5[1] = v312 >> 7;
                v316 = v5 + 2;
              }
            }
            else
            {
              v316 = v5 + 1;
              *v5 = v312;
            }
            v320 = (2 * v315) ^ (v315 >> 63);
            if (v320 > 0x7F)
            {
              *v316 = v320 | 0x80;
              v321 = v320 >> 7;
              if (v320 >> 14)
              {
                v5 = v316 + 2;
                do
                {
                  *(v5 - 1) = v321 | 0x80;
                  v322 = v321 >> 7;
                  ++v5;
                  v323 = v321 >> 14;
                  v321 >>= 7;
                }
                while (v323);
                *(v5 - 1) = v322;
              }
              else
              {
                v316[1] = v321;
                v5 = v316 + 2;
              }
            }
            else
            {
              *v316 = v320;
              v5 = v316 + 1;
            }
            ++v311;
            v310 = *this;
          }
          while (v311 < **this);
        }
        return (unsigned __int8 *)v5;
      default:
        return (unsigned __int8 *)v5;
    }
    while (1)
    {
      if (*(_QWORD *)a4 <= (unint64_t)v5)
      {
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
        v232 = (uint64_t)*this;
      }
      v239 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v232, v233);
      if (*(char *)(v239 + 23) < 0)
      {
        v240 = *(_QWORD *)(v239 + 8);
        if (v240 > 127)
          goto LABEL_399;
      }
      else
      {
        v240 = *(unsigned __int8 *)(v239 + 23);
      }
      if ((uint64_t)(*(_QWORD *)a4 + ~(unint64_t)&v5[v238] + 16) >= v240)
      {
        if (v236 > 0x7F)
        {
          *v5 = (8 * a2) | 0x82;
          if (v236 >= 0x4000)
          {
            v241 = v5 + 2;
            v242 = (a2 >> 4) & 0x1FFFFFF;
            do
            {
              *(v241 - 1) = v242 | 0x80;
              v243 = v242 >> 7;
              ++v241;
              v244 = v242 >> 14;
              v242 >>= 7;
            }
            while (v244);
            *(v241 - 1) = v243;
          }
          else
          {
            v5[1] = v430;
            v241 = v5 + 2;
          }
        }
        else
        {
          v241 = v5 + 1;
          *v5 = v236;
        }
        *v241 = v240;
        v245 = v241 + 1;
        if (*(char *)(v239 + 23) >= 0)
          v246 = (const void *)v239;
        else
          v246 = *(const void **)v239;
        memcpy(v245, v246, v240);
        v5 = &v245[v240];
        goto LABEL_397;
      }
LABEL_399:
      v5 = (char *)google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, v239, v5);
LABEL_397:
      ++v233;
      v232 = (uint64_t)*this;
      if (v233 >= (*this)[2])
        return (unsigned __int8 *)v5;
    }
  }
  if ((*((_BYTE *)this + 10) & 1) != 0)
    return (unsigned __int8 *)v5;
  v10 = *((unsigned __int8 *)this + 8);
  if ((v10 - 19) <= 0xFFFFFFED)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v432, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
    v11 = google::protobuf::internal::LogMessage::operator<<(v432, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v431, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v432[0].__r_.__value_.__l.__data_);
  }
  switch(v10)
  {
    case 1:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v12 = *this;
      v13 = (8 * a2) | 1;
      if (v13 <= 0x7F)
        goto LABEL_575;
      *v5 = (8 * a2) | 0x81;
      v14 = (8 * a2) >> 7;
      if (!(v13 >> 14))
        goto LABEL_602;
      v15 = (int **)(v5 + 2);
      do
      {
        *((_BYTE *)v15 - 1) = v14 | 0x80;
        v16 = v14 >> 7;
        v15 = (int **)((char *)v15 + 1);
        v17 = v14 >> 14;
        v14 >>= 7;
      }
      while (v17);
      goto LABEL_693;
    case 2:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v324 = *(_DWORD *)this;
      v325 = (8 * a2) | 5;
      if (v325 <= 0x7F)
        goto LABEL_571;
      *v5 = (8 * a2) | 0x85;
      v326 = (8 * a2) >> 7;
      if (!(v325 >> 14))
        goto LABEL_600;
      v327 = (unsigned int *)(v5 + 2);
      do
      {
        *((_BYTE *)v327 - 1) = v326 | 0x80;
        v328 = v326 >> 7;
        v327 = (unsigned int *)((char *)v327 + 1);
        v329 = v326 >> 14;
        v326 >>= 7;
      }
      while (v329);
      goto LABEL_689;
    case 3:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v330 = (unint64_t)*this;
      v331 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v331 | 0x80;
        v355 = v331 >> 7;
        if (v331 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v355 | 0x80;
            v380 = v355 >> 7;
            ++v332;
            v381 = v355 >> 14;
            v355 >>= 7;
          }
          while (v381);
          *(v332 - 1) = v380;
        }
        else
        {
          v5[1] = v355;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v331;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
        goto LABEL_684;
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
        goto LABEL_686;
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v384 = v382 >> 14;
        v382 >>= 7;
      }
      while (v384);
      goto LABEL_718;
    case 4:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v330 = (unint64_t)*this;
      v333 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v333 | 0x80;
        v356 = v333 >> 7;
        if (v333 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v356 | 0x80;
            v385 = v356 >> 7;
            ++v332;
            v386 = v356 >> 14;
            v356 >>= 7;
          }
          while (v386);
          *(v332 - 1) = v385;
        }
        else
        {
          v5[1] = v356;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v333;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
        goto LABEL_684;
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
        goto LABEL_686;
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v387 = v382 >> 14;
        v382 >>= 7;
      }
      while (v387);
      goto LABEL_718;
    case 5:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v330 = *(int *)this;
      v334 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v334 | 0x80;
        v357 = v334 >> 7;
        if (v334 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v357 | 0x80;
            v388 = v357 >> 7;
            ++v332;
            v389 = v357 >> 14;
            v357 >>= 7;
          }
          while (v389);
          *(v332 - 1) = v388;
        }
        else
        {
          v5[1] = v357;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v334;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
        goto LABEL_684;
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
        goto LABEL_686;
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v390 = v382 >> 14;
        v382 >>= 7;
      }
      while (v390);
      goto LABEL_718;
    case 6:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v12 = *this;
      v13 = (8 * a2) | 1;
      if (v13 <= 0x7F)
        goto LABEL_575;
      *v5 = (8 * a2) | 0x81;
      v14 = (8 * a2) >> 7;
      if (!(v13 >> 14))
        goto LABEL_602;
      v15 = (int **)(v5 + 2);
      do
      {
        *((_BYTE *)v15 - 1) = v14 | 0x80;
        v16 = v14 >> 7;
        v15 = (int **)((char *)v15 + 1);
        v335 = v14 >> 14;
        v14 >>= 7;
      }
      while (v335);
      goto LABEL_693;
    case 7:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v324 = *(_DWORD *)this;
      v325 = (8 * a2) | 5;
      if (v325 <= 0x7F)
        goto LABEL_571;
      *v5 = (8 * a2) | 0x85;
      v326 = (8 * a2) >> 7;
      if (!(v325 >> 14))
        goto LABEL_600;
      v327 = (unsigned int *)(v5 + 2);
      do
      {
        *((_BYTE *)v327 - 1) = v326 | 0x80;
        v328 = v326 >> 7;
        v327 = (unsigned int *)((char *)v327 + 1);
        v336 = v326 >> 14;
        v326 >>= 7;
      }
      while (v336);
      goto LABEL_689;
    case 8:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      LOBYTE(v337) = *(_BYTE *)this;
      v338 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v338 | 0x80;
        v358 = v338 >> 7;
        if (v338 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v358 | 0x80;
            v391 = v358 >> 7;
            ++v332;
            v392 = v358 >> 14;
            v358 >>= 7;
          }
          while (v392);
          *(v332 - 1) = v391;
        }
        else
        {
          v5[1] = v358;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v338;
        v332 = v5 + 1;
      }
      goto LABEL_677;
    case 9:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v339 = *this;
      if (*((char *)*this + 23) < 0)
      {
        v340 = *((_QWORD *)v339 + 1);
        if (v340 > 127)
          return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
      }
      else
      {
        v340 = *((unsigned __int8 *)*this + 23);
      }
      v364 = 8 * a2;
      v365 = 1;
      v366 = 2;
      v367 = 3;
      v368 = 4;
      if ((8 * a2) >> 28)
        v368 = 5;
      if (v364 >= 0x200000)
        v367 = v368;
      if (v364 >= 0x4000)
        v366 = v367;
      if (v364 >= 0x80)
        v365 = v366;
      if ((uint64_t)(*(_QWORD *)a4 + ~(unint64_t)&v5[v365] + 16) < v340)
        return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
      v369 = v364 | 2;
      if ((v364 | 2) <= 0x7F)
        goto LABEL_633;
      *v5 = v364 | 0x82;
      v370 = v364 >> 7;
      if (!(v369 >> 14))
        goto LABEL_635;
      v371 = v5 + 2;
      do
      {
        *(v371 - 1) = v370 | 0x80;
        v372 = v370 >> 7;
        ++v371;
        v373 = v370 >> 14;
        v370 >>= 7;
      }
      while (v373);
      goto LABEL_727;
    case 10:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v341 = *this;
      v342 = 8 * a2;
      v343 = (8 * a2) | 3;
      v344 = (8 * a2) >> 7;
      if (v343 > 0x7F)
      {
        *v5 = (8 * a2) | 0x83;
        if (v343 >> 14)
        {
          v345 = v5 + 2;
          v393 = v342 >> 7;
          do
          {
            *(v345 - 1) = v393 | 0x80;
            v394 = v393 >> 7;
            ++v345;
            v395 = v393 >> 14;
            v393 >>= 7;
          }
          while (v395);
          *(v345 - 1) = v394;
        }
        else
        {
          v5[1] = v344;
          v345 = v5 + 2;
        }
      }
      else
      {
        *v5 = v343;
        v345 = v5 + 1;
      }
      v332 = (char *)(*(uint64_t (**)(int *, char *, google::protobuf::io::EpsCopyOutputStream *))(*(_QWORD *)v341 + 96))(v341, v345, a4);
      if (*(_QWORD *)a4 <= (unint64_t)v332)
        v332 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v332);
      v337 = v342 | 4;
      if ((v342 | 4) <= 0x7F)
        goto LABEL_677;
      *v332 = v342 | 0x84;
      if (!(v337 >> 14))
      {
        v332[1] = v344;
        return (unsigned __int8 *)(v332 + 2);
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v344 | 0x80;
        v411 = v344 >> 7;
        ++v5;
        v412 = v344 >> 14;
        v344 >>= 7;
      }
      while (v412);
      goto LABEL_715;
    case 11:
      if ((*((_BYTE *)this + 10) & 0x10) != 0)
        return (unsigned __int8 *)(*(uint64_t (**)(int *, uint64_t, char *, google::protobuf::io::EpsCopyOutputStream *))(*(_QWORD *)*this + 136))(*this, a2, v5, a4);
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v346 = *this;
      v347 = (8 * a2) | 2;
      if (v347 > 0x7F)
      {
        *v5 = (8 * a2) | 0x82;
        v379 = (8 * a2) >> 7;
        if (v347 >> 14)
        {
          v348 = v5 + 2;
          do
          {
            *(v348 - 1) = v379 | 0x80;
            v421 = v379 >> 7;
            ++v348;
            v422 = v379 >> 14;
            v379 >>= 7;
          }
          while (v422);
          *(v348 - 1) = v421;
        }
        else
        {
          v5[1] = v379;
          v348 = v5 + 2;
        }
      }
      else
      {
        *v5 = v347;
        v348 = v5 + 1;
      }
      v423 = (*(uint64_t (**)(int *))(*(_QWORD *)v346 + 80))(v346);
      if (v423 > 0x7F)
      {
        *v348 = v423 | 0x80;
        v425 = v423 >> 7;
        if (v423 >> 14)
        {
          v424 = v348 + 2;
          do
          {
            *(v424 - 1) = v425 | 0x80;
            v426 = v425 >> 7;
            ++v424;
            v427 = v425 >> 14;
            v425 >>= 7;
          }
          while (v427);
          *(v424 - 1) = v426;
        }
        else
        {
          v348[1] = v425;
          v424 = v348 + 2;
        }
      }
      else
      {
        *v348 = v423;
        v424 = v348 + 1;
      }
      return (unsigned __int8 *)(*(uint64_t (**)(int *, _BYTE *, google::protobuf::io::EpsCopyOutputStream *))(*(_QWORD *)v346 + 96))(v346, v424, a4);
    case 12:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v339 = *this;
      if (*((char *)*this + 23) < 0)
      {
        v340 = *((_QWORD *)v339 + 1);
        if (v340 > 127)
          return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
      }
      else
      {
        v340 = *((unsigned __int8 *)*this + 23);
      }
      v374 = 8 * a2;
      v375 = 1;
      v376 = 2;
      v377 = 3;
      v378 = 4;
      if ((8 * a2) >> 28)
        v378 = 5;
      if (v374 >= 0x200000)
        v377 = v378;
      if (v374 >= 0x4000)
        v376 = v377;
      if (v374 >= 0x80)
        v375 = v376;
      if ((uint64_t)(*(_QWORD *)a4 + ~(unint64_t)&v5[v375] + 16) < v340)
        return google::protobuf::io::EpsCopyOutputStream::WriteStringOutline(a4, a2, (uint64_t)v339, v5);
      v369 = v374 | 2;
      if ((v374 | 2) > 0x7F)
      {
        *v5 = v374 | 0x82;
        v370 = v374 >> 7;
        if (v369 >> 14)
        {
          v371 = v5 + 2;
          do
          {
            *(v371 - 1) = v370 | 0x80;
            v372 = v370 >> 7;
            ++v371;
            v419 = v370 >> 14;
            v370 >>= 7;
          }
          while (v419);
LABEL_727:
          *(v371 - 1) = v372;
        }
        else
        {
LABEL_635:
          v5[1] = v370;
          v371 = v5 + 2;
        }
      }
      else
      {
LABEL_633:
        *v5 = v369;
        v371 = v5 + 1;
      }
      *v371 = v340;
      v420 = v371 + 1;
      if (*((char *)v339 + 23) < 0)
        v339 = *(int **)v339;
      memcpy(v420, v339, v340);
      return (unsigned __int8 *)&v420[v340];
    case 13:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v337 = *(_DWORD *)this;
      v349 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v349 | 0x80;
        v360 = v349 >> 7;
        if (v349 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v360 | 0x80;
            v396 = v360 >> 7;
            ++v332;
            v397 = v360 >> 14;
            v360 >>= 7;
          }
          while (v397);
          *(v332 - 1) = v396;
        }
        else
        {
          v5[1] = v360;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v349;
        v332 = v5 + 1;
      }
      if (v337 <= 0x7F)
      {
LABEL_677:
        *v332 = v337;
        return (unsigned __int8 *)(v332 + 1);
      }
      *v332 = v337 | 0x80;
      v398 = v337 >> 7;
      if (!(v337 >> 14))
      {
        v332[1] = v398;
        return (unsigned __int8 *)(v332 + 2);
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v398 | 0x80;
        v411 = v398 >> 7;
        ++v5;
        v413 = v398 >> 14;
        v398 >>= 7;
      }
      while (v413);
LABEL_715:
      *(v5 - 1) = v411;
      return (unsigned __int8 *)v5;
    case 14:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v330 = *(int *)this;
      v350 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v350 | 0x80;
        v361 = v350 >> 7;
        if (v350 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v361 | 0x80;
            v399 = v361 >> 7;
            ++v332;
            v400 = v361 >> 14;
            v361 >>= 7;
          }
          while (v400);
          *(v332 - 1) = v399;
        }
        else
        {
          v5[1] = v361;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v350;
        v332 = v5 + 1;
      }
      if (v330 <= 0x7F)
      {
LABEL_684:
        *v332 = v330;
        return (unsigned __int8 *)(v332 + 1);
      }
      *v332 = v330 | 0x80;
      v382 = v330 >> 7;
      if (!(v330 >> 14))
      {
LABEL_686:
        v332[1] = v382;
        return (unsigned __int8 *)(v332 + 2);
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v382 | 0x80;
        v383 = v382 >> 7;
        ++v5;
        v414 = v382 >> 14;
        v382 >>= 7;
      }
      while (v414);
LABEL_718:
      *(v5 - 1) = v383;
      return (unsigned __int8 *)v5;
    case 15:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v324 = *(_DWORD *)this;
      v325 = (8 * a2) | 5;
      if (v325 > 0x7F)
      {
        *v5 = (8 * a2) | 0x85;
        v326 = (8 * a2) >> 7;
        if (v325 >> 14)
        {
          v327 = (unsigned int *)(v5 + 2);
          do
          {
            *((_BYTE *)v327 - 1) = v326 | 0x80;
            v328 = v326 >> 7;
            v327 = (unsigned int *)((char *)v327 + 1);
            v401 = v326 >> 14;
            v326 >>= 7;
          }
          while (v401);
LABEL_689:
          *((_BYTE *)v327 - 1) = v328;
        }
        else
        {
LABEL_600:
          v5[1] = v326;
          v327 = (unsigned int *)(v5 + 2);
        }
      }
      else
      {
LABEL_571:
        *v5 = v325;
        v327 = (unsigned int *)(v5 + 1);
      }
      *v327 = v324;
      return (unsigned __int8 *)(v327 + 1);
    case 16:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v12 = *this;
      v13 = (8 * a2) | 1;
      if (v13 > 0x7F)
      {
        *v5 = (8 * a2) | 0x81;
        v14 = (8 * a2) >> 7;
        if (v13 >> 14)
        {
          v15 = (int **)(v5 + 2);
          do
          {
            *((_BYTE *)v15 - 1) = v14 | 0x80;
            v16 = v14 >> 7;
            v15 = (int **)((char *)v15 + 1);
            v402 = v14 >> 14;
            v14 >>= 7;
          }
          while (v402);
LABEL_693:
          *((_BYTE *)v15 - 1) = v16;
        }
        else
        {
LABEL_602:
          v5[1] = v14;
          v15 = (int **)(v5 + 2);
        }
      }
      else
      {
LABEL_575:
        *v5 = v13;
        v15 = (int **)(v5 + 1);
      }
      *v15 = v12;
      return (unsigned __int8 *)(v15 + 1);
    case 17:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v351 = *(_DWORD *)this;
      v352 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v352 | 0x80;
        v362 = v352 >> 7;
        if (v352 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v362 | 0x80;
            v403 = v362 >> 7;
            ++v332;
            v404 = v362 >> 14;
            v362 >>= 7;
          }
          while (v404);
          *(v332 - 1) = v403;
        }
        else
        {
          v5[1] = v362;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v352;
        v332 = v5 + 1;
      }
      v405 = (2 * v351) ^ (v351 >> 31);
      if (v405 <= 0x7F)
      {
        *v332 = v405;
        return (unsigned __int8 *)(v332 + 1);
      }
      *v332 = v405 | 0x80;
      v406 = v405 >> 7;
      if (!(v405 >> 14))
      {
        v332[1] = v406;
        return (unsigned __int8 *)(v332 + 2);
      }
      v5 = v332 + 2;
      do
      {
        *(v5 - 1) = v406 | 0x80;
        v415 = v406 >> 7;
        ++v5;
        v416 = v406 >> 14;
        v406 >>= 7;
      }
      while (v416);
      *(v5 - 1) = v415;
      return (unsigned __int8 *)v5;
    case 18:
      if (*(_QWORD *)a4 <= (unint64_t)v5)
        v5 = google::protobuf::io::EpsCopyOutputStream::EnsureSpaceFallback(a4, v5);
      v353 = (uint64_t)*this;
      v354 = 8 * a2;
      if ((8 * a2) > 0x7F)
      {
        *v5 = v354 | 0x80;
        v363 = v354 >> 7;
        if (v354 >> 14)
        {
          v332 = v5 + 2;
          do
          {
            *(v332 - 1) = v363 | 0x80;
            v407 = v363 >> 7;
            ++v332;
            v408 = v363 >> 14;
            v363 >>= 7;
          }
          while (v408);
          *(v332 - 1) = v407;
        }
        else
        {
          v5[1] = v363;
          v332 = v5 + 2;
        }
      }
      else
      {
        *v5 = v354;
        v332 = v5 + 1;
      }
      v409 = (2 * v353) ^ (v353 >> 63);
      if (v409 > 0x7F)
      {
        *v332 = v409 | 0x80;
        v410 = v409 >> 7;
        if (v409 >> 14)
        {
          v5 = v332 + 2;
          do
          {
            *(v5 - 1) = v410 | 0x80;
            v417 = v410 >> 7;
            ++v5;
            v418 = v410 >> 14;
            v410 >>= 7;
          }
          while (v418);
          *(v5 - 1) = v417;
        }
        else
        {
          v332[1] = v410;
          return (unsigned __int8 *)(v332 + 2);
        }
      }
      else
      {
        *v332 = v409;
        return (unsigned __int8 *)(v332 + 1);
      }
      return (unsigned __int8 *)v5;
    default:
      return (unsigned __int8 *)v5;
  }
}

void sub_245C851C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ExtensionSet::ByteSize(google::protobuf::internal::ExtensionSet *this)
{
  int *v1;
  uint64_t v2;
  int *v3;
  int **v4;
  int v5;
  int *v6;
  int *v7;
  int *v8;
  unint64_t v9;
  int *v10;
  int *v11;
  BOOL v12;

  v1 = (int *)*((_QWORD *)this + 2);
  if (*((unsigned __int16 *)this + 4) < 0x101u)
  {
    if (*((_WORD *)this + 5))
    {
      v2 = 0;
      v3 = &v1[8 * *((unsigned __int16 *)this + 5)];
      do
      {
        v4 = (int **)(v1 + 2);
        v5 = *v1;
        v1 += 8;
        v2 += google::protobuf::internal::ExtensionSet::Extension::ByteSize(v4, v5);
      }
      while (v1 != v3);
      return v2;
    }
    return 0;
  }
  v8 = *(int **)v1;
  v6 = v1 + 2;
  v7 = v8;
  if (v8 == v6)
    return 0;
  v2 = 0;
  do
  {
    v9 = google::protobuf::internal::ExtensionSet::Extension::ByteSize((int **)v7 + 5, v7[8]);
    v10 = (int *)*((_QWORD *)v7 + 1);
    if (v10)
    {
      do
      {
        v11 = v10;
        v10 = *(int **)v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        v11 = (int *)*((_QWORD *)v7 + 2);
        v12 = *(_QWORD *)v11 == (_QWORD)v7;
        v7 = v11;
      }
      while (!v12);
    }
    v2 += v9;
    v7 = v11;
  }
  while (v11 != v6);
  return v2;
}

unint64_t google::protobuf::internal::ExtensionSet::Extension::ByteSize(int **this, int a2)
{
  int v4;
  unsigned __int8 v5;
  std::string *v6;
  std::string *v7;
  unint64_t v8;
  int v9;
  unsigned __int8 v10;
  std::string *v11;
  int v12;
  std::string *v13;
  int v14;
  char v15;
  std::string *v16;
  unint64_t v17;
  unsigned int v18;
  char v19;
  std::string *v20;
  uint64_t v21;
  int *v22;
  int v23;
  int *v24;
  int v25;
  int *v26;
  int *v27;
  int v28;
  int *v29;
  int v30;
  int *v31;
  int v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  int v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  int v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int *v50;
  int v51;
  int v52;
  int *v53;
  int v54;
  int v55;
  int *v56;
  int v57;
  int v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  int *v81;
  int v82;
  int v83;
  int *v84;
  int v85;
  int v86;
  int *v87;
  uint64_t v88;
  uint64_t v89;
  int *v90;
  int v91;
  int v92;
  int *v93;
  int *v94;
  int v95;
  int v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(void);
  int v100;
  uint64_t v101;
  char v102;
  std::string v103[2];

  if (*((_BYTE *)this + 9))
  {
    v4 = *((unsigned __int8 *)this + 8);
    v5 = v4 - 19;
    if (*((_BYTE *)this + 11))
    {
      if ((v4 - 19) <= 0xEDu)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        v6 = google::protobuf::internal::LogMessage::operator<<(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v102, (const char **)&v6->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v103[0].__r_.__value_.__l.__data_);
      }
      switch(v4)
      {
        case 1:
        case 6:
        case 16:
          v21 = 8 * **this;
          goto LABEL_63;
        case 2:
        case 7:
        case 15:
          v21 = 4 * **this;
          goto LABEL_63;
        case 3:
          v27 = *this;
          if (**this < 1)
            goto LABEL_7;
          v21 = 0;
          v28 = 0;
          do
          {
            v21 += (9 * (__clz(*(_QWORD *)google::protobuf::RepeatedField<long long>::Get(v27, v28++) | 1) ^ 0x3F) + 73) >> 6;
            v27 = *this;
          }
          while (v28 < **this);
          goto LABEL_63;
        case 4:
          v29 = *this;
          if (**this < 1)
            goto LABEL_7;
          v21 = 0;
          v30 = 0;
          do
          {
            v21 += (9
                  * (__clz(*(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(v29, v30++) | 1) ^ 0x3F)
                  + 73) >> 6;
            v29 = *this;
          }
          while (v30 < **this);
          goto LABEL_63;
        case 5:
          v31 = *this;
          if (**this < 1)
            goto LABEL_7;
          v21 = 0;
          v32 = 0;
          do
          {
            v33 = (int *)google::protobuf::RepeatedField<int>::Get(v31, v32);
            v34 = (9 * (__clz(*v33 | 1) ^ 0x1F) + 73) >> 6;
            if (*v33 >= 0)
              v35 = v34;
            else
              v35 = 10;
            v21 += v35;
            ++v32;
            v31 = *this;
          }
          while (v32 < **this);
          goto LABEL_63;
        case 8:
          v21 = **this;
          goto LABEL_63;
        case 9:
        case 10:
        case 11:
        case 12:
          google::protobuf::internal::LogMessage::LogMessage((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 1599);
          v7 = google::protobuf::internal::LogMessage::operator<<(v103, "Non-primitive types can't be packed.");
          google::protobuf::internal::LogFinisher::operator=((int)&v102, (const char **)&v7->__r_.__value_.__l.__data_);
          google::protobuf::internal::LogMessage::~LogMessage((void **)&v103[0].__r_.__value_.__l.__data_);
          goto LABEL_7;
        case 13:
          v22 = *this;
          if (**this < 1)
            goto LABEL_7;
          v21 = 0;
          v23 = 0;
          do
          {
            v21 += (9 * (__clz(*(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v22, v23++) | 1) ^ 0x1F)
                  + 73) >> 6;
            v22 = *this;
          }
          while (v23 < **this);
          goto LABEL_63;
        case 14:
          v36 = *this;
          if (**this < 1)
            goto LABEL_7;
          v21 = 0;
          v37 = 0;
          do
          {
            v38 = (int *)google::protobuf::RepeatedField<int>::Get(v36, v37);
            v39 = (9 * (__clz(*v38 | 1) ^ 0x1F) + 73) >> 6;
            if (*v38 >= 0)
              v40 = v39;
            else
              v40 = 10;
            v21 += v40;
            ++v37;
            v36 = *this;
          }
          while (v37 < **this);
          goto LABEL_63;
        case 17:
          v24 = *this;
          if (**this < 1)
            goto LABEL_7;
          v21 = 0;
          v25 = 0;
          do
          {
            v26 = (int *)google::protobuf::RepeatedField<int>::Get(v24, v25);
            v21 += (9 * (__clz((2 * *v26) ^ (*v26 >> 31) | 1) ^ 0x1F) + 73) >> 6;
            ++v25;
            v24 = *this;
          }
          while (v25 < **this);
          goto LABEL_63;
        case 18:
          v41 = *this;
          if (**this < 1)
            goto LABEL_7;
          v21 = 0;
          v42 = 0;
          do
          {
            v43 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(v41, v42);
            v21 += (9 * (__clz((2 * *v43) ^ (*v43 >> 63) | 1) ^ 0x3F) + 73) >> 6;
            ++v42;
            v41 = *this;
          }
          while (v42 < **this);
LABEL_63:
          *((_DWORD *)this + 3) = v21;
          v44 = v21 + ((9 * (__clz((8 * a2) | 3) ^ 0x1F) + 73) >> 6) + ((9 * (__clz(v21 | 1) ^ 0x1F) + 73) >> 6);
          if (v21)
            v8 = v44;
          else
            v8 = 0;
          break;
        default:
LABEL_7:
          v8 = 0;
          *((_DWORD *)this + 3) = 0;
          break;
      }
    }
    else
    {
      if ((v4 - 19) > 0xEDu)
      {
        v14 = *((unsigned __int8 *)this + 8);
      }
      else
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        v13 = google::protobuf::internal::LogMessage::operator<<(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v102, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v103[0].__r_.__value_.__l.__data_);
        v14 = *((unsigned __int8 *)this + 8);
        v5 = v14 - 19;
      }
      v15 = v4 == 10;
      if (v5 <= 0xEDu)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
        v16 = google::protobuf::internal::LogMessage::operator<<(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v102, (const char **)&v16->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v103[0].__r_.__value_.__l.__data_);
      }
      v17 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v15;
      switch(v14)
      {
        case 1:
        case 6:
        case 16:
          v18 = v17 + 8;
          goto LABEL_27;
        case 2:
        case 7:
        case 15:
          v18 = v17 + 4;
LABEL_27:
          v8 = v18 * (unint64_t)**this;
          break;
        case 3:
          v50 = *this;
          v51 = **this;
          v8 = v17 * (unint64_t)v51;
          if (v51 >= 1)
          {
            v52 = 0;
            do
            {
              v8 += (9 * (__clz(*(_QWORD *)google::protobuf::RepeatedField<long long>::Get(v50, v52++) | 1) ^ 0x3F)
                   + 73) >> 6;
              v50 = *this;
            }
            while (v52 < **this);
          }
          break;
        case 4:
          v53 = *this;
          v54 = **this;
          v8 = v17 * (unint64_t)v54;
          if (v54 >= 1)
          {
            v55 = 0;
            do
            {
              v8 += (9
                   * (__clz(*(_QWORD *)google::protobuf::RepeatedField<unsigned long long>::Get(v53, v55++) | 1) ^ 0x3F)
                   + 73) >> 6;
              v53 = *this;
            }
            while (v55 < **this);
          }
          break;
        case 5:
          v56 = *this;
          v57 = **this;
          v8 = v17 * (unint64_t)v57;
          if (v57 >= 1)
          {
            v58 = 0;
            do
            {
              v59 = (int *)google::protobuf::RepeatedField<int>::Get(v56, v58);
              v60 = (9 * (__clz(*v59 | 1) ^ 0x1F) + 73) >> 6;
              if (*v59 >= 0)
                v61 = v60;
              else
                v61 = 10;
              v8 += v61;
              ++v58;
              v56 = *this;
            }
            while (v58 < **this);
          }
          break;
        case 8:
          v8 = **this + **this * (unint64_t)v17;
          break;
        case 9:
          v62 = (uint64_t)*this;
          v63 = (*this)[2];
          v8 = v17 * (unint64_t)v63;
          if (v63 >= 1)
          {
            v64 = 0;
            do
            {
              v65 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v62, v64);
              v66 = *(unsigned __int8 *)(v65 + 23);
              if ((v66 & 0x80u) != 0)
                v66 = *(_QWORD *)(v65 + 8);
              v8 += v66 + ((9 * (__clz(v66 | 1) ^ 0x1F) + 73) >> 6);
              ++v64;
              v62 = (uint64_t)*this;
            }
            while (v64 < (*this)[2]);
          }
          break;
        case 10:
          v67 = (uint64_t)*this;
          v68 = (*this)[2];
          v8 = v17 * (unint64_t)v68;
          if (v68 >= 1)
          {
            v69 = 0;
            do
            {
              v70 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v67, v69);
              v8 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v70 + 72))(v70);
              ++v69;
              v67 = (uint64_t)*this;
            }
            while (v69 < (*this)[2]);
          }
          break;
        case 11:
          v71 = (uint64_t)*this;
          v72 = (*this)[2];
          v8 = v17 * (unint64_t)v72;
          if (v72 >= 1)
          {
            v73 = 0;
            do
            {
              v74 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v71, v73);
              v75 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v74 + 72))(v74);
              v8 += v75 + ((9 * (__clz(v75 | 1) ^ 0x1F) + 73) >> 6);
              ++v73;
              v71 = (uint64_t)*this;
            }
            while (v73 < (*this)[2]);
          }
          break;
        case 12:
          v76 = (uint64_t)*this;
          v77 = (*this)[2];
          v8 = v17 * (unint64_t)v77;
          if (v77 >= 1)
          {
            v78 = 0;
            do
            {
              v79 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>(v76, v78);
              v80 = *(unsigned __int8 *)(v79 + 23);
              if ((v80 & 0x80u) != 0)
                v80 = *(_QWORD *)(v79 + 8);
              v8 += v80 + ((9 * (__clz(v80 | 1) ^ 0x1F) + 73) >> 6);
              ++v78;
              v76 = (uint64_t)*this;
            }
            while (v78 < (*this)[2]);
          }
          break;
        case 13:
          v81 = *this;
          v82 = **this;
          v8 = v17 * (unint64_t)v82;
          if (v82 >= 1)
          {
            v83 = 0;
            do
            {
              v8 += (9 * (__clz(*(_DWORD *)google::protobuf::RepeatedField<unsigned int>::Get(v81, v83++) | 1) ^ 0x1F)
                   + 73) >> 6;
              v81 = *this;
            }
            while (v83 < **this);
          }
          break;
        case 14:
          v84 = *this;
          v85 = **this;
          v8 = v17 * (unint64_t)v85;
          if (v85 >= 1)
          {
            v86 = 0;
            do
            {
              v87 = (int *)google::protobuf::RepeatedField<int>::Get(v84, v86);
              v88 = (9 * (__clz(*v87 | 1) ^ 0x1F) + 73) >> 6;
              if (*v87 >= 0)
                v89 = v88;
              else
                v89 = 10;
              v8 += v89;
              ++v86;
              v84 = *this;
            }
            while (v86 < **this);
          }
          break;
        case 17:
          v90 = *this;
          v91 = **this;
          v8 = v17 * (unint64_t)v91;
          if (v91 >= 1)
          {
            v92 = 0;
            do
            {
              v93 = (int *)google::protobuf::RepeatedField<int>::Get(v90, v92);
              v8 += (9 * (__clz((2 * *v93) ^ (*v93 >> 31) | 1) ^ 0x1F) + 73) >> 6;
              ++v92;
              v90 = *this;
            }
            while (v92 < **this);
          }
          break;
        case 18:
          v94 = *this;
          v95 = **this;
          v8 = v17 * (unint64_t)v95;
          if (v95 >= 1)
          {
            v96 = 0;
            do
            {
              v97 = (uint64_t *)google::protobuf::RepeatedField<long long>::Get(v94, v96);
              v8 += (9 * (__clz((2 * *v97) ^ (*v97 >> 63) | 1) ^ 0x3F) + 73) >> 6;
              ++v96;
              v94 = *this;
            }
            while (v96 < **this);
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
    v9 = *((unsigned __int8 *)this + 8);
    v10 = v9 - 19;
    if ((v9 - 19) > 0xEDu)
    {
      v12 = *((unsigned __int8 *)this + 8);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v11 = google::protobuf::internal::LogMessage::operator<<(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v102, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v103[0].__r_.__value_.__l.__data_);
      v12 = *((unsigned __int8 *)this + 8);
      v10 = v12 - 19;
    }
    v19 = v9 == 10;
    if (v10 <= 0xEDu)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v103, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v20 = google::protobuf::internal::LogMessage::operator<<(v103, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v102, (const char **)&v20->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v103[0].__r_.__value_.__l.__data_);
    }
    v8 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << v19;
    switch(v12)
    {
      case 1:
      case 6:
      case 16:
        v8 += 8;
        return v8;
      case 2:
      case 7:
      case 15:
        v8 += 4;
        return v8;
      case 3:
      case 4:
        v46 = (uint64_t)*this;
        goto LABEL_138;
      case 5:
      case 14:
        v47 = (9 * (__clz(*(_DWORD *)this | 1) ^ 0x1F) + 73) >> 6;
        if (*(int *)this >= 0)
          v48 = v47;
        else
          v48 = 10;
        v8 += v48;
        return v8;
      case 8:
        return ++v8;
      case 9:
      case 12:
        v49 = *((_QWORD *)*this + 1);
        if (*((char *)*this + 23) >= 0)
          v49 = *((unsigned __int8 *)*this + 23);
        v8 += v49 + ((9 * (__clz(v49 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 10:
        v8 += (*(uint64_t (**)(int *))(*(_QWORD *)*this + 72))(*this);
        return v8;
      case 11:
        v98 = *(_QWORD *)*this;
        if ((*((_BYTE *)this + 10) & 0x10) != 0)
          v99 = *(uint64_t (**)(void))(v98 + 88);
        else
          v99 = *(uint64_t (**)(void))(v98 + 72);
        v101 = v99();
        v8 += v101 + ((9 * (__clz(v101 | 1) ^ 0x1F) + 73) >> 6);
        return v8;
      case 13:
        v100 = *(_DWORD *)this;
        goto LABEL_136;
      case 17:
        v100 = (2 * *(_DWORD *)this) ^ (*(int *)this >> 31);
LABEL_136:
        v8 += (9 * (__clz(v100 | 1) ^ 0x1F) + 73) >> 6;
        break;
      case 18:
        v46 = (2 * (_QWORD)*this) ^ ((uint64_t)*this >> 63);
LABEL_138:
        v8 += (9 * (__clz(v46 | 1) ^ 0x3F) + 73) >> 6;
        break;
      default:
        return v8;
    }
  }
  return v8;
}

void sub_245C85E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::ExtensionSet::Extension::Free(google::protobuf::internal::ArenaImpl ***this)
{
  uint64_t v2;
  std::string *v3;
  uint64_t v4;
  std::string *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  google::protobuf::internal::ArenaImpl **v9;
  char v10;
  std::string v11[2];

  v2 = *((unsigned __int8 *)this + 8);
  if (*((_BYTE *)this + 9))
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v3 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v3->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    }
    switch(v2)
    {
      case 1:
        if (*this)
        {
          v4 = google::protobuf::RepeatedField<double>::~RepeatedField();
          goto LABEL_29;
        }
        break;
      case 2:
        if (*this)
        {
          v4 = google::protobuf::RepeatedField<float>::~RepeatedField();
          goto LABEL_29;
        }
        break;
      case 3:
      case 16:
      case 18:
        if (*this)
        {
          v4 = google::protobuf::RepeatedField<long long>::~RepeatedField();
          goto LABEL_29;
        }
        break;
      case 4:
      case 6:
        if (*this)
        {
          v4 = google::protobuf::RepeatedField<unsigned long long>::~RepeatedField();
          goto LABEL_29;
        }
        break;
      case 5:
      case 14:
      case 15:
      case 17:
        if (*this)
        {
          v4 = google::protobuf::RepeatedField<int>::~RepeatedField();
          goto LABEL_29;
        }
        break;
      case 7:
      case 13:
        if (*this)
        {
          v4 = google::protobuf::RepeatedField<unsigned int>::~RepeatedField();
          goto LABEL_29;
        }
        break;
      case 8:
        if (*this)
        {
          v4 = google::protobuf::RepeatedField<BOOL>::~RepeatedField();
LABEL_29:
          v8 = 0x1080C4057E67DB5;
          goto LABEL_35;
        }
        break;
      case 9:
      case 12:
        if (*this)
        {
          v4 = google::protobuf::RepeatedPtrField<std::string>::~RepeatedPtrField();
          goto LABEL_34;
        }
        break;
      case 10:
      case 11:
        v9 = *this;
        if (v9)
        {
          google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(v9);
          google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(v9);
LABEL_34:
          v8 = 0x1020C4014030ADELL;
          goto LABEL_35;
        }
        break;
      default:
        return;
    }
  }
  else
  {
    if ((v2 - 19) <= 0xFFFFFFED)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/extension_set.cc", 60);
      v5 = google::protobuf::internal::LogMessage::operator<<(v11, "CHECK failed: type > 0 && type <= WireFormatLite::MAX_FIELD_TYPE: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v5->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
    }
    v6 = google::protobuf::internal::WireFormatLite::kFieldTypeToCppTypeMap[v2];
    if (v6 == 10)
    {
      if (*this)
        (*((void (**)(google::protobuf::internal::ArenaImpl **))**this + 1))(*this);
    }
    else if (v6 == 9)
    {
      v7 = (uint64_t)*this;
      if (v7)
      {
        if (*(char *)(v7 + 23) < 0)
          operator delete(*(void **)v7);
        v4 = v7;
        v8 = 0x1012C40EC159624;
LABEL_35:
        MEMORY[0x249544F58](v4, v8);
      }
    }
  }
}

void sub_245C86068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::GeneratedExtensionFinder::~GeneratedExtensionFinder(google::protobuf::internal::GeneratedExtensionFinder *this)
{
  JUMPOUT(0x249544F58);
}

void google::protobuf::internal::ExtensionSet::ForEach<std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>,google::protobuf::internal::ExtensionSet::~()::$_0>(google::protobuf::internal::ArenaImpl ***a1, google::protobuf::internal::ArenaImpl ****a2)
{
  google::protobuf::internal::ArenaImpl ***v3;
  google::protobuf::internal::ArenaImpl **v4;
  google::protobuf::internal::ArenaImpl ****v5;
  BOOL v6;

  if (a1 != (google::protobuf::internal::ArenaImpl ***)a2)
  {
    v3 = a1;
    do
    {
      google::protobuf::internal::ExtensionSet::Extension::Free(v3 + 5);
      v4 = v3[1];
      if (v4)
      {
        do
        {
          v5 = (google::protobuf::internal::ArenaImpl ****)v4;
          v4 = (google::protobuf::internal::ArenaImpl **)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (google::protobuf::internal::ArenaImpl ****)v3[2];
          v6 = *v5 == v3;
          v3 = (google::protobuf::internal::ArenaImpl ***)v5;
        }
        while (!v6);
      }
      v3 = (google::protobuf::internal::ArenaImpl ***)v5;
    }
    while (v5 != a2);
  }
}

void google::protobuf::internal::arena_destruct_object<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>>(google::protobuf::internal::ArenaImpl **a1)
{
  google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(a1);
  google::protobuf::internal::RepeatedPtrFieldBase::~RepeatedPtrFieldBase(a1);
}

uint64_t google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(uint64_t a1, int a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string v8[2];

  if (a2 < 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1705);
    v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v4->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  if (*(_DWORD *)(a1 + 8) <= a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1706);
    v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (current_size_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * a2 + 8);
}

void sub_245C86204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::AddAllocatedInternal<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(unsigned int *result, uint64_t a2)
{
  int *v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;

  v2 = (int *)*((_QWORD *)result + 2);
  if (!v2)
    return google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(result, a2);
  v3 = *v2;
  if ((int)v3 >= (int)result[3])
    return google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(result, a2);
  v4 = v2 + 2;
  v5 = (int)result[2];
  if ((int)v5 < (int)v3)
    *(_QWORD *)&v4[2 * v3] = *(_QWORD *)&v4[2 * v5];
  *(_QWORD *)&v4[2 * v5] = a2;
  result[2] = v5 + 1;
  ++**((_DWORD **)result + 2);
  return result;
}

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::UnsafeArenaAddAllocated<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(unsigned int *result, uint64_t a2)
{
  unsigned int *v3;
  int *v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  uint64_t v10;

  v3 = result;
  v4 = (int *)*((_QWORD *)result + 2);
  if (!v4)
  {
    v5 = result[3];
    goto LABEL_11;
  }
  v5 = result[2];
  v6 = result[3];
  if (v5 == v6)
  {
LABEL_11:
    result = google::protobuf::internal::RepeatedPtrFieldBase::Reserve(result, v5 + 1);
    goto LABEL_12;
  }
  v7 = *v4;
  if ((_DWORD)v7 != v6)
  {
    if (v5 >= (int)v7)
    {
      v9 = v7 + 1;
      goto LABEL_13;
    }
    *(_QWORD *)&v4[2 * v7 + 2] = *(_QWORD *)&v4[2 * v5 + 2];
LABEL_12:
    v4 = (int *)*((_QWORD *)v3 + 2);
    v9 = *v4 + 1;
LABEL_13:
    *v4 = v9;
    goto LABEL_14;
  }
  result = *(unsigned int **)&v4[2 * v5 + 2];
  if (result)
    v8 = *(_QWORD *)v3 == 0;
  else
    v8 = 0;
  if (v8)
  {
    result = (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)result + 8))(result);
    v4 = (int *)*((_QWORD *)v3 + 2);
  }
LABEL_14:
  v10 = (int)v3[2];
  v3[2] = v10 + 1;
  *(_QWORD *)&v4[2 * v10 + 2] = a2;
  return result;
}

google::protobuf::internal::ExtensionSet *google::protobuf::internal::ExtensionSet::ForEach<std::__map_iterator<std::__tree_iterator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__tree_node<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,void *> *,long>>,google::protobuf::internal::ExtensionSet::MergeFrom(google::protobuf::internal::ExtensionSet const&)::$_0>(_QWORD *a1, _QWORD *a2, google::protobuf::internal::ExtensionSet *this)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      google::protobuf::internal::ExtensionSet::InternalExtensionMergeFrom(this, *((_DWORD *)v5 + 8), (const google::protobuf::internal::ExtensionSet::Extension *)(v5 + 5));
      v6 = (_QWORD *)v5[1];
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v5[2];
          v8 = *v7 == (_QWORD)v5;
          v5 = v7;
        }
        while (!v8);
      }
      v5 = v7;
    }
    while (v7 != a2);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadString(uint64_t a1, std::string::value_type *__s, int a3, std::string *a4)
{
  uint64_t v6;

  if (*(_QWORD *)(a1 + 8) - (_QWORD)__s + 16 < a3)
    return google::protobuf::internal::EpsCopyInputStream::ReadStringFallback(a1, __s, a3, a4);
  v6 = a3;
  MEMORY[0x249544CE8](a4, __s, a3);
  return (google::protobuf::internal::EpsCopyInputStream *)&__s[v6];
}

google::protobuf::internal *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, uint64_t a3)
{
  int v5;
  google::protobuf::internal *result;
  int v7;
  unint64_t v8;
  int v9;
  __int128 v10;
  signed int v11;
  std::string *v12;
  int v13;
  std::string *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  std::string *v18;
  _OWORD v19[2];
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;
  char v23;
  _OWORD v24[2];
  uint64_t v25;
  std::string v26;
  __int16 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (google::protobuf::internal *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (google::protobuf::internal *)((char *)this + 1);
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v15 = (unint64_t)result + v5;
    v16 = *(_OWORD *)(a3 + 16);
    v19[0] = *(_OWORD *)a3;
    v19[1] = v16;
    v20 = *(_QWORD *)(a3 + 32);
    result = (google::protobuf::internal *)google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(result, v15, (unsigned int **)v19);
    if ((google::protobuf::internal *)v15 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      v10 = *(_OWORD *)(a3 + 16);
      v24[0] = *(_OWORD *)a3;
      v24[1] = v10;
      v25 = *(_QWORD *)(a3 + 32);
      result = (google::protobuf::internal *)google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(result, v8, (unsigned int **)v24);
      if (!result)
        break;
      v11 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v11 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v12 = google::protobuf::internal::LogMessage::operator<<(&v26, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v12->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v26.__r_.__value_.__l.__data_);
      }
      v13 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v27 = 0;
        v26.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v26.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v22 = *(_QWORD *)(a3 + 32);
        v17 = *(_OWORD *)(a3 + 16);
        v21[0] = *(_OWORD *)a3;
        v21[1] = v17;
        v18 = (std::string *)google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>((google::protobuf::internal *)((char *)&v26 + v11), (unint64_t)&v26 + v13, (unsigned int **)v21);
        result = 0;
        if (v18 && v18 == (std::string *)((char *)&v26 + v13))
          return (google::protobuf::internal *)(*(_QWORD *)(a1 + 8) + v13);
        return result;
      }
      v5 = v5 - v9 - v11;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v26, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v14 = google::protobuf::internal::LogMessage::operator<<(&v26, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v14->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v26.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result = (google::protobuf::internal *)((char *)result + v11);
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C86644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  google::protobuf::internal::LogMessage::~LogMessage(&a27);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::PackedEnumParserArg<std::string>(void *,char const*,google::protobuf::internal::ParseContext *,BOOL (*)(void const*,int),void const*,google::protobuf::internal::InternalMetadata *,int)::{lambda(unsigned long long)#1}>(google::protobuf::internal *this, unint64_t a2, unsigned int **a3)
{
  unsigned __int8 *v3;
  unint64_t v6;
  int v7;
  unint64_t v8;
  int *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t *v13;
  std::string *v14;

  v3 = (unsigned __int8 *)this;
  if ((unint64_t)this < a2)
  {
    do
    {
      v6 = *v3;
      if ((char)*v3 < 0)
      {
        v7 = v6 + (v3[1] << 7);
        v6 = (v7 - 128);
        if ((char)v3[1] < 0)
        {
          v3 = (unsigned __int8 *)google::protobuf::internal::VarintParseSlow64((google::protobuf::internal *)v3, (v7 - 128));
          if (!v3)
            return v3;
          v6 = v8;
        }
        else
        {
          v3 += 2;
        }
      }
      else
      {
        ++v3;
      }
      if (((unsigned int (*)(unsigned int *, unint64_t))a3[1])(a3[2], v6))
      {
        v9 = (int *)*a3;
        v10 = **a3;
        if ((_DWORD)v10 == (*a3)[1])
        {
          v11 = v10 + 1;
          google::protobuf::RepeatedField<int>::Reserve((int *)*a3, v10 + 1);
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)v9) + 4 * v10) = v6;
        }
        else
        {
          *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)*a3) + 4 * v10) = v6;
          v11 = v10 + 1;
        }
        *v9 = v11;
      }
      else
      {
        v12 = *((_DWORD *)a3 + 8);
        v13 = (uint64_t *)a3[3];
        if ((*v13 & 1) != 0)
          v14 = (std::string *)((*v13 & 0xFFFFFFFFFFFFFFFELL) + 8);
        else
          v14 = (std::string *)google::protobuf::internal::InternalMetadata::mutable_unknown_fields_slow<std::string>(v13);
        google::protobuf::internal::WriteVarint(v12, v6, v14);
      }
    }
    while ((unint64_t)v3 < a2);
  }
  return v3;
}

char *google::protobuf::internal::EpsCopyInputStream::InitFrom(uint64_t a1, char *__src, int64_t __n)
{
  char *v6;
  uint64_t v7;
  char *v8;

  *(_DWORD *)(a1 + 84) = 0;
  if (__n >= 17)
  {
    *(_DWORD *)(a1 + 28) = 16;
    v6 = &__src[__n - 16];
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = a1 + 40;
    if (*(_QWORD *)(a1 + 72) != 1)
      return __src;
    v7 = 2;
    v8 = __src;
    goto LABEL_6;
  }
  v8 = (char *)(a1 + 40);
  memcpy((void *)(a1 + 40), __src, __n);
  *(_DWORD *)(a1 + 28) = 0;
  *(_QWORD *)a1 = &v8[__n];
  *(_QWORD *)(a1 + 8) = &v8[__n];
  *(_QWORD *)(a1 + 16) = 0;
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    v7 = __src - v8;
LABEL_6:
    *(_QWORD *)(a1 + 72) = v7;
  }
  return v8;
}

void google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  std::string *v5;
  char v6;
  std::string v7[2];

  v1 = *(unsigned int *)(a1 + 8);
  if ((v1 & 0x80000000) != 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1780);
    v5 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (n) >= (0): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v5->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  else if ((_DWORD)v1)
  {
    v3 = (uint64_t *)(*(_QWORD *)(a1 + 16) + 8);
    do
    {
      v4 = *v3++;
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 40))(v4);
      --v1;
    }
    while (v1);
    *(_DWORD *)(a1 + 8) = 0;
  }
}

void sub_245C868E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<google::protobuf::MessageLite>::TypeHandler>(_QWORD *a1)
{
  unsigned int *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    v3 = v2 + 2;
    v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
          (*(void (**)(_QWORD))(*(_QWORD *)*v3 + 8))(*v3);
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

uint64_t **std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(uint64_t **a1, int *a2, _OWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  uint64_t **v8;
  int v9;
  uint64_t *v10;
  __int128 v11;

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
    v10 = (uint64_t *)operator new(0x40uLL);
    v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void google::protobuf::internal::arena_destruct_object<std::map<int,google::protobuf::internal::ExtensionSet::Extension>>(uint64_t a1)
{
  std::__tree<std::__value_type<std::string_view,int>,std::__map_value_compare<std::string_view,std::__value_type<std::string_view,int>,std::less<std::string_view>,true>,std::allocator<std::__value_type<std::string_view,int>>>::destroy(a1, *(_QWORD **)(a1 + 8));
}

uint64_t *std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__emplace_hint_unique_key_args<int,std::pair<int const,google::protobuf::internal::ExtensionSet::Extension>>(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  __int128 v9;
  uint64_t v11;
  uint64_t *v12;

  v6 = std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__find_equal<int>(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x40uLL);
    v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v12, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::__map_value_compare<int,std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>,std::less<int>,true>,std::allocator<std::__value_type<int,google::protobuf::internal::ExtensionSet::Extension>>>::__find_equal<int>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void google::protobuf::internal::ExtensionSet::IsInitialized()
{
  __assert_rtn("flat_end", "extension_set.h", 829, "!is_large()");
}

uint64_t google::protobuf::internal::DestroyMessage(google::protobuf::internal *this, const void *a2)
{
  return (**(uint64_t (***)(google::protobuf::internal *))this)(this);
}

void google::protobuf::internal::DestroyString(void **this, const void *a2)
{
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void google::protobuf::internal::InitProtobufDefaultsSlow(google::protobuf::internal *this)
{
  unsigned __int8 v1;
  const void *v2;

  if ((v1 & 1) == 0)
  {
    {
      google::protobuf::internal::fixed_address_empty_string = 0;
      unk_2575184E0 = 0;
      qword_2575184E8 = 0;
      google::protobuf::internal::OnShutdownRun((google::protobuf::internal *)google::protobuf::internal::DestroyString, (void (*)(const void *))&google::protobuf::internal::fixed_address_empty_string, v2);
      atomic_store(1u, (unsigned __int8 *)&google::protobuf::internal::init_protobuf_defaults_state);
    }
  }
}

void sub_245C86D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::GenericSwap(google::protobuf::internal *this, google::protobuf::MessageLite *a2, google::protobuf::MessageLite *a3)
{
  uint64_t v5;

  v5 = (*(uint64_t (**)(google::protobuf::internal *, google::protobuf::MessageLite *, google::protobuf::MessageLite *))(*(_QWORD *)this + 24))(this, a2, a3);
  (*(void (**)(uint64_t, google::protobuf::internal *))(*(_QWORD *)v5 + 64))(v5, this);
  (*(void (**)(google::protobuf::internal *))(*(_QWORD *)this + 40))(this);
  (*(void (**)(google::protobuf::internal *, google::protobuf::MessageLite *))(*(_QWORD *)this + 64))(this, a2);
  (*(void (**)(google::protobuf::MessageLite *))(*(_QWORD *)a2 + 40))(a2);
  (*(void (**)(google::protobuf::MessageLite *, uint64_t))(*(_QWORD *)a2 + 64))(a2, v5);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

void sub_245C86DC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void google::protobuf::internal::InitSCCImpl(_DWORD *a1)
{
  unsigned __int8 v2;
  google::protobuf::internal *v3;
  uint64_t v4;
  std::string *v5;
  unsigned __int8 v6;
  char v7;
  std::string v8[2];

  if ((v2 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))google::protobuf::internal::WrappedMutex::~WrappedMutex, &google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::mu, &dword_245BFA000);
  }
  v3 = (google::protobuf::internal *)pthread_self();
  v4 = (uint64_t)v3;
  if (google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner)
  {
    if (v3
      && v3 == (google::protobuf::internal *)google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner)
    {
      goto LABEL_5;
    }
  }
  else if (!v3)
  {
LABEL_5:
    if (*a1 != 1)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/generated_message_util.cc", 785);
      v5 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (scc->visit_status.load(std::memory_order_relaxed)) == (SCCInfoBase::kRunning): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
    }
    return;
  }
  v6 = atomic_load((unsigned __int8 *)&google::protobuf::internal::init_protobuf_defaults_state);
  if ((v6 & 1) == 0)
    google::protobuf::internal::InitProtobufDefaultsSlow(v3);
  std::mutex::lock(&google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::mu);
  google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner = v4;
  google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::runner = 0;
  std::mutex::unlock(&google::protobuf::internal::InitSCCImpl(google::protobuf::internal::SCCInfoBase *)::mu);
}

void sub_245C86F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

_DWORD *google::protobuf::internal::`anonymous namespace'::InitSCC_DFS(_DWORD *result)
{
  uint64_t (**v1)(void);
  _DWORD *v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _DWORD *v8;

  if (*result == -1)
  {
    v1 = (uint64_t (**)(void))result;
    *result = 1;
    v2 = result + 6;
    v3 = result[1];
    if (v3 >= 1)
    {
      for (i = 0; i < v3; ++i)
      {
        if (*(_QWORD *)&v2[2 * i])
        {
          v3 = *((_DWORD *)v1 + 1);
        }
      }
    }
    v5 = v3;
    v6 = *((_DWORD *)v1 + 2);
    if (v6 >= 1)
    {
      v7 = 0;
      v8 = &v2[2 * v5];
      do
      {
        if (**(_QWORD **)&v8[2 * v7])
        {
          v6 = *((_DWORD *)v1 + 2);
        }
        ++v7;
      }
      while (v7 < v6);
    }
    result = (_DWORD *)v1[2]();
    atomic_store(0, (unsigned int *)v1);
  }
  return result;
}

uint64_t google::protobuf::internal::MergeFromImpl<false>(char *__src, int64_t __n, google::protobuf::MessageLite *a3, char a4)
{
  char *v6;
  BOOL v7;
  _BYTE v9[32];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0x7FFFFFFF00000000;
  v14 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
  v15 = 0x80000000;
  v16 = 0;
  v17 = 0;
  v6 = google::protobuf::internal::EpsCopyInputStream::InitFrom((uint64_t)v9, __src, __n);
  if ((*(uint64_t (**)(google::protobuf::MessageLite *, char *, _BYTE *))(*(_QWORD *)a3 + 88))(a3, v6, v9))
    v7 = (_DWORD)v13 == 0;
  else
    v7 = 0;
  if (v7)
  {
    if ((a4 & 2) != 0
      || ((*(uint64_t (**)(google::protobuf::MessageLite *))(*(_QWORD *)a3 + 48))(a3) & 1) != 0)
    {
      return 1;
    }
    google::protobuf::MessageLite::LogInitializationErrorMessage(a3);
  }
  return 0;
}

_QWORD *google::protobuf::MessageLite::InitializationErrorString@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "(cannot determine missing fields for lite message)");
}

void google::protobuf::MessageLite::LogInitializationErrorMessage(google::protobuf::MessageLite *this)
{
  std::string *v2;
  char v3;
  std::string __p;
  std::string v5[2];

  google::protobuf::internal::LogMessage::LogMessage((uint64_t)v5, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 133);
  v2 = google::protobuf::internal::LogMessage::operator<<(v5, (const std::string::value_type *)&__p);
  google::protobuf::internal::LogFinisher::operator=((int)&v3, (const char **)&v2->__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  google::protobuf::internal::LogMessage::~LogMessage((void **)&v5[0].__r_.__value_.__l.__data_);
}

void sub_245C87158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0)
    operator delete(__p);
  google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

void google::protobuf::`anonymous namespace'::InitializationErrorMessage(const std::string::value_type *this@<X0>, const char *a2@<X1>, std::string *a3@<X8>)
{
  const std::string::value_type *p_p;
  std::string::size_type v8;
  const std::string::value_type *v9;
  std::string::size_type v10;
  void *__p;
  std::string::size_type v12;
  unsigned __int8 v13;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::append(a3, "Can't ");
  std::string::append(a3, this);
  std::string::append(a3, " message of type \"");
  (*(void (**)(void **__return_ptr, const char *))(*(_QWORD *)a2 + 16))(&__p, a2);
  if ((v13 & 0x80u) == 0)
    p_p = (const std::string::value_type *)&__p;
  else
    p_p = (const std::string::value_type *)__p;
  if ((v13 & 0x80u) == 0)
    v8 = v13;
  else
    v8 = v12;
  std::string::append(a3, p_p, v8);
  if ((char)v13 < 0)
    operator delete(__p);
  std::string::append(a3, "\" because it is missing required fields: ");
  (*(void (**)(void **__return_ptr, const char *))(*(_QWORD *)a2 + 56))(&__p, a2);
  if ((v13 & 0x80u) == 0)
    v9 = (const std::string::value_type *)&__p;
  else
    v9 = (const std::string::value_type *)__p;
  if ((v13 & 0x80u) == 0)
    v10 = v13;
  else
    v10 = v12;
  std::string::append(a3, v9, v10);
  if ((char)v13 < 0)
    operator delete(__p);
}

void sub_245C87290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

uint64_t google::protobuf::MessageLite::ParseFromArray(google::protobuf::MessageLite *this, char *a2, unsigned int a3)
{
  int64_t v5;

  if ((a3 & 0x80000000) != 0)
    google::protobuf::MessageLite::ParseFromArray();
  v5 = a3;
  (*(void (**)(google::protobuf::MessageLite *))(*(_QWORD *)this + 40))(this);
  return google::protobuf::internal::MergeFromImpl<false>(a2, v5, this, 1);
}

BOOL google::protobuf::MessageLite::AppendToString(const char *a1, std::string *a2)
{
  std::string *v4;
  std::string *v5;
  char v7;
  std::string __p;
  std::string v9[2];

  if (((*(uint64_t (**)(const char *))(*(_QWORD *)a1 + 48))(a1) & 1) == 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v9, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 449);
    v4 = google::protobuf::internal::LogMessage::operator<<(v9, "CHECK failed: IsInitialized(): ");
    v5 = google::protobuf::internal::LogMessage::operator<<(v4, (const std::string::value_type *)&__p);
    google::protobuf::internal::LogFinisher::operator=((int)&v7, (const char **)&v5->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9[0].__r_.__value_.__l.__data_);
  }
  return google::protobuf::MessageLite::AppendPartialToString((uint64_t)a1, a2);
}

void sub_245C873DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16)
{
  if (a15 < 0)
    operator delete(__p);
  google::protobuf::internal::LogMessage::~LogMessage(&a16);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::MessageLite::AppendPartialToString(uint64_t a1, std::string *a2)
{
  std::string *v2;
  std::string::size_type size;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  char v14;
  std::string __p[2];
  std::string v16[2];
  uint64_t v17;
  __int16 v18;
  char v19;
  uint64_t v20;

  v2 = a2;
  v20 = *MEMORY[0x24BDAC8D0];
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    size = a2->__r_.__value_.__l.__size_;
  else
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
  v6 = v5;
  v7 = v5 >> 31;
  if (v5 >> 31)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 457);
    (*(void (**)(std::string *__return_ptr, uint64_t))(*(_QWORD *)a1 + 16))(__p, a1);
    v10 = google::protobuf::internal::LogMessage::operator<<(v16, (const std::string::value_type *)__p);
    v11 = google::protobuf::internal::LogMessage::operator<<(v10, " exceeded maximum protobuf size of 2GB: ");
    v12 = google::protobuf::internal::LogMessage::operator<<(v11, v6);
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v12->__r_.__value_.__l.__data_);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
    v9 = v16;
    goto LABEL_12;
  }
  std::string::resize(v2, v5 + size, 0);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
    v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  *(_OWORD *)&v16[0].__r_.__value_.__l.__data_ = (unint64_t)v2 + size + v6;
  v17 = 0;
  v18 = 0;
  v19 = google::protobuf::io::CodedOutputStream::default_serialization_deterministic_ & 1;
  if (v16[0].__r_.__value_.__r.__words[0] != (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/message_lite.cc", 360);
    v8 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: target + size == res: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
    v9 = __p;
LABEL_12:
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v9->__r_.__value_.__l.__data_);
  }
  return v7 == 0;
}

void sub_245C875B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  google::protobuf::internal::LogMessage::~LogMessage(&__p);
  _Unwind_Resume(a1);
}

BOOL google::protobuf::MessageLite::SerializeAsString@<W0>(google::protobuf::MessageLite *this@<X0>, uint64_t a2@<X8>)
{
  _BOOL8 result;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  result = google::protobuf::MessageLite::AppendToString((const char *)this, (std::string *)a2);
  if (!result)
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
  }
  return result;
}

void sub_245C87650(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void google::protobuf::internal::OnShutdownRun(google::protobuf::internal *this, void (*a2)(const void *), const void *a3)
{
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;

  v5 = google::protobuf::internal::ShutdownData::get(this);
  std::mutex::lock((std::mutex *)(v5 + 24));
  v6 = *(_QWORD **)(v5 + 8);
  v7 = *(_QWORD *)(v5 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v9 = ((uint64_t)v6 - *(_QWORD *)v5) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      std::vector<std::function<NSArray<NSString *> * ()(scml::TextModerationTokenizer const*,NSArray<NSString *> *)>>::__throw_length_error[abi:ne180100]();
    v11 = v7 - *(_QWORD *)v5;
    if (v11 >> 3 > v10)
      v10 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>(v5 + 16, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v9];
    v15 = &v13[16 * v12];
    *(_QWORD *)v14 = this;
    *((_QWORD *)v14 + 1) = a2;
    v8 = v14 + 16;
    v17 = *(char **)v5;
    v16 = *(char **)(v5 + 8);
    if (v16 != *(char **)v5)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v16 - 1);
        v14 -= 16;
        v16 -= 16;
      }
      while (v16 != v17);
      v16 = *(char **)v5;
    }
    *(_QWORD *)v5 = v14;
    *(_QWORD *)(v5 + 8) = v8;
    *(_QWORD *)(v5 + 16) = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v6 = this;
    v6[1] = a2;
    v8 = v6 + 2;
  }
  *(_QWORD *)(v5 + 8) = v8;
  std::mutex::unlock((std::mutex *)(v5 + 24));
}

void sub_245C87778(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::ShutdownData::get(google::protobuf::internal::ShutdownData *this)
{
  unsigned __int8 v1;
  uint64_t v3;

  if ((v1 & 1) == 0
  {
    v3 = operator new();
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(v3 + 8) = 0;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 850045863;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
    *(_QWORD *)(v3 + 80) = 0;
    google::protobuf::internal::ShutdownData::get(void)::data = v3;
  }
  return google::protobuf::internal::ShutdownData::get(void)::data;
}

void sub_245C87818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

google::protobuf::internal::ShutdownData *google::protobuf::ShutdownProtobufLibrary(google::protobuf::internal::ShutdownData *this)
{
  if ((google::protobuf::ShutdownProtobufLibrary(void)::is_shutdown & 1) == 0)
  {
    this = (google::protobuf::internal::ShutdownData *)google::protobuf::internal::ShutdownData::get(this);
    if (this)
    {
      google::protobuf::internal::ShutdownData::~ShutdownData(this);
      this = (google::protobuf::internal::ShutdownData *)MEMORY[0x249544F58]();
    }
    google::protobuf::ShutdownProtobufLibrary(void)::is_shutdown = 1;
  }
  return this;
}

void google::protobuf::internal::ShutdownData::~ShutdownData(google::protobuf::internal::ShutdownData *this)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  void (*v6)(_QWORD);
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD **)this;
  v3 = (_QWORD *)*((_QWORD *)this + 1);
  v4 = v3 - 2;
  if (*(_QWORD **)this != v3 && v4 > v2)
  {
    do
    {
      v6 = (void (*)(_QWORD))*v2;
      *v2 = *v4;
      *v4 = v6;
      v7 = v2[1];
      v2[1] = v4[1];
      v4[1] = v7;
      v2 += 2;
      v4 -= 2;
    }
    while (v2 < v4);
    v2 = *(_QWORD **)this;
    v3 = (_QWORD *)*((_QWORD *)this + 1);
  }
  while (v2 != v3)
  {
    ((void (*)(_QWORD))*v2)(v2[1]);
    v2 += 2;
  }
  std::mutex::~mutex((std::mutex *)((char *)this + 24));
  v8 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v8;
    operator delete(v8);
  }
}

void google::protobuf::MessageLite::ParseFromArray()
{
  __assert_rtn("StringPiece", "stringpiece.h", 229, "len >= 0");
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::Next(google::protobuf::internal::EpsCopyInputStream *this)
{
  std::string *v2;
  google::protobuf::internal::EpsCopyInputStream *result;
  uint64_t v4;
  int v5;
  char v6;
  std::string v7[2];

  if (*((int *)this + 7) <= 16)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 158);
    v2 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: limit_ > kSlopBytes: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v6, (const char **)&v2->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  result = google::protobuf::internal::EpsCopyInputStream::NextBuffer(this, 0, -1);
  v4 = *((_QWORD *)this + 1);
  if (result)
  {
    v5 = *((_DWORD *)this + 7) + (_DWORD)result - v4;
    *((_DWORD *)this + 7) = v5;
    v4 += v5 & (v5 >> 31);
  }
  else
  {
    *((_DWORD *)this + 20) = 1;
  }
  *(_QWORD *)this = v4;
  return result;
}

void sub_245C879F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::NextBuffer(google::protobuf::internal::EpsCopyInputStream *this, unsigned int a2, int a3)
{
  google::protobuf::internal::EpsCopyInputStream *v3;
  char *v5;
  int v6;
  std::string *v7;
  int v8;
  std::string *v10;
  std::string *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  BOOL v17;
  const char *v18;
  char *SizeFallback;
  uint64_t v20;
  size_t v21;
  std::string *v22;
  std::string *v23;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  char *v28;
  void *v29;
  unint64_t v30;
  char v31;
  void *__src;
  std::string v33[2];

  v3 = (google::protobuf::internal::EpsCopyInputStream *)*((_QWORD *)this + 2);
  if (!v3)
    return v3;
  v5 = (char *)this + 40;
  if (v3 != (google::protobuf::internal::EpsCopyInputStream *)((char *)this + 40))
  {
    v6 = *((_DWORD *)this + 6);
    if (v6 <= 16)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 105);
      v7 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: size_ > kSlopBytes: ");
      google::protobuf::internal::LogFinisher::operator=((int)&__src, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
      v3 = (google::protobuf::internal::EpsCopyInputStream *)*((_QWORD *)this + 2);
      v6 = *((_DWORD *)this + 6);
    }
    *((_QWORD *)this + 1) = (char *)v3 + v6 - 16;
    *((_QWORD *)this + 2) = v5;
    if (*((_QWORD *)this + 9) == 1)
      *((_QWORD *)this + 9) = 2;
    return v3;
  }
  *(_OWORD *)v3 = *(_OWORD *)*((_QWORD *)this + 1);
  if (*((int *)this + 21) < 1)
    goto LABEL_46;
  v8 = a3;
  if (a3 < 0)
    goto LABEL_39;
  if ((a2 & 0x80000000) != 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 53);
    v11 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: overrun >= 0: ");
    google::protobuf::internal::LogFinisher::operator=((int)&__src, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
LABEL_14:
    v12 = (unsigned __int8 *)this + 56;
    v13 = (unsigned __int8 *)v3 + (int)a2;
    v14 = v13;
    while (2)
    {
      v15 = (char)*v14++;
      v16 = v15;
      if (v15 < 0)
      {
        v16 = v16 + (*v14 << 7) - 128;
        if ((char)*v14 < 0)
        {
          v14 = v13 + 3;
          v20 = -21;
          while (1)
          {
            v16 += (*(v14 - 1) - 1) << (v20 + 35);
            if (((char)*(v14 - 1) & 0x80000000) == 0)
              break;
            ++v14;
            v20 += 7;
            if (!v20)
              goto LABEL_39;
          }
        }
        else
        {
          v14 = v13 + 2;
        }
      }
      if (v14 <= v12)
      {
        if (!v16)
          goto LABEL_46;
        switch(v16 & 7)
        {
          case 0:
            v33[0].__r_.__value_.__r.__words[0] = 0;
            v14 = google::protobuf::internal::VarintParse<unsigned long long>((char *)v14, v33);
            if (!v14)
              goto LABEL_39;
            goto LABEL_38;
          case 1:
            v14 += 8;
            goto LABEL_38;
          case 2:
            v18 = (const char *)*v14;
            if ((char)*v14 < 0)
            {
              SizeFallback = google::protobuf::internal::ReadSizeFallback((google::protobuf::internal *)v14, v18);
              if (!SizeFallback)
                goto LABEL_39;
            }
            else
            {
              SizeFallback = (char *)(v14 + 1);
            }
            if (v12 - (unsigned __int8 *)SizeFallback < (int)v18)
              goto LABEL_39;
            v14 = (unsigned __int8 *)&SizeFallback[(int)v18];
LABEL_38:
            v13 = v14;
            if (v14 >= v12)
              goto LABEL_39;
            continue;
          case 3:
            ++v8;
            goto LABEL_38;
          case 4:
            v17 = __OFSUB__(v8--, 1);
            if (v8 < 0 != v17)
              goto LABEL_46;
            goto LABEL_38;
          case 5:
            v14 += 4;
            goto LABEL_38;
          default:
            goto LABEL_39;
        }
      }
      goto LABEL_39;
    }
  }
  if (a2 >= 0x11)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 54);
    v10 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: overrun <= kSlopBytes: ");
    google::protobuf::internal::LogFinisher::operator=((int)&__src, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    goto LABEL_39;
  }
  if (a2 != 16)
    goto LABEL_14;
LABEL_39:
  __src = 0;
  if (!(*(unsigned int (**)(_QWORD, void **, char *))(**((_QWORD **)this + 4) + 16))(*((_QWORD *)this + 4), &__src, (char *)this + 24))
  {
LABEL_45:
    *((_DWORD *)this + 21) = 0;
LABEL_46:
    if (*((_QWORD *)this + 9) == 2)
      *((_QWORD *)this + 9) = *((_QWORD *)this + 1) - (_QWORD)v3;
    *((_QWORD *)this + 1) = (char *)this + 56;
    *((_QWORD *)this + 2) = 0;
    *((_DWORD *)this + 6) = 0;
    return v3;
  }
  while (1)
  {
    v21 = *((unsigned int *)this + 6);
    *((_DWORD *)this + 21) -= v21;
    if ((int)v21 >= 17)
    {
      v27 = *((_QWORD *)this + 9);
      v26 = (_QWORD *)((char *)this + 72);
      v25 = v27;
      v28 = (char *)(v26 - 2);
      v29 = __src;
      *((_OWORD *)v26 - 1) = *(_OWORD *)__src;
      *(v26 - 7) = v29;
      goto LABEL_52;
    }
    if ((int)v21 >= 1)
      break;
    if ((_DWORD)v21)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v33, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 137);
      v22 = google::protobuf::internal::LogMessage::operator<<(v33, "CHECK failed: size_ == 0: ");
      v23 = google::protobuf::internal::LogMessage::operator<<(v22, *((_DWORD *)this + 6));
      google::protobuf::internal::LogFinisher::operator=((int)&v31, (const char **)&v23->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v33[0].__r_.__value_.__l.__data_);
    }
    if (((*(uint64_t (**)(_QWORD, void **, char *))(**((_QWORD **)this + 4) + 16))(*((_QWORD *)this + 4), &__src, (char *)this + 24) & 1) == 0)goto LABEL_45;
  }
  memcpy((char *)this + 56, __src, v21);
  v30 = *((_QWORD *)this + 9);
  v26 = (_QWORD *)((char *)this + 72);
  v25 = v30;
  v28 = (char *)v3 + v21;
  *(v26 - 7) = v3;
LABEL_52:
  *(v26 - 8) = v28;
  if (v25 > 1)
    *v26 = 1;
  return v3;
}

void sub_245C87DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::internal::EpsCopyInputStream::DoneFallback(google::protobuf::internal::EpsCopyInputStream *this, signed int a2, int a3)
{
  int v3;
  signed int v5;
  std::string *v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  google::protobuf::internal::EpsCopyInputStream *Buffer;
  uint64_t v14;
  int v15;
  uint64_t result;
  std::string *v17;
  char v18;
  std::string v19[2];

  v3 = *((_DWORD *)this + 7);
  if (v3 < a2)
    return 0;
  v5 = a2;
  if (v3 == a2)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 175);
    v7 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: overrun != limit_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v7->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    v3 = *((_DWORD *)this + 7);
  }
  if (v3 <= v5)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 176);
    v8 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: overrun < limit_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v8->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    v3 = *((_DWORD *)this + 7);
  }
  if (*(_QWORD *)this != *((_QWORD *)this + 1) + (v3 & (v3 >> 31)))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 181);
    v9 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_end_ == buffer_end_ + (std::min)(0, limit_): ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v9->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    v3 = *((_DWORD *)this + 7);
  }
  if (v3 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 183);
    v10 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_ > 0: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v10->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
  if (*(_QWORD *)this != *((_QWORD *)this + 1))
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 184);
    v11 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_end_ == buffer_end_: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
  while (1)
  {
    if (v5 < 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 188);
      v12 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: overrun >= 0: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v12->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
    }
    Buffer = google::protobuf::internal::EpsCopyInputStream::NextBuffer(this, v5, a3);
    if (!Buffer)
      break;
    v14 = *((_QWORD *)this + 1);
    v15 = *((_DWORD *)this + 7) + (_DWORD)Buffer - v14;
    *((_DWORD *)this + 7) = v15;
    result = (uint64_t)Buffer + v5;
    v5 = result - v14;
    if ((int)result - (int)v14 < 0)
    {
      *(_QWORD *)this = v14 + (v15 & (v15 >> 31));
      return result;
    }
  }
  if (v5)
    return 0;
  if (*((int *)this + 7) <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v19, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/parse_context.cc", 193);
    v17 = google::protobuf::internal::LogMessage::operator<<(v19, "CHECK failed: limit_ > 0: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v18, (const char **)&v17->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v19[0].__r_.__value_.__l.__data_);
  }
  result = *((_QWORD *)this + 1);
  *(_QWORD *)this = result;
  *((_DWORD *)this + 20) = 1;
  return result;
}

void sub_245C88090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::SkipFallback(google::protobuf::internal::EpsCopyInputStream *this, const char *a2, int a3)
{
  int v5;
  BOOL v6;
  std::string *v7;
  google::protobuf::internal::EpsCopyInputStream *result;
  char v9;
  std::string v10[2];

  v5 = *((_DWORD *)this + 2) - (_DWORD)a2 + 16;
  while (1)
  {
    v6 = __OFSUB__(a3, v5);
    a3 -= v5;
    if ((a3 < 0) ^ v6 | (a3 == 0))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: size > chunk_size: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    if (!*((_QWORD *)this + 2) || *((int *)this + 7) < 17)
      break;
    result = google::protobuf::internal::EpsCopyInputStream::Next(this);
    if (!result)
      return result;
    v5 = *((_DWORD *)this + 2) - (_DWORD)result;
    if (a3 <= v5)
      return (google::protobuf::internal::EpsCopyInputStream *)((char *)result + a3 + 16);
  }
  return 0;
}

void sub_245C881A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadStringFallback(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5;
  const std::string::value_type *v6;
  uint64_t v8;
  std::string::size_type size;
  int v10;
  int v11;
  BOOL v12;
  std::string *v13;
  google::protobuf::internal::EpsCopyInputStream *result;
  char v15;
  std::string v16[2];

  v5 = a3;
  v6 = __s;
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
  v8 = *(_QWORD *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      size = this->__r_.__value_.__l.__size_;
    else
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (a3 >= 50000000)
      v10 = 50000000;
    else
      v10 = a3;
    std::string::reserve(this, size + v10);
    v8 = *(_QWORD *)(a1 + 8);
  }
  v11 = v8 - (_DWORD)v6 + 16;
  while (1)
  {
    v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      v13 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: size > chunk_size: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    }
    if (!*(_QWORD *)(a1 + 16))
      break;
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17)
      break;
    result = google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
    if (!result)
      return result;
    v6 = (char *)result + 16;
    v11 = *(_DWORD *)(a1 + 8) - (_DWORD)result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5];
    }
  }
  return 0;
}

void sub_245C88328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::AppendStringFallback(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  int v5;
  const std::string::value_type *v6;
  uint64_t v8;
  std::string::size_type size;
  int v10;
  int v11;
  BOOL v12;
  std::string *v13;
  google::protobuf::internal::EpsCopyInputStream *result;
  char v15;
  std::string v16[2];

  v5 = a3;
  v6 = __s;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      size = this->__r_.__value_.__l.__size_;
    else
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (a3 >= 50000000)
      v10 = 50000000;
    else
      v10 = a3;
    std::string::reserve(this, size + v10);
    v8 = *(_QWORD *)(a1 + 8);
  }
  v11 = v8 - (_DWORD)v6 + 16;
  while (1)
  {
    v12 = __OFSUB__(v5, v11);
    v5 -= v11;
    if ((v5 < 0) ^ v12 | (v5 == 0))
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v16, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 323);
      v13 = google::protobuf::internal::LogMessage::operator<<(v16, "CHECK failed: size > chunk_size: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v15, (const char **)&v13->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v16[0].__r_.__value_.__l.__data_);
    }
    if (!*(_QWORD *)(a1 + 16))
      break;
    std::string::append(this, v6, v11);
    if (*(int *)(a1 + 28) < 17)
      break;
    result = google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
    if (!result)
      return result;
    v6 = (char *)result + 16;
    v11 = *(_DWORD *)(a1 + 8) - (_DWORD)result;
    if (v5 <= v11)
    {
      std::string::append(this, v6, v5);
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5];
    }
  }
  return 0;
}

void sub_245C8848C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

char *google::protobuf::internal::ParseContext::ParseMessage<google::protobuf::MessageLite>(google::protobuf::internal::EpsCopyInputStream *this, uint64_t a2, google::protobuf::internal *a3)
{
  int v6;
  const char *v7;
  const char *v8;
  char *result;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;

  v6 = *(char *)a3;
  v7 = (const char *)*(unsigned __int8 *)a3;
  if (v6 < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback(a3, v7);
    if (!result)
      return result;
    v8 = result;
    LODWORD(v7) = v10;
  }
  else
  {
    v8 = (char *)a3 + 1;
  }
  v11 = google::protobuf::internal::EpsCopyInputStream::PushLimit(this, v8, v7);
  v12 = *((_DWORD *)this + 22);
  v13 = __OFSUB__(v12--, 1);
  *((_DWORD *)this + 22) = v12;
  if (v12 < 0 != v13)
    return 0;
  v14 = v11;
  result = (char *)(*(uint64_t (**)(uint64_t, const char *, google::protobuf::internal::EpsCopyInputStream *))(*(_QWORD *)a2 + 88))(a2, v8, this);
  if (!result)
    return result;
  ++*((_DWORD *)this + 22);
  if (*((_DWORD *)this + 20))
    return 0;
  v15 = *((_DWORD *)this + 7) + v14;
  *((_DWORD *)this + 7) = v15;
  *(_QWORD *)this = *((_QWORD *)this + 1) + (v15 & (v15 >> 31));
  return result;
}

void google::protobuf::internal::WriteVarint(int a1, unint64_t a2, std::string *this)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = (8 * a1);
  if (v5 < 0x80)
  {
    LOBYTE(v6) = 8 * a1;
  }
  else
  {
    do
    {
      std::string::push_back(this, v5 | 0x80);
      v6 = v5 >> 7;
      v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  std::string::push_back(this, v6);
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      std::string::push_back(this, a2 | 0x80);
      v8 = a2 >> 7;
      v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }
  std::string::push_back(this, v8);
}

uint64_t google::protobuf::internal::VarintParseSlow32(google::protobuf::internal *this, const char *a2)
{
  uint64_t result;
  uint64_t v4;

  result = (uint64_t)this + 3;
  v4 = -21;
  while (1)
  {
    LODWORD(a2) = ((*(unsigned __int8 *)(result - 1) - 1) << (v4 + 35)) + (_DWORD)a2;
    if ((*(char *)(result - 1) & 0x80000000) == 0)
      break;
    ++result;
    v4 += 7;
    if (!v4)
    {
      while (*((char *)this + v4 + 5) < 0)
      {
        result = 0;
        if (++v4 == 5)
          return result;
      }
      return (uint64_t)this + v4 + 6;
    }
  }
  return result;
}

uint64_t google::protobuf::internal::VarintParseSlow64(google::protobuf::internal *this, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  int v6;

  a2 = a2;
  result = (uint64_t)this + 3;
  v4 = (char *)this + 2;
  v5 = 14;
  while (1)
  {
    v6 = *v4++;
    a2 += (v6 - 1) << v5;
    if ((v6 & 0x80000000) == 0)
      break;
    ++result;
    v5 += 7;
    if (v5 == 70)
      return 0;
  }
  return result;
}

uint64_t google::protobuf::internal::ReadTagFallback(google::protobuf::internal *this, const char *a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  int v6;

  result = (uint64_t)this + 3;
  v4 = (char *)this + 2;
  v5 = -21;
  while (1)
  {
    v6 = *v4++;
    LODWORD(a2) = ((v6 - 1) << (v5 + 35)) + (_DWORD)a2;
    if ((v6 & 0x80000000) == 0)
      break;
    ++result;
    v5 += 7;
    if (!v5)
      return 0;
  }
  return result;
}

char *google::protobuf::internal::ReadSizeFallback(google::protobuf::internal *this, const char *a2)
{
  char *result;
  uint64_t v4;
  unsigned int v5;
  char *v6;

  result = (char *)this + 2;
  v4 = -21;
  while (1)
  {
    LODWORD(a2) = ((*(result - 1) - 1) << (v4 + 28)) + (_DWORD)a2;
    if ((*(result - 1) & 0x80000000) == 0)
      break;
    ++result;
    v4 += 7;
    if (!v4)
    {
      v5 = *((unsigned __int8 *)this + 4);
      v6 = (char *)this + 5;
      if (a2 + (v5 << 28) - 0x10000000 > 0x7FFFFFEF)
        v6 = 0;
      if (v5 <= 7)
        return v6;
      else
        return 0;
    }
  }
  return result;
}

char *google::protobuf::internal::InlineGreedyStringParser(std::string *a1, std::string::value_type *this, uint64_t a3)
{
  int v5;
  std::string::value_type *v6;
  char *result;
  int v8;

  v5 = *this;
  if (*this < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback((google::protobuf::internal *)this, (const char *)*this);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = this + 1;
  }
  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadString(a3, v6, v5, a1);
}

unsigned __int8 *google::protobuf::internal::PackedInt32Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedUInt32Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedInt64Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedUInt64Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedSInt32Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedSInt64Parser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

unsigned __int8 *google::protobuf::internal::PackedBoolParser(google::protobuf::internal *this, google::protobuf::internal *a2, const char *a3, google::protobuf::internal::ParseContext *a4)
{
  return google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((uint64_t)a3, a2, (int *)this);
}

char *google::protobuf::internal::FixedParser<unsigned int>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = (char *)this + 1;
  }
  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned int>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<int>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = (char *)this + 1;
  }
  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<int>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<unsigned long long>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = (char *)this + 1;
  }
  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned long long>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<long long>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = (char *)this + 1;
  }
  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<long long>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<float>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = (char *)this + 1;
  }
  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<float>(a3, v6, v5, a1);
}

char *google::protobuf::internal::FixedParser<double>(int *a1, google::protobuf::internal *this, google::protobuf::internal::EpsCopyInputStream *a3)
{
  int v5;
  char *v6;
  char *result;
  int v8;

  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v6 = result;
    v5 = v8;
  }
  else
  {
    v6 = (char *)this + 1;
  }
  return (char *)google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<double>(a3, v6, v5, a1);
}

char *google::protobuf::internal::WireFormatParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(google::protobuf::internal::UnknownFieldLiteParserHelper *a1, char *a2, google::protobuf::internal::EpsCopyInputStream *this)
{
  char *v5;
  int v6;
  uint64_t v8;
  char *v10;

  v10 = a2;
  while (1)
  {
    if ((google::protobuf::internal::EpsCopyInputStream::DoneWithCheck(this, (const char **)&v10, *((_DWORD *)this + 23)) & 1) != 0)return v10;
    v5 = v10 + 1;
    v6 = *v10;
    if (*v10 < 0)
    {
      v6 = v6 + (*v5 << 7) - 128;
      if (*v5 < 0)
      {
        v5 = v10 + 3;
        v8 = -21;
        while (1)
        {
          v6 += (*(v5 - 1) - 1) << (v8 + 35);
          if ((*(v5 - 1) & 0x80000000) == 0)
            break;
          ++v5;
          v8 += 7;
          if (!v8)
            return 0;
        }
      }
      else
      {
        v5 = v10 + 2;
      }
    }
    v10 = v5;
    if (!v6 || (v6 & 7) == 4)
      break;
    v10 = (char *)google::protobuf::internal::FieldParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(v6, a1, (google::protobuf::internal *)v5);
    if (!v10)
      return 0;
  }
  *((_DWORD *)this + 20) = v6 - 1;
  return v5;
}

unsigned __int8 *google::protobuf::internal::UnknownFieldParse(unsigned int a1, std::string *a2, google::protobuf::internal *a3, google::protobuf::internal::ParseContext *a4)
{
  std::string *v5;

  v5 = a2;
  return google::protobuf::internal::FieldParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(a1, &v5, a3, a4);
}

unsigned __int8 *google::protobuf::internal::FieldParser<google::protobuf::internal::UnknownFieldLiteParserHelper>(unint64_t a1, std::string **this, google::protobuf::internal *a3, google::protobuf::internal::ParseContext *a4)
{
  unint64_t v4;
  unsigned __int8 *v5;
  std::string *v7;
  unsigned __int8 *v8;
  char v10;
  std::string v11[2];

  v4 = a1 >> 3;
  if (!(a1 >> 3))
    return 0;
  v5 = (unsigned __int8 *)a3;
  switch(a1 & 7)
  {
    case 0uLL:
      v11[0].__r_.__value_.__r.__words[0] = 0;
      v5 = google::protobuf::internal::VarintParse<unsigned long long>((char *)a3, v11);
      if (v5)
        google::protobuf::internal::UnknownFieldLiteParserHelper::AddVarint(this, v4, v11[0].__r_.__value_.__r.__words[0]);
      return v5;
    case 1uLL:
      v5 = (unsigned __int8 *)a3 + 8;
      google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed64((std::string *)this, v4, *(_QWORD *)a3);
      return v5;
    case 2uLL:
      v8 = (unsigned __int8 *)google::protobuf::internal::UnknownFieldLiteParserHelper::ParseLengthDelimited(this, v4, (std::string::value_type *)a3, a4);
      goto LABEL_10;
    case 3uLL:
      v8 = (unsigned __int8 *)google::protobuf::internal::UnknownFieldLiteParserHelper::ParseGroup(this, v4, (char *)a3, (int32x2_t *)a4);
LABEL_10:
      v5 = v8;
      break;
    case 4uLL:
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v11, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 758);
      v7 = google::protobuf::internal::LogMessage::operator<<(v11, "Can't happen");
      google::protobuf::internal::LogFinisher::operator=((int)&v10, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v11[0].__r_.__value_.__l.__data_);
      break;
    case 5uLL:
      v5 = (unsigned __int8 *)a3 + 4;
      google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed32((std::string *)this, v4, *(_DWORD *)a3);
      break;
    default:
      return 0;
  }
  return v5;
}

void sub_245C88CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::VarintParse<unsigned long long>(char *a1, _QWORD *a2)
{
  uint64_t v2;
  unsigned __int8 *result;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *a1;
  if (*a1 < 0)
  {
    v4 = a1[1];
    v5 = (v2 + (v4 << 7) - 128);
    if ((v4 & 0x80) != 0)
    {
      result = (unsigned __int8 *)(a1 + 3);
      v6 = 14;
      while (1)
      {
        v5 += (*(result - 1) - 1) << v6;
        if (((char)*(result - 1) & 0x80000000) == 0)
          break;
        ++result;
        v6 += 7;
        if (v6 == 70)
        {
          result = 0;
          v5 = 0;
          break;
        }
      }
      *a2 = v5;
    }
    else
    {
      *a2 = v5;
      return (unsigned __int8 *)(a1 + 2);
    }
  }
  else
  {
    *a2 = v2;
    return (unsigned __int8 *)(a1 + 1);
  }
  return result;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C88F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<int>::Reserve(a3, v7 + 1);
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C89238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned int,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<unsigned int>::Reserve(a3, v7 + 1);
      *(_DWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a3) + 4 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C89504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<long long>::Reserve(a3, v7 + 1);
      *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C897D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<unsigned long long,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = v10;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<unsigned long long>::Reserve(a3, v7 + 1);
      *(_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C89A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<int,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = -(v10 & 1) ^ (v10 >> 1);
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<int>::Reserve(a3, v7 + 1);
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a3) + 4 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C89D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<long long,true>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = -(uint64_t)(v10 & 1) ^ (v10 >> 1);
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<long long>::Reserve(a3, v7 + 1);
      *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
    }
    else
    {
      *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a3) + 8 * v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

unsigned __int8 *google::protobuf::internal::EpsCopyInputStream::ReadPackedVarint<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(uint64_t a1, google::protobuf::internal *this, int *a3)
{
  int v5;
  unsigned __int8 *result;
  int v7;
  unint64_t v8;
  int v9;
  signed int v10;
  std::string *v11;
  int v12;
  std::string *v13;
  unint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  char v17;
  std::string v18;
  __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)this;
  if (*(char *)this < 0)
  {
    result = (unsigned __int8 *)google::protobuf::internal::ReadSizeFallback(this, (const char *)*(unsigned __int8 *)this);
    if (!result)
      return result;
    v5 = v7;
  }
  else
  {
    result = (unsigned __int8 *)this + 1;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = v8 - (_DWORD)result;
  if (v5 <= (int)v8 - (int)result)
  {
LABEL_15:
    v14 = (unint64_t)&result[v5];
    result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v14, a3);
    if ((unsigned __int8 *)v14 != result)
      return 0;
  }
  else
  {
    while (1)
    {
      result = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(result, v8, a3);
      if (!result)
        break;
      v10 = (_DWORD)result - *(_QWORD *)(a1 + 8);
      if (v10 >= 0x11)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 674);
        v11 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: overrun >= 0 && overrun <= kSlopBytes: ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v11->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      v12 = v5 - v9;
      if (v5 - v9 <= 16)
      {
        v19 = 0;
        v18.__r_.__value_.__r.__words[2] = 0;
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = *(_OWORD *)*(_QWORD *)(a1 + 8);
        v15 = google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>((unsigned __int8 *)&v18 + v10, (unint64_t)&v18 + v12, a3);
        if (v15)
          v16 = v15 == (unsigned __int8 *)((char *)&v18 + v12);
        else
          v16 = 0;
        if (!v16)
          return 0;
        return (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + v12);
      }
      v5 = v5 - v9 - v10;
      if (v5 <= 0)
      {
        google::protobuf::internal::LogMessage::LogMessage((uint64_t)&v18, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/parse_context.h", 688);
        v13 = google::protobuf::internal::LogMessage::operator<<(&v18, "CHECK failed: (size) > (0): ");
        google::protobuf::internal::LogFinisher::operator=((int)&v17, (const char **)&v13->__r_.__value_.__l.__data_);
        google::protobuf::internal::LogMessage::~LogMessage((void **)&v18.__r_.__value_.__l.__data_);
      }
      if (*(int *)(a1 + 28) < 17)
        return 0;
      result = (unsigned __int8 *)google::protobuf::internal::EpsCopyInputStream::Next((google::protobuf::internal::EpsCopyInputStream *)a1);
      if (!result)
        return result;
      result += v10;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = v8 - (_DWORD)result;
      if (v5 <= (int)v8 - (int)result)
        goto LABEL_15;
    }
  }
  return result;
}

void sub_245C8A04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

unsigned __int8 *google::protobuf::internal::ReadPackedVarintArray<char const* google::protobuf::internal::VarintParser<BOOL,false>(void *,char const*,google::protobuf::internal::ParseContext *)::{lambda(unsigned long long)#1}>(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  unsigned __int8 *i;
  BOOL v6;
  uint64_t v7;
  int v8;
  uint64_t v10;

  for (i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    v10 = 0;
    i = google::protobuf::internal::VarintParse<unsigned long long>((char *)i, &v10);
    if (!i)
      break;
    v6 = v10 != 0;
    v7 = *a3;
    if ((_DWORD)v7 == a3[1])
    {
      v8 = v7 + 1;
      google::protobuf::RepeatedField<BOOL>::Reserve(a3, v7 + 1);
      *(_BYTE *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a3) + v7) = v6;
    }
    else
    {
      *(_BYTE *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a3) + v7) = v6;
      v8 = v7 + 1;
    }
  }
  return i;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned int>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<unsigned int>::Reserve(a4, *a4 + (v5 >> 2));
    v11 = (void *)google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<unsigned int>::Reserve(a4, *a4 + (v7 >> 2));
      v9 = (void *)google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = (char *)result - (v7 & 3) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<int>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<int>::Reserve(a4, *a4 + (v5 >> 2));
    v11 = (void *)google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<int>::Reserve(a4, *a4 + (v7 >> 2));
      v9 = (void *)google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = (char *)result - (v7 & 3) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<unsigned long long>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<unsigned long long>::Reserve(a4, *a4 + (v5 >> 3));
    v11 = (void *)google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<unsigned long long>::Reserve(a4, *a4 + (v7 >> 3));
      v9 = (void *)google::protobuf::RepeatedField<unsigned long long>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = (char *)result - (v7 & 7) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<long long>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<long long>::Reserve(a4, *a4 + (v5 >> 3));
    v11 = (void *)google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<long long>::Reserve(a4, *a4 + (v7 >> 3));
      v9 = (void *)google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = (char *)result - (v7 & 7) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<float>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<float>::Reserve(a4, *a4 + (v5 >> 2));
    v11 = (void *)google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a4, v5 >> 2);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFFC));
    if (v5 == (v5 & 0xFFFFFFFC))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFFC];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<float>::Reserve(a4, *a4 + (v7 >> 2));
      v9 = (void *)google::protobuf::RepeatedField<float>::AddNAlreadyReserved((uint64_t)a4, v7 >> 2);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFFC));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFFC;
      v6 = (char *)result - (v7 & 3) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 3));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::ReadPackedFixed<double>(google::protobuf::internal::EpsCopyInputStream *a1, char *a2, int a3, int *a4)
{
  int v5;
  char *v6;
  int v7;
  void *v9;
  google::protobuf::internal::EpsCopyInputStream *result;
  void *v11;

  v5 = a3;
  v6 = a2;
  v7 = *((_DWORD *)a1 + 2) - (_DWORD)a2 + 16;
  if (v7 >= a3)
  {
LABEL_5:
    google::protobuf::RepeatedField<double>::Reserve(a4, *a4 + (v5 >> 3));
    v11 = (void *)google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a4, v5 >> 3);
    memcpy(v11, v6, (int)(v5 & 0xFFFFFFF8));
    if (v5 == (v5 & 0xFFFFFFF8))
      return (google::protobuf::internal::EpsCopyInputStream *)&v6[v5 & 0xFFFFFFF8];
    else
      return 0;
  }
  else
  {
    while (1)
    {
      google::protobuf::RepeatedField<double>::Reserve(a4, *a4 + (v7 >> 3));
      v9 = (void *)google::protobuf::RepeatedField<double>::AddNAlreadyReserved((uint64_t)a4, v7 >> 3);
      memcpy(v9, v6, (int)(v7 & 0xFFFFFFF8));
      if (*((int *)a1 + 7) < 17)
        return 0;
      result = google::protobuf::internal::EpsCopyInputStream::Next(a1);
      if (!result)
        return result;
      v5 -= v7 & 0xFFFFFFF8;
      v6 = (char *)result - (v7 & 7) + 16;
      v7 = *((_DWORD *)a1 + 2) - ((_DWORD)result - (v7 & 7));
      if (v5 <= v7)
        goto LABEL_5;
    }
  }
}

void google::protobuf::internal::UnknownFieldLiteParserHelper::AddVarint(std::string **this, int a2, unint64_t a3)
{
  std::string *v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string *v9;
  unint64_t v10;
  unint64_t v11;

  v3 = *this;
  if (*this)
  {
    v6 = (8 * a2);
    if (v6 < 0x80)
    {
      LOBYTE(v7) = 8 * a2;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9 = *this;
    if (a3 < 0x80)
    {
      LOBYTE(v10) = a3;
    }
    else
    {
      do
      {
        std::string::push_back(v9, a3 | 0x80);
        v10 = a3 >> 7;
        v11 = a3 >> 14;
        a3 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v9, v10);
  }
}

std::string *google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed64(std::string *this, int a2, uint64_t a3)
{
  std::string *v3;
  std::string **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  if (this->__r_.__value_.__r.__words[0])
  {
    v5 = (std::string **)this;
    v6 = (8 * a2) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 1;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    v9[0] = a3;
    return std::string::append(*v5, (const std::string::value_type *)v9, 8uLL);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::UnknownFieldLiteParserHelper::ParseLengthDelimited(std::string **this, int a2, std::string::value_type *a3, google::protobuf::internal::ParseContext *a4)
{
  int v7;
  std::string::value_type *v8;
  google::protobuf::internal::EpsCopyInputStream *result;
  int v10;
  std::string *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  std::string *v16;
  unint64_t v17;
  unint64_t v18;

  v7 = *a3;
  if (*a3 < 0)
  {
    result = (google::protobuf::internal::EpsCopyInputStream *)google::protobuf::internal::ReadSizeFallback((google::protobuf::internal *)a3, (const char *)*a3);
    if (!result)
      return result;
    v8 = (std::string::value_type *)result;
    v7 = v10;
  }
  else
  {
    v8 = a3 + 1;
  }
  v11 = *this;
  if (*this)
  {
    v12 = (8 * a2) | 2u;
    if (v12 < 0x80)
    {
      LOBYTE(v13) = v12;
    }
    else
    {
      do
      {
        std::string::push_back(v11, v12 | 0x80);
        v13 = v12 >> 7;
        v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
    }
    std::string::push_back(v11, v13);
    v15 = v7;
    v16 = *this;
    if (v7 < 0x80)
    {
      LOBYTE(v17) = v7;
    }
    else
    {
      do
      {
        std::string::push_back(v16, v15 | 0x80);
        v17 = v15 >> 7;
        v18 = v15 >> 14;
        v15 >>= 7;
      }
      while (v18);
    }
    std::string::push_back(v16, v17);
    return google::protobuf::internal::EpsCopyInputStream::AppendString((uint64_t)a4, v8, v7, *this);
  }
  else if (*((_QWORD *)a4 + 1) - (_QWORD)v8 + 16 >= v7)
  {
    return (google::protobuf::internal::EpsCopyInputStream *)&v8[v7];
  }
  else
  {
    return google::protobuf::internal::EpsCopyInputStream::SkipFallback(a4, v8, v7);
  }
}

char *google::protobuf::internal::UnknownFieldLiteParserHelper::ParseGroup(std::string **this, int a2, char *a3, int32x2_t *a4)
{
  std::string *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  BOOL v13;
  char *v14;
  __int32 v15;
  char *v17;
  std::string *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v7 = *this;
  v8 = 8 * a2;
  if (*this)
  {
    v9 = v8 | 3u;
    if (v9 < 0x80)
    {
      LOBYTE(v10) = v8 | 3;
    }
    else
    {
      do
      {
        std::string::push_back(v7, v9 | 0x80);
        v10 = v9 >> 7;
        v11 = v9 >> 14;
        v9 >>= 7;
      }
      while (v11);
    }
    std::string::push_back(v7, v10);
  }
  v12 = a4[11].i32[0];
  v13 = __OFSUB__(v12--, 1);
  a4[11].i32[0] = v12;
  if (v12 < 0 != v13)
    return 0;
  ++a4[11].i32[1];
  v14 = google::protobuf::internal::WireFormatParser<google::protobuf::internal::UnknownFieldLiteParserHelper>((google::protobuf::internal::UnknownFieldLiteParserHelper *)this, a3, (google::protobuf::internal::EpsCopyInputStream *)a4);
  a4[11] = vadd_s32(a4[11], (int32x2_t)0xFFFFFFFF00000001);
  v15 = a4[10].i32[0];
  a4[10].i32[0] = 0;
  if (v15 != (v8 | 3) || v14 == 0)
    return 0;
  v17 = v14;
  v18 = *this;
  if (v18)
  {
    v19 = v8 | 4u;
    if (v19 < 0x80)
    {
      LOBYTE(v20) = v8 | 4;
    }
    else
    {
      do
      {
        std::string::push_back(v18, v19 | 0x80);
        v20 = v19 >> 7;
        v21 = v19 >> 14;
        v19 >>= 7;
      }
      while (v21);
    }
    std::string::push_back(v18, v20);
  }
  return v17;
}

std::string *google::protobuf::internal::UnknownFieldLiteParserHelper::AddFixed32(std::string *this, int a2, int a3)
{
  std::string *v3;
  std::string **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  std::string::value_type __s[4];

  v3 = (std::string *)this->__r_.__value_.__r.__words[0];
  if (this->__r_.__value_.__r.__words[0])
  {
    v5 = (std::string **)this;
    v6 = (8 * a2) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v7) = (8 * a2) | 5;
    }
    else
    {
      do
      {
        std::string::push_back(v3, v6 | 0x80);
        v7 = v6 >> 7;
        v8 = v6 >> 14;
        v6 >>= 7;
      }
      while (v8);
    }
    std::string::push_back(v3, v7);
    *(_DWORD *)__s = a3;
    return std::string::append(*v5, __s, 4uLL);
  }
  return this;
}

google::protobuf::internal::EpsCopyInputStream *google::protobuf::internal::EpsCopyInputStream::AppendString(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  uint64_t v6;

  if (*(_QWORD *)(a1 + 8) - (_QWORD)__s + 16 < a3)
    return google::protobuf::internal::EpsCopyInputStream::AppendStringFallback(a1, __s, a3, this);
  v6 = a3;
  std::string::append(this, __s, a3);
  return (google::protobuf::internal::EpsCopyInputStream *)&__s[v6];
}

void google::protobuf::RepeatedField<BOOL>::Reserve(int *a1, int a2)
{
  int v2;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  std::string *v8;
  unsigned int v9;
  int v10;
  unint64_t v11;
  _QWORD *AlignedNoHook;
  void *v13;
  char v14;
  std::string v15[2];

  v2 = a1[1];
  if (v2 >= a2)
    return;
  if (v2 < 1)
  {
    v5 = 0;
    if (v2)
    {
LABEL_4:
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) - 8);
      if (a2 >= 4)
      {
        v7 = a1[1];
        if (v7 > 0x3FFFFFFF)
        {
          if (a2 <= 0x40000000)
          {
            google::protobuf::internal::LogMessage::LogMessage((uint64_t)v15, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1550);
            v8 = google::protobuf::internal::LogMessage::operator<<(v15, "CHECK failed: (new_size) > (kRepeatedFieldUpperClampLimit): ");
            google::protobuf::internal::LogFinisher::operator=((int)&v14, (const char **)&v8->__r_.__value_.__l.__data_);
            google::protobuf::internal::LogMessage::~LogMessage((void **)&v15[0].__r_.__value_.__l.__data_);
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
    v5 = (_QWORD *)(google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) - 8);
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
  if (v6)
  {
    v11 = (v9 + 15) & 0x1FFFFFFF8;
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      (*(void (**)(_QWORD, _QWORD, unint64_t))(**(_QWORD **)(*(_QWORD *)(v6 + 32) + 32) + 40))(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 32), MEMORY[0x24BEDB778], v11);
    AlignedNoHook = (_QWORD *)google::protobuf::Arena::AllocateAlignedNoHook((google::protobuf::Arena *)v6, v11);
  }
  else
  {
    AlignedNoHook = operator new(v9 + 8);
  }
  *AlignedNoHook = v6;
  a1[1] = v9;
  *((_QWORD *)a1 + 1) = AlignedNoHook + 1;
  google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v13 = (void *)google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1);
    memcpy(v13, v5 + 1, *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_245C8AD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::AddNAlreadyReserved(uint64_t a1, int a2)
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
  result = *(_QWORD *)(a1 + 8) + v4;
  *(_DWORD *)a1 = v4 + a2;
  return result;
}

void sub_245C8AE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::Mutable(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) + a2;
}

void sub_245C8AF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::Get(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a1) + a2;
}

void sub_245C8B008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<BOOL>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<BOOL>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<BOOL>::elements(uint64_t a1)
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

void sub_245C8B0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<BOOL>::MergeFrom(int *a1, int *a2)
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
    google::protobuf::RepeatedField<BOOL>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<BOOL>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<BOOL>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<BOOL>::elements((uint64_t)a2);
    memcpy(v6, v8, *a2);
  }
}

void sub_245C8B200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<int>::Reserve(int *a1, int a2)
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
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a1) - 8);
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
    v5 = (_QWORD *)(google::protobuf::RepeatedField<int>::elements((uint64_t)a1) - 8);
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
  google::protobuf::RepeatedField<int>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<int>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_245C8B3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::AddNAlreadyReserved(uint64_t a1, int a2)
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

void sub_245C8B47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::Mutable(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_245C8B550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::Get(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_245C8B62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<int>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<int>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<int>::elements(uint64_t a1)
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

void sub_245C8B704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<int>::MergeFrom(int *a1, int *a2)
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
    google::protobuf::RepeatedField<int>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<int>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<int>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<int>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_245C8B828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned int>::Reserve(int *a1, int a2)
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
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) - 8);
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
    v5 = (_QWORD *)(google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) - 8);
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
  google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 4 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_245C8B9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved(uint64_t a1, int a2)
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

void sub_245C8BAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::Mutable(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_245C8BB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::Get(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a1) + 4 * a2;
}

void sub_245C8BC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<unsigned int>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<unsigned int>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<unsigned int>::elements(uint64_t a1)
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

void sub_245C8BD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned int>::MergeFrom(int *a1, int *a2)
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
    google::protobuf::RepeatedField<unsigned int>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<unsigned int>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<unsigned int>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<unsigned int>::elements((uint64_t)a2);
    memcpy(v6, v8, 4 * *a2);
  }
}

void sub_245C8BE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<long long>::Reserve(int *a1, int a2)
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
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) - 8);
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
    v5 = (_QWORD *)(google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) - 8);
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
  google::protobuf::RepeatedField<long long>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<long long>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_245C8C010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::AddNAlreadyReserved(uint64_t a1, int a2)
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

void sub_245C8C0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::Mutable(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_245C8C1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::Get(_DWORD *a1, int a2)
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
  return google::protobuf::RepeatedField<long long>::elements((uint64_t)a1) + 8 * a2;
}

void sub_245C8C27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

uint64_t google::protobuf::RepeatedField<long long>::~RepeatedField(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (*(int *)(a1 + 4) >= 1)
  {
    v2 = google::protobuf::RepeatedField<long long>::elements(a1);
    v4 = *(_QWORD *)(v2 - 8);
    v3 = (void *)(v2 - 8);
    if (!v4)
      operator delete(v3);
  }
  return a1;
}

uint64_t google::protobuf::RepeatedField<long long>::elements(uint64_t a1)
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

void sub_245C8C354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<long long>::MergeFrom(int *a1, int *a2)
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
    google::protobuf::RepeatedField<long long>::Reserve(a1, *a1 + *a2);
    google::protobuf::RepeatedField<long long>::AddNAlreadyReserved((uint64_t)a1, *a2);
    v6 = (void *)google::protobuf::RepeatedField<long long>::Mutable(a1, v5);
    if (*a2 <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v10, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SentencePiece/third_party/protobuf-lite/google/protobuf/repeated_field.h", 1302);
      v7 = google::protobuf::internal::LogMessage::operator<<(v10, "CHECK failed: (index) < (current_size_): ");
      google::protobuf::internal::LogFinisher::operator=((int)&v9, (const char **)&v7->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v10[0].__r_.__value_.__l.__data_);
    }
    v8 = (const void *)google::protobuf::RepeatedField<long long>::elements((uint64_t)a2);
    memcpy(v6, v8, 8 * *a2);
  }
}

void sub_245C8C478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
  _Unwind_Resume(a1);
}

void google::protobuf::RepeatedField<unsigned long long>::Reserve(int *a1, int a2)
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
      v6 = *(_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
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
    v5 = (_QWORD *)(google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1) - 8);
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
  google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
  if (*a1 >= 1)
  {
    v14 = (void *)google::protobuf::RepeatedField<unsigned long long>::elements((uint64_t)a1);
    memcpy(v14, v5 + 1, 8 * *a1);
  }
  if (v5)
  {
    if (!*v5)
      operator delete(v5);
  }
}

void sub_245C8C638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8C6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8C7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8C8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8C97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8CAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8CC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8CD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8CDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8CECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8CFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8D0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8D288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8D344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8D418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8D4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8D5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
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

void sub_245C8D6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  google::protobuf::internal::LogMessage::~LogMessage((void **)va);
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
          MEMORY[0x249544F58](v5, 0x1012C40EC159624);
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

unsigned int *google::protobuf::internal::RepeatedPtrFieldBase::Reserve(unsigned int *this, int a2)
{
  unsigned int v2;
  BOOL v3;
  int v4;

  v2 = this[2];
  v3 = __OFSUB__(a2, v2);
  v4 = a2 - v2;
  if (!((v4 < 0) ^ v3 | (v4 == 0)))
    return google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)this, v4);
  return this;
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

uint64_t sentencepiece::MemoryMappedModelProto::MemoryMappedModelProto(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  uint64_t *v6;
  _DWORD *v8;

  *(_QWORD *)a1 = &off_2516E2A18;
  *(_QWORD *)(a1 + 16) = &off_2516E2E60;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = &off_2516E2E60;
  *(_DWORD *)(a1 + 40) = 0;
  v6 = (uint64_t *)(a1 + 88);
  sentencepiece::util::Status::Status((_QWORD *)(a1 + 88));
  sentencepiece::MemoryMappedModelProto::Init(a1, a2, a3, (sentencepiece::util::Status *)&v8);
  sentencepiece::util::Status::operator=(v6, &v8);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v8);
  return a1;
}

void sub_245C8D97C(_Unwind_Exception *a1, uint64_t a2, ...)
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

void sentencepiece::MemoryMappedNormalizerSpec::~MemoryMappedNormalizerSpec(sentencepiece::MemoryMappedNormalizerSpec *this)
{
  JUMPOUT(0x249544F58);
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
  *(_QWORD *)this = &off_2516E2A18;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
}

{
  *(_QWORD *)this = &off_2516E2A18;
  sentencepiece::util::Status::~Status((sentencepiece::MemoryMappedModelProto *)((char *)this + 88));
  JUMPOUT(0x249544F58);
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

void `anonymous namespace'::tensorViewCHW()
{
  __assert_rtn("tensorViewCHW", "SCMLImageAnalyzer.mm", 499, "buf->batch_number == 1");
}

{
  __assert_rtn("tensorViewCHW", "SCMLImageAnalyzer.mm", 498, "buf->sequence_length == 1");
}

uint64_t ___ZL32getVCPImageEmbeddingRequestClassv_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[SCMLImageModelThresholds _createThresholdDictionaryWithError:].cold.1(v0);
}

void scaledPixelBuffer32BGRAFromCGImage_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_245BFA000, a2, a3, "Error converting CGImage to CVPixelBuffer: failed to create pixel buffer %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void scaledPixelBuffer32BGRAFromCGImage_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_245BFA000, log, OS_LOG_TYPE_ERROR, "Error converting CGImage to CVPixelBuffer: failed to create context", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void scaledPixelBuffer32BGRAFromCGImage_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_245BFA000, a2, a3, "Error converting CGImage to CVPixelBuffer: failed to lock pixel buffer %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void saveCGImageToPng_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_245BFA000, a2, a3, "Failed to save image to %@: failed to create destination", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void saveCGImageToPng_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_245BFA000, a2, a3, "Failed to save image to %@: finalize failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void saveCVPixelBufferToPng_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_245BFA000, a2, a3, "Failed to save image to %@: convert to CGImage failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

uint64_t sub_245C8E89C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_245C8E8A8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_245C8E8B4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_245C8E8C0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_245C8E8CC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_245C8E8D8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_245C8E8E4()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_245C8E8F0()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_245C8E8FC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_245C8E908()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_245C8E914()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_245C8E920()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_245C8E92C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_245C8E938()
{
  return MEMORY[0x24BE680F8]();
}

uint64_t sub_245C8E944()
{
  return MEMORY[0x24BE68100]();
}

uint64_t sub_245C8E950()
{
  return MEMORY[0x24BE68108]();
}

uint64_t sub_245C8E95C()
{
  return MEMORY[0x24BE681A8]();
}

uint64_t sub_245C8E968()
{
  return MEMORY[0x24BE68320]();
}

uint64_t sub_245C8E974()
{
  return MEMORY[0x24BEB7FC0]();
}

uint64_t sub_245C8E980()
{
  return MEMORY[0x24BEB7FC8]();
}

uint64_t sub_245C8E98C()
{
  return MEMORY[0x24BEB7FD8]();
}

uint64_t sub_245C8E998()
{
  return MEMORY[0x24BEB8028]();
}

uint64_t sub_245C8E9A4()
{
  return MEMORY[0x24BEB8040]();
}

uint64_t sub_245C8E9B0()
{
  return MEMORY[0x24BEB80B0]();
}

uint64_t sub_245C8E9BC()
{
  return MEMORY[0x24BEB80B8]();
}

uint64_t sub_245C8E9C8()
{
  return MEMORY[0x24BEB80E8]();
}

uint64_t sub_245C8E9D4()
{
  return MEMORY[0x24BEB8100]();
}

uint64_t sub_245C8E9E0()
{
  return MEMORY[0x24BEB82F0]();
}

uint64_t sub_245C8E9EC()
{
  return MEMORY[0x24BEB8310]();
}

uint64_t sub_245C8E9F8()
{
  return MEMORY[0x24BEB8330]();
}

uint64_t sub_245C8EA04()
{
  return MEMORY[0x24BEB8368]();
}

uint64_t sub_245C8EA10()
{
  return MEMORY[0x24BEB8378]();
}

uint64_t sub_245C8EA1C()
{
  return MEMORY[0x24BEB8388]();
}

uint64_t sub_245C8EA28()
{
  return MEMORY[0x24BEB83E0]();
}

uint64_t sub_245C8EA34()
{
  return MEMORY[0x24BEB8420]();
}

uint64_t sub_245C8EA40()
{
  return MEMORY[0x24BEB89B8]();
}

uint64_t sub_245C8EA4C()
{
  return MEMORY[0x24BEB89D0]();
}

uint64_t sub_245C8EA58()
{
  return MEMORY[0x24BE3C3C8]();
}

uint64_t sub_245C8EA64()
{
  return MEMORY[0x24BEB8618]();
}

uint64_t sub_245C8EA70()
{
  return MEMORY[0x24BEE73C8]();
}

uint64_t sub_245C8EA7C()
{
  return MEMORY[0x24BEE7448]();
}

uint64_t sub_245C8EA88()
{
  return MEMORY[0x24BE3AED0]();
}

uint64_t sub_245C8EA94()
{
  return MEMORY[0x24BE3AED8]();
}

uint64_t sub_245C8EAA0()
{
  return MEMORY[0x24BE3AEE8]();
}

uint64_t sub_245C8EAAC()
{
  return MEMORY[0x24BE3AF30]();
}

uint64_t sub_245C8EAB8()
{
  return MEMORY[0x24BE3AFB8]();
}

uint64_t sub_245C8EAC4()
{
  return MEMORY[0x24BE689A8]();
}

uint64_t sub_245C8EAD0()
{
  return MEMORY[0x24BE689C8]();
}

uint64_t sub_245C8EADC()
{
  return MEMORY[0x24BE689F0]();
}

uint64_t sub_245C8EAE8()
{
  return MEMORY[0x24BE68AC8]();
}

uint64_t sub_245C8EAF4()
{
  return MEMORY[0x24BE68AE0]();
}

uint64_t sub_245C8EB00()
{
  return MEMORY[0x24BE68AF8]();
}

uint64_t sub_245C8EB0C()
{
  return MEMORY[0x24BE68B08]();
}

uint64_t sub_245C8EB18()
{
  return MEMORY[0x24BE68C00]();
}

uint64_t sub_245C8EB24()
{
  return MEMORY[0x24BE68C18]();
}

uint64_t sub_245C8EB30()
{
  return MEMORY[0x24BE68C20]();
}

uint64_t sub_245C8EB3C()
{
  return MEMORY[0x24BE68C30]();
}

uint64_t sub_245C8EB48()
{
  return MEMORY[0x24BE68C38]();
}

uint64_t sub_245C8EB54()
{
  return MEMORY[0x24BE68C60]();
}

uint64_t sub_245C8EB60()
{
  return MEMORY[0x24BE3B6C8]();
}

uint64_t sub_245C8EB6C()
{
  return MEMORY[0x24BE3B6F0]();
}

uint64_t sub_245C8EB78()
{
  return MEMORY[0x24BE3B708]();
}

uint64_t sub_245C8EB84()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_245C8EB90()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_245C8EB9C()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_245C8EBA8()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_245C8EBB4()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_245C8EBC0()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_245C8EBCC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245C8EBD8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_245C8EBE4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245C8EBF0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_245C8EBFC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_245C8EC08()
{
  return MEMORY[0x24BE7A8B0]();
}

uint64_t sub_245C8EC14()
{
  return MEMORY[0x24BE7A8D0]();
}

uint64_t sub_245C8EC20()
{
  return MEMORY[0x24BE7A8E8]();
}

uint64_t sub_245C8EC2C()
{
  return MEMORY[0x24BE7A8F0]();
}

uint64_t sub_245C8EC38()
{
  return MEMORY[0x24BE7A900]();
}

uint64_t sub_245C8EC44()
{
  return MEMORY[0x24BE7A908]();
}

uint64_t sub_245C8EC50()
{
  return MEMORY[0x24BE7AB88]();
}

uint64_t sub_245C8EC5C()
{
  return MEMORY[0x24BE3C8C8]();
}

uint64_t sub_245C8EC68()
{
  return MEMORY[0x24BE3BA58]();
}

uint64_t sub_245C8EC74()
{
  return MEMORY[0x24BEB86A0]();
}

uint64_t sub_245C8EC80()
{
  return MEMORY[0x24BE3B078]();
}

uint64_t sub_245C8EC8C()
{
  return MEMORY[0x24BE7AD40]();
}

uint64_t sub_245C8EC98()
{
  return MEMORY[0x24BE7AD48]();
}

uint64_t sub_245C8ECA4()
{
  return MEMORY[0x24BEB86D0]();
}

uint64_t sub_245C8ECB0()
{
  return MEMORY[0x24BE7AD60]();
}

uint64_t sub_245C8ECBC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_245C8ECC8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_245C8ECD4()
{
  return MEMORY[0x24BEE06E0]();
}

uint64_t sub_245C8ECE0()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_245C8ECEC()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_245C8ECF8()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_245C8ED04()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245C8ED10()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245C8ED1C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_245C8ED28()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_245C8ED34()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_245C8ED40()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_245C8ED4C()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_245C8ED58()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t sub_245C8ED64()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t sub_245C8ED70()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245C8ED7C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_245C8ED88()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245C8ED94()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_245C8EDA0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245C8EDAC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_245C8EDB8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_245C8EDC4()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_245C8EDD0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_245C8EDDC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_245C8EDE8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_245C8EDF4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_245C8EE00()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_245C8EE0C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_245C8EE18()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_245C8EE24()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_245C8EE30()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245C8EE3C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245C8EE48()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245C8EE54()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_245C8EE60()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245C8EE6C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245C8EE78()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_245C8EE84()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_245C8EE90()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_245C8EE9C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_245C8EEA8()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_245C8EEB4()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_245C8EEC0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245C8EECC()
{
  return MEMORY[0x24BEE1D50]();
}

uint64_t sub_245C8EED8()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_245C8EEE4()
{
  return MEMORY[0x24BEE1DC0]();
}

uint64_t sub_245C8EEF0()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_245C8EEFC()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_245C8EF08()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245C8EF14()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245C8EF20()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_245C8EF2C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_245C8EF38()
{
  return MEMORY[0x24BDD05E8]();
}

uint64_t sub_245C8EF44()
{
  return MEMORY[0x24BDD0628]();
}

uint64_t sub_245C8EF50()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_245C8EF5C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_245C8EF68()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_245C8EF74()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_245C8EF80()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_245C8EF8C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_245C8EF98()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245C8EFA4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_245C8EFB0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_245C8EFBC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_245C8EFC8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_245C8EFD4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245C8EFE0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_245C8EFEC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_245C8EFF8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_245C8F004()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_245C8F010()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_245C8F01C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245C8F028()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_245C8F034()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_245C8F040()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245C8F04C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245C8F058()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245C8F064()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245C8F070()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_245C8F07C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_245C8F088()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_245C8F094()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_245C8F0A0()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_245C8F0AC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_245C8F0B8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_245C8F0C4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_245C8F0D0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_245C8F0DC()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_245C8F0E8()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_245C8F0F4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_245C8F100()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_245C8F10C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_245C8F118()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245C8F124()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_245C8F130()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_245C8F13C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_245C8F148()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_245C8F154()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245C8F160()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245C8F16C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245C8F178()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245C8F184()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_245C8F190()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_245C8F19C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245C8F1A8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_245C8F1B4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_245C8F1C0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_245C8F1CC()
{
  return MEMORY[0x24BEE4A10]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x24BDBC728](tokenizer, string, range.location, range.length);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x24BDC0300](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x24BE5F080]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x24BE5F088]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x24BE5F0D8]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x24BE5F0F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x24BED84D0]();
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x24BDF9020](pixelBuffer, options, imageOut);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t language_modeling::v1::LinguisticContext::push_back()
{
  return MEMORY[0x24BE5ED10]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x24BE5ED28](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  MEMORY[0x24BE5ED30](this);
}

uint64_t E5RT::E5Compiler::GetCompiler(E5RT::E5Compiler *this)
{
  return MEMORY[0x24BE2F3F8](this);
}

uint64_t E5RT::E5Compiler::Compile()
{
  return MEMORY[0x24BE2F410]();
}

uint64_t E5RT::BufferObject::AllocMemory()
{
  return MEMORY[0x24BE2F418]();
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x24BE2F420](this);
}

uint64_t E5RT::SurfaceObject::CreateSurfaceFromHandle<__IOSurface *>()
{
  return MEMORY[0x24BE2F448]();
}

uint64_t E5RT::ProgramLibrary::GetExportedFunctions(E5RT::ProgramLibrary *this)
{
  return MEMORY[0x24BE2F470](this);
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

uint64_t E5RT::ComputeGPUDevice::GetComputeGPUDeviceForMTLDevice()
{
  return MEMORY[0x24BE2F4C0]();
}

uint64_t E5RT::E5CompilerOptions::SetForceRecompilation(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x24BE2F4D8](this);
}

uint64_t E5RT::E5CompilerOptions::SetPreferredCpuBackends()
{
  return MEMORY[0x24BE2F4E0]();
}

uint64_t E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed()
{
  return MEMORY[0x24BE2F4F0]();
}

uint64_t E5RT::E5CompilerOptions::Create(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x24BE2F510](this);
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x24BE2F550]();
}

{
  return MEMORY[0x24BE2F558]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::SetOperationName()
{
  return MEMORY[0x24BE2F570]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::SetOverrideComputeGPUDevice()
{
  return MEMORY[0x24BE2F580]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::Create()
{
  return MEMORY[0x24BE2F5A0]();
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x24BE2F5B8]();
}

uint64_t language_modeling::v1::LinguisticContext::tokenSpan(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x24BE5EDD0](this);
}

uint64_t E5RT::TensorDataType::GetComponentSize(E5RT::TensorDataType *this)
{
  return MEMORY[0x24BE2F610](this);
}

uint64_t E5RT::TensorDataType::GetComponentDataType(E5RT::TensorDataType *this)
{
  return MEMORY[0x24BE2F620](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x24BE2F638](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorDataType(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x24BE2F648](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x24BE2F668](this);
}

uint64_t E5RT::OperandDescriptor::SurfaceDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x24BE2F670](this);
}

uint64_t E5RT::OperandDescriptor::TryAsTensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x24BE2F678](this);
}

uint64_t E5RT::OperandDescriptor::TryAsSurfaceDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x24BE2F680](this);
}

uint64_t E5RT::SurfaceDescriptor::GetSurfaceWidth(E5RT::SurfaceDescriptor *this)
{
  return MEMORY[0x24BE2F688](this);
}

uint64_t E5RT::SurfaceDescriptor::GetSurfaceFormat(E5RT::SurfaceDescriptor *this)
{
  return MEMORY[0x24BE2F690](this);
}

uint64_t E5RT::SurfaceDescriptor::GetSurfaceHeight(E5RT::SurfaceDescriptor *this)
{
  return MEMORY[0x24BE2F698](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x24BE2F6A8](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x24BE2F6B0](this);
}

uint64_t E5RT::IOPort::GetPortDescriptor(E5RT::IOPort *this)
{
  return MEMORY[0x24BE2F6C8](this);
}

uint64_t E5RT::IOPort::GetPortDescriptorRef(E5RT::IOPort *this)
{
  return MEMORY[0x24BE2F6D0](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x24BEDA978](this);
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

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA18](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__stem(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA40](this);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB40](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB60](this);
}

{
  MEMORY[0x24BEDAB68](this);
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
  return off_2516E0700();
}

void operator delete(void *__p)
{
  off_2516E0708(__p);
}

void operator delete(void *__p, std::align_val_t a2)
{
  off_2516E0710(__p, a2);
}

uint64_t operator delete()
{
  return off_2516E0718();
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_2516E0720(__sz);
}

uint64_t operator new[]()
{
  return off_2516E0728();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2516E0730(__sz);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  return (void *)off_2516E0738(__sz, a2);
}

uint64_t operator new()
{
  return off_2516E0740();
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x24BEDB938](a1);
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t c_network_get_input_names()
{
  return MEMORY[0x24BE2F6E0]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_device_id_for_metal_device()
{
  return MEMORY[0x24BE2FB40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x24BE2FC38]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x24BE2FCB0]();
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x24BEDD5D0]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x24BEDD5D8]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x24BEDD5E0]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x24BEDD5F0]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x24BEDD5F8]();
}

uint64_t pc_session_get_value()
{
  return MEMORY[0x24BEDD608]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x24BEDD618]();
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

