@implementation SPOrphanedRecords

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOrphanedRecords)initWithRecordType:(id)a3 records:(id)a4
{
  id v7;
  id v8;
  SPOrphanedRecords *v9;
  SPOrphanedRecords *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPOrphanedRecords;
  v9 = -[SPOrphanedRecords init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordType, a3);
    objc_storeStrong((id *)&v10->_records, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPOrphanedRecords *v4;
  void *v5;
  void *v6;
  SPOrphanedRecords *v7;

  v4 = [SPOrphanedRecords alloc];
  -[SPOrphanedRecords recordType](self, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOrphanedRecords records](self, "records");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPOrphanedRecords initWithRecordType:records:](v4, "initWithRecordType:records:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *recordType;
  id v5;

  recordType = self->_recordType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordType, CFSTR("recordType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_records, CFSTR("records"));

}

- (SPOrphanedRecords)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *recordType;
  NSArray *v7;
  NSArray *records;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordType"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  recordType = self->_recordType;
  self->_recordType = v5;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("records"));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  records = self->_records;
  self->_records = v7;

  return self;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end
