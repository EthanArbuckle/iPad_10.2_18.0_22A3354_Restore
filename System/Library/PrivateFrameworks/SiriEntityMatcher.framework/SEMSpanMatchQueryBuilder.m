@implementation SEMSpanMatchQueryBuilder

- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3
{
  return (SEMSpanMatchQueryBuilder *)MEMORY[0x24BEDD108](self, sel__initWithLocale_originalText_asrHypothesis_, a3);
}

- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3 originalText:(id)a4
{
  return (SEMSpanMatchQueryBuilder *)MEMORY[0x24BEDD108](self, sel__initWithLocale_originalText_asrHypothesis_, a3);
}

- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3 originalText:(id)a4 asrHypothesis:(id)a5
{
  return (SEMSpanMatchQueryBuilder *)MEMORY[0x24BEDD108](self, sel__initWithLocale_originalText_asrHypothesis_, a3);
}

- (id)_initWithLocale:(id)a3 originalText:(id)a4 asrHypothesis:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SEMSpanMatchQueryBuilder;
  v13 = -[SEMSpanMatchQueryBuilder init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    v15 = (void *)*((_QWORD *)v13 + 1);
    *((_QWORD *)v13 + 1) = v14;

    if (v9)
    {
      objc_msgSend_lowercaseStringWithLocale_(v9, v16, *((_QWORD *)v13 + 1));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)*((_QWORD *)v13 + 2);
      *((_QWORD *)v13 + 2) = v17;
    }
    else
    {
      v19 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      v18 = (void *)*((_QWORD *)v13 + 3);
      *((_QWORD *)v13 + 3) = v19;
    }

    objc_storeStrong((id *)v13 + 10, a5);
  }

  return v13;
}

- (SEMSpanMatchQueryBuilder)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)addTokenWithValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 beginIndex:(unsigned int)a6 endIndex:(unsigned int)a7 isSignificant:(BOOL)a8 isWhitespace:(BOOL)a9
{
  uint64_t v9;
  id v14;
  const char *v15;
  id v16;
  NSMutableString *originalTextMutable;
  unint64_t v18;
  void **v19;
  void *v20;
  void **v21;
  unint64_t v22;
  void *p_p;
  unint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t *p_tokens;
  Token *end;
  Token *v29;
  id v30;
  id v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  unint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  char isEqual;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t i;
  void *v47;
  const char *v48;
  unint64_t v49;
  void **v50;
  Token *v51;
  Token *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id obj;
  void *__dst[2];
  __int128 v60;
  uint64_t v61;
  __int16 v62;
  int v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *__p;
  unint64_t v69;
  unsigned __int8 v70;
  uint8_t v71[128];
  uint8_t buf[16];
  __int128 v73;
  uint64_t v74;
  __int16 v75;
  int v76;
  uint64_t v77;

  v9 = *(_QWORD *)&a7;
  v77 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v56 = a4;
  v16 = a5;
  if (!v14)
  {
    v26 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SEMSpanMatchQueryBuilder addTokenWithValue:cleanValue:normalizedValues:beginIndex:endIndex:"
                           "isSignificant:isWhitespace:]";
      _os_log_error_impl(&dword_2462C4000, v26, OS_LOG_TYPE_ERROR, "%s skipping nil token value", buf, 0xCu);
    }
    goto LABEL_68;
  }
  if (!self->_originalText)
  {
    originalTextMutable = self->_originalTextMutable;
    if (v56)
      objc_msgSend_appendString_(originalTextMutable, v15, (uint64_t)v56);
    else
      objc_msgSend_appendString_(originalTextMutable, v15, (uint64_t)v14);
  }
  *(_OWORD *)buf = 0u;
  v73 = 0u;
  v74 = 0x100003F800000;
  v75 = 3;
  v76 = 0;
  v55 = v16;
  sub_2462EA5C0(v14, (uint64_t)__dst);
  v18 = BYTE7(v60);
  v19 = (void **)__dst[0];
  v20 = __dst[1];
  sub_2462EA5C0(v56, (uint64_t)&__p);
  if ((v18 & 0x80u) == 0)
    v21 = __dst;
  else
    v21 = v19;
  if ((v18 & 0x80u) == 0)
    v22 = v18;
  else
    v22 = (unint64_t)v20;
  if ((v70 & 0x80u) == 0)
    p_p = &__p;
  else
    p_p = __p;
  if ((v70 & 0x80u) == 0)
    v24 = v70;
  else
    v24 = v69;
  v25 = sub_246304E78((uint64_t)buf, v21, v22, p_p, v24, a6, v9, a9, a8);
  if ((char)v70 < 0)
    operator delete(__p);
  if ((SBYTE7(v60) & 0x80000000) == 0)
  {
    if (!v25)
      goto LABEL_30;
LABEL_26:
    p_tokens = (uint64_t *)&self->_tokens;
    end = self->_tokens.__end_;
    if (end >= self->_tokens.__end_cap_.__value_)
    {
      v29 = (Token *)sub_2462FD8F4(p_tokens, (__int128 *)buf);
    }
    else
    {
      sub_2462FD880((uint64_t)p_tokens, (__int128 *)buf);
      v29 = (Token *)((char *)end + 48);
    }
    self->_tokens.__end_ = v29;
    goto LABEL_30;
  }
  operator delete(__dst[0]);
  if (v25)
    goto LABEL_26;
