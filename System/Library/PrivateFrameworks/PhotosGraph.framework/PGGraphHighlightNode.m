@implementation PGGraphHighlightNode

- (id)initFromHighlight:(id)a3
{
  id v4;
  PGGraphHighlightNode *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphHighlightNode;
  v5 = -[PGGraphNode init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "propertiesWithHighlight:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphHighlightNode setLocalProperties:](v5, "setLocalProperties:", v6);

  }
  return v5;
}

- (PGGraphHighlightNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  PGGraphHighlightNode *v7;
  PGGraphHighlightNode *v8;

  v6 = a5;
  v7 = -[PGGraphNode init](self, "init");
  v8 = v7;
  if (v7)
    -[PGGraphHighlightNode setLocalProperties:](v7, "setLocalProperties:", v6);

  return v8;
}

- (void)setLocalProperties:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  NSString *v15;
  NSString *uuid;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utcs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  self->_universalStartTimestamp = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("utce"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  self->_universalEndTimestamp = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tzs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  self->_localStartTimestamp = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tze"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  self->_localEndTimestamp = v14;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v15;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  self->_sharingComposition = objc_msgSend(v17, "unsignedShortValue");
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_uuid))
      goto LABEL_11;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (!objc_msgSend(v8, "isEqual:", self->_name))
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9 && objc_msgSend(v9, "unsignedShortValue") != self->_sharingComposition)
LABEL_11:
      v10 = 0;
    else
      v10 = 1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)propertyDictionary
{
  NSString *name;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSString *uuid;
  void *v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  name = self->_name;
  if (!name)
    name = (NSString *)&stru_1E8436F28;
  v14[0] = name;
  v13[0] = CFSTR("name");
  v13[1] = CFSTR("utcs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_universalStartTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("utce");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_universalEndTimestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("tzs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_localStartTimestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("tze");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_localEndTimestamp);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  uuid = self->_uuid;
  if (!uuid)
    uuid = (NSString *)&stru_1E8436F28;
  v14[4] = v7;
  v14[5] = uuid;
  v13[5] = CFSTR("id");
  v13[6] = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_sharingComposition);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  objc_class *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = 56;
LABEL_3:
    v6 = *(__CFString **)((char *)&self->super.super.super.super.isa + v5);
    if (!v6)
      v6 = &stru_1E8436F28;
    v7 = v6;
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("utcs")))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = 72;
LABEL_14:
    objc_msgSend(v8, "numberWithDouble:", *(double *)((char *)&self->super.super.super.super.isa + v9));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v10 = v7;
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("utce")))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = 80;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("tzs")))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = 32;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("tze")))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = 40;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("id")))
  {
    v5 = 64;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sharingComposition")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_sharingComposition);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v13;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on %@.", (uint8_t *)&v14, 0x16u);

  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphHighlightNode (%@, %@)"), self->_uuid, self->_name);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Highlight");
  return CFSTR("Highlight");
}

- (unsigned)domain
{
  return 102;
}

- (PGGraphHighlightNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphHighlightNodeCollection alloc], "initWithNode:", self);
}

- (NSString)localIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CD1708], "localIdentifierWithUUID:", self->_uuid);
}

- (NSString)UUID
{
  return self->_uuid;
}

- (PGGraphHighlightGroupNode)highlightGroupNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightGroupNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightGroupNode *)v4;
}

- (double)timezoneOffsetAtStart
{
  return self->_localStartTimestamp - self->_universalStartTimestamp;
}

- (double)timezoneOffsetAtEnd
{
  return self->_localEndTimestamp - self->_universalEndTimestamp;
}

- (BOOL)isPartOfTrip
{
  void *v2;
  char v3;

  -[PGGraphHighlightNode highlightGroupNode](self, "highlightGroupNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTrip");

  return v3;
}

- (BOOL)isPartOfLongTrip
{
  void *v2;
  char v3;

  -[PGGraphHighlightNode highlightGroupNode](self, "highlightGroupNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLongTrip");

  return v3;
}

- (BOOL)isPartOfShortTrip
{
  void *v2;
  char v3;

  -[PGGraphHighlightNode highlightGroupNode](self, "highlightGroupNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShortTrip");

  return v3;
}

- (BOOL)isPartOfAggregation
{
  void *v2;
  char v3;

  -[PGGraphHighlightNode highlightGroupNode](self, "highlightGroupNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAggregation");

  return v3;
}

- (BOOL)isLongTrip
{
  return 0;
}

- (BOOL)isShortTrip
{
  return 0;
}

- (BOOL)isTrip
{
  return 0;
}

- (BOOL)isAggregation
{
  return 0;
}

- (BOOL)petIsPresent
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "petNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)isInteresting
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interestingSubset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)isInterestingWithAlternateJunking
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interestingWithAlternateJunkingSubset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)isSmartInteresting
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smartInterestingSubset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (unint64_t)numberOfRegularGemAssets
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphHighlightNode_numberOfRegularGemAssets__block_invoke;
  v6[3] = &unk_1E842FA68;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateNodesUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (unint64_t)numberOfShinyGemAssets
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphHighlightNode_numberOfShinyGemAssets__block_invoke;
  v6[3] = &unk_1E842FA68;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateNodesUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)happensPartiallyAtHomeOfPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphHighlightNode collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "momentNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preciseAddressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addressNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "intersectsCollection:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)happensPartiallyAtWorkOfPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphHighlightNode collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "momentNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preciseAddressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addressNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "intersectsCollection:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphHighlightNode collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "momentNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preciseAddressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeOrWorkNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addressNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "intersectsCollection:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDate)localStartDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_localStartTimestamp);
}

- (NSDate)localEndDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_localEndTimestamp);
}

