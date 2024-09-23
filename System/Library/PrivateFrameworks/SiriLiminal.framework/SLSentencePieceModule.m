@implementation SLSentencePieceModule

- (SLSentencePieceModule)initWithConfigFile:(id)a3
{
  id v4;
  NSObject *v5;
  SLSentencePieceModule *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SLSentencePieceModule initWithConfigFile:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_213B50000, v5, OS_LOG_TYPE_DEFAULT, "%s path: %@", (uint8_t *)&v8, 0x16u);
  }
  v6 = -[SLSentencePieceModule initWithConfigFile:isModelMmap:](self, "initWithConfigFile:isModelMmap:", v4, 0);

  return v6;
}

- (SLSentencePieceModule)initWithConfigFile:(id)a3 isModelMmap:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SLSentencePieceModule *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  shared_ptr<sentencepiece::SentencePieceProcessor> *p_processor;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  id v15;
  NSObject *v16;
  std::string *v17;
  SLSentencePieceModule *v18;
  NSObject *v19;
  std::string __p;
  uint64_t v22;
  void *v23;
  char v24;
  objc_super v25;
  _BYTE buf[22];
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  std::string *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SLSentencePieceModule;
  v7 = -[SLSentencePieceModule init](&v25, sel_init);
  if (v7)
  {
    v8 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SLSentencePieceModule initWithConfigFile:isModelMmap:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_213B50000, v8, OS_LOG_TYPE_DEFAULT, "%s path: %@", buf, 0x16u);
    }
    v9 = operator new(0x90uLL);
    v9[1] = 0;
    v9[2] = 0;
    *v9 = &off_24D0C5F78;
    sentencepiece::SentencePieceProcessor::SentencePieceProcessor((sentencepiece::SentencePieceProcessor *)(v9 + 3));
    *(_QWORD *)buf = v10;
    *(_QWORD *)&buf[8] = v9;
    p_processor = &v7->_processor;
    std::shared_ptr<sentencepiece::SentencePieceText>::operator=[abi:ne180100]((uint64_t)&v7->_processor, (__int128 *)buf);
    v12 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v13 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = objc_retainAutorelease(v6);
    std::string::basic_string[abi:ne180100]<0>(&v23, (char *)objc_msgSend(v15, "UTF8String"));
    sentencepiece::util::Status::Status(&v22);
    if (v4)
      (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)p_processor->__ptr_ + 64))(buf);
    else
      (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)p_processor->__ptr_ + 16))(buf);
    sentencepiece::util::Status::operator=(&v22, (_DWORD **)buf);
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)buf);
    if (v22)
    {
      v16 = (id)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        sentencepiece::util::Status::ToString((sentencepiece::util::Status *)&v22, &__p);
        v17 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &__p
            : (std::string *)__p.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[SLSentencePieceModule initWithConfigFile:isModelMmap:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        v27 = 1024;
        v28 = v4;
        v29 = 2080;
        v30 = v17;
        _os_log_impl(&dword_213B50000, v16, OS_LOG_TYPE_DEFAULT, "%s Cannot create SPM model at path %@ with mmap: %d with error %s", buf, 0x26u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }

      sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v22);
      if (v24 < 0)
        operator delete(v23);
      v18 = 0;
      goto LABEL_27;
    }
    sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v22);
    if (v24 < 0)
      operator delete(v23);
  }
  v19 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SLSentencePieceModule initWithConfigFile:isModelMmap:]";
    _os_log_impl(&dword_213B50000, v19, OS_LOG_TYPE_DEFAULT, "%s SPM model created", buf, 0xCu);
  }
  v18 = v7;
LABEL_27:

  return v18;
}

- (void)dealloc
{
  shared_ptr<sentencepiece::SentencePieceProcessor> *p_processor;
  SentencePieceProcessor *ptr;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  ptr = self->_processor.__ptr_;
  p_processor = &self->_processor;
  if (ptr)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    std::shared_ptr<sentencepiece::SentencePieceText>::operator=[abi:ne180100]((uint64_t)p_processor, (__int128 *)buf);
    v5 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v6 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
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
  v8 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SLSentencePieceModule dealloc]";
    _os_log_impl(&dword_213B50000, v8, OS_LOG_TYPE_DEFAULT, "%s dealloc", buf, 0xCu);
  }
  v9.receiver = self;
  v9.super_class = (Class)SLSentencePieceModule;
  -[SLSentencePieceModule dealloc](&v9, sel_dealloc);
}

- (id)encodeUtterance:(id)a3
{
  id v4;
  void *v5;
  unsigned int *v6;
  unsigned int *v7;
  void *v8;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  void *__p;
  char v15;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v4, "UTF8String"));
  v11 = 0;
  v12 = 0;
  v13 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_processor.__ptr_ + 144))(&v10);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v12;
  if (v11 != v12)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      ++v6;
    }
    while (v6 != v7);
    v6 = v11;
  }
  if (v6)
  {
    v12 = v6;
    operator delete(v6);
  }
  if (v15 < 0)
    operator delete(__p);

  return v5;
}

- (int64_t)setSPMEncoderOptions:(id)a3
{
  id v4;
  int v5;
  uint64_t v7;
  void *__p;
  char v9;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v4, "UTF8String"));
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_processor.__ptr_ + 96))(&v7);
  v5 = sentencepiece::util::Status::code((sentencepiece::util::Status *)&v7);
  sentencepiece::util::Status::~Status((sentencepiece::util::Status *)&v7);
  if (v9 < 0)
    operator delete(__p);

  return v5;
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
