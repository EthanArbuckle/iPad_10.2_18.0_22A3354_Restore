@implementation PPScoredContactHandle

- (PPScoredContactHandle)initWithContactHandle:(id)a3 score:(double)a4
{
  id v7;
  PPScoredContactHandle *v8;
  PPScoredContactHandle *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPScoredContactHandle;
  v8 = -[PPScoredContactHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactHandle, a3);
    v9->_score = a4;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPScoredContactHandle c:%@ s:%f>"), self->_contactHandle, *(_QWORD *)&self->_score);
}

- (int64_t)compare:(id)a3
{
  double score;
  double v4;

  score = self->_score;
  objc_msgSend(a3, "score");
  return +[PPUtils compareDouble:withDouble:](PPUtils, "compareDouble:withDouble:", score, v4);
}

- (int64_t)reverseCompare:(id)a3
{
  double score;
  double v4;

  score = self->_score;
  objc_msgSend(a3, "score");
  return +[PPUtils reverseCompareDouble:withDouble:](PPUtils, "reverseCompareDouble:withDouble:", score, v4);
}

- (PPScoredContactHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PPScoredContactHandle *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  pp_default_log_handle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("ch"), v4, 1, CFSTR("PPErrorDomain"), 23, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sc"));
    self = -[PPScoredContactHandle initWithContactHandle:score:](self, "initWithContactHandle:score:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactHandle;
  id v5;

  contactHandle = self->_contactHandle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactHandle, CFSTR("ch"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sc"), self->_score);

}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_contactHandle, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[NSString copyWithZone:](self->_contactHandle, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithContactHandle:score:", v6, self->_score);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PPScoredContactHandle *v4;
  PPScoredContactHandle *v5;
  BOOL v6;

  v4 = (PPScoredContactHandle *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPScoredContactHandle isEqualToScoredContactHandle:](self, "isEqualToScoredContactHandle:", v5);

  return v6;
}

- (BOOL)isEqualToScoredContactHandle:(id)a3
{
  id v4;
  double *v5;
  NSString *contactHandle;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  v5 = (double *)v4;
  if (!v4)
    goto LABEL_4;
  contactHandle = self->_contactHandle;
  v7 = (NSString *)*((id *)v4 + 1);
  if (contactHandle == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = contactHandle;
  v10 = -[NSString isEqual:](v9, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v11 = self->_score == v5[2];
    goto LABEL_7;
  }
LABEL_4:
  v11 = 0;
LABEL_7:

  return v11;
}

- (NSString)contactHandle
{
  return self->_contactHandle;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactHandle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
