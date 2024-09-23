@implementation TICompositeMecabraCandidate(TextInputCore)

- (void)initWithMecabraCandidate:()TextInputCore autoconvertedCandidates:
{
  id v6;
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

  v6 = a4;
  MecabraCandidateGetSurface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MecabraCandidateGetAnalysisString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = (id)MEMORY[0x1E0C9AA60];
  objc_msgSend(v6, "valueForKey:", CFSTR("candidate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", &stru_1EA1081D0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("input"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", &stru_1EA1081D0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingString:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(a1, "initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:", v13, v14, v15, FlagsForCandidate());

  if (v16)
  {
    objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0DBEB18]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutoconvertedCandidatePointerValues:", v17);

    objc_msgSend(v16, "setRemainderCandidateString:", v7);
  }

  return v16;
}

@end
