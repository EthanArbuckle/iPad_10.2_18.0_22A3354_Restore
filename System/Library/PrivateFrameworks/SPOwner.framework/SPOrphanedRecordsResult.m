@implementation SPOrphanedRecordsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOrphanedRecordsResult)initWithRecordsInfo:(id)a3
{
  id v5;
  SPOrphanedRecordsResult *v6;
  SPOrphanedRecordsResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPOrphanedRecordsResult;
  v6 = -[SPOrphanedRecordsResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recordsInfo, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPOrphanedRecordsResult *v4;
  void *v5;
  SPOrphanedRecordsResult *v6;

  v4 = [SPOrphanedRecordsResult alloc];
  -[SPOrphanedRecordsResult recordsInfo](self, "recordsInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPOrphanedRecordsResult initWithRecordsInfo:](v4, "initWithRecordsInfo:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_recordsInfo, CFSTR("recordsInfo"));
}

- (SPOrphanedRecordsResult)initWithCoder:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *recordsInfo;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("recordsInfo"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  recordsInfo = self->_recordsInfo;
  self->_recordsInfo = v5;

  return self;
}

- (NSArray)recordsInfo
{
  return self->_recordsInfo;
}

- (void)setRecordsInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsInfo, 0);
}

@end
