@implementation MatchedFeatures

- (id)initMatchedFeaturesTokenIndex:(unint64_t)a3 photoFeatureIndex:(unint64_t)a4 matchedPositions:(id)a5 tokenMatchRatio:(double)a6 characterMatchRatio:(double)a7 matchedTypes:(id)a8
{
  id v14;
  id v15;
  MatchedFeatures *v16;
  MatchedFeatures *v17;
  objc_super v19;

  v14 = a5;
  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)MatchedFeatures;
  v16 = -[MatchedFeatures init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[MatchedFeatures setTokenIndex:](v16, "setTokenIndex:", a3);
    -[MatchedFeatures setPhotoFeatureIndex:](v17, "setPhotoFeatureIndex:", a4);
    -[MatchedFeatures setMatchedPositions:](v17, "setMatchedPositions:", v14);
    -[MatchedFeatures setTokenMatchRatio:](v17, "setTokenMatchRatio:", a6);
    -[MatchedFeatures setCharacterMatchRatio:](v17, "setCharacterMatchRatio:", a7);
    -[MatchedFeatures setMatchedTypes:](v17, "setMatchedTypes:", v15);
  }

  return v17;
}

- (unint64_t)tokenIndex
{
  return self->_tokenIndex;
}

- (void)setTokenIndex:(unint64_t)a3
{
  self->_tokenIndex = a3;
}

- (unint64_t)photoFeatureIndex
{
  return self->_photoFeatureIndex;
}

- (void)setPhotoFeatureIndex:(unint64_t)a3
{
  self->_photoFeatureIndex = a3;
}

- (double)tokenMatchRatio
{
  return self->_tokenMatchRatio;
}

- (void)setTokenMatchRatio:(double)a3
{
  self->_tokenMatchRatio = a3;
}

- (double)characterMatchRatio
{
  return self->_characterMatchRatio;
}

- (void)setCharacterMatchRatio:(double)a3
{
  self->_characterMatchRatio = a3;
}

- (NSMutableArray)matchedPositions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchedPositions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)matchedTypes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMatchedTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedTypes, 0);
  objc_storeStrong((id *)&self->_matchedPositions, 0);
}

@end
