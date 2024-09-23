@implementation STUSignInHistoryRecord

- (STUSignInHistoryRecord)initWithOwner:(id)a3
{
  id v5;
  STUSignInHistoryRecord *v6;
  STUSignInHistoryRecord *v7;
  NSArray *items;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STUSignInHistoryRecord;
  v6 = -[STUSignInHistoryRecord init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    items = v6->_items;
    v6->_items = (NSArray *)&__NSArray0__struct;

    objc_storeStrong((id *)&v7->_ownerAppleID, a3);
    v7->_historyVersion = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryRecord dictionaryValue](self, "dictionaryValue"));
  v6 = objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (STUSignInHistoryRecord)initWithDictionary:(id)a3
{
  id v4;
  STUSignInHistoryRecord *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString *v10;
  NSObject *ownerAppleID;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSArray *items;
  id v31;
  NSObject *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STUSignInHistoryRecord;
  v5 = -[STUSignInHistoryRecord init](&v34, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ownerAppleID")));
    v7 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      v10 = (NSString *)v9;
      ownerAppleID = v5->_ownerAppleID;
      v5->_ownerAppleID = v10;
    }
    else
    {
      v12 = sub_100075F50();
      ownerAppleID = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(ownerAppleID, OS_LOG_TYPE_ERROR))
        sub_10007E4EC();
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("truncated")));
    v14 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      v5->_truncated = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v17 = sub_100075F50();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10007E4C0();

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("historyVersion")));
    v20 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      v21 = v19;
    else
      v21 = 0;
    v22 = v21;

    if (v22)
    {
      v5->_historyVersion = (unint64_t)objc_msgSend(v22, "unsignedIntegerValue");
    }
    else
    {
      v23 = sub_100075F50();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10007E494();

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("items")));
    v26 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
      v27 = v25;
    else
      v27 = 0;
    v28 = v27;

    if (v28)
    {
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "crk_mapUsingBlock:", &stru_1000CBE88));
      items = v5->_items;
      v5->_items = (NSArray *)v29;
    }
    else
    {
      v31 = sub_100075F50();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10007E468();

      items = v5->_items;
      v5->_items = (NSArray *)&__NSArray0__struct;
    }

  }
  return v5;
}

- (id)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[3];
  _QWORD v14[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryRecord items](self, "items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crk_mapUsingBlock:", &stru_1000CBEC8));

  v14[0] = v4;
  v13[0] = CFSTR("items");
  v13[1] = CFSTR("truncated");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUSignInHistoryRecord isTruncated](self, "isTruncated")));
  v14[1] = v5;
  v13[2] = CFSTR("historyVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUSignInHistoryRecord historyVersion](self, "historyVersion")));
  v14[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryRecord ownerAppleID](self, "ownerAppleID"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUSignInHistoryRecord ownerAppleID](self, "ownerAppleID"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("ownerAppleID"));

  }
  v11 = objc_msgSend(v8, "copy");

  return v11;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isTruncated
{
  return self->_truncated;
}

- (void)setTruncated:(BOOL)a3
{
  self->_truncated = a3;
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)historyVersion
{
  return self->_historyVersion;
}

- (void)setHistoryVersion:(unint64_t)a3
{
  self->_historyVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerAppleID, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
