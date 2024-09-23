@implementation PFSStyleCache

- (void)dealloc
{
  void *i;
  void *v4;
  void *j;
  void *v6;
  objc_super v7;

  for (i = self->mProperties.__table_.__p1_.__value_.__next_; i; i = *(void **)i)
  {
    v4 = (void *)*((_QWORD *)i + 4);

  }
  for (j = self->mPropertySetsIndex.__table_.__p1_.__value_.__next_; j; j = *(void **)j)
  {
    v6 = (void *)*((_QWORD *)j + 4);

  }
  v7.receiver = self;
  v7.super_class = (Class)PFSStyleCache;
  -[PFSStyleCache dealloc](&v7, "dealloc");
}

- (void)indexProperties
{
  vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *p_mNonTrivialProperties;
  _QWORD *next;
  __int128 *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  PFSStyleSimpleSelector *v9;
  char *v10;
  int v11;
  char *value;
  char *end;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *begin;
  char *v23;
  uint64_t i;
  unordered_multimap<std::string, std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::pair<PFSStyleSelector *, NSMutableDictionary *>>>> *p_mTrivialElementMap;
  unordered_map<std::string, std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::pair<PFSStyleSelector *, NSMutableDictionary *>>>> *p_mTrivialIdentifierMap;
  void *__p[2];
  char v28;
  __int128 v29;
  void **v30;

  p_mTrivialIdentifierMap = &self->mTrivialIdentifierMap;
  sub_1D2600((uint64_t)&self->mTrivialIdentifierMap);
  sub_1D2600((uint64_t)&self->mTrivialClassMap);
  p_mTrivialElementMap = &self->mTrivialElementMap;
  sub_1D2600((uint64_t)&self->mTrivialElementMap);
  p_mNonTrivialProperties = &self->mNonTrivialProperties;
  self->mNonTrivialProperties.__end_ = self->mNonTrivialProperties.__begin_;
  sub_1D2600((uint64_t)&self->mPropertiesIndex);
  next = self->mProperties.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      v5 = (__int128 *)(next + 3);
      v6 = (void *)next[3];
      v7 = objc_msgSend(v6, "simpleSelectors", p_mTrivialElementMap);
      v8 = v7[1];
      v9 = *(PFSStyleSimpleSelector **)(v8 + 16);
      if (v7[2] != 1
        || *(_QWORD *)(PFSStyleSimpleSelector::pieces(*(PFSStyleSimpleSelector **)(v8 + 16)) + 16) != 1)
      {
        break;
      }
      v10 = *(char **)(*(_QWORD *)(PFSStyleSimpleSelector::pieces(v9) + 8) + 16);
      v11 = *v10;
      switch(v11)
      {
        case '!':
          sub_1CEE44(__p, v10);
          v29 = *v5;
          sub_1D30EC(p_mTrivialElementMap, (uint64_t)__p);
          break;
        case '.':
          sub_1CEE44(__p, v10);
          v29 = *v5;
          sub_1D30EC(&self->mTrivialClassMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
          break;
        case '#':
          sub_1CEE44(__p, v10);
          v30 = __p;
          *(_OWORD *)((char *)sub_1D2698((uint64_t)p_mTrivialIdentifierMap, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v30)+ 40) = *v5;
          break;
        default:
          goto LABEL_8;
      }
      if (v28 < 0)
        operator delete(__p[0]);
LABEL_35:
      while ((_QWORD *)v8 != v7)
      {
        for (i = *(_QWORD *)(PFSStyleSimpleSelector::pieces(v9) + 8);
              i != PFSStyleSimpleSelector::pieces(v9);
              i = *(_QWORD *)(i + 8))
        {
          sub_1CEE44(__p, *(char **)(i + 16));
          *(_QWORD *)&v29 = v6;
          sub_1D36FC(&self->mPropertiesIndex.__table_.__bucket_list_.__ptr_.__value_, (__int128 *)__p);
          if (v28 < 0)
            operator delete(__p[0]);
        }
        v8 = *(_QWORD *)(v8 + 8);
      }
      next = (_QWORD *)*next;
      if (!next)
        return;
    }
LABEL_8:
    end = (char *)self->mNonTrivialProperties.__end_;
    value = (char *)self->mNonTrivialProperties.__end_cap_.__value_;
    if (end >= value)
    {
      v15 = (end - (char *)p_mNonTrivialProperties->__begin_) >> 4;
      v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 60)
        sub_36C30();
      v17 = value - (char *)p_mNonTrivialProperties->__begin_;
      if (v17 >> 3 > v16)
        v16 = v17 >> 3;
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
        v18 = 0xFFFFFFFFFFFFFFFLL;
      else
        v18 = v16;
      if (v18)
        v19 = (char *)sub_36CB8((uint64_t)&self->mNonTrivialProperties.__end_cap_, v18);
      else
        v19 = 0;
      v20 = &v19[16 * v15];
      *(_OWORD *)v20 = *v5;
      begin = (char *)self->mNonTrivialProperties.__begin_;
      v21 = (char *)self->mNonTrivialProperties.__end_;
      v23 = v20;
      if (v21 != begin)
      {
        do
        {
          *((_OWORD *)v23 - 1) = *((_OWORD *)v21 - 1);
          v23 -= 16;
          v21 -= 16;
        }
        while (v21 != begin);
        v21 = (char *)p_mNonTrivialProperties->__begin_;
      }
      v14 = v20 + 16;
      self->mNonTrivialProperties.__begin_ = v23;
      self->mNonTrivialProperties.__end_ = v20 + 16;
      self->mNonTrivialProperties.__end_cap_.__value_ = &v19[16 * v18];
      if (v21)
        operator delete(v21);
    }
    else
    {
      *(_OWORD *)end = *v5;
      v14 = end + 16;
    }
    self->mNonTrivialProperties.__end_ = v14;
    goto LABEL_35;
  }
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  id *v14;

  if (a3)
  {
    v5 = objc_msgSend(a3, "keyEnumerator");
    v6 = objc_msgSend(v5, "nextObject");
    if (v6)
    {
      v7 = v6;
      do
      {
        v8 = objc_msgSend(a3, "objectForKey:", v7);
        v14 = (id *)objc_msgSend(v7, "hash");
        v9 = sub_1D37A4(&self->mProperties.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v14);
        if (v9)
        {
          objc_msgSend((id)v9[4], "addEntriesFromDictionary:", v8);
        }
        else
        {
          v10 = v7;
          v11 = v8;
          v13 = 0;
          v13 = objc_msgSend(v7, "hash");
          v14 = &v13;
          v12 = sub_1D3858((uint64_t)&self->mProperties, (unint64_t *)&v13, (uint64_t)&std::piecewise_construct, &v14);
          v12[3] = v7;
          v12[4] = v8;
        }
        v7 = objc_msgSend(v5, "nextObject");
      }
      while (v7);
    }
    -[PFSStyleCache indexProperties](self, "indexProperties");
  }
}

