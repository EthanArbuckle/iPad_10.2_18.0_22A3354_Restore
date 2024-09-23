@implementation PGAgeCategoryQuestion

- (PGAgeCategoryQuestion)initWithPersonUUID:(id)a3 ageCategory:(unint64_t)a4 localFactoryScore:(double)a5
{
  id v9;
  PGAgeCategoryQuestion *v10;
  PGAgeCategoryQuestion *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *additionalInfo;
  objc_super v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PGAgeCategoryQuestion;
  v10 = -[PGAgeCategoryQuestion init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_entityIdentifier, a3);
    v11->_state = 0;
    v11->_localFactoryScore = a5;
    v17 = CFSTR("ageCategory");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v11->_additionalInfo;
    v11->_additionalInfo = (NSDictionary *)v13;

  }
  return v11;
}

- (unsigned)type
{
  return 10;
}

- (unsigned)displayType
{
  return 2;
}

- (unsigned)entityType
{
  return 1;
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
