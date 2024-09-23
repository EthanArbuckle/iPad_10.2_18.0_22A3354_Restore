@implementation VSSpeechEngine

- (VSSpeechEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4
{
  VSSpeechEngine *v7;
  VSSpeechEngine *v8;
  NSLock *v14;
  NSLock *synthesisLock;
  BOOL v16;
  VSSpeechEngine *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  void *v30;
  id v31;
  id v32;
  VSSpeechEngine *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = a4;
  v38.receiver = self;
  v38.super_class = (Class)VSSpeechEngine;
  v7 = -[VSSpeechEngine init](&v38, sel_init);
  v8 = v7;
  v33 = v7;
  if (!v7)
    goto LABEL_3;
  objc_storeStrong((id *)&v7->_voicePath, a3);
  v33->_volume = 0.8;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&v33->_rate = _D0;
  v14 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  synthesisLock = v33->_synthesisLock;
  v33->_synthesisLock = v14;

  v16 = -[VSSpeechEngine initializeWithResourcePath:](v33, "initializeWithResourcePath:", v32);
  v8 = v33;
  if (!v16)
  {
    VSGetLogDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v41 = v31;
      v42 = 2112;
      v43 = v32;
      _os_log_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_DEFAULT, "voice path '%@', resource path '%@'\n", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    objc_msgSend(v19, "contentsOfDirectoryAtPath:error:", v31, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v22;
      _os_log_impl(&dword_1DE15E000, v21, OS_LOG_TYPE_DEFAULT, "%d files under voice path:", buf, 8u);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v30;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          VSGetLogDefault();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v27;
            _os_log_impl(&dword_1DE15E000, v28, OS_LOG_TYPE_DEFAULT, "- %@", buf, 0xCu);
          }

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v24);

    }
    else
    {

    }
    v17 = 0;
  }
  else
  {
LABEL_3:
    v17 = v8;
  }

  return v17;
}

- (BOOL)initializeWithResourcePath:(id)a3
{
  id v4;
  NSString *voicePath;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  TTSSynthesizer *v9;
  char *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *__p;
  char v17;
  void *v18;
  char v19;
  _BYTE buf[12];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  voicePath = self->_voicePath;
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (voicePath)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = self->_voicePath;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_INFO, "Initializing engine with voice path: %@", buf, 0xCu);
    }

    v9 = (TTSSynthesizer *)operator new();
    TTSSynthesizer::TTSSynthesizer(v9);
    self->_synthesizer = v9;
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)-[NSString UTF8String](self->_voicePath, "UTF8String"));
    if (v4)
      v10 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    else
      v10 = "";
    std::string::basic_string[abi:ne180100]<0>(&v18, v10);
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    v12 = TTSSynthesizer::initialize();
    if (v17 < 0)
      operator delete(__p);
    if (v19 < 0)
      operator delete(v18);
    if (v21 < 0)
    {
      operator delete(*(void **)buf);
      if (v12)
        goto LABEL_16;
    }
    else if (v12)
    {
LABEL_16:
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v12;
        _os_log_error_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_ERROR, "Failed to initialize synthesizer: %zu\n", buf, 0xCu);
      }

      if (self->_synthesizer)
      {
        v14 = MEMORY[0x1DF0E8F58]();
        MEMORY[0x1DF0E8FC4](v14, 0x20C40A4A59CD2);
      }
      v11 = 0;
      self->_synthesizer = 0;
      goto LABEL_23;
    }
    self->_asbd.mSampleRate = *(float *)TTSSynthesizer::get_voice_description((TTSSynthesizer *)self->_synthesizer);
    *(_OWORD *)&self->_asbd.mFormatID = xmmword_1DE1A1950;
    *(_OWORD *)&self->_asbd.mBytesPerFrame = xmmword_1DE1A1960;
    self->_pcmBufferSize = 9600;
    v11 = 1;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, "Failed to initialize synthesizer due to missing voice path.\n", buf, 2u);
  }

  v11 = 0;
LABEL_23:

  return v11;
}

- (void)dealloc
{
  void *synthesizer;
  uint64_t v4;
  objc_super v5;

  synthesizer = self->_synthesizer;
  if (synthesizer)
  {
    v4 = MEMORY[0x1DF0E8F58](synthesizer, a2);
    MEMORY[0x1DF0E8FC4](v4, 0x20C40A4A59CD2);
  }
  self->_synthesizer = 0;
  v5.receiver = self;
  v5.super_class = (Class)VSSpeechEngine;
  -[VSSpeechEngine dealloc](&v5, sel_dealloc);
}

