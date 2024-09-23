@implementation TIMecabraEnvironment

- (NSString)leftDocumentContext
{
  __CFString *leftDocumentContext;

  leftDocumentContext = (__CFString *)self->_leftDocumentContext;
  if (!leftDocumentContext)
  {
    self->_leftDocumentContext = (NSString *)&stru_1EA1081D0;
    leftDocumentContext = &stru_1EA1081D0;
  }
  return (NSString *)leftDocumentContext;
}

- (NSString)rightDocumentContext
{
  __CFString *rightDocumentContext;

  rightDocumentContext = (__CFString *)self->_rightDocumentContext;
  if (!rightDocumentContext)
  {
    self->_rightDocumentContext = (NSString *)&stru_1EA1081D0;
    rightDocumentContext = &stru_1EA1081D0;
  }
  return (NSString *)rightDocumentContext;
}

- (void)setLeftDocumentContext:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1EA1081D0;
  v8 = (__CFString *)v5;
  if (!-[NSString isEqualToString:](self->_leftDocumentContext, "isEqualToString:"))
  {
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextString:forRightContext:", v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIMecabraEnvironment setLeftDocumentContextInternal:](self, "setLeftDocumentContextInternal:", v7);
  }

}

- (void)setLeftDocumentContextInternal:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString **p_leftDocumentContext;
  NSString *leftDocumentContext;
  __CFString *v8;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1EA1081D0;
  leftDocumentContext = self->_leftDocumentContext;
  p_leftDocumentContext = &self->_leftDocumentContext;
  if (leftDocumentContext != (NSString *)v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_leftDocumentContext, v5);
    v5 = v8;
  }

}

- (void)setRightDocumentContext:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  NSString *v6;
  NSString *rightDocumentContext;
  __CFString *v8;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1EA1081D0;
  v8 = (__CFString *)v5;
  if (!-[NSString isEqualToString:](self->_rightDocumentContext, "isEqualToString:"))
  {
    v6 = (NSString *)-[__CFString copy](v8, "copy");
    rightDocumentContext = self->_rightDocumentContext;
    self->_rightDocumentContext = v6;

  }
}

- (int)textContentType
{
  void *v2;
  int v3;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textContentType");

  return v3;
}

- (void)setTextContentType:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextContentType:", v3);

}

- (NSMutableArray)candidatesLeftOfCaret
{
  NSMutableArray *candidatesLeftOfCaret;
  NSMutableArray *v4;
  NSMutableArray *v5;

  candidatesLeftOfCaret = self->_candidatesLeftOfCaret;
  if (!candidatesLeftOfCaret)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_candidatesLeftOfCaret;
    self->_candidatesLeftOfCaret = v4;

    candidatesLeftOfCaret = self->_candidatesLeftOfCaret;
  }
  return candidatesLeftOfCaret;
}

- (NSMutableArray)candidatesRightOfCaret
{
  NSMutableArray *candidatesRightOfCaret;
  NSMutableArray *v4;
  NSMutableArray *v5;

  candidatesRightOfCaret = self->_candidatesRightOfCaret;
  if (!candidatesRightOfCaret)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_candidatesRightOfCaret;
    self->_candidatesRightOfCaret = v4;

    candidatesRightOfCaret = self->_candidatesRightOfCaret;
  }
  return candidatesRightOfCaret;
}

- (NSMutableArray)candidatesToDelete
{
  NSMutableArray *candidatesToDelete;
  NSMutableArray *v4;
  NSMutableArray *v5;

  candidatesToDelete = self->_candidatesToDelete;
  if (!candidatesToDelete)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_candidatesToDelete;
    self->_candidatesToDelete = v4;

    candidatesToDelete = self->_candidatesToDelete;
  }
  return candidatesToDelete;
}

- (unint64_t)candidateIndex
{
  void *v2;
  unint64_t v3;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "candidateIndex");

  return v3;
}

- (void)setCandidateIndex:(int64_t)a3
{
  id v4;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCandidateIndex:", a3);

}

- (BOOL)documentContextIsEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
  }
  else
  {
    -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") == 0;

  }
  return v4;
}

- (void)updateCursorPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  TIMecabraEnvironment *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environmentCandidateStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCandidateIndex:", 0x7FFFFFFFFFFFFFFFLL);

    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCandidateInternalIndex:", 0x7FFFFFFFFFFFFFFFLL);

    goto LABEL_17;
  }
  v28 = self;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v30;
  v27 = v4;
  while (2)
  {
    v14 = 0;
    v26 = v11 + v10;
    do
    {
      if (*(_QWORD *)v30 != v13)
        objc_enumerationMutation(v8);
      v15 = v11 + v14;
      v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
      v17 = objc_msgSend(v16, "length") + v12;
      if (v17 == objc_msgSend(v5, "length"))
      {
        -[TIMecabraEnvironment mecabraContextWrapper](v28, "mecabraContextWrapper");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setCandidateIndex:", v15);

        -[TIMecabraEnvironment mecabraContextWrapper](v28, "mecabraContextWrapper");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
        objc_msgSend(v21, "setCandidateInternalIndex:", v23);

        v4 = v27;
        goto LABEL_16;
      }
      if (v17 > objc_msgSend(v5, "length"))
      {
        -[TIMecabraEnvironment mecabraContextWrapper](v28, "mecabraContextWrapper");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCandidateIndex:", v15);

        v25 = objc_msgSend(v5, "length") - v12;
        -[TIMecabraEnvironment mecabraContextWrapper](v28, "mecabraContextWrapper");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = v25;
        goto LABEL_15;
      }
      v12 += objc_msgSend(v16, "length");
      ++v14;
    }
    while (v10 != v14);
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v11 = v26;
    v4 = v27;
    if (v10)
      continue;
    break;
  }
LABEL_16:

LABEL_17:
}

