@implementation SFSSTTSEngine

- (SFSSTTSEngine)initWithVoicePath:(id)a3 resourcePath:(id)a4
{
  id v7;
  id v8;
  SFSSTTSEngine *v9;
  SFSSTTSEngine *v10;
  NSString **p_voicePath;
  TTSSynthesizer *v12;
  char *v13;
  NSObject *v14;
  SFSSTTSEngine *v15;
  double v16;
  uint64_t v17;
  __int128 v18;
  void *__p;
  char v21;
  void *v22;
  char v23;
  objc_super v24;
  uint8_t buf[16];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SFSSTTSEngine;
  v9 = -[SFSSTTSEngine init](&v24, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_16:
    v15 = v10;
    goto LABEL_17;
  }
  p_voicePath = &v9->_voicePath;
  objc_storeStrong((id *)&v9->_voicePath, a3);
  if (*p_voicePath)
  {
    v12 = (TTSSynthesizer *)operator new();
    TTSSynthesizer::TTSSynthesizer(v12);
    std::unique_ptr<TTSSynthesizer>::reset[abi:ne180100]((uint64_t *)&v10->_synthesizer, (uint64_t)v12);
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)-[NSString UTF8String](v10->_voicePath, "UTF8String"));
    if (v8)
      v13 = (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    else
      v13 = "";
    std::string::basic_string[abi:ne180100]<0>(&v22, v13);
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    TTSSynthesizer::initialize();
    if (v21 < 0)
      operator delete(__p);
    if (v23 < 0)
      operator delete(v22);
    if (SBYTE7(v26) < 0)
      operator delete(*(void **)buf);
    LODWORD(v16) = *(_DWORD *)TTSSynthesizer::get_voice_description(v10->_synthesizer.__ptr_.__value_);
    -[SFSSTTSEngine constructPcmAsbdWithSampleRate:](v10, "constructPcmAsbdWithSampleRate:", v16);
    v17 = v27;
    v18 = v26;
    *(_OWORD *)&v10->_asbd.mSampleRate = *(_OWORD *)buf;
    *(_OWORD *)&v10->_asbd.mBytesPerPacket = v18;
    *(_QWORD *)&v10->_asbd.mBitsPerChannel = v17;
    goto LABEL_16;
  }
  SFSSGetLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v7;
    _os_log_error_impl(&dword_21E284000, v14, OS_LOG_TYPE_ERROR, "Voice asset path is invalid, path=%@", buf, 0xCu);
  }

  v15 = 0;
LABEL_17:

  return v15;
}

- (AudioStreamBasicDescription)constructPcmAsbdWithSampleRate:(SEL)a3
{
  retstr->mSampleRate = a4;
  *(_OWORD *)&retstr->mFormatID = xmmword_21E34D560;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_21E34D570;
  return self;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFSSTTSEngine;
  -[SFSSTTSEngine dealloc](&v2, sel_dealloc);
}

- (id)loadResourceAtPath:(id)a3 mimeType:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *resource;
  void *v10;
  void *v11;
  void *__p;
  char v14;
  void *v15;
  char v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(&v15, (char *)objc_msgSend(v7, "UTF8String"));
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
  resource = (void *)TTSSynthesizer::load_resource();
  if (v14 < 0)
    operator delete(__p);
  if ((v16 & 0x80000000) == 0)
  {
    if (!resource)
      goto LABEL_8;
    goto LABEL_7;
  }
  operator delete(v15);
  if (resource)
  {
LABEL_7:
    v10 = (void *)MEMORY[0x24BDD1540];
    v17[0] = CFSTR("path");
    v17[1] = CFSTR("mimeType");
    v18[0] = v7;
    v18[1] = v8;
    v17[2] = *MEMORY[0x24BDD0FD8];
    v18[2] = CFSTR("TTSSynthesizer::load_resource");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisDeviceErrorDomain"), resource, v11);
    resource = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return resource;
}