- (id)createPropertySetWithSelector:(id)a3
{
  unordered_map<unsigned long, std::pair<PFSStyleSelector *, PFSPropertySet *>, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, std::pair<PFSStyleSelector *, PFSPropertySet *>>>> *p_mPropertySetsIndex;
  uint64_t *v6;
  uint64_t *v7;
  PFSPropertySet *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void **v15;
  void **v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  id *v21;
  id *v22;
  id *v23;
  void *v24;
  id *v25;
  void **v26;
  id *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  unordered_map<unsigned long, std::pair<PFSStyleSelector *, PFSPropertySet *>, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, std::pair<PFSStyleSelector *, PFSPropertySet *>>>> *v38;
  PFSPropertySet *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id *v45;
  void **v46;
  void **v47;
  void *__p;
  _QWORD *v49;
  uint64_t v50;
  _BYTE v51[128];

  p_mPropertySetsIndex = &self->mPropertySetsIndex;
  __p = objc_msgSend(a3, "hash");
  v6 = sub_1D37A4(p_mPropertySetsIndex, (unint64_t *)&__p);
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(a3, "isEqual:", v6[3]) & 1) != 0)
    {
      v8 = (PFSPropertySet *)objc_msgSend((id)v7[4], "copy");
      if (v8)
        return v8;
    }
    else
    {

      sub_1D3A78(p_mPropertySetsIndex, v7);
    }
  }
  v8 = objc_alloc_init(PFSPropertySet);
  if (self)
  {
    -[PFSStyleCache matchingSelectorsForSelector:](self, "matchingSelectorsForSelector:", a3);
    v9 = __p;
    if (v49 != __p)
    {
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v39 = v8;
      v38 = p_mPropertySetsIndex;
      do
      {
        v10 = (void *)v9[1];
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v51, 16, v38);
        if (v11)
        {
          v12 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v42 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
              v15 = v46;
              if (v46 >= v47)
              {
                v17 = v46 - v45;
                if ((unint64_t)(v17 + 1) >> 61)
                  sub_36C30();
                v18 = ((char *)v47 - (char *)v45) >> 2;
                if (v18 <= v17 + 1)
                  v18 = v17 + 1;
                if ((unint64_t)((char *)v47 - (char *)v45) >= 0x7FFFFFFFFFFFFFF8)
                  v19 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v19 = v18;
                if (v19)
                  v20 = (char *)sub_3CC38((uint64_t)&v47, v19);
                else
                  v20 = 0;
                v21 = (id *)&v20[8 * v17];
                *v21 = v14;
                v16 = v21 + 1;
                v23 = v45;
                v22 = v46;
                if (v46 != v45)
                {
                  do
                  {
                    v24 = *--v22;
                    *--v21 = v24;
                  }
                  while (v22 != v23);
                  v22 = v45;
                }
                v45 = v21;
                v46 = v16;
                v47 = (void **)&v20[8 * v19];
                if (v22)
                  operator delete(v22);
              }
              else
              {
                *v46 = v14;
                v16 = v15 + 1;
              }
              v46 = v16;
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
          }
          while (v11);
        }
        v9 += 2;
      }
      while (v9 != v49);
      v26 = v45;
      v25 = v46;
      if (v45 == v46)
      {
        v8 = v39;
      }
      else
      {
        v8 = v39;
        do
        {
          v27 = (id *)__p;
          if (__p != v49)
          {
            v28 = 0;
            v29 = 0;
            v30 = *v26;
            do
            {
              v31 = *v27;
              v32 = objc_msgSend(v27[1], "objectForKey:", v30);
              if (v32)
              {
                v33 = objc_msgSend(v31, "specificity");
                if (v33 > v29)
                {
                  v29 = v33;
                  v28 = v32;
                }
              }
              v27 += 2;
            }
            while (v27 != v49);
            if (v28)
              -[PFSPropertySet addPropertyValue:forProperty:](v39, "addPropertyValue:forProperty:", v28, objc_msgSend(v30, "UTF8String"));
          }
          ++v26;
        }
        while (v26 != v46);
        v25 = v45;
      }
      p_mPropertySetsIndex = v38;
      if (v25)
      {
        v46 = v25;
        operator delete(v25);
      }
    }
  }
  else
  {
    __p = 0;
    v49 = 0;
    v50 = 0;
  }
  v34 = a3;
  v35 = -[PFSPropertySet copy](v8, "copy");
  v40 = objc_msgSend(a3, "hash");
  v45 = &v40;
  v36 = sub_1D3858((uint64_t)p_mPropertySetsIndex, (unint64_t *)&v40, (uint64_t)&std::piecewise_construct, &v45);
  v36[3] = v34;
  v36[4] = v35;
  if (__p)
  {
    v49 = __p;
    operator delete(__p);
  }
  return v8;
}

