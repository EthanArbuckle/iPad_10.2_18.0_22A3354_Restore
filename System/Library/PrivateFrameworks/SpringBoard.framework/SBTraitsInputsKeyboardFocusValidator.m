@implementation SBTraitsInputsKeyboardFocusValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  objc_super v29;

  v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SBTraitsInputsKeyboardFocusValidator;
  -[SBTraitsInputsValidator validateInputs:withContext:](&v29, sel_validateInputs_withContext_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusContext);
  if (WeakRetained)
  {
    objc_msgSend(v6, "acquiredParticipants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke;
    v27[3] = &unk_1E8EAFA18;
    v11 = WeakRetained;
    v28 = v11;
    objc_msgSend(v9, "bs_firstObjectPassingTest:", v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {

LABEL_5:
      v24 = v6;
      v14 = objc_alloc(MEMORY[0x1E0DC08B0]);
      objc_msgSend(v7, "interfaceIdiomInputs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInterfaceStyleInputs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceOrientationInputs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0DC08C0]);
      objc_msgSend(v12, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithKeyboardFocusedParticipantUniqueIdentifier:", v19);
      objc_msgSend(v7, "ambientPresentationInputs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v14, "initWithInterfaceIdiomInputs:userInterfaceStyleInputs:deviceOrientationInputs:keyboardInputs:ambientPresentationInputs:", v15, v16, v17, v20, v21);

      v7 = (void *)v22;
      v6 = v24;
      goto LABEL_6;
    }
    objc_msgSend(v6, "acquiredParticipants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke_2;
    v25[3] = &unk_1E8EAFA18;
    v26 = v11;
    objc_msgSend(v13, "bs_firstObjectPassingTest:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_5;
  }
LABEL_6:

  return v7;
}

uint64_t __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "participantAssociatedSceneIdentityTokens:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sceneIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __67__SBTraitsInputsKeyboardFocusValidator_validateInputs_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "participantAssociatedWindows:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "_contextId");
          if (v10 == objc_msgSend(*(id *)(a1 + 32), "contextID"))
          {
            v11 = 1;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setFocusContext:(id)a3
{
  objc_storeWeak((id *)&self->_focusContext, a3);
}

- (UIKBArbiterClientFocusContext)focusContext
{
  return (UIKBArbiterClientFocusContext *)objc_loadWeakRetained((id *)&self->_focusContext);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsInputsKeyboardFocusValidator;
  -[SBTraitsInputsValidator description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusContext);
  objc_msgSend(WeakRetained, "sceneIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(", focused scene identity: %@, contextID: %ul"), v7, objc_msgSend(WeakRetained, "contextID"));

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusContext);
}

@end
