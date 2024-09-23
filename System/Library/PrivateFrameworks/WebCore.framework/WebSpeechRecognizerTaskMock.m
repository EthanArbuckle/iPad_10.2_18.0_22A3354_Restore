@implementation WebSpeechRecognizerTaskMock

- (WebSpeechRecognizerTaskMock)initWithIdentifier:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long long>)a3 :(id)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :(BOOL)a5 SpeechRecognitionConnectionClientIdentifierType locale:(BOOL)a6 doMultipleRecognitions:(unint64_t)a7 reportInterimResults:(id)a8 maxAlternatives:delegateCallback:
{
  WebSpeechRecognizerTaskMock *v11;
  WebSpeechRecognizerTaskMock *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WebSpeechRecognizerTaskMock;
  v11 = -[WebSpeechRecognizerTaskMock init](&v15, sel_init, a3.m_identifier, a4, a5, a6, a7);
  v12 = v11;
  if (v11)
  {
    v11->_doMultipleRecognitions = a5;
    v11->_identifier = a3;
    v13 = _Block_copy(a8);
    _Block_release(v12->_delegateCallback.m_block);
    v12->_delegateCallback.m_block = v13;
    _Block_release(0);
    v12->_completed = 0;
    v12->_hasSentSpeechStart = 0;
    v12->_hasSentSpeechEnd = 0;
  }
  return v12;
}

