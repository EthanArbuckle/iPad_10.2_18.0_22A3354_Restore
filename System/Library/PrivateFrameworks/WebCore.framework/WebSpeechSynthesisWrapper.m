@implementation WebSpeechSynthesisWrapper

- (WebSpeechSynthesisWrapper)initWithSpeechSynthesizer:(void *)a3
{
  WebSpeechSynthesisWrapper *v4;
  WebSpeechSynthesisWrapper *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebSpeechSynthesisWrapper;
  v4 = -[WebSpeechSynthesisWrapper init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->m_synthesizerObject = a3;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_availableVoicesDidChange, PAL::get_AVFoundation_AVSpeechSynthesisAvailableVoicesDidChangeNotification((PAL *)v6), 0);
  }
  return v5;
}

- (void)availableVoicesDidChange
{
  (*(void (**)(void *))(*(_QWORD *)self->m_synthesizerObject + 56))(self->m_synthesizerObject);
}

- (float)mapSpeechRateToPlatformRate:(float)a3
{
  void *v4;
  float *v5;
  float v7;
  void *v8;
  float *v9;
  float v10;
  void *v11;
  float *v12;

  v4 = (void *)PAL::AVFoundationLibrary(0);
  v5 = (float *)dlsym(v4, "AVSpeechUtteranceDefaultSpeechRate");
  if (a3 < 1.0)
  {
    if (v5)
      return *v5 * a3;
LABEL_11:
    __break(0xC471u);
    JUMPOUT(0x1947E6F90);
  }
  if (!v5)
  {
    __break(0xC471u);
    JUMPOUT(0x1947E6FB0);
  }
  v7 = *v5;
  v8 = (void *)PAL::AVFoundationLibrary(0);
  v9 = (float *)dlsym(v8, "AVSpeechUtteranceMaximumSpeechRate");
  if (!v9)
  {
    __break(0xC471u);
    JUMPOUT(0x1947E6FD0);
  }
  v10 = *v9;
  v11 = (void *)PAL::AVFoundationLibrary(0);
  v12 = (float *)dlsym(v11, "AVSpeechUtteranceDefaultSpeechRate");
  if (!v12)
    goto LABEL_11;
  return v7 + (float)((float)(a3 + -1.0) * (float)(v10 - *v12));
}

- (void)speakUtterance:(void *)a3
{
  PAL *v5;
  void *v6;
  void *m_ptr;
  uint64_t v8;
  uint64_t v9;
  PAL *v10;
  PAL *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  PAL *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  const void *v23;
  PlatformSpeechSynthesisUtterance *v24;
  PlatformSpeechSynthesisUtterance *v25;
  uint64_t v26;

  if (!*(_QWORD *)a3)
    return;
  v5 = (PAL *)PAL::AVFoundationLibrary((PAL *)1);
  if (!v5)
    return;
  if (!self->m_synthesizer.m_ptr)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)PAL::getAVSpeechSynthesizerClass[0](v5)), "init");
    m_ptr = self->m_synthesizer.m_ptr;
    self->m_synthesizer.m_ptr = v6;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v6 = self->m_synthesizer.m_ptr;
    }
    objc_msgSend(v6, "setDelegate:", self);
  }
  v8 = *(_QWORD *)(*(_QWORD *)a3 + 32);
  if (v8)
  {
    v9 = *(_QWORD *)(v8 + 8);
    if (v9)
    {
      if (*(_DWORD *)(v9 + 4))
      {
        v11 = *(PAL **)(v8 + 24);
        if (v11)
        {
          v11 = (PAL *)WTF::StringImpl::operator NSString *();
          v12 = (const __CFString *)v11;
        }
        else
        {
          v12 = &stru_1E3487BC0;
        }
        goto LABEL_12;
      }
    }
  }
  v10 = *(PAL **)(*(_QWORD *)a3 + 24);
  if (v10 && *((_DWORD *)v10 + 1))
    v11 = (PAL *)WTF::StringImpl::operator NSString *();
  else
    v11 = (PAL *)objc_msgSend((id)PAL::getAVSpeechSynthesisVoiceClass[0](v10), "currentLanguageCode");
  v12 = (const __CFString *)v11;
  if (v8)
  {
LABEL_12:
    v13 = (void *)PAL::getAVSpeechSynthesisVoiceClass[0](v11);
    if (*(_QWORD *)(v8 + 8))
      v14 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v14 = &stru_1E3487BC0;
    v11 = (PAL *)objc_msgSend(v13, "voiceWithIdentifier:", v14);
    v15 = v11;
    if (v11)
      goto LABEL_16;
  }
  v11 = (PAL *)objc_msgSend((id)PAL::getAVSpeechSynthesisVoiceClass[0](v11), "voiceWithLanguage:", v12);
  v15 = v11;
