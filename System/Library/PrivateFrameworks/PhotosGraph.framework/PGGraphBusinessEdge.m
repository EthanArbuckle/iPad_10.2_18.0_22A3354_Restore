@implementation PGGraphBusinessEdge

- (id)initFromSourceNode:(id)a3 toBusinessNode:(id)a4 confidence:(double)a5 hasRoutineInfo:(BOOL)a6 universalStartDate:(id)a7 universalEndDate:(id)a8
{
  id v15;
  id v16;
  PGGraphBusinessEdge *v17;
  id *p_isa;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PGGraphBusinessEdge;
  v17 = -[PGGraphEdge initWithSourceNode:targetNode:](&v20, sel_initWithSourceNode_targetNode_, a3, a4);
  p_isa = (id *)&v17->super.super.super.super.isa;
  if (v17)
  {
    v17->_confidence = a5;
    v17->_hasRoutineInfo = a6;
    objc_storeStrong((id *)&v17->_universalStartDate, a7);
    objc_storeStrong(p_isa + 8, a8);
  }

  return p_isa;
}

- (PGGraphBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  PGAbstractMethodException(self, a2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v16);
}

- (PGGraphBusinessEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PGGraphBusinessEdge *v26;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("confidence"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = v17;
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v17);
    *(float *)&v20 = a7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("confidence"));

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("utcs"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("utcs"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("universalStartDate"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("utcs"));
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("utce"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("utce"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("universalEndDate"));

      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, CFSTR("utce"));
    }

  }
  v26 = -[PGGraphBusinessEdge initWithLabel:sourceNode:targetNode:domain:properties:](self, "initWithLabel:sourceNode:targetNode:domain:properties:", v14, v15, v16, v10, v19);

  return v26;
}

- (void)checkConsistencyOfProperties:(id)a3 withExtraPropertyKeys:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGGraphBusinessEdge;
  -[PGGraphOptimizedEdge checkConsistencyOfProperties:withExtraPropertyKeys:](&v4, sel_checkConsistencyOfProperties_withExtraPropertyKeys_, a3, a4);
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      if (v8 != self->_confidence)
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routine"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (self->_hasRoutineInfo != objc_msgSend(v9, "BOOLValue"))
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("universalStartDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v12 = v11;
      -[NSDate timeIntervalSince1970](self->_universalStartDate, "timeIntervalSince1970");
      if (v12 != v13)
        goto LABEL_11;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("universalEndDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (!v14
      || (objc_msgSend(v14, "doubleValue"),
          v16 = v15,
          -[NSDate timeIntervalSince1970](self->_universalEndDate, "timeIntervalSince1970"),
          v16 == v17))
    {
      v18 = 1;
    }
    else
    {
LABEL_11:
      v18 = 0;
    }

  }
  else
  {
    v18 = 1;
  }

  return v18;
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
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("confidence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("routine");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasRoutineInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("universalStartDate");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_universalStartDate, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("universalEndDate");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_universalEndDate, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)edgeDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBusinessEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v9, sel_edgeDescription);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_hasRoutineInfo)
    v6 = CFSTR("Has Routine Info, ");
  else
    v6 = &stru_1E8436F28;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@%@ - %@)"), v4, v6, self->_universalStartDate, self->_universalEndDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasRoutineInfo
{
  return self->_hasRoutineInfo;
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
}

@end
