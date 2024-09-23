@implementation SEMTokenizer

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (SEMTokenizer)initWithLocale:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  SEMTokenizer *v8;

  v4 = a3;
  objc_msgSend_getAssetPathForLocale_(MEMORY[0x24BE68FD0], v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (SEMTokenizer *)objc_msgSend_initWithLocale_assetPath_normalizeWords_(self, v7, (uint64_t)v4, v6, 1);

  return v8;
}

- (SEMTokenizer)initWithTokenizerLocale:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  SEMTokenizer *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend_getAssetPathForLocale_(MEMORY[0x24BE68FD0], v7, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = (SEMTokenizer *)(id)objc_msgSend_initWithLocale_assetPath_normalizeWords_(self, v8, (uint64_t)v6, v9, 1);
    v10 = self;
  }
  else
  {
    v11 = (id)qword_25441F970;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_localeIdentifier(v6, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[SEMTokenizer initWithTokenizerLocale:error:]";
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_2462C4000, v11, OS_LOG_TYPE_INFO, "%s Cannot construct SEMTokenizer because morphun asset path for %@ is nil", buf, 0x16u);

    }
    v15 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_localeIdentifier(v6, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v20, (uint64_t)CFSTR("Morphun asset unavailable for locale: \"%@\"), v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v21;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)&v29, &v28, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v24, (uint64_t)CFSTR("com.apple.siri.entitymatcher.tokenization"), 2, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a4 && v25)
      *a4 = objc_retainAutorelease(v25);

    v10 = 0;
  }

  return v10;
}

- (SEMTokenizer)initWithLocale:(id)a3 assetPath:(id)a4 normalizeWords:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  SEMTokenizer *v12;
  uint64_t v13;
  NSLocale *locale;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  char *v20;
  size_t v21;
  void *v22;
  _QWORD *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  void *__p[2];
  char v29;
  __int128 v30;
  objc_super v31;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SEMTokenizer;
  v12 = -[SEMTokenizer init](&v31, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    locale = v12->_locale;
    v12->_locale = (NSLocale *)v13;

    if (v9)
    {
      objc_msgSend_path(v9, v15, v16);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (char *)objc_msgSend_UTF8String(v17, v18, v19);
      v21 = strlen(v20);

    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    objc_msgSend_localeIdentifier(v12->_locale, v15, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462EA5C0(v22, (uint64_t)__p);
    v23 = operator new(0xC0uLL);
    v23[1] = 0;
    v23[2] = 0;
    *v23 = &off_25175F168;
    *(_QWORD *)&v30 = sub_2463043D8((uint64_t)(v23 + 3), (uint64_t)__p, v20, v21, v5);
    *((_QWORD *)&v30 + 1) = v23;
    sub_2462D34C0((uint64_t)&v12->_tokenizer, &v30);
    v24 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    if (v29 < 0)
      operator delete(__p[0]);

  }
  return v12;
}

- (SEMTokenizer)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)locale
{
  return self->_locale;
}

