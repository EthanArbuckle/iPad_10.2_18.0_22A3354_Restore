@implementation UPResultCandidate

- (NSString)annotatedString
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSDictionary *candidateEntitiesByStartIndex;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unichar v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = -[NSString length](self->_utterance, "length");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      candidateEntitiesByStartIndex = self->__candidateEntitiesByStartIndex;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](candidateEntitiesByStartIndex, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "annotatedEntityFragmentString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v10);

        objc_msgSend(v9, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

      }
      else
      {
        v15 = 0;
        v15 = -[NSString characterAtIndex:](self->_utterance, "characterAtIndex:", v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v15, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v13);

        v12 = 1;
      }
      v6 += v12;

    }
    while (v6 < v5);
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(v3, "appendString:", CFSTR("- "));
  objc_msgSend(v3, "appendString:", self->_intent);
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  return (NSString *)v3;
}

- (double)probability
{
  NSNumber *calibratedProbability;
  double result;

  calibratedProbability = self->_calibratedProbability;
  if (!calibratedProbability)
    return self->_uncalibratedProbability;
  -[NSNumber doubleValue](calibratedProbability, "doubleValue");
  return result;
}

- (UPResultCandidate)initWithUncalibratedProbability:(double)a3 calibratedProbability:(id)a4 utterance:(id)a5 intent:(id)a6 entities:(id)a7 modelIdentifier:(id)a8 task:(id)a9
{
  id v17;
  id v18;
  id v19;
  UPResultCandidate *v20;
  UPResultCandidate *v21;
  uint64_t v22;
  NSDictionary *candidateEntitiesByStartIndex;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a4;
  v26 = a5;
  v25 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)UPResultCandidate;
  v20 = -[UPResultCandidate init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_uncalibratedProbability = a3;
    objc_storeStrong((id *)&v20->_calibratedProbability, a4);
    objc_storeStrong((id *)&v21->_utterance, a5);
    objc_storeStrong((id *)&v21->_intent, a6);
    objc_storeStrong((id *)&v21->_entities, a7);
    +[UPResultCandidate _buildCandidateEntitiesByStartIndex:](UPResultCandidate, "_buildCandidateEntitiesByStartIndex:", v21->_entities);
    v22 = objc_claimAutoreleasedReturnValue();
    candidateEntitiesByStartIndex = v21->__candidateEntitiesByStartIndex;
    v21->__candidateEntitiesByStartIndex = (NSDictionary *)v22;

    objc_storeStrong((id *)&v21->_modelIdentifier, a8);
    objc_storeStrong((id *)&v21->_task, a9);
  }

  return v21;
}

- (id)_intermediateNodeRepresentations:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  UPResultLeafNode *v12;
  void *v13;
  void *v14;
  UPResultLeafNode *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  UPResultIntermediateNode *v33;
  id obj;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v9, "higherLevelParentLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "higherLevelChildLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [UPResultLeafNode alloc];
        objc_msgSend(v9, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "semanticValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[UPResultLeafNode initWithLabel:andText:andSemanticValue:](v12, "initWithLabel:andText:andSemanticValue:", v11, v13, v14);

        objc_msgSend(v4, "objectForKey:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v17, v10);

        }
        objc_msgSend(v4, "objectForKey:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "groupId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v9, "groupId");
        else
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 0x7FFFFFFFFFFFFFFFLL);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v22, v20);

        }
        objc_msgSend(v18, "objectForKey:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v15);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v6);
  }

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v38 = v4;
  v37 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(v38);
        v26 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v38, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v40;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v40 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(v27, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = -[UPResultIntermediateNode initWithLabel:andLeafNodes:]([UPResultIntermediateNode alloc], "initWithLabel:andLeafNodes:", v26, v32);
              objc_msgSend(v24, "addObject:", v33);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          }
          while (v29);
        }

      }
      v37 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v37);
  }

  return v24;
}

- (UPResultRootNode)rootNodeRepresentation
{
  return (UPResultRootNode *)+[UPUtilities rootNodeRepresentationForIntent:andEntities:](UPUtilities, "rootNodeRepresentationForIntent:andEntities:", self->_intent, self->_entities);
}

- (id)copyWithZone:(_NSZone *)a3
{
  UPResultCandidate *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UPResultCandidate *v13;

  v4 = +[UPResultCandidate allocWithZone:](UPResultCandidate, "allocWithZone:", a3);
  -[UPResultCandidate uncalibratedProbability](self, "uncalibratedProbability");
  v6 = v5;
  -[UPResultCandidate calibratedProbability](self, "calibratedProbability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPResultCandidate utterance](self, "utterance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPResultCandidate intent](self, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPResultCandidate entities](self, "entities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPResultCandidate modelIdentifier](self, "modelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPResultCandidate task](self, "task");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UPResultCandidate initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:](v4, "initWithUncalibratedProbability:calibratedProbability:utterance:intent:entities:modelIdentifier:task:", v7, v8, v9, v10, v11, v12, v6);

  return v13;
}

- (SIRINLUEXTERNALUserParse)protobufRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D9F9B0]);
  -[UPResultCandidate bestAvailableProbability](self, "bestAvailableProbability");
  objc_msgSend(v3, "setProbability:");
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = (void *)MEMORY[0x1E0D9FAC0];
  -[UPResultCandidate task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertFromUserDialogAct:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserDialogActs:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0D9F980]);
  objc_msgSend(v9, "setAlgorithm:", 2);
  objc_msgSend(v9, "setParserId:", 6);
  objc_msgSend(v3, "setParser:", v9);

  return (SIRINLUEXTERNALUserParse *)v3;
}

- (double)bestAvailableProbability
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UPResultCandidate calibratedProbability](self, "calibratedProbability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  SNLPOSLoggerForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      -[UPResultCandidate uncalibratedProbability](self, "uncalibratedProbability");
      v7 = v6;
      -[UPResultCandidate calibratedProbability](self, "calibratedProbability");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218242;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1C2196000, v4, OS_LOG_TYPE_DEBUG, "Result candidate has uncalibrated probability %f and calibrated probability %@. Using calibrated value.", (uint8_t *)&v15, 0x16u);

    }
    -[UPResultCandidate calibratedProbability](self, "calibratedProbability");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  else
  {
    if (v5)
    {
      -[UPResultCandidate uncalibratedProbability](self, "uncalibratedProbability");
      v15 = 134217984;
      v16 = v12;
      _os_log_impl(&dword_1C2196000, v4, OS_LOG_TYPE_DEBUG, "Result candidate has uncalibrated probability %f and no calibrated probability. Using uncalibrated value.", (uint8_t *)&v15, 0xCu);
    }

    -[UPResultCandidate uncalibratedProbability](self, "uncalibratedProbability");
    return v13;
  }
  return v11;
}

- (UPModelIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (SIRINLUUserDialogAct)task
{
  return (SIRINLUUserDialogAct *)objc_getProperty(self, a2, 16, 1);
}

- (double)uncalibratedProbability
{
  return self->_uncalibratedProbability;
}

- (NSNumber)calibratedProbability
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)entities
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)_candidateEntitiesByStartIndex
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)utterance
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (UPUsoSerializer)usoSerializer
{
  return (UPUsoSerializer *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoSerializer, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->__candidateEntitiesByStartIndex, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_calibratedProbability, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

+ (id)_buildCandidateEntitiesByStartIndex:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "range", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

@end
