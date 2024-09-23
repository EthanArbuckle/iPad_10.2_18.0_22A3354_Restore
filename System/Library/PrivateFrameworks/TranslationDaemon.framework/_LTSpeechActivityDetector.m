@implementation _LTSpeechActivityDetector

- (_LTSpeechActivityDetector)initWithDelegate:(id)a3
{
  id v4;
  _LTSpeechActivityDetector *v5;
  _LTSpeechActivityDetector *v6;
  id v7;
  void *v8;
  uint64_t v9;
  SNAudioStreamAnalyzer *streamAnalyzer;
  id v11;
  void *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  _LTSpeechActivityDetector *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSpeechActivityDetector;
  v5 = -[_LTSpeechActivityDetector init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_alloc(MEMORY[0x24BDE9AD8]);
    -[_LTSpeechActivityDetector nativeAudioFormat](v6, "nativeAudioFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFormat:", v8);
    streamAnalyzer = v6->_streamAnalyzer;
    v6->_streamAnalyzer = (SNAudioStreamAnalyzer *)v9;

    v11 = objc_alloc(MEMORY[0x24BDE9B18]);
    v12 = (void *)objc_msgSend(v11, "initWithSoundIdentifier:", *MEMORY[0x24BDE9BA0]);
    -[SNAudioStreamAnalyzer addRequest:withObserver:error:](v6->_streamAnalyzer, "addRequest:withObserver:error:", v12, v6, 0);
    v13 = dispatch_queue_create("com.apple.translation.AnalysisQueue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v15 = v6;
  }

  return v6;
}

- (id)nativeAudioFormat
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithStreamDescription:", &SupportedASBD);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  _LTSpeechActivityDetector *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48___LTSpeechActivityDetector_addSpeechAudioData___block_invoke;
  v7[3] = &unk_251A13990;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  if (objc_msgSend(a4, "detected", a3))
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "speechActivityDetected");

    }
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  v5 = _LTOSLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_LTSpeechActivityDetector request:didFailWithError:].cold.1((uint64_t)v4, v5);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)request:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2491B9000, a2, OS_LOG_TYPE_ERROR, "SNAudioStreamAnalyzer failure: %@", (uint8_t *)&v2, 0xCu);
}

@end
