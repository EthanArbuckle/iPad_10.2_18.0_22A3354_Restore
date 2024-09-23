@implementation CKRecordID

- (id)fmf_withCurrentUserDefaultName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)CKRecordID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID recordName](self, "recordName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordID zoneID](self, "zoneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fmf_withCurrentUserDefaultName"));
  v7 = objc_msgSend(v3, "initWithRecordName:zoneID:", v4, v6);

  return v7;
}

@end
