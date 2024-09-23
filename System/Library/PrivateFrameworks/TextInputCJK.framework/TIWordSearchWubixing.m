@implementation TIWordSearchWubixing

- (int)mecabraInputMethodType
{
  return 10;
}

- (id)mecabraCreationOptionsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIWordSearchWubixing;
  -[TIWordSearch mecabraCreationOptionsDictionary](&v7, sel_mecabraCreationOptionsDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TIWordSearchWubixing setWubiStandard:](self, "setWubiStandard:", -[TIWordSearchWubixing wubiStandardPreference](self, "wubiStandardPreference"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TIWordSearchWubixing wubiStandard](self, "wubiStandard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BEDC818]);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TIWordSearch completeOperationsInQueue](self, "completeOperationsInQueue");
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchWubixing;
  -[TIWordSearch dealloc](&v3, sel_dealloc);
}

- (void)updateMecabraState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchWubixing;
  -[TIWordSearchShapeBased updateMecabraState](&v3, sel_updateMecabraState);
  -[TIWordSearch updateUserWordEntries](self, "updateUserWordEntries");
}

- (int)wubiStandardPreference
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", *MEMORY[0x24BEB5238]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)checkWubiStandard
{
  int v3;

  v3 = -[TIWordSearchWubixing wubiStandardPreference](self, "wubiStandardPreference");
  if (v3 != -[TIWordSearchWubixing wubiStandard](self, "wubiStandard"))
  {
    -[TIWordSearchWubixing setWubiStandard:](self, "setWubiStandard:", -[TIWordSearchWubixing wubiStandardPreference](self, "wubiStandardPreference"));
    -[TIWordSearch mecabra](self, "mecabra");
    -[TIWordSearchWubixing wubiStandard](self, "wubiStandard");
    MecabraSetWubixingStandard();
    -[TIWordSearch updateAddressBook](self, "updateAddressBook");
  }
}

- (unsigned)nameReadingPairGenerationMode
{
  return 2;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  char v12;
  unint64_t v13;
  uint64_t NextCandidate;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEB5468]);
  objc_msgSend(v4, "inputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x249597680]();
  if (objc_msgSend(v6, "length"))
  {
    if (-[TIWordSearch addFacemarkCandidatesToResultSet:forInput:](self, "addFacemarkCandidatesToResultSet:forInput:", v5, v6))
    {
      v38 = 0;
      v8 = 0;
      goto LABEL_16;
    }
    -[TIWordSearchWubixing checkWubiStandard](self, "checkWubiStandard");
    v39 = 0;
    -[TIWordSearchWubixing autoconvertWubiXingPrefixes:option:candidateResultSet:autoconvertedCandidateArray:](self, "autoconvertWubiXingPrefixes:option:candidateResultSet:autoconvertedCandidateArray:", v6, 0, v5, &v39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v39;
    -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "analyzeString:options:", v8, 0);

    if (!v10)
      goto LABEL_16;
  }
  else
  {
    v38 = 0;
    v8 = 0;
  }
  v35 = v7;
  v36 = v4;
  v37 = v8;
  v11 = objc_msgSend(v8, "containsString:", CFSTR("z"));
  v12 = 0;
  v13 = 0x24BEB4000uLL;
  while (1)
  {
    -[TIWordSearch mecabra](self, "mecabra");
    NextCandidate = MecabraGetNextCandidate();
    if (!NextCandidate)
      break;
    v15 = NextCandidate;
    objc_msgSend(*(id *)(v13 + 3712), "mecabraCandidateWithCandidateRef:autoconvertedCandidates:", NextCandidate, v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isWubixingConvertedByPinyin") | v11) == 1)
    {
      -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "label");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "wubiAnnotationForCandidate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlternativeText:", v19);

      v13 = 0x24BEB4000;
    }
    objc_msgSend(v5, "addMecabraCandidate:mecabraCandidateRef:", v16, v15);
    objc_msgSend(v16, "candidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", v6);

    v12 |= v21;
  }
  if ((objc_msgSend(v6, "isEqualToString:", v37) & 1) == 0)
  {
    objc_msgSend(v5, "candidates");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "indexOfObjectPassingTest:", &__block_literal_global_906);

    -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "analyzeString:options:", v6, 0);
    while (1)
    {

      -[TIWordSearch mecabra](self, "mecabra");
      v28 = MecabraGetNextCandidate();
      if (!v28)
        break;
      v29 = v28;
      objc_msgSend(*(id *)(v13 + 3712), "mecabraCandidateWithCandidateRef:autoconvertedCandidates:", v28, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "isWubixingConvertedByPinyin"))
      {
        -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "candidate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "wubiAnnotationForCandidate:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAlternativeText:", v32);

        v13 = 0x24BEB4000;
      }
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v5, "addMecabraCandidate:mecabraCandidateRef:", v27, v29);
        v26 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v5, "insertMecabraCandidate:mecabraCandidateRef:atIndex:", v27, v29, v26++);
      }
      objc_msgSend(v27, "candidate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", v6);

      v12 |= v34;
    }
  }
  v7 = v35;
  v4 = v36;
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v22);

  if (v23 != 0x7FFFFFFFFFFFFFFFLL && (v12 & 1) == 0)
    objc_msgSend(v5, "addSyntheticMecabraCandidateWithSurface:input:isExtension:", v6, v6, 1);
  v8 = v37;