- (void)setPitch:(float)a3
{
  double v3;
  float v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 < 0.5)
    v3 = 0.5;
  if (v3 >= 2.0)
    v3 = 2.0;
  v4 = v3;
  if (self->_pitch != v4)
  {
    v6 = TTSSynthesizer::set_global_property();
    if (v6)
    {
      v7 = v6;
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 134217984;
        v10 = v7;
        _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, "Error setPitch 0x%zx", (uint8_t *)&v9, 0xCu);
      }

    }
    else
    {
      self->_pitch = v4;
    }
  }
}

- (void)setRate:(float)a3
{
  double v3;
  float v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 < 0.5)
    v3 = 0.5;
  if (v3 >= 4.0)
    v3 = 4.0;
  v4 = v3;
  if (self->_rate != v4)
  {
    v6 = TTSSynthesizer::set_global_property();
    if (v6)
    {
      v7 = v6;
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 134217984;
        v10 = v7;
        _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, "Error setRate 0x%zx", (uint8_t *)&v9, 0xCu);
      }

    }
    else
    {
      self->_rate = v4;
    }
  }
}

- (void)setVolume:(float)a3
{
  float v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.01)
    v3 = 0.01;
  else
    v3 = a3;
  if (self->_volume != v3)
  {
    v5 = TTSSynthesizer::set_global_property();
    if (v5)
    {
      v6 = v5;
      VSGetLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 134217984;
        v9 = v6;
        _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, "Error setVolume 0x%zx", (uint8_t *)&v8, 0xCu);
      }

    }
    else
    {
      self->_volume = v3;
    }
  }
}

- (id)loadResourceAtPath:(id)a3 mimeType:(id)a4 error:(id *)p_isa
{
  id v8;
  id v9;
  id v10;
  id v11;
  VSSpeechEngineVoiceResource *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;
  void *__p;
  char v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _BYTE buf[12];
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSLock lock](self->_synthesisLock, "lock");
  v10 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v10, "UTF8String"));
  v11 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v11, "UTF8String"));
  TTSSynthesizer::load_voice_resource();
  if (v28 < 0)
    operator delete(__p);
  if (v34 < 0)
    operator delete(*(void **)buf);
  -[NSLock unlock](self->_synthesisLock, "unlock");
  if (v29)
  {
    v12 = objc_alloc_init(VSSpeechEngineVoiceResource);
    p_isa = (id *)&v12->super.isa;
    v25 = v29;
    v26 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    -[VSSpeechEngineVoiceResource setResource:](v12, "setResource:", &v25);
    v15 = v26;
    if (v26)
    {
      v16 = (unint64_t *)&v26->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    VSGetLogDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_error_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_ERROR, "Unable to load resource '%@'", buf, 0xCu);
    }

    if (p_isa)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v31[0] = CFSTR("path");
      v31[1] = CFSTR("mimeType");
      v32[0] = v10;
      v32[1] = v11;
      v31[2] = *MEMORY[0x1E0CB2D68];
      v32[2] = CFSTR("TTSSynthesizer::load_voice_resource");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("VSVocalizerEngine"), 1, v20);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

      p_isa = 0;
    }
  }
  v21 = v30;
  if (v30)
  {
    v22 = (unint64_t *)&v30->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  return p_isa;
}

- (id)loadResource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechEngine mimeForFileExtension:](VSSpeechEngine, "mimeForFileExtension:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v6;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1DE15E000, v10, OS_LOG_TYPE_INFO, "Loading resource: %@, mime-type: %@", buf, 0x16u);
    }

    if (v9)
    {
      -[VSSpeechEngine loadResourceAtPath:mimeType:error:](self, "loadResourceAtPath:mimeType:error:", v7, v9, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      VSGetLogDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_error_impl(&dword_1DE15E000, v15, OS_LOG_TYPE_ERROR, "Unable to find mime-type for '%@'", buf, 0xCu);
      }

      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2D68];
        v20[0] = CFSTR("url");
        v20[1] = v17;
        v21[0] = v6;
        v21[1] = CFSTR("unknown mime-type");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("VSVocalizerEngine"), 1, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v9 = 0;
      v11 = 0;
    }
  }
  else
  {
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_error_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_ERROR, "Url doesn't conform to RFC 1808 '%@'", buf, 0xCu);
    }

    if (!a4)
    {
      v11 = 0;
      goto LABEL_16;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D68];
    v26[0] = CFSTR("url");
    v26[1] = v14;
    v27[0] = v6;
    v27[1] = CFSTR("unknown path");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("VSVocalizerEngine"), 1, v9);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  return v11;
}