LABEL_30:
  v30 = v55;
  v31 = v56;
  if (!objc_msgSend_count(v30, v32, v33))
  {

    v54 = v14;
    goto LABEL_64;
  }
  v36 = objc_msgSend_count(v30, v34, v35);
  if (v31 && v36 < 2)
  {
    objc_msgSend_firstObject(v30, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v31, v40, (uint64_t)v39);

    if ((isEqual & 1) != 0)
      goto LABEL_65;
  }
  else
  {

  }
  v53 = v30;
  v54 = v14;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v30;
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v64, v71, 16);
  if (!v43)
    goto LABEL_63;
  v44 = *(_QWORD *)v65;
  v45 = a6 | (unint64_t)(v9 << 32);
  do
  {
    for (i = 0; i != v43; ++i)
    {
      if (*(_QWORD *)v65 != v44)
        objc_enumerationMutation(obj);
      v47 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
      *(_OWORD *)__dst = 0u;
      v60 = 0u;
      v61 = 0x100003F800000;
      v62 = 3;
      v63 = 0;
      sub_2462EA5C0(v47, (uint64_t)&__p);
      if (!a9)
      {
        v49 = (v70 & 0x80u) == 0 ? v70 : v69;
        v50 = (v70 & 0x80u) == 0 ? &__p : (void **)__p;
        sub_2462D7834(__dst, v50, v49);
        *((_QWORD *)&v60 + 1) = v45;
        if (!a8)
        {
          v62 &= 0xFFFCu;
          LODWORD(v61) = 0;
        }
      }
      if ((char)v70 < 0)
      {
        operator delete(__p);
        if (a9)
          goto LABEL_59;
      }
      else if (a9)
      {
        goto LABEL_59;
      }
      v51 = self->_normalized_tokens.__end_;
      if (v51 >= self->_normalized_tokens.__end_cap_.__value_)
      {
        v52 = (Token *)sub_2462FD8F4((uint64_t *)&self->_normalized_tokens, (__int128 *)__dst);
      }
      else
      {
        sub_2462FD880((uint64_t)&self->_normalized_tokens, (__int128 *)__dst);
        v52 = (Token *)((char *)v51 + 48);
      }
      self->_normalized_tokens.__end_ = v52;
LABEL_59:
      if (SBYTE7(v60) < 0)
        operator delete(__dst[0]);
    }
    v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v64, v71, 16);
  }
  while (v43);
LABEL_63:

LABEL_64:
  v14 = v54;
LABEL_65:
  if (SBYTE7(v73) < 0)
    operator delete(*(void **)buf);
  v16 = v55;
LABEL_68:

}