- (void)analyzeCandidateContextWithSplit:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t i;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v25;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id obj;
  TIMecabraEnvironment *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[TIMecabraEnvironment candidatesToDelete](self, "candidatesToDelete");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[TIMecabraEnvironment candidatesLeftOfCaret](self, "candidatesLeftOfCaret");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[TIMecabraEnvironment candidatesRightOfCaret](self, "candidatesRightOfCaret");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  v8 = -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidatesRange](self, "leftDocumentContextCorrespondingToCandidatesRange");
  v10 = v9;
  v34 = -[TIMecabraEnvironment rightDocumentContextCorrespondingToCandidatesRange](self, "rightDocumentContextCorrespondingToCandidatesRange");
  v12 = v11;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v36 = self;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "environmentCandidates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v38;
    v33 = v8 + v10;
    v19 = v8 + v10 != v34 || a3;
    v31 = v12 + v10 + v8;
    v32 = v34 + v12;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        v21 = v17;
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        MecabraCandidateGetSurface();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v17 += objc_msgSend(v23, "length");
        if (v19)
        {
          v25 = v8 <= v21 && v33 >= v17;
          v27 = v34 <= v21 && v32 >= v17;
          if (!v25 && !v27)
          {
LABEL_30:
            -[TIMecabraEnvironment candidatesToDelete](v36, "candidatesToDelete", v31);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          }
          if (v25)
          {
            -[TIMecabraEnvironment candidatesLeftOfCaret](v36, "candidatesLeftOfCaret");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v22);

          }
          if (v27)
          {
            -[TIMecabraEnvironment candidatesRightOfCaret](v36, "candidatesRightOfCaret");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
            v30 = v29;
            objc_msgSend(v29, "addObject:", v22, v31);

          }
        }
        else if (v8 > v21 || v31 < v17)
        {
          goto LABEL_30;
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v16);
  }

}

- (void)revertLearningOfCandidateIfNecessary
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "candidateIndex");

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentCandidateStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v4 >= v7)
  {
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "environmentCandidateStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v9, "count") - 1;

  }
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "environmentCandidates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "revertLearningForCandidate:", v12);

}

- (void)addCandidateWithString:(id)a3 toArray:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "createMecabraCandidateFromString:", v6);

  if (v8)
  {
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (void)insertCandidateWithString:(id)a3 intoArray:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "createMecabraCandidateFromString:", v8);

  if (v10)
  {
    objc_msgSend(v11, "insertObject:atIndex:", v10, a5);

  }
}

- (void)createNewCandidatesFromDocumentContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environmentCandidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment addCandidateWithString:toArray:](self, "addCandidateWithString:toArray:", v5, v7);

  }
  -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "environmentCandidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment addCandidateWithString:toArray:](self, "addCandidateWithString:toArray:", v12, v11);

  }
}

- (BOOL)addNewCandidatesIfNecessary:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;

  if (a3 != 4)
  {
    -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1EA1081D0;
    v9 = v8;

    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "environmentCandidateStrings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", &stru_1EA1081D0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_1EA1081D0;
    v15 = v14;

    if (-[__CFString rangeOfString:](v9, "rangeOfString:", v15) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = -[__CFString length](v9, "length");
      if (v16 == -[__CFString length](v15, "length"))
      {
        LOBYTE(v17) = 0;
        goto LABEL_49;
      }
    }

  }
  -[TIMecabraEnvironment candidatesLeftOfCaret](self, "candidatesLeftOfCaret");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mecabraCandidateSurfaces");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", &stru_1EA1081D0);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    v21 = -[__CFString length](v9, "length");

    if (!v21)
    {
      -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
  }
  else
  {

  }
  if (self->_mecabraLanguage == 4)
  {
    v22 = CFSTR(" ");
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(" "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "normalizeSmartQuotedStringOnlySingleQuote");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "isEqualToString:", v25);

    if ((v26 & 1) != 0)
    {
LABEL_29:
      -[TIMecabraEnvironment candidatesLeftOfCaret](self, "candidatesLeftOfCaret");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[TIMecabraEnvironment addCandidateWithString:toArray:](self, "addCandidateWithString:toArray:", v22, v17);

      LOBYTE(v17) = 1;
      goto LABEL_30;
    }
  }
  -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v27 = -[__CFString rangeOfString:](v17, "rangeOfString:", v9);
  v29 = v28;

  LOBYTE(v17) = 0;
  if (v27 != 0x7FFFFFFFFFFFFFFFLL && v29 != 0x7FFFFFFFFFFFFFFFLL && v29)
  {
    v30 = v27 + v29;
    -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    v17 = (__CFString *)(v32 - v30);
    if (v32 != v30)
    {
      -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "substringWithRange:", v30, v17);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "TI_hasTruePrefix:", v35);

    if ((v36 & 1) == 0)
    {
LABEL_28:
      v22 = v17;
      if (!v17)
        goto LABEL_30;
      goto LABEL_29;
    }
    -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "substringFromIndex:", objc_msgSend(v38, "length"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[TIMecabraEnvironment candidatesLeftOfCaret](self, "candidatesLeftOfCaret");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "lastObject");

      if (v40 && MecabraCandidateGetType() == 5)
      {
        MecabraCandidateGetSurface();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringByAppendingString:", v22);
        v42 = objc_claimAutoreleasedReturnValue();

        -[TIMecabraEnvironment candidatesLeftOfCaret](self, "candidatesLeftOfCaret");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "removeObject:", v40);

        v22 = (__CFString *)v42;
      }
      goto LABEL_29;
    }
    LOBYTE(v17) = 0;
  }
