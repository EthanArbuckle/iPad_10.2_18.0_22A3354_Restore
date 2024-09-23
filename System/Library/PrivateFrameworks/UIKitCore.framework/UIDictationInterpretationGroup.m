@implementation UIDictationInterpretationGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationInterpretationGroup)initWithInterpretations:(id)a3
{
  id v4;
  UIDictationInterpretationGroup *v5;
  uint64_t v6;
  NSArray *interpretations;
  UIDictationInterpretationGroup *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationInterpretationGroup;
  v5 = -[UIDictationInterpretationGroup init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    interpretations = v5->_interpretations;
    v5->_interpretations = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (UIDictationInterpretationGroup)initWithInterpretations:(id)a3 isLowConfidence:(BOOL)a4
{
  UIDictationInterpretationGroup *result;

  result = -[UIDictationInterpretationGroup initWithInterpretations:](self, "initWithInterpretations:", a3);
  if (result)
    result->_isLowConfidence = a4;
  return result;
}

- (UIDictationInterpretationGroup)initWithCoder:(id)a3
{
  id v4;
  UIDictationInterpretationGroup *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *interpretations;
  UIDictationInterpretationGroup *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIDictationInterpretationGroup;
  v5 = -[UIDictationInterpretationGroup init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("interpretations"));
    v9 = objc_claimAutoreleasedReturnValue();
    interpretations = v5->_interpretations;
    v5->_interpretations = (NSArray *)v9;

    v5->_isLowConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLowConfidence"));
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *interpretations;
  id v5;

  interpretations = self->_interpretations;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interpretations, CFSTR("interpretations"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLowConfidence, CFSTR("isLowConfidence"));

}

- (double)bestConfidenceScore
{
  void *v2;
  double v3;
  double v4;

  -[NSArray firstObject](self->_interpretations, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averageConfidenceScore");
  v4 = v3;

  return v4;
}

- (UIDictationInterpretation)bestInterpretation
{
  return (UIDictationInterpretation *)-[NSArray firstObject](self->_interpretations, "firstObject");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_interpretations, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedInterpretationWithTransform:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ best=\"%@\">"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)interpretations
{
  return self->_interpretations;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpretations, 0);
}

@end
