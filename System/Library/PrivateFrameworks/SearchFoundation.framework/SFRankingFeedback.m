@implementation SFRankingFeedback

- (SFRankingFeedback)initWithCoder:(id)a3
{
  id v4;
  SFRankingFeedback *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *sections;
  double v12;
  uint64_t v13;
  NSString *l2ModelVersion;
  uint64_t v15;
  NSString *l3ModelVersion;
  uint64_t v17;
  NSString *l2ShadowModelVersion;
  uint64_t v19;
  NSArray *hiddenResults;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFRankingFeedback;
  v5 = -[SFFeedback initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sections"));
    v10 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("blending_duration"));
    v5->_blendingDuration = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("l2ModelVersion"));
    v13 = objc_claimAutoreleasedReturnValue();
    l2ModelVersion = v5->_l2ModelVersion;
    v5->_l2ModelVersion = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("l3ModelVersion"));
    v15 = objc_claimAutoreleasedReturnValue();
    l3ModelVersion = v5->_l3ModelVersion;
    v5->_l3ModelVersion = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("l2ShadowModelVersion"));
    v17 = objc_claimAutoreleasedReturnValue();
    l2ShadowModelVersion = v5->_l2ShadowModelVersion;
    v5->_l2ShadowModelVersion = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_hiddenResults"));
    v19 = objc_claimAutoreleasedReturnValue();
    hiddenResults = v5->_hiddenResults;
    v5->_hiddenResults = (NSArray *)v19;

    v5->_spotlightQueryIntent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("spotlightQueryIntent"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenResults, 0);
  objc_storeStrong((id *)&self->_l2ShadowModelVersion, 0);
  objc_storeStrong((id *)&self->_l3ModelVersion, 0);
  objc_storeStrong((id *)&self->_l2ModelVersion, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFRankingFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, CFSTR("sections"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("blending_duration"), self->_blendingDuration);
  objc_msgSend(v4, "encodeObject:forKey:", self->_l2ModelVersion, CFSTR("l2ModelVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_l3ModelVersion, CFSTR("l3ModelVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_l2ShadowModelVersion, CFSTR("l2ShadowModelVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_hiddenResults, CFSTR("_hiddenResults"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_spotlightQueryIntent, CFSTR("_spotlightQueryIntent"));

}

- (SFRankingFeedback)initWithSections:(id)a3 blendingDuration:(double)a4
{
  id v6;
  SFRankingFeedback *v7;
  uint64_t v8;
  NSArray *sections;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFRankingFeedback;
  v7 = -[SFFeedback init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    sections = v7->_sections;
    v7->_sections = (NSArray *)v8;

    v7->_blendingDuration = a4;
    -[NSArray firstObject](v7->_sections, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->super._queryId = objc_msgSend(v12, "queryId");

  }
  return v7;
}

- (NSArray)sections
{
  return self->_sections;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setL2ModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)blendingDuration
{
  return self->_blendingDuration;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SFRankingFeedback;
  v4 = -[SFFeedback copyWithZone:](&v19, sel_copyWithZone_, a3);
  -[SFRankingFeedback sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[5];
  v4[5] = v6;

  -[SFRankingFeedback blendingDuration](self, "blendingDuration");
  v4[4] = v8;
  v9 = -[NSString copy](self->_l2ModelVersion, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSString copy](self->_l3ModelVersion, "copy");
  v12 = (void *)v4[7];
  v4[7] = v11;

  v13 = -[NSString copy](self->_l2ShadowModelVersion, "copy");
  v14 = (void *)v4[8];
  v4[8] = v13;

  -[SFRankingFeedback hiddenResults](self, "hiddenResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  v17 = (void *)v4[9];
  v4[9] = v16;

  *((_DWORD *)v4 + 6) = -[SFRankingFeedback spotlightQueryIntent](self, "spotlightQueryIntent");
  return v4;
}

- (void)setBlendingDuration:(double)a3
{
  self->_blendingDuration = a3;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)l2ModelVersion
{
  return self->_l2ModelVersion;
}

- (NSString)l3ModelVersion
{
  return self->_l3ModelVersion;
}

- (void)setL3ModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)l2ShadowModelVersion
{
  return self->_l2ShadowModelVersion;
}

- (void)setL2ShadowModelVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)hiddenResults
{
  return self->_hiddenResults;
}

- (void)setHiddenResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_spotlightQueryIntent = a3;
}

@end