- (NSDate)universalStartDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_universalStartTimestamp);
}

- (NSDate)universalEndDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_universalEndTimestamp);
}

- (BOOL)startsAfterLocalDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  return self->_localStartTimestamp >= v4;
}

- (BOOL)endsBeforeLocalDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  return self->_localEndTimestamp <= v4;
}

- (double)contentScore
{
  void *v2;
  void *v3;
  unint64_t v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PGGraphHighlightNode_contentScore__block_invoke;
  v7[3] = &unk_1E8432468;
  v7[4] = &v12;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateNodesUsingBlock:", v7);

  v4 = v9[3];
  if (v4)
  {
    v5 = v13[3] / (double)v4;
    v13[3] = v5;
  }
  else
  {
    v5 = v13[3];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("CONTAINS"), 102, a3);
}

- (id)eventSortedMomentNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)eventEnrichmentMomentNodes
{
  void *v2;
  void *v3;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)eventEnrichmentSortedMomentNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)meaningLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meaningNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meaningLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)reliableMeaningLabels
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reliableMeaningNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meaningLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)birthdayPersonNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "birthdayPersonNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)anniversaryPersonNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anniversaryPersonNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchAssetCollectionInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MANode graph](self, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highlightForHighlightNode:inPhotoLibrary:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasPeopleCountingMe:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PGGraphHighlightNode_hasPeopleCountingMe___block_invoke;
  v7[3] = &unk_1E84281E8;
  v8 = a3;
  v7[4] = &v9;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v7);

  LOBYTE(v4) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v4;
}

- (id)personNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)petNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "petNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)socialGroupNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialGroupNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)personNodesInProximity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personNodesInProximity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)consolidatedPersonNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "consolidatedPersonNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)consolidatedPersonNodesPresentInAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "consolidatedPersonNodesPresentInAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__PGGraphHighlightNode_dateNodes__block_invoke;
  v9[3] = &unk_1E8432070;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v9);

  return v7;
}

- (id)holidayNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__PGGraphHighlightNode_holidayNodes__block_invoke;
  v9[3] = &unk_1E8432070;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v9);

  return v7;
}

- (id)celebratedHolidayNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke;
  v9[3] = &unk_1E8432070;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v9);

  return v7;
}

- (id)poiNodes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__PGGraphHighlightNode_poiNodes__block_invoke;
  v8[3] = &unk_1E8436408;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v8);

  return v6;
}

- (id)roiNodes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__PGGraphHighlightNode_roiNodes__block_invoke;
  v8[3] = &unk_1E8436408;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v8);

  return v6;
}

- (BOOL)hasLocation
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PGGraphHighlightNode_hasLocation__block_invoke;
  v5[3] = &unk_1E842FA68;
  v5[4] = &v6;
  objc_msgSend(v3, "enumerateNodesUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)addressNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)businessNodes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__PGGraphHighlightNode_businessNodes__block_invoke;
  v8[3] = &unk_1E8436408;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v8);

  return v6;
}

- (id)publicEventNodes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PGGraphHighlightNode_publicEventNodes__block_invoke;
  v8[3] = &unk_1E8436408;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v8);

  return v6;
}

- (id)seasonNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__PGGraphHighlightNode_seasonNodes__block_invoke;
  v9[3] = &unk_1E8432070;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v9);

  return v7;
}

- (void)enumerateBusinessesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PGGraphHighlightNode collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PGGraphHighlightNode_enumerateBusinessesUsingBlock___block_invoke;
  v8[3] = &unk_1E842D978;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v8);

}

- (id)meaningfulEvent
{
  return 0;
}

