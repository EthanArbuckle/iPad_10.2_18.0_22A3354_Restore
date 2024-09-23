@implementation ATXProactiveSuggestionScoreSpecification

- (id)proto
{
  void *v3;
  unint64_t suggestedConfidenceCategory;
  __CFString *v5;
  __CFString *v6;
  int v7;

  v3 = (void *)objc_opt_new();
  -[ATXPBProactiveSuggestionScoreSpecification setRawScore:]((uint64_t)v3, self->_rawScore);
  suggestedConfidenceCategory = self->_suggestedConfidenceCategory;
  if (suggestedConfidenceCategory >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), self->_suggestedConfidenceCategory);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E57CF7A8[suggestedConfidenceCategory];
  }
  v6 = v5;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v7 = 0;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Fallback")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("LowConfidence")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("MediumConfidence")) & 1) != 0)
  {
    v7 = 3;
  }
  else if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("HighConfidence")))
  {
    v7 = 4;
  }
  else
  {
    v7 = 0;
  }

  -[ATXPBProactiveSuggestionScoreSpecification setSuggestedConfidenceCategory:]((uint64_t)v3, v7);
  return v3;
}

- (ATXProactiveSuggestionScoreSpecification)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  uint64_t v7;
  __CFString *v8;
  NSObject *v9;
  ATXProactiveSuggestionScoreSpecification *v10;
  __CFString *v11;
  uint64_t v12;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestionUISpecification initWithProto:].cold.1();

    goto LABEL_8;
  }
  v5 = v4;
  v6 = -[ATXPBProactiveSuggestionScoreSpecification rawScore]((uint64_t)v5);
  v7 = -[ATXPBProactiveSuggestionScoreSpecification suggestedConfidenceCategory]((uint64_t)v5);
  if (v7 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E57CF7A8[(int)v7];
  }
  v11 = v8;
  if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v12 = 0;
  }
  else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("Fallback")) & 1) != 0)
  {
    v12 = 1;
  }
  else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("LowConfidence")) & 1) != 0)
  {
    v12 = 2;
  }
  else if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("MediumConfidence")) & 1) != 0)
  {
    v12 = 3;
  }
  else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("HighConfidence")))
  {
    v12 = 4;
  }
  else
  {
    v12 = 0;
  }

  self = -[ATXProactiveSuggestionScoreSpecification initWithRawScore:suggestedConfidenceCategory:](self, "initWithRawScore:suggestedConfidenceCategory:", v12, v6);
  v10 = self;
LABEL_22:

  return v10;
}

- (ATXProactiveSuggestionScoreSpecification)initWithRawScore:(double)a3 suggestedConfidenceCategory:(int64_t)a4
{
  ATXProactiveSuggestionScoreSpecification *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXProactiveSuggestionScoreSpecification;
  result = -[ATXProactiveSuggestionScoreSpecification init](&v7, sel_init);
  if (result)
  {
    result->_rawScore = a3;
    result->_suggestedConfidenceCategory = a4;
  }
  return result;
}

- (double)rawScore
{
  return self->_rawScore;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Raw score: %.2f   Confidence category: %ld    "), *(_QWORD *)&self->_rawScore, self->_suggestedConfidenceCategory);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXProactiveSuggestionScoreSpecification initWithRawScore:suggestedConfidenceCategory:](+[ATXProactiveSuggestionScoreSpecification allocWithZone:](ATXProactiveSuggestionScoreSpecification, "allocWithZone:", a3), "initWithRawScore:suggestedConfidenceCategory:", self->_suggestedConfidenceCategory, self->_rawScore);
}

- (unint64_t)hash
{
  return self->_suggestedConfidenceCategory;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionScoreSpecification *v4;
  ATXProactiveSuggestionScoreSpecification *v5;
  double v6;
  BOOL v7;

  v4 = (ATXProactiveSuggestionScoreSpecification *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXProactiveSuggestionScoreSpecification rawScore](v5, "rawScore");
      v7 = v6 == self->_rawScore
        && -[ATXProactiveSuggestionScoreSpecification suggestedConfidenceCategory](v5, "suggestedConfidenceCategory") == self->_suggestedConfidenceCategory;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)fuzzyIsEqualToScoreSpecification:(id)a3
{
  ATXProactiveSuggestionScoreSpecification *v4;
  BOOL v5;

  v4 = (ATXProactiveSuggestionScoreSpecification *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ATXProactiveSuggestionScoreSpecification suggestedConfidenceCategory](v4, "suggestedConfidenceCategory") == self->_suggestedConfidenceCategory;
  }

  return v5;
}

+ (id)stringForSuggestedConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)a3 < 5)
    return off_1E57CF7A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSuggestedConfidenceCategory:(int64_t)a3
{
  self->_suggestedConfidenceCategory = a3;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestionScoreSpecification proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXProactiveSuggestionScoreSpecification)initWithProtoData:(id)a3
{
  id v4;
  ATXPBProactiveSuggestionScoreSpecification *v5;
  ATXProactiveSuggestionScoreSpecification *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBProactiveSuggestionScoreSpecification initWithData:]([ATXPBProactiveSuggestionScoreSpecification alloc], "initWithData:", v4);

    self = -[ATXProactiveSuggestionScoreSpecification initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 == 0.0)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXProactiveSuggestionScoreSpecification encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXProactiveSuggestionScoreSpecification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestionScoreSpecification *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXProactiveSuggestionScoreSpecification initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)jsonRawData
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("rawScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rawScore);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("suggestedConfidence");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_suggestedConfidenceCategory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setRawScore:(double)a3
{
  self->_rawScore = a3;
}

- (int64_t)suggestedConfidenceCategory
{
  return self->_suggestedConfidenceCategory;
}

@end
