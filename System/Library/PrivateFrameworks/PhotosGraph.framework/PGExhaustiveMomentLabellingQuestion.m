@implementation PGExhaustiveMomentLabellingQuestion

- (PGExhaustiveMomentLabellingQuestion)initWithMomentUUID:(id)a3 localFactoryScore:(double)a4 meaningLabels:(id)a5
{
  id v9;
  id v10;
  PGExhaustiveMomentLabellingQuestion *v11;
  PGExhaustiveMomentLabellingQuestion *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *additionalInfo;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PGExhaustiveMomentLabellingQuestion;
  v11 = -[PGExhaustiveMomentLabellingQuestion init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    v12->_state = 0;
    v12->_localFactoryScore = a4;
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = *MEMORY[0x1E0D77FF8];
      v20[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v15 = objc_claimAutoreleasedReturnValue();
      additionalInfo = v12->_additionalInfo;
      v12->_additionalInfo = (NSDictionary *)v15;

    }
  }

  return v12;
}

- (unsigned)type
{
  return 25;
}

- (unsigned)displayType
{
  return 1;
}

- (unsigned)entityType
{
  return 7;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

@end
