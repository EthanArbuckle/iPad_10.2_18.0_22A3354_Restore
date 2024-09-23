@implementation PGMeaningLocationMobilityCriteria

+ (id)criteriaKey
{
  return CFSTR("LocationMobility");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locationMobility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLocationMobilityType:", +[PGGraphMobilityNode mobilityTypeForMobilityLabel:](PGGraphMobilityNode, "mobilityTypeForMobilityLabel:", v6));
  objc_msgSend(v5, "setLocationMobilityLabel:", v6);

  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;

  v5 = a3;
  if (-[PGMeaningLocationMobilityCriteria locationMobilityType](self, "locationMobilityType"))
  {
    v6 = objc_msgSend(v5, "locationMobilityType");
    v7 = v6 == -[PGMeaningLocationMobilityCriteria locationMobilityType](self, "locationMobilityType");
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  unint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[PGMeaningLocationMobilityCriteria locationMobilityType](self, "locationMobilityType");
  if (!v3)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[PGMeaningLocationMobilityCriteria locationMobilityLabel](self, "locationMobilityLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid mobility type \"%@\", (uint8_t *)&v8, 0xCu);

    }
  }
  return v3 != 0;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PGMeaningLocationMobilityCriteria locationMobilityLabel](self, "locationMobilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("locationMobilityLabel: %@\n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)locationMobilityType
{
  return self->_locationMobilityType;
}

- (void)setLocationMobilityType:(unint64_t)a3
{
  self->_locationMobilityType = a3;
}

- (NSString)locationMobilityLabel
{
  return self->_locationMobilityLabel;
}

- (void)setLocationMobilityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationMobilityLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationMobilityLabel, 0);
}

@end
