@implementation CRLanguageModelConfiguration

+ (id)configurationForLanguageIdentifier:(id)a3 rev:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLanguageModelConfiguration *v11;
  CRLanguageModelConfiguration *v12;

  v5 = a3;
  if (a4 < 2)
  {
    v12 = [CRLanguageModelConfiguration alloc];
    v11 = -[CRLanguageModelConfiguration initWithDictionary:](v12, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }
  else
  {
    lmConfig();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[CRLanguageModelConfiguration initWithDictionary:]([CRLanguageModelConfiguration alloc], "initWithDictionary:", v10);
  }

  return v11;
}

- (CRLanguageModelConfiguration)initWithDictionary:(id)a3
{
  id v4;
  CRLanguageModelConfiguration *v5;
  uint64_t v6;
  NSNumber *lexiconWeight;
  uint64_t v8;
  NSNumber *characterLMWeight;
  uint64_t v10;
  NSNumber *wordLMWeight;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  uint64_t v16;
  NSArray *filteringCharLengths;
  void *v18;
  uint64_t v19;
  NSArray *lmFilteringThresholds;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRLanguageModelConfiguration;
  v5 = -[CRLanguageModelConfiguration init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lexicon"));
    v6 = objc_claimAutoreleasedReturnValue();
    lexiconWeight = v5->_lexiconWeight;
    v5->_lexiconWeight = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("charlm"));
    v8 = objc_claimAutoreleasedReturnValue();
    characterLMWeight = v5->_characterLMWeight;
    v5->_characterLMWeight = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wordlm"));
    v10 = objc_claimAutoreleasedReturnValue();
    wordLMWeight = v5->_wordLMWeight;
    v5->_wordLMWeight = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lmFiltering"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("activationThreshold"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v5->_filteringActivationThreshold = v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lmFiltering"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("charLengths"));
    v16 = objc_claimAutoreleasedReturnValue();
    filteringCharLengths = v5->_filteringCharLengths;
    v5->_filteringCharLengths = (NSArray *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lmFiltering"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("lmThresholds"));
    v19 = objc_claimAutoreleasedReturnValue();
    lmFilteringThresholds = v5->_lmFilteringThresholds;
    v5->_lmFilteringThresholds = (NSArray *)v19;

    -[NSArray lastObject](v5->_filteringCharLengths, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_filteringMinimumLength = objc_msgSend(v21, "integerValue");

  }
  return v5;
}

- (float)lmThresholdForLength:(int64_t)a3
{
  void *v5;
  float v6;
  _QWORD v8[7];
  uint64_t v9;
  float *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = (float *)&v9;
  v11 = 0x2020000000;
  v12 = 2139095039;
  -[CRLanguageModelConfiguration filteringCharLengths](self, "filteringCharLengths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CRLanguageModelConfiguration_lmThresholdForLength___block_invoke;
  v8[3] = &unk_1E98DBE38;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = v10[6];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __53__CRLanguageModelConfiguration_lmThresholdForLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v7 = *(_QWORD *)(a1 + 48);
  if (v7 >= objc_msgSend(a2, "integerValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "lmFilteringThresholds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }
}

- (NSNumber)lexiconWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)characterLMWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)wordLMWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (float)filteringActivationThreshold
{
  return self->_filteringActivationThreshold;
}

- (int64_t)filteringMinimumLength
{
  return self->_filteringMinimumLength;
}

- (NSArray)filteringCharLengths
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFilteringCharLengths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)lmFilteringThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLmFilteringThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lmFilteringThresholds, 0);
  objc_storeStrong((id *)&self->_filteringCharLengths, 0);
  objc_storeStrong((id *)&self->_wordLMWeight, 0);
  objc_storeStrong((id *)&self->_characterLMWeight, 0);
  objc_storeStrong((id *)&self->_lexiconWeight, 0);
}

@end
