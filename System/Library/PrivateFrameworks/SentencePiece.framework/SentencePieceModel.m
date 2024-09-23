@implementation SentencePieceModel

- (SentencePieceModel)initWithModelPath:(id)a3
{
  id v4;
  SentencePieceModel *v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  SentencePieceModel *v11;
  uint64_t v13;
  void *__p[2];
  char v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SentencePieceModel;
  v5 = -[SentencePieceModel init](&v16, sel_init);
  if (!v5)
    goto LABEL_13;
  v6 = operator new(0x70uLL);
  v6[1] = 0;
  v6[2] = 0;
  *v6 = &off_2516F7B88;
  v6[3] = &off_2516F72C8;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  __p[0] = v6 + 3;
  __p[1] = v6;
  sub_245D1A93C((uint64_t)&v5->_processor, (__int128 *)__p);
  v7 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v8 = (unint64_t *)((char *)__p[1] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  sub_245CF7F30(__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v5->_processor.__ptr_ + 16))(&v13);
  v10 = v13;
  v13 = 0;
  if (v10)
    sub_245CF8D4C(v10);
  if (v15 < 0)
  {
    operator delete(__p[0]);
    if (v10)
      goto LABEL_11;
LABEL_13:
    v11 = v5;
    goto LABEL_14;
  }
  if (!v10)
    goto LABEL_13;
LABEL_11:
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)dealloc
{
  shared_ptr<sentencepiece::SentencePieceProcessor> *p_processor;
  SentencePieceProcessor *ptr;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  objc_super v8;
  __int128 v9;

  ptr = self->_processor.__ptr_;
  p_processor = &self->_processor;
  if (ptr)
  {
    v9 = 0uLL;
    sub_245D1A93C((uint64_t)p_processor, &v9);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SentencePieceModel;
  -[SentencePieceModel dealloc](&v8, sel_dealloc);
}

- (id)encodeAsIDsFrom:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int *v7;
  unsigned int *v8;
  void *v9;
  uint64_t v11;
  unsigned int *v12;
  unsigned int *v13;
  uint64_t v14;
  void *__p;
  char v16;

  v4 = objc_retainAutorelease(a3);
  sub_245CF7F30(&__p, (char *)objc_msgSend(v4, "UTF8String"));
  v12 = 0;
  v13 = 0;
  v14 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_processor.__ptr_ + 112))(&v11);
  v5 = v11;
  v11 = 0;
  if (v5)
    sub_245CF8D4C(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v13;
  if (v12 != v13)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      ++v7;
    }
    while (v7 != v8);
    v7 = v12;
  }
  if (v7)
  {
    v13 = v7;
    operator delete(v7);
  }
  if (v16 < 0)
    operator delete(__p);

  return v6;
}