- (BOOL)hasAnyRulesForIdentifier:(const char *)a3
{
  unsigned __int8 v5;
  unordered_multimap<std::string, PFSStyleSelector *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, PFSStyleSelector *>>> *p_mPropertiesIndex;
  size_t v7;
  size_t v8;
  void **v9;
  uint64_t *v10;
  char *v11;
  unsigned __int8 *v12;
  void *__p[2];
  char v15;

  v5 = atomic_load((unsigned __int8 *)&qword_543438);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_543438))
  {
    sub_1CEE44(&qword_543420, "#");
    __cxa_guard_release(&qword_543438);
  }
  p_mPropertiesIndex = &self->mPropertiesIndex;
  if (byte_543437 >= 0)
    v7 = byte_543437;
  else
    v7 = qword_543428;
  v8 = strlen(a3);
  v9 = __p;
  sub_1D3BEC((uint64_t)__p, v7 + v8);
  if (v15 < 0)
    v9 = (void **)__p[0];
  if (v7)
  {
    if (byte_543437 >= 0)
      v10 = &qword_543420;
    else
      v10 = (uint64_t *)qword_543420;
    memmove(v9, v10, v7);
  }
  v11 = (char *)v9 + v7;
  if (v8)
    memmove(v11, a3, v8);
  v11[v8] = 0;
  v12 = sub_1D3C70(p_mPropertiesIndex, (unsigned __int8 *)__p);
  if (v15 < 0)
    operator delete(__p[0]);
  return v12 != 0;
}