LABEL_16:

  objc_autoreleasePoolPop(v7);
  return v5;
}

- (id)autoconvertWubiXingPrefixes:(id)a3 option:(unint64_t)a4 candidateResultSet:(id)a5 autoconvertedCandidateArray:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  id *v26;
  void *v27;

  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "length") < 5)
    goto LABEL_11;
  v26 = a6;
  v27 = v11;
  v14 = 0;
  while (1)
  {
    objc_msgSend(v10, "substringWithRange:", v14, 4, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TIWordSearchWubixing shouldAutoCommitCode:withOption:](self, "shouldAutoCommitCode:withOption:", v15, a4);
    if (!v16)
      break;
    v17 = v16;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E80]), "initWithMecabraCandidate:", v16);
    objc_msgSend(v12, "addObject:", v18);
    objc_msgSend(v18, "mecabraCandidatePointerValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v19);

    v20 = objc_msgSend(v10, "length");
    v21 = v14 + 4;
    v22 = v14 + 8;
    v14 += 4;
    if (v22 >= v20)
      goto LABEL_7;
  }

  v21 = v14;
LABEL_7:
  v11 = v27;
  if (v21)
  {
    if (v26)
      *v26 = objc_retainAutorelease(v12);
    objc_msgSend(v27, "setAutoconvertedMecabraCandidates:candidateRefsDictionary:", v12, v13);
    objc_msgSend(v10, "substringFromIndex:", v21);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v23 = v10;
  }
  v24 = v23;

  return v24;
}

- (void)shouldAutoCommitCode:(id)a3 withOption:(unint64_t)a4
{
  id v6;
  void *v7;
  void *NextCandidate;
  char WubixingType;

  v6 = a3;
  -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v7, "analyzeString:options:", v6, a4);

  if (!(_DWORD)a4)
    return 0;
  -[TIWordSearch mecabra](self, "mecabra");
  NextCandidate = (void *)MecabraGetNextCandidate();
  WubixingType = MecabraCandidateGetWubixingType();
  if (!NextCandidate || (WubixingType & 2) != 0 || MecabraCandidateIsBilingualCandidate())
    return 0;
  return NextCandidate;
}

- (int)wubiStandard
{
  return self->_wubiStandard;
}

- (void)setWubiStandard:(int)a3
{
  self->_wubiStandard = a3;
}

uint64_t __55__TIWordSearchWubixing_uncachedCandidatesForOperation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isWubixingConvertedByPinyin") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isPrefixMatched");

  return v3;
}

@end
