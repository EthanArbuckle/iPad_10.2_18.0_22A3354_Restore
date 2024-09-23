@implementation PGPotentialRecentSocialGroupCentricSuggestion

- (PGPotentialRecentSocialGroupCentricSuggestion)initWithPersonLocalIdentifiers:(id)a3 personWeights:(id)a4 momentLocalIdentifiers:(id)a5 weight:(float)a6 notSeenSinceDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PGPotentialRecentSocialGroupCentricSuggestion *v17;
  PGPotentialRecentSocialGroupCentricSuggestion *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PGPotentialRecentSocialGroupCentricSuggestion;
  v17 = -[PGPotentialRecentSocialGroupCentricSuggestion init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v18->_personWeights, a4);
    objc_storeStrong((id *)&v18->_momentLocalIdentifiers, a5);
    v18->_weight = a6;
    objc_storeStrong((id *)&v18->_notSeenSinceDate, a7);
  }

  return v18;
}

- (NSArray)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (NSArray)personWeights
{
  return self->_personWeights;
}

- (NSArray)momentLocalIdentifiers
{
  return self->_momentLocalIdentifiers;
}

- (float)weight
{
  return self->_weight;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSDate)notSeenSinceDate
{
  return self->_notSeenSinceDate;
}

- (void)setNotSeenSinceDate:(id)a3
{
  objc_storeStrong((id *)&self->_notSeenSinceDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notSeenSinceDate, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_momentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personWeights, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

@end