LABEL_16:
  v16 = (void *)PAL::getAVSpeechUtteranceClass[0](v11);
  if (*(_QWORD *)(*(_QWORD *)a3 + 16))
    v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v17 = &stru_1E3487BC0;
  v18 = (void *)objc_msgSend(v16, "speechUtteranceWithString:", v17);
  LODWORD(v19) = *(_DWORD *)(*(_QWORD *)a3 + 44);
  -[WebSpeechSynthesisWrapper mapSpeechRateToPlatformRate:](self, "mapSpeechRateToPlatformRate:", v19);
  objc_msgSend(v18, "setRate:");
  LODWORD(v20) = *(_DWORD *)(*(_QWORD *)a3 + 40);
  objc_msgSend(v18, "setVolume:", v20);
  LODWORD(v21) = *(_DWORD *)(*(_QWORD *)a3 + 48);
  objc_msgSend(v18, "setPitchMultiplier:", v21);
  objc_msgSend(v18, "setVoice:", v15);
  v22 = *(_QWORD *)a3;
  if (v18)
    CFRetain(v18);
  v23 = *(const void **)(v22 + 64);
  *(_QWORD *)(v22 + 64) = v18;
  if (v23)
    CFRelease(v23);
  v24 = *(PlatformSpeechSynthesisUtterance **)a3;
  *(_QWORD *)a3 = 0;
  v25 = self->m_utterance.m_ptr;
  self->m_utterance.m_ptr = v24;
  if (v25)
  {
    WTF::RefCounted<WebCore::PlatformSpeechSynthesisUtterance>::deref((WTF *)v25, (WTF::StringImpl *)v24);
    v24 = self->m_utterance.m_ptr;
  }
  v26 = *((_QWORD *)v24 + 2);
  if (!v26 || !*(_DWORD *)(v26 + 4))
    (***((void (****)(_QWORD))self->m_synthesizerObject + 5))(*((_QWORD *)self->m_synthesizerObject + 5));
  objc_msgSend(self->m_synthesizer.m_ptr, "speakUtterance:", v18);
}

- (void)pause
{
  if (self->m_utterance.m_ptr)
    objc_msgSend(self->m_synthesizer.m_ptr, "pauseSpeakingAtBoundary:", 0);
}

- (void)resume
{
  if (self->m_utterance.m_ptr)
    objc_msgSend(self->m_synthesizer.m_ptr, "continueSpeaking");
}

- (void)resetState
{
  WTF::StringImpl *v3;
  PlatformSpeechSynthesisUtterance *m_ptr;

  -[WebSpeechSynthesisWrapper cancel](self, "cancel");
  m_ptr = self->m_utterance.m_ptr;
  self->m_utterance.m_ptr = 0;
  if (m_ptr)
    WTF::RefCounted<WebCore::PlatformSpeechSynthesisUtterance>::deref((WTF *)m_ptr, v3);
}

