@implementation SFEndLocalSearchFeedback

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFEndLocalSearchFeedback;
  v4 = a3;
  -[SFEndSearchFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quParse, CFSTR("query_understanding_parse"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_l1ToL2ResultCount, CFSTR("_l1ToL2ResultCount"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_coreSpotlightIndexCount, CFSTR("_coreSpotlightIndexCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFQueryUnderstandingParse)quParse
{
  return self->_quParse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosRankingInfo, 0);
  objc_storeStrong((id *)&self->_quParse, 0);
}

- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFEndLocalSearchFeedback;
  return -[SFEndSearchFeedback initWithStartSearch:](&v4, sel_initWithStartSearch_, a3);
}

- (SFEndLocalSearchFeedback)initWithCoder:(id)a3
{
  id v4;
  SFEndLocalSearchFeedback *v5;
  uint64_t v6;
  SFQueryUnderstandingParse *quParse;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFEndLocalSearchFeedback;
  v5 = -[SFEndSearchFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query_understanding_parse"));
    v6 = objc_claimAutoreleasedReturnValue();
    quParse = v5->_quParse;
    v5->_quParse = (SFQueryUnderstandingParse *)v6;

    v5->_l1ToL2ResultCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_l1ToL2ResultCount"));
    v5->_coreSpotlightIndexCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_coreSpotlightIndexCount"));
  }

  return v5;
}

- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3 queryUnderstandingParse:(id)a4
{
  id v7;
  SFEndLocalSearchFeedback *v8;
  SFEndLocalSearchFeedback *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SFEndLocalSearchFeedback;
  v8 = -[SFEndSearchFeedback initWithStartSearch:](&v11, sel_initWithStartSearch_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_quParse, a4);

  return v9;
}

- (SFEndLocalSearchFeedback)initWithStartSearch:(id)a3 queryUnderstandingParse:(id)a4 l1ToL2ResultCount:(unsigned int)a5 coreSpotlightIndexCount:(unsigned int)a6
{
  SFEndLocalSearchFeedback *result;

  result = -[SFEndLocalSearchFeedback initWithStartSearch:queryUnderstandingParse:](self, "initWithStartSearch:queryUnderstandingParse:", a3, a4);
  if (result)
  {
    result->_l1ToL2ResultCount = a5;
    result->_coreSpotlightIndexCount = a6;
  }
  return result;
}

- (void)setQuParse:(id)a3
{
  objc_storeStrong((id *)&self->_quParse, a3);
}

- (unsigned)l1ToL2ResultCount
{
  return self->_l1ToL2ResultCount;
}

- (void)setL1ToL2ResultCount:(unsigned int)a3
{
  self->_l1ToL2ResultCount = a3;
}

- (unsigned)coreSpotlightIndexCount
{
  return self->_coreSpotlightIndexCount;
}

- (void)setCoreSpotlightIndexCount:(unsigned int)a3
{
  self->_coreSpotlightIndexCount = a3;
}

- (SFPhotosRankingInfo)photosRankingInfo
{
  return self->_photosRankingInfo;
}

- (void)setPhotosRankingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_photosRankingInfo, a3);
}

@end