- (id)debugDictionaryWithServiceManager:(id)a3
{
  id v4;
  PGTitleGenerationContext *v5;
  void *v6;
  uint64_t v7;
  PGHighlightTitleGenerator *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  PGHighlightTitleGenerator *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v31;
  void *v32;
  _QWORD v33[6];
  _QWORD v34[7];

  v34[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [PGTitleGenerationContext alloc];
  -[MANode graph](self, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGTitleGenerationContext initWithGraph:serviceManager:](v5, "initWithGraph:serviceManager:", v6, v4);

  v32 = (void *)v7;
  v8 = -[PGHighlightTitleGenerator initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:]([PGHighlightTitleGenerator alloc], "initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", self, 0, 0, 0, v7);
  -[PGHighlightTitleGenerator titleTuple](v8, "titleTuple");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E8436F28;
  v31 = v13;

  objc_msgSend(v9, "subtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (__CFString *)v15;
  else
    v17 = &stru_1E8436F28;
  v18 = v17;

  v19 = objc_msgSend(v10, "category");
  v20 = -[PGHighlightTitleGenerator initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:]([PGHighlightTitleGenerator alloc], "initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", self, 0, 0, 1, v7);

  -[PGHighlightTitleGenerator titleTuple](v20, "titleTuple");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subtitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = CFSTR("weightedAverageContentScore");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[PGGraphHighlightNode contentScore](self, "contentScore");
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  v34[1] = v31;
  v33[1] = CFSTR("title");
  v33[2] = CFSTR("subtitle");
  v34[2] = v18;
  v34[3] = v23;
  v33[3] = CFSTR("verboseSmartDescription");
  v33[4] = CFSTR("titleCategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v26;
  v33[5] = CFSTR("meaningLabels");
  -[PGGraphHighlightNode meaningLabels](self, "meaningLabels");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (double)weightForMoment:(id)a3
{
  void *v3;
  float v4;
  double v5;

  -[MANode anyEdgeTowardNode:](self, "anyEdgeTowardNode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weight");
  v5 = v4;

  return v5;
}

- (id)connectedEventsWithTargetDomain:(unsigned __int16)a3
{
  int v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (-[PGGraphHighlightNode domain](self, "domain") == a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 100)
  {
    -[PGGraphHighlightNode eventCollection](self, "eventCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventMomentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "temporarySet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = v3;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Unsupported target domain: %u", (uint8_t *)v11, 8u);
    }

    return 0;
  }
}

- (id)keywordsForRelatedType:(unint64_t)a3 focusOnNodes:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v69;
  id obj;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  unint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[6];
  _QWORD v118[6];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PGGraphHighlightNode collection](self, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "temporarySet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keywordsForRelatedType:focusOnNodes:", a3, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_62;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 2) != 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[PGGraphHighlightNode localStartDate](self, "localStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("[EventStart] %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    -[PGGraphHighlightNode localEndDate](self, "localEndDate");
    v16 = a3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("[EventEnd] %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = v16;
    objc_msgSend(v84, "addObject:", v14);
    objc_msgSend(v84, "addObject:", v18);

  }
  v73 = v9;
  v79 = a3;
  if ((a3 & 1) != 0)
  {
    -[MANode graph](self, "graph");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "meNode");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    -[PGGraphHighlightNode personNodes](self, "personNodes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
    if (!v75)
      goto LABEL_44;
    v74 = *(_QWORD *)v114;
    v71 = v6;
    while (1)
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v114 != v74)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        if (v6 && !objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i)))
          continue;
        v77 = i;
        v22 = (void *)MEMORY[0x1E0CB37A0];
        objc_msgSend(v21, "keywordDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithString:", v23);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v76 || (objc_msgSend(v21, "isEqualToNode:", v76) & 1) != 0)
          goto LABEL_32;
        objc_msgSend(v21, "edgesForLabel:domain:", 0, 300);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v24, "count"))
          goto LABEL_31;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v69 = v24;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        if (!v26)
          goto LABEL_28;
        v27 = v26;
        v28 = *(_QWORD *)v110;
        v85 = v25;
        v86 = *(_QWORD *)v110;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v110 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
            objc_msgSend(v30, "oppositeNode:", v21);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v31, "domain") == 300)
            {
              objc_msgSend(v31, "label");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v32, "isEqualToString:", CFSTR("People")))
              {

              }
              else
              {
                objc_msgSend(v31, "label");
                v33 = v21;
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("Me"));

                v21 = v33;
                v25 = v85;
                v28 = v86;

                if (!v35)
                  goto LABEL_26;
              }
              objc_msgSend(v30, "label");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "addObject:", v36);

            }
LABEL_26:

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        }
        while (v27);
LABEL_28:

        if (objc_msgSend(v87, "count"))
        {
          objc_msgSend(v87, "componentsJoinedByString:", CFSTR("/"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "appendFormat:", CFSTR(" - %@ -"), v37);

        }
        v9 = v73;
        v24 = v69;
LABEL_31:

LABEL_32:
        objc_msgSend(v21, "collection");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v39 = v9;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v106;
          v43 = 0.0;
          do
          {
            for (k = 0; k != v41; ++k)
            {
              if (*(_QWORD *)v106 != v42)
                objc_enumerationMutation(v39);
              v45 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
              objc_msgSend(v45, "collection");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:", v38, v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "anyEdge");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "importance");
              v50 = v49;

              -[PGGraphHighlightNode weightForMoment:](self, "weightForMoment:", v45);
              v43 = v43 + v51 * v50;
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
          }
          while (v41);
        }
        else
        {
          v43 = 0.0;
        }

        objc_msgSend(v78, "appendFormat:", CFSTR(" (%0.2f)"), *(_QWORD *)&v43);
        objc_msgSend(v72, "addObject:", v78);

        v6 = v71;
        v9 = v73;
        i = v77;
      }
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
      if (!v75)
      {
LABEL_44:

        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v52 = v9;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
        if (v53)
        {
          v54 = v53;
          v55 = 0;
          v56 = *(_QWORD *)v102;
          do
          {
            for (m = 0; m != v54; ++m)
            {
              if (*(_QWORD *)v102 != v56)
                objc_enumerationMutation(v52);
              v55 += objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * m), "totalNumberOfPersons");
            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
          }
          while (v54);
        }
        else
        {
          v55 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[All Persons] %lu"), v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addObject:", v58);

        break;
      }
    }
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v59 = v9;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v98;
    v63 = MEMORY[0x1E0C809B0];
    do
    {
      for (n = 0; n != v61; ++n)
      {
        if (*(_QWORD *)v98 != v62)
          objc_enumerationMutation(v59);
        v65 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * n);
        -[PGGraphHighlightNode weightForMoment:](self, "weightForMoment:", v65);
        v67 = v66;
        v88[0] = v63;
        v88[1] = 3221225472;
        v88[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke;
        v88[3] = &unk_1E8428280;
        v89 = v6;
        v95 = v79;
        v96 = v67;
        v90 = v83;
        v91 = v84;
        v92 = v82;
        v93 = v81;
        v94 = v80;
        objc_msgSend(v65, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v88);

      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v97, v119, 16);
    }
    while (v61);
  }

  v117[0] = &unk_1E84E28D0;
  v117[1] = &unk_1E84E28E8;
  v118[0] = v72;
  v118[1] = v83;
  v117[2] = &unk_1E84E2900;
  v117[3] = &unk_1E84E2918;
  v118[2] = v84;
  v118[3] = v82;
  v117[4] = &unk_1E84E2930;
  v117[5] = &unk_1E84E2948;
  v118[4] = v81;
  v118[5] = v80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v73;
LABEL_62:

  return v11;
}

