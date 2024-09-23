@implementation RTIInputSystemSession

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_extraSessionDelegates, 0);
  objc_storeStrong((id *)&self->_textOperations, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong((id *)&self->_beginOptions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setDocumentTraits:(id)a3
{
  objc_storeStrong((id *)&self->_documentTraits, a3);
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
}

- (void)setBeginOptions:(id)a3
{
  objc_storeStrong((id *)&self->_beginOptions, a3);
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)enumerateSessionDelegatesUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    -[RTIInputSystemSession sessionDelegate](self, "sessionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[RTIInputSystemSession sessionDelegate](self, "sessionDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6);

    }
    v7 = (void *)-[NSHashTable copy](self->_extraSessionDelegates, "copy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          v4[2](v4, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (RTIInputSystemSessionDelegate)sessionDelegate
{
  return (RTIInputSystemSessionDelegate *)objc_loadWeakRetained((id *)&self->_sessionDelegate);
}

- (void)setSessionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sessionDelegate, a3);
}

- (void)_createTextOperationsIfNecessary
{
  RTITextOperations *v3;
  RTITextOperations *v4;
  RTITextOperations *textOperations;
  id v6;

  if (!self->_textOperations)
  {
    v3 = [RTITextOperations alloc];
    -[RTIInputSystemSession uuid](self, "uuid");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[RTITextOperations initWithTargetSessionUUID:](v3, "initWithTargetSessionUUID:", v6);
    textOperations = self->_textOperations;
    self->_textOperations = v4;

  }
}

- (RTITextOperations)textOperations
{
  -[RTIInputSystemSession _createTextOperationsIfNecessary](self, "_createTextOperationsIfNecessary");
  return self->_textOperations;
}

- (RTITextOperations)_textOperations
{
  return self->_textOperations;
}

- (void)_applyLocalTextOperations:(id)a3 toDocumentState:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;

  v48 = a3;
  v5 = a4;
  objc_msgSend(v48, "textToAssert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DBDB78]);
    objc_msgSend(v48, "textToAssert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v8, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    objc_msgSend(v5, "setDocumentState:", v9);

  }
  if (objc_msgSend(v48, "selectionRangeToAssert") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = objc_msgSend(v48, "selectionRangeToAssert");
    objc_msgSend(v5, "setSelectedTextRange:", v10, v11);
  }
  objc_msgSend(v48, "keyboardOutput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unmarkIfNecessary");
  objc_msgSend(v12, "textToCommit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "acceptedCandidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "input");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    objc_msgSend(v5, "documentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "input");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "candidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "documentStateAfterReplacingText:withText:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocumentState:", v21);

  }
  else
  {
    if (!v15)
      goto LABEL_10;
    objc_msgSend(v5, "documentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "candidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "documentStateAfterInsertingText:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocumentState:", v20);
  }

LABEL_10:
  if (v14)
  {
    objc_msgSend(v5, "documentState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "documentStateAfterSettingMarkedText:selectedRange:", v14, objc_msgSend(v14, "length"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocumentState:", v23);

LABEL_13:
    objc_msgSend(v5, "documentState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "documentStateAfterUnmarkingText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocumentState:", v25);

    goto LABEL_14;
  }
  if (v13)
    goto LABEL_13;
LABEL_14:
  if (objc_msgSend(v12, "forwardDeletionCount") && objc_msgSend(v12, "forwardDeletionCount"))
  {
    v26 = 0;
    do
    {
      objc_msgSend(v5, "documentState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "documentStateAfterDeletingForward");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDocumentState:", v28);

      ++v26;
    }
    while (v26 < objc_msgSend(v12, "forwardDeletionCount"));
  }
  objc_msgSend(v12, "insertionTextAfterSelection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v5, "documentState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertionTextAfterSelection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "documentStateAfterInsertingTextAfterSelection:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocumentState:", v32);

  }
  if (objc_msgSend(v12, "deletionCount") && objc_msgSend(v12, "deletionCount"))
  {
    v33 = 0;
    do
    {
      objc_msgSend(v5, "documentState");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "documentStateAfterDeletingBackward");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDocumentState:", v35);

      ++v33;
    }
    while (v33 < objc_msgSend(v12, "deletionCount"));
  }
  objc_msgSend(v12, "insertionText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  if (v37)
  {
    objc_msgSend(v5, "documentState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertionText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "documentStateAfterInsertingText:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocumentState:", v40);

  }
  objc_msgSend(v48, "intermediateText");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v48, "intermediateText");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentState");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "displayString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v42, "selectedRange");
    objc_msgSend(v43, "documentStateAfterSettingMarkedText:selectedRange:", v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocumentState:", v47);

  }
}

- (void)addSessionDelegate:(id)a3
{
  id v4;
  NSHashTable *extraSessionDelegates;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  extraSessionDelegates = self->_extraSessionDelegates;
  v8 = v4;
  if (!extraSessionDelegates)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_extraSessionDelegates;
    self->_extraSessionDelegates = v6;

    v4 = v8;
    extraSessionDelegates = self->_extraSessionDelegates;
  }
  -[NSHashTable addObject:](extraSessionDelegates, "addObject:", v4);

}

- (void)removeSessionDelegate:(id)a3
{
  -[NSHashTable removeObject:](self->_extraSessionDelegates, "removeObject:", a3);
}

- (RTISessionOptions)beginOptions
{
  return self->_beginOptions;
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setTextOperations:(id)a3
{
  objc_storeStrong((id *)&self->_textOperations, a3);
}

- (NSHashTable)extraSessionDelegates
{
  return self->_extraSessionDelegates;
}

- (void)setExtraSessionDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_extraSessionDelegates, a3);
}

@end
