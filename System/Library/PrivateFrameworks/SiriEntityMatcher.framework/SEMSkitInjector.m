@implementation SEMSkitInjector

- (SEMSkitInjector)initWithTokenizer:(id)a3 error:(id *)a4
{
  id v7;
  SEMSkitInjector *v8;
  SEMSkitInjector *v9;
  void **p_tokenizer;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  void *v33;
  SEMSkitInjector *v34;
  void **p_index_locale_id;
  uint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__fs::filesystem::path v55;
  std::__fs::filesystem::path v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  std::__fs::filesystem::path v59;
  std::__fs::filesystem::path __dst;
  __int128 v61;
  _QWORD v62[2];
  __int128 __p;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[2];
  std::string v69;
  std::string v70;
  objc_super v71;

  v7 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SEMSkitInjector;
  v8 = -[SEMSkitInjector init](&v71, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_68:
    v34 = v9;
    goto LABEL_69;
  }
  p_tokenizer = (void **)&v8->_tokenizer;
  objc_storeStrong((id *)&v8->_tokenizer, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_locale(*p_tokenizer, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const char *)sub_24630E3AC(v13, v14, v15);

    if (v16)
    {
      sub_2462EA394(v17, &v70);
      sub_2462EA444(v19, &v69);
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
        sub_2462D3374(&__dst, v70.__r_.__value_.__l.__data_, v70.__r_.__value_.__l.__size_);
      else
        __dst.__pn_ = v70;
      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
        sub_2462D3374(&v59, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
      else
        v59.__pn_ = v69;
      sub_2462E4170((uint64_t)&v61, &__dst, &v59);
      sub_2462D34C0((uint64_t)&v9->_indexer, &v61);
      skit::IndexWriter::operator=();
      v9->_indexer.index_locale = v62[1];
      p_index_locale_id = (void **)&v9->_indexer.index_locale_id;
      if (*((char *)&v9->_indexer.index_locale_id.__r_.__value_.var0.__l + 23) < 0)
        operator delete(*p_index_locale_id);
      v36 = v64;
      *(_OWORD *)p_index_locale_id = __p;
      *((_QWORD *)&v9->_indexer.index_locale_id.__r_.__value_.var0.__l + 2) = v36;
      HIBYTE(v64) = 0;
      LOWORD(__p) = 0;
      sub_2462D34C0((uint64_t)&v9->_indexer.index_locale_id.__r_.var0, &v65);
      sub_2462D34C0((uint64_t)v9->_anon_58, &v66);
      sub_2462D34C0((uint64_t)&v9->_anon_58[16], &v67);
      v37 = (std::__shared_weak_count *)*((_QWORD *)&v67 + 1);
      *(_QWORD *)&v9->_anon_58[32] = v68[0];
      *(_QWORD *)&v9->_anon_58[38] = *(_QWORD *)((char *)v68 + 6);
      if (v37)
      {
        p_shared_owners = (unint64_t *)&v37->__shared_owners_;
        do
          v39 = __ldaxr(p_shared_owners);
        while (__stlxr(v39 - 1, p_shared_owners));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
      v40 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
      if (*((_QWORD *)&v66 + 1))
      {
        v41 = (unint64_t *)(*((_QWORD *)&v66 + 1) + 8);
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      v43 = (std::__shared_weak_count *)*((_QWORD *)&v65 + 1);
      if (*((_QWORD *)&v65 + 1))
      {
        v44 = (unint64_t *)(*((_QWORD *)&v65 + 1) + 8);
        do
          v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
      if (SHIBYTE(v64) < 0)
        operator delete((void *)__p);
      MEMORY[0x249556978](v62);
      MEMORY[0x249556A68](&v61);
      if (SHIBYTE(v59.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v59.__pn_.__r_.__value_.__l.__data_);
      if (SHIBYTE(__dst.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__dst.__pn_.__r_.__value_.__l.__data_);
      if (*p_tokenizer)
      {
        objc_msgSend_tokenizer(*p_tokenizer, v46, v47);
      }
      else
      {
        v57 = 0;
        v58 = 0;
      }
      sub_2462E64D8((uint64_t)&v9->_indexer, v16, 0, 0, 0, (uint64_t)&v57);
      v48 = v58;
      if (v58)
      {
        v49 = (unint64_t *)&v58->__shared_owners_;
        do
          v50 = __ldaxr(v49);
        while (__stlxr(v50 - 1, v49));
        if (!v50)
        {
          ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
          std::__shared_weak_count::__release_weak(v48);
        }
      }
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
        sub_2462D3374(&v56, v70.__r_.__value_.__l.__data_, v70.__r_.__value_.__l.__size_);
      else
        v56.__pn_ = v70;
      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
        sub_2462D3374(&v55, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
      else
        v55.__pn_ = v69;
      sub_2462F4258(&v61, &v56, &v55);
      sub_2462D34C0((uint64_t)&v9->_searcher, &v61);
      skit::IndexReader::operator=();
      sub_2462D34C0((uint64_t)&v9->_searcher.alias, &__p);
      v51 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
      if (*((_QWORD *)&__p + 1))
      {
        v52 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
        do
          v53 = __ldaxr(v52);
        while (__stlxr(v53 - 1, v52));
        if (!v53)
        {
          ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
          std::__shared_weak_count::__release_weak(v51);
        }
      }
      MEMORY[0x2495568D0](v62);
      MEMORY[0x249556A68](&v61);
      if (SHIBYTE(v55.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v55.__pn_.__r_.__value_.__l.__data_);
      if (SHIBYTE(v56.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v56.__pn_.__r_.__value_.__l.__data_);
      if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v69.__r_.__value_.__l.__data_);
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v70.__r_.__value_.__l.__data_);
      goto LABEL_68;
    }
    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_locale(*p_tokenizer, v17, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeIdentifier(v23, v29, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v28, v31, (uint64_t)CFSTR("Invalid tokenizer locale %@"), v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462CE41C(0, 4, v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a4 && v32)
      *a4 = objc_retainAutorelease(v32);

  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    v21 = *p_tokenizer;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v20, v24, (uint64_t)CFSTR("Invalid tokenizer %@ exptected a valid instance of class %@"), v21, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462CE41C(0, 3, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a4 && v26)
      *a4 = objc_retainAutorelease(v26);
  }

  v34 = 0;
LABEL_69:

  return v34;
}

- (SEMSkitInjector)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_buildDocumentsFromEntities:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  _BYTE *begin;
  _BYTE *end;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  __objc2_prot_list **p_base_prots;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __objc2_prot_list **v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  SEMSkitInjector *v25;
  _QWORD *v26;
  _QWORD *value;
  SEMSkitInjector *v28;
  char *v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  _BYTE *v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  size_t v44;
  char *v45;
  char *v46;
  char *v47;
  _BYTE *v48;
  uint64_t v49;
  char *v50;
  size_t v51;
  BOOL v52;
  NSObject *v53;
  void *v54;
  void *v55;
  const char *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  __compressed_pair<std::pair<semskitbridge::SearchGroup, std::vector<std::byte>> *, std::allocator<std::pair<semskitbridge::SearchGroup, std::vector<std::byte>>>> *p_end_cap;
  uint64_t *p_documents;
  id v65;
  id obj;
  uint64_t v67;
  SEMSkitInjector *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int16 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  uint8_t v86[128];
  _BYTE buf[24];
  unint64_t v88;
  __compressed_pair<std::pair<semskitbridge::SearchGroup, std::vector<std::byte>> *, std::allocator<std::pair<semskitbridge::SearchGroup, std::vector<std::byte>>>> *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  v7 = objc_msgSend_count(v65, v5, v6);
  if (v7)
  {
    begin = self->_documents.__begin_;
    p_documents = (uint64_t *)&self->_documents;
    if (v7 > ((char *)self->_documents.__end_cap_.__value_ - (char *)begin) >> 5)
    {
      if (v7 >> 59)
        sub_2462D357C();
      end = self->_documents.__end_;
      *(_QWORD *)&v80 = &self->_documents.__end_cap_;
      *(_QWORD *)&v78 = sub_2462D3624(v7);
      *((_QWORD *)&v78 + 1) = v78 + end - begin;
      *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
      *((_QWORD *)&v79 + 1) = v78 + 32 * v10;
      sub_2462D3590(p_documents, &v78);
      sub_2462D3658((uint64_t)&v78);
    }
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = v65;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v73, v86, 16);
    if (v13)
    {
      v69 = self;
      p_end_cap = &self->_documents.__end_cap_;
      v67 = *(_QWORD *)v74;
      p_base_prots = &SEMG2PExecutor__metaData.base_prots;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v74 != v67)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v15);
          if (!objc_msgSend_conformsToProtocol_(v16, v12, (uint64_t)&unk_2575727F8)
            || (objc_opt_respondsToSelector() & 1) == 0)
          {
            v54 = (void *)MEMORY[0x24BDD17C8];
            NSStringFromProtocol((Protocol *)&unk_2575727F8);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v54, v56, (uint64_t)CFSTR("Entity in pool does not conform to protocol %@: %@"), v55, v16);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            sub_2462CE41C(0, 2, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58;
            if (a4 && v58)
              *a4 = objc_retainAutorelease(v58);

            goto LABEL_73;
          }
          v19 = v13;
          v20 = p_base_prots;
          *(_QWORD *)&v78 = 0;
          BYTE8(v78) = 0;
          v79 = xmmword_246317ED0;
          v80 = 0u;
          v81 = 0u;
          v82 = 0;
          v83 = 1;
          v84 = 256;
          v85 = 0;
          v70 = 0;
          v71 = 0;
          v72 = 0;
          v77 = 0;
          if (objc_msgSend_entityType(v16, v17, v18) != 1)
          {
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v21, (uint64_t)CFSTR("Unsupported injected entity: %@"), v16);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            sub_2462CE41C(0, 2, v60);
            v61 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_68;
          }
          if ((objc_msgSend__analyzeCascadeEntity_outSearchGroup_indexTokens_builder_error_(v69, v21, (uint64_t)v16, &v77, &v70, &v78, a4) & 1) == 0)goto LABEL_72;
          if (!v77)
          {
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, (uint64_t)CFSTR("Injected entity failed to be analyzed: %@"), v16);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            sub_2462CE41C(0, 2, v60);
            v61 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:
            if (a4 && v61)
            {
              v61 = objc_retainAutorelease(v61);
              *a4 = v61;
            }

LABEL_72:
            *(_QWORD *)buf = &v70;
            sub_2462D3760((void ***)buf);
            sub_2462D37EC(&v78);
LABEL_73:
            v52 = 0;
            goto LABEL_74;
          }
          v23 = v70;
          if (v70 == v71)
            goto LABEL_21;
          v24 = 0;
          do
          {
            v24 += (*(unsigned __int16 *)(v23 + 40) << 31 >> 31) & *(unsigned __int16 *)(v23 + 38);
            v23 += 48;
          }
          while (v23 != v71);
          if (!v24)
          {
LABEL_21:
            v30 = qword_25441F958;
            if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[SEMSkitInjector _buildDocumentsFromEntities:error:]";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v16;
              _os_log_impl(&dword_2462C4000, v30, OS_LOG_TYPE_INFO, "%s Skipping injected entity that produced 0 indexed fields: %@", buf, 0x16u);
            }
          }
          else
          {
            v25 = v69;
            v26 = v69->_documents.__end_;
            value = v69->_documents.__end_cap_.__value_;
            if (v26 >= value)
            {
              v31 = ((uint64_t)v26 - *p_documents) >> 5;
              v32 = v31 + 1;
              if ((unint64_t)(v31 + 1) >> 59)
                sub_2462D357C();
              v33 = (uint64_t)value - *p_documents;
              if (v33 >> 4 > v32)
                v32 = v33 >> 4;
              if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFE0)
                v34 = 0x7FFFFFFFFFFFFFFLL;
              else
                v34 = v32;
              v89 = p_end_cap;
              if (v34)
              {
                v34 = (unint64_t)sub_2462D3624(v34);
                v25 = v69;
              }
              else
              {
                v35 = 0;
              }
              v36 = v34 + 32 * v31;
              *(_QWORD *)buf = v34;
              *(_QWORD *)&buf[8] = v36;
              v88 = v34 + 32 * v35;
              *(_WORD *)v36 = 0;
              *(_QWORD *)(v36 + 16) = 0;
              *(_QWORD *)(v36 + 24) = 0;
              *(_QWORD *)(v36 + 8) = 0;
              *(_QWORD *)&buf[16] = v36 + 32;
              sub_2462D3590(p_documents, buf);
              v28 = v25;
              v29 = (char *)v25->_documents.__end_;
              sub_2462D3658((uint64_t)buf);
            }
            else
            {
              *(_WORD *)v26 = 0;
              v26[2] = 0;
              v26[3] = 0;
              v26[1] = 0;
              v28 = v69;
              v29 = (char *)(v26 + 4);
              v69->_documents.__end_ = v26 + 4;
            }
            v28->_documents.__end_ = v29;
            *((_WORD *)v29 - 16) = v77;
            v37 = (char *)sub_2462D2C84((uint64_t)&v78);
            v38 = sub_2462D2C84((uint64_t)&v78);
            v39 = (_BYTE *)(v38 + (v80 - v81 + DWORD2(v80)));
            v40 = v39 - v37;
            v41 = *((_QWORD *)v29 - 1);
            v42 = (char *)*((_QWORD *)v29 - 3);
            if (v41 - (unint64_t)v42 >= v39 - v37)
            {
              v48 = (_BYTE *)*((_QWORD *)v29 - 2);
              v49 = v48 - v42;
              if (v48 - v42 >= v40)
              {
                if (v39 != v37)
                  memmove(*((void **)v29 - 3), v37, v39 - v37);
                v47 = &v42[v40];
              }
              else
              {
                if (v48 != v42)
                {
                  memmove(*((void **)v29 - 3), v37, v48 - v42);
                  v42 = (char *)*((_QWORD *)v29 - 2);
                }
                v50 = &v37[v49];
                v51 = v39 - &v37[v49];
                if (v51)
                  memmove(v42, v50, v51);
                v47 = &v42[v51];
              }
            }
            else
            {
              if (v42)
              {
                *((_QWORD *)v29 - 2) = v42;
                operator delete(v42);
                v41 = 0;
                *((_QWORD *)v29 - 3) = 0;
                *((_QWORD *)v29 - 2) = 0;
                *((_QWORD *)v29 - 1) = 0;
              }
              if ((v40 & 0x8000000000000000) != 0)
                goto LABEL_76;
              v43 = 2 * v41;
              if (2 * v41 <= v40)
                v43 = v39 - v37;
              v44 = v41 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v43;
              if ((v44 & 0x8000000000000000) != 0)
LABEL_76:
                sub_2462D357C();
              v45 = (char *)operator new(v44);
              v46 = v45;
              *((_QWORD *)v29 - 3) = v45;
              *((_QWORD *)v29 - 2) = v45;
              *((_QWORD *)v29 - 1) = &v45[v44];
              if (v39 != v37)
                memcpy(v45, v37, v39 - v37);
              v47 = &v46[v40];
            }
            *((_QWORD *)v29 - 2) = v47;
            p_base_prots = v20;
          }
          *(_QWORD *)buf = &v70;
          sub_2462D3760((void ***)buf);
          sub_2462D37EC(&v78);
          ++v15;
          v13 = v19;
        }
        while (v15 != v19);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v73, v86, 16);
        v52 = 1;
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v52 = 1;
    }
LABEL_74:

  }
  else
  {
    v53 = qword_25441F970;
    v52 = 1;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      LODWORD(v78) = 136315138;
      *(_QWORD *)((char *)&v78 + 4) = "-[SEMSkitInjector _buildDocumentsFromEntities:error:]";
      _os_log_impl(&dword_2462C4000, v53, OS_LOG_TYPE_INFO, "%s No entities to analyze", (uint8_t *)&v78, 0xCu);
    }
  }

  return v52;
}

