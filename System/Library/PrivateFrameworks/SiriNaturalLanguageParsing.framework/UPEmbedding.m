@implementation UPEmbedding

- (UPEmbedding)initWithCoordinates:(id)a3
{
  id v4;
  UPEmbedding *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *__p;
  _QWORD *v31;
  unint64_t v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UPEmbedding;
  v5 = -[UPEmbedding init](&v33, sel_init);
  if (v5)
  {
    __p = 0;
    v31 = 0;
    v32 = 0;
    std::vector<double>::reserve(&__p, objc_msgSend(v4, "count"));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "doubleValue");
          v11 = v10;
          v12 = v31;
          if ((unint64_t)v31 >= v32)
          {
            v14 = __p;
            v15 = ((char *)v31 - (_BYTE *)__p) >> 3;
            v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 61)
              std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
            v17 = v32 - (_QWORD)__p;
            if ((uint64_t)(v32 - (_QWORD)__p) >> 2 > v16)
              v16 = v17 >> 2;
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
              v18 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v18 = v16;
            if (v18)
            {
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v32, v18);
              v14 = __p;
              v12 = v31;
            }
            else
            {
              v19 = 0;
            }
            v20 = &v19[8 * v15];
            *(_QWORD *)v20 = v11;
            v13 = v20 + 8;
            while (v12 != v14)
            {
              v21 = *--v12;
              *((_QWORD *)v20 - 1) = v21;
              v20 -= 8;
            }
            __p = v20;
            v31 = v13;
            v32 = (unint64_t)&v19[8 * v18];
            if (v14)
              operator delete(v14);
          }
          else
          {
            *v31 = v10;
            v13 = v12 + 1;
          }
          v31 = v13;
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v7);
    }

    v22 = operator new();
    v24 = 0uLL;
    v25 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v24, __p, (uint64_t)v31, ((char *)v31 - (_BYTE *)__p) >> 3);
    *(_OWORD *)v22 = v24;
    *(_QWORD *)(v22 + 16) = v25;
    v25 = 0;
    v24 = 0uLL;
    v5->_embedding = (void *)v22;
    if (__p)
    {
      v31 = __p;
      operator delete(__p);
    }
  }

  return v5;
}

- (UPEmbedding)initWithProtobufEmbeddings:(id)a3 forTokenAt:(int)a4 error:(id *)p_isa
{
  uint64_t v6;
  id v8;
  __CFString *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v6 = *(_QWORD *)&a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((objc_msgSend(v8, "hasEmbeddingDim") & 1) != 0)
  {
    if (objc_msgSend(v8, "hasNumToken") && objc_msgSend(v8, "numToken") > (unint64_t)(int)v6
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tokenIndex %u is out-of-bounds for an embedding tensor with %llu tokens"), v6, objc_msgSend(v8, "numToken")), (v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10 = objc_msgSend(v8, "embeddingDim");
      if (v10 * ((int)v6 + 1) <= (unint64_t)objc_msgSend(v8, "valuesCount")
        || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protobuf message contains only %lu values but UPEmbedding for tokenIndex %u is being created (embeddingDim=%llu)"), objc_msgSend(v8, "valuesCount"), v6, objc_msgSend(v8, "embeddingDim")), (v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v11 = objc_msgSend(v8, "valuesCount");
        if (!(v11 % objc_msgSend(v8, "embeddingDim"))
          || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protobuf message contains %lu embedding values which is not a multiple of %llu embedding dimensions"), objc_msgSend(v8, "valuesCount"), objc_msgSend(v8, "embeddingDim")), (v9 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "embeddingDim"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 0;
          v14 = (int)v6;
          while (objc_msgSend(v8, "embeddingDim") > v13)
          {
            v15 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v8, "valuesAtIndex:", v13 + objc_msgSend(v8, "embeddingDim") * v14);
            objc_msgSend(v15, "numberWithFloat:");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:atIndexedSubscript:", v16, v13);

            ++v13;
          }
          self = -[UPEmbedding initWithCoordinates:](self, "initWithCoordinates:", v12);

          v9 = 0;
          p_isa = (id *)&self->super.isa;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    v9 = CFSTR("embeddingDim field missing from protobuf message");
  }
  if (p_isa)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *p_isa = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 10, v18);

    p_isa = 0;
  }
LABEL_15:

  return (UPEmbedding *)p_isa;
}

- (id)getCoordinates
{
  void *embedding;
  void *v3;
  double *v4;
  double *v5;
  void *v6;
  void *v7;
  void *__p;
  double *v10;
  uint64_t v11;

  embedding = self->_embedding;
  v10 = 0;
  v11 = 0;
  __p = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)embedding, *((_QWORD *)embedding + 1), (uint64_t)(*((_QWORD *)embedding + 1) - *(_QWORD *)embedding) >> 3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", ((char *)v10 - (_BYTE *)__p) >> 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double *)__p;
  v5 = v10;
  if (__p != v10)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 != v5);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v10 = (double *)__p;
    operator delete(__p);
  }
  return v7;
}

- (unint64_t)getDimension
{
  void *embedding;
  _BYTE *v3;
  _BYTE *v4;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;

  embedding = self->_embedding;
  v7 = 0;
  v8 = 0;
  v6 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v6, *(const void **)embedding, *((_QWORD *)embedding + 1), (uint64_t)(*((_QWORD *)embedding + 1) - *(_QWORD *)embedding) >> 3);
  v3 = v6;
  v4 = v7;
  if (v6)
  {
    v7 = v6;
    operator delete(v6);
  }
  return (v4 - v3) >> 3;
}

- (void)dealloc
{
  void **embedding;
  void *v4;
  objc_super v5;

  embedding = (void **)self->_embedding;
  if (embedding)
  {
    v4 = *embedding;
    if (*embedding)
    {
      embedding[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1C3BB9B44](embedding, 0x80C40D6874129);
  }
  v5.receiver = self;
  v5.super_class = (Class)UPEmbedding;
  -[UPEmbedding dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{UPEmbedding: dimension %lu}"), -[UPEmbedding getDimension](self, "getDimension"));
}

@end
