@implementation VATSpeechRecognitionResult

- (VATSpeechRecognitionResult)initWithPackage:(id)a3 locale:(id)a4 modelVersion:(id)a5 isFinal:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  VATSpeechRecognitionResult *v13;
  VATSpeechRecognitionResult *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  VATSpeechRecognitionResult *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VATSpeechRecognitionResult;
  v13 = -[VATSpeechRecognitionResult init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    -[VATSpeechRecognitionResult setLocale:](v13, "setLocale:", v11);
    -[VATSpeechRecognitionResult setFinal:](v14, "setFinal:", v6);
    -[VATSpeechRecognitionResult setStable:](v14, "setStable:", 1);
    -[VATSpeechRecognitionResult setModelVersion:](v14, "setModelVersion:", v12);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VATSpeechRecognitionResult setTranscriptions:](v14, "setTranscriptions:", v15);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v10, "nBestResults", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          -[VATSpeechRecognitionResult _transcriptionWithResult:locale:](v14, "_transcriptionWithResult:locale:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20), v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v18);
    }

    v22 = v14;
  }

  return v14;
}

- (id)initEmptyResultWithLocale:(id)a3 isFinal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  VATSpeechRecognitionResult *v7;
  VATSpeechRecognitionResult *v8;
  VATSpeechTranscription *v9;
  void *v10;
  VATSpeechRecognitionResult *v11;
  objc_super v13;
  _QWORD v14[2];

  v4 = a4;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VATSpeechRecognitionResult;
  v7 = -[VATSpeechRecognitionResult init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    -[VATSpeechRecognitionResult setFinal:](v7, "setFinal:", v4);
    -[VATSpeechRecognitionResult setStable:](v8, "setStable:", 1);
    -[VATSpeechRecognitionResult setLocale:](v8, "setLocale:", v6);
    v9 = -[VATSpeechTranscription initWithFormattedString:locale:confidence:minConfidence:maxConfidence:]([VATSpeechTranscription alloc], "initWithFormattedString:locale:confidence:minConfidence:maxConfidence:", &stru_251B9F998, v6, 0.0, 0.0, 0.0);
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VATSpeechRecognitionResult setTranscriptions:](v8, "setTranscriptions:", v10);

    v11 = v8;
  }

  return v8;
}

- (VATSpeechRecognitionResult)initWithResults:(id)a3 locale:(id)a4 modelVersion:(id)a5 isFinal:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  VATSpeechRecognitionResult *v13;
  VATSpeechRecognitionResult *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  VATSpeechRecognitionResult *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)VATSpeechRecognitionResult;
  v13 = -[VATSpeechRecognitionResult init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    -[VATSpeechRecognitionResult setLocale:](v13, "setLocale:", v11);
    -[VATSpeechRecognitionResult setFinal:](v14, "setFinal:", v6);
    -[VATSpeechRecognitionResult setStable:](v14, "setStable:", 1);
    -[VATSpeechRecognitionResult setModelVersion:](v14, "setModelVersion:", v12);
    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          -[VATSpeechRecognitionResult _transcriptionWithResult:locale:](v14, "_transcriptionWithResult:locale:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20), v11, (_QWORD)v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v18);
    }

    -[VATSpeechRecognitionResult setTranscriptions:](v14, "setTranscriptions:", v15);
    v22 = v14;

  }
  return v14;
}

- (id)bestTranscription
{
  return (id)MEMORY[0x24BEDD108](self->_transcriptions, sel_firstObject);
}

- (id)_transcriptionWithResult:(id)a3 locale:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  VATSpeechTranscription *v30;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v34 = v5;
  objc_msgSend(v5, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    v11 = 0.0;
    v12 = 1000.0;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v15, "confidence");
        v17 = v16;
        objc_msgSend(v15, "confidence");
        if (v12 >= v18)
          v12 = v18;
        objc_msgSend(v15, "confidence");
        if (v11 < v19)
          v11 = v19;
        objc_msgSend(v15, "tokenName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "containsString:", CFSTR("\\determiner")))
        {
          objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\determiner"), &stru_251B9F998);
          v21 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v21;
        }
        objc_msgSend(v6, "appendString:", v20);
        if (objc_msgSend(v15, "hasSpaceAfter"))
          objc_msgSend(v6, "appendString:", CFSTR(" "));
        v13 = v13 + v17;

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
    v12 = 1000.0;
    v13 = 0.0;
  }

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VATSpeechRecognitionResult isFinal](self, "isFinal"))
  {
    v24 = v34;
    objc_msgSend(v34, "tokens");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26)
    {
      objc_msgSend(v34, "tokens");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v13 / (double)(unint64_t)objc_msgSend(v27, "count");

    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
      v28 = 0.0;
    }
  }
  else
  {
    v24 = v34;
    objc_msgSend(v34, "confidence");
    v28 = v29;
  }
  v30 = -[VATSpeechTranscription initWithFormattedString:locale:confidence:minConfidence:maxConfidence:]([VATSpeechTranscription alloc], "initWithFormattedString:locale:confidence:minConfidence:maxConfidence:", v23, v33, v28, v12, v11);

  return v30;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (void)setFinal:(BOOL)a3
{
  self->_final = a3;
}

- (BOOL)isStable
{
  return self->_stable;
}

- (void)setStable:(BOOL)a3
{
  self->_stable = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)transcriptions
{
  return self->_transcriptions;
}

- (void)setTranscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptions, a3);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_transcriptions, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (id)resultWithPackage:(id)a3 locale:(id)a4 modelVersion:(id)a5 isFinal:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackage:locale:modelVersion:isFinal:", v12, v11, v10, v6);

  return v13;
}

+ (id)emptyResultWithLocale:(id)a3 isFinal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initEmptyResultWithLocale:isFinal:", v6, v4);

  return v7;
}

+ (id)resultWithResults:(id)a3 locale:(id)a4 modelVersion:(id)a5 isFinal:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResults:locale:modelVersion:isFinal:", v12, v11, v10, v6);

  return v13;
}

@end