- (void)audioSamplesAvailable:(opaqueCMSampleBuffer *)a3
{
  WTF::StringImpl *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  WTF::StringImpl **v8;
  WTF::StringImpl *v9;
  WTF *v10;
  WTF *v11;
  uint64_t v12;
  WTF::StringImpl **v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  WTF *v16;
  WTF::StringImpl **v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  WTF *v20;
  WTF *v21;
  int v22;
  unsigned int v23;
  WTF::StringImpl *m_identifier;
  char v25;
  _BYTE v26[16];
  int v27;
  uint64_t *v28[2];
  int v29;
  char v30;
  WTF::StringImpl **v31;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_hasSentSpeechStart)
  {
    self->_hasSentSpeechStart = 1;
    m_identifier = (WTF::StringImpl *)self->_identifier.m_identifier;
    v25 = 3;
    v26[0] = 0;
    v27 = 0;
    (*((void (**)(void))self->_delegateCallback.m_block + 2))();
    ((void (*)(uint64_t **, _BYTE *))_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8sn180100IOZNS0_6__dtorINS0_8__traitsIJNS_9monostateEN7WebCore22SpeechRecognitionErrorEN3WTF6VectorINS9_27SpeechRecognitionResultDataELm0ENSB_15CrashOnOverflowELm16ENSB_10FastMallocEEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRNS0_6__baseILSI_1EJS8_SA_SG_EEEEEEDcSK_DpT0_)(v28, v26);
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = m_identifier;
  v5 = self->_identifier.m_identifier;
  v31 = 0;
  v32 = 0;
  v6 = WTF::fastMalloc((WTF *)0x10);
  LODWORD(v32) = 1;
  v31 = (WTF::StringImpl **)v6;
  v7 = HIDWORD(v32);
  v8 = (WTF::StringImpl **)(v6 + 16 * HIDWORD(v32));
  if (m_identifier)
    *(_DWORD *)m_identifier += 2;
  *v8 = v4;
  v8[1] = (WTF::StringImpl *)0x3FF0000000000000;
  HIDWORD(v32) = v7 + 1;
  v33 = 1;
  WTF::Vector<WebCore::SpeechRecognitionResultData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)&v21, (uint64_t *)&v31, 1uLL);
  WTF::Vector<WebCore::SpeechRecognitionResultData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v28, (uint64_t **)&v21);
  v29 = 2;
  m_identifier = (WTF::StringImpl *)v5;
  v25 = 7;
  v26[0] = 0;
  v27 = -1;
  WTF::Vector<WebCore::SpeechRecognitionResultData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v26, v28);
  v27 = 2;
  if (v29 != -1)
    ((void (*)(char *, uint64_t **))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJNS_9monostateEN7WebCore22SpeechRecognitionErrorEN3WTF6VectorINS7_27SpeechRecognitionResultDataELm0ENS9_15CrashOnOverflowELm16ENS9_10FastMallocEEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRSH_EEEDcOSI_DpOT0____fmatrix[v29])(&v30, v28);
  (*((void (**)(void))self->_delegateCallback.m_block + 2))();
  if (v27 != -1)
    ((void (*)(uint64_t **, _BYTE *))off_1E3232F58[v27])(v28, v26);
  v27 = -1;
  v10 = v21;
  if (v23)
  {
    v11 = (WTF *)((char *)v21 + 24 * v23);
    do
    {
      v12 = *((unsigned int *)v10 + 3);
      if ((_DWORD)v12)
      {
        v13 = *(WTF::StringImpl ***)v10;
        v14 = 16 * v12;
        do
        {
          v15 = *v13;
          *v13 = 0;
          if (v15)
          {
            if (*(_DWORD *)v15 == 2)
              WTF::StringImpl::destroy(v15, v9);
            else
              *(_DWORD *)v15 -= 2;
          }
          v13 += 2;
          v14 -= 16;
        }
        while (v14);
      }
      v16 = *(WTF **)v10;
      if (*(_QWORD *)v10)
      {
        *(_QWORD *)v10 = 0;
        *((_DWORD *)v10 + 2) = 0;
        WTF::fastFree(v16, v9);
      }
      v10 = (WTF *)((char *)v10 + 24);
    }
    while (v10 != v11);
    v10 = v21;
  }
  if (v10)
  {
    v21 = 0;
    v22 = 0;
    WTF::fastFree(v10, v9);
  }
  if (HIDWORD(v32))
  {
    v17 = v31;
    v18 = 16 * HIDWORD(v32);
    do
    {
      v19 = *v17;
      *v17 = 0;
      if (v19)
      {
        if (*(_DWORD *)v19 == 2)
          WTF::StringImpl::destroy(v19, v9);
        else
          *(_DWORD *)v19 -= 2;
      }
      v17 += 2;
      v18 -= 16;
    }
    while (v18);
  }
  v20 = (WTF *)v31;
  if (v31)
  {
    v31 = 0;
    LODWORD(v32) = 0;
    WTF::fastFree(v20, v9);
  }
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v9);
    else
      *(_DWORD *)v4 -= 2;
  }
  if (!self->_doMultipleRecognitions)
    -[WebSpeechRecognizerTaskMock abort](self, "abort");
}

- (void)abort
{
  uint64_t v2;
  unint64_t m_identifier;
  char v5;
  _BYTE v6[16];
  int v7;
  char v8;

  if (!self->_completed)
  {
    self->_completed = 1;
    if (!self->_hasSentSpeechEnd && self->_hasSentSpeechStart)
    {
      self->_hasSentSpeechEnd = 1;
      m_identifier = self->_identifier.m_identifier;
      v5 = 4;
      v6[0] = 0;
      v7 = 0;
      (*((void (**)(id, unint64_t *))self->_delegateCallback.m_block + 2))(self->_delegateCallback.m_block, &m_identifier);
      if (v7 != -1)
        ((void (*)(char *, _BYTE *))off_1E3232F58[v7])(&v8, v6);
    }
    m_identifier = self->_identifier.m_identifier;
    v5 = 10;
    v6[0] = 0;
    v7 = 0;
    (*((void (**)(id, unint64_t *, uint64_t))self->_delegateCallback.m_block + 2))(self->_delegateCallback.m_block, &m_identifier, v2);
    if (v7 != -1)
      ((void (*)(char *, _BYTE *))off_1E3232F58[v7])(&v8, v6);
  }
}

- (void).cxx_destruct
{
  _Block_release(self->_delegateCallback.m_block);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
