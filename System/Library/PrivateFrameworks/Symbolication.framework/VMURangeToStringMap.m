@implementation VMURangeToStringMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMURangeToStringMap)init
{
  VMURangeToStringMap *v2;
  NSMutableArray *v3;
  NSMutableArray *strings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMURangeToStringMap;
  v2 = -[VMURangeToStringMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    strings = v2->_strings;
    v2->_strings = v3;

    v2->_sorted = 1;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("classVersion"));

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "serialize32:", -[VMURangeToStringMap count](self, "count"));
  begin = self->_rangeAndStringVector.__begin_;
  end = self->_rangeAndStringVector.__end_;
  while (begin != end)
  {
    v9 = *((_QWORD *)begin + 1);
    v10 = *((unsigned int *)begin + 4);
    objc_msgSend(v6, "serialize64:", *(_QWORD *)begin);
    objc_msgSend(v6, "serialize64:", v9);
    objc_msgSend(v6, "serialize32:", v10);
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
  }
  objc_msgSend(v6, "serialize32:", -[VMURangeToStringMap uniquedStringCount](self, "uniquedStringCount"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_strings;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(v6, "serializeString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  v15 = (void *)objc_msgSend(v6, "copyContiguousData");
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("simpleSerializerData"));

}

- (VMURangeToStringMap)initWithCoder:(id)a3
{
  id v4;
  VMURangeToStringMap *v5;
  VMURangeToStringMap *v6;
  void *v7;
  int v8;
  VMUSimpleDeserializer *v9;
  unsigned int v10;
  id v11;
  void *v12;
  int v13;
  VMURangeToStringMap *v14;
  int v16;
  void **p_begin;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  char *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v23;
  char *begin;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  __int128 v32;
  unsigned int v33;
  uint64_t v34;
  NSMutableArray *strings;
  id v36;
  id v37;
  uint64_t p_end_cap;
  void *v39;
  id v40;
  id v41;
  int v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v4 = a3;
  v5 = -[VMURangeToStringMap init](self, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  v5->_sorted = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  if (v8 == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simpleSerializerData"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VMUSimpleDeserializer initWithData:]([VMUSimpleDeserializer alloc], "initWithData:", v39);
    v47 = 0;
    v10 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v47);
    v11 = v47;
    if (!v11)
    {
      if (v10)
      {
        v16 = 0;
        p_begin = (void **)&v6->_rangeAndStringVector.__begin_;
        p_end_cap = (uint64_t)&v6->_rangeAndStringVector.__end_cap_;
        while (1)
        {
          v46 = 0;
          v18 = -[VMUSimpleDeserializer deserialize64WithError:](v9, "deserialize64WithError:", &v46, p_end_cap);
          v11 = v46;
          if (v11)
            break;
          v45 = 0;
          v19 = -[VMUSimpleDeserializer deserialize64WithError:](v9, "deserialize64WithError:", &v45);
          v11 = v45;
          if (v11)
            break;
          v44 = 0;
          v20 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v44);
          v11 = v44;
          if (v11)
            break;
          end = (char *)v6->_rangeAndStringVector.__end_;
          value = v6->_rangeAndStringVector.__end_cap_.__value_;
          if (end >= (char *)value)
          {
            begin = (char *)*p_begin;
            v25 = 0xAAAAAAAAAAAAAAABLL * ((end - (_BYTE *)*p_begin) >> 3);
            v26 = v25 + 1;
            if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
            v27 = 0xAAAAAAAAAAAAAAABLL * ((value - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin) >> 3);
            if (2 * v27 > v26)
              v26 = 2 * v27;
            if (v27 >= 0x555555555555555)
              v28 = 0xAAAAAAAAAAAAAAALL;
            else
              v28 = v26;
            if (v28)
            {
              v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAndString>>(p_end_cap, v28);
              begin = (char *)v6->_rangeAndStringVector.__begin_;
              end = (char *)v6->_rangeAndStringVector.__end_;
            }
            else
            {
              v29 = 0;
            }
            v30 = &v29[24 * v25];
            *(_QWORD *)v30 = v18;
            *((_QWORD *)v30 + 1) = v19;
            *((_DWORD *)v30 + 4) = v20;
            v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v30;
            if (end != begin)
            {
              do
              {
                v32 = *(_OWORD *)(end - 24);
                *((_QWORD *)v31 - 1) = *((_QWORD *)end - 1);
                *(_OWORD *)((char *)v31 - 24) = v32;
                v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 - 24);
                end -= 24;
              }
              while (end != begin);
              begin = (char *)*p_begin;
            }
            v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v30 + 24);
            v6->_rangeAndStringVector.__begin_ = v31;
            v6->_rangeAndStringVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v30 + 24);
            v6->_rangeAndStringVector.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v29[24 * v28];
            if (begin)
              operator delete(begin);
          }
          else
          {
            *(_QWORD *)end = v18;
            *((_QWORD *)end + 1) = v19;
            v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 24);
            *((_DWORD *)end + 4) = v20;
          }
          v6->_rangeAndStringVector.__end_ = v23;
          if (++v16 == v10)
            goto LABEL_32;
        }
      }
      else
      {
LABEL_32:
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v6->_stringToIndexMap, vcvtps_u32_f32((float)v10 / v6->_stringToIndexMap.__table_.__p3_.__value_));
        v43 = 0;
        v33 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v43);
        v11 = v43;
        if (!v11)
        {
          v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v33);
          strings = v6->_strings;
          v6->_strings = (NSMutableArray *)v34;

          v42 = 0;
          if (!v33)
          {
LABEL_36:
            v13 = 0;
            v12 = 0;
LABEL_6:

            if (v13)
              goto LABEL_7;
LABEL_8:
            v14 = v6;
            goto LABEL_9;
          }
          while (1)
          {
            v40 = 0;
            v36 = -[VMUSimpleDeserializer copyDeserializedStringWithError:](v9, "copyDeserializedStringWithError:", &v40);
            v37 = v40;
            v41 = v36;
            if (v37)
              break;
            -[NSMutableArray addObject:](v6->_strings, "addObject:", v36);
            std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)&v6->_stringToIndexMap, &v41, &v41, &v42);

            if (++v42 >= v33)
              goto LABEL_36;
          }
          v12 = v37;