- (void)enumerateTokensOfText:(id)a3 usingBlock:(id)a4
{
  id v6;
  Tokenizer *ptr;
  unint64_t v8;
  void **p_src;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  _WORD *v13;
  uint64_t v14;
  _QWORD **v15;
  uint64_t v16;
  const Token **v17;
  const Token **v18;
  morphun::TokenIterator *v19;
  uint64_t v20;
  uint64_t v21;
  morphun::Token *v22;
  morphun::Token *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  morphun::Token *v27;
  void **v28;
  void **i;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  morphun::Token *v36;
  uint64_t Value;
  morphun::Token *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  unsigned __int16 *v44;
  unsigned __int16 *v45;
  morphun::Token *v46;
  uint64_t CleanValue;
  __int128 *v48;
  __int128 v49;
  void **v50;
  morphun::Token *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  void **v60;
  void *v61;
  const char *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t isSignificant;
  int v67;
  void *v68;
  void (**v69)(id, uint64_t, void *, void *, void *, uint64_t, uint64_t, uint64_t, int);
  void **__src;
  unint64_t v71;
  unsigned __int8 v72;
  __int128 v73;
  __int128 v74;
  void **v75;
  void **v76;
  unint64_t v77;
  void *__dst[2];
  unint64_t v79;
  __int128 v80;

  v6 = a3;
  v69 = (void (**)(id, uint64_t, void *, void *, void *, uint64_t, uint64_t, uint64_t, int))a4;
  ptr = self->_tokenizer.__ptr_;
  sub_2462EA5C0(v6, (uint64_t)&__src);
  v68 = v6;
  if ((char)v72 < 0)
  {
    v8 = v71;
    if (v71 >= 0x7FFFFFFFFFFFFFF8)
      sub_2462D3400();
    p_src = __src;
  }
  else
  {
    v8 = v72;
    p_src = (void **)&__src;
  }
  if (v8 >= 0xB)
  {
    v11 = (v8 & 0x7FFFFFFFFFFFFFFCLL) + 4;
    if ((v8 | 3) != 0xB)
      v11 = v8 | 3;
    v10 = (void **)sub_2462D7494((uint64_t)__dst, v11 + 1);
    __dst[1] = (void *)v8;
    v79 = v12 | 0x8000000000000000;
    __dst[0] = v10;
  }
  else
  {
    HIBYTE(v79) = v8;
    v10 = __dst;
    if (!v8)
      goto LABEL_12;
  }
  memmove(v10, p_src, 2 * v8);
LABEL_12:
  *((_WORD *)v10 + v8) = 0;
  v75 = 0;
  v76 = 0;
  v77 = 0;
  if (*((char *)ptr + 31) < 0)
  {
    v13 = (_WORD *)*((_QWORD *)ptr + 1);
    v14 = *((_QWORD *)ptr + 2);
  }
  else
  {
    v13 = (_WORD *)((char *)ptr + 8);
    v14 = *((unsigned __int8 *)ptr + 31);
  }
  if (v14 == 2 && *v13 == 28261)
  {
    v15 = (_QWORD **)((char *)ptr + 128);
    v16 = 3;
  }
  else
  {
    v15 = (_QWORD **)((char *)ptr + 144);
    v16 = 8;
  }
  v17 = (const Token **)(*(uint64_t (**)(void))(**v15 + 8 * v16))();
  if (*((_QWORD *)ptr + 19))
    v18 = (const Token **)(*(uint64_t (**)(_QWORD, const Token **))(**((_QWORD **)ptr + 20) + 72))(*((_QWORD *)ptr + 20), v17);
  else
    v18 = 0;
  v19 = (morphun::TokenIterator *)morphun::TokenIterator::TokenIterator((morphun::TokenIterator *)&v80, v17[1], v17[2]);
  v74 = v80;
  if (v18)
    morphun::TokenIterator::TokenIterator(v19, v18[1], v18[2]);
  else
    morphun::TokenIterator::TokenIterator(v19, v17[1], v17[2]);
  v20 = 0;
  v73 = v80;
  while (1)
  {
    *(_QWORD *)&v80 = sub_2462EE70C((uint64_t)v17);
    *((_QWORD *)&v80 + 1) = v21;
    if (!morphun::TokenIterator::operator!=())
      break;
    v22 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v22) & 1) == 0)
    {
      v23 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v23) & 1) == 0)
      {
        if (v18)
        {
          while (1)
          {
            v24 = morphun::TokenIterator::operator->();
            v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
            v26 = morphun::TokenIterator::operator->();
            if (v25 >= (*(int (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26))
            {
              v27 = (morphun::Token *)morphun::TokenIterator::operator->();
              if (!morphun::Token::isHead(v27))
                break;
            }
            morphun::TokenIterator::operator++();
          }
          v28 = v75;
          for (i = v76; i != v28; i -= 3)
          {
            if (*((char *)i - 1) < 0)
              operator delete(*(i - 3));
          }
          v76 = v28;
          while (1)
          {
            v30 = morphun::TokenIterator::operator->();
            v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
            v32 = morphun::TokenIterator::operator->();
            if (v31 > (*(int (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32))
              break;
            v33 = morphun::TokenIterator::operator->();
            v34 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v33 + 32))(v33);
            v35 = morphun::TokenIterator::operator->();
            if (v34 < (*(int (**)(uint64_t))(*(_QWORD *)v35 + 32))(v35))
              break;
            v36 = (morphun::Token *)morphun::TokenIterator::operator->();
            Value = morphun::Token::getValue(v36);
            v38 = (morphun::Token *)morphun::TokenIterator::operator->();
            v39 = morphun::Token::getValue(v38);
            v40 = *(unsigned __int8 *)(Value + 23);
            v41 = (char)v40;
            if ((v40 & 0x80u) != 0)
              v40 = *(_QWORD *)(Value + 8);
            v42 = *(unsigned __int8 *)(v39 + 23);
            v43 = (char)v42;
            if ((v42 & 0x80u) != 0)
              v42 = *(_QWORD *)(v39 + 8);
            if (v40 != v42)
              break;
            if (v40)
            {
              if (v41 >= 0)
                v44 = (unsigned __int16 *)Value;
              else
                v44 = *(unsigned __int16 **)Value;
              if (v43 >= 0)
                v45 = (unsigned __int16 *)v39;
              else
                v45 = *(unsigned __int16 **)v39;
              while (*v45 == *v44)
              {
                ++v44;
                ++v45;
                if (!--v40)
                  goto LABEL_54;
              }
              break;
            }
LABEL_54:
            v46 = (morphun::Token *)morphun::TokenIterator::operator->();
            CleanValue = morphun::Token::getCleanValue(v46);
            v48 = (__int128 *)v76;
            if ((unint64_t)v76 >= v77)
            {
              v50 = (void **)sub_2462EE75C((uint64_t *)&v75, (__int128 *)CleanValue);
            }
            else
            {
              if (*(char *)(CleanValue + 23) < 0)
              {
                sub_2462D7540(v76, *(void **)CleanValue, *(_QWORD *)(CleanValue + 8));
              }
              else
              {
                v49 = *(_OWORD *)CleanValue;
                v76[2] = *(void **)(CleanValue + 16);
                *v48 = v49;
              }
              v50 = (void **)v48 + 3;
            }
            v76 = v50;
            morphun::TokenIterator::operator++();
          }
        }
        v51 = (morphun::Token *)morphun::TokenIterator::operator*();
        morphun::Token::getValue(v51);
        sub_2462EA518();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = morphun::Token::getCleanValue(v51);
        v54 = *(unsigned __int8 *)(v53 + 23);
        if ((v54 & 0x80u) != 0)
          v54 = *(_QWORD *)(v53 + 8);
        if (v54)
        {
          morphun::Token::getCleanValue(v51);
          sub_2462EA518();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = 0;
        }
        if (v75 == v76)
        {
          v63 = 0;
        }
        else
        {
          v56 = objc_alloc(MEMORY[0x24BDBCEB8]);
          v58 = (void *)objc_msgSend_initWithCapacity_(v56, v57, 0xAAAAAAAAAAAAAAABLL * (v76 - v75));
          v59 = (uint64_t)v75;
          v60 = v76;
          while ((void **)v59 != v60)
          {
            sub_2462EA518();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v58, v62, (uint64_t)v61);

            v59 += 24;
          }
          v63 = v58;
        }
        v64 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v51 + 24))(v51);
        v65 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v51 + 32))(v51);
        isSignificant = morphun::Token::isSignificant(v51);
        LOBYTE(v67) = morphun::Token::isWhitespace(v51);
        v69[2](v69, v20, v52, v55, v63, v64, v65, isSignificant, v67);
        v20 = (v20 + 1);

      }
    }
    morphun::TokenIterator::operator++();
  }
  if (v18)
    (*((void (**)(const Token **))*v18 + 2))(v18);
  if (v17)
    (*((void (**)(const Token **))*v17 + 2))(v17);
  *(_QWORD *)&v80 = &v75;
  sub_2462D7E84((void ***)&v80);
  if (SHIBYTE(v79) < 0)
    operator delete(__dst[0]);
  if ((char)v72 < 0)
    operator delete(__src);

}

- (id)queryFromText:(id)a3
{
  id v4;
  SEMSpanMatchQueryBuilder *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = [SEMSpanMatchQueryBuilder alloc];
  v7 = (void *)objc_msgSend_initWithLocale_originalText_(v5, v6, (uint64_t)self->_locale, v4);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_2462EE6A4;
  v14[3] = &unk_251782B10;
  v8 = v7;
  v15 = v8;
  objc_msgSend_enumerateTokensOfText_usingBlock_(self, v9, (uint64_t)v4, v14);
  objc_msgSend_build(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (shared_ptr<semskitbridge::Tokenizer>)tokenizer
{
  Tokenizer **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<semskitbridge::Tokenizer> result;

  cntrl = self->_tokenizer.__cntrl_;
  *v2 = self->_tokenizer.__ptr_;
  v2[1] = (Tokenizer *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Tokenizer *)self;
  return result;
}

- (void).cxx_destruct
{
  sub_2462D3524((uint64_t)&self->_tokenizer);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
