@implementation PPCountVectorizer

- (PPCountVectorizer)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  PPCountVectorizer *v9;
  uint64_t v10;
  NSString *inputName;
  uint64_t v12;
  NSString *outputName;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *vocabulary;
  unint64_t v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PPCountVectorizer;
  v9 = -[PPCountVectorizer init](&v24, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inputName"));
    v10 = objc_claimAutoreleasedReturnValue();
    inputName = v9->_inputName;
    v9->_inputName = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("outputName"));
    v12 = objc_claimAutoreleasedReturnValue();
    outputName = v9->_outputName;
    v9->_outputName = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("vocabulary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(";"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_new();
    vocabulary = v9->_vocabulary;
    v9->_vocabulary = (NSMutableDictionary *)v16;

    if (objc_msgSend(v15, "count"))
    {
      v18 = 0;
      do
      {
        v19 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v19);
        v21 = v9->_vocabulary;
        objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, v22);

        ++v18;
      }
      while (v18 < objc_msgSend(v15, "count"));
    }

  }
  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSMutableDictionary *vocabulary;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id *v35;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  NSString *outputName;
  void *v45;
  _BYTE v46[128];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "featureValueForName:", self->_inputName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sequenceValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C9E970]);
  v13 = (void *)MEMORY[0x1C3BD6630]();
  v47[0] = &unk_1E7E5A938;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_vocabulary, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  v16 = (void *)objc_msgSend(v12, "initWithShape:dataType:error:", v15, 65568, a5);

  if (v16)
  {
    v35 = a5;
    v36 = v11;
    v37 = v9;
    v38 = v8;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v11, "stringValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v21);
          v23 = (void *)MEMORY[0x1C3BD6630]();
          vocabulary = self->_vocabulary;
          objc_msgSend(v22, "lowercaseString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](vocabulary, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v27 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v26, "unsignedIntegerValue"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue") + 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:atIndexedSubscript:", v29, objc_msgSend(v26, "unsignedIntegerValue"));

          }
          objc_autoreleasePoolPop(v23);
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v19);
    }

    v30 = objc_alloc(MEMORY[0x1E0C9E8F8]);
    v31 = (void *)MEMORY[0x1C3BD6630]();
    outputName = self->_outputName;
    v45 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &outputName, 1);
    v32 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v31);
    v33 = (void *)objc_msgSend(v30, "initWithDictionary:error:", v32, v35);
    v9 = v37;
    v8 = v38;
    v11 = v36;
  }
  else
  {
    pp_default_log_handle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v32, OS_LOG_TYPE_ERROR, "PPCoreMLUtils: unable to construct multiarray", buf, 2u);
    }
    v33 = 0;
  }

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabulary, 0);
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
}

@end
