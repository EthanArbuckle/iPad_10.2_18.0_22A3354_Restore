@implementation TIWordSearchHandwriting

- (id)mecabraCreationOptionsDictionary
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIWordSearchHandwriting;
  -[TIWordSearch mecabraCreationOptionsDictionary](&v5, sel_mecabraCreationOptionsDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BEDC808]);
  return v3;
}

- (void)updateMecabraState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchHandwriting;
  -[TIWordSearch updateMecabraState](&v3, sel_updateMecabraState);
  -[TIWordSearch updateUserWordEntries](self, "updateUserWordEntries");
  -[TIWordSearch updateDictionaryPaths](self, "updateDictionaryPaths");
}

- (void)acceptCandidate:(void *)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  if (a3)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__TIWordSearchHandwriting_acceptCandidate___block_invoke;
    v10[3] = &unk_25197FFD0;
    v10[4] = self;
    v10[5] = a3;
    v4 = (void (**)(_QWORD))MEMORY[0x2495977F4](v10, a2);
    objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
    {
      v4[2](v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v8);

      objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "waitUntilAllOperationsAreFinished");

    }
  }
}

- (id)generatePredictionsWithCandidateContext:(id)a3 stringContext:(id)a4 option:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__TIWordSearchHandwriting_generatePredictionsWithCandidateContext_stringContext_option___block_invoke;
  v20[3] = &unk_25197FFF8;
  v20[4] = self;
  v10 = v8;
  v21 = v10;
  v11 = v9;
  v23 = &v25;
  v24 = a5;
  v22 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x2495977F4](v20);
  objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
    v12[2](v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v16);

    objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "waitUntilAllOperationsAreFinished");

  }
  v18 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v18;
}

- (id)generateConversionsForCandidate:(id)a3 candidateContext:(id)a4 stringContext:(id)a5
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (__MecabraContext)createMecabraContextFromCandidateContext:(id)a3 stringContext:(id)a4
{
  id v6;
  id v7;
  __MecabraContext *Mutable;
  void *CandidateFromContextString;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TIWordSearch mecabra](self, "mecabra");
  -[TIWordSearch mecabraLanguage](self, "mecabraLanguage");
  Mutable = (__MecabraContext *)MecabraContextCreateMutable();
  if (objc_msgSend(v7, "length"))
  {
    CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();
    MecabraContextAddCandidate();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        MecabraContextAddCandidate();
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  return Mutable;
}

uint64_t __88__TIWordSearchHandwriting_generatePredictionsWithCandidateContext_stringContext_option___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "mecabra");
  v2 = objc_msgSend(*(id *)(a1 + 32), "createMecabraContextFromCandidateContext:stringContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = MecabraPredictionAnalyzeWithContext();
  if ((_DWORD)result)
  {
    while (1)
    {
      result = MecabraPredictionGetNextCandidate();
      if (!result)
        break;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", result);
    }
  }
  if (v2)
    return MecabraContextRelease();
  return result;
}

uint64_t __43__TIWordSearchHandwriting_acceptCandidate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "mecabra");
  if (MecabraCandidateIsPredictionCandidate())
    MecabraPredictionAcceptCandidate();
  else
    MecabraAcceptCandidate();
  result = MecabraCandidateGetSurface();
  if (result)
    return MecabraWorkingSetAddString();
  return result;
}

void __93__TIWordSearchHandwriting_ja_generateConversionsForCandidate_candidateContext_stringContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t NextCandidate;

  objc_msgSend(*(id *)(a1 + 32), "mecabra");
  v2 = objc_msgSend(*(id *)(a1 + 32), "createMecabraContextFromCandidateContext:stringContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MecabraAnalyzeStringWithContext();

  if (v4)
  {
    while (1)
    {
      NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate)
        break;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", NextCandidate);
    }
  }
  if (v2)
    MecabraContextRelease();
}

@end