LABEL_30:
  -[TIMecabraEnvironment candidatesRightOfCaret](self, "candidatesRightOfCaret");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "mecabraCandidateSurfaces");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "componentsJoinedByString:", &stru_1EA1081D0);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v46 = -[__CFString length](v15, "length");
  -[TIMecabraEnvironment rightDocumentContextCorrespondingToCandidates](self, "rightDocumentContextCorrespondingToCandidates");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v46)
  {
    v49 = objc_msgSend(v47, "rangeOfString:", v15);
    v51 = v50;

    v52 = 0;
    if (v49 != 0x7FFFFFFFFFFFFFFFLL && v51 != 0x7FFFFFFFFFFFFFFFLL && v51 && v49)
    {
      -[TIMecabraEnvironment rightDocumentContextCorrespondingToCandidates](self, "rightDocumentContextCorrespondingToCandidates");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "substringWithRange:", 0, v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment rightDocumentContextCorrespondingToCandidates](self, "rightDocumentContextCorrespondingToCandidates");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "TI_hasTrueSuffix:", v55);

    if (v56)
    {
      -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "length");
      -[TIMecabraEnvironment rightDocumentContextCorrespondingToCandidates](self, "rightDocumentContextCorrespondingToCandidates");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "substringToIndex:", v59 - objc_msgSend(v60, "length"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v61)
        goto LABEL_49;
      -[TIMecabraEnvironment candidatesRightOfCaret](self, "candidatesRightOfCaret");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "firstObject");

      if (v63 && MecabraCandidateGetType() == 5)
      {
        MecabraCandidateGetSurface();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (v64)
        {
          objc_msgSend(v61, "stringByAppendingString:", v64);
          v65 = objc_claimAutoreleasedReturnValue();

          -[TIMecabraEnvironment candidatesRightOfCaret](self, "candidatesRightOfCaret");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "removeObject:", v63);

          v61 = (void *)v65;
        }

      }
      v52 = v61;
    }
    else if (!v52)
    {
      goto LABEL_49;
    }
LABEL_48:
    -[TIMecabraEnvironment candidatesRightOfCaret](self, "candidatesRightOfCaret");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment insertCandidateWithString:intoArray:atIndex:](self, "insertCandidateWithString:intoArray:atIndex:", v52, v17, 0);

    LOBYTE(v17) = 1;
    goto LABEL_49;
  }
  v67 = objc_msgSend(v47, "length");

  if (v67)
  {
    -[TIMecabraEnvironment rightDocumentContextCorrespondingToCandidates](self, "rightDocumentContextCorrespondingToCandidates");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
      goto LABEL_48;
  }
LABEL_49:

  return (char)v17;
}

- (void)compareDocumentAndEnvironmentCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environmentCandidateStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_1EA1081D0);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_mecabraLanguage == 4)
  {
    objc_msgSend(v5, "normalizeSmartQuotedStringOnlySingleQuote");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  objc_msgSend(v6, "longestCommonSubstring:backwards:", v34, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)v9;
    v11 = v9 ? (__CFString *)v9 : &stru_1EA1081D0;
    v12 = objc_msgSend(v34, "rangeOfString:", v11);
    v14 = v13;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v12 + v14 <= (unint64_t)objc_msgSend(v34, "length"))
    {
      objc_msgSend(v34, "substringWithRange:", v12, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
  }
  -[TIMecabraEnvironment setLeftDocumentContextCorrespondingToCandidates:](self, "setLeftDocumentContextCorrespondingToCandidates:", v8);
  -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidates](self, "leftDocumentContextCorrespondingToCandidates");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1EA1081D0;
  v19 = objc_msgSend(v34, "rangeOfString:options:", v18, 2);
  -[TIMecabraEnvironment setLeftDocumentContextCorrespondingToCandidatesRange:](self, "setLeftDocumentContextCorrespondingToCandidatesRange:", v19, v20);

  if (-[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidatesRange](self, "leftDocumentContextCorrespondingToCandidatesRange") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = 0;
  }
  else
  {
    v22 = -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidatesRange](self, "leftDocumentContextCorrespondingToCandidatesRange");
    -[TIMecabraEnvironment leftDocumentContextCorrespondingToCandidatesRange](self, "leftDocumentContextCorrespondingToCandidatesRange");
    v21 = v23 + v22;
  }
  -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (self->_mecabraLanguage == 4)
  {
    objc_msgSend(v24, "normalizeSmartQuotedStringOnlySingleQuote");
    v26 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v26;
  }
  objc_msgSend(v34, "substringFromIndex:", v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "longestCommonSubstring:backwards:", v25, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironment setRightDocumentContextCorrespondingToCandidates:](self, "setRightDocumentContextCorrespondingToCandidates:", v28);

  -[TIMecabraEnvironment rightDocumentContextCorrespondingToCandidates](self, "rightDocumentContextCorrespondingToCandidates");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (const __CFString *)v29;
  else
    v31 = &stru_1EA1081D0;
  v32 = objc_msgSend(v34, "rangeOfString:options:", v31, 4);
  -[TIMecabraEnvironment setRightDocumentContextCorrespondingToCandidatesRange:](self, "setRightDocumentContextCorrespondingToCandidatesRange:", v32, v33);

}

- (void)adjustEnvironment:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environmentCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = -[TIMecabraEnvironment documentContextIsEmpty](self, "documentContextIsEmpty");
  if (v7)
  {
    v9 = !v8;
    if (a3 == 2)
      v9 = 1;
    if ((v9 & 1) == 0)
    {
      -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "declareEndOfSentence");
LABEL_18:

      goto LABEL_19;
    }
    -[TIMecabraEnvironment compareDocumentAndEnvironmentCandidates](self, "compareDocumentAndEnvironmentCandidates");
    -[TIMecabraEnvironment analyzeCandidateContextWithSplit:](self, "analyzeCandidateContextWithSplit:", ((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0);
    if (-[TIMecabraEnvironment addNewCandidatesIfNecessary:](self, "addNewCandidatesIfNecessary:", a3))
    {
      -[TIMecabraEnvironment candidatesLeftOfCaret](self, "candidatesLeftOfCaret");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIMecabraEnvironment candidatesRightOfCaret](self, "candidatesRightOfCaret");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "environmentCandidates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllObjects");

      -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "environmentCandidates");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setArray:", v10);

      goto LABEL_18;
    }
    -[TIMecabraEnvironment candidatesToDelete](self, "candidatesToDelete");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[TIMecabraEnvironment candidatesToDelete](self, "candidatesToDelete", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v10);
            v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "environmentCandidates");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeObjectIdenticalTo:", v23);

          }
          v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v20);
      }
      goto LABEL_18;
    }
  }
  else
  {
    if (v8)
      return;
    -[TIMecabraEnvironment createNewCandidatesFromDocumentContext](self, "createNewCandidatesFromDocumentContext");
  }