- (void).cxx_destruct
{
  void *begin;

  sub_1D3DA8((uint64_t)&self->mPropertySetsIndex);
  sub_1D3D70((uint64_t)&self->mPropertiesIndex);
  sub_1D3DA8((uint64_t)&self->mProperties);
  begin = self->mNonTrivialProperties.__begin_;
  if (begin)
  {
    self->mNonTrivialProperties.__end_ = begin;
    operator delete(begin);
  }
  sub_1D3D70((uint64_t)&self->mTrivialElementMap);
  sub_1D3D70((uint64_t)&self->mTrivialClassMap);
  sub_1D3D70((uint64_t)&self->mTrivialIdentifierMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_QWORD *)self + 22) = 0;
  *((_DWORD *)self + 46) = 1065353216;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_DWORD *)self + 56) = 1065353216;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_DWORD *)self + 66) = 1065353216;
  return self;
}

- (vector<std::pair<PFSStyleSelector)matchingSelectorsForSelector:(std:(NSMutableDictionary *>>> *__return_ptr)retstr :(PFSStyleCache *)self allocator<std:(SEL)a3 :(id)a4 pair<PFSStyleSelector *)
{
  vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *result;
  PFSStyleSimpleSelector *v6;
  vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *v7;
  __compressed_pair<std::pair<PFSStyleSelector *, NSMutableDictionary *> *, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *p_end_cap;
  char *value;
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  char *v16;
  _OWORD *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  unsigned __int8 *v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  char *end;
  _OWORD *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *begin;
  char *v40;
  _OWORD *v41;
  char *v42;
  char *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  id *i;
  char *v55;
  char *v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  void *__p[2];
  char v69;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  result = (vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *)objc_msgSend(a4, "simpleSelectors");
  if (result != result->__end_)
  {
    v6 = (PFSStyleSimpleSelector *)*((_QWORD *)result->__begin_ + 2);
    v7 = (vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *)PFSStyleSimpleSelector::pieces(v6);
    p_end_cap = &retstr->__end_cap_;
    while (1)
    {
      while (1)
      {
        do
        {
          while (1)
          {
            while (1)
            {
              v7 = (vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *)v7->__end_;
              result = (vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *)PFSStyleSimpleSelector::pieces(v6);
              if (v7 == result)
                goto LABEL_72;
              value = (char *)v7->__end_cap_.__value_;
              v10 = *value;
              if (v10 != 33)
                break;
              sub_1CEE44(__p, value);
              v27 = sub_1D3DF0(&self->mTrivialElementMap.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
              v29 = v28;
              if (v69 < 0)
                operator delete(__p[0]);
              if (v27 != v29)
              {
                end = (char *)retstr->__end_;
                do
                {
                  v31 = v27 + 40;
                  if (end >= p_end_cap->__value_)
                  {
                    v32 = (end - (char *)retstr->__begin_) >> 4;
                    if ((unint64_t)(v32 + 1) >> 60)
                      sub_36C30();
                    v33 = (char *)p_end_cap->__value_ - (char *)retstr->__begin_;
                    v34 = v33 >> 3;
                    if (v33 >> 3 <= (unint64_t)(v32 + 1))
                      v34 = v32 + 1;
                    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0)
                      v35 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v35 = v34;
                    if (v35)
                      v36 = (char *)sub_36CB8((uint64_t)&retstr->__end_cap_, v35);
                    else
                      v36 = 0;
                    v37 = &v36[16 * v32];
                    *(_OWORD *)v37 = *v31;
                    begin = (char *)retstr->__begin_;
                    v38 = (char *)retstr->__end_;
                    v40 = v37;
                    if (v38 != retstr->__begin_)
                    {
                      do
                      {
                        *((_OWORD *)v40 - 1) = *((_OWORD *)v38 - 1);
                        v40 -= 16;
                        v38 -= 16;
                      }
                      while (v38 != begin);
                      v38 = (char *)retstr->__begin_;
                    }
                    end = v37 + 16;
                    retstr->__begin_ = v40;
                    retstr->__end_ = v37 + 16;
                    retstr->__end_cap_.__value_ = &v36[16 * v35];
                    if (v38)
                      operator delete(v38);
                  }
                  else
                  {
                    *(_OWORD *)end = *v31;
                    end += 16;
                  }
                  retstr->__end_ = end;
                  v27 = *(unsigned __int8 **)v27;
                }
                while (v27 != v29);
              }
            }
            if (v10 != 46)
              break;
            sub_1CEE44(__p, value);
            v13 = sub_1D3DF0(&self->mTrivialClassMap.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
            v15 = v14;
            if (v69 < 0)
              operator delete(__p[0]);
            if (v13 != v15)
            {
              v16 = (char *)retstr->__end_;
              do
              {
                v17 = v13 + 40;
                if (v16 >= p_end_cap->__value_)
                {
                  v18 = (v16 - (char *)retstr->__begin_) >> 4;
                  if ((unint64_t)(v18 + 1) >> 60)
                    sub_36C30();
                  v19 = (char *)p_end_cap->__value_ - (char *)retstr->__begin_;
                  v20 = v19 >> 3;
                  if (v19 >> 3 <= (unint64_t)(v18 + 1))
                    v20 = v18 + 1;
                  if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
                    v21 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v21 = v20;
                  if (v21)
                    v22 = (char *)sub_36CB8((uint64_t)&retstr->__end_cap_, v21);
                  else
                    v22 = 0;
                  v23 = &v22[16 * v18];
                  *(_OWORD *)v23 = *v17;
                  v25 = (char *)retstr->__begin_;
                  v24 = (char *)retstr->__end_;
                  v26 = v23;
                  if (v24 != retstr->__begin_)
                  {
                    do
                    {
                      *((_OWORD *)v26 - 1) = *((_OWORD *)v24 - 1);
                      v26 -= 16;
                      v24 -= 16;
                    }
                    while (v24 != v25);
                    v24 = (char *)retstr->__begin_;
                  }
                  v16 = v23 + 16;
                  retstr->__begin_ = v26;
                  retstr->__end_ = v23 + 16;
                  retstr->__end_cap_.__value_ = &v22[16 * v21];
                  if (v24)
                    operator delete(v24);
                }
                else
                {
                  *(_OWORD *)v16 = *v17;
                  v16 += 16;
                }
                retstr->__end_ = v16;
                v13 = *(unsigned __int8 **)v13;
              }
              while (v13 != v15);
            }
          }
        }
        while (v10 != 35);
        sub_1CEE44(__p, value);
        v11 = sub_1D3C70(&self->mTrivialIdentifierMap.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
        v12 = v11;
        if (v69 < 0)
          break;
        if (v11)
          goto LABEL_55;
      }
      operator delete(__p[0]);
      if (v12)
      {
LABEL_55:
        v41 = v12 + 40;
        v43 = (char *)retstr->__end_;
        v42 = (char *)retstr->__end_cap_.__value_;
        if (v43 >= v42)
        {
          v45 = (v43 - (char *)retstr->__begin_) >> 4;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 60)
            sub_36C30();
          v47 = v42 - (char *)retstr->__begin_;
          if (v47 >> 3 > v46)
            v46 = v47 >> 3;
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
            v48 = 0xFFFFFFFFFFFFFFFLL;
          else
            v48 = v46;
          if (v48)
            v49 = (char *)sub_36CB8((uint64_t)&retstr->__end_cap_, v48);
          else
            v49 = 0;
          v50 = &v49[16 * v45];
          *(_OWORD *)v50 = *v41;
          v52 = (char *)retstr->__begin_;
          v51 = (char *)retstr->__end_;
          v53 = v50;
          if (v51 != retstr->__begin_)
          {
            do
            {
              *((_OWORD *)v53 - 1) = *((_OWORD *)v51 - 1);
              v53 -= 16;
              v51 -= 16;
            }
            while (v51 != v52);
            v51 = (char *)retstr->__begin_;
          }
          v44 = v50 + 16;
          retstr->__begin_ = v53;
          retstr->__end_ = v50 + 16;
          retstr->__end_cap_.__value_ = &v49[16 * v48];
          if (v51)
            operator delete(v51);
        }
        else
        {
          *(_OWORD *)v43 = *v41;
          v44 = v43 + 16;
        }
        retstr->__end_ = v44;
      }
    }
  }
LABEL_72:
  for (i = (id *)self->mNonTrivialProperties.__begin_; i != self->mNonTrivialProperties.__end_; i += 2)
  {
    result = (vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *)objc_msgSend(*i, "matchesTailOf:", a4);
    if ((_DWORD)result)
    {
      v56 = (char *)retstr->__end_;
      v55 = (char *)retstr->__end_cap_.__value_;
      if (v56 >= v55)
      {
        v58 = (v56 - (char *)retstr->__begin_) >> 4;
        v59 = v58 + 1;
        if ((unint64_t)(v58 + 1) >> 60)
          sub_36C30();
        v60 = v55 - (char *)retstr->__begin_;
        if (v60 >> 3 > v59)
          v59 = v60 >> 3;
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0)
          v61 = 0xFFFFFFFFFFFFFFFLL;
        else
          v61 = v59;
        if (v61)
          result = (vector<std::pair<PFSStyleSelector *, NSMutableDictionary *>, std::allocator<std::pair<PFSStyleSelector *, NSMutableDictionary *>>> *)sub_36CB8((uint64_t)&retstr->__end_cap_, v61);
        else
          result = 0;
        v62 = (char *)result + 16 * v58;
        *(_OWORD *)v62 = *(_OWORD *)i;
        v64 = (char *)retstr->__begin_;
        v63 = (char *)retstr->__end_;
        v65 = v62;
        if (v63 != retstr->__begin_)
        {
          do
          {
            *((_OWORD *)v65 - 1) = *((_OWORD *)v63 - 1);
            v65 -= 16;
            v63 -= 16;
          }
          while (v63 != v64);
          v63 = (char *)retstr->__begin_;
        }
        v57 = v62 + 16;
        retstr->__begin_ = v65;
        retstr->__end_ = v62 + 16;
        retstr->__end_cap_.__value_ = (char *)result + 16 * v61;
        if (v63)
          operator delete(v63);
      }
      else
      {
        *(_OWORD *)v56 = *(_OWORD *)i;
        v57 = v56 + 16;
      }
      retstr->__end_ = v57;
    }
  }
  return result;
}

@end
