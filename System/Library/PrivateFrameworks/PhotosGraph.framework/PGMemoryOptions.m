@implementation PGMemoryOptions

- (PGMemoryOptions)initWithReason:(unint64_t)a3 universalDate:(id)a4 location:(id)a5 peopleNames:(id)a6
{
  id v10;
  id v11;
  id v12;
  PGMemoryOptions *v13;
  PGMemoryOptions *v14;
  NSDate *v15;
  NSDate *universalDate;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGMemoryOptions;
  v13 = -[PGMemoryOptions init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_reason = a3;
    if (v10)
    {
      v15 = (NSDate *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    universalDate = v14->_universalDate;
    v14->_universalDate = v15;

    objc_storeStrong((id *)&v14->_location, a5);
    objc_storeStrong((id *)&v14->_peopleNames, a6);
  }

  return v14;
}

- (void)setUniversalDate:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *universalDate;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (NSDate *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  universalDate = self->_universalDate;
  self->_universalDate = v5;

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  +[PGMemoryOptions stringForReason:](PGMemoryOptions, "stringForReason:", self->_reason);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", self->_universalDate, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLLocation coordinate](self->_location, "coordinate");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%.5f,%.5f)"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_peopleNames, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", self->_lastMemoryCreationUniversalDate, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PGMemoryOptions;
  -[PGMemoryOptions description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@\n\treason: %@\n\tdate: %@\n\tlocation; %@\n\tpeopleNames: %@\n\texistingMemories: %d\n\tblockedMemories: %d\n\tlastMemoryCreationUniversalDate: %@"),
    v11,
    v3,
    v4,
    v7,
    v8,
    -[NSArray count](self->_existingMemories, "count"),
    -[NSArray count](self->_blockedMemories, "count"),
    v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSDate)universalDate
{
  return self->_universalDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)setPeopleNames:(id)a3
{
  objc_storeStrong((id *)&self->_peopleNames, a3);
}

- (NSArray)existingMemories
{
  return self->_existingMemories;
}

- (void)setExistingMemories:(id)a3
{
  objc_storeStrong((id *)&self->_existingMemories, a3);
}

- (NSArray)blockedMemories
{
  return self->_blockedMemories;
}

- (void)setBlockedMemories:(id)a3
{
  objc_storeStrong((id *)&self->_blockedMemories, a3);
}

- (NSSet)blockedFeatures
{
  return self->_blockedFeatures;
}

- (void)setBlockedFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_blockedFeatures, a3);
}

- (NSArray)existingSuggestions
{
  return self->_existingSuggestions;
}

- (void)setExistingSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_existingSuggestions, a3);
}

- (NSDate)lastMemoryCreationUniversalDate
{
  return self->_lastMemoryCreationUniversalDate;
}

- (void)setLastMemoryCreationUniversalDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMemoryCreationUniversalDate, a3);
}

- (NSDate)baseMemoryCreationUniversalDate
{
  return self->_baseMemoryCreationUniversalDate;
}

- (void)setBaseMemoryCreationUniversalDate:(id)a3
{
  objc_storeStrong((id *)&self->_baseMemoryCreationUniversalDate, a3);
}

- (NSDictionary)extraParameters
{
  return self->_extraParameters;
}

- (void)setExtraParameters:(id)a3
{
  objc_storeStrong((id *)&self->_extraParameters, a3);
}

- (unint64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(unint64_t)a3
{
  self->_randomSeed = a3;
}

- (double)forcedBeta
{
  return self->_forcedBeta;
}

- (void)setForcedBeta:(double)a3
{
  self->_forcedBeta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraParameters, 0);
  objc_storeStrong((id *)&self->_baseMemoryCreationUniversalDate, 0);
  objc_storeStrong((id *)&self->_lastMemoryCreationUniversalDate, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_blockedFeatures, 0);
  objc_storeStrong((id *)&self->_blockedMemories, 0);
  objc_storeStrong((id *)&self->_existingMemories, 0);
  objc_storeStrong((id *)&self->_peopleNames, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_universalDate, 0);
}

+ (id)stringForReason:(unint64_t)a3
{
  if (a3 > 7)
    return CFSTR("Illegal");
  else
    return off_1E8427CD8[a3];
}

@end
