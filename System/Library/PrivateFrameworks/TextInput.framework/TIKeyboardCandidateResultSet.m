@implementation TIKeyboardCandidateResultSet

- (TIKeyboardCandidateResultSet)initWithCoder:(id)a3
{
  id v3;
  TIKeyboardCandidateResultSet *v4;
  void *v5;
  TIKeyboardCandidateResultSet *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardCandidateResultSet;
  v3 = a3;
  v4 = -[TIKeyboardCandidateResultSet init](&v12, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"), v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardCandidateResultSetCoder decodeWithData:](TIKeyboardCandidateResultSetCoder, "decodeWithData:", v5);
  v6 = (TIKeyboardCandidateResultSet *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("committedText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateResultSet setCommittedText:](v6, "setCommittedText:", v7);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uncommittedText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateResultSet setUncommittedText:](v6, "setUncommittedText:", v8);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acceptedCandidate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateResultSet setAcceptedCandidate:](v6, "setAcceptedCandidate:", v9);

  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("inputManagerHasPendingCandidatesUpdate"));
  -[TIKeyboardCandidateResultSet setInputManagerHasPendingCandidatesUpdate:](v6, "setInputManagerHasPendingCandidatesUpdate:", v10);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSString *committedText;
  TIKeyboardIntermediateText *uncommittedText;
  TIKeyboardCandidate *acceptedCandidate;
  void *v8;
  id v9;

  v9 = a3;
  +[TIKeyboardCandidateResultSetCoder encodeWithCandidateResultSet:](TIKeyboardCandidateResultSetCoder, "encodeWithCandidateResultSet:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("data"));
  committedText = self->_committedText;
  if (committedText)
    objc_msgSend(v9, "encodeObject:forKey:", committedText, CFSTR("committedText"));
  uncommittedText = self->_uncommittedText;
  if (uncommittedText)
    objc_msgSend(v9, "encodeObject:forKey:", uncommittedText, CFSTR("uncommittedText"));
  acceptedCandidate = self->_acceptedCandidate;
  v8 = v9;
  if (acceptedCandidate)
  {
    objc_msgSend(v9, "encodeObject:forKey:", acceptedCandidate, CFSTR("acceptedCandidate"));
    v8 = v9;
  }
  objc_msgSend(v8, "encodeBool:forKey:", self->_inputManagerHasPendingCandidatesUpdate, CFSTR("inputManagerHasPendingCandidatesUpdate"));

}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  -[TIKeyboardCandidateResultSet candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p count=%lu>"), v4, self, objc_msgSend(v5, "count"));

  -[TIKeyboardCandidateResultSet candidates](self, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "appendString:", CFSTR("(\n"));
    -[TIKeyboardCandidateResultSet candidates](self, "candidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(",\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v10);

    objc_msgSend(v6, "appendString:", CFSTR("\n)"));
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardCandidateResultSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TIKeyboardCandidate *v11;
  TIKeyboardCandidate *defaultCandidate;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  TIKeyboardCandidateGroup *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  uint64_t v59;
  NSString *committedText;
  TIKeyboardCandidate *v61;
  TIKeyboardCandidate *acceptedCandidate;
  uint64_t v63;
  NSArray *proactiveTriggers;
  TIKeyboardCandidateResultSet *v66;
  id obj;
  uint64_t v68;
  TIKeyboardCandidateResultSet *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  _NSZone *v75;
  uint64_t v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = -[TIKeyboardCandidateResultSet init](+[TIKeyboardCandidateResultSet allocWithZone:](TIKeyboardCandidateResultSet, "allocWithZone:"), "init");
  -[TIKeyboardCandidateResultSet candidates](self, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3);
    -[TIKeyboardCandidateResultSet candidates](self, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);
    -[TIKeyboardCandidateResultSet setCandidates:](v5, "setCandidates:", v9);

  }
  -[TIKeyboardCandidateResultSet setInitialSelectedIndex:](v5, "setInitialSelectedIndex:", -[TIKeyboardCandidateResultSet initialSelectedIndex](self, "initialSelectedIndex"));
  -[TIKeyboardCandidateResultSet defaultCandidate](self, "defaultCandidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[TIKeyboardCandidate copyWithZone:](self->_defaultCandidate, "copyWithZone:", a3);
    defaultCandidate = v5->_defaultCandidate;
    v5->_defaultCandidate = v11;

  }
  -[TIKeyboardCandidateResultSet sortMethods](self, "sortMethods");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3);
    -[TIKeyboardCandidateResultSet sortMethods](self, "sortMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithArray:copyItems:", v15, 1);
    -[TIKeyboardCandidateResultSet setSortMethods:](v5, "setSortMethods:", v16);

  }
  -[TIKeyboardCandidateResultSet indexTitles](self, "indexTitles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "allocWithZone:", a3);
    -[TIKeyboardCandidateResultSet indexTitles](self, "indexTitles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithDictionary:copyItems:", v19, 1);
    -[TIKeyboardCandidateResultSet setIndexTitles:](v5, "setIndexTitles:", v20);

  }
  -[TIKeyboardCandidateResultSet showExtensionCandidates](self, "showExtensionCandidates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "allocWithZone:", a3);
    -[TIKeyboardCandidateResultSet showExtensionCandidates](self, "showExtensionCandidates");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithDictionary:copyItems:", v23, 1);
    -[TIKeyboardCandidateResultSet setShowExtensionCandidates:](v5, "setShowExtensionCandidates:", v24);

  }
  -[TIKeyboardCandidateResultSet disambiguationCandidates](self, "disambiguationCandidates");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "allocWithZone:", a3);
    -[TIKeyboardCandidateResultSet disambiguationCandidates](self, "disambiguationCandidates");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithArray:copyItems:", v27, 1);
    -[TIKeyboardCandidateResultSet setDisambiguationCandidates:](v5, "setDisambiguationCandidates:", v28);

  }
  -[TIKeyboardCandidateResultSet setSelectedDisambiguationCandidateIndex:](v5, "setSelectedDisambiguationCandidateIndex:", -[TIKeyboardCandidateResultSet selectedDisambiguationCandidateIndex](self, "selectedDisambiguationCandidateIndex"));
  -[TIKeyboardCandidateResultSet sortMethodGroups](self, "sortMethodGroups");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[TIKeyboardCandidateResultSet candidates](self, "candidates");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v75 = a3;
      -[TIKeyboardCandidateResultSet candidates](self, "candidates");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v33 >= 1)
      {
        for (i = 0; i != v33; ++i)
        {
          -[TIKeyboardCandidateResultSet candidates](v5, "candidates");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndex:", i);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardCandidateResultSet candidates](self, "candidates");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndex:", i);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKey:", v37, v39);

        }
      }
      v40 = (void *)MEMORY[0x1E0C99E08];
      -[TIKeyboardCandidateResultSet sortMethodGroups](self, "sortMethodGroups", v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      -[TIKeyboardCandidateResultSet sortMethodGroups](self, "sortMethodGroups");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      if (v71)
      {
        v68 = *(_QWORD *)v87;
        v69 = self;
        do
        {
          v42 = 0;
          do
          {
            if (*(_QWORD *)v87 != v68)
              objc_enumerationMutation(obj);
            v73 = v42;
            v43 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v42);
            -[TIKeyboardCandidateResultSet sortMethodGroups](self, "sortMethodGroups");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v43;
            objc_msgSend(v44, "objectForKey:", v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v45, "count"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = 0u;
            v83 = 0u;
            v84 = 0u;
            v85 = 0u;
            v74 = v45;
            v46 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
            if (v46)
            {
              v47 = v46;
              v76 = *(_QWORD *)v83;
              do
              {
                for (j = 0; j != v47; ++j)
                {
                  if (*(_QWORD *)v83 != v76)
                    objc_enumerationMutation(v74);
                  v49 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
                  v50 = -[TIKeyboardCandidateGroup init](+[TIKeyboardCandidateGroup allocWithZone:](TIKeyboardCandidateGroup, "allocWithZone:", v75), "init");
                  objc_msgSend(v49, "title");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TIKeyboardCandidateGroup setTitle:](v50, "setTitle:", v51);

                  v80 = 0u;
                  v81 = 0u;
                  v78 = 0u;
                  v79 = 0u;
                  objc_msgSend(v49, "candidates");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
                  if (v53)
                  {
                    v54 = v53;
                    v55 = *(_QWORD *)v79;
                    do
                    {
                      for (k = 0; k != v54; ++k)
                      {
                        if (*(_QWORD *)v79 != v55)
                          objc_enumerationMutation(v52);
                        v57 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
                        objc_msgSend(v34, "objectForKey:", v57);
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v58)
                        {
                          v58 = (void *)objc_msgSend(v57, "copy");
                          objc_msgSend(v34, "setObject:forKey:", v58, v57);
                        }
                        -[TIKeyboardCandidateGroup addCandidate:](v50, "addCandidate:", v58);

                      }
                      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
                    }
                    while (v54);
                  }

                  objc_msgSend(v77, "addObject:", v50);
                }
                v47 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
              }
              while (v47);
            }

            objc_msgSend(v70, "setObject:forKey:", v77, v72);
            v42 = v73 + 1;
            self = v69;
          }
          while (v73 + 1 != v71);
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
        }
        while (v71);
      }

      v5 = v66;
      -[TIKeyboardCandidateResultSet setSortMethodGroups:](v66, "setSortMethodGroups:", v70);

      a3 = v75;
    }
  }
  v5->_generatedCandidateCount = self->_generatedCandidateCount;
  v5->_batchCandidateLocation = self->_batchCandidateLocation;
  v59 = -[NSString copy](self->_committedText, "copy");
  committedText = v5->_committedText;
  v5->_committedText = (NSString *)v59;

  objc_storeStrong((id *)&v5->_uncommittedText, self->_uncommittedText);
  v61 = -[TIKeyboardCandidate copyWithZone:](self->_acceptedCandidate, "copyWithZone:", a3);
  acceptedCandidate = v5->_acceptedCandidate;
  v5->_acceptedCandidate = v61;

  v63 = -[NSArray copyWithZone:](self->_proactiveTriggers, "copyWithZone:", a3);
  proactiveTriggers = v5->_proactiveTriggers;
  v5->_proactiveTriggers = (NSArray *)v63;

  v5->_inputManagerHasPendingCandidatesUpdate = self->_inputManagerHasPendingCandidatesUpdate;
  return v5;
}

