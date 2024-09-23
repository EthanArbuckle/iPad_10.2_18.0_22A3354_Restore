@implementation TIDPNgramRecorderRandom

- (TIDPNgramRecorderRandom)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5
{
  TIDPNgramRecorderRandom *v6;
  TIDPNgramRecorderRandom *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIDPNgramRecorderRandom;
  v6 = -[TIDPRecorder initWithTypingSession:aligned:](&v10, sel_initWithTypingSession_aligned_, a3, a4);
  v7 = v6;
  if (v6)
  {
    if (a5)
      v8 = a5;
    else
      v8 = 5;
    -[TIDPNgramRecorderCascading setN:](v6, "setN:", v8);
  }
  return v7;
}

- (BOOL)report
{
  uint32_t v3;
  uint64_t v4;
  TIDPNgramRecorder *v5;
  uint64_t v6;
  void *v7;
  TIDPNgramRecorder *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = arc4random_uniform(-[TIDPNgramRecorderCascading n](self, "n") + 1);
  if (v3 <= 2)
    v4 = 2;
  else
    v4 = v3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315394;
    v14 = "-[TIDPNgramRecorderRandom report]";
    v15 = 2048;
    v16 = v4;
    _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Using random n value: %lu", (uint8_t *)&v13, 0x16u);
  }
  v5 = [TIDPNgramRecorder alloc];
  -[TIDPRecorder typingSession](self, "typingSession");
  v6 = objc_claimAutoreleasedReturnValue();
  -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIDPNgramRecorder initWithTypingSession:aligned:n:shouldDonateNgramSampleRandomly:](v5, "initWithTypingSession:aligned:n:shouldDonateNgramSampleRandomly:", v6, v7, v4, 1);

  -[TIDPRecorder delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("TIDPReporterMock"));
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
  {
    -[TIDPRecorder delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIDPRecorder setDelegate:](v8, "setDelegate:", v10);

  }
  v11 = -[TIDPNgramRecorder report](v8, "report");

  return v11;
}

@end