LABEL_19:
  -[TIMecabraEnvironment compareDocumentAndEnvironmentCandidates](self, "compareDocumentAndEnvironmentCandidates");
  -[TIMecabraEnvironment updateCursorPosition](self, "updateCursorPosition");
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "syncEnvironmentAndContextCandidates");

}

- (TIMecabraEnvironment)initWithMecabraEngine:(__Mecabra *)a3 language:(int)a4
{
  uint64_t v4;
  TIMecabraEnvironment *v6;
  TIMecabraEnvironmentContextWrapper *v7;
  TIMecabraEnvironmentContextWrapper *mecabraContextWrapper;
  void *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)TIMecabraEnvironment;
  v6 = -[TIMecabraEnvironment init](&v11, sel_init);
  if (v6)
  {
    v7 = -[TIMecabraEnvironmentContextWrapper initWithMecabraEngine:language:]([TIMecabraEnvironmentContextWrapper alloc], "initWithMecabraEngine:language:", a3, v4);
    mecabraContextWrapper = v6->_mecabraContextWrapper;
    v6->_mecabraContextWrapper = v7;

    v6->_mecabraLanguage = v4;
    v6->_shouldAdjustOnAnalyze = 1;
    -[TIMecabraEnvironment baseLayout](v6, "baseLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment setKeyboardLayout:](v6, "setKeyboardLayout:", v9);

    -[TIMecabraEnvironment setCanSuggestSupplementalItems:](v6, "setCanSuggestSupplementalItems:", 1);
  }
  return v6;
}

- (TIKeyboardLayout)baseLayout
{
  TIMecabraEnvironment *v2;
  TIKeyboardLayout *baseLayout;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  TIKeyboardLayout *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  TIMecabraEnvironment *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x1E0C80C00];
  baseLayout = self->_baseLayout;
  if (!baseLayout)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TIMecabraEnvironment mecabraLanguage](v2, "mecabraLanguage");
    if ((v5 - 1) >= 2)
    {
      if (v5 != 4)
      {
LABEL_30:

        baseLayout = v2->_baseLayout;
        return baseLayout;
      }
      v6 = CFSTR("continuous_path_base_layout_ko");
    }
    else
    {
      v6 = CFSTR("continuous_path_base_layout");
    }
    objc_msgSend(v4, "pathForResource:ofType:", v6, CFSTR("plist"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v47 = 0;
        v48 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, &v48, &v47);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v47;
        if (v11)
        {
          if (TICanLogMessageAtLevel_onceToken != -1)
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
          TIOSLogFacility();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error loading continuous_path_base_layout.plist : %@"), "-[TIMecabraEnvironment baseLayout]", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v13;
            _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        else
        {
          v15 = objc_alloc(MEMORY[0x1E0DBDC30]);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keys"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));
          v18 = v2->_baseLayout;
          v2->_baseLayout = (TIKeyboardLayout *)v17;

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v42 = v10;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keys"));
          v12 = objc_claimAutoreleasedReturnValue();
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v19)
          {
            v20 = v19;
            v40 = v8;
            v41 = v4;
            v21 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v44 != v21)
                  objc_enumerationMutation(v12);
                v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("string"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v24, "length") == 1)
                {
                  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("frame"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("x"));
                  v26 = v2;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "floatValue");
                  v29 = v28;

                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("y"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "floatValue");
                  v32 = v31;

                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("width"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "floatValue");
                  v35 = v34;

                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("height"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "floatValue");
                  v38 = v37;

                  v2 = v26;
                  -[TIKeyboardLayout addKeyWithExactString:frame:](v26->_baseLayout, "addKeyWithExactString:frame:", v24, v29, v32, v35, v38);

                }
              }
              v20 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v20);
            v8 = v40;
            v4 = v41;
            v11 = 0;
          }
          v10 = v42;
        }

      }
      else
      {
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        TIOSLogFacility();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Error loading continuous_path_base_layout.plist"), "-[TIMecabraEnvironment baseLayout]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v50 = v14;
          _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }

    }
    goto LABEL_30;
  }
  return baseLayout;
}

- (__Mecabra)mecabra
{
  return -[TIMecabraEnvironmentContextWrapper mecabraEngine](self->_mecabraContextWrapper, "mecabraEngine");
}

- (BOOL)analyzeString:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "analyzeString:options:", v6, a4);

  return a4;
}

- (BOOL)analyzeInput:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "analyzeInput:options:", v6, a4);

  return a4;
}

- (BOOL)predictionAnalyzeWithOptions:(unint64_t)a3 maxNumberOfCandidates:(unint64_t)a4
{
  void *v7;

  -[TIMecabraEnvironment adjustEnvironment:](self, "adjustEnvironment:", 0);
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "predictionCandidatesWithOptions:maxNumberOfCandidates:", a3, a4);

  return a4;
}

- (void)commitPredictionCandidate:(void *)a3
{
  id v4;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitPredictionCandidate:", a3);

}

- (void)setGeometryModel:(void *)a3 modelData:(__CFArray *)a4
{
  id v6;

  if (a4)
  {
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGeometryModel:modelData:", a3, a4);

  }
}

- (void)setKeyboardLayout:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__447;
  v12 = __Block_byref_object_dispose__448;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__TIMecabraEnvironment_setKeyboardLayout___block_invoke;
  v7[3] = &unk_1EA0FADB8;
  v7[4] = &v8;
  objc_msgSend(v5, "enumerateKeysUsingBlock:", v7);

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardLayout:", v9[5]);

  _Block_object_dispose(&v8, 8);
}