- (id)synthesizeText:(id)a3 loggable:(BOOL)a4 synthesisBegin:(id)a5 synthesisChunk:(id)a6 synthesisEnd:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  SFSSTTSEngineCallbackResult *v15;
  SFSSTTSEngineCallbackResult *callbackResult;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *__p;
  char v28;
  _QWORD v29[5];
  _OWORD v30[2];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  _QWORD v37[3];
  _QWORD *v38;
  _QWORD v39[3];
  _QWORD *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = -[SFSSTTSEngineCallbackResult initWithBeginCallback:chunkCallback:endCallback:]([SFSSTTSEngineCallbackResult alloc], "initWithBeginCallback:chunkCallback:endCallback:", v12, v13, v14);
  callbackResult = self->_callbackResult;
  self->_callbackResult = v15;

  -[SFSSTTSEngine asbd](self, "asbd");
  v30[0] = v32;
  v30[1] = v33;
  v31 = v34;
  -[SFSSTTSEngineCallbackResult setAsbd:](self->_callbackResult, "setAsbd:", v30);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __84__SFSSTTSEngine_synthesizeText_loggable_synthesisBegin_synthesisChunk_synthesisEnd___block_invoke;
  v29[3] = &unk_24E246D78;
  v29[4] = self;
  v40 = 0;
  v39[0] = &off_24E246DA8;
  v39[1] = MEMORY[0x2207ADF98](v29);
  v40 = v39;
  v17 = objc_retainAutorelease(v11);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "UTF8String"));
  -[SFSSTTSEngineCallbackResult pcmDataBuffer](self->_callbackResult, "pcmDataBuffer");
  -[SFSSTTSEngineCallbackResult marker](self->_callbackResult, "marker");
  v18 = (uint64_t)v40;
  if (!v40)
    goto LABEL_4;
  if (v40 != v39)
  {
    v18 = (*(uint64_t (**)(_QWORD *))(*v40 + 16))(v40);
LABEL_4:
    v38 = (_QWORD *)v18;
    goto LABEL_6;
  }
  v38 = v37;
  (*(void (**)(uint64_t, _QWORD *))(v39[0] + 24))((uint64_t)v39, v37);
LABEL_6:
  v19 = (void *)TTSSynthesizer::synthesize_text_with_markers_async();
  v20 = v38;
  if (v38 == v37)
  {
    v21 = 4;
    v20 = v37;
  }
  else
  {
    if (!v38)
      goto LABEL_11;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_11:
  if (v28 < 0)
  {
    operator delete(__p);
    if (!v19)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v19)
  {
LABEL_15:
    v22 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FD8];
    v36 = CFSTR("TTSSynthesizer::synthesize_text");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisDeviceErrorDomain"), v19, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:
  v24 = v40;
  if (v40 == v39)
  {
    v25 = 4;
    v24 = v39;
    goto LABEL_20;
  }
  if (v40)
  {
    v25 = 5;
LABEL_20:
    (*(void (**)(void))(*v24 + 8 * v25))();
  }

  return v19;
}

- (void)stopSynthesis
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Stop synthesis.", buf, 2u);
  }

  TTSSynthesizer::stop_synthesis(self->_synthesizer.__ptr_.__value_);
  SFSSGetLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21E284000, v4, OS_LOG_TYPE_INFO, "Synthesis stopped.", v5, 2u);
  }

}

- (void)preheat
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = mach_absolute_time();
  TTSSynthesizer::preheat(self->_synthesizer.__ptr_.__value_);
  v4 = mach_absolute_time();
  SFSSGetLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    +[SFSpeechSynthesisUtils absoluteTimeToSecond:](SFSpeechSynthesisUtils, "absoluteTimeToSecond:", v4 - v3);
    v7 = 134217984;
    v8 = v6;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "Engine preheating latency: %.3f", (uint8_t *)&v7, 0xCu);
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

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[1].mBytesPerFrame;
  return self;
}

- (SFSSTTSEngineCallbackResult)callbackResult
{
  return self->_callbackResult;
}

- (void)setCallbackResult:(id)a3
{
  objc_storeStrong((id *)&self->_callbackResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackResult, 0);
  objc_storeStrong((id *)&self->_voicePath, 0);
  std::unique_ptr<TTSSynthesizer>::reset[abi:ne180100]((uint64_t *)&self->_synthesizer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

uint64_t __84__SFSSTTSEngine_synthesizeText_loggable_synthesisBegin_synthesisChunk_synthesisEnd___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "callbackResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "synthesisCallback:", a2);

  return v4;
}

@end
