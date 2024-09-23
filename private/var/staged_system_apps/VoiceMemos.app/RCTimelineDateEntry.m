@implementation RCTimelineDateEntry

- (RCTimelineDateEntry)initWithDateEntry:(id)a3 updateFidelity:(int64_t)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  RCTimelineDateEntry *v11;
  RCTimelineDateEntry *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RCTimelineDateEntry;
  v11 = -[RCTimelineDateEntry init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateEntry, a3);
    v12->_updateFidelity = a4;
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  RCTimelineDateEntry *v5;
  uint64_t v6;
  RCTimelineDateEntry *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  int64_t v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  char v17;

  v5 = (RCTimelineDateEntry *)a3;
  if (self == v5)
  {
    v17 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry dateEntry](self, "dateEntry"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry dateEntry](v7, "dateEntry"));
      v10 = objc_msgSend(v8, "isEqual:", v9);

      v11 = -[RCTimelineDateEntry updateFidelity](self, "updateFidelity");
      v12 = -[RCTimelineDateEntry updateFidelity](v7, "updateFidelity");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry userInfo](self, "userInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry userInfo](v7, "userInfo"));

      v15 = objc_msgSend(v13, "isEqual:", v14);
      if ((id)v11 == v12)
        v16 = v10;
      else
        v16 = 0;
      v17 = v16 & v15;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry dateEntry](self, "dateEntry"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = -[RCTimelineDateEntry updateFidelity](self, "updateFidelity") ^ v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry userInfo](self, "userInfo"));
  v7 = v5 ^ (unint64_t)objc_msgSend(v6, "hash");

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry dateEntry](self, "dateEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bls_shortLoggingString"));
  v5 = -[RCTimelineDateEntry updateFidelity](self, "updateFidelity");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCTimelineDateEntry userInfo](self, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("date = %@;  updateFidelity = %ld;  userInfo = %@"),
                   v4,
                   v5,
                   v6));

  return v7;
}

- (NSDate)dateEntry
{
  return self->_dateEntry;
}

- (void)setDateEntry:(id)a3
{
  objc_storeStrong((id *)&self->_dateEntry, a3);
}

- (int64_t)updateFidelity
{
  return self->_updateFidelity;
}

- (void)setUpdateFidelity:(int64_t)a3
{
  self->_updateFidelity = a3;
}

- (RCTimelineDateEntryUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dateEntry, 0);
}

@end
