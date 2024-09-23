@implementation PGSurveyQuestion

- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = (void *)MEMORY[0x1E0CD1728];
  -[PGSurveyQuestion entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGSurveyQuestion type](self, "type");
  v9 = -[PGSurveyQuestion state](self, "state");
  v10 = -[PGSurveyQuestion entityType](self, "entityType");
  v11 = -[PGSurveyQuestion displayType](self, "displayType");
  -[PGSurveyQuestion score](self, "score");
  v13 = v12;
  -[PGSurveyQuestion additionalInfo](self, "additionalInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v16) = a4;
  v15 = (id)objc_msgSend(v6, "creationRequestForQuestionWithEntityIdentifier:type:state:entityType:displayType:score:additionalInfo:creationDate:questionVersion:", v7, v8, v9, v10, v11, v14, v13, v17, v16);

}

- (unsigned)type
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (unsigned)displayType
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (unsigned)entityType
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithName:reason:userInfo:", v4, v9, 0);

  objc_exception_throw(objc_retainAutorelease(v10));
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v5 = a3;
  objc_msgSend(v5, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestion entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = objc_msgSend(v5, "entityType");
    if (v8 == -[PGSurveyQuestion entityType](self, "entityType"))
    {
      v9 = objc_msgSend(v5, "type");
      if (v9 == -[PGSurveyQuestion type](self, "type"))
      {
        objc_msgSend(v5, "additionalInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        if (v11
          || (-[PGSurveyQuestion additionalInfo](self, "additionalInfo"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "count")))
        {
          objc_msgSend(v5, "additionalInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PGSurveyQuestion _additionalInfosAreEqualForOtherQuestionAdditionalInfo:](self, "_additionalInfosAreEqualForOtherQuestionAdditionalInfo:", v12);

          if (v11)
          {
LABEL_12:

            goto LABEL_9;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)_additionalInfosAreEqualForOtherQuestionAdditionalInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[PGSurveyQuestion type](self, "type");
  -[PGSurveyQuestion additionalInfo](self, "additionalInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestion _additionalInfoWithAnswerReasonRemovedForQuestionType:additionalInfo:](self, "_additionalInfoWithAnswerReasonRemovedForQuestionType:additionalInfo:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGSurveyQuestion _additionalInfoWithAnswerReasonRemovedForQuestionType:additionalInfo:](self, "_additionalInfoWithAnswerReasonRemovedForQuestionType:additionalInfo:", -[PGSurveyQuestion type](self, "type"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqualToDictionary:", v8);
  return (char)v4;
}

- (id)_additionalInfoWithAnswerReasonRemovedForQuestionType:(unsigned __int16)a3 additionalInfo:(id)a4
{
  int v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    v11 = *MEMORY[0x1E0D77FD0];
    v20 = *MEMORY[0x1E0D78000];
    v18 = *MEMORY[0x1E0D77FF8];
    v19 = *MEMORY[0x1E0D78010];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToString:", v11) & 1) == 0)
        {
          if (v4 != 25)
          {
            if (v4 == 14)
            {
              v14 = v13;
              v15 = v19;
LABEL_12:
              if ((objc_msgSend(v14, "isEqualToString:", v15) & 1) != 0)
                continue;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v13);

            continue;
          }
          if ((objc_msgSend(v13, "isEqualToString:", v20) & 1) != 0)
            continue;
          v14 = v13;
          v15 = v18;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEquivalentToQuestion:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a3;
  objc_msgSend(v5, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSurveyQuestion entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    v8 = objc_msgSend(v5, "entityType");
    if (v8 == -[PGSurveyQuestion entityType](self, "entityType"))
    {
      v9 = objc_msgSend(v5, "type");
      if (v9 == -[PGSurveyQuestion type](self, "type"))
      {
        objc_msgSend(v5, "additionalInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        if (v11
          || (-[PGSurveyQuestion additionalInfo](self, "additionalInfo"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "count")))
        {
          objc_msgSend(v5, "additionalInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGSurveyQuestion additionalInfo](self, "additionalInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToDictionary:", v13);

          if (v11)
          {
LABEL_12:

            goto LABEL_9;
          }
        }
        else
        {
          v14 = 1;
        }

        goto LABEL_12;
      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PGSurveyQuestion entityIdentifier](self, "entityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PGSurveyQuestion *v4;
  BOOL v5;

  v4 = (PGSurveyQuestion *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PGSurveyQuestion isEquivalentToQuestion:](self, "isEquivalentToQuestion:", v4);
  }

  return v5;
}

- (NSDictionary)additionalInfo
{
  return self->additionalInfo;
}

- (NSString)entityIdentifier
{
  return self->entityIdentifier;
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

- (unsigned)state
{
  return self->state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->entityIdentifier, 0);
  objc_storeStrong((id *)&self->additionalInfo, 0);
}

@end
