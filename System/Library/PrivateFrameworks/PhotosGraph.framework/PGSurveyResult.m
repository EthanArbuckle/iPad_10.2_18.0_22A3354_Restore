@implementation PGSurveyResult

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  return 0;
}

- (BOOL)isEquivalentToSurveyResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyResult entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGSurveyResult entityType](self, "entityType"))
    && (v8 = objc_msgSend(v4, "type"), v8 == -[PGSurveyResult type](self, "type"))
    && (v9 = objc_msgSend(v4, "state"), v9 == -[PGSurveyResult state](self, "state")))
  {
    objc_msgSend(v4, "additionalInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSurveyResult additionalInfo](self, "additionalInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToDictionary:", v11);

  }
  else
  {
    v12 = 0;
  }

  -[PGSurveyResult momentIdentifier](self, "momentIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend(v4, "momentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSurveyResult momentIdentifier](self, "momentIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 &= objc_msgSend(v15, "isEqualToString:", v16);

  }
  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PGSurveyResult entityIdentifier](self, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PGSurveyResult *v4;
  BOOL v5;

  v4 = (PGSurveyResult *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PGSurveyResult isEquivalentToSurveyResult:](self, "isEquivalentToSurveyResult:", v4);
  }

  return v5;
}

- (NSString)entityIdentifier
{
  return self->entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)momentIdentifier
{
  return self->momentIdentifier;
}

- (void)setMomentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)type
{
  return self->type;
}

- (void)setType:(unsigned __int16)a3
{
  self->type = a3;
}

- (unsigned)state
{
  return self->state;
}

- (void)setState:(unsigned __int16)a3
{
  self->state = a3;
}

- (unsigned)entityType
{
  return self->entityType;
}

- (void)setEntityType:(unsigned __int16)a3
{
  self->entityType = a3;
}

- (NSDictionary)additionalInfo
{
  return self->additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)displayType
{
  return self->displayType;
}

- (void)setDisplayType:(unsigned __int16)a3
{
  self->displayType = a3;
}

- (double)localFactoryScore
{
  return self->localFactoryScore;
}

- (double)score
{
  return self->score;
}

- (void)setScore:(double)a3
{
  self->score = a3;
}

- (NSDate)creationDate
{
  return self->creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->creationDate, a3);
}

- (signed)questionVersion
{
  return self->questionVersion;
}

- (void)setQuestionVersion:(signed __int16)a3
{
  self->questionVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->creationDate, 0);
  objc_storeStrong((id *)&self->additionalInfo, 0);
  objc_storeStrong((id *)&self->momentIdentifier, 0);
  objc_storeStrong((id *)&self->entityIdentifier, 0);
}

@end
