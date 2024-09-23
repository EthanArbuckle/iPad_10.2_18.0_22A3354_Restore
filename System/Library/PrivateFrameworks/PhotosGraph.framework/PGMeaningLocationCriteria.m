@implementation PGMeaningLocationCriteria

+ (id)criteriaKey
{
  return CFSTR("Location");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("excludeFrequentLocations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExcludeFrequentLocations:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("excludeHomeWorkLocations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExcludeHomeWorkLocations:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeFrequentLocations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeFrequentLocations:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeHomeLocations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeHomeLocations:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includeWorkLocations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIncludeWorkLocations:", objc_msgSend(v10, "BOOLValue"));
  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  v5 = a4;
  if ((-[PGMeaningLocationCriteria excludeFrequentLocations](self, "excludeFrequentLocations")
     || -[PGMeaningLocationCriteria excludeHomeWorkLocations](self, "excludeHomeWorkLocations")
     || -[PGMeaningLocationCriteria includeFrequentLocations](self, "includeFrequentLocations")
     || -[PGMeaningLocationCriteria includeHomeLocations](self, "includeHomeLocations")
     || -[PGMeaningLocationCriteria includeWorkLocations](self, "includeWorkLocations"))
    && !objc_msgSend(v5, "hasAddressNodes"))
  {
    LOBYTE(self) = 0;
  }
  else
  {
    if (-[PGMeaningLocationCriteria includeHomeLocations](self, "includeHomeLocations"))
      v6 = objc_msgSend(v5, "happensPartiallyAtMyHome");
    else
      v6 = 1;
    v7 = !-[PGMeaningLocationCriteria includeWorkLocations](self, "includeWorkLocations");
    v8 = v7 & v6;
    if ((v7 & 1) == 0 && v6)
      v8 = objc_msgSend(v5, "happensPartiallyAtMyWork");
    v9 = !-[PGMeaningLocationCriteria excludeFrequentLocations](self, "excludeFrequentLocations");
    v10 = v9 & v8;
    if ((v9 & 1) == 0 && v8)
      v10 = objc_msgSend(v5, "happensAtFrequentLocation") ^ 1;
    v11 = !-[PGMeaningLocationCriteria includeFrequentLocations](self, "includeFrequentLocations");
    v12 = v11 & v10;
    if ((v11 & 1) == 0 && v10)
      v12 = objc_msgSend(v5, "happensAtFrequentLocation");
    v13 = !-[PGMeaningLocationCriteria excludeHomeWorkLocations](self, "excludeHomeWorkLocations");
    LOBYTE(self) = v13 & v12;
    if ((v13 & 1) == 0 && v12)
      LODWORD(self) = objc_msgSend(v5, "happensPartiallyAtMyHomeOrWork") ^ 1;
  }

  return (char)self;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  return 1;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGMeaningLocationCriteria excludeFrequentLocations](self, "excludeFrequentLocations"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("excludeFrequentLocations: %@\n"), v4);
  if (-[PGMeaningLocationCriteria excludeHomeWorkLocations](self, "excludeHomeWorkLocations"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("excludeHomeWorkLocations: %@\n"), v5);
  if (-[PGMeaningLocationCriteria includeWorkLocations](self, "includeWorkLocations"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("includeWorkLocations: %@\n"), v6);
  if (-[PGMeaningLocationCriteria includeHomeLocations](self, "includeHomeLocations"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("includeHomeLocations: %@\n"), v7);
  return (NSString *)v3;
}

- (BOOL)excludeFrequentLocations
{
  return self->_excludeFrequentLocations;
}

- (void)setExcludeFrequentLocations:(BOOL)a3
{
  self->_excludeFrequentLocations = a3;
}

- (BOOL)excludeHomeWorkLocations
{
  return self->_excludeHomeWorkLocations;
}

- (void)setExcludeHomeWorkLocations:(BOOL)a3
{
  self->_excludeHomeWorkLocations = a3;
}

- (BOOL)includeHomeLocations
{
  return self->_includeHomeLocations;
}

- (void)setIncludeHomeLocations:(BOOL)a3
{
  self->_includeHomeLocations = a3;
}

- (BOOL)includeWorkLocations
{
  return self->_includeWorkLocations;
}

- (void)setIncludeWorkLocations:(BOOL)a3
{
  self->_includeWorkLocations = a3;
}

- (BOOL)includeFrequentLocations
{
  return self->_includeFrequentLocations;
}

- (void)setIncludeFrequentLocations:(BOOL)a3
{
  self->_includeFrequentLocations = a3;
}

@end