- (void)addStringCandidateToContextInternal:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "createMecabraCandidateFromString:", v6);

    -[TIMecabraEnvironment completelyCommitInlineCandidate:](self, "completelyCommitInlineCandidate:", v5);
  }

}

- (void)setAppContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppContext:", v4);

}

- (void)setShuangpinType:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShuangpinType:", v3);

}

- (id)wubiAnnotationForCandidate:(id)a3
{
  id v4;
  void *WubixingCodesFromSurface;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIMecabraEnvironment mecabra](self, "mecabra");
  WubixingCodesFromSurface = (void *)MecabraCreateWubixingCodesFromSurface();
  if ((unint64_t)objc_msgSend(WubixingCodesFromSurface, "count") <= 1
    || (objc_msgSend(WubixingCodesFromSurface, "objectAtIndexedSubscript:", 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7 > 2))
  {
    objc_msgSend(WubixingCodesFromSurface, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(WubixingCodesFromSurface, "subarrayWithRange:", 1, objc_msgSend(WubixingCodesFromSurface, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v22;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "length");
        if (v15 > objc_msgSend(v11, "length"))
        {
          v16 = v14;

          v11 = v16;
        }
        if (objc_msgSend(v11, "length") == 4)
          break;
        if (v10 == ++v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
            goto LABEL_5;
          break;
        }
      }
    }
    else
    {
      v11 = 0;
    }

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(WubixingCodesFromSurface, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@, %@"), v19, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)_longestWubiCodeForCharacter:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIMecabraEnvironment mecabra](self, "mecabra");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)MecabraCreateWubixingCodesFromSurface();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = objc_msgSend(v11, "length", (_QWORD)v15);
      if (v12 > objc_msgSend(v8, "length"))
      {
        v13 = v11;

        v8 = v13;
      }
      if (objc_msgSend(v8, "length") == 4)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_wubiCodeForWord:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;

  v4 = a3;
  v5 = objc_msgSend(v4, "_graphemeCount");
  if (v5 == 3)
  {
    objc_msgSend(v4, "_graphemeAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_graphemeAtIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_graphemeAtIndex:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length") && objc_msgSend(v9, "length") && (unint64_t)objc_msgSend(v10, "length") > 1)
    {
      objc_msgSend(v7, "substringToIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "substringToIndex:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "substringToIndex:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingString:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }

    goto LABEL_18;
  }
  if (v5 == 2)
  {
    objc_msgSend(v4, "_firstGrapheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_lastGrapheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "length") >= 2 && (unint64_t)objc_msgSend(v9, "length") >= 2)
    {
      objc_msgSend(v7, "substringToIndex:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "substringToIndex:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      goto LABEL_20;
    }
LABEL_18:

LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  if (v5 < 4)
    goto LABEL_19;
  objc_msgSend(v4, "_graphemeAtIndex:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 1;
  objc_msgSend(v4, "_graphemeAtIndex:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_graphemeAtIndex:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_lastGrapheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIMecabraEnvironment _longestWubiCodeForCharacter:](self, "_longestWubiCodeForCharacter:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "length"))
  {
    if (objc_msgSend(v23, "length") && objc_msgSend(v25, "length") && objc_msgSend(v26, "length"))
    {
      objc_msgSend(v20, "substringToIndex:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "substringToIndex:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringByAppendingString:", v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "substringToIndex:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByAppendingString:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "substringToIndex:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByAppendingString:", v30);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
  }

  if ((v21 & 1) != 0)
    goto LABEL_19;
LABEL_20:

  return v12;
}

- (id)contactNameWubiCodePairsForFirstName:(id)a3 lastName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "_containsIdeographicCharacters"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (objc_msgSend(v6, "_containsIdeographicCharacters"))
    v10 = v6;
  else
    v10 = 0;
  v11 = v10;

  v12 = 0;
  if (v9 | v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && v11)
    {
      objc_msgSend((id)v11, "stringByAppendingString:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
    if ((unint64_t)objc_msgSend((id)v9, "_graphemeCount") >= 2)
      objc_msgSend(v13, "addObject:", v9);
    if ((unint64_t)objc_msgSend((id)v11, "_graphemeCount") >= 2)
      objc_msgSend(v13, "addObject:", v11);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * objc_msgSend(v13, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[TIMecabraEnvironment _wubiCodeForWord:](self, "_wubiCodeForWord:", v20, (_QWORD)v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "length") == 4)
          {
            objc_msgSend(v12, "addObject:", v20);
            objc_msgSend(v12, "addObject:", v21);
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v17);
    }

  }
  return v12;
}

- (id)readingForWubiWord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "_containsIdeographicCharacters"))
  {
    -[TIMecabraEnvironment _wubiCodeForWord:](self, "_wubiCodeForWord:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") == 4)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)acceptInlineCandidates
{
  id v2;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptInlineCandidates");

}

- (void)partiallyCommitInlineCandidate:(void *)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "candidateInternalIndex");

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[TIMecabraEnvironment adjustEnvironment:](self, "adjustEnvironment:", 4);
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "partiallyCommitInlineCandidate:", a3);

}

- (void)completelyCommitInlineCandidate:(void *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "candidateInternalIndex");

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[TIMecabraEnvironment adjustEnvironment:](self, "adjustEnvironment:", 4);
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completelyCommitInlineCandidate:", a3);

  MecabraCandidateGetSurface();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length") && MecabraCandidateGetType() == 6)
  {
    -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMecabraEnvironment setLeftDocumentContextInternal:](self, "setLeftDocumentContextInternal:", v9);

  }
}

- (void)revertInlineCandidate
{
  id v2;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revertInlineCandidate");

}

- (void)addPunctuationCandidateToContext:(id)a3
{
  id v4;

  -[TIMecabraEnvironment addStringCandidateToContextInternal:](self, "addStringCandidateToContextInternal:", a3);
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "declareEndOfSentence");

}

