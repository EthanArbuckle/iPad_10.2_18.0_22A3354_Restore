@implementation SSQueryIntentHelper

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[SSQueryIntent intentString:](SSQueryIntent, "intentString:", self->_intentPrefixLength);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSQueryIntent intentString:](SSQueryIntent, "intentString:", self->_intentPostRetrieval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSQueryIntent intentString:](SSQueryIntent, "intentString:", self->_intentNextSection);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSQueryIntent intentString:](SSQueryIntent, "intentString:", self->_intentQU);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSQueryIntent intentString:](SSQueryIntent, "intentString:", self->_intentType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSQueryIntent intentStrengthString:](SSQueryIntent, "intentStrengthString:", self->_intentStrength);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("prefixBased\t%@\tpostRetrieval\t%@\tnextSection\t%@\tQU\t%@\tfinal\t%@\tStrength\t%@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int)intentPrefixLength
{
  return self->_intentPrefixLength;
}

- (void)setIntentPrefixLength:(int)a3
{
  self->_intentPrefixLength = a3;
}

- (int)intentPostRetrieval
{
  return self->_intentPostRetrieval;
}

- (void)setIntentPostRetrieval:(int)a3
{
  self->_intentPostRetrieval = a3;
}

- (int)intentNextSection
{
  return self->_intentNextSection;
}

- (void)setIntentNextSection:(int)a3
{
  self->_intentNextSection = a3;
}

- (int)intentQU
{
  return self->_intentQU;
}

- (void)setIntentQU:(int)a3
{
  self->_intentQU = a3;
}

- (int)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(int)a3
{
  self->_intentType = a3;
}

- (SFResultSection)nextSectionForIntent
{
  return self->_nextSectionForIntent;
}

- (void)setNextSectionForIntent:(id)a3
{
  objc_storeStrong((id *)&self->_nextSectionForIntent, a3);
}

- (NSSet)retrievedBundleIDs
{
  return self->_retrievedBundleIDs;
}

- (void)setRetrievedBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_retrievedBundleIDs, a3);
}

- (NSString)topHitResultBundleId
{
  return self->_topHitResultBundleId;
}

- (void)setTopHitResultBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_topHitResultBundleId, a3);
}

- (BOOL)resultSetHasTopHits
{
  return self->_resultSetHasTopHits;
}

- (void)setResultSetHasTopHits:(BOOL)a3
{
  self->_resultSetHasTopHits = a3;
}

- (BOOL)resultSetHasSuggestions
{
  return self->_resultSetHasSuggestions;
}

- (void)setResultSetHasSuggestions:(BOOL)a3
{
  self->_resultSetHasSuggestions = a3;
}

- (BOOL)resultSetHasAppSectionWithinTop3
{
  return self->_resultSetHasAppSectionWithinTop3;
}

- (void)setResultSetHasAppSectionWithinTop3:(BOOL)a3
{
  self->_resultSetHasAppSectionWithinTop3 = a3;
}

- (int64_t)resultSetSectionCount
{
  return self->_resultSetSectionCount;
}

- (void)setResultSetSectionCount:(int64_t)a3
{
  self->_resultSetSectionCount = a3;
}

- (int)intentStrength
{
  return self->_intentStrength;
}

- (void)setIntentStrength:(int)a3
{
  self->_intentStrength = a3;
}

- (NSString)quIntentLabel
{
  return self->_quIntentLabel;
}

- (void)setQuIntentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_quIntentLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quIntentLabel, 0);
  objc_storeStrong((id *)&self->_topHitResultBundleId, 0);
  objc_storeStrong((id *)&self->_retrievedBundleIDs, 0);
  objc_storeStrong((id *)&self->_nextSectionForIntent, 0);
}

@end
