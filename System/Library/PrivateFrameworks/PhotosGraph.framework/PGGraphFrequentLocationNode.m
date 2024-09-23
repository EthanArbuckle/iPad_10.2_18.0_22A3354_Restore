@implementation PGGraphFrequentLocationNode

- (PGGraphFrequentLocationNode)initWithUniversalDateInterval:(id)a3
{
  id v5;
  PGGraphFrequentLocationNode *v6;
  PGGraphFrequentLocationNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphFrequentLocationNode;
  v6 = -[PGGraphNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_universalDateInterval, a3);

  return v7;
}

- (PGGraphFrequentLocationNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  PGGraphFrequentLocationNode *v16;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("universalStartDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("universalEndDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v14);
  v16 = -[PGGraphFrequentLocationNode initWithUniversalDateInterval:](self, "initWithUniversalDateInterval:", v15);

  return v16;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  char v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  BOOL v20;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
    goto LABEL_8;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("universalStartDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_6;
  v7 = v6;
  objc_msgSend(v6, "doubleValue");
  v9 = v8;
  -[NSDateInterval startDate](self->_universalDateInterval, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  if (v9 == v12)
  {
LABEL_6:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("universalEndDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v14, "doubleValue");
      v17 = v16;
      -[NSDateInterval endDate](self->_universalDateInterval, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceReferenceDate");
      v20 = v17 != v19;

      v13 = !v20;
      goto LABEL_9;
    }
LABEL_8:
    v13 = 1;
    goto LABEL_9;
  }
  v13 = 0;
LABEL_9:

  return v13 & 1;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("universalStartDate");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDateInterval startDate](self->_universalDateInterval, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("universalEndDate");
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDateInterval endDate](self->_universalDateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("FrequentLocation");
  return CFSTR("FrequentLocation");
}

- (unsigned)domain
{
  return 204;
}

- (NSDate)universalStartDate
{
  void *v2;
  void *v3;

  -[PGGraphFrequentLocationNode universalDateInterval](self, "universalDateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)universalEndDate
{
  void *v2;
  void *v3;

  -[PGGraphFrequentLocationNode universalDateInterval](self, "universalDateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)name
{
  return 0;
}

- (PGGraphAddressNode)addressNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphFrequentLocationNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNode *)v4;
}

- (unint64_t)numberOfMomentNodes
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PGGraphFrequentLocationNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[PGGraphFrequentLocationNode addressNode](self, "addressNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;
  -[PGGraphFrequentLocationNode universalDateInterval](self, "universalDateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keywordDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ ([%@ - %@] %@ <%f,%f> %zu moments)"), v12, v13, v14, v9, v5, v7, -[PGGraphFrequentLocationNode numberOfMomentNodes](self, "numberOfMomentNodes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (PGGraphFrequentLocationNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphFrequentLocationNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 33;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphFrequentLocationNode universalStartDate](self, "universalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphFrequentLocationNode universalEndDate](self, "universalEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSDateInterval)universalDateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalDateInterval, 0);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("FrequentLocation"), 204);
}

+ (id)addressOfFrequentLocation
{
  void *v2;
  void *v3;

  +[PGGraphFrequentLocationAtEdge filter](PGGraphFrequentLocationAtEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)momentOfFrequentLocation
{
  void *v2;
  void *v3;

  +[PGGraphFrequentLocationInEdge filter](PGGraphFrequentLocationInEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
