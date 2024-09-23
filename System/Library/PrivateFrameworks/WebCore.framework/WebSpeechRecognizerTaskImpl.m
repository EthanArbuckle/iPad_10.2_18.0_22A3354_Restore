@implementation WebSpeechRecognizerTaskImpl

- (WebSpeechRecognizerTaskImpl)initWithIdentifier:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long long>)a3 :(id)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :(BOOL)a5 SpeechRecognitionConnectionClientIdentifierType locale:(BOOL)a6 doMultipleRecognitions:(unint64_t)a7 reportInterimResults:(id)a8 maxAlternatives:delegateCallback:
{
  _BOOL8 v10;
  WebSpeechRecognizerTaskImpl *v14;
  WebSpeechRecognizerTaskImpl *v15;
  void *v16;
  unint64_t v17;
  PAL *v18;
  id v19;
  void *v20;
  void *m_ptr;
  PAL *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v10 = a6;
  v26.receiver = self;
  v26.super_class = (Class)WebSpeechRecognizerTaskImpl;
  v14 = -[WebSpeechRecognizerTaskImpl init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_identifier = a3;
    v14->_doMultipleRecognitions = a5;
    v16 = _Block_copy(a8);
    _Block_release(v15->_delegateCallback.m_block);
    v15->_delegateCallback.m_block = v16;
    _Block_release(0);
    *(_WORD *)&v15->_hasSentSpeechStart = 0;
    v15->_hasSentEnd = 0;
    if (a7 <= 1)
      v17 = 1;
    else
      v17 = a7;
    v15->_maxAlternatives = v17;
    v18 = (PAL *)objc_msgSend(a4, "length");
    v19 = objc_alloc((Class)PAL::getSFSpeechRecognizerClass[0](v18));
    if (v18)
      v20 = (void *)objc_msgSend(v19, "initWithLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a4));
    else
      v20 = (void *)objc_msgSend(v19, "init");
    m_ptr = v15->_recognizer.m_ptr;
    v15->_recognizer.m_ptr = v20;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v20 = v15->_recognizer.m_ptr;
    }
    if (v20 && (objc_msgSend(v20, "isAvailable") & 1) != 0)
    {
      v22 = (PAL *)objc_msgSend(v15->_recognizer.m_ptr, "setDelegate:", v15);
      v23 = objc_msgSend(objc_alloc((Class)PAL::getSFSpeechAudioBufferRecognitionRequestClass[0](v22)), "init");
      v24 = v15->_request.m_ptr;
      v15->_request.m_ptr = (void *)v23;
      if (v24)
        CFRelease(v24);
      if (objc_msgSend(v15->_recognizer.m_ptr, "supportsOnDeviceRecognition"))
        objc_msgSend(v15->_request.m_ptr, "setRequiresOnDeviceRecognition:", 1);
      objc_msgSend(v15->_request.m_ptr, "setShouldReportPartialResults:", v10);
      objc_msgSend(v15->_request.m_ptr, "setTaskHint:", 1);
      objc_msgSend(v15->_request.m_ptr, "setDetectMultipleUtterances:", 1);
      objc_msgSend(v15->_request.m_ptr, "_setMaximumRecognitionDuration:", 3600.0);
      objc_storeWeak(&v15->_task.m_weakReference, (id)objc_msgSend(v15->_recognizer.m_ptr, "recognitionTaskWithRequest:delegate:", v15->_request.m_ptr, v15));
    }
    else
    {

      return 0;
    }
  }
  return v15;
}

