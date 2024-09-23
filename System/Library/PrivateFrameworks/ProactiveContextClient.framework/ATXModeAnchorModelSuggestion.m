@implementation ATXModeAnchorModelSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXModeAnchorModelSuggestion)initWithModeUUID:(id)a3 isStart:(BOOL)a4 anchorType:(id)a5 score:(double)a6 numUniqueOccurrencesAfterAnchor:(unint64_t)a7 posteriorProbability:(double)a8 classConditionalProbability:(double)a9 serializedTriggers:(id)a10
{
  id v18;
  id v19;
  id v20;
  ATXModeAnchorModelSuggestion *v21;
  uint64_t v22;
  NSString *modeUUID;
  objc_super v25;

  v18 = a3;
  v19 = a5;
  v20 = a10;
  v25.receiver = self;
  v25.super_class = (Class)ATXModeAnchorModelSuggestion;
  v21 = -[ATXModeAnchorModelSuggestion init](&v25, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v18, "copy");
    modeUUID = v21->_modeUUID;
    v21->_modeUUID = (NSString *)v22;

    v21->_isStart = a4;
    objc_storeStrong((id *)&v21->_anchorType, a5);
    v21->_score = a6;
    v21->_numUniqueOccurrencesAfterAnchor = a7;
    v21->_posteriorProbability = a8;
    v21->_classConditionalProbability = a9;
    objc_storeStrong((id *)&v21->_serializedTriggers, a10);
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *modeUUID;
  id v5;

  modeUUID = self->_modeUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modeUUID, CFSTR("modeUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anchorType, CFSTR("anchorType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isStart, CFSTR("isStart"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numUniqueOccurrencesAfterAnchor, CFSTR("numUniqueOccurrencesAfterAnchor"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("posteriorProbability"), self->_posteriorProbability);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("classConditionalProbability"), self->_classConditionalProbability);
  objc_msgSend(v5, "encodeObject:forKey:", self->_serializedTriggers, CFSTR("triggers"));

}

- (ATXModeAnchorModelSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  ATXModeAnchorModelSuggestion *v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchorType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStart"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numUniqueOccurrencesAfterAnchor"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("classConditionalProbability"));
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("classConditionalProbability"));
  v14 = v13;
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("triggers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[ATXModeAnchorModelSuggestion initWithModeUUID:isStart:anchorType:score:numUniqueOccurrencesAfterAnchor:posteriorProbability:classConditionalProbability:serializedTriggers:](self, "initWithModeUUID:isStart:anchorType:score:numUniqueOccurrencesAfterAnchor:posteriorProbability:classConditionalProbability:serializedTriggers:", v5, v7, v6, v10, v18, v9, v12, v14);
  return v19;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)numUniqueOccurrencesAfterAnchor
{
  return self->_numUniqueOccurrencesAfterAnchor;
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (NSArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
}

@end
