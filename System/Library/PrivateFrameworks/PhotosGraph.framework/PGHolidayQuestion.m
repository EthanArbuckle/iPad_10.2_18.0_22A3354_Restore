@implementation PGHolidayQuestion

- (PGHolidayQuestion)initWithAssetUUID:(id)a3 holidayName:(id)a4 localizedHolidayName:(id)a5 localFactoryScore:(double)a6
{
  id v11;
  id v12;
  id v13;
  PGHolidayQuestion *v14;
  PGHolidayQuestion *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSDictionary *additionalInfo;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PGHolidayQuestion;
  v14 = -[PGHolidayQuestion init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entityIdentifier, a3);
    v15->_localFactoryScore = a6;
    v15->_state = 0;
    if (v13)
      v16 = v13;
    else
      v16 = v12;
    v17 = v16;

    v22[0] = CFSTR("holidayName");
    v22[1] = CFSTR("localizedHolidayName");
    v23[0] = v12;
    v23[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v18 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v15->_additionalInfo;
    v15->_additionalInfo = (NSDictionary *)v18;

    v13 = v17;
  }

  return v15;
}

- (unsigned)type
{
  return 7;
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
