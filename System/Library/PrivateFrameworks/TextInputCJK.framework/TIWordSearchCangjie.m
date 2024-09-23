@implementation TIWordSearchCangjie

- (int)mecabraInputMethodType
{
  return 9;
}

- (id)initTIWordSearchWithInputMode:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIWordSearchCangjie;
  v3 = -[TIWordSearch initTIWordSearchWithInputMode:](&v6, sel_initTIWordSearchWithInputMode_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "setAutoCorrects:", 0);
  return v4;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  int v10;
  void *ASCIIFromInputKeyString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t NextCandidate;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEB5468]);
  v42 = v4;
  objc_msgSend(v4, "inputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = MEMORY[0x249597680]();
  v7 = -[TIWordSearchCangjie supportsEnglish](self, "supportsEnglish");
  v8 = -[TIWordSearchCangjie suchengEnabled](self, "suchengEnabled");
  if (objc_msgSend(v6, "length"))
  {
    if (-[TIWordSearch addFacemarkCandidatesToResultSet:forInput:](self, "addFacemarkCandidatesToResultSet:forInput:", v5, v6))
    {
      v9 = 0;
      v40 = 0;
      v10 = 0;
      if (!v7)
        goto LABEL_15;
    }
    else
    {
      v12 = 2048;
      if (!v8)
        v12 = 0;
      v13 = v12 | 0x200000;
      if (v7)
        v14 = v12;
      else
        v14 = v12 | 0x200000;
      v44 = 0;
      -[TIWordSearchShapeBased autoconvertLongestValidPrefixes:option:candidateResultSet:autoconvertedCandidateArray:](self, "autoconvertLongestValidPrefixes:option:candidateResultSet:autoconvertedCandidateArray:", v6, v12 | 0x200000, v5, &v44);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v44;
      v40 = v9 != 0;
      if (!v9)
        v13 = v14;
      -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v16, "analyzeString:options:", v15, v13);

      if (!v7)
        goto LABEL_15;
    }
LABEL_6:
    ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();
    goto LABEL_16;
  }
  v9 = 0;
  v40 = 0;
  v10 = 1;
  if (v7)
    goto LABEL_6;
LABEL_15:
  ASCIIFromInputKeyString = 0;
LABEL_16:
  v43 = v6;
  if (v10)
  {
    v17 = 0;
    while (1)
    {
      -[TIWordSearch mecabra](self, "mecabra");
      NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate)
        break;
      v19 = NextCandidate;
      objc_msgSend(MEMORY[0x24BEB4E80], "mecabraCandidateWithCandidateRef:autoconvertedCandidates:", NextCandidate, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addMecabraCandidate:mecabraCandidateRef:", v20, v19);
      if ((v17 & 1) == 0)
      {
        objc_msgSend(v20, "candidate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(ASCIIFromInputKeyString, "isEqualToString:", v21);

        if (v22)
          v17 = 1;
      }

    }
    v23 = v17 & 1;
    if (v7)
    {
LABEL_27:
      if (v40
        && (!v8 ? (v27 = 0) : (v27 = 2048),
            -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v29 = objc_msgSend(v28, "analyzeString:options:", v43, v27),
            v28,
            v29))
      {
        v30 = 0;
        v31 = 0x24BEB4000uLL;
        while (1)
        {
          -[TIWordSearch mecabra](self, "mecabra");
          v32 = MecabraGetNextCandidate();
          if (!v32)
            break;
          v33 = v32;
          if (!v30)
            v30 = objc_msgSend(v5, "nthIndexIgnoringExtensionCandidates:", 1);
          v34 = (void *)objc_msgSend(objc_alloc(*(Class *)(v31 + 3712)), "initWithMecabraCandidate:", v33);
          objc_msgSend(v5, "insertMecabraCandidate:mecabraCandidateRef:atIndex:", v34, v33, v30);
          if ((v23 & 1) != 0)
          {
            v35 = 0;
          }
          else
          {
            objc_msgSend(v34, "candidate");
            v36 = v31;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(ASCIIFromInputKeyString, "isEqualToString:", v37);

            v31 = v36;
          }
          ++v30;
          v23 |= v35;

        }
      }
      else
      {
        v30 = 0;
      }
      v26 = (void *)v41;
      v25 = v42;
      if ((v23 & 1) == 0)
      {
        if (!v30)
          v30 = objc_msgSend(v5, "nthIndexIgnoringExtensionCandidates:", 4);
        objc_msgSend(v5, "insertSyntheticMecabraCandidateWithSurface:input:atIndex:", ASCIIFromInputKeyString, v43, v30);
      }
      goto LABEL_47;
    }
  }
  else
  {
    v23 = 0;
    if (v7)
      goto LABEL_27;
  }
  objc_msgSend(v5, "candidates");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {

    v26 = (void *)v41;
    v25 = v42;
  }
  else
  {
    v38 = objc_msgSend(v43, "length");

    v26 = (void *)v41;
    v25 = v42;
    if (v38)
      objc_msgSend(v5, "addSyntheticMecabraCandidateWithSurface:input:", v43, v43);
  }
LABEL_47:

  objc_autoreleasePoolPop(v26);
  return v5;
}

- (BOOL)validateCode:(id)a3 withOption:(unint64_t)a4
{
  void *ASCIIFromInputKeyString;
  unsigned __int8 v7;
  id v8;
  objc_super v10;

  ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();
  if (-[TIWordSearchCangjie suchengEnabled](self, "suchengEnabled"))
  {
    v7 = (unint64_t)objc_msgSend(ASCIIFromInputKeyString, "length") <= 2
      && (objc_msgSend(ASCIIFromInputKeyString, "length") != 2
       || objc_msgSend(ASCIIFromInputKeyString, "characterAtIndex:", 1) != 122
       && (objc_msgSend(ASCIIFromInputKeyString, "isEqualToString:", CFSTR("ux")) & 1) == 0);
  }
  else if (objc_msgSend(ASCIIFromInputKeyString, "containsCangjieWildcard"))
  {
    v10.receiver = self;
    v10.super_class = (Class)TIWordSearchCangjie;
    v7 = -[TIWordSearchShapeBased validateCode:withOption:](&v10, sel_validateCode_withOption_, ASCIIFromInputKeyString, a4);
  }
  else
  {
    v8 = objc_retainAutorelease(ASCIIFromInputKeyString);
    objc_msgSend(v8, "UTF8String");
    objc_msgSend(v8, "length");
    v7 = MecabraCangjieCodeIsValid() != 0;
  }

  return v7;
}

- (BOOL)suchengEnabled
{
  return self->_suchengEnabled;
}

- (void)setSuchengEnabled:(BOOL)a3
{
  self->_suchengEnabled = a3;
}

- (BOOL)supportsEnglish
{
  return self->_supportsEnglish;
}

- (void)setSupportsEnglish:(BOOL)a3
{
  self->_supportsEnglish = a3;
}

@end
