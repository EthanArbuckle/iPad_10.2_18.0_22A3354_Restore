@implementation WBSHistoryVisitsInTimeRangePredicate

- (WBSHistoryVisitsInTimeRangePredicate)initWithStartDate:(id)a3 endDate:(id)a4 urlString:(id)a5 urlHash:(id)a6 urlSalt:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WBSHistoryVisitsInTimeRangePredicate *v17;
  double v18;
  double v19;
  uint64_t v20;
  NSString *urlString;
  uint64_t v22;
  NSData *urlHash;
  uint64_t v24;
  NSData *urlSalt;
  WBSHistoryVisitsInTimeRangePredicate *v26;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)WBSHistoryVisitsInTimeRangePredicate;
  v17 = -[WBSHistoryVisitsInTimeRangePredicate init](&v28, sel_init);
  if (v17)
  {
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v17->_startTime = v18;
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v17->_endTime = v19;
    v20 = objc_msgSend(v14, "copy");
    urlString = v17->_urlString;
    v17->_urlString = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    urlHash = v17->_urlHash;
    v17->_urlHash = (NSData *)v22;

    v24 = objc_msgSend(v16, "copy");
    urlSalt = v17->_urlSalt;
    v17->_urlSalt = (NSData *)v24;

    v26 = v17;
  }

  return v17;
}

- (WBSHistoryVisitsInTimeRangePredicate)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryVisitsInTimeRangePredicate *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSString *urlString;
  uint64_t v10;
  NSData *urlHash;
  uint64_t v12;
  NSData *urlSalt;
  WBSHistoryVisitsInTimeRangePredicate *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSHistoryVisitsInTimeRangePredicate;
  v5 = -[WBSHistoryVisitsInTimeRangePredicate init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_startTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endTime"));
    v5->_endTime = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    urlHash = v5->_urlHash;
    v5->_urlHash = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urlSalt"));
    v12 = objc_claimAutoreleasedReturnValue();
    urlSalt = v5->_urlSalt;
    v5->_urlSalt = (NSData *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("startTime"), self->_startTime);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("endTime"), self->_endTime);
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, CFSTR("url"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlHash, CFSTR("urlHash"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlSalt, CFSTR("urlSalt"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  double *p_startTime;
  double *p_endTime;
  id v15;

  v8 = a4;
  v9 = v8;
  if (self->_urlString)
  {
    v10 = CFSTR("SELECT history_visits.* FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item WHERE visit_time > ? AND visit_time < ? AND history_items.url = ?");
  }
  else if (self->_urlHash)
  {
    v10 = CFSTR("SELECT history_visits.* FROM history_visits WHERE visit_time > ? AND visit_time < ? AND history_item IN (SELECT id from history_items WHERE safari_sha512(url, ?) = ?)");
  }
  else
  {
    v10 = CFSTR("SELECT history_visits.* FROM history_visits where visit_time > ? AND visit_time < ?");
  }
  objc_msgSend(v8, "statementForQuery:error:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (self->_urlString)
    {
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,double &,double &,NSString * {__strong}&>(v11, &self->_startTime, &self->_endTime, &self->_urlString);
    }
    else
    {
      p_startTime = &self->_startTime;
      p_endTime = &self->_endTime;
      if (self->_urlHash)
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,double &,double &,NSData * {__strong}&,NSData * {__strong}&>(v11, p_startTime, p_endTime, &self->_urlSalt, &self->_urlHash);
      else
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,double &,double &>(v11, p_startTime, p_endTime);
    }
    v15 = v12;
  }

  return v12;
}

- (BOOL)evaluateVisit:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  char v8;
  NSData *urlSalt;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "visitTime");
  if (self->_startTime >= v5 || v5 >= self->_endTime)
  {
    v8 = 0;
  }
  else
  {
    if (self->_urlString)
    {
      objc_msgSend(v4, "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "urlString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", self->_urlString);
    }
    else
    {
      if (!self->_urlHash)
      {
        v8 = 1;
        goto LABEL_9;
      }
      urlSalt = self->_urlSalt;
      objc_msgSend(v4, "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "urlString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WBSHistorySHA512(urlSalt, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToData:", self->_urlHash);

    }
  }
LABEL_9:

  return v8;
}

- (BOOL)evaluateServiceVisit:(id)a3
{
  double v4;

  objc_msgSend(a3, "visitTime");
  return self->_startTime < v4 && v4 < self->_endTime;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_urlString)
  {
    v5 = CFSTR("url");
  }
  else if (self->_urlHash)
  {
    v5 = CFSTR("hash");
  }
  else
  {
    v5 = CFSTR("range");
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; startTime = %f; endTime = %f; mode = %@>"),
                       v4,
                       self,
                       *(_QWORD *)&self->_startTime,
                       *(_QWORD *)&self->_endTime,
                       v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSalt, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
