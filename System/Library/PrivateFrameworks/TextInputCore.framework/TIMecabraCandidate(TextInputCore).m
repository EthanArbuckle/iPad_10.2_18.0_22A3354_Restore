@implementation TIMecabraCandidate(TextInputCore)

- (uint64_t)initWithMecabraCandidate:()TextInputCore
{
  return objc_msgSend(a1, "initWithMecabraCandidate:cursorMovement:", a3, 0);
}

- (uint64_t)initWithMecabraCandidate:()TextInputCore input:
{
  return objc_msgSend(a1, "initWithMecabraCandidate:input:cursorMovement:", a3, a4, 0);
}

- (uint64_t)initWithMecabraCandidate:()TextInputCore cursorMovement:
{
  return objc_msgSend(a1, "initWithMecabraCandidate:input:cursorMovement:", a3, 0, a4);
}

- (uint64_t)initWithMecabraCandidate:()TextInputCore input:cursorMovement:
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = a4;
  MecabraCandidateGetSurface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    MecabraCandidateGetAnalysisString();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "initWithCandidate:forInput:mecabraCandidatePointerValue:withFlags:deleteCount:cursorMovement:", v9, v8, v10, FlagsForCandidate(), 0, a5);

  return v11;
}

+ (uint64_t)inputFromMecabraCandidate:()TextInputCore
{
  return MecabraCandidateGetAnalysisString();
}

+ (uint64_t)convertedInputFromMecabraCandidate:()TextInputCore
{
  return MecabraCandidateGetConvertedAnalysisString();
}

+ (uint64_t)dictionaryReadingFromMecabraCandidate:()TextInputCore
{
  return MecabraCandidateGetDictionaryReading();
}

+ (id)displayReadingFromMecabraCandidate:()TextInputCore syllableSeparator:
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v23;
  __CFString *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t Surface;
  void *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!a3)
  {
    v8 = &stru_1EA1081D0;
    goto LABEL_37;
  }
  if (MecabraCandidateGetType() != 7)
  {
    v9 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
    v7 = (void *)objc_msgSend((id)MecabraCandidateGetAnalysisString(), "copy");
    if (!objc_msgSend(v9, "count"))
    {

      goto LABEL_22;
    }
    objc_msgSend(a1, "convertedInputFromMecabraCandidate:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v10, "length") + (objc_msgSend(v9, "count") - 1) * objc_msgSend(v6, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = v9;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v40;
        v36 = v9;
        v37 = v7;
        while (2)
        {
          v17 = 0;
          v18 = v15;
          do
          {
            if (*(_QWORD *)v40 != v16)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v17);
            if (objc_msgSend(v12, "length"))
              objc_msgSend(v12, "appendString:", v6);
            v20 = objc_msgSend(v19, "unsignedIntegerValue");
            v21 = objc_msgSend(v11, "length");
            v15 = v20 + v18;
            if (v20 > v21 || v15 > v21)
            {

              v9 = v36;
              v7 = v37;
              goto LABEL_28;
            }
            objc_msgSend(v11, "substringWithRange:", v18, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appendString:", v23);

            ++v17;
            v18 = v15;
          }
          while (v14 != v17);
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          v9 = v36;
          v7 = v37;
          if (v14)
            continue;
          break;
        }
      }
      else
      {
        v15 = 0;
      }

      if (v15 == objc_msgSend(v11, "length"))
      {
        v25 = v12;
      }
      else
      {
LABEL_28:
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel)
        {
          TIOSLogFacility();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v28 = v7;
            v29 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(obj, "valueForKey:", CFSTR("stringValue"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
            v31 = v9;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            Surface = MecabraCandidateGetSurface();
            v33 = v29;
            v7 = v28;
            objc_msgSend(v33, "stringWithFormat:", CFSTR("%s Invalid syllable lengths { %@ } for '%@'/'%@'"), "+[TIMecabraCandidate(TextInputCore) displayReadingFromMecabraCandidate:syllableSeparator:]", v32, Surface, v11);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v44 = v34;
            _os_log_debug_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            v9 = v31;
          }

        }
        v25 = v11;
      }
      v8 = (__CFString *)objc_msgSend(v25, "copy");

    }
    else
    {
      v8 = &stru_1EA1081D0;
    }

LABEL_37:
    v24 = v8;
    v7 = v24;
    goto LABEL_38;
  }
  MecabraCandidateGetSurface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v24 = &stru_1EA1081D0;
LABEL_38:

  return v7;
}

+ (id)mecabraCandidateWithCandidateRef:()TextInputCore autoconvertedCandidates:
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (v5)
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB68]), "initWithMecabraCandidate:autoconvertedCandidates:", a3, v5);
  else
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC88]), "initWithMecabraCandidate:", a3);
  v7 = (void *)v6;

  return v7;
}

@end
