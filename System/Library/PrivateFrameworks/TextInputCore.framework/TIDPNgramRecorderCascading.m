@implementation TIDPNgramRecorderCascading

- (TIDPNgramRecorderCascading)initWithTypingSession:(id)a3 aligned:(id)a4 n:(unint64_t)a5
{
  TIDPNgramRecorderCascading *v6;
  TIDPNgramRecorderCascading *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIDPNgramRecorderCascading;
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
  unint64_t v3;
  unint64_t v4;
  TIDPNgramRecorder *v5;
  TIDPNgramRecorder *v6;
  TIDPNgramRecorder *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = -[TIDPNgramRecorderCascading n](self, "n");
  if (v3 >= 2)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      v6 = v5;
      v7 = [TIDPNgramRecorder alloc];
      -[TIDPRecorder typingSession](self, "typingSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIDPRecorder typingSessionAligned](self, "typingSessionAligned");
      v9 = objc_claimAutoreleasedReturnValue();
      v5 = -[TIDPNgramRecorderCascading initWithTypingSession:aligned:n:](v7, "initWithTypingSession:aligned:n:", v8, v9, v4);

      -[TIDPRecorder delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("TIDPReporterMock"));
      LOBYTE(v9) = objc_opt_isKindOfClass();

      if ((v9 & 1) != 0)
      {
        -[TIDPRecorder delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIDPRecorder setDelegate:](v5, "setDelegate:", v11);

      }
      -[TIDPNgramRecorder report](v5, "report");
      --v4;
    }
    while (v4 > 1);

  }
  return 0;
}

- (unint64_t)n
{
  return self->_n;
}

- (void)setN:(unint64_t)a3
{
  self->_n = a3;
}

@end