- (BOOL)_analyzeCascadeEntity:(id)a3 outSearchGroup:(unsigned __int16 *)a4 indexTokens:(void *)a5 builder:(void *)a6 error:(id *)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  BOOL v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int16 v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[2];
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = 0;
      objc_msgSend_toCascadeItem_(v12, v16, (uint64_t)&v44);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v44;
      v19 = v17;
      if (v13)
      {

        objc_msgSend_content(v13, v20, v21);
        goto LABEL_6;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v18, (uint64_t)CFSTR("KVItem failed to be converted: %@"), v12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462CE41C(v19, 2, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (a7 && v40)
        *a7 = objc_retainAutorelease(v40);

    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("Unexpected injected Cascade entity: %@"), v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462CE41C(0, 2, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (a7 && v34)
        *a7 = objc_retainAutorelease(v34);

    }
    v25 = 0;
    goto LABEL_26;
  }
  v13 = v12;
  objc_msgSend_content(v13, v14, v15);
LABEL_6:
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 != 0;
  if (v24)
  {
    objc_msgSend_metaContent(v13, v22, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (v27)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend_metaContent(v13, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v30;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v31, (uint64_t)v45, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v43[0] = "Injected";
    v43[1] = 8;
    v38 = sub_2462E4A3C((uint64_t)&self->_indexer, v24, v32, (uint64_t)v43, (uint64_t *)a5, (unint64_t)a6);
    if (a4)
      *a4 = v38;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v22, (uint64_t)CFSTR("Cascade item instance missing reqiured content: %@"), v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462CE41C(0, 2, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a7 && v36)
      *a7 = objc_retainAutorelease(v36);

  }
LABEL_26:

  return v25;
}

- (id)indexLocale
{
  uint64_t v2;

  return (id)objc_msgSend_locale(self->_tokenizer, a2, v2);
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  id v14;
  int **v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v24[5];
  void **v25;

  v6 = a3;
  v9 = (uint64_t *)objc_msgSend_query(v6, v7, v8);
  v10 = *v9;
  v11 = (std::__shared_weak_count *)v9[1];
  v24[3] = *v9;
  v24[4] = (uint64_t)v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  if (v10)
  {
    sub_2462F45E8((uint64_t)&self->_searcher, v10, (unint64_t)&self->_documents, v24);
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = (int **)v24[0];
    v16 = v24[1];
    while (v15 != (int **)v16)
    {
      sub_2462EAEC8(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v14, v18, (uint64_t)v17);

      v15 += 4;
    }
    v25 = (void **)v24;
    sub_2462D3878(&v25);
    if (!v11)
      goto LABEL_18;
    goto LABEL_14;
  }
  sub_2462CE41C(0, 1, CFSTR("Query is nil"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a4 && v19)
    *a4 = objc_retainAutorelease(v19);

  v14 = 0;
  if (v11)
  {
LABEL_14:
    v21 = (unint64_t *)&v11->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
LABEL_18:

  return v14;
}

- (BOOL)supportsMultiUser
{
  return 0;
}

- (BOOL)setEntityPool:(id)a3 error:(id *)a4
{
  uint64_t *p_documents;
  id v7;
  const char *v8;

  p_documents = (uint64_t *)&self->_documents;
  v7 = a3;
  sub_2462D3A40(p_documents);
  LOBYTE(a4) = objc_msgSend__buildDocumentsFromEntities_error_(self, v8, (uint64_t)v7, a4);

  return (char)a4;
}

- (id)accessDescription
{
  return CFSTR("Injected");
}

- (void).cxx_destruct
{
  vector<std::pair<semskitbridge::SearchGroup, std::vector<std::byte>>, std::allocator<std::pair<semskitbridge::SearchGroup, std::vector<std::byte>>>> *p_documents;

  p_documents = &self->_documents;
  if (self->_documents.__begin_)
  {
    sub_2462D3A40((uint64_t *)&self->_documents);
    operator delete(p_documents->__begin_);
  }
  sub_2462D3524((uint64_t)&self->_searcher.alias);
  MEMORY[0x2495568D0](&self->_searcher.index_reader);
  MEMORY[0x249556A68](&self->_searcher);
  sub_2462D3524((uint64_t)&self->_anon_58[16]);
  sub_2462D3524((uint64_t)self->_anon_58);
  sub_2462D3524((uint64_t)&self->_indexer.index_locale_id.__r_.var0);
  if (*((char *)&self->_indexer.index_locale_id.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_indexer.index_locale_id.__r_.__value_.var0.__l.__data_);
  MEMORY[0x249556978](&self->_indexer.index_writer);
  MEMORY[0x249556A68](&self->_indexer);
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

- (id).cxx_construct
{
  self->_indexer.context.pimpl.__ptr_ = 0;
  self->_indexer.context.pimpl.__cntrl_ = 0;
  skit::IndexWriter::IndexWriter((skit::IndexWriter *)&self->_indexer.index_writer);
  *(_QWORD *)&self->_anon_58[30] = 0;
  *(_OWORD *)&self->_anon_58[16] = 0u;
  *(_OWORD *)self->_anon_58 = 0u;
  *(_OWORD *)&self->_indexer.index_locale_id.__r_.var0 = 0u;
  *(_OWORD *)&self->_indexer.index_locale_id.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)&self->_indexer.index_locale = 0u;
  *(_DWORD *)&self->_anon_58[40] = -1;
  self->_searcher.context.pimpl.__ptr_ = 0;
  self->_searcher.context.pimpl.__cntrl_ = 0;
  skit::IndexReader::IndexReader((skit::IndexReader *)&self->_searcher.index_reader);
  self->_documents.__end_cap_.__value_ = 0;
  *(_OWORD *)&self->_documents.__begin_ = 0u;
  self->_searcher.alias = 0u;
  return self;
}

@end
