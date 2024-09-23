@implementation UPContextualizerUtilities

+ (BOOL)hasTopCandidate:(id)a3 excedingProbability:(double)a4 matchingOneOfIntents:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  char v13;
  BOOL v14;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "candidateCount"))
  {
    objc_msgSend(v7, "candidateAtRank:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uncalibratedProbability");
    v12 = v11;
    v13 = objc_msgSend(v8, "containsObject:", v10);
    if (v12 > a4)
      v14 = v13;
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)filterResult:(id)a3 byEntityName:(id)a4 serializer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__UPContextualizerUtilities_filterResult_byEntityName_serializer___block_invoke;
  v12[3] = &unk_1E7BED4D0;
  v13 = v8;
  v14 = a1;
  v9 = v8;
  objc_msgSend(a1, "filterResult:serializer:predicate:", a3, a5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)resultFromResult:(id)a3 withNewIntent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UPResultCandidate *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  UPResultCandidate *v21;
  UPResult *v22;
  void *v23;
  UPResult *v24;
  uint64_t v26;
  id v27;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "candidateCount"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "candidateCount");
    v27 = v6;
    if (v8 >= 1)
    {
      v9 = 0;
      v26 = v8;
      do
      {
        objc_msgSend(v5, "candidateAtRank:", v9, v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [UPResultCandidate alloc];
        objc_msgSend(v10, "uncalibratedProbability");
        v13 = v12;
        objc_msgSend(v10, "calibratedProbability");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "utterance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "entities");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "modelIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "task");
        v18 = v7;
        v19 = v5;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[UPResultCandidate initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:](v11, "initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:", v14, v15, v27, v16, v17, v20, v13);

        v5 = v19;
        v7 = v18;

        objc_msgSend(v18, "addObject:", v21);
        ++v9;
      }
      while (v26 != v9);
    }
    v22 = [UPResult alloc];
    objc_msgSend(v5, "queryUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[UPResult initWithCandidates:queryUUID:](v22, "initWithCandidates:queryUUID:", v7, v23);

    v6 = v27;
  }
  else
  {
    v24 = (UPResult *)v5;
  }

  return v24;
}

+ (id)buildPayloadResultFromQuery:(id)a3 modelIdentifier:(id)a4 intent:(id)a5 entityName:(id)a6 serializer:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  UPResultCandidateEntity *v18;
  void *v19;
  void *v20;
  void *v21;
  UPResultCandidate *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  UPResult *v28;
  void *v29;
  void *v30;
  UPResult *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UPResultCandidateEntity *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v11, "utterance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    __assert_rtn("+[UPContextualizerUtilities buildPayloadResultFromQuery:modelIdentifier:intent:entityName:serializer:]", "UPContextualizerUtilities.m", 96, "utterance != nil");
  v17 = v16;
  v18 = -[UPResultCandidateEntity initWithRange:label:text:groupId:semanticValue:sharedEntityGraph:]([UPResultCandidateEntity alloc], "initWithRange:label:text:groupId:semanticValue:sharedEntityGraph:", 0, objc_msgSend(v16, "length"), v14, v16, 0, 0, 0);
  v39[0] = v18;
  v36 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appBundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serializeFromIntent:andEntities:forBundleId:", v13, v19, v20);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2DB8]), "initWithTask:", v35);
  v22 = [UPResultCandidate alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
  v34 = v15;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[UPResultCandidate initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:](v22, "initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:", v23, v17, v13, v24, v12, v21, 1.0);
  v33 = v13;
  v26 = v11;
  v27 = (void *)v25;

  v28 = [UPResult alloc];
  v37 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[UPResult initWithCandidates:queryUUID:](v28, "initWithCandidates:queryUUID:", v29, v30);

  return v31;
}

+ (id)entityLabelsFromCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "entities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "label");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)filterResult:(id)a3 serializer:(id)a4 predicate:(id)a5
{
  id v6;
  unsigned int (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  UPResult *v13;
  void *v14;
  UPResult *v15;

  v6 = a3;
  v7 = (unsigned int (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "candidateCount");
  if (v9 >= 1)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v6, "candidateAtRank:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7[2](v7, v12))
        objc_msgSend(v8, "addObject:", v12);

    }
  }
  v13 = [UPResult alloc];
  objc_msgSend(v6, "queryUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UPResult initWithCandidates:queryUUID:](v13, "initWithCandidates:queryUUID:", v8, v14);

  return v15;
}

+ (id)createConfirmOrRejectedDialogActsFor:(id)a3 reference:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  UPResultCandidate *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  UPResultCandidate *v22;
  void *v23;
  int v24;
  UPResult *v25;
  void *v26;
  UPResult *v27;
  id v29;
  void *v30;
  id v31;

  v5 = a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "candidateCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "candidateCount") >= 1)
  {
    v7 = 0;
    v8 = CFSTR("yes");
    v31 = v5;
    v30 = v6;
    while (1)
    {
      objc_msgSend(v5, "candidateAtRank:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "intent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v8);

      if (v11)
        break;
      objc_msgSend(v9, "intent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("no"));

      if (!v24)
      {
LABEL_11:
        objc_msgSend(v6, "addObject:", v9);
        goto LABEL_12;
      }
      v12 = objc_alloc_init(MEMORY[0x1E0DA2DB0]);
      if (objc_msgSend(MEMORY[0x1E0DA2DB0], "instancesRespondToSelector:", sel_setReference_))
        goto LABEL_5;
LABEL_6:
      if (!v12)
        goto LABEL_11;
      v13 = [UPResultCandidate alloc];
      objc_msgSend(v9, "uncalibratedProbability");
      v15 = v14;
      objc_msgSend(v9, "calibratedProbability");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "utterance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "intent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "entities");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "modelIdentifier");
      v20 = v8;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[UPResultCandidate initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:](v13, "initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:", v16, v17, v18, v19, v21, v12, v15);

      v8 = v20;
      v6 = v30;
      v5 = v31;

      objc_msgSend(v30, "addObject:", v22);
LABEL_12:

      if (objc_msgSend(v5, "candidateCount") <= ++v7)
        goto LABEL_13;
    }
    v12 = objc_alloc_init(MEMORY[0x1E0DA2D90]);
    if ((objc_msgSend(MEMORY[0x1E0DA2D90], "instancesRespondToSelector:", sel_setReference_) & 1) == 0)
      goto LABEL_6;
LABEL_5:
    objc_msgSend(v12, "setReference:", v29);
    goto LABEL_6;
  }
LABEL_13:
  v25 = [UPResult alloc];
  objc_msgSend(v5, "queryUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[UPResult initWithCandidates:queryUUID:](v25, "initWithCandidates:queryUUID:", v6, v26);

  return v27;
}

uint64_t __66__UPContextualizerUtilities_filterResult_byEntityName_serializer___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 40), "entityLabelsFromCandidate:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