- (void)unloadResource:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[NSLock lock](self->_synthesisLock, "lock");
    if (v5)
      -[NSObject resource](v5, "resource");
    else
      v8 = 0uLL;
    TTSSynthesizer::unload_resource();
    if (*((_QWORD *)&v8 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v8 + 1) + 16))(*((_QWORD *)&v8 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    -[NSLock unlock](self->_synthesisLock, "unlock", (_QWORD)v8);
  }
  else
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v8) = 138412290;
      *(_QWORD *)((char *)&v8 + 4) = v4;
      _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "Unknown voice resource handle to unload: %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (id)synthesizeText:(id)a3 loggable:(BOOL)a4 callback:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  VSSpeechSynthesisCallbackResult *v10;
  VSSpeechSynthesisCallbackResult *v11;
  _QWORD *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  VSSpeechSynthesisCallbackResult *v17;
  _QWORD *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  VSSpeechSynthesisCallbackResult *v23;
  _QWORD *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  VSSpeechSynthesisCallbackResult *v29;
  _QWORD *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t *p_shared_owners;
  unint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t *v61;
  unint64_t v62;
  unint64_t *v63;
  unint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id v71;
  unint64_t *v72;
  unint64_t v73;
  unint64_t *v74;
  unint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t *v78;
  unint64_t v79;
  __int128 *v80;
  uint64_t v81;
  std::__shared_weak_count *v83;
  std::__shared_weak_count *v84;
  std::__shared_weak_count *v85;
  std::__shared_weak_count *v86;
  _QWORD v87[5];
  _OWORD v88[2];
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  const __CFString *v94;
  _QWORD v95[3];
  _QWORD *v96;
  __int128 __p;
  char v98;
  _QWORD v99[3];
  _QWORD *v100;
  _QWORD v101[3];
  _QWORD *v102;
  _QWORD v103[3];
  _QWORD *v104;
  _QWORD v105[3];
  _QWORD *v106;
  __int128 buf;
  __int128 *p_buf;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  -[NSLock lock](self->_synthesisLock, "lock");
  VSGetLogDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEBUG, "VSSpeechEngine %p started synthesis.", (uint8_t *)&buf, 0xCu);
  }

  v10 = -[VSSpeechSynthesisCallbackResult initWithCallback:]([VSSpeechSynthesisCallbackResult alloc], "initWithCallback:", v8);
  -[VSSpeechEngine asbd](self, "asbd");
  v88[0] = v90;
  v88[1] = v91;
  v89 = v92;
  -[VSSpeechSynthesisCallbackResult setAsbd:](v10, "setAsbd:", v88);
  -[VSSpeechSynthesisCallbackResult setText:](v10, "setText:", v7);
  objc_storeStrong((id *)&self->_currentCallbackResult, v10);
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __51__VSSpeechEngine_synthesizeText_loggable_callback___block_invoke;
  v87[3] = &unk_1EA8AF710;
  v87[4] = self;
  p_buf = 0;
  *(_QWORD *)&buf = &off_1EA8AEE50;
  *((_QWORD *)&buf + 1) = MEMORY[0x1DF0E94A4](v87);
  p_buf = &buf;
  TTSSynthesizer::set_censor_plaintext((TTSSynthesizer *)self->_synthesizer);
  TTSSynthesizer::set_neural_cost();
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v11 = v10;
  v105[0] = &off_1EA8AEEA8;
  v105[1] = v11;
  v106 = v105;
  Observable::on_event();
  v12 = v106;
  if (v106 == v105)
  {
    v13 = 4;
    v12 = v105;
    goto LABEL_7;
  }
  if (v106)
  {
    v13 = 5;
LABEL_7:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }
  v14 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v17 = v11;
  v103[0] = &off_1EA8AEF00;
  v103[1] = v17;
  v104 = v103;
  Observable::on_event();
  v18 = v104;
  if (v104 == v103)
  {
    v19 = 4;
    v18 = v103;
    goto LABEL_17;
  }
  if (v104)
  {
    v19 = 5;
LABEL_17:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }
  v20 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v23 = v17;
  v101[0] = &off_1EA8AEF58;
  v101[1] = v23;
  v102 = v101;
  Observable::on_event();
  v24 = v102;
  if (v102 == v101)
  {
    v25 = 4;
    v24 = v101;
    goto LABEL_27;
  }
  if (v102)
  {
    v25 = 5;
LABEL_27:
    (*(void (**)(void))(*v24 + 8 * v25))();
  }
  v26 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v27 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  v29 = v23;
  v99[0] = &off_1EA8AEFB0;
  v99[1] = v29;
  v100 = v99;
  Observable::on_event();
  v30 = v100;
  if (v100 == v99)
  {
    v31 = 4;
    v30 = v99;
    goto LABEL_37;
  }
  if (v100)
  {
    v31 = 5;
LABEL_37:
    (*(void (**)(void))(*v30 + 8 * v31))();
  }
  v32 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v33 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v35, "UTF8String"));
  -[VSSpeechSynthesisCallbackResult sampleBuffer](v29, "sampleBuffer");
  -[VSSpeechSynthesisCallbackResult markerBuffer](v29, "markerBuffer");
  v36 = (uint64_t)p_buf;
  if (!p_buf)
    goto LABEL_46;
  if (p_buf != &buf)
  {
    v36 = (*(uint64_t (**)(__int128 *))(*(_QWORD *)p_buf + 16))(p_buf);
LABEL_46:
    v96 = (_QWORD *)v36;
    goto LABEL_48;
  }
  v96 = v95;
  (*(void (**)(uint64_t, _QWORD *))(buf + 24))((uint64_t)&buf, v95);
