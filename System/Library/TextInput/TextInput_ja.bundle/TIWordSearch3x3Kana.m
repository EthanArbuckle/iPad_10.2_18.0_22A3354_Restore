@implementation TIWordSearch3x3Kana

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  CFDictionaryKeyCallBacks keyCallBacks;

  v4 = a3;
  objc_msgSend(v4, "inputString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = objc_alloc_init(MEMORY[0x24BEB5468]);
  if (!-[TIWordSearch addFacemarkCandidatesToResultSet:forInput:](self, "addFacemarkCandidatesToResultSet:forInput:", v8, v5))
  {
    v30 = v8;
    objc_msgSend(v7, "contextString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v7, "flickUsed");
    v31 = v5;
    v9 = v5;
    if (!getNumericStringForTapsOnNumberPlane(NSString *)::symbolToNumberDictionary)
    {
      memset(&keyCallBacks, 0, 32);
      *(_OWORD *)&keyCallBacks.equal = xmmword_2501227D8;
      getNumericStringForTapsOnNumberPlane(NSString *)::symbolToNumberDictionary = (uint64_t)CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&getNumericStringForTapsOnNumberPlane(NSString *)::keys, (const void **)getNumericStringForTapsOnNumberPlane(NSString *)::values, 29, &keyCallBacks, MEMORY[0x24BDBD6B0]);
    }
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "length");
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        LOWORD(keyCallBacks.version) = 0;
        v14 = objc_msgSend(v9, "characterAtIndex:", i);
        LOWORD(keyCallBacks.version) = v14;
        CFDictionaryGetValue((CFDictionaryRef)getNumericStringForTapsOnNumberPlane(NSString *)::symbolToNumberDictionary, (const void *)v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v10, "appendString:", v15);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &keyCallBacks, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendString:", v16);

        }
      }
    }
    if ((objc_msgSend(v10, "isEqualToString:", v9) & 1) != 0)
      v32 = 0;
    else
      v32 = v10;

    v17 = objc_msgSend(v7, "predictionEnabled");
    v18 = objc_msgSend(v7, "reanalysisMode");
    objc_msgSend(v7, "geometryModelData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v7, "hardwareKeyboardMode");
    v21 = objc_msgSend(v7, "referenceMode");
    BYTE3(v29) = objc_msgSend(v7, "singlePhrase");
    BYTE2(v29) = v21;
    BYTE1(v29) = v20;
    LOBYTE(v29) = v33;
    -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v9, v6, v34, v17, v18, 0, v19, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v22);

    if (v32)
    {
      if (objc_msgSend(v9, "length") == 1)
        v23 = v33;
      else
        v23 = 1;
      if ((v23 & 1) == 0)
        -[TIWordSearchKana _insertString:input:at:force:](self, "_insertString:input:at:force:", v32, v9, 2, 1);
    }
    -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "candidates");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {

      v8 = v30;
      v5 = v31;
    }
    else
    {
      v26 = objc_msgSend(v9, "length");

      v8 = v30;
      v5 = v31;
      if (!v26)
      {
LABEL_25:

        goto LABEL_26;
      }
      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addSyntheticMecabraCandidateWithSurface:input:", v9, v9);
    }

    goto LABEL_25;
  }
  -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v8);
LABEL_26:
  -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

@end
