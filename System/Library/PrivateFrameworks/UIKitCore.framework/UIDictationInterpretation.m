@implementation UIDictationInterpretation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationInterpretation)initWithTokens:(id)a3
{
  id v4;
  UIDictationInterpretation *v5;
  uint64_t v6;
  NSArray *tokens;
  NSArray *v8;
  double v9;
  UIDictationInterpretation *v10;
  _QWORD v12[5];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIDictationInterpretation;
  v5 = -[UIDictationInterpretation init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v6;

    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0;
    v8 = v5->_tokens;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__UIDictationInterpretation_initWithTokens___block_invoke;
    v12[3] = &unk_1E16D5440;
    v12[4] = &v13;
    -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v12);
    if (objc_msgSend(v4, "count"))
    {
      v9 = v14[3];
      v5->_averageConfidenceScore = v9 / (double)(unint64_t)objc_msgSend(v4, "count");
    }
    v10 = v5;
    _Block_object_dispose(&v13, 8);
  }

  return v5;
}

double __44__UIDictationInterpretation_initWithTokens___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "confidenceScore");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (UIDictationInterpretation)initWithTokens:(id)a3 score:(double)a4
{
  id v6;
  UIDictationInterpretation *v7;
  uint64_t v8;
  NSArray *tokens;
  UIDictationInterpretation *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDictationInterpretation;
  v7 = -[UIDictationInterpretation init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    tokens = v7->_tokens;
    v7->_tokens = (NSArray *)v8;

    v7->_averageConfidenceScore = a4;
    v10 = v7;
  }

  return v7;
}

- (UIDictationInterpretation)initWithCoder:(id)a3
{
  id v4;
  UIDictationInterpretation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *tokens;
  double v11;
  UIDictationInterpretation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationInterpretation;
  v5 = -[UIDictationInterpretation init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("tokens"));
    v9 = objc_claimAutoreleasedReturnValue();
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("averageConfidenceScore"));
    v5->_averageConfidenceScore = v11;
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *tokens;
  id v5;

  tokens = self->_tokens;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tokens, CFSTR("tokens"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("averageConfidenceScore"), self->_averageConfidenceScore);

}

- (BOOL)removeSpaceBefore
{
  void *v2;
  char v3;

  -[NSArray firstObject](self->_tokens, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "removeSpaceBefore");

  return v3;
}

- (BOOL)removeSpaceAfter
{
  void *v2;
  char v3;

  -[NSArray lastObject](self->_tokens, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "removeSpaceAfter");

  return v3;
}

- (id)serializedInterpretationWithTransform:(__CFString *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[UIDictationInterpretation tokens](self, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializedInterpretationFromTokens:transform:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((v9 & 1) != 0 && (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "removeSpaceBefore") & 1) == 0)
          objc_msgSend(v5, "appendString:", CFSTR(" "));
        objc_msgSend(v12, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIDictationUtilities _properNameForString:](UIDictationUtilities, "_properNameForString:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (void *)v14;
        else
          v16 = v13;
        v17 = v16;

        objc_msgSend(v17, "length");
        objc_msgSend(v5, "appendString:", v17);

        v9 = objc_msgSend(v12, "removeSpaceAfter") ^ 1;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "_stringByApplyingTransform:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSArray *tokens;
  void *v6;
  double averageConfidenceScore;
  double v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    tokens = self->_tokens;
    objc_msgSend(v4, "tokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray isEqualToArray:](tokens, "isEqualToArray:", v6))
    {
      averageConfidenceScore = self->_averageConfidenceScore;
      objc_msgSend(v4, "averageConfidenceScore");
      v9 = vabdd_f64(averageConfidenceScore, v8) < 0.000000001;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationInterpretation serializedInterpretationWithTransform:](self, "serializedInterpretationWithTransform:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_tokens, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "removeSpaceBefore"))
    v8 = "YES";
  else
    v8 = "NO";
  -[NSArray lastObject](self->_tokens, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "removeSpaceAfter"))
    v10 = "YES";
  else
    v10 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ \"%@\", removeSpaceBefore/After=%s/%s"), v5, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (double)averageConfidenceScore
{
  return self->_averageConfidenceScore;
}

- (void)setAverageConfidenceScore:(double)a3
{
  self->_averageConfidenceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