LABEL_5:
          v13 = 1;
          goto LABEL_6;
        }
      }
    }
    v12 = v11;
    goto LABEL_5;
  }
LABEL_7:
  v14 = 0;
LABEL_9:

  return v14;
}

- (id)description
{
  void *v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = self->_rangeAndStringVector.__begin_;
        i != self->_rangeAndStringVector.__end_;
        i = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)i + 24))
  {
    v5 = *(_QWORD *)i;
    v6 = *((_QWORD *)i + 1);
    v7 = *((unsigned int *)i + 4);
    -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%#llx-%#llx[%llu] stringID %u %@\n"), v5, v6 + v5, v6, v7, v8);

  }
  return v3;
}

- (unsigned)count
{
  return -1431655765
       * ((unint64_t)(self->_rangeAndStringVector.__end_ - self->_rangeAndStringVector.__begin_) >> 3);
}

- (unsigned)uniquedStringCount
{
  return -[NSMutableArray count](self->_strings, "count");
}

- (void)sort
{
  __n128 v2;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __int128 *end;
  unint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(__int128 *, __int128 *);

  if (!self->_sorted)
  {
    begin = self->_rangeAndStringVector.__begin_;
    end = (__int128 *)self->_rangeAndStringVector.__end_;
    v6 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3));
    v8 = (uint64_t (*)(__int128 *, __int128 *))CompareRangeAndString;
    if (end == (__int128 *)begin)
      v7 = 0;
    else
      v7 = v6;
    std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>((uint64_t)begin, end, &v8, v7, 1, v2);
    self->_sorted = 1;
  }
}

