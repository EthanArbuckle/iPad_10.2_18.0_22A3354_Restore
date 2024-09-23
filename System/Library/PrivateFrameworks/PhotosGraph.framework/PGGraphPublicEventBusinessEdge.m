@implementation PGGraphPublicEventBusinessEdge

- (id)initFromPublicEventNode:(id)a3 toBusinessNode:(id)a4 confidence:(double)a5 hasRoutineInfo:(BOOL)a6 universalStartDate:(id)a7 universalEndDate:(id)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGGraphPublicEventBusinessEdge;
  return -[PGGraphBusinessEdge initFromSourceNode:toBusinessNode:confidence:hasRoutineInfo:universalStartDate:universalEndDate:](&v9, sel_initFromSourceNode_toBusinessNode_confidence_hasRoutineInfo_universalStartDate_universalEndDate_, a3, a4, a6, a7, a8, a5);
}

- (PGGraphPublicEventBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  PGGraphPublicEventBusinessEdge *v24;

  v10 = a4;
  v11 = a5;
  v12 = a7;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("confidence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("routine"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("universalStartDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v18, "doubleValue");
    v20 = (void *)objc_msgSend(v19, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("universalEndDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v21, "doubleValue");
    v23 = (void *)objc_msgSend(v22, "initWithTimeIntervalSince1970:");
  }
  else
  {
    v23 = 0;
  }
  v24 = -[PGGraphPublicEventBusinessEdge initFromPublicEventNode:toBusinessNode:confidence:hasRoutineInfo:universalStartDate:universalEndDate:](self, "initFromPublicEventNode:toBusinessNode:confidence:hasRoutineInfo:universalStartDate:universalEndDate:", v10, v11, v17, v20, v23, v15);

  return v24;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PUBLIC_EVENT_BUSINESS");
  return CFSTR("PUBLIC_EVENT_BUSINESS");
}

- (unsigned)domain
{
  return 900;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PUBLIC_EVENT_BUSINESS"), 900);
}

@end
