@implementation PGPotentialRecentPersonCentricSuggestion

- (PGPotentialRecentPersonCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 assets:(id)a4 relationshipScore:(unint64_t)a5
{
  id v9;
  id v10;
  PGPotentialRecentPersonCentricSuggestion *v11;
  PGPotentialRecentPersonCentricSuggestion *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGPotentialRecentPersonCentricSuggestion;
  v11 = -[PGPotentialRecentPersonCentricSuggestion init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v12->_assets, a4);
    v12->_relationshipScore = a5;
  }

  return v12;
}

- (PGPotentialRecentPersonCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 assets:(id)a4 notSeenSinceDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGPotentialRecentPersonCentricSuggestion *v12;
  PGPotentialRecentPersonCentricSuggestion *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPotentialRecentPersonCentricSuggestion;
  v12 = -[PGPotentialRecentPersonCentricSuggestion init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personLocalIdentifier, a3);
    objc_storeStrong((id *)&v13->_assets, a4);
    objc_storeStrong((id *)&v13->_notSeenSinceDate, a5);
  }

  return v13;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSDate)notSeenSinceDate
{
  return self->_notSeenSinceDate;
}

- (unint64_t)relationshipScore
{
  return self->_relationshipScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notSeenSinceDate, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

@end