- (unsigned)indexForString:(id)a3 insertIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t **v6;
  unsigned int v7;
  unsigned int v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if (!v10)
    return -1;
  v6 = std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>(&self->_stringToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v10);
  if (v6)
  {
    v7 = *((_DWORD *)v6 + 6);
  }
  else if (v4)
  {
    -[NSMutableArray addObject:](self->_strings, "addObject:", v10);
    v9 = -[NSMutableArray count](self->_strings, "count") - 1;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)&self->_stringToIndexMap, &v10, &v10, &v9);
    v7 = v9;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)setString:(id)a3 forRange:(_VMURange)a4
{
  unint64_t length;
  unint64_t location;
  id v7;
  unsigned int v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  __int128 v22;
  id v23;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (v7)
  {
    v23 = v7;
    v8 = -[VMURangeToStringMap indexForString:insertIfMissing:](self, "indexForString:insertIfMissing:", v7, 1);
    if (self->_sorted
      && -[VMURangeToStringMap count](self, "count")
      && location < *((_QWORD *)self->_rangeAndStringVector.__end_ - 2)
                  + *((_QWORD *)self->_rangeAndStringVector.__end_ - 3))
    {
      self->_sorted = 0;
    }
    value = self->_rangeAndStringVector.__end_cap_.__value_;
    end = self->_rangeAndStringVector.__end_;
    if (end >= value)
    {
      begin = self->_rangeAndStringVector.__begin_;
      v13 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      v14 = v13 + 1;
      if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
      v15 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      if (2 * v15 > v14)
        v14 = 2 * v15;
      if (v15 >= 0x555555555555555)
        v16 = 0xAAAAAAAAAAAAAAALL;
      else
        v16 = v14;
      if (v16)
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAndString>>((uint64_t)&self->_rangeAndStringVector.__end_cap_, v16);
      else
        v17 = 0;
      v18 = &v17[24 * v13];
      v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v17[24 * v16];
      *(_QWORD *)v18 = location;
      *((_QWORD *)v18 + 1) = length;
      *((_DWORD *)v18 + 4) = v8;
      *((_DWORD *)v18 + 5) = 0;
      v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 24);
      v21 = self->_rangeAndStringVector.__begin_;
      v20 = self->_rangeAndStringVector.__end_;
      if (v20 != v21)
      {
        do
        {
          v22 = *(_OWORD *)((char *)v20 - 24);
          *((_QWORD *)v18 - 1) = *((_QWORD *)v20 - 1);
          *(_OWORD *)(v18 - 24) = v22;
          v18 -= 24;
          v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v20 - 24);
        }
        while (v20 != v21);
        v20 = self->_rangeAndStringVector.__begin_;
      }
      self->_rangeAndStringVector.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v18;
      self->_rangeAndStringVector.__end_ = v11;
      self->_rangeAndStringVector.__end_cap_.__value_ = v19;
      if (v20)
        operator delete(v20);
    }
    else
    {
      *(_QWORD *)end = location;
      *((_QWORD *)end + 1) = length;
      v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 24);
      *((_DWORD *)end + 4) = v8;
      *((_DWORD *)end + 5) = 0;
    }
    self->_rangeAndStringVector.__end_ = v11;
    v7 = v23;
  }

}

- (id)stringForAddress:(unint64_t)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v6;
  unint64_t v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  unint64_t v9;
  unint64_t *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  unint64_t v12;
  void *v13;

  if (!self->_sorted)
    -[VMURangeToStringMap sort](self, "sort");
  begin = self->_rangeAndStringVector.__begin_;
  v6 = self->_rangeAndStringVector.__end_ - begin;
  if (!v6)
    goto LABEL_12;
  v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
  v8 = self->_rangeAndStringVector.__begin_;
  do
  {
    v9 = v7 >> 1;
    v10 = (unint64_t *)((char *)v8 + 24 * (v7 >> 1));
    v12 = *v10;
    v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 3);
    v7 += ~(v7 >> 1);
    if (v12 > a3)
      v7 = v9;
    else
      v8 = v11;
  }
  while (v7);
  if (v8 == begin || a3 - *((_QWORD *)v8 - 3) >= *((_QWORD *)v8 - 2))
  {
LABEL_12:
    v13 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", *((unsigned int *)v8 - 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (_VMURange)rangeContainingAddress:(unint64_t)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v6;
  unint64_t v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  unint64_t v9;
  unint64_t *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _VMURange result;

  if (!self->_sorted)
    -[VMURangeToStringMap sort](self, "sort");
  begin = self->_rangeAndStringVector.__begin_;
  v6 = self->_rangeAndStringVector.__end_ - begin;
  if (!v6)
    goto LABEL_11;
  v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
  v8 = self->_rangeAndStringVector.__begin_;
  do
  {
    v9 = v7 >> 1;
    v10 = (unint64_t *)((char *)v8 + 24 * (v7 >> 1));
    v12 = *v10;
    v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 3);
    v7 += ~(v7 >> 1);
    if (v12 > a3)
      v7 = v9;
    else
      v8 = v11;
  }
  while (v7);
  if (v8 == begin || (v13 = *((_QWORD *)v8 - 3), v14 = *((_QWORD *)v8 - 2), a3 - v13 >= v14))
  {
LABEL_11:
    v14 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v14;
  result.location = v13;
  return result;
}

