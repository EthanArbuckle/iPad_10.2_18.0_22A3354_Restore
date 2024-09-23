@implementation PGSingleAssetSuggestion

- (PGSingleAssetSuggestion)initWithType:(unsigned __int16)a3 subtype:(unsigned __int16)a4 asset:(id)a5
{
  id v9;
  PGSingleAssetSuggestion *v10;
  PGSingleAssetSuggestion *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGSingleAssetSuggestion;
  v10 = -[PGSingleAssetSuggestion init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_subtype = a4;
    objc_storeStrong((id *)&v10->_asset, a5);
  }

  return v11;
}

- (int64_t)version
{
  return 3;
}

- (unsigned)state
{
  return 0;
}

- (unsigned)notificationState
{
  return 0;
}

- (NSArray)keyAssets
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_asset)
  {
    v4[0] = self->_asset;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v2;
}

- (NSArray)representativeAssets
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSDate)creationDate
{
  return 0;
}

- (NSDate)universalStartDate
{
  return -[PHAsset creationDate](self->_asset, "creationDate");
}

- (NSDate)universalEndDate
{
  return -[PHAsset creationDate](self->_asset, "creationDate");
}

- (unsigned)notificationQuality
{
  return 0;
}

- (NSArray)suggestedPersonLocalIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)containsUnverifiedPersons
{
  return 0;
}

- (NSString)description
{
  unint64_t relevanceDurationInDays;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  relevanceDurationInDays = self->_relevanceDurationInDays;
  if (relevanceDurationInDays)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("relevant for %lu days"), relevanceDurationInDays);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E8436F28;
  }
  v11.receiver = self;
  v11.super_class = (Class)PGSingleAssetSuggestion;
  -[PGSingleAssetSuggestion description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PHSuggestionStringWithType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PHSuggestionStringWithSubtype();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset uuid](self->_asset, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(": type=%@, subtype=%@, assetUUID=%@, %@features=%@"), v6, v7, v8, v4, self->_features);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (NSSet)features
{
  return self->_features;
}

- (id)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
  objc_storeStrong(&self->_recipe, a3);
}

- (unint64_t)relevanceDurationInDays
{
  return self->_relevanceDurationInDays;
}

- (void)setRelevanceDurationInDays:(unint64_t)a3
{
  self->_relevanceDurationInDays = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (unint64_t)availableFeatures
{
  return self->_availableFeatures;
}

- (void)setAvailableFeatures:(unint64_t)a3
{
  self->_availableFeatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_recipe, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
