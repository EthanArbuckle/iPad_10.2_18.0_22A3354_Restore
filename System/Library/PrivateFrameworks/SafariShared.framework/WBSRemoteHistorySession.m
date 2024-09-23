@implementation WBSRemoteHistorySession

- (WBSRemoteHistorySession)init
{

  return 0;
}

- (WBSRemoteHistorySession)initWithStartDate:(id)a3 endDate:(id)a4 items:(id)a5
{
  id v9;
  id v10;
  id v11;
  WBSRemoteHistorySession *v12;
  WBSRemoteHistorySession *v13;
  uint64_t v14;
  NSArray *items;
  WBSRemoteHistorySession *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSRemoteHistorySession;
  v12 = -[WBSRemoteHistorySession init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    v14 = objc_msgSend(v11, "copy");
    items = v13->_items;
    v13->_items = (NSArray *)v14;

    v16 = v13;
  }

  return v13;
}

- (BOOL)isCurrentSession
{
  NSDate *startDate;
  void *v3;
  void *v4;

  startDate = self->_startDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_startOfDay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(startDate) = -[NSDate isEqualToDate:](startDate, "isEqualToDate:", v4);

  return (char)startDate;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; startDate = %@; endDate = %@; items = %ld items>"),
    v5,
    self,
    self->_startDate,
    self->_endDate,
    -[NSArray count](self->_items, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  WBSRemoteHistorySession *v4;
  NSDate *startDate;
  void *v6;
  NSDate *endDate;
  void *v8;
  char v9;

  v4 = (WBSRemoteHistorySession *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      startDate = self->_startDate;
      -[WBSRemoteHistorySession startDate](v4, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDate isEqualToDate:](startDate, "isEqualToDate:", v6))
      {
        endDate = self->_endDate;
        -[WBSRemoteHistorySession endDate](v4, "endDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[NSDate isEqualToDate:](endDate, "isEqualToDate:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_startDate, "hash");
  return -[NSDate hash](self->_endDate, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSRemoteHistorySession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSRemoteHistorySession *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("items"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WBSRemoteHistorySession initWithStartDate:endDate:items:](self, "initWithStartDate:endDate:items:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_items, CFSTR("items"));

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