- (void)callbackWithTranscriptions:(id)a3 isFinal:(BOOL)a4
{
  unint64_t maxAlternatives;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  float v17;
  double v18;
  WTF::StringImpl *v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  WTF::StringImpl *v23;
  uint64_t v24;
  WTF::StringImpl *v25;
  uint64_t v26;
  WTF::StringImpl *m_identifier;
  int v28;
  WTF::StringImpl *v29;
  WTF *v30;
  WTF *v31;
  uint64_t v32;
  WTF::StringImpl **v33;
  uint64_t v34;
  WTF::StringImpl *v35;
  WTF *v36;
  WTF *v37;
  uint64_t v38;
  WTF::StringImpl *v39;
  WTF *v40;
  BOOL v41;
  WTF *v44;
  int v45;
  unsigned int v46;
  WTF::StringImpl *v47;
  double v48;
  _BYTE v49[16];
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  WTF *v59;
  uint64_t v60;
  uint64_t *v61[2];
  int v62;
  char v63;
  WTF *v64;
  int v65;
  unsigned int v66;
  BOOL v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  v60 = 0;
  maxAlternatives = self->_maxAlternatives;
  if (maxAlternatives)
  {
    if (maxAlternatives >> 28)
    {
      __break(0xC471u);
      return;
    }
    v6 = WTF::fastMalloc((WTF *)(16 * maxAlternatives));
    LODWORD(v60) = maxAlternatives;
    v59 = (WTF *)v6;
  }
  else
  {
    v6 = 0;
  }
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v55 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  v41 = a4;
  v8 = 0;
  if (v7)
  {
    v9 = *(_QWORD *)v56;
LABEL_7:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v9)
        objc_enumerationMutation(a3);
      v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v10);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v12 = (void *)objc_msgSend(v11, "segments");
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v52;
        v15 = 0.0;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v52 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "confidence");
            v18 = v17;
            if (v15 < v18)
              v15 = v18;
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        }
        while (v13);
      }
      else
      {
        v15 = 0.0;
      }
      MEMORY[0x19AEA5508](&v47, objc_msgSend(v11, "formattedString"));
      v48 = v15;
      if (v8 == (_DWORD)v60)
      {
        v20 = (uint64_t *)WTF::Vector<WebCore::SpeechRecognitionAlternativeData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((unsigned int *)&v59, v8 + 1, (unint64_t)&v47);
        v8 = HIDWORD(v60);
        v6 = (uint64_t)v59;
        v21 = (_QWORD *)((char *)v59 + 16 * HIDWORD(v60));
        v22 = *v20;
        *v20 = 0;
        *v21 = v22;
        v21[1] = v20[1];
      }
      else
      {
        v23 = v47;
        v47 = 0;
        v24 = v6 + 16 * v8;
        *(_QWORD *)v24 = v23;
        *(double *)(v24 + 8) = v15;
      }
      HIDWORD(v60) = ++v8;
      v25 = v47;
      v47 = 0;
      if (v25)
      {
        if (*(_DWORD *)v25 == 2)
          WTF::StringImpl::destroy(v25, v19);
        else
          *(_DWORD *)v25 -= 2;
      }
      if (self->_maxAlternatives == v8)
        break;
      if (++v10 == v7)
      {
        v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        v7 = v26;
        if (v26)
          goto LABEL_7;
        break;
      }
    }
  }
  m_identifier = (WTF::StringImpl *)self->_identifier.m_identifier;
  v64 = v59;
  v28 = v60;
  v59 = 0;
  v60 = 0;
  v65 = v28;
  v66 = v8;
  v67 = v41;
  WTF::Vector<WebCore::SpeechRecognitionResultData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)&v44, (uint64_t *)&v64, 1uLL);
  WTF::Vector<WebCore::SpeechRecognitionResultData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v61, (uint64_t **)&v44);
  v62 = 2;
  v47 = m_identifier;
  LOBYTE(v48) = 7;
  v49[0] = 0;
  v50 = -1;
  WTF::Vector<WebCore::SpeechRecognitionResultData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v49, v61);
  v50 = 2;
  if (v62 != -1)
    ((void (*)(char *, uint64_t **))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJNS_9monostateEN7WebCore22SpeechRecognitionErrorEN3WTF6VectorINS7_27SpeechRecognitionResultDataELm0ENS9_15CrashOnOverflowELm16ENS9_10FastMallocEEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRSH_EEEDcOSI_DpOT0____fmatrix[v62])(&v63, v61);
  (*((void (**)(void))self->_delegateCallback.m_block + 2))();
  if (v50 != -1)
    ((void (*)(uint64_t **, _BYTE *))off_1E3232F58[v50])(v61, v49);
  v50 = -1;
  v30 = v44;
  if (v46)
  {
    v31 = (WTF *)((char *)v44 + 24 * v46);
    do
    {
      v32 = *((unsigned int *)v30 + 3);
      if ((_DWORD)v32)
      {
        v33 = *(WTF::StringImpl ***)v30;
        v34 = 16 * v32;
        do
        {
          v35 = *v33;
          *v33 = 0;
          if (v35)
          {
            if (*(_DWORD *)v35 == 2)
              WTF::StringImpl::destroy(v35, v29);
            else
              *(_DWORD *)v35 -= 2;
          }
          v33 += 2;
          v34 -= 16;
        }
        while (v34);
      }
      v36 = *(WTF **)v30;
      if (*(_QWORD *)v30)
      {
        *(_QWORD *)v30 = 0;
        *((_DWORD *)v30 + 2) = 0;
        WTF::fastFree(v36, v29);
      }
      v30 = (WTF *)((char *)v30 + 24);
    }
    while (v30 != v31);
    v30 = v44;
  }
  if (v30)
  {
    v44 = 0;
    v45 = 0;
    WTF::fastFree(v30, v29);
  }
  if (v66)
  {
    v37 = v64;
    v38 = 16 * v66;
    do
    {
      v39 = *(WTF::StringImpl **)v37;
      *(_QWORD *)v37 = 0;
      if (v39)
      {
        if (*(_DWORD *)v39 == 2)
          WTF::StringImpl::destroy(v39, v29);
        else
          *(_DWORD *)v39 -= 2;
      }
      v37 = (WTF *)((char *)v37 + 16);
      v38 -= 16;
    }
    while (v38);
  }
  v40 = v64;
  if (v64)
  {
    v64 = 0;
    v65 = 0;
    WTF::fastFree(v40, v29);
  }
}

