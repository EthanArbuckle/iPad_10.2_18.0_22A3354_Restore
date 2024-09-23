@implementation SiriTTSSynthesisEngine

- (SiriTTSSynthesisEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4 error:(id *)a5
{
  __CFString *v8;
  const __CFString *v9;
  TTSSynthesizer *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  SiriTTSSynthesisEngine *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  uint64_t v43;
  id *v44;
  __CFString *v45;
  char *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *__p;
  char v57;
  void *v58;
  char v59;
  objc_super v60;
  uint64_t v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE buf[12];
  __int16 v66;
  __CFString *v67;
  char v68;
  uint64_t v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v8 = (__CFString *)a4;
  v60.receiver = self;
  v60.super_class = (Class)SiriTTSSynthesisEngine;
  v46 = -[SiriTTSSynthesisEngine init](&v60, sel_init);
  if (v47 && objc_msgSend(v47, "length"))
  {
    v9 = &stru_1E3A161B0;
    if (v8)
      v9 = v8;
    v44 = a5;
    v45 = (__CFString *)v9;
    v10 = (TTSSynthesizer *)operator new();
    TTSSynthesizer::TTSSynthesizer(v10);
    *((_QWORD *)v46 + 4) = v10;
    v11 = objc_retainAutorelease(v47);
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v11, "UTF8String"));
    v8 = objc_retainAutorelease(v45);
    std::string::basic_string[abi:ne180100]<0>(&v58, (char *)-[__CFString UTF8String](v8, "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    v12 = TTSSynthesizer::initialize();
    if (v57 < 0)
      operator delete(__p);
    if (v59 < 0)
      operator delete(v58);
    if (v68 < 0)
    {
      operator delete(*(void **)buf);
      if (v12)
        goto LABEL_11;
    }
    else if (v12)
    {
LABEL_11:
      v43 = v12;
      if (*((_QWORD *)v46 + 4))
      {
        v13 = MEMORY[0x19AED19AC]();
        MEMORY[0x19AED1A3C](v13, 0x20C40A4A59CD2);
      }
      *((_QWORD *)v46 + 4) = 0;
      TTSGetServiceLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v47;
        v66 = 2112;
        v67 = v45;
        _os_log_impl(&dword_19AD45000, v14, OS_LOG_TYPE_DEFAULT, "voice path '%@', resource path '%@'\n", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v47, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      TTSGetServiceLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v19;
        _os_log_impl(&dword_19AD45000, v18, OS_LOG_TYPE_DEFAULT, "%d files under voice path:", buf, 8u);
      }

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v20 = v17;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v53 != v22)
              objc_enumerationMutation(v20);
            v24 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            TTSGetServiceLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v24;
              _os_log_impl(&dword_19AD45000, v25, OS_LOG_TYPE_DEFAULT, "- %@", buf, 0xCu);
            }

          }
          v15 = v16;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        }
        while (v21);
      }

      if (-[__CFString length](v45, "length"))
      {
        objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v45, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        TTSGetServiceLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = objc_msgSend(v26, "count");
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v28;
          _os_log_impl(&dword_19AD45000, v27, OS_LOG_TYPE_DEFAULT, "%d files under resource path:", buf, 8u);
        }

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v20 = v26;
        v29 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v49 != v30)
                objc_enumerationMutation(v20);
              v32 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
              TTSGetServiceLog();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v32;
                _os_log_impl(&dword_19AD45000, v33, OS_LOG_TYPE_DEFAULT, "- %@", buf, 0xCu);
              }

            }
            v15 = v16;
            v29 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
          }
          while (v29);
        }

      }
      if (v44)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v61 = *MEMORY[0x1E0CB2D68];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TTSSynthesizer::initialize error: %@"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("SiriTTSSynthesisEngine"), v43, v36);
        *v44 = (id)objc_claimAutoreleasedReturnValue();

      }
      v37 = 0;
      v8 = v45;
      goto LABEL_45;
    }
    *((double *)v46 + 6) = *(float *)TTSSynthesizer::get_voice_description(*((TTSSynthesizer **)v46 + 4));
    *(_OWORD *)(v46 + 56) = xmmword_19AE60290;
    *(_OWORD *)(v46 + 72) = xmmword_19AE602A0;
    objc_storeStrong((id *)v46 + 1, v11);
    objc_storeStrong((id *)v46 + 2, v8);
    v41 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v42 = (void *)*((_QWORD *)v46 + 5);
    *((_QWORD *)v46 + 5) = v41;

    v37 = v46;
    goto LABEL_45;
  }
  if (a5)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v69 = *MEMORY[0x1E0CB2D68];
    v70[0] = CFSTR("Empty voice path cannot be used.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("SiriTTSSynthesisEngine"), -1, v39);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v37 = 0;
LABEL_45:

  return v37;
}