LABEL_48:
  v37 = TTSSynthesizer::synthesize_text_with_markers_async();
  v38 = v96;
  if (v96 == v95)
  {
    v39 = 4;
    v38 = v95;
  }
  else
  {
    if (!v96)
      goto LABEL_53;
    v39 = 5;
  }
  (*(void (**)(void))(*v38 + 8 * v39))();
LABEL_53:
  if (v98 < 0)
    operator delete((void *)__p);
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  if (v85)
  {
    p_shared_owners = (unint64_t *)&v85->__shared_owners_;
    do
      v41 = __ldxr(p_shared_owners);
    while (__stxr(v41 + 1, p_shared_owners));
  }
  Observable::remove_observer();
  if (v85)
  {
    v42 = (unint64_t *)&v85->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)())v85->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v85);
    }
  }
  v44 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v45 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  if (v86)
  {
    v47 = (unint64_t *)&v86->__shared_owners_;
    do
      v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
  }
  Observable::remove_observer();
  if (v86)
  {
    v49 = (unint64_t *)&v86->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)())v86->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v86);
    }
  }
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
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  if (v84)
  {
    v54 = (unint64_t *)&v84->__shared_owners_;
    do
      v55 = __ldxr(v54);
    while (__stxr(v55 + 1, v54));
  }
  Observable::remove_observer();
  if (v84)
  {
    v56 = (unint64_t *)&v84->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)())v84->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v84);
    }
  }
  v58 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v59 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }
  TTSSynthesizer::get_event_bus((TTSSynthesizer *)self->_synthesizer);
  if (v83)
  {
    v61 = (unint64_t *)&v83->__shared_owners_;
    do
      v62 = __ldxr(v61);
    while (__stxr(v62 + 1, v61));
  }
  Observable::remove_observer();
  if (v83)
  {
    v63 = (unint64_t *)&v83->__shared_owners_;
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)())v83->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  v65 = (std::__shared_weak_count *)*((_QWORD *)&__p + 1);
  if (*((_QWORD *)&__p + 1))
  {
    v66 = (unint64_t *)(*((_QWORD *)&__p + 1) + 8);
    do
      v67 = __ldaxr(v66);
    while (__stlxr(v67 - 1, v66));
    if (!v67)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  VSGetLogDefault();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__p) = 134217984;
    *(_QWORD *)((char *)&__p + 4) = self;
    _os_log_debug_impl(&dword_1DE15E000, v68, OS_LOG_TYPE_DEBUG, "VSSpeechEngine %p finished synthesis.", (uint8_t *)&__p, 0xCu);
  }

  -[NSLock unlock](self->_synthesisLock, "unlock");
  if (v37)
  {
    v69 = (void *)MEMORY[0x1E0CB35C8];
    v93 = *MEMORY[0x1E0CB2D68];
    v94 = CFSTR("TTSSynthesizer::synthesize_text_with_markers_async");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "errorWithDomain:code:userInfo:", CFSTR("VSVocalizerEngine"), v37, v70);
    v71 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v71 = 0;
  }
  if (v83)
  {
    v72 = (unint64_t *)&v83->__shared_owners_;
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)())v83->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v83);
    }
  }
  if (v84)
  {
    v74 = (unint64_t *)&v84->__shared_owners_;
    do
      v75 = __ldaxr(v74);
    while (__stlxr(v75 - 1, v74));
    if (!v75)
    {
      ((void (*)())v84->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v84);
    }
  }
  if (v85)
  {
    v76 = (unint64_t *)&v85->__shared_owners_;
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)())v85->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v85);
    }
  }
  if (v86)
  {
    v78 = (unint64_t *)&v86->__shared_owners_;
    do
      v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)())v86->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v86);
    }
  }
  v80 = p_buf;
  if (p_buf == &buf)
  {
    v81 = 4;
    v80 = &buf;
    goto LABEL_136;
  }
  if (p_buf)
  {
    v81 = 5;
LABEL_136:
    (*(void (**)(void))(*(_QWORD *)v80 + 8 * v81))();
  }

  return v71;
}

