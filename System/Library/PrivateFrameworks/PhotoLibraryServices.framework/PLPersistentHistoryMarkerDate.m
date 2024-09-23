@implementation PLPersistentHistoryMarkerDate

- (PLPersistentHistoryMarkerDate)initWithDate:(id)a3
{
  id v4;
  PLPersistentHistoryMarkerDate *v5;
  uint64_t v6;
  NSDate *date;
  PLPersistentHistoryMarkerDate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistentHistoryMarkerDate;
  v5 = -[PLPersistentHistoryMarkerDate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)overrride_changeRequestForFetching
{
  return (id)objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterDate:", self->_date);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLPersistentHistoryMarkerDate(%@)"), self->_date);
}

- (id)overrride_shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".Date(%@)"), self->_date);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