- (BOOL)hasCandidates
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[TIKeyboardCandidateResultSet candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  if (v4 != 1)
    return 1;
  -[TIKeyboardCandidateResultSet candidates](self, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 != v7;

  return v8;
}

- (BOOL)hasOnlyProactiveCandidates
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TIKeyboardCandidateResultSet candidates](self, "candidates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "slotID"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)hasSupplementalCandidates
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_candidates;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v11);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v6 == (void *)v7)
        {

        }
        else
        {
          v8 = (void *)v7;
          v9 = objc_msgSend(v6, "isSupplementalItemCandidate");

          if ((v9 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }
LABEL_12:

  return v3;
}

- (NSArray)candidatesIfSupplemental
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_candidates;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v14);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 == (void *)v10)
        {

        }
        else
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(v9, "isSupplementalItemCandidate");

          if (v12)
            objc_msgSend(v3, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (TIKeyboardCandidate)firstCandidate
{
  void *v3;
  void *v4;

  if (-[TIKeyboardCandidateResultSet hasCandidates](self, "hasCandidates"))
  {
    -[TIKeyboardCandidateResultSet candidates](self, "candidates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (TIKeyboardCandidate *)v4;
}

- (BOOL)hasMetadata
{
  void *v2;
  BOOL v3;

  -[TIKeyboardCandidateResultSet sortMethodGroups](self, "sortMethodGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)isDummySet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[TIKeyboardCandidateResultSet candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[TIKeyboardCandidateResultSet candidates](self, "candidates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)positionInCandidateList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (-[TIKeyboardCandidateResultSet hasCandidates](self, "hasCandidates")
    && (-[TIKeyboardCandidateResultSet candidates](self, "candidates"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = 0;
    while (1)
    {
      -[TIKeyboardCandidateResultSet candidates](self, "candidates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "candidate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v4);

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v7)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TIKeyboardCandidateResultSet candidates](self, "candidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TIKeyboardCandidateResultSet)initWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  TIKeyboardCandidateResultSet *v26;
  uint64_t v27;
  NSArray *candidates;
  uint64_t v29;
  NSArray *disambiguationCandidates;
  uint64_t v31;
  TIKeyboardCandidate *defaultCandidate;
  uint64_t v33;
  NSArray *sortMethods;
  uint64_t v35;
  NSDictionary *sortMethodGroups;
  uint64_t v37;
  NSDictionary *indexTitles;
  uint64_t v39;
  NSDictionary *showExtensionCandidates;
  uint64_t v41;
  NSArray *proactiveTriggers;
  objc_super v44;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  v44.receiver = self;
  v44.super_class = (Class)TIKeyboardCandidateResultSet;
  v26 = -[TIKeyboardCandidateResultSet init](&v44, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v18, "copy");
    candidates = v26->_candidates;
    v26->_candidates = (NSArray *)v27;

    v26->_initialSelectedIndex = a4;
    v29 = objc_msgSend(v24, "copy");
    disambiguationCandidates = v26->_disambiguationCandidates;
    v26->_disambiguationCandidates = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    defaultCandidate = v26->_defaultCandidate;
    v26->_defaultCandidate = (TIKeyboardCandidate *)v31;

    v33 = objc_msgSend(v20, "copy");
    sortMethods = v26->_sortMethods;
    v26->_sortMethods = (NSArray *)v33;

    v35 = objc_msgSend(v21, "copy");
    sortMethodGroups = v26->_sortMethodGroups;
    v26->_sortMethodGroups = (NSDictionary *)v35;

    v37 = objc_msgSend(v22, "copy");
    indexTitles = v26->_indexTitles;
    v26->_indexTitles = (NSDictionary *)v37;

    v39 = objc_msgSend(v23, "copy");
    showExtensionCandidates = v26->_showExtensionCandidates;
    v26->_showExtensionCandidates = (NSDictionary *)v39;

    v26->_selectedDisambiguationCandidateIndex = a11;
    v41 = objc_msgSend(v25, "copy");
    proactiveTriggers = v26->_proactiveTriggers;
    v26->_proactiveTriggers = (NSArray *)v41;

  }
  return v26;
}

- (id)setByAppendingSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  TIKeyboardCandidateResultSet *v22;
  void *v24;
  TIKeyboardCandidateResultSet *v25;
  void *v26;
  unint64_t v27;
  void *v28;

  v4 = a3;
  if (objc_msgSend(v4, "batchCandidateLocation")
    && (v5 = objc_msgSend(v4, "generatedCandidateCount"), v5 == objc_msgSend(v4, "generatedCandidateCount"))
    && (v6 = objc_msgSend(v4, "batchCandidateLocation"),
        -[TIKeyboardCandidateResultSet candidates](self, "candidates"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 == v8))
  {
    v9 = (void *)MEMORY[0x1E0C99DE8];
    -[TIKeyboardCandidateResultSet candidates](self, "candidates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithArray:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "candidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObjectsFromArray:", v11);

    v25 = [TIKeyboardCandidateResultSet alloc];
    v27 = -[TIKeyboardCandidateResultSet initialSelectedIndex](self, "initialSelectedIndex");
    -[TIKeyboardCandidateResultSet defaultCandidate](self, "defaultCandidate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSet sortMethods](self, "sortMethods");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSet sortMethodGroups](self, "sortMethodGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSet indexTitles](self, "indexTitles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSet showExtensionCandidates](self, "showExtensionCandidates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardCandidateResultSet disambiguationCandidates](self, "disambiguationCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TIKeyboardCandidateResultSet selectedDisambiguationCandidateIndex](self, "selectedDisambiguationCandidateIndex");
    -[TIKeyboardCandidateResultSet proactiveTriggers](self, "proactiveTriggers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proactiveTriggers");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = v18;
    else
      v20 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TIKeyboardCandidateResultSet initWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:](v25, "initWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", v28, v27, v26, v24, v12, v13, v14, v15, v16, v21);

    -[TIKeyboardCandidateResultSet setGeneratedCandidateCount:](v22, "setGeneratedCandidateCount:", -[TIKeyboardCandidateResultSet generatedCandidateCount](self, "generatedCandidateCount"));
    -[TIKeyboardCandidateResultSet setBatchCandidateLocation:](v22, "setBatchCandidateLocation:", objc_msgSend(v4, "batchCandidateLocation"));

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)isSubsetOf:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[TIKeyboardCandidateResultSet generatedCandidateCount](self, "generatedCandidateCount");
  if (v5 != objc_msgSend(v4, "generatedCandidateCount"))
    goto LABEL_3;
  -[TIKeyboardCandidateResultSet candidates](self, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v4, "candidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 <= v9)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[TIKeyboardCandidateResultSet candidates](self, "candidates", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "candidates");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", v14 + i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 != v19)
          {
            v10 = 0;
            goto LABEL_14;
          }
        }
        v14 += i;
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_14:

  }
  else
  {
LABEL_3:
    v10 = 0;
  }

  return v10;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (unint64_t)initialSelectedIndex
{
  return self->_initialSelectedIndex;
}

- (void)setInitialSelectedIndex:(unint64_t)a3
{
  self->_initialSelectedIndex = a3;
}

- (TIKeyboardCandidate)defaultCandidate
{
  return self->_defaultCandidate;
}

- (void)setDefaultCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)sortMethods
{
  return self->_sortMethods;
}

- (void)setSortMethods:(id)a3
{
  objc_storeStrong((id *)&self->_sortMethods, a3);
}

- (NSDictionary)sortMethodGroups
{
  return self->_sortMethodGroups;
}

- (void)setSortMethodGroups:(id)a3
{
  objc_storeStrong((id *)&self->_sortMethodGroups, a3);
}

- (NSDictionary)indexTitles
{
  return self->_indexTitles;
}

- (void)setIndexTitles:(id)a3
{
  objc_storeStrong((id *)&self->_indexTitles, a3);
}

- (NSDictionary)showExtensionCandidates
{
  return self->_showExtensionCandidates;
}

- (void)setShowExtensionCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_showExtensionCandidates, a3);
}

- (NSArray)disambiguationCandidates
{
  return self->_disambiguationCandidates;
}

- (void)setDisambiguationCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationCandidates, a3);
}

