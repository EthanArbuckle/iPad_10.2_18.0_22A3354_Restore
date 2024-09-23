@implementation WFCloudKitItemRecord

- (WFCloudKitItemRecord)initWithRecord:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  WFCloudKitItemRecord *v9;
  WFCloudKitItemRecord *v10;
  WFCloudKitItemRecord *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFCloudKitItemRecord;
  v9 = -[WFCloudKitItemRecord init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_item, a4);
    v11 = v10;
  }

  return v10;
}

- (CKRecord)record
{
  return self->_record;
}

- (WFCloudKitItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