- (unint64_t)featureType
{
  return 28;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphHighlightNode localIdentifier](self, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)naturalLanguageFeatures
{
  PGTextFeatureGenerator *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PGTextFeatureGenerator *v8;
  void *v9;

  v3 = [PGTextFeatureGenerator alloc];
  -[PGGraphHighlightNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporarySet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANode graph](self, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGTextFeatureGenerator initWithMomentNodes:graph:](v3, "initWithMomentNodes:graph:", v6, v7);

  -[PGTextFeatureGenerator naturalLanguageFeatures](v8, "naturalLanguageFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (double)timestampUTCStart
{
  return self->_universalStartTimestamp;
}

- (double)timestampUTCEnd
{
  return self->_universalEndTimestamp;
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  int v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[4];
  _QWORD v47[2];
  _QWORD v48[4];
  id v49;
  double v50;
  _QWORD v51[4];
  _QWORD v52[3];
  _QWORD aBlock[4];
  id v54;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_2;
  aBlock[3] = &unk_1E84321B0;
  v8 = v6;
  v54 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = *(void **)(a1 + 32);
  if (!v10 || objc_msgSend(v10, "containsObject:", v8))
  {
    if (objc_msgSend(v5, "domain") == 200 && (*(_BYTE *)(a1 + 80) & 4) != 0)
    {
      objc_msgSend(v5, "relevance");
      v14 = *(double *)(a1 + 88);
      v16 = v15 * v14;
      v51[0] = v7;
      v51[1] = 3221225472;
      v51[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_3;
      v51[3] = &unk_1E8428230;
      *(double *)&v52[1] = v15 * v14;
      *(double *)&v52[2] = v14;
      v13 = (id *)v52;
      v52[0] = *(id *)(a1 + 40);
      v17 = v8;
      objc_msgSend(v17, "enumerateOutEdgesUsingBlock:", v51);
      objc_msgSend(v17, "collection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "homeWorkNodes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v7;
      v48[1] = 3221225472;
      v48[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_4;
      v48[3] = &unk_1E8432228;
      v50 = v16;
      v49 = *(id *)(a1 + 40);
      objc_msgSend(v19, "enumerateNodesUsingBlock:", v48);

      goto LABEL_10;
    }
    if (objc_msgSend(v5, "domain") == 400 && (*(_BYTE *)(a1 + 80) & 2) != 0)
    {
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v8, "keywordDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46[0] = v7;
        v46[1] = 3221225472;
        v46[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_6;
        v46[3] = &unk_1E8428258;
        v47[1] = *(_QWORD *)(a1 + 88);
        v13 = (id *)v47;
        v47[0] = *(id *)(a1 + 48);
        objc_msgSend(v8, "enumerateHolidayEdgesAndNodesUsingBlock:", v46);
LABEL_10:

      }
    }
  }
  if (objc_msgSend(v5, "domain") == 301 && (*(_BYTE *)(a1 + 80) & 8) != 0)
  {
    objc_msgSend(v5, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", CFSTR("BIRTHDAY"))
      || objc_msgSend(v24, "isEqualToString:", CFSTR("BIRTHDAY")))
    {
      v30 = *(void **)(a1 + 56);
      objc_msgSend(v5, "confidence");
      v9[2](v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v31);

    }
    goto LABEL_35;
  }
  if (objc_msgSend(v5, "domain") == 401 && (*(_BYTE *)(a1 + 80) & 8) != 0)
  {
    v29 = *(void **)(a1 + 56);
    goto LABEL_30;
  }
  v20 = objc_msgSend(v5, "domain");
  v21 = *(_QWORD *)(a1 + 80);
  if (v20 == 700 && (v21 & 8) != 0)
  {
    v22 = *(void **)(a1 + 56);
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "capitalizedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "label");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("[%@] %@"), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v27);

LABEL_35:
    goto LABEL_36;
  }
  v28 = objc_msgSend(v5, "domain");
  if ((v21 & 0x10) != 0)
  {
    if (v28 != 501 && objc_msgSend(v5, "domain") != 502)
      goto LABEL_36;
LABEL_33:
    v29 = *(void **)(a1 + 64);
    objc_msgSend(v5, "confidence");
    v9[2](v9);
    v32 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (v28 == 600 && (*(_BYTE *)(a1 + 80) & 0x20) != 0)
  {
    v33 = v5;
    v34 = v8;
    v45 = v34;
    v35 = objc_msgSend(v33, "isReliable");
    v36 = CFSTR("NO");
    if (v35)
      v36 = CFSTR("YES");
    v37 = v36;
    v44 = objc_msgSend(v33, "numberOfAssets");
    v38 = objc_msgSend(v33, "numberOfHighConfidenceAssets");
    v39 = objc_msgSend(v33, "numberOfSearchConfidenceAssets");
    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v34, "keywordDescription");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "confidence");
    v43 = v42;

    objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ #all:%lu #highConf:%lu #searchConf:%lu reliable:%@ - (%0.2f)"), v41, v44, v38, v39, v37, v43);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "addObject:", v24);
    goto LABEL_35;
  }
  if (objc_msgSend(v5, "domain") == 503 && (*(_BYTE *)(a1 + 80) & 0x10) != 0)
    goto LABEL_33;
  if (objc_msgSend(v5, "domain") == 900 && (*(_BYTE *)(a1 + 80) & 0x10) != 0)
  {
    v29 = *(void **)(a1 + 64);
LABEL_30:
    objc_msgSend(v8, "keywordDescription");
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_34:
    v24 = (void *)v32;
    objc_msgSend(v29, "addObject:", v32);
    goto LABEL_35;
  }
LABEL_36:

}

id __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_2(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "keywordDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%0.2f)"), v4, *(_QWORD *)&a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "domain") == 200)
  {
    v3 = *(double *)(a1 + 40);
LABEL_5:
    objc_msgSend(v9, "targetNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "keywordDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%0.2f)"), v7, *(_QWORD *)&v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "domain") == 201)
  {
    objc_msgSend(v9, "relevance");
    v3 = v4 * *(double *)(a1 + 48);
    goto LABEL_5;
  }
LABEL_6:

}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ownerNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_5;
  v7[3] = &unk_1E8432200;
  v8 = v3;
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v7);

}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "keywordDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%0.2f)"), v5, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