- (void)declareEndOfSentence
{
  id v2;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "declareEndOfSentence");

}

- (void)setPrivateMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrivateMode:", v3);

}

- (id)findSupplementalLexiconCandidatesSurroundingCursor
{
  void *v3;
  void *v4;

  if (-[TIMecabraEnvironment canSuggestSupplementalItems](self, "canSuggestSupplementalItems"))
  {
    -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "findSupplementalLexiconCandidatesSurroundingCursor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (void)reset
{
  void *v3;

  -[TIMecabraEnvironment setLeftDocumentContext:](self, "setLeftDocumentContext:", &stru_1EA1081D0);
  -[TIMecabraEnvironment setRightDocumentContext:](self, "setRightDocumentContext:", &stru_1EA1081D0);
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAll");

  -[TIMecabraEnvironment setCanSuggestSupplementalItems:](self, "setCanSuggestSupplementalItems:", 1);
}

- (NSDictionary)environmentDebuggingInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[8];
  _QWORD v32[10];

  v32[8] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("TIMecabraEnvironmentCandidateIndex");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v30, "candidateIndex"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v29;
  v31[1] = CFSTR("TIMecabraEnvironmentPositionWithinCandidate");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v28, "candidateInternalIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v5;
  v31[2] = CFSTR("TIMecabraEnvironmentContextCandidateSurfaces");
  -[TIMecabraEnvironment contextCandidateSurfaces](self, "contextCandidateSurfaces");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = v6;
  else
    v9 = MEMORY[0x1E0C9AA60];
  v32[2] = v9;
  v31[3] = CFSTR("TIMecabraEnvironmentInlineCandidateSurfaces");
  -[TIMecabraEnvironment inlineCandidateSurfaces](self, "inlineCandidateSurfaces");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = v8;
  v32[3] = v12;
  v31[4] = CFSTR("TIMecabraEnvironmentRightCandidateSurfaces");
  -[TIMecabraEnvironment rightCandidateSurfaces](self, "rightCandidateSurfaces");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = v8;
  v32[4] = v15;
  v31[5] = CFSTR("TIMecabraEnvironmentLeftContext");
  -[TIMecabraEnvironment leftDocumentContext](self, "leftDocumentContext");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1EA1081D0;
  v32[5] = v18;
  v31[6] = CFSTR("TIMecabraEnvironmentRightContext");
  -[TIMecabraEnvironment rightDocumentContext](self, "rightDocumentContext");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_1EA1081D0;
  v32[6] = v21;
  v31[7] = CFSTR("TIMecabraEnvironmentTemporaryCandidates");
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "temporaryCandidates");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = v23;
  else
    v25 = v8;
  v32[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v26;
}

- (NSArray)contextCandidateSurfaces
{
  void *v2;
  void *v3;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextCandidateStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)inlineCandidateSurfaces
{
  void *v2;
  void *v3;
  void *v4;

  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineCandidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mecabraCandidateSurfaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)rightCandidateSurfaces
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environmentCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99E60];
  -[TIMecabraEnvironment mecabraContextWrapper](self, "mecabraContextWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextCandidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), (_QWORD)v17) & 1) == 0)
        {
          MecabraCandidateGetSurface();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return (NSArray *)v9;
}

- (TIMecabraEnvironmentContextWrapper)mecabraContextWrapper
{
  return self->_mecabraContextWrapper;
}

- (void)setMecabraContextWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraContextWrapper, a3);
}

- (int)mecabraLanguage
{
  return self->_mecabraLanguage;
}

- (void)setMecabraLanguage:(int)a3
{
  self->_mecabraLanguage = a3;
}

- (BOOL)shouldAdjustOnAnalyze
{
  return self->_shouldAdjustOnAnalyze;
}

- (void)setShouldAdjustOnAnalyze:(BOOL)a3
{
  self->_shouldAdjustOnAnalyze = a3;
}

- (void)setCandidatesLeftOfCaret:(id)a3
{
  objc_storeStrong((id *)&self->_candidatesLeftOfCaret, a3);
}

- (void)setCandidatesRightOfCaret:(id)a3
{
  objc_storeStrong((id *)&self->_candidatesRightOfCaret, a3);
}

- (NSString)leftDocumentContextCorrespondingToCandidates
{
  return self->_leftDocumentContextCorrespondingToCandidates;
}

- (void)setLeftDocumentContextCorrespondingToCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)rightDocumentContextCorrespondingToCandidates
{
  return self->_rightDocumentContextCorrespondingToCandidates;
}

- (void)setRightDocumentContextCorrespondingToCandidates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_NSRange)leftDocumentContextCorrespondingToCandidatesRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_leftDocumentContextCorrespondingToCandidatesRange.length;
  location = self->_leftDocumentContextCorrespondingToCandidatesRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLeftDocumentContextCorrespondingToCandidatesRange:(_NSRange)a3
{
  self->_leftDocumentContextCorrespondingToCandidatesRange = a3;
}

- (_NSRange)rightDocumentContextCorrespondingToCandidatesRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rightDocumentContextCorrespondingToCandidatesRange.length;
  location = self->_rightDocumentContextCorrespondingToCandidatesRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRightDocumentContextCorrespondingToCandidatesRange:(_NSRange)a3
{
  self->_rightDocumentContextCorrespondingToCandidatesRange = a3;
}

- (void)setCandidatesToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_candidatesToDelete, a3);
}

- (BOOL)canSuggestSupplementalItems
{
  return self->_canSuggestSupplementalItems;
}

