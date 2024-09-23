@implementation TIWordSearchShapeBased

- (id)autoconvertLongestValidPrefixes:(id)a3 option:(unint64_t)a4 candidateResultSet:(id)a5 autoconvertedCandidateArray:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  id v28;
  id *v30;
  void *v31;
  uint64_t v32;

  v10 = a3;
  v11 = a5;
  v12 = objc_msgSend(v10, "length");
  if (v12)
  {
    v13 = v12;
    v30 = a6;
    v31 = v11;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 1;
    v32 = v12;
    do
    {
      objc_msgSend(v10, "substringWithRange:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TIWordSearchShapeBased validateCode:withOption:](self, "validateCode:withOption:", v18, a4))
      {
        ++v17;
      }
      else
      {
        v19 = v17 - 1;
        if (!v19)
        {
          v21 = v10;
          v23 = (void *)v14;
          v25 = v15;
LABEL_17:
          v28 = v21;

          v11 = v31;
          goto LABEL_21;
        }
        if (!v14)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v20 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v20;
        }
        v21 = v10;
        objc_msgSend(v10, "substringWithRange:", v16, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)v14;
        v24 = v14;
        v25 = v15;
        v26 = -[TIWordSearchShapeBased addTopCandidateForCode:option:autoconvertedCandidates:candidateRefsDictionary:](self, "addTopCandidateForCode:option:autoconvertedCandidates:candidateRefsDictionary:", v22, a4, v24, v15);

        if (!v26)
          goto LABEL_17;
        v16 += v19;
        v17 = 1;
        v15 = v25;
        v14 = (uint64_t)v23;
        v10 = v21;
        v13 = v32;
      }

    }
    while (v17 + v16 <= v13);
    v21 = v10;
    v23 = (void *)v14;
    v25 = v15;
    if (v16)
    {
      v11 = v31;
      if (v30)
        *v30 = objc_retainAutorelease(v23);
      objc_msgSend(v31, "setAutoconvertedMecabraCandidates:candidateRefsDictionary:", v23, v25);
      objc_msgSend(v21, "substringFromIndex:", v16);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v11 = v31;
  }
  else
  {
    v21 = v10;
    v23 = 0;
    v25 = 0;
  }
  v27 = v21;
LABEL_20:
  v28 = v27;
LABEL_21:

  return v28;
}

- (BOOL)addTopCandidateForCode:(id)a3 option:(unint64_t)a4 autoconvertedCandidates:(id)a5 candidateRefsDictionary:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t NextCandidate;
  void *v15;
  void *v16;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v13, "analyzeString:options:", v12, a4);

  if (!(_DWORD)a4)
    goto LABEL_4;
  -[TIWordSearch mecabra](self, "mecabra");
  NextCandidate = MecabraGetNextCandidate();
  if (NextCandidate)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E80]), "initWithMecabraCandidate:", NextCandidate);
    objc_msgSend(v10, "addObject:", v15);
    objc_msgSend(v15, "mecabraCandidatePointerValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", NextCandidate, v16);

LABEL_4:
    LOBYTE(NextCandidate) = 1;
  }

  return NextCandidate;
}

- (BOOL)validateCode:(id)a3 withOption:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v7, "analyzeString:options:", v6, a4);

  if (!(_DWORD)a4)
    return 0;
  -[TIWordSearch mecabra](self, "mecabra");
  return MecabraGetNextCandidate() != 0;
}

- (BOOL)canHandleKeyHitTest
{
  return 0;
}

- (void)updateMecabraState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchShapeBased;
  -[TIWordSearch updateMecabraState](&v3, sel_updateMecabraState);
  -[TIWordSearch updateDictionaryPaths](self, "updateDictionaryPaths");
}

@end
