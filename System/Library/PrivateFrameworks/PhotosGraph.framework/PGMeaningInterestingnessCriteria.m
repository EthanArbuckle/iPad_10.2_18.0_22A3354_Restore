@implementation PGMeaningInterestingnessCriteria

+ (id)criteriaKey
{
  return CFSTR("Interestingness");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mustBeInteresting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMustBeInteresting:", objc_msgSend(v6, "BOOLValue"));
  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (-[PGMeaningInterestingnessCriteria mustBeInteresting](self, "mustBeInteresting")
    && (objc_msgSend(v5, "isInteresting") & 1) == 0)
  {
    v6 = objc_msgSend(v5, "isSmartInteresting");
  }
  else
  {
    v6 = 1;
  }

  return v6;
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
  void *v2;
  _BOOL4 v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[PGMeaningInterestingnessCriteria mustBeInteresting](self, "mustBeInteresting");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  return (NSString *)objc_msgSend(v2, "stringWithFormat:", CFSTR("mustBeInteresting: %@\n"), v4);
}

- (BOOL)mustBeInteresting
{
  return self->_mustBeInteresting;
}

- (void)setMustBeInteresting:(BOOL)a3
{
  self->_mustBeInteresting = a3;
}

@end
