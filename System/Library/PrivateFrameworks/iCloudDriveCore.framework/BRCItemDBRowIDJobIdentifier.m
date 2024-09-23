@implementation BRCItemDBRowIDJobIdentifier

- (BRCItemDBRowIDJobIdentifier)initWithItemDBRowID:(int64_t)a3
{
  BRCItemDBRowIDJobIdentifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCItemDBRowIDJobIdentifier;
  result = -[BRCItemDBRowIDJobIdentifier init](&v5, sel_init);
  if (result)
    result->_itemDBRowID = a3;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), self->_itemDBRowID);
}

- (id)matchingJobsWhereSQLClause
{
  return (id)objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("throttle_id = %lld"), self->_itemDBRowID);
}

- (id)columns
{
  return (id)objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "throttle_id", 11);
}

- (id)columnsValues
{
  return (id)objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("%lld"), self->_itemDBRowID);
}

- (unint64_t)hash
{
  return self->_itemDBRowID;
}

- (BOOL)isEqualToItemDBRowIDIdentifier:(id)a3
{
  return a3 && self->_itemDBRowID == *((_QWORD *)a3 + 1);
}

- (BOOL)isEqual:(id)a3
{
  BRCItemDBRowIDJobIdentifier *v4;
  BOOL v5;

  v4 = (BRCItemDBRowIDJobIdentifier *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRCItemDBRowIDJobIdentifier isEqualToItemDBRowIDIdentifier:](self, "isEqualToItemDBRowIDIdentifier:", v4);
  }

  return v5;
}

- (int64_t)itemDBRowID
{
  return self->_itemDBRowID;
}

@end