- (void)setCanSuggestSupplementalItems:(BOOL)a3
{
  self->_canSuggestSupplementalItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidatesToDelete, 0);
  objc_storeStrong((id *)&self->_rightDocumentContextCorrespondingToCandidates, 0);
  objc_storeStrong((id *)&self->_leftDocumentContextCorrespondingToCandidates, 0);
  objc_storeStrong((id *)&self->_candidatesRightOfCaret, 0);
  objc_storeStrong((id *)&self->_candidatesLeftOfCaret, 0);
  objc_storeStrong((id *)&self->_mecabraContextWrapper, 0);
  objc_storeStrong((id *)&self->_baseLayout, 0);
  objc_storeStrong((id *)&self->_rightDocumentContext, 0);
  objc_storeStrong((id *)&self->_leftDocumentContext, 0);
}

void __42__TIMecabraEnvironment_setKeyboardLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  const void *LayoutKey;
  __CFString *v5;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EA1081D0;
  }
  v5 = v3;
  if (-[__CFString length](v3, "length") == 1)
  {
    -[__CFString _firstChar](v5, "_firstChar");
    LayoutKey = (const void *)MecabraCreateLayoutKey();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", LayoutKey);
    CFRelease(LayoutKey);
  }

}

+ (int)maxNumberOfDrawSamples
{
  if (maxNumberOfDrawSamples_onceToken != -1)
    dispatch_once(&maxNumberOfDrawSamples_onceToken, &__block_literal_global_505);
  if (maxNumberOfDrawSamples_maxNumberOfDrawSamples)
    return 400;
  else
    return 600;
}

+ (id)loadMobileAssetContentsWhenMobileAssetChangesForMecabra:(__Mecabra *)a3 inputModes:(id)a4 onQueue:(id)a5 oldMobileAssetChangeListener:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(void *, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v22;
  id v23;
  __Mecabra *v24;

  v10 = a4;
  v11 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke;
  aBlock[3] = &unk_1EA0FA348;
  v23 = v11;
  v24 = a3;
  v22 = v10;
  v12 = v11;
  v13 = v10;
  v14 = a6;
  v15 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v15[2](v15, 0);
  objc_msgSend(a1, "removeMobileAssetListener:", v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserverForName:object:queue:usingBlock:", CFSTR("TIAssetsDidChangeNotification"), v17, v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer:(id)a3 inputModes:(id)a4 onQueue:(id)a5 oldMobileAssetChangeListener:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD aBlock[4];
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke;
  aBlock[3] = &unk_1EA0FA398;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = a6;
  v17 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v17[2](v17, 0);
  objc_msgSend(a1, "removeMobileAssetListener:", v16);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", CFSTR("TIAssetsDidChangeNotification"), v19, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (void)removeMobileAssetListener:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB37D0];
    v4 = a3;
    objc_msgSend(v3, "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v4);

    TIAssetsOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%s %@"), "+[TIMecabraEnvironment removeMobileAssetListener:]", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 inMecabra:(__Mecabra *)a4 onQueue:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_inMecabra_onQueue___block_invoke;
  v5[3] = &__block_descriptor_40_e41_v32__0__NSArray_8__NSArray_16__NSArray_24l;
  v5[4] = a4;
  +[TIMecabraEnvironment loadMobileAssetContentsForInputModes:onQueue:withCompletionBlock:](TIMecabraEnvironment, "loadMobileAssetContentsForInputModes:onQueue:withCompletionBlock:", a3, a5, v5);
}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 onQueue:(id)a4 withCompletionBlock:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("Lexicon");
  v14 = CFSTR("LexiconDelta");
  v15 = CFSTR("LanguageModel");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:", v11, v12, v10, v9, v13, v14, v15, v16);

}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 assetContentTypes:(id)a4 inMecabra:(__Mecabra *)a5 onQueue:(id)a6
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_inMecabra_onQueue___block_invoke;
  v6[3] = &__block_descriptor_40_e41_v32__0__NSArray_8__NSArray_16__NSArray_24l;
  v6[4] = a5;
  +[TIMecabraEnvironment loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:](TIMecabraEnvironment, "loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:", a3, a4, a6, v6);
}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 assetContentTypes:(id)a4 onQueue:(id)a5 withCompletionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id obj;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  void *v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v59 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v10)
  {
    v54 = v11;
    v55 = v10;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v56 = v9;
    obj = v9;
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    if (v60)
    {
      v58 = *(_QWORD *)v83;
      v14 = *MEMORY[0x1E0D1C9E0];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v83 != v58)
            objc_enumerationMutation(obj);
          v61 = v15;
          v64 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v15);
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v62 = v59;
          v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          if (v65)
          {
            v63 = *(_QWORD *)v79;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v79 != v63)
                  objc_enumerationMutation(v62);
                v66 = v16;
                v17 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v16);
                objc_msgSend(v64, "normalizedIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("zh"));

                +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "ddsAssetContentItemsWithContentType:inputMode:filteredWithRegion:", v17, v64, v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v76 = 0u;
                v77 = 0u;
                v74 = 0u;
                v75 = 0u;
                v22 = v21;
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
                if (v23)
                {
                  v24 = v23;
                  v25 = *(_QWORD *)v75;
                  do
                  {
                    for (i = 0; i != v24; ++i)
                    {
                      if (*(_QWORD *)v75 != v25)
                        objc_enumerationMutation(v22);
                      v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                      objc_msgSend(v27, "contents");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "objectForKeyedSubscript:", v14);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v29, "count"))
                      {
                        objc_msgSend(v27, "type");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("LanguageModel"));

                        if (v31)
                        {
                          objc_msgSend(v67, "objectForKeyedSubscript:", v29);
                          v32 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v32)
                          {
                            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v67, "setObject:forKeyedSubscript:", v33, v29);

                          }
                          v34 = v67;
                        }
                        else
                        {
                          objc_msgSend(v13, "objectForKeyedSubscript:", v29);
                          v38 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v38)
                          {
                            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                            v39 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v13, "setObject:forKeyedSubscript:", v39, v29);

                          }
                          v34 = v13;
                        }
                        objc_msgSend(v34, "objectForKeyedSubscript:", v29);
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v27, "path");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v40, "path");
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v37, "addObject:", v41);

                      }
                      else
                      {
                        objc_msgSend(v27, "path");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v35, "URLByDeletingLastPathComponent");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v36, "URLByDeletingLastPathComponent");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v68, "addObject:", v37);
                      }

                    }
                    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
                  }
                  while (v24);
                }

                v16 = v66 + 1;
              }
              while (v66 + 1 != v65);
              v65 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
            }
            while (v65);
          }

          v15 = v61 + 1;
        }
        while (v61 + 1 != v60);
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      }
      while (v60);
    }

    TIAssetsOSLogFacility();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s DDS regionalAsset (%@)"), "+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:]", v13);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v87 = v43;
      _os_log_impl(&dword_1DA6F2000, v42, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    TIAssetsOSLogFacility();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s DDS nonRegionalAsset (%@)"), "+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:]", v68);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v87 = v45;
      _os_log_impl(&dword_1DA6F2000, v44, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v46 = v13;
    v47 = v68;
    TIAssetsOSLogFacility();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s sending to mecabra : regional assets %@ : non regional assets %@"), "+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:]", v46, v47);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v87 = v53;
      _os_log_debug_impl(&dword_1DA6F2000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __107__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_onQueue_withCompletionBlock___block_invoke;
    v69[3] = &unk_1EA104CD0;
    v70 = v46;
    v71 = v67;
    v72 = v47;
    v12 = v54;
    v73 = v54;
    v49 = v47;
    v50 = v67;
    v51 = v46;
    +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", v69);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v55;
    objc_msgSend(v55, "addOperation:", v52);

    v9 = v56;
  }

}

