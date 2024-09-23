@implementation WBSRecentWebSearchEntry

- (WBSRecentWebSearchEntry)initWithSearchString:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  WBSRecentWebSearchEntry *v8;
  uint64_t v9;
  NSString *searchString;
  NSDate *v11;
  WBSRecentWebSearchEntry *v12;
  NSDate *date;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSRecentWebSearchEntry;
  v8 = -[WBSRecentWebSearchEntry init](&v15, sel_init);
  if (v8 && objc_msgSend(v6, "length"))
  {
    v9 = objc_msgSend(v6, "copy");
    searchString = v8->_searchString;
    v8->_searchString = (NSString *)v9;

    if (v7)
    {
      v11 = (NSDate *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    date = v8->_date;
    v8->_date = v11;

    v12 = v8;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WBSRecentWebSearchEntry)initWithSearchString:(id)a3
{
  return -[WBSRecentWebSearchEntry initWithSearchString:date:](self, "initWithSearchString:date:", a3, 0);
}

- (WBSRecentWebSearchEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSRecentWebSearchEntry *v7;

  v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("SearchString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dateForKey:", CFSTR("Date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSRecentWebSearchEntry initWithSearchString:date:](self, "initWithSearchString:date:", v5, v6);

  return v7;
}

- (WBSRecentWebSearchEntry)init
{
  return -[WBSRecentWebSearchEntry initWithSearchString:date:](self, "initWithSearchString:date:", 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  WBSRecentWebSearchEntry *v4;
  int v5;
  NSString *searchString;
  void *v7;
  char v8;
  BOOL v9;

  v4 = (WBSRecentWebSearchEntry *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled");
      searchString = self->_searchString;
      if (v5)
      {
        -[WBSRecentWebSearchEntry searchString](v4, "searchString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NSString safari_isCaseInsensitiveEqualToString:](searchString, "safari_isCaseInsensitiveEqualToString:", v7);
      }
      else
      {
        -[WBSRecentWebSearchEntry searchString](v4, "searchString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NSString isEqualToString:](searchString, "isEqualToString:", v7);
      }
      v9 = v8;

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
  return -[NSString hash](self->_searchString, "hash");
}

- (id)dictionaryRepresentation
{
  NSDate *date;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("SearchString");
  v4[1] = CFSTR("Date");
  date = self->_date;
  v5[0] = self->_searchString;
  v5[1] = date;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; searchString = \"%@\"; date = %@>"),
    v5,
    self,
    self->_searchString,
    self->_date);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