void __60__PGGraphHighlightNode_keywordsForRelatedType_focusOnNodes___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] - %@ (%0.2f)"), v6, v7, *(_QWORD *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

uint64_t __54__PGGraphHighlightNode_enumerateBusinessesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateBusinessesUsingBlock:", *(_QWORD *)(a1 + 32));
}

void __35__PGGraphHighlightNode_seasonNodes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "seasonNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __40__PGGraphHighlightNode_publicEventNodes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PGGraphHighlightNode_publicEventNodes__block_invoke_2;
  v3[3] = &unk_1E8432110;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumeratePublicEventNodesUsingBlock:", v3);

}

uint64_t __40__PGGraphHighlightNode_publicEventNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __37__PGGraphHighlightNode_businessNodes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PGGraphHighlightNode_businessNodes__block_invoke_2;
  v3[3] = &unk_1E84320E8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateBusinessNodesUsingBlock:", v3);

}

uint64_t __37__PGGraphHighlightNode_businessNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __35__PGGraphHighlightNode_hasLocation__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasLocation");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __32__PGGraphHighlightNode_roiNodes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PGGraphHighlightNode_roiNodes__block_invoke_2;
  v3[3] = &unk_1E84320C0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateROINodesUsingBlock:", v3);

}

uint64_t __32__PGGraphHighlightNode_roiNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __32__PGGraphHighlightNode_poiNodes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PGGraphHighlightNode_poiNodes__block_invoke_2;
  v3[3] = &unk_1E8432098;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumeratePOINodesUsingBlock:", v3);

}

uint64_t __32__PGGraphHighlightNode_poiNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke_2;
  v3[3] = &unk_1E8433B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateHolidayNodesUsingBlock:", v3);

}

void __46__PGGraphHighlightNode_celebratedHolidayNodes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasEdgeWithLabel:domain:", CFSTR("CELEBRATING"), 401))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __36__PGGraphHighlightNode_holidayNodes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PGGraphHighlightNode_holidayNodes__block_invoke_2;
  v3[3] = &unk_1E8433B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateHolidayNodesUsingBlock:", v3);

}

uint64_t __36__PGGraphHighlightNode_holidayNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __33__PGGraphHighlightNode_dateNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __44__PGGraphHighlightNode_hasPeopleCountingMe___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "hasPeopleCountingMe:", *(unsigned __int8 *)(a1 + 40));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

double __36__PGGraphHighlightNode_contentScore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double result;

  v3 = a2;
  v4 = objc_msgSend(v3, "numberOfAssets");
  objc_msgSend(v3, "contentScore");
  v6 = v5;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v7 + 24) + v6 * (double)v4;
  *(double *)(v7 + 24) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v4;
  return result;
}

uint64_t __46__PGGraphHighlightNode_numberOfShinyGemAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfShinyGemAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __48__PGGraphHighlightNode_numberOfRegularGemAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfRegularGemAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Highlight"), 102);
}

+ (id)dayHighlightsFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Highlight"), 102);
}

+ (id)allHighlightsFilter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 102);
}

+ (id)filterWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "allHighlightsFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("id");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)filterWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "allHighlightsFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("id");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)propertiesWithHighlight:(id)a3
{
  void *v3;
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
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("id"));
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "localStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("tzs"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("utcs"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "localEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v13, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("tze"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSince1970");
  objc_msgSend(v16, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("utce"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend(v4, "sharingComposition");

  objc_msgSend(v19, "numberWithUnsignedShort:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("sharingComposition"));

  return v5;
}

+ (id)promotionScoreSortDescriptors
{
  if (promotionScoreSortDescriptors_onceToken != -1)
    dispatch_once(&promotionScoreSortDescriptors_onceToken, &__block_literal_global_4075);
  return (id)promotionScoreSortDescriptors_sortDescriptors;
}

+ (id)pathFromMoment
{
  return CFSTR("(:Moment)<-[:CONTAINS]-");
}

+ (id)pathToMoment
{
  return CFSTR("-[:CONTAINS]->(:Moment)");
}

+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3
{
  int v3;
  void *v4;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 == 102)
    return &stru_1E8436F28;
  v3 = a3;
  if (a3 == 100)
  {
    objc_msgSend((id)objc_opt_class(), "pathFromMoment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v8, 8u);
    }

    v4 = 0;
  }
  return v4;
}

+ (id)pathToTargetNodeDomain:(unsigned __int16)a3
{
  int v3;
  void *v4;
  void *v6;
  NSObject *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 == 102)
    return &stru_1E8436F28;
  v3 = a3;
  if (a3 == 100)
  {
    objc_msgSend((id)objc_opt_class(), "pathToMoment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v8, 8u);
    }

    v4 = 0;
  }
  return v4;
}

+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a4;
  if (v4 == 102)
  {
    v7 = &stru_1E8436F28;
    if (v5)
      v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:Highlight)"), v7);
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    v6 = &stru_1E8436F28;
    if (v5)
      v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:Moment)<-[:CONTAINS]-(:Highlight)"), v6);
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", buf, 8u);
  }

  v8 = 0;