+ (id)getWordFromAnalysisStringOf:(void *)a3 atIndex:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "getWordFrom:atIndex:forSurface:", a3, a4, 0);
}

+ (id)getWordFromSurfaceOf:(void *)a3 atIndex:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "getWordFrom:atIndex:forSurface:", a3, a4, 1);
}

+ (id)getWordFrom:(void *)a3 atIndex:(unint64_t)a4 forSurface:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t WordLengthAtIndex;
  __CFString *v10;
  void *Surface;

  if (!a3)
  {
    v10 = &stru_1EA1081D0;
    return v10;
  }
  v5 = a5;
  if ((int)MecabraCandidateGetWordCount() <= a4)
  {
    v10 = &stru_1EA1081D0;
    return v10;
  }
  v7 = 0;
  v8 = a4;
  while (v5)
  {
    WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex();
    if (!v8)
    {
      Surface = (void *)MecabraCandidateGetSurface();
      goto LABEL_13;
    }
LABEL_8:
    v7 += WordLengthAtIndex;
    --v8;
  }
  WordLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex();
  if (v8)
    goto LABEL_8;
  Surface = (void *)MecabraCandidateGetAnalysisString();
LABEL_13:
  objc_msgSend(Surface, "substringWithRange:", v7, WordLengthAtIndex);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v10;
}

void __107__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_onQueue_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
        v34[0] = *MEMORY[0x1E0DE7118];
        objc_msgSend(v7, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v8;
        v34[1] = *MEMORY[0x1E0DE7110];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
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
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        v31[0] = *MEMORY[0x1E0DE7118];
        objc_msgSend(v17, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v18;
        v31[1] = *MEMORY[0x1E0DE7110];
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v20);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __97__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_inMecabra_onQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;

  v6 = a4;
  v5 = a3;
  MecabraSetAssetDataItemsForType();
  MecabraSetAssetDataItemsForType();

  MecabraSetAssetDataItemsForType();
}

void __79__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_inMecabra_onQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;

  v6 = a4;
  v5 = a3;
  MecabraSetAssetDataItemsForType();
  MecabraSetAssetDataItemsForType();

  MecabraSetAssetDataItemsForType();
}

void __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = (void *)a1[4];
  if (v1)
  {
    v2 = a1[5];
    v3 = a1[6];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2;
    v4[3] = &unk_1EA0FA370;
    v5 = v1;
    +[TIMecabraEnvironment loadMobileAssetContentsForInputModes:onQueue:withCompletionBlock:](TIMecabraEnvironment, "loadMobileAssetContentsForInputModes:onQueue:withCompletionBlock:", v2, v3, v4);

  }
}

void __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:withObject:", sel_updateMecabraWithRegionalOTAAssets_nonRegionalOTAAssets_, v6, v5);

}

_QWORD *__128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v1 = result[6];
  if (v1)
  {
    v2 = result[4];
    v3 = result[5];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2;
    v4[3] = &__block_descriptor_40_e41_v32__0__NSArray_8__NSArray_16__NSArray_24l;
    v4[4] = v1;
    return (_QWORD *)+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:onQueue:withCompletionBlock:](TIMecabraEnvironment, "loadMobileAssetContentsForInputModes:onQueue:withCompletionBlock:", v2, v3, v4);
  }
  return result;
}

void __128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;

  v6 = a4;
  v5 = a3;
  MecabraSetAssetDataItemsForType();
  MecabraSetAssetDataItemsForType();

  MecabraSetAssetDataItemsForType();
}

void __46__TIMecabraEnvironment_maxNumberOfDrawSamples__block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  CFIndex Length;
  CFIndex v3;
  CFStringRef v5;
  CFRange v6;

  v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    Length = CFStringGetLength(v0);
    do
    {
      v3 = Length;
      if (Length-- < 1)
      {
        v5 = v1;
        goto LABEL_10;
      }
    }
    while (CFStringGetCharacterAtIndex(v1, Length) - 58 < 0xFFFFFFF6);
    v6.location = 0;
    v6.length = v3;
    v5 = CFStringCreateWithSubstring(0, v1, v6);
    CFRelease(v1);
    if (!v5)
      return;
    if (objc_msgSend(&unk_1EA13FEE0, "containsObject:", v5))
      maxNumberOfDrawSamples_maxNumberOfDrawSamples = 1;
LABEL_10:
    CFRelease(v5);
  }
}

@end
