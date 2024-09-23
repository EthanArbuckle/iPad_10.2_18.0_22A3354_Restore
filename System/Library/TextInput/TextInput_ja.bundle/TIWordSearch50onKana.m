@implementation TIWordSearch50onKana

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  char v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TIWordSearch50onKana *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = a3;
  objc_msgSend(v4, "inputString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "segmentBreakIndex");
  v8 = objc_msgSend(v4, "predictionEnabled");
  v9 = objc_msgSend(v4, "reanalysisMode");
  v10 = objc_alloc_init(MEMORY[0x24BEB5468]);
  if (-[TIWordSearch addFacemarkCandidatesToResultSet:forInput:](self, "addFacemarkCandidatesToResultSet:forInput:", v10, v5))
  {
    -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v10);
    goto LABEL_20;
  }
  v51 = v6;
  v49 = v10;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v52 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringFromIndex:", v7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringToIndex:", v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v9 = 1;
    v5 = (void *)v11;
  }
  objc_msgSend(v4, "contextString");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "flickUsed");
  objc_msgSend(v4, "geometryModelData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "hardwareKeyboardMode");
  v16 = objc_msgSend(v4, "referenceMode");
  BYTE3(v47) = objc_msgSend(v4, "singlePhrase");
  BYTE2(v47) = v16;
  BYTE1(v47) = v15;
  LOBYTE(v47) = v13;
  v6 = v51;
  v50 = (void *)v12;
  HIDWORD(v47) = v9;
  -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](self, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v5, v51, v12, v8, v9, 0, v14, v47);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIWordSearchKana setCandidateResultSet:](self, "setCandidateResultSet:", v17);

  -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "candidates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {

LABEL_10:
    goto LABEL_11;
  }
  v20 = objc_msgSend(v5, "length");

  if (v20)
  {
    -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSyntheticMecabraCandidateWithSurface:input:", v5, v5);
    goto LABEL_10;
  }
LABEL_11:
  if (objc_msgSend(v52, "length"))
  {
    if (objc_msgSend(v4, "hardwareKeyboardMode"))
    {
      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "candidates");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "candidate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v21) = objc_msgSend(v4, "referenceMode");
      BYTE3(v48) = objc_msgSend(v4, "singlePhrase");
      BYTE2(v48) = (_BYTE)v21;
      LOWORD(v48) = 256;
      v46 = 0;
      v25 = self;
      v26 = v52;
      v27 = v51;
      v28 = v24;
      v29 = v8;
      v30 = HIDWORD(v48);
      v31 = 0;
    }
    else
    {
      objc_msgSend(v4, "target");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "geometryModelData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v4, "referenceMode");
      BYTE3(v48) = objc_msgSend(v4, "singlePhrase");
      BYTE2(v48) = v32;
      LOWORD(v48) = 0;
      v46 = v24;
      v25 = self;
      v26 = v52;
      v27 = v51;
      v28 = v5;
      v29 = v8;
      v30 = HIDWORD(v48);
      v31 = v23;
    }
    -[TIWordSearchKana makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:](v25, "makeCandidates:input:contextString:predictionEnabled:reanalysisMode:withInputManager:geometryModelData:flickUsed:hardwareKeyboardMode:referenceMode:singlePhrase:", v26, v27, v28, v29, v30, v31, v46, v48);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "candidates");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      objc_msgSend(v33, "candidates");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCandidateAfterSegmentBreak:", v37);

      objc_msgSend(v33, "candidates");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setCandidateAfterSegmentBreak:", v39);

      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "candidateRefsDictionary");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "candidateRefsDictionary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addEntriesFromDictionary:", v43);

    }
    else
    {
      objc_msgSend(v4, "setCandidateAfterSegmentBreak:", 0);
      -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setCandidateAfterSegmentBreak:", 0);
    }

    v6 = v51;
  }

  v10 = v49;
LABEL_20:
  -[TIWordSearchKana candidateResultSet](self, "candidateResultSet");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

@end
