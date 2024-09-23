@implementation VMUSimpleDeserializer

- (VMUSimpleDeserializer)initWithData:(id)a3
{
  id v5;
  VMUSimpleDeserializer *v6;
  unint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  char *v14;

  v5 = a3;
  v6 = -[VMUSimpleDeserializer init](self, "init");
  if (v6)
  {
    v7 = objc_msgSend(v5, "length");
    if (v7 > 0xF
      && (objc_storeStrong((id *)&v6->_data, a3),
          v8 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v5), "bytes"),
          v9 = v8[3],
          v7 >= v9)
      && (v10 = v8[1], v11 = v8[2], v12 = v11 >= v10, v13 = v11 - v10, v12)
      && v11 <= v9)
    {
      v6->super._intRegCapacity = v13;
      v6->super._stringRegCapacity = v8[3] - v8[2];
      v14 = (char *)v8 + v8[2];
      v6->super._intRegion = (char *)v8 + v8[1];
      v6->super._stringRegion = v14;
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (unsigned)deserialize32WithError:(id *)a3
{
  return _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
}

- (unint64_t)deserialize64WithError:(id *)a3
{
  uint64_t Field;
  unsigned int v6;

  Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3)
  {
    if (*a3)
      return 0;
    v6 = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
    if (*a3)
      return 0;
  }
  else
  {
    v6 = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, 0);
  }
  return v6 | (unint64_t)(Field << 32);
}

- (void)skipFields:(unsigned int)a3
{
  self->super._cursor += 4 * a3;
}

- (id)copyDeserializedStringWithID:(unsigned int)a3 error:(id *)a4
{
  unordered_map<unsigned int, NSString *, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, NSString *>>> *p_stringCache;
  uint64_t *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  unsigned int v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  if (a3 == -1)
    return 0;
  p_stringCache = &self->_stringCache;
  v7 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&self->_stringCache.__table_.__bucket_list_.__ptr_.__value_, &v25);
  if (v25 >= self->super._stringRegCapacity)
  {
    serializerLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      _nextField(v9, v10, v11, v12, v13, v14, v15, v16);

    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = OOBDOMAIN;
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("Out-of-bound access.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 1, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  if (v7)
    return (id)v7[3];
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v22 = (void *)objc_msgSend(v21, "initWithUTF8String:", &self->super._stringRegion[v25]);
  v23 = v25;
  v20 = v22;
  v24 = v20;
  std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,NSString * {__strong}>>((uint64_t)p_stringCache, &v23, (uint64_t)&v23);

  return v20;
}

- (id)copyDeserializedStringWithError:(id *)a3
{
  uint64_t Field;

  Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3 && *a3)
    return 0;
  else
    return -[VMUSimpleDeserializer copyDeserializedStringWithID:error:](self, "copyDeserializedStringWithID:error:", Field, a3);
}

- (const)copyDeserializedNullTerminatedBytesWithError:(id *)a3
{
  unsigned int Field;
  BOOL v6;
  unsigned int stringRegCapacity;

  Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3)
  {
    if (*a3)
      v6 = 1;
    else
      v6 = Field == -1;
    if (!v6)
      goto LABEL_9;
    return 0;
  }
  if (Field == -1)
    return 0;
LABEL_9:
  stringRegCapacity = self->super._stringRegCapacity;
  if (stringRegCapacity <= Field)
    -[VMUSimpleDeserializer copyDeserializedNullTerminatedBytesWithError:].cold.1();
  return strndup(&self->super._stringRegion[Field], stringRegCapacity - Field);
}

- (unsigned)_deserializeValues:(unsigned int)a3 error:(id *)a4
{
  uint64_t cursor;
  unint64_t v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  cursor = self->super._cursor;
  v5 = cursor + 4 * a3;
  if (v5 <= self->super._intRegCapacity)
  {
    v18 = (unsigned int *)&self->super._intRegion[cursor];
    self->super._cursor = v5;
  }
  else
  {
    serializerLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      _nextField(v7, v8, v9, v10, v11, v12, v13, v14);

    if (a4)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = OOBDOMAIN;
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("Out-of-bound access.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 1, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::~__hash_table((uint64_t)&self->_stringCache);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

- (void)copyDeserializedNullTerminatedBytesWithError:.cold.1()
{
  __assert_rtn("-[VMUSimpleDeserializer copyDeserializedNullTerminatedBytesWithError:]", "VMUSimpleSerializer.mm", 229, "stringID < _stringRegCapacity");
}

@end
