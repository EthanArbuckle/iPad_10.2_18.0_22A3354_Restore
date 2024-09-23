@implementation REFeatureValueCounter

- (unint64_t)count
{
  return self->_count;
}

void __43__REFeatureValueCounter_readFromURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[REFeatureValue featureValueWithDictionary:](REFeatureValue, "featureValueWithDictionary:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "replacePointerAtIndex:withPointer:", a3, v5);

  }
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  id v6;
  _opaque_pthread_rwlock_t *p_lock;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  void *v22;
  _opaque_pthread_rwlock_t *v23;
  _QWORD v24[5];
  std::string __p;
  id v26;
  id v27;
  id v28;

  v6 = a3;
  p_lock = &self->_lock;
  pthread_rwlock_wrlock(&self->_lock);
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("index.idx"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v8, 4, &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if (v9)
  {
    v22 = v8;
    v23 = &self->_lock;
    v11 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("values.dat"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v10;
    objc_msgSend(v11, "dataWithContentsOfURL:options:error:", v12, 0, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;

    if (!v13)
    {
      if (!a4)
      {
        v19 = 0;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to read contents of %@."), CFSTR("values.dat"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[REFeatureValueCounter _createErrorWithCode:description:underlyingError:](self, "_createErrorWithCode:description:underlyingError:", 2, v15, v14);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
      v10 = v14;
      v8 = v22;
      p_lock = v23;
      goto LABEL_21;
    }
    v26 = v14;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v13, 4, &v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v26;

    if (v15)
    {
      -[REFeatureValueCounter _updateConfigurationForCount:](self, "_updateConfigurationForCount:", objc_msgSend(v15, "count"));
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
      v17 = REFancyShrinkingDictionary::LoadModel((uint64_t)&self->_indicies, &__p);
      v18 = v17;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v18)
          goto LABEL_6;
      }
      else if (v17)
      {
LABEL_6:
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __43__REFeatureValueCounter_readFromURL_error___block_invoke;
        v24[3] = &unk_24CF8CB20;
        v24[4] = self;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v24);
        v19 = 1;
LABEL_18:
        v14 = v16;
        goto LABEL_19;
      }
      if (a4)
      {
        -[REFeatureValueCounter _createErrorWithCode:description:underlyingError:](self, "_createErrorWithCode:description:underlyingError:", 6, CFSTR("Unable to load model."), 0);
        v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to serialize content of %@ into JSON."), CFSTR("values.dat"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REFeatureValueCounter _createErrorWithCode:description:underlyingError:](self, "_createErrorWithCode:description:underlyingError:", 5, v20, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v19 = 0;
    goto LABEL_18;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to read contents of %@."), CFSTR("index.idx"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REFeatureValueCounter _createErrorWithCode:description:underlyingError:](self, "_createErrorWithCode:description:underlyingError:", 2, v13, v10);
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  v19 = 0;
LABEL_22:

  pthread_rwlock_unlock(p_lock);
  return v19;
}

- (void)_updateConfigurationForCount:(unint64_t)a3
{
  _opaque_pthread_rwlock_t *p_lock;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSPointerArray *v12;
  NSPointerArray *values;
  REFancyShrinkingDictionary v14;

  p_lock = &self->_lock;
  pthread_rwlock_wrlock(&self->_lock);
  if (a3 <= 1)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Count is too low. Must be 2 or greater. Changing to 2 to avoid a crash in production."), v6, v7, v8, v9, v10, v11, (uint64_t)v14.m_mapDocumentFrequency.__table_.__bucket_list_.__ptr_.__value_);
    a3 = 2;
  }
  self->_count = a3 - 1;
  objc_msgSend(MEMORY[0x24BDD1748], "strongObjectsPointerArray");
  v12 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
  values = self->_values;
  self->_values = v12;

  -[NSPointerArray setCount:](self->_values, "setCount:", a3);
  REFancyShrinkingDictionary::REFancyShrinkingDictionary(&v14, a3 - 1, (unint64_t)(float)((float)(a3 - 1) * 0.8), 1, 0, 1);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__move_assign((uint64_t)&self->_indicies, (uint64_t *)&v14);
  *(_OWORD *)&self->_indicies.m_maxSize = *(_OWORD *)&v14.m_maxSize;
  *(unint64_t *)((char *)&self->_indicies.m_shrinkSize + 6) = *(unint64_t *)((char *)&v14.m_shrinkSize + 6);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&v14);
  pthread_rwlock_unlock(p_lock);
}

- (REFeatureValueCounter)init
{
  REFeatureValueCounter *v2;
  uint64_t v3;
  NSPointerArray *values;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REFeatureValueCounter;
  v2 = -[REFeatureValueCounter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "strongObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    values = v2->_values;
    v2->_values = (NSPointerArray *)v3;

    -[REFeatureValueCounter _updateConfigurationForCount:](v2, "_updateConfigurationForCount:", 20);
  }
  return v2;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  char v19;
  void *v20;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  std::ios_base v26;
  uint64_t v27;
  int v28;
  _BYTE __sb[120];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  pthread_rwlock_rdlock(&self->_lock);
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("index.idx"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199B1CE4](__sb);
  objc_msgSend(v22, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  std::filebuf::open();

  v8 = v30;
  if (v30)
  {
    v25 = MEMORY[0x24BEDB828] + 24;
    v26.__vftable = (std::ios_base_vtbl *)(MEMORY[0x24BEDB828] + 64);
    std::ios_base::init(&v26, __sb);
    v27 = 0;
    v28 = -1;
    REFancyShrinkingDictionary::SaveModel((uint64_t)&self->_indicies, &v25);
    std::ostream::flush();
    std::ostream::~ostream();
  }
  std::filebuf::close();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_count)
    {
      v10 = 0;
      do
      {
        -[NSPointerArray pointerAtIndex:](self->_values, "pointerAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          objc_msgSend(v11, "dictionaryEncoding");
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

        ++v10;
      }
      while (v10 < self->_count);
    }
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 0, &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    if (v14)
    {
      objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("values.dat"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v15;
      v17 = objc_msgSend(v14, "writeToURL:options:error:", v16, 1, &v23);
      v18 = v23;

      if (a4)
        v19 = v17;
      else
        v19 = 1;
      if ((v19 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to write to %@."), CFSTR("values.dat"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[REFeatureValueCounter _createErrorWithCode:description:underlyingError:](self, "_createErrorWithCode:description:underlyingError:", 3, v20, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v17 = 0;
      }
      v15 = v18;
    }
    else if (a4)
    {
      -[REFeatureValueCounter _createErrorWithCode:description:underlyingError:](self, "_createErrorWithCode:description:underlyingError:", 4, CFSTR("Unable to deserialize JSON content into data."), v15);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

    goto LABEL_24;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to open %@."), CFSTR("index.idx"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REFeatureValueCounter _createErrorWithCode:description:underlyingError:](self, "_createErrorWithCode:description:underlyingError:", 1, v9, 0);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  v17 = 0;
LABEL_25:
  MEMORY[0x2199B1CF0](__sb);

  pthread_rwlock_unlock(&self->_lock);
  return v17;
}

- (unint64_t)trackedValueForValue:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  void *__p[2];
  char v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22[2];
  char v23;

  v4 = a3;
  pthread_rwlock_wrlock(&self->_lock);
  if (!self->_count)
    goto LABEL_19;
  v5 = 0;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    -[NSPointerArray pointerAtIndex:](self->_values, "pointerAtIndex:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 == 0)
      v10 = v5;
    else
      v10 = v6;
    if (v7)
    {
      if ((objc_msgSend(v4, "isEqual:", v7) & 1) != 0)
      {

        goto LABEL_15;
      }
    }
    else
    {
      v6 = v10;
    }

    ++v5;
  }
  while (v5 < self->_count);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
  if (v5 != 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_20;
LABEL_19:
    v5 = self->_count + 1;
    goto LABEL_20;
  }
  -[NSPointerArray replacePointerAtIndex:withPointer:](self->_values, "replacePointerAtIndex:withPointer:", v6, v4);
  v5 = v6;
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v22, (char *)objc_msgSend(v12, "UTF8String"));

  v19 = 0;
  v20 = 0;
  v21 = 0;
  v20 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v19, (__int128 *)v22);
  if (REFancyShrinkingDictionary::pushToIDF((uint64_t)&self->_indicies, &v19) && self->_count)
  {
    v13 = 0;
    do
    {
      if (-[NSPointerArray pointerAtIndex:](self->_values, "pointerAtIndex:", v13))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v15, "UTF8String"));

        if (!REFancyShrinkingDictionary::getTokenCount(&self->_indicies.m_mapDocumentFrequency.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p))-[NSPointerArray replacePointerAtIndex:withPointer:](self->_values, "replacePointerAtIndex:withPointer:", v13, 0);
        if (v18 < 0)
          operator delete(__p[0]);
      }
      ++v13;
    }
    while (v13 < self->_count);
  }
  __p[0] = &v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (v23 < 0)
    operator delete(v22[0]);
  pthread_rwlock_unlock(&self->_lock);

  return v5;
}

