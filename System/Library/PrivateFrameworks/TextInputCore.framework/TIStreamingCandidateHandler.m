@implementation TIStreamingCandidateHandler

- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateHandler:(id)a8
{
  return -[TIStreamingCandidateHandler initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateHandler:candidateResultSetHandler:](self, "initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateHandler:candidateResultSetHandler:", a3, a4, a5, a6, a7, a8, 0);
}

- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateResultSetHandler:(id)a8
{
  return -[TIStreamingCandidateHandler initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateHandler:candidateResultSetHandler:](self, "initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateHandler:candidateResultSetHandler:", a3, a4, a5, a6, a7, 0, a8);
}

- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateHandler:(id)a8 candidateResultSetHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TIStreamingCandidateHandler *v21;
  TIStreamingCandidateHandler *v22;
  uint64_t v23;
  id candidateHandler;
  uint64_t v25;
  id candidateResultSetHandler;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)TIStreamingCandidateHandler;
  v21 = -[TIStreamingCandidateHandler init](&v30, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_clientProxy, a3);
    objc_storeStrong((id *)&v22->_keyboardState, a4);
    objc_storeStrong((id *)&v22->_requestToken, a5);
    objc_storeWeak((id *)&v22->_logger, v17);
    objc_storeWeak((id *)&v22->_inputManager, v18);
    v23 = objc_msgSend(v19, "copy", v28, v29);
    candidateHandler = v22->_candidateHandler;
    v22->_candidateHandler = (id)v23;

    v25 = objc_msgSend(v20, "copy");
    candidateResultSetHandler = v22->_candidateResultSetHandler;
    v22->_candidateResultSetHandler = (id)v25;

    v22->_status = 0;
  }

  return v22;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TIStreamingCandidateHandler;
  -[TIStreamingCandidateHandler dealloc](&v2, sel_dealloc);
}

- (BOOL)asynchronous
{
  return 1;
}

- (void)open
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (!self->_status)
  {
    self->_status = 1;
    kdebug_trace();
    kac_get_log();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, (const void *)((unint64_t)self ^ 2));
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "kbdManager.generateAutocorrections.async", ", v6, 2u);
      }
    }

  }
}

- (void)pushCandidates:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;

  v15 = a3;
  if (self->_status == 1)
  {
    -[TIStreamingCandidateHandler candidateHandler](self, "candidateHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TIStreamingCandidateHandler candidateResultSetHandler](self, "candidateResultSetHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        if (self->_didCallHandler)
        {
          -[TIStreamingCandidateHandler clientProxy](self, "clientProxy");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIStreamingCandidateHandler requestToken](self, "requestToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "pushCandidates:requestToken:", v15, v8);

          -[TIStreamingCandidateHandler logger](self, "logger");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIStreamingCandidateHandler keyboardState](self, "keyboardState");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIStreamingCandidateHandler requestToken](self, "requestToken");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "logAutocorrections:trace:forKeyboardState:requestToken:", v15, 0, v10, v11);

          WeakRetained = objc_loadWeakRetained((id *)&self->_inputManager);
          if (WeakRetained)
          {
            v13 = objc_loadWeakRetained((id *)&self->_inputManager);
            objc_msgSend(v13, "candidatesOfferedFeedback:keyboardState:", v15, self->_keyboardState);

          }
        }
        else
        {
          -[TIStreamingCandidateHandler candidateHandler](self, "candidateHandler");
          v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v14)[2](v14, v15);

          self->_didCallHandler = 1;
        }
      }
    }
  }

}

- (void)pushCandidateResultSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;

  v4 = a3;
  if (self->_status == 1)
  {
    v13 = v4;
    -[TIStreamingCandidateHandler candidateResultSetHandler](self, "candidateResultSetHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v13;
    if (v5)
    {
      -[TIStreamingCandidateHandler candidateHandler](self, "candidateHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v13;
      if (!v6)
      {
        if (self->_didCallHandler)
        {
          -[TIStreamingCandidateHandler clientProxy](self, "clientProxy");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIStreamingCandidateHandler requestToken](self, "requestToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "pushCandidateResultSet:requestToken:", v13, v8);

          -[TIStreamingCandidateHandler logger](self, "logger");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIStreamingCandidateHandler keyboardState](self, "keyboardState");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIStreamingCandidateHandler requestToken](self, "requestToken");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "logCandidateResultSet:trace:forKeyboardState:requestToken:", v13, 0, v10, v11);

          v4 = v13;
        }
        else
        {
          -[TIStreamingCandidateHandler candidateResultSetHandler](self, "candidateResultSetHandler");
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v12)[2](v12, v13);

          v4 = v13;
          self->_didCallHandler = 1;
        }
      }
    }
  }

}

- (void)close
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  uint8_t v13[16];

  if (self->_status != 2)
  {
    self->_status = 2;
    kdebug_trace();
    kac_get_log();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, (const void *)((unint64_t)self ^ 2));
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v3, OS_SIGNPOST_INTERVAL_END, v5, "kbdManager.generateAutocorrections.async", ", v13, 2u);
      }
    }

    if (!self->_didCallHandler)
    {
      -[TIStreamingCandidateHandler candidateHandler](self, "candidateHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", 0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIStreamingCandidateHandler candidateHandler](self, "candidateHandler");
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v8)[2](v8, v7);

      }
      -[TIStreamingCandidateHandler candidateResultSetHandler](self, "candidateResultSetHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[TIStreamingCandidateHandler candidateResultSetHandler](self, "candidateResultSetHandler");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0);

      }
      self->_didCallHandler = 1;
    }
    -[TIStreamingCandidateHandler clientProxy](self, "clientProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIStreamingCandidateHandler requestToken](self, "requestToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "closeRequestToken:", v12);

  }
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (TIClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (id)candidateHandler
{
  return self->_candidateHandler;
}

- (id)candidateResultSetHandler
{
  return self->_candidateResultSetHandler;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (TIKeyboardInputManagerLogging)logger
{
  return (TIKeyboardInputManagerLogging *)objc_loadWeakRetained((id *)&self->_logger);
}

- (void)setLogger:(id)a3
{
  objc_storeWeak((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logger);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong(&self->_candidateResultSetHandler, 0);
  objc_storeStrong(&self->_candidateHandler, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_destroyWeak((id *)&self->_inputManager);
}

@end
