@implementation AutocorrectionResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("context: [%@]\n"), v4);

  -[AutocorrectionResult touched](self, "touched");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("        touched: [%@]\n"), v5);

  -[AutocorrectionResult inserted](self, "inserted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("       inserted: [%@]\n"), v6);

  -[AutocorrectionResult corrected](self, "corrected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("      corrected: [%@]\n"), v7);

  -[AutocorrectionResult intended](self, "intended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("       expected: [%@]\n"), v8);

  -[AutocorrectionResult intendedTransliteration](self, "intendedTransliteration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" expected trans: [%@]\n"), v9);

  -[AutocorrectionResult input](self, "input");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("          input: [%@]\n"), v10);

  -[AutocorrectionResult numberOfTouches](self, "numberOfTouches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("     numTouches: [%@]\n"), v11);

  -[AutocorrectionResult seed](self, "seed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("           seed: %@\n"), v12);

  -[AutocorrectionResult rank](self, "rank");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("           rank: %@\n"), CFSTR("NSNotFound"));
  }
  else
  {
    -[AutocorrectionResult rank](self, "rank");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("           rank: %@\n"), v15);

  }
  -[AutocorrectionResult aggdStatistics](self, "aggdStatistics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" aggdStatistics: %@\n"), v16);

  objc_msgSend(v3, "appendString:", CFSTR("       failures:"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AutocorrectionResult tags](self, "tags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  return v3;
}

- (void)setTagsFromClassifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "doesMatchResult:", self, (_QWORD)v13))
        {
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[AutocorrectionResult setTags:](self, "setTags:", v5);
}

- (AutocorrectionResult)initWithCoder:(id)a3
{
  id v4;
  AutocorrectionResult *v5;
  void *v6;
  uint64_t v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AutocorrectionResult;
  v5 = -[AutocorrectionResult init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ARContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setContext:](v5, "setContext:", v9);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARTouched"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setTouched:](v5, "setTouched:", v10);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARPredicted"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setPredicted:](v5, "setPredicted:", v11);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARInlineCompletions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setInlineCompletions:](v5, "setInlineCompletions:", v12);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARDocumentStates"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setDocumentStates:](v5, "setDocumentStates:", v13);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARInserted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setInserted:](v5, "setInserted:", v14);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARCorrected"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setCorrected:](v5, "setCorrected:", v15);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARIntended"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setIntended:](v5, "setIntended:", v16);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARIntendedTransliteration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setIntendedTransliteration:](v5, "setIntendedTransliteration:", v17);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARInput"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setInput:](v5, "setInput:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ARNumberOfTouches"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setNumberOfTouches:](v5, "setNumberOfTouches:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ARSeed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setSeed:](v5, "setSeed:", v20);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ARTags"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setTags:](v5, "setTags:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ARRank"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setRank:](v5, "setRank:", v22);

    -[AutocorrectionResult setAggdStatistics:](v5, "setAggdStatistics:", 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ARDebug"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v23, 0, &v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
      -[AutocorrectionResult setDebugData:](v5, "setDebugData:", v24);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  -[AutocorrectionResult context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ARContext"));

  -[AutocorrectionResult touched](self, "touched");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ARTouched"));

  -[AutocorrectionResult predicted](self, "predicted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ARPredicted"));

  -[AutocorrectionResult inlineCompletions](self, "inlineCompletions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ARInlineCompletions"));

  -[AutocorrectionResult documentStates](self, "documentStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ARDocumentStates"));

  -[AutocorrectionResult inserted](self, "inserted");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("ARInserted"));

  -[AutocorrectionResult corrected](self, "corrected");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("ARCorrected"));

  -[AutocorrectionResult intended](self, "intended");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ARIntended"));

  -[AutocorrectionResult intendedTransliteration](self, "intendedTransliteration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("ARIntendedTransliteration"));

  -[AutocorrectionResult input](self, "input");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("ARInput"));

  -[AutocorrectionResult numberOfTouches](self, "numberOfTouches");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("ARNumberOfTouches"));

  -[AutocorrectionResult seed](self, "seed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("ARSeed"));

  -[AutocorrectionResult tags](self, "tags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("ARTags"));

  -[AutocorrectionResult rank](self, "rank");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("ARRank"));

  v19 = (void *)MEMORY[0x24BDD1608];
  -[AutocorrectionResult debugData](self, "debugData");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = v20;
  else
    v22 = MEMORY[0x24BDBD1B8];
  v24 = 0;
  objc_msgSend(v19, "dataWithJSONObject:options:error:", v22, 0, &v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("ARDebug"));
}

- (void)extractDataFromTypingLog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
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
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  v4 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __49__AutocorrectionResult_extractDataFromTypingLog___block_invoke;
  v32 = &unk_24FD48E80;
  v40 = &v41;
  v12 = v5;
  v33 = v12;
  v13 = v9;
  v34 = v13;
  v14 = v7;
  v35 = v14;
  v15 = v8;
  v36 = v15;
  v16 = v10;
  v37 = v16;
  v17 = v6;
  v38 = v17;
  v18 = v11;
  v39 = v18;
  objc_msgSend(v4, "enumerateKeystrokesAndPathsForTokensWithBlock:", &v29);
  v19 = (void *)objc_msgSend(v12, "copy", v29, v30, v31, v32);
  -[AutocorrectionResult setTouched:](self, "setTouched:", v19);

  v20 = (void *)objc_msgSend(v14, "copy");
  -[AutocorrectionResult setPredicted:](self, "setPredicted:", v20);

  v21 = (void *)objc_msgSend(v15, "copy");
  -[AutocorrectionResult setInlineCompletions:](self, "setInlineCompletions:", v21);

  v22 = (void *)objc_msgSend(v13, "copy");
  -[AutocorrectionResult setInserted:](self, "setInserted:", v22);

  v23 = (void *)objc_msgSend(v16, "copy");
  -[AutocorrectionResult setDocumentStates:](self, "setDocumentStates:", v23);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v42[3]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setNumberOfTouches:](self, "setNumberOfTouches:", v24);

  objc_msgSend(v4, "getDebugData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setDebugData:](self, "setDebugData:", v25);

  v26 = (void *)objc_msgSend(v17, "copy");
  -[AutocorrectionResult setTouchEvents:](self, "setTouchEvents:", v26);

  v27 = (void *)objc_msgSend(v18, "copy");
  -[AutocorrectionResult setPathsForWords:](self, "setPathsForWords:", v27);

  objc_msgSend(v4, "intendedTransliterationSequence");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    -[AutocorrectionResult setIntendedTransliteration:](self, "setIntendedTransliteration:", v28);

  _Block_object_dispose(&v41, 8);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (void)setSourceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMetadata, a3);
}

