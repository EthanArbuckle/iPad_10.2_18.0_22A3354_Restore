@implementation TIKeyboardInputManager_intl_HWR

- (CHRecognizer)recognizer
{
  if (recognizer___onceToken != -1)
    dispatch_once(&recognizer___onceToken, &__block_literal_global);
  return (CHRecognizer *)(id)recognizer___recognizer;
}

- (id)recognitionResultsForStrokes:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE1BDC8]);
  if (objc_msgSend(v6, "numberOfStrokes"))
  {
    v9 = 0;
    do
    {
      if (objc_msgSend(v6, "numberOfPointsInStrokeAtIndex:", v9))
      {
        v10 = 0;
        do
        {
          objc_msgSend(v6, "pointAtIndex:inStrokeAtIndex:", v10, v9);
          objc_msgSend(v8, "addPoint:");
          ++v10;
        }
        while (v10 < objc_msgSend(v6, "numberOfPointsInStrokeAtIndex:", v9));
      }
      objc_msgSend(v8, "endStroke");
      ++v9;
    }
    while (v9 < objc_msgSend(v6, "numberOfStrokes"));
  }
  if (v7)
  {
    v15 = *MEMORY[0x24BE1BDB8];
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[TIKeyboardInputManager_intl_HWR recognizer](self, "recognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recognitionResultsForDrawing:options:", v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)updateCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIKeyboardInputManager_intl_HWR contextBeforeWithDesiredLength:](self, "contextBeforeWithDesiredLength:", 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_intl_HWR recognitionResultsForStrokes:context:](self, "recognitionResultsForStrokes:context:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)MEMORY[0x24BEB4E20];
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "string", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "candidateWithUnchangedInput:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      -[TIKeyboardInputManager_intl_HWR setCandidates:](self, "setCandidates:", v7);
      -[TIKeyboardInputManager_intl_HWR candidateResultSet](self, "candidateResultSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_intl_HWR closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager_intl_HWR setCandidates:](self, "setCandidates:", v17);

    }
  }
}

- (id)candidateResultSet
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[TIKeyboardInputManager_intl_HWR candidates](self, "candidates");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[TIKeyboardInputManager_intl_HWR candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BEB4E18], "dummySet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TIKeyboardInputManager_intl_HWR candidates](self, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_intl_HWR candidateResultSetFromCandidates:](self, "candidateResultSetFromCandidates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)defaultCandidate
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManager_intl_HWR candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TIKeyboardInputManager_intl_HWR candidates](self, "candidates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!-[TIKeyboardInputManager_intl_HWR isDummyCandidate:](self, "isDummyCandidate:", v10))
          {
            v11 = v10;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (unint64_t)initialSelectedIndex
{
  void *v3;
  id v4;
  objc_super v6;

  -[TIKeyboardInputManager_intl_HWR candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && -[TIKeyboardInputManager_intl_HWR inputCount](self, "inputCount"))
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_intl_HWR;
    v4 = -[TIKeyboardInputManager_intl_HWR initialSelectedIndex](&v6, sel_initialSelectedIndex);
  }

  return (unint64_t)v4;
}

- (BOOL)isDummyCandidate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BDBCEF8];
  v4 = a3;
  objc_msgSend(v3, "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BEB53B8]);
  -[TIKeyboardInputManager_intl_HWR keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKeyboardState:", v6);

  if (objc_msgSend(v4, "isBackspace"))
    -[TIKeyboardInputManager_intl_HWR deleteFromInputWithContext:](self, "deleteFromInputWithContext:", v7);
  else
    -[TIKeyboardInputManager_intl_HWR addInput:withContext:](self, "addInput:withContext:", v4, v7);
  objc_msgSend(v7, "output");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[TIKeyboardInputManager_intl_HWR candidates](self, "candidates");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v14, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[TIKeyboardInputManager_intl_HWR acceptCurrentCandidateWithContext:](self, "acceptCurrentCandidateWithContext:", v6);
      -[TIKeyboardInputManager_intl_HWR setCandidates:](self, "setCandidates:", 0);
    }
  }
  objc_msgSend(v14, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v14, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_intl_HWR addInputObject:withContext:](self, "addInputObject:withContext:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setString:", v12);

  }
  objc_msgSend(v14, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v6, "insertText:", v13);

}

- (id)addInputObject:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void **v24;
  __CFString *v25;
  id v26;
  void *v27;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[TIKeyboardInputManager_intl_HWR setUserDrawing:](self, "setUserDrawing:", a3);
  -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfStrokes");

  if (v8)
  {
    -[TIKeyboardInputManager_intl_HWR updateCandidates](self, "updateCandidates");
    -[TIKeyboardInputManager_intl_HWR defaultCandidate](self, "defaultCandidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-_一"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "numberOfStrokes") == 1)
    {
      v13 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v10, "_firstChar"));

      if (v13)
      {
        -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "numberOfPointsInStrokeAtIndex:", 0);

        -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pointAtIndex:inStrokeAtIndex:", 0, 0);
        v18 = v17;

        -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "pointAtIndex:inStrokeAtIndex:", v15 - 1, 0);
        v21 = v20;

        if (v18 >= v21)
        {
          objc_msgSend(v6, "deleteBackward:", 1);
          objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithUnchangedInput:", CFSTR("DELETE"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v22;
          v23 = (void *)MEMORY[0x24BDBCE30];
          v24 = &v29;
        }
        else
        {
          objc_msgSend(v6, "insertText:", CFSTR(" "));
          objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithUnchangedInput:", &stru_2501217D8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = v22;
          v23 = (void *)MEMORY[0x24BDBCE30];
          v24 = (void **)v30;
        }
        objc_msgSend(v23, "arrayWithObjects:count:", v24, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager_intl_HWR setCandidates:](self, "setCandidates:", v27);

        v26 = 0;
        goto LABEL_11;
      }
    }
    else
    {

    }
    v26 = v10;
LABEL_11:
    v25 = (__CFString *)v26;

    goto LABEL_12;
  }
  -[TIKeyboardInputManager_intl_HWR clearInput](self, "clearInput");
  v25 = &stru_2501217D8;
LABEL_12:

  return v25;
}

- (void)clearInput
{
  objc_super v3;

  -[TIKeyboardInputManager_intl_HWR setUserDrawing:](self, "setUserDrawing:", 0);
  -[TIKeyboardInputManager_intl_HWR setCandidates:](self, "setCandidates:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_intl_HWR;
  -[TIKeyboardInputManager_intl_HWR clearInput](&v3, sel_clearInput);
}

- (void)deleteFromInputWithContext:(id)a3
{
  id v4;

  v4 = a3;
  -[TIKeyboardInputManager_intl_HWR clearInput](self, "clearInput");
  objc_msgSend(v4, "deleteBackward:", 1);

}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (BOOL)canHandleKeyHitTest
{
  return 0;
}

- (BOOL)suppliesCompletions
{
  return 0;
}

- (id)keyboardBehaviors
{
  return 0;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_intl_HWR userDrawing](self, "userDrawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfStrokes");

  return v3;
}

- (TIHandwritingStrokes)userDrawing
{
  return self->_userDrawing;
}

- (void)setUserDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_userDrawing, a3);
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_userDrawing, 0);
}

@end