- (unint64_t)countForValue:(id)a3
{
  id v4;
  _opaque_pthread_rwlock_t *p_lock;
  uint64_t v6;
  void *v7;
  unsigned __int8 *TokenCount;
  void *v10;
  id v11;
  void *__p[2];
  char v13;

  v4 = a3;
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  if (!self->_count)
    goto LABEL_8;
  v6 = 0;
  while (1)
  {
    -[NSPointerArray pointerAtIndex:](self->_values, "pointerAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((objc_msgSend(v4, "isEqual:", v7) & 1) != 0)
        break;
    }

    if (++v6 >= self->_count)
      goto LABEL_8;
  }

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));

    TokenCount = REFancyShrinkingDictionary::getTokenCount(&self->_indicies.m_mapDocumentFrequency.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else
  {
LABEL_8:
    TokenCount = 0;
  }
  pthread_rwlock_unlock(p_lock);

  return (unint64_t)TokenCount;
}

- (unint64_t)totalCount
{
  _opaque_pthread_rwlock_t *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  v4 = REFancyShrinkingDictionary::totalTermCount(&self->_indicies);
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (id)_createErrorWithCode:(unint64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", a4, *MEMORY[0x24BDD0FC8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD1398]);
  v10 = (void *)MEMORY[0x24BDD1540];
  v11 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("REFeatureValueCounterError"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&self->_indicies);
  objc_storeStrong((id *)&self->_values, 0);
}

- (id).cxx_construct
{
  REFancyShrinkingDictionary::REFancyShrinkingDictionary(&self->_indicies, 0, 0, 1, 1, 0);
  return self;
}

@end