+ (id)getASRPhoneSequence:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v6 = v3;
  if (v3)
  {
    objc_msgSend_asrTokens(v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)build
{
  uint64_t v2;
  NSString **p_originalText;
  NSString *originalText;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  char *v13;
  Token *value;
  __int128 v15;
  Token *v16;
  unint64_t v17;
  void *v18;
  void **v19;
  id v20;
  void **v21;
  unint64_t v22;
  const char *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  SEMSpanMatchQuery *v32;
  const char *v33;
  void *locale_originalText_asrHypothesis;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v39;
  const char *v40;
  void *v41;
  int v42;
  uint64_t v43;
  __int16 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  void *__p[2];
  unsigned __int8 v49;
  char *v50;
  std::__shared_weak_count *v51;
  _QWORD v52[3];
  _QWORD v53[3];
  uint64_t v54;
  std::__shared_weak_count *v55;
  _BYTE buf[12];
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  originalText = self->_originalText;
  p_originalText = &self->_originalText;
  if (!originalText)
    objc_storeStrong((id *)p_originalText, self->_originalTextMutable);
  v7 = sub_24630E3AC(self->_locale, a2, v2);
  if (!v7)
  {
    v8 = (id)qword_25441F970;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localeIdentifier(self->_locale, v9, v10);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      sub_24630F170(14, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SEMSpanMatchQueryBuilder build]";
      v57 = 2112;
      v58 = v39;
      v59 = 2112;
      v60 = v41;
      _os_log_error_impl(&dword_2462C4000, v8, OS_LOG_TYPE_ERROR, "%s Unsupported locale identifier: \"%@\" using fallback: %@", buf, 0x20u);

    }
    v7 = 14;
  }
  objc_msgSend_getASRPhoneSequence_(SEMSpanMatchQueryBuilder, v6, (uint64_t)self->_asrHypothesis);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EA5C0(self->_originalText, (uint64_t)__p);
  v44 = sub_2462F2B4C();
  v11 = sub_2462F284C();
  v42 = v12;
  v43 = v11;
  v13 = (char *)operator new(0xD0uLL);
  *((_QWORD *)v13 + 1) = 0;
  *((_QWORD *)v13 + 2) = 0;
  *(_QWORD *)v13 = &off_251782D08;
  value = self->_tokens.__end_cap_.__value_;
  v15 = *(_OWORD *)&self->_tokens.__begin_;
  self->_tokens.__begin_ = 0;
  self->_tokens.__end_ = 0;
  self->_tokens.__end_cap_.__value_ = 0;
  v16 = self->_normalized_tokens.__end_cap_.__value_;
  v45 = *(_OWORD *)&self->_normalized_tokens.__begin_;
  v46 = v15;
  self->_normalized_tokens.__end_ = 0;
  self->_normalized_tokens.__end_cap_.__value_ = 0;
  self->_normalized_tokens.__begin_ = 0;
  v17 = v49;
  v19 = (void **)__p[0];
  v18 = __p[1];
  v20 = v47;
  *((_OWORD *)v13 + 3) = v45;
  *(_OWORD *)(v13 + 24) = v46;
  *((_QWORD *)v13 + 5) = value;
  v53[1] = 0;
  v53[2] = 0;
  if ((v17 & 0x80u) == 0)
    v21 = __p;
  else
    v21 = v19;
  if ((v17 & 0x80u) == 0)
    v22 = v17;
  else
    v22 = (unint64_t)v18;
  v52[2] = 0;
  v53[0] = 0;
  *((_QWORD *)v13 + 8) = v16;
  v52[0] = 0;
  v52[1] = 0;
  v24 = v20;
  *((_QWORD *)v13 + 9) = v24;
  if (v22 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  if (v22 >= 0xB)
  {
    v26 = (v22 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v22 | 3) != 0xB)
      v26 = v22 | 3;
    v25 = sub_2462D7494((uint64_t)(v13 + 80), v26 + 1);
    *((_QWORD *)v13 + 11) = v22;
    *((_QWORD *)v13 + 12) = v27 | 0x8000000000000000;
    *((_QWORD *)v13 + 10) = v25;
  }
  else
  {
    v13[103] = v22;
    v25 = v13 + 80;
    if (!v22)
      goto LABEL_21;
  }
  memmove(v25, v21, 2 * v22);
LABEL_21:
  *((_WORD *)v25 + v22) = 0;
  *((_OWORD *)v13 + 7) = 0u;
  *((_QWORD *)v13 + 13) = v7;
  *((_OWORD *)v13 + 8) = 0u;
  *((_DWORD *)v13 + 36) = 1065353216;
  *(_OWORD *)(v13 + 152) = 0u;
  *(_OWORD *)(v13 + 168) = 0u;
  *((_DWORD *)v13 + 46) = 1065353216;
  sub_2462DB26C(v7, v23, buf);
  v28 = operator new(0xF8uLL);
  v28[1] = 0;
  v28[2] = 0;
  *v28 = &off_25175F1B8;
  v54 = 0;
  v55 = 0;
  sub_2462D3A8C((uint64_t)(v28 + 3), (skit::internal *)buf, v44, v43, v42, (uint64_t)&v54);
  v29 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v31 = __ldaxr(p_shared_owners);
    while (__stlxr(v31 - 1, p_shared_owners));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  *((_QWORD *)v13 + 24) = v28 + 3;
  *((_QWORD *)v13 + 25) = v28;
  if (SHIBYTE(v59) < 0)
    operator delete(*(void **)buf);

  *(_QWORD *)buf = v52;
  sub_2462D3760((void ***)buf);
  *(_QWORD *)buf = v53;
  sub_2462D3760((void ***)buf);
  v50 = v13 + 24;
  v51 = (std::__shared_weak_count *)v13;
  if ((char)v49 < 0)
    operator delete(__p[0]);

  v32 = [SEMSpanMatchQuery alloc];
  locale_originalText_asrHypothesis = (void *)objc_msgSend_initWithQuery_locale_originalText_asrHypothesis_(v32, v33, (uint64_t)&v50, v7, self->_originalText, self->_asrHypothesis);
  v35 = v51;
  if (v51)
  {
    v36 = (unint64_t *)&v51->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  return locale_originalText_asrHypothesis;
}

- (void).cxx_destruct
{
  TokenStream *p_normalized_tokens;

  objc_storeStrong((id *)&self->_asrHypothesis, 0);
  p_normalized_tokens = &self->_normalized_tokens;
  sub_2462D3760((void ***)&p_normalized_tokens);
  p_normalized_tokens = &self->_tokens;
  sub_2462D3760((void ***)&p_normalized_tokens);
  objc_storeStrong((id *)&self->_originalTextMutable, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