- (id)encodeAsTokensFrom:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __int128 *v7;
  __int128 *i;
  __int128 v9;
  void **v10;
  void *v11;
  void *__p[2];
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  __int128 *v17;
  uint64_t v18;
  void *v19;
  char v20;

  v4 = objc_retainAutorelease(a3);
  sub_245CF7F30(&v19, (char *)objc_msgSend(v4, "UTF8String"));
  v16 = 0;
  v17 = 0;
  v18 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_processor.__ptr_ + 104))(&v15);
  v5 = v15;
  v15 = 0;
  if (v5)
    sub_245CF8D4C(v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  for (i = v17; v7 != i; v7 = (__int128 *)((char *)v7 + 24))
  {
    if (*((char *)v7 + 23) < 0)
    {
      sub_245CF2554(__p, *(void **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v9 = *v7;
      v14 = *((_QWORD *)v7 + 2);
      *(_OWORD *)__p = v9;
    }
    if (v14 >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, __p[0], __p[1], v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

    if (SHIBYTE(v14) < 0)
      operator delete(__p[0]);
  }
  __p[0] = &v16;
  sub_245CF7EF0((void ***)__p);
  if (v20 < 0)
    operator delete(v19);

  return v6;
}

- (id)decodeFromTokens:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  _OWORD *v8;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v22;
  void *__p[2];
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  int64_t v34;
  unint64_t v35;
  unint64_t *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i));
        sub_245CF7F30(__p, (char *)objc_msgSend(v7, "UTF8String"));
        v8 = v30;
        if ((unint64_t)v30 >= v31)
        {
          v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v30[-v29] >> 3);
          v11 = v10 + 1;
          if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
            sub_245CF3B34();
          if (0x5555555555555556 * ((uint64_t)(v31 - v29) >> 3) > v11)
            v11 = 0x5555555555555556 * ((uint64_t)(v31 - v29) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v31 - v29) >> 3) >= 0x555555555555555)
            v12 = 0xAAAAAAAAAAAAAAALL;
          else
            v12 = v11;
          v36 = &v31;
          if (v12)
            v12 = (unint64_t)sub_245CF3B48(v12);
          else
            v13 = 0;
          v14 = v12 + 24 * v10;
          v32 = (void *)v12;
          v33 = v14;
          v35 = v12 + 24 * v13;
          v15 = *(_OWORD *)__p;
          *(_QWORD *)(v14 + 16) = v24;
          *(_OWORD *)v14 = v15;
          __p[1] = 0;
          v24 = 0;
          __p[0] = 0;
          v34 = v14 + 24;
          sub_245CF7FF4(&v29, &v32);
          v16 = v30;
          sub_245CF8078((uint64_t)&v32);
          v30 = v16;
          if (SHIBYTE(v24) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v9 = *(_OWORD *)__p;
          *((_QWORD *)v30 + 2) = v24;
          *v8 = v9;
          v30 = (char *)v8 + 24;
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v4);
  }

  v32 = 0;
  v33 = 0;
  v34 = 0;
  (*(void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, uint64_t *, void **))(*(_QWORD *)self->_processor.__ptr_
                                                                                              + 120))(&v22, self->_processor.__ptr_, &v29, &v32);
  v17 = v22;
  v22 = 0;
  if (v17)
    sub_245CF8D4C(v17);
  if (v34 >= 0)
    v18 = &v32;
  else
    v18 = v32;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v34) < 0)
    operator delete(v32);
  v32 = &v29;
  sub_245CF7EF0((void ***)&v32);

  return v19;
}

- (id)decodeFromIDs:(id)a3
{
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  int v19;
  uint64_t v20;
  void **v21;
  void *v22;
  SentencePieceModel *v24;
  id obj;
  uint64_t v26;
  void *__p[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  unint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  v24 = self;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "intValue");
        v12 = v11;
        if ((unint64_t)v7 >= v6)
        {
          v13 = (v7 - v5) >> 2;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 62)
            sub_245CF3B34();
          if ((uint64_t)(v6 - (_QWORD)v5) >> 1 > v14)
            v14 = (uint64_t)(v6 - (_QWORD)v5) >> 1;
          if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFFCLL)
            v15 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v15 = v14;
          if (v15)
            v15 = (unint64_t)sub_245CF7A54(v15);
          else
            v16 = 0;
          v17 = (_DWORD *)(v15 + 4 * v13);
          *v17 = v12;
          v18 = v17 + 1;
          while (v7 != v5)
          {
            v19 = *((_DWORD *)v7 - 1);
            v7 -= 4;
            *--v17 = v19;
          }
          v6 = v15 + 4 * v16;
          v33 = v17;
          v34 = v18;
          v35 = v6;
          if (v5)
            operator delete(v5);
          v5 = (char *)v17;
          v7 = (char *)v18;
        }
        else
        {
          *(_DWORD *)v7 = v11;
          v7 += 4;
        }
        v34 = v7;

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v4);
  }

  __p[0] = 0;
  __p[1] = 0;
  v28 = 0;
  (*(void (**)(uint64_t *__return_ptr, SentencePieceProcessor *, void **, void **))(*(_QWORD *)v24->_processor.__ptr_
                                                                                            + 136))(&v26, v24->_processor.__ptr_, &v33, __p);
  v20 = v26;
  v26 = 0;
  if (v20)
    sub_245CF8D4C(v20);
  if (v28 >= 0)
    v21 = __p;
  else
    v21 = (void **)__p[0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v28) < 0)
    operator delete(__p[0]);
  if (v33)
  {
    v34 = v33;
    operator delete(v33);
  }

  return v22;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v3;
  unint64_t v4;

  cntrl = self->_processor.__cntrl_;
  if (cntrl)
  {
    v3 = (unint64_t *)((char *)cntrl + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