LABEL_13:

  return v8;
}

+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a4;
  if (v4 == 102)
  {
    v7 = &stru_1E8436F28;
    if (v5)
      v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:Highlight)"), v7);
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    v6 = &stru_1E8436F28;
    if (v5)
      v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(:Highlight)-[:CONTAINS]->(%@:Moment)"), v6);
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", buf, 8u);
  }

  v8 = 0;
LABEL_13:

  return v8;
}

+ (MARelation)momentInDayHighlight
{
  void *v2;
  void *v3;

  +[PGGraphContainsEdge filter](PGGraphContainsEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)highlightGroupOfHighlight
{
  void *v2;
  void *v3;

  +[PGGraphGroupContainsEdge filter](PGGraphGroupContainsEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentInHighlight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphHighlightGroupNode highlightOfHighlightGroup](PGGraphHighlightGroupNode, "highlightOfHighlightGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionalStep");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(a1, "momentInDayHighlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)highlightWithPrivateAssetsOfHighlight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphHighlightNode filter](PGGraphHighlightNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("sharingComposition");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &unk_1E84E2888);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

+ (MARelation)highlightWithSharedAssetsOfHighlight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphHighlightNode filter](PGGraphHighlightNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("sharingComposition");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &unk_1E84E28A0);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

+ (MARelation)highlightWithPrivateAndSharedAssetsOfHighlight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphHighlightNode filter](PGGraphHighlightNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("sharingComposition");
  v8[0] = &unk_1E84E28B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v5;
}

void __53__PGGraphHighlightNode_promotionScoreSortDescriptors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("promotionScore"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localStartDate"), 1, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)promotionScoreSortDescriptors_sortDescriptors;
  promotionScoreSortDescriptors_sortDescriptors = v3;

}

- (double)nonMeaningfulPromotionScoreForTripKeyAssetWithEnrichmentState:(unsigned __int16)a3 neighborScoreComputer:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  _OWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v4 = a3;
  v6 = a4;
  -[PGGraphHighlightNode eventEnrichmentMomentNodes](self, "eventEnrichmentMomentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "temporarySet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)objc_opt_class();
    if (v9)
    {
      objc_msgSend(v9, "_promotionScoreDescriptorWithMomentNodes:neighborScoreComputer:", v8, v6);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
    }
    *((_QWORD *)&v16 + 1) = -1;
    v11 = (void *)objc_opt_class();
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    v14[3] = v18;
    objc_msgSend(v11, "nonMeaningfulPromotionScoreWithPromotionScoreDescriptor:isAggregation:enrichmentState:", v14, 0, v4);
    v10 = v12;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

+ (double)promotionScoreWithHighlightNode:(id)a3 enrichmentState:(unsigned __int16)a4 numberOfExtendedAssets:(unint64_t)a5 neighborScoreComputer:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  char v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  unint64_t v28;
  _OWORD v29[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v12 = objc_msgSend(v10, "isTrip");
  +[PGGraph veryMeaningfulMeanings](PGGraph, "veryMeaningfulMeanings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = a5;
  objc_msgSend(a1, "otherVeryMeaningfulMeanings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraph lessMeaningfulMeanings](PGGraph, "lessMeaningfulMeanings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "momentNodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __133__PGGraphHighlightNode_PromotionScore__promotionScoreWithHighlightNode_enrichmentState_numberOfExtendedAssets_neighborScoreComputer___block_invoke;
  v34[3] = &unk_1E842B250;
  v44 = v12;
  v38 = &v45;
  v39 = &v65;
  v40 = &v49;
  v18 = v13;
  v35 = v18;
  v19 = v14;
  v36 = v19;
  v41 = &v61;
  v20 = v15;
  v37 = v20;
  v42 = &v57;
  v43 = &v53;
  objc_msgSend(v17, "enumerateNodesUsingBlock:", v34);

  if (*((_BYTE *)v46 + 24))
    v21 = v12;
  else
    v21 = 1;
  if (*((_BYTE *)v46 + 24))
    v22 = 1.0;
  else
    v22 = 0.2;
  if ((v21 & 1) == 0)
  {
    if (*((_BYTE *)v50 + 24))
    {
      v22 = 0.9;
      if (!*((_BYTE *)v66 + 24) && !*((_BYTE *)v62 + 24))
        v22 = dbl_1CA8ED9A0[*((_BYTE *)v58 + 24) == 0];
    }
    else if (*((_BYTE *)v54 + 24))
    {
      v22 = 0.6;
    }
    else
    {
      objc_msgSend(v10, "eventEnrichmentMomentNodes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "temporarySet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "count"))
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(a1, "_promotionScoreDescriptorWithMomentNodes:neighborScoreComputer:", v24, v11);
        *((_QWORD *)&v31 + 1) = v28;
        v25 = objc_msgSend(v10, "isAggregation");
        v29[0] = v30;
        v29[1] = v31;
        v29[2] = v32;
        v29[3] = v33;
        objc_msgSend(a1, "nonMeaningfulPromotionScoreWithPromotionScoreDescriptor:isAggregation:enrichmentState:", v29, v25, v8);
        v22 = v26;
      }
      else
      {
        v22 = 0.25;
      }

    }
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  return v22;
}

+ (id)otherVeryMeaningfulMeanings
{
  if (otherVeryMeaningfulMeanings_onceToken != -1)
    dispatch_once(&otherVeryMeaningfulMeanings_onceToken, &__block_literal_global_22309);
  return (id)otherVeryMeaningfulMeanings_meanings;
}

+ ($73EC887EE5D1BAEF06918898D778235D)_promotionScoreDescriptorWithMomentNodes:(SEL)a3 neighborScoreComputer:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  BOOL v15;
  char v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  BOOL v22;
  char v23;
  BOOL v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  int v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  char v39;
  BOOL v40;
  $73EC887EE5D1BAEF06918898D778235D *result;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  id obj;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  BOOL v55;
  BOOL v56;
  char v57;
  unint64_t v58;
  uint64_t v59;
  $73EC887EE5D1BAEF06918898D778235D *v60;
  int v61;
  uint64_t v62;
  int v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v49 = a5;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  v60 = retstr;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "meNodeCollection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v7;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (!v50)
  {
    v14 = 0;
    v15 = 0;
    v40 = 0;
    v16 = 0;
    v39 = 0;
    v37 = 0.0;
    v17 = 0.0;
    v38 = 0.0;
    v18 = 0.0;
    v36 = 0.0;
    goto LABEL_53;
  }
  v42 = v9;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v44 = 0;
  v45 = 0;
  v43 = 0;
  v58 = 0;
  v59 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v47 = *(_QWORD *)v65;
  v17 = 0.0;
  v18 = 0.0;
  do
  {
    v19 = 0;
    v51 = HIDWORD(v45);
    v63 = v45;
    v61 = v43;
    v62 = v44;
    do
    {
      if (*(_QWORD *)v65 != v47)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v19);
      objc_msgSend(v49, "neighborScoreWithMomentNode:", v20);
      v22 = v21 >= 0.6;
      v54 = v21 >= 0.43;
      if ((v59 & 1) != 0)
      {
        LOBYTE(v59) = 1;
        if (!v15)
          goto LABEL_8;
      }
      else
      {
        LOBYTE(v59) = objc_msgSend(v20, "isInteresting");
        if (!v15)
        {
LABEL_8:
          v23 = objc_msgSend(v20, "isSmartInteresting");
          goto LABEL_11;
        }
      }
      v23 = 1;
LABEL_11:
      v57 = v23;
      v55 = v22;
      v24 = v14 || objc_msgSend(v20, "numberOfAssetsWithPersons") != 0;
      v56 = v24;
      v25 = objc_msgSend(v20, "numberOfAssets");
      v26 = objc_msgSend(v20, "happensPartiallyAtWorkOfPersonNodes:", v48);
      if (v26)
        v27 = v25;
      else
        v27 = 0;
      v53 = v27;
      if (v26 | objc_msgSend(v20, "happensPartiallyAtHomeOfPersonNodes:", v48))
        v28 = v25;
      else
        v28 = 0;
      v52 = v28;
      if (!v61)
      {
        objc_msgSend(v20, "inhabitationScore");
        if (v29 < 0.1)
        {
          v61 = 0;
          goto LABEL_25;
        }
        v43 = 1;
        v60->var7 = 1;
      }
      v61 = 1;
LABEL_25:
      if (v51)
        v30 = 0;
      else
        v30 = v26;
      if (v30 == 1)
      {
        objc_msgSend(v20, "inhabitationScore");
        v31 = v58;
        if (v32 >= 0.5)
        {
          HIDWORD(v45) = 1;
          v60->var8 = 1;
          v51 = 1;
        }
        else
        {
          v51 = 0;
        }
      }
      else
      {
        v31 = v58;
      }
      if ((_DWORD)v62)
        goto LABEL_36;
      if (objc_msgSend(v20, "hasHigherThanImprovedAssets"))
      {
        LODWORD(v44) = 1;
        v60->var9 = 1;
LABEL_36:
        LODWORD(v62) = 1;
        goto LABEL_37;
      }
      LODWORD(v62) = 0;
LABEL_37:
      if (HIDWORD(v62))
        goto LABEL_40;
      if (objc_msgSend(v20, "hasAssetsWithInterestingScenes"))
      {
        HIDWORD(v44) = 1;
        v60->var10 = 1;
LABEL_40:
        HIDWORD(v62) = 1;
        goto LABEL_41;
      }
      HIDWORD(v62) = 0;
LABEL_41:
      if (v63)
        goto LABEL_44;
      if (objc_msgSend(v20, "containsBetterScoringAsset"))
      {
        LODWORD(v45) = 1;
        v60->var11 = 1;
LABEL_44:
        v63 = 1;
        goto LABEL_45;
      }
      v63 = 0;
LABEL_45:
      BYTE4(v59) |= v55;
      v16 |= v54;
      v58 = v53 + v31;
      v13 += v52;
      v12 += v25;
      v60->var12 = v12;
      objc_msgSend(v20, "contentScore");
      v17 = v33 + v17;
      v60->var14 = v17;
      v11 += objc_msgSend(v20, "numberOfShinyGemAssets");
      v60->var16 = v11;
      v10 += objc_msgSend(v20, "numberOfRegularGemAssets");
      v60->var17 = v10;
      objc_msgSend(v20, "behavioralScore");
      v18 = v18 + v34;
      ++v19;
      v14 = v56;
      v15 = v57;
    }
    while (v50 != v19);
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    v50 = v35;
  }
  while (v35);
  v36 = (double)v13;
  v37 = (double)v12;
  v38 = (double)v58;
  v9 = v42;
  v40 = v59;
  v39 = BYTE4(v59);
LABEL_53:

  v60->var14 = v17 / (double)(unint64_t)objc_msgSend(obj, "count");
  v60->var0 = v39 & 1;
  v60->var1 = v16 & 1;
  v60->var2 = v40;
  v60->var3 = v15;
  v60->var4 = v14;
  v60->var5 = v36 / v37 >= 0.5;
  v60->var6 = v38 / v37 >= 0.5;
  v60->var15 = v18 / (double)(unint64_t)objc_msgSend(obj, "count", v38 / v37);

  return result;
}

