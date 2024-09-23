@implementation SFSectionRankingFeedback

- (SFSectionRankingFeedback)initWithResults:(id)a3 section:(id)a4 localSectionPosition:(unint64_t)a5 personalizationScore:(double)a6
{
  id v10;
  id v11;
  SFSectionRankingFeedback *v12;
  uint64_t v13;
  NSArray *results;
  uint64_t v15;
  SFResultSection *section;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFSectionRankingFeedback;
  v12 = -[SFFeedback init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    results = v12->_results;
    v12->_results = (NSArray *)v13;

    v15 = objc_msgSend(v11, "copy");
    section = v12->_section;
    v12->_section = (SFResultSection *)v15;

    v12->_localSectionPosition = a5;
    v12->_personalizationScore = a6;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSectionRankingFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_localSectionPosition, CFSTR("local_section_position"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_section, CFSTR("section"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, CFSTR("results"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("client_score"), self->_personalizationScore);

}

- (NSArray)results
{
  return self->_results;
}

- (SFSectionRankingFeedback)initWithCoder:(id)a3
{
  id v4;
  SFSectionRankingFeedback *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SFResultSection *section;
  uint64_t v12;
  NSArray *results;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFSectionRankingFeedback;
  v5 = -[SFFeedback initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localSectionPosition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("local_section_position"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("section"));
    v10 = objc_claimAutoreleasedReturnValue();
    section = v5->_section;
    v5->_section = (SFResultSection *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("results"));
    v12 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSArray *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("client_score"));
    v5->_personalizationScore = v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFResultSection)section
{
  return self->_section;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (unint64_t)localSectionPosition
{
  return self->_localSectionPosition;
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
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFSectionRankingFeedback;
  v4 = -[SFFeedback copyWithZone:](&v13, sel_copyWithZone_, a3);
  -[SFSectionRankingFeedback results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  -[SFSectionRankingFeedback section](self, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v4[5] = -[SFSectionRankingFeedback localSectionPosition](self, "localSectionPosition");
  -[SFSectionRankingFeedback personalizationScore](self, "personalizationScore");
  v4[6] = v11;
  return v4;
}

- (void)setResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLocalSectionPosition:(unint64_t)a3
{
  self->_localSectionPosition = a3;
}

- (void)setPersonalizationScore:(double)a3
{
  self->_personalizationScore = a3;
}

@end
