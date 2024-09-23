@implementation TIWordSearchRomajiKana

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Romakana *v15;
  Romakana *romakana;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  void *v54;
  unsigned int v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;

  v4 = a3;
  objc_msgSend(v4, "inputString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextString");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "segmentBreakIndex");
  v57 = objc_msgSend(v4, "hardwareKeyboardMode");
  v8 = objc_msgSend(v4, "predictionEnabled");
  v9 = objc_msgSend(v4, "reanalysisMode");
  -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", 0);
  objc_msgSend(v4, "setCandidateAfterSegmentBreak:", 0);
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v6, "inputs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      v50 = objc_msgSend(v4, "predictionEnabled");
      v51 = objc_msgSend(v4, "reanalysisMode");
      v52 = objc_msgSend(v4, "referenceMode");
      BYTE3(v53) = objc_msgSend(v4, "singlePhrase");
      BYTE2(v53) = v52;
      BYTE1(v53) = v57;
      LOBYTE(v53) = 0;
      -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", &stru_250122EC0, v6, v59, v50, v51, 0, 0, v53);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v17);
      goto LABEL_33;
    }
  }
  objc_msgSend(v6, "inputs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(v6, "asSearchString");
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v14;
  }
  if (!self->_romakana)
  {
    v15 = objc_alloc_init(Romakana);
    romakana = self->_romakana;
    self->_romakana = v15;

  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringFromIndex:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringToIndex:", v7);
    v18 = objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v9 = 1;
    v5 = (id)v18;
  }
  v5 = v5;
  v19 = v5;
  if ((objc_msgSend(v4, "allowIncompleteRomaji") & 1) == 0)
  {
    v19 = v5;
    if ((objc_msgSend(v4, "predictionEnabled") & 1) == 0)
    {
      v19 = v5;
      if (!v17)
      {
        -[Romakana adjustIncompleteRomaji:](self->_romakana, "adjustIncompleteRomaji:", v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v20 = objc_alloc_init(MEMORY[0x24BEB5468]);
  v58 = v6;
  v55 = v8;
  v56 = v20;
  if (-[TIWordSearch addFacemarkCandidatesToResultSet:forInput:](self, "addFacemarkCandidatesToResultSet:forInput:", v20, v5))
  {
    -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v20);
  }
  else
  {
    if (v57)
    {
      v21 = objc_msgSend(v4, "referenceMode");
      BYTE3(v53) = objc_msgSend(v4, "singlePhrase");
      BYTE2(v53) = v21;
      LOWORD(v53) = 256;
      -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v19, v6, v59, v8, v9, 0, 0, v53);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v22);
    }
    else
    {
      objc_msgSend(v4, "target");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "geometryModelData");
      v54 = v17;
      v23 = v9;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v4, "referenceMode");
      BYTE3(v53) = objc_msgSend(v4, "singlePhrase");
      BYTE2(v53) = v25;
      LOWORD(v53) = 0;
      -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v19, v58, v59, v8, v23, v22, v24, v53);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v26);

      v9 = v23;
      v17 = v54;
    }

  }
  -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "candidates");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
  {

LABEL_24:
    goto LABEL_25;
  }
  v29 = objc_msgSend(v19, "length");

  if (v29)
  {
    -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSyntheticMecabraCandidateWithSurface:input:", v19, v19);
    goto LABEL_24;
  }
LABEL_25:
  if (objc_msgSend(v17, "length"))
  {
    -[Romakana adjustIncompleteRomaji:](self->_romakana, "adjustIncompleteRomaji:", v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "candidates");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "candidate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = objc_msgSend(v4, "referenceMode");
      BYTE3(v53) = objc_msgSend(v4, "singlePhrase");
      BYTE2(v53) = (_BYTE)v32;
      LOWORD(v53) = 256;
      -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v30, v58, v34, v55, v9, 0, 0, v53);
    }
    else
    {
      objc_msgSend(v4, "target");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "geometryModelData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v4, "referenceMode");
      BYTE3(v53) = objc_msgSend(v4, "singlePhrase");
      BYTE2(v53) = v35;
      LOWORD(v53) = 0;
      -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v30, v58, v5, v55, v9, v33, v34, v53);
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "candidates");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    if (v38)
    {
      objc_msgSend(v36, "candidates");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCandidateAfterSegmentBreak:", v40);

      objc_msgSend(v36, "candidates");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v43 = v30;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setCandidateAfterSegmentBreak:", v42);

      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "candidateRefsDictionary");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "candidateRefsDictionary");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addEntriesFromDictionary:", v47);

      v30 = v43;
    }

  }
  v6 = v58;
LABEL_33:

  -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (BOOL)isAnalyzingJapaneseRomaji
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_romakana, 0);
}

@end
