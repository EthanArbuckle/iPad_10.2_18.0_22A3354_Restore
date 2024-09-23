@implementation PGMergeCandidateQuestion

- (PGMergeCandidateQuestion)initWithPerson:(id)a3 score:(double)a4
{
  id v7;
  PGMergeCandidateQuestion *v8;
  PGMergeCandidateQuestion *v9;
  uint64_t v10;
  NSString *entityIdentifier;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGMergeCandidateQuestion;
  v8 = -[PGMergeCandidateQuestion init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_person, a3);
    -[PHPerson uuid](v9->_person, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    entityIdentifier = v9->_entityIdentifier;
    v9->_entityIdentifier = (NSString *)v10;

    v9->_state = 0;
    v9->_score = a4;
  }

  return v9;
}

- (unsigned)type
{
  return 2;
}

- (unsigned)displayType
{
  return 2;
}

- (unsigned)entityType
{
  return 1;
}

- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", self->_person, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQuestionType:", -[PGMergeCandidateQuestion type](self, "type"));

}

- (void)remove
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", self->_person);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQuestionType:", 0);

}

- (unint64_t)hash
{
  return -[PHPerson hash](self->_person, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PGMergeCandidateQuestion isEqualToQuestion:](self, "isEqualToQuestion:", v4);

  return v5;
}

- (BOOL)isEqualToQuestion:(id)a3
{
  id v4;
  PHPerson *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") == self->_type)
  {
    objc_msgSend(v4, "person");
    v5 = (PHPerson *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == self->_person;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (unsigned)state
{
  return self->_state;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (PHPerson)person
{
  return self->_person;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