- (NSArray)touched
{
  return self->_touched;
}

- (void)setTouched:(id)a3
{
  objc_storeStrong((id *)&self->_touched, a3);
}

- (NSArray)touchEvents
{
  return self->_touchEvents;
}

- (void)setTouchEvents:(id)a3
{
  objc_storeStrong((id *)&self->_touchEvents, a3);
}

- (NSDictionary)pathsForWords
{
  return self->_pathsForWords;
}

- (void)setPathsForWords:(id)a3
{
  objc_storeStrong((id *)&self->_pathsForWords, a3);
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (void)setInserted:(id)a3
{
  objc_storeStrong((id *)&self->_inserted, a3);
}

- (NSArray)predicted
{
  return self->_predicted;
}

- (void)setPredicted:(id)a3
{
  objc_storeStrong((id *)&self->_predicted, a3);
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setInlineCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_inlineCompletions, a3);
}

- (NSArray)corrected
{
  return self->_corrected;
}

- (void)setCorrected:(id)a3
{
  objc_storeStrong((id *)&self->_corrected, a3);
}

- (NSArray)intended
{
  return self->_intended;
}

- (void)setIntended:(id)a3
{
  objc_storeStrong((id *)&self->_intended, a3);
}

- (NSArray)intendedTransliteration
{
  return self->_intendedTransliteration;
}

- (void)setIntendedTransliteration:(id)a3
{
  objc_storeStrong((id *)&self->_intendedTransliteration, a3);
}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (NSArray)documentStates
{
  return self->_documentStates;
}

- (void)setDocumentStates:(id)a3
{
  objc_storeStrong((id *)&self->_documentStates, a3);
}

- (NSNumber)numberOfTouches
{
  return self->_numberOfTouches;
}

- (void)setNumberOfTouches:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfTouches, a3);
}

- (NSNumber)corpusId
{
  return self->_corpusId;
}

- (void)setCorpusId:(id)a3
{
  objc_storeStrong((id *)&self->_corpusId, a3);
}

- (NSURL)typologyLogURL
{
  return self->_typologyLogURL;
}

- (void)setTypologyLogURL:(id)a3
{
  objc_storeStrong((id *)&self->_typologyLogURL, a3);
}

- (NSURL)typologyTraceLogURL
{
  return self->_typologyTraceLogURL;
}

- (void)setTypologyTraceLogURL:(id)a3
{
  objc_storeStrong((id *)&self->_typologyTraceLogURL, a3);
}

- (NSString)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
  objc_storeStrong((id *)&self->_seed, a3);
}

- (NSDictionary)debugData
{
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
  objc_storeStrong((id *)&self->_debugData, a3);
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (NSNumber)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
  objc_storeStrong((id *)&self->_rank, a3);
}

- (NSDictionary)aggdStatistics
{
  return self->_aggdStatistics;
}

- (void)setAggdStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_aggdStatistics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggdStatistics, 0);
  objc_storeStrong((id *)&self->_rank, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_typologyTraceLogURL, 0);
  objc_storeStrong((id *)&self->_typologyLogURL, 0);
  objc_storeStrong((id *)&self->_corpusId, 0);
  objc_storeStrong((id *)&self->_numberOfTouches, 0);
  objc_storeStrong((id *)&self->_documentStates, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_intendedTransliteration, 0);
  objc_storeStrong((id *)&self->_intended, 0);
  objc_storeStrong((id *)&self->_corrected, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predicted, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_pathsForWords, 0);
  objc_storeStrong((id *)&self->_touchEvents, 0);
  objc_storeStrong((id *)&self->_touched, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __49__AutocorrectionResult_extractDataFromTypingLog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v35 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v13, "touchedKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v14);

        objc_msgSend(v13, "insertedKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

        objc_msgSend(v13, "predictionBarState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v16);

        objc_msgSend(v13, "inlineCompletionBarState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v17);

        objc_msgSend(v13, "documentState");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = &stru_24FD49B78;
        objc_msgSend(v8, "addObject:", v20);

        objc_msgSend(v13, "touch");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v21);

        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v10);
  }

  v22 = *(void **)(a1 + 32);
  v23 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v22, "addObject:", v23);

  v24 = *(void **)(a1 + 40);
  v25 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v24, "addObject:", v25);

  v26 = *(void **)(a1 + 48);
  v27 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v26, "addObject:", v27);

  v28 = *(void **)(a1 + 56);
  v29 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v28, "addObject:", v29);

  v30 = *(void **)(a1 + 64);
  v31 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v30, "addObject:", v31);

  v32 = *(void **)(a1 + 72);
  v33 = (void *)objc_msgSend(v38, "copy");
  objc_msgSend(v32, "addObject:", v33);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v35, v34);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
