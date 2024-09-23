@implementation PGMeaningfulEventRequiredCriteria

- (PGMeaningfulEventRequiredCriteria)initWithIdentifier:(id)a3 minimumScore:(double)a4 graph:(id)a5
{
  id v9;
  PGMeaningfulEventRequiredCriteria *v10;
  PGMeaningfulEventRequiredCriteria *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *internalAdditionalInfo;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningfulEventRequiredCriteria;
  v10 = -[PGMeaningfulEventCriteria initWithGraph:](&v15, sel_initWithGraph_, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    v11->_minimumScore = a4;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    internalAdditionalInfo = v11->_internalAdditionalInfo;
    v11->_internalAdditionalInfo = v12;

  }
  return v11;
}

- (NSString)meaningNodeLabel
{
  __CFString *v2;
  __CFString *v3;

  -[PGMeaningfulEventRequiredCriteria identifier](self, "identifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("WeakBirthday")))
  {
    v3 = CFSTR("Birthday");

    v2 = CFSTR("Birthday");
  }
  return (NSString *)v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGMeaningfulEventRequiredCriteria;
  -[PGMeaningfulEventRequiredCriteria description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@, %.2f"), v4, self->_identifier, *(_QWORD *)&self->_minimumScore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  NSString *identifier;
  double minimumScore;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PGMeaningfulEventRequiredCriteria;
  -[PGMeaningfulEventRequiredCriteria description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  minimumScore = self->_minimumScore;
  -[PGMeaningfulEventCriteria _debugDescriptionWithMomentNode:](self, "_debugDescriptionWithMomentNode:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@, %.2f, %@"), v4, identifier, *(_QWORD *)&minimumScore, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setAdditionalInfoForKey:(id)a3 value:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_internalAdditionalInfo, "setObject:forKeyedSubscript:", a4, a3);
}

- (NSDictionary)additionalInfo
{
  return (NSDictionary *)self->_internalAdditionalInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)minimumScore
{
  return self->_minimumScore;
}

- (BOOL)mustBeInteresting
{
  return self->_mustBeInteresting;
}

- (void)setMustBeInteresting:(BOOL)a3
{
  self->_mustBeInteresting = a3;
}

- (NSMutableDictionary)internalAdditionalInfo
{
  return self->_internalAdditionalInfo;
}

- (void)setInternalAdditionalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_internalAdditionalInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAdditionalInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
