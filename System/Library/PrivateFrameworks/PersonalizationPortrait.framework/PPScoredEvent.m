@implementation PPScoredEvent

- (PPScoredEvent)initWithStartDate:(id)a3 endDate:(id)a4 title:(id)a5 score:(double)a6
{
  id v11;
  id v12;
  id v13;
  PPScoredEvent *v14;
  PPScoredEvent *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PPScoredEvent;
  v14 = -[PPScoredEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_startDate, a3);
    objc_storeStrong((id *)&v15->_endDate, a4);
    objc_storeStrong((id *)&v15->_title, a5);
    v15->_score = a6;
  }

  return v15;
}

- (PPScoredEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  PPScoredEvent *v13;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sdt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("edt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ttl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sco"));
  v11 = v10;

  if (v7)
    v12 = v8 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    self = -[PPScoredEvent initWithStartDate:endDate:title:score:](self, "initWithStartDate:endDate:title:score:", v7, v8, v9, v11);
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("sdt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("edt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("ttl"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sco"), self->_score);

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ t:'%@' start:'%@' end:'%@' s:'%f'"), v5, self->_title, self->_startDate, self->_endDate, *(_QWORD *)&self->_score);

  return v6;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