- (unint64_t)generatedCandidateCount
{
  return self->_generatedCandidateCount;
}

- (void)setGeneratedCandidateCount:(unint64_t)a3
{
  self->_generatedCandidateCount = a3;
}

- (unint64_t)batchCandidateLocation
{
  return self->_batchCandidateLocation;
}

- (void)setBatchCandidateLocation:(unint64_t)a3
{
  self->_batchCandidateLocation = a3;
}

- (unint64_t)selectedDisambiguationCandidateIndex
{
  return self->_selectedDisambiguationCandidateIndex;
}

- (void)setSelectedDisambiguationCandidateIndex:(unint64_t)a3
{
  self->_selectedDisambiguationCandidateIndex = a3;
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (BOOL)excludedExtensionCandidates
{
  return self->_excludedExtensionCandidates;
}

- (void)setExcludedExtensionCandidates:(BOOL)a3
{
  self->_excludedExtensionCandidates = a3;
}

- (NSString)committedText
{
  return self->_committedText;
}

- (void)setCommittedText:(id)a3
{
  objc_storeStrong((id *)&self->_committedText, a3);
}

- (TIKeyboardIntermediateText)uncommittedText
{
  return self->_uncommittedText;
}

- (void)setUncommittedText:(id)a3
{
  objc_storeStrong((id *)&self->_uncommittedText, a3);
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (void)setAcceptedCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedCandidate, a3);
}