+ (double)nonMeaningfulPromotionScoreWithPromotionScoreDescriptor:(id *)a3 isAggregation:(BOOL)a4 enrichmentState:(unsigned __int16)a5
{
  _BOOL4 v5;
  double v8;
  double result;
  BOOL v10;
  __int128 v11;
  __int128 v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v5 = a4;
  if (a3->var6 && !a3->var8)
    return 0.25;
  if (a5 >= 3u)
  {
    if (a3->var5)
    {
      if (a3->var10)
        goto LABEL_21;
    }
    else
    {
      if (a3->var16 + a3->var17)
        goto LABEL_21;
      v10 = a5 == 3 || a3->var4;
      if (a3->var9)
        goto LABEL_21;
      if (!a3->var10)
        v10 = 0;
      if (v10)
        goto LABEL_21;
    }
    v8 = 0.25;
    if (a3->var13 <= 4)
      goto LABEL_28;
LABEL_21:
    v11 = *(_OWORD *)&a3->var12;
    v19 = *(_OWORD *)&a3->var0;
    v20 = v11;
    v12 = *(_OWORD *)&a3->var16;
    v21 = *(_OWORD *)&a3->var14;
    v22 = v12;
    objc_msgSend(a1, "aboveAveragePromotionScoreWithPromotionScoreDescriptor:", &v19);
    if (v13 == 0.25)
    {
      v14 = *(_OWORD *)&a3->var12;
      v19 = *(_OWORD *)&a3->var0;
      v20 = v14;
      v15 = *(_OWORD *)&a3->var16;
      v21 = *(_OWORD *)&a3->var14;
      v22 = v15;
      objc_msgSend(a1, "averagePromotionScoreWithPromotionScoreDescriptor:", &v19);
    }
    if (v13 == 0.25)
    {
      v16 = *(_OWORD *)&a3->var12;
      v19 = *(_OWORD *)&a3->var0;
      v20 = v16;
      v17 = *(_OWORD *)&a3->var16;
      v21 = *(_OWORD *)&a3->var14;
      v22 = v17;
      objc_msgSend(a1, "belowAveragePromotionScoreWithPromotionScoreDescriptor:", &v19);
    }
    v8 = 0.31;
    if (v13 != 0.25)
    {
      v8 = v13;
      if (v5)
        v8 = fmin(v13, 0.39);
    }
    goto LABEL_28;
  }
  if (a3->var9)
    goto LABEL_21;
  if (a3->var14 >= 0.4)
    goto LABEL_21;
  v8 = 0.25;
  if (a3->var15 > 0.5)
    goto LABEL_21;
LABEL_28:
  result = 0.31;
  if (!a3->var6 || v8 < 0.31)
    return v8;
  return result;
}

