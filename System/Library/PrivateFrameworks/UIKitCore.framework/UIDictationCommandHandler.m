@implementation UIDictationCommandHandler

- (void)registerCommandIdentifiers:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  SRCSCommandRecognitionSystem *v10;
  SRCSCommandRecognitionSystem *cmdRecSystem;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  SRCSCommandRecognizer *v22;
  SRCSCommandRecognizer *cmdRecognizer;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v8 = (void *)qword_1ECD7C998;
  v36 = qword_1ECD7C998;
  if (!qword_1ECD7C998)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __getSRCSCommandRecognitionSystemClass_block_invoke;
    v31 = &unk_1E16B14C0;
    v32 = &v33;
    __getSRCSCommandRecognitionSystemClass_block_invoke((uint64_t)&v28);
    v8 = (void *)v34[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v33, 8);
  v10 = (SRCSCommandRecognitionSystem *)objc_msgSend([v9 alloc], "initWithLocaleIdentifier:", v7);
  cmdRecSystem = self->_cmdRecSystem;
  self->_cmdRecSystem = v10;

  v12 = (void *)objc_msgSend(objc_alloc((Class)getSRCSCommandStringsTableClass()), "initWithLocaleIdentifier:", v7);
  objc_msgSend(v12, "supportedCommandIdentifiersForTargetTypes:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsObject:", v19, (_QWORD)v24))
          objc_msgSend(v14, "addObject:", v19);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v14, "count"))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v20 = (void *)qword_1ECD7C9A0;
    v36 = qword_1ECD7C9A0;
    if (!qword_1ECD7C9A0)
    {
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __getSRCSCommandRecognizerClass_block_invoke;
      v31 = &unk_1E16B14C0;
      v32 = &v33;
      __getSRCSCommandRecognizerClass_block_invoke((uint64_t)&v28);
      v20 = (void *)v34[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v33, 8);
    v22 = (SRCSCommandRecognizer *)objc_msgSend([v21 alloc], "initWithCommandRecognitionSystem:commandIdentifiers:", self->_cmdRecSystem, v14);
    cmdRecognizer = self->_cmdRecognizer;
    self->_cmdRecognizer = v22;

  }
}

- (void)recognizeCommandWithPhrases:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(id, void *, void *, void *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = (void (**)(id, void *, void *, void *))a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  -[SRCSCommandRecognitionSystem spokenCommandFromRecognizedAFSpeechPhrases:](self->_cmdRecSystem, "spokenCommandFromRecognizedAFSpeechPhrases:", v6);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np() == 1)
  {
    objc_msgSend((id)v15[5], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15[5], "strings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15[5], "recognizedParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, v9, v10);

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__UIDictationCommandHandler_recognizeCommandWithPhrases_completionHandler___block_invoke;
    v11[3] = &unk_1E16B1E40;
    v12 = v7;
    v13 = &v14;
    dispatch_sync(MEMORY[0x1E0C80D38], v11);
    v8 = v12;
  }

  _Block_object_dispose(&v14, 8);
}

void __75__UIDictationCommandHandler_recognizeCommandWithPhrases_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "strings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "recognizedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

- (SRCSCommandRecognitionSystem)cmdRecSystem
{
  return self->_cmdRecSystem;
}

- (void)setCmdRecSystem:(id)a3
{
  objc_storeStrong((id *)&self->_cmdRecSystem, a3);
}

- (SRCSCommandRecognizer)cmdRecognizer
{
  return self->_cmdRecognizer;
}

- (void)setCmdRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_cmdRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdRecognizer, 0);
  objc_storeStrong((id *)&self->_cmdRecSystem, 0);
}

@end
