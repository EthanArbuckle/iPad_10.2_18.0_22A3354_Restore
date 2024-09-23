@implementation TIKeyboardInputManagerKeyboardContext

- (TIKeyboardInputManagerKeyboardContext)initWithKeyboardState:(id)a3
{
  id v5;
  TIKeyboardInputManagerKeyboardContext *v6;
  TIKeyboardInputManagerKeyboardContext *v7;
  TIKeyboardOutput *v8;
  TIKeyboardOutput *output;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManagerKeyboardContext;
  v6 = -[TIKeyboardInputManagerKeyboardContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentState, a3);
    v8 = (TIKeyboardOutput *)objc_alloc_init(MEMORY[0x1E0DBDC40]);
    output = v7->_output;
    v7->_output = v8;

  }
  return v7;
}

- (void)clearInputForMarkedText
{
  -[TIKeyboardState setInputForMarkedText:](self->_currentState, "setInputForMarkedText:", 0);
  -[TIKeyboardState setSearchStringForMarkedText:](self->_currentState, "setSearchStringForMarkedText:", 0);
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TIKeyboardInputManagerKeyboardContext clearInputForMarkedText](self, "clearInputForMarkedText");
  -[TIKeyboardState documentState](self->_currentState, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentStateAfterInsertingText:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v6);

  -[TIKeyboardInputManagerKeyboardContext revisionHistory](self, "revisionHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertText:", v4);

  -[TIKeyboardInputManagerKeyboardContext output](self, "output");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertText:", v4);

}

- (void)insertTextAfterSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TIKeyboardInputManagerKeyboardContext clearInputForMarkedText](self, "clearInputForMarkedText");
  -[TIKeyboardState documentState](self->_currentState, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentStateAfterInsertingTextAfterSelection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v6);

  -[TIKeyboardInputManagerKeyboardContext output](self, "output");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertTextAfterSelection:", v4);

}

- (void)deleteBackward:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TIKeyboardInputManagerKeyboardContext clearInputForMarkedText](self, "clearInputForMarkedText");
  if (a3)
  {
    v5 = a3;
    do
    {
      -[TIKeyboardState documentState](self->_currentState, "documentState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "documentStateAfterDeletingBackward");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v7);

      -[TIKeyboardInputManagerKeyboardContext revisionHistory](self, "revisionHistory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteBackward");

      --v5;
    }
    while (v5);
  }
  -[TIKeyboardInputManagerKeyboardContext output](self, "output");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteBackward:", a3);

}

- (void)deleteTextBackward:(id)a3
{
  uint64_t v4;
  uint64_t i;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "length");
  for (i = 0; v4; ++i)
    v4 = objc_msgSend(v6, "_rangeOfBackwardDeletionClusterAtIndex:", v4 - 1);
  -[TIKeyboardInputManagerKeyboardContext deleteBackward:](self, "deleteBackward:", i);

}

- (void)deleteForward:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[TIKeyboardInputManagerKeyboardContext clearInputForMarkedText](self, "clearInputForMarkedText");
  if (a3)
  {
    v5 = a3;
    do
    {
      -[TIKeyboardState documentState](self->_currentState, "documentState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "documentStateAfterDeletingForward");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v7);

      --v5;
    }
    while (v5);
  }
  -[TIKeyboardInputManagerKeyboardContext output](self, "output");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteForward:", a3);

}

- (void)unmarkText:(id)a3
{
  TIKeyboardState *currentState;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  currentState = self->_currentState;
  v5 = a3;
  -[TIKeyboardState documentState](currentState, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentStateAfterSettingMarkedText:selectedRange:", v5, objc_msgSend(v5, "length"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v7);

  -[TIKeyboardState documentState](self->_currentState, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentStateAfterUnmarkingText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v9);

  -[TIKeyboardInputManagerKeyboardContext clearInputForMarkedText](self, "clearInputForMarkedText");
  -[TIKeyboardInputManagerKeyboardContext output](self, "output");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextToCommit:", v5);

}

- (void)acceptCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "candidate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "length");
  -[TIKeyboardState documentState](self->_currentState, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentStateAfterSettingMarkedText:selectedRange:", v11, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v7);

  -[TIKeyboardState documentState](self->_currentState, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentStateAfterUnmarkingText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardState setDocumentState:](self->_currentState, "setDocumentState:", v9);

  -[TIKeyboardInputManagerKeyboardContext clearInputForMarkedText](self, "clearInputForMarkedText");
  -[TIKeyboardInputManagerKeyboardContext output](self, "output");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAcceptedCandidate:", v4);

}

- (void)deleteHandwritingStrokes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardInputManagerKeyboardContext output](self, "output");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandwritingStrokesToDelete:", v4);

}

- (TIKeyboardOutput)output
{
  return self->_output;
}

- (TIRevisionHistory)revisionHistory
{
  return self->_revisionHistory;
}

- (void)setRevisionHistory:(id)a3
{
  objc_storeStrong((id *)&self->_revisionHistory, a3);
}

- (TIKeyboardState)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_revisionHistory, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end