+ (double)aboveAveragePromotionScoreWithPromotionScoreDescriptor:(id *)a3
{
  double result;
  BOOL v4;

  if (a3->var0)
    return 0.6;
  if (a3->var7)
  {
    if (a3->var1)
    {
      return 0.55;
    }
    else
    {
      result = 0.45;
      if (!a3->var2 && !a3->var3)
      {
        v4 = a3->var14 > 0.3 && a3->var12 > 0x10;
        result = 0.43;
        if (!v4)
          return 0.25;
      }
    }
  }
  else if (a3->var16 <= 1)
  {
    result = 0.25;
    if (!a3->var5 && (a3->var2 || a3->var3))
      return 0.41;
  }
  else
  {
    return 0.42;
  }
  return result;
}

+ (double)averagePromotionScoreWithPromotionScoreDescriptor:(id *)a3
{
  double result;

  if (a3->var17 + a3->var16 > 1)
    return 0.4;
  result = 0.25;
  if (!a3->var5 && (a3->var1 || a3->var12 >= 0x11 && a3->var14 > 0.3))
    return 0.4;
  return result;
}

+ (double)belowAveragePromotionScoreWithPromotionScoreDescriptor:(id *)a3
{
  double result;

  result = 0.35;
  if (!a3->var11 && !a3->var16)
  {
    if (a3->var17)
    {
      return 0.34;
    }
    else
    {
      result = 0.25;
      if (a3->var14 > 0.5)
        return 0.33;
    }
  }
  return result;
}

uint64_t __67__PGGraphHighlightNode_PromotionScore__otherVeryMeaningfulMeanings__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)otherVeryMeaningfulMeanings_meanings;
  otherVeryMeaningfulMeanings_meanings = v0;

  objc_msgSend((id)otherVeryMeaningfulMeanings_meanings, "addIndex:", 13);
  return objc_msgSend((id)otherVeryMeaningfulMeanings_meanings, "addIndex:", 6);
}

void __133__PGGraphHighlightNode_PromotionScore__promotionScoreWithHighlightNode_enrichmentState_numberOfExtendedAssets_neighborScoreComputer___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && objc_msgSend(v5, "containsNonJunkAssets")
    && ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1, *(_BYTE *)(a1 + 104))
     || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
  {
    *a3 = 1;
  }
  else
  {
    v19 = v6;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v6, "meaningLabels", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = +[PGGraph meaningForMeaningLabel:](PGGraph, "meaningForMeaningLabel:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v12 != 16)
          {
            v13 = v12;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
            if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v12) & 1) != 0)
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
              *v18 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
              goto LABEL_20;
            }
            v14 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v13);
            v15 = a1 + 80;
            if ((v14 & 1) != 0
              || (v16 = objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v13), v15 = a1 + 88, (v16 & 1) != 0))
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 24) = 1;
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_20:

    v6 = v19;
    objc_msgSend(v19, "publicEventNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) |= objc_msgSend(v17, "count") != 0;

  }
}

@end
