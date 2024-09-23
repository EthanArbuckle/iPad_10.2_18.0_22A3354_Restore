@implementation PGSocialGroupAssetFilter

- (PGSocialGroupAssetFilter)init
{
  PGSocialGroupAssetFilter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGSocialGroupAssetFilter;
  result = -[PGSocialGroupAssetFilter init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_minimumRatioOfFacesComingFromSocialGroup = xmmword_1CA8ED880;
  return result;
}

- (id)filteredAssetsFromAssets:(id)a3 withPersonLocalIdentifiersInSocialGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[PGSocialGroupAssetFilter asset:passesForPersonLocalIdentifiersInSocialGroup:](self, "asset:passesForPersonLocalIdentifiersInSocialGroup:", v14, v7, (_QWORD)v16))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)asset:(id)a3 passesForPersonLocalIdentifiersInSocialGroup:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  unsigned int v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E20];
  v8 = a4;
  objc_msgSend(v6, "clsPersonLocalIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "intersectSet:", v8);
  v11 = objc_msgSend(v10, "count");
  v12 = objc_msgSend(v8, "count");

  if (v11 >= (unint64_t)fmax(ceil(self->_minimumRatioOfPersonsInSocialGroupPresent * (double)v12), 2.0))
  {
    objc_msgSend(v6, "clsFaceInformationSummary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numberOfFaces");

    v13 = v11 >= vcvtpd_u64_f64(self->_minimumRatioOfFacesComingFromSocialGroup * (double)v15);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGSocialGroupAssetFilter;
  -[PGSocialGroupAssetFilter description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ minimumRatioOfFacesComingFromSocialGroup: %f minimumRatioOfPersonsInSocialGroupPresent: %f"), v4, *(_QWORD *)&self->_minimumRatioOfFacesComingFromSocialGroup, *(_QWORD *)&self->_minimumRatioOfPersonsInSocialGroupPresent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (double)minimumRatioOfFacesComingFromSocialGroup
{
  return self->_minimumRatioOfFacesComingFromSocialGroup;
}

- (double)minimumRatioOfPersonsInSocialGroupPresent
{
  return self->_minimumRatioOfPersonsInSocialGroupPresent;
}

+ (NSString)name
{
  return (NSString *)CFSTR("SocialGroup");
}

+ (id)criteriaWithDictionary:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
