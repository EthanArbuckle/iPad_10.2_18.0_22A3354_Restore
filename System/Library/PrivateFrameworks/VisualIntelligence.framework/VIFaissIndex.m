@implementation VIFaissIndex

+ (BOOL)hasFaissSupport
{
  return 1;
}

- (VIFaissIndex)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  void *v6;
  VIFaissIndex *v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VIFaissIndex initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v6, a4);

  return v7;
}

- (VIFaissIndex)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  VIFaissIndex *v7;
  id v8;
  faiss *v9;
  uint64_t index;
  Index *value;
  void *v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VIFaissIndex;
  v7 = -[VIFaissIndex init](&v14, sel_init);
  if (!v7)
    goto LABEL_8;
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    if (!a4)
      goto LABEL_9;
    v15 = *MEMORY[0x1E0CB3308];
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 262, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    a4 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (faiss *)objc_msgSend(v8, "fileSystemRepresentation");

  index = faiss::read_index(v9, 0);
  value = v7->_index.__ptr_.__value_;
  v7->_index.__ptr_.__value_ = (Index *)index;
  if (value)
    (*(void (**)(Index *))(*(_QWORD *)value + 8))(value);
  a4 = v7;
LABEL_9:

  return (VIFaissIndex *)a4;
}

- (int64_t)numberOfIndexedEmbeddings
{
  return *((_QWORD *)self->_index.__ptr_.__value_ + 2);
}

- (int64_t)embeddingLength
{
  return *((int *)self->_index.__ptr_.__value_ + 2);
}

- (id)searchWithQuery:(id)a3 numberOfNearestNeighbors:(int64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Index *value;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int v23;
  int64_t v24;
  void *v25;
  void *v26;
  VIFaissSearchResult *v27;
  double v28;
  VIFaissSearchResult *v29;
  double v30;
  int64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  _DWORD *v35;
  unint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  VIFaissIndex *v46;
  int64_t v47;
  void *v48;
  int v50;
  void *__p;
  _BYTE *v52;
  void *v53[3];
  void *v54[3];
  void *v55[4];

  v7 = a5;
  v41 = a3;
  if (objc_msgSend(v41, "dataType") != 65568)
  {
    v18 = 5;
LABEL_8:
    -[VIFaissIndex getFaissError:forCode:](self, "getFaissError:forCode:", a6, v18);
    v19 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v41, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != 2)
  {
    v18 = 6;
    goto LABEL_8;
  }
  v11 = objc_retainAutorelease(v41);
  v39 = objc_msgSend(v11, "dataPointer");
  v48 = (void *)objc_opt_new();
  objc_msgSend(v11, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v11, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v16, "integerValue");

  if (v47 == -[VIFaissIndex embeddingLength](self, "embeddingLength"))
  {
    v54[0] = 0;
    std::vector<long long>::vector(v55, v14 * a4, v54);
    LODWORD(v53[0]) = 0;
    std::vector<float>::vector(v54, v14 * a4, v53);
    LODWORD(__p) = 0;
    std::vector<float>::vector(v53, v47 * v14 * a4, &__p);
    v50 = 0;
    std::vector<float>::vector(&__p, v47, &v50);
    value = self->_index.__ptr_.__value_;
    v46 = self;
    if ((v7 & 1) != 0)
      (*(void (**)(Index *, uint64_t, uint64_t, int64_t, void *, void *, void *))(*(_QWORD *)value + 96))(value, v14, v39, a4, v54[0], v55[0], v53[0]);
    else
      (*(void (**)(Index *, uint64_t, uint64_t, int64_t, void *, void *))(*(_QWORD *)value + 40))(value, v14, v39, a4, v54[0], v55[0]);
    if (v14 >= 1)
    {
      v42 = 0;
      v43 = 0;
      v40 = v14;
      v45 = v7;
      while (a4 < 1)
      {
LABEL_30:
        ++v42;
        v43 += 4 * v47 * a4;
        if (v42 == v40)
          goto LABEL_31;
      }
      v20 = 0;
      v21 = v43;
      v22 = v42 * a4;
      v44 = v39 + 4 * v42 * v47;
      while (1)
      {
        v23 = *((_DWORD *)v54[0] + v20 + v22);
        if (*((_QWORD *)v55[0] + v20 + v22) == -1
          || (v24 = -[VIFaissIndex identifierForIndex:](self, "identifierForIndex:"), v24 == 0x7FFFFFFFFFFFFFFFLL))
        {
          v25 = 0;
          v26 = 0;
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          if ((v7 & 1) != 0)
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v47);
            v31 = v47;
            v32 = v21;
            if (v47 >= 1)
            {
              do
              {
                LODWORD(v30) = *(_DWORD *)((char *)v53[0] + v32);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30, v39);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v33);

                v32 += 4;
                --v31;
              }
              while (v31);
            }
            v7 = v45;
            self = v46;
            if ((v45 & 2) != 0)
            {
LABEL_26:
              (*(void (**)(Index *, uint64_t, void *, int64_t))(*(_QWORD *)self->_index.__ptr_.__value_
                                                                               + 104))(self->_index.__ptr_.__value_, v44, __p, v24);
              v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v47);
              v35 = __p;
              if (v52 != __p)
              {
                v36 = 0;
                do
                {
                  LODWORD(v34) = v35[v36];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34, v39);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "addObject:", v37);

                  ++v36;
                  v35 = __p;
                }
                while (v36 < (v52 - (_BYTE *)__p) >> 2);
                v7 = v45;
                self = v46;
              }
              goto LABEL_18;
            }
          }
          else
          {
            v25 = 0;
            if ((v7 & 2) != 0)
              goto LABEL_26;
          }
          v26 = 0;
        }
