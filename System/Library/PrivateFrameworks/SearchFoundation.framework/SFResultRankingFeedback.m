@implementation SFResultRankingFeedback

- (SFSearchResult)result
{
  return self->_result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (NSArray)duplicateResults
{
  return self->_duplicateResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateResults, 0);
  objc_storeStrong((id *)&self->_hiddenResults, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (SFResultRankingFeedback)initWithResult:(id)a3 hiddenResults:(id)a4 duplicateResults:(id)a5 localResultPosition:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SFResultRankingFeedback *v14;
  SFResultRankingFeedback *v15;
  uint64_t v16;
  NSArray *hiddenResults;
  uint64_t v18;
  NSArray *duplicateResults;
  double v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SFResultRankingFeedback;
  v14 = -[SFFeedback init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_result, a3);
    v16 = objc_msgSend(v12, "copy");
    hiddenResults = v15->_hiddenResults;
    v15->_hiddenResults = (NSArray *)v16;

    v18 = objc_msgSend(v13, "copy");
    duplicateResults = v15->_duplicateResults;
    v15->_duplicateResults = (NSArray *)v18;

    v15->_localResultPosition = a6;
    objc_msgSend(v11, "personalizationScore");
    v15->_personalizationScore = v20;
  }

  return v15;
}

- (SFResultRankingFeedback)initWithCoder:(id)a3
{
  id v4;
  SFResultRankingFeedback *v5;
  double v6;
  uint64_t v7;
  SFSearchResult *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *hiddenResults;
  uint64_t v14;
  NSArray *duplicateResults;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFResultRankingFeedback;
  v5 = -[SFFeedback initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_personalizationScore"));
    v5->_personalizationScore = v6;
    v5->_localResultPosition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_localResultPosition"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_result"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v5->_result;
    v5->_result = (SFSearchResult *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_hiddenResults"));
    v12 = objc_claimAutoreleasedReturnValue();
    hiddenResults = v5->_hiddenResults;
    v5->_hiddenResults = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_duplicateResults"));
    v14 = objc_claimAutoreleasedReturnValue();
    duplicateResults = v5->_duplicateResults;
    v5->_duplicateResults = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFResultRankingFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_personalizationScore"), self->_personalizationScore, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_localResultPosition, CFSTR("_localResultPosition"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, CFSTR("_result"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hiddenResults, CFSTR("_hiddenResults"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_duplicateResults, CFSTR("_duplicateResults"));

}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (unint64_t)localResultPosition
{
  return self->_localResultPosition;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFResultRankingFeedback;
  v4 = -[SFFeedback copyWithZone:](&v16, sel_copyWithZone_, a3);
  -[SFResultRankingFeedback result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  -[SFResultRankingFeedback hiddenResults](self, "hiddenResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  -[SFResultRankingFeedback duplicateResults](self, "duplicateResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[5];
  v4[5] = v12;

  v4[6] = -[SFResultRankingFeedback localResultPosition](self, "localResultPosition");
  -[SFResultRankingFeedback personalizationScore](self, "personalizationScore");
  v4[7] = v14;
  return v4;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (void)setHiddenResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDuplicateResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setLocalResultPosition:(unint64_t)a3
{
  self->_localResultPosition = a3;
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

@end
