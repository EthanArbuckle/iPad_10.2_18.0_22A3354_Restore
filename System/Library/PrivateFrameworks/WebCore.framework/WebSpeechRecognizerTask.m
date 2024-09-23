@implementation WebSpeechRecognizerTask

- (WebSpeechRecognizerTask)initWithIdentifier:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long long>)a3 :(id)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :(BOOL)a5 SpeechRecognitionConnectionClientIdentifierType locale:(BOOL)a6 doMultipleRecognitions:(unint64_t)a7 reportInterimResults:(id)a8 maxAlternatives:delegateCallback:
{
  _BOOL8 v10;
  _BOOL8 v11;
  WebSpeechRecognizerTask *v14;
  WebSpeechRecognizerTaskImpl *v15;
  void *m_ptr;
  objc_super v18;

  v10 = a6;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WebSpeechRecognizerTask;
  v14 = -[WebSpeechRecognizerTask init](&v18, sel_init);
  if (v14)
  {
    v15 = -[WebSpeechRecognizerTaskImpl initWithIdentifier:locale:doMultipleRecognitions:reportInterimResults:maxAlternatives:delegateCallback:]([WebSpeechRecognizerTaskImpl alloc], "initWithIdentifier:locale:doMultipleRecognitions:reportInterimResults:maxAlternatives:delegateCallback:", a3.m_identifier, a4, v11, v10, a7, a8);
    m_ptr = v14->_impl.m_ptr;
    v14->_impl.m_ptr = v15;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v15 = (WebSpeechRecognizerTaskImpl *)v14->_impl.m_ptr;
    }
    if (!v15)
    {

      return 0;
    }
  }
  return v14;
}

- (void)audioSamplesAvailable:(opaqueCMSampleBuffer *)a3
{
  objc_msgSend(self->_impl.m_ptr, "audioSamplesAvailable:", a3);
}

- (void)abort
{
  objc_msgSend(self->_impl.m_ptr, "abort");
}

- (void)stop
{
  objc_msgSend(self->_impl.m_ptr, "stop");
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_impl.m_ptr;
  self->_impl.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
