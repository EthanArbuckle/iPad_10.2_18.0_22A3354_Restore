@implementation PGPersonActivityMeaningQuestion

- (PGPersonActivityMeaningQuestion)initWithMeaningLabel:(id)a3 assetUUID:(id)a4 localFactoryScore:(double)a5
{
  id v8;
  id v9;
  PGPersonActivityMeaningQuestion *v10;
  PGPersonActivityMeaningQuestion *v11;
  uint64_t v12;
  NSDictionary *additionalInfo;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGPersonActivityMeaningQuestion;
  v10 = -[PGPersonActivityMeaningQuestion init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_entityIdentifier, a4);
    v11->_state = 0;
    v11->_localFactoryScore = a5;
    v16 = CFSTR("personActivityMeaningLabel");
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v11->_additionalInfo;
    v11->_additionalInfo = (NSDictionary *)v12;

  }
  return v11;
}

- (unsigned)type
{
  return 19;
}

- (unsigned)displayType
{
  return 0;
}

- (unsigned)entityType
{
  return 0;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
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
