@implementation TIWordSearchWubihua

- (int)mecabraInputMethodType
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[TIWordSearch completeOperationsInQueue](self, "completeOperationsInQueue");
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchWubihua;
  -[TIWordSearch dealloc](&v3, sel_dealloc);
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t NextCandidate;
  uint64_t v13;
  void *v14;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEB5468]);
  objc_msgSend(v4, "inputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x249597680]();
  if (objc_msgSend(v6, "length"))
  {
    if (-[TIWordSearch addFacemarkCandidatesToResultSet:forInput:](self, "addFacemarkCandidatesToResultSet:forInput:", v5, v6))
    {
      v8 = 0;
      goto LABEL_8;
    }
    v16 = 0;
    -[TIWordSearchShapeBased autoconvertLongestValidPrefixes:option:candidateResultSet:autoconvertedCandidateArray:](self, "autoconvertLongestValidPrefixes:option:candidateResultSet:autoconvertedCandidateArray:", v6, 512, v5, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "analyzeString:options:", v9, 512);

    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
  }
  while (1)
  {
    -[TIWordSearch mecabra](self, "mecabra");
    NextCandidate = MecabraGetNextCandidate();
    if (!NextCandidate)
      break;
    v13 = NextCandidate;
    objc_msgSend(MEMORY[0x24BEB4E80], "mecabraCandidateWithCandidateRef:autoconvertedCandidates:", NextCandidate, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addMecabraCandidate:mecabraCandidateRef:", v14, v13);

  }
LABEL_8:

  objc_autoreleasePoolPop(v7);
  return v5;
}

@end
