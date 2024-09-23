@implementation SiriTTSPhonemeTool

+ (id)generateTTSPhonemes:(id)a3 voicePath:(id)a4 phonemeSystem:(int64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  char *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void **v19;
  void *v20;
  void *v21;
  void *v22;
  void *__p[2];
  char v25;
  void *v26[2];
  uint64_t v27;
  _BYTE v28[8];
  std::__shared_weak_count *v29;
  std::__shared_weak_count *v30;
  void *v31[2];
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if ((unint64_t)a5 >= 3)
  {
    if (a6)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown phoneme system: %d"), a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("SiriTTSPhonemeTool"), 1, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }
  else
  {
    v12 = (char *)**((_QWORD **)&unk_1E3A15EA8 + a5);
    v31[0] = 0;
    v31[1] = 0;
    v32 = 0;
    std::string::basic_string[abi:ne180100]<0>(v26, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(__p, v12);
    MEMORY[0x19AED19DC](v28, v26, __p);
    if (v25 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v27) < 0)
      operator delete(v26[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    SiriTTS::TextToPhoneme::text_to_phoneme();
    *(_OWORD *)v31 = *(_OWORD *)v26;
    v32 = v27;
    HIBYTE(v27) = 0;
    LOBYTE(v26[0]) = 0;
    if (v25 < 0)
      operator delete(__p[0]);
    v13 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = v29;
    if (v29)
    {
      v17 = (unint64_t *)&v29->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    if (v32 >= 0)
      v19 = v31;
    else
      v19 = (void **)v31[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
    a6 = (id *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v32) < 0)
      operator delete(v31[0]);
  }

  return a6;
}

@end