- (void)audioSamplesAvailable:(opaqueCMSampleBuffer *)a3
{
  objc_msgSend(self->_request.m_ptr, "appendAudioSampleBuffer:", a3);
}

- (void)abort
{
  WeakObjCPtr<SFSpeechRecognitionTask> *p_task;
  uint64_t v4;

  p_task = &self->_task;
  if (objc_loadWeak(&self->_task.m_weakReference)
    && objc_msgSend(objc_loadWeak(&p_task->m_weakReference), "state") != 3)
  {
    v4 = objc_msgSend(objc_loadWeak(&p_task->m_weakReference), "state");
    -[WebSpeechRecognizerTaskImpl sendSpeechEndIfNeeded](self, "sendSpeechEndIfNeeded");
    if (v4 == 4)
    {
      -[WebSpeechRecognizerTaskImpl sendEndIfNeeded](self, "sendEndIfNeeded");
    }
    else
    {
      objc_msgSend(self->_request.m_ptr, "endAudio");
      objc_msgSend(objc_loadWeak(&p_task->m_weakReference), "cancel");
    }
  }
}

- (void)stop
{
  WeakObjCPtr<SFSpeechRecognitionTask> *p_task;
  uint64_t v4;

  p_task = &self->_task;
  if (objc_loadWeak(&self->_task.m_weakReference)
    && objc_msgSend(objc_loadWeak(&p_task->m_weakReference), "state") != 3)
  {
    v4 = objc_msgSend(objc_loadWeak(&p_task->m_weakReference), "state");
    -[WebSpeechRecognizerTaskImpl sendSpeechEndIfNeeded](self, "sendSpeechEndIfNeeded");
    if (v4 == 4)
    {
      -[WebSpeechRecognizerTaskImpl sendEndIfNeeded](self, "sendEndIfNeeded");
    }
    else
    {
      objc_msgSend(self->_request.m_ptr, "endAudio");
      objc_msgSend(objc_loadWeak(&p_task->m_weakReference), "finish");
    }
  }
}

- (void)sendSpeechStartIfNeeded
{
  void (**m_block)(id, _QWORD *);
  unint64_t m_identifier;
  unint64_t v4;
  char v5;
  _BYTE v6[16];
  int v7;
  char v8;

  if (!self->_hasSentSpeechStart)
  {
    self->_hasSentSpeechStart = 1;
    m_identifier = self->_identifier.m_identifier;
    m_block = (void (**)(id, _QWORD *))self->_delegateCallback.m_block;
    v4 = m_identifier;
    v5 = 3;
    v6[0] = 0;
    v7 = 0;
    m_block[2](m_block, &v4);
    if (v7 != -1)
      ((void (*)(char *, _BYTE *))off_1E3232F58[v7])(&v8, v6);
  }
}

- (void)sendSpeechEndIfNeeded
{
  void (**m_block)(id, _QWORD *);
  unint64_t m_identifier;
  unint64_t v4;
  char v5;
  _BYTE v6[16];
  int v7;
  char v8;

  if (self->_hasSentSpeechStart && !self->_hasSentSpeechEnd)
  {
    self->_hasSentSpeechEnd = 1;
    m_identifier = self->_identifier.m_identifier;
    m_block = (void (**)(id, _QWORD *))self->_delegateCallback.m_block;
    v4 = m_identifier;
    v5 = 4;
    v6[0] = 0;
    v7 = 0;
    m_block[2](m_block, &v4);
    if (v7 != -1)
      ((void (*)(char *, _BYTE *))off_1E3232F58[v7])(&v8, v6);
  }
}

- (void)sendEndIfNeeded
{
  void (**m_block)(id, _QWORD *);
  unint64_t m_identifier;
  unint64_t v4;
  char v5;
  _BYTE v6[16];
  int v7;
  char v8;

  if (!self->_hasSentEnd)
  {
    self->_hasSentEnd = 1;
    m_identifier = self->_identifier.m_identifier;
    m_block = (void (**)(id, _QWORD *))self->_delegateCallback.m_block;
    v4 = m_identifier;
    v5 = 10;
    v6[0] = 0;
    v7 = 0;
    m_block[2](m_block, &v4);
    if (v7 != -1)
      ((void (*)(char *, _BYTE *))off_1E3232F58[v7])(&v8, v6);
  }
}

