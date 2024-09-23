@implementation WBSHistoryTag

- (WBSHistoryTag)init
{

  return 0;
}

- (WBSHistoryTag)initWithTitle:(id)a3 identifier:(id)a4 databaseID:(int64_t)a5 modificationTimestamp:(double)a6 level:(int64_t)a7
{
  id v12;
  id v13;
  WBSHistoryTag *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *identifier;
  WBSHistoryTag *v19;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSHistoryTag;
  v14 = -[WBSHistoryTag init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    v14->_databaseID = a5;
    v14->_modificationTimestamp = a6;
    v14->_level = a7;
    v19 = v14;
  }

  return v14;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  WBSHistoryTag *v4;
  void *v5;
  char v6;

  v4 = (WBSHistoryTag *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WBSHistoryTag identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", self->_identifier);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)modificationTimestamp
{
  return self->_modificationTimestamp;
}

- (int64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
