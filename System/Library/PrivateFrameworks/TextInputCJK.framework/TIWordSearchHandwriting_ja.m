@implementation TIWordSearchHandwriting_ja

- (int)mecabraInputMethodType
{
  return 1;
}

- (id)generatePredictionsWithCandidateContext:(id)a3 stringContext:(id)a4 option:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t CandidateFromContextString;
  int Type;
  void *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (objc_msgSend(v8, "count") == 1
    && (objc_msgSend(v8, "objectAtIndexedSubscript:", 0),
        (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)MecabraCandidateGetSurface(), "_containsSymbolsAndPunctuationOnly")))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          CandidateFromContextString = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          Type = MecabraCandidateGetType();
          if (Type != 1 && Type != 7)
          {
            MecabraCandidateGetSurface();
            -[TIWordSearch mecabra](self, "mecabra");
            CandidateFromContextString = MecabraCreateCandidateFromContextString();
          }
          objc_msgSend(v10, "addObject:", CandidateFromContextString);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v22.receiver = self;
    v22.super_class = (Class)TIWordSearchHandwriting_ja;
    -[TIWordSearchHandwriting generatePredictionsWithCandidateContext:stringContext:option:](&v22, sel_generatePredictionsWithCandidateContext_stringContext_option_, v10, v9, a5);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v11;

  return v20;
}

- (id)generateConversionsForCandidate:(id)a3 candidateContext:(id)a4 stringContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __93__TIWordSearchHandwriting_ja_generateConversionsForCandidate_candidateContext_stringContext___block_invoke;
  v22[3] = &unk_251980020;
  v22[4] = self;
  v11 = v9;
  v23 = v11;
  v12 = v10;
  v24 = v12;
  v13 = v8;
  v25 = v13;
  v26 = &v27;
  v14 = (void (**)(_QWORD))MEMORY[0x2495977F4](v22);
  objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {
    v14[2](v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v18);

    objc_msgSend(MEMORY[0x24BEB5460], "sharedOperationQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "waitUntilAllOperationsAreFinished");

  }
  v20 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v20;
}

@end
