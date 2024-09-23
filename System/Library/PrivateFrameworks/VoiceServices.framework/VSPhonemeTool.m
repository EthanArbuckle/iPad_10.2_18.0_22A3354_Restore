@implementation VSPhonemeTool

+ (id)generateTTSPhonemes:(id)a3 voicePath:(id)a4 phonemeSystem:(int64_t)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  char *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void **v18;
  __CFString *v19;
  void *__p[2];
  char v22;
  void *v23[2];
  uint64_t v24;
  void *v25[2];
  uint64_t v26;
  _BYTE v27[8];
  std::__shared_weak_count *v28;
  std::__shared_weak_count *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if ((unint64_t)a5 > 2)
  {
    v19 = &stru_1EA8B0C98;
  }
  else
  {
    v11 = (char *)**((_QWORD **)&unk_1EA8AF6D0 + a5);
    v25[0] = 0;
    v25[1] = 0;
    v26 = 0;
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(__p, v11);
    MEMORY[0x1DF0E8F70](v27, v23, __p);
    if (v22 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v24) < 0)
      operator delete(v23[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    SiriTTS::TextToPhoneme::text_to_phoneme();
    *(_OWORD *)v25 = *(_OWORD *)v23;
    v26 = v24;
    HIBYTE(v24) = 0;
    LOBYTE(v23[0]) = 0;
    if (v22 < 0)
      operator delete(__p[0]);
    v12 = v29;
    if (v29)
    {
      p_shared_owners = (unint64_t *)&v29->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = v28;
    if (v28)
    {
      v16 = (unint64_t *)&v28->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (v26 >= 0)
      v18 = v25;
    else
      v18 = (void **)v25[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v26) < 0)
      operator delete(v25[0]);
  }

  return v19;
}

@end
