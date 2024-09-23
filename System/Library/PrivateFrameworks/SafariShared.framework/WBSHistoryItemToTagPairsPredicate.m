@implementation WBSHistoryItemToTagPairsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryItemToTagPairsPredicate)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  WBSHistoryItemToTagPairsPredicate *v9;
  WBSHistoryItemToTagPairsPredicate *v10;
  WBSHistoryItemToTagPairsPredicate *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryItemToTagPairsPredicate;
  v9 = -[WBSHistoryItemToTagPairsPredicate init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSHistoryItemToTagPairsPredicate)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryItemToTagPairsPredicate *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  WBSHistoryItemToTagPairsPredicate *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryItemToTagPairsPredicate;
  v5 = -[WBSHistoryItemToTagPairsPredicate init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));

}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", v8, CFSTR("SELECT * FROM history_items_to_tags WHERE timestamp > ? AND timestamp < ?"));
  -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindDouble:atParameterIndex:", 1);
  -[NSDate timeIntervalSinceReferenceDate](self->_endDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "bindDouble:atParameterIndex:", 2);
  if (!a6 || v9)
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v8, "lastErrorWithMethodName:", "-[WBSHistoryItemToTagPairsPredicate statementForDatabase:cache:fetchOptions:error:]");
    v10 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
