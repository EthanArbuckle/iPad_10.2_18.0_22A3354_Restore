@implementation WBSHistoryServiceObject

- (WBSHistoryServiceObject)initWithDatabaseID:(int64_t)a3
{
  WBSHistoryServiceObject *v4;
  WBSHistoryServiceObject *v5;
  WBSHistoryServiceObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSHistoryServiceObject;
  v4 = -[WBSHistoryServiceObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_databaseID = a3;
    v6 = v4;
  }

  return v5;
}

- (WBSHistoryServiceObject)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryServiceObject *v5;
  WBSHistoryServiceObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WBSHistoryServiceObject;
  v5 = -[WBSHistoryServiceObject init](&v8, sel_init);
  if (v5)
  {
    v5->_databaseID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("databaseID"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_databaseID, CFSTR("databaseID"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

@end