- (void)cancel
{
  if (self->m_utterance.m_ptr)
    objc_msgSend(self->m_synthesizer.m_ptr, "stopSpeakingAtBoundary:", 0);
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  PlatformSpeechSynthesisUtterance *m_ptr;

  m_ptr = self->m_utterance.m_ptr;
  if (m_ptr)
  {
    if (*((id *)m_ptr + 8) == a4)
      (***((void (****)(_QWORD))self->m_synthesizerObject + 5))(*((_QWORD *)self->m_synthesizerObject + 5));
  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  PlatformSpeechSynthesisUtterance *m_ptr;
  WTF::StringImpl *v6;

  m_ptr = self->m_utterance.m_ptr;
  if (m_ptr)
  {
    if (*((id *)m_ptr + 8) == a4)
    {
      ++*(_DWORD *)m_ptr;
      self->m_utterance.m_ptr = 0;
      WTF::RefCounted<WebCore::PlatformSpeechSynthesisUtterance>::deref((WTF *)m_ptr, (WTF::StringImpl *)a2);
      (*(void (**)(_QWORD, PlatformSpeechSynthesisUtterance *))(**((_QWORD **)self->m_synthesizerObject + 5)
                                                                         + 8))(*((_QWORD *)self->m_synthesizerObject + 5), m_ptr);
      WTF::RefCounted<WebCore::PlatformSpeechSynthesisUtterance>::deref((WTF *)m_ptr, v6);
    }
  }
}

- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4
{
  PlatformSpeechSynthesisUtterance *m_ptr;

  m_ptr = self->m_utterance.m_ptr;
  if (m_ptr)
  {
    if (*((id *)m_ptr + 8) == a4)
      (*(void (**)(_QWORD))(**((_QWORD **)self->m_synthesizerObject + 5) + 16))(*((_QWORD *)self->m_synthesizerObject
                                                                                             + 5));
  }
}

- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4
{
  PlatformSpeechSynthesisUtterance *m_ptr;

  m_ptr = self->m_utterance.m_ptr;
  if (m_ptr)
  {
    if (*((id *)m_ptr + 8) == a4)
      (*(void (**)(_QWORD))(**((_QWORD **)self->m_synthesizerObject + 5) + 24))(*((_QWORD *)self->m_synthesizerObject
                                                                                             + 5));
  }
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  PlatformSpeechSynthesisUtterance *m_ptr;
  WTF::StringImpl *v6;

  m_ptr = self->m_utterance.m_ptr;
  if (m_ptr)
  {
    if (*((id *)m_ptr + 8) == a4)
    {
      ++*(_DWORD *)m_ptr;
      self->m_utterance.m_ptr = 0;
      WTF::RefCounted<WebCore::PlatformSpeechSynthesisUtterance>::deref((WTF *)m_ptr, (WTF::StringImpl *)a2);
      (*(void (**)(_QWORD, PlatformSpeechSynthesisUtterance *))(**((_QWORD **)self->m_synthesizerObject + 5)
                                                                         + 8))(*((_QWORD *)self->m_synthesizerObject + 5), m_ptr);
      WTF::RefCounted<WebCore::PlatformSpeechSynthesisUtterance>::deref((WTF *)m_ptr, v6);
    }
  }
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 utterance:(id)a5
{
  PlatformSpeechSynthesisUtterance *m_ptr;

  m_ptr = self->m_utterance.m_ptr;
  if (m_ptr)
  {
    if (*((id *)m_ptr + 8) == a5)
      (*(void (**)(_QWORD))(**((_QWORD **)self->m_synthesizerObject + 5) + 40))(*((_QWORD *)self->m_synthesizerObject
                                                                                             + 5));
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  PlatformSpeechSynthesisUtterance *v4;

  m_ptr = self->m_synthesizer.m_ptr;
  self->m_synthesizer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->m_utterance.m_ptr;
  self->m_utterance.m_ptr = 0;
  if (v4)
    WTF::RefCounted<WebCore::PlatformSpeechSynthesisUtterance>::deref((WTF *)v4, (WTF::StringImpl *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
