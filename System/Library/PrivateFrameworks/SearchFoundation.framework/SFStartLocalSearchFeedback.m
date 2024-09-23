@implementation SFStartLocalSearchFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_storeStrong((id *)&self->_entityQueryCommand, 0);
  objc_storeStrong((id *)&self->_originatingApp, 0);
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7
{
  SFStartLocalSearchFeedback *v10;
  SFStartLocalSearchFeedback *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFStartLocalSearchFeedback;
  v10 = -[SFStartSearchFeedback initWithInput:triggerEvent:](&v13, sel_initWithInput_triggerEvent_, a3, a4);
  v11 = v10;
  if (v10)
  {
    -[SFStartSearchFeedback setSearchType:](v10, "setSearchType:", a5);
    -[SFStartLocalSearchFeedback setIndexType:](v11, "setIndexType:", a6);
    -[SFFeedback setQueryId:](v11, "setQueryId:", a7);
  }
  return v11;
}

- (void)setIndexType:(unint64_t)a3
{
  self->_indexType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (NSString)originatingApp
{
  return self->_originatingApp;
}

- (SFIndexState)indexState
{
  return self->_indexState;
}

- (SFPerformEntityQueryCommand)entityQueryCommand
{
  return self->_entityQueryCommand;
}

- (SFStartLocalSearchFeedback)initWithCoder:(id)a3
{
  id v4;
  SFStartLocalSearchFeedback *v5;
  uint64_t v6;
  SFIndexState *indexState;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFStartLocalSearchFeedback;
  v5 = -[SFStartSearchFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_indexType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_indexType"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_indexState"));
    v6 = objc_claimAutoreleasedReturnValue();
    indexState = v5->_indexState;
    v5->_indexState = (SFIndexState *)v6;

    v5->_coreSpotlightIndexTypeUsed = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_coreSpotlightIndexTypeUsed"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStartLocalSearchFeedback;
  v4 = a3;
  -[SFStartSearchFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_indexType, CFSTR("_indexType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_indexState, CFSTR("_indexState"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_coreSpotlightIndexTypeUsed, CFSTR("_coreSpotlightIndexTypeUsed"));

}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 indexType:(unint64_t)a5
{
  return -[SFStartLocalSearchFeedback initWithInput:triggerEvent:searchType:indexType:queryId:](self, "initWithInput:triggerEvent:searchType:indexType:queryId:", a3, a4, 0, a5, 0);
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 indexType:(unint64_t)a5 queryId:(unint64_t)a6
{
  return -[SFStartLocalSearchFeedback initWithInput:triggerEvent:searchType:indexType:queryId:](self, "initWithInput:triggerEvent:searchType:indexType:queryId:", a3, a4, 0, a5, a6);
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8
{
  id v14;
  SFStartLocalSearchFeedback *v15;
  SFStartLocalSearchFeedback *v16;

  v14 = a8;
  v15 = -[SFStartLocalSearchFeedback initWithInput:triggerEvent:searchType:indexType:queryId:](self, "initWithInput:triggerEvent:searchType:indexType:queryId:", a3, a4, a5, a6, a7);
  v16 = v15;
  if (v15)
    -[SFStartLocalSearchFeedback setOriginatingApp:](v15, "setOriginatingApp:", v14);

  return v16;
}

- (SFStartLocalSearchFeedback)initWithInput:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8 coreSpotlightIndexTypeUsed:(int)a9
{
  SFStartLocalSearchFeedback *v9;
  SFStartLocalSearchFeedback *v10;

  v9 = -[SFStartLocalSearchFeedback initWithInput:triggerEvent:searchType:indexType:queryId:originatingApp:](self, "initWithInput:triggerEvent:searchType:indexType:queryId:originatingApp:", a3, a4, a5, a6, a7, a8);
  v10 = v9;
  if (v9)
    -[SFStartLocalSearchFeedback setCoreSpotlightIndexTypeUsed:](v9, "setCoreSpotlightIndexTypeUsed:", a9);
  return v10;
}

- (SFStartLocalSearchFeedback)initWithEntityQueryCommand:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 indexType:(unint64_t)a6 queryId:(unint64_t)a7 originatingApp:(id)a8
{
  id v14;
  id v15;
  void *v16;
  SFStartLocalSearchFeedback *v17;

  v14 = a3;
  v15 = a8;
  objc_msgSend(v14, "searchString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SFStartLocalSearchFeedback initWithInput:triggerEvent:searchType:indexType:queryId:originatingApp:](self, "initWithInput:triggerEvent:searchType:indexType:queryId:originatingApp:", v16, a4, a5, a6, a7, v15);

  if (v17)
    -[SFStartLocalSearchFeedback setEntityQueryCommand:](v17, "setEntityQueryCommand:", v14);

  return v17;
}

- (void)setOriginatingApp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setEntityQueryCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setIndexState:(id)a3
{
  objc_storeStrong((id *)&self->_indexState, a3);
}

- (int)coreSpotlightIndexTypeUsed
{
  return self->_coreSpotlightIndexTypeUsed;
}

- (void)setCoreSpotlightIndexTypeUsed:(int)a3
{
  self->_coreSpotlightIndexTypeUsed = a3;
}

- (BOOL)isPhotosScopedSearch
{
  return self->_isPhotosScopedSearch;
}

- (void)setIsPhotosScopedSearch:(BOOL)a3
{
  self->_isPhotosScopedSearch = a3;
}

@end