- (void)speechRecognizer:(id)a3 availabilityDidChange:(BOOL)a4
{
  WTF::StringImpl *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  int v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  unint64_t m_identifier;
  char v13;
  char v14[8];
  WTF::StringImpl *v15;
  int v16;
  char v17;
  WTF::StringImpl *v18;
  char v19;

  if (!a4 && objc_loadWeak(&self->_task.m_weakReference))
  {
    v17 = 5;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v8 = v18;
    if (v18)
    {
      v9 = *(_DWORD *)v18;
      m_identifier = self->_identifier.m_identifier;
      v13 = 9;
      v14[0] = 5;
      *(_DWORD *)v18 = v9 + 4;
      v15 = v8;
      v16 = 1;
      if (v9 == -2)
        WTF::StringImpl::destroy(v8, v5);
      else
        *(_DWORD *)v8 = v9 + 2;
    }
    else
    {
      m_identifier = self->_identifier.m_identifier;
      v13 = 9;
      v14[0] = 5;
      v15 = 0;
      v16 = 1;
    }
    (*((void (**)(id, unint64_t *, uint64_t, uint64_t))self->_delegateCallback.m_block + 2))(self->_delegateCallback.m_block, &m_identifier, v6, v7);
    if (v16 != -1)
      ((void (*)(char *, char *))off_1E3232F58[v16])(&v19, v14);
    v11 = v18;
    v18 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v10);
      else
        *(_DWORD *)v11 -= 2;
    }
  }
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  -[WebSpeechRecognizerTaskImpl sendSpeechStartIfNeeded](self, "sendSpeechStartIfNeeded", a3);
  -[WebSpeechRecognizerTaskImpl callbackWithTranscriptions:isFinal:](self, "callbackWithTranscriptions:isFinal:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", a4, 0), 0);
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  if (objc_msgSend(a3, "state") != 3 && (self->_doMultipleRecognitions || objc_msgSend(a3, "state") != 4))
  {
    -[WebSpeechRecognizerTaskImpl callbackWithTranscriptions:isFinal:](self, "callbackWithTranscriptions:isFinal:", objc_msgSend(a4, "transcriptions"), 1);
    if (!self->_doMultipleRecognitions)
      -[WebSpeechRecognizerTaskImpl stop](self, "stop");
  }
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  -[WebSpeechRecognizerTaskImpl sendSpeechEndIfNeeded](self, "sendSpeechEndIfNeeded", a3);
  -[WebSpeechRecognizerTaskImpl sendEndIfNeeded](self, "sendEndIfNeeded");
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  WTF::StringImpl *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  int v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  unint64_t m_identifier;
  uint64_t v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  int v16;
  char v17;
  WTF::StringImpl *v18;
  char v19;

  if (!a4)
  {
    v17 = 1;
    MEMORY[0x19AEA5508](&v18, objc_msgSend((id)objc_msgSend(a3, "error"), "localizedDescription"));
    v8 = v18;
    if (v18)
    {
      v9 = *(_DWORD *)v18;
      m_identifier = self->_identifier.m_identifier;
      LOBYTE(v13) = 9;
      LOBYTE(v14) = v17;
      *(_DWORD *)v18 = v9 + 4;
      v15 = v8;
      v16 = 1;
      if (v9 == -2)
        WTF::StringImpl::destroy(v8, v5);
      else
        *(_DWORD *)v8 = v9 + 2;
    }
    else
    {
      m_identifier = self->_identifier.m_identifier;
      LOBYTE(v13) = 9;
      LOBYTE(v14) = v17;
      v15 = 0;
      v16 = 1;
    }
    (*((void (**)(id, unint64_t *, uint64_t, uint64_t))self->_delegateCallback.m_block + 2))(self->_delegateCallback.m_block, &m_identifier, v6, v7);
    if (v16 != -1)
      ((void (*)(char *, uint64_t *))off_1E3232F58[v16])(&v19, &v14);
    v11 = v18;
    v18 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v10);
      else
        *(_DWORD *)v11 -= 2;
    }
  }
  -[WebSpeechRecognizerTaskImpl sendEndIfNeeded](self, "sendEndIfNeeded", a3, m_identifier, v13, v14, v15);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  objc_destroyWeak(&self->_task.m_weakReference);
  m_ptr = self->_request.m_ptr;
  self->_request.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_recognizer.m_ptr;
  self->_recognizer.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  _Block_release(self->_delegateCallback.m_block);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