- (_VMURange)rangeForString:(id)a3 startingAtAddress:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _VMURange result;

  v6 = a3;
  v7 = -[VMURangeToStringMap indexForString:insertIfMissing:](self, "indexForString:insertIfMissing:", v6, 0);
  if (v7 != -1)
  {
    if (!self->_sorted)
      -[VMURangeToStringMap sort](self, "sort");
    begin = self->_rangeAndStringVector.__begin_;
    end = self->_rangeAndStringVector.__end_;
    if (end != begin)
    {
      v10 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      do
      {
        v11 = v10 >> 1;
        v12 = (unint64_t *)((char *)begin + 24 * (v10 >> 1));
        v14 = *v12;
        v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v12 + 3);
        v10 += ~(v10 >> 1);
        if (v14 > a4)
          v10 = v11;
        else
          begin = v13;
      }
      while (v10);
    }
    while (begin != end)
    {
      if (*((_DWORD *)begin + 4) == v7)
      {
        v16 = *(_QWORD *)begin;
        v15 = *((_QWORD *)begin + 1);
        goto LABEL_15;
      }
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
    }
  }
  v15 = 0;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  v17 = v16;
  v18 = v15;
  result.length = v18;
  result.location = v17;
  return result;
}

- (id)stringForIndex:(unsigned int)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", a3);
}

- (void)resymbolicateStringsWithSymbolicator:(_CSTypeRef)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = -[NSMutableArray count](self->_strings, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("0x")))
      {
        v8 = objc_msgSend(v7, "rangeOfString:", CFSTR(" "));
        objc_msgSend(v7, "substringToIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (checkStringIsValidHexAddress(v9))
        {
          strtoll((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), 0, 16);
          CSSymbolicatorGetSymbolWithAddressAtTime();
          if ((CSIsNull() & 1) == 0 && (CSSymbolIsUnnamed() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolGetName());
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", 0, v8, v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableArray setObject:atIndexedSubscript:](self->_strings, "setObject:atIndexedSubscript:", v11, i);
          }
        }

      }
    }
  }
}

- (void)enumerateRanges:(id)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  id v6;

  v6 = a3;
  begin = self->_rangeAndStringVector.__begin_;
  end = self->_rangeAndStringVector.__end_;
  while (begin != end)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, *(_QWORD *)begin, *((_QWORD *)begin + 1));
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
  }

}

- (void)enumerateHexAddressesInStrings:(id)a3
{
  void (**v4)(id, uint64_t);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_strings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasPrefix:", CFSTR("0x"), (_QWORD)v13) & 1) != 0)
        {
          v10 = objc_msgSend(v9, "rangeOfString:", CFSTR(" "));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v9, "substringToIndex:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (checkStringIsValidHexAddress(v11))
            {
              v12 = strtoll((const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), 0, 16);
              v4[2](v4, v12);
            }

          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_rangeAndStringVector.__begin_;
  if (begin)
  {
    self->_rangeAndStringVector.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_stringToIndexMap);
  objc_storeStrong((id *)&self->_strings, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
