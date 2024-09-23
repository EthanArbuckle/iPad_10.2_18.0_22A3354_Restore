@implementation WFAirQualityConditions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAirQualityConditions)initWithCoder:(id)a3
{
  id v4;
  WFAirQualityConditions *v5;
  uint64_t v6;
  WFLocation *location;
  uint64_t v8;
  NSDate *date;
  uint64_t v10;
  NSDate *expirationDate;
  uint64_t v12;
  NSString *provider;
  uint64_t v14;
  NSString *localizedDisclaimer;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *pollutants;
  uint64_t v21;
  WFAirPollutant *primaryPollutant;
  uint64_t v23;
  NSLocale *locale;
  uint64_t v25;
  NSString *airQualityScale;
  uint64_t v27;
  NSString *scaleIdentifier;
  uint64_t v29;
  WFAQIScale *scale;
  uint64_t v31;
  WFAQIScaleCategory *currentScaleCategory;
  uint64_t v33;
  WFAirQualityProviderAttribution *providerAttribution;
  uint64_t v35;
  NSURL *learnMoreURL;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)WFAirQualityConditions;
  v5 = -[WFAirQualityConditions init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsLocationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (WFLocation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsDateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsExpirationDateKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsProviderKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsLocalizedDisclaimerKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    localizedDisclaimer = v5->_localizedDisclaimer;
    v5->_localizedDisclaimer = (NSString *)v14;

    v5->_localizedAirQualityIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAirQualityConditionsLocalizedAQIKey"));
    v5->_significance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAirQualityConditionsSignificanceKey"));
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("WFAirQualityConditionsPollutantsKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    pollutants = v5->_pollutants;
    v5->_pollutants = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsPrimaryPollutantKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    primaryPollutant = v5->_primaryPollutant;
    v5->_primaryPollutant = (WFAirPollutant *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsLocaleKey"));
    v23 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v23;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAirQualityConditionsCategoryKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsAirQualityScaleKey"));
    v25 = objc_claimAutoreleasedReturnValue();
    airQualityScale = v5->_airQualityScale;
    v5->_airQualityScale = (NSString *)v25;

    v5->_temporarilyUnavailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WFAirQualityConditionsTemporarilyUnavailableKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsScaleIdentifierKey"));
    v27 = objc_claimAutoreleasedReturnValue();
    scaleIdentifier = v5->_scaleIdentifier;
    v5->_scaleIdentifier = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsScaleKey"));
    v29 = objc_claimAutoreleasedReturnValue();
    scale = v5->_scale;
    v5->_scale = (WFAQIScale *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsScaleCurrentCategoryKey"));
    v31 = objc_claimAutoreleasedReturnValue();
    currentScaleCategory = v5->_currentScaleCategory;
    v5->_currentScaleCategory = (WFAQIScaleCategory *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsAttributionProviderKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    providerAttribution = v5->_providerAttribution;
    v5->_providerAttribution = (WFAirQualityProviderAttribution *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityConditionsLearnMoreKey"));
    v35 = objc_claimAutoreleasedReturnValue();
    learnMoreURL = v5->_learnMoreURL;
    v5->_learnMoreURL = (NSURL *)v35;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[WFAirQualityConditions location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFAirQualityConditionsLocationKey"));

  -[WFAirQualityConditions date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WFAirQualityConditionsDateKey"));

  -[WFAirQualityConditions expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WFAirQualityConditionsExpirationDateKey"));

  -[WFAirQualityConditions provider](self, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WFAirQualityConditionsProviderKey"));

  -[WFAirQualityConditions localizedDisclaimer](self, "localizedDisclaimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WFAirQualityConditionsLocalizedDisclaimerKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAirQualityConditions localizedAirQualityIndex](self, "localizedAirQualityIndex"), CFSTR("WFAirQualityConditionsLocalizedAQIKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAirQualityConditions significance](self, "significance"), CFSTR("WFAirQualityConditionsSignificanceKey"));
  -[WFAirQualityConditions pollutants](self, "pollutants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WFAirQualityConditionsPollutantsKey"));

  -[WFAirQualityConditions primaryPollutant](self, "primaryPollutant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("WFAirQualityConditionsPrimaryPollutantKey"));

  -[WFAirQualityConditions locale](self, "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("WFAirQualityConditionsLocaleKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAirQualityConditions category](self, "category"), CFSTR("WFAirQualityConditionsCategoryKey"));
  -[WFAirQualityConditions airQualityScale](self, "airQualityScale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("WFAirQualityConditionsAirQualityScaleKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAirQualityConditions temporarilyUnavailable](self, "temporarilyUnavailable"), CFSTR("WFAirQualityConditionsTemporarilyUnavailableKey"));
  -[WFAirQualityConditions scaleIdentifier](self, "scaleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("WFAirQualityConditionsScaleIdentifierKey"));

  -[WFAirQualityConditions scale](self, "scale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("WFAirQualityConditionsScaleKey"));

  -[WFAirQualityConditions currentScaleCategory](self, "currentScaleCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("WFAirQualityConditionsScaleCurrentCategoryKey"));

  -[WFAirQualityConditions providerAttribution](self, "providerAttribution");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("WFAirQualityConditionsAttributionProviderKey"));

  -[WFAirQualityConditions learnMoreURL](self, "learnMoreURL");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("WFAirQualityConditionsLearnMoreKey"));

}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4) != -1;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v6 = -[WFLocation copyWithZone:](self->_location, "copyWithZone:", a3);
    objc_msgSend(v5, "setLocation:", v6);

    v7 = (void *)-[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
    objc_msgSend(v5, "setDate:", v7);

    v8 = (void *)-[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
    objc_msgSend(v5, "setExpirationDate:", v8);

    v9 = (void *)-[NSString copyWithZone:](self->_provider, "copyWithZone:", a3);
    objc_msgSend(v5, "setProvider:", v9);

    v10 = (void *)-[NSString copyWithZone:](self->_localizedDisclaimer, "copyWithZone:", a3);
    objc_msgSend(v5, "setLocalizedDisclaimer:", v10);

    objc_msgSend(v5, "setLocalizedAirQualityIndex:", self->_localizedAirQualityIndex);
    v11 = (void *)-[WFAQIScaleCategory copy](self->_localizedAirQualityScaleCategory, "copy");
    objc_msgSend(v5, "setLocalizedAirQualityScaleCategory:", v11);

    objc_msgSend(v5, "setSignificance:", self->_significance);
    v12 = (void *)-[NSArray copyWithZone:](self->_pollutants, "copyWithZone:", a3);
    objc_msgSend(v5, "setPollutants:", v12);

    v13 = (void *)-[WFAirPollutant copy](self->_primaryPollutant, "copy");
    objc_msgSend(v5, "setPrimaryPollutant:", v13);

    v14 = (void *)-[NSLocale copyWithZone:](self->_locale, "copyWithZone:", a3);
    objc_msgSend(v5, "setLocale:", v14);

    objc_msgSend(v5, "setCategory:", self->_category);
    objc_msgSend(v5, "setTemporarilyUnavailable:", self->_temporarilyUnavailable);
    objc_msgSend(v5, "setScaleIdentifier:", self->_scaleIdentifier);
    objc_msgSend(v5, "setScale:", self->_scale);
    objc_msgSend(v5, "setCurrentScaleCategory:", self->_currentScaleCategory);
    objc_msgSend(v5, "setProviderAttribution:", self->_providerAttribution);
    objc_msgSend(v5, "setLearnMoreURL:", self->_learnMoreURL);
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[WFAirQualityConditions provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions providerAttribution](self, "providerAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions primaryPollutant](self, "primaryPollutant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFAirQualityConditions airQualityIndex](self, "airQualityIndex");
  v7 = -[WFAirQualityConditions significance](self, "significance");
  -[WFAirQualityConditions learnMoreURL](self, "learnMoreURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFAirQualityConditions currentCategoryIndex](self, "currentCategoryIndex");
  -[WFAirQualityConditions currentScaleCategory](self, "currentScaleCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions scaleIdentifier](self, "scaleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions scale](self, "scale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<WFAirQualityConditions provider: %@, providerAttribution: %@, primaryPollutant: %@, airQualityIndex: %lu, significance: %lu, learnMoreURL: %@, currentCategoryIndex: %lu, currentScaleCategory: %@, scaleIdentifier: %@, scale: %@>"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v20 = (void *)MEMORY[0x24BDD17C8];
  -[WFAirQualityConditions location](self, "location");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions date](self, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions expirationDate](self, "expirationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WFAirQualityConditions isExpired](self, "isExpired");
  v15 = -[WFAirQualityConditions temporarilyUnavailable](self, "temporarilyUnavailable");
  -[WFAirQualityConditions provider](self, "provider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions providerAttribution](self, "providerAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions pollutants](self, "pollutants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions primaryPollutant](self, "primaryPollutant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFAirQualityConditions airQualityIndex](self, "airQualityIndex");
  v6 = -[WFAirQualityConditions significance](self, "significance");
  -[WFAirQualityConditions learnMoreURL](self, "learnMoreURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFAirQualityConditions currentCategoryIndex](self, "currentCategoryIndex");
  -[WFAirQualityConditions currentScaleCategory](self, "currentScaleCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions scaleIdentifier](self, "scaleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions scale](self, "scale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<WFAirQualityConditions location: %@, date: %@, expirationDate: %@, isExpired: %d, temporarilyUnavailable: %d, provider: %@, providerAttribution: %@, pollutants: %@, primaryPollutant: %@, airQualityIndex: %lu, significance: %lu, learnMoreURL: %@, currentCategoryIndex: %lu, currentScaleCategory: %@, scaleIdentifier: %@, scale: %@>"), v19, v18, v17, v16, v15, v14, v3, v4, v5, v13, v6, v7, v8, v9, v10, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)temporarilyUnavailable
{
  return self->_temporarilyUnavailable;
}

- (void)setTemporarilyUnavailable:(BOOL)a3
{
  self->_temporarilyUnavailable = a3;
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WFAirQualityProviderAttribution)providerAttribution
{
  return self->_providerAttribution;
}

- (void)setProviderAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_providerAttribution, a3);
}

- (NSString)scaleIdentifier
{
  return self->_scaleIdentifier;
}

- (void)setScaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (WFAQIScale)scale
{
  return self->_scale;
}

- (void)setScale:(id)a3
{
  objc_storeStrong((id *)&self->_scale, a3);
}

- (void)setAirQualityIndex:(unint64_t)a3
{
  self->_airQualityIndex = a3;
}

- (WFAQIScaleCategory)currentScaleCategory
{
  return self->_currentScaleCategory;
}

- (void)setCurrentScaleCategory:(id)a3
{
  objc_storeStrong((id *)&self->_currentScaleCategory, a3);
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)significance
{
  return self->_significance;
}

- (void)setSignificance:(unint64_t)a3
{
  self->_significance = a3;
}

- (NSArray)pollutants
{
  return self->_pollutants;
}

- (void)setPollutants:(id)a3
{
  objc_storeStrong((id *)&self->_pollutants, a3);
}

- (WFAirPollutant)primaryPollutant
{
  return self->_primaryPollutant;
}

- (void)setPrimaryPollutant:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPollutant, a3);
}

- (unint64_t)currentCategoryIndex
{
  return self->_currentCategoryIndex;
}

- (void)setCurrentCategoryIndex:(unint64_t)a3
{
  self->_currentCategoryIndex = a3;
}

- (NSString)localizedRecommendation
{
  return self->_localizedRecommendation;
}

- (void)setLocalizedRecommendation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)localizedDisclaimer
{
  return self->_localizedDisclaimer;
}

- (void)setLocalizedDisclaimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)localizedAirQualityCategory
{
  return self->_localizedAirQualityCategory;
}

- (void)setLocalizedAirQualityCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)airQualityScale
{
  return self->_airQualityScale;
}

- (void)setAirQualityScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unint64_t)localizedAirQualityIndex
{
  return self->_localizedAirQualityIndex;
}

- (void)setLocalizedAirQualityIndex:(unint64_t)a3
{
  self->_localizedAirQualityIndex = a3;
}

- (WFAQIScaleCategory)localizedAirQualityScaleCategory
{
  return self->_localizedAirQualityScaleCategory;
}

- (void)setLocalizedAirQualityScaleCategory:(id)a3
{
  objc_storeStrong((id *)&self->_localizedAirQualityScaleCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAirQualityScaleCategory, 0);
  objc_storeStrong((id *)&self->_airQualityScale, 0);
  objc_storeStrong((id *)&self->_localizedAirQualityCategory, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localizedDisclaimer, 0);
  objc_storeStrong((id *)&self->_localizedRecommendation, 0);
  objc_storeStrong((id *)&self->_primaryPollutant, 0);
  objc_storeStrong((id *)&self->_pollutants, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_currentScaleCategory, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_scaleIdentifier, 0);
  objc_storeStrong((id *)&self->_providerAttribution, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