- (void)dealloc
{
  void *synthesizer;
  uint64_t v4;
  objc_super v5;

  synthesizer = self->_synthesizer;
  if (synthesizer)
  {
    v4 = MEMORY[0x19AED19AC](synthesizer, a2);
    MEMORY[0x19AED1A3C](v4, 0x20C40A4A59CD2);
  }
  self->_synthesizer = 0;
  v5.receiver = self;
  v5.super_class = (Class)SiriTTSSynthesisEngine;
  -[SiriTTSSynthesisEngine dealloc](&v5, sel_dealloc);
}

- (BOOL)_unlockedLoadResourceWithPath:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v22;
  std::__shared_weak_count *v23;
  void *__p;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v26, (char *)objc_msgSend(v6, "UTF8String"));
  objc_msgSend(v5, "mimeType");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v7, "UTF8String"));
  TTSSynthesizer::load_voice_resource();
  if (v25 < 0)
    operator delete(__p);

  if (v27 < 0)
    operator delete(v26);

  v8 = v28;
  if (v28)
  {
    v22 = v28;
    v23 = v29;
    if (v29)
    {
      p_shared_owners = (unint64_t *)&v29->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    objc_msgSend(v5, "setHandle:", &v22);
    v11 = v23;
    if (v23)
    {
      v12 = (unint64_t *)&v23->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v30[0] = CFSTR("path");
    objc_msgSend(v5, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v15;
    v30[1] = CFSTR("mimeType");
    objc_msgSend(v5, "mimeType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = *MEMORY[0x1E0CB2D68];
    v31[1] = v16;
    v31[2] = CFSTR("TTSSynthesizer::load_voice_resource");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("SiriTTSSynthesisEngine"), 1, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = v29;
  if (v29)
  {
    v19 = (unint64_t *)&v29->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  return v8 != 0;
}

- (BOOL)loadResourceWithPath:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  LOBYTE(a4) = -[SiriTTSSynthesisEngine _unlockedLoadResourceWithPath:error:](self, "_unlockedLoadResourceWithPath:error:", v6, a4);
  -[NSLock unlock](self->_lock, "unlock");

  return (char)a4;
}

- (void)_unlockedUnloadResource:(id)a3
{
  id v3;
  void *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "handle");
    if (!v10)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
      if (!v9)
        goto LABEL_13;
    }
    else
    {
LABEL_6:
      if (!v9)
        goto LABEL_13;
    }
    objc_msgSend(v4, "handle");
    TTSSynthesizer::unload_resource();
    if (v10)
    {
      v7 = (unint64_t *)&v10->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)())v10->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
LABEL_13:

}

- (void)unloadResource:(id)a3
{
  id v4;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[SiriTTSSynthesisEngine _unlockedUnloadResource:](self, "_unlockedUnloadResource:", v4);
  -[NSLock unlock](self->_lock, "unlock");

}

- (BOOL)_unlockedSynthesize:(id)a3 error:(id *)a4
{
  id v6;
  TTSSynthesizer *synthesizer;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  BOOL v34;
  Float64 mSampleRate;
  id v36;
  uint64_t (***v37)();
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  void *v45;
  BOOL v46;
  id v47;
  _QWORD *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t *v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  BOOL v57;
  id v58;
  _QWORD *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  uint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  void *v67;
  BOOL v68;
  id v69;
  _QWORD *v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  uint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  id v78;
  uint64_t v79;
  char *v80;
  char *v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  std::__shared_weak_count *v94;
  void *__p[2];
  char v96;
  std::__shared_weak_count *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  _QWORD v103[3];
  _QWORD *v104;
  _QWORD v105[3];
  _QWORD *v106;
  _QWORD v107[3];
  _QWORD *v108;
  uint64_t (**v109)();
  int v110;
  id v111;
  uint64_t (***v112)();
  _QWORD v113[3];
  _QWORD *v114;
  _QWORD v115[3];
  _QWORD *v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  synthesizer = (TTSSynthesizer *)self->_synthesizer;
  objc_msgSend(v6, "privacySensitive");
  TTSSynthesizer::set_censor_plaintext(synthesizer);
  objc_msgSend(v6, "profile");
  TTSSynthesizer::set_neural_cost();
  objc_msgSend(v6, "neuralSentencePitch");
  TTSSynthesizer::set_global_property();
  objc_msgSend(v6, "neuralSentencePitchRange");
  TTSSynthesizer::set_global_property();
  objc_msgSend(v6, "neuralSentenceDuration");
  TTSSynthesizer::set_global_property();
  objc_msgSend(v6, "neuralSentenceEnergy");
  TTSSynthesizer::set_global_property();
  objc_msgSend(v6, "neuralSentenceTilt");
  TTSSynthesizer::set_global_property();
  v98 = 0;
  v99 = 0;
  v100 = 0;
  objc_msgSend(v6, "rate");
  if (v8 != 0.0)
  {
    objc_msgSend(v6, "rate");
    if (v9 != 1.0)
    {
      objc_msgSend(v6, "rate");
      TTSSynthesizer::set_global_property();
    }
  }
  objc_msgSend(v6, "pitch");
  if (v10 != 0.0)
  {
    objc_msgSend(v6, "pitch");
    if (v11 != 1.0)
    {
      objc_msgSend(v6, "pitch");
      TTSSynthesizer::set_global_property();
    }
  }
  objc_msgSend(v6, "volume");
  if (v12 != 0.0)
  {
    objc_msgSend(v6, "volume");
    if (v13 != 0.8)
    {
      objc_msgSend(v6, "volume");
      TTSSynthesizer::set_global_property();
    }
  }
  objc_msgSend(v6, "audioHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
    v115[0] = &off_1E3A115C8;
    v115[1] = v6;
    v116 = v115;
    TTSSynthesizerEventBus::on_audio();
    v15 = v116;
    if (v116 == v115)
    {
      v16 = 4;
      v15 = v115;
    }
    else
    {
      if (!v116)
        goto LABEL_16;
      v16 = 5;
    }
    (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_16:
    if (v97)
    {
      p_shared_owners = &v97->__shared_owners_;
      do
        v18 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v18 - 1, (unint64_t *)p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
        std::__shared_weak_count::__release_weak(v97);
      }
    }
    std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100](&v98, (__int128 *)__p);
    v19 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v20 = (unint64_t *)((char *)__p[1] + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  objc_msgSend(v6, "promptHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v23)
    goto LABEL_42;
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v24 = v6;
  v113[0] = &off_1E3A11620;
  v113[1] = v24;
  v114 = v113;
  Observable::on_event();
  v25 = v114;
  if (v114 == v113)
  {
    v26 = 4;
    v25 = v113;
  }
  else
  {
    if (!v114)
      goto LABEL_32;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_32:
  v27 = v97;
  if (v97)
  {
    v28 = &v97->__shared_owners_;
    do
      v29 = __ldaxr((unint64_t *)v28);
    while (__stlxr(v29 - 1, (unint64_t *)v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100](&v98, (__int128 *)__p);
  v30 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v31 = (unint64_t *)((char *)__p[1] + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
LABEL_42:
  objc_msgSend(v6, "wordTimingsHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33 == 0;

  if (v34)
    goto LABEL_58;
  mSampleRate = self->_asbd.mSampleRate;
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v36 = v6;
  v109 = &off_1E3A11678;
  *(float *)&mSampleRate = mSampleRate;
  v110 = LODWORD(mSampleRate);
  v111 = v36;
  v112 = &v109;
  TTSSynthesizerEventBus::on_marker();
  v37 = v112;
  if (v112 == &v109)
  {
    v38 = 4;
    v37 = &v109;
  }
  else
  {
    if (!v112)
      goto LABEL_48;
    v38 = 5;
  }
  (*v37)[v38]();
LABEL_48:
  v39 = v97;
  if (v97)
  {
    v40 = &v97->__shared_owners_;
    do
      v41 = __ldaxr((unint64_t *)v40);
    while (__stlxr(v41 - 1, (unint64_t *)v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100](&v98, (__int128 *)__p);
  v42 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v43 = (unint64_t *)((char *)__p[1] + 8);
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
LABEL_58:
  objc_msgSend(v6, "neuralFallbackHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45 == 0;

  if (v46)
    goto LABEL_74;
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v47 = v6;
  v107[0] = &off_1E3A116D0;
  v107[1] = v47;
  v108 = v107;
  Observable::on_event();
  v48 = v108;
  if (v108 == v107)
  {
    v49 = 4;
    v48 = v107;
  }
  else
  {
    if (!v108)
      goto LABEL_64;
    v49 = 5;
  }
  (*(void (**)(void))(*v48 + 8 * v49))();
LABEL_64:
  v50 = v97;
  if (v97)
  {
    v51 = &v97->__shared_owners_;
    do
      v52 = __ldaxr((unint64_t *)v51);
    while (__stlxr(v52 - 1, (unint64_t *)v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100](&v98, (__int128 *)__p);
  v53 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v54 = (unint64_t *)((char *)__p[1] + 8);
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
LABEL_74:
  objc_msgSend(v6, "useHydraFrontendHandler");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56 == 0;

  if (v57)
    goto LABEL_90;
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v58 = v6;
  v105[0] = &off_1E3A0F188;
  v105[1] = v58;
  v106 = v105;
  Observable::on_event();
  v59 = v106;
  if (v106 == v105)
  {
    v60 = 4;
    v59 = v105;
  }
  else
  {
    if (!v106)
      goto LABEL_80;
    v60 = 5;
  }
  (*(void (**)(void))(*v59 + 8 * v60))();
LABEL_80:
  v61 = v97;
  if (v97)
  {
    v62 = &v97->__shared_owners_;
    do
      v63 = __ldaxr((unint64_t *)v62);
    while (__stlxr(v63 - 1, (unint64_t *)v62));
    if (!v63)
    {
      ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
      std::__shared_weak_count::__release_weak(v61);
    }
  }
  std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100](&v98, (__int128 *)__p);
  v64 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v65 = (unint64_t *)((char *)__p[1] + 8);
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 - 1, v65));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }
LABEL_90:
  objc_msgSend(v6, "audioClickHandler");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67 == 0;

  if (v68)
    goto LABEL_106;
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v69 = v6;
  v103[0] = &off_1E3A0F1E0;
  v103[1] = v69;
  v104 = v103;
  Observable::on_event();
  v70 = v104;
  if (v104 == v103)
  {
    v71 = 4;
    v70 = v103;
  }
  else
  {
    if (!v104)
      goto LABEL_96;
    v71 = 5;
  }
  (*(void (**)(void))(*v70 + 8 * v71))();
LABEL_96:
  v72 = v97;
  if (v97)
  {
    v73 = &v97->__shared_owners_;
    do
      v74 = __ldaxr((unint64_t *)v73);
    while (__stlxr(v74 - 1, (unint64_t *)v73));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }
  std::vector<std::shared_ptr<Observer>>::push_back[abi:ne180100](&v98, (__int128 *)__p);
  v75 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v76 = (unint64_t *)((char *)__p[1] + 8);
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
    }
  }
LABEL_106:
  objc_msgSend(v6, "text");
  v78 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v78, "UTF8String"));
  v79 = TTSSynthesizer::synthesize_text();
  if (v96 < 0)
    operator delete(__p[0]);

  v80 = v98;
  v81 = v99;
  while (v80 != v81)
  {
    TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
    v82 = (std::__shared_weak_count *)*((_QWORD *)v80 + 1);
    v94 = v82;
    if (v82)
    {
      v83 = (unint64_t *)&v82->__shared_owners_;
      do
        v84 = __ldxr(v83);
      while (__stxr(v84 + 1, v83));
    }
    Observable::remove_observer();
    if (v94)
    {
      v85 = (unint64_t *)&v94->__shared_owners_;
      do
        v86 = __ldaxr(v85);
      while (__stlxr(v86 - 1, v85));
      if (!v86)
      {
        ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
        std::__shared_weak_count::__release_weak(v94);
      }
    }
    v87 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v88 = (unint64_t *)((char *)__p[1] + 8);
      do
        v89 = __ldaxr(v88);
      while (__stlxr(v89 - 1, v88));
      if (!v89)
      {
        ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
        std::__shared_weak_count::__release_weak(v87);
      }
    }
    v80 += 16;
  }
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  TTSSynthesizer::set_global_property();
  if (a4 && v79)
  {
    v90 = (void *)MEMORY[0x1E0CB35C8];
    v101 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TTSSynthesizer::synthesize_text error: %@"), 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v91;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "errorWithDomain:code:userInfo:", CFSTR("SiriTTSSynthesisEngine"), v79, v92);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  __p[0] = &v98;
  std::vector<std::shared_ptr<Observer>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);

  return v79 == 0;
}

- (BOOL)synthesize:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  LOBYTE(a4) = -[SiriTTSSynthesisEngine _unlockedSynthesize:error:](self, "_unlockedSynthesize:error:", v6, a4);
  -[NSLock unlock](self->_lock, "unlock");

  return (char)a4;
}

- (void)stopSynthesis
{
  TTSSynthesizer::stop_synthesis((TTSSynthesizer *)self->_synthesizer);
}

- (BOOL)_preheatWithError:(id *)a3
{
  TTSSynthesizer::preheat((TTSSynthesizer *)self->_synthesizer);
  return 1;
}

- (BOOL)preheatWithError:(id *)a3
{
  -[NSLock lock](self->_lock, "lock");
  LOBYTE(a3) = -[SiriTTSSynthesisEngine _preheatWithError:](self, "_preheatWithError:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  return (char)a3;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (NSString)voicePath
{
  return self->_voicePath;
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(void *)a3
{
  self->_synthesizer = a3;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_voicePath, 0);
}

- (uint64_t)_unlockedSynthesize:error:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z52-[SiriTTSSynthesisEngine _unlockedSynthesize:error:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)_unlockedSynthesize:error:
{
}

- (_QWORD)_unlockedSynthesize:error:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E3A115C8;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (id)_unlockedSynthesize:error:
{
  id result;

  *a2 = &off_1E3A115C8;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (_DWORD)_unlockedSynthesize:error:
{
  _DWORD *v2;

  v2 = operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E3A11678;
  v2[2] = *(_DWORD *)(a1 + 8);
  *((_QWORD *)v2 + 2) = *(id *)(a1 + 16);
  return v2;
}

+ (BOOL)hasPhaticResponsesWithVoicePath:(id)a3
{
  id v3;
  char has_phatic_responses;
  void *__p;
  char v7;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v3, "UTF8String"));
  has_phatic_responses = TTSSynthesizer::has_phatic_responses();
  if (v7 < 0)
    operator delete(__p);

  return has_phatic_responses;
}

@end