LABEL_18:
        v27 = [VIFaissSearchResult alloc];
        LODWORD(v28) = v23;
        v29 = -[VIFaissSearchResult initWithIdentifier:distance:embedding:residual:](v27, "initWithIdentifier:distance:embedding:residual:", v24, v25, v26, v28);
        objc_msgSend(v48, "addObject:", v29);

        ++v20;
        v21 += 4 * v47;
        if (v20 == a4)
          goto LABEL_30;
      }
    }
LABEL_31:
    v19 = v48;
    if (__p)
    {
      v52 = __p;
      operator delete(__p);
    }
    if (v53[0])
    {
      v53[1] = v53[0];
      operator delete(v53[0]);
    }
    if (v54[0])
    {
      v54[1] = v54[0];
      operator delete(v54[0]);
    }
    if (v55[0])
    {
      v55[1] = v55[0];
      operator delete(v55[0]);
    }
  }
  else
  {
    -[VIFaissIndex getFaissError:forCode:](self, "getFaissError:forCode:", a6, 3);
    v19 = 0;
  }

LABEL_40:
  return v19;
}

- (id)reconstructEmbeddingForIdentifier:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  double v7;
  _DWORD *v8;
  unint64_t v9;
  void *v10;
  int v12;
  void *__p;
  _BYTE *v14;

  v5 = -[VIFaissIndex embeddingLength](self, "embeddingLength");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v12 = 0;
  std::vector<float>::vector(&__p, v5, &v12);
  (*(void (**)(Index *, int64_t, void *))(*(_QWORD *)self->_index.__ptr_.__value_ + 80))(self->_index.__ptr_.__value_, a3, __p);
  v8 = __p;
  if (v14 != __p)
  {
    v9 = 0;
    do
    {
      LODWORD(v7) = v8[v9];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);

      ++v9;
      v8 = __p;
    }
    while (v9 < (v14 - (_BYTE *)__p) >> 2);
  }
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }
  return v6;
}

- (id)computeResidualForEmbedding:(id)a3 identifier:(int64_t)a4 error:(id *)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  double v13;
  _DWORD *v14;
  unint64_t v15;
  void *v16;
  id v17;
  int v19;
  void *__p;
  _BYTE *v21;
  void *v22;
  _BYTE *v23;

  v7 = a3;
  v8 = -[VIFaissIndex embeddingLength](self, "embeddingLength");
  if (objc_msgSend(v7, "count") == v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    std::vector<float>::vector(&v22, v8);
    v19 = 0;
    std::vector<float>::vector(&__p, v8, &v19);
    if (v23 != v22)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        *((_DWORD *)v22 + v10) = v12;

        ++v10;
      }
      while (v10 < (v23 - (_BYTE *)v22) >> 2);
    }
    (*(void (**)(Index *))(*(_QWORD *)self->_index.__ptr_.__value_ + 104))(self->_index.__ptr_.__value_);
    v14 = __p;
    if (v21 != __p)
    {
      v15 = 0;
      do
      {
        LODWORD(v13) = v14[v15];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        ++v15;
        v14 = __p;
      }
      while (v15 < (v21 - (_BYTE *)__p) >> 2);
    }
    v17 = v9;
    if (__p)
    {
      v21 = __p;
      operator delete(__p);
    }
    if (v22)
    {
      v23 = v22;
      operator delete(v22);
    }

  }
  else
  {
    -[VIFaissIndex getFaissError:forCode:](self, "getFaissError:forCode:", a5, 4);
    v17 = 0;
  }

  return v17;
}

- (int64_t)identifierForIndex:(int64_t)a3
{
  return a3;
}

- (void)getFaissError:(id *)a3 forCode:(int64_t)a4
{
  -[VIFaissIndex getFaissError:forCode:userInfo:](self, "getFaissError:forCode:userInfo:", a3, a4, 0);
}

- (void)getFaissError:(id *)a3 forCode:(int64_t)a4 userInfo:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  if (a3)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.argos.faiss.error_domain"), a4, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v8;
  }

}

- (void)getFaissError:(id *)a3 forFaissException:(const void *)a4
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = *MEMORY[0x1E0CB2D50];
    v7 = (char *)*((_QWORD *)a4 + 1);
    v5 = (char *)a4 + 8;
    v6 = v7;
    if (v5[23] >= 0)
      v8 = v5;
    else
      v8 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.argos.faiss.error_domain"), 2, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (void).cxx_destruct
{
  Index *value;

  value = self->_index.__ptr_.__value_;
  self->_index.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Index *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