- (BOOL)inputManagerHasPendingCandidatesUpdate
{
  return self->_inputManagerHasPendingCandidatesUpdate;
}

- (void)setInputManagerHasPendingCandidatesUpdate:(BOOL)a3
{
  self->_inputManagerHasPendingCandidatesUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
  objc_storeStrong((id *)&self->_uncommittedText, 0);
  objc_storeStrong((id *)&self->_committedText, 0);
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_disambiguationCandidates, 0);
  objc_storeStrong((id *)&self->_showExtensionCandidates, 0);
  objc_storeStrong((id *)&self->_indexTitles, 0);
  objc_storeStrong((id *)&self->_sortMethodGroups, 0);
  objc_storeStrong((id *)&self->_sortMethods, 0);
  objc_storeStrong((id *)&self->_defaultCandidate, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3
{
  return (TIKeyboardCandidateResultSet *)objc_msgSend(a1, "setWithCandidates:proactiveTriggers:", a3, 0);
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", v7, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v6);

  return (TIKeyboardCandidateResultSet *)v8;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", v24, a4, v23, v22, v21, v20, v19, v18, a11, 0);

  return (TIKeyboardCandidateResultSet *)v25;
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 disambiguationCandidates:(id)a10 selectedDisambiguationCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;

  v18 = a12;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a3;
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", v25, a4, v24, v23, v22, v21, v20, v19, a11, v18);

  return (TIKeyboardCandidateResultSet *)v26;
}

+ (id)dummySet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__TIKeyboardCandidateResultSet_dummySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dummySet___onceToken != -1)
    dispatch_once(&dummySet___onceToken, block);
  return (id)dummySet___dummySet;
}

void __40__TIKeyboardCandidateResultSet_dummySet__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithCandidates:proactiveTriggers:", v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)dummySet___dummySet;
  dummySet___dummySet = v3;

}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 initiallyHiddenCandidates:(id)a10 selectedHiddenCandidateIndex:(unint64_t)a11
{
  return (TIKeyboardCandidateResultSet *)objc_msgSend(a1, "setWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:", a3, a4, a5, a6, a7, a8);
}

+ (TIKeyboardCandidateResultSet)setWithCandidates:(id)a3 initialSelectedIndex:(unint64_t)a4 defaultCandidate:(id)a5 sortMethods:(id)a6 sortMethodGroups:(id)a7 indexTitles:(id)a8 showExtensionCandidates:(id)a9 initiallyHiddenCandidates:(id)a10 selectedHiddenCandidateIndex:(unint64_t)a11 proactiveTriggers:(id)a12
{
  return (TIKeyboardCandidateResultSet *)objc_msgSend(a1, "setWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", a3, a4, a5, a6, a7, a8);
}

@end
