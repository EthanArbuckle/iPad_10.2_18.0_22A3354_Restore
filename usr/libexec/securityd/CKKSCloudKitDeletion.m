@implementation CKKSCloudKitDeletion

- (CKKSCloudKitDeletion)initWithRecordID:(id)a3 recordType:(id)a4
{
  id v7;
  id v8;
  CKKSCloudKitDeletion *v9;
  CKKSCloudKitDeletion *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKKSCloudKitDeletion;
  v9 = -[CKKSCloudKitDeletion init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    objc_storeStrong((id *)&v10->_recordType, a4);
  }

  return v10;
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)recordType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRecordType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
