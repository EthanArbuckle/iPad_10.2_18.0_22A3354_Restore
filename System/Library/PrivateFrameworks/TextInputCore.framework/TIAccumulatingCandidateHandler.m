@implementation TIAccumulatingCandidateHandler

- (TIAccumulatingCandidateHandler)initWithHandlerBlock:(id)a3
{
  return -[TIAccumulatingCandidateHandler initWithWrappedCandidateHandler:handlerBlock:resultSetHandlerBlock:](self, "initWithWrappedCandidateHandler:handlerBlock:resultSetHandlerBlock:", 0, a3, 0);
}

- (TIAccumulatingCandidateHandler)initWithResultSetHandlerBlock:(id)a3
{
  return -[TIAccumulatingCandidateHandler initWithWrappedCandidateHandler:handlerBlock:resultSetHandlerBlock:](self, "initWithWrappedCandidateHandler:handlerBlock:resultSetHandlerBlock:", 0, 0, a3);
}

- (TIAccumulatingCandidateHandler)initWithWrappedCandidateHandler:(id)a3 resultSetHandlerBlock:(id)a4
{
  return -[TIAccumulatingCandidateHandler initWithWrappedCandidateHandler:handlerBlock:resultSetHandlerBlock:](self, "initWithWrappedCandidateHandler:handlerBlock:resultSetHandlerBlock:", a3, 0, a4);
}

- (TIAccumulatingCandidateHandler)initWithWrappedCandidateHandler:(id)a3 handlerBlock:(id)a4 resultSetHandlerBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  TIAccumulatingCandidateHandler *v12;
  TIAccumulatingCandidateHandler *v13;
  uint64_t v14;
  id candidateHandler;
  uint64_t v16;
  id candidateResultSetHandler;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TIAccumulatingCandidateHandler;
  v12 = -[TIAccumulatingCandidateHandler init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wrappedCandidateHandler, a3);
    v14 = objc_msgSend(v10, "copy");
    candidateHandler = v13->_candidateHandler;
    v13->_candidateHandler = (id)v14;

    v16 = objc_msgSend(v11, "copy");
    candidateResultSetHandler = v13->_candidateResultSetHandler;
    v13->_candidateResultSetHandler = (id)v16;

    v13->_status = 0;
  }

  return v13;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TIAccumulatingCandidateHandler;
  -[TIAccumulatingCandidateHandler dealloc](&v2, sel_dealloc);
}

- (BOOL)asynchronous
{
  return 0;
}

- (void)open
{
  self->_status = 1;
}

- (void)close
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;

  if (self->_status != 2)
  {
    self->_status = 2;
    -[TIAccumulatingCandidateHandler candidateHandler](self, "candidateHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[TIAccumulatingCandidateHandler candidateHandler](self, "candidateHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[TIAccumulatingCandidateHandler candidates](self, "candidates");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        ((void (**)(_QWORD, void *))v4)[2](v4, v5);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", 0, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v4)[2](v4, v6);

      }
    }
    -[TIAccumulatingCandidateHandler candidateResultSetHandler](self, "candidateResultSetHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[TIAccumulatingCandidateHandler candidateResultSetHandler](self, "candidateResultSetHandler");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[TIAccumulatingCandidateHandler candidateResultSet](self, "candidateResultSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v9);

    }
    -[TICandidateHandler close](self->_wrappedCandidateHandler, "close");
  }
}

- (TICandidateRequestToken)requestToken
{
  return 0;
}

- (TICandidateHandler)wrappedCandidateHandler
{
  return self->_wrappedCandidateHandler;
}

- (id)candidateHandler
{
  return self->_candidateHandler;
}

- (id)candidateResultSetHandler
{
  return self->_candidateResultSetHandler;
}

- (TIAutocorrectionList)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidateResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_candidateResultSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong(&self->_candidateResultSetHandler, 0);
  objc_storeStrong(&self->_candidateHandler, 0);
  objc_storeStrong((id *)&self->_wrappedCandidateHandler, 0);
}

@end