- (void)stopAtMarker:(int64_t)a3
{
  id v5;
  id v6;

  if (a3 == 1)
  {
    -[VSSpeechEngine currentCallbackResult](self, "currentCallbackResult");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStopMark:", 1);

  }
  else if (!a3)
  {
    TTSSynthesizer::stop_synthesis((TTSSynthesizer *)self->_synthesizer);
  }
  -[VSSpeechEngine currentCallbackResult](self, "currentCallbackResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStopMark:", a3);

}

- (void)preheat
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_synthesisLock, "lock");
  v3 = mach_absolute_time();
  TTSSynthesizer::preheat((TTSSynthesizer *)self->_synthesizer);
  -[NSLock unlock](self->_synthesisLock, "unlock");
  v4 = mach_absolute_time();
  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v4 - v3;
    if (VSAbsoluteTimeToSecond_onceToken != -1)
      dispatch_once(&VSAbsoluteTimeToSecond_onceToken, &__block_literal_global_5);
    v7 = 134217984;
    v8 = *(double *)&VSAbsoluteTimeToSecond_clockFactor * (double)v6;
    _os_log_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_INFO, "Engine preheating latency: %.3f", (uint8_t *)&v7, 0xCu);
  }

}

- (NSString)voicePath
{
  return self->_voicePath;
}

- (void)setVoicePath:(id)a3
{
  objc_storeStrong((id *)&self->_voicePath, a3);
}

- (unint64_t)pcmBufferSize
{
  return self->_pcmBufferSize;
}

- (void)setPcmBufferSize:(unint64_t)a3
{
  self->_pcmBufferSize = a3;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[2].mBytesPerFrame;
  return self;
}

- (float)rate
{
  return self->_rate;
}

- (float)pitch
{
  return self->_pitch;
}

- (float)volume
{
  return self->_volume;
}

- (int64_t)powerProfile
{
  return self->_powerProfile;
}

- (void)setPowerProfile:(int64_t)a3
{
  self->_powerProfile = a3;
}

- (void)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(void *)a3
{
  self->_synthesizer = a3;
}

- (VSSpeechSynthesisCallbackResult)currentCallbackResult
{
  return self->_currentCallbackResult;
}

- (void)setCurrentCallbackResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentCallbackResult, a3);
}

- (NSLock)synthesisLock
{
  return self->_synthesisLock;
}

- (void)setSynthesisLock:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisLock, 0);
  objc_storeStrong((id *)&self->_currentCallbackResult, 0);
  objc_storeStrong((id *)&self->_voicePath, 0);
}

uint64_t __51__VSSpeechEngine_synthesizeText_loggable_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "currentCallbackResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "synthesisCallback:", a2);

  return v4;
}

- (uint64_t)synthesizeText:loggable:callback:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z51-[VSSpeechEngine synthesizeText:loggable:callback:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)synthesizeText:loggable:callback:
{
}

- (_QWORD)synthesizeText:loggable:callback:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1EA8AEEA8;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (id)synthesizeText:loggable:callback:
{
  id result;

  *a2 = &off_1EA8AEEA8;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

+ (int64_t)engineMinimumCompatibility
{
  return TTSSynthesizer::get_engine_description((TTSSynthesizer *)a1);
}

+ (int64_t)engineCurrentCompatibility
{
  return (unint64_t)TTSSynthesizer::get_engine_description((TTSSynthesizer *)a1) >> 32;
}

+ (BOOL)isUserCancelError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") == 2147485703)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("VSVocalizerEngine"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)hasPhaticResponses:(id)a3
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

+ (id)mimeForFileExtension:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dcb")) & 1) != 0)
  {
    v4 = CFSTR("application/edct-bin-dictionary");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("txt")))
  {
    v4 = CFSTR("application/x-vocalizer-rettt+text");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

@end
