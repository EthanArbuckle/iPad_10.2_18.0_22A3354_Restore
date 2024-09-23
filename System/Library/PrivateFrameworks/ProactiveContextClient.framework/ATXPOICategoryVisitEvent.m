@implementation ATXPOICategoryVisitEvent

- (ATXPOICategoryVisitEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5 hasExited:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  ATXPOICategoryVisitEvent *v14;
  ATXPOICategoryVisitEvent *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXPOICategoryVisitEvent;
  v14 = -[ATXPOICategoryVisitEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_startDate, a4);
    objc_storeStrong((id *)&v15->_endDate, a5);
    objc_storeStrong((id *)&v15->_possibleCategoryNames, a3);
    v15->_hasExited = a6;
  }

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPOICategoryVisitEvent possibleCategoryNames](self, "possibleCategoryNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPOICategoryVisitEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPOICategoryVisitEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ATXPOICategoryVisitEvent categories: %@, startDate: %@, endDate: %@ hasExited: %d"), v4, v5, v6, -[ATXPOICategoryVisitEvent hasExited](self, "hasExited"));

  return v7;
}

- (id)identifier
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;

  -[ATXPOICategoryVisitEvent possibleCategoryNames](self, "possibleCategoryNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[ATXPOICategoryVisitEvent possibleCategoryNames](self, "possibleCategoryNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v7);

  }
  else
  {
    v8 = CFSTR("unknown");
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ATXPOICategoryVisitEvent *v4;
  ATXPOICategoryVisitEvent *v5;
  BOOL v6;

  v4 = (ATXPOICategoryVisitEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPOICategoryVisitEvent isEqualToATXPOICategoryVisitEvent:](self, "isEqualToATXPOICategoryVisitEvent:", v5);

  return v6;
}

- (BOOL)isEqualToATXPOICategoryVisitEvent:(id)a3
{
  id *v4;
  NSOrderedSet *possibleCategoryNames;
  NSOrderedSet *v6;
  NSOrderedSet *v7;
  NSOrderedSet *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (id *)a3;
  possibleCategoryNames = self->_possibleCategoryNames;
  v6 = (NSOrderedSet *)v4[4];
  if (possibleCategoryNames == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = possibleCategoryNames;
    v9 = -[NSOrderedSet isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  -[ATXPOICategoryVisitEvent startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToDate:", v12))
  {
    -[ATXPOICategoryVisitEvent endDate](self, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "isEqualToDate:", v14);

  }
  else
  {
    v10 = 0;
  }

LABEL_9:
  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSOrderedSet)possibleCategoryNames
{
  return self->_possibleCategoryNames;
}

- (BOOL)hasExited
{
  return self->_hasExited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleCategoryNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
